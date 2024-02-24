<%--
      NOMBRE:    axisage014.jsp
      @author <a href = "mailto:joan_torres@csi-ti.com">Joan Torres</a>
      Fecha: 24/10/2011
      PROPÓSITO (descripción pantalla):  Mantenimiento productos para la participació de utilidades
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        24/10/2011   JTS(iniciales)     1. 19169: LCOL_C001 - Campos nuevos a añadir para Agentes.

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
        
        <!--Inicio Sólo si vamos a tener un campo fecha !-->
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
        <!-- fin Sólo si vamos a tener un campo fecha !-->
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
           var vcactivi = '';
           
           function f_onload(){
               f_cargar_propiedades_pantalla();
               vcactivi = '${__formdata['CACTIVI']}';
               <c:if test="${resultadoOK=='OK'}" >
                    //alert("<axis:alt f='axisage014' c='ALERT' lit='1000405' />");
                    parent.f_cerrar_modal('axisage014');
               </c:if>
           }
            
           function f_but_aceptar() {
                if (objValidador.validaEntrada()){
                    var SPRODUC = document.miForm.SPRODUC.value;
                    var CACTIVI = document.miForm.CACTIVI.value;
                    objUtiles.ejecutarFormulario("modal_axisage014.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
           }  
           
           function f_but_cancelar(){
               parent.f_cerrar_modal('axisage014');
           }
           
           function f_cargar_productos(){
                CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
                 if (!objUtiles.estaVacio (CRAMO) ){
                    objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                }else
                objDom.setValorComponente(document.miForm.CRAMO, null);
                url ="operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO);
                url += "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value;
                objAjax.invokeAsyncCGI("modal_axisage014.do", callbackAjaxCargarProductos, url, this, objJsMessages.jslit_cargando);
            }   
        
            function callbackAjaxCargarProductos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    
                    var SPRODUCCombo = document.miForm.SPRODUC;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisage014" c="BLANCO" lit="108341"/> - ', SPRODUCCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                        }
                   

                }
                f_cargar_actividades();
            } 
           
           function f_cargar_actividades(){
                if (document.getElementById('CACTIVI')!=null){
                    //CCOMPANI
                    CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
                     if (!objUtiles.estaVacio (CRAMO) ){
                        objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                    objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                    }else
                    objDom.setValorComponente(document.miForm.CRAMO, null);
                    url ="operation=ajax_busqueda_actividades&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO);
                    url += "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value;
                    url += "&SPRODUC="+objDom.getValorComponente(document.miForm.SPRODUC);
                    objAjax.invokeAsyncCGI("modal_axisage014.do", callbackAjaxCargarActividades, url, this, objJsMessages.jslit_cargando);
                }
            } 
            
            function callbackAjaxCargarActividades (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("OB_IAX_PRODACTIVIDADES");
                    var CACTIVICombo = document.miForm.CACTIVI;     
                    objDom.borrarOpcionesDeCombo(CACTIVICombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisage014" c="BLANCO" lit="108341"/> - ', CACTIVICombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var CACTIVI = objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CACTIVI"), 0, 0);
                            var TITULO = objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TACTIVI"), 0, 0);
                            objDom.addOpcionACombo(CACTIVI, TITULO, CACTIVICombo, i+1);
                        }
                }
                if (!objUtiles.estaVacio(vcactivi)) {
                    document.miForm.CACTIVI.value = vcactivi; 
                    vcactivi = '';
                }
            } 
            
        </script>
    </head>
 <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
            <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
            <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="LIT_FORM" f="axisage014" lit="9902555"/></c:param>
                <c:param name="producto"><axis:alt c="LIT_FORM" f="axisage014" lit="9902555"/></c:param>
                <c:param name="form">axisage014</c:param>
            </c:import>
            <!-- Area de campos  -->

            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                                <td class="campocaja" colspan="4">
                                    <div class="titulo">
                                        <img src="images/flecha.gif"/><axis:alt c="DSP_TITULO" f="axisage014" lit="9902555"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <%-- Tipo agente --%>
                                <td class="titulocaja" >
                                    <b><axis:alt f="axisage014" c="CTIPAGE" lit="100584"/></b>
                                </td>
                            </tr>
                            <tr>
                                <%-- Código agente --%>
                                <td class="campocaja" colspan="3" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" 
                                    value="${__formdata.CAGENTE}" name="CAGENTE" id="CAGENTE" <axis:atr f="axisage014" c="CAGENTE"/>
                                    style="width:8%;" title="<axis:alt f="axisage014" c="CAGENTE" lit="9000531"/>" readonly="readonly" >                             

                                <%-- Código agente --%>
                                    <input type="text" class="campowidthinput campo campotexto" size="15" 
                                    value="${__formdata.TAGENTE}" name="TAGENTE" id="TAGENTE" 
                                    style="width:50%;" title="<axis:alt f="axisage014" c="TAGENTE" lit="100584"/>" readonly="readonly"/>
                                </td> 
                            </tr>
                            
                            <tr>
                                <td class="titulocaja" >
                                    <b><axis:alt f="axisage014" c="CRAMO" lit="100784" /></b>
                                </td>
                                <td class="titulocaja" >
                                    <b><axis:alt f="axisage014" c="SPRODUC" lit="100829" /></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisage014" c="CACTIVI" lit="103481" /></b>
                                </td>
                            </tr> 
                            <tr>
                                <td class="campocaja"> 
                                    <select name = "ramoProducto" id="ramoProducto" id ="ramoProducto" size="1" onchange="f_cargar_productos()" class="campowidthselect campo"  obligatorio="true">
                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage014" c="BLANCO" lit="108341"/> - </option>
                                        <c:forEach var="ramos" items="${axisctr_listaRamos}">
                                            <option value = "${ramos.CRAMO}/${ramos.TRAMO}"
                                                <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>
                                                ${ramos.TRAMO}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>                           
                                <td class="campocaja" > 
                                    <select name = "SPRODUC" id ="SPRODUC" size="1" onchange="f_cargar_actividades()" class="campowidthselect campo campotexto"  obligatorio="true">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage014" c="BLANCO" lit="108341" /> - </option>
                                        <c:forEach items="${productos}" var="item">
                                            <option value = "${item.SPRODUC}" <c:if test="${__formdata['SPRODUC']==item.SPRODUC}">selected</c:if> >${item.TTITULO}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td class="campocaja">
                                    <select name="CACTIVI" id ="CACTIVI" size="1" onchange="" class="campowidthselect campo campotexto"  
                                            obligatorio="true" title="<axis:alt f='axisage014' c='CACTIVI' lit='103481'/>">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage014" c="BLANCO" lit="108341" /> - </option>
                                        <c:forEach items="${actividades}" var="item">
                                            <option value = "${item.OB_IAX_PRODACTIVIDADES.CACTIVI}" <c:if test="${__formdata['CACTIVI']==item.OB_IAX_PRODACTIVIDADES.CACTIVI}">selected</c:if> >${item.OB_IAX_PRODACTIVIDADES.TACTIVI}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
     </form>
<c:import url="../include/botonera_nt.jsp">
           <c:param name="f">axisage014</c:param>
            <c:param name="__botones">
                cancelar,aceptar
            </c:param>
</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>
