<%/*
*  Fichero: axismap002.jsp
*
*  @author <a href="mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  Fecha: 18/10/2010
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
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_but_cancelar() {
           parent.f_cerrar_modal('axismap002');                      
        }
        
        function f_but_nuevo() {           
           parent.f_axismap002_nuevo();
        }
        
         function f_but_buscar() {         
         var TIPTRAT = document.miForm.TIPTRAT.value;
         var TIPMAP = document.miForm.TIPMAP.value;
         var CMAPEAD = document.miForm.CMAPEAD.value;
            if (objValidador.validaEntrada()) {
                parent.buscar_lista(TIPTRAT,TIPMAP,CMAPEAD);
                
            }
        }
        
        
        //function f_but_buscar() {
        //    if (objValidador.validaEntrada()) {
        //        objUtiles.ejecutarFormulario("modal_axismap002.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
        //    }
        //}
        
        function f_recargar(){
                objUtiles.ejecutarFormulario("modal_axismap002.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_onload() {
        
            revisarEstilos();            
            var hayDatos = ${requestScope.buscarOK == true};
            if (hayDatos) {
          
                // Abrir modal buscador
                parent.f_aceptar_modal("axismap002",document.miForm.CMAPEAD.value);
           }
        }
        
        function f_acturadio(thiss){
            document.miForm.TIPOMAP.value = thiss;
        }

    </script>
  </head>
  
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axismap002.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo">B&uacute;squeda Maps</c:param>
            <c:param name="formulario">B&uacute;squeda Maps</c:param> <%-- Búsqueda Red Comercial --%>
            <c:param name="form">axismap002</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisper008|<fmt:message key="1000065"/></c:param>
        </c:import>

        
        <input type="hidden" id="operation" name="operation" value=""/>
    
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">            
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                        <tr>
                            <td>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:2%;height:0%;"/>
                                        <th style="width:24%;height:0%;"/>
                                        <th style="width:24%;height:0%;"/>
                                        <th style="width:24%;height:0%;"/>
                                        <th style="width:24%;height:0%;"/>
                                    </tr>
                                    <tr>
                                    <td></td>
                                         <td class="titulocaja"><b><fmt:message key="9002150"/></b> </td>
                                         <td class="titulocaja"><b><fmt:message key="100565"/></b> </td>
                                        <td class="titulocaja">
                                            <b>Map</b> 
                                        </td>
                                      <%--  <td class="titulocaja">
                                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Consulta</b>
                                            <input type="radio"  id="TIPOMAP" name="TIPOMAP" value="1" <c:if test="${empty __formdata['TIPOMAP'] || __formdata['TIPOMAP'] == '1'}">checked</c:if> />
                                        </td>  --%>
                                                                           
                                    </tr>
                                    <tr>
                                    <td></td>
                                     <td class="campocaja">                                
                                            <select name="TIPTRAT" id="TIPTRAT" size="1" onchange="f_recargar();" class="campowidthselect campo campotexto" style="width:79%;">&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.lsttipotrat}">
                                                    <option value = "${element.CATRIBU}"
                                                    <c:if test="${__formdata.TIPTRAT == element.CATRIBU}"> selected</c:if>>
                                                        ${element.TATRIBU} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                     <td class="campocaja">                                
                                            <select name="TIPMAP" id="TIPMAP" size="1" onchange="f_recargar();"  class="campowidthselect campo campotexto" style="width:79%;">&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.lsttipomap}">
                                                    <option value = "${element.CATRIBU}"
                                                    <c:if test="${__formdata.TIPMAP == element.CATRIBU}"> selected</c:if>>
                                                        ${element.TATRIBU} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="campocaja" colspan="2">                                
                                            <select name="CMAPEAD" id="CMAPEAD" size="1" obligatorio="true" class="campowidthselect campo campotexto" style="width:79%;">&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.lstmaps}">
                                                    <option value = "${element.CMAPEAD}"
                                                    <c:if test="${__formdata.CMAPEAD == element.CMAPEAD}"> selected</c:if>>
                                                        ${element.DESCRIPCIO} 
                                                    </option>
                                                </c:forEach>
                                            </select>
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
        <c:param name="f">axismap002</c:param>
        <c:param name="__botones">cancelar,nuevo,buscar</c:param>
        </c:import>
        
    </form>
    <c:import url="../include/mensajes.jsp" />
    


</body>
</html>