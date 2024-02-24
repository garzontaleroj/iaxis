<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><fmt:message key="101603"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    
    <script type="text/javascript">
        function recargar() {
            // recarga la pantalla actual
            document.miRecargar.submit()
        }
        function f_onload() {
            // Desplegar la subsección contenida en el request parameter "subpantalla"
            var subpantalla = '<%=request.getAttribute("subpantalla")%>';       
            if (objUtiles.estaVacio(subpantalla) || subpantalla == 'null') {
                subpantalla = '${param.subpantalla}';
            }
            
            if (!objUtiles.estaVacio(subpantalla))      
                  objEstilos.toggleDisplay(subpantalla, document.getElementById(subpantalla + "_parent"));      
            
            revisarEstilos();
        }        
        
        function f_but_salir() {
                     parent.f_aceptar_modal("axispro001garantias","garantias");
        }
        function f_but_parametrosgar() {
            objUtiles.ejecutarFormulario("modal_axispro001_garantias.do", "consultarParametrosGar", document.miRecargar, "_self", objJsMessages.jslit_cargando);
        }
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_abrir_modal(cual, pasarParams, noXButton) {
            var paramsAdicionales ="";
            if (!objUtiles.estaVacio(pasarParams) && pasarParams == "true") {
                //paramsAdicionales = "&SPRODUC=${param.SPRODUC}&PCGARANT=${param.CGARAN}&PCACTIVI=${param.CACTIVI}&TGARANT=${mntgaran.TGARANT}";
                paramsAdicionales = "&SPRODUC=${__formdata.SPRODUC}&PCGARANT=${__formdata.CGARANT}&PCACTIVI=${__formdata.CACTIVI}&TGARANT=${mntgaran.TGARANT}";
            }
                
            if (!objUtiles.estaVacio(noXButton) && noXButton == "true") 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");
                
            objUtiles.abrirModal(cual, "src", "modal_"+cual+".do?operation=form" + paramsAdicionales);        
        }
        
        function f_aceptar_modal(cual) {
            if(cual == "axispro033")
                f_aceptar_axispro033();
            else
                objUtiles.cerrarModal(cual);
        }
        function f_abrir_axispro033(){
            var paramsAdicionales ="";
            paramsAdicionales = "&SPRODUC=${__formdata.SPRODUC}&CGARANT=${__formdata.CGARANT}&CACTIVI=${__formdata.CACTIVI}&VMODO=GAR&TGARANT=${mntgaran.TGARANT}";
            objUtiles.abrirModal("axispro033", "src", "modal_axispro033.do?operation=form" + paramsAdicionales); 
        }
        function f_aceptar_axispro033(){
            objUtiles.cerrarModal('axispro033');
            //objUtiles.ejecutarFormulario("modal_axispro001_garantias.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
              document.miRecargar.submit()
             }
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_abrir_axispro014(cutili){
            var paramsAdicionales ="";
            paramsAdicionales = "&SPRODUC=${__formdata.SPRODUC}&PCGARANT=${__formdata.CGARANT}&PCACTIVI=${__formdata.CACTIVI}&TGARANT=${mntgaran.TGARANT}&CUTILI="+cutili;
            objUtiles.abrirModal("axispro014", "src", "modal_axispro014.do?operation=form" + paramsAdicionales); 
        }
        
    </script>    
</head>

<body onload="javascript:f_onload()">

<c:import url="../include/precargador_ajax.jsp">
    <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
</c:import>

<c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><fmt:message key="101603"/></c:param>
        <c:param name="formulario"><fmt:message key="101603"/></c:param>
        <c:param name="form">axispro001_garantias</c:param>
</c:import>

<c:import url="../include/modal_estandar.jsp">
    <c:param name="nid_y_titulo">axispro014|<fmt:message key="1000224"/>#axispro015|<fmt:message key="1000225"/>#axispro016|<fmt:message key="1000226"/>#axispro017|<fmt:message key="1000227"/></c:param>
</c:import>
<c:import url="../include/modal_estandar.jsp">
    <c:param name="nid_y_titulo">axispro033|<fmt:message key="9901153"/></c:param>
</c:import>
<c:import url="../include/modal_estandar.jsp">
    <c:param name="nid_y_titulo">axispro045|<fmt:message key="9901250"/></c:param>
</c:import>
<c:import url="../include/modal_estandar.jsp">
    <c:param name="nid_y_titulo">axispro046|<fmt:message key="9901297"/></c:param>
</c:import>


<table class="area" align="center">   
    <!-- Garantías -->
    <tr>
        <td class="campocaja" >
            <div class="titulo">
                <img src="images/flecha.gif"/><c:if test="${!empty mntproducto.SPRODUC}">${mntproducto.SPRODUC} - ${mntproducto.TITULO[0].OB_IAX_PRODTITULO.TTITULO}</c:if>
            </div>
        </td>
    </tr>
    <!-- 3.1.10.1	DATOS GENERALES -->
    <tr>
        <td class="campocaja" >
            <div style="float:left;">
            <img id="garantias_datosgenerales_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('garantias_datosgenerales', this)" style="cursor:pointer"/> 
            <b><fmt:message key="103593"/></b> <c:if test="${!empty mntgaran.TACTIVI}"><fmt:message key="103481"/>: ${mntgaran.TACTIVI}</c:if> <c:if test="${!empty mntgaran.TGARANT || !empty mntgaran.TTIPGAR}"><fmt:message key="110994"/>: ${mntgaran.TGARANT} ${mntgaran.TTIPGAR}</c:if>
            </div>
            <axis:visible f="axispro001_garantias" c="EDIT_GARAN_GENERAL">
                <div style="float:right;"><a href="javascript:f_abrir_modal('axispro015', 'true')"><img border="0" alt="<fmt:message key="100002"/>" title="<fmt:message key="100002"/>" src="images/lapiz.gif"/></a></div>
            </axis:visible>    
            <div style="clear:both;"><hr class="titulo"></div>
        </td>
    </tr>
    <tr id="garantias_datosgenerales_children" style="display:none">
        <td align="left" >   
        <c:import url="../axis/axispro001_garantias_datosgenerales.jsp"/>
        </td>
    </tr>
</table>
<table class="area" align="center">   
    <!-- 3.1.10.2	GESTIÓN -->
    <tr>
        <td class="campocaja" >
            <div style="float:left;">
            <img id="garantias_gestion_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('garantias_gestion', this)" style="cursor:pointer"/> 
            <b><fmt:message key="101109"/></b> <c:if test="${!empty mntgaran.DATGESTION.CTARMAN}"><fmt:message key="100772"/>: ${mntgaran.DATGESTION.CTARMAN}</c:if> <c:if test="${!empty mntgaran.DATGESTION.TREASEG}"><fmt:message key="100956"/>: ${mntgaran.DATGESTION.TREASEG}</c:if> <c:if test="${!empty mntgaran.DATGESTION.NEDAMIC}"><fmt:message key="1000476"/>: ${mntgaran.DATGESTION.NEDAMIC}</c:if> <c:if test="${!empty mntgaran.DATGESTION.NEDAMAC}"><fmt:message key="1000475"/>: ${mntgaran.DATGESTION.NEDAMAC}</c:if> <c:if test="${!empty mntgaran.DATGESTION.NEDAMAR}"><fmt:message key="100719"/>: ${mntgaran.DATGESTION.NEDAMAR}</c:if>
            </div>
            <axis:visible f="axispro001_garantias" c="EDIT_GARAN_GESTION">
                <div style="float:right;"><a href="javascript:f_abrir_modal('axispro016', 'true')"><img border="0" alt="<fmt:message key="100002"/>" title="<fmt:message key="100002"/>" src="images/lapiz.gif"/></a></div>
            </axis:visible>                
            <div style="clear:both;"><hr class="titulo"></div>
        </td>
    </tr>
    <tr id="garantias_gestion_children" style="display:none">
        <td align="left" >    
            <c:import url="../axis/axispro001_garantias_gestion.jsp"/>
        </td>
    </tr>
</table>

<table class="area" align="center">   
    <!-- 3.1.10.3	IMPUESTOS -->
    <tr>
        <td class="campocaja" >
            <div style="float:left;">
            <img id="garantias_impuestos_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('garantias_impuestos', this)" style="cursor:pointer"/> 
            <b><fmt:message key="101278"/></b> <c:if test="${mntgaran.IMPUESTOS.CIMPCON==1}"><fmt:message key="100916"/></c:if> <c:if test="${mntgaran.IMPUESTOS.CIMPDGS==1}"><fmt:message key="800378"/></c:if> <c:if test="${mntgaran.IMPUESTOS.CIMPIPS==1}"><fmt:message key="1000253"/></c:if> <c:if test="${mntgaran.IMPUESTOS.CIMPARB==1}"><fmt:message key="101705"/></c:if> <c:if test="${mntgaran.IMPUESTOS.CIMPFNG==1}"><fmt:message key="103478"/></c:if>
            </div>
            <axis:visible f="axispro001_garantias" c="EDIT_GARAN_IMPUESTOS">
                <div style="float:right;"><a href="javascript:f_abrir_modal('axispro017', 'true')"><img border="0" alt="<fmt:message key="100002"/>" title="<fmt:message key="100002"/>" src="images/lapiz.gif"/></a></div>
            </axis:visible>    
            <div style="clear:both;"><hr class="titulo"></div>
             
        </td>
    </tr>
    <tr id="garantias_impuestos_children" style="display:none">
        <td align="left" >    
            <c:import url="../axis/axispro001_garantias_impuestos.jsp"/>
        </td>
    </tr>
</table>

<table class="area" align="center">   
    <!-- 3.1.10.4	INCOMPATIBILIDADES -->
    <tr>
        <td class="campocaja" >
            <div style="float:left;">
            <img id="garantias_incompatibilidades_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('garantias_incompatibilidades', this)" style="cursor:pointer"/> 
            <c:set var="lengthIncompatibilidades">
                ${fn:length(mntgaran.INCOMPGARAN)}
            </c:set>
            <c:set var="noExistenIncompatibilidades">
                <fmt:message key="9001605"/>
            </c:set>
            <c:set var="existenXIncompatibilidades">
                <c:if test="${lengthIncompatibilidades == 1}">
                    ${mntgaran.INCOMPGARAN[0].OB_IAX_PRODINCOMPGARAN.TGARINC}
                </c:if>                    
                <c:if test="${lengthIncompatibilidades != 1}">
                    <fmt:message key="9001079"/>
                </c:if>
            </c:set>
            <c:set var="existenXIncompatibilidades">
                ${fn:replace(existenXIncompatibilidades, '{0}', lengthIncompatibilidades)}    
            </c:set>
            
            <b><fmt:message key="108477"/></b> ${empty mntgaran.INCOMPGARAN ? noExistenIncompatibilidades : existenXIncompatibilidades}            
            </div>
            
            <axis:visible f="axispro001_garantias" c="EDIT_GARAN_INCOMP">
                <div style="float:right;"><a href="javascript:f_abrir_modal('axispro045', 'true')"><img border="0" alt="<fmt:message key="100002"/>" title="<fmt:message key="100002"/>" src="images/lapiz.gif"/></a></div>
            </axis:visible>
            
            <div style="clear:both;"><hr class="titulo"></div>
        </td>
    </tr>
    <tr id="garantias_incompatibilidades_children" style="display:none">
        <td align="left" >    
            <c:import url="../axis/axispro001_garantias_incompatibilidades.jsp"/>
        </td>
    </tr>
</table>

<table class="area" align="center">   
    <!-- 3.1.10.5	DATOS TÉCNICOS -->
    <tr>
        <td class="campocaja" >
            <div style="float:left;">
            <img id="garantias_datostecnicos_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('garantias_datostecnicos', this)" style="cursor:pointer"/> 
            <b><fmt:message key="1000101"/></b>
            </div>
            <axis:visible f="axispro001_garantias" c="EDIT_GARAN_TECNICOS">
                <div style="float:right;"><a href="javascript:f_abrir_modal('axispro046', 'true')"><img border="0" alt="<fmt:message key="100002"/>" title="<fmt:message key="100002"/>" src="images/lapiz.gif"/></a></div>
            </axis:visible>                
            <div style="clear:both;"><hr class="titulo"></div>
        </td>
    </tr>
    <tr id="garantias_datostecnicos_children" style="display:none">
        <td align="left" >    
           <c:import url="../axis/axispro001_garantias_datostecnicos.jsp"/>
        </td>
    </tr>
</table>

<table class="area" align="center">   
    <!-- 3.1.10.6	FORMULAS PRODUCCION -->
    <tr>
        <td class="campocaja" >
            <div style="float:left;">
            <img id="garantias_formulas_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('garantias_formulas', this)" style="cursor:pointer"/> 

            <c:set var="fuenteDatosTarificacion" value="${dummy}"/>
            <c:forEach items="${__formdata.FORMULASTARIF}" var="formula">
              <%--  <c:if test="${formula.OB_IAX_PRODGARFORMULAS.CUTILI == 0}"> --%>
                    <c:set var="fuenteDatosTarificacion" value="${__formdata.FORMULASTARIF}"/>
              <%--  </c:if> --%>
            </c:forEach>
            
            <c:set var="lengthFormulasTarificacion">
                ${fn:length(fuenteDatosTarificacion)}
            </c:set>
            <c:set var="noExistenFormulasTarificacion">
                <fmt:message key="9001612"/>
            </c:set>
            <c:set var="existenXFormulasTarificacion">
                <c:if test="${lengthFormulasTarificacion == 1}">
                    ${fuenteDatosTarificacion[0].CLAVE} ${fuenteDatosTarificacion[0].CCAMPO} ${fuenteDatosTarificacion[0].TCAMPO} 
                </c:if>
                <c:if test="${lengthFormulasTarificacion != 1}">
                    <fmt:message key="9001080"/>
                </c:if>
            </c:set>
            <c:set var="existenXFormulasTarificacion">
                ${fn:replace(existenXFormulasTarificacion, '{0}', lengthFormulasTarificacion)}    
            </c:set>
            
            <c:set var="fuenteDatosProvisiones" value="${dummy}"/>
            <c:forEach items="${__formdata.FORMULASPROV}" var="formula">
               <%-- <c:if test="${formula.CUTILI == 8}"> --%>
                    <c:set var="fuenteDatosProvisiones" value="${__formdata.FORMULASPROV}"/>
              <%--  </c:if> --%>
            </c:forEach>
            
            <c:set var="lengthFormulasProvisiones">
                ${fn:length(fuenteDatosProvisiones)}
            </c:set>
            <c:set var="noExistenFormulasProvisiones">
                <fmt:message key="9001612"/>
            </c:set>
            <c:set var="existenXFormulasProvisiones">
                <c:if test="${lengthFormulasProvisiones == 1}">
                    ${fuenteDatosProvisiones[0].CLAVE} ${fuenteDatosProvisiones[0].CCAMPO} ${fuenteDatosProvisiones[0].TCAMPO} 
                </c:if>
                <c:if test="${lengthFormulasProvisiones != 1}">
                    <fmt:message key="9001080"/>
                </c:if>
            </c:set>
            <c:set var="existenXFormulasProvisiones">
                ${fn:replace(existenXFormulasProvisiones, '{0}', lengthFormulasProvisiones)}    
            </c:set>
            
            
            <b><fmt:message key="149926"/></b> <fmt:message key="108987" />: ${empty fuenteDatosTarificacion ? noExistenFormulasTarificacion : existenXFormulasTarificacion} / <fmt:message key="102656" />: ${empty fuenteDatosProvisiones ? noExistenFormulasProvisiones : existenXFormulasProvisiones}
            </div>
           <%-- <div style="float:right;"><a href="javascript:f_abrir_modal('axispro014', 'true', 'true')"><img border="0" alt="<fmt:message key="100002"/>" title="<fmt:message key="100002"/>" src="images/lapiz.gif"/></a></div>
            --%>
            <div style="clear:both;"><hr class="titulo"></div>
        </td>
    </tr>
    <tr id="garantias_formulas_children" style="display:none">
        <td align="left" >
            <c:import url="../axis/axispro001_garantias_formulas.jsp"/>
        </td>
    </tr>
</table>

<table class="area" align="center">   
    <!-- 3.1.10.7	PREGUNTAS -->
    <tr>
        <td class="campocaja" >
            <div style="float:left;">
            <img id="garantias_preguntas_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('garantias_preguntas', this)" style="cursor:pointer"/> 
            
            <c:set var="lengthPreguntas">
                ${fn:length(mntgaran.PREGUNTAS)}
            </c:set>
            <c:set var="noExistenPreguntas">
                <fmt:message key="9001613"/>
            </c:set>
            <c:set var="existenXPreguntas">
                <c:if test="${lengthPreguntas == 1}">
                    ${mntgaran.PREGUNTAS[0].OB_IAX_PRODPREGUNPROGARAN.CPREGUN} ${mntgaran.PREGUNTAS[0].OB_IAX_PRODPREGUNPROGARAN.TPREGUN}
                </c:if>                    
                <c:if test="${lengthPreguntas != 1}">
                    <fmt:message key="9001076"/>
                </c:if>
            </c:set>
            <c:set var="existenXPreguntas">
                ${fn:replace(existenXPreguntas, '{0}', lengthPreguntas)}    
            </c:set>
            
            <b><fmt:message key="102299"/></b> ${empty mntgaran.PREGUNTAS ? noExistenPreguntas : existenXPreguntas}
            </div>
            <axis:visible f="axispro001_garantias" c="EDIT_GARAN_PREGS">
	    	<div style="float:right;"><a href="javascript:f_abrir_axispro033()"><img border="0" alt="<fmt:message key="100002"/>" title="<fmt:message key="100002"/>" src="images/lapiz.gif"/></a></div>
            </axis:visible>                
            <div style="clear:both;"><hr class="titulo"></div>
        </td>
    </tr>
    <tr id="garantias_preguntas_children" style="display:none">
        <td align="left" >    
         <c:import url="../axis/axispro001_garantias_preguntas.jsp"/> 
        </td>
    </tr>
</table>

<table class="area" align="center">   
    <!-- 3.1.10.8	PARAMETROS -->
    <tr>
        <td class="campocaja" >
            <div style="float:left;">
            <img id="garantias_parametros_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('garantias_parametros', this)" style="cursor:pointer"/> 
            
            <c:set var="lengthParametros">
                ${fn:length(mntgaran.PARAMETROS)}
            </c:set>
            <c:set var="noExistenParametros">
                <fmt:message key="9001614"/>
            </c:set>
            <c:set var="existenXParametros">
                <c:if test="${lengthParametros == 1}">
                    ${mntgaran.PARAMETROS[0].OB_IAX_PRODPARAGARANPRO.TPARAME}: ${mntgaran.PARAMETROS[0].OB_IAX_PRODPARAGARANPRO.DVALPAR}
                </c:if>                    
                <c:if test="${lengthParametros != 1}">
                    <fmt:message key="9001081"/>
                </c:if>
            </c:set>
            <c:set var="existenXParametros">
                ${fn:replace(existenXParametros, '{0}', lengthParametros)}    
            </c:set>
            
            <b><fmt:message key="103694"/></b> ${empty mntgaran.PARAMETROS ? noExistenParametros : existenXParametros}                        
            </div>
            
            <axis:visible f="axispro001_garantias" c="EDIT_GARAN_PARAMS">
                <div style="float:right;"><a href="javascript:f_but_parametrosgar()"><img border="0" alt="<fmt:message key="100002"/>" title="<fmt:message key="100002"/>" src="images/lapiz.gif"/></a></div>
            </axis:visible>
            <div style="clear:both;"><hr class="titulo"></div>
        </td>
    </tr>
    <tr id="garantias_parametros_children" style="display:none">
        <td align="left" >    
          <c:import url="../axis/axispro001_garantias_parametros.jsp"/> 
        </td>
    </tr>
</table>

<table class="area" align="center">   
    <!-- 3.1.10.9	CUMULOS -->
    <tr>
        <td class="campocaja" >
            <div style="float:left;">
            <img id="garantias_cumulos_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('garantias_cumulos', this)" style="cursor:pointer"/> 
            
            <c:set var="lengthCumulos">
                ${fn:length(mntgaran.CUMULOS)}
            </c:set>
            <c:set var="noExistenCumulos">
                <fmt:message key="9001615"/>
            </c:set>
            <c:set var="existenXCumulos">
                <c:if test="${lengthCumulos == 1}">
                    ${mntgaran.CUMULOS[0].OB_IAX_PRODCUMGARAN.TCUMULO}
                </c:if>                    
                <c:if test="${lengthCumulos != 1}">
                    <fmt:message key="9001082"/>
                </c:if>
            </c:set>
            <c:set var="existenXCumulos">
                ${fn:replace(existenXCumulos, '{0}', lengthCumulos)}    
            </c:set>
            
            <b><fmt:message key="108853"/></b> ${empty mntgaran.CUMULOS ? noExistenCumulos : existenXCumulos}      
            </div>
            <axis:visible f="axispro001_garantias" c="EDIT_GARAN_CUMULS">
                <div style="float:right;"><a href="javascript:void(0)"><img border="0" alt="<fmt:message key="100002"/>" title="<fmt:message key="100002"/>" src="images/lapiz.gif"/></a></div>
            </axis:visible>                
            <div style="clear:both;"><hr class="titulo"></div>
        </td>
    </tr>
    <tr id="garantias_cumulos_children" style="display:none">
        <td align="left" >    
          <c:import url="../axis/axispro001_garantias_cumulos.jsp"/>
        </td>
    </tr>
</table>

    <c:import url="../include/botonera_nt.jsp">
    <c:param name="__botones">salir</c:param>
    </c:import>

<c:set var="pantalla" value="axispro001_garantias"/>

<form name="${pantalla}">
    <input type="hidden" name="axispro001_garantias_STRURL" value="&SPRODUC=${param.SPRODUC}&PCGARANT=${param.CGARANT}&PCACTIVI=${param.CACTIVI}&TGARANT=${mntgaran.TGARANT}"/>
</form>
<form name="miRecargar" action="modal_axispro001_garantias.do" method="POST">
    <input type="hidden" name="operation" value="form"/>
    <input type="hidden" name="SPRODUC" value="${__formdata.SPRODUC}"/>
    <input type="hidden" name="CGARANT" value="${__formdata.CGARANT}"/>
    <input type="hidden" name="CACTIVI" value="${__formdata.CACTIVI}"/>
</form>



</body>
</html>
