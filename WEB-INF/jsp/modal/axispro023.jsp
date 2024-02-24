<%/*
*  Fichero: axispro023.jsp
*
*  @author <a href="mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  Fecha: 30/06/2008
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
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
    
        function f_but_cancelar() {
            parent.f_cerrar_modal('axispro023');                      
        }
    
        function f_but_guardar() {
            if (objValidador.validaEntrada()) {
                var NCODINT    = objDom.getValorPorId("NCODINT");
                var NDESDE     = objDom.getValorPorId("NDESDE");
                var NHASTA     = objDom.getValorPorId("NHASTA");
                var NINTTEC    = objDom.getValorPorId("NINTTEC");

                var params = "&NCODINT=" + NCODINT + "&NDESDE=" + NDESDE + "&NHASTA=" + NHASTA + "&NINTTEC=" + NINTTEC; 
                
                objAjax.invokeAsyncCGI("modal_axispro023.do", callbackGuardar,
                    "operation=guardar" + params, this);
            }
        }
        
        function f_onload() {
            document.getElementById("NDESDE").focus();
        }
        
        /****************************************************************************************/
        /******************************** CALLBACK AJAX *****************************************/
        /****************************************************************************************/
        
         function callbackGuardar (ajaxResponseText) {
            try {
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    parent.f_aceptar_modal('axispro023');                      
                }
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }

        
    </script>
  </head>
  
  <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axispro023.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><fmt:message key="1000542"/></c:param>
            <c:param name="form">axispro023</c:param>
        </c:import>
        
        <input type="hidden" id="operation" name="operation" value=""/>
        <input type="hidden" id="NCODINT" name="NCODINT" value="${__formdata.NCODINT}"/>
    
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">
            
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>                        
                    <div class="titulo"><img src="images/flecha.gif"/>${__formdata.TNCODINT}</div>
                    
                    <table class="seccion">
                        <tr>
                            <th style="width:25%;height:0%;"/>
                            <th style="width:25%;height:0%;"/>
                            <th style="width:25%;height:0%;"/>
                            <th style="width:25%;height:0%;"/>
                        </tr>                                            
                        <tr>
                            <td class="titulocaja">
                                <b><fmt:message key="104095"/></b> <%-- DESDE --%>
                            </td>
                        </tr>
                        <tr>
                            <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" style="width:50%;"
                                value="<fmt:formatNumber pattern="###,##0.00" value="${__formdata.NDESDE}"/>" name="NDESDE" id="NDESDE" 
                                <axis:atr f="axispro23" c="NDESDE" a="formato=decimal"/>
                                <c:if test="${!empty __formdata.NDESDE}"> readonly='readonly' </c:if> />                                
                            </td>
                        </tr>
                        <tr>
                            <td class="titulocaja">
                                <b><fmt:message key="103051"/></b> <%-- HASTA --%>
                            </td>
                        </tr>
                        <tr>
                            <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" style="width:50%;"
                                value="<fmt:formatNumber pattern="###,##0.00" value="${__formdata.NHASTA}"/>" name="NHASTA" id="NHASTA" 
                                <axis:atr f="axispro23" c="NHASTA" a="formato=decimal"/> />  
                            </td>
                        </tr>                                                           
                        <tr>
                            <td class="titulocaja">
                                <b><fmt:message key="101467"/></b> <%-- PORCENTAJE --%>
                            </td>
                        </tr>
                        <tr>
                            <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" style="width:50%;"
                                value="<fmt:formatNumber pattern="###,##0.00" value="${__formdata.NINTTEC}"/>" name="NINTTEC" id="NINTTEC" 
                                <axis:atr f="axispro23" c="NINTTEC" a="formato=decimal"/> />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="__botones">cancelar,guardar</c:param></c:import>
        
    </form>
    <c:import url="../include/mensajes.jsp" />

</body>
</html>