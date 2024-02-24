<%/*
*  Fichero: axisctr079.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a> 
*
*  Fecha: 04/07/2008
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
    <title><axis:alt f="axisctr079" c="LIQUIDACION_COMISIONES" lit="9001776"/></title> <%-- LIQUIDACION DE COMISIONES --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="Stylesheet" href="styles/displaytag.css" type="text/css"></link>
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
    <c:import url="../include/carga_framework_js.jsp"/>
    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {
            var haySseguro    = ${!empty __formdata.SSEGURO};           
            if (!haySseguro){
                f_abrir_axisctr019();
            }
            
            f_cargar_propiedades_pantalla();
        }
        //But Salir
        function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisagd001", "cancelar", document.miForm, "_self");
            }
        
        
        /** INICI MODAL AXISCTR019 **/
        function f_abrir_axisctr019 () {
            objUtiles.abrirModal("axisctr019", "src", "modal_axisctr019.do?operation=form");
        }
        
        function f_cerrar_axisctr019() {
            objUtiles.cerrarModal("axisctr019");
        }   
        function f_aceptar_axisctr019 (SSEGURO) {
            f_cerrar_axisctr019();
            objDom.setValorPorId("SSEGURO", SSEGURO);
            objUtiles.ejecutarFormulario ("axis_axisctr172.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        /** FI MODAL AXISCTR019 **/
        /** INICI MODAL AXISCTR010 **/
        function f_abrir_axisctr010 () {
            var CTIPCOM =  objDom.getValorPorId("CTIPCOM");
            objUtiles.abrirModal("axisctr010", "src", "modal_axisctr010.do?operation=form&CTIPCOM="+CTIPCOM); 
        }
        function f_cerrar_axisctr010 () {
            objUtiles.cerrarModal("axisctr010");
        }    
        function f_aceptar_axisctr010 () {
            f_cerrar_axisctr010();
            objUtiles.ejecutarFormulario ("axis_axisctr172.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        } 
    /** FI MODAL AXISCTR010 **/
    </script>    
</head>

<body onload="f_onload()">    
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>    
     <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisctr019|<axis:alt c="axisctr019_TITULO" f="axisctr172" lit="1000188"/></c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr172" c="titulo" lit="1000184"/></c:param>
        <c:param name="nid" value="axisctr010" />
    </c:import>
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisctr172" c="LIQUIDACION_COMISIONES" lit="102197"/></c:param>     <%-- Definición COMISIONES --%>
                <c:param name="formulario"><axis:alt f="axisctr172" c="LIQUIDACION_COMISIONES" lit="102197"/></c:param> <%-- Definición DE COMISIONES --%>
                <c:param name="form">axisctr172</c:param>
        </c:import>
        
        
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}"/>
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>

                <td>
                     <div class="titulo">    
                            <div style="float:left;">
                                <img src="images/flecha.gif"/>
                        <c:if test="${!empty __formdata.axisctr_datPoliza.TPRODUC}">&nbsp;${__formdata.axisctr_datPoliza.TPRODUC}</c:if><c:if test="${!empty __formdata.axisctr_datPoliza.CRETENI && __formdata.axisctr_datPoliza.CRETENI != 0 && !empty tmotret}">&nbsp;-&nbsp;<axis:alt f="axisctr020" c="TMOTRETEN" lit="152427" />&nbsp;${tmotret}&nbsp;&nbsp;</c:if> <c:if test="${ADMITECERTIFICADOS == '1'}">- <axis:alt f="axisctr020" c="CCOLECT" lit="9001021"/>: ${NAMETOMADORCERO}</c:if>
                        </b>&nbsp;&nbsp;${__formdata.axisctr_datPoliza.NPOLIZA}<c:if test="${__formdata.axisctr_datPoliza.NCERTIF!=null}" >&nbsp;-&nbsp;${__formdata.axisctr_datPoliza.NCERTIF}</c:if><c:if test="${__formdata.axisctr_datPoliza.TSITUAC!=null}" >&nbsp;-&nbsp;${__formdata.axisctr_datPoliza.TSITUAC}</c:if><c:if test="${__formdata.axisctr_datPoliza.TRETENI!=null}" >&nbsp;-&nbsp;${__formdata.axisctr_datPoliza.TRETENI}</c:if><c:if test="${!empty __formdata.axisctr_datPoliza.TINCIDE}">&nbsp;-&nbsp;${__formdata.axisctr_datPoliza.TINCIDE}</c:if><c:if test="${__formdata.axisctr_datPoliza.FEFECTO!=null}">&nbsp;-&nbsp;<axis:alt f="axisctr020" c="FFECTO" lit="100883" />&nbsp;<fmt:formatDate value="${__formdata.axisctr_datPoliza.FEFECTO}" pattern="dd/MM/yyyy"/></c:if><c:if test="${__formdata.axisctr_datPoliza.FVENCIM!=null}">&nbsp;-&nbsp;<axis:alt f="axisctr020" c="FVENCIM" lit="100885" />&nbsp;<fmt:formatDate value="${__formdata.axisctr_datPoliza.FVENCIM}" pattern="dd/MM/yyyy"/></c:if><axis:visible c="CPOLCIA" f="${pantalla}"><c:if test="${__formdata.axisctr_datPoliza.CPOLCIA!=null}" >&nbsp;-&nbsp;<axis:alt f="axisctr020" c="CPOLCIA" lit="9001766" />&nbsp;${__formdata.axisctr_datPoliza.CPOLCIA}</c:if></axis:visible>
                        <c:if test="${__formdata.find}" ><img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisctr019()" style="cursor:pointer"/></c:if>
                            </div>
                            <div style="float:right;"></div>
                            <div style="clear:both;"></div>
                        </div>
                    <!--campos-->
                    <table class="seccion">
                        <tr>
                            <td align="left">
                                <table class="area" align="center">
                                     <tr>
                                        <th style="height:0px"></th>
                                    </tr>
                                    <c:if test="${!empty __formdata.axisctr_definicionComisiones}"> 
                                    <tr>
                                        <td class="campocaja" >
                                            <div style="float:left;">
                                                <img id="DSP_COMISION_parent" src="images/menys.gif" onclick="objEstilos.toggleDisplay('DSP_COMISION', this)" style="cursor:pointer"/> 
                                            <b><axis:alt f="axisctr172" c="DSP_COMISION" lit="105048" />&nbsp;</b>${__formdata.axisctr_datGestion.TTIPCOM}
                                            </div>
                                            <div style="float:right;" id="DATOS_POLIZA"></div>
                                            <div class="seccion_suplementos" id="SECCION_DATOS_POLIZA"></div>
                                            <axis:visible c="DOCPOL" f="${pantalla}">
                                            <div style="float:right;">
                                                <a href="javascript:f_abrir_axisctr010()"> <img border="0" onclick="javascript:f_abrir_axisctr010();" alt="<axis:alt f="axisctr172" c="TIT_COMISI" lit="1000184"/>"   title="<axis:alt f="axisctr172" c="TIT_COMISI" lit="1000184"/>" src="images/lapiz.gif"/></a>
                                            </div>
                                            </axis:visible>
                                            <div style="clear:both;">
                                                <hr class="titulo">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr id="DSP_COMISION_children" style="display:">
                                            <td>
                                                <table>
                                                    <axis:ocultar f="axisctr172" c="CTIPCOM" dejarHueco="false">
                                                        <tr>
                                                            <td class="titulocaja">
                                                                <b id="label_CTIPCOM"><axis:alt f="axisctr172" c="label_CTIPCOM" lit="101509"/></b>
                                                            </td>
                                                        </tr>
                                                    </axis:ocultar>                                        
                                                    <axis:ocultar f="axisctr172" c="CTIPCOM" dejarHueco="false">
                                                        <tr>
                                                            <td class="campocaja">
                                                                <select name = "CTIPCOM" id ="CTIPCOM" size="1" onchange="f_carga_dependencias()" <axis:atr f="axisctr172" c="CTIPCOM" a="modificable=false&obligatorio=false&isInputText=false"/> 
                                                                    class="campowidth campo campotexto" style="width:25%" <axis:atr f="axisctr172" c="CTIPCOM" a="isInputText=false"/>>&nbsp; 
                                                                    <c:forEach items="${__formdata.axisctr172_lscomisi}" var="comision">
                                                                        <option value = "${comision.CATRIBU}" <c:if test="${comision.CATRIBU  == __formdata.axisctr_datGestion.CTIPCOM}">selected</c:if>>${comision.TATRIBU}</option>
                                                                    </c:forEach>
                                                            </td>
                                                        </tr>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisctr172" c="DEFINICIONCOMISIONES" dejarHueco="false">
                                                        <tr>
                                                            <td>
                                                                <!-- DisplayTag Comisiones -->
                                                                <c:set var="title0"><axis:alt f="axisctr079" c="TIPOANUALIDAD" lit="1000372"/></c:set>
                                                                <c:set var="title1"><axis:alt f="axisctr079" c="COMISION" lit="101509"/></c:set>
                                                                <div class="displayspace">
                                                                    <% int counter = 0; %>
                                                                    <display:table name="${__formdata.axisctr_definicionComisiones}" id="miListaId" export="false" class="dsptgtable" defaultsort="1" defaultorder="ascending" pagesize="-1" sort="list" cellpadding="0" cellspacing="0" 
                                                                    requestURI="axis_axisctr172.do?paginar=true">
                                                                        <%@ include file="../include/displaytag.jsp"%>
                                                                        <display:column title="${title0}" headerClass="sortable" sortable="true" sortProperty="CATRIBU"  media="html" autolink="false" >
                                                                            <div class="dspText">${miListaId.CATRIBU} - ${miListaId.TATRIBU}</div>
                                                                        </display:column>
                                                                        <display:column title="${title1}" headerClass="sortable" style="width:30%" sortProperty="PCOMISI" media="html" autolink="false" >
                                                                            <fmt:formatNumber pattern='###,##0.00' value='${miListaId.PCOMISI}'/>
                                                                        </display:column>
                                                                        <% counter++; %>
                                                                    </display:table>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </axis:ocultar>
                                                </table>
                                            </td>
                                        </tr>
                                    </c:if>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            
        </table>
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="__botones">salir<c:if test="${__formdata.LSTLIQUIDACIONES[0].CESTLIQ eq 1}">,9001771</c:if></c:param> 
            <c:param name="f">axisctr079</c:param>
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FEFECTODESDE",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEFECTODESDE", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FEFECTOHASTA",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FEFECTOHASTA",  
            singleClick    :    true,
            firstDay       :    1
        });
        
    </script>
</body>
</html>