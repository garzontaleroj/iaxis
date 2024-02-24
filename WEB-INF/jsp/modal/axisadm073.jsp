<%--
      NOMBRE:    axisadm073.jsp
      @author <a href = "mailto:joan_torres@csi-ti.com">Joan Torres</a>
      Fecha: 04/07/2012
      PROPÓSITO (descripción pantalla): 
      Ejemplo : Búsqueda de impagados
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        04/07/2012   JTS             1. Creación de la pantalla. Bug.22342
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
            function f_onload(){
                f_cargar_propiedades_pantalla();
                var cempres =  "${__formdata.CEMPRES}"; 
                if(!objUtiles.estaVacio(cempres)){
                    f_cargar_ramos();
                }
                f_onchange_NPOLIZA();
            }

           function f_but_buscar() {
                if (objValidador.validaEntrada()){
                    //Validamos los campos de pantalla, ahora llamaríamos a la función que tocara
                    objUtiles.ejecutarFormulario("modal_axisadm073.do", "buscar", document.miForm, "_self", objJsMessages.jslit_buscando_polizas);
                }
           }
           
           /*function f_but_aceptar() {
                parent.f_aceptar_modal('axisadm073',objDom.getValorPorId("CRAMO"));
           }*/
           
           function f_but_cancelar() {
                parent.f_cerrar_modal('axisadm073');
           }
           
           function f_but_edit(SSEGURO,NRECIBO,CACTIMP,FACCION){
                parent.f_cargar_impagado('axisadm073',SSEGURO,NRECIBO,CACTIMP,FACCION);
           }
           
           function f_formatdate(entrada,title){
                 var jDate = new JsFecha();
                    if(entrada.value.length>0){
                        entrada.value=jDate.formateaFecha(entrada.value);
                    
                        if(jDate.validaFecha(entrada.value)){
                            entrada.value=jDate.formateaFecha(entrada.value);
                        }else{
                            alert("<axis:alt c="alert" f="axisadm074" lit="1000421"/>");
                            entrada.value = '';
                        }
                    }else{entrada.value = '';}
            }
           
           function f_onchange_NPOLIZA() {
                // Mostrar NCERTIF si está informado NPOLIZA
                var NPOLIZA = objDom.getValorPorId("NPOLIZA");
                
                if (objUtiles.estaVacio(NPOLIZA)) {
                    objDom.setValorPorId("NCERTIF", "null");
                    objDom.setVisibilidadPorId("NCERTIF", "hidden");
                    objDom.setVisibilidadPorId("label_NCERTIF", "hidden");
                } else {
                    objDom.setValorPorId("NCERTIF", "");
                    objDom.setVisibilidadPorId("NCERTIF", "visible");
                    objDom.setVisibilidadPorId("label_NCERTIF", "visible");                
                }
            }
               
           function f_onchange_empresa(CEMPRES) {
            // Recargar formulario para seleccionar los productos segun la empresa seleccionada            
           objDom.setValorPorId("CEMPRES", CEMPRES);
           objUtiles.ejecutarFormulario("modal_axisadm073.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
        }
        
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
            
            objAjax.invokeAsyncCGI("modal_axisadm073.do", callbackAjaxCargarRamos, "operation=ajax_busqueda_ramos&CEMPRES=" + ccompani, this, objJsMessages.jslit_cargando);
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
                objAjax.invokeAsyncCGI("modal_axisadm073.do", callbackAjaxCargarProductos, url, this, objJsMessages.jslit_cargando);
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
       
            function f_actualizar_agente(){
                 if (objValidador.validaEntrada()) {
                    var CAGENTE =  objDom.getValorPorId("CAGENTE_TEXT");
                    objDom.setValorPorId("CAGENTE",CAGENTE);
                    objDom.setValorPorId("NOMBRE_TEXT", ""); 
                    objAjax.invokeAsyncCGI("modal_axisadm073.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + CAGENTE, this, objJsMessages.jslit_cargando);
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
                        //objDom.setValorPorId("CAGENTE","");
                    }
                }
            }
            
            
            function callbackAjaxCambiarAgente(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado);
                objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);
                    }
            }
           /****************************** MODAL *************************************/ 
            function f_abrir_axisctr014() {
                objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
            }
            
            function f_cerrar_axisctr014() {
                objUtiles.cerrarModal("axisctr014")
            }    
            function f_aceptar_axisctr014 (CAGENTE){
                objDom.setValorPorId("CAGENTE", CAGENTE);
                f_cerrar_axisctr014();
                objAjax.invokeAsyncCGI("modal_axisadm073.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            }
        

            
        </script>
    </head>
 <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
            <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
            <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}" id="CAGENTE">
            <c:if test="${!empty __formdata.LISTVALORES.LSTEMPRESAS && fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == 1  }">
                <input type="hidden" name="CEMPRES" id="CEMPRES" value="${__formdata.LISTVALORES.LSTEMPRESAS[0].CEMPRES}" />
            </c:if>
            
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="lit_form" f="axisadm073" lit="9903917"/></c:param>
                <c:param name="producto"><axis:alt c="lit_form" f="axisadm073" lit="9903917"/></c:param>
                <c:param name="form">axisadm073</c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt c="titulo14" f="axisfis002" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
            </c:import>
            
            <!-- Area de campos  -->
            
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:12.5%;height:0px"></th>
                                <th style="width:12.5%;height:0px"></th>
                                <th style="width:12.5%;height:0px"></th>
                                <th style="width:12.5%;height:0px"></th>
                                <th style="width:12.5%;height:0px"></th>
                                <th style="width:12.5%;height:0px"></th>
                                <th style="width:12.5%;height:0px"></th>
                                <th style="width:12.5%;height:0px"></th>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisadm073" c="CEMPRES" dejarHueco="false">
                                    <td class="titulocaja" colspan ="2">
                                        <b><axis:alt f="axisadm073" c="EMPRESA" lit="101619"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisadm073" c="CRAMO" dejarHueco="false">
                                    <td class="titulocaja" colspan ="2">
                                        <b><axis:alt f="axisadm073" c="CRAMO" lit="100784"></axis:alt></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisadm073" c="SPRODUC" dejarHueco="false">
                                    <td class="titulocaja" colspan ="2">
                                        <b><axis:alt f="axisadm073" c="SPRODUC" lit="100829"/></b> <%-- Producte --%>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisadm073" c="CTIPREC" dejarHueco="false">
                                    <td class="titulocaja" colspan ="2">
                                        <b><axis:alt f="axisadm073" c="CTIPREC" lit="9903922"/></b> <%-- Producte --%>
                                    </td>
                                </axis:ocultar>
                                
                            </tr>
                            <tr>
                               <axis:ocultar f="axisadm073" c="CEMPRES" dejarHueco="false">
                                    <c:choose> 
                                        <c:when test="${fn:length(__formdata.listValores.lstempresas) > 1 && !empty __formdata.LISTVALORES.LSTEMPRESAS}">         
                                             <td class="campocaja" colspan ="2">
                                                    <select name="CEMPRES" id="CEMPRES" onchange="f_onchange_empresa(this.value)" <axis:atr f="axisadm073" c="CEMPRES" a="obligatorio=false&isInputText=false"/>  size="1" class="campowidthselect campo campotexto" style="width:95%;">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm073" c="BLANCO" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTEMPRESAS}">
                                                            <option value = "${element.CEMPRES}"
                                                            <c:if test="${__formdata.CEMPRES == element.CEMPRES}"> selected = "selected"</c:if> />
                                                                ${element.TEMPRES} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                             </td>
                                        </c:when>
                                        <c:otherwise> 
                                            <td class="campocaja" colspan ="2"> 
                                                <input type= "text" class="campo campotexto" obligatorio="true" id="CEMPRES" name="CEMPRES" value = "${__formdata.LISTVALORES.LSTEMPRESAS[0].TEMPRES}"
                                                <axis:atr f="axisadm073" c="CEMPRES" a="modificable=false&obligatorio=true"/>/>
                                            </td>    
                                        </c:otherwise> 
                                    </c:choose>
                                </axis:ocultar>
                                <axis:ocultar f="axisadm073" c="CRAMO" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja" colspan ="2">
                                        <select name = "ramoProducto" id="ramoProducto" style="width:95%;" id ="ramoProducto" size="1" onchange="f_cargar_productos()" class="campowidthselect campo">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm073" c="BLANCO" lit="1000348"/> - </option>
                                            <c:forEach var="ramos" items="${axisctr_listaRamos}">
                                                <option value = "${ramos.CRAMO}/${ramos.TRAMO}"
                                                    <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>
                                                    ${ramos.TRAMO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisadm073" c="SPRODUC" dejarHueco="false">
                                    <td class="campocaja" colspan ="2">
                                        <select name="SPRODUC" id="SPRODUC" size="1" class="campowidthselect campo campotexto" style="width:95%;">&nbsp;
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm073" c="BLANCO" lit="1000348"/> - </option>
                                            <c:forEach var="element" items="${__formdata.LISTVALORES.LSTPRODUCTOS}">
                                                <option value = "${element.SPRODUC}"
                                                <c:if test="${__formdata.SPRODUC == element.SPRODUC}"> selected = "selected"</c:if> />
                                                    ${element.TTITULO} 
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td> 
                                </axis:ocultar>
                                <axis:ocultar f="axisadm073" c="CTIPREC" dejarHueco="false">
                                    <td class="campocaja" colspan ="2">
                                        <select name="CTIPREC" id="CTIPREC" size="1" class="campowidthselect campo campotexto" style="width:95%;">&nbsp;
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm073" c="BLANCO" lit="1000348"/> - </option>
                                            <c:forEach var="element" items="${__formdata.LISTVALORES.LSTTIPREC}">
                                                <option value = "${element.CATRIBU}"
                                                <c:if test="${__formdata.CTIPREC == element.CATRIBU}"> selected = "selected"</c:if> />
                                                    ${element.TATRIBU} 
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td> 
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisadm073" c="NPOLIZA" dejarHueco="false">
                                     <td class="titulocaja" colspan ="2">
                                        <b><axis:alt f="axisadm073" c="POLIZA" lit="100836"/></b> <%-- Pòlissa --%>
                                        <b id="label_NCERTIF" style="visibility:hidden"><axis:alt f="axisadm073" c="CERTIFICADO" lit="101300"/></b> <%-- Certificat --%>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisadm073" c="NRECIBO" dejarHueco="false">
                                    <td class="campocaja" >
                                        <b><axis:alt f="axisadm073" c="NRECIBO" lit="100895"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisadm073" c="NIMPAGO" dejarHueco="false">
                                    <td class="campocaja" >
                                        <b><axis:alt f="axisadm073" c="NIMPAGO" lit="9901852"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisadm073" c="MOTDEVOLU" dejarHueco="false">
                                    <td class="titulocaja" colspan ="2">
                                        <b><axis:alt f="axisadm073" c="MOTDEVOLU" lit="9001626"/></b> 
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar c="FACCDESDE" f="axisadm074" dejarHueco="false">
                                    <td class="titulocaja">
                                         <b><axis:alt f="axisadm073" c="FACCDESDE" lit="9903923"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar c="FACCHASTA" f="axisadm074" dejarHueco="false">
                                    <td class="titulocaja">
                                         <b><axis:alt f="axisadm073" c="FACCHASTA" lit="9903924"/></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisadm073" c="NPOLIZA" dejarHueco="false">
                                    <td class="campocaja"  colspan ="2">                             
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA" 
                                        style="width:70%;" onchange="f_onchange_NPOLIZA()" title="<axis:alt f="axisadm073" c="NPOLIZA" lit="100836"/>"
                                        <axis:atr f="axisadm073" c="NPOLIZA" a="formato=entero&obligatorio=false"/> />
                                        
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NCERTIF}" name="NCERTIF" id="NCERTIF" 
                                        style="width:20%;visibility:hidden" title="<axis:alt f="axisadm073" c="NCERTIFS" lit="1000348"/>"
                                        <axis:atr f="axisadm073" c="NCERTIF" a="formato=entero"/> />
                                    </td>
                                </axis:ocultar>                          
                                <axis:ocultar f="axisadm073" c="NRECIBO" dejarHueco="false">
                                    <td class="campocaja" >
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NRECIBO}" name="NRECIBO" id="NRECIBO" 
                                        style="width:87%;" title="<axis:alt f="axisadm073" c="NRECIBO" lit="100895"/>"
                                        <axis:atr f="axisadm073" c="NRECIBO" a="formato=entero&obligatorio=false"/> />
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisadm073" c="NIMPAGO" dejarHueco="false">
                                    <td class="campocaja" >
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NIMPAGO}" name="NIMPAGO" id="NIMPAGO" 
                                        style="width:87%;" title="<axis:alt f="axisadm073" c="NIMPAGO" lit="9901852"/>"
                                        <axis:atr f="axisadm073" c="NIMPAGO" a="formato=entero&obligatorio=false"/> />
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisadm073" c="MOTDEVOLU" dejarHueco="false">
                                    <td class="campocaja" colspan ="2">
                                        <select name="MOTDEVOLU" id="MOTDEVOLU" size="1" class="campowidthselect campo campotexto" style="width:95%;">&nbsp;
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm073" c="BLANCO" lit="1000348"/> - </option>
                                            <c:forEach var="element" items="${__formdata.LISTVALORES.LSTMOTDEVOLU}">
                                                <option value = "${element.CATRIBU}"
                                                <c:if test="${__formdata.MOTDEVOLU == element.CATRIBU}"> selected = "selected"</c:if> />
                                                    ${element.TATRIBU} 
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td> 
                                </axis:ocultar>
                                <axis:ocultar c="FACCDESDE" f="axisadm074" dejarHueco="false">
                                    <td class="campocaja" >
                                         <input type="text" style="width:66%" class="campowidthinput campo campotexto" 
                                         id="FACCDESDE" name="FACCDESDE" title="<axis:alt f="axisadm073" c="FACCDESDE" lit="9903923"/>" size="15" 
                                         onchange="javascript:f_formatdate(this,'')"
                                         value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FACCDESDE}'/>" 
                                         <axis:atr f="axisadm074" c="FACCDESDE" a="modificable=true&formato=fecha"/> />
                                         
                                         <a id="icon_FACCDESDE" style="vertical-align:middle;" href="#">
                                         <img id="popup_calendario_FACCDESDE" border="0" alt="<axis:alt f="axisadm073" c="CALENDAR" lit="108341"/>" 
                                         title="<axis:alt f="axisadm073" c="CALENDAR" lit="108341"/>" src="images/calendar.gif"/>
                                         </a>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar c="FACCHASTA" f="axisadm074" dejarHueco="false">
                                    <td class="campocaja" >
                                         <input type="text" style="width:66%" class="campowidthinput campo campotexto" 
                                         id="FACCHASTA" name="FACCHASTA" title="<axis:alt f="axisadm073" c="FACCHASTA" lit="9903924"/>" size="15" 
                                         onchange="javascript:f_formatdate(this,'')"
                                         value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FACCHASTA}'/>" 
                                         <axis:atr f="axisadm074" c="FACCHASTA" a="modificable=true&formato=fecha"/> />
                                         
                                         <a id="icon_FACCHASTA" style="vertical-align:middle;" href="#">
                                         <img id="popup_calendario_FACCHASTA" border="0" alt="<axis:alt f="axisadm073" c="CALENDAR" lit="108341"/>" 
                                         title="<axis:alt f="axisadm073" c="CALENDAR" lit="108341"/>" src="images/calendar.gif"/>
                                         </a>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            
                            
                            <tr>
                                <axis:ocultar f="axisadm073" c="CAGENTE" dejarHueco="false"> 
                                    <td class="titulocaja" colspan="4">
                                        <b><axis:alt f="axisadm073" c="CAGENTE" lit="9901930"></axis:alt></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisadm073" c="COFICINA" dejarHueco="false">
                                    <td class="titulocaja" colspan ="2">
                                        <b><axis:alt f="axisadm073" c="COFICINA" lit="9000436"/></b> 
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisadm073" c="CAGENTE"  dejarHueco="false" > 
                                    <td class="campocaja" colspan="4">
                                        <input type="text" name="CAGENTE_TEXT" id="CAGENTE_TEXT" value="${__formdata.CAGENTE_TEXT}" class="campowidthinput campo campotexto" style="width:20%"
                                         title="<axis:alt  c="CAGENTE" f="axisadm073" lit="9901930"/>" 
                                        <axis:atr f="axisadm073" c="CAGENTE" a="modificable=true&obligatorio=false"/> onchange="f_actualizar_agente()" />
                                        <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                        <input readonly="true" type="text" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${__formdata.NOMBRE_TEXT}"  style="width:72%" class="campowidthinput campo campotexto"/>
                                    </td>                                    
                                </axis:ocultar>
                                <axis:ocultar f="axisadm073" c="COFICINA" dejarHueco="false">
                                    <td class="campocaja" colspan ="2">
                                        <select name="COFICINA" id="COFICINA" size="1" class="campowidthselect campo campotexto" style="width:95%;">&nbsp;
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm073" c="BLANCO" lit="1000348"/> - </option>
                                            <c:forEach var="element" items="${__formdata.LISTVALORES.LSTOFICINAS}">
                                                <option value = "${element.CAGENTE}"
                                                <c:if test="${__formdata.COFICINA == element.CAGENTE}"> selected = "selected"</c:if> />
                                                    ${element.TAGENTE} 
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td> 
                                </axis:ocultar>
                            </tr>
                            
                            <tr>
                                <axis:ocultar f="axisadm073" c="MCARTA" dejarHueco="false">
                                    <td class="titulocaja" colspan ="2">
                                        <b><axis:alt f="axisadm073" c="MCARTA" lit="9001640"/></b> 
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisadm073" c="CACCION" dejarHueco="false">
                                    <td class="titulocaja" colspan ="2">
                                        <b><axis:alt f="axisadm073" c="CACCION" lit="9000844"/></b> 
                                    </td>
                                </axis:ocultar>
                                
                            </tr>
                            <tr>
                                <axis:ocultar f="axisadm073" c="MCARTA" dejarHueco="false">
                                    <td class="campocaja" colspan ="2">
                                        <select name="MCARTA" id="MCARTA" size="1" class="campowidthselect campo campotexto" style="width:95%;">&nbsp;
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm073" c="BLANCO" lit="1000348"/> - </option>
                                            <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCARTAS}">
                                                <option value = "${element.CATRIBU}"
                                                <c:if test="${__formdata.MCARTA == element.CATRIBU}"> selected = "selected"</c:if> />
                                                    ${element.TATRIBU} 
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td> 
                                </axis:ocultar>
                                <axis:ocultar f="axisadm073" c="CACCION" dejarHueco="false">
                                    <td class="campocaja" colspan ="2">
                                        <select name="CACCION" id="CACCION" size="1" class="campowidthselect campo campotexto" style="width:95%;">&nbsp;
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm073" c="BLANCO" lit="1000348"/> - </option>
                                            <c:forEach var="element" items="${__formdata.LISTVALORES.LSTACCION}">
                                                <option value = "${element.CATRIBU}"
                                                <c:if test="${__formdata.CACCION == element.CATRIBU}"> selected = "selected"</c:if> />
                                                    ${element.TATRIBU} 
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td> 
                                </axis:ocultar>
                            </tr>
                            
                            
                        </table>
                       
                       <axis:visible f="axisadm073" c="DSP_IMPAGADOS">
                        <div class="separador">&nbsp;</div>
                            <!-- DisplayTag Pólizas -->
                            <c:set var="title1"><axis:alt f="axisadm073" c="DSP_TPRODUCTO" lit="100829"/></c:set>
                            <c:set var="title2"><axis:alt f="axisadm073" c="DSP_TCAGENTE" lit="9901930"/></c:set>
                            <c:set var="title3"><axis:alt f="axisadm073" c="DSP_FACCION" lit="9903927"/></c:set>
                            <c:set var="title4"><axis:alt f="axisadm073" c="DSP_TTIPREC" lit="9903922"/></c:set>
                            <c:set var="title5"><axis:alt f="axisadm073" c="DSP_NRECIBO" lit="100895"/></c:set>
                            <c:set var="title6"><axis:alt f="axisadm073" c="DSP_NIMPAGAD" lit="9901852"/></c:set>
                            <c:set var="title7"><axis:alt f="axisadm073" c="DSP_TMOTIVO" lit="9001626"/></c:set>
                            <c:set var="title8"><axis:alt f="axisadm073" c="DSP_TTIPCAR" lit="9001640"/></c:set>
                            <c:set var="title9"><axis:alt f="axisadm073" c="DSP_TACCION" lit="9000844"/></c:set>
                            <div class="seccion displayspaceGrande">
                                <display:table name="${__formdata.IMPAGADOS}" id="miListaId" export="false" class="dsptgtable" pagesize="8" defaultsort="1" defaultorder="ascending" requestURI="modal_axisadm073.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <axis:visible f="axisadm073" c="TPRODUCTO">
                                        <display:column title="${title1}" sortable="true" sortProperty="TPRODUCTO" headerClass="sortable fixed"  media="html" autolink="false" >    
                                            <div class="dspText">${miListaId['TPRODUCTO']}</div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisadm073" c="TCAGENTE">
                                        <display:column title="${title2}" sortable="true" sortProperty="TCAGENTE" headerClass="sortable fixed" media="html" autolink="false" >
                                            <div class="dspText">${miListaId['TCAGENTE']}</div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisadm073" c="FACCION">
                                        <display:column title="${title3}" sortable="true" sortProperty="FACCION" headerClass="sortable fixed" media="html" autolink="false" >
                                            <div class="dspText"><fmt:formatDate pattern='dd/MM/yyyy' value='${miListaId["FACCION"]}'/></div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisadm073" c="TTIPREC">
                                        <display:column title="${title4}" sortable="true" sortProperty="TTIPREC" headerClass="sortable fixed" media="html" autolink="false" >
                                            <div class="dspText">${miListaId['TTIPREC']}</div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisadm073" c="NRECIBO">
                                        <display:column title="${title5}" sortable="true" sortProperty="NRECIBO" headerClass="sortable fixed" media="html" autolink="false" >
                                            <div class="dspText">${miListaId['NRECIBO']}</div>
                                        </display:column>
                                    </axis:visible>.
                                    <axis:visible f="axisadm073" c="NIMPAGAD">
                                        <display:column title="${title6}" sortable="true" sortProperty="NIMPAGAD" headerClass="sortable fixed" media="html" autolink="false" >
                                            <div class="dspText">${miListaId['NIMPAGAD']}</div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisadm073" c="TMOTIVO">
                                        <display:column title="${title7}" sortable="true" sortProperty="TMOTIVO" headerClass="sortable fixed" media="html" autolink="false" >
                                            <div class="dspText">${miListaId['TMOTIVO']}</div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisadm073" c="TTIPCAR">
                                        <display:column title="${title8}" sortable="true" sortProperty="TTIPCAR" headerClass="sortable fixed" media="html" autolink="false" >
                                            <div class="dspText">${miListaId['TTIPCAR']}</div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisadm073" c="TACCION">
                                        <display:column title="${title9}" sortable="true" sortProperty="TACCION" headerClass="sortable fixed" media="html" autolink="false" >
                                            <div class="dspText">${miListaId['TACCION']}</div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisadm073" c="BEDITAR">
                                        <display:column title="" style="width:5%;" sortable="false" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <c:if test="${miListaId['CTRACTAT']=='0' || miListaId['CTRACTAT']=='1' || miListaId['CTRACTAT']=='3'}">
                                                <div class="dspIcons">
                                                    <a href="javascript:f_but_edit('${miListaId['SSEGURO']}','${miListaId['NRECIBO']}','${miListaId['CACTIMP']}','<fmt:formatDate pattern='dd/MM/yyyy' value='${miListaId["FACCION"]}'/>');">
                                                        <img border="0"
                                                             alt='<axis:alt f="axisadm073" c="EDIT" lit="9901356"/>'
                                                             title='<axis:alt f="axisadm073" c="EDIT" lit="9901356"/>'
                                                             src="images/lapiz.gif"/>
                                                    </a>
                                                </div>
                                            </c:if>
                                        </display:column>
                                    </axis:visible>
                                    
                                </display:table>
                            </div>
                         </axis:visible>
                    </td>
                </tr>
            </table>
    
     </form>
        <!-- Inicio. Sólo si vamos a tener un campo fecha !-->
        <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FACCDESDE",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FACCDESDE", 
            singleClick    :    true,
            firstDay       :    1
        });
         Calendar.setup({
            inputField     :    "FACCHASTA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FACCHASTA", 
            singleClick    :    true,
            firstDay       :    1
        });
        </script>
        <!-- fin Sólo si vamos a tener un campo fecha !-->
    
    

<c:import url="../include/botonera_nt.jsp">
           <c:param name="f">axisadm073</c:param>
           <c:param name="__botones"><axis:ocultar f="axisadm073" c = "BT_CANCELAR" dejarHueco="false">cancelar</axis:ocultar><axis:ocultar f="axisadm073" c = "BT_BUSCAR" dejarHueco="false">,buscar</axis:ocultar> </c:param>

</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>


