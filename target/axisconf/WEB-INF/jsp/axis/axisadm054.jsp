<%/**
*  Fichero: axisadm054.jsp
*  @author <a href = "mailto:icanada@csi-ti.com">Ivan Canada</a>  
*	Calculo de la cuenta del activo y del pasivo	
*  Fecha: 15/09/2010
*/


%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.List" %>

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
        <script type="text/javascript">
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload(){
                f_cargar_propiedades_pantalla();                                
            }            
            
            function f_cargar_propiedades_pantalla(){
                f_cargapropietatexpander();
                f_cargar_valores_defecto();
                objDependencias.modificarPropiedadesSegunModificableYVisible();
                f_carga_dependencias();
                revisarEstilos();
            }
          
            
            function f_but_anterior() {
            }
           
            function f_but_cancelar() {
                objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");               
            }
            
            
            function f_recarga_combos(comboOrigen) {
                var CEMPRES = objDom.getValorPorId("CEMPRES");
                var CRAMO   = objDom.getValorPorId("CRAMO");                
               
                objAjax.invokeAsyncCGI("axis_axisadm054.do", callbackAjaxActualizarCombos, 
                "operation=actualizar_combos&comboOrigen=" + comboOrigen + "&CEMPRES=" + CEMPRES + 
                "&CRAMO=" + CRAMO, this, null, comboOrigen);
            }       
            
            
            function callbackAjaxActualizarCombos(ajaxResponseText, comboOrigen) {
                var doc = objAjax.domParse(ajaxResponseText);    
                try {            
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        
                        switch (comboOrigen) {
                            case 'E':   rellenarCombo(doc, "CRAMO");   // falls-through
                            case 'R':   rellenarCombo(doc, "SPRODUC"); 
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
                
                if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("SPRODUC")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("SPRODUC"), 0, 0);
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TTITULO")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TTITULO"), 0, 0);                            
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CRAMO")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CRAMO"), 0, 0);                            
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TRAMO")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TRAMO"), 0, 0);                            
                // The rest of the method, is unreachable code here, in AXISADM036. We've kept it for future extensions.
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CATRIBU")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CATRIBU"), 0, 0);
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TATRIBU")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TATRIBU"), 0, 0);
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CACTIVI")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CACTIVI"), 0, 0);                            
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TTITULO")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TTITULO"), 0, 0);                        
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CGARANT")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CGARANT"), 0, 0);                            
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TGARANT")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TGARANT"), 0, 0);                        
                }
                
                var retVal = new Array(2);
                retVal[0] = CATRIBU;
                retVal[1] = TATRIBU;
                
                return retVal;
            }
            
            function f_formatdate(entrada,title){
             var jDate = new JsFecha();
                if(entrada.value.length>0){
                    entrada.value=jDate.formateaFecha(entrada.value);
                
                    if(jDate.validaFecha(entrada.value)){
                        entrada.value=jDate.formateaFecha(entrada.value);
                    }else{
                        alert("<fmt:message key="1000421"/>");
                    }
                }
            }            
            
            
            function f_seleccionar_criterio(posicion)           
            {    
                objDom.setValorPorId ("INDICE",posicion);                   
                objUtiles.ejecutarFormulario("axis_axisadm054.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_recarga_datos()
            {
                f_recarga_combos('R');
                objDom.setValorPorId ("INDICE",0);                   
                objUtiles.ejecutarFormulario("axis_axisadm054.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_but_9001312()
            {              
                if (objValidador.validaEntrada()) {
                    objDom.setValorPorId("LINK_INFORME",'');
                    objDom.setValorPorId("LINK_INFORME2",'');
                    objUtiles.ejecutarFormulario("axis_axisadm054.do", "calcular", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
            
            function f_but_9901471()
            {                    
                var CEMPRES = objDom.getValorPorId("CEMPRES"); 
                var FVAL_BUS = objDom.getValorPorId("FVALORA");
                var SPRODUC = objDom.getValorPorId("SPRODUC");                    
                var CRAMO = objDom.getValorPorId("CRAMO");   
                
                var CALCULADO = objDom.getValorPorId("CALCULADO");      
                var CADENA;
                
                if (objUtiles.estaVacio(CALCULADO) || CALCULADO == 0)
                {
                    CADENA = "/axis_axisadm056.do?operation=form";                    
                } 
                else {
                    CADENA = "/axis_axisadm056.do?operation=buscar&CEM_BUS="+CEMPRES+"&FVAL_BUS="+FVAL_BUS;                    
                }                
                objUtiles.ejecutarFormulario("axis_axisadm054.do?CADENA="+CADENA, "consulta_resultado", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_borrar_criterio(NORDEN){
                if (confirm("<fmt:message key='1000167'/>"))
                {             
                objUtiles.ejecutarFormulario("axis_axisadm054.do?NORDEN="+NORDEN, "borrar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
            
            
            function f_imprimir_fitxer(pfitxer){
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?mantenerExtension=mantenerExtension&mimetype="+escape("text/xml")+"&operation=tunnel&file="+pfitxer,600,200);
            }  
            
            
            function f_but_9000569(){           
                objUtiles.ejecutarFormulario("axis_axisadm054.do", "montar_fichero", document.miForm, "_self", objJsMessages.jslit_cargando);                               
            }


            /*******************************************************************************************/
            /***************************************** MODAL *******************************************/
            /*******************************************************************************************/
            function f_cerrar_axisadm057()
            {
                objUtiles.cerrarModal("axisadm057");
            }
            
            function f_abrir_axisadm057(){
                var CEMPRES;
                CEMPRES = objDom.getValorPorId("CEMPRES");
                objUtiles.abrirModal("axisadm057", "src", "modal_axisadm057.do?operation=init&CEMPRES="+CEMPRES); 
            }
            
        </script>
        
       
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="f">axisadm054</c:param>
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><fmt:message key="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
        </c:import>
        <input type="hidden" name="operation"/>
        <c:if test="${!empty __formdata.LISTVALORES.LSTEMPRESAS && fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == 1  }">
                <input type="hidden" name="CEMPRES" value="${__formdata.LISTVALORES.LSTEMPRESAS[0].CEMPRES}" />
        </c:if>
        <input type="hidden" name="INDICE" id="INDICE"  value="${__formdata.INDICE}"/>
        <input type="hidden" name="CALCULADO" id="CALCULADO"  value="${__formdata.CALCULADO}"/>
        
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><fmt:message key="9901456" /></c:param>
                <c:param name="formulario"><fmt:message key="9901456" /></c:param>
                <c:param name="form">axisadm054</c:param>
        </c:import>
        
         <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><fmt:message key="9901473" /></c:param>
            <c:param name="nid" value="axisadm057" />
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
           <c:param name="nid_y_titulo">axisimprimir|<fmt:message key="1000205" />|true</c:param>
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

    <!-- Area de campos  -->
    <div class="separador">&nbsp;</div>
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0"> 
        <tr>
          <td>
            <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="9901456" /></div>
            <!--campos-->
             <table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:35%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisadm054" c="CEMPRES"> 
                                    <td class="titulocaja" ><!-- EMPRESA -->
                                         <b><axis:alt f="axisadm054" c="CEMPRES" lit="101619"></axis:alt></b>                                 
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisadm054" c="CRAMO">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisadm054" c="CRAMO" lit="100784"></axis:alt></b>
                                    </td>
                                </axis:ocultar>     
                                 <axis:ocultar f="axisadm054" c="SPRODUC"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisadm054" c="SPRODUC" lit="100829"></axis:alt></b>
                                    </td>
                                </axis:ocultar>  
                             </tr>
                             <tr>
                               <axis:ocultar f="axisadm054" c="CEMPRES"> 
                                   <c:choose>  
                                                <c:when test="${fn:length(__formdata.LISTVALORES.LSTEMPRESAS) > 1 && !empty __formdata.LISTVALORES.LSTEMPRESAS}">
                                                  <td class="campocaja">
                                                        <select name="CEMPRES" id ="CEMPRES" size="1"  class="campowidthinput campo campotexto" obligatorio="true" style="width:90%"
                                                        title="<fmt:message key="101619"/>" onchange="f_recarga_combos('E');f_recarga_datos();"
                                                        <axis:atr f="axisadm054" c="CEMPRES" a="isInputText=false&obligatorio=false"/>>
                                                            <option value="<%=Integer.MIN_VALUE%>"> - <fmt:message key="108341"/> - </option>                                                                                                        
                                                            <c:forEach items="${__formdata.LISTVALORES.LSTEMPRESAS}" var="item">
                                                                <option value = "${item.CEMPRES}" <c:if test="${!empty __formdata.CEMPRES && __formdata.CEMPRES == item.CEMPRES}"> selected </c:if>>${item.TEMPRES}</option>
                                                            </c:forEach>
                                                        </select>
                                                  </td>           
                                               </c:when>
                                    <c:otherwise> 
                                                 <td class="campocaja">
                                                 
                                                 <input type= "text" class="campo campotexto" obligatorio="true" id="CEMPRES" name="CEMPRES" value = "${__formdata.LISTVALORES.LSTEMPRESAS[0].TEMPRES}"
                                                 <axis:atr f="axisadm036" c="CEMPRES" a="modificable=false&obligatorio=true"/>/>
                                                   </td>    
                                                    </c:otherwise> 
                                     </c:choose>  
                                 </axis:ocultar>
                                 <axis:ocultar f="axisadm054" c="CRAMO"> 
                                     <td class="campocaja">
                                                    <select name="CRAMO" id ="CRAMO" size="1" class="campo campotexto" style="width:90%" 
                                                    title="<fmt:message key="100784"/>" onchange="f_recarga_combos('R');"
                                                    <axis:atr f="axisadm054" c="CRAMO" a="isInputText=false"/>>
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="108341"/> - </option>
                                                        <c:forEach items="${DOM_LSTRAMOS}" var="item">
                                                            <option value = "${item.CRAMO}" <c:if test="${!empty __formdata.CRAMO  && __formdata.CRAMO == item.CRAMO}"> selected </c:if>>${item.TRAMO}</option>
                                                        </c:forEach>
                                                    </select>
                                      </td>  
                                  </axis:ocultar>
                                  
                                  <axis:ocultar f="axisadm054" c="SPRODUC"> 
                                      <td class="campocaja" colspan="1">
                                                    <select name="SPRODUC" id ="SPRODUC" size="1" class="campo campotexto" style="width:95%"
                                                    title="<fmt:message key="100829"/>" <axis:atr f="axisadm054" c="SPRODUC" a="isInputText=false"/>>
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="108341"/> - </option>
                                                        <c:forEach items="${DOM_LSTPRODUCTOS}" var="item">
                                                            <option value = "${item.SPRODUC}" <c:if test="${!empty __formdata.SPRODUC  && __formdata.SPRODUC == item.SPRODUC}"> selected </c:if>>${item.TTITULO}</option>
                                                        </c:forEach>
                                                    </select>
                                       </td> 
                                   </axis:ocultar>
                             </tr>
                             <%-- SECCION 2 --%>
                             <tr> 
                                <axis:ocultar f="axisadm054" c="FVALORA"> 
                                    <td class="titulocaja" ><%-- Fecha Valoración --%>
                                        <b><axis:alt f="axisadm054" c="FVALORA" lit="105957"></axis:alt></b>                                 
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisadm054" c="PINTFUT"> 
                                    <td class="titulocaja" ><%-- Porcentaje Interes --%>
                                        <b><axis:alt f="axisadm054" c="PINTFUT" lit="9901468"></axis:alt></b>                                 
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisadm054" c="PCREDIBI"> 
                                    <td class="titulocaja" ><%-- Porcentaje de Credibilidad --%>
                                        <b><axis:alt f="axisadm054" c="PCREDIBI" lit="9901469"></axis:alt></b>                                 
                                    </td>
                                </axis:ocultar>
                             </tr>
                             <tr>                             
                                <%-- Fecha Valoración --%>
                                <axis:ocultar f="axisadm054" c="FVALORA"> 
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" obligatorio="true" size="15"                                               
                                                    value="<fmt:formatDate value='${__formdata.FVALORA}' pattern='dd/MM/yyyy'/>" name="FVALORA" id="FVALORA" onblur="javascript:f_formatdate(this,'')"
                                                    style="width:40%;" alt="<fmt:message key="105957"/>" title="<fmt:message key="105957"/>"
                                                    <axis:atr f="axisadm054" c="FVALORA" a="formato=fecha"/> /><a id="icon_FVALORA" style="vertical-align:middle;"><img 
                                                    alt="<fmt:message key="105957"/>" title="<fmt:message key="105957" />" src="images/calendar.gif"/></a>
                                    </td>                             
                                </axis:ocultar>
                                <%-- Interes Futuro --%>
                                <axis:ocultar f="axisadm054" c="PINTFUT"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="PINTFUT" name="PINTFUT" obligatorio="true" size="15" style="width:40%" alt="<fmt:message key="9901468"/>" title="<fmt:message key="9901468"/>"
                                                           value="<fmt:formatNumber value="${__formdata.PINTFUT}" pattern="###,##0.00"/>"/>                                                        
                                    </td>
                                </axis:ocultar>
                                 <%-- Porcentaje Credibilidad --%>
                                <axis:ocultar f="axisadm054" c="PCREDIBI"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="PCREDIBI" name="PCREDIBI" obligatorio="true" size="15" style="width:40%" alt="<fmt:message key="9901469"/>" title="<fmt:message key="9901469"/>"
                                                           value="<fmt:formatNumber value="${__formdata.PCREDIBI}" pattern="###,##0.00"/>" />                                                        
                                    </td>
                                </axis:ocultar>   
                             </tr>                             
                            <!-- Lista de Criterios -->
                            <tr>
                                    <td class="titulocaja" ><!-- LISTA CRITERIOS -->
                                         <b><axis:alt f="axisadm054" c="LCRITERIO" lit="9901470"></axis:alt></b>                                                                          
                                    </td>
                                    <td>
                                        <div style="float:right;"> <a href="javascript:f_abrir_axisadm057()"><img border="0" alt="<fmt:message key="1000428"/>" title="<fmt:message key="1000428"/>" src="images/new.gif"/></a></div>                                                                                             
                                    </td>
                                   
                            </tr> 
                            <tr id="Lista_criterios" >                                                                                       
                                <td colspan="2"> 
                                          <c:set var="title1"><fmt:message key="500102"/></c:set>  <%-- Orden --%>
                                          <c:set var="title2"><fmt:message key="9901468"/></c:set>   <%-- Interes Futuro --%>
                                          <c:set var="title3"><fmt:message key="9901469"/></c:set>   <%-- Fecha final (vencimiento)--%>
                                          <% int i=0; %>
                                          <c:set var="pos"><%=i%></c:set>
                                          <!-- Valores de columnas -->
                                          <div class="displayspace">                                             
                                            <display:table name="${axisctr_listaCriterios}" id="miListaId" export="false" class="dsptgtable" 
                                            pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                            requestURI="axis_axisadm054.do?operation=form&paginar=true">
                                              <%@ include file="../include/displaytag.jsp"%>
                                              <!-- Check versión -->
                                              <display:column headerClass="headwidth5 sortable fixed" title="" media="html" autolink="false" >
                                                <div class="dspIcons">                                                
                                                  <input value="${pos}"  <c:if test="${pos== __formdata.INDICE}">checked</c:if> onclick="javascript:f_seleccionar_criterio('${pos}')" type="radio" id="radioNVERSIO" name="radioNVERSIO" selected="true"/>
                                                </div>
                                              </display:column>                                              
                                              <!-- Número de versión versión -->
                                              <axis:visible f="axisadm054" c="NORDEN"> 
                                                  <display:column title="${title1}" sortable="true" sortProperty="NORDEN" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                    <div class="dspText">${miListaId.NORDEN}</div>
                                                  </display:column>
                                              </axis:visible>    
                                              <!-- Interes a Futuro -->
                                              <axis:visible f="axisadm054" c="PINTFUT"> 
                                                  <display:column title="${title2}" sortable="true" sortProperty="PINTFUT" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                    <div class="dspNumber"><fmt:formatNumber value="${miListaId.PINTFUT}" pattern="###,##0.00"/></div>                                                
                                                  </display:column>
                                              </axis:visible>    
                                              <!-- Credibilidad -->
                                              <axis:visible f="axisadm054" c="PCREDIBI"> 
                                                  <display:column title="${title3}" sortable="true" sortProperty="PCREDIBI" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                    <div class="dspNumber"><fmt:formatNumber value="${miListaId.PCREDIBI}" pattern="###,##0.00"/></div>                                                
                                                  </display:column>  
                                              </axis:visible>
                                              <%-- <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                                                                  <div class="dspIcons"><img border="0" alt="<fmt:message key="100002"/>" title1="<fmt:message key="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="javascript:f_modificarrecibo('${miListaId.NRECIBO}')"/></div>
                                                </display:column> --%>                                             
                                                <axis:visible f="axisadm054" c="NUEVO">
                                                   <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                        <div class="dspIcons"><img border="0" alt="<fmt:message key="9001333"/>" title1="<fmt:message key="9001333"/>" src="images/delete.gif" width="15px" height="15px"
                                                        style="cursor:pointer;" onclick="javascript:f_borrar_criterio('${miListaId.NORDEN}')"/></div>
                                                    </display:column>  
                                                </axis:visible>
                                                <%i++;%>
                                                <c:set var="pos"><%=i%></c:set>
                                            </display:table>
                                          </div>  
                                          
                                <div class="separador">&nbsp;</div>
                                </td>
                            </tr>
                             <!-- Seccion 3 Criterio -->
                            <tr>
                                <td class="titulocaja" colspan="2"><!-- CRITERIOS -->
                                         <b><axis:alt f="axisadm054" c="TCRITERIO" lit="9901472"></axis:alt></b>                                 
                                </td>                            
                            </tr>
                            <tr>
                                <td colspan="2">  
                                    <textarea class="campo" name="TCRITERIO" rows="2" cols="50" style="wdith:99%" <axis:atr f="axisadm054" c="TCRITERIO" a="modificable=false"/>>  ${axisctr_listaCriterios[__formdata.INDICE].TCRITERIO}</textarea>                                      
                                </td>  
                            </tr>
                            <!-- Seccion 4 Informes-->
                            <div class="separador">&nbsp;</div>
                            <table class="area" align="center">  
                                     <tr>
                                            <th style="width:50%;height:0px"></th>        
                                            <th style="width:50%;height:0px"></th>
                                     </tr>       
                                     <c:if test="${!empty __formdata.LINK_INFORME || !empty __formdata.LINK_INFORME2}">
                                        <tr>
                                            <axis:ocultar f="axisadm054" c="LINKS" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b id="label_LINKS"><fmt:message key="107913"/></b> <%-- Links fitxers generats --%>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                    </c:if>                                       
                                    <c:if test="${!empty __formdata.LINK_INFORME}">                                   
                                        <tr>
                                            <axis:ocultar f="axisadm054" c="LINK_INFORME" dejarHueco="false">
                                                <td class="campocaja" id="fichero">
                                                      <input type="text" readonly 
                                                   style="text-decoration:underline;background-color:transparent;border:0;cursor:pointer" 
                                                   onclick="javascript:f_imprimir_fitxer(this.value)" class="campowidthinput campo campotexto_ob" size="15"  name="LINK_INFORME" id="LINK_INFORME"
                                                   title="<fmt:message key="107913"/>" value="${__formdata.LINK_INFORME}"/>                                                                                                        
                                                </td>                                          
                                            </axis:ocultar>
                                            <td>                                            
                                        </tr>
                                       </c:if> 
                                       <c:if test="${!empty __formdata.LINK_INFORME2}">   
                                        <tr>
                                            <axis:ocultar f="axisadm054" c="LINK_INFORME2" dejarHueco="false">
                                                <td class="campocaja" id="fichero">
                                                      <input type="text" readonly 
                                                   style="text-decoration:underline;background-color:transparent;border:0;cursor:pointer" 
                                                   onclick="javascript:f_imprimir_fitxer(this.value)" class="campowidthinput campo campotexto_ob" size="15"  name="LINK_INFORME2" id="LINK_INFORME2"
                                                   title="<fmt:message key="107913"/>" value="${__formdata.LINK_INFORME2}"/>                                                                                                        
                                                </td>                                          
                                            </axis:ocultar>
                                            <td>                                            
                                        </tr>
                                    </c:if>
                                </table>
                                
                                
                            <div class="separador">&nbsp;</div>
                        </td>
                    </tr>
            </table>          
         </td>
        </tr>    
    </table>
    </table>
     

    <%--<c:param name="__botones">cancelar<c:if test="${__formdata.CESTADO == 1 || __formdata.CMODO == 'NVIGEN'}">,aceptar</c:if></c:param>--%>
    <c:import url="../include/botonera_nt.jsp">
        <c:param name="__botones">cancelar,9001312,9901471<c:if test="${__formdata.CALCULADO == 1}">,9000569</c:if></c:param>
    </c:import>
</form>

 <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FVALORA",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FVALORA", 
                singleClick    :    true,
                firstDay       :    1
            });
         </script>   

<c:import url="../include/mensajes.jsp" />
</body>
</html>

