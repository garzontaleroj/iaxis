<%/*
*  Fichero: axisctr077.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a> 
*
*  Fecha: 08/05/2008
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>

<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">
    
        function f_but_cancelar() {
            parent.f_cerrar_axisctr077();
        }
        
        function f_but_aceptar(){
            objUtiles.ejecutarFormulario("modal_axisctr077.do", "diferirpropuesta",  document.axisctr077Form, "_self", objJsMessages.jslit_cargando); 
        }
        
        function f_guardar_opcion(valor){
            document.axisctr077Form.OPCIONMARCADA.value = valor;
        }
        
        function f_onload(){
            if( "${MENSAJE}" != ""){
                alert("${MENSAJE}");
                f_but_cancelar();
                parent.f_but_salir();
            }
        }
        
    </script>
  </head>
  <body onload="f_onload()" class=" ">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="axisctr077Form" action="" method="POST">
            <input type="hidden" name="operation" value="">
            <input type="hidden" name="OPCIONMARCADA" id="OPCIONMARCADA" value="${PORDEFECTO}" />
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><fmt:message key="9001543" /></c:param>
                <c:param name="producto"><fmt:message key="9001543" /></c:param>
                <c:param name="form">axisctr077</c:param>
            </c:import>
            <!-- Area de campos  -->
            <!--  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" >
              <tr> 
                    <td class="titulocaja">
                        <div  class="titulo"><img src="images/flecha.gif"/><b><fmt:message key="9001542" /></b></div>
                    </td>
              </tr>
              <tr>
                <td>
                <table id="tabla1" class="seccion" >
                <tr>
                    <th style="width:2%;height:0px"></th>
                    <th style="width:15%;height:0px"></th>
                    <th style="width:5%;height:0px"></th>
                    <th style="width:5%;height:0px"></th>
                    <th style="width:5%;height:0px"></th>
                    <th style="width:5%;height:0px"></th>
                </tr>
                <tr>
                </tr>
                
                <tr>
                    <td></td>
                    <td class="titulocaja">
                        <b><fmt:message key="109716" /></b>
                    </td>
                    <td>
                        <input type="radio" name="DIFERIR" <c:if test="${BOT_ACTIVOS == 0 && PFECHAP=='F_FCARANU'}"> disabled </c:if> 
                        <c:if test="${BOT_ACTIVOS == 0 && PFECHAP=='F_FCARPRO'}"> checked </c:if> id="DIFERIR" value="F_FCARPRO" onclick="f_guardar_opcion(this.valor)" >
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td class="titulocaja">
                        <b><fmt:message key="9001541" /></b>
                    </td>
                    <td>
                        <input type="radio" name="DIFERIR"  <c:if test="${BOT_ACTIVOS == 0 && PFECHAP=='F_FCARPRO'}"> disabled </c:if>
                        <c:if test="${BOT_ACTIVOS == 0 && PFECHAP=='F_FCARANU'}"> checked </c:if> id="DIFERIR" value="F_FCARANU" onclick="f_guardar_opcion(this.valor)" >
                    </td>
                </tr>
                </table>
                </td>
                </tr>
           	</table>				
            
          <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>  
        </form>
      <c:import url="../include/mensajes.jsp" />
  </body>
</html>

