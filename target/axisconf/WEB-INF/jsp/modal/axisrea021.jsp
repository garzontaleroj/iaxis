<%/*
*  Fichero: axisrea021.jsp
*
*  Fecha: 29/06/2009
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
    <title><axis:alt f="axisrea021" c="titulo" lit="9001864"/></title> <%-- Buscador de facultativos --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
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
            document.getElementById("NPOLIZA").focus();
            revisarEstilos();  
            f_cargar_propiedades_pantalla();            
        }
        
        function thiss(thiss){
        thiss.value = f_formatdate(thiss);
        }
        
        function f_formatdate(entrada){
         var jDate = new JsFecha();

            if(entrada.value.length>0){
                entrada.value=jDate.formateaFecha(entrada.value);            
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    entrada.value = '';//alert('Formato fecha incorrecto para el campo '+ title);
                }
        }
         return entrada.value;
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisrea021');
        }
        
        function f_but_buscar() {
            if (objValidador.validaEntrada()) 
                objUtiles.ejecutarFormulario("modal_axisrea021.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);                
        }
        
        function f_seleccionar(SFACULT,CESTADO,SSEGURO) {            
            if (!objUtiles.estaVacio(SFACULT)) {
                document.getElementById(SFACULT).checked = true;
                parent.f_aceptar_axisrea021(SFACULT,CESTADO,SSEGURO);
            }
        }
       
        function f_but_aceptar() {
            var SFACULT = objUtiles.f_GuardaCasillasChecked ("selCesiones");            
            var CESTADO = objDom.getValorPorId("CESTADO2");
            var SSEGURO = objDom.getValorPorId("SSEGURO");           
            if (SFACULT) {                
                if (!objUtiles.estaVacio(SFACULT)) 
                    parent.f_aceptar_axisrea021(SFACULT,CESTADO,SSEGURO);
            } else
                alert("<axis:alt f="axisrea021" c="SFACULT" lit="1000174"/>");
        }
        
        function f_recarga_combos(comboOrigen) {
            var CEMPRES = objDom.getValorPorId("CEMPRES");
            var CRAMO   = objDom.getValorPorId("CRAMO");

            objAjax.invokeAsyncCGI("modal_axisrea021.do", callbackAjaxActualizarCombos, 
            "operation=ajax_actualizar_combos&comboOrigen=" + comboOrigen + "&CEMPRES=" + CEMPRES + "&CRAMO=" + CRAMO,
            this, null, comboOrigen);
        }
        
        function actualizarEstado(CESTADO){
            objDom.setValorPorId("CESTADO2", CESTADO);
            }
            
        function actualizarSeguro(SSEGURO){
            objDom.setValorPorId("SSEGURO", SSEGURO);
            }
        
        /****************************************************************************************/
        /******************************* CALLBACKS AJAX *****************************************/
        /****************************************************************************************/    
        
        function callbackAjaxActualizarCombos(ajaxResponseText, comboOrigen) {
            var doc = objAjax.domParse(ajaxResponseText);
            try {            
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    switch (comboOrigen) {
                        case 'E':   rellenarCombo(doc, "CRAMO");   // fall-through
                        case 'R':   rellenarCombo(doc, "SPRODUC"); // fall-through
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
            objDom.addOpcionACombo("", " - " + "<axis:alt f="axisrea021" c="titulo" lit="1000348"/>" + " - ", combo, null);
            
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
            
            if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("SPRODUC")[0])) {
                CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("SPRODUC"), 0, 0);
                if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TTITULO")[0]))
                    TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TTITULO"), 0, 0);                            
            } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CRAMO")[0])) {
                CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CRAMO"), 0, 0);                            
                if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TRAMO")[0]))
                    TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TRAMO"), 0, 0);                            
            }
            
            var retVal = new Array(2);
            retVal[0] = CATRIBU;
            retVal[1] = TATRIBU;
            
            return retVal;
        }            
        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisrea021" c="titulo" lit="9001864"/></c:param>     <%-- Buscador de facultativos --%>
                <c:param name="formulario"><axis:alt f="axisrea021" c="formulario" lit="9001864"/></c:param> <%-- Buscador de facultativos --%>
                <c:param name="form">axisrea021</c:param>
        </c:import>
            
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" id="CESTADO2" name="CESTADO2" value="${__formdata.CESTADO}"/>       
        <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>       
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                                <div class="separador">&nbsp;</div>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisrea021" c="CEMPRES" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_CEMPRES"><axis:alt f="axisrea021" c="CEMPRES" lit="101619"/></b> <%-- Empresa --%>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea021" c="CRAMO" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_CRAMO"><axis:alt f="axisrea021" c="CRAMO" lit="100784"/></b>   <%-- Ramo --%>
                                            </td>            
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea021" c="SPRODUC" dejarHueco="false">
                                            <td class="titulocaja" colspan="2">
                                                <b id="label_SPRODUC"><axis:alt f="axisrea021" c="SPRODUC" lit="100829"/></b> <%-- Producto --%>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisrea021" c="CEMPRES" dejarHueco="false">
                                            <td class="campocaja">
                                            <select name="CEMPRES" id="CEMPRES" size="1" class="campowidthselect campo campotexto" title="<axis:alt f="axisrea021" c="CEMPRES" lit="101619"/>"
                                             onchange="f_recarga_combos('E')">>&nbsp; 
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea021" c="CEMPRES" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.LISTVALORES.LSTEMPRESAS}">
                                                    <option value = "${element.CEMPRES}"
                                                    <c:if test="${__formdata.CEMPRES == element.CEMPRES || fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == 1}"> selected = "selected"</c:if>>
                                                        ${element.TEMPRES} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea021" c="CRAMO" dejarHueco="false">
                                            <td class="campocaja">
                                                <select name="CRAMO" id="CRAMO" size="1" class="campowidthselect campo campotexto" title="<axis:alt f="axisrea021" c="CRAMO" lit="100784"/>"
                                                 onchange="f_recarga_combos('R')">>
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea021" c="CRAMO" lit="1000348"/> - </option>
                                                    <c:forEach var="element" items="${sessionScope.REA_LSTRAMOS}">
                                                        <option value = "${element.CRAMO}"
                                                            <c:if test="${__formdata.CRAMO == element.CRAMO || fn:length(__formdata.LISTVALORES.LSTRAMOS) == 1}"> selected = "selected"</c:if>>
                                                                ${element.TRAMO}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea021" c="SPRODUC" dejarHueco="false">
                                            <td class="campocaja" colspan="2">
                                                <select name = "SPRODUC" id ="SPRODUC" size="1" style="width:70%" class="campowidthselect campo campotexto" title="<axis:alt f="axisrea021" c="SPRODUC" lit="100829"/>"> 
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea021" c="SPRODUC" lit="1000348"/> - </option>
                                                    <c:forEach var="element" items="${sessionScope.REA_LSTPRODUCTOS}">
                                                        <option value = "${element.SPRODUC}" <c:if test="${__formdata.SPRODUC == element.SPRODUC}">selected</c:if> >${element.TTITULO}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                
                                    <tr>
                                        <axis:ocultar f="axisrea021" c="NPOLIZA" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_NPOLIZA"><axis:alt f="axisrea021" c="NPOLIZA" lit="800242"/></b> <%-- Nº póliza --%>
                                            </td>            
                                        </axis:ocultar>
                                       
                                        <axis:ocultar f="axisrea021" c="NCERTIF" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_NCERTIF"><axis:alt f="axisrea021" c="NCERTIF" lit="101168"/></b> <%-- Certificado --%>
                                            </td>            
                                        </axis:ocultar>
                                         
                                        <axis:ocultar f="axisrea021" c="NSOLICI" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_NSOLICI"><axis:alt f="axisrea021" c="NSOLICI" lit="9000875"/></b> <%-- Nº Solicitud --%>
                                            </td>            
                                        </axis:ocultar>
                                        
                                        <axis:ocultar f="axisrea021" c="CESTADO" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_CESTADO"><axis:alt f="axisrea021" c="CESTADO" lit="100587"/></b> <%-- Estado --%>
                                            </td>            
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisrea021" c="NPOLIZA" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="NPOLIZA" name="NPOLIZA" size="15" 
                                                <axis:atr f="axisrea021" c="NPOLIZA" a="formato=entero"/>
                                                value="${__formdata.NPOLIZA}" style="width:60%"
                                                title="<axis:alt f="axisrea021" c="NPOLIZA" lit="800242"/>"/>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea021" c="NCERTIF" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="NCERTIF" name="NCERTIF" size="15" 
                                                <axis:atr f="axisrea021" c="NCERTIF" a="formato=entero"/>
                                                value="${__formdata.NCERTIF}" style="width:60%"
                                                title="<axis:alt f="axisrea021" c="NCERTIF" lit="101168"/>"/>
                                            </td>
                                        </axis:ocultar>
                                         <axis:ocultar f="axisrea021" c="NSOLICI" dejarHueco="false">
                                            <td class="titulocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="NSOLICI" name="NSOLICI" size="15" 
                                                <axis:atr f="axisrea021" c="NSOLICI" a="formato=entero"/>
                                                value="${__formdata.NSOLICI}" style="width:60%"
                                                title="<axis:alt f="axisrea021" c="NSOLICI" lit="9000875"/>"/>
                                            </td>            
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea021" c="CESTADO" dejarHueco="false">
                                            <td class="campocaja">
                                                <select name = "CESTADO" id ="CESTADO" size="1" onchange="" class="campowidthselect campo campotexto" title="<axis:alt f="axisrea021" c="CESTADO" lit="100587"/>"> 
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea021" c="CESTADO" lit="1000348"/> - </option>
                                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTESTADO}">
                                                        <option value = "${element.CATRIBU}" <c:if test="${__formdata.CESTADO == element.CATRIBU}">selected</c:if> >${element.TATRIBU}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    
                                    <tr>
                                        <axis:ocultar f="axisrea021" c="FEFEINI" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_FEFEINI"><axis:alt f="axisrea021" c="FEFEINI" lit="9000716"/></b> <%-- F.ini.vigencia --%>
                                            </td>            
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea021" c="FEFEFIN" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_FEFEFIN"><axis:alt f="axisrea021" c="FEFEFIN" lit="9000717"/></b> <%-- F.fin vigencia --%>
                                            </td>            
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea021" c="SFACULT" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_SFACULT"><axis:alt f="axisrea021" c="SFACULT" lit="9001918"/></b> <%-- F.fin vigencia --%>
                                            </td>            
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea021" c="SCUMULO" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_SCUMULO"><axis:alt f="axisrea021" c="SCUMULO" lit="104181"/></b> <%-- F.fin vigencia --%>
                                            </td>            
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisrea021" c="FEFEINI" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FEFEINI" name="FEFEINI" size="15" onchange="thiss(this);"
                                                <axis:atr f="axisrea021" c="FEFEINI" a="formato=fecha"/>
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEFEINI}"/>" style="width:35%"
                                                title="<axis:alt f="axisrea021" c="FEFEINI" lit="9000716"/>" <a style="vertical-align:middle;"><img
                                                id="icon_FEFEINI" alt="<axis:alt f="axisrea021" c="FEFEINI" lit="108341"/>" title="<axis:alt f="axisrea021" c="FEFEINI" lit="9000716"/>" src="images/calendar.gif"/></a>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea021" c="FEFEFIN" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FEFEFIN" name="FEFEFIN" size="15" onchange="thiss(this);" 
                                                <axis:atr f="axisrea021" c="FEFEFIN" a="formato=fecha"/>
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEFEFIN}"/>" style="width:35%"
                                                title="<axis:alt f="axisrea021" c="FEFEFIN" lit="9000717"/>"<a style="vertical-align:middle;"><img
                                                id="icon_FEFEFIN" alt="<axis:alt f="axisrea021" c="FEFEFIN" lit="9000717"/>" title="<axis:alt f="axisrea021" c="FEFEFIN" lit="9000717"/>" src="images/calendar.gif"/></a>
                                            </td>
                                        </axis:ocultar>
                                         <axis:ocultar f="axisrea021" c="SFACULT" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="SFACULT" name="SFACULT" size="15" 
                                                <axis:atr f="axisrea021" c="SFACULT" a="formato=entero"/>
                                                value="${__formdata.SFACULT}" style="width:60%"
                                                title="<axis:alt f="axisrea021" c="SFACULT" lit="9001918"/>"/>
                                            </td>
                                        </axis:ocultar>
                                         <axis:ocultar f="axisrea021" c="SCUMULO" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="SCUMULO" name="SCUMULO" size="15" 
                                                <axis:atr f="axisrea021" c="SCUMULO" a="formato=entero"/>
                                                value="${__formdata.SCUMULO}" style="width:60%"
                                                title="<axis:alt f="axisrea021" c="SCUMULO" lit="104181"/>"/>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja" colspan="5">
                                            <div class="separador">&nbsp; </div>                                                                                                                            
                                            <%-- DisplayTag Cesiones --%>
                                            <axis:ocultar f="axisrea021" c="NCERTIF" dejarHueco="false">
                                                <c:set var="title10"><axis:alt f="axisrea021" c="NCERTIF" lit="9900942"/></c:set>  <%-- Nº certificado --%>
                                            </axis:ocultar>
                                            <c:set var="title9"><axis:alt f="axisrea021" c="title9" lit="105051"/></c:set>  <%-- Nº facultativo --%>
                                            <c:set var="title0"><axis:alt f="axisrea021" c="title0" lit="9001875"/></c:set>   <%-- Nº póliza --%>
                                            <c:set var="title1"><axis:alt f="axisrea021" c="title1" lit="104181"/></c:set>   <%-- Cúmulo --%>
                                            <c:set var="title2"><axis:alt f="axisrea021" c="title2" lit="100587"/></c:set>   <%-- Estado --%>
                                            <c:set var="title3"><axis:alt f="axisrea021" c="title3" lit="9900941"/></c:set>  <%-- Movimiento --%>
                                            <c:set var="title4"><axis:alt f="axisrea021" c="title4" lit="110994"/></c:set>   <%-- Garantía --%>
                                            <c:set var="title5"><axis:alt f="axisrea021" c="title5" lit="9001894"/></c:set>  <%-- Contrato --%>
                                            <c:set var="title6"><axis:alt f="axisrea021" c="title6" lit="9001146"/></c:set>  <%-- Versión --%>
                                            <c:set var="title7"><axis:alt f="axisrea021" c="title7" lit="100890"/></c:set>   <%-- F.inicio --%>
                                            <c:set var="title8"><axis:alt f="axisrea021" c="title8" lit="9001159"/></c:set>  <%-- F.fin --%>
                                            
                        
                                            <div class="displayspaceGrande" >                                                
                                                <display:table name="${requestScope.LST_CUAFACUL}" id="LST_CUAFACUL" export="false" class="dsptgtable" pagesize="9" defaultsort="2" defaultorder="ascending"   requestURI="modal_axisrea021.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                                    <%@ include file="../include/displaytag.jsp"%>                                                    
                                                    <display:column title="" sortable="false" headerClass="sortable headwidth5 fixed"  media="html" autolink="false">
                                                        <div class="dspIcons">
                                                            <input type="radio" name="selCesiones" id="${LST_CUAFACUL.SFACULT}" value="${LST_CUAFACUL.SFACULT}" onclick="javascript:actualizarEstado('${LST_CUAFACUL.CESTADO}');javascript:actualizarSeguro('${LST_CUAFACUL.SSEGURO}')"/>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title9}" sortable="true" sortProperty="SFACULT" headerClass="fixed sortable"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            <span style="text-decoration:underline;cursor:pointer" onclick="javascript:f_seleccionar('${LST_CUAFACUL.SFACULT}','${LST_CUAFACUL.CESTADO}','${LST_CUAFACUL.SSEGURO}');">
                                                                ${LST_CUAFACUL.SFACULT}
                                                            </span>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title0}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            <span style="text-decoration:underline;cursor:pointer" onclick="javascript:f_seleccionar('${LST_CUAFACUL.SFACULT}','${LST_CUAFACUL.CESTADO}','${LST_CUAFACUL.SSEGURO}');">
                                                                ${LST_CUAFACUL.NPOLIZA}
                                                            </span>
                                                        </div>
                                                    </display:column>
                                                    
                                                    <axis:visible f="axisrea021" c="NCERTIF">
                                                         <display:column title="${title10}" sortable="true" sortProperty="NCERTIF" headerClass="sortable fixed"  media="html" autolink="false">
                                                            <div class="dspText">
                                                                <span style="text-decoration:underline;cursor:pointer" onclick="javascript:f_seleccionar('${LST_CUAFACUL.SFACULT}','${LST_CUAFACUL.CESTADO}','${LST_CUAFACUL.SSEGURO}');">
                                                                    ${LST_CUAFACUL.NCERTIF}
                                                                </span>
                                                            </div>
                                                        </display:column>                                                
                                                    </axis:visible>
                                                    
                                                    
                                                    <display:column title="${title1}" sortable="true" sortProperty="SCUMULO" headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            <span style="text-decoration:underline;cursor:pointer" onclick="javascript:f_seleccionar('${LST_CUAFACUL.SFACULT}','${LST_CUAFACUL.CESTADO}','${LST_CUAFACUL.SSEGURO}');">
                                                                ${LST_CUAFACUL.SCUMULO}
                                                            </span>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="TESTADO" headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            <span style="text-decoration:underline;cursor:pointer" onclick="javascript:f_seleccionar('${LST_CUAFACUL.SFACULT}','${LST_CUAFACUL.CESTADO}','${LST_CUAFACUL.SSEGURO}');">
                                                                ${LST_CUAFACUL.TESTADO}
                                                            </span>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true" sortProperty="NMOVIMI" headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            <span style="text-decoration:underline;cursor:pointer" onclick="javascript:f_seleccionar('${LST_CUAFACUL.SFACULT}','${LST_CUAFACUL.CESTADO}','${LST_CUAFACUL.SSEGURO}');">
                                                                ${LST_CUAFACUL.NMOVIMI}
                                                            </span>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title4}" sortable="true" sortProperty="CGARANT" headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            <span style="text-decoration:underline;cursor:pointer" onclick="javascript:f_seleccionar('${LST_CUAFACUL.SFACULT}','${LST_CUAFACUL.CESTADO}','${LST_CUAFACUL.SSEGURO}');">
                                                                ${LST_CUAFACUL.CGARANT}
                                                            </span>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title5}" sortable="true" sortProperty="SCONTRA" headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            <span style="text-decoration:underline;cursor:pointer" onclick="javascript:f_seleccionar('${LST_CUAFACUL.SFACULT}','${LST_CUAFACUL.CESTADO}','${LST_CUAFACUL.SSEGURO}');">
                                                                ${LST_CUAFACUL.SCONTRA}
                                                                
                                                            </span>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title6}" sortable="true" sortProperty="NVERSIO" headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            <span style="text-decoration:underline;cursor:pointer" onclick="javascript:f_seleccionar('${LST_CUAFACUL.SFACULT}','${LST_CUAFACUL.CESTADO}','${LST_CUAFACUL.SSEGURO}');">
                                                                ${LST_CUAFACUL.NVERSIO}
                                                            </span>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title7}" sortable="true" sortProperty="FINICUF" headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            <span style="text-decoration:underline;cursor:pointer" onclick="javascript:f_seleccionar('${LST_CUAFACUL.SFACULT}','${LST_CUAFACUL.CESTADO}','${LST_CUAFACUL.SSEGURO}');">
                                                                <fmt:formatDate value="${LST_CUAFACUL.FINICUF}" pattern="dd/MM/yyyy"/>
                                                            </span>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title8}" sortable="true" sortProperty="FFINCUF" headerClass="sortable fixed"  media="html" autolink="false"  style="width:12%">
                                                        <div class="dspText">
                                                            <span style="text-decoration:underline;cursor:pointer" onclick="javascript:f_seleccionar('${LST_CUAFACUL.SFACULT}','${LST_CUAFACUL.CESTADO}','${LST_CUAFACUL.SSEGURO}');">
                                                                <fmt:formatDate value="${LST_CUAFACUL.FFINCUF}" pattern="dd/MM/yyyy"/>
                                                            </span>
                                                        </div>
                                                    </display:column>
                                                </display:table>     
                                                
                                                  <c:choose>
                                                        <c:when test="${!empty requestScope.LST_CUAFACUL}">
                                                            <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                                                <script language="javascript">objUtiles.retocarDsptagtable("LST_CUAFACUL");</script>
                                                            </c:if>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <script language="javascript">
                                                               objLista.esconderListaSpans();
                                                               
                                                            </script>
                                                        </c:otherwise>
                                                  </c:choose>
                                            </div>
                                            <div class="separador">&nbsp; </div>                                                                                                                                                                        
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
            <c:param name="f">axisrea021</c:param>
            <c:param name="__botones">cancelar,buscar<c:if test="${!empty requestScope.LST_CUAFACUL}">,aceptar</c:if></c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
    
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FEFEINI",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEFEINI", 
            singleClick    :    true,
            firstDay       :    1
        });
        Calendar.setup({
            inputField     :    "FEFEFIN",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEFEFIN", 
            singleClick    :    true,
            firstDay       :    1
        });
    </script>

</body>
</html>