<%/*
*  Fichero: axisadm026.jsp
*
*  Fecha: 19/02/2009
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><fmt:message key="9000962"/></title> <%-- Búsqueda de registros pendientes --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
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
    <c:import url="../include/carga_framework_js.jsp"/>
   
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() { 
            revisarEstilos();
            document.getElementById("SPROCES").focus();
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal("axisadm026");
        }
        
        function f_but_buscar() {
            if (objValidador.validaEntrada()) {
                parent.f_cerrar_modal("axisadm026");
                parent.f_aceptar_axisadm026(objDom.getValorPorId("SPROCES"), objDom.getValorPorId("FECHAINI"), objDom.getValorPorId("CTIPREG"), objDom.getValorPorId("CBANCO"), objDom.getValorPorId("TNOMBRE"), objDom.getValorPorId("NNUMREC")); 
            }
        }
                
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><fmt:message key="9000962"/></c:param>     <%-- Búsqueda de registros pendientes --%>
                <c:param name="formulario"><fmt:message key="9000962"/></c:param> <%-- Búsqueda de registros pendientes --%>
                <c:param name="form">axisadm026</c:param>
        </c:import>        
   
        <input type="hidden" name="operation" value=""/>
        
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    
                    <table class="seccion" cellpadding="0" cellspacing="0">
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
                                <b><fmt:message key="1000576"/></b>   <%-- Proceso --%>
                            </td>
                            <td class="titulocaja">
                                <b><fmt:message key="100562"/></b>   <%-- Fecha --%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <%-- Proceso --%>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:80%;"
                                value="${__formdata.SPROCES}" name="SPROCES" id="SPROCES"
                                alt="<fmt:message key="1000576"/>" title="<fmt:message key="1000576"/>" formato="entero"/>
                            </td>            
                            <%-- Fecha --%>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:25%;"                                
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FECHAINI}"/>"                                 
                                name="FECHAINI" id="FECHAINI" alt="<fmt:message key='100562'/>"
                                title="<fmt:message key='100562'/>" formato="fecha"/><a style="vertical-align:middle;"><img
                                id="icon_FECHAINI" alt="<fmt:message key="108341"/>" title="<fmt:message key="108341" />" src="images/calendar.gif"/></a>
                            </td>            
                        </tr>

                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja">
                                <b><fmt:message key="9000970"/></b>   <%-- Tipo registro --%>
                            </td>
                            <%--
                            <td class="titulocaja">
                                <b><fmt:message key="9000964"/></b>   <%-- Banco --%>
                            <%-- </td>
                            --%>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <%-- Tipo registro --%>
                            <td class="campocaja">
                                <select name="CTIPREG" id="CTIPREG" size="1" class="campowidthselect campo campotexto" style="width:81%;">&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTTIPREG}">
                                        <option value = "${element.CATRIBU}"
                                        <c:if test="${__formdata.CTIPREG == element.CATRIBU}"> selected = "selected"</c:if>>
                                            ${element.TATRIBU}   
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>            
                            <%-- Banco --%>
                            <%--
                            <td class="campocaja">
                                <select name="CBANCO" id="CBANCO" size="1" class="campowidthselect campo campotexto_ob" style="width:81%;">&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTBANCOS}">
                                        <option value = "${element.CATRIBU}"
                                        <c:if test="${__formdata.CBANCO == element.CATRIBU}"> selected = "selected"</c:if>>
                                            ${element.TATRIBU}   
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>            
                            --%>
                        </tr>                        
                        
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja">
                                <b><fmt:message key="9000759"/></b>   <%-- Nombre y Apellidos --%>
                            </td>
                            <td class="titulocaja">
                                <b><fmt:message key="100895"/></b>   <%-- Recibo --%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <%-- Nombre y Apellidos --%>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:80%;"
                                value="${__formdata.TNOMBRE}" name="TNOMBRE" id="TNOMBRE"
                                alt="<fmt:message key="9000759"/>" title="<fmt:message key="9000759"/>"/>
                            </td>            
                            <%-- Recibo --%>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:80%;"
                                value="${__formdata.NNUMREC}" name="NNUMREC" id="NNUMREC" formato="entero"
                                alt="<fmt:message key="100895"/>" title="<fmt:message key="100895"/>"/>
                            </td>            
                        </tr>                        
                                                
                    </table>
                </td>     
            </tr>            
        </table>
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="__botones">cancelar,buscar</c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>

    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FECHAINI",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FECHAINI", 
            singleClick    :    true,
            firstDay       :    1
        });

   </script>

</body>
</html>