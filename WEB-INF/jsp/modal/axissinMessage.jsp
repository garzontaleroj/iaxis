

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
   
    function f_but_aceptar() {
       parent.f_aceptar_message();
    }    
    function f_onload() {
    }
    </script>
  </head>
  <body onload="f_onload()">
  <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>

  <form name="miForm" method="POST"> 

<table align="center"  class="seccion" >

    <tr>
        <td class="campotexto_ob" style="font-size: 16px;padding-left: 10px">
          <B>${texto}</B> 
       </td>
   </tr>
</table>
<c:import url="../include/botonera_nt.jsp"><c:param name="__botones">aceptar</c:param></c:import>

</form>
</body>
</html>