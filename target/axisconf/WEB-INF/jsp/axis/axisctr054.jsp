<%/**
*  Fichero: axisctr054.jsp
*  Pantalla de impresión de registros por agente.
*
*  Fecha: 16/01/2009
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
 
<html>
    <head>
        <title><axis:alt f="axisctr054" c="TITPANTALLA" lit="1000233"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <!--********** CALENDARIO ************************* -->
          <!-- Hoja de estilo del Calendario -->
          <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
          <!-- Script principal del calendario -->
          <script type="text/javascript" src="scripts/calendar.js"></script>
          <!-- Idioma del calendario, en función del Locale -->
          <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
          <!-- Setup del calendario -->
          <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        <!--*********************************** -->

        <c:import url="../include/carga_framework_js.jsp" />
        
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            var nuevaVentana      = null;
            var nuevaVentana2     = null;
            var idVentanas        = new Array();
            var contadorVentanas  = 0;

            function f_onload() {
                f_cargar_propiedades_pantalla();     
                
                if (!objUtiles.estaVacio("${sessionScope.FICHERO1}")) {                    
                    nuevaVentana = window.open("axis_axisctr054.do?operation=mostrar_fichero&fichero=1");    
                    // Abrir un proceso con setInterval para cerrar la ventana recién abierta
                    if (document.all) {
                        idVentanas[contadorVentanas] = setInterval("f_cerrar_nuevaVentana()", 100);
                        contadorVentanas++;
                    }                   
                }  

                if (!objUtiles.estaVacio("${sessionScope.FICHERO2}")) {                    
                    nuevaVentana2 = window.open("axis_axisctr054.do?operation=mostrar_fichero&fichero=2");    
                    // Abrir un proceso con setInterval para cerrar la ventana recién abierta
                    if (document.all) {
                        idVentanas[contadorVentanas] = setInterval("f_cerrar_nuevaVentana2()", 100);
                        contadorVentanas++;
                    }            
                }  
            }
            
            function f_cerrar_nuevaVentana() {
                try {
                    if (nuevaVentana != null && nuevaVentana.document.readyState != 'loading') {
                        nuevaVentana.window.close();
                    }
                } catch (e) {}
            }        
            
            function f_cerrar_nuevaVentana2() {
                try {
                    if (nuevaVentana2 != null && nuevaVentana2.document.readyState != 'loading') {
                        nuevaVentana2.window.close();
                    }
                } catch (e) {}
            }        

            function f_but_imprimir() {
                if (objValidador.validaEntrada())
                    objUtiles.ejecutarFormulario ("axis_axisctr054.do", "imprimir", document.miForm, "_self", objJsMessages.jslit_cargando);
            }

            function f_but_salir() {
                // Para IE, limpiar las funciones setInterval
                if (document.all) {
                    for (var i=0; i < idVentanas.length; i++)
                        clearInterval(idVentanas[i]);
                }

                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr054", "cancelar", document.miForm, "_self");
            }           
            
            function f_actualizar_agente(CAGENTE) {
                objAjax.invokeAsyncCGI("modal_axisctr052.do", callbackAjaxActualizarAgente, 
                    "operation=actualizar_agente&CAGENTE=" + CAGENTE, this, objJsMessages.jslit_cargando);
            }

            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/    
    
            function callbackAjaxActualizarAgente(ajaxResponseText) {
                var doc = objAjax.domParse(ajaxResponseText);
                try {            
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {

                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0])) {
                            objDom.setValorPorId("CAGENTE", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0)));
                        } else {
                            objDom.setValorPorId("CAGENTE", "");
                        }
                        
                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NOMBRE")[0])) {
                            objDom.setValorPorId("TAGENTE", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0)));
                        } else {
                            objDom.setValorPorId("TAGENTE", "");
                        }
                    
                    } else {                       
                        objDom.setValorPorId("TAGENTE", "");
                    }
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
            }
            
        </script>
    </head>
   
    <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
        
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>                        
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisctr054" c="IMPREGAG" lit="9000749"/></c:param> <%-- Impresión de registros por agente --%>
                <c:param name="titulo"><axis:alt f="axisctr054" c="IMPREGAG" lit="9000749"/></c:param>     <%-- Impresión de registros por agente --%>
                <c:param name="form">axisctr054</c:param>
            </c:import>
           
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp; </div>      
                        <div class="separador">&nbsp; </div>      
                        <!-- Área 1 -->
                        <table class="area" align="center">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:5%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:45%;height:0px"></th>
                            </tr>
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr054" c="CAGENTE" lit="9000752"/></b>   <%-- Broker --%>
                                </td>
                            </tr>
                            <tr>
                                <%-- Broker --%>
                                <td class="campocaja" colspan="3">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:30%;" 
                                    value="${__formdata.CAGENTE}" name="CAGENTE" id="CAGENTE" obligatorio="true" 
                                    onchange="f_actualizar_agente(this.value)"
                                    alt="<axis:alt f="axisctr054" c="CAGENTE" lit="9000752"/>" title="<axis:alt f="axisctr054" c="CAGENTE" lit="9000752"/>"/>
                                    &nbsp;
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:62.5%;" 
                                    value="${__formdata.TAGENTE}" name="TAGENTE" id="TAGENTE"
                                    alt="<axis:alt f="axisctr054" c="TAGENTE" lit="9000753"/>" title="<axis:alt f="axisctr054" c="TAGENTE" lit="9000753"/>"/>
                                </td>            
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr054" c="DATAINI" lit="9000526"/></b>   <%-- Fecha inicio --%>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr054" c="DATAFIN" lit="9000527"/></b>   <%-- Fecha fin --%>
                                </td>                    
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <%-- Fecha inicio --%>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:35%;" 
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.DATAINI}"/>" name="DATAINI" id="DATAINI"
                                    alt="<axis:alt f="axisctr054" c="DATAINI" lit="9000526"/>" title="<axis:alt f="axisctr054" c="DATAINI" lit="9000526"/>" formato="fecha" obligatorio=true
                                    <axis:atr f="axisctr054" c="DATAINI" a="formato=fecha&obligatorio=true"/><a style="vertical-align:middle;"><img
                                    id="icon_DATAINI" alt="<axis:alt f="axisctr054" c="DATAVIG" lit="9000716"/>" title="<axis:alt f="axisctr054" c="DATAVIG" lit="9000716" />" src="images/calendar.gif"/></a>
                                </td>      
                                <td>
                                    &nbsp;
                                </td>
                                <%-- Fecha fin --%>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:35%;" 
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.DATAFIN}"/>" 
                                    name="DATAFIN" id="DATAFIN"
                                    alt="<axis:alt f="axisctr054" c="DATAFIN" lit="9000527"/>" title="<axis:alt f="axisctr054" c="DATAFIN" lit="9000527"/>" formato="fecha" obligatorio=true
                                    <axis:atr f="axisctr054" c="DATAFIN" a="formato=fecha&obligatorio=true"/><a style="vertical-align:middle;"><img
                                    id="icon_DATAFIN" alt="<axis:alt f="axisctr054" c="DATAVIG" lit="9000716"/>" title="<axis:alt f="axisctr054" c="DATAVIG" lit="9000716" />" src="images/calendar.gif"/></a>
                                </td>            
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>           
                        
                        <div class="separador">&nbsp; </div>      
                        <c:import url="../include/botonera_nt.jsp">
                        <c:param name="f">axisctr054</c:param>
                        <c:param name="__botones">salir,imprimir</c:param>
                        </c:import>
                        
                    </td>
                </tr>
            </table>
            
        </form>
        <c:import url="../include/mensajes.jsp" />
        
        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "DATAINI",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_DATAINI", 
                singleClick    :    true,
                firstDay       :    1
            });

            Calendar.setup({
                inputField     :    "DATAFIN",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_DATAFIN", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>
        
    </body>
</html>
