<%/*
*  Fichero: axisctr037.jsp
*  @author <a href = "mailto:xpastorr@csi-ti.com">Xavi Pastor</a> 
*
*  Fecha: 14/10/2008
*/
%>
<%@ page contentType="text/html;charset=iso-8859-15"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <title>
      <fmt:message key="9000494"/>
    </title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css"></link>
     <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp"/>
    <!--********** CALENDARIO ************************* -->
    <!-- Hoja de estilo del Calendario -->
    <link rel="stylesheet" type="text/css" media="all"
          href="styles/calendar-green.css" title="green"/>
    <!-- Script principal del calendario -->
    <script type="text/javascript" src="scripts/calendar.js"></script>
    <!-- Idioma del calendario, en función del Locale -->
    <script type="text/javascript"
            src="scripts/calendar-${sessionScope.__locale}.js"></script>
    <!-- Setup del calendario -->
    <script type="text/javascript" src="scripts/calendar-setup.js"></script>
    <!--*********************************** -->
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {   
        		 <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisctr037');
					</c:if> 
            revisarEstilos();
            var OK_acceptar = "${requestScope.OK_acceptar}"; 
            if (!objUtiles.estaVacio(OK_acceptar)){
                parent.f_aceptar_modal("axisctr037");
            }      
        }       
        
        function f_but_cancelar() {
           parent.f_cerrar_modal('axisctr037');                      
        }
        
        function f_but_aceptar() {
            objUtiles.ejecutarFormulario ("modal_axisctr037.do", 
                                          "acceptar", document.miForm, "_self", objJsMessages.jslit_cargando);                     
        }

    </script>
  </head>
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}"
        onload="f_onload()">
        <div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
      <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import><form name="miForm" action="" method="POST">
      <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo">
          <fmt:message key="9000549"/>
        </c:param>
        <%-- Buscador de propuestas retenidas--%>
        <c:param name="formulario">
          <fmt:message key="9000549"/>
        </c:param>
        <%-- Buscador de propuestas retenidas--%>
        <c:param name="form">axisctr037</c:param>
      </c:import>
      <input type="hidden" name="operation" value=""/>
      <table class="mainTableDimensions base" align="center" cellpadding="0"
             cellspacing="0">
        <tr>
          <td>
            <div class="separador">&nbsp;</div>
            <div class="titulo">
              <img src="images/flecha.gif"/><fmt:message key="9000549"/>
            </div>
            <table class="seccion" align="center">
              <tr>
                <td>
                  <table class="area" align="center">
                    <tr>
                      <th style="width:25%;height:0%;">&nbsp;</th>
                      <th style="width:25%;height:0%;">&nbsp;</th>
                      <th style="width:25%;height:0%;">&nbsp;</th>
                      <th style="width:25%;height:0%;">&nbsp;</th>
                    </tr>
                    <tr>
                      <td class="titulocaja">
                        <b><fmt:message key="9000550"/></b>
                      </td>
                    </tr>
                    <tr>
                      <td class="campocaja">
                        <input type="text" readonly="readonly"
                               class="campowidthbig campo campotexto"
                               id="FCANCEL" name="FCANCEL" size="15"
                               style="width:40%"
                               value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FCANCEL}'/>"
                               <axis:atr f="axisctr037" c="FCANCEL" a="modificable=false"/>/>
                      </td>
                    </tr>
                    <tr>
                      <td class="titulocaja">
                        <b><fmt:message key="9000551"/></b>
                      </td>
                    </tr>
                    <tr>
                      <td class="campocaja">
                        <input type="text"
                               class="campowidthbig campo campotexto"
                               id="FCANCELNUEVA" name="FCANCELNUEVA" size="15"
                               style="width:40%"
                               value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FCANCELNUEVA}'/>"
                               <axis:atr f="axisctr037" c="FCANCELNUEVA" a="modificable=true"/>/>
                          <a id="icon_FCANCELNUEVA"
                             style="vertical-align:middle;">
                            <img alt='<fmt:message key="108341"/>'
                                 title='<fmt:message key="100883" />'
                                 src="images/calendar.gif"/>
                          </a>
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
        <c:param name="__botones">cancelar,aceptar</c:param>
      </c:import>
    </form><c:if test="${empty requestScope.OK_acceptar}">
      <c:import url="../include/mensajes.jsp"/>
    </c:if>
      <%-- No quieren poder modificar fecha--%>
      <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FCANCELNUEVA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FCANCELNUEVA", 
            singleClick    :    true,
            firstDay       :    1
        });        
     </script>
    </div>
    </body>
</html>