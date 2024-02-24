<%/**
*  Fichero: axisfis001.jsp
*  @author <a href = "mailto:xgallego@csi-ti.com">xavier Gallego</a>
*
*  Fecha: 10/10/2008
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><fmt:message key="100681"/></title>
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
            var nuevaVentana      = null;
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload(){                
                objDependencias.modificarPropiedadesSegunModificableYVisible();                
                f_cargar_valores_defecto();
                f_carga_dependencias();
                revisarEstilos();
                
                
                objDom.setVisibilidadPorId("fichero", "hidden");
            }
            
            function f_but_109006() {
                if (objValidador.validaEntrada()) {
                    var CEMPRES = objDom.getValorPorId("CEMPRES");
                    var CMODELO = objDom.getValorPorId("CMODELO");
                    var CFICHERO = objDom.getValorPorId("CFICHERO");
                    var CFINI = objDom.getValorPorId("CFINI");
                    var CFFIN = objDom.getValorPorId("CFFIN");
                    var CANYOFISC = objDom.getValorPorId("CANYOFISC");
                    var CTIPOSOP = objDom.getValorPorId("CTIPOSOP");
                    var CTIPOCIU = objDom.getValorPorId("CTIPOCIU");
                
                    objAjax.invokeAsyncCGI("axis_axisfis001.do?CEMPRES=" + CEMPRES + 
                                                            "&CMODELO=" + CMODELO +
                                                            "&CFICHERO=" + CFICHERO +
                                                            "&CFINI=" + CFINI +
                                                            "&CFFIN=" + CFFIN +
                                                            "&CANYOFISC=" + CANYOFISC +
                                                            "&CTIPOSOP=" + CTIPOSOP +
                                                            "&CTIPOCIU=" + CTIPOCIU
                                                , callbackAjaxGenerarResultado, "operation=ajax_generar_resultados", this, objJsMessages.jslit_cargando);
                }
            }
            
            function f_but_111046() {
                if(formularioSinCambios()){
                    nuevaVentana = window.open("axis_axisfis001.do?operation=tunnel_doc");
                    if (document.all) 
                        setInterval("f_cerrar_nuevaVentana()", 100);
                }else{
                    objDom.setVisibilidadPorId("but_111046", "hidden");
                    alert("<fmt:message key='9000622' />");
                }
            }  

            function f_cerrar_nuevaVentana() {
                try {
                    if (nuevaVentana != null && nuevaVentana.document.readyState != 'loading') {
                        nuevaVentana.window.close();
                    }
                } catch (e) {}
            }            
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
            }
            
            function f_cargar_hidden_load(){
                objDom.setValorPorId("CEMPRES_LOAD", objDom.getValorPorId("CEMPRES"));
                objDom.setValorPorId("CMODELO_LOAD", objDom.getValorPorId("CMODELO"));
                objDom.setValorPorId("CFICHERO_LOAD", objDom.getValorPorId("CFICHERO"));
                objDom.setValorPorId("CFINI_LOAD", objDom.getValorPorId("CFINI"));
                objDom.setValorPorId("CFFIN_LOAD", objDom.getValorPorId("CFFIN"));
                objDom.setValorPorId("CANYOFISC_LOAD", objDom.getValorPorId("CANYOFISC"));
                objDom.setValorPorId("CTIPOSOP_LOAD", objDom.getValorPorId("CTIPOSOP"));
                objDom.setValorPorId("CTIPOCIU_LOAD", objDom.getValorPorId("CTIPOCIU"));
            }
            
            function formularioSinCambios(){
                var sinCambios = true;
                
                if(!objUtiles.utilEquals(objDom.getValorPorId("CEMPRES"), objDom.getValorPorId("CEMPRES_LOAD")) ||
                        !objUtiles.utilEquals(objDom.getValorPorId("CMODELO"), objDom.getValorPorId("CMODELO_LOAD")) ||
                        !objUtiles.utilEquals(objDom.getValorPorId("CFICHERO"), objDom.getValorPorId("CFICHERO_LOAD")) ||
                        !objUtiles.utilEquals(objDom.getValorPorId("CFINI"), objDom.getValorPorId("CFINI_LOAD")) ||
                        !objUtiles.utilEquals(objDom.getValorPorId("CFFIN"), objDom.getValorPorId("CFFIN_LOAD")) ||
                        !objUtiles.utilEquals(objDom.getValorPorId("CANYOFISC"), objDom.getValorPorId("CANYOFISC_LOAD")) ||
                        !objUtiles.utilEquals(objDom.getValorPorId("CTIPOSOP"), objDom.getValorPorId("CTIPOSOP_LOAD")) ||
                        !objUtiles.utilEquals(objDom.getValorPorId("CTIPOCIU"), objDom.getValorPorId("CTIPOCIU_LOAD")) ){
                            sinCambios = false;
                }
                return sinCambios;
            }
            
            function f_seleccionar_empresa(){
                objUtiles.ejecutarFormulario("axis_axisfis001.do", "cargar_modelo", document.miForm, "_self", objJsMessages.jslit_cargando);       
            }
            
            function f_seleccionar_modelo(){
                objUtiles.ejecutarFormulario("axis_axisfis001.do", "seleccionar_modelo", document.miForm, "_self", objJsMessages.jslit_cargando);
            }	
            
            /******************AJAX**************************************************************/
            function callbackAjaxGenerarResultado (ajaxResponseText) {
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var resultado = objUtiles.hayValorElementoXml(doc.getElementsByTagName("VALOR")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALOR"), 0, 0) : "-1";
                    var fichero = objUtiles.hayValorElementoXml(doc.getElementsByTagName("FICHERO")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("FICHERO"), 0, 0) : "";
                             var rutaentera = fichero;
                 
                    if(objUtiles.utilEquals(fichero, "-0.csv")){
                        alert("<fmt:message key='9000620' />");
                        document.miForm.CFICHERO.focus();
                    }else{
                        //Guardo sólo el nombre.ext, no la ruta pq sino pl peta
                        var ficheroTmp = fichero.split("\\");
                        if(ficheroTmp.length >0)
                            fichero = ficheroTmp[ficheroTmp.length-1];
                            
                        objDom.setValorPorId("CFICHERO", fichero);
                        
                        if(objUtiles.utilEquals(resultado, "0")){
                            //Cargamos hidden para poderlos comparar posteriormente
                            f_cargar_hidden_load();
                        
                            objDom.setVisibilidadPorId("fichero", "visible");
                            objDom.setValorPorId("SORTIDA", rutaentera);
                        }else{ 
                            objDom.setVisibilidadPorId("fichero", "hidden");
                            alert("<fmt:message key='9000621' />");
                        }
                    }
                }
            }
            function f_imprimir_fitxer(pfitxer){
            objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+pfitxer,600,200);
        }
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisimprimir|<fmt:message key="1000205" />|true</c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation"/>
        <input type="hidden" name="CMODO" id="CMODO" value="${__formdata.CMODO}"/>        
        
        
        <input type="hidden" id="CEMPRES_LOAD" name="CEMPRES_LOAD" value=""/>
        <input type="hidden" id="CMODELO_LOAD" name="CMODELO_LOAD" value=""/>
        <input type="hidden" id="CFICHERO_LOAD" name="CFICHERO_LOAD" value=""/>
        <input type="hidden" id="CFINI_LOAD" name="CFINI_LOAD" value=""/>
        <input type="hidden" id="CFFIN_LOAD" name="CFFIN_LOAD" value=""/>
        <input type="hidden" id="CANYOFISC_LOAD" name="CANYOFISC_LOAD" value=""/>
        <input type="hidden" id="CTIPOSOP_LOAD" name="CTIPOSOP_LOAD" value=""/>
        <input type="hidden" id="CTIPOCIU_LOAD" name="CTIPOCIU_LOAD" value=""/>
        
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"></c:param>
                <c:param name="formulario"><fmt:message key="9000524" /></c:param>
                <c:param name="form">axisfis001</c:param>
        </c:import>

    <!-- Area de campos  -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <!--<div class="titulo"><img src="images/flecha.gif"/><fmt:message key="1000178" /></div>-->
            <!--campos-->
             <table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center">
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:60%;height:0px"></th>
                            </tr>
                            <tr>
                                <axis:visible f="axisfis001" c="CEMPRES"> <!-- TODO C -->
                                    <td class="titulocaja">
                                        <b id="label_CEMPRES"><fmt:message key="9000525" /></b>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisfis001" c="CMODELO"> 
                                    <td class="titulocaja">
                                        <b id="label_CMODELO"><fmt:message key="108515" /></b>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisfis001" c="CFICHERO"> 
                                    <td class="titulocaja">
                                        <b id="label_CFICHERO"><fmt:message key="1000574" /></b>
                                    </td>
                                </axis:visible>
                             </tr>
                             <tr>
                                <axis:visible f="axisfis001" c="CEMPRES"> <!-- TODO C -->
                                    <td class="campocaja">
                                        <select name = "CEMPRES" id="CEMPRES" style="width:200px;" size="1" 
                                            class="campowidthselect campo campotexto" onchange="javascript:f_seleccionar_empresa();"
                                            <axis:atr f="axisfis001" c="CEMPRES" a="modificable=true&obligatorio=true"/>>
                                            <option value = "null"> - <fmt:message key="108341"/> - </option>
                                            <c:forEach var="empresas" items="${sessionScope.axisfis_empresas}">
                                                <option value = "${empresas.CEMPRES}"
                                                    <c:if test="${empresas.CEMPRES == sessionScope.axisfis_selectedEmpres}">selected</c:if>>
                                                    ${empresas.TEMPRES}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisfis001" c="CMODELO"> 
                                    <td class="campocaja">
                                        <select name = "CMODELO" id="CMODELO" style="width:200px;" size="1" 
                                            class="campowidthselect campo campotexto" onchange="javascript:f_seleccionar_modelo();"
                                            <axis:atr f="axisfis001" c="CMODELO" a="modificable=true&obligatorio=true"/>
                                            title="<fmt:message key="108515"/>">
                                            <option value = "null"> - <fmt:message key="108341"/> - </option>
                                            <c:forEach var="modelos" items="${sessionScope.axisfis_modelos}">
                                                <option value = "${modelos.CMODELO}"
                                                    <c:if test="${modelos.CMODELO == sessionScope.axisfis_selectedModelo}">selected</c:if>>
                                                    ${modelos.CMODELO} - ${modelos.TMODELO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisfis001" c="CFICHERO">
                                     <td class="campocaja">    
                                        <input type="text" name="CFICHERO" id="CFICHERO" value="" class="campowidthinput campo campotexto"
                                        <axis:atr f="axisfis001" c="CFICHERO" a="modificable=true&obligatorio=false"/>/>
                                    </td>
                                </axis:visible>

                             </tr>
                            </table>
                            <div class="separador">&nbsp;</div>
                        </td>
                    </tr>
                    
                    <tr>
                    <td align="left">
                         <table class="area" align="center">
                            <tr>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:30%;height:0px"></th>
                                <th style="width:30%;height:0px"></th>
                            </tr>
                            <tr>
                                <axis:visible f="axisfis001" c="CFINI"> <!-- TODO C -->
                                    <td class="titulocaja">
                                        <b id="label_CFINI"><fmt:message key="9000526" /></b>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisfis001" c="CFFIN"> 
                                    <td class="titulocaja">
                                        <b id="label_CFFIN"><fmt:message key="9000527" /></b>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisfis001" c="CANYOFISC"> 
                                    <td class="titulocaja">
                                        <b id="label_CANYOFISC"><fmt:message key="9000528" /></b>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisfis001" c="CTIPOSOP"> 
                                    <td class="titulocaja">
                                        <b id="label_CTIPOSOP"><fmt:message key="9000529" /></b>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisfis001" c="CTIPOCIU"> 
                                    <td class="titulocaja">
                                        <b id="label_CTIPOCIU"><fmt:message key="9000530" /></b>
                                    </td>
                                </axis:visible>
                             </tr>
                             <tr>
                                <axis:visible f="axisfis001" c="CFINI">
                                     <td class="campocaja">    
                                        <input size="15" type="text" name="CFINI" id="CFINI" value="" alt="<fmt:message key="9000526" />" title="<fmt:message key="9000526" />"
                                        <axis:atr f="axisfis001" c="CFINI" a="modificable=true&obligatorio=false&formato=fecha"/>
                                        class="campowidthinputsmall campo campotexto" style="width:65px;"/>&nbsp;<a id="icon_CFINI" style="vertical-align:middle;" href="#"><img border="0" alt="<fmt:message key="108341" />" title="<fmt:message key="108341" />" src="images/calendar.gif"/></a>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisfis001" c="CFFIN">
                                     <td class="campocaja">    
                                        <input size="15" type="text" name="CFFIN" id="CFFIN" value="" alt="<fmt:message key="9000527" />" title="<fmt:message key="9000527" />"
                                        class="campowidthinputsmall campo campotexto" style="width:65px;"
                                        <axis:atr f="axisfis001" c="CFFIN" a="modificable=true&obligatorio=false&formato=fecha"/>/>&nbsp;<a id="icon_CFFIN" style="vertical-align:middle;" href="#"><img border="0" alt="<fmt:message key="108341" />" title="<fmt:message key="108341" />" src="images/calendar.gif"/></a>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisfis001" c="CANYOFISC">
                                     <td class="campocaja">    
                                        <input style = "width:30%" maxlength="4" size="4" type="text" name="CANYOFISC" id="CANYOFISC" value="" alt="<fmt:message key="9000528" />" title="<fmt:message key="9000528" />"
                                        <axis:atr f="axisfis001" c="CANYOFISC" a="formato=entero&modificable=true&obligatorio=false"/>
                                        class="campowidthinput campo campotexto"/>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisfis001" c="CTIPOSOP"> 
                                    <td class="campocaja">
                                        <select name = "CTIPOSOP" id="CTIPOSOP" style="width:200px;" size="1" 
                                        class="campowidthselect campo campotexto" alt="<fmt:message key="9000529" />" title="<fmt:message key="9000529" />"
                                        <axis:atr f="axisfis001" c="CTIPOSOP" a="modificable=true&obligatorio=false"/>> 
                                            <option value = "null"> - <fmt:message key="108341"/> - </option>
                                            <c:forEach var="soporte" items="${sessionScope.axisfis_tiposop}">
                                                <option value = "${soporte.CODI_TIPOSOPORTE}">
                                                    ${soporte.VALOR_TIPOSOPORTE}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisfis001" c="CTIPOCIU"> 
                                    <td class="campocaja">
                                        <select name = "CTIPOCIU" id="CTIPOCIU" style="width:200px;" size="1" 
                                            class="campowidthselect campo campotexto" alt="<fmt:message key="9000530" />" title="<fmt:message key="9000530" />"
                                            <axis:atr f="axisfis001" c="CTIPOCIU" a="modificable=true&obligatorio=false"/>>
                                            <option value = "null"> - <fmt:message key="108341"/> - </option>
                                            <c:forEach var="ciudadano" items="${sessionScope.axisfis_tipociu}">
                                                <option value = "${ciudadano.CODI_TIPOCIUDADANO}">
                                                    ${ciudadano.VALOR_TIPOCIUDADANO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:visible>
                             </tr>
                            </table>
                            <div class="separador">&nbsp;</div>
                        </td>
                    </tr>
                    <tr>
                    <td colspan="5" id="fichero">
                    <div class="separador">&nbsp;</div>
                                <div class="titulo"><b><fmt:message key="107913" /></b></div>
                                <div class="separador">&nbsp;</div>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:40%;height:0px"></th>
                                        <th style="width:5%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:5%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:5%;height:0px"></th>
                                        <th style="width:5%;height:0px"></th>
                                    </tr>    
                                    <tr> <%-- Camp3 -Fitxer generat--%> 
                                        <td class="titulocaja" id="LITERAL_SORTIDA">
                                              <b><fmt:message key="107913" /></b>
                                        </td>   
                                    </tr>
                                    <tr>
                                        <td class="campocaja" id="fichero">
                                            <input type="text" readonly 
                                                   style="text-decoration:underline;background-color:transparent;border:0;cursor:pointer" 
                                                   onclick="javascript:f_imprimir_fitxer(document.getElementById('SORTIDA').value)" class="campowidthinput campo campotexto_ob" size="15"  name="SORTIDA" id="SORTIDA"
                                                   title="<fmt:message key="107913"/>"/>                                     
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
        <c:param name="__botones">salir,109006</c:param>
    </c:import>
    <script type="text/javascript">
    <axis:visible f="axisfis001" c="CFINI"> 
        Calendar.setup({
            inputField     :    "CFINI",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_CFINI", 
            singleClick    :    true,
            firstDay       :    1
        });
    </axis:visible>   
    <axis:visible f="axisfis001" c="CFFIN">
        Calendar.setup({
            inputField     :    "CFFIN",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_CFFIN",  
            singleClick    :    true,
            firstDay       :    1
        });
    </axis:visible>
    </script>
</form>
<c:import url="../include/mensajes.jsp" />
</body>
</html>