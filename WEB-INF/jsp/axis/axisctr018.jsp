<%/* Revision:# p8yQY/ZvPwtHJVhB5phXyw== # */%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%--
  Fichero: axisctr018.jsp
  @author <a href = "mailto:echristen@csi-ti.com">Elmar Christen</a>

  Fecha: 20/12/2007
--%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
    <head>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
         <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)"> .wrapper{width: 100%;height: 230px;overflow: auto;} </style>
        <%-- FI Especial per controlar els scroll amb iPad --%>
        <c:import url="../include/carga_framework_js.jsp" />

        <script type="text/javascript">
            var TOBSERVA_XXX="TOBSERVA_0_0";
            var ceditArray=new Array();
            <c:forEach items="${sessionScope.axisctr017_lista}" var="item" varStatus="status">
            ceditArray[${status.count-1}]="${item.OB_IAX_POLIZASRETEN.SSEGURO}_${item.OB_IAX_POLIZASRETEN.CEDIT}";</c:forEach>

            //Método que se encarga de comprobar que polizas se pueden editar segun ceditArray
            function f_but_editar_visibility() {
                for (counter = 0; counter < ceditArray.length; counter++) {
                    var tempSSEGURO=ceditArray[counter].substring(0, ceditArray[counter].indexOf("_"))
                    var tempCEDIT=ceditArray[counter].substring(ceditArray[counter].indexOf("_")+1)
                    if (tempSSEGURO==document.miForm.SSEGURO.value) {

                      document.miForm.CEDIT.value =tempCEDIT;
                        if (tempCEDIT=='1') objDom.setVisibilidadPorId("but_editar", "visible");
                        else objDom.setVisibilidadPorId("but_editar", "hidden");
                        break;
                    }
                }
            }

            function f_but_aceptar2(nmovimi,nriesgo) {
                objDom.setValorComponente(document.miForm.NMOVIMI, nmovimi);
                objDom.setValorComponente(document.miForm.NRIESGO, nriesgo);
                toggleTOBSERVA("TOBSERVA_"+nmovimi+"_"+nriesgo);

                for (counter = 0; counter < document.miForm.checked_mot.length; counter++) {
                    var tempVal = objDom.getValorComponente(document.miForm.checked_mot[counter]);
                    if (objUtiles.utilEquals(tempVal, (objDom.getValorComponente(document.miForm.NMOVIMI) +"_"+ objDom.getValorComponente(document.miForm.NRIESGO)))) {
                        objDom.setComponenteMarcado(document.miForm.checked_mot[counter], true);
                        break;
                    }
                }
            }


            function toggleTOBSERVA(x) {
                if (TOBSERVA_XXX.length>0) {
                    var oTOBSERVA_XXX=document.getElementById(TOBSERVA_XXX);
                    if (oTOBSERVA_XXX!=undefined) {
                        oTOBSERVA_XXX.style.visibility="hidden";
                        oTOBSERVA_XXX.style.display="none";
                    }
                }
                var oTOBSERVA_X=document.getElementById(x);
                if (oTOBSERVA_XXX!=undefined) {
                    oTOBSERVA_X.style.visibility="visible";
                    oTOBSERVA_X.style.display="block";
                }
                TOBSERVA_XXX=x;
            }


            function f_abrir_axisctr022(sseguro,nmovimi,nriesgo) {
                objUtiles.abrirModal("axisctr022", "src", "modal_axisctr022.do?dt=<%=new java.util.Date().getTime()%>&operation=init&SSEGURO="+sseguro+"&NMOVIMI="+nmovimi+"&NRIESGO="+nriesgo);
            }


            function f_abrir_axisimprimir(sseguro) {
                if (objUtiles.hayValorElementoXml(document.getElementsByTagName("TINFO")[0])){
                    var mensaje = objDom.getValorNodoDelComponente(document.getElementsByTagName("TINFO"), 0, 0);
                }else{
                    var mensaje="";
                }
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_doc_tipo&TIPO=RECHAZOPROP&SEGURO=" + sseguro+"&MENSAJE="+mensaje);
            }


            function f_cerrar_axisctr022() {
                objUtiles.cerrarModal("axisctr022");
            }


            function f_aceptar_axisctr022(sseguro,nmovimi,fefecto) {
                objDom.setValorComponente(document.miForm.SSEGURO, sseguro);
                objDom.setValorComponente(document.miForm.NMOVIMI, nmovimi);
                objDom.setValorComponente(document.miForm.FEFECTO, fefecto);
                f_cerrar_axisctr022();
                objUtiles.ejecutarFormulario("axis_axisctr018.do", "emitir_propuesta", document.miForm, "_self", objJsMessages.jslit_emitiendo_poliza);
            }


            function f_abrir_axisctr021(sseguro,nmovimi,nriesgo,nsuplem) {
                objUtiles.abrirModal("axisctr021", "src", "modal_axisctr021.do?dt=<%=new java.util.Date().getTime()%>&operation=init&SSEGURO="+sseguro+"&NMOVIMI="+nmovimi+"&NRIESGO="+nriesgo+"&NSUPLEM="+nsuplem);
            }


            function f_cerrar_axisctr021() {
                objUtiles.cerrarModal("axisctr021");
            }


            function f_aceptar_axisctr021(SSEGURO, NMOVIMI, NRIESGO, NSUPLEM, CMOTMOV, TOBSERVA) {
                objDom.setValorComponente(document.miForm.SSEGURO, SSEGURO);
                objDom.setValorComponente(document.miForm.NMOVIMI, NMOVIMI);
                objDom.setValorComponente(document.miForm.NRIESGO, NRIESGO);
                objDom.setValorComponente(document.miForm.NSUPLEM, NSUPLEM);
                objDom.setValorComponente(document.miForm.CMOTMOV, CMOTMOV);
				objDom.setValorComponente(document.miForm.OBS, TOBSERVA);
            <axis:visible c="DSP_MVTRETEN" f="axisctr018">
                objDom.setValorComponente(document.miForm.TOBSERVA, TOBSERVA);
            </axis:visible>
                f_cerrar_axisctr021();
                objUtiles.ejecutarFormulario("axis_axisctr018.do", "anular", document.miForm, "_self", objJsMessages.jslit_rechazando_movimiento);
            }


            //Método que marca la casilla de una póliza si coincide con el SSEGURO activo.
            function f_marcar_casilla_poliza() {
                if (document.miForm.checked_poliza.length==undefined)
                    objDom.setComponenteMarcado(document.miForm.checked_poliza, true);
                else {
                    var longitud = document.miForm.checked_poliza.length
                    for (var counter = 0; counter < document.miForm.checked_poliza.length; counter++) {

                        var tempVal= objDom.getValorComponente(document.miForm.checked_poliza[counter]);
                        var valor_s = objUtiles.utilSplit(tempVal, "/")[0];
                        if (objUtiles.utilEquals(valor_s, objDom.getValorComponente(document.miForm.SSEGURO))) {
                            objDom.setComponenteMarcado(document.miForm.checked_poliza[counter], true);
                            break;
                        }
                    }

                    //Al salir del for si el counter es mayor que cero es que no ha marcado ninguna opcion
                    if(counter > 0 && counter==longitud){
                        objDom.setComponenteMarcado(document.miForm.checked_poliza[0], true);
                        //Faltará recargar motivos
                        var tempVal= objDom.getValorComponente(document.miForm.checked_poliza[0]);
                        var valor_s = objUtiles.utilSplit(tempVal, "/")[0];
                        document.miForm.SSEGURO.value=valor_s;

                        f_cambiar_ordenacion_motivos();
                    }
                }
            }


            //Método para controlar la ordenación de un displayTag mediante nuestro servicio
            function f_cambiar_ordenacion_motivos(){
            <axis:visible c="DSP_MVTRETEN" f="axisctr018">
                var thheadadded = objLista.obtenerFilasHeadLista("miListaId2");

                var campos = new Array(5);
                campos[0] = "TMOTRET";
                campos[1] = "TESTGEST";
                campos[2] = "CUSURET";
                campos[3] = "FRETEN";
                campos[4] = "CUSUAUTO";
                campos[5] = "FUSUAUTO";

                for(var j=0;j< thheadadded.length;j++){
                    if(!objUtiles.estaVacio(thheadadded[j].className) && thheadadded[j].className.indexOf("gridsortable") != -1 ){
                        var ahead = thheadadded[j].getElementsByTagName("a");
                        if(!objUtiles.estaVacio(ahead[0])){
                            ahead[0].href = "javascript:f_ordenar('" + campos[j] + "', 'polmvtreten', 'OB_IAX_POLMVTRETEN')";
                        }
                    }
                }
            </axis:visible>
            }


            function f_onload(){
                //document.location.href = "#" +objDom.getValorComponente(document.miForm.SSEGURO);
                //miListaId.location = "#"+objDom.getValorComponente(document.miForm.SSEGURO);

            <c:if test="${empty sessionScope.axisctr017_lista && (empty __formdata.CANVI || (!empty __formdata.CANVI && __formdata.anulat == 0))}">
                <axis:visible c="DSP_MVTRETEN" f="axisctr018">
                    objLista.borrarFilasDeLista ("miListaId2", "6", "<axis:alt f='axisctr018' c='ERR_REGS' lit='1000254' />");
                 </axis:visible>
                 f_abrir_axisctr017();
            </c:if>
            <axis:visible c="BT_INSPECRISC" f="axisctr018">
                try{
                    var binsprisc = document.getElementById("but_9905410");
                    if (binsprisc != null)
                        binsprisc.style.display = 'none';
                }catch(e){}
            </axis:visible>
                var SSEGURO = "${__formdata.SSEGURO}";

            <c:if test="${!empty sessionScope.axisctr017_lista}">
                if ( objUtiles.estaVacio (objDom.getValorComponente(document.miForm.SSEGURO)))
                    objDom.setValorComponente(document.miForm.SSEGURO, "${sessionScope.SSEGURO_CONS}");
                if ( objUtiles.estaVacio (objDom.getValorComponente(document.miForm.NSUPLEM)))
                    objDom.setValorComponente(document.miForm.NSUPLEM, "${sessionScope.axisctr017_lista[0].OB_IAX_POLIZASRETEN.NSUPLEM}");
                if ( objUtiles.estaVacio (objDom.getValorComponente(document.miForm.NMOVIMI)))
                    objDom.setValorComponente(document.miForm.NMOVIMI, "${sessionScope.axisctr017_lista[0].OB_IAX_POLIZASRETEN.NMOVIMI}");
                if ( objUtiles.estaVacio (objDom.getValorComponente(document.miForm.CEDIT)))
                    objDom.setValorComponente(document.miForm.CEDIT, "${sessionScope.axisctr017_lista[0].OB_IAX_POLIZASRETEN.CEDIT}");
                if ( objUtiles.estaVacio (objDom.getValorComponente(document.miForm.CRETENI)))
                    objDom.setValorComponente(document.miForm.CRETENI, "${sessionScope.axisctr017_lista[0].OB_IAX_POLIZASRETEN.CRETENI}");
                var CSITUAC = "${sessionScope.axisctr017_lista[0].OB_IAX_POLIZASRETEN.CSITUAC}";
                //BUG 0026923/0151334 - JSV (23/08/2013) - INI
                <axis:visible c="BT_DUPLICAR" f="axisctr018">
                    f_but_editar_visibility_but_duplicar(CSITUAC);
                </axis:visible>

                //BUG 0026923/0151334 - JSV (23/08/2013) - FIN
                //Marcamos la casilla en función del SSEGURO activo

                f_cambiar_ordenacion_motivos();
                if ( objUtiles.estaVacio ("${ __formdata.NMOVIMI}")){
                    objAjax.invokeAsyncCGI("axis_axisctr018.do", callbackAjaxCargarMotivos, "operation=ajax_cargar_motivos&SSEGURO_M="+SSEGURO+"&NMOVIMI=${sessionScope.axisctr017_lista[0].OB_IAX_POLIZASRETEN.NMOVIMI}", this, objJsMessages.jslit_cargando);
                }else{
                    objAjax.invokeAsyncCGI("axis_axisctr018.do", callbackAjaxCargarMotivos, "operation=ajax_cargar_motivos&SSEGURO_M="+SSEGURO+"&NMOVIMI=${__formdata.NMOVIMI}", this, objJsMessages.jslit_cargando);
                }

                </c:if>
            <c:if test="${empty sessionScope.axisctr017_lista}">
                <axis:visible c="DSP_MVTRETEN" f="axisctr018">
                    objLista.borrarFilasDeLista ("miListaId2", "6", "<axis:alt f='axisctr018' c='ERR_REGS' lit='1000254' />");
                </axis:visible>
            </c:if>
            <c:if test="${PermisoAnulacion=='1'}">
                f_abrir_axisctr021(objDom.getValorComponente(document.miForm.SSEGURO), objDom.getValorComponente(document.miForm.NMOVIMI), objDom.getValorComponente(document.miForm.NRIESGO), objDom.getValorComponente(document.miForm.NSUPLEM));
            </c:if>
            <axis:visible c="DSP_IMPRIMIR_ANULACION" f="axisctr018">
                <c:if test="${Imprimir=='1'}">
                    f_abrir_axisimprimir(objDom.getValorComponente(document.miForm.SSEGUROIMP));
                </c:if>
            </axis:visible>
            f_cargar_propiedades_pantalla();
            <c:if test="${!empty sessionScope.axisctr017_lista}">
                <axis:visible c="BT_EDITAR" f="axisctr018">
                    //Mostramos/escondemos boton de editar segun SSEGURO
                    f_but_editar_visibility();
                </axis:visible>
            </c:if>
            }


            ///////////////////////////////////////////////////
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do", "cancelar", document.miForm, "_self");
            }


            //Funciones del Modal
            function f_abrir_axisctr017() {
                objUtiles.abrirModal("axisctr017","src","modal_axisctr017.do?operation=form&mantenerabierto=true");
            }


            function f_cerrar_axisctr017() {
                objUtiles.cerrarModal("axisctr017");
            }


            function f_aceptar_axisctr017 () {
                f_cerrar_axisctr017();
                //var SSEGURO_VALOR =0;
                objDom.setValorComponente(document.miForm.SPROCES, "");
                objUtiles.ejecutarFormulario("axis_axisctr018.do?SSEGURO="+document.miForm.SSEGURO.value, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }


            function f_esconder_precargador (){
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
            }


            // Imprimir
            function f_cerrar_axisimprimir() {
                objUtiles.cerrarModal("axisimprimir");
                objUtiles.ejecutarFormulario("axis_axisctr018.do", "renovar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }


            //Método que cambia la requestUri de ordenación según el SSEGURO seleccionado
            function f_cambiar_ordenacion (tableadded, SSEGURO){
                var theadadded = tableadded.getElementsByTagName("thead")[0];
                var trheadadded = theadadded.getElementsByTagName("tr");
                var thheadadded = trheadadded[0].getElementsByTagName("th");

                for(var j=0;j< thheadadded.length;j++){
                    if(!objUtiles.estaVacio(thheadadded[j].className) && thheadadded[j].className.indexOf("gridsortable") != -1 ){
                        var ahead = thheadadded[j].getElementsByTagName("a");
                        if(!objUtiles.estaVacio(ahead[0])){
                            ahead[0].href = objUtiles.stringReplace(ahead[0].href, /SSEGURO=\d*/, "SSEGURO=" + SSEGURO);
                        }
                    }
                }
            }


            //Método que marca el checkbox de un row al seleccionar éste mediante cualquier campo.
            function f_marcar_casilla_al_seleccionar(tableadded, SSEGURO, SPRODUC){
                var tbodyadded = tableadded.getElementsByTagName("tbody")[0];
                var tradded = tbodyadded.getElementsByTagName("tr");

                var posicion = objLista.buscarFilaEnLista("miListaId", SSEGURO + "/" + SPRODUC);

                var tdM = tradded[posicion].getElementsByTagName("td");
                var divM = tdM[0].getElementsByTagName("div");
                var inputM = divM[0].getElementsByTagName("input");
                objLista.estadoRadioCheckBox(inputM, "true");
            }


            //BUG 0026923/0151334 - JSV (23/08/2013) - INI
            function f_but_editar_visibility_but_duplicar(CSITUAC) {

                if (CSITUAC==5)  {
                    objDom.setVisibilidadPorId("but_9903980", "hidden");
                } else {
                    objDom.setVisibilidadPorId("but_9903980", "visible");
                }
            }
            //BUG 0026923/0151334 - JSV (23/08/2013) - INI


            function f_but_aceptar (SSEGURO, nsuplem, nmovimi, SPRODUC,CEDIT,CRETENI, CSITUAC) {
            
                //Si ha habido mensajes de error anteriormente, los eliminamos
                objAppMensajes.vaciarYEsconderMensajes();

                if (objUtiles.estaVacio (SSEGURO))
                    alert(objJsMessages.jslit_selecciona_una_poliza);
                else{
                    objDom.setValorComponente(document.miForm.SSEGURO, SSEGURO);
                    objDom.setValorComponente(document.miForm.CRETENI, CRETENI);

                    var tableadded = document.getElementById("miListaId");
                    //Para ordenar la tabla y que el riesgo actual continúe seleccionado
                    f_cambiar_ordenacion (tableadded, SSEGURO);

                    //Para marcar el checkbox de la row al seleccionar desde cualquier campo del mismo
                    f_marcar_casilla_al_seleccionar(tableadded, SSEGURO, SPRODUC);

                    objDom.setValorComponente(document.miForm.NSUPLEM, nsuplem);

                    objDom.setValorComponente(document.miForm.NMOVIMI, nmovimi);
                      objDom.setValorComponente(document.miForm.CEDIT, CEDIT);
                    //Mostramos/Escondemos el boton de editar segun SSEGURO
                    f_but_editar_visibility();

                   objAjax.invokeAsyncCGI("axis_axisctr018.do", callbackAjaxCargarMotivos, "operation=ajax_cargar_motivos&SSEGURO_M="+objDom.getValorComponente(document.miForm.SSEGURO)+"&NMOVIMI="+nmovimi, this, objJsMessages.jslit_cargando);
                }

                //BUG 0026923/0151334 - JSV (23/08/2013) - INI
                f_but_editar_visibility_but_duplicar(CSITUAC);
                //BUG 0026923/0151334 - JSV (23/08/2013) - FIN


                f_cargar_propiedades_pantalla();
                <c:if test="${!empty sessionScope.axisctr017_lista}">
                    <axis:visible c="BT_EDITAR" f="axisctr018">
                        //Mostramos/escondemos boton de editar segun SSEGURO
                        f_but_editar_visibility();
                    </axis:visible>
                 </c:if>
             
             }


            //function f_but_100736() { // RECHAZAR
            function f_but_anular() { // ANULAR
                if (objUtiles.estaVacio (objDom.getValorComponente(document.miForm.SSEGURO)) ||
                    objUtiles.estaVacio (objDom.getValorComponente(document.miForm.NSUPLEM)))
                    alert(objJsMessages.jslit_selecciona_una_poliza);
                else
                    //Llamamos a un m?todo que comprueba la opci?n : permitir anular propuesta
                    objUtiles.ejecutarFormulario("axis_axisctr018.do", "permitir_anular", document.miForm, "_self", objJsMessages.jslit_cargando);
            }


            function f_but_emitir() { // Emitir
                if (objUtiles.estaVacio (objDom.getValorComponente(document.miForm.SSEGURO)) ||
                    objUtiles.estaVacio (objDom.getValorComponente(document.miForm.NMOVIMI)))
                    alert(objJsMessages.jslit_selecciona_una_poliza);
                else
                    objAjax.invokeAsyncCGI_JSON("axis_axisctr018.do?operation=preguntaProgagaSupl", callbacPregPropagaSup, objJsMessages.jslit_cargando);
            }


            function callbacPregPropagaSup(p) {
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
                if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                    var mensajes = p.JSON2.resultado.OTEXTO;
                    if (!objUtiles.estaVacio(p.JSON2.resultado.OTEXTO)){
                       var confirmaPropaga=confirm(mensajes);
                       if (confirmaPropaga) {
                          objAjax.invokeAsyncCGI("axis_axisctr018.do?PCPROPAGASUPL=1", callbackGuardarEmitir, "operation=emitir_propuesta&SSEGURO="+objDom.getValorComponente(document.miForm.SSEGURO)+"&NMOVIMI="+objDom.getValorComponente(document.miForm.NMOVIMI)+"&GESTION_IR="+objDom.getValorComponente(document.miForm.GESTION_IR), this, objJsMessages.jslit_emitiendo_poliza);
                       }else{
                          objAjax.invokeAsyncCGI("axis_axisctr018.do?PCPROPAGASUPL=0", callbackGuardarEmitir, "operation=emitir_propuesta&SSEGURO="+objDom.getValorComponente(document.miForm.SSEGURO)+"&NMOVIMI="+objDom.getValorComponente(document.miForm.NMOVIMI)+"&GESTION_IR="+objDom.getValorComponente(document.miForm.GESTION_IR), this, objJsMessages.jslit_emitiendo_poliza);
                       }
                    }else{
                        objAjax.invokeAsyncCGI("axis_axisctr018.do", callbackGuardarEmitir, "operation=emitir_propuesta&SSEGURO="+objDom.getValorComponente(document.miForm.SSEGURO)+"&NMOVIMI="+objDom.getValorComponente(document.miForm.NMOVIMI)+"&GESTION_IR="+objDom.getValorComponente(document.miForm.GESTION_IR), this, objJsMessages.jslit_emitiendo_poliza);
                    }
                }  else{alert ("hay errores");}
                $.reinitialiseScroll();
            }


            function f_but_consultar() { // Consultar
                if (objUtiles.estaVacio (objDom.getValorComponente(document.miForm.SSEGURO))) {
                    alert(objJsMessages.jslit_selecciona_una_poliza);
                }else{
                    //alert(objDom.getValorComponente(document.miForm.NUM_FILA));
                    objUtiles.ejecutarFormulario("axis_axisctr018.do", "consultar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }


            function f_but_editar() { // Editar
                //Recuperar del valor del SPRODUC a la hora de emitir
                var hayAlgunChecked = objUtiles.f_GuardaCasillasChecked ("checked_poliza");
                if (!hayAlgunChecked) {
                    alert (objJsMessages.jslit_selecciona_producto);
                    return;
                } else {
                    objDom.setValorComponente(document.miForm.SSEGURO, objUtiles.utilSplit(hayAlgunChecked, "/")[0]);
                    objDom.setValorComponente(document.miForm.SPRODUC, objUtiles.utilSplit(hayAlgunChecked, "/")[1]);
                    
                }

                var SSEGURO = document.miForm.SSEGURO;

                //INICIO CONF-172
                var CSITUAC = "${sessionScope.axisctr017_lista[0].OB_IAX_POLIZASRETEN.CSITUAC}";
                var CMOTMOV = "${sessionScope.axisctr017_lista[0].OB_IAX_POLIZASRETEN.CMOTMOV}";
                //alert(CSITUAC);
                //alert(CMOTMOV);
                /*if (CSITUAC === 5){
                	modo = 'editarsupl';
                    objUtiles.ejecutarFormulario("axis_axisctr018.do?MODO_EDICION_TEXTO="+"GENERAL_"+CMOTMOV, "editarsupl", document.miForm, "_self", objJsMessages.jslit_cargando);
                
                }//FIN CONF-172
                else if (objUtiles.estaVacio (SSEGURO))
                    alert(objJsMessages.jslit_selecciona_una_poliza);
                else{
                    var modo = '';
                    var edicion = document.miForm.MODO_EDICION.value;
                    if (edicion ==2)
                        modo = 'MODIFICACION';
                    objUtiles.ejecutarFormulario("axis_axisctr018.do?MODO_EDICION_TEXTO="+"SUPLEMENTO_"+CMOTMOV, "editar", document.miForm, "_self", objJsMessages.jslit_cargando);
                  }*/
                
                if (CSITUAC == 5){
                	modo = 'editarsupl';
                    objUtiles.ejecutarFormulario("axis_axisctr018.do?MODO_EDICION_TEXTO=SUPLEMENTO_"+CMOTMOV, "editar", document.miForm, "_self", objJsMessages.jslit_cargando);
                
                }//FIN CONF-172
                else if (objUtiles.estaVacio (SSEGURO))
                    alert(objJsMessages.jslit_selecciona_una_poliza);
                else{
                    var modo = '';
                    var edicion = document.miForm.MODO_EDICION.value;
                    if (edicion ==2)
                        modo = 'MODIFICACION';
                    objUtiles.ejecutarFormulario("axis_axisctr018.do?MODO_EDICION_TEXTO="+modo, "editar", document.miForm, "_self", objJsMessages.jslit_cargando);
                  }
            }


            // Botón duplicar
            function f_but_9903980(){
                if (objUtiles.estaVacio (objDom.getValorComponente(document.miForm.SSEGURO)))
                    alert(objJsMessages.jslit_selecciona_una_poliza);
                else
                {
                    //RCL BUG 26926/146670 - Comprobamos que se pueda duplicar
                    //Llamamos a un m?todo que comprueba la opci?n : duplicar una propuesta
                    objAjax.invokeAsyncCGI_JSON("axis_axisctr018.do?operation=validaDupSeguro", callbackValidaDupSeguro, objJsMessages.jslit_cargando);
                }
            }


            function callbackValidaDupSeguro(p){
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
                if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                    if (p.JSON2.resultado.RETURN == 0)
                        objUtiles.abrirModal("axisctr190", "src", "modal_axisctr190.do?operation=form&SSEGURO="+objDom.getValorComponente(document.miForm.SSEGURO));
                }else{
                    alert ("hay errores");
                }
                $.reinitialiseScroll();
            }


            ////////////////////////////////////////////////////////
            ///CALLBACK & INC
            ////////////////////////////////////////////////////////
            function f_ordenar(campo, tabla, outerMap){
                <% request.setAttribute(axis.util.Constantes.FORMDATA, request.getAttribute(axis.util.Constantes.FORMDATA)); %>
                objAjax.invokeAsyncCGI("axis_axisctr018.do", callbackAjaxCargarMotivos, "operation=ajax_cargar_motivos&ordenar=true&campo=" + campo + "&tabla=" + tabla + "&outerMap=" + outerMap + "&SSEGURO_M="+objDom.getValorComponente(document.miForm.SSEGURO) + "&NMOVIMI="+objDom.getValorComponente(document.miForm.NMOVIMI), this, objJsMessages.jslit_cargando);
            }


            function callbackGuardarEmitir (ajaxResponseText) {
                var doc = objAjax.domParse(ajaxResponseText);
                var disableButtons = false;

                if (!objAppMensajes.existenErroresEnAplicacion(doc)){     //Se ha producido un error informativo
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("OSSEGURO")[0]) ) {
                        var sseguro = objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0);
                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TINFO")[0])){
                            var mensaje = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0);
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("OMOTRETEN")[0]) && objDom.getValorNodoDelComponente(doc.getElementsByTagName("OMOTRETEN"), 0, 0) == 1){
                               objDom.setVisibilidadPorId("but_cerrar_modal_axisctr049", "hidden");
                               objUtiles.abrirModal("axisctr049","src","modal_axisctr049.do?operation=form&SSEGURO="+sseguro+"&MENSAJE="+objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0));
                               // f_get_reten(objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0));
                            }
                        }else{
                            var mensaje="";
                        }

                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("OMOTRETEN")[0]) && objDom.getValorNodoDelComponente(doc.getElementsByTagName("OMOTRETEN"), 0, 0) == 1){
                            var mensaje="";
                        }else{
                        	
                        	if(version_tomcat <= 6){
                         	
                            //Se anyade una llamada a impresiones
                            objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt="+<%=new java.util.Date().getTime()%>+"&operation=impresion_doc&MENSAJE="+mensaje+"&SEGURO=" +
                            						objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0));
                         	}
                         	else{
                         		
                         		objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt="+<%=new java.util.Date().getTime()%>+"&operation=impresion_doc&MENSAJE="+encodeURI(mensaje)+"&SEGURO=" +
                						objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0));
                         	}
                            
                            
                        }
                    }

                   //var visibility = disableButtons ? "hidden" : "visible";
                   //objDom.setVisibilidadPorId("but_guardar", visibility);

                }else{

                    //Si hay errores, dejar el botón de salir activo
                    //objDom.setVisibilidadPorId("but_100001", "hidden");
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TIPERROR")[0]) &&
                        objUtiles.hayValorElementoXml(doc.getElementsByTagName("CERROR")[0]) &&
                        objUtiles.hayValorElementoXml(doc.getElementsByTagName("TERROR")[0]))
                    {
                        var TIPERROR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TIPERROR"), 0, 0);
                        var CERROR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CERROR"), 0, 0);
                        var TERROR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TERROR"), 0, 0);
                        
                        if(version_tomcat <= 6){
                        	objUtiles.ejecutarFormulario("axis_axisctr018.do?TIPERROR="+TIPERROR+"&CERROR="+CERROR+"&TERROR="+TERROR, "renovar", document.miForm, "_self", objJsMessages.jslit_cargando);
                        }else{
                        	objUtiles.ejecutarFormulario("axis_axisctr018.do?TIPERROR="+TIPERROR+"&CERROR="+CERROR+"&TERROR="+encodeURI(TERROR), "renovar", document.miForm, "_self", objJsMessages.jslit_cargando);
                        }
                        
                        
                    }
                }
                // recarrega scroll pane
                $.reinitialiseScroll();
            }


            function f_cargar_observacion(i){
                objAjax.invokeAsyncCGI("axis_axisctr018.do", callbackAjaxCargarObservacion, "operation=ajax_cargar_observacion&fila_observa="+i, this, objJsMessages.jslit_cargando);
            }


            function omplirGridPSU(ajaxResponseText){
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc, false)){
                    var tableM = document.getElementById("T_IAX_PSU");
                    var tbodyM = tableM.getElementsByTagName("tbody")[0];
                    var trM = tbodyM.getElementsByTagName("tr");
                    objLista.borrarFilasDeLista ("T_IAX_PSU", "6", "<axis:alt f='axisctr018' c='BORRAR' lit='1000254' />");
                    //Preparem texte TESTPOL

                    var capa = document.getElementById("label_TESTPOL");
                    var P_TESTPOL = "";
                    var P_CESTPOL = "";
                    var PCNIVELBPM = "";
                    var PTNIVELBPM = "";
                    var permiteModificar = "";
                    try {
                        P_TESTPOL = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("PTESTPOL")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("PTESTPOL"), 0, 0) : "");
                    } catch(e) {
                    }

                    try {
                        P_CESTPOL = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("PCESTPOL")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("PCESTPOL"), 0, 0) : "");
                    } catch(e) {
                    }

                    try {
                        PCNIVELBPM = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("PCNIVELBPM")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("PCNIVELBPM"), 0, 0) : "");
                    } catch(e) {
                    }

                    try {
                        PTNIVELBPM = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("PTNIVELBPM")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("PTNIVELBPM"), 0, 0) : "");
                    } catch(e) {
                    }

                    try {
                        permiteModificar = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("permiteModificar")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("permiteModificar"), 0, 0) : "");
                    } catch(e) {
                    }

                    objDom.setValorPorId ("CESTPOL_PSU", P_CESTPOL);
                    objDom.setValorPorId ("TESTPOL_PSU", P_TESTPOL);
                    objDom.setValorPorId ("TNIVELBPM_PSU", PTNIVELBPM);
                    objDom.setValorPorId ("CNIVELBPM_PSU", PCNIVELBPM);
                    objDom.setValorPorId ("permiteModificar", permiteModificar);

                    var texto = '  '+P_TESTPOL+  ' ' + PTNIVELBPM;

                    for (var i = 0; i < objDom.numeroDeTags(doc, "POBPSU_RETENIDAS") ; i++) {

                        var tusuaut = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TUSUAUT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TUSUAUT"), i, 0) : "");
                        var ffecaut = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FFECAUT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FFECAUT"), i, 0) : "");
                        if (ffecaut != "")
                            ffecaut = objUtiles.formateaTimeStamp(ffecaut);
                            var texto1 = '<axis:alt f="axisctr018" c="USU_AUT" lit="9902808" />';
                            var texto2 = '<axis:alt f="axisctr020" c="FECHA_AUT" lit="100562" />';

                        if (tusuaut != "")
                            texto = texto+ '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+texto1+'    '+tusuaut+'&nbsp;&nbsp;&nbsp;&nbsp;'+texto2+'     '+ffecaut;
                    }

                    capa.innerHTML = texto;

                    var tableM = document.getElementById("T_IAX_PSU");
                    var tbodyM = tableM.getElementsByTagName("tbody")[0];
                    var trM = tbodyM.getElementsByTagName("tr");
                    objLista.borrarFilasDeLista ("T_IAX_PSU", "7", "<axis:alt f='axisctr018' c='BORRAR' lit='1000254' />");

                    for (var i = 0; i < objDom.numeroDeTags(doc, "OB_IAX_PSU") ; i++) {
                        // Como hay resultados, borramos la fila vacia
                        if (i==0)
                            objLista.borrarFilaVacia(tbodyM, trM);
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        // Creamos un array de columnas a añadir a la nueva fila del displayTag
                        var newtd = new Array(7);
                        //TCONTROL,FMOVIMI,TAUTREC,FAUTREC,TUSUNOM(NO HI ES),TRIESGO,TNIVELR
                        //CCONTROL está repetit
                        //TUSUNOM(NO HI ES)
                        // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                        var SSEGURO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("SSEGURO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("SSEGURO"), i, 0) : "");
                        var NRIESGO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NRIESGO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NRIESGO"), i, 0) : "");
                        var NMOVIMI = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NMOVIMI")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NMOVIMI"), i, 0) : "");
                        var TCONTROL = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TCONTROL")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCONTROL"), i, 0) : "");
                        var CCONTROL = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CCONTROL")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCONTROL"), i, 0) : "");
                        var NOCURRE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NOCURRE")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOCURRE"), i, 0) : "");

                        var TAUTREC = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAUTREC")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAUTREC"), i, 0) : "");
                        var TNIVELR= ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNIVELR")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNIVELR"), i, 0) : "");
                        var FMOVIMI = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FMOVIMI")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FMOVIMI"), i, 0) : "");
                        if (FMOVIMI != "")
                            FMOVIMI = objUtiles.formateaTimeStamp(FMOVIMI);
                        var FAUTREC = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FAUTREC")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FAUTREC"), i, 0) : "");
                        if (FAUTREC != "")
                            FAUTREC = objUtiles.formateaTimeStamp(FAUTREC);
                        var TRIESGO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TRIESGO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TRIESGO"), i, 0) : "");
                        //TODO: De momento no llega en la lista de valores desde PL
                        var TUSUNOM = "";
                        var CCRITICO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CCRITICO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCRITICO"), i, 0) : "");

                        var CGARANT = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CGARANT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CGARANT"), i, 0) : "");
                        var TGARANT = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TGARANT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TGARANT"), i, 0) : "");

                        //Cargamos los valores del registro de la tabla
                        newtd[0] = objLista.addTextoEnLista(TCONTROL);
                        newtd[1] = objLista.addTextoEnLista(FMOVIMI);
                        newtd[2] = objLista.addTextoEnLista(TAUTREC);

                        if (TGARANT!="")
                            newtd[3] = objLista.addTextoEnLista(TRIESGO+" - "+TGARANT);
                        else
                            newtd[3] = objLista.addTextoEnLista(TRIESGO);

                        newtd[4] = objLista.addTextoEnLista(TNIVELR);
                        <axis:visible f="axisctr018" c="CCRITICO">
                            newtd[5] =objLista.addCheckBoxEnLista("CCRITICO_"+i, CCRITICO, "");
                        </axis:visible>
						<axis:visible f="axisctr018" c="DETALLE">
                        newtd[6] = objLista.addImagenEnLista("javascript:f_abrir_axispsu003("+ SSEGURO + "," + NMOVIMI + "," + NRIESGO +"," + CCONTROL +"," + NOCURRE +"," + CGARANT +");", "0", "", "", "images/mas.gif");
						</axis:visible>
                        // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                        objLista.addNuevaFila(newtd, newtr, tbodyM);

                        <axis:visible f="axisctr018" c="CCRITICO">
                        if (document.getElementById("CCRITICO_"+i).value==1){
                          document.getElementById("CCRITICO_"+i).checked="true";
                          document.getElementById("CCRITICO_"+i).style.backgroundColor ="#FF0000";
                        }
                        document.getElementById("CCRITICO_"+i).disabled="true";
                        </axis:visible>
                    } // Fi for
                }
            }


            function f_but_9905410(){
                objUtiles.ejecutarFormulario("axis_axisctr018.do?ACCION=INSPECCION" , "inspeccionRiesgo", document.miForm, "_self", objJsMessages.jslit_cargando);
            }


            function omplirGridInspeccionRiesgo(ajaxResponseText){
            <axis:visible f="axisctr018" c="DSP_INSPECCION_RIESGO">
                var doc = objAjax.domParse(ajaxResponseText);
                <axis:visible c="BT_INSPECRISC" f="axisctr018">
                    try{
                        var binsprisc = document.getElementById("but_9905410");
                        if (binsprisc != null)
                            binsprisc.style.display = 'none';
                    }catch(e){}
                </axis:visible>
                if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {
                    //seleccionar opcion combos

                    if (objDom.numeroDeTags(doc, "CINSPREQ")>0){
                        var CINSPREQ= ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CINSPREQ")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CINSPREQ"), 0, 0) : "");
                        var combo = document.getElementById("CINSPREQ");
                        seleccionarOpcionCombo(CINSPREQ, combo);
                    }
                    if (objDom.numeroDeTags(doc, "CRESULTR")>0){
                        var CRESULTR= ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CRESULTR")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CRESULTR"), 0, 0) : "");
                        combo = document.getElementById("CRESULTR");
                        seleccionarOpcionCombo(CRESULTR, combo);
                        <axis:visible c="BT_INSPECRISC" f="axisctr018">
                        try{
                            binsprisc = document.getElementById("but_9905410");
                            if (binsprisc != null){
                                try{
                                    CRETENI = document.miForm.CRETENI.value;
                                }catch(e){CRETENI = 0;}
                                if (CINSPREQ == 1 && CRESULTR == 5 && (CRETENI == 7 || CRETENI == 0)  ){
                                   binsprisc.style.display = '';
                                }else{
                                   binsprisc.style.display = 'none';
                                }
                           }
                        }catch(e){}
                        </axis:visible>
                    }

                    var tableM = document.getElementById("INSPECCION_RIESGO");
                    var tbodyM = tableM.getElementsByTagName("tbody")[0];
                    var trM = tbodyM.getElementsByTagName("tr");

                    objLista.borrarFilasDeLista ("INSPECCION_RIESGO", "9", "<axis:alt f='axisctr018' c='BORRAR' lit='1000254' />");
                    var hayinspeccion = objDom.numeroDeTags(doc, "SORDEN") ;
                    for (var i = 0; i < hayinspeccion ; i++) {
                        // Como hay resultados, borramos la fila vacia
                        if (i==0)
                            objLista.borrarFilaVacia(tbodyM, trM);
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        // Creamos un array de columnas a añadir a la nueva fila del displayTag

                        var newtd = new Array(9);
                        //SORDEN,NINSPECCION,FSOLICITUD,CESTADORDEN,CCLASE,FVTORDEN,FALTA,CESTADOINSPEC

                        // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                        var SORDEN = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("SORDEN")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("SORDEN"), i, 0) : "");
                        var NINSPECCION = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NINSPECCION")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NINSPECCION"), i, 0) : "");
                        var FSOLICITUD = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FSOLICITUD")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FSOLICITUD"), i, 0) : "");
                        if (FSOLICITUD != "") FSOLICITUD = objUtiles.formateaTimeStamp2(FSOLICITUD);
                        var TESTADOORDEN = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TESTADOORDEN")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TESTADOORDEN"), i, 0) : "");
                        var TCLASE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TCLASE")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCLASE"), i, 0) : "");
                        var FVTORDEN = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FVTORDEN")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FVTORDEN"), i, 0) : "");
                        if (FVTORDEN != "") FVTORDEN = objUtiles.formateaTimeStamp2(FVTORDEN);
                        var FINSPECCION = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FINSPECCION")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FINSPECCION"), i, 0) : "");
                        if (FINSPECCION != "") FINSPECCION = objUtiles.formateaTimeStamp2(FINSPECCION);
                        var TESTADOINSPECCION= ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TESTADOINSPECCION")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TESTADOINSPECCION"), i, 0) : "");

                        document.getElementById("CMATRIC").value = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CMATRIC")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CMATRIC"), i, 0) : "");
                        document.getElementById("CTIPMAT").value = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTIPMAT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPMAT"), i, 0) : "");

                        //Cargamos los valores del registro de la tabla
                        newtd[0] = objLista.addTextoEnLista(SORDEN);
                        newtd[1] = objLista.addTextoEnLista(NINSPECCION);
                        newtd[2] = objLista.addTextoEnLista(FSOLICITUD);
                        newtd[3] = objLista.addTextoEnLista(TESTADOORDEN);
                        newtd[4] = objLista.addTextoEnLista(TCLASE);
                        newtd[5] = objLista.addTextoEnLista(FVTORDEN);
                        newtd[6] = objLista.addTextoEnLista(FINSPECCION);
                        newtd[7] = objLista.addTextoEnLista(TESTADOINSPECCION);

                        if (! objUtiles.estaVacio(NINSPECCION)){
                            newtd[8] = objLista.addImagenEnLista("javascript:f_consultar_inspeccion("+SORDEN+","+NINSPECCION+" )",
                                        "0", "", "", "images/mas.gif");
                        }else{
                            newtd[8] = objLista.addTextoEnLista("");
                        }
                        // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                        objLista.addNuevaFila(newtd, newtr, tbodyM);

                    } // Fi for
                }
                </axis:visible>
            }


            function seleccionarOpcionCombo(elemento, combo) {

                var cantidad = combo.length;
                for (i = 0; i < cantidad; i++) {
                    if (combo[i].value == elemento) {
                        combo[i].selected = true;
                    }
                }
            }


            function omplirObservacionPSU(ajaxResponseText){

                <axis:visible f="axisctr018" c="DSP_PSU">
                    var doc = objAjax.domParse(ajaxResponseText);
                    var tableM = document.getElementById("LST_POBPSU_RETENIDAS");
                    //tableM.style.tableLayout="fixed";
                    var tbodyM = tableM.getElementsByTagName("tbody")[0];
                    var trM = tbodyM.getElementsByTagName("tr");

                    objLista.borrarFilasDeLista ("LST_POBPSU_RETENIDAS", "4", "<axis:alt f='axisctr018' c='BORRAR' lit='1000254' />");
                    var hayobservacion = objDom.numeroDeTags(doc, "LST_POBPSU_RETENIDAS") ;
                    for (var i = 0; i < hayobservacion ; i++) {
                        // Como hay resultados, borramos la fila vacia
                        if (i==0) objLista.borrarFilaVacia(tbodyM, trM);
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        // Creamos un array de columnas a añadir a la nueva fila del displayTag

                        var newtd = new Array(4);
                        //FFECAUT,TUSUAUT,TMOTRET,OBSERV
                        // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                        var FFECAUT = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("LST_POBPSU_RETENIDAS")[i].getElementsByTagName("FFECAUT")[0])) ? doc.getElementsByTagName("LST_POBPSU_RETENIDAS")[i].getElementsByTagName("FFECAUT")[0].childNodes[0].nodeValue : "");
                        if (FFECAUT != "") FFECAUT = objUtiles.formateaTimeStamp2(FFECAUT);
                        var TUSUAUT = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("LST_POBPSU_RETENIDAS")[i].getElementsByTagName("TUSUAUT")[0])) ? doc.getElementsByTagName("LST_POBPSU_RETENIDAS")[i].getElementsByTagName("TUSUAUT")[0].childNodes[0].nodeValue : "");
                        var TMOTRET = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("LST_POBPSU_RETENIDAS")[i].getElementsByTagName("TMOTRET")[0])) ? doc.getElementsByTagName("LST_POBPSU_RETENIDAS")[i].getElementsByTagName("TMOTRET")[0].childNodes[0].nodeValue : "");
                        var OBSERV = "";
                        	//((objUtiles.hayValorElementoXml(doc.getElementsByTagName("LST_POBPSU_RETENIDAS")[i].getElementsByTagName("OBSERV")[0])) ? doc.getElementsByTagName("LST_POBPSU_RETENIDAS")[i].getElementsByTagName("OBSERV")[0].childNodes[0].nodeValue : "");

                        //Cargamos los valores del registro de la tabla
                        newtd[0] = objLista.addTextoEnLista(FFECAUT);
                        newtd[1] = objLista.addTextoEnLista(TUSUAUT);
                        newtd[2] = objLista.addTextoEnLista(TMOTRET);
                        newtd[3] = objLista.addTextoEnLista(OBSERV);
                        objLista.addNuevaFila(newtd, newtr, tbodyM);

                    } // Fi for
                </axis:visible>
            }

            ////// funcion callbackAjaxCargarMotivos /////////////
            function callbackAjaxCargarMotivos(ajaxResponseText) {
            //alert(ajaxResponseText);
             var doc = objAjax.domParse(ajaxResponseText);
               var tipoGrid = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TIPODATOS")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TIPODATOS"), 0, 0) : "");
               objDom.setValorPorId ("TIPODATOS", tipoGrid);

            document.getElementById("CMATRIC").value = "";
            document.getElementById("CTIPMAT").value = "";

            var GESTION_IR = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("GESTION_IR")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("GESTION_IR"), 0, 0) : "");
            document.getElementById("GESTION_IR").value = GESTION_IR;
            
            
            
            objLista.borrarFilasDeLista ("lstPsuRetenidas", "9", "<axis:alt f='axisctr018' c='ERR_REGS' lit='1000254' />");
            objLista.borrarFilasDeLista ("lstPsuControl", "8", "<axis:alt f='axisctr018' c='ERR_REGS' lit='1000254' />");
          
            if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {	
	            		var tableM = document.getElementById("lstPsuRetenidas");
	                    var tbodyM = tableM.getElementsByTagName("tbody")[0];
	                    var trM = tbodyM.getElementsByTagName("tr");
	                    
	                    
	                    for (var i = 0; i < objDom.numeroDeTags(doc, "OB_IAX_PSU_RETENIDAS") ; i++) {
	                    	
	                    	if(i==0) objLista.borrarFilaVacia(tbodyM, trM);
	                    	

                            //Obtenemos el estilo para la fila que insertaremos
                            var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                            //Creamos una nueva fila vacia y le damos el estilo obtenido
                            var newtr = objLista.crearNuevaFila(rowstyle);
                            //Creamos un array de columnas a añadir a la nueva fila del displayTag
                            var newtd = new Array(9);
                           
                            
                            var FFECAUT = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("HFFECAUT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("HFFECAUT"), i, 0) : "");
                            var tmotret2 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("HNVERSION")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("HNVERSION"), i, 0) : "");
                            var tmotret3 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("HCUSUAUT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("HCUSUAUT"), i, 0) : "");
                            var tmotret4 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("HTESTPOL")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("HTESTPOL"), i, 0) : "");
                            var tmotret5 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("HTSUBESTADO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("HTSUBESTADO"), i, 0) : "");
                            var tmotret6 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("HOBSERV")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("HOBSERV"), i, 0) : "");
                            
                            var seguro = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("HSSEGURO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("HSSEGURO"), i, 0) : "");
                            var movimiento = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("HNMOVIMI")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("HNMOVIMI"), i, 0) : "");
                           
                            var tmotret7 = (' ');
                            
                           
                            if(i == objDom.numeroDeTags(doc, "OB_IAX_PSU_RETENIDAS") - 1){
                            
                            tmotret5 = tmotret5 +''+'<img border="0"	src="images/informacion.gif" width="12px" height="12px" style="cursor: pointer;" onClick="javascript:f_axispsu017('+
                    		seguro+','+tmotret2+','+movimiento+')" />';
                    		
                            tmotret7 = ('<img border="0"	src="images/lapiz.gif" width="12px" height="12px" style="cursor: pointer;" onClick="javascript:f_axispsu018('+
                            		seguro+','+tmotret2+','+movimiento+')" />');
                            
                            }
                            
                            var tmotret8 = ('<img border="0"	src="images/informacion.gif" width="12px" height="12px" style="cursor: pointer;" onClick="javascript:f_axispsu015('+
                            		seguro+','+tmotret2+','+movimiento+')" />');
                            
                            if(FFECAUT != ""){
                            	FFECAUT = objUtiles.formateaTimeStamp(FFECAUT);
                            }
        				
        					
                            newtd[0] = objLista.addRadioButtonEnLista("radioNMOVIMI", "radio"+seguro+tmotret2+movimiento, 'javascript:f_cargar_lstPsuControl('+seguro+','+tmotret2+','+movimiento+');');
                            newtd[1] = objLista.addTextoEnLista(FFECAUT);
                            newtd[2] = objLista.addTextoEnLista(tmotret2);
                            newtd[3] = objLista.addTextoEnLista(tmotret3);
                            newtd[4] = objLista.addTextoEnLista(tmotret4);
                            newtd[5] = objLista.addTextoEnLista(tmotret5);
                            newtd[6] = objLista.addTextoEnLista(tmotret6);
                            newtd[7] = objLista.addTextoEnLista(tmotret7);
                            newtd[8] = objLista.addTextoEnLista(tmotret8);
                            
                            objLista.addNuevaFila(newtd, newtr, tbodyM);

     
	                    }
	                
            		
            		 }	
            		

            <axis:visible c="DSP_INSPECCION_RIESGO" f="axisctr018">
               var COBJASE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("COBJASE")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("COBJASE"), 0, 0) : "");
               var gridInspeccionRiesgo = document.getElementById("gridInspeccionRiesgo");

               if (COBJASE!=5){
                    gridInspeccionRiesgo.style.display = "none";
                }else{
                    gridInspeccionRiesgo.style.display = "block";
                    var combo = document.getElementById("CINSPREQ");
                    seleccionarOpcionCombo("<%= Integer.MIN_VALUE %>", combo);
                    combo = document.getElementById("CRESULTR");
                    seleccionarOpcionCombo("<%= Integer.MIN_VALUE %>", combo);
                    omplirGridInspeccionRiesgo(ajaxResponseText);
                }
            </axis:visible>

            if(tipoGrid=="PSU"){

            <axis:visible c="DSP_PSU" f="axisctr018">
                omplirGridPSU(ajaxResponseText);
                omplirObservacionPSU(ajaxResponseText)
            </axis:visible>

            }else{
                <axis:visible c="DSP_MVTRETEN" f="axisctr018">
                try {
                    var doc=objAjax.domParse(ajaxResponseText);
                    //alert(ajaxResponseText);
                    if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {
                        var tableM = document.getElementById("miListaId2");
                        var tbodyM = tableM.getElementsByTagName("tbody")[0];
                        var trM = tbodyM.getElementsByTagName("tr");

                        objLista.borrarFilasDeLista ("miListaId2", "6", "<axis:alt f='axisctr018' c='ERR_REGS' lit='1000254' />");
                        for (var i = 0; i < objDom.numeroDeTags(doc, "TMOTRET") ; i++) {
                            //Como hay resultados, borramos la fila vacia
                            if(i==0) objLista.borrarFilaVacia(tbodyM, trM);

                            //Obtenemos el estilo para la fila que insertaremos
                            var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                            //Creamos una nueva fila vacia y le damos el estilo obtenido
                            var newtr = objLista.crearNuevaFila(rowstyle);
                            //Creamos un array de columnas a añadir a la nueva fila del displayTag
                            var newtd = new Array(6);
                            //Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando


                            var cmotret = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CMOTRET")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CMOTRET"), i, 0) : "");
                            document.miForm.CMOTRET.value = cmotret;

                            var codobserva = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODOBSERVA")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODOBSERVA"), i, 0) : "0");

                            newtd[0] = objLista.addRadioButtonEnLista("checked_motivo", cmotret , "javascript:f_cargar_observacion('" + codobserva + "');");

                            var tmotret = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TMOTRET")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TMOTRET"), i, 0) : "");
                            newtd[1] = objLista.addTextoEnLista(tmotret);

                            var testgest = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TESTGEST")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TESTGEST"), i, 0) : "");
                            newtd[2] = objLista.addTextoEnLista(testgest);

                            var cusuret = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CUSURET")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CUSURET"), i, 0) : "");
                            newtd[3] = objLista.addTextoEnLista(cusuret);

                            var freten = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FRETEN")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FRETEN"), i, 0) : "");
                            if(freten != "")
                                freten = objUtiles.formateaTimeStamp(freten);
                            newtd[4] = objLista.addTextoEnLista(freten);

                            var cusuauto = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CUSUAUTO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CUSUAUTO"), i, 0) : "");
                            newtd[5] = objLista.addTextoEnLista(cusuauto);

                            var fusuauto = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FUSUAUTO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FUSUAUTO"), i, 0) : "");
                            if(fusuauto != "")
                                fusuauto = objUtiles.formateaTimeStamp(fusuauto);
                            newtd[6] = objLista.addTextoEnLista(fusuauto);

                            //Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                            objLista.addNuevaFila(newtd, newtr, tbodyM);

                            //Seleccionar el primer registro de la lista y mostrar sus observaciones
                            if(i==0){
                                var observa = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TOBSERVA")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TOBSERVA"), 0, 0) : "");
                                objDom.setValorComponente(document.miForm.TOBSERVA, observa);
                                objLista.estadoRadioCheckBox(newtd[0].getElementsByTagName("input"), true);
                            }
                        }//Fi for

                        // Trozo eliminado correspondiente a observaciones ////

                        //Borramos (si es necesario), los textarea
                        ////objLista.borrarTextArea("textarea_observaciones");
                        //Llenamos los textArea
                        ////var hayTextArea = false;
                        ////for(var j=0; j< objDom.numeroDeTags(doc, "TOBSERVA"); j++){
                            ////if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("TOBSERVA")[j])){
                                ////hayTextArea = true;
                                ////objLista.crearTextArea("textarea_observaciones",
                                ////objDom.getValorNodoDelComponente(doc.getElementsByTagName("TOBSERVA"), j, 0),
                                ////"TOBSERVA_" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("NMOVIMI"), j, 0) + "_" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("NRIESGO"), j, 0) + "",
                                ////"TOBSERVA_" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("NMOVIMI"), j, 0) + "_" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("NRIESGO"), j, 0) + "",
                                ////2, 50, "campo campotexto", "visible", "block", true, "50px");
                            ////}
                        ////}
                        //Si no hay observaciones, generamos un textArea Vacio
                        ////if(!hayTextArea)
                            ////objLista.crearTextArea("textarea_observaciones", "", "TOBSERVA_0_0", "TOBSERVA_0_0", 2, 50, "campo campotexto", "visible", "block", true, "50px");
                    }

                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
                </axis:visible>
                }

                 // recarrega scroll pane
                $.reinitialiseScroll();
                f_cargar_propiedades_pantalla();
                <c:if test="${!empty sessionScope.axisctr017_lista}">
                    <axis:visible c="BT_EDITAR" f="axisctr018">
                        //Mostramos/escondemos boton de editar segun SSEGURO
                        f_but_editar_visibility();
                    </axis:visible>
                 </c:if>
            }


            function callbackAjaxCargarObservacion(ajaxResponseText) {
                try {
                    var doc=objAjax.domParse(ajaxResponseText);
                    //alert(ajaxResponseText);
                    if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {
                        // No ha habido errores
                        var observa = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TOBSERVA")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TOBSERVA"), 0, 0) : "");
                        objDom.setValorComponente(document.miForm.TOBSERVA, observa);
                     }
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
                 // recarrega scroll pane
                $.reinitialiseScroll();
            }


            function f_cerrar_axisctr049(){
                objUtiles.cerrarModal("axisctr049");
                objUtiles.ejecutarFormulario("axis_axisctr018.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }


            function f_abrir_axispsu003(SSEGURO,NMOVIMI,NRIESGO,CCONTROL,NOCURRE,CGARANT) {
                var param = '&SSEGURO='+SSEGURO+'&NMOVIMI='+NMOVIMI+'&NRIESGO='+NRIESGO+'&CCONTROL='+CCONTROL+'&NOCURRE='+NOCURRE+'&CGARANT='+CGARANT+'&PTABLAS=POL';
                objUtiles.abrirModal("axispsu003", "src", "modal_axispsu003.do?ORIGEN=AXISCTR018&operation=form"+param);
            }

            function f_cerrar_axispsu003() {
                objUtiles.cerrarModal("axispsu003");
            }

            function f_cerrar_modal(pantalla){
                objUtiles.cerrarModal(pantalla);
            }

            function f_aceptar_modal(cual, params) {
                //f_cerrar_modal(cual);
                if (objUtiles.estaVacio(params))
                    params = "";

                if (cual == "axispsu003"){
                    f_cerrar_axispsu003();
                    objUtiles.ejecutarFormulario("axis_axisctr018.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
                if (cual == "axisctr190"){
                    objUtiles.ejecutarFormulario("axis_axisctr018.do", "renovar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }


            function f_consultar_inspecciones(){
                var CTIPMAT = document.getElementById("CTIPMAT").value;
                var CMATRIC = document.getElementById("CMATRIC").value;
                objUtiles.abrirModal("axisins001", "src", "modal_axisins001.do?operation=form&CTIPMAT="+CTIPMAT+"&CMATRIC="+CMATRIC);
            }


            function f_consultar_inspeccion(orden, inspeccion){
                objUtiles.abrirModal("axisins001", "src", "modal_axisins001.do?operation=form&SORDEN="+orden+"&NINSPECCION="+inspeccion);
            }


            function f_cerrar_axisins001() {
                objUtiles.cerrarModal("axisins001");
            }


            function f_but_marcar(thiss,SSEGURO){
            marcado = thiss.checked?1:0;
                var strURL="axis_axisctr018.do?operation=marcar_json&MARCAR="+marcado+"&SSEGURO="+SSEGURO;
                var ajaxTexto=objJsMessages.jslit_cargando;
                objAjax.invokeAsyncCGI_JSON(strURL, callbackselected, ajaxTexto)

            }


             function f_but_marcar_todo(marcar){
                var inputs=document.getElementsByTagName("input");
                for(i=0;i<inputs.length;i++) {
                    if (inputs[i].type=="checkbox") {
                        if (inputs[i].name.indexOf("checked_marcar_"==0)) {
                            if (marcar == 0)
                            inputs[i].checked = false;
                            else
                            inputs[i].checked = true;
                        }
                    }
                }
                var strURL="axis_axisctr018.do?operation=marcar_json&MARCAR="+marcar;
                var ajaxTexto=objJsMessages.jslit_cargando;
                objAjax.invokeAsyncCGI_JSON(strURL, callbackselected, ajaxTexto)
            }


            function callbackselected(p) {
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
                if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                    var cont = 0;
                    if (!objUtiles.estaVacio(p.JSON2.SPROCES))
                        document.miForm.SPROCES.value = p.JSON2.SPROCES;
                    else{
                        document.miForm.SPROCES.value = '';

                        if(!objUtiles.estaVacio(p.JSON2.emitir_reload) && p.JSON2.emitir_reload == "true"){
                            var TIPERROR = 2001;
                            var CERROR = p.JSON2["resultado"].MENSAJES[0].OB_IAX_MENSAJES.CERROR;
                            var TERROR = p.JSON2["resultado"].MENSAJES[0].OB_IAX_MENSAJES.TERROR;
                            
                            if(version_tomcat <= 6){
                            	objUtiles.ejecutarFormulario("axis_axisctr018.do?TIPERROR="+TIPERROR+"&CERROR="+CERROR+"&TERROR="+TERROR, "renovar", document.miForm, "_self", objJsMessages.jslit_cargando);
                            }else{
                            	objUtiles.ejecutarFormulario("axis_axisctr018.do?TIPERROR="+TIPERROR+"&CERROR="+CERROR+"&TERROR="+encodeURI(TERROR), "renovar", document.miForm, "_self", objJsMessages.jslit_cargando);
                            	}
                           	
                        }

                        var inputs=document.getElementsByTagName("input");
                        for(i=0;i<inputs.length;i++) {
                            if (inputs[i].type=="checkbox") {
                                if (inputs[i].checked && inputs[i].name.indexOf("checked_marcar_"==0)) {
                                    inputs[i].checked = false;
                                }
                            }
                        }
                   }
                }
            }


            function f_but_1000435(){
                var hayAlgunChecked = false;
                var inputs=document.getElementsByTagName("input");
                var iinputs=0;
                for (iinputs=0;iinputs<inputs.length;iinputs++) {
                    if (inputs[iinputs].id!=undefined && inputs[iinputs].id.indexOf("checked_marcar_")==0) {
                        if (inputs[iinputs].checked) {
                            hayAlgunChecked=true;
                            break;
                        }
                    }
                }
                if (hayAlgunChecked) {
                    var strURL="axis_axisctr018.do?operation=emitir_json&SPROCES="+ document.miForm.SPROCES.value;
                    var ajaxTexto=objJsMessages.jslit_cargando;
                    objAjax.invokeAsyncCGI_JSON(strURL, callbackselected, ajaxTexto)
                }else
                    alert(objJsMessages.jslit_selecciona_registro);
            }


            function f_but_9905355(){
                //Recuperar del valor del SPRODUC a la hora de emitir
                var hayAlgunChecked = objUtiles.f_GuardaCasillasChecked ("checked_poliza");
                if (!hayAlgunChecked) {
                    alert (objJsMessages.jslit_selecciona_producto);
                    return;
                } else {
                    objDom.setValorComponente(document.miForm.SSEGURO, objUtiles.utilSplit(hayAlgunChecked, "/")[0]);
                    objDom.setValorComponente(document.miForm.SPRODUC, objUtiles.utilSplit(hayAlgunChecked, "/")[1]);
                }

                var SSEGURO = document.miForm.SSEGURO;

                if (objUtiles.estaVacio (SSEGURO))
                    alert(objJsMessages.jslit_selecciona_una_poliza);
                else{
                    var strURL="axis_axisctr018.do?operation=compruebainspeccion_json&SSEGURO="+document.miForm.SSEGURO.value;
                    var ajaxTexto=objJsMessages.jslit_cargando;
                    objAjax.invokeAsyncCGI_JSON(strURL, callbackinspec, ajaxTexto)
                }
            }


            function callbackinspec(p) {
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
                if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                    if (p.JSON2.resultado.RETURN != 1){
                        var cont = 0;
                        objUtiles.ejecutarFormulario("axis_axisctr018.do", "modificar", document.miForm, "_self", objJsMessages.jslit_cargando);
                    }
                }
            }
            
            
            
            function f_axispsu016(sseguro,nversion,nmovimi){
            	
            	
            	
            	
            	
            	objUtiles.abrirModal("axispsu016", "src", "modal_axispsu016.do?operation=form&SSEGUROS="+sseguro+"&NVERSIONS="+nversion+
            			             "&NMOVIMIS="+nmovimi);
            	
            	
            } 
            
            function f_cerrar_axispsu016() {
                objUtiles.cerrarModal("axispsu016");
            } 
            
            
    		function f_axispsu015(sseguro,nversion,nmovimi){
       
            	objUtiles.abrirModal("axispsu015", "src", "modal_axispsu015.do?operation=form&SSEGUROS="+sseguro+"&NVERSIONS="+nversion+
            			             "&NMOVIMIS="+nmovimi);
  	
            } 
            
            function f_cerrar_axispsu015() {
                objUtiles.cerrarModal("axispsu015");
            } 
         
			            
			function f_axispsu017(sseguro,nversion,nmovimi){
				
			 
			    	objUtiles.abrirModal("axispsu017", "src", "modal_axispsu017.do?operation=form&SSEGUROS="+sseguro+"&NVERSIONS="+nversion+
			         			             "&NMOVIMIS="+nmovimi);            	
			 } 
            
            function f_cerrar_axispsu017() {
                objUtiles.cerrarModal("axispsu017");
            } 
            
            function f_axispsu018(sseguro,nversion,nmovimi){
		    	objUtiles.abrirModal("axispsu018", "src", "modal_axispsu018.do?operation=form&SSEGUROS="+sseguro+"&NVERSIONS="+nversion+
		         			             "&NMOVIMIS="+nmovimi);            	
			 } 
	        
	        function f_cerrar_axispsu018() {
	            objUtiles.cerrarModal("axispsu018");
	        } 
	        
	        function f_cargar_lstPsuControl(seguro,tmotret2,movimiento){
	        	
	        	
	        	 var SSEGURO = seguro;
	             var NMOVIMI = movimiento;
	             var NRIESGO = null;
	             var NVERSION = tmotret2;
	        	
	        	
	        	objAjax.invokeAsyncCGI("axis_axisctr018.do", callbackAjaxCargarControlSeg, "operation=psucontrolseg_ajax&SSEGURO="+SSEGURO+"&NMOVIMI="+NMOVIMI+"&NRIESGO="+NRIESGO+"&NVERSION="+NVERSION, this, objJsMessages.jslit_cargando);
	        
	        }
	        
	        
	        function callbackAjaxCargarControlSeg(ajaxResponseText) {
	            //alert(ajaxResponseText);
	             var doc = objAjax.domParse(ajaxResponseText);
	             
	             console.log("entro");
	             console.log(doc);
	             
	             objLista.borrarFilasDeLista ("lstPsuControl", "6", "<axis:alt f='axisctr018' c='ERR_REGS' lit='1000254' />");
	             
	             if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {	
	 	            		var tableM = document.getElementById("lstPsuControl");
	 	                    var tbodyM = tableM.getElementsByTagName("tbody")[0];
	 	                    var trM = tbodyM.getElementsByTagName("tr");
	 	                    
	 	                    
	 	                    for (var i = 0; i < objDom.numeroDeTags(doc, "OB_IAX_PSU") ; i++) {
	 	                    	
	 	                    	if(i==0) objLista.borrarFilaVacia(tbodyM, trM);

	                             //Obtenemos el estilo para la fila que insertaremos
	                             var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
	                             //Creamos una nueva fila vacia y le damos el estilo obtenido
	                             var newtr = objLista.crearNuevaFila(rowstyle);
	                             //Creamos un array de columnas a añadir a la nueva fila del displayTag
	                             var newtd = new Array(7);
	                       
	                             var tmotretCont1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TCONTROL")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCONTROL"), i, 0) : "");
	                             var tmotretCont2 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NVERSION")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NVERSION"), i, 0) : "");
	                             var tmotretCont3 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FAUTREC")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FAUTREC"), i, 0) : "");
	                             var tmotretCont4 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAUTREC")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAUTREC"), i, 0) : "");
	                             
	                             var riesgo = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TRIESGO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TRIESGO"), i, 0) : "");
	                             var garantia = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TGARANT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TGARANT"), i, 0) : "");
	                             
	                             var tmotretCont5 = riesgo+' - '+ garantia;
	                             var tmotretCont6 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("OBSERV")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("OBSERV"), i, 0) : "");
	                             var tmotretCont7 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNIVELR")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNIVELR"), i, 0) : "");
	                             
	                             
	                             var seguro = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("SSEGURO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("SSEGURO"), i, 0) : "");
	                             var movimiento = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NMOVIMI")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NMOVIMI"), i, 0) : "");
	                             var control = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CCONTROL")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCONTROL"), i, 0) : "");
	                            
	                             
	                             var tmotretCont8 = ('<img border="0"	src="images/informacion.gif" width="12px" height="12px" style="cursor: pointer;" onClick="javascript:f_axispsu016('+
	                             		seguro+','+tmotretCont2+','+movimiento+')" />');
	                             
	                             if(tmotretCont3 != "")
	                             	tmotretCont3 = objUtiles.formateaTimeStamp(tmotretCont3);
	                             
	         
	                             newtd[0] = objLista.addTextoEnLista(tmotretCont1);
	                             newtd[1] = objLista.addTextoEnLista(tmotretCont2);
	                             newtd[2] = objLista.addTextoEnLista(tmotretCont3);
	                             newtd[3] = objLista.addTextoEnLista(tmotretCont4);
	                             newtd[4] = objLista.addTextoEnLista(tmotretCont5);
	                             newtd[5] = objLista.addTextoEnLista(tmotretCont6);
	                             newtd[6] = objLista.addTextoEnLista(tmotretCont7);
	                             newtd[7] = objLista.addTextoEnLista(tmotretCont8);
	                             
	                             
	                             objLista.addNuevaFila(newtd, newtr, tbodyM);

	      
	 	                    }
	 	                
	             		
	             		 }	
	             
	             
	        }
         
            
            
        </script>
    </head>
    <body onload="f_onload()" ><!--  -->
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>

    <form name="miForm" action="axis_axisctr018.do" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata['SSEGURO']}"/>
        <input type="hidden" id="SSEGUROIMP" name="SSEGUROIMP" value="${__formdata.SSEGUROIMP}"/>
        <input type="hidden" name="CRETENI" id="CRETENI" value="${__formdata['CRETENI']}"/>
        <input type="hidden" name="SPRODUC" id="SPRODUC" value=""/> <!-- DEJAR VACIO -->
        <input type="hidden" name="FEFECTO" id="FEFECTO" value="${__formdata['FEFECTO']}"/>
        <input type="hidden" name="NMOVIMI" id="NMOVIMI" value="${__formdata['NMOVIMI']}"/>

        <input type="hidden" name="NRIESGO" id="NRIESGO" value="${__formdata['NRIESGO']}"/>
        <input type="hidden" name="NSUPLEM" id="NSUPLEM" value="${__formdata['NSUPLEM']}"/>
        <input type="hidden" name="CMOTMOV" id="CMOTMOV" value=""/>
        <input type="hidden" name="NPOLIZA" id="NPOLIZA" value="${__formdata['NPOLIZA']}"/>
        <input type="hidden" name="CEDIT" id="CEDIT" value="${__formdata['CEDIT']}"/>
        <input type="hidden" name="CMOTRET" id="CMOTRET" value="${__formdata['CMOTRET']}"/>
        <input type="hidden" name="MODO_EDICION" id="MODO_EDICION" value="${__formdata['MODO_EDICION']}"/>

        <input type="hidden" id="CESTPOL_PSU" name="CESTPOL_PSU" value="${__formdata.CESTPOL_PSU}"/>
        <input type="hidden" id="TESTPOL_PSU" name="TESTPOL_PSU" value="${__formdata.TESTPOL_PSU}"/>
        <input type="hidden" id="TNIVELBPM_PSU" name="TNIVELBPM_PSU" value="${__formdata.TNIVELBPM_PSU}"/>
        <input type="hidden" id="CNIVELBPM_PSU" name="CNIVELBPM_PSU" value="${__formdata.CNIVELBPM_PSU}"/>
        <input type="hidden" id="SPROCES" name="SPROCES" value="${__formdata.SPROCES}"/>
        <input type="hidden" id="permiteModificar" name="permiteModificar" value="${__formdata.permiteModificar}"/>
        <input type="hidden" id="REVISARINSPECCION" name="REVISARINSPECCION" value="${__formdata.REVISARINSPECCION}"/>

        <input type="hidden" id="TIPODATOS" name="TIPODATOS" value="${__formdata.TIPODATOS}"/>
		
		<input type="hidden" id="OBS" name="OBS" value="${__formdata.OBS}"/>
        

        <input type="hidden" id="CMATRIC" name="CMATRIC"/>
        <input type="hidden" id="CTIPMAT" name="CTIPMAT"/>
        <input type="hidden" name="GESTION_IR" id="GESTION_IR" value="${GESTION_IR}"/>
           <%-- <input type="hidden" name="NUM_FILA" id="NUM_FILA" value="${sessionScope.NUM_FILA}"/>--%>
            <!--input type="hidden" name="TOBSERVA" id="TOBSERVA" value=""/-->
            <input type="hidden" id="checked_mot" name="checked_mot"/>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr018" c="LIT_TIT_BUSC" lit="1000187" /></c:param>
                <c:param name="nid" value="axisctr017" />
            </c:import>

              <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr018" c="LIT_207" lit="1" /></c:param>
                <c:param name="nid" value="axisctr207" />
            </c:import>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"> </c:param>
                <c:param name="titulo"> </c:param>
                <c:param name="formulario"><axis:alt f="axisctr018" c="TITULO" lit="151234" /></c:param>
                <c:param name="titulo"><axis:alt f="axisctr018" c="TIT_SECUND" lit="151234" /></c:param>
                <c:param name="producto"></c:param>
                <c:param name="form">axisctr018</c:param>
            </c:import>
            <!-- Ventana modal axisctr022 emision -->
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr018" c="LIT_TIT_EMETRE" lit="1000190" /></c:param>
                <c:param name="nid" value="axisctr022" />
            </c:import>
               <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axispsu003|<axis:alt f="axisctr018" c="PSU003" lit="9002255" /></c:param>
            </c:import>

            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr018" c="PSU004" lit="9909207" /></c:param>
                <c:param name="nid" value="axispsu015" />
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr018" c="PSU005" lit="9909208" /></c:param>
                <c:param name="nid" value="axispsu016" />
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr018" c="PSU005" lit="9909208" /></c:param>
                <c:param name="nid" value="axispsu017" />
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr018" c="PSU005" lit="9909208" /></c:param>
                <c:param name="nid" value="axispsu018" />
            </c:import>

             <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisctr190|<axis:alt f="axisctr018" c="TIT_AXISCTR190" lit="9000547" /></c:param>
            </c:import>

            <!-- Ventana modal axisctr021 rechazar -->
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr018" c="LIT_TIT_RECHAZO" lit="1000189" /></c:param>
                <c:param name="nid" value="axisctr021" />
            </c:import>
            <!-- Ventana modal impresion -->
            <!-- Ventana modal axisctr021 rechazar -->
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr018" c="LIT_TIT_IMPRES" lit="1000205" /></c:param>
                <c:param name="nid" value="axisimprimir" />
            <c:param name="botonCerrar" value="true"/>
            </c:import>
            <!-- -->
            <!-- Ventana modal axisctr049 rechazar -->
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr018" c="LIT_TIT_COBRO" lit="9000604" /></c:param>
                <c:param name="nid" value="axisctr049" />
            </c:import>
            <!-- -->
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axis" c="INSPECCIONES" lit="9905244"/></c:param>
                <c:param name="nid" value="axisins001" />
        </c:import>
    <!-- Area de campos  -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <!-- Antes area de campos -->
            <div class="titulo" ><img src="images/flecha.gif"/><axis:alt f="axisctr018" c="LIT_DATPOL" lit="110853" /> <img border="0" src="images/find.gif" onclick="f_abrir_axisctr017()" style="cursor:pointer"/></div>
            <!-- DisplayTag Polizas -->
            <div class="seccion displayspaceGrande">
            <c:set var="title1"><axis:alt f="axisctr018" c="NPOLIZA" lit="151463" /></c:set>
            <c:set var="title2"><axis:alt f="axisctr018" c="FEFECTO" lit="101332" /></c:set>
            <c:set var="title3"><axis:alt f="axisctr018" c="FEMISIO" lit="101274" /></c:set>
            <c:set var="title4"><axis:alt f="axisctr018" c="NNUMIDE" lit="9000760" /></c:set>
            <c:set var="title5"><axis:alt f="axisctr018" c="TOMADOR" lit="101027" /></c:set>
            <c:set var="title6"><axis:alt f="axisctr018" c="TSITUAC" lit="100874" /></c:set>
            <c:set var="title7"><axis:alt f="axisctr018" c="TRETENI" lit="101714" /></c:set>
            <c:set var="title11"><axis:alt f="axisctr018" c="TMOTMOV" lit="1000591" /></c:set>
            <c:set var="title8"><axis:alt f="axisctr018" c="TROTULO" lit="100829" /></c:set>
            <c:set var="title9"><axis:alt f="axisctr018" c="NSOLICI" lit="109528" /></c:set>
            <c:set var="title10"><axis:alt f="axisctr018" c="USUARIO" lit="100894"/></c:set>   <%-- Usuario --%>
            <c:set var="title99"><axis:alt f="axisctr018" c="EMITIR" lit="1000435" /></c:set>
            <display:table name="${sessionScope.axisctr017_lista}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultsort="-1" defaultorder="ascending" requestURI="axis_axisctr018.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                    <%@ include file="../include/displaytag.jsp"%>
                    <axis:visible c="RADIO" f="axisctr018">
                        <display:column title="" sortable="false" headerClass=" sortable fixed"  media="html" autolink="false" >
                        <div class="dspIcons"><a name="${miListaId.OB_IAX_POLIZASRETEN['SSEGURO']}"/>
                        <input type="radio" id="checked_poliza" name="checked_poliza" <c:if test="${(empty __formdata.SSEGURO && sessionScope.SSEGURO_CONS == miListaId.OB_IAX_POLIZASRETEN.SSEGURO) || (!empty __formdata.SSEGURO && __formdata.SSEGURO == miListaId.OB_IAX_POLIZASRETEN['SSEGURO']) }"> checked </c:if> value="${miListaId.OB_IAX_POLIZASRETEN['SSEGURO']}/${miListaId.OB_IAX_POLIZASRETEN['SPRODUC']}" onclick="f_but_aceptar('${miListaId.OB_IAX_POLIZASRETEN['SSEGURO']}','${miListaId.OB_IAX_POLIZASRETEN['NSUPLEM']}','${miListaId.OB_IAX_POLIZASRETEN['NMOVIMI']}', '${miListaId.OB_IAX_POLIZASRETEN['SPRODUC']}', '${miListaId.OB_IAX_POLIZASRETEN['CEDIT']}' , '${miListaId.OB_IAX_POLIZASRETEN['CRETENI']}' , '${miListaId.OB_IAX_POLIZASRETEN['CSITUAC']}', '${miListaId.OB_IAX_POLIZASRETEN['CMOTMOV']}' )" />
                    </div>
                    </display:column>
                </axis:visible>

                <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.NPOLIZA" headerClass=" sortable fixed"  media="html" autolink="false" >
                    <div class="dspNumber">
                        <axis:visible f="axisctr018" c="TLINK"><a href="javascript:f_but_aceptar('${miListaId.OB_IAX_POLIZASRETEN['SSEGURO']}','${miListaId.OB_IAX_POLIZASRETEN['NSUPLEM']}','${miListaId.OB_IAX_POLIZASRETEN['NMOVIMI']}', '${miListaId.OB_IAX_POLIZASRETEN['SPRODUC']}',  '${miListaId.OB_IAX_POLIZASRETEN['CEDIT']}' , '${miListaId.OB_IAX_POLIZASRETEN['CRETENI']}', '${miListaId.OB_IAX_POLIZASRETEN['CSITUAC']}', '${miListaId.OB_IAX_POLIZASRETEN['CMOTMOV']}'   )"></axis:visible>
                            <fmt:formatNumber value="${miListaId.OB_IAX_POLIZASRETEN.NPOLIZA}" pattern="00000000" />
                        <axis:visible f="axisctr018" c="TLINK"></a></axis:visible>
                    </div>
                </display:column>

                <axis:ocultar f="axisctr018" c="NSOLICI" dejarHueco="false">
                <display:column title="${title9}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.NSOLICI" headerClass=" sortable fixed"  media="html" autolink="false" >
                    <div class="dspNumber">
                        <axis:visible f="axisctr018" c="TLINK"><a href="javascript:f_but_aceptar('${miListaId.OB_IAX_POLIZASRETEN['SSEGURO']}','${miListaId.OB_IAX_POLIZASRETEN['NSUPLEM']}','${miListaId.OB_IAX_POLIZASRETEN['NMOVIMI']}', '${miListaId.OB_IAX_POLIZASRETEN['SPRODUC']}',  '${miListaId.OB_IAX_POLIZASRETEN['CEDIT']}'  , '${miListaId.OB_IAX_POLIZASRETEN['CRETENI']}', '${miListaId.OB_IAX_POLIZASRETEN['CSITUAC']}', '${miListaId.OB_IAX_POLIZASRETEN['CMOTMOV']}'  )"></axis:visible>
                            <fmt:formatNumber value="${miListaId.OB_IAX_POLIZASRETEN.NSOLICI}" pattern="00000000" />
                        <axis:visible f="axisctr018" c="TLINK"></a></axis:visible>
                    </div>
                </display:column>
                </axis:ocultar>

                <display:column title="${title8}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.TROTULO" headerClass=" sortable fixed"  media="html" autolink="false" >
                    <div class="dspText">
                        <axis:visible f="axisctr018" c="TLINK"><a href="javascript:f_but_aceptar('${miListaId.OB_IAX_POLIZASRETEN['SSEGURO']}','${miListaId.OB_IAX_POLIZASRETEN['NSUPLEM']}','${miListaId.OB_IAX_POLIZASRETEN['NMOVIMI']}', '${miListaId.OB_IAX_POLIZASRETEN['SPRODUC']}', '${miListaId.OB_IAX_POLIZASRETEN['CEDIT']}'  , '${miListaId.OB_IAX_POLIZASRETEN['CRETENI']}', '${miListaId.OB_IAX_POLIZASRETEN['CSITUAC']}', '${miListaId.OB_IAX_POLIZASRETEN['CMOTMOV']}' )"></axis:visible>
                            ${miListaId.OB_IAX_POLIZASRETEN.TROTULO}
                        <axis:visible f="axisctr018" c="TLINK"></a></axis:visible>
                    </div>
                </display:column>

                <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.FEFECTO" headerClass=" sortable fixed"  media="html" autolink="false" >
                    <div class="dspText">
                        <axis:visible f="axisctr018" c="TLINK"><a href="javascript:f_but_aceptar('${miListaId.OB_IAX_POLIZASRETEN['SSEGURO']}','${miListaId.OB_IAX_POLIZASRETEN['NSUPLEM']}','${miListaId.OB_IAX_POLIZASRETEN['NMOVIMI']}', '${miListaId.OB_IAX_POLIZASRETEN['SPRODUC']}', '${miListaId.OB_IAX_POLIZASRETEN['CEDIT']}'  , '${miListaId.OB_IAX_POLIZASRETEN['CRETENI']}', '${miListaId.OB_IAX_POLIZASRETEN['CSITUAC']}, '${miListaId.OB_IAX_POLIZASRETEN['CMOTMOV']}'' )"></axis:visible>
                            <fmt:formatDate value="${miListaId.OB_IAX_POLIZASRETEN.FEFECTO}" pattern="dd/MM/yy" />
                        <axis:visible f="axisctr018" c="TLINK"></a></axis:visible>
                    </div>
                </display:column>

              <%--  <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.FEMISIO" headerClass=" sortable"  media="html" autolink="false" >
                <div class="dspText"><axis:visible f="axisctr018" c="TLINK"><a href="javascript:f_but_aceptar('${miListaId.OB_IAX_POLIZASRETEN['SSEGURO']}','${miListaId.OB_IAX_POLIZASRETEN['NSUPLEM']}','${miListaId.OB_IAX_POLIZASRETEN['NMOVIMI']}', '${miListaId.OB_IAX_POLIZASRETEN['SPRODUC']}')"></axis:visible><fmt:formatDate value="${miListaId.OB_IAX_POLIZASRETEN.FEMISIO}" pattern="dd/MM/yy" /><axis:visible f="axisctr018" c="TLINK"></a></axis:visible></div>
                </display:column>--%>

                <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.NNUMIDE" headerClass=" sortable fixed"  media="html" autolink="false" >
                    <div class="dspText">
                        <axis:visible f="axisctr018" c="TLINK"><a href="javascript:f_but_aceptar('${miListaId.OB_IAX_POLIZASRETEN['SSEGURO']}','${miListaId.OB_IAX_POLIZASRETEN['NSUPLEM']}','${miListaId.OB_IAX_POLIZASRETEN['NMOVIMI']}', '${miListaId.OB_IAX_POLIZASRETEN['SPRODUC']}','${miListaId.OB_IAX_POLIZASRETEN['CEDIT']}'  , '${miListaId.OB_IAX_POLIZASRETEN['CRETENI']}', '${miListaId.OB_IAX_POLIZASRETEN['CSITUAC']}', '${miListaId.OB_IAX_POLIZASRETEN['CMOTMOV']}' )"></axis:visible>
                            ${miListaId.OB_IAX_POLIZASRETEN.NNUMIDE}
                        <axis:visible f="axisctr018" c="TLINK"></a></axis:visible>
                    </div>
                </display:column>

                <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.TOMADOR" headerClass=" sortable fixed"  media="html" autolink="false" >
                    <div class="dspText">
                        <axis:visible f="axisctr018" c="TLINK"><a href="javascript:f_but_aceptar('${miListaId.OB_IAX_POLIZASRETEN['SSEGURO']}','${miListaId.OB_IAX_POLIZASRETEN['NSUPLEM']}','${miListaId.OB_IAX_POLIZASRETEN['NMOVIMI']}', '${miListaId.OB_IAX_POLIZASRETEN['SPRODUC']}', '${miListaId.OB_IAX_POLIZASRETEN['CEDIT']}' , '${miListaId.OB_IAX_POLIZASRETEN['CRETENI']}', '${miListaId.OB_IAX_POLIZASRETEN['CSITUAC']}', '${miListaId.OB_IAX_POLIZASRETEN['CMOTMOV']}'  )"></axis:visible>
                            ${miListaId.OB_IAX_POLIZASRETEN.TOMADOR}
                        <axis:visible f="axisctr018" c="TLINK"></a></axis:visible>
                    </div>
                </display:column>

                <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.TSITUAC" headerClass=" sortable fixed"  media="html" autolink="false" >
                    <div class="dspText">
                        <axis:visible f="axisctr018" c="TLINK"><a href="javascript:f_but_aceptar('${miListaId.OB_IAX_POLIZASRETEN['SSEGURO']}','${miListaId.OB_IAX_POLIZASRETEN['NSUPLEM']}','${miListaId.OB_IAX_POLIZASRETEN['NMOVIMI']}', '${miListaId.OB_IAX_POLIZASRETEN['SPRODUC']}','${miListaId.OB_IAX_POLIZASRETEN['CEDIT']}'   , '${miListaId.OB_IAX_POLIZASRETEN['CRETENI']}', '${miListaId.OB_IAX_POLIZASRETEN['CSITUAC']}' , '${miListaId.OB_IAX_POLIZASRETEN['CMOTMOV']}' )"></axis:visible>
                            ${miListaId.OB_IAX_POLIZASRETEN.TSITUAC}
                        <axis:visible f="axisctr018" c="TLINK"></a></axis:visible>
                    </div>
                </display:column>

                <axis:visible c="TRETENI" f="axisctr018">
                <display:column title="${title7}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.TRETENI" headerClass=" sortable fixed"  media="html" autolink="false" >
                    <div class="dspText">
                        <axis:visible f="axisctr018" c="TLINK"><a href="javascript:f_but_aceptar('${miListaId.OB_IAX_POLIZASRETEN['SSEGURO']}','${miListaId.OB_IAX_POLIZASRETEN['NSUPLEM']}','${miListaId.OB_IAX_POLIZASRETEN['NMOVIMI']}', '${miListaId.OB_IAX_POLIZASRETEN['SPRODUC']}','${miListaId.OB_IAX_POLIZASRETEN['CEDIT']}' , '${miListaId.OB_IAX_POLIZASRETEN['CRETENI']}' , '${miListaId.OB_IAX_POLIZASRETEN['CSITUAC']}' , '${miListaId.OB_IAX_POLIZASRETEN['CMOTMOV']}' )"></axis:visible>
                            ${miListaId.OB_IAX_POLIZASRETEN.TRETENI}
                        <axis:visible f="axisctr018" c="TLINK"></a></axis:visible>
                    </div>
                </display:column>
                </axis:visible>
                <axis:visible c="TMOTMOV" f="axisctr018">
                <display:column title="${title11}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.TMOTMOV" headerClass=" sortable fixed"  media="html" autolink="false" >
                    <div class="dspText">
                        <axis:visible f="axisctr018" c="TLINK"><a href="javascript:f_but_aceptar('${miListaId.OB_IAX_POLIZASRETEN['SSEGURO']}','${miListaId.OB_IAX_POLIZASRETEN['NSUPLEM']}','${miListaId.OB_IAX_POLIZASRETEN['NMOVIMI']}', '${miListaId.OB_IAX_POLIZASRETEN['SPRODUC']}','${miListaId.OB_IAX_POLIZASRETEN['CEDIT']}' , '${miListaId.OB_IAX_POLIZASRETEN['CRETENI']}' , '${miListaId.OB_IAX_POLIZASRETEN['CSITUAC']}' , '${miListaId.OB_IAX_POLIZASRETEN['CMOTMOV']}' )"></axis:visible>
                            ${miListaId.OB_IAX_POLIZASRETEN.TMOTMOV}
                        <axis:visible f="axisctr018" c="TLINK"></a></axis:visible>
                    </div>
                </display:column>
                </axis:visible>
              

                <axis:visible c="CUSUMOV" f="axisctr018">
                <display:column title="${title10}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.CUSUMOV" headerClass=" sortable fixed"  media="html" autolink="false" >
                    <div class="dspText">
                        <axis:visible f="axisctr018" c="TLINK"><a href="javascript:f_but_aceptar('${miListaId.OB_IAX_POLIZASRETEN['SSEGURO']}','${miListaId.OB_IAX_POLIZASRETEN['NSUPLEM']}','${miListaId.OB_IAX_POLIZASRETEN['NMOVIMI']}', '${miListaId.OB_IAX_POLIZASRETEN['SPRODUC']}','${miListaId.OB_IAX_POLIZASRETEN['CEDIT']}' , '${miListaId.OB_IAX_POLIZASRETEN['CRETENI']}' , '${miListaId.OB_IAX_POLIZASRETEN['CSITUAC']}' , '${miListaId.OB_IAX_POLIZASRETEN['CMOTMOV']}' )"></axis:visible>
                            ${miListaId.OB_IAX_POLIZASRETEN.CUSUMOV}
                        <axis:visible f="axisctr018" c="TLINK"></a></axis:visible>
                    </div>
                </display:column>
                </axis:visible>

                <axis:visible c="EMITIR" f="axisctr018">
                <display:column title="${title99}" sortable="false" headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >
                    <div class="dspIcons"><a name="${miListaId.OB_IAX_POLIZASRETEN['SSEGURO']}"/>
                      <input type="checkbox" id="checked_marcar_${miListaId.OB_IAX_POLIZASRETEN['SSEGURO']}" name="checked_marcar_${miListaId.OB_IAX_POLIZASRETEN['SSEGURO']}" <c:if test="${miListaId.OB_IAX_POLIZASRETEN['MARCAR'] == 1}"> checked </c:if>  value="" onclick="f_but_marcar(this,'${miListaId.OB_IAX_POLIZASRETEN['SSEGURO']}')" />
                    </div>
                </display:column>
                </axis:visible>
            </display:table>
            </div>
        <axis:visible c="SEL_TODOS" f="axisctr018">
            <table
                <tr>
                    <td align="right">
                        <div style="align:right">
                            <input type="button" class="boton" id="but_selec" value="<axis:alt f="axisctr207" c="BT_SELTODOS" lit="9000756"></axis:alt>" onclick="javascript:f_but_marcar_todo(1)" />
                            <input type="button" class="boton" id="but_dessel" value="<axis:alt f="axisctr207" c="BT_DESSELTODOS" lit="9000757"></axis:alt>" onclick="javascript:f_but_marcar_todo(0)" />
                        </div>
                    </td>
                </tr>
            </table>
        </axis:visible>

            <div class="separador">&nbsp;</div>

           <axis:visible c="DSP_PSU" f="axisctr018">
            <div id="gridPSU">

            <table class="area" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td>
                <div class="separador">&nbsp;</div>
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr018" c="DSP_PSU" lit="9002255" />
                  <span id="label_TESTPOL" class="titulocaja" style="color:black;font-weight:normal;padding-bottom:2px;.vertical-align:bottom">
                  &nbsp; ${__formdata.TESTPOL_PSU} ${__formdata.TNIVELBPM_PSU}  <c:if test="${!empty __formdata.POBPSU_RETENIDAS.TUSUAUT}">
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <axis:alt f="axisctr020" c="USU_AUT" lit="9902808" />&nbsp;&nbsp;
                  ${__formdata.POBPSU_RETENIDAS.TUSUAUT}&nbsp;&nbsp;&nbsp;
                  <axis:alt f="axisctr020" c="FECHA_AUT" lit="100562" />&nbsp;&nbsp;<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.POBPSU_RETENIDAS.FFECAUT}"/></c:if>
                  </span>
                </div>

                <div class="displayspace">
                           <c:set var="title0"><axis:alt f="axisctr018" c="TCONTROL" lit="9900975" /></c:set>
                         <c:set var="title1"><axis:alt f="axisctr018" c="FMOVIMI" lit="9900976" /></c:set>
                         <c:set var="title2"><axis:alt f="axisctr018" c="TAUTREC" lit="9900977" /></c:set>
                                                 <c:set var="title5"><axis:alt f="axisctr018" c="TRIESGO" lit="9906106" /></c:set>
                         <c:set var="title6"><axis:alt f="axisctr018" c="TNIVELR" lit="9900978" /></c:set>

                         <c:set var="title7"><axis:alt f="axisctr018" c="INFO" lit="1000113" /></c:set>
                        <c:set var="title8"><axis:alt f="axisctr018" c="CCRITICO" lit="9905109" /></c:set>


                         <display:table name="${sessionScope.PRETEN_T_IAX_PSU}" id="T_IAX_PSU" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                         requestURI="axis_axisctr018.do?paginar=true"> <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre está desplegada -->
                           <%@ include file="../include/displaytag.jsp"%>

                           <display:column title="${title0}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TCONTROL}</div>
                           </display:column>

                           <display:column title="${title1}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText"><fmt:formatDate value="${T_IAX_PSU.OB_IAX_PSU.FMOVIMI}" pattern="dd/MM/yyyy" /></div>
                           </display:column>

                           <axis:visible f="axisctr018" c="TAUTREC">
                           <display:column title="${title2}" sortable="true" sortProperty="" headerClass="fixed  sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TAUTREC}</div>
                           </display:column>
                           </axis:visible>

                           <%--display:column title="${title3}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.FAUTREC}</div>
                           </display:column>

                           <display:column title="${title4}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TUSUNOM}</div>
                           </display:column--%>

                           <display:column title="${title5}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TRIESGO}<c:if test="${!empty T_IAX_PSU.OB_IAX_PSU.CGARANT && T_IAX_PSU.OB_IAX_PSU.CGARANT!=0}"> - ${T_IAX_PSU.OB_IAX_PSU.TGARANT}</c:if></div>
                           </display:column>

                           <display:column title="${title6}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TNIVELR}</div>
                           </display:column>

                           <axis:visible f="axisctr018" c="CCRITICO">
                               <display:column title="${title8}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText" >
                                   <input type="checkbox"   id="CCRITICO" name="CCRITICO" <c:if test="${T_IAX_PSU.OB_IAX_PSU.CCRITICO == 1}">checked style="background-color: red;" </c:if> value="${T_IAX_PSU.OB_IAX_PSU.CCRITICO}"
                                   <axis:atr f="axisctr018" c="CCRITICO" a="modificable=false&obligatorio=false&isInputText=false"/> />
                                   </div>
                               </display:column>
                           </axis:visible>
                           <axis:visible f="axisctr018" c="DETALLE">
                           <display:column title="${title7}" headerClass="headwidth5 fixed sortable" media="html" autolink="false" >
                                <div class="dspIcons"><img border="0" alt="<axis:alt f="axisctr018" c="INFO" lit="1000113"/>" src="images/mas.gif" width="11px" height="11px"
                                style="vertical-align:middle;cursor:pointer;" onclick="f_abrir_axispsu003('${T_IAX_PSU.OB_IAX_PSU.SSEGURO}','${T_IAX_PSU.OB_IAX_PSU.NMOVIMI}','${T_IAX_PSU.OB_IAX_PSU.NRIESGO}','${T_IAX_PSU.OB_IAX_PSU.CCONTROL}','${T_IAX_PSU.OB_IAX_PSU.CAREA}','${T_IAX_PSU.OB_IAX_PSU.CGARANT}')" title="<axis:alt f='axisctr018' c='INFO' lit='1000113'/>"/>
                                </div>
                           </display:column>
                           </axis:visible>
                        </display:table>
                    </div>
                    <div class="separador" style="align:right">&nbsp;</div>
                </td>
               </tr>
              </table>
             </div>
                        <input type="hidden" name="TOBSERVA" id="TOBSERVA" value="${__formdata.TOBSERVA}" class="campo campotexto"/>
             </axis:visible>
        <div class="separador">&nbsp;</div>
        <axis:visible c="DSP_PSU" f="axisctr018">
                <div id="gridPSU_OBSERV">
                <table class="area" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr018" c="DSP_PSU" lit="9905842" />
                      <span id="label_TESTPOL" class="titulocaja" style="color:black;font-weight:normal;padding-bottom:2px;.vertical-align:bottom">
                      </span>
                    </div>
                     <div class="displayspace">
                         <c:set var="title0"><axis:alt f="axisctr018" c="FFECAUT" lit="9905838" /></c:set>
                         <c:set var="title1"><axis:alt f="axisctr018" c="TUSUAUT" lit="100894" /></c:set>
                         <c:set var="title2"><axis:alt f="axisctr018" c="TMOTRET" lit="100587" /></c:set>
                         <c:set var="title5"><axis:alt f="axisctr018" c="OBSERV" lit="101162" /></c:set>

                             <display:table name="${__formdata.LST_POBPSU_RETENIDAS}" id="LST_POBPSU_RETENIDAS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                             requestURI="axis_axisctr018.do?paginar=true" >
                               <%@ include file="../include/displaytag.jsp"%>

                               <display:column title="${title0}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText"><fmt:formatDate value="${LST_POBPSU_RETENIDAS.FFECAUT}" pattern="dd/MM/yyyy" /></div>
                               </display:column>

                               <display:column title="${title1}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${LST_POBPSU_RETENIDAS.TUSUAUT}</div>
                               </display:column>

                               <display:column title="${title2}" sortable="false" sortProperty="" headerClass="fixed  sortable"  media="html" autolink="false">
                                   <div class="dspText">${LST_POBPSU_RETENIDAS.TMOTRET}</div>
                               </display:column>

                               <display:column title="${title5}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" style="width : 500px;">
                                   <div class="dspText">${LST_POBPSU_RETENIDAS.OBSERV}</div>
                               </display:column>

                            </display:table>
                        </div>
                        <div class="separador" style="align:right">&nbsp;</div>
                    </td>
                   </tr>
                </table>
            </div>
        </axis:visible>
        
 <axis:visible f="${pantalla}" c="DSP_PSU_RETENIDAS_HIST">
<div id="gridPSU_OBSERV">
<table class="area" align="center" cellpadding="0" cellspacing="0">

	<tr>
		<td class="campocaja"><img id="DSP_PSU_RETENIDAS_HIST_parent"
			src="images/mes.gif"
			onclick="objEstilos.toggleDisplay('DSP_PSU_RETENIDAS_HIST', this)"
			style="cursor: pointer" /> <b><axis:alt f="${pantalla}"
					c="DSP_PSU_RETENIDAS_HIST " lit="9903021" /></b>
			<hr class="titulo"></hr></td>
	</tr>
	<tr id="DSP_PSU_RETENIDAS_HIST_children" style="display: none">
	
	<c:set var="title14">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="9909285" />
	</c:set>
	<c:set var="title15">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="9909286" />
	</c:set>
	<c:set var="title16">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="100894" />
	</c:set>
	<c:set var="title17">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="100587" />
	</c:set>
	<c:set var="title18">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="9909287" />
	</c:set>
	<c:set var="title19">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="101162" />
	</c:set>
	<c:set var="title20">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="1000113" />
	</c:set>
	

		<td class="campocaja"><display:table
				name="${__formdata.P_TPSU_RETEN_HIST}" id="lstPsuRetenidas"
				export="false" class="dsptgtable" pagesize="-1" sort="list"
				cellpadding="0" cellspacing="0"
				requestURI="axis_axisctr020.do?paginar=true" style="width:100%">
				<%@ include file="../include/displaytag.jsp"%>

					<display:column title="" sortable="true"
						sortProperty="CMOVIMI" headerClass="sortable" media="html"
						autolink="false" style="white-space:nowrap; width:15px">
						<input
							onClick=""
							value="" type="radio" id="radioNMOVIMI"
							name="radioNMOVIMI" />

					</display:column>
				

				
					<display:column title="${title14}" sortable="true"
						sortProperty="CMOVIMI" headerClass="sortable" media="html"
						autolink="false" style="white-space:nowrap; width:15px">
						<div class="dspText"><fmt:formatDate value="" pattern="dd/MM/yyyy" /></div>
						
					</display:column>
				

				
					<display:column title="${title15}" sortable="true"
						sortProperty="CMOVIMI" headerClass="sortable" media="html"
						autolink="false" style="white-space:nowrap; width:15px">
						<div class="dspText"></div>
					</display:column>
				

				
					<display:column title="${title16}" sortable="true"
						sortProperty="CMOVIMI" headerClass="sortable" media="html"
						autolink="false" style="white-space:nowrap; width:15px">
						<div class="dspText"></div>
					</display:column>
				

				
					<display:column title="${title17}" sortable="true"
						sortProperty="CMOVIMI" headerClass="sortable" media="html"
						autolink="false" style="white-space:nowrap; width:15px">
						<div class="dspText"></div>
					</display:column>
				
					<display:column title="" sortable="true" sortProperty=""
						headerClass="sortable" media="html" autolink="false" style="white-space:nowrap; width:15px">
						
						<div class="dspIcons">
						
						</div>
						
					</display:column>
				
				
				
				
					<display:column title="${title19}" sortable="true"
						sortProperty="CMOVIMI" headerClass="sortable" media="html"
						autolink="false" style="white-space:nowrap; width:15px">
						<div class="dspText"></div>
					</display:column>
					
					
					<display:column title="" sortable="true" sortProperty=""
						headerClass="sortable" media="html" autolink="false" style="white-space:nowrap; width:15px">
						
						<div class="dspIcons">
							
						</div>
						
					</display:column>
				
				

				    <display:column title="${title20}" sortable="true" sortProperty=""
						headerClass="sortable" media="html" autolink="false" style="white-space:nowrap; width:15px">
						<div class="dspIcons">
							
						</div>
					</display:column>
				

			</display:table></td>
	</tr>
</table>	
	</div>
</axis:visible>

<axis:visible f="${pantalla}" c="DSP_PSUCONTROLSEG_HIST">


<c:set var="title24">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="9900975" />
	</c:set>
	<c:set var="title25">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="9909286" />
	</c:set>
	<c:set var="title26">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="9900976" />
	</c:set>
	<c:set var="title27">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="100587" />
	</c:set>

	<c:set var="title29">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="9906106" />
	</c:set>
	<c:set var="title30">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="101162" />
	</c:set>
	<c:set var="title31">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="9900978" />
	</c:set>
	<c:set var="title32">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="1000113" />
	</c:set>





<div id="gridPSU_OBSERV">

<table class="area" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td class="campocaja"><img id="DSP_PSUCONTROLSEG_HIST_parent"
			src="images/mes.gif"
			onclick="objEstilos.toggleDisplay('DSP_PSUCONTROLSEG_HIST', this)"
			style="cursor: pointer" /> <b><axis:alt f="${pantalla}"
					c="DSP_PSUCONTROLSEG_HIST" lit="9904548" /></b>
			<hr class="titulo"></hr></td>
	</tr>
	<tr id="DSP_PSUCONTROLSEG_HIST_children" style="display: none">


		<td class="campocaja">
		<display:table
				name="${__formdata.P_TPSUCONTRSEG_HIST}" id="lstPsuControl"
				export="false" class="dsptgtable" pagesize="-1" sort="list"
				cellpadding="0" cellspacing="0"
				requestURI="axis_axisctr020.do?paginar=true" style="width:100%">
				<%@ include file="../include/displaytag.jsp"%>

				
				    <display:column title="${title24}" sortable="true"
						sortProperty="CMOVIMI" headerClass="sortable" media="html"
						autolink="false" style="white-space:nowrap; width:15px">
						<div class="dspText">${lstPsuControl.OB_IAX_PSU.TCONTROL}</div>
					</display:column>
				
					<display:column title="${title25}" sortable="true"
						sortProperty="CMOVIMI" headerClass="sortable" media="html"
						autolink="false" style="white-space:nowrap; width:15px">
						<div class="dspText">${lstPsuControl.OB_IAX_PSU.NVERSION}</div>
					</display:column>
							
					<display:column title="${title26}" sortable="true"
						sortProperty="CMOVIMI" headerClass="sortable" media="html"
						autolink="false" style="white-space:nowrap; width:15px">
						<div class="dspText"><fmt:formatDate value="${lstPsuControl.OB_IAX_PSU.FAUTREC}" pattern="dd/MM/yyyy" /></div>
					</display:column>
					
					<display:column title="${title27}" sortable="true"
						sortProperty="CMOVIMI" headerClass="sortable" media="html"
						autolink="false" style="white-space:nowrap; width:15px">
						<div class="dspText">${lstPsuControl.OB_IAX_PSU.TAUTREC}</div>
					</display:column>
					
					
					<display:column title="${title29}" sortable="true"
						sortProperty="CMOVIMI" headerClass="sortable" media="html"
						autolink="false" style="white-space:nowrap; width:15px">
						<div class="dspText">${lstPsuControl.OB_IAX_PSU.TRIESGO} "-" ${lstPsuControl.OB_IAX_PSU.TGARANT} </div>
					</display:column>
					
					<display:column title="${title30}" sortable="true"
						sortProperty="CMOVIMI" headerClass="sortable" media="html"
						autolink="false" style="white-space:nowrap; width:15px">
						<div class="dspText">${lstPsuControl.OB_IAX_PSU.OBSERV}</div>
					</display:column>
					
					<display:column title="${title31}" sortable="true"
						sortProperty="CMOVIMI" headerClass="sortable" media="html"
						autolink="false" style="white-space:nowrap; width:15px">
						<div class="dspText">${lstPsuControl.OB_IAX_PSU.TNIVELR}</div>
					</display:column>
					
				
					<display:column title="${title32}" sortable="true" sortProperty=""
						headerClass="sortable" media="html" autolink="false" style="white-space:nowrap; width:15px">
						<div class="dspIcons">
							<img border="0"
								src="images/informacion.gif" width="12px" height="12px"
								style="cursor: pointer;"
								onClick="javascript:f_axispsu016('${lstPsuControl.OB_IAX_PSU.SSEGURO}','${lstPsuControl.OB_IAX_PSU.NVERSION}',
								'${lstPsuControl.OB_IAX_PSU.NMOVIMI}','${lstPsuControl.OB_IAX_PSU.CCONTROL}')" />
						</div>
					</display:column>
				

			</display:table></td>
	</tr>
	
</table>	
</div>
</axis:visible>
        
        <div class="separador">&nbsp;</div>
		<div id="gridMRET">
              <!-- Seccion lista Movimientos pantalla Axisctr018 -->
            <!-- Form  -->
            <!-- Area campos seccion -->
            <axis:visible c="DSP_MVTRETEN" f="axisctr018">
            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr018" c="LIT_MOTRET" lit="152427" /></div>
            <!-- DisplayTag Polizas -->
            <div class="seccion displayspace">
                <c:set var="title1"><axis:alt f="axisctr018" c="TMOTRET" lit="102577" /></c:set>
                <c:set var="title2"><axis:alt f="axisctr018" c="TESTGEST" lit="9002157" /></c:set>
                <c:set var="title3"><axis:alt f="axisctr018" c="CUSURET" lit="101714" /> <axis:alt f="axisctr018" c="LIT_USUARI" lit="100894" /></c:set>
                <c:set var="title4"><axis:alt f="axisctr018" c="FRETEN" lit="100562" /></c:set>
                <c:set var="title5"><axis:alt f="axisctr018" c="CUSUAUTO" lit="105400" /> <axis:alt f="axisctr018" c="LIT_USUARI" lit="100894" /></c:set>
                <c:set var="title6"><axis:alt f="axisctr018" c="FUSUAUTO" lit="100562" /></c:set>
                    <display:table name="${polmvtreten}" id="miListaId2" export="false" class="dsptgtable" pagesize="-1" defaultsort="-1" defaultorder="ascending" requestURI="axis_axisctr018.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                        <%@ include file="../include/displaytag.jsp"%>
                        <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                        <div class="dspIcons">
                            <input type="radio" id="checked_motivo" name="checked_motivo" onclick="f_cargar_observacion('0')" />
                        </div>
                        </display:column>
                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_POLMVTRETEN.TMOTRET" headerClass="sortable"  media="html" autolink="false" style="width:25%">
                        ${miListaId2.OB_IAX_POLMVTRETEN.TMOTRET}
                        </display:column>
                        <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_POLMVTRETEN.TESTGEST" headerClass="sortable"  media="html" autolink="false" style="width:15%">
                        ${miListaId2.OB_IAX_POLMVTRETEN.TESTGEST}
                        </display:column>
                        <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_POLMVTRETEN.CUSURET" headerClass="sortable"  media="html" autolink="false"  style="width:20%">
                        ${miListaId2.OB_IAX_POLMVTRETEN.CUSURET}
                        </display:column>
                        <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_POLMVTRETEN.FRETEN" headerClass="sortable"  media="html" autolink="false"  style="width:10%">
                        <fmt:formatDate value="${miListaId2.OB_IAX_POLMVTRETEN.FRETEN}" pattern="dd/MM/yy" />
                        </display:column>
                        <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_POLMVTRETEN.CUSUAUTO" headerClass="sortable"  media="html" autolink="false"  style="width:20%">
                        ${miListaId2.OB_IAX_POLMVTRETEN.CUSUAUTO}
                        </display:column>
                        <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_POLMVTRETEN.FUSUAUTO" headerClass="sortable"  media="html" autolink="false"  style="width:10%">
                        <fmt:formatDate value="${miListaId2.OB_IAX_POLMVTRETEN.FUSUAUTO}" pattern="dd/MM/yy" />
                        </display:column>
                    </display:table>
            </div>
            <table class="seccion">
                <tr>
                     <td class="titulocaja">
                     <b><axis:alt f="axisctr018" c="TOBSERVA" lit="101162" /> </b>
                    </td>
                </tr>
                    <td id="textarea_observaciones">
                        <textarea name="TOBSERVA" id="TOBSERVA" style="visibility:visible; display:block" readonly rows="6" cols="50" class="campo campotexto"></textarea>
                    </td>
                </tr>
            </table>
            </axis:visible>
            </div>

       <div class="separador">&nbsp;</div>

<%--------------------Inspección de riesgo-------------------------%>
    <axis:visible f="axisctr018" c="DSP_INSPECCION_RIESGO">
        <div id="gridInspeccionRiesgo">
                <table class="area" align="center" cellpadding="0" cellspacing="0" >
                    <tr>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                    </tr>
                    <tr>
						<td colspan="4">
						<div class="separador" style="align:right">&nbsp;</div>
						<div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr018" c="DSP_INSPECCION_RIESGO" lit="9905241" />
							<img id="find" border="0" src="images/find.gif" onclick="javascript:f_consultar_inspecciones();" style="cursor:pointer" align="right"/>
						</div>
						</td>
					</tr>

                    <tr>
						<td class="titulocaja">
							<b><axis:alt f="axisctr018" c="CINSPREQ" lit="9905242"/></b>
						</td>
						<td class="titulocaja">
							<b><axis:alt f="axisctr018" c="CRESULTR" lit="9905243"/></b>
                       </td>
					</tr>
                    <tr>
                       <td class="campocaja">
						<axis:ocultar c="CINSPREQ" f="axisctr018" dejarHueco="false">
                        <select name = "CINSPREQ" id ="CINSPREQ" class="campowidthselect campo"
                        <axis:atr f="axisctr018" c="CINSPREQ" a="modificable=false&isInputText=false&obligatorio=true"/> title="<axis:alt f="axisctr018" c="CINSPREQ" lit="9905242"/>">
                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr018" c="SNV_COMBO" lit="108341" /> - </option>
                                <c:choose>
                                    <c:when test="${empty __formdata.listvalores.lstInspec1}">
                                        <c:forEach items="${sessionScope.listvalores.lstInspec1}" var="item">
                                            <option value = "${item.CATRIBU}" >${item.TATRIBU}</option>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${__formdata.listvalores.lstInspec1}" var="item">
                                            <option value = "${item.CATRIBU}" >${item.TATRIBU}</option>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                        </select>
                    </axis:ocultar>
                    </td>
					<td class="campocaja">
                     <axis:ocultar c="CRESULTR" f="axisctr018" dejarHueco="false">
                        <select name = "CRESULTR" id ="CRESULTR" class="campowidthselect campo"
                        <axis:atr f="axisctr018" c="CRESULTR" a="modificable=false&isInputText=false&obligatorio=true"/> title="<axis:alt f="axisctr018" c="CRESULTR" lit="9905243"/>">
                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr018" c="SNV_COMBO" lit="108341" /> - </option>
                                 <c:choose>
                                    <c:when test="${empty __formdata.listvalores.lstInspec2}">
                                        <c:forEach items="${sessionScope.listvalores.lstInspec2}" var="item">
                                            <option value = "${item.CATRIBU}" >${item.TATRIBU}</option>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${__formdata.listvalores.lstInspec2}" var="item">
                                            <option value = "${item.CATRIBU}" >${item.TATRIBU}</option>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                        </select>
                    </axis:ocultar>
                    </td>
                  </tr>
                </table>

                <div class="separador" style="align:right">&nbsp;</div>
                <table class="area" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr018" c="DSP_INSPECCION_RIESGO" lit="9905244" />
                    </div>
                     <div class="displayspace">
                            <c:set var="title0"><axis:alt f="axisctr018" c="CNORDEN" lit="9905245" /></c:set>
                            <c:set var="title1"><axis:alt f="axisctr018" c="CNINSPECCION" lit="9905246" /></c:set>
                            <c:set var="title2"><axis:alt f="axisctr018" c="FSOLICITUD" lit="9905247" /></c:set>
                            <c:set var="title3"><axis:alt f="axisctr018" c="TESTADOORDEN" lit="9905248" /></c:set>
                            <c:set var="title4"><axis:alt f="axisctr018" c="TCLASE" lit="9905249" /></c:set>
                            <c:set var="title5"><axis:alt f="axisctr018" c="FVTOORDEN" lit="9905250" /></c:set>
                            <c:set var="title6"><axis:alt f="axisctr018" c="FINSPECCION" lit="9905251" /></c:set>
                            <c:set var="title7"><axis:alt f="axisctr018" c="TESTADOINSPECCION" lit="9905252" /></c:set>
                            <c:set var="title8"><axis:alt f="${pantalla}" c="MES" lit="1000113" /></c:set>

                             <display:table name="${INSPECCION_RIESGO}" id="INSPECCION_RIESGO" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                             requestURI="axis_axisctr018.do?paginar=true"> <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre está desplegada -->
                               <%@ include file="../include/displaytag.jsp"%>

                               <display:column title="${title0}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${INSPECCION_RIESGO.SORDEN}</div>
                               </display:column>

                               <display:column title="${title1}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${INSPECCION_RIESGO.NINSPECCION}</div>
                               </display:column>

                               <display:column title="${title2}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspDate"><fmt:formatDate value="${INSPECCION_RIESGO.FSOLICITUD}" pattern="dd/MM/yyyy"/></div>
                               </display:column>

                               <display:column title="${title3}" sortable="false" sortProperty="" headerClass="fixed  sortable"  media="html" autolink="false" >
                                   <div class="dspText">${INSPECCION_RIESGO.TESTADOORDEN}</div>
                               </display:column>

                               <display:column title="${title4}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${INSPECCION_RIESGO.TCLASE}</div>
                               </display:column>

                               <display:column title="${title5}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspDate"><fmt:formatDate value="${INSPECCION_RIESGO.FVTORDEN}" pattern="dd/MM/yyyy"/></div>
                               </display:column>

                               <display:column title="${title6}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspDate"><fmt:formatDate value="${INSPECCION_RIESGO.FINSPECCION}" pattern="dd/MM/yyyy"/></div>
                               </display:column>

                               <display:column title="${title7}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${INSPECCION_RIESGO.TESTADOINSPECCION}</div>
                               </display:column>

                               <display:column title="${title8}" headerClass="headwidth5 fixed sortable" media="html" autolink="false" >
                                    <c:if test="${!empty INSPECCION_RIESGO.NINSPECCION}" >
                                        <div class="dspIcons"><img border="0" alt="<axis:alt f="axisctr018" c="INFO" lit="1000113"/>" src="images/mas.gif" width="11px" height="11px"
                                        style="vertical-align:middle;cursor:pointer;"  title="<axis:alt f='axisctr018' c='INFO' lit='1000113'/>"/>
                                        </div>
                                    </c:if>
                               </display:column>
                           </display:table>
                        </div>
                        <div class="separador" style="align:right">&nbsp;</div>
                    </td>
                   </tr>
                  </table>
                 </div>
        <div class="separador">&nbsp;
        </div>
    </axis:visible>

	<%---------------------Fi Inspección de riesgo -------------------------%>
        </td>
    </tr>
    </table>  <!-- Table area campos --> <!-- Ahora incluye a los dos forms -->

    <c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axisctr018</c:param>
        <c:param name="__botones">
            salir<c:if test="${!empty sessionScope.axisctr017_lista}"><axis:visible f="axisctr018" c="BT_ANULAR" >,anular</axis:visible><c:if test="${__formdata.FACT_ELECTRONICA==0}"><axis:visible f="axisctr018" c="BT_EMITIR" >,emitir</axis:visible></c:if><axis:visible f="axisctr018" c="BT_CONSULTAR" >,consultar</axis:visible><axis:visible f="axisctr018" c="BT_DUPLICAR" >,9903980</axis:visible><axis:visible f="axisctr018" c="BT_EDITAR" >,editar</axis:visible><axis:visible f="axisctr018" c="BT_EMIT_MASIVA" >,1000435</axis:visible><axis:visible f="axisctr018" c="BT_REVINSPEC" >,9905355</axis:visible><axis:visible c="BT_INSPECRISC" f="axisctr018">,9905410</axis:visible></c:if>
        </c:param>
    </c:import>

    </form>

    <c:import url="../include/mensajes.jsp" />
    </body>
</html>

