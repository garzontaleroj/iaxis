<%/**
*  Fichero: axispro019.jsp
*  @author <a href="mailto:pfeliu@csi-ti.com">Pablo Feliu</a>
*   
*  Modal alta de productos. 
*
*  REVISIONES:
*     Ver        Fecha        Autor             Descripción
*     ---------  ----------  ---------------  ------------------------------------
*     1.0        27/07/2010   PFA             1. Creación de la pantalla. Bug.15513
*/
%>


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
                <c:if test="${!empty __formdata.SPRODUC}">
                    parent.f_aceptar_axispro019(${__formdata.SPRODUC});
                </c:if>
            }
            
           
           
            function f_but_aceptar() {
                if(objValidador.validaEntrada()){
                    objUtiles.ejecutarFormulario("modal_axispro019.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);    
                }
            }
           
            function f_but_cancelar() {
                parent.f_cerrar_modal('axispro019');
            }
            
            function f_llenar_ramos(CEMPRES){
                objAjax.invokeAsyncCGI("modal_axispro019.do", callbackAjaxRecuperarRamos, "operation=ajax_busqueda_ramos&CEMPRES="+CEMPRES, this, objJsMessages.jslit_actualizando_registro);
            }
            
    
            function callbackAjaxRecuperarRamos(ajaxResponseText){
                try {  
                    var doc = objAjax.domParse(ajaxResponseText);
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {                                
                        var elementos = doc.getElementsByTagName("element");
                        var modelocombo = document.miForm.RAMO;     
                        objDom.borrarOpcionesDeCombo(modelocombo);
                        if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                            var elementos = doc.getElementsByTagName("element");
                            var modelocombo = document.miForm.RAMO;     
                            objDom.borrarOpcionesDeCombo(modelocombo);
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "- <axis:alt f="axispro019" c="SNV_COMBO" lit="108341"/> -", modelocombo, 0);
                            for (i = 0; i < elementos.length; i++) {
                                var codigo = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CRAMO")[0]) ?
                                             objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CRAMO"), 0, 0) : "";
                                var desc   = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("TRAMO")[0]) ?
                                             objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TRAMO"), 0, 0): "";
                                objDom.addOpcionACombo(codigo, desc, modelocombo, i+1);
                            }
                            
                            
                            
                             elementos = doc.getElementsByTagName("element");
                             modelocombo = document.miForm.ramoProducto;     
                            objDom.borrarOpcionesDeCombo(modelocombo);
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "- <axis:alt f="axispro019" c="SNV_COMBO" lit="108341"/> -", modelocombo, 0);
                            for (i = 0; i < elementos.length; i++) {
                                var codigo = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CRAMO")[0]) ?
                                             objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CRAMO"), 0, 0) : "";
                                var desc   = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("TRAMO")[0]) ?
                                             objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TRAMO"), 0, 0): "";
                                objDom.addOpcionACombo(codigo, desc, modelocombo, i+1);
                            }
                                
                        }
                        if (elementos.length == 0){
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "- <axis:alt f="axispro019" c="SNV_COMBO" lit="108341"/> -", modelocombo, 0);
                            var elementos = doc.getElementsByTagName("element");
                            var versioncombo = document.miForm.RAMO;     
                            objDom.borrarOpcionesDeCombo(versioncombo);
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "- <axis:alt f="axispro019" c="SNV_COMBO" lit="108341"/> -", versioncombo, 0);
                        }  
                        
                        if (elementos.length == 0){
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "- <axis:alt f="axispro019" c="SNV_COMBO" lit="108341"/> -", modelocombo, 0);
                            var elementos = doc.getElementsByTagName("element");
                            var versioncombo = document.miForm.ramoProducto;     
                            objDom.borrarOpcionesDeCombo(versioncombo);
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "- <axis:alt f="axispro019" c="SNV_COMBO" lit="108341"/> -", versioncombo, 0);
                        } 
                        
                        
                        
                        
                    } 
                } 
                catch (e) {
                 //   if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
            }
            
            
            function f_cargar_productos(){
                CRAMO =  document.miForm.ramoProducto.value;
                url ="operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.ramoProducto);
                objAjax.invokeAsyncCGI("modal_axisctr019.do", callbackAjaxCargarProductos, url, this, objJsMessages.jslit_cargando);
      		  }      
        
       
        
            function callbackAjaxCargarProductos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    
                    var SPRODUCCombo = document.miForm.SPRODUC_COPY;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr019" c="SNV_COMBO" lit="108341"/> - ', SPRODUCCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                        }
                   

                }
               
            }            
            function f_cargar_ram(thiss){
                 document.miForm.ramoProducto.value = thiss;
                 f_cargar_productos();
            }
            
            function f_actualizar_check(thiss){
                thiss.value = thiss.checked ? 1 : 0;
            }
        </script>
    </head>
 <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_aceptar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
            <input type="hidden" id="CRAMO" name="CEMPRES2" value="${__formdata.CEMPRES}"/>
            <input type="hidden" id="TRAMO" name="TEMPRES" value="${__formdata.TEMPRES}"/>
            <input type="hidden" id="SPRODUC" name="SPRODUC" value="${__formdata.SPRODUC}"/>
                        <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
            <input type="hidden" id="CRAMO_COPY" name="CRAMO_COPY" value="${__formdata.CRAMO_COPY}"/>
            
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="lit_form" f="axispro019" lit="9901357"/></c:param>
                <c:param name="producto"><axis:alt c="lit_form" f="axispro019" lit="9901357"/></c:param>
                <c:param name="form">axispro019</c:param>
            </c:import>
            <!-- Area de campos  -->
            
            <div class="separador">&nbsp;</div>
            
            <axis:ocultar f="axispro019" c="TB_NVPRODUCTO" dejarHueco="false">
            <table id="TB_NVPRODUCTO" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <axis:ocultar f="axispro019" c="SEC1_NVPRODUCTO" dejarHueco="false">
                        <table class="seccion">
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                            </tr>
                            <tr>
                                <axis:ocultar f="axispro019" c="CEMPRES" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro019" c="CEMPRES" lit="101619" /></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axispro019" c="CRAMO" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt c="CRAMO" f="axispro019" lit="100784"/></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axispro019" c="CMODALI">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro019" c="CMODALI" lit="100943"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axispro019" c="CTIPSEG">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro019" c="CTIPSEG" lit="102098"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axispro019" c="CCOLECT">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro019" c="CCOLECT" lit="102424"/></b>
                                    </td>
                                </axis:ocultar>                                
                            </tr>
                            <tr>
                                <axis:ocultar f="axispro019" c="CEMPRES" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja">
                                        <select name = "CEMPRES" id="CEMPRES" style="width:95%;" size="1" onchange="f_llenar_ramos(this.value)" title="<axis:alt f="axispro019" c="CEMPRES" lit="101619"/>"
                                        <axis:atr f="axispro019" c="CEMPRES" a="modificable=true&obligatorio=true&isInputText=false"/> 
                                        class="campowidthselect campo campotexto">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro019" c="SNV_COMBO" lit="108341"/> - </option>
                                            <c:forEach var="lstEMP" items="${__formdata.listValores.lstEMP}">
                                                <option value = "${lstEMP.CEMPRES}"
                                                    <c:if test="${lstEMP.CEMPRES == __formdata.CEMPRES}">selected</c:if>>
                                                    ${lstEMP.TEMPRES}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar> 
                                <axis:ocultar f="axispro019" c="CRAMO" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja">
                                        <select name="RAMO" id ="RAMO" style="width:95%;" size="1" title="<axis:alt f="axispro019" c="CRAMO" lit="100784"/>"
                                        <axis:atr f="axispro019" c="RAMO" a="modificable=true&obligatorio=true&isInputText=false"/> 
                                        class="campowidthselect campo campotexto" onchange="f_cargar_ram(this.value)">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro019" c="SNV_COMBO" lit="108341"/> - </option>
                                        <c:forEach var="RAMO" items="${__formdata.RAMOS}">
                                            <option value="${RAMO.CRAMO}"
                                            <c:if test="${!empty __formdata.RAMO && RAMO.CRAMO == __formdata.RAMO}"> selected </c:if>>
                                            ${RAMO.TRAMO}</option>
                                        </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axispro019" c="CMODALI" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto"
                                        <axis:atr f="axispro019" c="CMODALI" a="modificable=true&obligatorio=true&formato=entero"/>
                                        style="width:93%" maxlength="2" value="${__formdata.CMODALI}" name="CMODALI" id="CMODALI"
                                        title="<axis:alt f="axispro019" c="CMODALI" lit="100943"/>"/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axispro019" c="CTIPSEG" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                        <axis:atr f="axispro019" c="CTIPSEG" a="modificable=true&obligatorio=true&formato=entero"/>
                                        style="width:93%;" maxlength="2" value="${__formdata.CTIPSEG}" name="CTIPSEG" id="CTIPSEG"
                                         title="<axis:alt f="axispro019" c="CTIPSEG" lit="102098"/>"/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axispro019" c="CCOLECT" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                        <axis:atr f="axispro019" c="CCOLECT" a="modificable=true&obligatorio=true&formato=entero"/>
                                        style="width:93%;" maxlength="2" value="${__formdata.CCOLECT}" name="CCOLECT" id="CCOLECT"
                                         title="<axis:alt f="axispro019" c="CCOLECT" lit="102424"/>"/>
                                    </td>
                                </axis:ocultar>                               
                            </tr>                    
                        </table>
                        </axis:ocultar>
                        <div class="separador">&nbsp;</div>    
                        <axis:ocultar f="axispro019" c="SEC2_NVPRODUCTO" dejarHueco="false">
                        <table class="seccion">
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                            </tr>
                            <tr>
                                <axis:ocultar f="axispro019" c="TTITULO" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro019" c="TTITULO" lit="100785" /></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axispro019" c="TROTULO" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt c="TROTULO" f="axispro019" lit="100727"/></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axispro019" c="CAGRPRO">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro019" c="CAGRPRO" lit="111471"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axispro019" c="CSUBPRO">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro019" c="CSUBPRO" lit="1000377"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axispro019" c="CTIPREB">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro019" c="CTIPREB" lit="102302"/></b>
                                    </td>
                                </axis:ocultar>                                
                            </tr>
                            <tr>                                
                                <axis:ocultar f="axispro019" c="TTITULO" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                        <axis:atr f="axispro019" c="TTITULO" a="modificable=true&obligatorio=true"/>
                                        style="width:93%;" maxlength="40" value="${__formdata.TTITULO}" name="TTITULO" id="TTITULO"
                                         title="<axis:alt f="axispro019" c="TTITULO" lit="100785"/>"/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axispro019" c="TROTULO" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                        <axis:atr f="axispro019" c="TROTULO" a="modificable=true&obligatorio=true"/>
                                        style="width:93%;" maxlength="15" value="${__formdata.TROTULO}" name="TROTULO" id="TROTULO"
                                         title="<axis:alt f="axispro019" c="TROTULO" lit="100727"/>"/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axispro019" c="CAGRPRO" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja">
                                        <select name = "CAGRPRO" id="CAGRPRO" style="width:95%;" size="1"  title="<axis:alt f="axispro019" c="CAGRPRO" lit="111471"/>"
                                        <axis:atr f="axispro019" c="CAGRPRO" a="modificable=true&obligatorio=true&isInputText=false"/> 
                                        class="campowidthselect campo campotexto">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro019" c="SNV_COMBO" lit="108341"/> - </option>
                                            <c:forEach var="lstGRUPPROD" items="${__formdata.listValores.lstGRUPPROD}">
                                                <option value = "${lstGRUPPROD.CATRIBU}"
                                                    <c:if test="${lstGRUPPROD.CATRIBU == __formdata.CAGRPRO}">selected</c:if>>
                                                    ${lstGRUPPROD.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axispro019" c="CSUBPRO" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja">
                                        <select name = "CSUBPRO" id="CSUBPRO" style="width:95%;" size="1"  title="<axis:alt f="axispro019" c="CSUBPRO" lit="1000377"/>"
                                        <axis:atr f="axispro019" c="CSUBPRO" a="modificable=true&obligatorio=true&isInputText=false"/> 
                                        class="campowidthselect campo campotexto">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro019" c="SNV_COMBO" lit="108341"/> - </option>
                                            <c:forEach var="lstSUBPRO" items="${__formdata.listValores.lstSUBPRO}">
                                                <option value = "${lstSUBPRO.CATRIBU}"
                                                    <c:if test="${lstSUBPRO.CATRIBU == __formdata.CSUBPRO}">selected</c:if>>
                                                    ${lstSUBPRO.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axispro019" c="CTIPREB" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja">
                                        <select name = "CTIPREB" id="CTIPREB" style="width:95%;" size="1"  title="<axis:alt f="axispro019" c="CTIPREB" lit="102302"/>"
                                        <axis:atr f="axispro019" c="CTIPREB" a="modificable=true&obligatorio=true&isInputText=false"/> 
                                        class="campowidthselect campo campotexto">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro019" c="SNV_COMBO" lit="108341"/> - </option>
                                            <c:forEach var="lstTIPREB" items="${__formdata.listValores.lstTIPREB}">
                                                <option value = "${lstTIPREB.CATRIBU}"
                                                    <c:if test="${lstTIPREB.CATRIBU == __formdata.CTIPREB}">selected</c:if>>
                                                    ${lstTIPREB.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>                           
                            </tr>                    
                        </table>
                        </axis:ocultar>
                        <div class="separador">&nbsp;</div>    
                        <axis:ocultar f="axispro019" c="SEC3_NVPRODUCTO" dejarHueco="false">
                        <table class="seccion">
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                            </tr>
                            <tr>
                                <axis:ocultar f="axispro019" c="CTIPGES" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt c="CTIPGES" f="axispro019" lit="140502"/></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axispro019" c="CTIPPAG">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro019" c="CTIPPAG" lit="101516"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axispro019" c="CDURACI">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro019" c="CDURACI" lit="1000120"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axispro019" c="CTARMAN">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro019" c="CTARMAN" lit="100772"/></b>
                                    </td>
                                </axis:ocultar><axis:ocultar f="axispro019" c="CTIPEFE" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro019" c="CTIPEFE" lit="1000470" /></b>
                                    </td>
                                </axis:ocultar>                                                                
                            </tr>
                            <tr>
                                <axis:ocultar f="axispro019" c="CTIPGES" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja">
                                        <select name = "CTIPGES" id="CTIPGES" style="width:95%;" size="1"  title="<axis:alt f="axispro019" c="CTIPGES" lit="140502"/>"
                                        <axis:atr f="axispro019" c="CTIPGES" a="modificable=true&obligatorio=true&isInputText=false"/> 
                                        class="campowidthselect campo campotexto">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro019" c="SNV_COMBO" lit="108341"/> - </option>
                                            <c:forEach var="lstTIPGES" items="${__formdata.listValores.lstTIPGES}">
                                                <option value = "${lstTIPGES.CATRIBU}"
                                                    <c:if test="${lstTIPGES.CATRIBU == __formdata.CTIPGES}">selected</c:if>>
                                                    ${lstTIPGES.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axispro019" c="CTIPPAG" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja">
                                        <select name = "CTIPPAG" id="CTIPPAG" style="width:95%;" size="1"  title="<axis:alt f="axispro019" c="CTIPPAG" lit="101516"/>"
                                        <axis:atr f="axispro019" c="CTIPPAG" a="modificable=true&obligatorio=true&isInputText=false"/> 
                                        class="campowidthselect campo campotexto">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro019" c="SNV_COMBO" lit="108341"/> - </option>
                                            <c:forEach var="lstTIPPAG" items="${__formdata.listValores.lstTIPPAG}">
                                                <option value = "${lstTIPPAG.CATRIBU}"
                                                    <c:if test="${lstTIPPAG.CATRIBU == __formdata.CTIPPAG}">selected</c:if>>
                                                    ${lstTIPPAG.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axispro019" c="CDURACI" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja">
                                        <select name = "CDURACI" id="CDURACI" style="width:95%;" size="1"  title="<axis:alt f="axispro019" c="CDURACI" lit="1000120"/>"
                                        <axis:atr f="axispro019" c="CDURACI" a="modificable=true&obligatorio=true&isInputText=false"/> 
                                        class="campowidthselect campo campotexto">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro019" c="SNV_COMBO" lit="108341"/> - </option>
                                            <c:forEach var="lstDURACI" items="${__formdata.listValores.lstDURACI}">
                                                <option value = "${lstDURACI.CATRIBU}"
                                                    <c:if test="${lstDURACI.CATRIBU == __formdata.CDURACI}">selected</c:if>>
                                                    ${lstDURACI.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axispro019" c="CTARMAN" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja">
                                        <select name = "CTARMAN" id="CTARMAN" style="width:95%;" size="1"  title="<axis:alt f="axispro019" c="CTARMAN" lit="100772"/>"
                                        <axis:atr f="axispro019" c="CTARMAN" a="modificable=true&obligatorio=true&isInputText=false"/> 
                                        class="campowidthselect campo campotexto">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro019" c="SNV_COMBO" lit="108341"/> - </option>
                                            <c:forEach var="lstTARMAN" items="${__formdata.listValores.lstTARMAN}">
                                                <option value = "${lstTARMAN.CATRIBU}"
                                                    <c:if test="${lstTARMAN.CATRIBU == __formdata.CTARMAN}">selected</c:if>>
                                                    ${lstTARMAN.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axispro019" c="CTIPEFE" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja">
                                        <select name = "CTIPEFE" id="CTIPEFE" style="width:95%;" size="1"  title="<axis:alt f="axispro019" c="CTIPEFE" lit="1000470"/>"
                                        <axis:atr f="axispro019" c="CTIPEFE" a="modificable=true&obligatorio=true&isInputText=false"/> 
                                        class="campowidthselect campo campotexto">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro019" c="SNV_COMBO" lit="108341"/> - </option>
                                            <c:forEach var="lstTIPEFE" items="${__formdata.listValores.lstTIPEFE}">
                                                <option value = "${lstTIPEFE.CATRIBU}"
                                                    <c:if test="${lstTIPEFE.CATRIBU == __formdata.CTIPEFE}">selected</c:if>>
                                                    ${lstTIPEFE.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>                              
                            </tr>                            
                        </table>
                        </axis:ocultar>
                    </td>
                </tr>
           
            </axis:ocultar>
            
            <tr>
            <td colspan="6">
            
            <table class="seccion" align="center" style="width:100%;">
             <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                            </tr>
                <tr>
                <tr>
             <axis:ocultar f="axispro019" c="TITULO" dejarHueco="false">
                                    <td class="titulocaja" colspan = "5">
                                     <div class="titulo">   <b><axis:alt f="axispro019" c="TITULO" lit="9902390" /></b>
                                    </div>
                                    </td>
                                </axis:ocultar>
                </tr>
                
                <tr>
             <axis:ocultar f="axispro019" c="TITULO" dejarHueco="false">
                                    <td class="titulocaja">
                                     <b><axis:alt c="CRAMO" f="axispro019" lit="100784"/></b>
                                
                                    </td>
                                </axis:ocultar>
                                
                                 <td class="titulocaja" colspan="2">
                                      <b><axis:alt f="axispro019" c="SPRODUC" lit="100829" /></b>
                            
                                    </td>
                                    
                                        <td class="titulocaja" >
                                      <b><axis:alt f="axispro019" c="PPARPRODUCTO" lit="1000045" /></b>
                            
                                    </td>
                </tr>
                
                
                    
             <axis:ocultar f="axispro019" c="CRAMO" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja">
                                        <select name = "ramoProducto" id="ramoProducto" style="width:200px;" size="1" onchange="f_cargar_productos()" class="campowidthselect campo">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr019" c="BLANCO" lit="108341"/> - </option>
                                            <c:forEach var="ramos" items="${__formdata.RAMOS}">
                                                <option value = "${ramos.CRAMO}"
                                                    <c:if test="${ramos.CRAMO == __formdata.ramoProducto}">selected</c:if>>
                                                    ${ramos.TRAMO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>                            
                                <td class="campocaja" colspan="2"> 
                                    <select name = "SPRODUC_COPY" id ="SPRODUC_COPY" size="1" class="campowidthselect campo campotexto">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr019" c="SNV_COMBO" lit="108341" /> - </option>
                                        <c:forEach items="${productos}" var="item">
                                            <option value = "${item.SPRODUC}" <c:if test="${__formdata['SPRODUC_COPY']==item.SPRODUC}">selected</c:if> >${item.TTITULO}</option>
                                        </c:forEach>
                                    </select>
                                </td>
            
            
            
             <axis:ocultar c="PPARPRODUCTO" f="axispro019" dejarHueco="false">
                                                <td class="campocaja" id="td_CHECK" >
                                                    <input onClick="f_actualizar_check(this)" 
                                                     <axis:atr f="axispro019" c="PPARPRODUCTO" a="modificable=true&obligatorio=false&isInputText=false"/>
                                                    <c:if test="${__formdata.PPARPRODUCTO == 1 || empty __formdata.PPARPRODUCTO}"> checked </c:if> 
                                                    type="checkbox" id="PPARPRODUCTO" name="PPARPRODUCTO" value="${__formdata.PPARPRODUCTO}" />
                                                </td>
                                            </axis:ocultar>
            
            
            
            
            </tr>
            </table>
            </td>
            </tr>
             </table>    
            
            
     </form>
       

<c:import url="../include/botonera_nt.jsp"><c:param name="f">axispro019</c:param><c:param name="f">axispro019</c:param>
           <c:param name="f">axispro019</c:param>
           <c:param name="__botones"><axis:ocultar f="axispro019" c = "BT_CANCELAR" dejarHueco="false">cancelar</axis:ocultar><axis:ocultar f="axispro019" c = "BT_ACEPTAR" dejarHueco="false">,aceptar</axis:ocultar> </c:param>

</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>