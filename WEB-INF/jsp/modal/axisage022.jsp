<%-- 
*  Fichero: axisage022.jsp
*  @author <a href = "mailto:joan_torres@csi-ti.com">Joan Torres</a>
*
*  Fecha: 11/06/2009
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="axis.util.Constantes" %>
<%@ page import="java.util.*" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="stylesheet" href="styles/displaytag.css">
    
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
        <!--*********************************** -->
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
            f_cargar_propiedades_pantalla();
            var OK = "${requestScope.OK}"; 
            
            PCAGENTEOUT = "${__formdata.CAGENTE}";
            if (!objUtiles.estaVacio(OK))
                parent.f_aceptar_axisage022(PCAGENTEOUT);
        }
                
        function f_but_aceptar() {
            parent.f_aceptar_axisage022();
        }
       
        function f_but_cancelar() {
             parent.f_aceptar_axisage022();
        }   
        
        function f_but_salir() {
             parent.f_aceptar_axisage022();
        }
        
        function f_ondblclick(ths) {       
        }
        
        function callbackonchange(responseText) {
            //alert("["+responseText+"]")
            if (responseText.substring(0,1)!="0") {
                alert("<axis:alt f="axisage022" c="CALLBACK" lit="101283" />");
            }
        }
        function f_onchange(ths) {
            if (objValidador.validaEntrada()) {
                var parsedVal=parseVal(ths.name)
                var CUTILI=parsedVal[0]
                var CTIPO=parsedVal[1]
                var CPARAM=parsedVal[2]

                var XVALPAR=ths.value

                var qs="operation=actualizar";
                qs=qs+"&CUTILI="+CUTILI
                qs=qs+"&CPARAM="+CPARAM
                qs=qs+"&XVALPAR="+XVALPAR
                qs=qs+"&CTIPO="+CTIPO
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_${sessionScope.AXISMPRXXX}.do", callbackonchange, qs, this, objJsMessages.jslit_cargando)
            }
        }
            
        function borrar(CPARAM) {
            var confdel=confirm(objJsMessages.jslit_confirma_borrar);
            if (confdel) {
                document.miXForm.CPARAM.value=CPARAM
                objUtiles.ejecutarFormulario ("modal_${sessionScope.AXISMPRXXX}.do", "borrar", document.miXForm, "_self", objJsMessages.jslit_cargando);     
            }
        }
        
    </script>
  </head>
<body onload="f_onload()">
<c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
<form name="miForm" action="" method="POST">
    <input type="hidden" name="operation"/>
    <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}" />
    <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}" />
    <input type="hidden" name="CPARAM"  />
    <input type="hidden" name="CTIPO"  />
    <input type="hidden" name="XVALPAR"  />
    
    <c:import url="../include/titulo_nt.jsp">
           <%-- <c:param name="modalidad">null</c:param>--%>
            <c:param name="titulo"><axis:alt f="axisage022" c="TITULO" lit="9001817"/></c:param>
            <c:param name="formulario"><axis:alt f="axisage022" c="FORMULARIO" lit="9001817"/></c:param>
            <c:param name="form">${sessionScope.AXISMPRXXX}</c:param>
    </c:import>

<!-- Area de campos de parametros -->
<table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
<tr>
<td>

    <jsp:include page="/WEB-INF/jsp/axis/axismprlista.jsp" flush="true" />
</td>
</tr>
</table>    

<!-- Area de campos  -->
<c:import url="../include/botonera_nt.jsp"><c:param name="f">axisage022</c:param><c:param name="__botones">salir</c:param></c:import>

    </form>
<c:import url="../include/mensajes.jsp" />

<form name="miXForm" action="" method="POST">
    <input type="hidden" name="operation"/>
    <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}" />
    <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}" />
    <input type="hidden" name="CPARAM"  />
    <input type="hidden" name="CTIPO"  />
    <input type="hidden" name="XVALPAR"  />
</form>


</body>
</html>