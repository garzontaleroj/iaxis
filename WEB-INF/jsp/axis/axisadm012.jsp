<%/*
*  Fichero: axisadm012.jsp
*  @author <a href = "mailto:Joan Colldeforns@csi-ti.com">JCA</a> 
*
*  Fecha: 02/09/2008
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><fmt:message key="9000487"/></title> <%-- CONSULTA DE CIERRES --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    
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
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() { 
            revisarEstilos();
            var esModificable = ${requestScope.esModificable == 1};
            if (esModificable) {
                f_abrir_modal('axisadm013', false, 
                    "&CEMPRES=" + objDom.getValorPorId("CEMPRES") + "&CTIPO=" + objDom.getValorPorId("CTIPO") + "&FPERINI=" + objDom.getValorPorId("FPERINI"));
            }
        }
        
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm012", "cancelar", document.miForm, "_self");
        }
        
        function f_but_buscar() {
            if (objValidador.validaEntrada())
                objUtiles.ejecutarFormulario ("axis_axisadm012.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_nuevo() {
            if (objValidador.validaEntrada())
                f_abrir_modal("axisadm013", false, "&status=new&CEMPRES=" + objDom.getValorPorId("buscarCEMPRES") + "&CTIPO=" + objDom.getValorPorId("buscarCTIPO"));
        }

        function f_but_109006() { // Ejecutar
            var mensaje = "<fmt:message key='9000514'/>";
            if (confirm(mensaje))
                objUtiles.ejecutarFormulario ("axis_axisadm012.do", "ejecutar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        // Mira si un registro es modificable, hace una petición a BD y refresca por Ajax
        function f_get_modificable(CESTADO, CEMPRES, CTIPO, FPERINI) {            
            var params = new Array();
            params[0] = CEMPRES;           
            params[1] = CTIPO;
            params[2] = objUtiles.formateaTimeStamp2(FPERINI);
            
            objAjax.invokeAsyncCGI("axis_axisadm012.do", callbackGetModificable, "operation=get_modificable&CESTADO=" + CESTADO, this, null, params);
        }
        
        function f_borrar_cierre(CESTADO, CEMPRES, CTIPO, FPERINI) {            
            objUtiles.ejecutarFormulario ("axis_axisadm012.do?CESTADO=" + CESTADO + "&CEMPRES=" + CEMPRES + 
                "&CTIPO=" + CTIPO + "&FPERINI=" + objUtiles.formateaTimeStamp2(FPERINI), "borrar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
      
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_aceptar_modal(cual, params) {
            f_cerrar_modal(cual);
            if (objUtiles.estaVacio(params))   
                params = "";
            if (cual == 'axisadm013') /* modificar per model de cierres*/ {
                objUtiles.ejecutarFormulario("axis_axisadm012.do" + params, "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        
        /****************************************************************************************/
        /******************************* CALLBACKS AJAX *****************************************/
        /****************************************************************************************/

        function callbackGetModificable(ajaxResponseText, params) {
            var doc = objAjax.domParse(ajaxResponseText);

            // Si no hay mensajes de error, es modificable
            if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                f_abrir_modal("axisadm013", false, "&status=modify&CEMPRES=" + params[0] + "&CTIPO=" + params[1] + "&FPERINI=" + params[2]);
            }
        }
        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><fmt:message key="9000487"/></c:param>     <%-- CONSULTA DE CIERRES --%>
            <c:param name="formulario"><fmt:message key="9000487"/></c:param> <%-- CONSULTA DE CIERRES --%>
            <c:param name="form">axisadm012</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisadm013|<fmt:message key="9000494"/></c:param>
        </c:import>
    
        <input type="hidden" name="operation" value=""/>
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo">
                    </div>

                    <table class="seccion" align="center">
                        <tr>
                            <td >
                                <!-- Área 1 -->
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:24.5%;height:0px"></th>
                                        <th style="width:24.5%;height:0px"></th>
                                        <th style="width:24.5%;height:0px"></th>
                                        <th style="width:24.5%;height:0px"></th>
                                        <th style="width:2%;height:0px"></th>
                                    </tr>   
                                    
                                    <tr>
                                        <%-- Empresa --%>
                                        <td class="titulocaja">
                                            <b><fmt:message key="101619"/></b>   <%-- Empresa --%>
                                        </td>
                                         <%-- Tipo Cierre --%>
                                         <td class="titulocaja">
                                            <b><fmt:message key="9000488"/> </b> <%-- Tipo Cierre --%>
                                        </td>                 
                                         <%-- Estado Cierre --%>
                                         <td class="titulocaja">
                                            <b><fmt:message key="9000489"/> </b> <%-- Estado Cierre --%>
                                        </td>                 
                                        <%-- Fecha Cierre --%>
                                         <td class="titulocaja">
                                            <b><fmt:message key="9000490"/></b> <%-- Fecha Cierre --%>
                                        </td>                                                  
                                    </tr>
                                    <tr>
                                        <%-- Empresa --%>
                                        <td class="campocaja">
                                            <select name = "buscarCEMPRES" id ="buscarCEMPRES" size="1" class="campo campotexto" style="width:90%" obligatorio="true"
                                            onchange='if (objValidador.validaEntrada()) { objUtiles.ejecutarFormulario ("axis_axisadm012.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando); }'
                                            title="<fmt:message key="101619"/>">
                                                <c:if test="${fn:length(__formdata.lstValores.lstEmpresas) != 1}">
                                                    <option value="<%=Integer.MIN_VALUE%>"> - <fmt:message key="1000348"/> - </option>                                                
                                                    <c:forEach items="${__formdata.lstValores.lstEmpresas}" var="item">
                                                        <option value = "${item.CEMPRES}" <c:if test="${__formdata.buscarCEMPRES == item.CEMPRES}"> selected </c:if>>${item.TEMPRES}</option>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${fn:length(__formdata.lstValores.lstEmpresas) == 1}">
                                                    <option value = "${__formdata.lstValores.lstEmpresas[0].CEMPRES}" selected>${__formdata.lstValores.lstEmpresas[0].TEMPRES}</option>
                                                </c:if>
                                            </select>
                                        <%--
                                            <input type="text" name = "TEMPRES" id ="TEMPRES" readonly="readonly"
                                                class="campowidthinput campo campotexto" style="width:85%" value="${__formdata.TEMPRES}"/>
                                            <input type="hidden" name = "buscarCEMPRES" id ="buscarCEMPRES" value="${sessionScope.__usuario.cempres}"/>
                                            --%>
                                        </td>
                                        <%-- Tipo Cierre --%>
                                        <td class="campocaja">
                                            <select name = "buscarCTIPO" id ="buscarCTIPO" size="1" onchange="" class="campo campotexto" style="width:90%">
                                                <option value="<%=Integer.MIN_VALUE%>"> - <fmt:message key="1000348"/> - </option>
                                                <c:forEach items="${__formdata.lstValores.lstTipoCierres}" var="item">
                                                    <option value = "${item.CTIPO}" <c:if test="${__formdata.buscarCTIPO == item.CTIPO}"> selected </c:if>>${item.TCTIPO}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <%-- Estado Cierre --%>
                                        <td class="campocaja">
                                            <select name = "buscarCESTADO" id ="buscarCESTADO" size="1" onchange="" class="campo campotexto" style="width:90%">
                                                <option value="<%=Integer.MIN_VALUE%>"> - <fmt:message key="1000348"/> - </option>
                                                <c:forEach items="${__formdata.lstValores.lstEstadoCierres}" var="item">
                                                    <option value = "${item.CATRIBU}" <c:if test="${__formdata.buscarCESTADO == item.CATRIBU}"> selected </c:if>>${item.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>            
                                        <%-- Fecha Cierre --%>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" 
                                            value="<fmt:formatDate value='${__formdata.buscarFCIERRE}' pattern='dd/MM/yyyy'/>" name="buscarFCIERRE" id="buscarFCIERRE"
                                            style="width:50%;" <axis:atr f="axisadm012" c="FCIERRE" a="formato=fecha"/>
                                            title="<fmt:message key="9000490"/>"/><a id="icon_buscarFCIERRE" style="vertical-align:middle;"><img 
                                            alt="<fmt:message key="108341"/>" title="<fmt:message key="9000490" />" src="images/calendar.gif"/></a>
                                        </td>
                                        <td class="campocaja">
                                            <img id="find" border="0" src="images/find.gif" alt="<fmt:message key="100797"/>" title="<fmt:message key="100797"/>"
                                            onclick="f_but_buscar()" style="cursor:pointer"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja" colspan = "5">
                                            <div class="separador">&nbsp; </div>                                        
                                            <div class="separador">&nbsp; </div>                                        
                                            <%-- DisplayTag Facturas --%>
                                            <c:set var="title0"><fmt:message key="9000491"/></c:set>  <%-- Tancament. --%>
                                            <c:set var="title1"><fmt:message key="104095"/></c:set>  <%-- Des de --%>
                                            <c:set var="title2"><fmt:message key="103051"/></c:set>  <%-- Fins --%>
                                            <c:set var="title3"><fmt:message key="9000490"/></c:set>  <%-- D.Tanc --%>
                                            <c:set var="title4"><fmt:message key="100587"/></c:set>  <%-- Estat --%>
                                            <c:set var="title5"><fmt:message key="9000493"/></c:set>   <%-- Núm. Procés --%>
                                            <c:set var="title6"><fmt:message key="9000492"/></c:set>   <%-- D. Procés --%>
                                            

                                            <div class="seccion displayspaceMaximo">
                                                <display:table name="${__formdata.lstCierres}" id="LSTCIERRES" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                     requestURI="axis_axisadm012.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_CIERRES.TTIPO" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            ${LSTCIERRES.OB_IAX_CIERRES.TTIPO}
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_CIERRES.FPERINI" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            <fmt:formatDate value='${LSTCIERRES.OB_IAX_CIERRES.FPERINI}' pattern='dd/MM/yyyy'/>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_CIERRES.FPERFIN" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            <fmt:formatDate value='${LSTCIERRES.OB_IAX_CIERRES.FPERFIN}' pattern='dd/MM/yyyy'/>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_CIERRES.FCIERRE" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            <fmt:formatDate value='${LSTCIERRES.OB_IAX_CIERRES.FCIERRE}' pattern='dd/MM/yyyy'/>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_CIERRES.TESTADO" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            ${LSTCIERRES.OB_IAX_CIERRES.TESTADO}                                           
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_CIERRES.SPROCES" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            ${LSTCIERRES.OB_IAX_CIERRES.SPROCES}
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_CIERRES.FPROCES" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            <fmt:formatDate value='${LSTCIERRES.OB_IAX_CIERRES.FPROCES}' pattern='dd/MM/yyyy'/>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="" sortable="true" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                         <div class="dspIcons">
                                                            <a href="javascript:f_get_modificable('${LSTCIERRES.OB_IAX_CIERRES.CESTADO}', '${LSTCIERRES.OB_IAX_CIERRES.CEMPRES}', '${LSTCIERRES.OB_IAX_CIERRES.CTIPO}', '${LSTCIERRES.OB_IAX_CIERRES.FPERINI}')"><img border="0" alt="<fmt:message key='100002'/>"  
                                                            title="<fmt:message key='100002'/>" src="images/lapiz.gif"/></a></div>
                                                        </div>
                                                    </display:column>               
                                                    <display:column title="" sortable="true" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                         <div class="dspIcons">
                                                            <a href="javascript:f_borrar_cierre('${LSTCIERRES.OB_IAX_CIERRES.CESTADO}', '${LSTCIERRES.OB_IAX_CIERRES.CEMPRES}', '${LSTCIERRES.OB_IAX_CIERRES.CTIPO}', '${LSTCIERRES.OB_IAX_CIERRES.FPERINI}')"><img border="0" alt="<fmt:message key='1000127'/>"  
                                                            title="<fmt:message key='1000127'/>" src="images/delete.gif"/></a></div>
                                                        </div>
                                                    </display:column>               
                                                </display:table>                                                        
                                            </div>
                                            <div class="separador">&nbsp; </div>                                        
                                        </td>                                                
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="__botones">salir,nuevo<c:if test="${!empty __formdata.lstCierres}">,109006</c:if></c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>

    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "buscarFCIERRE",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_buscarFCIERRE", 
            singleClick    :    true,
            firstDay       :    1
        });
     </script>

</body>
</html>