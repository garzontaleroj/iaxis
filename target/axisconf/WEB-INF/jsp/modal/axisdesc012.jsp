<%-- CONSULTA MANTENIMIENTO GARANTÍAS--%>
<%@ page contentType="text/html;charset=iso-8859-15"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/tree.css" type="text/css"></link>
    <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green"/>
    <script type="text/javascript" src="scripts/calendar.js"></script>
    <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
    <script type="text/javascript" src="scripts/calendar-setup.js"></script>
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript">
      
        function f_but_cancelar() {
     
           parent.f_cerrar_modal("axisdesc012");
        }
        
        function f_onload() {
                
            f_cargar_propiedades_pantalla(); 
            document.getElementById("CCAMPANYA").focus();
        }
        
        function f_but_buscar() {
            if (objValidador.validaEntrada()) {
              var CCAMPANYA = objDom.getValorPorId("CCAMPANYA");
              var TCAMPANYA = objDom.getValorPorId("TCAMPANYA");
              parent.f_aceptar_axisdesc012(CCAMPANYA,TCAMPANYA);
            }
        }


    </script>
  </head>
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}"
        onload="f_onload()"
        onkeypress="if (event.keyCode==13)  { f_but_buscar() }"><c:import url="../include/precargador_ajax.jsp">
      <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import><form name="miForm" action="modal_axisdesc012.do" method="POST">
      <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo">
          <axis:alt f="axisdesc012" c="TITULO" lit="9902359"/>
        </c:param>
        <c:param name="formulario">
          <axis:alt f="axisdesc012" c="TITULO" lit="9902359"/>
        </c:param>
        <c:param name="form">axisdesc012</c:param>
      </c:import>
      <input type="hidden" id="operation" name="operation" value=""/>
      <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="3">
        <tr>
          <td>
            <div class="separador">&nbsp;</div>
            <table class="seccion">
              <tr>
                <td>
                  <table class="area" align="center">
                    <tr>
                      <th style="width:25%;height:0%;"></th>
                      <th style="width:25%;height:0%;"></th>
                      <th style="width:25%;height:0%;"></th>
                      <th style="width:25%;height:0%;"></th>
                    </tr>
                    <tr>
                      <axis:ocultar f="axisdesc012" c="CCAMPANYA">
                        <td class="titulocaja">
                          <b><axis:alt f="axisdesc012" c="CCAMPANYA" lit="103465"/></b>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar f="axisdesc012" c="TCAMPANYA">
                        <td class="titulocaja" colspan="2">
                          <b><axis:alt f="axisdesc012" c="TCAMPANYA" lit="9900734"/></b>
                        </td>
                      </axis:ocultar>
                    </tr>
                    <tr>
                      <axis:ocultar f="axisdesc012" c="CCAMPANYA">
                        <td class="campocaja">
                          <input id = "CCAMPANYA" type="text" class="campo campotexto" style="width:30%" maxlength="4" title="<axis:alt f="axisdesc012" c="CCAMPANYA" lit="103465"/>" alt="<axis:alt f="axisdesc012" c="CCAMPANYA" lit="103465"/>"/>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar f="axisdesc012" c="TCAMPANYA">
                        <td class="campocaja">
                          <input id = "TCAMPANYA" type="text" class="campo campotexto" style="width:100%" maxlength="120" title="<axis:alt f="axisdesc012" c="TCAMPANYA" lit="9900734"/>" alt="<axis:alt f="axisdesc012" c="TCAMPANYA" lit="9900734"/>"/>
                        </td>
                      </axis:ocultar>
                    </tr>
                    
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axisdesc012</c:param>
        <c:param name="__botones">cancelar,buscar</c:param>
      </c:import>
      <div class="separador">&nbsp;</div>
    </form><c:import url="../include/mensajes.jsp"/>
</body>
</html>