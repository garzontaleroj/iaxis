<%-- 
* Fichero: axisctr044.jsp 
* @author <a href = "mailto:jaesteban@csi-ti.com">Johan Esteban</a> * 
* Fecha: 22/09/2016*
/--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<html>
    <head>
        <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
        <%-- Especial per controlar els scroll amb iPad--%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet"
              media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)"/>
        <style type="text/css" id="page-css">
            </style>
        <%-- FI Especial per controlar els scroll amb iPad--%>
        <c:import url="../include/carga_framework_js.jsp"/>
        <script language="Javascript" type="text/javascript">
          /****************************************************************************************/
          /*********************************** NAVEGACION *****************************************/

          /****************************************************************************************/
          function f_onload_axisctr044() {
             var grabarOK = ${requestScope.grabarOK == true};
             if (grabarOK){
                 parent.f_aceptar_modal("axisctr044");
             }
             f_cargar_propiedades_pantalla();
             
             if ($("#CMODO").val() == 'CONSULTA'){
                 $("#but_aceptar").hide();
             }
          }

          function f_but_aceptar() {  
              if (objValidador.validaEntrada()){
                  objUtiles.ejecutarFormulario("modal_axisctr044.do", "grabarRieDetalle", document.axisctr044Form, "_self", objJsMessages.jslit_cargando);
              }
              
          }

          function f_but_cancelar() {
              parent.f_cerrar_modal("axisctr044");
          }
        </script>
    </head>
    
    <body onload="f_onload_axisctr044()">
        <div id="wrapper" class="wrapper">
            <c:import url="../include/precargador_ajax.jsp">
                <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
            </c:import>
             
            <form name="axisctr044Form" action="" method="POST">
                <input type="hidden" id = "operation" name="operation" value=""/>
                <input type="hidden" id = "NRIESGO" name="NRIESGO" value="${__formdata.NRIESGO}"/>
                <input type="hidden" id = "CMODO" name="CMODO" value="${__formdata.CMODO}"/>
                <c:import url="../include/titulo_nt.jsp">
                    <c:param name="formulario">
                        <axis:alt f="axisctr044" c="LIT_1000199" lit="1000199"/>
                        <axis:visible f="axisctr044" c="PTMOTMOV">
                            ${__formdata.PTMOTMOV}
                        </axis:visible>
                    </c:param>
                    <c:param name="producto">
                        <axis:alt f="axisctr044" c="LIT_1000199" lit="1000199"/>
                    </c:param>
                    <c:param name="form">axisctr044</c:param>
                </c:import>
                
                <!-- Area de campos  -->
                <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0"
                       style="height:130px">
                    <div class="separador">&nbsp;</div>
                    <tr>
                        <td>
                            <table class="seccion">
                                <tr>
                                    <th style="width:4%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                </tr>
                                 
                                <tr>
                                    <td>&nbsp;</td>
                                    <td class="titulocaja">
                                        <b>
                                            <axis:alt f="axisctr044" c="LIT_100588" lit="100588"/></b>
                                         
                                        <%-- Descripci�n--%>
                                    </td>
                                </tr>
                                 
                                <tr>
                                    <td>&nbsp;</td>
                                    <td class="campocaja" colspan="3">
                                         <textarea cols="" rows="10" class="campo campotexto" id="TDESCRIE" name="TDESCRIE" size="15" title="<axis:alt f="axisctr043" c="LIT_100588" lit="100588"/>"
                                                maxlength="200000"
                                                style="width:97.5%; overflow-y: scroll;" <axis:atr f="axisctr043" c="TDESCRIE" a="obligatorio=true&isInputText=false"/>
                                                <c:if test="${!empty __formdata.CMODO && __formdata.CMODO == 'CONSULTA'}"> readonly </c:if>
                                                >${__formdata.TDESCRIE1}${__formdata.TDESCRIE2}${__formdata.TDESCRIE3}${__formdata.TDESCRIE4}${__formdata.TDESCRIE5}${__formdata.TDESCRIE6}${__formdata.TDESCRIE7}</textarea>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <c:import url="../include/botonera_nt.jsp">
                    <c:param name="f">axisctr044</c:param>
                    <c:param name="__botones">cancelar<axis:visible c="BT_ACEPTAR" f="axisctr044">,aceptar</axis:visible>
                    </c:param>
                </c:import>
            </form>             
            <c:import url="../include/mensajes.jsp"/>
        </div>
    </body>
</html>
