<%/**
*  Fichero: axisctr053.jsp
*  Pantalla de recibos pendientes.
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

<html>
    <head>
        <title><axis:alt f="axisctr053" c="IMPRECPEND" lit="9000748"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          

        <style type="text/css">
            .displayspaceMaximo {
                width:99.8%;
                height: expression( this.scrollHeight > 349 ? "350px" : "auto" );
                max-height:350px;
                overflow-x: hidden;
                overflow-y: auto;
                border: 1px solid #DDDDDD;
            }
        </style>

        <c:import url="../include/carga_framework_js.jsp" />
        
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/

            var nuevaVentana      = null;
            var idVentanas        = new Array();
            var contadorVentanas  = 0;

            function f_onload() {
            
                f_cargar_propiedades_pantalla();    
               
                if (${empty requestScope.LSTRECIBOS && empty requestScope.__mensajes.m__clave}) { 
                    objDom.setVisibilidadPorId("but_cerrar_modal_axisctr052", "hidden");
                    objUtiles.abrirModal
                        ('axisctr052', 'src', 'modal_axisctr052.do?operation=form');
                } else if (!objUtiles.estaVacio("${sessionScope.FICHERO}")) {                    
                    nuevaVentana = window.open("axis_axisctr053.do?operation=mostrar_fichero");    
                    // Abrir un proceso con setInterval para cerrar la ventana recién abierta
                    if (document.all) {
                        idVentanas[contadorVentanas] = setInterval("f_cerrar_nuevaVentana()", 100);
                        contadorVentanas++;
                    }       
                }  
                
                var dtRecibosOffset = "${requestScope.dtRecibosOffset}";
    
                if (!objUtiles.estaVacio(dtRecibosOffset)) 
                    document.getElementById("dt_recibos").scrollTop = parseInt(dtRecibosOffset);        
                    
                 
            }
            function f_cerrar_nuevaVentana() {
                try {
                    if (nuevaVentana != null && nuevaVentana.document.readyState != 'loading') {
                        nuevaVentana.window.close();
                    }
                } catch (e) {}
            }        

            
            function f_but_salir() {
                objAjax.invokeAsyncCGI("axis_axisctr053.do?SPROIMP=" + objDom.getValorPorId("SPROIMP"), callbackCancelar, "operation=cancelar", this);
            }
            
            function f_but_imprimir() {
                objUtiles.abrirModal('axisimprimir', 'src', 'modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_recibos&SPROIMP=' + objDom.getValorPorId("SPROIMP"));
                //var dtRecibosOffset = document.getElementById("dt_recibos").scrollTop;
                //objUtiles.ejecutarFormulario ("axis_axisctr053.do?dtRecibosOffset=" + dtRecibosOffset,
                //    "imprimir", document.miForm, "_self", objJsMessages.jslit_cargando);            
            }
            
            function f_cerrar_axisimprimir() {
                objUtiles.cerrarModal("axisimprimir");
                objUtiles.abrirModal
                    ('axisctr052', 'src', 'modal_axisctr052.do?operation=form');
            } 
            
            function f_but_buscar() {
                objUtiles.abrirModal
                    ('axisctr052', 'src', 'modal_axisctr052.do?operation=form');
            }
            
            function f_seleccionar_recibo(NRECIBO, CESTADO) {
                var dtRecibosOffset = document.getElementById("dt_recibos").scrollTop;
                objUtiles.ejecutarFormulario ("axis_axisctr053.do?NRECIBO=" + NRECIBO + "&CESTADO=" + (CESTADO ? 1 : 0) + "&dtRecibosOffset=" + dtRecibosOffset, 
                    "seleccionar_recibo", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_seleccionar_todos(seleccionarTodos) {
                var dtRecibosOffset = document.getElementById("dt_recibos").scrollTop;
                objUtiles.ejecutarFormulario ("axis_axisctr053.do?CESTADO=" + (seleccionarTodos ? 1 : 0) + "&dtRecibosOffset=" + dtRecibosOffset,
                    "seleccionar_todos", document.miForm, "_self", objJsMessages.jslit_cargando);
            }

            /****************************************************************************************/
            /********************************* MODAL AXISCTR052 *************************************/
            /****************************************************************************************/
            
            function f_cerrar_modal(cual) {
                objUtiles.cerrarModal(cual);
            }
            
            function f_aceptar_axisctr052(SPROIMP) {
                f_cerrar_modal("axisctr052");
                if (objDom.getValorPorId("impreso") == "true" && SPROIMP != objDom.getValorPorId("SPROIMP"))
                // Si ya hemos imprimido, y estamos buscando otro proceso, ponemos impreso a false 
                // Para rehabilitar la selección de recibos
                    objDom.setValorPorId("impreso", "false");
                
                objDom.setValorPorId("SPROIMP", SPROIMP);
                objUtiles.ejecutarFormulario ("axis_axisctr053.do",
                    "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/    
    
            function callbackCancelar(ajaxResponseText) {
                var doc = objAjax.domParse(ajaxResponseText);
                
                try {                            
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr053", "cancelar", document.miForm, "_self");
                        // Para IE, limpiar las funciones setInterval
                        if (document.all) {
                            for (var i=0; i < idVentanas.length; i++)
                                clearInterval(idVentanas[i]);
                        }
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
            <input type="hidden" name="SPROIMP" id="SPROIMP" value="${__formdata.SPROIMP}"/>             
            <input type="hidden" name="impreso" id="impreso" value="${__formdata.impreso}"/>
           
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisctr053" c="IMPRECPEND" lit="9000748"/></c:param> <%-- Impresión de recibos pendientes --%>
                <c:param name="titulo"><axis:alt f="axisctr053" c="IMPRECPEND" lit="9000748"/></c:param>     <%-- Impresión de recibos pendientes --%>
                <c:param name="form">axisctr053</c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisctr052|<axis:alt f="axisctr053" c="BUSRECPEND" lit="9000747"/></c:param> <%-- Buscador de recibos pendientes de impresión --%>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisctr053" c="LIT_1000205" lit="1000205" /></c:param>
            </c:import> 
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp; </div>                                        
                        <table class="seccion">
                            <tr>
                                <th style="width:10%;height:0px"></th>
                               
                                <th style="width:10%;height:0px"></th>
                                <th style="width:26.5%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:26.5%;height:0px"></th>
                                <th style="width:5%;height:0px"></th>
                                <% if (!request.getHeader("User-Agent").contains("MSIE")) { %>
                                <th style="width:2%;height:0px"></th>
                                <% } %>
                            </tr>
                            <tr>
                                <td colspan="<%= (!request.getHeader("User-Agent").contains("MSIE")) ? 9 : 8 %>"> 
                                    <%-- DisplayTag Recibos --%>
                                    <c:set var="title0"><axis:alt f="axisctr053" c="NUMERO" lit="800440"/></c:set>  <%-- Nº --%>
                                    <c:set var="title5"><axis:alt f="axisctr053" c="NPOLIZA" lit="100836"/></c:set>  <%-- Póliza --%>                                    
                                    <c:set var="title1"><axis:alt f="axisctr053" c="TNOMBRE" lit="105940"/></c:set>  <%-- Nombre --%>
                                    <c:set var="title2"><axis:alt f="axisctr053" c="IMPRECIBO" lit="100563"/></c:set>  <%-- Importe --%>
                                    <%--NUEVA COLUMNA--%>
                                    <c:set var="title7"><axis:alt f="axisctr053" c="TTIPREC" lit="102302"/></c:set>   <%-- Tipo de rebut --%>
                                    <%--NUEVA COLUMNA--%>
                                    <c:set var="title3"><axis:alt f="axisctr053" c="TSITUAC" lit="100874"/></c:set>  <%-- Situación --%>
                                    <c:set var="title4"><axis:alt f="axisctr053" c="TPRODUCTO" lit="100829"/></c:set>  <%-- Producto --%>
                                    <c:set var="title6"><axis:alt f="axisctr053" c="CRECCIA" lit="9001763"/></c:set>  <%-- Nº Recibo Compañia --%>

                                    <div id="dt_recibos" class="displayspaceMaximo">
                                        <display:table name="${requestScope.LSTRECIBOS}" id="LSTRECIBOS" export="false" class="dsptgtable" pagesize="-1" cellpadding="0" cellspacing="0"
                                             requestURI="axis_axisctr053.do?paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title0}" sortable="true" sortProperty="NRECIBO" headerClass="sortable headwidth10 fixed"  media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${LSTRECIBOS.NRECIBO}
                                                </div>
                                            </display:column>                                          
                                          <axis:visible f="axisctr053" c="CRECCIA">
                                            <display:column title="${title6}" sortable="true" sortProperty="CRECCIA" headerClass="sortable headwidth10 fixed"  style="width:13.5%" media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${LSTRECIBOS.CRECCIA}
                                                </div>
                                            </display:column>
                                            </axis:visible>   
                                            <display:column title="${title5}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable headwidth10 fixed"  media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${LSTRECIBOS.NPOLIZA}
                                                </div>
                                            </display:column>
                                            <display:column title="${title1}" sortable="true" sortProperty="TNOMBRE" headerClass="sortable fixed" style="width:27.5%" media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${LSTRECIBOS.TNOMBRE}
                                                </div>
                                            </display:column>
                                            <display:column title="${title2}" sortable="true" sortProperty="IMPRECIBO" headerClass="sortable headwidth10 fixed" media="html" autolink="false" >
                                                <div class="dspNumber">
                                                    <fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value="${LSTRECIBOS.IMPRECIBO}"/>
                                                </div>
                                            </display:column>
                                            <%--NUEVA COLUMNA--%>
                                               <display:column title="${title7}" sortable="true" sortProperty="TTIPREC" headerClass="sortable fixed" style="width:15.5%" media="html" autolink="false" >
                                                 <div class="dspText">
                                                   ${LSTRECIBOS.TTIPREC}
                                                </div>
                                            </display:column>
                                            <%--NUEVA COLUMNA--%>
                                            <display:column title="${title3}" sortable="true" sortProperty="TSITUAC" headerClass="sortable headwidth10 fixed" media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${LSTRECIBOS.TSITUAC}
                                                </div>
                                            </display:column>
                                            <display:column title="${title4}" sortable="true" sortProperty="TPRODUCTO" headerClass="sortable fixed" style="width:27.5%" media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${LSTRECIBOS.TPRODUCTO}
                                                </div>
                                            </display:column>
                                            <display:column title="" sortable="true" sortProperty="" headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >
                                                 <div class="dspIcons">
                                                    <input type="checkbox" 
                                                    onclick="f_seleccionar_recibo('${LSTRECIBOS.NRECIBO}', this.checked)"
                                                    <c:if test="${LSTRECIBOS.CESTADO == '1'}"> checked="checked"</c:if>
                                                    <c:if test="${__formdata.impreso == 'true'}"> disabled="disabled"</c:if>/>
                                                </div>
                                            </display:column>                                                        
                                        </display:table>                                                        
                                    </div>
                                    <div class="separador">&nbsp; </div>                                        
                                </td>                                                
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                  
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:100%;padding:0;margin:0;text-align:right" 
                                    value="<fmt:formatNumber pattern='###,#00.00' value="${requestScope.PITOTALR}"/>" name="PITOTALR" id="PITOTALR"/>
                                    <div class="separador">&nbsp; </div>                                        
                                   
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7">
                                    <c:if test="${__formdata.impreso != 'true'}">
                                        <input type="button" onclick="f_seleccionar_todos(true)" class="boton" value="<axis:alt f="axisctr053" c="LIT_9000756" lit="9000756"/>"/>
                                        &nbsp;&nbsp;&nbsp;
                                        <input type="button" onclick="f_seleccionar_todos(false)" class="boton" value="<axis:alt f="axisctr053" c="LIT_9000757" lit="9000757"/>"/>
                                    </c:if>
                                </td>
                            </tr>
                        </table>                        
                        
                        <div class="separador">&nbsp; </div>                                        
                        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr053</c:param><c:param name="f">axisctr053</c:param>
                            <c:param name="f">axisctr053</c:param>
                            <c:param name="__botones">salir,buscar,imprimir</c:param>
                        </c:import>
                        
                    </td>
                </tr>
            </table>
            
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>
