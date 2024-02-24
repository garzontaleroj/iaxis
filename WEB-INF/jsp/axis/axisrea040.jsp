<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>


<html>
  <head> 
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/tree.css" type="text/css"></link>
      <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
      <script type="text/javascript" src="scripts/calendar.js"></script>
      <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
      <script type="text/javascript" src="scripts/calendar-setup.js"></script>

    <c:import url="../include/carga_framework_js.jsp" />    

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
          
                
        function f_but_cancelar() {
          objUtiles.ejecutarFormulario ("axis_axisrea040.do", "cancelar", document.miForm, "_self");
        }
             
       function f_but_reparte() {
       var NSINIES=  document.getElementById("NSINIES");
       var CEVENTO= document.getElementById("CEVENTO");
       
           /*if (objUtiles.estaVacio(NSINIES.value) && objUtiles.estaVacio( CEVENTO.value )){
                NSINIES.setAttribute("obligatorio","true");      
                CEVENTO.setAttribute("obligatorio","true");      
           }
          
            if (!objUtiles.estaVacio(NSINIES.value) && objUtiles.estaVacio( CEVENTO.value )){
                NSINIES.setAttribute("obligatorio","true");      
                CEVENTO.setAttribute("obligatorio","false");      
           }
            if (objUtiles.estaVacio(NSINIES.value) && !objUtiles.estaVacio( CEVENTO.value )){
                NSINIES.setAttribute("obligatorio","false");      
                CEVENTO.setAttribute("obligatorio","true");      
           }*/
       
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("axis_axisrea040.do", "reparte", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
       }
    
       
        function f_but_guardar() {
            objUtiles.ejecutarFormulario("axis_axisrea040.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_onload() {
              f_cargar_propiedades_pantalla();                        
        }

    function f_but_salir() {
               objUtiles.ejecutarFormulario ("flujodetrabajo.do", "cancelar", document.miForm, "_self");
            }
        function f_recargar() {          
             //Limpiamos los valores de NSINIES & NPOLIZA
            $("#NPOLIZA").val("");
            $("#NSINIES").val("");
            f_cargar_propiedades_pantalla(); 
            objAjax.invokeAsyncCGI("axis_axisrea040.do", callbackAjaxActualizaPantalla, 
                    "operation=ajax_actualiza_pantalla", this, objJsMessages.jslit_actualizando_registro);            
        }
         

        function callbackAjaxActualizaPantalla(ajaxResponseText) {                
               
            try {
                    var a=null;
                
                } catch (e) {
                    //objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", tramoCombo, null);
                    //alert(objJsMessages.jslit_sin_motivos);
                }
            }

        /* *************************************** *************** ************************************* */
        /* ****************************** FUNCIONES AJAX IMPLEMENTACION ******************************** */
        /* ********************************************************************************************* */
        
        /* ************************* CAMBIA CONTRATO **************************** */
            function f_actualiza_version(){
                //  objValidador.validaEntrada();
               
                SCONTRA= document.miForm.SCONTRA.value;
                objAjax.invokeAsyncCGI("axis_axisrea040.do", callbackAjaxActualizaVersion, 
                    "operation=ajax_actualiza_version&SCONTRA="+SCONTRA, this, objJsMessages.jslit_actualizando_registro);
                    
            }
            function callbackAjaxActualizaVersion(ajaxResponseText) {
                var varcont=1;
                var versionCombo = document.miForm.NVERSIO;
                
            try {
                    var doc=objAjax.domParse(ajaxResponseText);
                                       
                    if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                        if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                            objDom.borrarOpcionesDeCombo(versionCombo); 
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", versionCombo, 0);
                            for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                                        var NVERSIO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("NVERSIO")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("NVERSIO")[0].childNodes[0].nodeValue : "");
                                        var TCONTRA = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TCONTRA")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TCONTRA")[0].childNodes[0].nodeValue : "");
                                        objDom.addOpcionACombo(NVERSIO, NVERSIO + ' - ' + TCONTRA, versionCombo, i+1);
                            }
                        }else{
                            objDom.borrarOpcionesDeCombo (versionCombo);
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", versionCombo, null);
                        }
                       
                    }
                f_actualiza_tramos();
                } catch (e) {
                    objDom.borrarOpcionesDeCombo( document.miForm.NVERSIO );
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ",  document.miForm.NVERSIO, null);
                    alert (e.name + " " + e.message);
                }
            }
            
            
            function f_actualiza_tramos(){
                //  objValidador.validaEntrada();
                
                SCONTRA= document.miForm.SCONTRA.value;
                NVERSIO= document.miForm.NVERSIO.value;
               
                if (NVERSIO != <%= Integer.MIN_VALUE %>){
                    objAjax.invokeAsyncCGI("axis_axisrea040.do", callbackAjaxActualizaTramos, 
                        "operation=ajax_actualiza_tramos&SCONTRA="+SCONTRA+"&NVERSIO="+NVERSIO, this, objJsMessages.jslit_actualizando_registro);
                }else{
                    var tramoCombo = document.miForm.CTRAMO;
                    objDom.borrarOpcionesDeCombo(tramoCombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", tramoCombo, null);
                    tramoCombo.selectedIndex=0;
                }        
                    
            }
            function callbackAjaxActualizaTramos(ajaxResponseText) {
            var tramoCombo = document.miForm.CTRAMO;
            var indexSelected =0;   
            try {
                    var doc=objAjax.domParse(ajaxResponseText);
                                     
                    if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                        if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                            objDom.borrarOpcionesDeCombo(tramoCombo);
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", tramoCombo, 0);
                            for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                                var CATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0].childNodes[0].nodeValue : "");
                                var TATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0].childNodes[0].nodeValue : "");
                                objDom.addOpcionACombo(CATRIBU, TATRIBU, tramoCombo, i+1);
                                if (CATRIBU== "${__formdata.CTRAMO}"){
                                   tramoCombo.selectedIndex=i+1;
                                }
                            }
                            
                            
                        }else{
                            objDom.borrarOpcionesDeCombo (tramoCombo);
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", tramoCombo, null);
                        }
                    }
                
                } catch (e) {
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", tramoCombo, null);
                    //alert(objJsMessages.jslit_sin_motivos);
                }
            }
             function f_actualiza_garantias(){
            NPOLIZA = $("#NPOLIZA").val();
            NSINIES = $("#NSINIES").val();
            
            objAjax.invokeAsyncCGI("axis_axisrea040.do", callbackAjaxActualizaGarantias, 
                "operation=ajax_actualiza_garantias&NPOLIZA="+NPOLIZA+"&NSINIES="+NSINIES, this, objJsMessages.jslit_actualizando_registro);
        }
        
        function callbackAjaxActualizaGarantias(ajaxResponseText) 
        {
            var garantiasCombo = $("#CGARANT");
            try {
                var doc=objAjax.domParse(ajaxResponseText);
                                 
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        $(garantiasCombo).empty().append("<option value='<%= Integer.MIN_VALUE %>'>" + objJsMessages.jslit_seleccionar + "</option>");
                        for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                            var CATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CGARANT")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CGARANT")[0].childNodes[0].nodeValue : "");
                            var TATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TGARANT")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TGARANT")[0].childNodes[0].nodeValue : "");
                            $(garantiasCombo).append("<option value='" + CATRIBU + "'>" + TATRIBU + "</option>");
                        }
                    }else{
                        $(garantiasCombo).empty().append("<option value='<%= Integer.MIN_VALUE %>'>" + objJsMessages.jslit_seleccionar + "</option>");
                    }
                }
            } catch (e) {
                $(garantiasCombo).empty().append("<option value='<%= Integer.MIN_VALUE %>'>" + objJsMessages.jslit_seleccionar + "</option>");
            }
        }
        
        function f_actualiza_garantias_fil(){
            NPOLIZA = $("#NPOLIZA").val();
            NSINIES = $("#NSINIES").val();
            
            objAjax.invokeAsyncCGI("axis_axisrea040.do", callbackAjaxActualizaGarantias, 
                "operation=ajax_actualiza_garantias_fil&NPOLIZA="+NPOLIZA+"&NSINIES="+NSINIES, this, objJsMessages.jslit_actualizando_registro);
        }
            
   

            
             function f_abrir_axissin035(){
                objUtiles.abrirModal("axissin035","src","axis_axissin035.do?operation=form&SINIESTRO=No"); 
             }
             
             function f_aceptar_axissin035(CODIGO, TEXTO){
             try{
                objDom.setValorPorId("CEVENTO", CODIGO);
                objDom.setValorHTMLPorId("TEVENTO_span", "<b>" + TEXTO + "</b>");
                }
                catch(e){alert(e);}
                f_cerrar_axissin035();    
            }
            
            function f_cerrar_axissin035(){
                objUtiles.cerrarModal("axissin035");
            }
            
            
            function f_convertirFecha(campo){
              var valor =campo.value;
              var jDate = new JsFecha();
              var utiles = new JsUtiles();
              if ( jDate.validaFecha(valor)) {
              	var splitValue = utiles.replaceAll(utiles.replaceAll(valor,'-','/'),'.','/').split('/');
                var dia, mes, any;
                if (splitValue.length == 3) {
                    // dd/mm/yyyy o dd/mm/yy
                    dia = splitValue[0];
                    mes = splitValue[1];
                    any = splitValue[2];		
                }
                var newFecha= new Date( any, mes, 0);
                var strNewFecha= newFecha.getDate() + "/" + (newFecha.getMonth() + 1) + "/" + newFecha.getFullYear();
                campo.value= jDate.formateaFecha( strNewFecha );
              
              }
            }
            
            function f_formatdate(entrada,title){        
             var jDate = new JsFecha();
                if(entrada.value.length>0){
                    entrada.value=jDate.formateaFecha(entrada.value);
                
                    f_convertirFecha(entrada);
                
                    if(jDate.validaFecha(entrada.value)){
                        entrada.value=jDate.formateaFecha(entrada.value);
                    }else{
                        alert("<axis:alt f="axisadm003" c="ALERT_FORMDATE" lit="1000421"/>");
                    }
                }
            }      
            
    </script>
  </head>

  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="axis_axisrea040.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisrea040" c="TITULO" lit="9905812"/></c:param> <%-- Apuntes Manuales Cierre Previo --%>
            <c:param name="formulario"><axis:alt f="axisrea040" c="TITULO" lit="9905812"/></c:param> <%-- Apuntes Manuales Cierre Previo --%>
           <c:param name="form">axisrea040</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisper007|<axis:alt f="axisrea040" c="TITULO_PANT" lit="9000714"/></c:param>
        </c:import>
        
         <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisrea040" c="TIT_038" lit="9001941" /></c:param>
                <c:param name="nid" value="axisrea040" />
           </c:import>

            <%-- bug 0023830 --%>
            <c:import url="../include/modal_estandar.jsp">
                    <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisrea040" c="cam_impressio_doc" lit="1000205" />|true</c:param>
            </c:import>   

             <c:import url="../include/modal_estandar.jsp">
                    <c:param name="nid_y_titulo">axissin035</c:param>
            </c:import>    
            
        <input type="hidden" id="operation" name="operation" value=""/>
        <input type="hidden" name="SPROCES" value="${__formdata.SPROCES}"/>
        <input type="hidden" id="CESTADO_PANTALLA" name="CESTADO_PANTALLA" value=""/>
        <input type="hidden" name="fileAbsolutePath" value="-no guardarlo en formdata-"/>
        <input type="hidden" name="NID" value="${__formdata.NID}"/>

        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="3">            
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                        <tr>
                            <td>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:25%;height:0%;"/>
                                        <th style="width:25%;height:0%;"/>
                                        <th style="width:25%;height:0%;"/>
                                        <th style="width:25%;height:0%;"/>                                      
                                    </tr>                                                                   

                                    <tr>
                                  <axis:visible f="axisrea040" c="SCONTRA">
                                    <td class="titulocaja" id="tit_SCONTRA"><!--CONTRATO -->
                                      <b><axis:alt f="axisrea040" c="LIT_CONTRAT" lit="101945"/></b>
                                    </td>
                                  </axis:visible>  
                                  <axis:visible f="axisrea040" c="NVERSIO">
                                    <td class="titulocaja" id="tit_NVERSIO" ><!--NVERSION -->
                                      <b><axis:alt f="axisrea040" c="LIT_NVERSIO" lit="9001146"/></b>
                                    </td>
                                  </axis:visible>  
                                  <axis:visible f="axisrea040" c="CTRAMO">
                                    <td class="titulocaja" id="tit_CTRAMO"><!--NVERSION -->
                                      <b><axis:alt f="axisrea040" c="LIT_CTRAMO" lit="9000609"/></b>
                                    </td>
                                  </axis:visible>                          
                                </tr>
                                <tr>
                                    <axis:ocultar f="axisrea040" c="SCONTRA"> <!-- Linia 1. Columna 2. -->
                                    <td class="campocaja" id="td_SCONTRA"> <%-- SCONTRA --%>                                        
                                            <select name="SCONTRA" id="SCONTRA" size="1" <c:if test="${__formdata.MODO=='MOD'}" >disabled</c:if> class="campowidthselect campo campotexto"  <axis:atr f="axisrea040" c="SCONTRA" a="modificable=true&isInputText=true&obligatorio=true"/>  onchange="f_actualiza_version();" style="width:90%;"
                                            title="<axis:alt f='axisrea040' c='SCONTRA' lit='101945'/>">                               
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea040" c="ALT_SCONTRA_SEL" lit="108341"/> - </option>
                                                <c:forEach var="element" items="${__formdata.listaContrato}">
                                                    <option value = "${element.SCONTRA}" 
                                                    <c:if test="${element.SCONTRA == __formdata.SCONTRA}"> selected </c:if> >
                                                     ${element.SCONTRA} - ${element.TDESCRIPCION} 
                                                    </option>
                                                </c:forEach>
                                            </select>                                             
                                     </td>
                                     </axis:ocultar>                                         
                                     <axis:ocultar f="axisrea040" c="NVERSIO"> <!-- Linia 1. Columna 2. -->
                                     <td class="campocaja" id="td_NVERSIO"> <%-- NVERSIO --%>
                                       
                                            <select name="NVERSIO" id="NVERSIO" size="1" <c:if test="${__formdata.MODO=='MOD'}" >disabled</c:if> class="campowidthselect campo campotexto"  <axis:atr f="axisrea040" c="NVERSIO" a="modificable=true&isInputText=true&obligatorio=true"/>  onchange="f_actualiza_tramos();" style="width:90%;"
                                            title="<axis:alt f='axisrea040' c='NVERSIO' lit='9001146'/>">                               
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea040" c="ALT_NVERSIO_SEL" lit="108341"/> - </option>
                                                <c:forEach var="element" items="${__formdata.listaVersion}">
                                                    <option value = "${element.NVERSIO}" 
                                                    <c:if test="${element.NVERSIO == __formdata.NVERSIO}"> selected </c:if> >
                                                     ${element.NVERSIO} - ${element.TCONTRA} 
                                                    </option>
                                                </c:forEach>
                                            </select>                                             
                                    </td>
                                     </axis:ocultar> 
                                
                                <axis:ocultar f="axisrea040" c="CTRAMO"> <!-- Linia 1. Columna 2. -->
                                    <td class="campocaja" id="td_CTRAMO"> <%-- Tramo --%>                                        
                                            <select name="CTRAMO" id="CTRAMO" size="1" <c:if test="${__formdata.MODO=='MOD'}" >disabled</c:if> class="campowidthselect campo campotexto"  <axis:atr f="axisrea040" c="CTRAMO" a="modificable=true&isInputText=false&obligatorio=true"/>  style="width:90%;"
                                            title="<axis:alt f='axisrea040' c='CTRAMO' lit='9000609'/>"> 
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea040" c="ALT_NVERSIO_SEL" lit="108341"/> - </option>
                                                <c:forEach var="element" items="${__formdata.listaTramos}">
                                                    <option value = "${element.CATRIBU}" 
                                                    <c:if test="${element.CATRIBU == __formdata.CTRAMO}"> selected </c:if> >
                                                     ${element.TATRIBU} 
                                                    </option>
                                                </c:forEach>
                                            </select>                                             
                                    </td>                 
                                    </axis:ocultar>    
                                </tr>

                                <tr>                                        
                                        <td class="titulocaja" id="tit_FCIERRE">
                                            <b><axis:alt f="axisrea040" c="FCIERRE" lit="9000490"/></b> <%-- Fecha cierre --%>
                                        </td>
                                          <td class="titulocaja" id="tit_TDESCRI">
                                            <b><axis:alt f="axisrea040" c="TDESCRI" lit="100588"/></b> <%-- Descripción --%>
                                        </td>
                                         <td class="titulocaja" id="tit_NIDENTIF">
                                            <b><axis:alt f="axisrea040" c="NIDENTIF" lit="9904434"/></b> <%-- Número identificación --%>
                                        </td>
                                        
                                        <%--
                                         <td class="titulocaja">
                                            <b><axis:alt f="axisrea040" c="NPOLIZA" lit="100836"/></b> 
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrea040" c="CESTADO" lit="9000489"/></b> 
                                        </td>
                                        --%>
                                    </tr>
                                    <tr>
                                        <td class="campocaja" id="td_FCIERRE">                                <%-- Fecha cierre --%>
                                            <input type="text" class="campo campotexto" size="15" style="width:45%;"
                                            value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCIERRE}"/>"   name="FCIERRE" id="FCIERRE" onchange="javascript:f_formatdate(this,'')"
                                            title="<axis:alt f='axisrea040' c='FCIERRE' lit='9000490'/>" alt="<axis:alt f='axisrea040' c='FCIERRE' lit='9000490'/>"
                                            <axis:atr f="axisrea040" c="FCIERRE" a="formato=fecha"/> <axis:atr f="axisrea040" c="FCIERRE" a="modificable=true&isInputText=true&obligatorio=true"/> /><a style="vertical-align:middle;"><img
                                            id="icon_FCIERRE" alt="<axis:alt f="axisrea040" c="FCIERRE" lit="9000490"/>" title="<axis:alt f="axisrea040" c="FCIERRE" lit="9000490" />" src="images/calendar.gif"/></a>
                                        </td>                                        
                                       
                                        
                                         <td class="campocaja" id="td_TDESCRI">                                <%-- TDESCRI --%>
                                            <input type="text" class="campo campotexto" size="15" style="width:100%"
                                            value="${__formdata.TDESCRI}" name="TDESCRI" id="TDESCRI"
                                            title="<axis:alt f='axisrea040' c='TDESCRI' lit='100588'/>" alt="<axis:alt f='axisrea040' c='TDESCRI' lit='100588'/>"
                                            <axis:atr f="axisrea040" c="TDESCRI" a="modificable=true&isInputText=true&obligatorio=false"/>/>
                                        </td>
                                        
                                        <td class="campocaja" id="td_NIDENTIF">                                <%-- NIDENTIF --%>
                                            <input type="text" class="campo campotexto" size="15" style="width:50%"
                                            value="${__formdata.NIDENTIF}" name="NIDENTIF" id="NIDENTIF"
                                            title="<axis:alt f='axisrea040' c='NIDENTIF' lit='9904434'/>" alt="<axis:alt f='axisrea040' c='NIDENTIF' lit='9904434'/>"
                                            <axis:atr f="axisrea040" c="NIDENTIF" a="modificable=true&isInputText=true&obligatorio=false"/>/>
                                        </td>
                                        
                                        <%-- Estado Cierre --%>
                                        <%--
                                        <td class="campocaja">                              
                                            <input type="text" class="campo campotexto" size="15" style="width:80%"
                                            value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA"
                                            title="<axis:alt f='axisrea040' c='NPOLIZA' lit='100836'/>" alt="<axis:alt f='axisrea040' c='NPOLIZA' lit='100836'/>"
                                            <axis:atr f="axisrea040" c="NPOLIZA" a="modificable=true&formato=entero"/> />
                                        </td>
                                        <td class="campocaja">
                                            <select name = "CESTADO" id ="CESTADO" size="1" onchange="" class="campo campotexto" style="width:90%">
                                                <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisrea040" c="SNV_COMBO" lit="1000348"/> - </option>
                                                <c:forEach items="${__formdata.lstEstados}" var="item">
                                                    <option value = "${item.CATRIBU}" <c:if test="${__formdata.CESTADO == item.CATRIBU}"> selected </c:if>>${item.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td> 
                                        --%>
                                        
                                    </tr>
                                    <tr>
                                     <axis:ocultar c="CCONCEPTO" f="axisrea040" dejarHueco="false">
                                        <td class="titulocaja" id="tit_CCONCEPTO">
                                            <b><axis:alt f="axisrea040" c="CCONCEPTO" lit="9000715" /></b>
                                        </td>
                                    </axis:ocultar>
                                      <axis:ocultar c="CDEBHAB" f="axisrea040" dejarHueco="false">
                                        <td class="titulocaja" id="tit_CDEBHAB">
                                            <b><axis:alt f="axisrea040" c="CDEBHAB" lit="9001948" /></b>
                                        </td>
                                        </axis:ocultar>
                                       
                                        <axis:ocultar c="IMPORTE" f="axisrea040" dejarHueco="false">
                                        <td class="titulocaja" id="tit_IMPORTE">
                                            <b><axis:alt f="axisrea040" c="IMPORTE" lit="100563" /></b>
                                        </td>
                                        </axis:ocultar>
                                </tr>
                                
                               <tr> 
                                <axis:ocultar c="CCONCEPTO" f="axisrea040" dejarHueco="false">
                             <td class="campocaja" id="td_CCONCEPTO">
                                    <select name = "CCONCEPTO" id ="CCONCEPTO" size="1" style="width:90%" class="campowidthselect campo" onchange="f_recargar()" 
                                    <axis:atr f="axisrea040" c="CCONCEPTO" a="modificable=true&isInputText=true&obligatorio=true"/> title="<axis:alt f="axisrea040" c="CCONCEPTO" lit="9000715" />">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea040" c="SNV_COMBO" lit="108341" /> - </option>
                                        <c:forEach items="${__formdata.listvalores.lstconcep}" var="item">
                                           <%-- <option value = "${item.CCONCTA}" <c:if test="${__formdata['CCONCEPTO']==item.CCONCTA}">selected</c:if> >${item.TCCONCTA}</option> --%>
                                           <option value = "${item.CATRIBU}" <c:if test="${__formdata['CCONCEPTO']==item.CATRIBU}">selected</c:if> >${item.TATRIBU}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                            
                                <axis:ocultar c="CDEBHAB" f="axisrea040" dejarHueco="false">
                                <td class="campocaja" id="td_CDEBHAB">
                                    <select name = "CDEBHAB" id ="CDEBHAB" size="1" style="width:90%" class="campowidthselect campo" 
                                    <axis:atr f="axisrea040" c="CDEBHAB" a="modificable=true&isInputText=true&obligatorio=true"/> title="<axis:alt f="axisrea040" c="CDEBHAB" lit="9001948" />">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea040" c="SNV_COMBO" lit="108341" /> - </option>
                                        <c:forEach items="${__formdata.listvalores.lsttipocta}" var="item">
                                            <option value = "${item.CATRIBU}" <c:if test="${__formdata['CDEBHAB']==item.CATRIBU}">selected</c:if> >${item.TATRIBU}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                               
                                 <axis:ocultar c="IIMPORT" f="axisrea040" dejarHueco="false">
                                 <td class = "campocaja" id="td_IMPORTE">
                                
                                        <input type="text" style="width:90%;" class="campo campotexto" size="15" value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IIMPORT}'/>" name="IIMPORT" id="IIMPORT"  onkeypress="f_valida_numeros()"
                                         title="<axis:alt f="axisrea040" c="IMPORTE" lit="100563" />" <axis:atr f="axisrea040" c="IIMPORT" a="modificable=true&obligatorio=true&formato=decimal"/> />
                                 </td>
                                 </axis:ocultar>
                                 
                                 <tr>
                                 
                                  <axis:ocultar c="NSINIES" f="axisrea040" dejarHueco="false">
                                        <td class="titulocaja" id="tit_NSINIES">
                                            <b><axis:alt f="axisrea040" c="NSINIES" lit="800279" /></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar c="NPOLIZA" f="axisrea040" dejarHueco="false">
                                        <td class="titulocaja" id="tit_NPOLIZA">
                                            <b><axis:alt f="axisrea040" c="NPOLIZA" lit="800242" /></b>
                                        </td>
                                    </axis:ocultar>
                                
                                    <axis:visible c="CEVENTO" f="axisrea040">
                                            <!-- Evento -->
                                                <td class="titulocaja" id="tit_CEVENTO"><!-- colspan="2" -->
                                                    <b><axis:alt f="axisrea040" c="CEVENTO" lit="9000973" /></b>
                                                </td>
                                            </axis:visible>
                                    <axis:visible f="axisrea040" c="CGARANT">
                                        <td class="titulocaja" id="tit_CGARANT"><!--GARANTIA -->
                                          <b><axis:alt f="axisrea040" c="LIT_CGARANT" lit="100561"/></b>
                                        </td>
                                  </axis:visible>  
                                            
                                     </tr>
                                            
                                     <tr>                                                                                        
                                           <axis:ocultar c="NSINIES" f="axisrea040" dejarHueco="false">
                                            <td class = "campocaja" id="td_NSINIES">
                                                    <input type="text" class="campo campotexto" style="width:90%" value="${__formdata.NSINIES}" name="NSINIES" id="NSINIES" onchange="f_actualiza_garantias_fil()" 
                                                     <axis:atr f="axisrea040" c="NSINIES" a="modificable=true&obligatorio=false&formato=entero"/> title="<axis:alt f="axisrea040" c="NSINIES" lit="800279" />"/>
                                             </td>                            
                                            </axis:ocultar>
                                        
                                            <axis:ocultar c="NPOLIZA" f="axisrea040" dejarHueco="false">
                                                       <td class="titulocaja" id="td_NPOLIZA"> 
                                                             <input type="text" class="campo campotexto" name="NPOLIZA" id="NPOLIZA" value="${__formdata.NPOLIZA}" style="width:55%;" onchange="f_actualiza_garantias_fil()"
                                                            <axis:atr f="axisrea040" c="NPOLIZA" a="modificable=true&obligatorio=false&formato=entero"/> title="<axis:alt f="axisrea040" c="NPOLIZA" lit="800242" />"/>
                                                                                                  
                                                            <input type="text" class="campo campotexto" name="NCERTIF" id="NCERTIF" value="${__formdata.NCERTIF}" style="width:10%"
                                                            <axis:atr f="axisrea040" c="NCERTIF" a="modificable=true&obligatorio=false&formato=entero"/> title="<axis:alt f="axisrea040" c="NCERTIF" lit="101168" />"/>
                                                        </td>
                                        </axis:ocultar>
                                        
                                              <axis:ocultar c="CEVENTO" f="axisrea040" dejarHueco="false">
                                                <td class="campocaja" id="td_CEVENTO"> <!-- colspan="2" -->
                                                    <input tabindex="17" type="text" class="campowidthinput campo"  value="${__formdata.CEVENTO}"        name="CEVENTO" id="CEVENTO" onchange="f_onchange_CEVENTO()" style="width:50%;" 
                                                    <axis:atr f="axisrea040" c="CEVENTO" a="modificable=true&obligatorio=false"/> title="<axis:alt f="axisrea040" c="CEVENTO" lit="9000973" />" />&nbsp;
                                                    <img id="findEvento"  border="0" src="images/find.gif" style="cursor:pointer" onclick="f_abrir_axissin035()"/><%--${__formdata.CEVENTO}--%>
                                                        &nbsp;<span id="TEVENTO_span"><b>${__formdata.TEVENTO}</b></span>
                                                </td>    
                                            </axis:ocultar>
                                                                  
                                    <axis:ocultar f="axisrea040" c="CGARANT"> <!-- Linia 1. Columna 2. -->
                                    <td class="campocaja" colspan="1" id="td_CGARANT"> <%-- CGARANT --%>
                                        <select name="CGARANT" id="CGARANT" size="1" class="campowidthselect campo campotexto" onchange="" obligatorio="false"  style="width:90%;">                               
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea040" c="ALT_CGARANT_SEL" lit="108341"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listaGarantia}">
                                                <option value = "${element.CGARANT}" 
                                                <c:if test="${element.CGARANT == __formdata.CGARANT}"> selected </c:if> >
                                                 ${element.TGARANT} 
                                                </option>
                                            </c:forEach>
                                        </select>     
                                        </td>
                                    </axis:ocultar>    
                                  
                                 
                                 </tr>
                                  <tr>
                                     <axis:ocultar f="axisrea040" c="BT_REPARTE">
                                    <td colspan="4" align="right" >
                                        <input type="button" 
                                               class="boton" 
                                               id="BT_REPARTE" 
                                               onclick="f_but_reparte()" 
                                                value="<axis:alt c="LIT_REPARTE" f="axisrea040" lit="9000497" />" />

                                    </td>
                                    </axis:ocultar>
                                  </tr>
                                 
                            </tr>
                                
                                    <tr>
                                        <td class="titulocaja" colspan="6"> 
                                            <div class="separador">&nbsp; </div>                                                                                                                            
                                            <%-- DisplayTag Agentes --%>
                                            <c:set var="title0"><axis:alt f="axisrea040" c="EMPRESA" lit="101619"/></c:set>   <%-- Empresa --%>
                                            <c:set var="title1"><axis:alt f="axisrea040" c="REASEGURADORA" lit="9902909"/></c:set>   <%-- Producto --%>
                                            <c:set var="title2"><axis:alt f="axisrea040" c="REASEGURADORA" lit="9903030"/></c:set>   <%-- Reaseguradora --%>
                                            <c:set var="title3"><axis:alt f="axisrea040" c="CONTRATO" lit="101945"/></c:set>   <%-- Contrato --%>
                                            <c:set var="title4"><axis:alt f="axisrea040" c="VERSION" lit="9001146"/></c:set>  <%-- Version --%>
                                            <c:set var="title5"><axis:alt f="axisrea040" c="TRAMO" lit="9000609"/></c:set>  <%-- Tramo --%>
                                            <c:set var="title6"><axis:alt f="axisrea040" c="FCIERRE" lit="9000490"/></c:set>  <%-- Fecha cierre --%>
                                            <c:set var="title10"><axis:alt f="axisrea040" c="TDEBHAB" lit="9001948"/></c:set>  <%-- DEBHAB --%>
                                            <c:set var="title7"><axis:alt f="axisrea040" c="LTCONCEP" lit="9000715"/></c:set>  <%-- CONCEPTO --%>
                                            <c:set var="title8"><axis:alt f="axisrea040" c="LIIMPORT" lit="100563"/></c:set>  <%-- IMPORTE --%>
                                            <c:set var="title9"><axis:alt f="axisrea040" c="A_LIQUIDAR" lit="9001771"/></c:set>  <%-- Liquidar --%>
                                            <c:set var="total_filas">${fn:length(__formdata.LSTCUENTAS)}</c:set>  <%-- Total filas multirregistro --%>
                                       
                                             
                                            <div class="displayspaceMaximo"> 
                                                <input type="hidden" name="datos_num_lineas" id="datos_num_lineas" value="1" />
                                                <display:table name="${__formdata.LSTCUENTAS}" id="LSTCUENTAS" export="false" class="dsptgtable" pagesize="-1" style="width:98%"  defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                     requestURI="axis_axisrea040.do?paginar=true" excludedParams="datos_num_lineas" > 
                                                     <%@ include file="../include/displaytag.jsp"%>                                    
                                                   
                                                    <display:column title="${title2}" sortable="true" sortProperty="TCOMPANI" style="width:10%"   headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            
                                                                ${LSTCUENTAS.TCOMPANI}
                                                           
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true" sortProperty="TCONTRA" style="width:10%"  headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            <span style="text-decoration:underline;cursor:pointer" id="${LSTAGENTES.TNOMBRE}">
                                                                ${LSTCUENTAS.TCONTRA}
                                                            </span>
                                                        </div>
                                                    </display:column>
                                                    
                                                    <display:column title="${title4}" sortable="true" sortProperty="LNVERSIO" style="width:5%"    headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            
                                                                ${LSTCUENTAS.NVERSIO}
                                                           
                                                        </div>
                                                    </display:column>
                                                    
                                                    <display:column title="${title5}" sortable="true" sortProperty="LTTRAMO" style="width:10%"   headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            
                                                                ${LSTCUENTAS.TTRAMO}
                                                          
                                                        </div>
                                                    </display:column>
                                                    
                                                    <display:column title="${title6}" sortable="true" sortProperty="LFCIERRE" style="width:10%"   headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                           
                                                                <fmt:formatDate value='${LSTCUENTAS.FCIERRE}' pattern='dd/MM/yyyy'/> 
                                                           
                                                        </div>
                                                    </display:column>
                                                    
                                                    <display:column title="${title10}" sortable="true" sortProperty="LTDEBHAB" style="width:5%"   headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            
                                                                ${LSTCUENTAS.TDEBHAB}
                                                          
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title7}" sortable="true" sortProperty="LTCONCEP" style="width:5%"   headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            
                                                                ${LSTCUENTAS.TCONCEP}
                                                          
                                                        </div>
                                                    </display:column>
                                                    <%--display:column title="${title7}" sortable="false" sortProperty="TCORRED"  style="width:10%"  headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                           
                                                                ${LSTCUENTAS.TCORRED}
                                                           
                                                        </div>
                                                    </display:column--%>
                                                    <display:column title="${title8}" sortable="true" sortProperty="LIIMPORT"  style="width:10%"    headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspNumber">
                                                                <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${LSTCUENTAS.IIMPORT}"/>                                                                
                                                        </div>
                                                    </display:column>
                                                                                      
                                                </display:table>                                                        
                                            </div>
                                                                                           

<%-- durante la fase de desarrollo, aun no teniamos la conexion de JDE para recuperar CSVs, y por eso lo dejamos por el momento en comentarios
                                            <div class="separador">&nbsp; </div>    
                                            <b><axis:alt f="axisrea040" c="LISTADOS" lit="102146"/></b>
                                            <div class="displayspace"> 
                                                <display:table name="${__formdata.CSVs}" id="CSVs" export="false" class="dsptgtable" pagesize="-1" style="width:98%"  defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI=""> 
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="" sortable="false" headerClass="sortable headwidth5 fixed"  style="width:30%"   media="html" autolink="false">
                                                         <div class="dspText">${CSVs} <a target="CSVs" href="javascript:f_tunnel_doc('${CSVs.FILENAMEANDPATH}')">${CSVs.FILENAMEANDPATH}</a></div>
                                                    </display:column>
                                                </display:table>
                                            </div>
--%>                                            
                                        </td> 
                                    </tr>


                                </table>
                            </td>
                        </tr>                        
                    </table>
                </td>
            </tr>
        </table>
 <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea040</c:param><c:param name="__botones"><c:if test="${ __formdata.borrado != '1' && __formdata.borrado != null }">cancelar</c:if><axis:visible f="axisrea040" c ="BT_SALIR">,salir</axis:visible><axis:visible c="BT_GUARDAR" f="axisrea040"><c:if test="${ __formdata.guardado != '1' && __formdata.guardado != null }">,guardar</c:if></axis:visible></c:param></c:import>
       <div class="separador">&nbsp;</div>
    </form>
    <c:import url="../include/mensajes.jsp" />
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FCIERRE",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FCIERRE", 
            singleClick    :    true,
            firstDay       :    1
          
            
        });
   </script>

</body>
</html>