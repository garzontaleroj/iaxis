<%/*
*  Fichero: axisconfirm.jsp
*
*  @author <a href="mailto:dramon@csi-ti.com">david ramon</a>
*  Fecha: 07/07/2008
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">

    <c:import url="../include/carga_framework_js.jsp" />    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
    
        function f_but_si() {
            // Botón Si
            parent.f_respuesta_axisconfirm(1);
        }

        function f_but_no() {
            // Botón No
            parent.f_respuesta_axisconfirm(0);
        }

        function f_but_cancelar() {
            // Botón Cancelar
            parent.f_respuesta_axisconfirm(-1);
        }

        function f_onload() {
            f_cargar_propiedades_pantalla();
         
        }
        
    </script>
  </head>
  
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" enctype='multipart/form-data' action="AxisConfirm" method="POST" accept-charset='UTF-8'>         
        <c:import url="../include/titulo_nt.jsp">
            <%-- <c:param name="formulario"><axis:alt f="axisconfirm" c="TITFORM" lit="9904817"/></c:param> --%>
            <c:param name="form">axisconfirm</c:param>
        </c:import>
        
        <input type="hidden" id="TMENSAJE" name="TMENSAJE" value="${__formdata.TMENSAJE}"/>
    
        <table id="tabla1" class="mainModalDimensions base" style="height:80px" align="center" cellpadding="0" cellspacing="3">
            
            <tr>
                <td>
                    <table class="seccion">                                            

                        <tr>
                            
                            <td  class="titulocaja" align="center">
                                <b><axis:alt f="axisconfirm" c="PREGUNTA" lit="${__formdata.TMENSAJE}"/></b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="campocaja" align="center">                             
                                <input type="button" class="boton" style="vertical-align:bottom;cursor:pointer;" 
                                    value="<axis:alt f="axisconfirm" c="PREGUNTA" lit="101778"/>"
                                    onclick="if (objValidador.validaEntrada()) { f_but_si(); }"/>
                                <input type="button" class="boton" style="vertical-align:bottom;cursor:pointer;" 
                                    value="<axis:alt f="axisconfirm" c="PREGUNTA" lit="101779"/>"
                                    onclick="if (objValidador.validaEntrada()) { f_but_no(); }"/>
                                <input type="button" class="boton" style="vertical-align:bottom;cursor:pointer;" 
                                    value="<axis:alt f="axisconfirm" c="PREGUNTA" lit="108211"/>"
                                    onclick="if (objValidador.validaEntrada()) { f_but_cancelar(); }"/>
                                <div class="separador">&nbsp;</div>                                                        
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

        </table>
        
    </form>
    
  </body>
</html>