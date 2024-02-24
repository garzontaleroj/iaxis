<%/*
*  Fichero: axispro007.jsp
*
*  @author <a href="mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  Fecha: 18/06/2008
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
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_but_cancelar() {
           parent.f_cerrar_modal("axispro007");
        }
        
        function f_but_aceptar() {
            var CMODINT = document.getElementById("CMODINT").checked ? 1 : 0;    
            var CINTREV = document.getElementById("CINTREV").checked ? 1 : 0;    
            
            objUtiles.ejecutarFormulario("modal_axispro007.do?CMODINT=" + CMODINT + "&CINTREV=" + CINTREV, 
                "grabarDatos", document.miForm, "_self");
        }
        
        function f_onload() {
            revisarEstilos();
            
            if (${param.hayCambios == true}) 
                document.getElementById("but_cancelar").style.display = "none";
            
            var grabarOK = ${requestScope.grabarOK == true};
            if (grabarOK) {
                parent.f_aceptar_modal("axispro007", "datostecnicos");
            } else {
                /* (Seleccionar el primer registro del cuadro si no hay ninguno seleccionado */
                if (!objUtiles.estaVacio(document.getElementById("radioCTIPO"))) {
                    var pantallaCTIPO = !objUtiles.estaVacio(document.getElementById("radioCTIPO").length) ? document.getElementById("radioCTIPO")[0]
                            : document.getElementById("radioCTIPO");                    
                    // Seleccionar el primer tipo de interés (si lo hay)
                    pantallaCTIPO.checked = true;
                    pantallaCTIPO.onclick();
                }
            }            
        }
        
        function f_onchange_NNIIGAR(value) {         
            document.getElementById("NCODINT_td").style.visibility = (value == 0 ? 'visible' : 'hidden');
            document.getElementById("INTERESPROD_td").style.visibility = (value == 0 ? 'visible' : 'hidden');            
            document.getElementById("NUEVO_INTERES_bt").style.visibility = (value == 0 ? 'visible' : 'hidden');            
        }
        
        function f_onchange_CMODINT(checked) {
            document.getElementById("CINTREV_td").style.visibility = (checked ? 'visible' : 'hidden');
        }
   
        /****************************************************************************************/
        /************************************* MODAL ********************************************/
        /****************************************************************************************/
        
        function f_abrir_axispro018(nuevo) {
            var queryString = "";
            
            if (!nuevo) {
                var NCODINT     = document.miForm.NCODINT.value;
                var intMinValue = <%= Integer.MIN_VALUE %>;
                if (NCODINT != intMinValue)
                    queryString = "&NCODINT=" +  NCODINT;
            }
            setTimeout("parent.f_cerrar_modal('axispro007')", 100);
            parent.f_abrir_modal('axispro018', true, queryString);
        }

        /****************************************************************************************/
        /******************************** RECARGA DISPLAYTAGS ***********************************/
        /****************************************************************************************/
        
            /* 1r Displaytag */
            function f_onchange_NCODINT(NCODINT) {
                var params = "&NCODINT=" + NCODINT; 
                objAjax.invokeAsyncCGI("modal_axispro007.do", callbackRecargarCuadroInteres,
                    "operation=recargarCuadroInteres" + params, this);
            }
            
            /* 2o Displaytag */
            function f_recargar_vigencias(NCODINT, CTIPO) {
                var params = "&NCODINT=" + NCODINT + "&CTIPO=" + CTIPO; 
                objAjax.invokeAsyncCGI("modal_axispro007.do", callbackRecargarVigencias,
                    "operation=recargarVigencias" + params, this);
            }
            
            /* 3r Displaytag */
            function f_recargar_tramos(NCODINT, CTIPO, FINICIO) {
                var params = "&NCODINT=" + NCODINT + "&CTIPO=" + CTIPO + "&FINICIO=" + FINICIO;
                objAjax.invokeAsyncCGI("modal_axispro007.do", callbackRecargarTramos,
                    "operation=recargarTramos" + params, this);    
            }
            
            /* 1r Displaytag */
            function callbackRecargarCuadroInteres (ajaxResponseText) {
                try {
                    var doc = objAjax.domParse(ajaxResponseText);
            
                    if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                        var tbody = objLista.obtenerBodyLista("INTERESPROD");
                        var tr = objLista.obtenerFilasBodyLista("INTERESPROD", tbody);
                        var primerRadio;     
                        var primerNCODINT;
                        var primerCTIPO;                        
                        
                        objLista.borrarFilasDeLista ("INTERESPROD", "2", "<fmt:message key='1000254' />");
                        objLista.borrarFilasDeLista ("INTERTECMOV", "4", "<fmt:message key='1000254' />");
                        objLista.borrarFilasDeLista ("INTERTECMOVDET", "3", "<fmt:message key='1000254' />");
                        
                        if (objDom.existeTag(doc, "OB_IAX_INTERTECPROD"))
                            // Si hay registros, eliminamos el tr "No se han encontrado datos"
                            objLista.borrarFilaVacia(tbody, tr);
                        
                        // Bucle para insertar cada una de las filas
                        for (var i = 0; i < objDom.numeroDeTags(doc, "OB_IAX_INTERTECPROD") ; i++) {
                            // Obtenemos el estilo para la fila que insertaremos
                            var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                            // Creamos una nueva fila vacia y le damos el estilo obtenido
                            var newtr = objLista.crearNuevaFila(rowstyle);
                            // Creamos un array de columnas a añadir a la nueva fila del displayTag
                            var newtd = new Array(2);
                            
                            var CTIPO   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTIPO")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPO"), i, 0) : "";
                            var TTIPO   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TTIPO")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTIPO"), i, 0) : "";                                
                            var NCODINT = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NCODINT")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("NCODINT"), i, 0) : "";                                 
                            
                            // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                            newtd[0] = objLista.addRadioButtonEnLista("radioCTIPO", CTIPO,
                                                "javascript:f_recargar_vigencias('" + NCODINT + "', '" + CTIPO + "');");      
                            
                            if (i == 0 && !objUtiles.estaVacio(newtd[0])) {
                                primerRadio = newtd[0];                                        
                                primerNCODINT = NCODINT;
                                primerCTIPO   = CTIPO;
                            }
                            newtd[1] = objLista.addTextoEnLista(TTIPO);                             
                            
                            // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                            objLista.addNuevaFila(newtd, newtr, tbody);                    
                        }
                        
                        if (!objUtiles.estaVacio(primerRadio)) {
                            // Marcamos el primero
                            objLista.estadoRadioCheckBox(primerRadio.getElementsByTagName("input"), true);                                                                          
                            f_recargar_vigencias(primerNCODINT, primerCTIPO);
                        }
                    } // Fi if
                } catch (e) {
                    // if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
            }
            
            /* 2o Displaytag */            
            function callbackRecargarVigencias(ajaxResponseText) {
                try {
                    var doc = objAjax.domParse(ajaxResponseText);
            
                    if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                        var tbody = objLista.obtenerBodyLista("INTERTECMOV");
                        var tr = objLista.obtenerFilasBodyLista("INTERTECMOV", tbody);
                        var primerRadio;     
                        var primerNCODINT; 
                        var primerCTIPO;
                        var primerFINICIO; 
                        objLista.borrarFilasDeLista ("INTERTECMOV", "4", "<fmt:message key='1000254' />");
                        objLista.borrarFilasDeLista ("INTERTECMOVDET", "3", "<fmt:message key='1000254' />");
                        
                        if (objDom.existeTag(doc, "OB_IAX_INTERTECPROD"))
                            // Si hay registros, eliminamos el tr "No se han encontrado datos"
                            objLista.borrarFilaVacia(tbody, tr);
                        
                        // Bucle para insertar cada una de las filas
                        for (var i = 0; i < objDom.numeroDeTags(doc, "OB_IAX_INTERTECPROD") ; i++) {
                            // Obtenemos el estilo para la fila que insertaremos
                            var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                            // Creamos una nueva fila vacia y le damos el estilo obtenido
                            var newtr = objLista.crearNuevaFila(rowstyle);
                            // Creamos un array de columnas a añadir a la nueva fila del displayTag
                            var newtd = new Array(4);
                            
                            var NCODINT = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NCODINT")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("NCODINT"), i, 0) : "";
                            var FINICIO = objUtiles.hayValorElementoXml(doc.getElementsByTagName("FINICIO")[i]) ? 
                                objUtiles.formateaTimeStamp(objDom.getValorNodoDelComponente(doc.getElementsByTagName("FINICIO"), i, 0)) : "";
                            var FFIN    = objUtiles.hayValorElementoXml(doc.getElementsByTagName("FFIN")[i]) ? 
                                objUtiles.formateaTimeStamp(objDom.getValorNodoDelComponente(doc.getElementsByTagName("FFIN"), i, 0)) : "";                    
                            var CTIPO   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTIPO")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPO"), i, 0) : "";
                            var TTRAMOTIP = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TTRAMOTIP")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTRAMOTIP"), i, 0) : "";
                            
                            // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                            newtd[0] = objLista.addRadioButtonEnLista("radioFINICIO", FINICIO,
                                                "javascript:f_recargar_tramos('" + NCODINT + "', '" + CTIPO + "', '" + FINICIO + "');");  
                                                
                            if (i == 0 && !objUtiles.estaVacio(newtd[0])) {
                                primerRadio = newtd[0];                                        
                                primerNCODINT   = NCODINT;
                                primerCTIPO     = CTIPO;
                                primerFINICIO   = FINICIO;
                            }
                            newtd[1] = objLista.addTextoEnLista(FINICIO); 
                            newtd[2] = objLista.addTextoEnLista(FFIN); 
                            newtd[3] = objLista.addTextoEnLista(TTRAMOTIP); 
                            
                            // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                            objLista.addNuevaFila(newtd, newtr, tbody);                    
                        }
                                                
                        if (!objUtiles.estaVacio(primerRadio)) {
                            // Marcamos el primero
                            objLista.estadoRadioCheckBox(primerRadio.getElementsByTagName("input"), true);                                                                          
                            f_recargar_tramos(primerNCODINT, primerCTIPO, primerFINICIO);
                        }
                    } // Fi if
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
            }
            
            /* 3r Displaytag */
            function callbackRecargarTramos(ajaxResponseText) {
                try {        
                    var doc = objAjax.domParse(ajaxResponseText);
            
                    if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                        var tbody = objLista.obtenerBodyLista("INTERTECMOVDET");
                        var tr = objLista.obtenerFilasBodyLista("INTERTECMOVDET", tbody);
                                        
                        objLista.borrarFilasDeLista ("INTERTECMOVDET", "3", "<fmt:message key='1000254' />");
                        
                        if (objDom.existeTag(doc, "OB_IAX_INTERTECMOVDETPROD"))
                            // Si hay registros, eliminamos el tr "No se han encontrado datos"
                            objLista.borrarFilaVacia(tbody, tr);
                        
                        // Bucle para insertar cada una de las filas
                        for (var i = 0; i < objDom.numeroDeTags(doc, "OB_IAX_INTERTECMOVDETPROD") ; i++) {
                            // Obtenemos el estilo para la fila que insertaremos
                            var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                            // Creamos una nueva fila vacia y le damos el estilo obtenido
                            var newtr = objLista.crearNuevaFila(rowstyle);
                            // Creamos un array de columnas a añadir a la nueva fila del displayTag
                            var newtd = new Array(3);
                            
                            var NHASTA  = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NHASTA")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("NHASTA"), i, 0) : "";
                            var NDESDE  = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NDESDE")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("NDESDE"), i, 0) : "";
                            var NINTTEC = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NINTTEC")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("NINTTEC"), i, 0) : "";                    
                            
                            // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                            newtd[0] = objLista.addNumeroEnLista(NDESDE); 
                            newtd[1] = objLista.addNumeroEnLista(NHASTA); 
                            newtd[2] = objLista.addNumeroEnLista(NINTTEC); 
                            
                            // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                            objLista.addNuevaFila(newtd, newtr, tbody);
                        }                
                    } // Fi if    
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
            }
            
    </script>
  </head>
  
  <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axispro007.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><fmt:message key="1000223"/></c:param>
            <c:param name="form">axispro007</c:param>
        </c:import>

        <input type="hidden" id="SPRODUC" name="SPRODUC" value="${__formdata.SPRODUC}"/>
        <input type="hidden" id="operation" name="operation" value=""/>
    
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                        <tr>
                            <th style="width:25%;height:0%;"/>
                            <th style="width:25%;height:0%;"/>
                            <th style="width:25%;height:0%;"/>
                            <th style="width:25%;height:0%;"/>
                        </tr>
                        <tr>
                            <td class="titulocaja">
                                <b><fmt:message key="1000238"/></b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <select name="NNIGGAR" id="NNIGGAR" size="1" class="campowidthselect campo campotexto" style="width:90%;">&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTNIVEL}">
                                        <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.OB_IAX_PRODDATOSTECNICOS.NNIGGAR}"> selected </c:if> />
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>        
                        </tr>
                 
                        <tr>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <hr class="seccion"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="titulocaja">
                                <b><fmt:message key="1000249"/></b>
                            </td>
                            <td class="titulocaja">
                                <b><fmt:message key="1000292"/></b>&nbsp;&nbsp;&nbsp;<input type="checkbox" id="CMODINT" 
                                onclick="f_onchange_CMODINT(this.checked)"
                                <c:if test="${__formdata.OB_IAX_PRODDATOSTECNICOS.CMODINT == 1}"> checked</c:if>
                                <axis:atr f="axispro007" c="CMODINT" a="modificable=false"/> /> 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <select name="NNIIGAR" id="NNIIGAR" size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                onchange="f_onchange_NNIIGAR(this.value)">&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTNIVEL}">
                                        <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.OB_IAX_PRODDATOSTECNICOS.NNIIGAR}"> selected </c:if> />
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>        
                            <td id="CINTREV_td" class="titulocaja" colspan="3" style="visibility:${__formdata.OB_IAX_PRODDATOSTECNICOS.CMODINT == 1 ? 'visible' : 'hidden'}">                                    
                                <b><fmt:message key="1000329"/></b>&nbsp;&nbsp;&nbsp;<input type="checkbox" id="CINTREV" 
                                <c:if test="${__formdata.OB_IAX_PRODDATOSTECNICOS.CINTREV == 1}"> checked</c:if>
                                <axis:atr f="axispro007" c="CINTREV" a="modificable=false"/>/> 
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <hr class="seccion"/>
                            </td>
                        </tr>
                        <tr>
                            <td id="NCODINT_td" class="titulocaja" style="visibility:${__formdata.OB_IAX_PRODDATOSTECNICOS.NNIIGAR == 0 ? 'visible' : 'hidden'}">                                                                
                                <b><fmt:message key="1000535"/></b>
                                <select name="NCODINT" id="NCODINT" size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                onchange="f_onchange_NCODINT(this.value)">>&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTNCODINT}">
                                        <option value = "${element.NCODINT}"
                                            <c:if test="${element.NCODINT == __formdata.OB_IAX_PRODDATOSTECNICOS.NCODINT}"> selected </c:if> />
                                            ${element.TTEXTO} 
                                        </option>
                                    </c:forEach>
                                </select>
                                <a onclick="f_abrir_axispro018(false)"><img border="0" alt="<fmt:message key="100002"/> <fmt:message key="1000252"/>" title="<fmt:message key="100002"/> <fmt:message key="1000252"/>" src="images/lapiz.gif"/></a>
                            </td>      
                            <td class="titulocaja">                                
                                <input id="NUEVO_INTERES_bt" type="button" class="boton" style="vertical-align:bottom;cursor:pointer;visibility:${__formdata.OB_IAX_PRODDATOSTECNICOS.NNIIGAR == 0 ? 'visible' : 'hidden'}" value="<fmt:message key="1000538"/>" onclick="f_abrir_axispro018(true)">                            
                            </td>
                        </tr>
                        <tr 
                        </tr>
                        <tr>
                            <td id="INTERESPROD_td" class="campocaja" colspan="4" style="visibility:${__formdata.OB_IAX_PRODDATOSTECNICOS.NNIIGAR == 0 ? 'visible' : 'hidden'}">
                                
                                <%-- Sub-subsección intereses por producto --%>                                 
                                <table cellspacing="5">
                                    <tr>
                                        <th style="width:45%;height:0%;"/>
                                        <th style="width:55%;height:0%;"/>
                                    </tr>
                                    <tr>
                                        <td align="left" colspan="2">
                                            <!-- DisplayTag 1 -->
                                            <c:set var="title1"><fmt:message key="100588"/></c:set> <%-- DESCRIPCIÓN --%>
                                            <div class="displayspace">
                                              <display:table name="${__formdata.OB_IAX_PRODDATOSTECNICOS.INTERESPROD}" id="INTERESPROD" export="false" class="dsptgtable" pagesize="6" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="modal_axispro007.do?paginar=true">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="" sortable="false" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                    <div class="dspIcons">
                                                        <input type="radio" id="radioCTIPO" name="radioCTIPO" value="${INTERESPROD.OB_IAX_INTERTECPROD.CTIPO}"
                                                        onclick="f_recargar_vigencias(${INTERESPROD.OB_IAX_INTERTECPROD.NCODINT}, ${INTERESPROD.OB_IAX_INTERTECPROD.CTIPO})"
                                                        <c:if test="${sessionScope.DATTECN_CTIPO == INTERESPROD.OB_IAX_INTERTECPROD.CTIPO}"> checked </c:if>/>
                                                    </div>
                                                </display:column>
                                                <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_INTERTECPROD.TTIPO" headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspText">${INTERESPROD.OB_IAX_INTERTECPROD.TTIPO}</div>
                                                </display:column>
                                              </display:table>                                            
                                            </div>
                                        </td>
                                    </tr>
                                <tr>
                                    <td>
                                        <!-- DisplayTag 2 -->
                                        <c:set var="title1"><fmt:message key="101159"/></c:set> <%-- VALOR --%>
                                        <c:set var="title2"><fmt:message key="103051"/></c:set> <%-- HASTA --%>   
                                        <c:set var="title3"><fmt:message key="1000540"/></c:set> <%-- TIPO DE TRAMO --%>                                           
                                        <div class="displayspace">
                                          <display:table name="${sessionScope.DATTECN_INTERTECMOV}" id="INTERTECMOV" export="false" class="dsptgtable" pagesize="6" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                           requestURI="modal_axispro007.do?paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="" sortable="false" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                <div class="dspIcons">
                                                    <input type="radio" id="radioFINICIO" name="radioFINICIO" value="${INTERTECMOV.OB_IAX_INTERTECPROD.FINICIO}"
                                                    onclick="f_recargar_tramos('${INTERTECMOV.OB_IAX_INTERTECPROD.NCODINT}', '${sessionScope.DATTECN_CTIPO}', '<fmt:formatDate pattern="dd/MM/yyyy" value="${INTERTECMOV.OB_IAX_INTERTECPROD.FINICIO}"/>')"
                                                    <c:if test="${sessionScope.DATTECN_FINICIO == INTERTECMOV.OB_IAX_INTERTECPROD.FINICIO}"> checked </c:if>/>
                                                </div>
                                            </display:column>
                                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_INTERTECPROD.FINICIO" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${INTERTECMOV.OB_IAX_INTERTECPROD.FINICIO}"/></div>                                                
                                            </display:column>
                                            <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_INTERTECPROD.FFIN" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${INTERTECMOV.OB_IAX_INTERTECPROD.FFIN}"/></div>
                                            </display:column>
                                            <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_INTERTECPROD.TTRAMOTIP" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${INTERTECMOV.OB_IAX_INTERTECPROD.TTRAMOTIP}</div>
                                            </display:column>
                                          </display:table>
                                        </div>
                                    </td>
                                    <td>
                                        <!-- DisplayTag 3 -->
                                        <c:set var="title1"><fmt:message key="100804"/></c:set> <%-- DES DE --%>
                                        <c:set var="title2"><fmt:message key="103051"/></c:set> <%-- HASTA --%>   
                                        <c:set var="title3"><fmt:message key="101467"/></c:set> <%-- PORCENTAJE --%>   
                                        <div class="displayspace">
                                          <display:table name="${sessionScope.DATTECN_INTERTECMOVDET}" id="INTERTECMOVDET" export="false" class="dsptgtable" pagesize="6" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                           requestURI="modal_axispro007.do?paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%>                                            
                                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_INTERTECMOVDETPROD.NDESDE" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${INTERTECMOVDET.OB_IAX_INTERTECMOVDETPROD.NDESDE}</div>
                                            </display:column>
                                            <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_INTERTECMOVDETPROD.NHASTA" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${INTERTECMOVDET.OB_IAX_INTERTECMOVDETPROD.NHASTA}</div>
                                            </display:column>
                                            <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_INTERTECMOVDETPROD.NINTTEC" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${INTERTECMOVDET.OB_IAX_INTERTECMOVDETPROD.NINTTEC}</div>
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
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="__botones">cancelar,aceptar</c:param></c:import>
        
    </form>
    <c:import url="../include/mensajes.jsp" />
</body>
</html>