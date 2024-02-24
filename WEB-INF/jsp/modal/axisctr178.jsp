<%-- * Fichero: axisctr178.jsp * datos beneficiarios a nivel de riesgo *--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<html>
    <head>
        <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
        <c:import url="../include/carga_framework_js.jsp"/>
        <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green"/>
        <script type="text/javascript" src="scripts/calendar.js"></script>
        <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload_axisctr178() {
           f_cargar_propiedades_pantalla();
                       
            var grabarOK = '${requestScope.grabarOK}';
            if (!objUtiles.estaVacio(grabarOK) && grabarOK == "0")
               parent.f_aceptar_axisctr178();                
                
        }
                
        function f_but_aceptar() {
             if (objValidador.validaEntrada()) {           
                    objUtiles.ejecutarFormulario("modal_axisctr178.do", "altamodi", document.miForm, "_self", objJsMessages.jslit_cargando);             
            }
            
           
        }
        
        function f_but_cancelar() { 
               parent.f_cerrar_axisctr178();                
        }    
        
         /* *********************************************************************************************** */
         
    </script>
    </head>

    <body onload="f_onload_axisctr178()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif" />
        </c:import>
        <form name="miForm" action="modal_axisctr178.do" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="NRIESGO" value="${__formdata.NRIESGO}" />
            <input type="hidden" name="NBENRIESGO" value="${__formdata.NBENRIESGO}" />
            <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}" />
            <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}" />
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><%--axis:alt f="axisctr178" c="LIT_NOMBRE_PANTALLA" lit="9902497"/--%></c:param>
                <c:param name="producto"><axis:alt f="axisctr178" c="ALT_NOMBRE_PANTALLA" lit="9902497"/></c:param>
                <c:param name="form">axisctr178</c:param>
            </c:import>
            
            <table id="tabla1" class="mainModalDimensions base" align="center"
                   cellpadding="0" cellspacing="0" style="height:130px">
                <tr>
                    <td>
                        <table class="area">
                            <tr>
                                <th style="width:70%;height:0px">
                                    &nbsp;
                                </th>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr178" c="GARANTIA"
                                              dejarHueco="false">
                                    <!-- CTIPBEN -->
                                    <td class="titulocaja"
                                        style="vertical-align:top">
                                        <b id="label_GARANTIA"><axis:alt f="axisctr178"
                                                                        c="LIT_GARANTIA"
                                                                        lit="100561"/></b>
                                        <br/>
                                        <select name="GARANTIA" id="GARANTIA"
                                                class="campo"
                                                obligatorio="true">
                                            <option value="">
                                                - 
                                                <axis:alt f="axisctr178"
                                                          c="LIT_GARANTIA_SELECCIONE"
                                                          lit="1000348"/>
                                                -
                                            </option>
                                            <c:forEach items="${__formdata.listaGar}"
                                                       var="item">
                                                <option value="${item.CGARANT}"
                                                        <c:if test="${__formdata.GARANTIA==item.CGARANT}">selected</c:if>>
                                                    ${item.TGARANT}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisctr178</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form><c:import url="../include/mensajes.jsp"/></body>
</html>