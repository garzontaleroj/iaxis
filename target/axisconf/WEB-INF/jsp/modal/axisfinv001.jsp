<%/*
*  Fichero: axifinv001.jsp
*  Fecha: 19/03/2009
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
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
    <script type="text/javascript" src="scripts/jsFecha.js"></script>
    <!--*********************************** -->
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
            f_cargar_propiedades_pantalla();
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisfinv001');
        }        
        
        function f_but_buscar() {       
            var ret = f_control_fecha();                   
            if (ret!=1){
                //Si la validación es correcta (true), ejecutamos la acción
                if (objValidador.validaEntrada()) {
                    var CEMPRES = objDom.getValorPorId("list_CEMPRES");
                    var CCODFON = objDom.getValorPorId("list_FINVERS");
                    var FVALOR = objDom.getValorPorId("FVALOR");
                    parent.f_buscar_modal('axisfinv001', "?CEMPRES_MODAL=" + CEMPRES + "&CCODFON_MODAL=" + CCODFON + "&FVALOR=" + FVALOR);
                }
              }
        }
        
        function f_cargar_fondos(obj){
            objUtiles.ejecutarFormulario("modal_axisfinv001.do?CEMPRES=" + obj.value+"&porig="+"${__formdata.porig}","cargar_fondos",document.miForm, "_self", "<axis:alt f='axisfinv001' c='CARGANDO' lit='9000986'/>");   
        }
        
        function f_control_fecha(){       
            var fecha = new JsFecha();
            
            var FVALOR = objDom.getValorPorId("FVALOR");
            var FVALORA = new Date(FVALOR.substr(6,4), (FVALOR.substr(3,2)-1), FVALOR.substr(0,2));
            
            var FVALOR_HOY = new Date();
            
            if (FVALORA > FVALOR_HOY) {
                alert('<axis:alt f='axisfinv001' c='alert' lit='9901049'/>');
                return 1;
            }
       
        }
        
    </script>
  </head>
    <body onload="f_onload()" >
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value="form"/>
            <input type="hidden" id="PORIGEN" name="PORIGEN" value="${__formdata.porig}"/>

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisfinv001" c="FORMULARIO" lit="9001287"/></c:param>
                <c:param name="producto"><axis:alt f="axisfinv001" c="PRODUCTO" lit="9001287"/></c:param>
                <c:param name="form">axisfinv001</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisfinv001" c="TITULO" lit="1000178"/></div>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:30%;height:0px"></th>
                                            <th style="width:30%;height:0px"></th>
                                            <th style="width:30%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:visible f="axisfinv001" c="CEMPRES">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisfinv001" c="CEMPRES" lit="101619"/></b>
                                            </td>
                                            </axis:visible>
                                            <axis:visible f="axisfinv001" c="FINVERS">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisfinv001" c="FINVERS" lit="9001288"/></b>
                                                </td>
                                            </axis:visible>
                                            <axis:visible f="axisfinv001" c="FVALOR">
                                                <td class="titulocaja">
                                                    <b id="label_FVALOR"><axis:alt f="axisfinv001" c="FVALOR" lit="1000590"/></b>
                                                </td>
                                            </axis:visible>
                                        </tr>
                                        <tr>
                                            <axis:visible f="axisfinv001" c="CEMPRES">
                                                <td class="campocaja">    
                                                    <select title="<axis:alt f="axisfinv001" c="CEMPRES" lit="101619"/> alt="<axis:alt f="axisfinv001" c="CEMPRES" lit="101619"/>" name = "list_CEMPRES" id="list_CEMPRES" size="1" 
                                                        class="campowidthselect campo campotexto" onchange="javascript:f_cargar_fondos(this)"
                                                        <c:if test="${!empty requestScope.soluna_CEMPRES && requestScope.soluna_CEMPRES==0}"> 
                                                        enabled>
                                                        </c:if>
                                                        <c:if test="${!empty requestScope.soluna_CEMPRES && requestScope.soluna_CEMPRES==1}"> 
                                                        disabled>
                                                        </c:if>
                                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfinv011" c="SNV_COMBO" lit="108341"/> - </option>
                                                        <c:forEach var="empresas" items="${requestScope.T_IAX_EMPRESAS}">
                                                            <option value = "${empresas.CEMPRES}"
                                                                <c:choose>
                                                                    <c:when test="${requestScope.selected_CEMPRES == empresas.CEMPRES}">selected</c:when>
                                                                </c:choose>>
                                                                ${empresas.TEMPRES}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:visible>
                                            <axis:visible f="axisfinv001" c="FINVERS">
                                                <td class="campocaja">    
                                                    <select title="<axis:alt f="axisfinv001" c="FINVERS" lit="9001288"/>" name = "list_FINVERS" id="list_FINVERS" size="1" 
                                                        class="campowidthselect campo campotexto"
                                                        <axis:atr f="axisfinv001" c="list_FINVERS" a="modificable=true&obligatorio=false"/>>
                                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfinv011" c="SNV_COMBO" lit="108341"/> - </option>
                                                        <c:forEach var="inversiones" items="${requestScope.T_IAX_FONDOS}">
                                                            <option value = "${inversiones.CCODFON}"
                                                                <c:choose>
                                                                    <c:when test="${requestScope.selected_CCODFON == inversiones.CCODFON}">selected</c:when>
                                                                </c:choose>>
                                                                ${inversiones.TFONABV}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:visible>
                                            <axis:visible f="axisfinv001" c="FVALOR">
                                                 <td class="campocaja" id="td_FVALOR">
                                                    <jsp:useBean id="today" class="java.util.Date"  /> 
                                                    <input type="text" class="campowidthinput campo campotexto"  size="15" style="width:150px;" 
                                                    value="<c:if test="${empty requestScope.FVALOR}"><fmt:formatDate pattern="dd/MM/yyyy" value="${today}"/></c:if><c:if test="${!empty requestScope.FVALOR}"><fmt:formatDate pattern="dd/MM/yyyy" value="${requestScope.FVALOR}"/></c:if>" name="FVALOR" id="FVALOR"
                                                    title="<axis:alt f="axisfinv001" c="FVALOR" lit="1000590"/>" alt="<axis:alt f="axisfinv001" c="FVALOR" lit="1000590"/>"
                                                    <axis:atr f="axisfinv001" c="FVALOR" a="modificable=true&obligatorio=true&formato=fecha"/> /><a style="vertical-align:middle;"><img
                                                    id="icon_FVALOR" alt="<axis:alt f="axisfinv001" c="FVALOR" lit="1000590"/>" title="<axis:alt f="axisfinv001" c="FVALOR" lit="1000590"/>" src="images/calendar.gif"/></a>
                                                </td>
                                            </axis:visible>
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
                <c:param name="f">axisfinv001</c:param>
                <c:param name="__botones">cancelar,buscar</c:param>
            </c:import>
            
            <script type="text/javascript">
                Calendar.setup({
                    inputField     :    "FVALOR",     
                    ifFormat       :    "%d/%m/%Y",      
                    button         :    "icon_FVALOR", 
                    singleClick    :    true,
                    firstDay       :    1
                });
            </script>
            
        </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>

