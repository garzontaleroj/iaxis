<%-- 
*  Fichero: axisctr174.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*
*  Fecha: 25/08/2008
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<c:set var="pantalla" value="axisctr174"/>
<c:set var="literalPantalla" value="9902170"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />

    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload_axisctr174() {            
            f_cargar_propiedades_pantalla();
        }
        
        function f_but_anterior() {
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("axis_axisctr174.do", "anterior",document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        
        function f_but_siguiente() {
            if (objValidador.validaEntrada()) {
              objUtiles.ejecutarFormulario ("axis_axisctr174.do", "siguiente", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        
        function f_but_cancelar() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr174", "cancelar", document.miForm, "_self");
        } 

    </script>  
  </head>
  
  <body onload="f_onload_axisctr174()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>  
   
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
        <input type="hidden" id="CMOTMOV" name="CMOTMOV" value="${__formdata.CMOTMOV}"/>
        <input type="hidden" id="FEFECTOSUP" name="FEFECTOSUP" value="${__formdata.FEFECTOSUP}"/>
        <input type="hidden" id="NMOVIMI" name="NMOVIMI" value="${__formdata.NMOVIMI}"/>

        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisctr174" c="9902170" lit="9902170"/></c:param> <%-- INTRODUCCIÓN DE UN RIESGO INNOMINADO --%>
            <c:param name="producto"><axis:alt f="axisctr174" c="9902170" lit="9902170"/></c:param>   <%-- INTRODUCCIÓN DE UN RIESGO INNOMINADO --%>
            <c:param name="form">axisctr174</c:param>
        </c:import>
        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:130px">
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
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr174" c="LIT_100588" lit="100588"/></b> <%-- Descripción --%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="campocaja" colspan="3">
                                <textarea cols="" rows="10" class="campo campotexto" id="TNATRIE" name="TNATRIE" size="15" title="<axis:alt f="axisctr174" c="LIT_100588" lit="100588"/>"
                                    style="width:97.5%;overflow:hidden;" <axis:atr f="axisctr174" c="TNATRIE" a="obligatorio=true&isInputText=false"/>>${__formdata.TNATRIE}</textarea>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>			

     <c:if test="${param.multiPantalla != 'true'}">
        <!-- Botonera -->
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axisctr174</c:param>
            <c:param name="__botones">cancelar<axis:ocultar f="axisctr174" c="BT_SEG" dejarHueco="false">,siguiente</axis:ocultar></c:param>
        </c:import>
        </form>
    </c:if>
    
    </form>
    
    <c:import url="../include/mensajes.jsp" />
</html>

