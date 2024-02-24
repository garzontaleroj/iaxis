<%/**
*  Fichero: ${sessionScope.AXISMPRXXX}.jsp
*  @author <a href = "mailto:echristen@csi-ti.com">Elmar Christen</a>
*  
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><fmt:message key="formulario.${sessionScope.AXISMPRXXX}"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
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
        <script type="text/javascript">
        
            function f_ondblclick(ths) {
                ptho=ths
                /*
                var CUTILI=ths.name.substring(3,4)
                var CTIPO=ths.name.substring(4,5) 
                if (CUTILI=='-') CUTILI="";
                var CPARAM=ths.name.substring(5)
                */
                var parsedVal=parseVal(ths.name)
                var CUTILI=parsedVal[0]
                var CTIPO=parsedVal[1]
                var CPARAM=parsedVal[2]
                
                var XVALPAR=ths.value
                var SPRODUC=document.miForm.SPRODUC.value
                f_abrir_axismpreditor(SPRODUC,CUTILI, CTIPO, CPARAM, XVALPAR)
            }
            
            function f_but_salir() {
                //objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axismpr002", "cancelar", document.miForm, "_self");
            }
            
            function f_onload(){
                <c:if test="${empty __formdata.SPRODUC}">f_abrir_axismpr001();</c:if>
            }

            // Modal Buscador
            function f_abrir_axismpr001 () {
                objUtiles.abrirModal("axismpr001", "src", "modal_axismpr001.do?operation=form");
            }
            function f_cerrar_axismpr001() {
                objUtiles.cerrarModal("axismpr001");
            }   
            function f_aceptar_axismpr001 (SPRODUC) {
                f_cerrar_axismpr001();
                document.miForm.SPRODUC.value=SPRODUC;
                objUtiles.ejecutarFormulario ("axis_${sessionScope.AXISMPRXXX}.do", "init", document.miForm, "_self", objJsMessages.jslit_cargando);     
            }

            function callbackonchange(responseText) {
                //alert("["+responseText+"]")
                if (responseText.substring(0,1)!="0") {
                    alert("<fmt:message key="101283" />");
                }
            }

            function f_onchange(ths) {
                if (objValidador.validaEntrada()) {
                    var parsedVal=parseVal(ths.name)
                    var CUTILI=parsedVal[0]
                    var CTIPO=parsedVal[1]
                    var CPARAM=parsedVal[2]
    
                    var XVALPAR=ths.value
                    var SPRODUC=document.miForm.SPRODUC.value
    
                    var qs="operation=actualizar";
                    qs=qs+"&SPRODUC="+SPRODUC;
                    qs=qs+"&CUTILI="+CUTILI
                    qs=qs+"&CPARAM="+CPARAM
                    qs=qs+"&XVALPAR="+XVALPAR
                    qs=qs+"&CTIPO="+CTIPO
                    qs=qs+"&dt="+(new Date().getTime())
                    objAjax.invokeAsyncCGI("axis_${sessionScope.AXISMPRXXX}.do", callbackonchange, qs, this)
                }

            }
            
            function borrar(CPARAM) {
                var confdel=confirm(objJsMessages.jslit_confirma_borrar);
                if (confdel) {
                    document.miXForm.CPARAM.value=CPARAM
                    objUtiles.ejecutarFormulario ("axis_${sessionScope.AXISMPRXXX}.do", "borrar", document.miXForm, "_self", objJsMessages.jslit_cargando);     
                }
            }
            
            function anyadir() {
                document.miXForm.CPARAM.value=document.miForm.miCPARAM.value
                document.miXForm.XVALPAR.value=document.miForm.miXVALPAR.value
                document.miXForm.CTIPO.value=document.miForm.miCTIPO.value
                
                objUtiles.ejecutarFormulario ("axis_${sessionScope.AXISMPRXXX}.do", "anyadir", document.miXForm, "_self", objJsMessages.jslit_cargando);     
            }

            // Modal Editor axismpreditor
            var ptho=null
            function f_abrir_axismpreditor (SPRODUC,CUTILI,CTIPO, CPARAM, XVALPAR) {
                var qs="operation=form"
                qs=qs+"&SPRODUC="+escape(SPRODUC)
                qs=qs+"&CTIPO="+escape(CTIPO)
                qs=qs+"&CUTILI="+escape(CUTILI)
                qs=qs+"&CPARAM="+escape(CPARAM)
                qs=qs+"&XVALPAR="+escape(XVALPAR)
                qs=qs+"&dt="+(new Date().getTime())
                objUtiles.abrirModal("axismpreditor", "src", "modal_axismpreditor.do?"+qs, 480, 200);
            }
            function actualizarPtho(v) {
                ptho.value=v
            }
            
            function f_cerrar_axismpreditor() {
                objUtiles.cerrarModal("axismpreditor");
                ptho=null
            }   

        </script>
    </head>
<body onload="f_onload()">
<c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
<c:import url="../include/modal_estandar.jsp"><c:param name="nid_y_titulo">axismpr001|<fmt:message key="1000206" /></c:param></c:import>
<c:import url="../include/modal_estandar.jsp"><c:param name="nid">axismpreditor</c:param><c:param name="titulo"><fmt:message key="100002" /></c:param><c:param name="modalModo">SOLOX</c:param></c:import>
<form name="miForm" action="" method="POST">
    <input type="hidden" name="operation"/>
    <input type="hidden" name="SPRODUC" value="${__formdata.SPRODUC}" />
    <input type="hidden" name="CPARAM"  />
    <input type="hidden" name="CTIPO"  />
    <input type="hidden" name="XVALPAR"  />
    
    <c:import url="../include/titulo_nt.jsp">
           <%-- <c:param name="modalidad">null</c:param>--%>
            <c:param name="titulo"><fmt:message key="1000207"/></c:param>
            <c:param name="formulario"><fmt:message key="1000207"/></c:param>
            <c:param name="form">${sessionScope.AXISMPRXXX}</c:param>
    </c:import>

<!-- Area de campos  -->
<table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
<tr>
<td>
    <div class="titulo">
        <img src="images/flecha.gif"/>${headeritem1}
        <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axismpr001()" style="cursor:pointer"/>
    </div>
    <jsp:include page="axismprlista.jsp?NVALPARoCVALPAR=CVALPAR" flush="true" />
</td>
</tr>
</table>
<!-- Area de campos  -->
<c:import url="../include/botonera_nt.jsp"><c:param name="__botones">salir</c:param></c:import>

    </form>
<c:import url="../include/mensajes.jsp" />

<form name="miXForm" action="" method="POST">
    <input type="hidden" name="operation"/>
    <input type="hidden" name="SPRODUC" value="${__formdata.SPRODUC}" />
    <input type="hidden" name="CPARAM"  />
    <input type="hidden" name="CTIPO"  />
    <input type="hidden" name="XVALPAR"  />
</form>


</body>
</html>
