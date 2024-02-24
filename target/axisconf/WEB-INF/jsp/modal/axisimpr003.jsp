<%/*
*  Fichero: axisimpr003.jsp
*
*  @author <a href="mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  Fecha: 04/07/2008
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
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
    <c:import url="../include/carga_framework_js.jsp" />    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_but_cancelar() {
           parent.f_cerrar_modal('axisimpr003');                      
        }
        
        function f_but_buscar() {
       
            if (objValidador.validaEntrada()) {                        

                var params = "?buscar=true" + 
                             "&CCATEGORIA=" +  objDom.getValorPorId("CCATEGORIA") + 
                             "&CTIPO=" +  objDom.getValorPorId("CTIPO") + 
                             "&TFICHERO=" +  objDom.getValorPorId("TFICHERO") + 
                             "&FCREA=" +  objDom.getValorPorId("FCREA") +
                             "&CUSER=" +  objDom.getValorPorId("CUSER") +
                             "&FULTIM=" +  objDom.getValorPorId("FULTIMP") +  
                             "&CULTUSERIMP=" +  objDom.getValorPorId("CULTUSERIMP") +
                             "&CESTADO=" +  objDom.getValorPorId("CESTADO") +
                             "&SPROCES=" +  objDom.getValorPorId("SPROCES") +
                             "&CAGENTE=" +  objDom.getValorPorId("CAGENTE") +
                             "&CRAMO=" +  objDom.getValorPorId("CRAMO") +
                             "&SPRODUC=" +  objDom.getValorPorId("SPRODUC") +
                             "&NPOLIZA=" +  objDom.getValorPorId("NPOLIZA") +
                             "&NCERTIF=" +  objDom.getValorPorId("NCERT");      
                             
 
                parent.f_aceptar_modal('axisimpr003', params);
            }
        }
        
        function f_onload() {
            f_cargar_propiedades_pantalla();    
        }
        
     
        function f_formatdate(entrada,title){
            var jDate = new JsFecha();
            if(entrada.value.length>0){
                entrada.value=jDate.formateaFecha(entrada.value);
            
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    alert("<axis:alt c="aler" f="axisimpr003" lit="1000421"/>");
                }
            }
        }
        
            function f_abrir_axisctr014() {
                objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
            }
            
            function f_cerrar_axisctr014() {
                objUtiles.cerrarModal("axisctr014")
            }    
            
            function f_aceptar_axisctr014 (CAGENTE){
                objDom.setValorPorId("CAGENTE", CAGENTE);
                f_cerrar_axisctr014();
                objAjax.invokeAsyncCGI("modal_axisimpr003.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            }
            
            function f_actualizar_agente(){
                 objAjax.invokeAsyncCGI("modal_axisimpr003.do", callbackAjaxCargarAgente, "operation=act_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE_TEXT), this, objJsMessages.jslit_cargando);
            }
            
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/    
        
            function callbackAjaxCambiarAgente(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                    var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                    objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado);
                    objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);
                }
            }
            
                 
            function callbackAjaxCargarAgente(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                var elementos = doc.getElementsByTagName("element");
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                        objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado); 
                        objDom.setValorPorId("CAGENTE", CAGENTEformateado); 
                        objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado); 
                    }else{
                        objDom.setValorPorId("NOMBRE_TEXT",""); 
                        objDom.setValorPorId("CAGENTE_TEXT","");
                        objDom.setValorPorId("CAGENTE","");
                    }
                }
                if (objUtiles.estaVacio(objDom.getValorPorId("CAGENTE_TEXT"))) {
                    var mensajesAlert = "<axis:alt f='axisimpr003' c='MENSAAGE' lit='9903266'/>";
                    alert(mensajesAlert);
                }
            }
            
            function f_cargar_ramos(){
                var ccompani = objDom.getValorPorId("CCOMPANI");
                if (!objUtiles.estaVacio(ccompani)) {
                    if (document.getElementById('ramoProducto')!= null){
                        if (document.getElementById('ramoProducto').options[0]!=null){
                            document.getElementById('ramoProducto').value = document.getElementById('ramoProducto').options[0].value;
                        }    
                    }
                    
                    if (document.getElementById('SPRODUC')!= null){
                        if (document.getElementById('SPRODUC').options[0]!=null){
                            document.getElementById('SPRODUC').value = document.getElementById('SPRODUC').options[0].value;
                        }
                    }
                }
                objDom.setValorComponente(document.miForm.CRAMO, null);
                objDom.setValorComponente(document.miForm.TRAMO, null);
                objAjax.invokeAsyncCGI("modal_axisimpr003.do", callbackAjaxCargarRamos, "operation=ajax_busqueda_ramos&CCOMPANI=" + ccompani, this, objJsMessages.jslit_cargando);
            }
        
        
            function f_cargar_productos(){
                    CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
                     if (!objUtiles.estaVacio (CRAMO) ){
                        objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                    objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                    }else
                    objDom.setValorComponente(document.miForm.CRAMO, null);
                    url ="operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO);
                    url += "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+objDom.getValorComponente(document.miForm.tipo);
                    objAjax.invokeAsyncCGI("modal_axisimpr003.do", callbackAjaxCargarProductos, url, this, objJsMessages.jslit_cargando);
            }      
        
            function callbackAjaxCargarRamos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var RAMOSCombo = document.miForm.ramoProducto;     
                    objDom.borrarOpcionesDeCombo(RAMOSCombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisimpr003" c="COMBO_sv" lit="108341"/> - ', RAMOSCombo, 0);
                    var elementos = doc.getElementsByTagName("CRAMO");
                       for (i = 0; i < elementos.length; i++) {
                            var CRAMO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CRAMO"), i, 0);
                            var TRAMO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TRAMO"), i, 0);                                     
                            objDom.addOpcionACombo(CRAMO, TRAMO, RAMOSCombo, i+1);
                        }
                   f_cargar_productos();
                }                
            }  
        
            function callbackAjaxCargarProductos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    var SPRODUCCombo = document.miForm.SPRODUC;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisimpr003" c="SPRODUC" lit="108341"/> - ', SPRODUCCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                        }
                }
            }
       
    </script>
  </head>
  
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axisimpr003.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisimpr003" c="TITULO" lit="9904252"/></c:param>
            <c:param name="formulario"><axis:alt f="axisimpr003" c="TITULO" lit="9904252"/></c:param>
            <c:param name="form">axisimpr003</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisimpr003" c="TIT_AXISCTR014" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt c="TITULO_021" f="axisimpr003" lit="1000235"/></c:param>
            <c:param name="nid" value="axisper021"/>
        </c:import>
            
        <input type="hidden" name="CTIPAGE_BUSC" id="CTIPAGE_BUSC" value="${__formdata.CTIPAGE_BUSC}"/>  
        <input type="hidden" name="CAGENTE" id="CAGENTE" value="${sessionScope.axisctr_agente.CODI}"/>
        <input type="hidden" id="operation" name="operation" value=""/>
        <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>       
        <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
        <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>       
        
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">            
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                        <tr>
                            <th style="width:15%;height:0%;"/>
                            <th style="width:15%;height:0%;"/>
                            <th style="width:20%;height:0%;"/>
                            <th style="width:15%;height:0%;"/>
                            <th style="width:15%;height:0%;"/>
                            <th style="width:20%;height:0%;"/>
                        </tr>
                        <tr>
                            <axis:visible f="axisimpr003" c="CAGENTE"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisimpr003" c="CAGENTE" lit="100584" /></b>
                                </td>
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisimpr003" c="TAGENTE" lit="105940" /></b>
                                </td>
                            </axis:visible>
                        
                            <axis:ocultar f="axisimpr003" c="CCATEGORIA" dejarHueco="false">
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisimpr003" c="CCATEGORIA" lit="9904258"/></b> <%-- Empresa --%>
                                </td>
                            </axis:ocultar>
                            
                            <axis:ocultar f="axisimpr003" c="CTIPO" dejarHueco="false"> <!-- TODO C -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axisimpr003" c="CTIPO" lit="100565"></axis:alt></b>
                                </td>
                            </axis:ocultar>                        
                        </tr>
                        <tr>
                           <axis:visible f="axisimpr003" c="CAGENTE"> 
                                <td class="campocaja">
                                    <input type="text" name="CAGENTE_TEXT" title="<axis:alt f="axisimpr003" c="CAGENTE" lit="100584" />" id="CAGENTE_TEXT" value="${sessionScope.axisctr_agente.CODI}" class="campowidthinput campo campotexto" style="width:70%" formato="entero"
                                    <axis:atr f="axisimpr003" c="CAGENTE_TEXT" a="modificable=true&obligatorio=false"/> onchange="f_actualizar_agente()" />
                                    <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                </td>
                                <td class="campocaja" colspan="2">    
                                    <input readonly="true" type="text" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${sessionScope.axisctr_agente.NOMBRE}" class="campowidthinput campo campotexto"/>
                                </td>
                                <input type="hidden" name="CAGENTE_TEXT_AUX" id="CAGENTE_TEXT_AUX" value="${sessionScope.axisctr_agente.CODI}" class="campowidthinput campo campotexto" style="width:70%" />
                           </axis:visible>
                           <axis:ocultar f="axisimpr003" c="CCATEGORIA" dejarHueco="false">
                                <td class="campocaja" colspan="2">                                
                                    <select name="CCATEGORIA" id="CCATEGORIA" <axis:atr f="axisimpr003" c="CCATEGORIA" a="obligatorio=false&isInputText=false"/>  size="1" class="campowidthselect campo campotexto" style="width:94%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisimpr003" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCATEGORIAS}">
                                            <option value = "${element.CCATEGORIA}" />
                                                ${element.TDESCATEGORIA} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>
                            		    
			                <axis:ocultar f="axisimpr003" c="CTIPO" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja">
                                        <select name = "CTIPO" id="CTIPO" style="width:200px;" id ="ramoProducto" size="1" class="campowidthselect campo">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisimpr003" c="BLANCO" lit="1000348"/> - </option>
                                            <c:forEach var="element" items="${__formdata.LISTVALORES.LSTTIPOS}">
                                                <option value = "${element.CATRIBU}" />
                                                    ${element.TATRIBU} 
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                            </axis:ocultar>                            
                        </tr>
                        <tr>
                            <axis:ocultar f="axisctr019" c="CRAMO" dejarHueco="false"> <!-- TODO C -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axisimpr003" c="CRAMO" lit="100784"></axis:alt></b>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisimpr003" c="SPRODUC">
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisimpr003" c="DESPRODUCTO" lit="100829" /></b>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisimpr003" c="POLIZA">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisimpr003" c="POLIZA" lit="101273" /></b>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisimpr003" c="NCERTIF">
                                <td class="titulocaja"  >
                                    <b><axis:alt f="axisimpr003" c="NCERTIF" lit="9900942"></axis:alt></b>
                                </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <axis:ocultar f="axisimpr003" c="CRAMO" dejarHueco="false"> <!-- TODO C -->
                                <td class="campocaja">
                                    <select name = "ramoProducto" id="ramoProducto" style="width:200px;" id ="ramoProducto" size="1" onchange="f_cargar_productos()" class="campowidthselect campo">
                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisimpr003" c="BLANCO" lit="108341"/> - </option>
                                        <c:forEach var="ramos" items="${axisctr_listaRamos}">
                                            <option value = "${ramos.CRAMO}/${ramos.TRAMO}">
                                                ${ramos.TRAMO}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>    
                            <axis:ocultar f="axisimpr003" c="SPRODUC">
                                <td class="campocaja" colspan="2"> 
                                    <select name = "SPRODUC" id ="SPRODUC" size="1" onchange="f_onchangeproductos(this.value)" class="campowidthselect campo campotexto">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisimpr003" c="SPRODUC" lit="108341" /> - </option>
                                        <c:forEach items="${productos}" var="item">
                                            <option value = "${item.SPRODUC}" <c:if test="${__formdata['SPRODUC']==item.SPRODUC}">selected</c:if> >${item.TTITULO}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisimpr003" c="POLIZA">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" style="width:90px" value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA" formato="entero" title="<axis:alt f="axisimpr003" c="NUPOLIZA" lit="100836"/>" size="15" 
                                    <axis:atr f="axisimpr003" c="NPOLIZA" a="modificable=true&isInputText=true"/> title="<axis:alt f="axisimpr003" c="NUPOLIZA" lit="100836"/>" />
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisimpr003" c="NCERTIF">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="8" style="width:40px" value="${__formdata.NCERT}" name="NCERT" id="NCERT"
                                    formato="entero" title="<axis:alt f="axisimpr003" c="CCERTIF" lit="101096"/>"/>
                                </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <td class="titulocaja" colspan="2">
                                <b><axis:alt f="axisimpr003" c="TFICHERO" lit="1000574" /></b>
                            </td>
                        </tr>
                        <tr>
                            <td class="campocaja" colspan="2">
                                <input type="text" name="tfichero" title="<axis:alt f="axisimpr003" c="TFICHERO" lit="1000574" />" id="TFICHERO" <axis:atr f="axisimpr003" c="TFICHERO" a="obligatorio=false"/>
                                value="" class="campowidthinput campo campotexto" style="width:100%" />                                
                            </td>
                        </tr>
                        <tr>
                            <axis:ocultar f="axisimpr003" c="FCREA" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisimpr003" c="FCREA" lit="9001983"/></b> <%-- Data inici emissió --%>
                            </td>
                            </axis:ocultar>
                            <td class="titulocaja" colspan="1">
                                <b><axis:alt f="axisimpr003" c="CUSER" lit="100894" /></b>
                            </td>
                        </tr>
                        <tr>                            
                            <axis:ocultar f="axisimpr003" c="FCREA" dejarHueco="false">
                            <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:75%;"
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCREA}"/>" name="FCREA" id="FCREA"
                                title="<axis:alt f="axisimpr003" c="FCREA" lit="FCREA"/>"
                                onblur="javascript:f_formatdate(this,'')"
                                <axis:atr f="axisimpr003" c="FCREA" a="formato=fecha"/> /><a style="vertical-align:middle;"><img
                                id="icon_FCREA" alt="<axis:alt f="axisimpr003" c="FCREA" lit="108341"/>" title="<axis:alt f="axisimpr003" c="FCREA" lit="1000554"/>" src="images/calendar.gif"/></a>
                            </td>
                            </axis:ocultar>
                            <td class="campocaja" colspan="1">
                                <input type="text" name="tfichero" title="<axis:alt f="axisimpr003" c="CUSER" lit="9901930" />" id="CUSER" <axis:atr f="axisimpr003" c="CUSER" a="obligatorio=false"/>
                                value="" class="campowidthinput campo campotexto" style="width:100%" />                                
                            </td>
                        </tr>                                                                
                        
                        <tr>
                                                    
                            <axis:ocultar f="axisimpr003" c="FULTIMP" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisimpr003" c="FULTIMP" lit="9904259"/></b> <%-- Data inici emissió --%>
                            </td>
                            </axis:ocultar>
                            <td class="titulocaja" colspan="1">
                                <b><axis:alt f="axisimpr003" c="CULTUSERIMP" lit="9904260" /></b>
                            </td>
                        </tr>
                        <tr>
                        
                                 
                            
                           <axis:ocultar f="axisimpr003" c="FULTIMP" dejarHueco="false">
                            <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:75%;"
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FULTIMP}"/>" name="FULTIMP" id="FULTIMP"
                                title="<axis:alt f="axisimpr003" c="FULTIMP" lit="FULTIMP"/>"
                                onblur="javascript:f_formatdate(this,'')"
                                <axis:atr f="axisimpr003" c="FULTIMP" a="formato=fecha"/> /><a style="vertical-align:middle;"><img
                                id="icon_FULTIMP" alt="<axis:alt f="axisimpr003" c="FULTIMP" lit="108341"/>" title="<axis:alt f="axisimpr003" c="FULTIMP" lit="1000554"/>" src="images/calendar.gif"/></a>
                            </td>
                            </axis:ocultar>
                            <td class="campocaja" colspan="1">
                                <input type="text" name="tfichero" title="<axis:alt f="axisimpr003" c="CULTUSERIMP" lit="9901930" />" id="CULTUSERIMP" <axis:atr f="axisimpr003" c="CULTUSERIMP" a="obligatorio=false"/>
                                value="" class="campowidthinput campo campotexto" style="width:100%" />                                
                            </td>
                         </tr>
                        
                        <tr>
                             <axis:ocultar f="axisimpr003" c="CESTADO" dejarHueco="false"> <!-- TODO C -->
                            <td class="titulocaja"  colspan="2">
                                <b><axis:alt f="axisimpr003" c="CESTADO" lit="100587"></axis:alt></b>
                            </td>
                        </axis:ocultar>
                        <td class="titulocaja">
                                <b><axis:alt f="axisimpr003" c="SPROCES" lit="1000576" /></b>
                            </td>
                        </tr>  
                       
                        <tr>

                            <axis:ocultar f="axisimpr003" c="CESTADO" dejarHueco="false"> <!-- TODO C -->
                            <td class="campocaja" colspan="2">                                
                                <select name="CESTADO" id="CESTADO" size="1" class="campowidthselect campo campotexto" style="width:97%;">&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisimpr003" c="BLANCO" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTESTADOS}">
                                        <option value = "${element.CATRIBU}" />                                       
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>   
                             </axis:ocultar>
                             <td class="campocaja" colspan="1">
                                <input type="text" name="tfichero" title="<axis:alt f="axisimpr003" c="SPROCES" lit="9901930" />" id="SPROCES" <axis:atr f="axisimpr003" c="SPROCES" a="obligatorio=false"/>
                                value="" class="campowidthinput campo campotexto" style="width:100%" />                                
                            </td>
                      </tr>
                      
                    </table>

                </td>
            </tr>

        </table>
        
      
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="__botones">cancelar,buscar</c:param>
            <c:param name="f">axisimpr003</c:param>
        </c:import>
        
    </form>
    <c:import url="../include/mensajes.jsp" />
    
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FCREA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FCREA", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FULTIMP",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FULTIMP",  
            singleClick    :    true,
            firstDay       :    1
        });       
    </script>

</body>
</html>