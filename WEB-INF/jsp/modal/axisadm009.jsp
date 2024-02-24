<%/*
*  Fichero: axisadm009.jsp
*  Alta-Mod. Plantillas Contables
*
*  Fecha: 07/01/2013
*/
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
        <title><axis:alt f="axisadm009" c="TITULO" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
            
                f_cargar_propiedades_pantalla();
            }
            
            function f_but_aceptar(){          //Guardar Plantilla
                var CEMPRES=objDom.getValorPorId("CEMPRES");
                var SMODCON=objDom.getValorPorId("SMODCON");
                var FINI=objDom.getValorPorId("FINI");
                var FFIN = objDom.getValorPorId("FFIN");
                
                if(objUtiles.estaVacio(FFIN)){
                      //Si no se informa la fecha fin, no hace nada, porque las lineas ya se han grabado          
                      parent.f_cerrar_axisadm009();
                
                }else{
                
                
                    if ( CEMPRES != null && SMODCON != null && !objUtiles.estaVacio(FINI) && !objUtiles.estaVacio(FFIN)){
                    var qs="operation=ajax_guardar_plantilla";
                    qs=qs+"&CEMPRES="+CEMPRES+"&SMODCON="+SMODCON+"&FINI="+FINI+"&FFIN="+FFIN;
                    
                    objAjax.invokeAsyncCGI("modal_axisadm009.do", callbackajaxGuardarPlantilla, qs, this);
                    } else {
                    alert("<axis:alt f="axisadm009" c="SELECCCIONAR" lit="108341"/>: <axis:alt f="axisadm009" c="EMPRESA" lit="101619"/> - <axis:alt f="axisadm009" c="TASIENTO" lit="9000567"/> - <axis:alt f="axisadm009" c="FECINI" lit="9000572"/>");
                    }
                
                
                
                }
                
            }
            
            function f_but_cancelar(){
                  parent.f_cerrar_axisadm009();
            }
            
            function f_but_9000508() {
                    objUtiles.ejecutarFormulario ("modal_axisadm009.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            
            function f_but_editar_cuerpoplantilla(NLINEA){  //Editar línea
                    NLINEA=NLINEA-1;
                    
                    var CEMPRES=objDom.getValorPorId("CEMPRES");
                    var SMODCON=objDom.getValorPorId("SMODCON");
                    var PLANTILLA = objDom.getValorPorId("PLANTILLA");
                    var FINI = objDom.getValorPorId("FINI");
                    qs="&NLINEA_SEL="+NLINEA+"&CEMPRES="+CEMPRES+"&SMODCON="+SMODCON+"&PLANTILLA="+PLANTILLA+"&FINI="+FINI;
                    
                    f_abrir_modal('axisadm010',null,qs);
            }
            
            
            function f_but_borrar_cuerpoplantilla(NLINEA_LIN){  //Borrar línea
                    
                    var CEMPRES=objDom.getValorPorId("CEMPRES");
                    var SMODCON=objDom.getValorPorId("SMODCON");
                    var FECHA=objDom.getValorPorId("FINI");
                    var PLANTILLA = objDom.getValorPorId("PLANTILLA");
                    //alert(FECHA);
                    //alert(PLANTILLA);
                    objUtiles.ejecutarFormulario ("modal_axisadm009.do?CEMPRES="+CEMPRES+"&SMODCON="+SMODCON+"&NLINEA_LIN="+NLINEA_LIN+"&FINI="+FECHA+"&PLANT="+PLANTILLA, "borrar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
          
            function f_but_9000668(){ //Nueva línea
                var CEMPRES=objDom.getValorPorId("CEMPRES");
                var SMODCON=objDom.getValorPorId("SMODCON");
                var PLANTILLA= objDom.getValorPorId("PLANTILLA");
                var FINI = objDom.getValorPorId("FINI");
              
                f_abrir_modal('axisadm010',null,'&CEMPRES='+CEMPRES+'&SMODCON='+SMODCON+'&PLANTILLA='+PLANTILLA+'&FINI='+FINI);
            }
            
             /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/
            
      
            function f_onchange_CEMPRES() {
            
            var CEMPRES=objDom.getValorPorId("CEMPRES");
            
                if (!objUtiles.estaVacio(CEMPRES)){
                    var qs="operation=ajax_cargar_asientos";
                    qs=qs+"&CEMPRES="+CEMPRES;
                    objAjax.invokeAsyncCGI("modal_axisadm009.do", callbackajaxAsientos, qs, this);
                } 
            }        

            function callbackajaxAsientos (ajaxResponseText){
                try{ 
            
            
                    var doc = objAjax.domParse(ajaxResponseText);
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var comboAsientos = document.miForm.SMODCON;   
                 
                        if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                   
                                objDom.borrarOpcionesDeCombo(comboAsientos);
                                objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", comboAsientos, 0);
                                for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                                    var TATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0].childNodes[0].nodeValue : "");
                                    var CATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0].childNodes[0].nodeValue : "");
                                    objDom.addOpcionACombo(CATRIBU, TATRIBU, comboAsientos, i+1);
                                }
                                    
                                    valor=document.miForm.CASIENT_AUX.value;
                                    
                                    document.miForm.SMODCON.selectedIndex = valor;
                           }else{
                          
                                objDom.borrarOpcionesDeCombo (comboAsientos);
                                objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", comboAsientos, null);
                            }
                    }
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
                }
            }
        
        
            function callbackajaxGuardarPlantilla (ajaxResponseText){
                try{ 
            
            
                    var doc = objAjax.domParse(ajaxResponseText);
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        alert("<axis:alt f="axisadm009" c="OPERACION_OK" lit="1000405"/>");
                        objDom.setDisabledPorId("but_aceptar",true); //boton guardar plantilla
                        parent.f_cerrar_axisadm009();
                    }
                 } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
                 }
            }
        
        
            
            /****************************************************************************************/
            /*******************************     MODALES    *****************************************/
            /****************************************************************************************/
            function f_cerrar_modal(cual) {
                objUtiles.cerrarModal(cual);
            }
        
            function f_aceptar_modal(cual, params) {
                f_cerrar_modal(cual);
                objUtiles.ejecutarFormulario("modal_axisadm009.do" + params, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }

            function f_cerrar_axisadm010(){
            
            objUtiles.cerrarModal("axisadm010");
            CEMPRES=objDom.getValorPorId("CEMPRES"); 
            SMODCON=objDom.getValorPorId("SMODCON");
            FINI=objDom.getValorPorId("FINI");
            //FFIN=objDom.getValorPorId("FFIN");
            //alert(CEMPRES+" - "+SMODCON+" - "+FINI);
            //alert("DISABLED OR NOT :"+document.miForm.CEMPRES.disabled);
            if(document.miForm.CEMPRES.disabled){
            objUtiles.ejecutarFormulario ("modal_axisadm009.do?CEMPRES="+CEMPRES+"&SMODCON="+SMODCON+"&FINI="+FINI, "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }else{
            objUtiles.ejecutarFormulario ("modal_axisadm009.do?", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            
            }
            }
            
            function f_abrir_modal(cual, noXButton, optionalQueryString) {
        
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                
                if (noXButton) 
                    objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                    objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
            }
  
           
        </script>
    </head>
    <body  onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
            <input type="hidden" name="CASIENT_AUX" value="${__formdata.SMODCON}" />
            <input type="hidden" name="NLINEA" value="" />
            <input type="hidden" name="FECHA" value="${__formdata.FINI}" />
                    
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisadm009" c="ALTAMOD" lit="9000570"/> <axis:alt f="axisadm009" c="TITULO2" lit="105371"/></c:param>
                <c:param name="formulario"><axis:alt f="axisadm009" c="ALTAMOD" lit="9000570"/> <axis:alt f="axisadm009" c="TITULO2" lit="105371"/></c:param>
                <c:param name="form">axisadm009</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisadm010|<axis:alt f="axisadm009" c="ALTAMOD" lit="9000570"/><axis:alt f="axisadm009" c="DETALLE" lit="1000113"/><axis:alt f="axisadm009" c="TITULO2" lit="105371"/></c:param>
            </c:import>
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
            <!-- Área de campos  -->
            <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                           <img src="images/flecha.gif"/><axis:alt f="axisadm009" c="DATOS_GENERALES" lit="103593"/>
                        </div>
                        <!-- Sección 1 -->
                        
                        <table class="seccion">
                            <tr>
                                <td >
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:50%;height:0px"></th>
                                            <th style="width:50%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisadm009" c="CEMPRES" dejarHueco="false">
                                               <td class="titulocaja" ><b><axis:alt f="axisadm009" c="CEMPRES" lit="101619"/></b></td><!--Empresa -->
                                            </axis:ocultar>
                                          
                                            <axis:ocultar f="axisadm009" c="SMODCON" dejarHueco="false">
                                               <td class="titulocaja" ><b><axis:alt f="axisadm009" c="SMODCON" lit="9000567"/></b></td><!--Tipo Asiento -->
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisadm009" c="CEMPRES" dejarHueco="false"> 
                                                <td class="campocaja">
                                                    <!--input type="text"  class="campowidthbig campo campotexto" id="TEMPRES" name="TEMPRES" size="15"
                                                    value="${__formdata.TEMPRES}" <axis:atr f="axisadm009" c="TEMPRES" a="modificable=false"/> /-->
                                                    <select name = "CEMPRES" id="CEMPRES" style="width:200px;"  size="1" onchange="javascript:f_onchange_CEMPRES();" class="campowidthselect campo campotexto_ob" <c:if test="${__formdata.NUEVO==null}"><axis:atr f="axisadm009" c="CEMPRES" a="modificable=false&isInputText=false"/></c:if><c:if test="${__formdata.NUEVO!=null}"><axis:atr f="axisadm009" c="CEMPRES" a="isInputText=false"/></c:if>
                                                    <option value = "null"> - <axis:alt f="axisadm009" c="SELECCIONE" lit="1000348"/> - </option>
                                                    <c:forEach var="empresa" items="${sessionScope.axisadm_listaEmpresas}">
                                                        <option value = "${empresa.CEMPRES}"
                                                            <c:if test="${empresa.CEMPRES == __formdata.CEMPRES}">selected</c:if>>
                                                            ${empresa.TEMPRES}
                                                        </option>
                                                    </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>                                           
                                          
                                            <axis:ocultar f="axisadm009" c="SMODCON" dejarHueco="false"> 
                                                <td class="campocaja">
                                                    <select name = "SMODCON" id="SMODCON" style="width:200px;" id ="codEmpresa" size="1" onchange="" class="campowidthselect campo campotexto_ob" <c:if test="${__formdata.NUEVO==null}"><axis:atr f="axisadm009" c="SMODCON" a="modificable=false&isInputText=false"/></c:if><c:if test="${__formdata.NUEVO!=null}"><axis:atr f="axisadm009" c="SMODCON" a="isInputText=false"/></c:if> >
                                                    <option value = "null"> - <axis:alt f="axisadm009" c="SELECCIONE" lit="1000348"/> - </option>
                                                    <c:forEach var="asiento" items="${sessionScope.axisadm_listaAsientos}">
                                                        <option value = "${asiento.CATRIBU}"
                                                            <c:if test="${asiento.CATRIBU == __formdata.SMODCON}">selected</c:if>>
                                                            ${asiento.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                    </select>
                                                    <!--input type="text"  class="campowidthbig campo campotexto" id="TASIENT" name="TASIENT" size="15"
                                                    value="${__formdata.TASIENT}" <axis:atr f="axisadm009" c="TASIENT" a="modificable=false"/> /-->
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisadm009" c="FINI" dejarHueco="false"> 
                                               <td class="titulocaja" ><b><axis:alt f="axisadm009" c="FINI" lit="9000572"/></b></td><!--Data inici vigència-->
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axisadm009" c="FFIN" dejarHueco="false">
                                               <td class="titulocaja" ><b><axis:alt f="axisadm009" c="FFIN" lit="9000527"/></b></td><!--Data fi vigència-->
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisadm009" c="FINI" dejarHueco="false"> 
                                                <td class="campocaja">
                                                <input type="text"  class="campowidth campo campotexto" id="FINI" name="FINI" size="15"
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINI}"/>" <c:if test="${__formdata.NUEVO==null}"><axis:atr f="axisadm009" c="FINI" a="modificable=false"/></c:if><c:if test="${__formdata.NUEVO!=null}"><axis:atr f="axisadm009" c="FINI" a=""/></c:if> />
                                                <c:if test="${__formdata.NUEVO!=null}">
                                                        <a style="vertical-align:middle;"><img 
                                                        id="icon_FINI" alt="<axis:alt f="axisadm009" c="SELECCIONAR" lit="108341"/>" title="<axis:alt f="axisadm009" c="FECREC" lit="102913"/>" src="images/calendar.gif"/></a>
                                                </c:if>
                                                </td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axisadm009" c="FFIN" dejarHueco="false">
                                                <td>
                                                <input type="hidden"  class="campowidth campo campotexto" id="PLANTILLA" name="PLANTILLA" size="15" 
                                                value="${__formdata.PLANTILLA}" />
                                                 <input type="text" style="width:25%" class="campowidthinput campo campotexto" onchange="" id="FFIN" name="FFIN" size="15"
                                                    value="<fmt:formatDate value='${__formdata.FFIN}' pattern='dd/MM/yyyy'/>" 
                                                    <axis:atr f="axisadm009" c="FFIN" a="obligatorio=false&formato=fecha"/> /><a id="icon_FFIN" style="vertical-align:middle;" href="#"><img id="popup_calendario_ffin" border="0" alt="<axis:alt f="axisadm009" c="SELECCIONAR" lit="108341"/>" title="<axis:alt f="axisadm009" c="SELECCIONAR" lit="108341"/>" src="images/calendar.gif"/></a>
                                                
                                                    <!--input type="text"  class="campowidth campo campotexto" id="FFIN" name="FFIN" size="15"
                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFIN}"/>" <axis:atr f="axisadm009" c="FFIN" a="modificable=true"/> /-->
                                                    <%--c:if test="${__formdata.NUEVO!=null}"--%>
                                                            <!--a style="vertical-align:middle;"><img 
                                                            id="icon_FFIN" alt="<axis:alt f="axisadm009" c="SELECCIONAR" lit="108341"/>" title="<axis:alt f="axisadm009" c="FECREC" lit="102913"/>" src="images/calendar.gif"/></a-->
                                                    <%--/c:if--%>
                                                
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <!-- Inicio Lista -->
                                        <tr>
                                            <td colspan="2">
                                                <table class="area" align="center"> 
                                                <tr>
                                                <td>
                                                    <axis:ocultar f="axisadm009" c="BT_NUEVO">
                                                        <div style="float:right;">
                                                            <a href="javascript:f_but_9000668();"> <!-- Nueva linea -->
                                                                <img border="0" alt="<axis:alt f="axisadm009" c="NUEVA_PLANTILLA" lit="9000669"/>" title="<axis:alt f="axisadm009" c="NUEVA_PLANTILLA" lit="9000669"/>" src="images/new.gif"/>
                                                            </a>
                                                        </div>
                                                    </axis:ocultar>
                                                </td>
                                                </tr>
                                                <tr>
                                                    <td class="titulocaja">    
                                                    <c:set var="title0"><axis:alt f="axisadm009" c="NLINEA" lit="9000455"/></c:set><!--Linea -->
                                                    <c:set var="title1"><axis:alt f="axisadm009" c="TDESCRI" lit="100588"/></c:set><!--Descripción -->
                                                    <c:set var="title2"><axis:alt f="axisadm009" c="CCUENTA" lit="104999"/></c:set><!--Cuenta contable -->
                                                    <c:set var="title3"><axis:alt f="axisadm009" c="TCUENTA" lit="9000573"/></c:set><!--Tipo  -->
                                                    <c:set var="title5"><axis:alt f="axisadm009" c="EDITAR" lit="100002"/></c:set>  <%-- Editar --%>
                                                    <c:set var="title6"><axis:alt f="axisadm009" c="ELIMINAR" lit="1000127"/></c:set>  <%-- Eliminar --%>
                                                    <div class="separador">&nbsp;</div>
                                                    <div id="dt_plamtillas" class="displayspace"> <!-- displayspaceModalGenerico -->
                                                        <display:table name="${sessionScope.listaLinea}" id="LSTLINEA" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                         requestURI="modal_axisadm009.do?paginar=true">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                        
                                                        <axis:visible f="axisadm009" c="NLINEA">                                            
                                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_DETMODCONTA.NLINEA" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">${LSTLINEA.OB_IAX_DETMODCONTA.NLINEA}</div>
                                                        </display:column>
                                                        </axis:visible>
                                                        <axis:visible f="axisadm009" c="TDESCRI">
                                                        <display:column title="${title1}" sortable="false" sortProperty="" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">${LSTLINEA.OB_IAX_DETMODCONTA.TDESCRI}</div>
                                                        </display:column>
                                                        </axis:visible>
                                                        <axis:visible f="axisadm009" c="CCUENTA">
                                                        <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_DETMODCONTA.CCUENTA" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">${LSTLINEA.OB_IAX_DETMODCONTA.CCUENTA}</div>
                                                        </display:column>
                                                        </axis:visible>
                                                        <axis:visible f="axisadm009" c="TCUENTA">
                                                        <display:column title="${title3}" sortable="false" sortProperty="" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">${LSTLINEA.OB_IAX_DETMODCONTA.TCUENTA}</div>
                                                        </display:column>
                                                        </axis:visible>
                                                        
                                                        <axis:visible f="axisadm009" c="BT_EDITAR">
                                                        <display:column title="${title5}" sortable="false" sortProperty="" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspIcons"><img border="0" alt="<axis:alt f="axisadm009" c="EDITAR" lit="100002"/>" title="<axis:alt f="axisadm009" c="EDITAR" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                                style="cursor:pointer;vertical-align:middle;" onclick="f_but_editar_cuerpoplantilla('${LSTLINEA.OB_IAX_DETMODCONTA.NUM_SEQ}');"/>
                                                            </div><!--Editar una plantilla -->
                                                        </display:column>
                                                        </axis:visible>
                                                        <axis:visible f="axisadm009" c="BT_ELIMINAR">
                                                        <display:column title="${title6}" sortable="false" sortProperty="" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspIcons"><img border="0" alt="<axis:alt f="axisadm009" c="ELIMINAR" lit="1000127"/>" title="<axis:alt f="axisadm009" c="ELIMINAR" lit="1000127"/>" src="images/delete.gif" width="15px" height="15px"
                                                                style="cursor:pointer;vertical-align:middle;" onclick="f_but_borrar_cuerpoplantilla('${LSTLINEA.OB_IAX_DETMODCONTA.NLINEA}');"/>
                                                            </div><!--borrar una plantilla -->
                                                        </display:column>
                                                        </axis:visible>
                                                        </display:table>
                                                    </div>
                                                    <div class="separador">&nbsp;</div>
                                                    </td>
                                                </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <!-- Fin lista    -->
                                    </table>
                                </td>
                            </tr>
                        </table>
 
                      <div class="separador">&nbsp;</div>
                        
             <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp">
               <c:param name="__botones">cancelar,aceptar</c:param>
               <c:param name="f">axisadm009</c:param>
            </c:import>
        </form>
        
        <script type="text/javascript">
        <c:if test="${__formdata.NUEVO!=null}">
            Calendar.setup({
                inputField     :    "FINI",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FINI", 
                singleClick    :    true,
                firstDay       :    1
            });
        </c:if>
            Calendar.setup({
                inputField     :    "FFIN",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FFIN", 
                singleClick    :    true,
                firstDay       :    1
            });
       
        </script>
        
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>