<%/**
*  Fichero: axisrea044.jsp 
*
*  Fecha: 08/04/2014
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
        <title><axis:alt f="axisrea044" c="TITULO" lit="101467"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>    
        <link rel="StyleSheet" href="styles/tree.css" type="text/css"></link>
        <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green"/>
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
            }
            
            function f_but_aceptar() {
                 if (objValidador.validaEntrada()) {
                    objUtiles.ejecutarFormulario("modal_axisrea044.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
                 }    
            }
            
            function f_but_cancelar() {
                 var IDCABECERA = document.miForm.IDCABECERA.value;
                 parent.f_cerrar_modal("axisrea044", IDCABECERA);      
            }           
            
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/
            
            // TODO Implementar CallBack Ajax
            
        </script>
    </head>
    <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_aceptar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="modal_axisrea044.do" method="POST">        
            <input type="hidden" id="operation" name="operation" value="aceptar"/>
            <input type="hidden" id="ID" name="ID" value="${__formdata.ID}"/>
            <input type="hidden" id="IDCABECERA" name="IDCABECERA" value="${__formdata.IDCABECERA}"/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisrea044" c="TITULO" lit="101467"/></c:param>
                <c:param name="titulo"><axis:alt f="axisrea044" c="TITULO" lit="101467"/></c:param> 
                <c:param name="form">axisrea044</c:param>
            </c:import>
        
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">
                            <tr>
                                <td align="center">
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisrea044" c="PORCEN">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisrea044" c="PORCEN" lit="101467"/></b>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisrea044" c="FPAGO">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisrea044" c="FPAGO" lit="101573"/></b>
                                            </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:visible c="PORCEN" f="axisrea044">
                                            <td class="campocaja">
                                                  <input id="PORCEN" name="PORCEN" type="text" class="campo campotexto" style="width:10%" maxlength="120"
                                                title=<axis:alt f="axisrea044" c="PORCEN" lit="101467" />
                                                alt=<axis:alt f="axisrea044" c="PORCEN" lit="101467"/> 
                                                value="${__formdata.PORCEN}"
                                                <axis:atr f="axisrea044" c="PORCEN" a="modificable=true&obligatorio=true"/>/>
                                            </td>
                                            </axis:visible>
                                            <axis:ocultar f="axisrea044" c="FPAGO">
                                            <td class="campocaja">
                                                <input type="text" class="campo campotexto" size="15" style="width:35%;"
                                                     value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FPAGO}"/>"
                                                     name="FPAGO" id="FPAGO"
                                                     title="<axis:alt f='axisrea044' c='FPAGO' lit='101573'/>"
                                                     alt="<axis:alt f='axisrea044' c='FPAGO' lit='101573'/>" <axis:atr f="axisage009" c="FPAGO" a="formato=fecha&modificable=true&obligatorio=true"/> />
                                                     <a style="vertical-align:middle;">
                                                <img id="icon_FPAGO" alt='<axis:alt f="axisrea044" c="FPAGO" lit="101573"/>'
                                                     title='<axis:alt f="axisrea044" c="FPAGO" lit="101573" />'
                                                     src="images/calendar.gif"/></a>
                                            </td>
                                            </axis:ocultar>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>
                                                                         
                    </td>
                </tr>
            </table>
            
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisrea044</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
         <script type="text/javascript">
          Calendar.setup( {
              inputField : "FPAGO", ifFormat : "%d/%m/%Y", button : "icon_FPAGO", singleClick : true, firstDay : 1
          });
          
        </script>    
    </body>
</html>