<%/**
*  Fichero: axisctr052.jsp
*  Pantalla de buscador de recibos pendientes de impresión
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>  
*
*  Fecha: 15/01/2009
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
        <title><axis:alt f="axisctr052" c="MODUSU" lit="1000233"/></title>
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
            
            function f_onload() {  
                f_cargar_propiedades_pantalla();
                var valorCREIMP = '${empty __formdata.CREIMP ? 0 : __formdata.CREIMP}';
                f_habilitar_seccion(valorCREIMP);
                
                if (${requestScope.buscarOK == true && !empty __formdata.SPROIMP}) {
                    if (${empty __formdata.CREIMP || __formdata.CREIMP == 0})                    
                        // Si es una primera impresión, mostrar SPROCES
                        alert("<axis:alt f='axisctr052' c='NPROCES' lit='9000493'/>: " + "${__formdata.SPROIMP}");
                    parent.f_aceptar_axisctr052('${__formdata.SPROIMP}');
                } else {                    
                    var radioCREIMP = 'CREIMP' + valorCREIMP;
                    document.getElementById(radioCREIMP).checked = "true";
                    document.getElementById(radioCREIMP).value   = valorCREIMP;                   
                }
            }
            
     
            
            function f_but_buscar() {
                if (objValidador.validaEntrada()) {
                    objUtiles.ejecutarFormulario ("modal_axisctr052.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }

            function f_but_cancelar() {
                parent.f_cerrar_modal("axisctr052");
            }           
            
            function f_habilitar_seccion(cual) {  
                // Habilita los campos de un div (seccion0 o seccion1) y deshabilita la contraria
                
                // Habilitar
                var divAHabilitar = document.getElementById("seccion" + cual);                                
                var elements = divAHabilitar.getElementsByTagName('*');
                
                for (i = 0; i < elements.length; i++) {
                    // elements[i].removeAttribute("disabled");
                    elements[i].disabled = false;
                }
                
                f_habilitar_elementos_de_tabla(divAHabilitar);
                
                // Deshabilitar
                var divADeshabilitar = document.getElementById("seccion" + (cual == 0 ? 1 : 0));                      
                elements = divADeshabilitar.getElementsByTagName('*');
                
                for (i = 0; i < elements.length; i++) {
                    elements[i].disabled = true;
                }
                
                f_deshabilitar_elementos_de_tabla(divADeshabilitar);       
                revisarEstilos();  
                
                if (cual == 0) {
                    document.getElementById("DATAINI").className = "campowidthinput campo campotexto_ob";
                } else {
                    document.getElementById("DATAINI").className = "campowidthinput campo campodisabled";
                }
            }
            
            function f_habilitar_elementos_de_tabla(divAHabilitar) {
                var elements = divAHabilitar.getElementsByTagName('input');
                for (i = 0; i < elements.length; i++) {
                    if (elements[i].type != 'checkbox')
                        elements[i].className = "campowidthinput campo campotexto";
                }
                
                elements = divAHabilitar.getElementsByTagName('select');
                for (i = 0; i < elements.length; i++) {
                    elements[i].className = "campo campotexto";
                }
                
                elements = divAHabilitar.getElementsByTagName('img');
                for (i = 0; i < elements.length; i++) {
                    elements[i].style.visibility = "visible";
                }

            }
            
            function f_deshabilitar_elementos_de_tabla(divADeshabilitar) {                
                elements = divADeshabilitar.getElementsByTagName('img');
                for (i = 0; i < elements.length; i++) {
                    elements[i].style.visibility = "hidden";
                }
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
                            objDom.setValorPorId("CAGENTE1", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0)));
                            objDom.setValorPorId("CAGENTE2", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0)));
                        } else {
                            objDom.setValorPorId("CAGENTE1", "");
                            objDom.setValorPorId("CAGENTE2", "");
                        }
                        
                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NOMBRE")[0])) {
                            objDom.setValorPorId("TAGENTE1", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0)));
                            objDom.setValorPorId("TAGENTE2", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0)));
                        } else {
                            objDom.setValorPorId("TAGENTE1", "");
                            objDom.setValorPorId("TAGENTE2", "");
                        }
                    
                    } else {
                        if (document.getElementById("TAGENTE2").disabled)
                            objDom.setValorPorId("TAGENTE1", "");
                        else
                            objDom.setValorPorId("TAGENTE2", "");
                    }
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
            }

            
        </script>
    </head>
   
    <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>                        
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisctr052" c="BUSQRE" lit="9000747"/></c:param> <%-- Buscador de recibos pendientes de impresión --%>
                <c:param name="titulo"><axis:alt f="axisctr052" c="BUSQRE" lit="9000747"/></c:param>     <%-- Buscador de recibos pendientes de impresión --%>
                <c:param name="form">axisctr052</c:param>
            </c:import>
           
            <!-- Área de campos  -->
            <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp; </div>      
                        
                        <div style="float:left;width:49%;height:320px" class="seccion">
                            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr052" c="PRIIMP" lit="9000750" /> <%-- Primeras impresiones --%>
                                <input type="radio" id="CREIMP0" name="CREIMP" value="${__formdata.CREIMP}" onclick="this.value = 0; f_habilitar_seccion(0)"/>
                            </div> 
                            
                            <div id="seccion0">
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:50%;height:0px"></th>
                                        <th style="width:50%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr052" c="PROD" lit="100829"/></b>   <%-- Producto --%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <%-- Producto --%>
                                        <td class="campocaja" colspan="2">
                                            <select name="SPRODUC" id="SPRODUC" size="1" class="campo campotexto" style="width:96%" 
                                            title="<axis:alt f="axisctr052" c="PROD" lit="100829"/>">
                                                <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisctr052" c="SELECCION" lit="1000348"/> - </option>
                                                <c:forEach items="${__formdata.LSTPRODUCTOS}" var="item">
                                                    <option report="${item.SPRODUC}" value = "${item.SPRODUC}" <c:if test="${__formdata.SPRODUC == item.SPRODUC}"> selected </c:if>>${item.TTITULO}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>                      
                                    <tr>
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisctr052" c="CAGENTE" lit="9000752"/></b>  <%-- Broker --%>                                            
                                            <%-- <b><axis:alt f="axisctr052" c="LIT_9000753" lit="9000753"/></b>  <%-- Nombre broker --%> 
                                        </td>                    
                                    </tr>
                                    <tr>
                                        <%-- Broker --%>
                                        <td class="campocaja" colspan="2">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" style="width:20%;" 
                                            value="${__formdata.CAGENTE}" name="CAGENTE" id="CAGENTE1" onchange="f_actualizar_agente(this.value)" 
                                            alt="<axis:alt f="axisctr052" c="CAGENTE" lit="9000752"/>" title="<axis:alt f="axisctr052" c="CAGENTE" lit="9000752"/>"/>
                                            &nbsp;
                                            <%-- Nombre broker --%>
                                            <input type="text" class="campowidthinput campo campotexto" size="15" style="width:72%;" 
                                            value="${__formdata.TAGENTE}" name="TAGENTE" id="TAGENTE1" readonly="readonly"
                                            alt="<axis:alt f="axisctr052" c="TAGENTE" lit="9000753"/>" title="<axis:alt f="axisctr052" c="TAGENTE" lit="9000753"/>"/>
                                        </td>            
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr052" c="NPOLIZA" lit="100836"/></b>   <%-- Póliza --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr052" c="NRECIBO" lit="100895"/></b>   <%-- Recibo --%>
                                        </td>                    
                                    </tr>
                                    <tr>
                                        <%-- Póliza --%>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;" 
                                            value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA"
                                            alt="<axis:alt f="axisctr052" c="NPOLIZA" lit="100836"/>" title="<axis:alt f="axisctr052" c="NPOLIZA" lit="100836"/>"/>
                                        </td>           
                                        <%-- Recibo --%>                                    
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;" 
                                            value="${__formdata.NRECIBO}" name="NRECIBO" id="NRECIBO"
                                            alt="<axis:alt f="axisctr052" c="NRECIBO" lit="100895"/>" title="<axis:alt f="axisctr052" c="NRECIBO" lit="100895"/>"/>
                                        </td>            
                                    </tr>                                    
                                    <axis:ocultar f="axisctr052" c="CRECCIA" dejarHueco="false"> 
                                    <tr>
                                         <td class="titulocaja" id="LIT_CRECCIA">
                                             <b><axis:alt f="axisctr052" c="CRECCIA" lit="9001763"/></b>
                                            </td>     
                                    </tr>
                                    </axis:ocultar>                                   
                                    <axis:ocultar f="axisctr052" c="CRECCIA" dejarHueco="false"> 
                                    <tr>                                     
                                        <td class="campocaja">    
                                                    <input type="text" name="CRECCIA" id="CRECCIA" value="${__formdata.CRECCIA}" class="campowidthinput campo campotexto" size="15" style="width:90%;"
                                                   <axis:atr f="axisctr052" c="CRECCIA" a="modificable=true&obligatorio=false"/> alt="<axis:alt f="axisctr052" c="CRECCIA" lit="9001763" />" title="<axis:alt f="axisctr052" c="CRECCIA" lit="9001763" />"/>
                                        </td>                                           
                                    </tr>
                                    </axis:ocultar>                                       
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr052" c="FECHINI" lit="9000526"/></b>   <%-- Fecha inicio --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr052" c="FECHFIN" lit="9000527"/></b>   <%-- Fecha fin --%>
                                        </td>                    
                                    </tr>
                                    <tr>
                                        <%-- Fecha inicio --%>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" style="width:35%;" 
                                            value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.DATAINI}"/>" name="DATAINI" id="DATAINI"
                                            alt="<axis:alt f="axisctr052" c="FECHINI" lit="9000526"/>" title="<axis:alt f="axisctr052" c="FECHINI" lit="9000526"/>" formato="fecha" obligatorio=true
                                            <axis:atr f="axisctr052" c="DATAINI" a="formato=fecha&obligatorio=true"/><a style="vertical-align:middle;"><img
                                            id="icon_DATAINI" alt="<axis:alt f="axisctr052" c="DATAINI" lit="9000716"/>" title="<axis:alt f="axisctr052" c="DATAINI" lit="9000716" />" src="images/calendar.gif"/></a>
                                        </td>            
                                        <%-- Fecha fin --%>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" style="width:35%;" 
                                            value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.DATAFIN}"/>" 
                                            name="DATAFIN" id="DATAFIN"
                                            alt="<axis:alt f="axisctr052" c="FECHFIN" lit="9000527"/>" title="<axis:alt f="axisctr052" c="FECHFIN" lit="9000527"/>" formato="fecha"
                                            <axis:atr f="axisctr052" c="DATAFIN" a="formato=fecha&obligatorio=true"/><a style="vertical-align:middle;"><img
                                            id="icon_DATAFIN" alt="<axis:alt f="axisctr052" c="DATAINI" lit="9000716"/>" title="<axis:alt f="axisctr052" c="DATAINI" lit="9000716" />" src="images/calendar.gif"/></a>
                                        </td>            
                                    </tr>
                                </table>           
                            </div>
                        </div>        
                        
                        <div style="float:left;width:1%">
                            &nbsp;
                        </div>
                        
                        <div style="float:left;width:49%;height:320px" class="seccion">
                            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr052" c="REIMPRE" lit="9000751"/> <%-- Reimpresiones --%>
                                <input type="radio" id="CREIMP1" name="CREIMP" value="${__formdata.CREIMP}" onclick="this.value = 1; f_habilitar_seccion(1)"/>
                            </div> 
                            
                            <div id="seccion1">
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:50%;height:0px"></th>
                                        <th style="width:50%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr052" c="NPOLIZA" lit="100836"/></b>   <%-- Póliza --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr052" c="NRECIBO" lit="100895"/></b>   <%-- Recibo --%>
                                        </td>                    
                                    </tr>
                                    
                                    <tr>
                                        <%-- Póliza --%>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;" 
                                            value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA"
                                            alt="<axis:alt f="axisctr052" c="NPOLIZA" lit="100836"/>" title="<axis:alt f="axisctr052" c="NPOLIZA" lit="100836"/>"/>
                                        </td>           
                                        <%-- Recibo --%>                                    
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;" 
                                            value="${__formdata.NRECIBO}" name="NRECIBO" id="NRECIBO"
                                            alt="<axis:alt f="axisctr052" c="NRECIBO" lit="100895"/>" title="<axis:alt f="axisctr052" c="NRECIBO" lit="100895"/>"/>
                                        </td>            
                                    </tr>  
                                    <axis:ocultar f="axisctr052" c="CRECCIA" dejarHueco="false"> 
                                    <tr>
                                         <td class="titulocaja" id="LIT_CRECCIA">
                                             <b><axis:alt f="axisctr052" c="CRECCIA" lit="9001763"/></b>
                                            </td>     
                                    </tr>
                                    </axis:ocultar>                                   
                                    <axis:ocultar f="axisctr052" c="CRECCIA" dejarHueco="false"> 
                                    <tr>                                     
                                        <td class="campocaja">    
                                                    <input type="text" name="CRECCIA" id="CRECCIA" value="${__formdata.CRECCIA}" class="campowidthinput campo campotexto" size="15" style="width:90%;"
                                                   <axis:atr f="axisctr052" c="CRECCIA" a="modificable=true&obligatorio=false"/> alt="<axis:alt f="axisctr052" c="CRECCIA" lit="9001763" />" title="<axis:alt f="axisctr052" c="CRECCIA" lit="9001763" />"/>
                                        </td>                                           
                                    </tr>
                                    </axis:ocultar>  
                                    <tr>
                                    
                                    </tr>
                                </table>                            
                                
                                <div class="separador">&nbsp; </div>            
                                
                                <table class="area seccion" align="center" cellpadding="0" cellspacing="10">
                                    <tr>
                                        <th style="width:50%;height:0px"></th>
                                        <th style="width:50%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr052" c="SPROIMP" lit="9000755"/></b>   <%-- Reimpresión de recibos del proceso --%>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" style="width:93%;" 
                                            value="${__formdata.SPROIMP}" name="SPROIMP" id="SPROIMP" formato="entero"
                                            alt="<axis:alt f="axisctr052" c="SPROIMP" lit="9000755"/>" title="<axis:alt f="axisctr052" c="SPROIMP" lit="9000755"/>"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr052" c="PROD" lit="100829"/></b>   <%-- Producto --%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <%-- Producto --%>
                                        <td class="campocaja" colspan="2">
                                            <select name="SPRODUC" id="SPRODUC" size="1" class="campo campotexto" style="width:98%" 
                                            title="<axis:alt f="axisctr052" c="PROD" lit="100829"/>">
                                                <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisctr052" c="SELECCION" lit="1000348"/> - </option>
                                                <c:forEach items="${__formdata.LSTPRODUCTOS}" var="item">
                                                    <option report="${item.SPRODUC}" value = "${item.SPRODUC}" <c:if test="${__formdata.SPRODUC == item.SPRODUC}"> selected </c:if>>${item.TTITULO}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>    
                                    <tr>
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisctr052" c="CAGENTE" lit="9000752"/></b>  <%-- Broker --%>                                            
                                            <%-- <b><axis:alt f="axisctr052" c="TAGENTE" lit="9000753"/></b>  <%-- Nombre broker --%> 
                                        </td>                    
                                    </tr>
                                    <tr>
                                        <%-- Broker --%>
                                        <td class="campocaja" colspan="2">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" style="width:20%;" 
                                            value="${__formdata.CAGENTE}" name="CAGENTE" id="CAGENTE2" onchange="f_actualizar_agente(this.value)" 
                                            alt="<axis:alt f="axisctr052" c="CAGENTE" lit="9000752"/>" title="<axis:alt f="axisctr052" c="CAGENTE" lit="9000752"/>"/>
                                            &nbsp;
                                            <%-- Nombre broker --%>
                                            <input type="text" class="campowidthinput campo campotexto" size="15" style="width:73.5%;" 
                                            value="${__formdata.TAGENTE}" name="TAGENTE" id="TAGENTE2" readonly="readonly"
                                            alt="<axis:alt f="axisctr052" c="TAGENTE" lit="9000753"/>" title="<axis:alt f="axisctr052" c="TAGENTE" lit="9000753"/>"/>
                                        </td>            
                                    </tr>
                                </table>  
                            </div>
                        </div>          
                        
                        <div style="clear:both">&nbsp;</div>
                        <div class="separador">&nbsp; </div>                                        
                        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr052</c:param><c:param name="f">axisctr052</c:param>
                            <c:param name="f">axisctr052</c:param>
                            <c:param name="__botones">cancelar,buscar</c:param>
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
