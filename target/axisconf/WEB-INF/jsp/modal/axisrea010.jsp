<%/*
*  Fichero: axisrea010.jsp
*
*  Fecha: 29/06/2009
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
    <title><axis:alt f="axisrea010" c="titulo" lit="9001862"/></title> <%-- Buscador de cesiones --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
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
            document.getElementById("NPOLIZA").focus();
            f_cargar_propiedades_pantalla(); 
            revisarEstilos();            
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisrea010');
        }
        
        function f_but_buscar() {
            if (objValidador.validaEntrada()) {
                var NPOLIZA = document.getElementById("NPOLIZA").value;
                var NCERTIF = document.getElementById("NCERTIF").value;
                var NSINIES = document.getElementById("NSINIES").value;
                var NRECIBO = document.getElementById("NRECIBO").value;
                var FEFEINI = document.getElementById("FEFEINI").value;
                var FEFEFIN = document.getElementById("FEFEFIN").value;
                var NREEMB  = document.getElementById("NREEMB").value;
                var SCUMULO  = document.getElementById("SCUMULO").value;
                
                if (!objUtiles.estaVacio(NPOLIZA) || !objUtiles.estaVacio(NSINIES) || !objUtiles.estaVacio(NRECIBO) ||
                    !objUtiles.estaVacio(FEFEINI) || !objUtiles.estaVacio(FEFEFIN) || !objUtiles.estaVacio(NREEMB)  || !objUtiles.estaVacio(SCUMULO))
                        objUtiles.ejecutarFormulario("modal_axisrea010.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);                
                else 
                    alert("<axis:alt f='axisrea010' c='BUT_BUSCAR' lit='9001867'/>\n<axis:alt f='axisrea010' c='NPOLIZA' lit='800242'/>, <axis:alt f='axisrea010' c='NSINIES' lit='101298'/>,<axis:alt f='axisrea010' c='NRECIBO' lit='800636'/>, <axis:alt f='axisrea010' c='FEFEINI' lit='1000556'/>, <axis:alt f='axisrea010' c='FEFEFIN' lit='1000557'/>,<axis:alt f='axisrea010' c='NREEMB' lit='9001512'/>, <axis:alt f='axisrea010' c='SCUMULO' lit='104181'/>");
            }
        }
        
        function f_seleccionar(SSEGURO, NPOLIZA, TIPO_REA, NCERTIF, NSINIES) {
            if (!objUtiles.estaVacio(SSEGURO) && !objUtiles.estaVacio(NPOLIZA)) {
                document.getElementById(SSEGURO + "/" + NPOLIZA + "/" + TIPO_REA + "/" + NCERTIF + "/" + NSINIES).checked = true;
                parent.f_aceptar_axisrea010(SSEGURO, NPOLIZA, TIPO_REA, NCERTIF, NSINIES);
            }
        }
       
        function f_but_aceptar() {
            var hayChecked = objUtiles.f_GuardaCasillasChecked ("selCesiones");            
            if (hayChecked) {                
                if (!objUtiles.estaVacio(hayChecked)) {
                    var splitted = objUtiles.utilSplit(hayChecked, "/");
                    var SSEGURO = splitted[0];
                    var NPOLIZA = splitted[1];
                    var TIPO_REA = splitted[2];
                    var NCERTIF = splitted[3];
                    var NSINIES = splitted[4];
                    parent.f_aceptar_axisrea010(SSEGURO, NPOLIZA, TIPO_REA, NCERTIF, NSINIES);
                }
            } else
                alert("<axis:alt f="axisrea010" c="BUT_ACEPTAR" lit="1000174"/>");
        }
        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="modal_axisrea010.do" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisrea010" c="titulo" lit="9001862"/></c:param>     <%-- Buscador de cesiones --%>
                <c:param name="formulario"><axis:alt f="axisrea010" c="formulario" lit="9001862"/></c:param> <%-- Buscador de cesiones --%>
                <c:param name="form">axisrea010</c:param>
        </c:import>
            
        <input type="hidden" id="operation" name="operation" value="form"/>
                
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                                <div class="separador">&nbsp;</div>
                                <table class="area" align="center">
                                    <tr>
                                        <axis:ocultar f="axisrea010" c="NPOLIZA" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_NPOLIZA"><axis:alt f="axisrea010" c="NPOLIZA" lit="800242"/></b> <%-- Nº póliza --%>
                                            </td>            
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea010" c="NCERTIF" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_NCERTIF"><axis:alt f="axisrea010" c="NCERTIF" lit="101168"/></b> <%-- Certificado --%>
                                            </td>            
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea010" c="NSINIES" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_NSINIES"><axis:alt f="axisrea010" c="NSINIES" lit="101298"/></b>   <%-- Siniestro --%>
                                            </td>            
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisrea010" c="NPOLIZA" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="NPOLIZA" name="NPOLIZA" size="15" 
                                                <axis:atr f="axisrea010" c="NPOLIZA" a="formato=entero"/>
                                                value="${__formdata.NPOLIZA}" style="width:60%"
                                                title="<axis:alt f="axisrea010" c="NPOLIZA" lit="800242"/>"/>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea010" c="NCERTIF" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="NCERTIF" name="NCERTIF" size="15" 
                                                <axis:atr f="axisrea010" c="NCERTIF" a="formato=entero"/>
                                                value="${__formdata.NCERTIF}" style="width:60%"
                                                title="<axis:alt f="axisrea010" c="NCERTIF" lit="101168"/>"/>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea010" c="NSINIES" dejarHueco="false">
                                            <td class="campocaja">
                                                <!-- INI - ML - JIRA 4093 - 31/05/2019 - SE CORRIGE NOMBRE DE ATRIBUTO DE SINIESTRO -->
                                                <input type="text" class="campowidthinput campo campotexto" id="NSINIES" name="NSINIES" size="15" 
                                                <axis:atr f="axisrea010" c="NSINIES" a="formato=entero"/>
                                                value="${__formdata.NSINIES}" style="width:60%"
                                                title="<axis:alt f="axisrea010" c="NSINIES" lit="101298"/>"/>
                                                <!-- FIN - ML - JIRA 4093 - 31/05/2019 - SE CORRIGE NOMBRE DE ATRIBUTO DE SINIESTRO -->
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                
                                    <tr>
                                        <axis:ocultar f="axisrea010" c="NRECIBO" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_NRECIBO"><axis:alt f="axisrea010" c="NRECIBO" lit="800636"/></b> <%-- Nº recibo --%>
                                            </td>            
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea010" c="NREEMB" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_NREEMB"><axis:alt f="axisrea010" c="NREEMB" lit="9001512"/></b> <%-- Nº reembolso --%>
                                            </td>            
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea010" c="SCUMULO" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_SCUMULO"><axis:alt f="axisrea010" c="SCUMULO" lit="104181"/></b> <%--Cúmulo --%>
                                            </td>            
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisrea010" c="NRECIBO" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="NRECIBO" name="NRECIBO" size="15" 
                                                <axis:atr f="axisrea010" c="NRECIBO" a="formato=entero"/>
                                                value="${__formdata.NRECIBO}" style="width:60%"
                                                title="<axis:alt f="axisrea010" c="NRECIBO" lit="800636"/>"/>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea010" c="NREEMB" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="NREEMB" name="NREEMB" size="15" 
                                                <axis:atr f="axisrea010" c="NREEMB" a="formato=entero"/>
                                                value="${__formdata.NREEMB}" style="width:60%"
                                                title="<axis:alt f="axisrea010" c="NREEMB" lit="9001512"/>"/>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea010" c="SCUMULO" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="SCUMULO" name="SCUMULO" size="15" 
                                                <axis:atr f="axisrea010" c="SCUMULO" a="formato=entero"/>
                                                value="${__formdata.SCUMULO}" style="width:60%"
                                                title="<axis:alt f="axisrea010" c="SCUMULO" lit="104181"/>"/>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    
                                    <tr>
                                        <axis:ocultar f="axisrea010" c="FEFEINI" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_FEFEINI"><axis:alt f="axisrea010" c="FEFEINI" lit="1000556"/></b> <%-- Fecha inicio efecto --%>
                                            </td>            
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea010" c="FEFEFIN" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_FEFEFIN"><axis:alt f="axisrea010" c="FEFEFIN" lit="1000557"/></b> <%-- Fecha fin efecto --%>
                                            </td>            
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisrea010" c="FEFEINI" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FEFEINI" name="FEFEINI" size="15" 
                                                <axis:atr f="axisrea010" c="FEFEINI" a="formato=fecha"/>
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEFEINI}"/>" style="width:35%"
                                                title="<axis:alt f="axisrea010" c="FEFEINI" lit="1000556"/>"/><a style="vertical-align:middle;"><img
                                                id="icon_FEFEINI" alt="<axis:alt f="axisrea010" c="FEFEINI" lit="108341"/>" title="<axis:alt f="axisrea010" c="FEFEINI" lit="108341" />" src="images/calendar.gif"/></a>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea010" c="FEFEFIN" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FEFEFIN" name="FEFEFIN" size="15" 
                                                <axis:atr f="axisrea010" c="FEFEFIN" a="formato=fecha"/>
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEFEFIN}"/>" style="width:35%"
                                                title="<axis:alt f="axisrea010" c="FEFEFIN" lit="1000557"/>"/><a style="vertical-align:middle;"><img
                                                id="icon_FEFEFIN" alt="<axis:alt f="axisrea010" c="FEFEFIN" lit="108341"/>" title="<axis:alt f="axisrea010" c="FEFEFIN" lit="108341" />" src="images/calendar.gif"/></a>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja" colspan="5">
                                            <div class="separador">&nbsp; </div>                                                                                                                            
                                            <%-- DisplayTag Cesiones --%>
                                            <c:set var="title0"><axis:alt f="axisrea010" c="title0" lit="800242"/></c:set>  <%-- Nº póliza --%>
                                            <c:set var="title1"><axis:alt f="axisrea010" c="title1" lit="101168"/></c:set>  <%-- Certificado --%>                                          
                                            <c:set var="title2"><axis:alt f="axisrea010" c="title2" lit="100883"/></c:set>  <%-- Fecha efecto --%>
                                            <c:set var="title3"><axis:alt f="axisrea010" c="title3" lit="100885"/></c:set>  <%-- Fecha vencimiento --%>
                                            <c:set var="title4"><axis:alt f="axisrea010" c="title4" lit="100874"/></c:set>  <%-- Situación --%>
                                            <c:set var="title5"><axis:alt f="axisrea010" c="title5" lit="104181"/></c:set>   <%-- Cúmulo --%>
                                            
                                            <%--defaultsort="1" defaultorder="ascending" sort="list"--%>
                        
                                            <div class="displayspaceGrande">
                                                <display:table name="${requestScope.LST_CESIONES}" id="LST_CESIONES" export="false" class="dsptgtable" pagesize="-1" cellpadding="0" cellspacing="0"
                                                     requestURI="modal_axisrea010.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="" sortable="false" headerClass="sortable headwidth5 fixed"  media="html" autolink="false">
                                                        <div class="dspIcons">
                                                            <input type="radio" name="selCesiones" id="${LST_CESIONES.SSEGURO}/${LST_CESIONES.NPOLIZA}/${LST_CESIONES.TIPO_REA}/${LST_CESIONES.NCERTIF}/${LST_CESIONES.NSINIES}" value="${LST_CESIONES.SSEGURO}/${LST_CESIONES.NPOLIZA}/${LST_CESIONES.TIPO_REA}/${LST_CESIONES.NCERTIF}/${LST_CESIONES.NSINIES}"/>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title0}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            <span style="text-decoration:underline;cursor:pointer" onclick='javascript:f_seleccionar("${LST_CESIONES.SSEGURO}", "${LST_CESIONES.NPOLIZA}", "${LST_CESIONES.TIPO_REA}","${LST_CESIONES.NCERTIF}","${LST_CESIONES.NSINIES}")'>
                                                                ${LST_CESIONES.NPOLIZA}
                                                            </span>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title1}" sortable="true" sortProperty="NCERTIF" style="width:10%" headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            <span style="text-decoration:underline;cursor:pointer" onclick='javascript:f_seleccionar("${LST_CESIONES.SSEGURO}", "${LST_CESIONES.NPOLIZA}", "${LST_CESIONES.TIPO_REA}","${LST_CESIONES.NCERTIF}","${LST_CESIONES.NSINIES}")'>
                                                                ${LST_CESIONES.NCERTIF}
                                                            </span>
                                                        </div>
                                                    </display:column>                                                   
                                                    <display:column title="${title2}" sortable="true" sortProperty="FEFECTO"  headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            <span style="text-decoration:underline;cursor:pointer" onclick='javascript:f_seleccionar("${LST_CESIONES.SSEGURO}", "${LST_CESIONES.NPOLIZA}", "${LST_CESIONES.TIPO_REA}","${LST_CESIONES.NCERTIF}","${LST_CESIONES.NSINIES}")'>
                                                                <fmt:formatDate value="${LST_CESIONES.FEFECTO}" pattern="dd/MM/yyyy"/>
                                                            </span>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true" sortProperty="FVENCIM"  headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            <span style="text-decoration:underline;cursor:pointer" onclick='javascript:f_seleccionar("${LST_CESIONES.SSEGURO}", "${LST_CESIONES.NPOLIZA}", "${LST_CESIONES.TIPO_REA}","${LST_CESIONES.NCERTIF}","${LST_CESIONES.NSINIES}")'>
                                                                <fmt:formatDate value="${LST_CESIONES.FVENCIM}" pattern="dd/MM/yyyy"/>
                                                            </span>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title4}" sortable="true" sortProperty="TSITUAC"  headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            <span style="text-decoration:underline;cursor:pointer" onclick='javascript:f_seleccionar("${LST_CESIONES.SSEGURO}", "${LST_CESIONES.NPOLIZA}", "${LST_CESIONES.TIPO_REA}","${LST_CESIONES.NCERTIF}","${LST_CESIONES.NSINIES}")'>
                                                                ${LST_CESIONES.CSITUAC}${!empty LST_CESIONES.CSITUAC && !empty LST_CESIONES.TSITUAC ? ' - ' : ''}${LST_CESIONES.TSITUAC}
                                                            </span>
                                                        </div>
                                                    </display:column>
                                                     <display:column title="${title5}" sortable="true" sortProperty="SCUMULO" headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            <span style="text-decoration:underline;cursor:pointer" onclick='javascript:f_seleccionar("${LST_CESIONES.SSEGURO}", "${LST_CESIONES.NPOLIZA}", "${LST_CESIONES.TIPO_REA}","${LST_CESIONES.NCERTIF}","${LST_CESIONES.NSINIES}")'>
                                                                ${LST_CESIONES.SCUMULO}
                                                            </span>
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
        <div class="separador">&nbsp; </div>                                                                                                                                                                        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea010</c:param>
            <c:param name="__botones">cancelar,buscar,aceptar</c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
    
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FEFEINI",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEFEINI", 
            singleClick    :    true,
            firstDay       :    1
        });
        Calendar.setup({
            inputField     :    "FEFEFIN",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEFEFIN", 
            singleClick    :    true,
            firstDay       :    1
        });
    </script>

</body>
</html>