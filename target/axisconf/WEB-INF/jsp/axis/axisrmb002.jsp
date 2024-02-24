<%/*
*  Fichero: axisrmb002.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a> 
*
*  Fecha: 20/08/2008
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
    <title><axis:alt f="axisrmb002" c="TITULO" lit="9000439"/></title> <%-- CONSULTA DE REEMBOLSOS --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>

    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {   
            var SALTAR = "${__formdata.SALTAR}"; 
           
            if (!objUtiles.estaVacio(SALTAR) && SALTAR == 1) {
                  document.miForm.SALTAR.value = 0;
                  f_nou_fact();           
            }
            
            
            var ok = "${__formdata.OK_axisrmb005}";
            
            if (!objUtiles.estaVacio(ok) && ok == 0){
               f_abrir_modal('axisrmb005', true,'&NREEMB='+document.miForm.NREEMB.value+'&NFACT='+ ${__formdata.NFACTselected}+'&NLINEA=');
             }  
            //document.location.href = "#" +objDom.getValorComponente(document.miForm.NFACT);
            objEstilos.toggleDisplay("reembolsos", document.getElementById("reembolsos_parent"));
            objEstilos.toggleDisplay("facturas", document.getElementById("facturas_parent"));
            objEstilos.toggleDisplay("actos", document.getElementById("actos_parent"));
            
            var numReembolso = 0;// var numReembolso = {fn:length(__formdata.NREEMB)};
             <c:if test="${! empty __formdata.NREEMB}">numReembolso=${__formdata.NREEMB};</c:if>
                    
            if (numReembolso == 0) {   
               
                if(document.miForm.CMODO.value=="CONSULTA_REEMB"){   //
                //Abrir ventana modal de búsqueda
                    f_but_buscar();
                    objDom.setDisabledPorId("but_acto", true);
                    objDom.setDisabledPorId("but_fact", true);
                }else{
                //Abrir ventana modal de alta
                    f_but_buscarAlta();
                }
            }
            
           if (!objUtiles.estaVacio(ok) && ok == -1)
               alert("<axis:alt f="axisrmb002" c="ALERT_1000663" lit="1000663"/>");
            
            
           f_cargar_propiedades_pantalla();    
        }
        
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisrmb002", "cancelar", document.miForm, "_self");
        }
        
        function f_but_buscar() {
            f_abrir_modal('axisrmb001', true);
        }
        
        function f_but_alta() {
            f_abrir_modal('axisrmb008', true);
        }
        
        function f_but_nuevo(){
            document.miForm.NUEVO_REEMB.value = 1;
            f_abrir_modal('axisrmb003', true, "&SALTAR=1&SSEGURO="+document.miForm.SSEGURO.value+"&NRIESGO="+document.miForm.NRIESGO.value);   
        }
        
        /****************************************************************************************/
        /**********************************  FUNCIONES ALTA *************************************/
        /****************************************************************************************/
        
        function f_but_buscarAlta() {
            f_abrir_modal('axisrmb008', true);
        }

        function f_aceptar_axisrmb003(NREEMB,SALTAR){
            document.miForm.NREEMB.value = NREEMB;
            document.miForm.SALTAR.value = SALTAR;
            f_cerrar_axisrmb003(null);
            objUtiles.ejecutarFormulario("axis_axisrmb002.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_cerrar_axisrmb003(isNew) {
            objUtiles.cerrarModal("axisrmb003");

            if (document.miForm.NUEVO_REEMB.value!=1)
                if (!objUtiles.estaVacio(isNew)) 
                    if (isNew)
                        f_abrir_modal('axisrmb008', true);  
            
            document.miForm.NUEVO_REEMB.value = 0;
        }
        
        function f_cerrar_axisrmb005(){
            objUtiles.ejecutarFormulario("axis_axisrmb002.do", "borrar_errores", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
        
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
        function f_but_alta_factura(NFACTURA){
            f_abrir_modal('axisrmb004', true, '&NREEMB='+document.miForm.NREEMB.value+'&NFACT='+null);
        }
        
        function f_but_editar_factura(NFACTURA){
            document.miForm.NFACTURA.value = NFACTURA;
           objAjax.invokeAsyncCGI("axis_axisrmb002.do", callbackAjaxEditFactura, "operation=ajax_edit_factura&NREEMB="+document.miForm.NREEMB.value + "&NFACTURA=" + NFACTURA, this, objJsMessages.jslit_cargando);
        }
        
        function callbackAjaxEditFactura(ajaxResponseText) {
           try {     
               var doc=objAjax.domParse(ajaxResponseText);
               if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                     var NFACTURA = document.miForm.NFACTURA.value;
                     f_abrir_modal('axisrmb004', true, '&NREEMB='+document.miForm.NREEMB.value+'&NFACT='+NFACTURA);
               }
           } catch (e) {
              if (isDebugAjaxEnabled == "true")
                 alert (e.name + " " + e.message);
              }
           }    

        function f_but_editar_acto(NFACTURA,NLINEA){
            f_abrir_modal('axisrmb005', true, '&NREEMB='+document.miForm.NREEMB.value+'&NFACT='+NFACTURA+'&NLINEA='+NLINEA);
        }
      
        function f_cerrar_modal(cual,nfact) {
            objUtiles.cerrarModal(cual);
            if(cual=="axisrmb004"){
                 //recargar formulario
                 document.miForm.NFACTURA.value = nfact;
            
            if (!objUtiles.estaVacio(nfact))    {
                 f_print_factura (nfact);
            }else{
                objUtiles.ejecutarFormulario("axis_axisrmb002.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);        
            }
                 
            }
            if(cual=="axisrmb005"){
                 //recargar formulario
                 objUtiles.ejecutarFormulario("axis_axisrmb002.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            if(cual=="axisrmb008"){
                 //recargar formulario
                 f_abrir_modal('axisrmb001', true);
            }
        }

        function f_aceptar_modal(cual, params) {
            f_cerrar_modal(cual);
            if (cual == 'axisrmb001')
                objUtiles.ejecutarFormulario("axis_axisrmb002.do" + params, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_aceptar_axisrmb001(NREEMB,SSEGURO){
            f_cerrar_modal('axisrmb001');
            
            document.miForm.NREEMB.value = NREEMB;
            document.miForm.SSEGURO.value = SSEGURO;
            objUtiles.ejecutarFormulario("axis_axisrmb002.do", "init", document.miForm, "_self", objJsMessages.jslit_cargando);
            
        }
        function f_actualizar_actos(NFACTURA){
            document.miForm.NFACTURA.value = NFACTURA;
            objUtiles.ejecutarFormulario("axis_axisrmb002.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
    
function mostrar(nombreCapa,nombreDIV){ 
  objUtiles.scrollPoll(nombreCapa,nombreDIV);
} 

function ocultar(nombreCapa){             
    document.getElementById(nombreCapa).style.visibility="hidden"; 
} 
        
            
        function f_print_factura (NFACTURA) {
            objAjax.invokeAsyncCGI("axis_axisrmb002.do", callbackAjaxActFactura, "operation=ajax_act_factura&NREEMB="+document.miForm.NREEMB.value + "&NFACTURA=" + NFACTURA, this, objJsMessages.jslit_cargando);
        }

        function callbackAjaxActFactura(ajaxResponseText) {
           try {     
               var doc=objAjax.domParse(ajaxResponseText);
               if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                     var NFACTURA = document.miForm.NFACTURA.value;
                     var SSEGURO = document.miForm.SSEGURO.value;
                     objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_factura_tipo&NFACTURA="+NFACTURA+"&SSEGURO="+SSEGURO+"&NRIESGO="+document.miForm.NRIESGO.value+"&NREEMB="+document.miForm.NREEMB.value+"&TIPO=REEMBOLSOS");
               }
           } catch (e) {
              if (isDebugAjaxEnabled == "true")
                 alert (e.name + " " + e.message);
              }
        } 

        function f_cerrar_axisimprimir() {
              objUtiles.cerrarModal("axisimprimir");
              objUtiles.ejecutarFormulario("axis_axisrmb002.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);        
             //objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisrmb002", "cancelar", document.miForm, "_self");
        }

        function f_control_acto() {
        
            if (objValidador.validaEntrada()) {
               var PPNREEMB = document.miForm.NREEMB.value;
               var PPFACTURA = objDom.getValorPorId("NFACTURA");

               var PARAM = "?PPNREEMB="+ PPNREEMB + "&PNFACTURA=" + PPFACTURA;
               //alert (PARAM);
               objUtiles.ejecutarFormulario ("axis_axisrmb002.do"+PARAM, "control_acto", document.miForm, "_self");
               
              
           }
        }
        
        /*************************************************************************/
        /******************************** AJAX ***********************************/
        /*************************************************************************/
  
        // Aqui iria código ajax - pantalla axisctr003
        // *******************************************************************
        function f_consultar_pol() { // Consultar
        //alert("En consultar póliza");
        objUtiles.ejecutarFormulario("axis_axisrmb002.do", "consultar_pol", document.miForm, "_self", objJsMessages.jslit_cargando);
              
        }
        function f_but_151477(){
        f_consultar_pol();
        }
        
        function f_cerrar_axisrmb004(nreemb,nfact){
            objUtiles.cerrarModal('axisrmb004');
            document.miForm.NREEMB.value = nreemb;
            document.miForm.NFACTURA.value = nfact;
            
            if (!objUtiles.estaVacio(nfact))    {
                 f_print_factura (nfact);
            }else{
                objUtiles.ejecutarFormulario("axis_axisrmb002.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);        
            }
        }
        function f_nou_fact(){
          objUtiles.abrirModal("axisrmb004", "src", "modal_axisrmb004.do?operation=init&NREEMB="+document.miForm.NREEMB.value);   
        }
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisrmb002" c="TITULO" lit="9000439"/></c:param>     <%-- DE REEMBOLSOS --%>
                <c:param name="formulario"><axis:alt f="axisrmb002" c="TITULO" lit="9000439"/></c:param> <%-- CONSULTA DE REEMBOLSOS --%>
                <c:param name="form">axisrmb002</c:param>
        </c:import>
        <input type="hidden" name="NFACTURA" value="${__formdata.NFACTselected}" />
        <input type="hidden" name="NUEVO_REEMB" value="0" />
        <input type="hidden" name="operation" value="" />
        <input type="hidden" name="FORM_ACT" value="${__formdata.FORM_ACT}" />
        <input type="hidden" name="CMODO" value="${__formdata.CMODO}" />
        <input type="hidden" name="SSEGURO" value="${__formdata.SSEGURO}" />
        <input type="hidden" name="NRIESGO" value="${__formdata.NRIESGO}" />
        <input type="hidden" id = "SALTAR" name="SALTAR" value="${__formdata.SALTAR}" />
        
        <input type="hidden" name="DBAJA" />
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisrmb001|<axis:alt f="axisrmb002" c="TITULO" lit="9000439"/>#axisrmb003|<axis:alt f="axisrmb002" c="TIT_RMB003" lit="9000444"/>#axisrmb004|<axis:alt f="axisrmb002" c="TIT_RMB004" lit="9000467"/>#axisrmb005|<axis:alt f="axisrmb002" c="TIT_RMB005" lit="9000470"/>#axisrmb008|<axis:alt f="axisrmb002" c="TIT_RMB008" lit="9000444"/>#axisimprimir|<axis:alt f="axisrmb002" c="TIT_IMPRIMIR" lit="1000205" />|NoX</c:param>
        </c:import>

        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo">
                    </div>

                    <table class="seccion" align="center">
                        <tr>
                            <td align="left">
                                <table class="area" align="center">
                                    <%-- REEMBOLSOS --%>
                                    <tr>
                                        <th style="width:100%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <img id="reembolsos_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('reembolsos', this)" style="cursor:pointer"/> 
                                            <b><axis:alt f="axisrmb002" c="LIT_REEMB" lit="9000441"/></b> <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisrmb002" c="LIT_FIND" lit="9000508"/>" title="<axis:alt f="axisrmb002" c="LIT_FIND" lit="9000508"/>" onclick="f_abrir_modal('axisrmb001', true);" style="cursor:pointer"/>
                                            <axis:visible f="axisrmb002" c="BT_MODIF_REEMB">
                                                <c:if test="${! empty __formdata.NREEMB}">
                                                    <img id="find" border="0" src="images/lapiz.gif" alt="<axis:alt f='axisrmb002' c='BT_MODIF_REEMB' lit='9000552'/>" title="<axis:alt f='axisrmb002' c='BT_MODIF_REEMB' lit='9000552'/>" onclick="f_abrir_modal('axisrmb003', true,'&NREEMB='+document.miForm.NREEMB.value);" style="cursor:pointer"/>
                                                </c:if>
                                            </axis:visible>
                                            
                                            <hr class="titulo"/>
                                        </td>
                                    </tr>                                             
                                    <tr id="reembolsos_children" style="display:none">
                                        <td align="left">
                                             <table class="area" align="center">
                                                 <tr>
                                                    <th style="width:15%;height:0px"></th>
                                                    <th style="width:30%;height:0px"></th>
                                                    <th style="width:15%;height:0px"></th>
                                                    <th style="width:15%;height:0px"></th>                                                    
                                                    <th style="width:15%;height:0px"></th>                                                    
                                                    <th style="width:10%;height:0px"></th>                                                    
                                                </tr>
                                                <tr>
                                                    <%-- Nº reembolso --%>
                                                     <td class="titulocaja">
                                                        <b><axis:alt f="axisrmb002" c="NREEMB" lit="9001512"/></b>
                                                    </td> 
                                                    <%-- Póliza - Producto - Garantía --%>
                                                     <td class="titulocaja" colspan="3">  
                                                        <b><axis:alt f="axisrmb002" c="TPRODUCTO" lit="100836"/> - <axis:alt f="axisrmb002" c="LIT_100829" lit="100829"/> - <axis:alt f="axisrmb002" c="LIT_110994" lit="110994"/> - <axis:alt f="axisrmb002" c="LIT_9001021" lit="9001021"/></b>
                                                    </td> 
                                                    <%-- Estado --%>
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisrmb002" c="TESTADO" lit="100587"/></b>
                                                    </td>
                                                    <%-- Fecha Estado --%>
                                                     <td class="titulocaja">
                                                        <b><axis:alt f="axisrmb002" c="FESTADO" lit="9000450"/></b>
                                                    </td>                                                  
                                                </tr>
                                                <tr>
                                                    <%-- Estado --%>
                                                    <!--td class="campocaja">
                                                        <select name="CESTADO" id="CESTADO" size="1" class="campowidthselect campo campotexto" style="width:100%;">
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrmb002" c="CESTADO" lit="1000348"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.listaEstados}">
                                                                <option value = "${element.CESTADO}" 
                                                                    <c:if test="${element.CESTADO == __formdata.CESTADO}"> selected </c:if> />
                                                                    ${element.TESTADO} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </td-->
                                                     <%-- Nº Reembolso --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto" id="NREEMB" name="NREEMB" size="15" style="width:90%"
                                                        value="${__formdata.NREEMB}" readonly="readonly"/>
                                                    </td>
                                                     <%-- Póliza - Producto - Garantía --%>
                                                    <td class="campocaja" colspan="3">
                                                        <input type="text" class="campo campotexto" id="TPRODUCTO" name="TPRODUCTO" size="15" style="width:95%"
                                                        value="${__formdata.TPRODUCTO}" readonly="readonly"/>
                                                    </td> 
                                                    <%-- ESTADO --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto" id="TESTADO" name="TESTADO" size="15" style="width:100%"
                                                        value="${__formdata.TESTADO}" readonly="readonly"/>
                                                    </td>
                                                    <%-- Fecha Estado --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto" id="FESTADO" name="FESTADO" size="15" style="width:100%"
                                                        value="<fmt:formatDate value='${__formdata.FESTADO}' pattern='dd/MM/yyyy'/>" readonly="readonly"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                     <%--  Tomador --%>
                                                     <td class="titulocaja" colspan="2">
                                                        <b><axis:alt f="axisrmb002" c="TOMADOR" lit="101027"/></b>
                                                    </td>
                                                    <%-- Nombre --%>
                                                    <td class="titulocaja" colspan="2">
                                                        <b><axis:alt f="axisrmb002" c="NOMBRE" lit="105940"/></b>
                                                    </td>
                                                    <%-- Nº CASS --%>
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisrmb002" c="NCASS_ASE" lit="9000523"/></b>
                                                    </td> 
                                                    <%-- CCC Hospital --%>
                                                    <axis:ocultar f="axisrmb002" c="CBANHOSP" dejarHueco="false" >
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axisrmb002" c="CBANHOSP" lit="9901858"/></b>
                                                        </td> 
                                                    </axis:ocultar>
                                                </tr>
                                                <tr>
                                                     <%-- Tomador --%>
                                                    <td class="campocaja" colspan="2">
                                                        <input type="text" class="campo campotexto" id="TOMADOR" name="TOMADOR" size="15" style="width:90%"
                                                        value="${__formdata.NOMBRE_TOM}" readonly="readonly"/>
                                                    </td> 
                                                    <%-- Nombre --%>
                                                    <td class="campocaja" colspan="2">
                                                        <input type="text" class="campo campotexto" id="NOMBRE" name="NOMBRE" size="55" style="width:95.3%"
                                                        value="${__formdata.NOMBRE_ASEG}" readonly="readonly"/>
                                                    </td>
                                                    <%-- Nº CASS --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto" id="NCASS_ASE" name="NCASS_ASE" size="15" style="width:50%"
                                                        value="${__formdata.NCASS_ASE}" readonly="readonly"/>
                                                    </td>  
                                                    <%-- CCC hospital --%>
                                                    <axis:ocultar f="axisrmb002" c="CBANHOSP" dejarHueco="false" >
                                                        <td class="campocaja">
                                                            <input type="checkbox" id="CBANHOSP" name="CBANHOSP"
                                                            value="${__formdata.CBANHOSP}" readonly="readonly" disabled="disabled"
                                                            <c:if test="${__formdata.CBANHOSP == '1'}">checked="true"</c:if>
                                                            <axis:atr f="axisrmb002" c="CBANHOSP" a="modificable=false"/> />
                                                        </td>  
                                                    </axis:ocultar>
                                                </tr>
                                                
                                                <!-- SECCION ***************************************** -->
                                                
                                                <table  align="center">
                                                    <tr>
                                                        <td align="left">
                                                            <table class="area" align="center">
                                                                <%-- REEMBOLSOS --%>
                                                                <tr>
                                                                    <th style="width:100%;height:0px"></th>
                                                                </tr>
                                                                <tr>
                                                                    <td class="campocaja">
                                                                        <img id="masdatos_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('masdatos', this)" style="cursor:pointer"/> 
                                                                        <b><axis:alt f="axisrmb002" c="LIT_MASDATOS" lit="1000310"/></b>
                                                                        <hr class="titulo"/>
                                                                    </td>
                                                                </tr>                                             
                                                                <tr id="masdatos_children" style="display:none">
                                                                
                                                                <!-- SUBSECCION -->
                                                                
                                                                <td align="left">
                                                                 <table class="area" align="center">
                                                                     <tr>
                                                                        <th style="width:20%;height:0px"></th>
                                                                        <th style="width:20%;height:0px"></th>
                                                                        <th style="width:20%;height:0px"></th>
                                                                        <th style="width:20%;height:0px"></th>                                                    
                                                                        <th style="width:20%;height:0px"></th>                                                    
                                                                    </tr>
                                                                    <!-- AREA CAMPOS -->
                                                                    
                                                                    <tr>
                                                     <%-- Origen --%>
                                                     <td class="titulocaja">
                                                        <b><axis:alt f="axisrmb002" c="TORIGEN" lit="9000443"/></b>
                                                    </td>
                                                    <%-- Oficina --%>
                                                     <!--td class="titulocaja">
                                                        <b><axis:alt f="axisrmb002" c="COFICINA" lit="9000436"/></b>
                                                    </td-->
                                                    <%-- Cuenta bancaria --%>
                                                     <td class="titulocaja" colspan="2">
                                                        <b><axis:alt f="axisrmb002" c="CBANCAR" lit="100965"/></b>
                                                    </td>
                                                    <%-- Usuario --%>
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisrmb002" c="USUARIO" lit="100894"/></b>
                                                    </td>
                                                    <%-- Fecha alta --%>
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisrmb002" c="FALTA" lit="9000437"/></b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <%-- Origen --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto" id="TORIGEN" name="TORIGEN" size="15" style="width:90%"
                                                        value="${__formdata.TORIGEN}" readonly="readonly"/>
                                                    </td> 
                                                    <%-- Oficina --%>
                                                    <!--td class="campocaja">
                                                        <input type="text" class="campo campotexto" id="COFICINA" name="COFICINA" size="15" style="width:90%"
                                                        value="${__formdata.COFICINA}" readonly="readonly"/>
                                                    </td-->
                                                    <%-- Cuenta bancaria --%>
                                                    <td class="campocaja" colspan="2">
                                                        <input type="text" class="campo campotexto" id="CBANCAR" name="CBANCAR" size="15" style="width:90%"
                                                        value="${__formdata.CBANCAR}" readonly="readonly"/>
                                                    </td>
                                                    <%-- Usuario --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto" id="CUSUALTA" name="CUSUALTA" size="55" style="width:90%"
                                                        value="${__formdata.CUSUALTA}" readonly="readonly"/>
                                                    </td>
                                                    <%-- Fecha alta --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto" id="FALTA" name="FALTA" size="15" style="width:90%"
                                                        value="<fmt:formatDate value='${__formdata.FALTA}' pattern='dd/MM/yyyy'/>" readonly="readonly"/>                                                    
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <%-- Observaciones --%>
                                                    <axis:ocultar f="axisrmb002" c="TOBSERV" dejarHueco="false" >
                                                    <td class="titulocaja" colspan="5">
                                                        <b><axis:alt f="axisrmb002" c="TOBSERV" lit="101162"/></b>
                                                    </td>          
                                                    </axis:ocultar>
                                                
                                                </tr>
                                                <tr>
                                                    <%-- Observaciones --%>
                                                    <axis:ocultar f="axisrmb002" c="TOBSERV" dejarHueco="false">
                                                    <td class="campocaja" colspan="5">
                                                        <textarea cols="0" rows="3" class="campo campotexto" id="TOBSERV" name="TOBSERV" size="15" 
                                                        style="width:95.3%;overflow:hidden" readonly="readonly">${__formdata.TOBSERV}</textarea>
                                                    </td>  
                                                    </axis:ocultar>
                                              
                                                </tr>
                                                    <!-- AREA CAMPOS -->
                                                                
                                                                <!-- SUBSECCION -->
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </td>

                                                    <tr>
                                                        <td align="right">
                                                            <div class="separador">&nbsp;</div>
                                                            <axis:visible f="axisrmb002" c="BT_NOU_REEMB">
                                                                <input type="button" id="BT_NOU_REEMB" class="boton" value="<axis:alt f="axisrmb002" c="LIT_NOU" lit="1000428"/>" onclick="f_but_nuevo();"/>
                                                            </axis:visible>
                                                        </td>
                                                    </tr>
                                                </table>    
                                                
                                                
                                                <!-- SECCION ***************************************** -->
                                                
                                                <!-- aqi  -->

                                            </table>        
                                        </td> 
                                    </tr>       
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                    <table class="area" align="center">
                                    <%-- FACTURAS --%>
                                    <tr>
                                        <th style="width:100%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <img id="facturas_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('facturas', this)" style="cursor:pointer"/> 
                                            <b><axis:alt f="axisrmb002" c="LIT_FACTURAS" lit="9000442"/></b>
                                            <hr class="titulo"/>
                                        </td>
                                    </tr>                                                
                                    <tr id="facturas_children" style="display:none">
                                        <td align="left">
                                             <table class="area" align="center">
                                                 <tr>
                                                    <th style="width:100%;height:0px"></th>                                                    
                                                </tr>
                                                <tr>                                                    
                                                    <td class="titulocaja">
                                                        <%-- DisplayTag Facturas --%>
                                                        <c:set var="title0"><axis:alt f="axisrmb002" c="NFACT" lit="9000445"/></c:set>  <%-- Nº Fact. --%>
                                                        <c:set var="title1"><axis:alt f="axisrmb002" c="NFACT_CLI" lit="9000650"/></c:set>  <%-- Nº Fact. Cli. --%>
                                                        <c:set var="title2"><axis:alt f="axisrmb002" c="FBAJA" lit="9000447"/></c:set>  <%-- F. Baja --%>
                                                        <c:set var="title3"><axis:alt f="axisrmb002" c="NCASS_ASE_TIT" lit="9001516"/></c:set>  <%-- Nº CASS Titular. --%>
                                                        <c:set var="title4"><axis:alt f="axisrmb002" c="NCASS_MAL" lit="9000448"/></c:set>  <%-- Nº CASS Malalt --%>
                                                        <c:set var="title5"><axis:alt f="axisrmb002" c="TTIPOFAC" lit="100565"/></c:set>   <%-- Tipo --%>
                                                        <c:set var="title6"><axis:alt f="axisrmb002" c="FFACTURA" lit="9000451"/></c:set>   <%-- F. Factura --%>
                                                        <c:set var="title7"><axis:alt f="axisrmb002" c="FACUSE" lit="9000453"/></c:set>   <%-- F. Acuse --%>
                                                        <c:set var="title8"><axis:alt f="axisrmb002" c="FALTA" lit="9000437"/></c:set>  <%-- F. Alta --%>
                                                        <c:set var="title9"><axis:alt f="axisrmb002" c="CUSUALTA" lit="9000454"/></c:set>   <%-- Usuario Alta --%>
                                                        <c:set var="title10"><axis:alt f="axisrmb002" c="IMPFACT" lit="100563"/></c:set> <%-- Importe --%>
                                                        <c:set var="title11"><axis:alt f="axisrmb002" c="LIT_EDITAR" lit="100002"/></c:set>  <%-- Editar --%>
                                                        <c:set var="title12"><axis:alt f="axisrmb002" c="LIT_JUSTIF" lit="9000587"/></c:set>  <%-- Justificant --%>
                                                        <c:set var="title13"><axis:alt f="axisrmb002" c="CTRACTAT" lit="9901851"/></c:set>  <%-- Tractada --%>
                                                       <div id="dt_recibos" class="seccion displayspace">
                                                            <display:table name="${__formdata.listaFacturas}"  id="LSTFACTURAS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                 requestURI="axis_axisrmb002.do?operation=form&paginar=true">
                                                                 <%@ include file="../include/displaytag.jsp"%>
                                                                 <display:column headerClass="headwidth5 sortable fixed" title="" media="html" autolink="false" >
                                                                    <div class="dspIcons">
                                                                    <input value="${LSTFACTURAS.OB_IAX_REEMBFACT.NFACT}" <c:if test="${LSTFACTURAS.OB_IAX_REEMBFACT.NFACT==__formdata.NFACTselected}">checked</c:if> type="radio" id="radioNFACT" name="radioNFACT" onclick="javascript:f_actualizar_actos(${LSTFACTURAS.OB_IAX_REEMBFACT.NFACT})" selected="true"/>
                                                                    </div>
                                                                </display:column>
                                                                <display:column title="${title0}" sortable="true" sortProperty="${LSTFACTURAS.OB_IAX_REEMBFACT.NFACT}" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                    <div class="dspNumber">
                                                                    ${LSTFACTURAS.OB_IAX_REEMBFACT.NFACT}
                                                                    </div>
                                                                </display:column>
                                                                <display:column title="${title1}" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                    <div class="dspNumber">
                                                                    ${LSTFACTURAS.OB_IAX_REEMBFACT.NFACT_CLI}
                                                                    </div>
                                                                </display:column>
                                                                <display:column title="${title2}" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                    <div class="dspDate">
                                                                    <fmt:formatDate value='${LSTFACTURAS.OB_IAX_REEMBFACT.FBAJA}' pattern='dd/MM/yyyy'/>
                                                                    </div>
                                                                </display:column>
                                                                <display:column title="${title4}" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                    <div class="dspNumber">
                                                                    ${LSTFACTURAS.OB_IAX_REEMBFACT.NCASS}
                                                                    </div>
                                                                </display:column>
                                                                <display:column title="${title3}" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                    <div class="dspNumber">
                                                                    ${LSTFACTURAS.OB_IAX_REEMBFACT.NCASS_ASE}
                                                                    </div>
                                                                </display:column>
                                                                <display:column title="${title5}" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                    <div class="dspText">
                                                                    ${LSTFACTURAS.OB_IAX_REEMBFACT.TTIPOFAC}
                                                                    </div>
                                                                </display:column>
                                                                <display:column title="${title6}" sortable="true" sortProperty="" headerClass="sortable fixed" media="html" autolink="false" >
                                                                     <div class="dspDate">
                                                                     <fmt:formatDate value='${LSTFACTURAS.OB_IAX_REEMBFACT.FFACTURA}' pattern='dd/MM/yyyy'/> 
                                                                    </div>
                                                                </display:column>
                                                                <display:column title="${title7}" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                    <div class="dspDate">
                                                                    <fmt:formatDate value='${LSTFACTURAS.OB_IAX_REEMBFACT.FACUSE}' pattern='dd/MM/yyyy'/> 
                                                                    </div>
                                                                </display:column>
                                                                <display:column title="${title9}" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                     <div class="dspText">
                                                                     ${LSTFACTURAS.OB_IAX_REEMBFACT.CUSUALTA}
                                                                    </div>
                                                                </display:column>
                                                                <display:column title="${title10}" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                     <div class="dspNumber">
                                                                     <fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${LSTFACTURAS.OB_IAX_REEMBFACT.IMPFACT}' />
                                                                    </div>
                                                                </display:column>
                                                                <axis:visible f="axisrmb002" c="CTRACTAT">
                                                                    <display:column title="${title13}" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                        <div class="dspIcons">
                                                                            <input type="checkbox" id="CTRACTAT" name="CTRACTAT" value="${LSTFACTURAS.OB_IAX_REEMBFACT.CTRACTAT}"
                                                                                   disabled="disabled" <c:if test="${LSTFACTURAS.OB_IAX_REEMBFACT.CTRACTAT=='1'}">checked</c:if> />
                                                                        </div>    
                                                                    </display:column>
                                                                </axis:visible>
                                                                
                                                                <axis:visible f="axisrmb002" c="BT_MODIF_REEMBFACT">
                                                                <display:column title="${title11}" headerClass="headwidth5 sortable fixed" media="html" autolink="false" >
                                                                <div class="dspIcons"><img border="0" title="<axis:alt f="axisrmb002" c="LIT_EDITAR" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                                alt="<axis:alt f='axisrmb002' c='BT_MODIF_REEMBFACT' lit='9000552'/>" title="<axis:alt f='axisrmb002' c='BT_MODIF_REEMBFACT' lit='9000552'/>" style="cursor:pointer;vertical-align:middle;" onclick="f_but_editar_factura('${LSTFACTURAS.OB_IAX_REEMBFACT.NFACT}')"/></div><!--Editar una factura -->
                                                                </display:column>
                                                                </axis:visible>
                                                                
                                                                <display:column title="${title12}" headerClass="headwidth5 sortable fixed" media="html" autolink="false" >
                                                                <div class="dspIcons" style="vertical-align:bottom"><img border="0" alt="<axis:alt f="axisrmb002" c="LIT_DETMOV" lit="140280"/>" title="<axis:alt f="axisrmb002" c="LIT_EMIT_JUSTIF" lit="9000591"/>" src="images/print.gif" width="15px" height="15px"
                                                                style="cursor:pointer;vertical-align:middle;" onclick="f_print_factura(${LSTFACTURAS.OB_IAX_REEMBFACT.NFACT})"/></div><!--Editar una factura -->
                                                                </display:column>
                                                            </display:table>                                                        
                                                        </div>
                                                    </td>                                                
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <div class="separador">&nbsp;</div>
                                                         <axis:visible f="axisrmb002" c="BT_FACTURA">
                                                            <input type="button" id="but_fact" class="boton" value="<axis:alt f="axisrmb002" c="BT_FACTURA" lit="1000428"/>" onclick="f_nou_fact();"/>
                                                         </axis:visible>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>                                    
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                    <table class="area" align="center">
                                    <%-- ACTOS --%>
                                    <tr>
                                        <th style="width:100%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <img id="actos_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('actos', this)" style="cursor:pointer"/> 
                                            <b><axis:alt f="axisrmb002" c="LIT_ACTOS" lit="9000466"/></b>
                                            <hr class="titulo"/>
                                        </td>
                                    </tr>                                                
                                    <tr id="actos_children" style="display:none">
                                        <td align="left">
                                             <table class="area" align="center">
                                                 <tr>
                                                    <th style="width:100%;height:0px"></th>                                                    
                                                </tr>
                                                <tr>                                                    
                                                    <td class="titulocaja">
                                                        <%-- DisplayTag Actos --%>
                                                        <c:set var="title0"><axis:alt f="axisrmb002" c="NLINEA" lit="9000455"/></c:set>  <%-- Nº Linea --%>
                                                        <c:set var="title1"><axis:alt f="axisrmb002" c="TDESACTO" lit="9000456"/></c:set>  <%-- Acto --%>
                                                        <c:set var="title2"><axis:alt f="axisrmb002" c="FBAJA" lit="9000447"/></c:set>  <%-- F. Baja --%>
                                                        <c:set var="title3"><axis:alt f="axisrmb002" c="NACTO" lit="9000457"/></c:set>  <%-- Nº Actos --%>
                                                        <c:set var="title4"><axis:alt f="axisrmb002" c="FACTO" lit="9000458"/></c:set>  <%-- F. Acto --%>
                                                        <c:set var="title5"><axis:alt f="axisrmb002" c="ITARCASS" lit="9000459"/></c:set>  <%-- Tarifa CASS --%>
                                                        <c:set var="title6"><axis:alt f="axisrmb002" c="ICASS" lit="9000460"/></c:set>  <%-- Imp. CASS --%>
                                                        <c:set var="title7">%</c:set>                             <%-- % --%>
                                                        <c:set var="title8"><axis:alt f="axisrmb002" c="IEXTRA" lit="9000461"/></c:set>  <%-- Imp. Extra --%>
                                                        <c:set var="title9"><axis:alt f="axisrmb002" c="ITOT" lit="9000462"/></c:set>  <%-- Imp. Total --%>
                                                        <c:set var="title10"><axis:alt f="axisrmb002" c="IPAGO" lit="9000463"/></c:set> <%-- Imp. Pago --%>
                                                        <c:set var="title11"><axis:alt f="axisrmb002" c="CERROR" lit="100587"/></c:set>  <%-- Estado --%>
                                                        <c:set var="title12"><axis:alt f="axisrmb002" c="FTRANS" lit="9000465"/></c:set> <%-- F. Trans --%>
                                                        <c:set var="title13"><axis:alt f="axisrmb002" c="LIT_EDITAR" lit="100002"/></c:set>  <%-- Editar --%>
                                                        <c:set var="title14"><axis:alt f="axisrmb002" c="LIT_OTROS_DATOS" lit="1000310"/></c:set>  <%-- Altres dades --%>
                                                        <div id="dt_recibos" class="seccion displayspace">
                                                            <display:table name="${__formdata.listaActosParcial}" id="LSTACTOS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                 requestURI="axis_axisrmb002.do?operation=form&paginar=true">
                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                <display:setProperty name="paging.banner.placement" value="both" />
                                                               

                                                                <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_REEMBACTFACT.NLINEA" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                    <div class="dspNumber">
                                                                    ${LSTACTOS.OB_IAX_REEMBACTFACT.NLINEA}
                                                                    </div>
                                                                </display:column>
                                                                <axis:visible f="axisrmb002" c="TDESACTO"> 
                                                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_REEMBACTFACT.TDESACTO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                        <div class="dspText">
                                                                        ${LSTACTOS.OB_IAX_REEMBACTFACT.TDESACTO}
                                                                        </div>
                                                                    </display:column>
                                                                </axis:visible>
                                                                <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_REEMBACTFACT.FBAJA" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                    <div class="dspText">
                                                                    <fmt:formatDate value='${LSTACTOS.OB_IAX_REEMBACTFACT.FBAJA}' pattern='dd/MM/yyyy'/>
                                                                    </div>
                                                                </display:column>
                                                                <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_REEMBACTFACT.NACTO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                    <div class="dspText">
                                                                    ${LSTACTOS.OB_IAX_REEMBACTFACT.NACTO}
                                                                    </div>
                                                                </display:column>
                                                                <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_REEMBACTFACT.FACTO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                    <div class="dspText">
                                                                    <fmt:formatDate value='${LSTACTOS.OB_IAX_REEMBACTFACT.FACTO}' pattern='dd/MM/yyyy'/>
                                                                    </div>
                                                                </display:column>
                                                                <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_REEMBACTFACT.ITARCASS" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                    <div class="dspText">
                                                                    <fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${LSTACTOS.OB_IAX_REEMBACTFACT.ITARCASS}' />
                                                                    </div>
                                                                </display:column>
                                                                <display:column title="${title6}" sortable="true" sortProperty="ICASS" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                    <div class="dspText">
                                                                    <fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${LSTACTOS.OB_IAX_REEMBACTFACT.ICASS}' />
                                                                    </div>
                                                                </display:column>
                                                                <display:column title="${title7}" sortable="true" sortProperty="PREEMB" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                     <div class="dspText">
                                                                     ${LSTACTOS.OB_IAX_REEMBACTFACT.PREEMB}
                                                                    </div>
                                                                </display:column>
                                                                <display:column title="${title8}" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                     <div class="dspText">
                                                                     <fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${LSTACTOS.OB_IAX_REEMBACTFACT.IEXTRA}' />
                                                                    </div>
                                                                </display:column>
                                                                <display:column title="${title9}" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                     <div class="dspText">
                                                                     <fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${LSTACTOS.OB_IAX_REEMBACTFACT.ITOT}' />
                                                                    </div>
                                                                </display:column>
                                                                <display:column title="${title10}" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                     <div class="dspText">
                                                                     <fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${LSTACTOS.OB_IAX_REEMBACTFACT.IPAGO}' />
                                                                    </div>
                                                                </display:column>
                                                                <display:column title="${title11}" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                     <div class="dspNumber">
                                                                    ${LSTACTOS.OB_IAX_REEMBACTFACT.CERROR}
                                                                    </div>
                                                                </display:column>
                                                               
                                                                <axis:visible f="axisrmb002" c="BT_MODIF_REEMBFACTACT"> 
                                                                    <display:column title="${title13}" headerClass="headwidth5 sortable fixed" media="html" autolink="false" >
                                                                    <div class="dspIcons"><img border="0" alt="<axis:alt f='axisrmb002' c='BT_MODIF_REEMBFACTACT' lit='9000552'/>" title="<axis:alt f='axisrmb002' c='BT_MODIF_REEMBFACTACT' lit='9000552'/>" src="images/lapiz.gif" width="15px" height="15px"
                                                                    style="cursor:pointer;vertical-align:middle;" onclick="f_but_editar_acto(${__formdata.NFACTselected},${LSTACTOS.OB_IAX_REEMBACTFACT.NLINEA})"/></div>
                                                                    </display:column>
                                                                </axis:visible>
                                                               
                                                                <display:column headerClass="headwidth5 sortable fixed" title="${title14}" media="html" autolink="false" >
                                                                <div class="dspIcons">
                                                                  <a href="javascript:void(0)" onmouseout="javascript:ocultar('SECCION_${LSTACTOS.OB_IAX_REEMBACTFACT.NLINEA}')" onmouseover="javascript:mostrar('SECCION_${LSTACTOS.OB_IAX_REEMBACTFACT.NLINEA}','dt_recibos')">
                                                                    <img border="0" alt="<axis:alt f="axisrmb002" c="LIT_INFORMACION" lit="1000577"/>" title="${title14}" src="images/informacion.gif"/>
                                                                  </a>
                                                                </div>
                                                                </display:column>
                                                                <display:column class="seccion_informacion">
                                                                    <div id="SECCION_${LSTACTOS.OB_IAX_REEMBACTFACT.NLINEA}" class="seccion_informacion" style="width:650px">
                                                                        <!-- INICIO SECCION -->
                                                                        <table class="area" align="center">
                                                                             <tr>
                                                                                <th style="width:15%;height:0px"></th>
                                                                                <th style="width:15%;height:0px"></th>
                                                                                <th style="width:15%;height:0px"></th>
                                                                                <th style="width:15%;height:0px"></th>
                                                                                <th style="width:15%;height:0px"></th>
                                                                                <th style="width:15%;height:0px"></th>                                                                          
                                                                                                                                  
                                                                            </tr>
                                                                            <tr>
                                                                                <%-- Tarifa Cass --%>
                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axisrmb002" c="ITARCASS_AUX" lit="9000459"/></b>
                                                                                </td>
                                                                                <%-- Importe CASS --%>
                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >
                                                                                    <b><axis:alt f="axisrmb002" c="ICASS_AUX" lit="9000460"/></b>
                                                                                </td>                                                  
                                                                                 <%-- % --%>
                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b>%</b>
                                                                                </td> 
                                                                                <%-- Importe Extra --%>
                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axisrmb002" c="IEXTRA_AUX" lit="9000461"/></b>
                                                                                </td>
                                                                                <%-- Importe total --%>
                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axisrmb002" c="ITOT_AUX" lit="9000462"/></b>
                                                                                </td>                                                  
                                                                                 <%-- Importe Pago --%>
                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axisrmb002" c="IPAGO_AUX" lit="9000463"/></b>
                                                                                </td>   
                                                                                
                                                                                 <%-- Importe Complemento --%>
                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axisrmb002" c="IPAGO_CMP" lit="9001986"/></b>
                                                                                </td>   
                                                                                                                                                                
                                                                                
                                                                                                
                                                                            </tr>
                                                                            <tr>
                                                                                 <%-- Tarifa Cass --%>
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="ITARCASS_AUX" name="ITARCASS_AUX" size="15" style="width:90%"
                                                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${LSTACTOS.OB_IAX_REEMBACTFACT.ITARCASS}' />" readonly="readonly"/>
                                                                                </td>
                                                                                 <%-- Importe CASS --%>
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="ICASS_AUX" name="ICASS_AUX" size="15" style="width:90%"
                                                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${LSTACTOS.OB_IAX_REEMBACTFACT.ICASS}' />" readonly="readonly"/>
                                                                                </td>
                                                                                <%-- % --%>
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="PREEMB_AUX" name="PREEMB_AUX" size="15" style="width:90%"
                                                                                    value="${LSTACTOS.OB_IAX_REEMBACTFACT.PREEMB}" readonly="readonly"/>
                                                                                </td>
                                                                                 <%-- Importe Extra --%>
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="IEXTRA_AUX" name="IEXTRA_AUX" size="15" style="width:90%"
                                                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${LSTACTOS.OB_IAX_REEMBACTFACT.IEXTRA}' />" readonly="readonly"/>
                                                                                </td>
                                                                             
                                                                                <%-- Importe total --%>
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="ITOT_AUX" name="ITOT_AUX" size="15" style="width:90%"
                                                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${LSTACTOS.OB_IAX_REEMBACTFACT.ITOT}' />" readonly="readonly"/>
                                                                                </td>
                                                                                 <%-- Importe Pago --%>
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="IPAGO_AUX" name="NREEMB_AUX" size="15" style="width:90%"
                                                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${LSTACTOS.OB_IAX_REEMBACTFACT.IPAGO}' />" readonly="readonly"/>
                                                                                </td>

                                                                                 <%-- Importe Complemento --%>
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="IPAGO_CMP" name="PAGO_CMP" size="15" style="width:90%"
                                                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${LSTACTOS.OB_IAX_REEMBACTFACT.IPAGOCOMP}' />" readonly="readonly"/>
                                                                                </td>
                                                                                
                                                                            </tr>
                                                                            <tr>
                                                                                <%-- Cod Error --%>
                                                                                <td class="titulocaja" colspan="5" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axisrmb002" c="CERROR_AUX" lit="100587"/></b>
                                                                                </td>
                                                                                <%-- F Trans --%>
                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axisrmb002" c="FTRANS_AUX" lit="9000465"/></b>
                                                                                </td>                                                  
                                                                                
                                                                                <%-- F Trans Comp --%>
                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axisrmb002" c="FTRANS_CMP" lit="9001987"/></b>
                                                                                </td>                                                                                                           
                                                                            </tr>
                                                                            <tr>
                                                                            
                                                                                <td class="campocaja" colspan="5" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="CERROR_AUX" name="CERROR_AUX" size="15" style="width:90%"
                                                                                    value="${LSTACTOS.OB_IAX_REEMBACTFACT.TERROR}" readonly="readonly"/>
                                                                                </td>
                                                                                <%-- Fecha Estado --%>
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="FTRANS_AUX" name="FTRANS_AUX" size="15" style="width:90%"
                                                                                    value="<fmt:formatDate value='${LSTACTOS.OB_IAX_REEMBACTFACT.FTRANS}' pattern='dd/MM/yyyy'/>" readonly="readonly"/>
                                                                                </td>
                                                                                <%-- Fecha Estado Comp--%>
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="FTRANS_CMP" name="FTRANS_CMP" size="15" style="width:90%"
                                                                                    value="<fmt:formatDate value='${LSTACTOS.OB_IAX_REEMBACTFACT.FTRANSCOMP}' pattern='dd/MM/yyyy'/>" readonly="readonly"/>
                                                                                </td>                                                                                
                                                                            </tr>
                                                                            </table>
                                                                             <!-- INICIO SECCION -->                                                                        
                                                                    </div>
                                                                </display:column>
                                                                                                                                                
                                                            </display:table>                                                        
                                                        </div>
                                                    </td>                                                
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <div class="separador">&nbsp;</div>
                                                        <axis:visible f="axisrmb002" c="BT_ACTO">
                                                            <c:if test="${__formdata.NFACTselected!=null}">
                                                                <input type="button" id="but_acto" class="boton" value="<axis:alt f="axisrmb002" c="BT_ACTO" lit="1000428"/>" onclick="f_control_acto();"/>
                                                            </c:if>
                                                            <c:if test="${__formdata.NFACTselected==null}">
                                                                <input type="button" id="but_acto" class="boton" disabled="true" value="<axis:alt f="axisrmb002" c="BT_ACTO" lit="1000428"/>" onclick=""/>
                                                            </c:if>
                                                        </axis:visible>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>                                    
                                </table>
                            </td>
                        </tr>                        
                    </table>
                </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrmb002</c:param>
            <c:param name="__botones">salir<axis:visible f="axisrmb002" c="BT_CONSULTAPOL">,151477</axis:visible></c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
</body>
</html>
