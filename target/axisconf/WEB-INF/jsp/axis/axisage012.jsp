<%/*
*  Fichero: axisage012.jsp
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
        function f_onload() {     
            // Desplegar datos recibo
            f_cargar_propiedades_pantalla();
            document.miForm.CAGENTE.focus();
        }
        
        function f_but_salir() {
           objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisage012", "cancelar", document.miForm, "_self");                   
        }
		
		// 11/07/2019 cambiado de lo archivo axisadm049.jsp para este arquivo
        function f_but_109006() {
            /* IAXIS-4080cambiado de lo arquivo axisadm049 var valor = document.miForm.VALOR.value; */
            var valor = document.miForm.SPROCES.value;
            // alert(valor);
            //tarea 4080 20/06/2019 André Pfeiffer inicio
            //adicionada invocação do método para gerar relatório
                    if (!objUtiles.estaVacio(valor)){
                    	 var url="axis_axisage012.do?operation=descargar&SPROC="+valor;            
                         objAjax.invokeAsyncCGI_JSON(url, callbackReporte, "<axis:alt f='axisage012' c='MSG_CARGAR' lit='9905686'/>")
                    }
             //tarea 4080 20/06/2019 André Pfeiffer fim 
        }
      //tarea 4080 20/06/2019 André Pfeiffer inicio
        function callbackReporte (p) {     

            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");

            var odiv_OBFICHERO=document.getElementById("div_OBFICHERO");

            var div_OBFICHEROcontenido="";

            div_OBFICHEROcontenido=div_OBFICHEROcontenido+"<table align=\"center\" class=\"dsptgtable\">";
           
            if (p.JSON2.LIST_FICHEROS.OFICHERO!=null) {  
            	
                var list = p.JSON2.LIST_FICHEROS.OFICHERO;                      

                var str2 = list.replace(/barrainvertida/gi, "\\");   

                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+str2);

            }

        }
      //tarea 4080 20/06/2019 André Pfeiffer fim
	  // 11/07/2019 cambiado de lo archivo axisadm049.jsp para este arquivo

        function f_actualizar_agente(){
            if (objValidador.validaEntrada()) {
                objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE) + 
                    "&TRAMO=null&CRAMO=null", this, objJsMessages.jslit_cargando);
            } else {
                objDom.setValorPorId("TAGENTE","");
            }
        }

        function callbackAjaxCargarAgente(ajaxResponseText){
            try {    
                var doc=objAjax.domParse(ajaxResponseText);
                var elementos = doc.getElementsByTagName("element");
                
                objDom.setValorPorId("TAGENTE","");
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                        
                        objDom.setValorPorId("TAGENTE", NOMBREformateado); 
                        objDom.setValorPorId("CAGENTE", CAGENTEformateado); 
                        
                        //Borramos los datos del agente seleccionado
                        objLista.borrarFilasDeLista ("T_LISTTRASP", "6", "<axis:alt f='axisage012' c='T_LISTTRASP' lit='1000254' />");
                        objLista.borrarFilasDeLista ("T_DETTRASP", "6", "<axis:alt f='axisage012' c='T_DETTRASP' lit='1000254' />");
                    
                        //Si el agente seleccionado es igual que el agente destino, este se borra
                        if(CAGENTEformateado==document.miForm.CAGENTE2.value){
                            document.miForm.CAGENTE2.value="";
                            document.miForm.TAGENTE2.value="";
                        }
                            
                    } else {
                        objDom.setValorPorId("TAGENTE","");
                        objDom.setValorPorId("CAGENTE","");
                    }
                }
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            } 
        }
        
        function f_actualizar_agente2(){
            if (objValidador.validaEntrada()) {
                 objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxCargarAgente2, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE2) + 
                        "&TRAMO=null&CRAMO=null", this, objJsMessages.jslit_cargando);
            } else {
                objDom.setValorPorId("TAGENTE2","");
            }
        }
        
        function callbackAjaxCargarAgente2(ajaxResponseText){
            try {    
                var doc=objAjax.domParse(ajaxResponseText);
                var elementos = doc.getElementsByTagName("element");
                
                objDom.setValorPorId("TAGENTE2","");
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                        objDom.setValorPorId("TAGENTE2", NOMBREformateado); 
                        objDom.setValorPorId("CAGENTE2", CAGENTEformateado);
                    } else {
                        objDom.setValorPorId("TAGENTE2","");
                        objDom.setValorPorId("CAGENTE2","");
                    }
                }
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            } 
        }
        
        function f_cargar() {
            //Sólo recargamos valores cuando se cambia el agente de origen
            var CAGENTE = document.miForm.CAGENTE.value;
            var CAGENTE2 = document.miForm.CAGENTE2.value;
            var FTRASP = document.miForm.FTRASP.value;
            objDom.setValorPorId("FTRASP",FTRASP);
            if ((CAGENTE!=null && CAGENTE!='') || (CAGENTE2!=null && CAGENTE2!='') || (FTRASP!=null && FTRASP!='')){
            		objDom.setValorPorId("SPROCES", null);
                objUtiles.ejecutarFormulario("axis_axisage012.do", "form", document.miForm, "_self", objJsMessages.jslit_actualizando_registro);   //jslit_cargando
            }
        }
        
        function f_cargar_dettrasp(SPROCES) {
            if (SPROCES!=null && SPROCES!='') {
                objDom.setValorPorId("SPROCES", SPROCES);
                objUtiles.ejecutarFormulario("axis_axisage012.do", "form", document.miForm, "_self", objJsMessages.jslit_actualizando_registro);   //jslit_cargando
            }
        }
        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function callbackAjaxCambiarAgente(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);

            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                var QUIN_AGENT = objDom.getValorPorId("quin_agent");
                if(QUIN_AGENT == '1'){
                    objDom.setValorPorId("CAGENTE", CAGENTEformateado);
                    objDom.setValorPorId("TAGENTE", NOMBREformateado);
                    
                    //Borramos los datos del agente seleccionado
                    objLista.borrarFilasDeLista ("T_LISTTRASP", "6", "<axis:alt f='axisage012' c='T_LISTTRASP' lit='1000254' />");
                    objLista.borrarFilasDeLista ("T_DETTRASP", "6", "<axis:alt f='axisage012' c='T_DETTRASP' lit='1000254' />");
                    
                    //Si el agente seleccionado es igual que el agente destino, este se borra
                    if(CAGENTEformateado==document.miForm.CAGENTE2.value){
                        document.miForm.CAGENTE2.value="";
                        document.miForm.TAGENTE2.value="";
                    }
                } else {
                    objDom.setValorPorId("CAGENTE2", CAGENTEformateado);
                    objDom.setValorPorId("TAGENTE2", NOMBREformateado);
                }
            }
        }
        
        function f_abrir_axisctr014(QUIN_AGENT) {
            objDom.setValorPorId("quin_agent", QUIN_AGENT);
            objUtiles.abrirModal("axisctr014", "src", "modal_axisctr014.do?operation=form&CONDICION=TRASPASO_CARTERA");
        }
        
        function f_cerrar_axisctr014() {
            objUtiles.cerrarModal("axisctr014");
        }    

        function f_aceptar_axisctr014 (CAGENTE){
            objAjax.invokeAsyncCGI("axis_axisage012.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            f_cerrar_axisctr014();
        }
        
        function f_abrir_axisadm049(SPROCES) {
            objDom.setValorPorId("SPROCES", SPROCES);
            objUtiles.ejecutarFormulario("axis_axisage012.do", "consultarProceso", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
    </script>    
</head>


<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST" >         
    
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisage012" c="TITULO" lit="9901960"/></c:param>     <%-- Consulta de Traspasos --%>
            <c:param name="formulario"><axis:alt f="axisage012" c="TITULO" lit="9901960"/></c:param> <%-- Consulta de Traspasos --%>
            <c:param name="form">axisage012</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisage012" c="TITULO_AGE" lit="1000234" /></c:param>
            <c:param name="nid" value="axisctr014" />
        </c:import>
        
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="quin_agent"  id="quin_agent" value=""/>
        <input type="hidden" name="SPROCES"  id="SPROCES" value="${__formdata.SPROCES}"/>
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador"></div>
                    <div class="titulo"><axis:alt f="axisage012" c="TITULO" lit="9901960"/></div> <!-- Traspaso de cartera -->
                    <table class="area" align="center">
                        <tr>
                            <th style="width:12%;height:0px"></th>
                            <th style="width:26%;height:0px"></th>
                            <th style="width:12%;height:0px"></th>
                            <th style="width:26%;height:0px"></th>
                            <th style="width:12%;height:0px"></th>
                            <th style="width:12%;height:0px"></th>
                        </tr>   
                        <tr>
                            <td class="titulocaja">
                                <b><axis:alt f="axisage012" c="AGENTE_ORI" lit="9901958"/></b><!-- Agente origen -->
                            </td>
                            <td class="titulocaja">
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisage012" c="AGENTE_DEST" lit="9901959"/></b><!-- Agente destino -->
                            </td>
                            <td class="titulocaja">
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisage012" c="FTRASP" lit="9901135"/></b><!-- Fecha Traspaso -->
                            </td>
                            <td class="titulocaja">
                            </td>
                        </tr>
                        <tr>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CAGENTE}" name="CAGENTE" id="CAGENTE" formato="entero" title="<axis:alt f="axisage012" c="CAGENTE_ORI" lit="9901958"/>" size="5" style="width:75%"
                                title="<axis:alt f="axisage012" c="CAGENTE_ORI" lit="9901958"/>" onchange="f_actualizar_agente()"/>
                                <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014('1')" style="cursor:pointer"/>
                            </td>
                            <td class="campocaja">
                                <input type="text" class="campo campotexto" value="${__formdata.TAGENTE}" name="TAGENTE" id="TAGENTE" title="<axis:alt f="axisage012" c="TAGENTE_ORI" lit="9901958"/>" size="15" style="width:95%" readonly="true"
                                title="<axis:alt f="axisage012" c="TAGENTE_ORI" lit="9901958"/>"/>
                            </td>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CAGENTE2}" name="CAGENTE2" id="CAGENTE2" formato="entero" title="<axis:alt f="axisage012" c="CAGENTE_DEST" lit="9901959"/>" size="5" style="width:75%"
                                title="<axis:alt f="axisage012" c="CAGENTE_DEST" lit="9901959"/>" onchange="f_actualizar_agente2()"/>
                                <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014('2')" style="cursor:pointer"/>
                            </td>
                            <td>
                                <input type="text" class="campo campotexto" value="${__formdata.TAGENTE2}" name="TAGENTE2" id="TAGENTE2" title="<axis:alt f="axisage012" c="TAGENTE_DEST" lit="9901959"/>" size="15" style="width:95%" readonly="true"
                                title="<axis:alt f="axisage012" c="TAGENTE_DEST" lit="9901959"/>" />
                            </td>
                            <td class="campocaja">
                                <jsp:useBean id="today" class="java.util.Date" /> 
                                <input style="width:70%" type="text" class="campowidthinput campo campotexto" id="FTRASP" name="FTRASP" size="15" 
                                <axis:atr f="axisage012" c="FTRASP" a="modificable=true&formato=fecha"/> 
                                value="<fmt:formatDate value="${__formdata.FTRASP}" pattern="dd/MM/yyyy" />" title="<axis:alt f="axisage012" c="FTRASP" lit="9901135"/>"/><a id="icon_FTRASP" style="vertical-align:middle;"><img 
                                 alt="<axis:alt f="axisage012" c="LIT_SELECCIONAR" lit="108341"/>" title="<axis:alt f="axisage012" c="FTRASP" lit="9901135" />" src="images/calendar.gif"/></a>
                            </td>
                            <td>
                                <input type="button" class="boton" id="but_buscar" name="but_buscar" value="<axis:alt f="axisage012" c="BUT_BUSCAR" lit="9000508"/>" onclick="f_cargar()" /> 
                            </td>
                        </tr>
                    </table>
                
                    <tr><td>
                        <div class="separador"></div>
                        <div class="titulo">
                            <b><axis:alt f="axisage012" c="LIST_TRASP" lit="9901364" /></b> <!-- Listado de Traspasos -->
                        </div>
                        <table class="seccion">
                          
                          <!-- DisplayTag  -->
                          <tr><td>
                            <c:set var="title1"><axis:alt f="axisage012" c="TAGEINI" lit="9901958" /></c:set> <!-- Agente origen -->
                            <c:set var="title2"><axis:alt f="axisage012" c="TAGEFIN" lit="9901959" /></c:set> <!-- Agente destino -->
                            <c:set var="title3"><axis:alt f="axisage012" c="FTRASP" lit="9901135" /></c:set> <!-- Fecha traspaso -->
                            <c:set var="title4"><axis:alt f="axisage012" c="TESTADO" lit="100587" /></c:set> <!-- Estado -->
                            <c:set var="title5"><axis:alt f="axisage012" c="MAS" lit="1000113" /></c:set> <!-- Detalles -->
                            <c:set var="title6"><axis:alt f="axisage012" c="CPADREINI" lit="9903035" /></c:set> <!-- Sucursal -->
                            <c:set var="title7"><axis:alt f="axisage012" c="CPADREFIN" lit="9903035" /></c:set> <!-- Sucursal -->
                            <c:set var="title8"><axis:alt f="axisage012" c="TMOTRASPASO" lit="9907608" /></c:set>
                            <c:set var="title9"><axis:alt f="axisage012" c="TOBSERV" lit="101162" /></c:set>
                            
                            <div class="displayspace">
                            <display:table name="${lista_trasp}" id="T_LISTTRASP" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                               requestURI="axis_axisage012.do?paginar=true">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="" sortable="false" headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >
                                    <div class="dspIcons"><a name="${T_LISTTRASP.SPROCES}"/>
                                        <input type="radio" id="SPROCES_LIST" name="SPROCES_LIST" <c:if test="${(empty __formdata.SPROCES && __formdata.SPROCES == T_LISTTRASP.SPROCES) || (!empty __formdata.SPROCES && __formdata.SPROCES == T_LISTTRASP.SPROCES) }"> checked </c:if> value="${T_LISTTRASP.SPROCES}" onclick="f_cargar_dettrasp(${T_LISTTRASP.SPROCES})"/>
                                    </div>
                                </display:column>
                                <axis:visible c="CPADREINI" f="axisage012">
                                <display:column title="${title6}" sortable="true" sortProperty="TAGEINI" headerClass="sortable" media="html" autolink="false" >
                                    <div class="dspText" align="left">${T_LISTTRASP.CPADREINI}</div>
                                </display:column>
                                </axis:visible>
                                <display:column title="${title1}" sortable="true" sortProperty="TAGEINI" headerClass="sortable" media="html" autolink="false" >
                                    <div class="dspText" align="left">${T_LISTTRASP.CAGEINI} - ${T_LISTTRASP.TAGEINI}</div>
                                </display:column>  
                                <axis:visible c="CPADREFIN" f="axisage012">
                                <display:column title="${title7}" sortable="true" sortProperty="TAGEINI" headerClass="sortable" media="html" autolink="false" >
                                    <div class="dspText" align="left">${T_LISTTRASP.CPADREFIN}</div>
                                </display:column> 
                                </axis:visible>
                                <display:column title="${title2}" sortable="true" sortProperty="TAGEFIN" headerClass="sortable" media="html" autolink="false" >
                                    <div class="dspText" align="left">${T_LISTTRASP.CAGEFIN} - ${T_LISTTRASP.TAGEFIN}</div>
                                </display:column> 
                                <display:column title="${title3}" sortable="true" sortProperty="FTRASP" headerClass="sortable" media="html" autolink="false" >
                                    <div class="dspText" align="center"><fmt:formatDate value="${T_LISTTRASP.FTRASP}" pattern="dd/MM/yyyy" /></div>
                                </display:column>                           
                                <display:column title="${title4}" sortable="true" sortProperty="TESTADO" headerClass="sortable" media="html" autolink="false" >
                                    <div class="dspText" align="left">${T_LISTTRASP.TESTADO}</div>
                                </display:column>
                                <axis:visible f="axisage012" c="CMOTRASPASO"> 
                                    <display:column title="${title8}" sortable="true" sortProperty="TMOTRASPASO" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText" align="left">${T_LISTTRASP.TMOTRASPASO}</div>
                                    </display:column>
                                </axis:visible>
                                <axis:visible f="axisage012" c="TOBSERV" > 
                                    <display:column title="${title9}" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" style="width:5%">
                                        <div class="dspIcons" title="${T_LISTTRASP.TOBSERV}">
                                            <img border="0"
                                                alt='${T_LISTTRASP.TOBSERV}'
                                                title1='${T_LISTTRASP.TOBSERV}'
                                                src="images/mas.gif"
                                                width="11px" height="11px"
                                                style="cursor:pointer;"/>
                                        </div>
                                    </display:column>
                                </axis:visible>
                                <display:column title="${title5}" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" style="width:5%">
                                    <div class="dspIcons">
                                        <img border="0"
                                            alt='<axis:alt f="axisage012" c="MAS" lit="1000113"/>'
                                            title1='<axis:alt f="axisage012" c="MAS" lit="1000113"/>'
                                            src="images/mas.gif"
                                            width="11px" height="11px"
                                            style="cursor:pointer;"
                                            onclick="f_abrir_axisadm049(${T_LISTTRASP.SPROCES})"/>
                                    </div>
                                </display:column>
                            </display:table>
                            </div>
                          </td></tr>
                        </table>
                    </td></tr>
            
                    <tr><td>
                        <div class="separador"></div>
                        <div class="titulo">
                          <b><axis:alt f="axisage012" c="DET_TRASP" lit="9901962" /></b><!-- Detalls del Traspas -->
                        </div>
                        <table class="seccion">
                          
                          <!-- DisplayTag  -->
                          <tr><td>
                            <c:set var="title1"><axis:alt f="axisage012" c="TTIPTRA" lit="9900743" /></c:set> <!-- Tipo Traspaso -->
                            <c:set var="title2"><axis:alt f="axisage012" c="NPOLIZA" lit="151463" /></c:set> <!-- Nº Póliza -->
                            <c:set var="title3"><axis:alt f="axisage012" c="NRECIBO" lit="800636" /></c:set> <!-- Nº recibo -->
                            <c:set var="title4"><axis:alt f="axisage012" c="TESTADO" lit="100587" /></c:set> <!-- Estado -->
                            <div class="displayspaceGrande">
                              <display:table name="${lista_dettrasp}" id="T_DETTRASP" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                               requestURI="axis_axisage012.do?paginar=true">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="${title1}" sortable="true" sortProperty="TTIPTRA" headerClass="sortable" media="html" autolink="false" >
                                    <div class="dspText">${T_DETTRASP.TTIPTRA}</div>
                                </display:column>  
                                <display:column title="${title2}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable" media="html" autolink="false" >
                                    <div class="dspText">${T_DETTRASP.NPOLIZA}</div>
                                </display:column> 
                                <display:column title="${title3}" sortable="true" sortProperty="NRECIBO" headerClass="sortable" media="html" autolink="false" >
                                    <div class="dspText">${T_DETTRASP.NRECIBO}</div>
                                </display:column>  
                                <display:column title="${title4}" sortable="true" sortProperty="TESTADO" headerClass="sortable" media="html" autolink="false" >
                                    <div class="dspText">${T_DETTRASP.TESTADO}</div>
                                </display:column>  
                            </display:table>
                            </div>
                          </td></tr>
                        </table>
                    </td></tr>

                </td>
            </tr>
        </table>


        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisage012</c:param>
            <c:param name="__botones">salir<axis:visible
					c="BT_EJECUTAR" f="axisage012">,109006</axis:visible>
            </c:param> 
        </c:import> 
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
    <c:import url="../include/modal_estandar.jsp">
			<c:param name="nid_y_titulo">axisimprimir|<axis:alt
					f="${fname}" c="TAXISIMPRIMIR" lit="1000205" />|true</c:param>
		</c:import>

    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FTRASP",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FTRASP", 
            singleClick    :    true,
            firstDay       :    1
        });

        Calendar.setup({
            inputField     :    "buscarFCIERRE",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_buscarFCIERRE", 
            singleClick    :    true,
            firstDay       :    1
        });
     </script>

</body>
</html>
