<%/* Revision:# ad2M4eDAeF1XTE/kZ2+93Q== # */%>
<%-- 
*  Fichero: axisfic006.jsp
*/
--%>
<%@ page contentType="text/html;charset=UTF-8" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
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
        <!-- Idioma del calendario, en funci?n del Locale -->
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
                retocarPAGE_CSS('axisfic006');
            </c:if>
            f_cargar_propiedades_pantalla();
            var grabarOK = "${__formdata.grabarOK}";
            var eliminarOK = "${__formdata.eliminarOK}";
            if (grabarOK == "1") {
              parent.f_cancelar_axisfic006();
            }
            if (eliminarOK == "1") {
                parent.f_cancelar_axisfic006();
              }
            var miSFINANCI = "${__formdata.SFINANCI}";
            if (miSFINANCI == null ) {
                PSFINANCIOUT = session.getAttribute("SFINANCI");
            }
            else {
              PSFINANCIOUT = "${__formdata.SFINANCI}";
              PNMOVIMIOUT = "${__formdata.NMOVIMI}";
            } 
            /* Added for IAXIS-4945 - Start */
             <%-- INI -IAXIS-5338 - JLTS -08/10/2019 -Se reemplazan puntos y comas --%>
            var resLegal = parseInt($("#val11_1_RESV_LEGAL").val() == "" ? 0 : objUtiles.replaceAll(objUtiles.replaceAll($("#val11_1_RESV_LEGAL").val(),".", ""),",","."));
            var capSocial = parseInt($("#val11_1_CAP_SOCIAL").val() == "" ? 0 : objUtiles.replaceAll(objUtiles.replaceAll($("#val11_1_CAP_SOCIAL").val(),".", ""),",","."));
            var resEjerAnt = parseInt($("#val11_1_RES_EJER_ANT").val() == "" ? 0 : objUtiles.replaceAll(objUtiles.replaceAll($("#val11_1_RES_EJER_ANT").val(),".", ""),",","."));
            var primaAccion = parseInt($("#val11_1_PRIMA_ACCION").val() == "" ? 0 : objUtiles.replaceAll(objUtiles.replaceAll($("#val11_1_PRIMA_ACCION").val(),".", ""),",","."));
            var resvOcasi = parseInt($("#val11_1_RESV_OCASI").val() == "" ? 0 : objUtiles.replaceAll(objUtiles.replaceAll($("#val11_1_RESV_OCASI").val(),".", ""),",","."));
            var asignado = parseInt($("#val11_1_ASIGNADO").val() == "" ? 0 : objUtiles.replaceAll(objUtiles.replaceAll($("#val11_1_ASIGNADO").val(),".", ""),",","."));
            
            var patriLiqTotal = resLegal + capSocial + resEjerAnt + primaAccion + resvOcasi + asignado;
             <%-- FIN -IAXIS-5338 - JLTS -08/10/2019 --%>
            
            /* Call fn to insert the value of PatriLiquido */
        <%-- INI -IAXIS-5338 - JLTS -08/10/2019 -Se comenta por conflictos en la funci?n
            f_CheckLiquido();
        --%>
            /* Added for IAXIS-4945 - End */
            if (!objUtiles.estaVacio(OK))
                parent.f_aceptar_axisfic006(PSFINANCIOUT, PNMOVIMIOUT );
        }
        
        /* Added for IAXIS-4945 - Start */
        function f_CheckLiquido() {
            $("#val11_2_PATRI_LIQUIDO").addClass("campodisabled").css({"width":"250px"}).attr({"readonly":"true"});
            
            var parsedVal=parseVal("val11_2_PATRI_LIQUIDO");
        var CUTILI=parsedVal[0];
        var CTIPO=parsedVal[1];
        var CPARAM=parsedVal[2];
        var XVALPAR=$("#val11_2_PATRI_LIQUIDO").val();
            
        var url = "operation=actualizar";
        url = url + "&CUTILI=" + CUTILI + "&CPARAM=" + CPARAM + "&XVALPAR=" + XVALPAR + "&CTIPO=" + CTIPO;
        url = url + "&dt=" + (new Date().getTime());
        objAjax.invokeAsyncCGI("modal_${sessionScope.AXISMPRXXX}.do", callbackonchange, url, this, objJsMessages.jslit_cargando);
        }
        /* Added for IAXIS-4945 - End */
        
        function f_but_salir() {
                var txt;
                var r = confirm("Desea corregir los datos?");
                if (r == true) {
                    parent.f_aceptar_axisfic006();
                } else {
                    var qs="?SFINANCI="+document.miForm.SFINANCI.value;
                    qs=qs+"&NMOVIMI="+document.miForm.NMOVIMI.value;
                    objUtiles.ejecutarFormulario("modal_axisfic006.do"+qs, "borrar", document.miForm, "_self");
                }
        }
       
        function f_but_cancelar() {
             parent.f_aceptar_axisfic006();
        }   
        
        // 34989-207442
        function f_but_aceptar() {
           if (objValidador.validaEntrada()) {
               f_validar_parfinanciera();
               var grabarOK = "${__formdata.grabarOK}";
                  if (grabarOK == "1" )  
                 parent.f_cancelar_axisfic006();
            }
           parent.f_aceptar_axisfic006();
           
        }
       
        function f_validar_parfinanciera() {
            if (objValidador.validaEntrada()) {
                var qs="?SFINANCI="+document.miForm.SFINANCI.value;
                qs=qs+"&NMOVIMI="+document.miForm.NMOVIMI.value;
                objUtiles.ejecutarFormulario("modal_axisfic006.do"+qs, "vPatrimonial", document.miForm, "_self");
            }
        }

        function callbackvalidarpar(ajaxResponseText){
            try{               
                var doc = objAjax.domParse(ajaxResponseText);    
                
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("MENSAJE_OK")[0])) {
                        parent.f_aceptar_axisfic006();
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
            if (responseText.substring(0,1)!="0") {
                alert("<axis:alt f="axisfic006" c="CALLBACK" lit="101283" />");
            }
        }
        function f_onchange(ths) {
          //  if (objValidador.validaEntrada()) {
        /** Added for IAXIS-4945 - Start */
        <%-- INI -IAXIS-5338 - JLTS -08/10/2019 -Se reemplazan puntos y comas --%>
            var resLegal = parseInt($("#val11_1_RESV_LEGAL").val() == "" ? 0 : objUtiles.replaceAll(objUtiles.replaceAll($("#val11_1_RESV_LEGAL").val(),".", ""),",","."));
            var capSocial = parseInt($("#val11_1_CAP_SOCIAL").val() == "" ? 0 : objUtiles.replaceAll(objUtiles.replaceAll($("#val11_1_CAP_SOCIAL").val(),".", ""),",","."));
            var resEjerAnt = parseInt($("#val11_1_RES_EJER_ANT").val() == "" ? 0 : objUtiles.replaceAll(objUtiles.replaceAll($("#val11_1_RES_EJER_ANT").val(),".", ""),",","."));
            var primaAccion = parseInt($("#val11_1_PRIMA_ACCION").val() == "" ? 0 : objUtiles.replaceAll(objUtiles.replaceAll($("#val11_1_PRIMA_ACCION").val(),".", ""),",","."));
            var resvOcasi = parseInt($("#val11_1_RESV_OCASI").val() == "" ? 0 : objUtiles.replaceAll(objUtiles.replaceAll($("#val11_1_RESV_OCASI").val(),".", ""),",","."));
            var asignado = parseInt($("#val11_1_ASIGNADO").val() == "" ? 0 : objUtiles.replaceAll(objUtiles.replaceAll($("#val11_1_ASIGNADO").val(),".", ""),",","."));
        <%-- FIN -IAXIS-5338 - JLTS -08/10/2019 --%>
                
            var patriLiqTotal = resLegal + capSocial + resEjerAnt + primaAccion + resvOcasi + asignado;
                
            $("#val11_2_PATRI_LIQUIDO").val(patriLiqTotal);
            /* Call fn to store the value of PatriLiquido */
            f_CheckLiquido();
                /** Added for IAXIS-4945 - End  */
                
                var parsedVal=parseVal(ths.name)
                var CUTILI=parsedVal[0]
                var CTIPO=parsedVal[1]
                var CPARAM=parsedVal[2]

                // INI -IAXIS-5338 - JLTS -08/10/2019 -Se deja sin formato cuando es negativo
                 if (CTIPO == 1 || CTIPO == 2 ) { // Solo cuando es num?rico
                  var XVALPAR_AUX = ths.value;
                  if (XVALPAR_AUX < 0) {
                      var XVALPAR= ths.value;
                  } else {
                    var XVALPAR = objValidador.valorFormateadoCampoNumerico(ths.value,true,true);
                    var nombrepar=ths.name
                    //alert("XVALPAR="+XVALPAR);
                    //alert("nombrepar="+nombrepar);
                    objDom.setValorPorId(nombrepar, XVALPAR);
                  }
                 }
                 else {
                   var XVALPAR= ths.value;
                 }
                // FIN -IAXIS-5338 - JLTS -08/10/2019
                var qs="operation=actualizar";
                qs=qs+"&CUTILI="+CUTILI
                qs=qs+"&CPARAM="+CPARAM
                qs=qs+"&XVALPAR="+XVALPAR
                qs=qs+"&CTIPO="+CTIPO
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_${sessionScope.AXISMPRXXX}.do", callbackonchange, qs, this, objJsMessages.jslit_cargando)
          //  }
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
    <input type="hidden" name="SFINANCI" value="${__formdata.SFINANCI}" />
    <input type="hidden" name="NMOVIMI" value="${__formdata.NMOVIMI}" />
    <input type="hidden" name="CPARAM"  />
    <input type="hidden" name="CTIPO"  />
    <input type="hidden" name="XVALPAR"  />
    <input type="hidden" name="CAMPO"  value="${__formdata.CAMPO}" />
    <input type="hidden" name="TEXTO5"  value="${__formdata.TEXTO5}" />
    <input type="hidden" name="PARAGRUPA"  value="${__formdata.PARAGRUPA}" />
    
    <c:import url="../include/titulo_nt.jsp">
           <%-- <c:param name="modalidad">null</c:param>--%>
            <c:param name="titulo"><axis:alt f="axisfic006" c="TITULO" lit="9001817"/></c:param>
            <c:param name="formulario"><axis:alt f="axisfic006" c="FORMULARIO" lit="9001817"/></c:param>
            <c:param name="form">${sessionScope.AXISMPRXXX}</c:param>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axiscom002|axiscom002</c:param>
    </c:import>

<!-- Area de campos de parametros -->
<table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
<tr>
<td>
    <!-- Changed for IAXIS-4945 - Start -->
    <%-- <jsp:include page="/WEB-INF/jsp/axis/axismprlistafin.jsp?mprlistasize=33" flush="true" /> --%>
    <jsp:include page="/WEB-INF/jsp/axis/axismprlistafin.jsp?mprlistasize=34" flush="true" />
    <!-- Changed for IAXIS-4945 - End -->
</td>
</tr>
</table>    

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<axis:alt c="LIT_TITULO" f="axisfic006" lit=""/>

<!-- Area de campos  -->
<c:import url="../include/botonera_nt.jsp"><c:param name="f">axisfic006</c:param><c:param name="__botones">salir,aceptar</c:param></c:import>

    </form>
<c:import url="../include/mensajes.jsp" />

<form name="miXForm" action="" method="POST">
    <input type="hidden" name="operation"/>
    <input type="hidden" name="SFINANCI" value="${__formdata.SFINANCI}" />
    <input type="hidden" name="NMOVIMI" value="${__formdata.NMOVIMI}" />
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
