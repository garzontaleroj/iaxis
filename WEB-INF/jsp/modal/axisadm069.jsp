<%/*
*  Fichero: axisadm069.jsp
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
           parent.f_cerrar_modal('axisadm069');                      
        }
        
        function f_but_buscar() {
       
            if (objValidador.validaEntrada()) {
            
                var domiciliado = null;
                
                if(document.getElementById("DOMICILIADOSI").checked){
                    domiciliado = 1;
                }
                if(document.getElementById("DOMICILIADONO").checked){
                    domiciliado = 0;
                }
                if(document.getElementById("DOMICILIADOTODO").checked){
                    domiciliado = 2;
                }

                var params = "?buscar=true" + 
                             "&CEMPRES=" +  objDom.getValorPorId("CEMPRES") + 
                             "&CRAMO=" +  objDom.getValorPorId("CRAMO") + 
                             "&SPRODUC=" +  objDom.getValorPorId("SPRODUC") + 
                             "&FEMISIOINI=" +  objDom.getValorPorId("FEMISIOINI") +
                             "&FEMISIOFIN=" +  objDom.getValorPorId("FEMISIOFIN") +
                             "&SPERSON=" +  objDom.getValorPorId("SPERSON") +
                             "&DOMICILIADO=" +  domiciliado+
                             "&MEDIADOR=" +  objDom.getValorPorId("CAGENTE_0") +
                             "&PADFIN=" +  objDom.getValorPorId("CAGENTE_1") +
                             "&PADCOM=" +  objDom.getValorPorId("CAGENTE_2");                              
                parent.f_aceptar_modal('axisadm069', params);
            }
        }
        
        function f_onload() {
            f_cargar_propiedades_pantalla();
            
            var cempres =  "${__formdata.CEMPRES}"; 
            if(!objUtiles.estaVacio(cempres)){
                f_cargar_ramos();
            }
        }
        
        function f_onchange_empresa(CEMPRES) {
            // Recargar formulario para seleccionar los productos segun la empresa seleccionada            
           objDom.setValorPorId("CEMPRES", CEMPRES);
           objUtiles.ejecutarFormulario("modal_axisadm069.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
        }
        
        function f_formatdate(entrada,title){
            var jDate = new JsFecha();
            if(entrada.value.length>0){
                entrada.value=jDate.formateaFecha(entrada.value);
            
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    alert("<axis:alt c="aler" f="axisadm059" lit="1000421"/>");
                }
            }
        }

        /****************************************************************************************/
        /********************************** CALLBACK  *******************************************/
        /****************************************************************************************/
        function f_cargar_ramos(){
            var ccompani = objDom.getValorPorId("CEMPRES");
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
            
            objAjax.invokeAsyncCGI("modal_axisadm069.do", callbackAjaxCargarRamos, "operation=ajax_busqueda_ramos&CEMPRES=" + ccompani, this, objJsMessages.jslit_cargando);
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
                objAjax.invokeAsyncCGI("modal_axisadm069.do", callbackAjaxCargarProductos, url, this, objJsMessages.jslit_cargando);
        }      
        
        function callbackAjaxCargarRamos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var RAMOSCombo = document.miForm.ramoProducto;     
                    objDom.borrarOpcionesDeCombo(RAMOSCombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr019" c="COMBO_sv" lit="108341"/> - ', RAMOSCombo, 0);
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
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr019" c="SPRODUC" lit="108341"/> - ', SPRODUCCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                        }
                   
                }
            } 
        
        function f_cerrar_axisctr014() {
            objUtiles.cerrarModal("axisctr014")
        } 
        
        function f_abrir_axisctr014(tipage) {
            document.miForm.CTIPAGE_BUSC.value = tipage;
            objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=CTIPAGE_5_CTIPMED_5");
        }
        
        
        function f_aceptar_axisctr014 (CAGENTE){
            f_cerrar_axisctr014();
            objAjax.invokeAsyncCGI("modal_axisadm069.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
        }
        
        function f_actualizar_agente (tipage){
            document.miForm.CTIPAGE_BUSC.value = tipage;
            objAjax.invokeAsyncCGI("modal_axisadm069.do", callbackAjaxActualizarAgente, "operation=act_agente&CAGENTE=" + document.getElementById("CAGENTE_"+tipage).value+"&CONDICION=CTIPAGE_5_CTIPMED_5", this, objJsMessages.jslit_actualizando_registro);
        }
        
        function callbackAjaxCambiarAgente(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                objDom.setValorPorId("CAGENTE_"+document.getElementById("CTIPAGE_BUSC").value, CAGENTEformateado);
                objDom.setValorPorId("NOMBRE_"+document.getElementById("CTIPAGE_BUSC").value, NOMBREformateado);
            }
        }
        
        function callbackAjaxActualizarAgente(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            var elementos = doc.getElementsByTagName("element");
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                    var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                    var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                    objDom.setValorPorId("CAGENTE_"+document.getElementById("CTIPAGE_BUSC").value, CAGENTEformateado);
                    objDom.setValorPorId("NOMBRE_"+document.getElementById("CTIPAGE_BUSC").value, NOMBREformateado);
                }else{
                    
                    objDom.setValorPorId("CAGENTE_"+document.getElementById("CTIPAGE_BUSC").value,""); 
                    objDom.setValorPorId("NOMBRE_"+document.getElementById("CTIPAGE_BUSC").value,"");
                }
            }else 
                objDom.setValorPorId("NOMBRE_"+document.getElementById("CTIPAGE_BUSC").value,""); 
        }
        
        /*axisper021 i axisper022x*/
        function f_abrir_axisper021 () {
            objUtiles.abrirModal("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CONDICION=PER_PREAVISO&CAGENTE="+document.miForm.CAGENTE.value);
        } 
        
        function f_cerrar_axisper021(){
           objUtiles.cerrarModal("axisper021");
        }  
        
        function f_cerrar_modalespersona(modal){
          objUtiles.cerrarModal(modal);
        } 
        
        function f_aceptar_persona(SPERSON,CAGENTE, SNIP, modal){
           f_cerrar_axisper021();

           document.miForm.SNIP.value = SNIP;
           document.miForm.SPERSON.value = SPERSON;
           document.miForm.CAGENTE.value = CAGENTE;
           objAjax.invokeAsyncCGI("modal_axisadm069.do?SPERSON="+SPERSON+"&CAGENTE="+CAGENTE, callbackAjaxActualitzaPersona, "operation=ajax_actualiza_persona", this, objJsMessages.jslit_cargando);
        }

        function callbackAjaxActualitzaPersona (ajaxResponseText) {
            try{
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {  
                
                    var TNOMBRE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0) : "");  
                    var TAPELLI1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0) : "");                    
                    var TAPELLI2 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI2")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0) : "");                    
                    var NNUMIDE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NNUMIDE")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0) : ""); 
                    var SPERSON = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("SPERSON")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0) : ""); 

                     objDom.setValorPorId("NNUMIDE",NNUMIDE);
                     objDom.setValorPorId("NOMBRE", TNOMBRE+' '+ TAPELLI1 +' '+ TAPELLI2);
                     objDom.setValorPorId("SPERSON", SPERSON);
                }          
            }catch(e){}
        }
        
            function f_existe_persona(NNUMIDE){
                 objAjax.invokeAsyncCGI("modal_axisadm069.do", callbackajaxexistePersona, 
                  "operation=ajax_existe_persona&NNUMIDE=" + NNUMIDE+"&CAGENTE="+document.miForm.CAGENTE.value , this, objJsMessages.jslit_actualizando_registro);
            }
            
             function callbackajaxexistePersona(ajaxResponseText) {
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var PSPERSON_NEW = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("PSPERSON_NEW")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("PSPERSON_NEW"), 0, 0) : "");                    
                    if (!objUtiles.estaVacio(PSPERSON_NEW)){
                        var cagente = "${__formdata.CAGENTE}";
                        objUtiles.abrirModal("axisper021","src","modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&faceptar=f_aceptar_axisper021&NNUMNIF="+document.miForm.NNUMIDE.value+"&CAGENTE="+cagente+"&CONSULT_INI=1&CONDICION=PER_PREAVISO");
                    }else{
                        objDom.setValorPorId("NNUMIDE","");
                        objDom.setValorPorId("NOMBRE", "");
                        objDom.setValorPorId("SPERSON", "");
                    }
                }
            }  
        
    </script>
  </head>
  
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axisadm069.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisadm069" c="TITULO" lit="9903586"/></c:param>
            <c:param name="formulario"><axis:alt f="axisadm069" c="TITULO" lit="9903586"/></c:param>
            <c:param name="form">axisadm069</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisadm069" c="TIT_AXISCTR014" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt c="TITULO_021" f="axisadm069" lit="1000235"/></c:param>
            <c:param name="nid" value="axisper021"/>
        </c:import>
            
        <input type="hidden" name="CTIPAGE_BUSC" id="CTIPAGE_BUSC" value="${__formdata.CTIPAGE_BUSC}"/>  
        
        <input type="hidden" id="operation" name="operation" value=""/>         
        <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
        <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
        <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
        <%--input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/--%>
        <input type="hidden" id="SNIP" name="SNIP" value="${__formdata.SNIP}"/>
        <input type="hidden" id="CAGENTE" name="CAGENTE" value="${__formdata.CAGENTE}"/>
        
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
                        <axis:ocultar f="axisadm069" c="CEMPRES" dejarHueco="false">
                            <td class="titulocaja" colspan="2">
                                <b><axis:alt f="axisadm069" c="EMPRESA" lit="101619"/></b> <%-- Empresa --%>
                            </td>
                        </axis:ocultar>
                        
			<axis:ocultar f="axisadm069" c="CRAMO" dejarHueco="false"> <!-- TODO C -->
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm069" c="CRAMO" lit="100784"></axis:alt></b>
                            </td>
                        </axis:ocultar>
                            <td class="titulocaja" colspan="2">
                                <b><axis:alt f="axisadm069" c="PRODUCTE" lit="100829"/></b> <%-- Producte --%>
                            </td>
                       
                        </tr>
                        <tr>
                           <axis:ocultar f="axisadm069" c="CEMPRES" dejarHueco="false">
                            <td class="campocaja" colspan="2">                                
                                <select name="CEMPRES" id="CEMPRES" onchange="f_onchange_empresa(this.value)" <axis:atr f="axisadm069" c="CEMPRES" a="obligatorio=false&isInputText=false"/>  size="1" class="campowidthselect campo campotexto" style="width:94%;">&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm069" c="BLANCO" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTEMPRESAS}">
                                        <option value = "${element.CEMPRES}"
                                        <c:if test="${__formdata.CEMPRES == element.CEMPRES}"> selected = "selected"</c:if> />
                                            ${element.TEMPRES} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                            		    
			    
			    <axis:ocultar f="axisadm069" c="CRAMO" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja">
                                        <select name = "ramoProducto" id="ramoProducto" style="width:200px;" id ="ramoProducto" size="1" onchange="f_cargar_productos()" class="campowidthselect campo">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm069" c="BLANCO" lit="1000348"/> - </option>
                                            <c:forEach var="ramos" items="${axisctr_listaRamos}">
                                                <option value = "${ramos.CRAMO}/${ramos.TRAMO}"
                                                    <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>
                                                    ${ramos.TRAMO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                            </axis:ocultar>
                            <td class="campocaja" colspan="2">                                
                                <select name="SPRODUC" id="SPRODUC" size="1" class="campowidthselect campo campotexto" style="width:97%;">&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm069" c="BLANCO" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTPRODUCTOS}">
                                        <option value = "${element.SPRODUC}"
                                        <c:if test="${__formdata.SPRODUC == element.SPRODUC}"> selected = "selected"</c:if> />
                                            ${element.TTITULO} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>   
                        </tr>
                        <tr>
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm069" c="CAGENTE_0" lit="9901930" /></b>
                            </td>
                        </tr>
                        <tr>
                            <td class="campocaja" colspan="3">
                                <input type="text" name="CAGENTE_0" title="<axis:alt f="axisadm069" c="CAGENTE_0" lit="9901930" />" id="CAGENTE_0" <axis:atr f="axisadm069" c="CAGENTE_0" a="obligatorio=true"/>
                                value="" class="campowidthinput campo campotexto" style="width:20%" formato="entero" onchange="javascript:f_actualizar_agente(0);" />
                                <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014(0)" style="cursor:pointer"/>
                                <input readonly="true" type="text" name="NOMBRE_0" id="NOMBRE_0" value="" class="campowidthinput campo campotexto" style="width:70%" />
                            </td>
                        </tr>
                        <tr>
                            <td class="titulocaja" colspan="3">
                                <b><axis:alt f="axisadm069" c="CAGENTE_1" lit="9903591" /></b>
                            </td>
                            <td class="titulocaja" colspan="3">
                                <b><axis:alt f="axisadm069" c="CAGENTE_2" lit="9903590" /></b>
                            </td>
                        </tr>
                        <tr>
                            <td class="campocaja" id="td_CAGENTE_1" colspan="3">
                                <select name="CAGENTE_1" id="CAGENTE_1" size="1" class="campowidthselect campo campotexto" style="width:96%;"
                                <axis:atr f="axisadm069" c="CAGENTE_1" a="obligatorio=false&isInputText=false"/>>&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm069" c="SELEC" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTAGRUPADOR}">
                                    <option value = "${element.CATRIBU}"
                                         <c:if test="${__formdata.CAGENTE_1 == element.CATRIBU}"> selected = "selected"</c:if>>
                                        ${element.TATRIBU}
                                    </option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td class="campocaja" id="td_CAGENTE_2" colspan="3">
                                <select name="CAGENTE_2" id="CAGENTE_2" size="1" class="campowidthselect campo campotexto" style="width:96%;"
                                <axis:atr f="axisadm069" c="CAGENTE_2" a="obligatorio=false&isInputText=false"/>>&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm069" c="SELEC" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTAGRUPADOR}">
                                    <option value = "${element.CATRIBU}"
                                         <c:if test="${__formdata.CAGENTE_2 == element.CATRIBU}"> selected = "selected"</c:if>>
                                        ${element.TATRIBU}
                                    </option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        
                        <tr>
                            <axis:ocultar f="axisadm069" c="TOMADOR" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisadm069" c="TOMADOR" lit="101027"/></b><!-- Nombre -->                                
                                </td>
                            </axis:ocultar>
                      </tr>
                      <tr>
                            <axis:ocultar f="axisadm069" c="TOMADOR" dejarHueco="false">
                                <td class="campocaja" colspan="3">
                                    <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}" class="campowidthinput campo campotexto" style="width:90%"
                                        <axis:atr f="axisadm069" c="SPERSON" a="modificable=true"/> /> 
                                    <input type="text" name="NNUMIDE" value="${__formdata.NNUMIDE}" class="campowidthinput campo campotexto" style="width:20%" 
                                    onchange="f_existe_persona(this.value)"/> 
                                        <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisper021()" style="cursor:pointer"/>  
                                    <input readonly="true" type="text" name="NOMBRE" value="${__formdata.NOMBRE}" class="campowidthinput campo campotexto" style="width:70%" /> 
                                </td>
                            </axis:ocultar>
                     </tr>
                        
                        <tr>
                                                    
                            <axis:ocultar f="axisadm069" c="FEMISIOINI" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm069" c="FEMISIOINI" lit="1000554"/></b> <%-- Data inici emissió --%>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm069" c="FEMISIOFIN" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm069" c="FEMISIOFIN" lit="1000555"/></b> <%-- Data fi emissió --%>
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                        
                                 
                            <axis:ocultar f="axisadm069" c="FEMISIOINI" dejarHueco="false">
                            <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:75%;"
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEMISIOINI}"/>" name="FEMISIOINI" id="FEMISIOINI"
                                title="<axis:alt f="axisadm069" c="FEMISIOINI2" lit="FEMISIOINI"/>"
                                onblur="javascript:f_formatdate(this,'')"
                                <axis:atr f="axisadm069" c="FEMISIOINI" a="formato=fecha"/> /><a style="vertical-align:middle;"><img
                                id="icon_FEMISIOINI" alt="<axis:alt f="axisadm069" c="FEMISIOINI3" lit="108341"/>" title="<axis:alt f="axisadm069" c="FEMISIOINI" lit="1000554"/>" src="images/calendar.gif"/></a>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm069" c="FEMISIOFIN" dejarHueco="false">
                            <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:75%;"
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEMISIOFIN}"/>" name="FEMISIOFIN" id="FEMISIOFIN"
                                title="<axis:alt f='axisadm069' c='FEMISIONFIN2' lit='FEMISIOFIN'/>"
                                onblur="javascript:f_formatdate(this,'')"
                                <axis:atr f="axisadm069" c="FEMISIOFIN" a="formato=fecha"/> /><a style="vertical-align:middle;"><img
                                id="icon_FEMISIOFIN" alt="<axis:alt f="axisadm069" c="CAMPO001" lit="108341"/>" title="<axis:alt f="axisadm069" c="CAMPO002" lit="1000555"/>" src="images/calendar.gif"/></a>
                            </td>
                            </axis:ocultar>
                         </tr>
                        
                        <tr>
                            <axis:ocultar f="axisadm069" c="DOMICILIADO" dejarHueco="false">                            
                                <td class="titulocaja" >
                                    <b><axis:alt f="axisadm069" c="DOMICILIADO" lit="9902262"/></b>                              
                                </td>
                            </axis:ocultar>
                        </tr>  
                       
                        <tr>

                            <axis:ocultar f="axisadm069" c="DOMICILIADOSI" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisadm069" c="DOMICILIADOSI" lit="9902445"/></b>                                
                                    <input type="radio" id="DOMICILIADOSI" name="DOMICILIADOSI" onclick="javascript: if (DOMICILIADOSI.checked){ DOMICILIADONO.checked =! DOMICILIADOSI.checked; DOMICILIADOTODO.checked =! DOMICILIADOSI.checked; }"                                
                                    <c:if test="${__formdata['DOMICILIADOSI'] == 'on'}"> checked </c:if>/>                                    
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm069" c="DOMICILIADONO" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisadm069" c="DOMICILIADONO" lit="101779"/></b>                                
                                    <input type="radio" id="DOMICILIADONO" name="DOMICILIADONO" onclick="javascript: if (DOMICILIADONO.checked) {DOMICILIADOSI.checked =! DOMICILIADONO.checked; DOMICILIADOTODO.checked =! DOMICILIADONO.checked; }"
                                    <c:if test="${__formdata['DOMICILIADONO'] == 'on'}">checked</c:if>/>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm069" c="DOMICILIADOTODO" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisadm069" c="DOMICILIADOTODO" lit="100934"/></b>                                
                                    <input type="radio" id="DOMICILIADOTODO" name="DOMICILIADOTODO" onclick="javascript: if (DOMICILIADOTODO.checked){ DOMICILIADOSI.checked =! DOMICILIADOTODO.checked; DOMICILIADONO.checked =! DOMICILIADOTODO.checked; }"
                                    <%--c:if test="${__formdata['DOMICILIADOTODO'] == 'on'}">checked</c:if--%>
                                    checked />
                                </td>
                            </axis:ocultar>
                      </tr>
                      
                    </table>

                </td>
            </tr>

        </table>
        
      
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="__botones">cancelar,buscar</c:param>
            <c:param name="f">axisadm069</c:param>
        </c:import>
        
    </form>
    <c:import url="../include/mensajes.jsp" />
    
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FEMISIOINI",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEMISIOINI", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FEMISIOFIN",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FEMISIOFIN",  
            singleClick    :    true,
            firstDay       :    1
        });       
    </script>

</body>
</html>