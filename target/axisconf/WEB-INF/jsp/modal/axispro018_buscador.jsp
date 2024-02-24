<%/*
*  Fichero: axispro018_buscador.jsp
*
*  @author <a href="mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  Fecha: 18/06/2008
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
    
        function f_but_cancelar() {
           parent.f_cerrar_modal('axispro018_buscador');                      
        }
        
        function f_but_buscar() {
            objUtiles.ejecutarFormulario("modal_axispro018_buscador.do", "buscar", document.miForm, "_self");
        }
        
        function f_onload() {
            var exitoBusqueda = ${!empty sessionScope.DATTECN_LSTNCODINT};
            if (exitoBusqueda) {
            // Cerrar modal y volver a la pantalla padre, con el LSTNCODINT ya recuperado
                parent.f_aceptar_modal('axispro018_buscador');                      
            } else {
                document.getElementById("NCODINT").focus();
            }
        }
        
    </script>
  </head>
  
  <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axispro018_buscador.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><fmt:message key="1000539"/></c:param>
            <c:param name="form">axispro018_buscador</c:param>
        </c:import>
        
        <input type="hidden" id="operation" name="operation" value=""/>
    
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">
            
            <tr>
                <td>
                    <table class="seccion">
                        <tr>
                            <th style="width:25%;height:0%;"/>
                            <th style="width:25%;height:0%;"/>
                            <th style="width:25%;height:0%;"/>
                            <th style="width:25%;height:0%;"/>
                        </tr>
                        <tr>
                            <td class="titulocaja">
                                <b><fmt:message key="1000109"/></b>
                            </td>
                        </tr>
                        <tr>
                            <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.NCODINT}" name="NCODINT" id="NCODINT" style="width:50%;"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="titulocaja">
                                <b><fmt:message key="1000246"/></b>
                            </td>
                        </tr>
                        <tr>
                            <td class="campocaja">                                
                                <select name="CIDIOMA" id="CIDIOMA" size="1" class="campowidthselect campo campotexto_ob" style="width:90%;">&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTIDIOMAS}">
                                        <option value = "${element.CIDIOMA}"/>
                                            ${element.TIDIOMA} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>        
                        </tr>
                        <tr>
                            <td class="titulocaja">
                                <b><fmt:message key="100588"/></b>
                            </td>
                        </tr>
                        <tr>
                            <td class="campocaja" colspan="3">                                
                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.TNCODINT}" name="TNCODINT" id="TNCODINT" style="width:50%;"/>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="__botones">cancelar,buscar</c:param></c:import>
        
    </form>
    <c:import url="../include/mensajes.jsp" />
</body>
</html>