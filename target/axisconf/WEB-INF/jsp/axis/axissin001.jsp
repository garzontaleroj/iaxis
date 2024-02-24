<%/**
*  Fichero: axissin001.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavier Gallego</a>
*  
*  Pantalla principal de 'Alta Siniestro'
*
*  Fecha: 26/10/2007
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><fmt:message key="109808"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
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
            function f_onload(){
                // Si se ha entrado por segunda vez no mostrar el alert
                if (objUtiles.estaVacio(objDom.getValorPorId("NPOLIZA"))){
                    f_abrir_axisctr019();
                    f_estado_botones(true);
                }else
                   f_estado_botones(false);
                
            }
            
            function f_estado_botones(bul){
                //Cambiamos estado botonera prametrizable en función de si tenemos SSEGURO O NO
                document.miForm.but_consultar_siniestros.disabled=bul;
                document.miForm.but_151477.disabled=bul;
                document.miForm.but_100009.disabled=bul;
            }

            // Funciones del Modal            
           function f_abrir_axissin004() {
               objUtiles.abrirModal("axissin004", "src", "modal_axissin004.do?operation=form&SSEGURO=" + document.miForm.SSEGURO.value);
           }
           
           function f_cerrar_axissin004() {
               objUtiles.cerrarModal("axissin004");
           }
            
            function f_abrir_axisctr019() {
               objUtiles.abrirModal("axisctr019","src","modal_axisctr019.do?operation=form&tipo=SINIS");               
            }
            
            function f_cerrar_axisctr019(){
                objUtiles.cerrarModal("axisctr019");
            }
            
            function f_aceptar_axisctr019(SSEGURO){
                objDom.setValorPorId("SSEGURO", SSEGURO);

                f_cerrar_axisctr019();
                objDom.setValorPorId("LIMPIAR_DATOS", "true");
                            
                objUtiles.ejecutarFormulario("axis_axissin001.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
                
            }
            
            function f_aceptar_axissin002(NSINIES, SSEGURO) {
               f_cerrar_axissin002();
               objDom.setValorPorId("NSINIES", NSINIES);
               objDom.setValorPorId("SSEGURO", SSEGURO);
               // Salto a flujo consulta de siniestros
               objUtiles.f_GuardaCasillasChecked("selectedDocu", "selectedDocumentacion");
               objUtiles.f_GuardaCasillasChecked("radioGarant", "selectedGarantias");
               objUtiles.ejecutarFormulario ("axis_axissin001.do", "consultarSiniestros", document.miForm, "_self", objJsMessages.jslit_cargando);     
            }
            
            function f_cerrar_axissin002() {
                objUtiles.cerrarModal("axissin002");
            }
            
            // Fin Funciones del Modal
            
            function f_but_siguiente() {
                f_abrir_axisctr019();
            }
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
            }
            
            function f_guardar_seleccionadas(idCheck, idHiddenList){
                //Comprobamos valores seleccionados de DisplayTags
                var selectedX = null;
                if(objUtiles.f_GuardaCasillasChecked(idCheck, idHiddenList))
                    selectedX = objDom.getValorPorId(idHiddenList);
                return selectedX;
            }
            
            function f_but_100009(){
                if(objValidador.validaEntrada()){
                    //Comprobamos valores seleccionados de DisplayTag GARANTIAS
                    var selectedGarantias = f_guardar_seleccionadas("radioGarant", "selectedGarantias");
                    //Comprobamos valores seleccionados de DisplayTag DOCUMENTACION
                    var selectedDocumentacion = f_guardar_seleccionadas("selectedDocu", "selectedDocumentacion");
                    objAjax.invokeAsyncCGI("axis_axissin001.do", callbackajaxaceptar, "operation=aceptar_siniestro" + "&SSEGURO="+objDom.getValorPorId("SSEGURO")+
                                            "&NRIESGO="+objDom.getValorPorId("SRIESGO")+"&FSINIES="+objDom.getValorPorId("FSINIES")+"&HSINIES="+objDom.getValorPorId("HSINIES")+"&FNOTIFI="+objDom.getValorPorId("FNOTIFI")+"&CTRAMI="+objDom.getValorPorId("PCTRAMI")+
                                            "&CMOTSIN="+objDom.getValorPorId("motivos")+"&CCAUSIN="+objDom.getValorPorId("causas")+"&CCULPAB="+objDom.getValorPorId("responsabilidad")+"&TZONAOCU="+objDom.getValorPorId("TZONAOCU")+
                                            "&TSINIES="+objDom.getValorPorId("TSINIES")+"&SELECTEDGARANTIAS="+selectedGarantias+"&SELECTEDDOCUMENTACION="+selectedDocumentacion, this, objJsMessages.jslit_cargando);
                }
            }
            
            function callbackajaxaceptar(ajaxResponseText) {
                var doc=objAjax.domParse(ajaxResponseText);
                //alert(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_OK")[0])){
                        //alert(objJsMessages.jslit_operacion_ok+" "+objJsMessages.jslit_numero_siniestro+" "+doc.getElementsByTagName("OPERACION_AJAX_OK")[0].childNodes[0].nodeValue);
                        //Guardamos el número de siniestro
                        objDom.setValorPorId("NSINIES", doc.getElementsByTagName("OPERACION_AJAX_OK")[0].childNodes[0].nodeValue);
                        //Ahora todos los botones estan activos
                        document.miForm.but_consultar_siniestros.disabled=false;
                        document.miForm.but_151477.disabled=false; 
                        document.miForm.but_100009.disabled=true;
                    }
                }
            }  
            
            function f_but_151477() {
            // Salto a flujo consulta de pólizas
                objUtiles.f_GuardaCasillasChecked("selectedDocu", "selectedDocumentacion");
                objUtiles.f_GuardaCasillasChecked("radioGarant", "selectedGarantias");
                objUtiles.ejecutarFormulario("axis_axissin001.do", "consultarPoliza", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            
            function f_but_consultar_siniestros() {
                objUtiles.abrirModal("axissin002","src","modal_axissin002.do?operation=form&MODO=APERTURASINIESTROS&NPOLIZA=" + objDom.getValorPorId("NPOLIZA") + "&NCERTIF=" + objDom.getValorPorId("NCERTIF"));
            } 
            
            function f_seleccionar_riesgo(obj, valor){
                if(objDom.getComponenteMarcado(obj))
                    objDom.setValorPorId("SRIESGO", valor);
                else objDom.setValorPorId("SRIESGO", "");
            }
            
            function f_carga_garantias(obj){
                if (objUtiles.estaVacio(objDom.getValorComponente(obj))){
                    alert(objJsMessages.jslit_fsinie_vacio);
                    return;
                }
                //Buscar riesgo seleccionado
                var tableM = document.getElementById("miListaId2");
                var tbodyM = tableM.getElementsByTagName("tbody")[0];
                var trM = tbodyM.getElementsByTagName("tr");
                
                if(!objLista.listaVacia(trM)){
                    var riesgo = objDom.getValorPorId("SRIESGO");
                    if(objUtiles.estaVacio(riesgo)){
                        alert(objJsMessages.jslit_selecciona_riesgo);
                        objDom.setValorComponente(obj, "");
                    }else
                        //objUtiles.ejecutarFormulario("axis_axissin001.do", "cambiar_fecha_siniestro", document.miForm, "_self", objJsMessages.jslit_cargando);
                        objAjax.invokeAsyncCGI("axis_axissin001.do", callbackajaxcambiarfechasiniestro, "operation=cambiar_fecha_siniestro&SSEGURO=" + objDom.getValorPorId("SSEGURO") +"&SRIESGO=" + riesgo +"&FSINIES=" + objDom.getValorComponente(obj), this, objJsMessages.jslit_cargando);
                }else{
                    alert(objJsMessages.jslit_no_riesgos);
                    objDom.setValorComponente(obj, "");
                }
            }
            
            function callbackajaxcambiarfechasiniestro(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                //alert(ajaxResponseText);
                try{
                    if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                        //Vaciar lista de garantias, si hay
                        objLista.borrarFilasDeLista ("miListaId3", "3", "<fmt:message key='1000254' />");
                        if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                            
                            for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                                var tableadded = document.getElementById("miListaId3");
                                var tbodyadded = tableadded.getElementsByTagName("tbody")[0];
                                var tradded = tbodyadded.getElementsByTagName("tr");
                                
                                // Si no hay registros, mostramos la lista para poder rellenar
                                objLista.borrarFilaVacia(tbodyadded, tradded);
                                
                                // Obtenemos el estilo para la fila que insertaremos
                                var rowstyle = objLista.addEstiloEnFilaDeLista(tradded, "gridEven", "gridNotEven");
                                // Creamos una nueva fila vacia y le damos el estilo obtenido
                                var newtr = objLista.crearNuevaFila(rowstyle);
                                // Creamos un array de columnas a añadir a la nueva fila del displayTag
                                var newtd = new Array(3);
                                // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                                var cgarant = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CGARANT")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CGARANT")[0].childNodes[0].nodeValue : "");
                                var tgarant = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TGARANT")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TGARANT")[0].childNodes[0].nodeValue : "");
                                var icapital = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("ICAPITAL")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("ICAPITAL")[0].childNodes[0].nodeValue : "");
                                
                                //Formategem números
                                if(objNumero.validaNumero(icapital, true))
                                    icapital = objValidador.valorFormateadoCampoNumerico(icapital, true, true);
                                else icapital = "";
                                
                                newtd[0] = objLista.addCheckBoxEnLista("radioGarant", cgarant, "");                                    
                                newtd[1] = objLista.addTextoEnLista(tgarant);
                                newtd[2] = objLista.addNumeroEnLista(icapital);
                            
                                // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                                objLista.addNuevaFila(newtd, newtr, tbodyadded);
                            }
                        }
                    }
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
            }
            
            function f_cambia_causa(obj){
                if (obj.value != "null"){
                    SPRODUC= '${__formdata.SPRODUC}';
                    objAjax.invokeAsyncCGI("axis_axissin001.do", callbackAjaxSelectedCausa, 
                        "operation=ajax_selected_causa&CODI=" + document.miForm.causas.value + "&SPRODUC=" +SPRODUC + "&SSEGURO=" +document.miForm.SSEGURO.value + "&CRAMO="+document.miForm.CRAMO.value, obj, objJsMessages.jslit_actualizando_registro);}
            }
            
            function callbackAjaxSelectedCausa(ajaxResponseText) {
                var motivosCombo = document.miForm.motivos;
                try {
                    var doc=objAjax.domParse(ajaxResponseText);
                                        
                    if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                        if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                            objDom.borrarOpcionesDeCombo(motivosCombo);
                            
                            for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                                var TMOTSIN = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TMOTSIN")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TMOTSIN")[0].childNodes[0].nodeValue : "");
                                var CMOTSIN = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CMOTSIN")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CMOTSIN")[0].childNodes[0].nodeValue : "");
                                
                                objDom.addOpcionACombo(CMOTSIN, TMOTSIN, motivosCombo, i);
                            }
                        }else{
                            objDom.borrarOpcionesDeCombo (motivosCombo);
                            objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", motivosCombo, null);
                        }
                    }
                    
                } catch (e) {
                    objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", motivosCombo, null);
                    alert(objJsMessages.jslit_sin_motivos);
                }
            }
            
        </script>
    </head>
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
        <input type="hidden" id="operation" name="operation" value=""/>
        <input type="hidden" name="PRODUCTO" id="PRODUCTO" value="" />
        <input type="hidden" name="FORM_ACT" id="FORM_ACT" value="" />
        <input type="hidden" name="MODO" id="MODO" value="" />
        <input type="hidden" name="LIMPIAR_DATOS" id="LIMPIAR_DATOS" value="" />
        <input type="hidden" name="SSEGURO" id="SSEGURO" value="${sessionScope.SSEGURO}" />
        <input type="hidden" name="SRIESGO" id="SRIESGO" value="${__formdata['NRIESGO']}" />
        <input type="hidden" name="PCTRAMI" id="PCTRAMI" value="${__formdata['PCTRAMI']}" />
        <input type="hidden" name="CRAMO" id="CRAMO" value="${__formdata['CRAMO']}" />
        <input type="hidden" name="selectedGarantias" id="selectedGarantias" value="" />
        <input type="hidden" name="selectedDocumentacion" id="selectedDocumentacion" value="" />
        <input type="hidden" name="NSINIES" id="NSINIES" value="${sessionScope.NSINIESINI}" />
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><fmt:message key="1000230" /></c:param>
                <c:param name="nid" value="axissin002" />
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><fmt:message key="1000232" /></c:param>
                <c:param name="nid" value="axissin004" />
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><fmt:message key="1000188" /></c:param>
                <c:param name="nid" value="axisctr019"></c:param>
            </c:import>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"><fmt:message key="100592" /></c:param>
                <c:param name="titulo"><fmt:message key="109808" /></c:param>
                <c:param name="formulario"><fmt:message key="109808" /></c:param>
                <c:param name="producto"></c:param>
                <c:param name="form">axissin001</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="1000098" /></div>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <td align="left">
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <!-- Numero de poliza -->
                                            <axis:visible f="axissin001" c="NPOLIZA"> 
                                                <td class="titulocaja">
                                                    <b><fmt:message key="9001514"/></b>
                                                    <img border="0" src="images/find.gif" onclick="f_abrir_axisctr019()" style="cursor:pointer"/>
                                                </td>
                                            </axis:visible>
                                            <!-- Certificado -->
                                            <axis:visible f="axissin001" c="NCERTIF">
                                                <td class="titulocaja">
                                                    <b><fmt:message key="101300"/></b>
                                                </td>
                                            </axis:visible>
                                            <!-- Situacion -->
                                            <axis:visible f="axissin001" c="TSITUAC">
                                                <td class="titulocaja">
                                                    <b><fmt:message key="100874"/></b>
                                                </td>
                                            </axis:visible>
                                            <td class="titulocaja">
                                                <b><fmt:message key="100829" /></b>
                                            </td>
                                            
                                           
                                        </tr>
                                        <tr>
                                            <!-- Numero de poliza -->
                                            <axis:visible f="axissin001" c="NPOLIZA"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campodisabled campo campotexto" id="NPOLIZA" name="NPOLIZA" size="15"  
                                                    value="${__formdata.NPOLIZA}" <axis:atr f="axissin001" c="NPOLIZA" a="modificable=false"/> />
                                                </td>
                                            </axis:visible>
                                            <!-- Certificado -->
                                            <axis:visible f="axissin001" c="NCERTIF">
                                                <td class="campocaja">
                                                          <input type="text" class="campodisabled campo campotexto" id="NCERTIF" name="NCERTIF" size="15" style="width:35%;"
                                                          value="${__formdata.NCERTIF}" <axis:atr f="axissin001" c="NCERTIF" a="modificable=false"/> />
                                                </td>
                                            </axis:visible>
                                             <!-- Situacion -->
                                            <axis:visible f="axissin001" c="TSITUAC">
                                                <td class="campocaja">
                                                    <input type="text" class="campodisabled campo campotexto" id="TSITUAC" name="TSITUAC" size="15" 
                                                    value="${__formdata.TSITUAC}" <axis:atr f="axissin001" c="TSITUAC" a="modificable=false"/> />
                                                </td>
                                            </axis:visible>
                                            <td colspan="2" class="campocaja">
                                                    <input type="text" class="campodisabled campo campotexto" id="TPRODUC"  name="TPRODUC" readonly="true"
                                                     value="${__formdata.TPRODUC}"/>
                                            </td>
                                </td>
                                        </tr>
                                        <tr>
                                         <!-- Fecha efecto -->
                                            <axis:visible f="axissin001" c="FEFECTO">
                                                <td class="titulocaja" >
                                                    <b><fmt:message key="100883"/></b>
                                                </td>
                                            </axis:visible>
                                            <!-- Fecha vencimiento -->
                                            <axis:visible f="axissin001" c="FVENCIM">
                                                <td class="titulocaja">
                                                    <b><fmt:message key="100885"/></b>
                                                </td>
                                            </axis:visible>
                                            <!-- Fecha anulación -->
                                            <axis:visible f="axissin001" c="FANULAC">
                                                <td class="titulocaja">
                                                    <b><fmt:message key="140214"/></b>
                                                </td>
                                            </axis:visible>
                                            
                                             
                                        </tr>
                                        <tr>
                                          <!-- Fecha efecto -->
                                            <axis:visible f="axissin001" c="FEFECTO">
                                                <td class="campocaja">
                                                    <input type="text" class="campodisabled campo campotexto" id="FEFECTO" name="FEFECTO" size="15" style="width:60%"
                                                    value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FEFECTO}'/>" <axis:atr f="axissin001" c="FEFECTO" a="modificable=false"/> />
                                                </td>
                                            </axis:visible>
                                            <!-- Fecha vencimiento -->
                                            <axis:visible f="axissin001" c="FVENCIM">
                                                <td class="campocaja">
                                                         <input type="text" class="campodisabled campo campotexto" id="FVENCIM" name="FVENCIM" size="15" style="width:60%"
                                                          value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FVENCIM}'/>" <axis:atr f="axissin001" c="FVENCIM" a="modificable=false"/> />
                                                </td>
                                            </axis:visible>
                                            <!-- Fecha anulación -->
                                            <axis:visible f="axissin001" c="FANULAC">
                                                <td class="campocaja">
                                                    <input type="text" class="campodisabled campo campotexto" id="FANULAC" name="FANULAC" size="15" style="width:60%"
                                                    value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FANULAC}'/>" <axis:atr f="axissin001" c="FANULAC" a="modificable=false"/> />
                                                </td>
                                            </axis:visible>
                                           
                                            
                                        </tr>
                                    <tr><td><div class="separador">&nbsp;</div></td></tr>
                                
                                <tr >
                                <td class="campocaja" colspan="5">
                            <!-- Seccion Tabla tomadores -->
                                    <!-- DisplayTag preguntas -->
                                    <!-- c : if test="${!empty sessionScope.axisctr_preguntasPoliza}"-->
                                        <c:set var="title0"><fmt:message key="1000181"/></c:set>
                                            <div class="displayspace">                         
                                            <display:table name="${__formdata.T_IAX_TOMADORES}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                             requestURI="axis_axissin001.do?paginar=true">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_TOMADORES.TNOMBRE" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                    <div class="dspText">${miListaId.OB_IAX_TOMADORES.TNOMBRE} ${miListaId.OB_IAX_TOMADORES.TAPELLI1} ${miListaId.OB_IAX_TOMADORES.TAPELLI2}</div>
                                                </display:column>
                                            </display:table>
                                        </div>
                                        <div class="separador">&nbsp;</div>
                                        <div class="separador">&nbsp;</div>
                                    <!--/c : if-->
                                </td>
                                <td/>
                                <td/>
                                <td/>
                                
                            </tr>
                            
                            <!-- Seccion tabla Riesgos -->
                            
                            <tr>
                                <td colspan="5"  class="campocaja">
                                    <!-- DisplayTag preguntas -->
                                    <!-- c : if test="${!empty sessionScope.axisctr_preguntasPoliza}"-->
                                        <c:set var="title0">&nbsp;</c:set>
                                        <c:set var="title1"><fmt:message key="102500"/></c:set>
                                        <div class="displayspace">                         
                                            <display:table name="${__formdata.T_IAX_RIESGOS}" id="miListaId2" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                             requestURI="axis_axissin001.do?paginar=true">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title0}" sortable="false" sortProperty="selectedRiesgo" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                    <div class="dspIcons"><input <c:if test="${__formdata.SIZE_RIESGOS == 1}">checked</c:if> onClick="javascript:f_seleccionar_riesgo(this, this.value);" value="${miListaId2.OB_IAX_RIESGOS.NRIESGO}" type="radio" id="selectedRiesgo" name="selectedRiesgo"/></div>
                                                </display:column>
                                                <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_RIESGOS.TRIESGO" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspText">${miListaId2.OB_IAX_RIESGOS.TRIESGO}</div>
                                                </display:column>
                                            </display:table>
                                        </div>
                                    <!--/c : if-->
                                </td>
                                <td/>
                                <td/>
                                <td/>
                            </tr>
                        </table>
                        
                        <!-- Seccion datos ultimo recibo -->
                        <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="111635" /></div>
                        <!--campos-->
                        <table class="seccion">
                               <tr>
                                    <td align="left" >
                                      <table class="area" align="center">
                                        <tr>
                                            <td align="left" class="campocaja">
                                                <!-- DisplayTag último recibo -->
                                                <c:set var="title0"><fmt:message key="100895"/></c:set>
                                                <c:set var="title1"><fmt:message key="100883"/></c:set>
                                                <c:set var="title2"><fmt:message key="100885"/></c:set>
                                                <c:set var="title3"><fmt:message key="100563"/></c:set>
                                                <c:set var="title4"><fmt:message key="102302"/></c:set>
                                                <c:set var="title5"><fmt:message key="100874"/></c:set>
                                                <div class="displayspace">
                                                    <display:table name="${__formdata.T_IAX_LASTRECIBO}" id="miListaIdRecibo" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                    requestURI="axis_axissin001.do?paginar=true">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_RIESGOS.TRIESGO" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                                            <div class="dspNumber">${miListaIdRecibo.NRECIBO}</div>
                                                        </display:column>
                                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_RIESGOS.FEFECTO" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaIdRecibo.FEFECTO}"/></div>
                                                        </display:column>
                                                        <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_RIESGOS.FVENCIM" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaIdRecibo.FVENCIM}"/></div>
                                                        </display:column>                                            
                                                        <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_RIESGOS.ICONCEP" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                                            <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaIdRecibo.ICONCEP}"/></div>
                                                        </display:column>                                                                                        
                                                        <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_RIESGOS.TTIPREC" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                                            <div class="dspText">${miListaIdRecibo.TTIPREC}</div>
                                                        </display:column>                                                                                                                                    
                                                        <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_RIESGOS.TESTREC" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                                            <div <c:if test="${miListaIdRecibo['CESTREC']==0}">class="dspTextAviso"</c:if> <c:if test="${miListaIdRecibo['CESTREC']!=0}">class="dspText"</c:if>>${miListaIdRecibo['TESTREC']}</div>
                                                        </display:column>                                                                                                                                     
                                                    </display:table>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align:right">
                                                 <div class="separador">&nbsp;</div>
                                                 <input type="button" class="boton" id="but_mas_recibos" value="<fmt:message key="1000232" />" onclick="f_abrir_axissin004()" />
                                            </td>
                                        </tr>  
                                        </td>
                                        </tr>
                                        </table>
                        </table>
                        <!-- Seccion datos último Recibo -->
                        
                        <!-- Datos Siniestro -->
                        <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="104929" /></div>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <td align="left">
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                        </tr>
                                        <!-- Fila 3 -->
                                         <tr>
                                            <!-- Fecha ocurrencia -->
                                            <axis:visible f="axissin001" c="FSINIES">
                                                <td class="titulocaja">
                                                    <b><fmt:message key="1000510" /></b>
                                                </td>
                                            </axis:visible>
                                            <!-- Hora ocurrencia -->
                                            <axis:visible f="axissin001" c="HSINIES">
                                                <td class="titulocaja">
                                                    <b><fmt:message key="1000242" /></b>
                                                </td>
                                            </axis:visible>
                                            <!-- fecha_recepcion -->
                                            <axis:visible f="axissin001" c="FNOTIFI">
                                                <td class="titulocaja">
                                                    <b><fmt:message key="102913" /></b>
                                                </td>
                                            </axis:visible>
                                            <!-- tramitador -->
                                            <axis:visible f="axissin001" c="PTTRAMI">
                                                <td class="titulocaja">
                                                    <b><fmt:message key="140769" /></b>
                                                </td>
                                            </axis:visible>
                                         </tr>
                                         <tr>
                                            <!-- Fecha ocurrencia -->
                                            <axis:visible f="axissin001" c="FSINIES">
                                                <td class="campocaja">
                                                    <input onchange="javascript:f_carga_garantias(this)" type="text" class="campowidthinput campo campotexto_ob" id="FSINIES" title="<fmt:message key='700362' />" name="FSINIES" size="15"
                                                     <c:if test="${!empty __formdata.T_IAX_RIESGOS}">obligatorio="true"</c:if>
                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata['FSINIES']}"/>" <axis:atr f="axissin001" c="FSINIES" a="modificable=true&formato=fecha"/> style="width:60%"/><a style="vertical-align:middle;"><img 
                                                    id="popup_calendario_ocurrencia" alt="<fmt:message key="108341"/>" title="<fmt:message key="700362" />" src="images/calendar.gif"/></a>
                                                </td>
                                            </axis:visible>
                                            <!-- Hora ocurrencia -->
                                            <axis:visible f="axissin001" c="HSINIES">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto_ob" id="HSINIES" name="HSINIES" maxislength="5" size="15" style="width:30%"
                                                    value="${__formdata['HSINIES']}" title="<fmt:message key='102790' />" <axis:atr f="axissin001" c="HSINIES" a="formato=hora&obligatorio=true"/> />
                                                </td>
                                            </axis:visible>
                                            <!-- fecha_recepcion -->
                                            <axis:visible f="axissin001" c="FNOTIFI">
                                                <td class="campocaja">
                                                    <input style="width:60%" type="text" class="campowidthinput campo campotexto" id="FNOTIFI" name="FNOTIFI" size="15" title="<fmt:message key='102913' />" 
                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata['FNOTIFI']}"/>" <axis:atr f="axissin001" c="FNOTIFI" a="modificable=true&obligatorio=true&formato=fecha"/> /><a style="vertical-align:middle;"><img 
                                                    id="popup_calendario_recepcion" alt="<fmt:message key="108341"/>" title="<fmt:message key="102913" />" src="images/calendar.gif"/></a>
                                                </td>
                                            </axis:visible>
                                            <!-- tramitador -->
                                            <axis:visible f="axissin001" c="PTTRAMI">
                                                <td class="campocaja" colspan="2">
                                                    <input type="text" class="campowidthinput campo campotexto" id="PTTRAMI" name="PTTRAMI" size="15" 
                                                    value="${__formdata['PTTRAMI']}" <axis:atr f="axissin001" c="PTTRAMI" a="modificable=false&obligatorio=true"/>/>
                                                </td>
                                            </axis:visible>
                                         </tr>
                                         <tr>
                                            <!-- Causas -->
                                            <axis:visible f="axissin001" c="causas">
                                                <td class="titulocaja">
                                                    <b><fmt:message key="180580" /></b>
                                                </td>
                                            </axis:visible>
                                            
                                            <!-- Motivo -->
                                            <axis:visible f="axissin001" c="motivos">
                                                <td class="titulocaja">
                                                    <b><fmt:message key="102577" /></b>
                                                </td>
                                            </axis:visible>
                                            <!-- Responsabilidad -->
                                            <axis:visible f="axissin001" c="responsabilidad">
                                                <td class="titulocaja">
                                                    <b><fmt:message key="1000511" /></b>
                                                </td>
                                            </axis:visible>
                                         </tr>
                                         <tr>
                                            <!-- Causas -->
                                            <axis:visible f="axissin001" c="causas">
                                                <td class="campocaja">
                                                   <select name = "causas" id ="causas" size="1" onchange="f_cambia_causa(this)" class="campowidthselect campo campotexto_ob">                                                    
                                                    <option value="null"> - <fmt:message key="1000349"/> - </option>
                                                    <c:forEach var="causasOp" items="${__formdata.T_IAX_CAUSAS}">
                                                        <option value = "${causasOp.CCAUSIN}" <c:if test="${__formdata.causas != 'null' && causasOp.CCAUSIN == __formdata.causas}">selected</c:if>>
                                                                ${causasOp.TCAUSIN}
                                                        </option>
                                                    </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:visible>
                                            
                                            <!-- Motivo -->
                                            <axis:visible f="axissin001" c="motivos">
                                                <td class="campocaja">
                                                   <select name = "motivos" id ="motivos" size="1" class="campowidthselect campo campotexto">
                                                    <option value="null"> - <fmt:message key="1000440"/> - </option>
                                                    <c:forEach var="motivosOp" items="${sessionScope.T_IAX_MOTIVOS}">
                                                        <option value = "${motivosOp.CMOTSIN}" <c:if test="${__formdata.motivos  != 'null' && motivosOp.CMOTSIN == __formdata.motivos}">selected</c:if>>
                                                                ${motivosOp.TMOTSIN} 
                                                        </option>
                                                    </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:visible>
                                            <!-- Responsabilidad -->
                                            <axis:visible f="axissin001" c="responsabilidad">
                                                <td class="campocaja">
                                                    <select name = "responsabilidad" id ="responsabilidad" size="1" class="campowidthselect campo campotexto">                                                    
                                                    <option value="null"> - <fmt:message key="1000351"/> - </option>
                                                    <c:forEach var="responsOp" items="${__formdata.T_IAX_RESPONSABILIDAD}">
                                                        <option value = "${responsOp.CATRIBU}" <c:if test="${__formdata.responsabilidad != 'null' && responsOp.CATRIBU == __formdata.responsabilidad}">selected</c:if>>
                                                                ${responsOp.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:visible>
                                         </tr>
                                         <axis:visible f="axissin001" c="TZONAOCU">
                                            <tr>
                                                 <td class="titulocaja">
                                                    <b><fmt:message key="110492" /></b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5"  class="campocaja">
                                                    <textarea class="campo campotexto_ob" style="width:100%;" name="TZONAOCU" id="TZONAOCU" <axis:atr f="axissin001" c="TZONAOCU" a="obligatorio=true"/> title="<fmt:message key="110492" />">${__formdata.TZONAOCU}</textarea>
                                                </td>
                                            </tr>
                                        </axis:visible>
                                        <axis:visible f="axissin001" c="TSINIES">
                                            <tr>
                                              <td class="titulocaja">
                                                    <b><fmt:message key="1000112" /></b>
                                              </td>
                                            <tr>
                                            </tr>
                                              <td colspan="5" class="campocaja">
                                                    <textarea class="campo campotexto_ob" style="width:100%;" name="TSINIES" id="TSINIES" <axis:atr f="axissin001" c="TSINIES" a="obligatorio=true"/> title="<fmt:message key="1000112" />">${__formdata.TSINIES}</textarea>
                                              </td>
                                            </tr>  
                                        </axis:visible>
                                   </table>
                                    <div class="separador">&nbsp;</div>
                                </td>
                            </tr>
                        </table>
                        
                            <!--Seccion garantías y sección datos del riesgo -->
                            <!-- Esta sección sólo se mostrará bien cuando sólo haya un risc o un risc sel.leccionat -->
                            
                                                        <!-- SECCION TABLA GARANTIAS -->
                        <!-- Lugar ocurrencia -->
                        <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="153053" /></div>
                        <!--campos-->
                        <table class="seccion">
                             <tr>
                                    <td align="left" >
                                      <table class="area" align="center">
                                        <tr>
                                            <td align="left" class="campocaja">
                                            <!-- DisplayTag preguntas -->
                                            <!-- c : if test="${!empty sessionScope.axisctr_preguntasPoliza}"-->
                                                <c:set var="title0">&nbsp;</c:set>
                                                <c:set var="title1"><fmt:message key="100588"/></c:set>
                                                <c:set var="title2"><fmt:message key="1000073"/></c:set>
                                                <div class="displayspace">                         
                                                    <display:table name="${sessionScope.T_IAX_GARANTIAS}" id="miListaId3" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                     requestURI="axis_axissin001.do?paginar=true">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column title="${title0}" sortable="false" sortProperty="radioGarant" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                            <div class="dspIcons"><input onClick="" value="${miListaId3.CGARANT}" type="checkbox" id="radioGarant" name="radioGarant"
                                                            <c:if test="${miListaId3.SELECTEDGARANTIA}"> checked </c:if>/></div>
                                                        </display:column>
                                                        <display:column title="${title1}" sortable="true" sortProperty="TGARANT" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">${miListaId3.TGARANT}</div>
                                                        </display:column>
                                                        <display:column title="${title2}" sortable="true" sortProperty="ICAPITAL" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                            <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId3.ICAPITAL}"/></div>
                                                        </display:column>  
                                                    </display:table>
                                                </div>
                                    <!--/c : if-->
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                        </table>
                        <!-- fin seccion -->
                        <%--
                        <!-- Documentación necesaria -->
                        <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="1000117" /></div>
                        <!--campos-->
                        <table class="seccion">
                           <!-- Seccion documentacion necesaria -->
                           <tr>
                                <td>
                                    <!-- DisplayTag preguntas -->
                                    <!-- c : if test="${!empty sessionScope.axisctr_preguntasPoliza}"-->
                                        <c:set var="title0">&nbsp;</c:set>
                                        <c:set var="title1"><fmt:message key="150996"/></c:set>
                                        <div class="displayspace">                         
                                            <display:table name="${__formdata.T_IAX_DOCUMENTACION}" id="miListaId4" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                             requestURI="axis_axissin001.do?paginar=true">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title0}" sortable="false" sortProperty="selectedDocu" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                    <div class="dspIcons"><input onClick="" value="${miListaId4.CDOCUME}" type="checkbox" id="selectedDocu" name="selectedDocu"
                                                    <c:if test="${miListaId4.SELECTEDDOCUME}"> checked </c:if>/></div>
                                                </display:column>
                                                <display:column title="${title1}" sortable="true" sortProperty="TDOCUME" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspText">${miListaId4.TDOCUME}</div>
                                                </display:column>
                                                
                                            </display:table>
                                        </div>
                                    <!--/c : if-->
                                </td>
                            </tr> 
                        </table>
                        <!-- Fin seccion documentacion necesaria -  -->
                        --%>
                    </td>
                </tr>
            </table>
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="__botones">salir,consultar_siniestros,151477,100009</c:param>
            </c:import>
        </form>
        <script type="text/javascript">
        /*function getScrollTop(win) {
            var scrollTop = 0;
            if (win.pageYOffset) {
            scrollTop = win.pageYOffset;
            }
            else if (win.document.documentElement && win.document.documentElement.scrollTop) {
            scrollTop = win.document.body.scrollTop;
            }
            else if (win.document.body) {
            scrollTop = win.document.body.scrollTop;
            }
            return scrollTop;
        }

        window.onscroll = function() {
            obj = document.getElementById('mensajes_div');
        
            var bottom = 2;
            var movebottom = getScrollTop(window) - bottom;
            //obj.innerHTML += getScrollTop(window)+ " "+movebottom+ " "+(getScrollTop(window) - movebottom);
            obj.style.bottom = (getScrollTop(window) - movebottom) + 'px';
        }*/
        </script>
        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FSINIES",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_ocurrencia", 
                singleClick    :    true,
                firstDay       :    1
            });
            
            Calendar.setup({
                inputField     :    "FNOTIFI",    
                ifFormat       :    "%d/%m/%Y",     
                button         :    "popup_calendario_recepcion",  
                singleClick    :    true,
                firstDay       :    1
            });
        </script>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>