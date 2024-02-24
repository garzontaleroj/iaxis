<%/*
*  Fichero: axisper001.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavi Gallego</a> 
*  
*  	El usuario pude buscar por documento, nombre o bien por identificador externo 
*       este último será visible según indicación de la función PAC_IAX_COMMON.F_PermitirSIP. 
*       Al pulsar buscar se buscan los datos en la bbdd, mediante la función PAC_IAX_LISTVALORES.F_Get_Personas
*       con los parámetros documento, nombre o sip el cual devolverá un ref cursor con los datos a mostrar. 
*       En función del resultado de la búsqueda tendremos tres situaciones:
*           No hay datos: pantalla emergente que indica el hecho y pregunta si desea dar de alta 
*                la persona (parametrizable en función de PAC_IAX_COMMON.F_PermitirNuevaPersona):
*	            Aceptar => ir al alta de personas iniciando el proceso de alta. 
*                        Una vez introducidos los datos de la persona y al volver a la pantalla de datos tomadores
*                        se han de rellenar los campos de forma automática con los datos de la persona introducida.
*	            Cancelar => volver a pantalla de búsqueda de personas.
*           Hay más de un posible resultado: en el multirregistro inferior se muestra registros encontrados. 
*                Seleccionando el resultado buscado y pulsando sobre aceptar o con doble click 
*                accedemos a la pantalla de datos tomadores. 
*	    Solo hay un registro que cumple con los datos de la búsqueda. En este caso se accede directamente a la pantalla de datos tomadores.
*
*	En el caso en que se tenga de dar de alta la nueva persona o se seleccione de la lista una vez escogida
*        (con doble click o botón aceptar) se debe llamar,
*	    Para la pantalla de Tomadores a PAC_IAX_PRODUCCION.InsertTomadores y como parámetro el sperson, 
*                y un parámetro de salida con los posibles mensajes de error y como retorno un 1 
*                indicando que habido error y 0 todo correcto, para guardar los datos en el objeto persistente.
*	    Para la pantalla de Asegurados a PAC_IAX_PRODUCCION.InsertAsegurado y como parámetro el sperson,
*                y un parámetro de salida con los posibles mensajes de error y como retorno un 1
*                indicando que habido error y 0 todo correcto, para guardar los datos en el objeto persistente.
*
*	El botón cancelar cierra la ventana actual.
*
*
*  Fecha: 16/10/2007
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
      <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
        	  <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisper016');
					</c:if>
        }
        

       function f_but_cancelar() {
                parent.f_cerrar_axisper016();
        }   

                
    </script>
  </head>
    <body class=" " onload="f_onload()"  >
        <div id="wrapper" class="wrapper">
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="SPERSON" id="SPERSON" value="" />
            <input type="hidden" name="SNIP" id="SNIP" value="" />
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><fmt:message key="110275"/></c:param>
                <c:param name="producto"><fmt:message key="110275"/></c:param>
                <c:param name="form">axisper016</c:param>
            </c:import>

            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:50%;height:0px"></th>
                                            <th style="width:50%;height:0px"></th>
                                        </tr>
                                        <tr>
                                        <td colspan="3">
                                           <textarea cols="" readonly rows="10" class="campo campotexto" id="PMENSAPOPUP" name="PMENSAPOPUP" size="15" 
                                            style="width:97.5%;overflow:hidden">${__formdata.PMENSAPOPUP}</textarea>
                                        </td>
                                        </tr>
                                     </table>
                                </td>
                            </tr>
                        </table>
                    
                     
                            
                    </td>
                </tr>
            </table>						
            
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisper016</c:param>
                <c:param name="__botones">cancelar</c:param>
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
</div>
    </body>
</html>

