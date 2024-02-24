<%/*
*  Fichero: axisfiv002.jsp
*
*  Fecha: 19/03/2009
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
    <title><axis:alt f="axisfinv002" c="TITULO_HTML" lit="9001480"/></title> <%-- Carrega de valors liquidatius --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="Stylesheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp"/>
    
    <script type="text/javascript">
        var operaciones = "${fn:length(sessionScope.T_IAX_OPERACIONES)>0}";
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {        
            f_cargar_propiedades_pantalla();
            if(objUtiles.utilEquals(operaciones, "false"))
                f_abrir_modal("axisfinv001");
        }
        
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do", "cancelar", document.miFormAlt, "_self");
        }
        
        function f_but_abrir_cerrar(PAESTADO){//Botón abrir/cerrar
            objUtiles.ejecutarFormulario ("axis_axisfinv002.do?CEMPRES_ESTADO=" + objDom.getValorPorId("CEMPRES_CONSULTA") + "&CCODFON_ESTADO=" + objDom.getValorPorId("CCODFON_CONSULTA") + "&FVALOR=" + objDom.getValorPorId("FVALOR_CONSULTA") + "&PAESTADO=" + PAESTADO, "abrir_cerrar_valores", document.miFormAlt, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_9001303(){//Botón valorar
            objUtiles.ejecutarFormulario ("axis_axisfinv002.do?CEMPRES_VALORAR=" + objDom.getValorPorId("CEMPRES_CONSULTA") + "&CCODFON_VALORAR=" + objDom.getValorPorId("CCODFON_CONSULTA") + "&FVALOR=" + objDom.getValorPorId("FVALOR_CONSULTA"), "valorar_valores", document.miFormAlt, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_9001304(){//Botón asignar
            objUtiles.ejecutarFormulario ("axis_axisfinv002.do?CEMPRES_ASIGNAR=" + objDom.getValorPorId("CEMPRES_CONSULTA") + "&CCODFON_ASIGNAR=" + objDom.getValorPorId("CCODFON_CONSULTA") + "&FVALOR=" + objDom.getValorPorId("FVALOR_CONSULTA"), "asignar_valores", document.miFormAlt, "_self", objJsMessages.jslit_cargando);
        }
        
        function seleccionarLista(CEMPRES, CCODFON, TFONABV, FVALOR, IIMPCMP, NUNICMP, IIMPVNT, NUNIVNT, IUNIACT, IUNIACTCMP, IUNIACTVTASHW, IUNIACTCMPSHW, IVALACT){
        
            IUNIACT = objNumero.cambiarSeparadorMilesPorDecimales(IUNIACT);
            IUNIACTCMP = objNumero.cambiarSeparadorMilesPorDecimales(IUNIACTCMP);
            IUNIACTVTASHW = objNumero.cambiarSeparadorMilesPorDecimales(IUNIACTVTASHW);
            IUNIACTCMPSHW = objNumero.cambiarSeparadorMilesPorDecimales(IUNIACTCMPSHW);
            IVALACT = objNumero.cambiarSeparadorMilesPorDecimales(IVALACT);
            IIMPCMP = objNumero.cambiarSeparadorMilesPorDecimales(IIMPCMP);
            NUNICMP = objNumero.cambiarSeparadorMilesPorDecimales(NUNICMP);
            IIMPVNT = objNumero.cambiarSeparadorMilesPorDecimales(IIMPVNT);
            NUNIVNT = objNumero.cambiarSeparadorMilesPorDecimales(NUNIVNT);
            
            objDom.setValorPorId("CEMPRES_hidden", CEMPRES);
            objDom.setValorPorId("CCODFON_hidden", CCODFON);
            objDom.setValorPorId("TFONABV_hidden", TFONABV);
            objDom.setValorPorId("FVALOR_hidden", FVALOR);
            objDom.setValorPorId("IIMPCMP_hidden", IIMPCMP);
            objDom.setValorPorId("NUNICMP_hidden", NUNICMP);
            objDom.setValorPorId("IIMPVNT_hidden", IIMPVNT);
            objDom.setValorPorId("NUNIVNT_hidden", NUNIVNT);
            objDom.setValorPorId("IUNIACT_hidden", IUNIACT);
            objDom.setValorPorId("IUNIACTCMP_hidden", IUNIACTCMP);
            objDom.setValorPorId("IUNIACTVTASHW_hidden", IUNIACTVTASHW);
            objDom.setValorPorId("IUNIACTCMPSHW_hidden", IUNIACTCMPSHW);
            objDom.setValorPorId("IVALACT_hidden", IVALACT);
            objDom.setValorPorId("CEMPRES", objDom.getValorPorId("CEMPRES_CONSULTA"));
            objDom.setValorPorId("CCODFON", objDom.getValorPorId("CCODFON_CONSULTA"));
            objDom.setValorPorId("FVALOR", objDom.getValorPorId("FVALOR_CONSULTA"));

            objUtiles.ejecutarFormulario ("axis_axisfinv002.do", "modificar_valores", document.miFormAlt, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_enviar_datos() {
             if (objValidador.validaEntrada()){
                if(confirm("<axis:alt f='axisfinv002' c='CONFIRM' lit='9001183'/>")){
                    var userAgent = "${header['User-agent']}";
                    
                    // En FF, no se recogen bien los acentos en el Fileupload Servlet. 
                    // Por eso, pasamos el nombre de fichero como un campo hidden.
                    // En IE, se recoge de forma normal, con item.getName().
                    if (userAgent.indexOf("Firefox") > 0)
                        objDom.setValorPorId("TFILENAME", objDom.getValorPorId("TFILE"));
        
                    objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", objJsMessages.jslit_cargando, "inline");
                    document.miForm.submit();
                }   
            }
        }

          function f_abrir_axisfinv005(CEMPRES, CCODFON, TFONABV, FVALOR, IIMPCMP, NUNICMP, IIMPVNT, NUNIVNT, IUNIACT, IVALACT) {

                 objUtiles.abrirModal("axisfinv005", "src", "modal_axisfinv005.do?operation=init&CEMPRES=" + CEMPRES + "&CCESTA="+ CCODFON + "&TFONABV="+TFONABV);
                
                            }
            
            function f_cerrar_axisfinv005 () {
                objUtiles.cerrarModal("axisfinv005");
                /*objUtiles.ejecutarFormulario("axis_axisfinv002.do", "cerrar_asegurado", document.miForm, "_self");*/
            }          
        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_abrir_modal(cual) {
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form");        
        }
        
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_buscar_modal(cual, params) {
            f_cerrar_modal(cual);
            objUtiles.ejecutarFormulario("axis_axisfinv002.do" + params, "form", document.miFormAlt, "_self", objJsMessages.jslit_cargando);
        }
        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    
    <form name="miForm" enctype='multipart/form-data' action="Axisfinv002fileupload" method="POST" accept-charset='UTF-8'>         
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisfinv002" c="TITULO" lit="9001480"/></c:param>     <%-- Carrega de valors liquidatius --%>
                <c:param name="formulario"><axis:alt f="axisfinv002" c="TITULO" lit="9001480"/></c:param> <%-- Carrega de valors liquidatius --%>
                <c:param name="form">axisfinv002</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisfinv001|<axis:alt f="axisfinv002" c="TITULO_AXISFINV001" lit="9001287"/></c:param>
        </c:import>
    
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" id="TFILENAME" name="TFILENAME" value=""/>
        <input type="hidden" name="CEMPRES_CONSULTA" id="CEMPRES_CONSULTA" value="${requestScope.CEMPRES_CONSULTA}"/>
        <input type="hidden" name="CCODFON_CONSULTA" id="CCODFON_CONSULTA" value="${requestScope.CCODFON_CONSULTA}"/>
        <input type="hidden" name="FVALOR_CONSULTA" id="FVALOR_CONSULTA" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FVALOR_CONSULTA}'/>"/>
        <input type="hidden" name="PAESTADO" id="PAESTADO" value="${requestScope.PAESTADO}"/>

            <!-- Area de campos  -->
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisfinv002" c="TITULO_AXISFINV005" lit="180929" /></c:param>
                <c:param name="nid" value="axisfinv005" />
            </c:import>
            
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr height=10%>
                <td>
                    <div class="titulo">
                        <img src="images/flecha.gif"/><axis:alt f="axisfinv002" c="TITULO_AXISFINV002" lit="9001482" />&nbsp;<img border="0" src="images/find.gif" onclick="f_abrir_modal('axisfinv001')" style="cursor:pointer" alt="<axis:alt f='axisfinv002' c='TITULO_AXISFINV002' lit='9001287'/>" title="<axis:alt f='axisfinv002' c='TITULO_AXISFINV002' lit='9001287'/>"/>
                    </div>
                        <!--campos-->
                    <table class="seccion">
                        <tr>
                        <td align="left">
                            <table border="0" class="area" align="center">
                                <tr>
                                    <th style="width:30%;height:0px"></th>
                                    <th style="width:70%;height:0px"></th>
                                </tr>
                                <tr>
                                    <axis:visible f="axisfinv002" c="TFILE">
                                        <td class="titulocaja">
                                            <b id="label_TFILE"><axis:alt f="axisfinv002" c="FILE" lit="9001482" /></b>
                                        </td>
                                    </axis:visible>
                                 </tr>
                                 <tr>
                                    <axis:visible f="axisfinv002" c="TFILE">
                                        <tr>
                                            <td class="campocaja">                             
                                                <input type="file" name="TFILE" id="TFILE" title="<axis:alt f="axisfinv002" c="FILE" lit="9001482"/>" size="35" obligatorio="true"/>                                
                                                <div class="separador">&nbsp;</div>                                                        
                                            </td>
                                            <td class="campocaja">                             
                                                <input type="button" class="boton" style="vertical-align:bottom;cursor:pointer;" value="<axis:alt f="axisfinv002" c="BT_ENVIAR" lit="9001481"/>" onclick="f_enviar_datos()"/>
                                            </td>
                                        </tr>
                                    </axis:visible>
                                 </tr>
                            </table>
                        </td>
                        </tr>
                        <tr>
                        <td align="left">
                             <table border="0" class="area" align="left" style="width:100%;">
                                <tr>
                                    <td>
                                    
                                        <c:set var="title0"><axis:alt f="axisfinv002" c="TFONABV" lit="9001292"/></c:set>
                                        <c:set var="title1"><axis:alt f="axisfinv002" c="FULTVAL" lit="9001293"/></c:set>
                                        <c:set var="title2"><axis:alt f="axisfinv002" c="IUNIULT" lit="9001294"/></c:set>
                                        <c:set var="title3"><axis:alt f="axisfinv002" c="IVALACTFONDO" lit="9001295"/></c:set>
                                        <c:set var="title4"><axis:alt f="axisfinv002" c="FVALOR" lit="1000590"/></c:set>
                                        <c:set var="title5"><axis:alt f="axisfinv002" c="IUNIACT" lit="9001296"/></c:set>
                                        <c:set var="title6"><axis:alt f="axisfinv002" c="IIMPCMP" lit="9001297"/></c:set>
                                        <c:set var="title7"><axis:alt f="axisfinv002" c="NUNICMP" lit="9001298"/></c:set>
                                        <c:set var="title8"><axis:alt f="axisfinv002" c="IIMPVNT" lit="9001299"/></c:set>
                                        <c:set var="title9"><axis:alt f="axisfinv002" c="NUNIVNT" lit="9001300"/></c:set>
                                        <c:set var="title10"><axis:alt f="axisfinv002" c="IVALACT" lit="9001301"/></c:set>
                                        <c:set var="title11"><axis:alt f="axisfinv002" c="CCODFON" lit="1000109"/></c:set>
                                       
                                        <div >
                                            <display:table name="${sessionScope.T_IAX_OPERACIONES}" id="miListaId" export="false" class="dsptgtable" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                            pagesize="25" defaultsort="1" requestURI="axis_axisfinv002.do?paginar=true">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <axis:visible f="axisfinv002" c="CCODFON">
                                                    <display:column title="${title11}" headerClass="headwidth5 sortable" sortProperty="CCODFON"  media="html" autolink="false" >
                                                        <div class="dspNumber">
                                                            <c:set var="vFVALOR"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FVALOR}"/></c:set>
                                                            ${miListaId.CCODFON}
                                                        </div>
                                                    </display:column>
                                                </axis:visible>    
                                                <display:column title="${title0}" sortable="false" sortProperty="TFONABV" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                    <div class="dspText">
                                                        <c:set var="vFVALOR"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FVALOR}"/></c:set>
                                                        ${miListaId.TFONABV}
                                                    </div>
                                                </display:column>
                                                <display:column title="${title1}" sortable="false" sortProperty="FULTVAL" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FULTVAL}"/></div>
                                                </display:column>
                                                <display:column title="${title2}" sortable="false" sortProperty="IUNIULT" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                    <div class="dspNumber"><fmt:formatNumber pattern="###,##0.000000" value='${miListaId.IUNIULT}'/></div>
                                                </display:column>
                                                <axis:visible f="axisfinv002" c="IVALACTFONDO">
                                                 <display:column title="${title3}" sortable="false" sortProperty="IVALACTFONDO" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                    <div class="dspNumber"><fmt:formatNumber pattern="###,##0.000000" value='${miListaId.IVALACTFONDO}'/></div>
                                                </display:column>
                                                </axis:visible>
                                                <display:column title="${title4}" sortable="false" sortProperty="FVALOR" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FVALOR}"/></div>
                                                </display:column>
                                                
                                                
                                                 <display:column title="${title5}" sortable="false" sortProperty="IUNIACT" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                    <div class="dspNumber"><fmt:formatNumber pattern="###,##0.000000" value='${miListaId.IUNIACT}'/></div>
                                                </display:column>
                                                
                                                
                                                <axis:visible f="axisfinv002" c="IIMPCMP">
                                                    <display:column title="${title6}" sortable="false" sortProperty="IIMPCMP" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                        <div class="dspNumber"><fmt:formatNumber pattern="###,##0.000000" value='${miListaId.IIMPCMP}'/></div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axisfinv002" c="NUNICMP">
                                                    <display:column title="${title7}" sortable="false" sortProperty="NUNICMP" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                        <div class="dspNumber"><fmt:formatNumber pattern="###,##0.000000" value='${miListaId.NUNICMP}'/></div>
                                                    </display:column>
                                                </axis:visible>    
                                                <axis:visible f="axisfinv002" c="IIMPVNT">
                                                    <display:column title="${title8}" sortable="false" sortProperty="IIMPVNT" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                        <div class="dspNumber"><fmt:formatNumber pattern="###,##0.000000" value='${miListaId.IIMPVNT}'/></div>
                                                    </display:column>
                                                </axis:visible>    
                                                <axis:visible f="axisfinv002" c="NUNIVNT">
                                                    <display:column title="${title9}" sortable="false" sortProperty="NUNIVNT" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                        <div class="dspNumber"><fmt:formatNumber pattern="###,##0.000000" value='${miListaId.NUNIVNT}'/></div>
                                                    </display:column>
                                                </axis:visible>    
                                                <axis:visible f="axisfinv002" c="IVALACT">
                                                    <display:column title="${title10}" sortable="false" sortProperty="IVALACT" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                        <div class="dspNumber"><fmt:formatNumber pattern="###,##0.000000" value='${miListaId.IVALACT}'/></div>
                                                    </display:column>
                                                </axis:visible>   

 <!--JGM 23/09/2009 - bug 0011175 -->           
                                             <display:column title="" sortable="false" sortProperty="pregunta" headerClass="headwidth5 sortable" media="html" autolink="false">    
                                                <div class="dspIcons">
                                                  
                                                <a href='javascript:seleccionarLista("${miListaId.CEMPRES}", "${miListaId.CCODFON}", "${fn:escapeXml(miListaId.TFONABV)}", "${vFVALOR}", "${miListaId.IIMPCMP}", "${miListaId.NUNICMP}", "${miListaId.IIMPVNT}", "${miListaId.NUNIVNT}", "${miListaId.IUNIACT}","${miListaId.IUNIACTCMP}","${miListaId.IUNIACTVTASHW}","${miListaId.IUNIACTCMPSHW}", "${miListaId.IVALACT}")'>
                                                    <img border="0" alt="<axis:alt f="axisfinv002" c="EDITAR" lit="9001310"/>" title="<axis:alt f="axisfinv002" c="EDITAR" lit="9001310"/>" src="images/lapiz.gif"/>
                                                </a>
                                                </div>                                                   
                                            </display:column>    
                                            <display:column title="" sortable="false" sortProperty="pregunta" headerClass="headwidth5 sortable" media="html" autolink="false">    
                                                <div class="dspIcons">
                                                <a href='javascript:f_abrir_axisfinv005("${miListaId.CEMPRES}", "${miListaId.CCODFON}", "${fn:escapeXml(miListaId.TFONABV)}", "${vFVALOR}", "${miListaId.IIMPCMP}", "${miListaId.NUNICMP}", "${miListaId.IIMPVNT}", "${miListaId.NUNIVNT}", "${miListaId.IUNIACT}", "${miListaId.IVALACT}")'>
                                                    <img border="0" alt="<axis:alt f="axisfinv002" c="DETALLE" lit="9001310"/>" title="<axis:alt f="axisfinv002" c="DETALLE" lit="9001310"/>" src="images/mas.gif"/>
                                                </a>
                                                </div>                                                   
                                            </display:column>
 <!-- FI JGM -->           
                                            </display:table>

                                        </div>                
                                    </td>
                                </tr>
                            </table>
                        </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr height=1%>
                <td>
                    <!-- Aqui viene el boton de Consolidacion de operaciones -->
                    <table border="0" padding=0 align="left" style="padding-top:10px;width:1%">
                        <tr>
                            <td class="notitulo" nowrap style="padding-right:40px;valign:top;width:300px;border-bottom:0px;">
                                <img src="images/flecha.gif"/><axis:alt f="axisfinv002" c="OPERACIONES" lit="9001483" />
                            </td>
                            <axis:ocultar f="axisfinv002" c="VALORAR" dejarHueco="false">
                                <td class="campocaja" style="width:1%">
                                        <input type="button" class="boton" style="vertical-align:bottom;cursor:pointer;" value="<axis:alt f="axisfinv002" c="BT_9001303" lit="9001303"/>" onclick="f_but_9001303()"/>
                                </td>
                            </axis:ocultar>                                                                
                            <td class="campocaja" style="width:1%">
                                <input type="button" class="boton" style="vertical-align:bottom;cursor:pointer;" value="<axis:alt f="axisfinv002" c="BT_9001304" lit="9001304"/>" onclick="f_but_9001304()"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="notitulo" nowrap style="padding-right:40px;valign:top;width:300px;border-bottom:0px;">
                                <img src="images/flecha.gif"/><axis:alt f="axisfinv002" c="ESTADOFONDOS" lit="9001496" /> &nbsp; ${requestScope.ESTADO_FONDOS}
                            </td>
                            <td class="campocaja" style="width:1%">
                                <c:if test="${!empty requestScope.PAESTADO && requestScope.PAESTADO=='C'}">
                                    <input type="button" class="boton" style="vertical-align:bottom;" value="<axis:alt f="axisfinv002" c="BT_100946" lit="100946"/>" disabled="true"/>
                                </c:if>
                                <c:if test="${!empty requestScope.PAESTADO && requestScope.PAESTADO=='A'}">
                                    <input type="button" class="boton" style="vertical-align:bottom;cursor:pointer;" value="<axis:alt f="axisfinv002" c="BT_100946" lit="100946"/>" onclick="f_but_abrir_cerrar('A')"/>
                                </c:if>
                            </td>
                            <td class="campocaja" style="width:1%">
                                <c:if test="${!empty requestScope.PAESTADO && requestScope.PAESTADO=='A'}">
                                    <input type="button" class="boton" style="vertical-align:bottom;" value="<axis:alt f="axisfinv002" c="BT_104961" lit="104961"/>" disabled="true"/>
                                </c:if>
                                <c:if test="${!empty requestScope.PAESTADO && requestScope.PAESTADO=='C'}">
                                    <input type="button" class="boton" style="vertical-align:bottom;cursor:pointer;" value="<axis:alt f="axisfinv002" c="BT_104961" lit="104961"/>" onclick="f_but_abrir_cerrar('C')"/>
                                </c:if>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisfinv002</c:param>
            <c:param name="__botones">salir</c:param> 
        </c:import>
    
    </form>
    <form name="miFormAlt" action="" method="POST">         
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="CEMPRES_hidden" id="CEMPRES_hidden" value=""/>
        <input type="hidden" name="CCODFON_hidden" id="CCODFON_hidden" value=""/>
        <input type="hidden" name="TFONABV_hidden" id="TFONABV_hidden" value=""/>
        <input type="hidden" name="FVALOR_hidden" id="FVALOR_hidden" value="${__formdata.FVALOR_hidden}"/>
        <input type="hidden" name="IIMPCMP_hidden" id="IIMPCMP_hidden" value=""/>
        <input type="hidden" name="NUNICMP_hidden" id="NUNICMP_hidden" value=""/>
        <input type="hidden" name="IIMPVNT_hidden" id="IIMPVNT_hidden" value=""/>
        <input type="hidden" name="NUNIVNT_hidden" id="NUNIVNT_hidden" value=""/>
        <input type="hidden" name="IUNIACT_hidden" id="IUNIACT_hidden" value=""/>
        <input type="hidden" name="IUNIACTCMP_hidden" id="IUNIACTCMP_hidden" value=""/>
        <input type="hidden" name="IUNIACTVTASHW_hidden"  id="IUNIACTVTASHW_hidden" value=""/>
        <input type="hidden" name="IUNIACTCMPSHW_hidden" id="IUNIACTCMPSHW_hidden" value=""/>
        <input type="hidden" name="IVALACT_hidden" id="IVALACT_hidden" value=""/>
        <input type="hidden" name="CEMPRES" id="CEMPRES" value=""/>
        <input type="hidden" name="CCODFON" id="CCODFON" value=""/>
        <input type="hidden" name="FVALOR" id="FVALOR" value="${__formdata.FVALOR}"/>
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
</body>
</html>