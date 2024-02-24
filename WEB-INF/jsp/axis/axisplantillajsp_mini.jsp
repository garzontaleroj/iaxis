<%/*
*  Fichero: axisplantillajsp_modal.jsp
*
*  @author <a href = "mailto:echristen@csi-ti.com">Elmar Christen</a>
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*  Fecha: 23/04/2008
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
    <script language="Javascript">
    function f_but_cancelar() {
       parent.f_cerrar_axisplantillajsp_mini();
    }
    function f_but_aceptar() {
       parent.f_aceptar_axisplantillajsp_mini();
    }
    function f_but_buscar() {
       
    }
    function f_onload() {
         
    }
    </script>
  </head>
  <body onload="f_onload()">
  <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>

  <form name="miForm" action="axisplantillajsp_mini.do" method="POST"> 


    <c:import url="../include/titulo_nt.jsp">
        <c:param name="formulario">modal</c:param>
        <c:param name="form">axisplantillajsp_modal</c:param>
    </c:import>

<table align="center" cellpadding="0" cellspacing="0">

    <tr>
        <td>
            <!--campos-->
            
                                    <!-- Área 1 -->
                                    <table align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <b><fmt:message key="titulo_campo_1"/></b>
                                            </td>
                                            
                                            <td >
                                                <b><fmt:message key="titulo_campo_2"/></b>
                                            </td>
                                                                                        
                                        </tr>
                                        <tr>
                                            <td>
                                            <input  type="text" class="campowidth campo campotexto" id="campo1" name="campo1" size="15"
                                            value="campo1"/>
                                            </td>
                                            <td>
                                            <input  type="text" class="campowidth campo campotexto" id="campo2" name="campo2" size="15"
                                            value="campo2"/>
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