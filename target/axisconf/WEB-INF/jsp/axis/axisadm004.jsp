<%/**
*  Fichero: axisadm004.jsp
*  Pantalla inicial Contabilidad
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo Flores</a>  
*  Fecha: 11/08/2008
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
        <title><axis:alt f="axisadm004" c="FORM" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
            
              f_cargar_propiedades_pantalla();                
            
                    objDom.setDisabledPorId("but_9000491",true); //boton cierre
                    objDom.setDisabledPorId("but_1000439",true); //boton consulta
                    objDom.setDisabledPorId("but_9000497",true); //boton generar
                    objDom.setDisabledPorId("but_9000569",true); //boton informe
            
            valida_botonera(); //Función que valida si las opciones de menú deben marcarse o no.
            // Desahabilitamos los botones al cargar inicialmente la pantalla
                     //objDom.setDisabledPorId("but_9000498",true); //boton consultar simulacion
                     //objDom.setDisabledPorId("but_9000491",true); //boton cierre
            // Si al generar ha ido OK==0 se activan los botones de Consultar Simulacion y el de Cierre
                <c:if test="${__formdata.tipo_listado == 1}" >
                     objDom.setVisibilidadPorId("texto_cuadre", "visible");
                     objDom.setVisibilidadPorId("texto_historico", "hidden");
                     //objDom.setVisibilidadPorId("img_historico", "hidden");
                </c:if>
                
                <c:if test="${__formdata.tipo_listado == 0}" >
                     objDom.setVisibilidadPorId("texto_cuadre", "hidden");
                     objDom.setVisibilidadPorId("texto_historico", "visible");
                     //objDom.setVisibilidadPorId("img_historico", "visible");
                </c:if>
                
                
                <c:if test="${fn:length(sessionScope.axisadm_listaEmpresas) < 2 }">
                    document.miForm.CEMPRES.disabled = true;
                </c:if>
                
                 
                
            }
            
            
            
             function habilitar_empresa(){
                document.miForm.CEMPRES.disabled = false;
             }
                 
            function f_but_salir() {
                habilitar_empresa();
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm004", "cancelar", document.miForm, "_self");
            }
              
            //function f_but_9000498() {
                //alert("En ver simulacion");
                //objUtiles.ejecutarFormulario ("axis_axisadm004.do", "visualizar_sim", document.miForm, "_self", objJsMessages.jslit_cargando);
            //} 
            
            function f_but_1000439 (){
                if(document.miForm.CEMPRES.value >= 0 && document.miForm.PANY.value >0 && document.miForm.PMES.value>0 && document.miForm.NMESES.value>0){
                    habilitar_empresa();
                    objUtiles.ejecutarFormulario ("axis_axisadm004.do", "visualizar_sim", document.miForm, "_self", objJsMessages.jslit_cargando);
                }else{
                    alert('<axis:alt f="axisadm004" c="ERR_MES" lit='9000505' />');
                }
            }
            
            function f_but_9000497() {
                //alert("En generar");
                habilitar_empresa();
                objUtiles.ejecutarFormulario ("axis_axisadm004.do", "generar", document.miForm, "_self", objJsMessages.jslit_cargando);
            } 
            
            
            
            
            function f_but_9000491() {
                //alert("En cierre");
                var codigo_mes = document.miForm.PMES.value;
                 while(codigo_mes.length < 2){ 
                    codigo_mes = "0"+codigo_mes; 
                 } 
                //alert(codigo_mes);
                objDom.setValorPorId ("PMES",codigo_mes);
                habilitar_empresa();
                objUtiles.ejecutarFormulario ("axis_axisadm004.do?NUM_MES="+codigo_mes, "cierre", document.miForm, "_self", objJsMessages.jslit_cargando);
            } 
            
            function valida_botonera(){
                if(document.miForm.CEMPRES.value >= 0 && document.miForm.PANY.value >0 && document.miForm.PMES.value>0 && document.miForm.NMESES.value>0){
                    <c:if test="${!empty sessionScope.listaAsientos}">
                    objDom.setDisabledPorId("but_9000491",false); //boton cierre
                    objDom.setDisabledPorId("but_9000569",false); //boton informe
                    </c:if>
                    objDom.setDisabledPorId("but_1000439",false); //boton consulta
                    objDom.setDisabledPorId("but_9000497",false); //boton generar
                } else {
                    objDom.setDisabledPorId("but_9000491",true); //boton cierre
                    objDom.setDisabledPorId("but_9000569",true); //boton informe
                    objDom.setDisabledPorId("but_1000439",true); //boton consulta
                    objDom.setDisabledPorId("but_9000497",true); //boton generar
                }
            }
            
            function f_borrar_lista(){
            //alert("Antes de borrar lista");
            objLista.borrarFilasDeLista ("LSTASIENTOS", "6", "<axis:alt f="axisadm004" c="LISTASIENT" lit='1000254' />");
            objDom.setDisabledPorId("but_9000491",true); //boton cierre
            objDom.setDisabledPorId("but_9000569",true); //boton informe
            
            //A continuacion borramos la parte de paginacion
            var seccion_paginar=document.getElementsByTagName("span");
            //alert(seccion_paginar[0]);
            
            for (var i=0; i < seccion_paginar.length; i++) {
            //alert(seccion_paginar[i].getAttribute("class"));
            //alert(seccion_paginar[i].className);
                    if (seccion_paginar[i].className!=null) {
                    
                            if(seccion_paginar[i].className=="gridpagebanner"){
                                  seccion_paginar[i].style.display="none";
                            }
                            
                            if(seccion_paginar[i].className=="gridpagelinks"){
                                  seccion_paginar[i].style.display="none";
                            }
                    }
            }
            
           
             
            }
                        
            /****************************************************************************************/
            /*******************************     MODALES    *****************************************/
            /****************************************************************************************/
            function f_cerrar_modal(cual) {
                objUtiles.cerrarModal(cual);
            }
        
            function f_aceptar_modal(cual, params) {
                f_cerrar_modal(cual);
                habilitar_empresa();
                objUtiles.ejecutarFormulario("axis_axisadm004.do" + params, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_buscar_TPAIS(CPAIS) {
                <% 
                if (((java.util.Map) request.getAttribute("__formdata"))!= null){
                java.util.Map formdata = ((java.util.Map) request.getAttribute("__formdata"));
                if (((java.util.Map) formdata.get("listValores"))!= null){
                java.util.Map lista = (java.util.Map)formdata.get("listValores");
                if (((java.util.ArrayList)lista.get("lstPaises"))!= null){
                java.util.ArrayList paises = (java.util.ArrayList)lista.get("lstPaises");
                for(int i = 0;i<paises.size();i++){
                java.util.HashMap paisHash = (java.util.HashMap)paises.get(i);
                %>
                pais = <%=paisHash.get("CPAIS")%>
                if (CPAIS == pais){
                return "<%=paisHash.get("TPAIS")%>"
                }
                <%}}}}%> 
        }


                
        function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION){
             objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
              "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION);
        }
        
        function f_aceptar_axiscom001(CODIGO, TEXTO, CODIGO_CONSULTA){
            f_cerrar_axiscom001();
            
            if (!objUtiles.estaVacio(TEXTO))
                TEXTO = objUtiles.replaceAll(TEXTO, "-quote-", "\'");
          
            if (CODIGO_CONSULTA == "LISTA_PAIS_RESIDENCIA") {
            
                objDom.setValorPorId("CPAIS", CODIGO);
                objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "<b>" + TEXTO + "</b>");
             }
        }
        
        function f_cerrar_axiscom001() {
            objUtiles.cerrarModal("axiscom001");
        }
        
        
        function f_desglose_sim_contable(IMPORTE,TIPO,CEMPRES,CCUENTA,FASIENT,LPAIS,NASIENT,NLINEA,CPAIS,ORDENACION,NMESES){
            //alert("Antes de abrir modal"+CPAIS);
            TEXTO_PAIS = objUtiles.replaceAll(LPAIS, "-quote-", "\'");
            //alert("CUENTA: "+CCUENTA);
            //alert("CPAIS: "+CPAIS);
            //alert("NLINEA: "+NLINEA);
            //alert("NASIENTO: "+NASIENT);
            f_abrir_modal("axisadm007",null,"&IMPORTE="+IMPORTE+"&CEMPRES="+CEMPRES+"&CONCEPTO="+TIPO+"&CCUENTA_INTERNO="+CCUENTA+"&FASIENT="+FASIENT+"&LITPAIS="+TEXTO_PAIS+"&CPAIS="+CPAIS+"&NLINEA="+NLINEA+"&TIPO_LISTADO="+document.miForm.tipo_listado.value+"&NASIENT="+NASIENT+"&ORDEN_LINEA="+ORDENACION+"&NMESES="+NMESES);
        }
        
        function f_cerrar_axisadm007(){
            objUtiles.cerrarModal("axisadm007");
            //objUtiles.ejecutarFormulario("axis_axisadm004.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
        
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
        function f_actualizar_valor(){
            if(document.miForm.TIPO.checked){
                document.miForm.tipo_listado.value=0;
                objDom.setVisibilidadPorId("texto_cuadre", "hidden");
                objDom.setVisibilidadPorId("texto_historico", "visible");
                //objDom.setVisibilidadPorId("img_historico", "visible");
                if(document.miForm.CEMPRES.value >0 && document.miForm.PANY.value >0 && document.miForm.PMES.value>0 && document.miForm.NMESES.value>0){
                        habilitar_empresa();
                        //objUtiles.ejecutarFormulario ("axis_axisadm004.do", "visualizar_sim", document.miForm, "_self", objJsMessages.jslit_cargando);
                        f_borrar_lista();
                }
            }else{
                document.miForm.tipo_listado.value=1;
                objDom.setVisibilidadPorId("texto_cuadre", "visible");
                objDom.setVisibilidadPorId("texto_historico", "hidden");
                //objDom.setVisibilidadPorId("img_historico", "hidden");
                if(document.miForm.CEMPRES.value >0 && document.miForm.PANY.value >0 && document.miForm.PMES.value>0 && document.miForm.NMESES.value>0){
                        habilitar_empresa();
                        //objUtiles.ejecutarFormulario ("axis_axisadm004.do", "visualizar_sim", document.miForm, "_self", objJsMessages.jslit_cargando);
                        f_borrar_lista();
                }
            }
            
        }
        
        
        function f_mostrar_link(nombreCapa){ 
            document.getElementById(nombreCapa).style.visibility="visible"; 
        } 

        function f_ocultar_link(nombreCapa){ 
            document.getElementById(nombreCapa).style.visibility="hidden"; 
        } 
        
        
  
        /****************************************************************************************/
        /*********************************** CALLBACK AJAX **************************************/
        /****************************************************************************************/
        function f_onchange_CPAIS() {
            var CPAIS_RESIDENCIA=objDom.getValorPorId("CPAIS");
            
            if (!objUtiles.estaVacio(CPAIS_RESIDENCIA)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPAIS_RESIDENCIA";
                qs=qs+"&CPAIS_RESIDENCIA="+CPAIS_RESIDENCIA
                qs=qs+"&dt="+(new Date().getTime())
                //objAjax.invokeAsyncCGI("modal_axisper010.do", callbackajaxdireccion, qs, this)
                objAjax.invokeAsyncCGI("axis_axisadm004.do", callbackajaxdireccion, qs, this)
            } else {
                objDom.setValorPorId("CPAIS", "");
                objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "");
                limpiaCampos("CPAIS");
            }
        }        

        function callbackajaxdireccion (ajaxResponseText){
            try{ 
            
           // alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                   
                 
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS_RESIDENCIA")[0])) {
                    
                       if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPAIS", "");
                            limpiaCampos("CPAIS");
                        }else{
                            objDom.setValorPorId("CPAIS", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS_RESIDENCIA"), 0, 0));
                           
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAISRESIDENCIA")[0])){
                                objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAISRESIDENCIA"), 0, 0) + "</b>");
                                limpiaCampos("CPAIS_RESIDENCIA");
                                }
                        }
                    }
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
        
        /*************************************************************************/
        /*************************** FUNCIONES INFORME ***************************/
        /*************************************************************************/
        function f_but_9000569 (){ // Executar informe
        
        <c:if test="${!empty sessionScope.listaAsientos}">
                //alert("Antes de llamar a map");
                habilitar_empresa();
                //alert("cpais" + document.miForm.CPAIS.value);
                //alert("pmes" + document.miForm.PMES.value);
                //alert("pany" + document.miForm.PANY.value);
                //alert("cempres" + document.miForm.CEMPRES.value);
                //alert("tipo_listado" + document.miForm.tipo_listado.value);
                var qs="operation=ajax_informe";
                qs=qs+"&CPAIS="+document.miForm.CPAIS.value;
                qs=qs+"&PMES="+document.miForm.PMES.value;
                qs=qs+"&PANY="+document.miForm.PANY.value;
                qs=qs+"&CEMPRES="+document.miForm.CEMPRES.value;
                qs=qs+"&tipo_listado="+document.miForm.tipo_listado.value;
                objAjax.invokeAsyncCGI("axis_axisadm004.do", callbackajaxinforme, qs, this);
        </c:if>
        <c:if test="${empty sessionScope.listaAsientos}">
                alert("<axis:alt f="axisadm004" c="ERR_PARAM" lit="1000005"/>"); //Falta informar paràmetres
        </c:if>
        }
            
       function callbackajaxinforme (ajaxResponseText){
            try{ 
            //alert("AL VOLVER");
            //alert(ajaxResponseText);
            var doc = objAjax.domParse(ajaxResponseText);
             if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {

                            var FILE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FILE")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FILE"), 0, 0) : "");
                            
                            if(FILE!=null && FILE!=''){
                            //alert(FILE);
                                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+FILE); //+"&mimetype=csv"
            
                            }else{
                                alert("<axis:alt f="axisadm004" c="ERR_PARAM" lit="1000610"/>"); //MENSAJE : ERROR AL ENVIAR FICHER0
                            }
                            
             } 

           
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
        
        
        
        </script>
    </head>
    <body  onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisadm008|<axis:alt f="axisadm004" c="TIT_008" lit="151440"/>#axiscom001|<axis:alt f="axisadm004" c="TIT_001" lit="102068"/>&nbsp;axiscom001|Si</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisrmb001|<axis:alt f="axisadm004" c="TITMB_001" lit="9000439"/>#axisrmb003|<axis:alt f="axisadm004" c="TITMB_003" lit="9000444"/>#axisrmb004|<axis:alt f="axisadm004" c="TITMB_004" lit="9000467"/>#axisrmb005|<axis:alt f="axisadm004" c="TIT_004" lit="9000470"/>#axisrmb008|<axis:alt f="axisadm004" c="TITMB_008" lit="9000444"/>#axisimprimir|<axis:alt f="axisadm004" c="TIT_AXISIMP" lit="1000205" />|true</c:param>
        </c:import>

        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
            <input type="hidden" name="TPAIS" value="${__formdata.TPAIS}"/>
            <input type="hidden" name="CONCEPTO" value=""/>
            <input type="hidden" name="CCUENTA" value=""/>
            <input type="hidden" name="FASIENT" value=""/>
            <input type="hidden" name="tipo_listado" value="${__formdata.tipo_listado}"/> <!--0:HISTORICO --><!--1:CUADRE --> 
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisadm004" c="TITULO" lit="151442" /></c:param>
                <c:param name="formulario"><axis:alt f="axisadm004" c="FORM" lit="151442" /></c:param>
                
                <c:param name="form">axisadm004</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisadm007|<axis:alt f="axisadm004" c="TIT_007" lit="151440" /></c:param>
            </c:import>
    
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                        <img src="images/flecha.gif"/><axis:alt f="axisadm004" c="FLECHA" lit="103593"/>
                         </div>
                        <!-- Sección 1 -->
                        <table class="seccion">
                            <tr>
                                <td >
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:30%;height:0px"></th>
                                            <th style="width:30%;height:0px"></th>
                                            <th style="width:12%;height:0px"></th>
                                            <th style="width:8%;height:0px"></th>
                                            <th style="width:10%;height:0px"></th>
                                            <th style="width:10%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisadm004" c="axisadm_listaEmpresas" dejarHueco="true">
                                            <td class="titulocaja" ><b><axis:alt f="axisadm004" c="CEMPRES" lit="101619"/></b></td><!--Empresa -->
                                            </axis:ocultar>
                                            <td class="titulocaja" ><b><axis:alt f="axisadm004" c="CPAIS" lit="151951"/></b></td><!--Pais-->
                                            <td class="titulocaja" nowrap><b><axis:alt f="axisadm004" c="CTIPO" lit="151439"/></b></td><!--Tipo -->
                                            <td class="titulocaja" ><b><axis:alt f="axisadm004" c="NMESES" lit="9000496"/></b></td><!-- no Mesos -->
                                            <td class="titulocaja" ><b><axis:alt f="axisadm004" c="NANY" lit="101606"/></b></td><!-- Any -->
                                             <td class="titulocaja" ><b><axis:alt f="axisadm004" c="NMES" lit="9000495"/></b></td><!--Mes-->
                                           
                                        </tr>
                                        <tr>
                                                                                       
                                            <axis:ocultar f="axisadm004" c="axisadm_listaEmpresas" dejarHueco="true">
                                            <td class="campocaja">
                                                <select name = "CEMPRES" id="CEMPRES" style="width:99%;"  size="1" onchange="javascript:valida_botonera();f_borrar_lista();" class="campowidthselect campo campotexto_ob" >
                                                <option value = "-1"> - <axis:alt f="axisadm004" c="CEMPRES" lit="1000348"/> - </option>
                                                <c:forEach var="empresa" items="${sessionScope.axisadm_listaEmpresas}">
                                                    <option value = "${empresa.CEMPRES}"
                                                        <c:if test="${empresa.CEMPRES == __formdata.CEMPRES || fn:length(sessionScope.axisadm_listaEmpresas) < 2 }">selected</c:if>>
                                                        ${empresa.TEMPRES}
                                                    </option>
                                                </c:forEach>
                                                </select>
                                            </td>
                                            </axis:ocultar>
                                            <td class="campocaja">
                                                <input type="text"  class="campowidthinput campo campotexto_ob" size="3"  maxlength="3" value="${__formdata.CPAIS}" name="CPAIS" id="CPAIS" onchange="f_onchange_CPAIS();f_borrar_lista();" style="width:20%;" />
                                                <img id="findPaisResidencia" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('102068', 'LISTA_PAIS_RESIDENCIA', null)" style="cursor:pointer"/>
                                                <span id="TPAISRESIDENCIA_span"><b>${__formdata.TPAISRESIDENCIA} </b></span>
                                            </td>
                                            <td class="campocaja">
                                                <input type="checkbox" name="TIPO" id="TIPO" style="width:40%;align:left;" onclick="javascript:f_actualizar_valor()" <c:if test="${__formdata.tipo_listado!=null &&  __formdata.tipo_listado==0}">checked</c:if>>  
                                                <input type="hidden" name="F_CIERRE" id="F_CIERRE" value="<fmt:formatDate value='${sessionScope.listaAsientos[0].FASIENT}' pattern='dd/MM/yyyy'/>">  
                                            </td>   
                                            
                                            <td class="campocaja">
                                                <input type="text"  class="campowidth campo campotexto" id="NMESES" name="NMESES" onblur="javascript:valida_botonera();f_borrar_lista();" style="width:95%;" size="15"
                                                value="${__formdata.NMESES}" <axis:atr f="axisadm004" c="NMESES" a="modificable=true&obligatorio=true&formato=entero"/> />
                                            </td>
                                            
                                            <td class="campocaja" >
                                            <input  type="text" class="campowidth campo campotexto" onblur="javascript:valida_botonera();f_borrar_lista();" id="PANY" name="PANY" size="15" style="width:90%;"
                                            value="${__formdata.PANY}" <axis:atr f="axisadm004" c="PANY" a="modificable=true&obligatorio=true&formato=entero"/> />
                                            </td>
                                            
                                            <td>
                                                <select name = "PMES" id="PMES"  style="width:90%;"  size="1" onchange="javascript:valida_botonera();f_borrar_lista();" class="campowidthselect campo campotexto_ob">
                                                <option value = "-1"> - <axis:alt f="axisadm004" c="PMES" lit="1000348"/> - </option>
                                                <c:forEach var="mes" items="${sessionScope.listaMeses}">
                                                    <option value = "${mes.CATRIBU}"
                                                        <c:if test="${mes.CATRIBU == __formdata.PMES}">selected</c:if>>
                                                        ${mes.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                                </select>
                                               
                                            </td>
                                            
                                        </tr>
                                   </table>
                                </td>
                            </tr>
                            
                            <!-- Seccion de cuentas     contables -->
                            
                            <!-- Título -->
                            
                            
                           
                            
                                        <td align="left">
                                             <table class="area" align="center">
                                                 <tr>
                                                    <th style="width:100%;height:0px"></th>                                                    
                                                </tr>
                                                
                                                <tr>
                                                    <td>
                                                    
                                                        <div class="titulo_modal" id="texto_cuadre" style="position: relative; top: 5px;width:98%;" >
                                                        <img src="images/flecha.gif"/><b><axis:alt f="axisadm004" c="TEXT_CUAD" lit="151438"/></b>
                                                        </div>
                            
                                                        <div class="titulo_modal" id="texto_historico" style="position: relative; top: -10px;width:98%;" >
                                                        <img src="images/flecha.gif"/><b><axis:alt f="axisadm004" c="TEXT_HIST" lit="151439"/></b>
                                                        </div>
                            
                                                    </td>
                            
                                                </tr>
                                                
                                                <!-- LISTA -->
                                                
                                                <tr>                                                    
                                                    <td class="titulocaja">
                                                        <%-- DisplayTag Facturas --%>
                                                        <c:set var="title0"><axis:alt f="axisadm004" c="CCUENTA" lit="1000092"/></c:set>  <%-- Cuenta --%>
                                                        <c:set var="title1"><axis:alt f="axisadm004" c="DEBE" lit="9000499"/></c:set>  <%-- Debe --%>
                                                        <c:set var="title2"><axis:alt f="axisadm004" c="HABER" lit="9000500"/></c:set>  <%-- Haber --%>
                                                        <c:set var="title3"><axis:alt f="axisadm004" c="FASIENT" lit="1000575"/></c:set>  <%-- Fecha --%>
                                                        <c:set var="title4"><axis:alt f="axisadm004" c="TDESCRI" lit="100588"/></c:set>   <%-- Descripcion --%>
                                                        <c:set var="title5"><axis:alt f="axisadm004" c="NASIENT" lit="9000567"/></c:set>  <%-- N Asiento --%>                                    

                                                        <div id="dt_recibos" class="seccion displayspaceGrande" >
                                                            <display:table name="${sessionScope.listaAsientos}" id="LSTASIENTOS" export="false" class="dsptgtable" pagesize="-1"
                                                             defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                 requestURI="axis_axisadm004.do?paginar=true"> <%-- offset="${sessionScope.ORDEN_LINEA}" --%>
                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                 <%--display:column headerClass="headwidth5 sortable" title="" media="html" autolink="false" >
                                                                    <div class="dspIcons">
                                                                    <input value="${LSTASIENTOS.NASIENTO}" type="radio" id="radioNASIENTO" name="radioNASIENTO" onclick="" selected="true"/>
                                                                    </div>
                                                                </display:column --%>
                                                                
                                                                 <c:if test="${LSTASIENTOS.NASIENT!=null}" >
                                                                <display:column title="${title5}" sortable="true" sortProperty="NASIENT" headerClass="sortable"  media="html" autolink="false" >
                                                                    <div class="dspNumber">
                                                                    ${LSTASIENTOS.NASIENT}
                                                                    </div>
                                                                </display:column>
                                                                </c:if>
                                                                <display:column title="${title0}" sortable="true" sortProperty="CCUENTA" headerClass="sortable"  media="html" autolink="false" >
                                                                    <div class="dspNumber">
                                                                    ${LSTASIENTOS.CCUENTA}
                                                                    </div>
                                                                </display:column>
                                                                <display:column title="${title1}" sortable="true" sortProperty="DEBE" headerClass="sortable"  media="html" autolink="false" >
                                                                    
                                                                    <c:if test="${LSTASIENTOS.DEBE==null}">
                                                                        <!-- onmouseover="javascrip:f_mostrar_link('link_${LSTASIENTOS.HABER}');" onmouseout="javascrip:f_ocultar_link('link_${LSTASIENTOS.HABER}');" -->
                                                                        <a style="text-decoration:none" href="javascript:f_desglose_sim_contable('${LSTASIENTOS.DEBE}','1',document.miForm.CEMPRES.value,'${LSTASIENTOS.CCUENTA_INTERNO}','<fmt:formatDate value='${LSTASIENTOS.FASIENT}' pattern='dd/MM/yyyy'/>', '${LITPAIS}','${LSTASIENTOS.NASIENT}','${LSTASIENTOS.NLINEA}','${LSTASIENTOS.CPAIS}',  <%=pageContext.getAttribute("LSTASIENTOS_rowNum")%>, document.miForm.NMESES.value  );">
                                                                            <div class="dspNumber"><!--id="link_${LSTASIENTOS.DEBE}" style="visibility:hidden;display:none;position:absolute;filter:alpha(opacity=25);opacity:.25;" -->
                                                                                <!--Detalle -->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                            </div>
                                                                        </a>
                                                                    </c:if>
                                                                    <c:if test="${LSTASIENTOS.DEBE!=null}">
                                                                        <a href="javascript:f_desglose_sim_contable('${LSTASIENTOS.DEBE}','1',document.miForm.CEMPRES.value,'${LSTASIENTOS.CCUENTA_INTERNO}','<fmt:formatDate value='${LSTASIENTOS.FASIENT}' pattern='dd/MM/yyyy'/>', '${LITPAIS}','${LSTASIENTOS.NASIENT}','${LSTASIENTOS.NLINEA}','${LSTASIENTOS.CPAIS}',  <%=pageContext.getAttribute("LSTASIENTOS_rowNum")%>, document.miForm.NMESES.value );">
                                                                            <div class="dspNumber">
                                                                                <fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${LSTASIENTOS.DEBE}' />
                                                                            </div>
                                                                        </a>
                                                                    </c:if>
                                                                </display:column>
                                                                <display:column title="${title2}" sortable="true" sortProperty="HABER" headerClass="sortable"  media="html" autolink="false" >
                                                                    <c:if test="${LSTASIENTOS.HABER==null}">
                                                                        <a style="text-decoration:none"  href="javascript:f_desglose_sim_contable('${LSTASIENTOS.HABER}','2',document.miForm.CEMPRES.value,'${LSTASIENTOS.CCUENTA_INTERNO}','<fmt:formatDate value='${LSTASIENTOS.FASIENT}' pattern='dd/MM/yyyy'/>', '${LITPAIS}','${LSTASIENTOS.NASIENT}','${LSTASIENTOS.NLINEA}', '${LSTASIENTOS.CPAIS}',  <%=pageContext.getAttribute("LSTASIENTOS_rowNum")%>, document.miForm.NMESES.value );">
                                                                            <div class="dspNumber" >
                                                                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                            </div>
                                                                        </a>
                                                                    </c:if>
                                                                    <c:if test="${LSTASIENTOS.HABER!=null}">
                                                                        <a href="javascript:f_desglose_sim_contable('${LSTASIENTOS.HABER}','2',document.miForm.CEMPRES.value,'${LSTASIENTOS.CCUENTA_INTERNO}','<fmt:formatDate value='${LSTASIENTOS.FASIENT}' pattern='dd/MM/yyyy'/>', '${LITPAIS}','${LSTASIENTOS.NASIENT}','${LSTASIENTOS.NLINEA}', '${LSTASIENTOS.CPAIS}',  <%=pageContext.getAttribute("LSTASIENTOS_rowNum")%>, document.miForm.NMESES.value );">
                                                                            <div class="dspNumber">
                                                                                <fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${LSTASIENTOS.HABER}' />
                                                                            </div>
                                                                        </a>
                                                                    </c:if>
                                                                </display:column>
                                                                <display:column title="${title4}" sortable="true" sortProperty="TDESCRI" headerClass="sortable"  media="html" autolink="false" >
                                                                    <div class="dspText">
                                                                    ${LSTASIENTOS.TDESCRI}
                                                                    </div>
                                                                </display:column>
                                                               
                                                                <display:column title="${title3}" sortable="true" sortProperty="FASIENT" headerClass="sortable"  media="html" autolink="false" >
                                                                    <div class="dspDate">
                                                                    <fmt:formatDate value='${LSTASIENTOS.FASIENT}' pattern='dd/MM/yyyy'/>
                                                                    </div>
                                                                </display:column>
                                                                
                                                            </display:table>                                                        
                                                        </div>
                                                    </td>                                                
                                                </tr>
                                                
                                                
                                                
                                        </table>
                                    </td>
                                    </tr>
                            <!-- Fin de seccion cuentas contables -->
                            
                        </table>
                        <div class="separador">&nbsp;</div>
                        
             <div class="separador">&nbsp;</div>
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm004</c:param><c:param name="__botones">salir,1000439,9000497,9000491,9000569</c:param></c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>