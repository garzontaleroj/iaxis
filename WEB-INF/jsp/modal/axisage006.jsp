<%/* Revision:# 26px/kVLJhd2EjIdfa0XoQ== # */%>
<%/*
*  Fichero: axisage006.jsp
*
*  @author <a onclick="mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  Fecha: 29/12/2008
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/tree.css" type="text/css"></link>
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

    <style type="text/css">
        .displayspaceMaximo {
            width:99.8%;
            height: expression( this.scrollHeight > 349 ? "350px" : "auto" );
            max-height:350px;
            overflow-x: hidden;
            overflow-y: auto;
            border: 1px solid #DDDDDD;
        }
    </style>

    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_but_cancelar() {
           parent.f_cerrar_axisage006();
        }
        
        function f_but_buscar() {
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisage006.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }

        function f_seleccionar(CAGENTE, TAGENTE) {
            if (!objUtiles.estaVacio(CAGENTE)) {
                document.getElementById(CAGENTE).checked = true;
                parent.f_aceptar_axisage006(CAGENTE, TAGENTE);
            }
        }
       
        function f_but_aceptar() {
            var hayAlgunChecked = objUtiles.f_GuardaCasillasChecked ("selAgente");            
            if (hayAlgunChecked) {
                var agentSplit = objUtiles.utilSplit(hayAlgunChecked, "/");
                var CAGENTE = agentSplit[0];
                var TAGENTE = agentSplit[1];
                if (!objUtiles.estaVacio(CAGENTE)) 
                    parent.f_aceptar_axisage006(CAGENTE, TAGENTE);
            } else
                alert("<axis:alt f="axisage006" c="LIST_AGENTE" lit="1000411"/>");
        }
        
        function f_onload() {
            var CAGENTE = "${__formdata.CAGENTE}";
            
              if (!objUtiles.estaVacio(CAGENTE) ){
               document.miForm.CAGENTE.value = CAGENTE;
               document.miForm.TAGENTE.value = "${__formdata.TAGENTE}";
              }   
          f_cargar_propiedades_pantalla(); 
            revisarEstilos();
            //document.getElementById("CEMPRESA").focus();
        }
        
        function f_cerrar_axisctr014() {
            objUtiles.cerrarModal("axisctr014")
        } 
        
        function f_abrir_axisctr014(tipage) {        
               document.miForm.CTIPAGE_BUSC.value = tipage;
            if (!objUtiles.estaVacio(tipage))
            {             
                objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=CTIPAGE_"+tipage+"&CTIPAGE="+tipage);
            }
            else
            {             
                objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
            }
        }
        
        
        function f_aceptar_axisctr014 (CAGENTE){
            //objDom.setValorPorId("CAGENTE", CAGENTE);            
            f_cerrar_axisctr014();
            if (!objUtiles.estaVacio(document.miForm.CTIPAGE_BUSC.value))
                objAjax.invokeAsyncCGI("modal_axisage006.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            else
            {
                objAjax.invokeAsyncCGI("modal_axisage006.do", callbackAjaxCambiarAgente2, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            }
        }
        
        function callbackAjaxCambiarAgente(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
 
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                objDom.setValorPorId("CAGENTE_"+document.getElementById("CTIPAGE_BUSC").value, CAGENTEformateado);
                objDom.setValorPorId("NOMBRE_"+document.getElementById("CTIPAGE_BUSC").value, NOMBREformateado);
            }
        }
        
        function callbackAjaxCambiarAgente2(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
   
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                objDom.setValorPorId("CAGENTE", CAGENTEformateado);
              //  objDom.setValorPorId("TAGENTE", NOMBREformateado);
            }
        }
        
        function f_but_nuevo() {           
           parent.f_axisage006_nuevo();
           //objUtiles.cerrarModal("axisage006");
           //objUtiles.ejecutarFormulario("modal_axisage006.do", "editar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }

    </script>
  </head>
  
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axisage006.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisage006" c="TITULO" lit="9000713"/></c:param> <%-- Búsqueda Agentes --%>
            <c:param name="formulario"><axis:alt f="axisage006" c="TITULO" lit="9000713"/></c:param> <%-- Búsqueda Agentes --%>
            <c:param name="form">axisage006</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisper007|<axis:alt f="axisage006" c="TITULO_PANT" lit="9000714"/></c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr001" c="TIT_AXISCTR014" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
        </c:import>
        
        <input type="hidden" id="operation" name="operation" value=""/>
        <input type="hidden" name="CTIPAGE_BUSC" id="CTIPAGE_BUSC" value="${__formdata.CTIPAGE_BUSC}"/>  
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="3">            
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                        <tr>
                            <td>
                                <axis:ocultar f="axisage006" c="DSP_NIVELES">
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:16%;height:0%;"/>
                                            <th style="width:16%;height:0%;"/>
                                            <th style="width:16%;height:0%;"/>
                                            <th style="width:16%;height:0%;"/>
                                            <th style="width:16%;height:0%;"/>
                                            <th style="width:16%;height:0%;"/>
                                        </tr>
                                        
                                        <tr>
                                            <%  // Recuperamos parámetros de búsqueda si se ha efectuado alguna
                                                ArrayList niveles_age = null;
                                                if (request.getSession().getAttribute("AGENIVELES") != null){
                                                    niveles_age= (ArrayList)request.getSession().getAttribute("AGENIVELES");
                                                }
                                            %>
                                            <%if(niveles_age!=null){
                                                  for (int j=0;j<niveles_age.size();j=j+3){ 
                                                    if(j< niveles_age.size() &&((HashMap)niveles_age.get(j)).get("DESCRIP")!=null ) { %>
                                                        <c:set var="CTIPAGE_DESC"><%=((HashMap)niveles_age.get(j)).get("DESCRIP")%></c:set>
                                                        <c:set var="CTIPAGE"><%=((HashMap)niveles_age.get(j)).get("CTIPAGE")%></c:set>
                                                        <%if(j+1< niveles_age.size()) { %>
                                                            <c:set var="CTIPAGE_DESC1"><%=((HashMap)niveles_age.get(j+1)).get("DESCRIP")%></c:set>
                                                            <c:set var="CTIPAGE1"><%=((HashMap)niveles_age.get(j+1)).get("CTIPAGE")%></c:set>
                                                        <%}%>
                                                        <%if(j+2< niveles_age.size()) { %>
                                                            <c:set var="CTIPAGE_DESC2"><%=((HashMap)niveles_age.get(j+2)).get("DESCRIP")%></c:set>
                                                            <c:set var="CTIPAGE2"><%=((HashMap)niveles_age.get(j+2)).get("CTIPAGE")%></c:set>
                                                        <%}%>
                                                        <tr>
                                                            <td class="titulocaja" colspan="2">
                                                                <b><axis:alt f="axisage006" c="TIPDESC_<%=j%>" lit="${CTIPAGE_DESC}"></axis:alt></b>
                                                            </td>
                                                            <%if(j+1< niveles_age.size()) { %>
                                                                <td class="titulocaja" colspan="2">
                                                                    <b><axis:alt f="axisage006" c="TIPDESC_<%=j+1%>" lit="${CTIPAGE_DESC1}"></axis:alt></b>
                                                                </td>
                                                            <%}%>
                                                            <%if(j+2< niveles_age.size()) { %>
                                                                <td class="titulocaja" colspan="2">
                                                                    <b><axis:alt f="axisage006" c="TIPDESC_<%=j+2%>" lit="${CTIPAGE_DESC2}"></axis:alt></b>
                                                                </td>
                                                            <%}%>
                                                        <tr>
                                                            <td class="campocaja" colspan="2">
                                                                <input readonly="true" type="text" name="CAGENTE_<%=((HashMap)niveles_age.get(j)).get("CTIPAGE")%>" title="${CTIPAGE_DESC}" id="CAGENTE_<%=((HashMap)niveles_age.get(j)).get("CTIPAGE")%>"
                                                                value="" class="campowidthinput campo campotexto" style="width:20%" formato="entero" onchange="f_actualizar_agente()" />
                                                                <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014(${CTIPAGE})" style="cursor:pointer"/>
                                                                <input readonly="true" type="text" name="NOMBRE_<%=((HashMap)niveles_age.get(j)).get("CTIPAGE")%>" id="NOMBRE_<%=((HashMap)niveles_age.get(j)).get("CTIPAGE")%>" value="" class="campowidthinput campo campotexto" style="width:70%" />
                                                            </td>
                                                            <%if(j+1< niveles_age.size()) { %>
                                                                <td class="campocaja" colspan="2">
                                                                    <input readonly="true" type="text" name="CAGENTE_<%=((HashMap)niveles_age.get(j+1)).get("CTIPAGE")%>" title="${CTIPAGE_DESC1}" id="CAGENTE_<%=((HashMap)niveles_age.get(j+1)).get("CTIPAGE")%>"
                                                                    value="" class="campowidthinput campo campotexto" style="width:20%" formato="entero" onchange="f_actualizar_agente()" />
                                                                    <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014(${CTIPAGE1})" style="cursor:pointer"/> 
                                                                    <input readonly="true" type="text" name="NOMBRE_<%=((HashMap)niveles_age.get(j+1)).get("CTIPAGE")%>" id="NOMBRE_<%=((HashMap)niveles_age.get(j+1)).get("CTIPAGE")%>" value="" class="campowidthinput campo campotexto" style="width:70%" />
                                                                </td>
                                                            <%}%>
                                                            <%if(j+2< niveles_age.size()) { %>
                                                                <td class="campocaja" colspan="2">
                                                                    <input readonly="true" type="text" name="CAGENTE_<%=((HashMap)niveles_age.get(j+2)).get("CTIPAGE")%>" title="${CTIPAGE_DESC2}" id="CAGENTE_<%=((HashMap)niveles_age.get(j+2)).get("CTIPAGE")%>"
                                                                    value="" class="campowidthinput campo campotexto" style="width:20%" formato="entero" onchange="f_actualizar_agente()" />
                                                                    <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014(${CTIPAGE2})" style="cursor:pointer"/>  
                                                                    <input readonly="true" type="text" name="NOMBRE_<%=((HashMap)niveles_age.get(j+2)).get("CTIPAGE")%>" id="NOMBRE_<%=((HashMap)niveles_age.get(j+2)).get("CTIPAGE")%>" value="" class="campowidthinput campo campotexto" style="width:70%"/>
                                                                </td>
                                                            <%}%>
                                                        </tr>
                                                    <%}%>
                                                <%}%>
                                            <%}%>
                                        </tr>
                                    </table>
                                </axis:ocultar>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:25%;height:0%;"/>
                                        <th style="width:25%;height:0%;"/>
                                        <th style="width:25%;height:0%;"/>
                                        <th style="width:25%;height:0%;"/>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisage006" c="CEMPRESA">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisage006" c="EMPRESA" lit="101619"/></b> <%-- Empresa --%>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage006" c="FINICIO">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisage006" c="FECHA_INI" lit="9000526"/></b> <%-- Fecha inicio --%>
                                            </td>   
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisage006" c="CEMPRESA">
                                            <td class="campocaja">                                
                                                <select name="CEMPRESA" id="CEMPRESA" size="1" class="campowidthselect campo campotexto" style="width:79%;">&nbsp;
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage006" c="SELECC" lit="1000348"/> - </option>
                                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTEMPRESAS}">
                                                        <option value = "${element.CEMPRES}"
                                                        <c:if test="${__formdata.CEMPRESA == element.CEMPRES || fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == 1}"> selected = "selected"</c:if>>
                                                            ${element.TEMPRES} 
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td> 
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage006" c="FINICIO">
                                            <td class="campocaja">                             
                                                <c:if test="${empty __formdata.FINICIO}">
                                                <%((java.util.Map) request.getAttribute("__formdata")).
                                                    put("FINICIO", new java.util.Date());%>
                                                </c:if>
                                                <input type="text" class="campo campotexto" size="15" style="width:35%;"
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINICIO}"/>" name="FINICIO" id="FINICIO"
                                                title="<axis:alt f='axisage006' c='FECHA_INI' lit='9000526'/>" alt="<axis:alt f='axisage006' c='FECHA_INI' lit='9000526'/>"
                                                <axis:atr f="axisage006" c="FINICIO" a="obligatorio=true&formato=fecha"/> /><a style="vertical-align:middle;"><img
                                                id="icon_FINICIO" alt="<axis:alt f="axisage006" c="FINICIO" lit="100890"/>" title="<axis:alt f="axisage006" c="FINICIO" lit="100890" />" src="images/calendar.gif"/></a>
                                            </td> 
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisage006" c="TIPAGENTE">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisage006" c="TIPAGENTE" lit="9000519"/></b> <%-- Tipo Agente --%>
                                            </td>  
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage006" c="CACTIVO">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisage006" c="CACTIVO" lit="100786"/></b>  <%-- Activo --%>
                                            </td> 
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage006" c="CTIPMED">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisage006" c="CTIPMED" lit="9903395"/></b> <%-- Tipo Agente --%>
                                            </td>  
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage006" c="AGRUPADOR">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisage006" c="AGRUPADOR" lit="9903394"/></b>  <%-- Activo --%>
                                            </td> 
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisage006" c="TIPAGENTE">
                                            <td class="campocaja">                                
                                                <select name="TIPAGENTE" id="TIPAGENTE" size="1" class="campowidthselect campo campotexto" style="width:95%;">&nbsp;
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage006" c="SELECC" lit="1000348"/> - </option>
                                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTTIPOAGENTE}">
                                                        <option value = "${element.CATRIBU}"
                                                        <c:if test="${__formdata.TIPAGENTE == element.CATRIBU}"> selected = "selected"</c:if>>
                                                            ${element.TATRIBU} 
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td> 
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage006" c="CACTIVO">
                                            <td class="campocaja">                                
                                                <select name="CACTIVO" id="CACTIVO" size="1" class="campowidthselect campo campotexto" style="width:110%">&nbsp;                                        
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage006" c="SELECC" lit="1000348"/> - </option>
                                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTESTADOAGENTE}">
                                                        <option value = "${element.CATRIBU}" 
                                                        <c:if test="${__formdata.CACTIVO == element.CATRIBU}"> selected = "selected"</c:if>>
                                                            ${element.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td> 
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage006" c="CTIPMED">
                                            <td class="campocaja">                                
                                                <select name="CTIPMED" id="CTIPMED" size="1" class="campowidthselect campo campotexto" style="width:95%;">&nbsp;
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage006" c="SELECC" lit="1000348"/> - </option>
                                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTMEDIADOR}">
                                                        <option value = "${element.CATRIBU}"
                                                        <c:if test="${__formdata.CTIPMED == element.CATRIBU}"> selected = "selected"</c:if>>
                                                            ${element.TATRIBU} 
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td> 
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage006" c="AGRUPADOR">
                                            <td class="campocaja">                                
                                                <select name="AGRUPADOR" id="AGRUPADOR" size="1" class="campowidthselect campo campotexto" style="width:95%;">&nbsp;
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage006" c="SELECC" lit="1000348"/> - </option>
                                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTAGRUPADOR}">
                                                        <option value = "${element.CATRIBU}"
                                                        <c:if test="${__formdata.AGRUPADOR == element.CATRIBU}"> selected = "selected"</c:if>>
                                                            ${element.TATRIBU} 
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td> 
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisage006" c="CAGENTE">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisage006" c="CAGENTE" lit="9000531"/></b> <%-- Código agente --%>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage006" c="TAGENTE">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisage006" c="TAGENTE" lit="105940"/></b> <%-- Nombre --%>
                                            </td>     
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage006" c="NNUMIDE">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisage006" c="NNUMIDE" lit="9000760"/></b> <%-- Nombre --%>
                                            </td>   
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage006" c="RSOCIAL">
                                            <td class="titulocaja" colspan="2">
                                                <b><axis:alt f="axisage006" c="RSOCIAL" lit="9902379"/></b> <%-- Nombre --%>
                                            </td>  
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisage006" c="CAGENTE">
                                            <td class="campocaja">                             
                                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                value="${__formdata.CAGENTE}" name="CAGENTE" id="CAGENTE"
                                                style="width:40%;" formato="entero" title="<axis:alt f="axisage006" c="CAGENTE" lit="9000531"/>"
                                                <axis:atr f="axisage006" c="CAGENTE"/> />
                                               
                                             
                                            
                                            <axis:visible f="axisage006" c="BOTFIND">
                                            
                                            <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014('')" style="cursor:pointer"/>
                                            
                                            </axis:visible>
                                            </td>
                                        </axis:ocultar>
                                        
                                        
                                        
                                        <axis:ocultar f="axisage006" c="TAGENTE">
                                            <td class="campocaja">                             
                                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                value="${__formdata.TAGENTE}" name="TAGENTE" id="TAGENTE" 
                                                style="width:95%;" title="<axis:alt f="axisage006" c="TAGENTE" lit="105940"/>" />
                                            </td> 
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage006" c="NNUMIDE">
                                            <td class="campocaja">                             
                                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                value="${__formdata.NNUMIDE}" name="NNUMIDE" id="NNUMIDE" 
                                                style="width:40%;" title="<axis:alt f="axisage006" c="NNUMIDE" lit="9000760"/>" />
                                            </td> 
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage006" c="RSOCIAL">
                                            <td class="campocaja" colspan="2">                             
                                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                value="${__formdata.RSOCIAL}" name="RSOCIAL" id="RSOCIAL" 
                                                style="width:95%;" title="<axis:alt f="axisage006" c="RSOCIAL" lit="9902379"/>" />
                                            </td> 
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisage006" c="CPOSTAL">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisage006" c="CPOSTAL" lit="100823"/></b> <%-- Código agente --%>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage006" c="TELEFONO">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisage006" c="TELEFONO" lit="9000992"/></b> <%-- Nombre --%>
                                            </td>   
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage006" c="TNOMCOM">
                                            <td class="titulocaja" colspan="2">
                                                <b><axis:alt f="axisage006" c="TNOMCOM" lit="9903393"/></b> <%-- Nombre --%>
                                            </td>  
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisage006" c="CPOSTAL">
                                            <td class="campocaja">                             
                                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                value="${__formdata.CPOSTAL}" name="CPOSTAL" id="CPOSTAL"
                                                style="width:40%;" title="<axis:alt f="axisage006" c="CPOSTAL" lit="100823"/>"
                                                <axis:atr f="axisage006" c="CPOSTAL"/> />
                                            </td> 
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage006" c="TELEFONO">
                                            <td class="campocaja">                             
                                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                value="${__formdata.TELEFONO}" name="TELEFONO" id="TELEFONO"
                                                style="width:40%;" formato="entero" title="<axis:alt f="axisage006" c="TELEFONO" lit="9000992"/>"
                                                <axis:atr f="axisage006" c="TELEFONO"/> />
                                            </td>   
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage006" c="TNOMCOM">
                                            <td class="campocaja" colspan="2">                             
                                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                value="${__formdata.TNOMCOM}" name="TNOMCOM" id="TNOMCOM"
                                                style="width:95%;" title="<axis:alt f="axisage006" c="TNOMCOM" lit="9903393"/>"
                                                <axis:atr f="axisage006" c="TNOMCOM"/> />
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>
                                        <axis:ocultar f="axisage006" c="FAX">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisage006" c="FAX" lit="9903323"/></b> <%-- Nombre --%>
                                            </td>   
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage006" c="MAIL">
                                            <td class="titulocaja" colspan="2">
                                                <b><axis:alt f="axisage006" c="MAIL" lit="109792"/></b> <%-- Nombre --%>
                                            </td>  
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>
                                        <axis:ocultar f="axisage006" c="FAX">
                                            <td class="campocaja">                             
                                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                value="${__formdata.FAX}" name="FAX" id="FAX"
                                                style="width:40%;" formato="entero" title="<axis:alt f="axisage006" c="FAX" lit="9903323"/>"
                                                <axis:atr f="axisage006" c="FAX"/> />
                                            </td>    
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage006" c="MAIL">
                                            <td class="campocaja" colspan="2">                             
                                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                value="${__formdata.MAIL}" name="MAIL" id="MAIL"
                                                style="width:95%;" title="<axis:alt f="axisage006" c="MAIL" lit="109792"/>"
                                                <axis:atr f="axisage006" c="MAIL"/> />
                                            </td> 
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja" colspan="5">
                                            <div class="separador">&nbsp; </div>                                                                                                                            
                                            <%-- DisplayTag Agentes --%>
                                            <c:set var="title0"><axis:alt f="axisage006" c="EMPRESA" lit="101619"/></c:set>   <%-- Empresa --%>
                                            <c:set var="title1"><axis:alt f="axisage006" c="AGENTE" lit="100584"/></c:set>   <%-- Agente --%>
                                            <c:set var="title2"><axis:alt f="axisage006" c="TAGENTE" lit="105940"/></c:set>   <%-- Nombre --%>
                                            <c:set var="title3"><axis:alt f="axisage006" c="TIP_AGENTE" lit="9000519"/></c:set>  <%-- Tipo Agente --%>
                                            <%-- --%>
                                            <c:set var="title4"><axis:alt f="axisage006" c="TERRITORIO" lit="9903402"/></c:set>
                                            <c:set var="title5"><axis:alt f="axisage006" c="ZONA" lit="9901644"/></c:set>
                                            <c:set var="title6"><axis:alt f="axisage006" c="DELEGACION" lit="1000561"/></c:set>
                                            <c:set var="title7"><axis:alt f="axisage006" c="EJCOMERCIAL" lit="9903403"/></c:set> 
                                            <c:set var="title8"><axis:alt f="axisage006" c="MEDIADOR" lit="9901930"/></c:set>
                                            <c:set var="title9"><axis:alt f="axisage006" c="TIP_MED" lit="9903395"/></c:set>
                                            <c:set var="title10"><axis:alt f="axisage006" c="CP" lit="9903404"/></c:set> 
                                            <c:set var="title11"><axis:alt f="axisage006" c="TELEFONO" lit="9000992"/></c:set>                                            
                        
                                            <div class="displayspaceGrande">
                                                <display:table name="${__formdata.LSTAGENTES}" id="LSTAGENTES" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0" style="width:98%"
                                                     requestURI="modal_axisage006.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="" sortable="false" headerClass="sortable headwidth5 fixed"  media="html" autolink="false">
                                                        <div class="dspIcons">
                                                            <input type="radio" name="selAgente" id="${LSTAGENTES.CAGENTE}" value="${LSTAGENTES.CAGENTE}/${LSTAGENTES.TNOMBRE}"/>
                                                        </div>
                                                    </display:column>
                                                    <axis:visible f="axisage006" c="TEMPRES">
                                                        <display:column title="${title0}" sortable="true" sortProperty="TEMPRES" style="width:30%" headerClass="sortable fixed"  media="html" autolink="false">
                                                            <div class="dspText">
                                                                <span style="text-decoration:underline;cursor:pointer" onclick='javascript:f_seleccionar("${LSTAGENTES.CAGENTE}", this.id)' id="${LSTAGENTES.TNOMBRE}">
                                                                    ${LSTAGENTES.TEMPRES}
                                                                </span>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>                                                    
                                                    
                                                    <axis:visible f="axisage006" c="TERRITORIO">
                                                        <display:column title="${title4}" sortable="true" sortProperty="TERRITORIO" style="width:15%" headerClass="sortable fixed"  media="html" autolink="false">
                                                            <div class="dspText">
                                                                <span style="text-decoration:underline;cursor:pointer" onclick='javascript:f_seleccionar("${LSTAGENTES.CAGENTE}", this.id)' id="${LSTAGENTES.TNOMBRE}">
                                                                    ${LSTAGENTES.TERRITORIO}
                                                                </span>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisage006" c="ZONA">
                                                        <display:column title="${title5}" sortable="true" sortProperty="ZONA" style="width:15%" headerClass="sortable fixed"  media="html" autolink="false">
                                                            <div class="dspText">
                                                                <span style="text-decoration:underline;cursor:pointer" onclick='javascript:f_seleccionar("${LSTAGENTES.CAGENTE}", this.id)' id="${LSTAGENTES.TNOMBRE}">
                                                                    ${LSTAGENTES.ZONA}
                                                                </span>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisage006" c="DELEGACION">
                                                        <display:column title="${title6}" sortable="true" sortProperty="DELEGACION" style="width:15%" headerClass="sortable fixed"  media="html" autolink="false">
                                                            <div class="dspText">
                                                                <span style="text-decoration:underline;cursor:pointer" onclick='javascript:f_seleccionar("${LSTAGENTES.CAGENTE}", this.id)' id="${LSTAGENTES.TNOMBRE}">
                                                                    ${LSTAGENTES.DELEGACION}
                                                                </span>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisage006" c="EJCOMERCIAL">
                                                        <display:column title="${title7}" sortable="true" sortProperty="EJCOMERCIAL" style="width:15%" headerClass="sortable fixed"  media="html" autolink="false">
                                                            <div class="dspText">
                                                                <span style="text-decoration:underline;cursor:pointer" onclick='javascript:f_seleccionar("${LSTAGENTES.CAGENTE}", this.id)' id="${LSTAGENTES.TNOMBRE}">
                                                                    ${LSTAGENTES.EJCOMERCIAL}
                                                                </span>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisage006" c="MEDIADOR">
                                                        <display:column title="${title8}" sortable="true" sortProperty="MEDIADOR" style="width:15%" headerClass="sortable fixed"  media="html" autolink="false">
                                                            <div class="dspText">
                                                                <span style="text-decoration:underline;cursor:pointer" onclick='javascript:f_seleccionar("${LSTAGENTES.CAGENTE}", this.id)' id="${LSTAGENTES.TNOMBRE}">
                                                                    ${LSTAGENTES.MEDIADOR}
                                                                </span>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisage006" c="CAGENTE">
                                                        <display:column title="${title1}" sortable="true" sortProperty="CAGENTE" style="width:15%" headerClass="sortable fixed"  media="html" autolink="false">
                                                            <div class="dspText">
                                                                <span style="text-decoration:underline;cursor:pointer" onclick='javascript:f_seleccionar("${LSTAGENTES.CAGENTE}", this.id)' id="${LSTAGENTES.TNOMBRE}">
                                                                    ${LSTAGENTES.CAGENTE}
                                                                </span>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisage006" c="TNOMBRE">
                                                        <display:column title="${title2}" sortable="true" sortProperty=".TNOMBRE"  style="width:30%" headerClass="sortable fixed"  media="html" autolink="false">
                                                            <div class="dspText">
                                                                <span style="text-decoration:underline;cursor:pointer" onclick='javascript:f_seleccionar("${LSTAGENTES.CAGENTE}", this.id)' id="${LSTAGENTES.TNOMBRE}">
                                                                    ${LSTAGENTES.TNOMBRE}
                                                                </span>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisage006" c="TIPMED">
                                                        <display:column title="${title9}" sortable="true" sortProperty="TIPMED" style="width:15%" headerClass="sortable fixed"  media="html" autolink="false">
                                                            <div class="dspText">
                                                                <span style="text-decoration:underline;cursor:pointer" onclick='javascript:f_seleccionar("${LSTAGENTES.CAGENTE}", this.id)' id="${LSTAGENTES.TNOMBRE}">
                                                                    ${LSTAGENTES.TIPMED}
                                                                </span>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisage006" c="TTIPAGE">                                                    
                                                        <display:column title="${title3}" sortable="true" sortProperty="TTIPAGE"  style="width:25%" headerClass="sortable fixed"  media="html" autolink="false">
                                                            <div class="dspText">
                                                                <span style="text-decoration:underline;cursor:pointer" onclick='javascript:f_seleccionar("${LSTAGENTES.CAGENTE}", this.id)' id="${LSTAGENTES.TNOMBRE}">
                                                                    ${LSTAGENTES.TTIPAGE}
                                                                </span>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisage006" c="CPOSTAL">
                                                        <display:column title="${title10}" sortable="true" sortProperty="CPOSTAL" style="width:15%" headerClass="sortable fixed"  media="html" autolink="false">
                                                            <div class="dspText">
                                                                <span style="text-decoration:underline;cursor:pointer" onclick='javascript:f_seleccionar("${LSTAGENTES.CAGENTE}", this.id)' id="${LSTAGENTES.TNOMBRE}">
                                                                    ${LSTAGENTES.CPOSTAL}
                                                                </span>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisage006" c="TELF">
                                                        <display:column title="${title11}" sortable="true" sortProperty="TELF" style="width:15%" headerClass="sortable fixed"  media="html" autolink="false">
                                                            <div class="dspText">
                                                                <span style="text-decoration:underline;cursor:pointer" onclick='javascript:f_seleccionar("${LSTAGENTES.CAGENTE}", this.id)' id="${LSTAGENTES.TNOMBRE}">
                                                                    ${LSTAGENTES.TELF}
                                                                </span>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>                                                    
                                                </display:table>                                                        
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
            <c:param name="f">axisage006</c:param>
            <c:param name="__botones">cancelar,buscar,aceptar<axis:visible f="axisage006" c="BUT_NUEVO">,nuevo</axis:visible></c:param>
        </c:import>
        
        <div class="separador">&nbsp;</div>
    </form>
    <c:import url="../include/mensajes.jsp" />
    
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FINICIO",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FINICIO", 
            singleClick    :    true,
            firstDay       :    1
        });
   </script>

</body>
</html>