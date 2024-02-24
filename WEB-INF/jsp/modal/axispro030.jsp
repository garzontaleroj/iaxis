<%/**
*  Fichero: axispro030.jsp
*  Pantalla de mantenimiento de provisiones.
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>  
*
*  Fecha: 07/01/2009
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
        <title><fmt:message key="1000233"/></title>
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

        <c:import url="../include/carga_framework_js.jsp" />
        
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
                revisarEstilos();
                if (${requestScope.grabarOK == 'true'})
                    parent.f_aceptar_modal("axispro030");
                else {
                    var comboProvisiones = document.getElementsByTagName("select")[0];
                    f_actualizar_CREPORT(comboProvisiones);
                    
                    if (${__formdata.isNew == 'false'})                         
                        comboProvisiones.disabled = true;                    
                }
            }
            
            function f_but_9000479() {
                try {
                    document.miForm.TIPOPROV.setAttribute("obligatorio", "false"); 
                } catch (e) {}
                
                if (objValidador.validaEntrada())
                    objUtiles.ejecutarFormulario ("modal_axispro030.do", "validar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }

            function f_but_aceptar() {
                try {
                    document.miForm.TIPOPROV.setAttribute("obligatorio", "true"); 
                } catch (e) {}
                
                if (objValidador.validaEntrada())
                    objUtiles.ejecutarFormulario ("modal_axispro030.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }

            function f_but_cancelar() {
                parent.f_cerrar_modal("axispro030");
            }           
            
            function f_actualizar_CREPORT(combo) {
                var selected = combo.options[combo.selectedIndex];                
                var report = selected.getAttribute("report");
                if (!objUtiles.estaVacio(report))
                    objDom.setValorPorId('CREPORT', report);
                else
                    objDom.setValorPorId('CREPORT', '');
            }

        </script>
    </head>
   
    <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
        
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>             
            <input type="hidden" id="isNew" name="isNew" value="${__formdata.isNew}"/>             
            <input type="hidden" id="CEMPRES" name="CEMPRES" value="${__formdata.CEMPRES}"/>             
            <input type="hidden" id="existeProvision" name="existeProvision" value="${__formdata.existeProvision}"/>             
            
            <%
            String LSTCIDIOMAS = "";
            
            java.util.List<java.util.Map> LST_DESPROVISIONES = 
                (java.util.List<java.util.Map>) ((java.util.Map) request.getAttribute("__formdata")).get("LSTDESPROVISIONES");
            
            if (LST_DESPROVISIONES != null) {
                for (java.util.Map desProvision : LST_DESPROVISIONES) {
                    LSTCIDIOMAS += desProvision.get("CIDIOMA") + "@";
                }
            }
            %>
            
            <input type="hidden" id="LSTCIDIOMAS" name="LSTCIDIOMAS" value="<%= LSTCIDIOMAS %>">
                        
            <%-- Estos parámetros los tenemos como hiddens, ya que los combos están deshabilitados --%>
            <c:if test="${__formdata.isNew == 'false'}">
                <input type="hidden" id="CPROVIS" name="CPROVIS" value="${__formdata.CPROVIS}"/>             
                <input type="hidden" id="TIPOPROV" name="TIPOPROV" value="${__formdata.TIPOPROV}"/>             
            </c:if>
            
            <c:if test="${__formdata.isNew == 'true' && __formdata.existeProvision == 'true'}">
                <input type="hidden" id="TIPOPROV" name="TIPOPROV" value="${__formdata.TIPOPROV}"/>             
            </c:if>
            
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><fmt:message key="9000728"/></c:param> <%-- Mantenimiento de Provisiones --%>
                <c:param name="titulo"><fmt:message key="9000728"/></c:param>     <%-- Mantenimiento de Provisiones --%>
                <c:param name="form">axispro030</c:param>
            </c:import>
           
            <!-- Área de campos  -->
            <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp; </div>                                        
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                                <b><fmt:message key="101619"/></b>   <%-- Empresa --%>
                                            </td>
                                            <td class="titulocaja">
                                                &nbsp;
                                            </td>                    
                                        </tr>
                                        <tr>
                                            <%-- Empresa --%>
                                            <td class="campocaja">
                                                ${__formdata.TEMPRES}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                                <b><fmt:message key="102656"/></b>   <%-- Provisiones --%>
                                            </td>
                                            <td class="titulocaja">
                                                &nbsp;
                                            </td>                    
                                        </tr>
                                        <tr>
                                            <%-- Provisiones --%>
                                            <td class="campocaja" colspan="2">
                                                <select name="CPROVIS" id="CPROVIS" size="1" class="campo campotexto" style="width:95%" obligatorio="true"
                                                title="<fmt:message key="102656"/>"
                                                <c:if test="${__formdata.isNew == 'true'}"> onchange="f_but_9000479(); f_actualizar_CREPORT(this);"</c:if> >                                                                                                
                                                    <option value="null"> - <fmt:message key="1000348"/> - </option>
                                                    <c:forEach items="${__formdata.LISTVALORES.LSTPROVISIONES}" var="item">
                                                        <option report="${item.CREPORT}" value = "${item.CPROVIS}" <c:if test="${__formdata.CPROVIS != 'null' && __formdata.CPROVIS == item.CPROVIS}"> selected </c:if>>${item.CPROVIS} - ${item.TCPROVIS} - ${item.TLPROVIS}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            <%-- Botón validar --%>
                                            <%--
                                            <c:if test="${__formdata.isNew == 'true'}"> 
                                                <td class="campocaja">
                                                    <input type="button" onclick="f_but_9000479()" class="boton" value="<fmt:message key="9000479"/>"/>
                                                </td>
                                            </c:if>
                                            --%>
                                        </tr>                      
                                        <tr>
                                            <td class="titulocaja">
                                                <b><fmt:message key="9000447"/></b>   <%-- F. Baja --%>
                                            </td>
                                            <td class="titulocaja">
                                                <b><fmt:message key="9000729"/></b>   <%-- Tipo Provisión --%>
                                            </td>                    
                                            <td class="titulocaja">
                                                <b><fmt:message key="9000745"/></b>   <%-- Listado --%>
                                            </td>                    
                                        </tr>
                                        <tr>
                                            <%-- F. ini. vigencia --%>
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:60%;" 
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FBAJA}"/>" name="FBAJA" id="FBAJA"
                                                alt="<fmt:message key="9000447"/>" title="<fmt:message key="9000447"/>" formato="fecha"
                                                <axis:atr f="axisimp003" c="FBAJA" a="formato=fecha"/><a style="vertical-align:middle;"><img
                                                id="icon_FBAJA" alt="<fmt:message key="9000716"/>" title="<fmt:message key="9000716" />" src="images/calendar.gif"/></a>
                                            </td>            
                                            <%-- Tipo Provisión --%>
                                            <td class="campocaja">
                                                <select name="TIPOPROV" id="TIPOPROV" size="1" class="campo campotexto" style="width:90%" 
                                                title="<fmt:message key="9000729"/>" 
                                                <c:if test="${__formdata.isNew == 'false' || __formdata.existeProvision == 'true'}">disabled="disabled" </c:if>>
                                                    <option value="null"> - <fmt:message key="1000348"/> - </option>
                                                    <c:forEach items="${__formdata.LISTVALORES.LSTTIPOPROVISION}" var="item">
                                                        <option value="${item.CATRIBU}" <c:if test="${__formdata.TIPOPROV == item.CATRIBU}"> selected </c:if>>${item.CATRIBU} - ${item.TATRIBU}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>                                            
                                            <%-- Código Report --%>
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:60%;" 
                                                value="${__formdata.CREPORT}" name="CREPORT" id="CREPORT"
                                                alt="<fmt:message key="9000745"/>" title="<fmt:message key="9000745"/>"/>
                                            </td>            
                                        </tr>
                                        
                                        <tr>
                                            <td colspan = "4">
                                                <div class="separador">&nbsp; </div>                                        
                                                <div class="separador">&nbsp; </div>                                        
                                                <%-- DisplayTag Provisiones --%>
                                                <c:set var="title0"><fmt:message key="1000246"/></c:set>  <%-- Idioma --%>
                                                <c:set var="title1"><fmt:message key="1000518"/></c:set>  <%-- Provisión --%>
                                                <c:set var="title2"><fmt:message key="100588"/></c:set>  <%-- Descripción --%>
        
                                                <div class="displayspaceGrande">
                                                    <display:table name="${__formdata.LSTDESPROVISIONES}" id="LSTDESPROVISIONES" export="false" class="dsptgtable" pagesize="-1" cellpadding="0" cellspacing="0"
                                                         requestURI="modal_axispro030.do?paginar=true">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column title="${title0}" sortable="false" sortProperty="TIDIOMA" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${LSTDESPROVISIONES.TIDIOMA}
                                                            </div>
                                                        </display:column>
                                                        <display:column title="${title1}" sortable="false" sortProperty="TCPROVIS" headerClass="sortable" style="width:25%"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:98%;" 
                                                                id="TCPROVIS_${LSTDESPROVISIONES.CIDIOMA}" name="TCPROVIS_${LSTDESPROVISIONES.CIDIOMA}" 
                                                                value="${LSTDESPROVISIONES.TCPROVIS}"/>
                                                            </div>
                                                        </display:column>
                                                        <display:column title="${title2}" sortable="false" sortProperty="TLPROVIS" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:98%;" 
                                                                id="TLPROVIS_${LSTDESPROVISIONES.CIDIOMA}" name="TLPROVIS_${LSTDESPROVISIONES.CIDIOMA}" 
                                                                value="${LSTDESPROVISIONES.TLPROVIS}"/>
                                                            </div>
                                                        </display:column>                                                                                                                
                                                    </display:table>                                                        
                                                </div>
                                                <div class="separador">&nbsp; </div>                                        
                                            </td>                                                
                                        </tr>
                                    </table>           
                                </td>
                            </tr>
                        </table>                        
                        
                        <div class="separador">&nbsp; </div>                                        
                        <c:import url="../include/botonera_nt.jsp">
                            <c:param name="f">axispro030</c:param>
                            <c:param name="__botones">cancelar<c:if test="${__formdata.isNew == 'true'}">,9000479</c:if><c:if test="${__formdata.isNew == 'false' || !empty __formdata.existeProvision}">,aceptar</c:if></c:param>
                        </c:import>
                        
                    </td>
                </tr>
            </table>
            
        </form>
        <c:import url="../include/mensajes.jsp" />
        
        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FBAJA",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FBAJA", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>
        
    </body>
</html>
