<%/* Revision:# j988xaIgL/qq43z+UuVIGg== # */%>
<%/*
*  Fichero: axisadm018.jsp 
*
*  Fecha: 04/02/2009
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
    <title><axis:alt f="axisadm018" c="titulo" lit="9000834"/></title> <%-- ANULACION DE RECIBOS --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="Stylesheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp"/>
    
    <script type="text/javascript">
        var pantalla_origen = '<%= request.getAttribute("pantalla_origen")%>';
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_pagrecibo(val){
           /* if (val != 2){
                f_reciboscaja();
            }else{
                f_recibosdom();
            } */
            f_cargar_propiedades_pantalla();
        }
        
        function f_reciboscaja(){
            <axis:visible f="axisadm018" c="CCOBBAN"> 
                objDom.setVisibilidadPorId("CCOBBAN_label", "hidden"); 
                objDom.setVisibilidadPorId("CCOBBAN", "hidden"); 
                document.getElementById("CCOBBAN_label").style.display ="none";
                document.getElementById("CCOBBAN").style.display ="none";
            </axis:visible>
            try{
                objDom.setDisplayPorId("label_CTIPBAN","none");
                objDom.setVisibilidadPorId("label_CTIPBAN",false);
            }catch(e){}
            try{
                objDom.setDisplayPorId("label_CBANCAR2","none");
                objDom.setVisibilidadPorId("label_CBANCAR2",false);
            }catch(e){}
            try{
                objDom.setDisplayPorId("CBANCAR","none");
                objDom.setVisibilidadPorId("CBANCAR",false);
            }catch(e){}
            try{
                objDom.setDisplayPorId("CTIPBAN","none");
                objDom.setVisibilidadPorId("CTIPBAN",false);
            }catch(e){}    
            objDom.setValorPorId("COBRO", "DELEGA");
        }
        
        function f_recibosdom(){
            try{
                objDom.setDisplayPorId("label_CTIPBAN","");
                objDom.setVisibilidadPorId("label_CTIPBAN",true);
            }catch(e){}
            try{
                objDom.setDisplayPorId("label_CBANCAR2","");
                objDom.setVisibilidadPorId("label_CBANCAR2",true);
            }catch(e){}
            try{
                objDom.setDisplayPorId("CBANCAR","");
                objDom.setVisibilidadPorId("CBANCAR",true);
            }catch(e){}
            try{
                objDom.setDisplayPorId("CTIPBAN","");
                objDom.setVisibilidadPorId("CTIPBAN",true);
            }catch(e){}    
            <axis:visible f="axisadm018" c="CCOBBAN"> 
                objDom.setVisibilidadPorId("CCOBBAN_label", "visible"); 
                objDom.setVisibilidadPorId("CCOBBAN", "visible"); 
                document.getElementById("CCOBBAN_label").style.display ="block";
                document.getElementById("CCOBBAN").style.display ="block";   
            </axis:visible>
            objDom.setValorPorId("COBRO", "CCOBBAN");
        }
        
        function f_onload() {
        
            if (objUtiles.estaVacio(objDom.getValorPorId("NRECIBO")) ) {
                f_abrir_axisadm021();
                displaySeccion("datos_recibo_children", "", "none");
                displaySeccion("modificado_recibo_children", "", "none");
                displaySeccion("resumen_children", "", "none");
            }else{
                if(objUtiles.estaVacio(objDom.getValorPorId("MODIFICADO"))){
                    displaySeccion("datos_recibo_children", "none", "");              
                    displaySeccion("modificado_recibo_children", "none", "");
                    displaySeccion("resumen_children", "", "none");
                }else{               
                    displaySeccion("datos_recibo_children", "none", "");
                    displaySeccion("modificado_recibo_children", "", "none");
                    displaySeccion("resumen_children", "none", "");
                    objDom.setDisabledPorId("but_9000552",true); //boton anular
                }
            }
            
             <%--c:if test="${empty __formdata['SEL_COBRADOR']}">
               f_reciboscaja();
             </c:if>
             <%--c:if test="${!empty __formdata['SEL_COBRADOR']}">
               if ("${__formdata['SEL_COBRADOR']}" != ("2")){
                  f_reciboscaja();
               }else{
                  f_recibosdom();
               }
             </c:if--%>     

            if(document.getElementById('SEL_COBRADOR')!=null){
                f_pagrecibo(document.getElementById('SEL_COBRADOR').value);
            }        
            
            <axis:visible f="axisadm018" c="IMP_RECDOMICILIADO"> 
            try{
                var NCESTIMP = document.getElementById("NCESTIMP").value;
                var NCTIPCOB = document.getElementById("NCTIPCOB").value;
                var CESTIMP_OLD = document.getElementById("CESTIMP_OLD").value;
                var CTIPCOB_OLD = document.getElementById("CTIPCOB_OLD").value;
                var MOD_OK = document.getElementById("MODIFICADO_OK").value;

                if (CESTIMP_OLD == 2 && CTIPCOB_OLD == 5 && NCTIPCOB == 2 && MOD_OK == 'true'){
                    //alert(document.getElementById("NCESTIMP").value+"#"+document.getElementById("NCTIPCOB").value);
                    objDom.setValorPorId("NCESTIMP", "");
                    objDom.setValorPorId("NCTIPCOB", "");
                    var TTIPO = "RECDOMICILIADO";
                    var NRECIBO = document.getElementById("NRECIBO").value;
                    var SSEGURO = "${requestScope.OB_IAX_GENPOLIZA.SSEGURO}";
                    objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_recibo&CNRECIBO="+NRECIBO+"&CNDOCUME="+0+"&CSSEGURO="+SSEGURO+"&CTIPO="+TTIPO);
                }
            } catch(e){}
            </axis:visible> 

            if (objUtiles.estaVacio(objDom.getValorPorId("NRECIBO")) ) {
                try{
                    objDom.setDisplayPorId("but_9000552","none");
                    objDom.setVisibilidadPorId("but_9000552",false);
                }catch(e){} 
            }
            else {
                try{
                    objDom.setDisplayPorId("but_9000552","");
                    objDom.setVisibilidadPorId("but_9000552",true);
                }catch(e){} 
            }

            f_cargar_propiedades_pantalla();
            
        }
        
        function displaySeccion(id, actual, nuevo){
          
            if(!objUtiles.estaVacio(document.getElementById(id)) && objUtiles.utilEquals(document.getElementById(id).style.display, actual))
                    document.getElementById(id).style.display = nuevo;
        }
        
        function f_but_salir(MSG_EXIT) {
            var ori = document.miForm.origen.value;
            if (!objUtiles.estaVacio(ori)){
                parent.f_cerrar_modal('axisadm018');
            }else{
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=" + pantalla_origen + "", "cancelar", document.miForm, "_self", MSG_EXIT);
            }
        } 
        
        function f_but_9000552() {
            if (objValidador.validaEntrada()) {
                try{
                    objDom.setValorPorId("NCESTIMP", document.getElementById("TESTIMP").value);
                    objDom.setValorPorId("NCTIPCOB", document.getElementById("SEL_COBRADOR").value);
                    objDom.setValorPorId("CESTIMP_OLD", document.getElementById("CESTIMP").value);
                    objDom.setValorPorId("CTIPCOB_OLD", document.getElementById("CTIPCOB").value);
                }catch(e){}
                
                objUtiles.ejecutarFormulario ("axis_axisadm018.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_abrir_axisadm021() {
            var PESTREC = 0;
            objUtiles.abrirModal("axisadm021","src","modal_axisadm021.do?operation=init&PESTREC=" + PESTREC);
        }
        
        function f_cerrar_axisadm021(NRECIBO_NULL) {
            objUtiles.cerrarModal("axisadm021");
        }    
        function f_aceptar_axisadm021 (NRECIBO){
            objDom.setValorPorId("NRECIBO", NRECIBO);
            f_cerrar_axisadm021();
            objUtiles.ejecutarFormulario ("axis_axisadm018.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_abrir_axisper014(SPERSON) {
            /*objDom.setVisibilidadPorId("but_cerrar_modal_axisper014", "hidden");*/
            objUtiles.abrirModal("axisper014", "src", "modal_axisper014.do?operation=form&SPERSON="+SPERSON); 
        }
    
        function f_cerrar_axisper014 () {
            objUtiles.cerrarModal("axisper014"); 
        }    
    
        function f_aceptar_axisper014 (SPERSON) {
            f_cerrar_axisper014();
            objAjax.invokeAsyncCGI("axis_axisadm018.do", callbackAjaxCargarCuentasTomador, "operation=ajax_cargar_cuentas_tomador&SPERSON="+SPERSON, this, objJsMessages.jslit_cargando);
        }  
        
        function callbackAjaxCargarCuentasTomador (ajaxResponseText) {
            var doc = objAjax.domParse(ajaxResponseText);
            
            if (!objAppMensajes.existenErroresEnAplicacion(doc)) {                                
                if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                    var elementos = doc.getElementsByTagName("element");
                    var cccCombo = document.miForm.CBANCARCOL;     
                    objDom.borrarOpcionesDeCombo(cccCombo);
                    
                   for (i = 1; i < elementos.length; i++) {
                        var codigo = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CBANCAR")[0]) ?
                                     objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CBANCAR"), 0, 0) : "";
                        var desc   = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CBANCAR")[0]) ?
                                     objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CBANCAR"), 0, 0): "";
                        
                        objDom.addOpcionACombo(codigo, desc, cccCombo, i);
                    }
                    
                }
            }  
        }
        
        
        function f_Get_Cobradores (CBANCAR){
                        
            CBAN_AUX = objUtiles.utilSplit(CBANCAR, "#")[0];
            CTIPBAN = objUtiles.utilSplit(CBANCAR, "#")[1];
            
            SPRODUC = '${requestScope.OB_IAX_GENPOLIZA.SPRODUC}';
            
           if (!objUtiles.estaVacio(CBAN_AUX) && !objUtiles.estaVacio(CTIPBAN))            
                objAjax.invokeAsyncCGI("axis_axisadm018.do?CBANCAR="+CBAN_AUX+"&CTIPBAN="+CTIPBAN+"&SPRODUC="+SPRODUC, callbackAjaxCargarCobradores, "operation=ajax_cargar_cobradores", this, objJsMessages.jslit_cargando);
            
            
      }
      
    function f_cerrar_axisimprimir() {
        objUtiles.cerrarModal("axisimprimir");
    }
    
    
    /****************************************************************************************/
    /******************************* CALLBACKS AJAX *****************************************/
    /****************************************************************************************/
    function callbackAjaxCargarCobradores (ajaxResponseText) {
        var doc = objAjax.domParse(ajaxResponseText);
       
        if (!objAppMensajes.existenErroresEnAplicacion(doc)) {  
            
            var cobCombo = document.miForm.CCOBBAN;     
            if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                var elementos = doc.getElementsByTagName("element");   
                objDom.borrarOpcionesDeCombo(cobCombo);
               
               
               for (i = 0; i < elementos.length; i++) {
                    var codigo = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CCOBBAN")[0]) ?
                                 objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CCOBBAN"), 0, 0) : "";
                    var desc   = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("TDESCRI")[0]) ?
                                 objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TDESCRI"), 0, 0): "";
                    objDom.addOpcionACombo(codigo,codigo+ " - "+desc, cobCombo, i);
                }
                
            }else{
               objDom.borrarOpcionesDeCombo (cobCombo);
               objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", cobCombo, null);
            }
        }  
    }
        
    </script>    
</head>

<body onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisadm018" c="titulo2" lit="9000991" /></c:param>
                <c:param name="nid" value="axisadm021" />
        </c:import>
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisadm018" c="titulo" lit="102058"/></c:param>     <%-- MODIFICACIÓN DE RECIBOS --%>
                <c:param name="formulario"><axis:alt f="axisadm018" c="formulario" lit="102058"/></c:param> <%-- MODIFICACIÓN DE RECIBOS --%>
                <c:param name="form">axisadm018</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisadm018" c="LIT_1000216" lit="1000216" /></c:param>
            <c:param name="nid" value="axisper014" />
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisadm018" c="TITULOIMPRIMIR" lit="1000205" /></c:param>
            <c:param name="nid" value="axisimprimir"></c:param>
        </c:import>
    
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="MODIFICADO" id="MODIFICADO" value="${requestScope.MODIFICADO}"/>
        <input type="hidden" name="origen" value="${__formdata.origen}"/>
        <input type="hidden" name="IIMP_1" id="IIMP_1" value="${requestScope.IIMP_1}"/>
        <input type="hidden" name="IIMP_2" id="IIMP_2" value="${requestScope.IIMP_2}"/>
        <input type="hidden" name="IIMP_3" id="IIMP_3" value="${requestScope.IIMP_3}"/>
        <input type="hidden" name="IIMP_4" id="IIMP_4" value="${requestScope.IIMP_4}"/>
        <input type="hidden" name="CESTIMP" id="CESTIMP" value="${__formdata.CESTIMP}"/>
        <input type="hidden" name="CTIPCOB" id="CTIPCOB" value="${OB_IAX_RECIBOS.CTIPCOB}"/>
        <input type="hidden" name="CESTIMP_OLD" id="CESTIMP_OLD" value="${__formdata.CESTIMP_OLD}"/>
        <input type="hidden" name="CTIPCOB_OLD" id="CTIPCOB_OLD" value="${__formdata.CTIPCOB_OLD}"/>
        <input type="hidden" name="COBRO" id="COBRO" value="${__formdata.COBRO}"/>
        <%-- Nuevo Estado de impresión y de cobro de recibo --%>
        <input type="hidden" name="NCESTIMP" id="NCESTIMP" value="${__formdata.NCESTIMP}"/>
        <input type="hidden" name="NCTIPCOB" id="NCTIPCOB" value="${__formdata.NCTIPCOB}"/>
        <input type="hidden" name="MODIFICADO_OK" id="MODIFICADO_OK" value="${MODIFICADO_OK}"/>
        <%-- Para ver si se imprime o no plantilla --%>
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm018" c="flecha" lit="1000565" /><c:if test="${empty requestScope.acceso_externo || requestScope.acceso_externo== 'false'}"><img border="0" src="images/find.gif" onclick="f_abrir_axisadm021()" style="cursor:pointer" alt="<axis:alt f='axisadm018' c='flecha2' lit='100797' /> <axis:alt f='axisadm018' c='flecha3' lit='9000410' />" title="<axis:alt f='axisadm018' c='flecha4' lit='100797' /> <axis:alt f='axisadm018' c='flecha5' lit='9000410' />"/></c:if></div>
                        <!--campos-->
                        <table id="datos_recibo_children" class="seccion" style="display:none">
                            <tr>
                            <td align="left">
                                 <table border="0" class="area" align="center">
                                    <tr>
                                                                         
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                                                            
                                    </tr>
                                    <tr>
                                        <axis:visible f="axisadm018" c="TEMPRES"> 
                                            <td class="titulocaja">
                                                <b id="label_TEMPRES"><axis:alt f="axisadm018" c="TEMPRES" lit="101619" /></b>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisadm018" c="SPRODUC"> 
                                            <td class="titulocaja">
                                                <b id="label_SPRODUC"><axis:alt f="axisadm018" c="SPRODUC" lit="100829" /></b>
                                            </td>
                                        </axis:visible>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <axis:visible f="axisadm018" c="TEMPRES"> 
                                            <td class="campocaja" >    
                                                <input type="text" name="TEMPRES" id="TEMPRES" value="${requestScope.OB_IAX_GENPOLIZA.TEMPRES}" class="campodisabled campo campotexto" style="width:100%;"
                                                <axis:atr f="axisadm018" c="TEMPRES" a="modificable=false&obligatorio=false"/> alt="<axis:alt f="axisadm018" c="TEMPRES" lit="101619" />" title="<axis:alt f="axisadm018" c="TEMPRES" lit="101619" />"/>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisadm018" c="TPRODUC"> 
                                           <td class="campocaja" colspan="2">    
                                                <input type="text" name="TPRODUC" id="TPRODUC" value="${requestScope.OB_IAX_GENPOLIZA.TPRODUC}" class="campodisabled campo campotexto" style="width:100%;"
                                                <axis:atr f="axisadm018" c="TPRODUC" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    
                                    <tr>
                                        <!-- Num. Póliza -->
                                        <axis:visible f="axisadm018" c="NPOLIZA"> 
                                            <td class="titulocaja" >
                                                <b id="label_NPOLIZA"><axis:alt f="axisadm018" c="NPOLIZA" lit="9001514" /></b>
                                            </td>
                                        </axis:visible>
                                        <!-- Certificado -->
                                        <axis:visible f="axisadm018" c="NCERTIF"> 
                                            <td class="titulocaja" >
                                                <b id="label_NCERTIF"><axis:alt f="axisadm018" c="NCERTIF" lit="101300"/></b>
                                            </td>
                                        </axis:visible>
                                        <!-- Nombre tomador -->
                                        <axis:visible f="axisadm018" c="TNOMTOM">
                                            <td class="titulocaja" >
                                                <b id="label_TNOMTOM"><axis:alt f="axisadm018" c="TNOMTOM" lit="101027" /></b>
                                            </td>
                                        </axis:visible>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    
                                    <tr>
                                        <!-- Num. Póliza -->
                                        <axis:visible f="axisadm018" c="NPOLIZA"> 
                                           <td class="campocaja">    
                                                <input type="text" name="NPOLIZA" id="NPOLIZA" value="${requestScope.OB_IAX_GENPOLIZA.NPOLIZA}" class="campodisabled campo campotexto" style="width:100%;"
                                                <axis:atr f="axisadm018" c="NPOLIZA" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                        <!-- Certificado -->
                                        <axis:visible f="axisadm018" c="NCERTIF"> 
                                           <td class="campocaja">    
                                                <input type="text" name="NCERTIF" id="NCERTIF" value="${requestScope.OB_IAX_GENPOLIZA.NCERTIF}" class="campodisabled campo campotexto" style="width:35%"
                                                <axis:atr f="axisadm018" c="NCERTIF" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                        <!-- Tomador -->
                                        <axis:visible f="axisadm018" c="TNOMTOM"> 
                                           <td class="campocaja" colspan="2">    
                                                <input type="text" name="TNOMTOM" id="TNOMTOM" value="${requestScope.OB_IAX_GENPOLIZA.TNOMTOM}" class="campodisabled campo campotexto" style="width:100%;"
                                                <axis:atr f="axisadm018" c="TNOMTOM" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                      
                                        <td></td>
                                    </tr>
                                    
                                    <tr>
                                        <!-- Delegación - Agente -->
                                         <%-- Delegación --%>
                                         <axis:visible f="axisadm018" c="TDELEGA">
                                        <td class="titulocaja">
                                                <b><axis:alt f="axisadm018" c="TDELEGA" lit="1000561"/></b>
                                        </td>   
                                        </axis:visible>
                                        <axis:visible f="axisadm018" c="CAGENTE"> 
                                            <td class="titulocaja" colspan="2">
                                                <b id="label_CAGENTE"><axis:alt f="axisadm018" c="CAGENTE" lit="100584" /></b>
                                            </td>
                                        </axis:visible>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    
                                    <tr>
                                        <%-- Delegación --%>
                                        <axis:visible f="axisadm018" c="TDELEGA">
                                        <td class="campocaja">
                                             <input type="text" class="campodisabled campo campotexto" id="TDELEGA" name="TDELEGA" size="15"  style="width:90%"
                                             value="${OB_IAX_RECIBOS.TDELEGA}" readonly="readonly"/>
                                        </td>
                                        </axis:visible>
                                        <%-- Agente --%>
                                        <axis:visible f="axisadm018" c="CAGENTE"> 
                                        <td class="campocaja" colspan="3">
                                             <input type="text" class="campodisabled campo campotexto" id="CAGENTE" name="TAGENTE" size="15" style="width:15%"
                                             value="${OB_IAX_RECIBOS.CAGENTE}" readonly="readonly"/>
                                             &nbsp;
                                             <input type="text" class="campodisabled campo campotexto" id="TAGENTE" name="TAGENTE" size="15" style="width:70%"
                                             value="${OB_IAX_RECIBOS.TAGENTE}" readonly="readonly"/>
                                        </td>
                                        </axis:visible>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                    <!-- Forma de pago -->
                                    <axis:visible f="axisadm018" c="TFORPAG">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisadm018" c="TFORPAG" lit="100712"/></b>
                                    </td> 
                                    </axis:visible>
                                    <!-- Tipus compte -->
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisadm018" c="TTIPBAN" lit="1000374" /></b>
                                    </td>  
                                                                      
                                        <!-- bug 20761 -->
                                        <!-- cuotas tarjeta -->
                                        <axis:visible f="axisadm018" c="NCUOTAR"> 
                                            <td class="titulocaja" colspan="1">
                                                <b id="label_NCUOTAR"><axis:alt f="axisadm018" c="NCUOTAR" lit="9901245" /></b>
                                            </td>
                                        </axis:visible>                                        
                                        
                                        <td/>
                                        <td/>
                                        
                                    </tr>
                                    
                                    <tr>
                                        <!-- Forma de pago -->
                                        <axis:visible f="axisadm018" c="TFORPAG">
                                        <td class="campocaja">
                                            <input type="text" class="campodisabled campo campotexto" id="TFORPAG" name="TFORPAG" size="15" style="width:90%"
                                            value="${OB_IAX_RECIBOS.TFORPAG}" readonly="readonly"/>
                                        </td>
                                        </axis:visible>
                                        <!-- Tipus compte -->
                                        <td class="campocaja">
                                            <input type="text" class="campodisabled campo campotexto" id="TTIPBAN" name="TTIPBAN" size="15" style="width:90%"
                                            value="${OB_IAX_RECIBOS.TTIPBAN}" readonly="readonly"/>
                                        </td>
                                        <%-- Cuenta bancaria --%>
                                       
                                        
                                        <%-- bug 20761 --%>
                                        <%-- cuotas tarjeta --%>
                                        <axis:visible f="axisadm018" c="NCUOTAR"> 
                                        <td class="campocaja" colspan="1">
                                            <input type="text" class="campodisabled campo campotexto" id="NCUOTAR_1" name="NCUOTAR_1" size="15" style="width:40%"
                                            value="${OB_IAX_RECIBOS.NCUOTAR}" readonly="readonly"/>
                                        </td>
                                        </axis:visible>

                                        <td></td>
                                    </tr>
                                    
                                    <tr>
                                        <!-- Recibo -->
                                        <axis:visible f="axisadm018" c="NRECIBO"> 
                                            <td class="titulocaja">
                                                <b id="label_NRECIBO"><axis:alt f="axisadm018" c="label_NRECIBO" lit="800636" /></b>
                                            </td>
                                        </axis:visible>
                                         <%-- Nº Recibo Compania --%>
                                        <axis:ocultar c="CRECCIA" f="axisadm018" dejarHueco="false">
                                            <td class="titulocaja" id="LIT_CRECCIA">
                                             <b><axis:alt f="axisadm018" c="CRECCIA" lit="9001763"/></b>
                                            </td>     
                                        </axis:ocultar> 
                                        <!-- Estado del recibo -->
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisadm018" c="TESTREC" lit="1000553"/></b>
                                        </td>
                                        <!-- Importe -->
                                        <axis:visible f="axisadm018" c="IMPORTE"> 
                                            <td class="titulocaja">
                                                <b id="label_IMPORTE"><axis:alt f="axisadm018" c="IMPORTE" lit="1000563" /></b>
                                            </td>
                                        </axis:visible>                                      
                                    </tr>
                                    <tr>
                                        <!-- Recibo -->
                                         <axis:visible f="axisadm018" c="NRECIBO"> 
                                            <td class="campocaja">    
                                                <input type="text" name="NRECIBO" id="NRECIBO" value="${requestScope.NRECIBO}" class="campodisabled campo campotexto" style="width:75px;"
                                                <axis:atr f="axisadm018" c="NRECIBO" a="modificable=false&obligatorio=false"/> alt="<axis:alt f="axisadm018" c="NRECIBO" lit="800636" />" title="<axis:alt f="axisadm018" c="NRECIBO" lit="800636" />"/>
                                            </td>
                                        </axis:visible>
                                         <%-- Nº Recibo Compania --%>
                                        <axis:ocultar c="CRECCIA" f="axisadm018" dejarHueco="false">
                                        <td class="campocaja">
                                            <input type="text" class="campo campotexto campodisabled" id="CRECCIA" name="CRECCIA" <axis:atr f="axisadm018" c="CRECCIA" a="modificable=false&obligatorio=false"/>  style="width:90%"
                                            value="${OB_IAX_RECIBOS.CRECCIA}" readonly="readonly"/>
                                        </td>
                                        </axis:ocultar>                                            
                                        <!-- Situación /Estado -->
                                         <td class="campocaja">
                                                        <input type="text" class="campodisabled campo campotexto" id="TESTREC" name="TESTREC" size="15" style="width:90%"
                                                        value="${OB_IAX_RECIBOS.TESTREC}" readonly="readonly"/>
                                         </td>
                                        <!-- Importe -->
                                        <axis:visible f="axisadm018" c="IMPORTE"> 
                                           <td class="campocaja">    
                                                <input type="text" name="IMPORTE" id="IMPORTE" value="<fmt:formatNumber pattern="###,##0.00" value='${requestScope.OB_IAX_RECIBOS.IMPORTE}'/>" class="campodisabled campo campotexto" style="width:75%;"
                                                <axis:atr f="axisadm018" c="IMPORTE" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>                                       
                                    </tr>
                                    
                                    <tr>
                                        <!-- Tipo recibo -->
                                        <td class="titulocaja">
                                             <b><axis:alt f="axisadm018" c="TTIPREC" lit="102302"/></b>
                                        </td> 
                                        <!-- Fecha emision -->
                                        <axis:visible f="axisadm018" c="FEMISIO"> 
                                            <td class="titulocaja">
                                                <b id="label_FEMISIO"><axis:alt f="axisadm018" c="FEMISIO" lit="1000562" /></b>
                                            </td>
                                        </axis:visible>
                                        <!-- Estado impresion -->
                                        <td class="titulocaja">
                                                <b><axis:alt f="axisadm018" c="TESTIMP" lit="1000571"/></b>
                                        </td> 
                                          <!-- Fecha efecto -->
                                        <axis:visible f="axisadm018" c="FEFECTO"> 
                                            <td class="titulocaja">
                                                <b id="label_FEFECTO"><axis:alt f="axisadm018" c="FEFECTO" lit="100883" /></b>
                                            </td>
                                        </axis:visible>
                                        <!-- Fecha vencimiento -->
                                        <axis:visible f="axisadm018" c="FVENCIM"> 
                                            <td class="titulocaja">
                                                <b id="label_FVENCIM"><axis:alt f="axisadm018" c="FVENCIM" lit="100885" /></b>
                                            </td>
                                        </axis:visible>
                                        
                                    </tr>
                                    
                                    <tr>
                                        <!-- Tipo recibo -->
                                        <axis:visible f="axisadm018" c="TTIPREC"> 
                                        <td class="campocaja">
                                            <input type="text" class="campodisabled campo campotexto" id="TTIPREC" name="TTIPREC" size="15" style="width:90%"
                                            value="${OB_IAX_RECIBOS.TTIPREC}" readonly="readonly"/>
                                        </td>
                                        </axis:visible>
                                        <!-- Fecha emision -->
                                        <axis:visible f="axisadm018" c="FEMISIO"> 
                                            <td class="campocaja">
                                                <input type="text" name="FEMISIO" id="FEMISIO" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${requestScope.OB_IAX_RECIBOS.FEMISIO}'/>" class="campodisabled campo campotexto" style="width:85px;"
                                                <axis:atr f="axisadm018" c="FEMISIO" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                        <!-- Estado impresion -->
                                        <td class="campocaja">
                                                <input type="text" class="campodisabled campo campotexto" id="TESTIMP_1" name="TESTIMP_1" size="15" style="width:90%"
                                                value="${OB_IAX_RECIBOS.TESTIMP}" readonly="readonly"/>
                                        </td>
                                         <!-- Fecha efecto -->
                                        <axis:visible f="axisadm018" c="FEFECTO">
                                           <td class="campocaja">    
                                                <input type="text" name="FEFECTO" id="FEFECTO" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${requestScope.OB_IAX_RECIBOS.FEFECTO}'/>" class="campodisabled campo campotexto" style="width:40%;"
                                                <axis:atr f="axisadm018" c="FEFECTO" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                        <!-- Fecha vencimiento -->                                      
                                        <axis:visible f="axisadm018" c="FVENCIM"> 
                                           <td class="campocaja">    
                                                <input type="text" name="FVENCIM" id="FVENCIM" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${requestScope.OB_IAX_RECIBOS.FVENCIM}'/>" class="campodisabled campo campotexto" style="width:40%;"
                                                <axis:atr f="axisadm018" c="FVENCIM" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                    </tr>
                                    
                                    <!--       ****************************************************************************    -->
                            </table>
                        </td>
                    </tr>
                    </table>
                                    
                                    
                                   
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm018" c="flecha6" lit="9000930" /></div>      
                    <!--campos-->
                     <table id="modificado_recibo_children" class="seccion" style="display:none">
                        <tr>
                            <td align="left">
                                 <table border="0" class="area" align="center">
                                    <tr>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisadm018" c="GESCOB" dejarHueco="false"> 
                                            <td class="titulocaja">
                                                <b id="label_GESCOB"><axis:alt f="axisadm018" c="GESCOB" lit="1000568" /></b>
                                            </td>
                                        </axis:ocultar>
                                        
                                          <axis:ocultar f="axisadm018" c="TESTIMP" dejarHueco="false"> 
                                            <td class="titulocaja">
                                                <b id="label_TESTIMP"><axis:alt f="axisadm018" c="label_TESTIMP" lit="1000571" /></b>
                                            </td>
                                        </axis:ocultar>
                                        
                                         <axis:ocultar f="axisadm018" c="CTIPBAN" dejarHueco="false">
                                            <td class="titulocaja" id="tit_CTIPBAN">
                                                    <b id="label_CTIPBAN"><axis:alt f="axisadm018" c="label_CTIPBAN" lit="1000374" /></b>
                                            </td>
                                        </axis:ocultar>
                                         
                                         <axis:visible f="axisadm018" c="CBANCAR"  >
                                            <td class="titulocaja" id="tit_CBANCAR"  >
                                                <b id="label_CBANCAR"><axis:alt f="axisadm018" c="CBANCAR" lit="100965" /></b>
                                            </td>
                                        </axis:visible>
                                                                                
                                        
                                        <axis:visible f="axisadm018" c="CBANCARCOL"  >
                                            <td class="titulocaja" id="tit_CBANCARCOL" >
                                                <b id="label_CBANCARCOL"><axis:alt f="axisadm018" c="label_CBANCARCOL" lit="100965" /></b>
                                            </td>
                                        </axis:visible>
                                      
                                                                                                           
                                        <axis:ocultar f="axisadm018" c="CCOBBAN" dejarHueco="false">     
                                            <td class="titulocaja" >
                                                <div id="campo_cobban_label">
                                                    <b id="label_CCOBBAN"><axis:alt f="axisadm018" c="label_CCOBBAN" lit="100879" /></b>
                                                </div>
                                            </td>
                                        </axis:ocultar> 
                                        
                                     </tr>
                                     <tr>
                      
                                        <axis:ocultar f="axisadm018" c="GESCOB" dejarHueco="false"> 
                                            <td class="campocaja">
                                                <select title="<axis:alt f='axisadm018' c='GESCOB' lit='1000568' />" alt="<axis:alt f='axisadm018' c='GESCOB' lit='1000568' />" name = "GESCOB" id="GESCOB" size="1" 
                                                    class="campowidthselect campo campotexto" style="width:200px;"
                                                    <axis:atr f="axisadm018" c="GESCOB" a="modificable=true"/>>
                                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm018" c="BLANCO" lit="1000348"/> - </option> -->
                                                    <c:forEach  items="${requestScope.gestion}" var="gestion" varStatus="cont">
                                                       <option value = "${gestion.CATRIBU}"
                                                            
                                                                        <c:if test="${__formdata.CGESCOB == gestion.CATRIBU}">selected</c:if>
                                                                   >
                                                            ${gestion.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </axis:ocultar>
                                        
                                        <axis:ocultar f="axisadm018" c="TESTIMP" dejarHueco="false"> 
                                            <td class="campocaja" >
                                                <select title="<axis:alt f='axisadm018' c='TESTIMP' lit='1000571' />" alt="<axis:alt f='axisadm018' c='TESTIMP' lit='1000571' />" name = "TESTIMP" id="TESTIMP" size="1" 
                                                    class="campowidthselect campo campotexto" style="width:200px;"
                                                    <axis:atr f="axisadm018" c="TESTIMP" a="modificable=true"/>>
                                                    <c:forEach var="estado" items="${requestScope.estado}" varStatus="cont">
                                                        <option value = "${estado.CATRIBU}"
                                                            
                                                                        <c:if test="${__formdata.CESTIMP == estado.CATRIBU}">selected</c:if>
                                                                   >
                                                            ${estado.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </axis:ocultar>
                                        
                                        <axis:ocultar f="axisadm018" c="CTIPBAN" dejarHueco="false"> 
                                            <td class="campocaja" id="td_CTIPBAN">
                                                <select title="<axis:alt f='axisadm018' c='CTIPBAN' lit='1000374' />" alt="<axis:alt f='axisadm018' c='CTIPBAN' lit='1000374' />" name = "CTIPBAN" id="CTIPBAN" size="1" 
                                                    class="campowidthselect campo campotexto" style="width:200px;"
                                                    <axis:atr f="axisadm018" c="CTIPBAN" a="obligatorio=true&modificable=true&isInputText=false"/>>
                                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axisadm018" lit="108341"/> - </option>
                                                    <c:forEach var="cuentas" items="${requestScope.cuentas}" varStatus="cont">
                                                        <option value = "${cuentas.CTIPBAN}"
                                                            <c:if test="${__formdata.CTIPBAN == cuentas.CTIPBAN}">selected</c:if>
                                                             >
                                                            ${cuentas.TTIPO}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </axis:ocultar>
                                       
                                       <axis:visible f="axisadm018" c="CBANCAR"> 
                                        
                                            <td class="campocaja" id="td_CBANCAR">    
                                                <input type="text" name="CBANCAR" id="CBANCAR" 
                                               
                                                            value="${__formdata.CBANCAR}" 
                                             
                                                class="campowidthinput campo campotexto" style="width:200px;"
                                                 <axis:atr f="axisadm018" c="CBANCAR" a="obligatorio=true&modificable=true&isInputText=true"/> alt="<axis:alt f="axisadm018" c="CBANCAR" lit="100965" />" title="<axis:alt f="axisadm018" c="CBANCAR" lit="100965" />"/>
                                            </td>
                                            
                                        </axis:visible>
                                        
                                       
                                        <axis:visible f="axisadm018" c="CBANCARCOL" > 
                                      
                                            <td class="campocaja" id="td_CBANCARCOL"> 
                                                <select name = "CBANCARCOL" id ="CBANCARCOL" style="width:90%" onchange="f_Get_Cobradores(this.value)"
                                                    class="campowidthselect campo campotexto" <axis:atr f="axisadm018" c="CBANCARCOL" a="obligatorio=true&modificable=true&isInputText=false"/>
                                                    alt="<axis:alt f='axisadm018' c='CBANCARCOL' lit='100965' />" title="<axis:alt f='axisadm018' c='CBANCARCOL' lit='100965' />">
                                                    <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisadm018" c="SELEC" lit="1000348"/> - </option> 
                                                    <c:forEach items="${__formdata.TOMADORCCC}" var="cuentaTomador">
                                                        <option value = "${cuentaTomador.OB_IAX_CCC.CBANCAR}#${cuentaTomador.OB_IAX_CCC.CTIPBAN}"
                                                            <c:if test="${OB_IAX_RECIBOS.CBANCAR == cuentaTomador.OB_IAX_CCC.CBANCAR}">selected</c:if>>${cuentaTomador.OB_IAX_CCC.CBANCAR}</option>
                                                    </c:forEach>
                                                </select>
                                                <a id="icon_CBANCARCOL" href="javascript:f_abrir_axisper014(${requestScope.OB_IAX_GENPOLIZA.SPERTOM})"><img border="0" alt="<axis:alt f="axisctr004" c="LIT_1000124" lit="1000124"/>" title="<axis:alt f="axisctr004" c="LIT_1000124" lit="1000124"/>" src="images/lapiz.gif"/></a>
                                            </td>
                                           
                                        </axis:visible>
                                         
                                        <%-- --%>

                                        <axis:ocultar f="axisadm018" c="CCOBBAN" dejarHueco="false">    
                                            <td class="campocaja"> 
                                                <div id="campo_cobban">
                                                        <select name = "CCOBBAN" style="width:90%" id ="CCOBBAN" size="1"  
                                                            class="campowidthselect campo campotexto" 
                                                           <axis:atr f="axisadm018" c="CCOBBAN" a="obligatorio=true&modificable=true&isInputText=true"/>
                                                           title="<axis:alt f="axisadm018" c="CCOBBAN" lit="100879"/>">                                              
                                                            <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisadm018" c="SELEC" lit="1000348"/> - </option>                                                                                                   
                                                            <c:forEach items="${REC_IAX_COBRADORES}" var="lstCobradores">
                                                             <option value = "${lstCobradores.CCOBBAN}"
                                                                    <c:choose>
                                                                        <c:when test="${OB_IAX_RECIBOS.CCOBBAN == lstCobradores.CCOBBAN}">selected</c:when>
                                                                    </c:choose>>
                                                                    ${lstCobradores.CCOBBAN} - ${lstCobradores.TDESCRI}
                                                                </option>
                                                            </c:forEach>
                                                        </select>    
                                                </div>
                                            </td>
                                        </axis:ocultar>
                                        
                                     </tr>
                                     
                                     <tr>
                                        <axis:ocultar f="axisadm018" c="SEL_COBRADOR" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisadm018" c="SEL_COBRADOR" lit="101516" /></b>
                                            </td>
                                            
                                            <%--td class="titulocaja">
                                                <axis:ocultar f="axisadm018" c="COBBAN">
                                                    <div id="campo_cobban_label">
                                                        <b id="label_COBBAN"><axis:alt f="axisadm018" c="COBBAN" lit="100879" /></b>
                                                    </div>
                                                </axis:ocultar>
                                            </td--%>
                                        </axis:ocultar>
                                     </tr>
                                     
                                     <tr>
                                         <axis:ocultar f="axisadm018" c="SEL_COBRADOR" dejarHueco="false">
                                            <td class="titulocaja">
                                                <select title="<axis:alt f='axisadm018' c='SEL_COBRADOR' lit='101516' />" alt="<axis:alt f='axisadm018' c='SEL_COBRADOR' lit='101516' />" name = "SEL_COBRADOR" id="SEL_COBRADOR" size="1" 
                                                    class="campowidthselect campo campotexto" style="width:200px;" onchange="f_pagrecibo(this.value)"
                                                    <axis:atr f="axisadm018" c="SEL_COBRADOR" a="modificable=true"/>>
                                                    <c:forEach var="tipospag" items="${T_IAX_TIPOPAGO}">
                                                        <option value = "${tipospag.CATRIBU}"
                                                            <c:choose>
                                                                <c:when test="${OB_IAX_RECIBOS.CTIPCOB == tipospag.CATRIBU}">selected</c:when>
                                                            </c:choose>>
                                                            ${tipospag.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            
                                             <%--td class="campocaja"> 
                                                <axis:ocultar f="axisadm018" c="COBBAN"> <!-- TODO C -->  
                                                    <div id="campo_cobban">
                                                        <select title="<axis:alt f='axisadm018' c='COBBAN' lit='100879' />" alt="<axis:alt f='axisadm018' c='COBBAN' lit='100879' />" name = "list_COBBANCARIO" id="list_COBBANCARIO" size="1" 
                                                            class="campowidthselect campo campotexto_ob" style="width:200px;"
                                                            <axis:atr f="axisadm018" c="COBBAN" a="modificable=true"/>>
                                                            <c:forEach var="cobradores" items="${REC_IAX_COBRADORES}">
                                                                <option value = "${cobradores.CCOBBAN}"
                                                                    <c:choose>
                                                                        <c:when test="${OB_IAX_RECIBOS.CCOBBAN == cobradores.CCOBBAN}">selected</c:when>
                                                                    </c:choose>>
                                                                    ${cobradores.CCOBBAN} - ${cobradores.TDESCRI}
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </axis:ocultar>
                                            </td--%>
                                        </axis:ocultar>
                                     </tr>

                                    <tr>
                                        <axis:ocultar f="axisadm018" c="CACCPRE" dejarHueco="false">
                                            <td class="titulocaja" colspan="2">
                                                <b id="label_CACCPRE"><axis:alt f="axisadm018" c="CACCPRE" lit="9903810" /></b>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm018" c="CACCRET" dejarHueco="false">
                                            <td class="titulocaja" colspan="2">
                                                <b id="label_CACCRET"><axis:alt f="axisadm018" c="CACCRET" lit="9903811" /></b>
                                            </td>
                                        </axis:ocultar>
                                    </tr>

                                    <tr>
                                        <axis:ocultar f="axisadm018" c="CACCPRE" dejarHueco="false">
                                            <td class="campocaja" colspan="2">
                                                <select name = "CACCPRE" id="CACCPRE"  style="width:90%;" size="1"  title="<axis:alt f="axisadm018" c="CACCPRE" lit="9903810"/>"
                                                class="campowidthselect campo campotexto" 
                                                <axis:atr f="axisadm018" c="CACCPRE" a="modificable=true"/> >
                                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axisadm018" lit="108341"/> - </option>
                                                    <c:forEach var="grupos" items="${preconocida}">
                                                        <option value = "${grupos.CATRIBU}"
                                                            <c:if test="${grupos.CATRIBU == OB_IAX_RECIBOS.CACCPRE}">selected</c:if>>
                                                            ${grupos.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select> 
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm018" c="CACCRET" dejarHueco="false">
                                            <td class="campocaja" colspan="2">
                                                <select name = "CACCRET" id="CACCRET"  style="width:90%;" size="1"  title="<axis:alt f="axisadm018" c="CACCRET" lit="9903811"/>"
                                                class="campowidthselect campo campotexto" 
                                                <axis:atr f="axisadm018" c="CACCRET" a="modificable=true"/> >
                                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axisadm018" lit="108341"/> - </option>
                                                    <c:forEach var="grupos" items="${retenida}">
                                                        <option value = "${grupos.CATRIBU}"
                                                            <c:if test="${grupos.CATRIBU == OB_IAX_RECIBOS.CACCRET}">selected</c:if>>
                                                            ${grupos.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select> 
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    
                                    <tr>
                                        <axis:ocultar f="axisadm018" c="TOBSERV" dejarHueco="false">
                                            <td class="titulocaja" colspan="4">
                                                <b id="label_TOBSERV"><axis:alt f="axisadm018" c="TOBSERV" lit="9903900" /></b>
                                            </td>
                                        </axis:ocultar>
                                    </tr>

                                    <tr>
                                        <axis:ocultar f="axisadm018" c="TOBSERV" dejarHueco="false">
                                            <td class="campocaja" colspan="4">
                                                <textarea  rows="4" class="campo campotexto" style="width:95%;" name="TOBSERV" id="TOBSERV"
                                                <axis:atr f="axisadm018" c="TOBSERV" a="modificable=true"/> >${OB_IAX_RECIBOS.TOBSERV}</textarea>
                                            </td>
                                        </axis:ocultar>
                                    </tr>

                                    <%-- ini bug 20761 --%>
                                    <tr>
                                        <axis:ocultar f="axisadm018" c="NCUOTAR" dejarHueco="false"> 
                                            <td class="titulocaja">
                                                <b id="label_NCUOTAR"><axis:alt f="axisadm018" c="label_NCUOTAR" lit="9901245" /></b>
                                            </td>
                                        </axis:ocultar>
                                        
                                        <!-- INI BUG CONF-379 - 03/05/2017 - JAEG -->
                                        <axis:ocultar f="axisadm018" c="CGESCAR" dejarHueco="false"> 
                                            <td class="titulocaja">
                                                <b id="label_CGESCAR"><axis:alt f="axisadm018" c="label_CGESCAR" lit="9909564" /></b>
                                            </td>
                                        </axis:ocultar>
                                        <!-- FIN BUG CONF-379 - 03/05/2017 - JAEG -->
                                        
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                     </tr>

                                    <tr>
                                        <axis:ocultar f="axisadm018" c="NCUOTAR" dejarHueco="false"> 
                                            <td class="campocaja">    
                                                <input type="text" name="NCUOTAR" id="NCUOTAR" 
                                               
                                                            value="${__formdata.NCUOTAR}" 
                                             
                                                class="campowidthinput campo campotexto" style="width:200px;"
                                                <axis:atr f="axisadm018" c="NCUOTAR" a="modificable=true&obligatorio=true"/> alt="<axis:alt f="axisadm018" c="NCUOTAR" lit="9901245" />" title="<axis:alt f="axisadm018" c="NCUOTAR" lit="9901245" />"/>
                                            </td>
                                        </axis:ocultar>

                                        <!-- INI BUG CONF-379 - 03/05/2017 - JAEG -->
                                        <axis:ocultar f="axisadm018" c="CGESCAR" dejarHueco="false">
                                            <td class="campocaja">
                                                <select name = "CGESCAR" id="CGESCAR"  style="width:90%;" size="1"  title="<axis:alt f="axisadm018" c="CGESCAR" lit="9909564"/>"
                                                class="campowidthselect campo campotexto" 
                                                <axis:atr f="axisadm018" c="CGESCAR" a="modificable=true"/> >
                                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axisadm018" lit="108341"/> - </option>
                                                    <c:forEach var="lcgescar" items="${requestScope.lcgescar}" varStatus="cont">
                                                        <option value = "${lcgescar.CATRIBU}"
                                                            <c:if test="${lcgescar.CATRIBU == OB_IAX_RECIBOS.CGESCAR}">selected</c:if>>
                                                            ${lcgescar.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select> 
                                            </td>
                                        </axis:ocultar>
                                        <!-- INI BUG CONF-379 - 03/05/2017 - JAEG -->
                                        
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                     </tr>
                                    <%-- fin bug 20761 --%>                                     
                                     
                                    </table>
                                </td>
                                
                            </tr>
                        </table>
                        <table id="resumen_children" class="seccion" style="display:none">
                        <c:if test="${!empty requestScope.T_IAX_MODIFICADO}">
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm018" c="flecha7" lit="108502" /></div>
                        <!--campos-->
                        <!--<table id="resumen_children" class="seccion" style="display:none">-->
                            <tr>
                            <td align="left">
                                 <table border="0" class="area" align="left" style="width:100%;">
                                    <tr>
                                        <td>
                                            <c:set var="title0"><axis:alt f="axisadm018" c="NRECIBO2" lit="100895"/></c:set>
                                            <c:set var="title1"><axis:alt f="axisadm018" c="TPRODUC" lit="100829"/></c:set>
                                            <c:set var="title2"><axis:alt f="axisadm018" c="NPOLIZA2" lit="100836"/></c:set>
                                            <c:set var="title3"><axis:alt f="axisadm018" c="TAGENTE" lit="100584"/></c:set>
                                            <c:set var="title4"><axis:alt f="axisadm018" c="ICOMISI" lit="108482"/></c:set>
                                            <c:set var="title5"><axis:alt f="axisadm018" c="IMPORTE2" lit="1000529"/></c:set>
                                            <c:set var="title6"><axis:alt f="axisadm018" c="IMPUESTO" lit="101278"/></c:set>
                                            <c:set var="title7"><axis:alt f="axisadm018" c="ICA" lit="9903550"/></c:set>
                                            <c:set var="title8"><axis:alt f="axisadm018" c="RETEICA" lit="9903552"/></c:set>
                                            <c:set var="title9"><axis:alt f="axisadm018" c="AVITASA" lit="9903546"/></c:set>
                                            <c:set var="title10"><axis:alt f="axisadm018" c="IVACOM" lit="9903582"/></c:set>
                                            <div class="displayspace">
                                                <display:table name="${requestScope.T_IAX_MODIFICADO}" id="miListaId" export="false" class="dsptgtable" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                requestURI="">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title0}" headerClass="headwidth10 sortable" sortProperty="NRECIBO"  media="html" autolink="false" >
                                                        <div class="dspNumber">${miListaId.NRECIBO}</div>
                                                    </display:column>
                                                    <display:column title="${title1}" sortable="false" sortProperty="TPRODUC" headerClass="sortable"  media="html" autolink="false">
                                                        <div class="dspText">${miListaId.TPRODUC}</div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="false" sortProperty="NPOLIZA" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                        <div class="dspNumber">${miListaId.NPOLIZA}</div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="false" sortProperty="TAGENTE" headerClass="sortable"  media="html" autolink="false">
                                                        <div class="dspText">${miListaId.TAGENTE}</div>
                                                    </display:column>
                                                    <display:column title="${title4}" sortable="false" sortProperty="ICOMISI" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                        <div class="dspNumber"><fmt:formatNumber pattern="###,##0.00" value='${miListaId.ICOMISI}'/></div>
                                                    </display:column>
                                                    <axis:visible f="axisadm018" c="IMP_IVA"> 
                                                    <display:column title="${title10}" sortable="false" sortProperty="IIMP_1" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                        <div class="dspNumber"><fmt:formatNumber pattern="###,##0.00" value='${miListaId.IIMP_1}'/></div>
                                                    </display:column>
                                                    </axis:visible>
                                                     <axis:visible f="axisadm018" c="IMP_ICA"> 
                                                    <display:column title="${title7}" sortable="false" sortProperty="IIMP_2" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                        <div class="dspNumber"><fmt:formatNumber pattern="###,##0.00" value='${miListaId.IIMP_2}'/></div>
                                                    </display:column>
                                                    </axis:visible>
                                                     <axis:visible f="axisadm018" c="IMP_RETEICA"> 
                                                     <display:column title="${title8}" sortable="false" sortProperty="IIMP_3" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                        <div class="dspNumber"><fmt:formatNumber pattern="###,##0.00" value='${miListaId.IIMP_3}'/></div>
                                                    </display:column>
                                                    </axis:visible>
                                                     <axis:visible f="axisadm018" c="IMP_AVISOS"> 
                                                     <display:column title="${title9}" sortable="false" sortProperty="IIMP_4" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                        <div class="dspNumber"><fmt:formatNumber pattern="###,##0.00" value='${miListaId.IIMP_4}'/></div>
                                                    </display:column>
                                                    </axis:visible>
                                                    <display:column title="${title5}" sortable="false" sortProperty="IMPORTE" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                        <div class="dspNumber"><fmt:formatNumber pattern="###,##0.00" value='${miListaId.IMPORTE}'/></div>
                                                    </display:column>
                                                </display:table>
                                            </div>                
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            </tr>
                        </c:if> 
                        </table>
                       
                </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm018</c:param><c:param name="f">axisadm018</c:param>
            <c:param name="__botones">salir,9000552</c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
</body>
</html>
