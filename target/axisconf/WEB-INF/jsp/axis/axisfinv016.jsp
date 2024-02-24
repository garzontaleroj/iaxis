<%/**
*  Fichero: axisfinv016.jsp
*  Redireccionamiento de fondos
*  Fecha: 16/09/2015
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
        <title><axis:alt f="axisfinv016" c="LIT_NOMBRE_PANTALLA" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>       
        
        <c:import url="../include/carga_framework_js.jsp" />
        <!--********** CALENDARIO ************************* -->
        <!-- Hoja de estilo del Calendario -->
        <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
        <!-- Script principal del calendario -->
        <script type="text/javascript" src="scripts/calendar.js"></script>
        <!-- Idioma del calendario, en función del Locale -->
        <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <!-- Setup del calendario -->
        <script type="text/javascript" src="scripts/calendar-setup.js"></script>        
        
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
              f_cargar_propiedades_pantalla();

            }

            function f_but_salir() {
              objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisfinv016", "cancelar", document.miForm, "_self");
            }
            
            function f_but_109006() {
              objUtiles.ejecutarFormulario ("axis_axisfinv016.do", "procesar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
        </script>
    </head>
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
           <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
          
        <form name="miForm" action="" method="POST"> 
            <input type="hidden" name="operation" value=""/> 
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisfinv016" c="TITULO_PANTALLA" lit="9908496" /></c:param>
                <c:param name="formulario"><axis:alt f="axisfinv016" c="TITULO_FORM" lit="9908496" /></c:param>
                <c:param name="form">axisfinv016</c:param>
            </c:import>

            <!-- Área de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:200px">
             <tr>
               <td>
               <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="${fname}" c="TITULO" lit="9907213" /></div>
               <table class="seccion" style="height:200px">
                <tr>
                  <td>
                    <table>
                        <tr>
                            <td align="left">
                               <table class="area" align="center">
                                    <tr>
                                        <th style="width:25%;height:0px"></th>
                                    </tr>
                                    <tr>                  
                                        <axis:visible f="${fname}" c="FEFECTO">
                                            <td class="titulocaja">
                                                <b><axis:alt f="${fname}" c="FEFECTO" lit="9905745"></axis:alt></b>
                                            </td>
                                        </axis:visible>
                                    </tr>
                                    <tr> 
                                        <axis:visible f="${fname}" c="FEFECTO">
                                            <td class="campocaja">
                                                <jsp:useBean id="today" class="java.util.Date"/> 
                                                <input formato="fecha" type="text" class="campo campotexto" style="width:6%;" id="FEFECTO" name="FEFECTO" size="5" 
                                                title="<axis:alt f="${fname}" c="FEFECTO" lit="9905745" />"
                                                <axis:atr f="${fname}" c="FEFECTO" a="modificable=true&obligatorio=true"/>
                                                value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FEFECTO}'/>" />
                                                <a style="vertical-align:middle;"><img 
                                                id="icon_FEFECTO" alt="<axis:alt f="${fname}" c="FEFECTO" lit="108341" />" 
                                                title="<axis:alt f="${fname}" c="FEFECTO" lit="9905745" />" src="images/calendar.gif"/>
                                                </a>
                                            </td>
                                        </axis:visible>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td>
                    <table class="area" align="center">
                      <tr>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                      </tr> 
                      <tr>
                        <td class="titulocaja" >
                           <b> <axis:alt f="${fname}" c="CORIGEN" lit="9908497"/> </b>
                        </td>
                        <td class="titulocaja" >
                           <b> <axis:alt f="${fname}" c="CDESTINO" lit="9908498"/> </b>
                        </td>  
                        <td style="width:10%">
                        </td> 
                        <td style="width:10%">
                        </td>                         
                      </tr>
                      <tr>
                         <axis:visible f="${fname}" c="CORIGEN">
                         <td class="campocaja">
                           <select name = "CORIGEN" id ="CORIGEN" size="1" onchange="" class="campo campotexto" style="width:90%">
                              <option value="<%=Integer.MIN_VALUE%>"> - <fmt:message key="1000348"/> - </option>
                              <c:forEach items="${__formdata.listValores.lstOrigenFondos}" var="item">
                                <option value = "${item.CCODFON}" <c:if test="${__formdata.CORIGEN == item.CCODFON}"> selected </c:if>>${item.TFONABV}</option>
                              </c:forEach>
                           </select>
                         </td>
                         </axis:visible>
                         <axis:visible f="${fname}" c="CDESTINO">
                         <td class="campocaja">
                           <select name = "CDESTINO" id ="CDESTINO" size="1" onchange="" class="campo campotexto" style="width:90%">
                              <option value="<%=Integer.MIN_VALUE%>"> - <fmt:message key="1000348"/> - </option>
                              <c:forEach items="${__formdata.listValores.lstDestinoFondos}" var="item">
                                <option value = "${item.CCODFON}" <c:if test="${__formdata.CDESTINO == item.CCODFON}"> selected </c:if>>${item.TFONABV}</option>
                              </c:forEach>
                           </select>
                         </td>  
                         </axis:visible>
                         <td style="width:10%">
                         </td>    
                         <td style="width:10%">
                         </td>                            
                      </tr>
                    </table>
                  </td>
                </tr>
                </table>
                </td>
             </tr>
            </table>
                        
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">${fname}</c:param>
               <c:param name="f">axisfinv016</c:param>
               <c:param name="__botones">salir<axis:visible c="BT_EJECUTAR" f="axisfinv016">,109006</axis:visible></c:param>
            </c:import>            
        </form>
        <c:import url="../include/mensajes.jsp" />
        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FEFECTO",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FEFECTO", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>        
    </body>
</html>