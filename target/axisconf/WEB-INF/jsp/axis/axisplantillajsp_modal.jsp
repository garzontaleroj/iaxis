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
       parent.f_cerrar_axisplantillajsp_modal();
    }
    function f_but_aceptar() {
       parent.f_aceptar_axisplantillajsp_modal();
    }
    function f_but_buscar() {
       
    }
    function f_onload() {
          //objUtiles.abrirModal("axisplantilla_modal", "src", "axis_plantilla.do?operation=modal");
    }
    </script>
  </head>
  <body onload="f_onload()">
  <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>

  <form name="miForm" action="axisplantillajsp_modal.do" method="POST"> 


    <c:import url="../include/titulo_nt.jsp">
        <c:param name="formulario"><fmt:message key="formulario.axisplantillajsp_modal" /></c:param>
        <c:param name="form">axisplantillajsp_modal</c:param>
    </c:import>

<table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <!--campos-->
            <%--
            <div class="separador">&nbsp;</div>
            <div class="titulo_modal"><img src="images/flecha_verde.gif"/><fmt:message key="datos_modal"/></div>
            --%>
            <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:33%;height:0px"></th>
                                       
                                            <th style="width:33%;height:0px"></th>
                                            
                                            <th style="width:33%;height:0px"></th>
                                       
                                        </tr>
                                        <tr>
                                            <td class="titulocaja" >
                                                <b><fmt:message key="titulo_campo_1"/></b>
                                            </td>
                                            
                                            <td class="titulocaja" >
                                                <b><fmt:message key="titulo_campo_2"/></b>
                                            </td>
                                            
                                            <td class="titulocaja">
                                                <b><fmt:message key="titulo_campo_3"/></b>
                                            </td>
                                            
                                        </tr>
                                        <tr>
                                            <td class="campocaja" >
                                            <input  type="text" class="campowidth campo campotexto" id="campo1" name="campo1" size="15"
                                            value="campo1"/>
                                            </td>
                                            <td class="campocaja" >
                                            <input  type="text" class="campowidth campo campotexto" id="campo2" name="campo2" size="15"
                                            value="campo2"/>
                                            </td>
                                            <td class="campocaja">
                                           <input onClick="" checked
                                            type="checkbox" id="check" name="chek" value="" />
                                            </td>
                                            
                                        </tr>
                                        
                                        <tr>
                                            <td class="titulocaja" >
                                                <b><fmt:message key="titulo_campo_1"/></b>
                                            </td>
                                            
                                            <td class="titulocaja" >
                                                <b><fmt:message key="titulo_campo_2" /></b>
                                            </td>
                                            
                                            <td class="titulocaja">
                                                <b><fmt:message key="titulo_campo_3"/></b>
                                            </td>
                                            
                                        </tr>
                                        <tr>
                                            <td class="campocaja">
                                            <input  type="text" class="campowidth campo campotexto" id="campo1" name="campo1" size="15"
                                            value="campo1"/>
                                            </td>
                                            <td class="campocaja">
                                            <select name="select" id="select" size="1" onchange="" class="campowidth campo campotexto_ob">&nbsp;                                        
                                                    <option value = "null"> - Seleccione una opción - </option>
                                                    <option value = "0" selected>Opción 0</option>
                                                    <option value = "1" selected>Opción 1</option>
                                                    <option value = "2" selected>Opción 2</option>
                                                    <option value = "3" selected>Opción 3</option>
                                                </select>
                                            </td>
                                            <td class="campocaja">
                                            <input  type="text" class="campowidth campo campotexto" id="campo3" name="campo3" size="15"
                                            value="campo3"/>
                                            </td>
                                            
                                        </tr>
                                        
                                                                                                                    
                                    </table>
                                </td>
                            </tr>
            </table>
        </td>
    </tr>
</table>
<c:import url="../include/botonera_nt.jsp"><c:param name="__botones">cancelar,buscar,aceptar</c:param></c:import>

</form>
<c:import url="../include/mensajes.jsp" />
</body>
</html>