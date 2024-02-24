<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%-- 
*  Fichero: axisper023.jsp
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes" %>
<%@ page import="java.util.*" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="stylesheet" href="styles/displaytag.css">
     <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
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
        	  <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisper023');
					</c:if>
            f_cargar_propiedades_pantalla();
            var OK = "${requestScope.OK}"; 
            
            PSPERSONOUT = "${__formdata.SPERSON}";
            PCAGENTEOUT = "${__formdata.CAGENTE}";
            if (!objUtiles.estaVacio(OK))
                parent.f_aceptar_axisper023(PSPERSONOUT,PCAGENTEOUT);
        }
        // CP0024M_SYS_PERS_Val - ACL - 01/11/2018 -- Se modifica las funciones f_but_aceptar y f_but_salir para que tome los cambios al actualizar la pantalla       
        function f_but_aceptar() {
        	f_validar_parpersona();
        }
       
        function f_but_salir() {
            f_validar_parpersona();
        }
        
        function f_validar_parpersona() {
            if (objValidador.validaEntrada()) {
                var qs="operation=validar_parpersona";
                objAjax.invokeAsyncCGI("modal_axisper023.do", callbackvalidarparper, qs, document.miForm, objJsMessages.jslit_cargando);
            }
        }

        function callbackvalidarparper(ajaxResponseText){
            try{               
                var doc = objAjax.domParse(ajaxResponseText);    
                
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("MENSAJE_OK")[0])) {
                       // alert(objDom.getValorNodoDelComponente(doc.getElementsByTagName("MENSAJE_OK"), 0, 0));
                        parent.f_aceptar_axisper023();
                    }
                } 
            } 
            catch (e) {
                if (isDebugAjaxEnabled == "true") {
                    alert (e.name + " " + e.message);
                }
            }
        }
        
        // 34989-207442
        
        function f_ondblclick(ths) {       
        }
        
        function callbackonchange(responseText) {
            //alert("["+responseText+"]")
            if (responseText.substring(0,1)!="0") {
                alert("<axis:alt f="axisper023" c="CALLBACK" lit="101283" />");
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
                
            if (CPARAM == "PER_ING_TARJPROF" && XVALPAR.length > 10) {    // 06/11/2018 CP00023M_SYS_PER_Val_que en el campo numero TP se pueda diligenciar AP
            	alert("<axis:alt f="axisper023" c="CALLBACK" lit="9907933" />");
            	callbackonchange(1);
            }
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
	<div id="wrapper" class="wrapper">
<c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
<form name="miForm" action="" method="POST">
    <input type="hidden" name="operation"/>
    <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}" />
    <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}" />
    <input type="hidden" name="CPARAM"  />
    <input type="hidden" name="CTIPO"  />
    <input type="hidden" name="XVALPAR"  />
    <input type="hidden" name="CAMPO"  value="${__formdata.CAMPO}" />
    <input type="hidden" name="TEXTO5"  value="${__formdata.TEXTO5}" />
    <input type="hidden" name="PARAGRUPA"  value="${__formdata.PARAGRUPA}" />
    
    <c:import url="../include/titulo_nt.jsp">
           <%-- <c:param name="modalidad">null</c:param>--%>
            <c:param name="titulo"><axis:alt f="axisper023" c="TITULO" lit="9001817"/></c:param>
            <c:param name="formulario"><axis:alt f="axisper023" c="FORMULARIO" lit="9001817"/></c:param>
            <c:param name="form">${sessionScope.AXISMPRXXX}</c:param>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axiscom002|axiscom002</c:param>
    </c:import>

<!-- Area de campos de parametros -->
<table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
<tr>
<td>

    <jsp:include page="/WEB-INF/jsp/axis/axismprlista.jsp?mprlistasize=30" flush="true" />
</td>
</tr>
</table>    

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<axis:alt c="LIT_TITULO" f="axisper023" lit="9908738"/>

<!-- Area de campos  -->
<!-- CP0024M_SYS_PERS_Val - ACL - 01/11/2018 -- Se modifica la botonera para que muestre el botón guardar  -->
<c:import url="../include/botonera_nt.jsp"><c:param name="f">axisper023</c:param>
                <c:param name="__botones">salir</c:param>
			</c:import>
        </form>
<c:import url="../include/mensajes.jsp" />

<form name="miXForm" action="" method="POST">
    <input type="hidden" name="operation"/>
    <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}" />
    <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}" />
    <input type="hidden" name="CPARAM"  />
    <input type="hidden" name="CTIPO"  />
    <input type="hidden" name="XVALPAR"  />
    <input type="hidden" name="CAMPO"  value="${__formdata.CAMPO}" />
    <input type="hidden" name="TEXTO5"  value="${__formdata.TEXTO5}" />
    <input type="hidden" name="PARAGRUPA"  value="${__formdata.PARAGRUPA}" />
</form>

</div>
</body>
</html>