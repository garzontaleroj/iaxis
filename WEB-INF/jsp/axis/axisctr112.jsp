<%/**
*  Fichero: axisctr112.jsp
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
        <title><axis:alt f="axisctr112" c="TITULO" lit="9002155"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>   
        <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
        <script type="text/javascript" src="scripts/calendar.js"></script>
        <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
      function f_onload() {
        f_cargar_propiedades_pantalla();
        objDom.setValorComponente(document.axisctr112Form.TTEXTOS, objDom.getValorPorId("TTEXTOS"));
            }
		
	function f_but_siguiente() {        
        objUtiles.ejecutarFormulario("axis_axisctr112.do", "siguiente", document.axisctr112Form, "_self", objJsMessages.jslit_cargando);   
        }
        
        function f_but_anterior() {
        objUtiles.ejecutarFormulario("axis_axisctr112.do", "anterior", document.axisctr112Form, "_self", objJsMessages.jslit_cargando);
                       
        }
        
        function f_but_cancelar() {
		objUtiles.ejecutarFormulario("flujodetrabajo.do?forigen=axisctr112", "cancelar", document.axisctr112Form, "_self");
            }
        
    </script>  
  </head>
  
   <body onload="f_onload()">
       <c:import url="../include/precargador_ajax.jsp">
       <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
       </c:import>
    <form name="axisctr112Form" action="axis_axisctr112.do" method="POST">
           
       <c:import url="../include/titulo_nt.jsp">
       <c:param name="formulario"><axis:alt f="axisctr112" c="TITULO" lit="9002155"/></c:param>
       <c:param name="titulo"><axis:alt f="axisctr112" c="TITULO" lit="9002155"/> <axis:alt f="axisctr112" c="TITULO" lit="101162"/> <axis:alt f="axisctr112" c="TITULO" lit="9001868"/></c:param> 
       <c:param name="form">axisctr112</c:param>
       </c:import>
       <input type="hidden" id="operation" name="operation" value=""/>
       <input type="hidden" id="NPOLIZA" name="NPOLIZA" value="${__formdata.NPOLIZA}"/>
       <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
       <input type="hidden" id="TTITULO" name="TTITULO" value="${__formdata.TTITULO}"/>
       <input type="hidden" id="FFINALI" name="FFINALI" value="${__formdata.FFINALI}"/>
        
       <%-- Área de campos  --%>
       <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
       <tr>
       <td>
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
            <td>
                <table class="area" align="center">
                    <tr>
                        <td>
                        &nbsp;
                        </td>
            <td class="titulocaja">
            <b><axis:alt f="axisctr112" c="LIT_9002155" lit="9002155" /></b> <%-- Descripcion --%>
            </td>
            </tr>
            <tr>
            <td>
            &nbsp;
            </td>
            <td class="campocaja" colspan="3">
            <%-- Cambio para IAXIS-16304 : start --%>
            <textarea cols="" rows="20" class="campo campotexto" id="TTEXTOS" name="TTEXTOS" size="15" title="<axis:alt f="axisctr112" c="LIT_100588" lit="100588"/>"
            style="width:66%;overflow: scroll;" <axis:atr f="axisctr112" c="TTEXTOS" a="obligatorio=true&isInputText=false"/>>${__formdata.TTEXTOS}</textarea>
            <%-- Cambio para IAXIS-16304 : end --%>
            </td>
            </tr>
            <tr>
            <td class="campocaja" id="fichero" colspan="4">
            <div class="seccion displayspace" id="div_OBFICHERO"></div>
            </td> 
            <c:import url="../include/botonera_nt.jsp"> 
            <c:param name="f">axisctr112</c:param>
            <c:param name="__botones">cancelar,<axis:visible c="BT_ANTERIOR" f="axisctr112">anterior,</axis:visible>siguiente</c:param>
            </c:import>
            </tr>
            </table> 
            <div class="separador">&nbsp;</div>
            <c:import url="../include/mensajes.jsp" /> 
            </tr> 
          </table>
            </td>
            </tr> 
          </table> 
            </td>
      </form> 
    </body> 
</html>