<%/*
*  Fichero: axisctr060.jsp
*
*  Fecha: 25/02/2009
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axisctr060" c="TITULO" lit="9001020" /></title> <%-- Selección pólizas de certificado cero --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
   
    <style type="text/css">
        .displayspaceMaximo {
            width:99.8%;
            height: expression( this.scrollHeight > 349 ? "350px" : "auto" );
            max-height:350px;
            overflow-x: hidden;
            overflow-y: auto;
            border: 1px solid #DDDDDD;
        }
    </style>

    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() { 
            f_cargar_propiedades_pantalla();
        }
        
        function f_but_cancelar() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr060", "cancelar", document.miForm, "_self");
        }
        
        function f_but_siguiente() {
            var hayChecked = objUtiles.f_GuardaCasillasChecked ("radioNPOLIZA");

            if (typeof hayChecked == 'boolean') 
                alert(objJsMessages.jslit_selecciona_registro);
            else {
            
                try{
                    var NCASO_BPM = document.miForm.NCASO_BPM.value;
                }catch(e){}
				
                try{
                    var NSOLICI_BPM = document.miForm.NSOLICI_BPM.value;
                }catch(e){}
                
                if(objUtiles.estaVacio(NCASO_BPM) && objUtiles.estaVacio(NSOLICI_BPM)){
                    objDom.setValorPorId("NPOLIZA", hayChecked);
                    objUtiles.ejecutarFormulario ("axis_axisctr060.do", "siguiente", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
                else{
                    if( (!objUtiles.estaVacio(NCASO_BPM) && objUtiles.estaVacio(NSOLICI_BPM)) || 
                        (objUtiles.estaVacio(NCASO_BPM) && !objUtiles.estaVacio(NSOLICI_BPM)))
                        alert("<axis:alt f='axisctr001' c='MENSAAGE' lit='9906096'/>"); 
                    else{
                        objDom.setValorPorId("NPOLIZA", hayChecked);
                        objUtiles.ejecutarFormulario ("axis_axisctr060.do", "siguiente", document.miForm, "_self", objJsMessages.jslit_cargando);
                    }
                }
            }
        }
        
        function f_seleccionar(NPOLIZA, goForward) {
            objDom.setValorPorId("NPOLIZA", NPOLIZA);
            
            try{
              var NCASO_BPM = document.miForm.NCASO_BPM.value;
            }catch(e){}
				
            try{
              var NSOLICI_BPM = document.miForm.NSOLICI_BPM.value;
            }catch(e){}
            
            if(objUtiles.estaVacio(NCASO_BPM) && objUtiles.estaVacio(NSOLICI_BPM)){
                if (goForward) {                
                    objUtiles.ejecutarFormulario ("axis_axisctr060.do", "siguiente", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }    
            else{
                if( (!objUtiles.estaVacio(NCASO_BPM) && objUtiles.estaVacio(NSOLICI_BPM)) || 
                        (objUtiles.estaVacio(NCASO_BPM) && !objUtiles.estaVacio(NSOLICI_BPM)))
                        alert("<axis:alt f='axisctr001' c='MENSAAGE' lit='9906096'/>"); 
                else{
                     objUtiles.ejecutarFormulario ("axis_axisctr060.do", "siguiente", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
        }
        function f_but_cerca(){
         if (objValidador.validaEntrada())
            objUtiles.ejecutarFormulario ("axis_axisctr060.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);        
        }
        
        function f_abrir_axisctr014(donde) {
                document.miForm.DONDE.value = donde;
                if(donde == 2)
                    objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=CTIPAGE_SUC");
                if(donde == 3)
                    objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=CTIPAGE_ADN");
                if(donde == 4)
                    objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=NUEVA_PRODUCCION");
            }
            
        function f_cerrar_axisctr014() {
                objUtiles.cerrarModal("axisctr014")
            } 
            
        function f_aceptar_axisctr014 (CAGENTE){
                objDom.setValorPorId("CAGENTE", CAGENTE);
                f_cerrar_axisctr014();
                objAjax.invokeAsyncCGI("axis_axisctr060.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            }
            
        function f_actualizar_agente(donde){
                 //alert("En actualizar agente");
             document.miForm.DONDE.value = donde;    
             if(donde == 2){    
                 if(document.miForm.CSUCURSAL_TEXT){
                    objAjax.invokeAsyncCGI("axis_axisctr060.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&DONDE=2&CAGENTE=" + objDom.getValorComponente(document.miForm.CSUCURSAL_TEXT), 
                                            this, objJsMessages.jslit_cargando);
				}else{
					objAjax.invokeAsyncCGI("axis_axisctr060.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&DONDE=2&CAGENTE=" + objDom.getValorComponente(document.miForm.CSUCURSAL_TEXT_AUX),
                                            this, objJsMessages.jslit_cargando);
                    
				
				}
             }
             if(donde == 3){    
                 if(document.miForm.CADN_TEXT){
                    objAjax.invokeAsyncCGI("axis_axisctr060.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&DONDE=3&CAGENTE=" + objDom.getValorComponente(document.miForm.CADN_TEXT),
                                            this, objJsMessages.jslit_cargando);
				}else{
					objAjax.invokeAsyncCGI("axis_axisctr060.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&DONDE=3&CAGENTE=" + objDom.getValorComponente(document.miForm.CADN_TEXT_AUX),  
                                            this, objJsMessages.jslit_cargando);
				
				}
             }
             if(donde == 4){    
                 if(document.miForm.CINTERMEDIARIO_TEXT){
                    objAjax.invokeAsyncCGI("axis_axisctr060.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&DONDE=4&CAGENTE=" + objDom.getValorComponente(document.miForm.CINTERMEDIARIO_TEXT),
                                            this, objJsMessages.jslit_cargando);
				}else{
					objAjax.invokeAsyncCGI("axis_axisctr060.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&DONDE=4&CAGENTE=" + objDom.getValorComponente(document.miForm.CINTERMEDIARIO_TEXT_AUX), 
                                            this, objJsMessages.jslit_cargando);
				
				}
             }
                
            }  
            
        function callbackAjaxCambiarAgente(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                var donde = document.miForm.DONDE.value;
                
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                
                if(donde == 2){
                    objDom.setValorPorId("CSUCURSAL_TEXT", CAGENTEformateado);
                    objDom.setValorPorId("CSUCURSAL", CAGENTEformateado);
                    objDom.setValorPorId("NOMBRE_SUCURSAL_TEXT", NOMBREformateado);
                }
                if(donde == 3){
                    objDom.setValorPorId("CADN_TEXT", CAGENTEformateado);
                    objDom.setValorPorId("CADN", CAGENTEformateado);
                    objDom.setValorPorId("NOMBRE_ADN_TEXT", NOMBREformateado);
                }
                if(donde == 4){
                    objDom.setValorPorId("CINTERMEDIARIO_TEXT", CAGENTEformateado);
                    objDom.setValorPorId("CINTERMEDIARIO", CAGENTEformateado);
                    objDom.setValorPorId("NOMBRE_INTER_TEXT", NOMBREformateado);
                }
                
                
                }
                /* TRATAMIENTO AGENTE LCF */
                //Al volver de cargar agente recargammos los ramos y el producto
             //    f_recargar_ramos();  /* TRATAMIENTO AGENTE LCF */       
              
                
            }
            
        function callbackAjaxCargarAgente(ajaxResponseText){
                
                var doc=objAjax.domParse(ajaxResponseText);
                 var donde = document.miForm.DONDE.value;
                var elementos = doc.getElementsByTagName("element");
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                   
                    if(donde == 2){
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                            var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                            var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                            objDom.setValorPorId("CSUCURSAL_TEXT", CAGENTEformateado);
                            objDom.setValorPorId("CSUCURSAL", CAGENTEformateado);
                            objDom.setValorPorId("NOMBRE_SUCURSAL_TEXT", NOMBREformateado);
                         }else{
                             objDom.setValorPorId("CSUCURSAL_TEXT", "");
                             objDom.setValorPorId("CSUCURSAL", "");
                            objDom.setValorPorId("NOMBRE_SUCURSAL_TEXT", "");
                        }
                      /*  if (objUtiles.estaVacio(objDom.getValorPorId("CSUCURSAL_TEXT"))) {
                            var mensajesAlert = "<axis:alt f='axisctr060' c='MENSAAGE' lit='9903266'/>";
                            alert(mensajesAlert);
                        }*/
                    
                    }
                    if(donde == 3){
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                            var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                            var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                            objDom.setValorPorId("CADN_TEXT", CAGENTEformateado);
                            objDom.setValorPorId("CADN", CAGENTEformateado);
                            objDom.setValorPorId("NOMBRE_ADN_TEXT", NOMBREformateado);
                         }else{
                             objDom.setValorPorId("CADN_TEXT", "");
                            objDom.setValorPorId("CADN", "");
                            objDom.setValorPorId("NOMBRE_ADN_TEXT", "");
                        }
                     /*   if (objUtiles.estaVacio(objDom.getValorPorId("CADN_TEXT"))) {
                            var mensajesAlert = "<axis:alt f='axisctr060' c='MENSAAGE' lit='9903266'/>";
                            alert(mensajesAlert);
                        }*/
                        
                    }
                    if(donde == 4){
                         if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                            var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                            var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                            objDom.setValorPorId("CINTERMEDIARIO_TEXT", CAGENTEformateado); 
                            objDom.setValorPorId("CINTERMEDIARIO", CAGENTEformateado); 
                            objDom.setValorPorId("NOMBRE_INTER_TEXT", NOMBREformateado); 
                         }else{
                             objDom.setValorPorId("NOMBRE_INTER_TEXT",""); 
                             objDom.setValorPorId("CINTERMEDIARIO_TEXT","");
                             objDom.setValorPorId("CINTERMEDIARIO","");
                        }
                   /*     if (objUtiles.estaVacio(objDom.getValorPorId("CINTERMEDIARIO_TEXT"))) {
                            var mensajesAlert = "<axis:alt f='axisctr060' c='MENSAAGE' lit='9903266'/>";
                            alert(mensajesAlert);
                        }*/
                    }
               
               
                }
             
            }    
            
            function f_abrir_axisctr213(){
                objUtiles.abrirModal("axisctr213","src","modal_axisctr213.do?operation=form&DONDE=AXISCTR060&CRAMOSEL="+document.miForm.CRAMO.value+"&SPRODUCSEL="+document.miForm.SPRODUC.value+"&NPOLIZASEL="+document.miForm.NPOLIZA.value);
            }
            
            function f_cerrar_axisctr213() {
                objUtiles.cerrarModal("axisctr213");
            }
            
            function f_aceptar_axisctr213(NNUMCASO,NCASO_BPM,NSOLICI_BPM){ 
                objUtiles.cerrarModal("axisctr213");
                document.miForm.NCASO_BPM.value = NCASO_BPM;
                document.miForm.NNUMCASO.value = NNUMCASO;
                document.miForm.NSOLICI_BPM.value = NSOLICI_BPM;
                f_cargar_casobpm(2);
            }
            
            function f_cargar_casobpm(donde){
                elemento = document.getElementById('NCASO_BPM');     
                var re = /^(-)?[0-9]*$/;     
                if (!re.test(elemento.value)) {    
                    document.miForm.NCASO_BPM.value = "";
                    alert("<axis:alt f='axisadm022' c='ERRORNUM' lit='1000150'/>");
                    
                }
                else{
                    if(donde == 1)
                        document.miForm.NNUMCASO.value = "";
                    //alert("Antes de recargar ramos");
                    if (!objUtiles.estaVacio (document.miForm.NCASO_BPM.value) ||
                        (!objUtiles.estaVacio (document.miForm.NCASO_BPM.value) &&
                         !objUtiles.estaVacio (document.miForm.NSOLICI_BPM.value)) ){
                         
                        NNUMCASO  = document.miForm.NNUMCASO.value;
                        NCASO_BPM = document.miForm.NCASO_BPM.value;
                        NSOLICI_BPM = document.miForm.NSOLICI_BPM.value;
                        document.miForm.NOMBRE_NCASO_BPM.value = "";
                        objAjax.invokeAsyncCGI("axis_axisctr060.do", callbackAjaxCargarCasoBPM, "operation=ajax_cargar_casobpm&NNUMCASO="+NNUMCASO+"&NCASO_BPM="+NCASO_BPM+"&NSOLICI_BPM="+NSOLICI_BPM , this, objJsMessages.jslit_cargando);
                    }
                }
            }
            
             function callbackAjaxCargarCasoBPM (ajaxResponseText){
                //alert(ajaxResponseText);
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("PTNOMCOM")[0])){
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PTNOMCOM"), 0, 0);
                        objDom.setValorPorId("NOMBRE_NCASO_BPM", NOMBREformateado); 
                    }else{
                        
                        objDom.setValorPorId("NOMBRE_NCASO_BPM",""); 
                    }
                    
                }
            } 
            
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisctr060" c="TITULO" lit="9001020" /></c:param>     <%-- Selección pólizas de certificado cero --%>
                <c:param name="formulario"><axis:alt f="axisctr060" c="TITULO" lit="9001020" /></c:param> <%-- Selección pólizas de certificado cero --%>
                <c:param name="form">axisctr060</c:param>
        </c:import>  
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr060" c="TIT_AXISCTR014" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisctr213|<axis:alt c="axisctr213_TITULO" f="axisctr060" lit="9906011"/></c:param>
        </c:import>
   
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="DONDE" id="DONDE" value="${__formdata.DONDE}"/>
        <input type="hidden" name="CINTERMEDIARIO" id="CINTERMEDIARIO" value="${__formdata.CINTERMEDIARIO}"/>
        <input type="hidden" name="CSUCURSAL" id="CSUCURSAL" value="${__formdata.CSUCURSAL}"/>
        <input type="hidden" name="CADN" id="CADN" value="${__formdata.CADN}"/>
        
        <input type="hidden" name="CRAMO" id="CRAMO" value="${__formdata.CRAMO}"/>
        <input type="hidden" name="SPRODUC" id="SPRODUC" value="${__formdata.SPRODUC}"/>
        <input type="hidden" name="NNUMCASO" id="NNUMCASO" value="${__formdata.NNUMCASO}"/>
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                <axis:ocultar c="DSP_FILTRE" f="axisctr060">
                  <div>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr060" c="TITULO_FILTRO" lit="1000178" /></div>
                        <table class="seccion">
                            <tr>
                                    <td>
                                        <table class="area" align="center"> 
                                            <tr>
                                                <th style="width:12%;height:0px"></th>
                                                <th style="width:12%;height:0px"></th>
                                                <th style="width:50%;height:0px"></th>
                                                <th style="width:26%;height:0px"></th>
                                            </tr>
                                            <tr>
                                                <axis:ocultar c="NPOLIZA" f="axisctr060">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr060" c="NPOLIZA" lit="100836"/></b>
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar c="NSOLICI" f="axisctr060" dejarHueco="true">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr060" c="NSOLICI" lit="9000875"/></b>
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar c="TBUSCAR" f="axisctr060">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr060" c="TBUSCAR" lit="105940"/></b>
                                                </td>                   
                                                </axis:ocultar>
                                            </tr>
                                            <tr>
                                                <axis:ocultar c="NPOLIZA" f="axisctr060">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA" formato="entero" title="<axis:alt f="axisctr060" c="NPOLIZA" lit="100836" />" size="15"/>
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar c="NSOLICI" f="axisctr060" dejarHueco="true">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NSOLICI}" name="NSOLICI" id="NSOLICI" formato="entero" title="<axis:alt f="axisctr060" c="NSOLICI" lit="9000875" />" size="15"/>
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar c="TBUSCAR" f="axisctr060">
                                                 <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata['TBUSCAR']}" name="TBUSCAR" id="TBUSCAR" size="15"/>
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar c="BT_BUSCAR" f="axisctr060">
                                                <td class="campocaja">
                                                <input type="button" class="boton"
                                                       id="but_anadir_tomador"
                                                       value='<axis:alt f="axisctr060" c="BT_BUSCAR" lit="100797"/>'
                                                       onclick="f_but_cerca()"/>
                                                </td>
                                                </axis:ocultar>
                                            </tr>
                                            <tr>
                                                <axis:ocultar f="axisctr060" c="CSUCURSAL"> 
                                                    <td class="titulocaja" colspan="2">
                                                        <b><axis:alt f="axisctr060" c="CSUCURSAL" lit="9002202" /></b>
                                                    </td>
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisctr060" c="TSUCURSAL" lit="105940" /></b>
                                                    </td>
                                                </axis:ocultar>
                                            </tr>
                                            <tr>
                                                <axis:ocultar f="axisctr060" c="CSUCURSAL"> 
                                                    <td class="campocaja"  colspan="2">
                                                        <input type="text" name="CSUCURSAL_TEXT" title="<axis:alt f="axisctr060" c="CSUCURSAL" lit="9002202" />" id="CSUCURSAL_TEXT" value="${__formdata.CSUCURSAL_TEXT}" class="campowidthinput campo campotexto" style="width:70%" formato="entero"
                                                        <axis:atr f="axisctr060" c="CSUCURSAL_TEXT" a="modificable=true&obligatorio=false"/> onchange="f_actualizar_agente(2)" />
                                                        <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014(2)" style="cursor:pointer"/>
                                                    </td>
                                                     <td class="campocaja">    
                                                        <input readonly="true" type="text" name="NOMBRE_SUCURSAL_TEXT" id="NOMBRE_SUCURSAL_TEXT" value="${__formdata.NOMBRE_SUCURSAL_TEXT}" class="campowidthinput campo campotexto"/>
                                                    </td>
                                                </axis:ocultar>
                                                <input type="hidden" name="CSUCURSAL_TEXT_AUX" id="CSUCURSAL_TEXT_AUX" value="${__formdata.CSUCURSAL_TEXT_AUX}" class="campowidthinput campo campotexto" style="width:70%" />
                                            </tr>
                                            <tr>
                                                <axis:ocultar f="axisctr060" c="CADN"> 
                                                    <td class="titulocaja" colspan="2">
                                                        <b><axis:alt f="axisctr060" c="CADN" lit="9902313" /></b>
                                                    </td>
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisctr060" c="TADN" lit="105940" /></b>
                                                    </td>
                                                </axis:ocultar>
                                            </tr>
                                            <tr>
                                                <axis:ocultar f="axisctr060" c="CADN"> 
                                                    <td class="campocaja"  colspan="2">
                                                        <input type="text" name="CADN_TEXT" title="<axis:alt f="axisctr060" c="CADN" lit="9902313" />" id="CADN_TEXT" value="" class="campowidthinput campo campotexto" style="width:70%" formato="entero"
                                                        <axis:atr f="axisctr060" c="CADN_TEXT" a="modificable=true&obligatorio=false"/> onchange="f_actualizar_agente(3)" />
                                                        <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014(3)" style="cursor:pointer"/>
                                                    </td>
                                                     <td class="campocaja">    
                                                        <input readonly="true" type="text" name="NOMBRE_ADN_TEXT" id="NOMBRE_ADN_TEXT" value="${__formdata.NOMBRE_ADN_TEXT}" class="campowidthinput campo campotexto"/>
                                                    </td>
                                                </axis:ocultar>
                                                <input type="hidden" name="CADN_TEXT_AUX" id="CADN_TEXT_AUX" value="${__formdata.CADN_TEXT_AUX}" class="campowidthinput campo campotexto" style="width:70%" />
                                            </tr>
                                             <tr>
                                                <axis:ocultar f="axisctr060" c="CINTERMEDIARIO"> 
                                                    <td class="titulocaja" colspan="2">
                                                        <b><axis:alt f="axisctr060" c="CINTERMEDIARIO" lit="9902363" /></b>
                                                    </td>
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisctr060" c="TINTERMEDIARIO" lit="105940" /></b>
                                                    </td>
                                                </axis:ocultar>
                                            </tr>
                                            <tr>
                                                <axis:ocultar f="axisctr060" c="CINTERMEDIARIO"> 
                                                    <td class="campocaja"  colspan="2">
                                                        <input type="text" name="CINTERMEDIARIO_TEXT" title="<axis:alt f="axisctr060" c="CINTERMEDIARIO" lit="9902363" />" id="CINTERMEDIARIO_TEXT" value="${__formdata.CINTERMEDIARIO_TEXT}" class="campowidthinput campo campotexto" style="width:70%" formato="entero"
                                                        <axis:atr f="axisctr060" c="CINTERMEDIARIO_TEXT" a="modificable=true&obligatorio=false"/> onchange="f_actualizar_agente(4)" />
                                                        <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014(4)" style="cursor:pointer"/>
                                                    </td>
                                                     <td class="campocaja">    
                                                        <input readonly="true" type="text" name="NOMBRE_INTER_TEXT" id="NOMBRE_INTER_TEXT" value="${__formdata.NOMBRE_INTER_TEXT}" class="campowidthinput campo campotexto"/>
                                                    </td>
                                                </axis:ocultar>
                                                <input type="hidden" name="CINTERMEDIARIO_TEXT_AUX" id="CINTERMEDIARIO_TEXT_AUX" value="${__formdata.CINTERMEDIARIO_TEXT_AUX}" class="campowidthinput campo campotexto" style="width:70%" />
                                            </tr>
                                            
                                     </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </axis:ocultar>
                    <div class="separador">&nbsp;</div>
                    
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <table class="area" align="center"> 
                                    <tr>
                                        <td>
                                            <div class="separador">&nbsp;</div>
                                            
                                            <c:set var="title0"><axis:alt f="axisctr060" c="NUMERO" lit="800440" /></c:set>   <%-- Nº --%>
                                            <c:set var="title1"><axis:alt f="axisctr060" c="TOMADOR" lit="105940" /></c:set>   <%-- Nombre --%>                                 
                                            <c:set var="title2"><axis:alt f="axisctr060" c="SITUACION" lit="100874" /></c:set>   <%-- Situación --%>                                                                 
                                            <c:set var="title3"><axis:alt f="axisctr060" c="PRODUCTO" lit="100829" /></c:set>   <%-- Producto --%>   
                                            <c:set var="title6"><axis:alt f="axisctr060" c="INTERMEDIARIO" lit="9902363" /></c:set>   <%-- INTERMEDIARIO --%>   
                                            
                                            <div id="dt_polizas" class="displayspaceMaximo">
                                                <display:table name="${requestScope.LST_POLIZAS}" id="LST_POLIZAS" export="false" class="dsptgtable" pagesize="15" sort="list" cellpadding="0" cellspacing="0"
                                                     requestURI="axis_axisctr060.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                        <div class="dspIcons">
                                                            <input type="radio" id="radioNPOLIZA" name="radioNPOLIZA"  
                                                            value="${LST_POLIZAS.NUMERO}" 
                                                            onclick="f_seleccionar(this.value, false)"
                                                            <c:if test="${__formdata.NPOLIZA == LST_POLIZAS.NUMERO}"> checked="checked"</c:if>/>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title0}" sortable="true" sortProperty="NUMERO" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            <a href="javascript:f_seleccionar(${LST_POLIZAS.NUMERO}, true)"> 
                                                                ${LST_POLIZAS.NUMERO}
                                                            </a>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title1}" sortable="true" sortProperty="TOMADOR" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            <a href="javascript:f_seleccionar(${LST_POLIZAS.NUMERO}, true)">                                                                 
                                                                ${LST_POLIZAS.TOMADOR}
                                                            </a>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="SITUACION" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            <a href="javascript:f_seleccionar(${LST_POLIZAS.NUMERO}, true)">                                                                 
                                                                ${LST_POLIZAS.SITUACION}
                                                            </a>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true" sortProperty="PRODUCTO" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            <a href="javascript:f_seleccionar(${LST_POLIZAS.NUMERO}, true)">                                                                 
                                                                ${LST_POLIZAS.PRODUCTO}
                                                            </a>
                                                        </div>
                                                    </display:column>
                                                    <axis:visible f="axisctr060" c="COLINTERMEDIARIO">
                                                    <display:column title="${title6}" sortable="true" sortProperty="INTERMEDIARIO" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            <a href="javascript:f_seleccionar(${LST_POLIZAS.NUMERO}, true)">                                                                 
                                                                ${LST_POLIZAS.TINTERMEDIARIO}
                                                            </a>
                                                        </div>
                                                    </display:column>
                                                    </axis:visible>
                                                </display:table>                                                        
                                            </div>
                                            
                                            <div class="separador">&nbsp;</div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        
                    </table>
                </td>     
            </tr> 
            <axis:visible f="axisctr060" c="NCASO_BPM">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <table class="area" align="center"> 
                                    <tr>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja" id="tit_NCASO_BPM">
                                            <b><axis:alt f="axisctr060" c="NCASO_BPM" lit="9905993" /></b>
                                        </td>
                                        <td class="titulocaja" id="tit_NSOLICI_BPM">
                                            <b><axis:alt c="NSOLICI_BPM" f="axisctr213" lit="9905998" /></b>
                                        </td>
                                        <td class="titulocaja" id="tit_NOMBRE_NCASO_BPM">
                                            <b><axis:alt f="axisctr060" c="TNCASO_BPM" lit="105940" /></b>
                                        </td>
                                    </tr>
                                    <tr>   
                                        <td class="campocaja">
                                            <input type="text" name="NCASO_BPM" title="<axis:alt f="axisctr060" c="NCASO_BPM" lit="9905993" />" id="NCASO_BPM" value="${__formdata.NCASO_BPM}" class="campowidthinput campo campotexto" style="width:70%" formato="entero"
                                                <axis:atr f="axisctr060" c="NCASO_BPM" a="modificable=true&obligatorio=false"/> onchange="f_cargar_casobpm(1)" />
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" name="NSOLICI_BPM" title="<axis:alt f="axisctr060" c="NSOLICI_BPM" lit="9905998" />" id="NSOLICI_BPM" value="${__formdata.NSOLICI_BPM}" class="campowidthinput campo campotexto" style="width:70%" formato="entero"
                                                <axis:atr f="axisctr060" c="NSOLICI_BPM" a="modificable=true&obligatorio=false"/> onchange="f_cargar_casobpm(1)" />
                                            <img border="0" src="images/find.gif" onclick="f_abrir_axisctr213()" style="cursor:pointer" id="BUSQNCASO_BPM"/>
                                        </td>
                                        <td class="campocaja" colspan="2">    
                                            <input readonly="true" type="text" name="NOMBRE_NCASO_BPM" id="NOMBRE_NCASO_BPM" value="${__formdata.NOMBRE_NCASO_BPM}" class="campowidthinput campo campotexto"/>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td> 
            </tr>
            </axis:visible>
        </table>
        
        <c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axisctr060</c:param>
            <c:param name="__botones">cancelar,siguiente</c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>

</body>
</html>