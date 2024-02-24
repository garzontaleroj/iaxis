<%/**
*  Fichero: axisimp005.jsp
*  Pantalla de alta de impuestos por empresa.
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>  
*
*  Fecha: 31/12/2008
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
 
<html>
    <head>
        <title><fmt:message key="1000533"/></title>
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
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
                var grabarOK = ${requestScope.grabarOK == true && requestScope.buscarOK == true};
                if (grabarOK)
                    parent.f_aceptar_modal("axisimp003", "?CEMPRES=" + objDom.getValorPorId("CEMPRES"));
                revisarEstilos();
            }
            
            function f_but_cancelar() {
                objAjax.invokeAsyncCGI("modal_axisimp005.do", callbackCancelar, "operation=cancelar", this);     
            }           
            
            function f_but_aceptar() {
                if (objValidador.validaEntrada()) {
                    // Validación NVALCON
                    var NVALCON = objDom.getValorPorId("NVALCON")
                    var titleNVALCON = document.getElementById("NVALCON").title;
                    
                    if (!objUtiles.estaVacio(NVALCON) && isNaN(NVALCON) && isNaN(objNumero.cambiarSeparadorDecimalesPorMiles(objDom.getValorPorId("NVALCON")))) 
                        alert("- " + objJsMessages.jslit_campo_validador + " '" + titleNVALCON + "' : " + objJsMessages.jslit_formato_numero_incorrecto_validador + ". " 
                            + objJsMessages.jslit_se_esperaba + " " +  objJsMessages.jslit_un_numero_decimal + ".");
                    else {
                        objDom.setValorPorId("NVALCON", objNumero.cambiarSeparadorMilesPorDecimales(objDom.getValorPorId("NVALCON")));
                        objUtiles.ejecutarFormulario ("modal_axisimp005.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
                    }
                }
            }
            
            function f_recarga_combos(comboOrigen) {
                var CEMPRES = objDom.getValorPorId("CEMPRES");
                var CRAMO   = objDom.getValorPorId("CRAMO");
                var SPRODUC = objDom.getValorPorId("SPRODUC");
                var CACTIVI = objDom.getValorPorId("CACTIVI");
                var CGARANT = objDom.getValorPorId("CGARANT");
                
                objAjax.invokeAsyncCGI("modal_axisimp005.do", callbackAjaxActualizarCombos, 
                "operation=actualizar_combos&comboOrigen=" + comboOrigen + "&CEMPRES=" + CEMPRES + 
                "&CRAMO=" + CRAMO + "&SPRODUC=" + SPRODUC + "&CACTIVI=" + CACTIVI + "&CGARANT=" + CGARANT                
                , this, null, comboOrigen);
            }
    
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/    
            
            function callbackCancelar() {
                parent.f_cerrar_modal("axisimp005");
            }
          
            function callbackAjaxActualizarCombos(ajaxResponseText, comboOrigen) {
                
                var doc = objAjax.domParse(ajaxResponseText);
                try {            
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        switch (comboOrigen) {
                            case 'E':   rellenarCombo(doc, "CRAMO");
                                        rellenarCombo(doc, "CCONCEP"); 
                                        rellenarCombo(doc, "CTIPCON"); // fall-through
                            case 'R':   rellenarCombo(doc, "SPRODUC"); // fall-through
                            case 'P':   rellenarCombo(doc, "CACTIVI"); 
                                        rellenarCombo(doc, "CFORPAG"); // fall-through                                       
                            case 'A':   rellenarCombo(doc, "CGARANT");
                        }
                    }            
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
            }
            
            function rellenarCombo(doc, comboName) {
                var combo = document.getElementById(comboName);
                
                objDom.borrarOpcionesDeCombo(combo);
                objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", combo, null);
                
                if (objUtiles.existeObjetoXml(doc.getElementsByTagName(comboName)[0])){                    
                    var elementos = doc.getElementsByTagName(comboName)[0].getElementsByTagName("element");
                    var numElementos = elementos.length;
                    
                    if (numElementos == 1)
                        objDom.borrarOpcionesDeCombo(combo);
                    
                    for (i = 0; i < numElementos; i++) {
                        var CATRIBUyTATRIBU = recuperaCATRIBUyTATRIBU(elementos[i]);
                        var CATRIBU = CATRIBUyTATRIBU[0];
                        var TATRIBU = CATRIBUyTATRIBU[1];
                                                
                        objDom.addOpcionACombo(CATRIBU, TATRIBU, combo, null);
                    }
                    
                    if (numElementos == 1) {
                        // Seleccionar la única opción del combo y ejecutar
                        // su llamada onchange para recuperar combos dependientes
                        combo[0].selected = "1";
                        combo.onchange(); 
                    }
                }
            }
            
            function recuperaCATRIBUyTATRIBU(elemento) {
                var CATRIBU;
                var TATRIBU;
                if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CATRIBU")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CATRIBU"), 0, 0);
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TATRIBU")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TATRIBU"), 0, 0);
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("SPRODUC")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("SPRODUC"), 0, 0);
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TTITULO")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TTITULO"), 0, 0);                            
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CRAMO")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CRAMO"), 0, 0);                            
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TRAMO")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TRAMO"), 0, 0);                            
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CACTIVI")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CACTIVI"), 0, 0);                            
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TTITULO")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TTITULO"), 0, 0);                        
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CGARANT")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CGARANT"), 0, 0);                            
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TGARANT")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TGARANT"), 0, 0);                        
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CCONCEP")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CCONCEP"), 0, 0);                            
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TATRIBU")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TATRIBU"), 0, 0);                        
                }
                
                var retVal = new Array(2);
                retVal[0] = CATRIBU;
                retVal[1] = TATRIBU;
                
                return retVal;
            }
            
        </script>
    </head>
    
    <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>             
            <input type="hidden" name="NCONCEP" value="${__formdata.NCONCEP}"/>             
            
            <c:set var="title">
                ${__formdata.isNew == "true" ? 9000718 : 9000695}
            </c:set>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><fmt:message key="${title}"/></c:param> <%-- Alta/modificación de impuestos --%>
                <c:param name="titulo"><fmt:message key="${title}"/></c:param>     <%-- Alta/modificación de impuestos --%>
                <c:param name="form">axisimp005</c:param>
            </c:import>
            
            <!-- Área de campos  -->
            <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">                
                <div class="separador">&nbsp; </div>                                        
                <tr>
                    <td>                        
                        <!-- Área 1 -->
                        <table class="seccion" align="center">
                            <tr>
                                <th style="width:2%;height:0px"></th>
                                <th style="width:33%;height:0px"></th>
                                <th style="width:33%;height:0px"></th>
                                <th style="width:31%;height:0px"></th>
                            </tr>
                            <%-- Debug FormData 
                            <tr>
                                <td>
                                    ${__formdata}
                                </td>
                            </tr>
                            --%>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="titulocaja">
                                    <b><fmt:message key="101619"/></b>   <%-- Empresa --%>
                                </td>
                                <td class="titulocaja">
                                    <b><fmt:message key="100784"/></b>   <%-- Ramo --%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <%-- Empresa --%>
                                <td class="campocaja">
                                    <select name="CEMPRES" id="CEMPRES" size="1" class="campo campotexto" style="width:90%" obligatorio="true"
                                    title="<fmt:message key="101619"/>" onchange="f_recarga_combos('E')">
                                        <option value="null"> - <fmt:message key="108341"/> - </option>
                                        <c:forEach items="${__formdata.LISTVALORES.LSTEMPRESAS}" var="item">
                                            <option value = "${item.CEMPRES}" <c:if test="${__formdata.CEMPRES != 'null' && __formdata.CEMPRES == item.CEMPRES}"> selected </c:if>>${item.TEMPRES}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <%-- Ramo --%>
                                <td class="campocaja">
                                    <select name = "CRAMO" id ="CRAMO" size="1" class="campo campotexto" style="width:90%" 
                                    title="<fmt:message key="100784"/>" onchange="f_recarga_combos('R')">
                                        <option value="null"> - <fmt:message key="108341"/> - </option>                                                    
                                        <c:forEach items="${sessionScope.IMP_LSTRAMOS}" var="item">
                                            <option value = "${item.CRAMO}" <c:if test="${__formdata.CRAMO != 'null' && __formdata.CRAMO == item.CRAMO}"> selected </c:if>>${item.TRAMO}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="titulocaja">
                                    <b><fmt:message key="100829"/></b>   <%-- Producto --%>
                                </td>
                                <td class="titulocaja">
                                    <b><fmt:message key="103481"/></b>   <%-- Actividad --%>
                                </td>                            
                                <td>
                                    &nbsp;
                                </td>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <%-- Producto --%>
                                <td class="campocaja">
                                    <select name = "SPRODUC" id ="SPRODUC" size="1" class="campo campotexto" style="width:90%" 
                                    title="<fmt:message key="100829"/>" onchange="f_recarga_combos('P')">
                                        <option value="null"> - <fmt:message key="108341"/> - </option>
                                        <c:forEach items="${sessionScope.IMP_LSTPRODUCTOS}" var="item">
                                            <option value = "${item.SPRODUC}" <c:if test="${__formdata.SPRODUC != 'null' && __formdata.SPRODUC == item.SPRODUC}"> selected </c:if>>${item.TTITULO}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <%-- Actividad --%>
                                <td class="campocaja">
                                    <select name="CACTIVI" id="CACTIVI" size="1" class="campo campotexto" style="width:90%" 
                                    title="<fmt:message key="103481"/>" onchange="f_recarga_combos('A')">
                                        <option value="null"> - <fmt:message key="108341"/> - </option>
                                        <c:forEach items="${sessionScope.IMP_LSTACTIVIDADES}" var="item">
                                            <option value = "${item.CACTIVI}" <c:if test="${__formdata.CACTIVI != 'null' && __formdata.CACTIVI == item.CACTIVI}"> selected </c:if>>${item.TTITULO}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="titulocaja">
                                    <b><fmt:message key="100561"/></b>   <%-- Garantía --%>
                                </td>
                                <td class="titulocaja">
                                    <b><fmt:message key="9000719"/></b>   <%-- Forma de pago --%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <%-- Garantía --%>
                                <td class="campocaja">
                                    <select name="CGARANT" id="CGARANT" size="1" class="campo campotexto" style="width:90%" 
                                    title="<fmt:message key="100561"/>" onchange="">
                                        <option value="null"> - <fmt:message key="108341"/> - </option>
                                        <c:forEach items="${sessionScope.IMP_LSTGARANTIAS}" var="item">
                                            <option value = "${item.CGARANT}" <c:if test="${__formdata.CGARANT != 'null' && __formdata.CGARANT == item.CGARANT}"> selected </c:if>>${item.TGARANT}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <%-- Forma de pago --%>
                                <td class="campocaja">
                                    <select name="CFORPAG" id="CFORPAG" size="1" class="campo campotexto" style="width:90%" 
                                    title="<fmt:message key="9000719"/>" onchange="">
                                        <option value="null"> - <fmt:message key="108341"/> - </option>
                                        <c:forEach items="${sessionScope.IMP_LSTFORMASPAGO}" var="item">
                                            <option value = "${item.CATRIBU}" <c:if test="${__formdata.CFORPAG != 'null' && __formdata.CFORPAG == item.CATRIBU}"> selected </c:if>>${item.TATRIBU}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <table>
                        
                        <div class="separador">&nbsp; </div> 
                        <table class="seccion" align="center">
                            <tr>
                                <th style="width:2%;height:0px"></th>
                                <th style="width:33%;height:0px"></th>
                                <th style="width:33%;height:0px"></th>
                                <th style="width:31%;height:0px"></th>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="titulocaja">
                                    <b><fmt:message key="9000715"/></b>   <%-- Concepto --%>
                                </td>
                                <td class="titulocaja">
                                    <b><fmt:message key="9000720"/></b>   <%-- Tipo concepto --%>
                                </td>
                                <td class="titulocaja">
                                    <b><fmt:message key="9000723"/></b>   <%-- Valor concepto --%>
                                </td>
                            </tr>
                            <tr>                                
                                <td>
                                    &nbsp;
                                </td>
                                <%-- Concepto --%>
                                <td class="campocaja">
                                    <select name="CCONCEP" id="CCONCEP" size="1" class="campo campotexto" style="width:90%" obligatorio="true"
                                    title="<fmt:message key="9000715"/>" onchange="">
                                        <option value="null"> - <fmt:message key="108341"/> - </option>
                                        <c:forEach items="${sessionScope.IMP_LSTCONCEPTOS}" var="item">
                                            <option value = "${item.CATRIBU}" <c:if test="${__formdata.CCONCEP != 'null' && __formdata.CCONCEP == item.CATRIBU}"> selected </c:if>>${item.TATRIBU}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <%-- Tipo concepto --%>
                                <td class="campocaja">
                                    <select name="CTIPCON" id="CTIPCON" size="1" class="campo campotexto" style="width:90%" obligatorio="true"
                                    title="<fmt:message key="9000720"/>" onchange="">
                                        <option value="null"> - <fmt:message key="108341"/> - </option>
                                        <c:forEach items="${sessionScope.IMP_LSTTIPOSCONCEPTO}" var="item">
                                            <option value = "${item.CATRIBU}" <c:if test="${__formdata.CTIPCON != 'null' && __formdata.CTIPCON == item.CATRIBU}"> selected </c:if>>${item.TATRIBU}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <%-- Valor concepto --%>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:25%;" obligatorio="true"
                                    value="${__formdata.NVALCON}" name="NVALCON" id="NVALCON"                                    
                                    alt="<fmt:message key="9000723"/>" title="<fmt:message key="9000723"/>"/>
                                    <a style="vertical-align:middle;">
                                </td>
                            </tr>
                        </table>

                        <div class="separador">&nbsp; </div> 
                        <table class="seccion" align="center">
                            <tr>
                                <th style="width:2%;height:0px"></th>
                                <th style="width:33%;height:0px"></th>
                                <th style="width:33%;height:0px"></th>
                                <th style="width:31%;height:0px"></th>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="titulocaja">
                                    <b><fmt:message key="9000716"/></b>   <%-- F. ini. vigencia --%>
                                </td>
                                <td class="titulocaja">
                                    <b><fmt:message key="9000717"/></b>   <%-- F. fin vigencia --%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <%-- F. ini. vigencia --%>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:25%;" obligatorio="true"
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIVIG}"/>" name="FINIVIG" id="FINIVIG"
                                    alt="<fmt:message key="9000716"/>" title="<fmt:message key="9000716"/>" formato="fecha"
                                    <axis:atr f="axisimp005" c="FINIVIG" a="formato=fecha"/><a style="vertical-align:middle;"><img
                                    id="icon_FINIVIG" alt="<fmt:message key="108341"/>" title="<fmt:message key="108341" />" src="images/calendar.gif"/></a>
                                </td>            
                                <%-- F. fin vigencia --%>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:25%;"
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINVIG}"/>" name="FFINVIG" id="FFINVIG"
                                    alt="<fmt:message key="9000717"/>" title="<fmt:message key="9000717"/>" formato="fecha" readonly="readonly"
                                    <axis:atr f="axisimp005" c="FINIVIG" a="formato=fecha"/><%-- <a style="vertical-align:middle;"><img
                                    id="icon_FFINVIG" alt="<fmt:message key="108341"/>" title="<fmt:message key="108341" />" src="images/calendar.gif"/></a> --%>
                                </td>            
                            </tr>
                        </table>

                        <div class="separador">&nbsp; </div> 
                        <table class="seccion" align="center">
                            <tr>
                                <th style="width:2%;height:0px"></th>
                                <th style="width:98%;height:0px"></th>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="titulocaja">
                                    <b><fmt:message key="9000810"/></b>   <%-- Fraccionado --%>
                                    <input type="checkbox" id="CFRACCI" name="CFRACCI" onclick="this.checked ? this.value = 1 : this.value = 0"
                                    value="${__formdata.CFRACCI}"
                                    <c:if test="${__formdata.CFRACCI == '1'}"> checked="checked" </c:if> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="titulocaja">                                    
                                    <b><fmt:message key="9000811"/></b>   <%-- Bonifi. --%>
                                    <input type="checkbox" id="CBONIFI" name="CBONIFI" onclick="this.checked ? this.value = 1 : this.value = 0"
                                    value="${__formdata.CBONIFI}"
                                    <c:if test="${__formdata.CBONIFI == '1'}"> checked="checked" </c:if> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="titulocaja">
                                    <b><fmt:message key="9000812"/></b>   <%-- Rec. Fracc. --%>
                                    <input type="checkbox" id="CRECFRA" name="CRECFRA" onclick="this.checked ? this.value = 1 : this.value = 0"
                                    value="${__formdata.CRECFRA}"
                                    <c:if test="${__formdata.CRECFRA == '1'}"> checked="checked" </c:if> />
                                </td>                                            
                            </tr>                                        
                        </table>
                        
                        <div class="separador">&nbsp; </div>                                        
                        <c:import url="../include/botonera_nt.jsp">
                            <c:param name="f">axisimp005</c:param>
                            <c:param name="__botones">cancelar,aceptar</c:param>
                        </c:import>
                        <div class="separador">&nbsp; </div>       
                    </td>
                </tr>
            </table>
        </form>
        <c:import url="../include/mensajes.jsp" />
        
        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FINIVIG",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FINIVIG", 
                singleClick    :    true,
                firstDay       :    1
            });
            
            <%-- 
            Calendar.setup({
                inputField     :    "FFINVIG",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FFINVIG", 
                singleClick    :    true,
                firstDay       :    1
            });
            --%>
            
       </script>

    </body>
</html>
