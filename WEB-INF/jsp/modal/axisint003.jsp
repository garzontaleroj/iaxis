<%--
      NOMBRE:    axisint003.jsp
      @author <a href = "mailto:pfeliu@csi-ti.com">Pablo Feliu</a>
      Fecha: 30/06/2010
      PROPÓSITO (descripción pantalla): Modificación de los campos para mantenimiento de logs
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        30/06/2010   PFA(iniciales)     1. Creación de la pantalla. Bug.14750
--%>

<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*" %>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
           
                f_cargar_propiedades_pantalla();
	        }
            
           
            function f_but_aceptar() {
                parent.f_cerrar_modal('axisint003');
            }
           
            function f_but_cancelar() {
                parent.f_cerrar_modal('axisint003');
            }
            
            function f_grabar(CNOMBRE,CVALOR,TIPO_COLUMNA){
            
                if (TIPO_COLUMNA == 'XMLTYPE'){                                  
                    document.miForm.CVALOR.value = CVALOR.value;
                    document.miForm.CNOMBRE.value = CNOMBRE;             
                    objUtiles.ejecutarFormulario("modal_axisint003.do", "grabar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
                else
                {
                    var qs="operation=ajax_grabar";
                    qs=qs+"&CNOMBRE="+CNOMBRE+"&CVALOR="+CVALOR.value+"&SPROCES=${__formdata.SPROCES}&CPROCESO=${__formdata.CPROCESO}&NLINEA=${__formdata.NLINEA}";
    
                    objAjax.invokeAsyncCGI("modal_axisint003.do", callbackajaxGrabar, qs, this, objJsMessages.jslit_cargando);        
                }
            }
        
            /****************************************************************************************/
            /*********************************** Callbacks ******************************************/
            /****************************************************************************************/
            
            function callbackajaxGrabar(ajaxResponseText){
                try {
                    var doc=objAjax.domParse(ajaxResponseText);     
                    //alert(ajaxResponseText);
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        revisarEstilos(); 
                    }
                }
                catch (e) {
                    if (isDebugAjaxEnabled=="true")
                        alert(e.name+" "+e.message);
                }
            }
            function f_but_9901628(){
                var qs="operation=ajax_setcestado";
                if(confirm("<axis:alt c="VALIDARMANUAL" f="axisint003" lit="9901629"/>")){
                    qs=qs+"&SPROCES="+objDom.getValorPorId("SPROCES")+"&NLINEA="+objDom.getValorPorId("NLINEA");
                    objAjax.invokeAsyncCGI("modal_axisint003.do", callbackajaxCestado, qs, this, objJsMessages.jslit_cargando);        
                }
            }
            function callbackajaxCestado(ajaxResponseText){
                try {
                    var doc=objAjax.domParse(ajaxResponseText);     
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        parent.fcallbackajaxCestado(objDom.getValorPorId("NLINEA"));
                        revisarEstilos(); 
                    }
                }
                catch (e) {
                    if (isDebugAjaxEnabled=="true")
                        alert(e.name+" "+e.message);
                }
            }
        </script>
    </head>
 <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_aceptar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="modal_axisint003.do" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
            <input type="hidden" name="SPROCES" id="SPROCES" value="${__formdata.SPROCES}"/>
            <input type="hidden" name="CPROCESO" id="CPROCESO" value="${__formdata.CPROCESO}"/>
            <input type="hidden" name="NLINEA" id="NLINEA" value="${__formdata.NLINEA}"/>
            <input type="hidden" name="CVALOR" id="CVALOR" value="${__formdata.CVALOR}"/>
            <input type="hidden" name="CNOMBRE" id="CNOMBRE" value="${__formdata.CNOMBRE}"/>
            
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="lit_form" f="axisint003" lit="9901264"/></c:param>
                <c:param name="producto"><axis:alt c="lit_form" f="axisint003" lit="9901264"/></c:param>
                <c:param name="form">axisint003</c:param>
            </c:import>
            <!-- Area de campos  -->
            
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
            <td>
            <axis:visible c="DSP_TABLAINTERMEDIA" f="axisint003">
                <div class="separador">&nbsp;</div>
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt c="POSTFLECHA" f="axisint003" lit="9901264"/></div>
                <div class="separador">&nbsp;</div>
                <!--campos-->
                <table border="0" class="area" align="left" style="width:100%">
                    <tr>
                        <td>
                            <c:set var="title1"><axis:alt c="TITULO2" f="axisint003" lit="109373"/></c:set>
                            <c:set var="title2"><axis:alt c="TITULO3" f="axisint003" lit="101159"/></c:set>
                            <div class="displayspacePersonas">
                                <display:table name="${__formdata.OBTABLA.INFO_TABLA}" id="tablaIntermedia" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                    requestURI="modal_axisint003.do?operation=form&paginar=true">                                    
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_INFO.NOMBRE_COLUMNA" headerClass="sortable fixed"  media="html" autolink="false" >
                                    <div class="dspText" id=CNOMBREx>${tablaIntermedia.OB_IAX_INFO.NOMBRE_COLUMNA}</div>
                                    </display:column>                          
                                    <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_INFO.VALOR_COLUMNA" headerClass="sortable fixed" media="html" autolink="false" >
                                    <div class="dspText">
                                    <c:choose>
                                    <c:when test="${tablaIntermedia.OB_IAX_INFO.TIPO_COLUMNA == 'XMLTYPE'}">
                        
                                     <textarea onchange="f_grabar('${tablaIntermedia.OB_IAX_INFO.NOMBRE_COLUMNA}',this,'${tablaIntermedia.OB_IAX_INFO.TIPO_COLUMNA}')" rows="8" class="campo campotexto" style="width:100%;"  name="CVALORx" id="CVALORx">${tablaIntermedia.OB_IAX_INFO.VALOR_COLUMNA}</textarea>
                                    
                                    
                                    </c:when>
                                    <c:otherwise>
                                    <input onchange="f_grabar('${tablaIntermedia.OB_IAX_INFO.NOMBRE_COLUMNA}',this,'${tablaIntermedia.OB_IAX_INFO.TIPO_COLUMNA}')" type="text" class="campowidthinput campo campotexto" id="CVALORx" name="CVALORx" size="15" 
                                    <c:if test="${tablaIntermedia.OB_IAX_INFO.SELECCIONADO == '0'}"> readonly='true'</c:if>
                                                <axis:atr f="axisint003" c="CVALORx" a="modificable=true"/> value='${tablaIntermedia.OB_IAX_INFO.VALOR_COLUMNA}'/>
                                                
                                    </c:otherwise>
                                    </c:choose>
                                     </div>
                                                
                                    </display:column>
                                </display:table>
                            </div>
                        </td>
                    </tr>
                </table>
            </axis:visible> 
            </td>
            </tr>
            </table>
     </form>

<c:import url="../include/botonera_nt.jsp">
           <c:param name="f">axisint003</c:param>
            <c:param name="__botones"><axis:ocultar f="axisint003" c = "BT_CANCELAR" dejarHueco="false">cancelar</axis:ocultar><axis:ocultar f="axisint003" c = "BT_ACEPTAR" dejarHueco="false">,aceptar</axis:ocultar><axis:ocultar f="axisint003" c = "BT_MANUAL" dejarHueco="false">,9901628</axis:ocultar></c:param>

</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>