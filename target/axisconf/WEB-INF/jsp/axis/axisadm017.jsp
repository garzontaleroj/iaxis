<%/* Revision:# PuGJU0W7sO4UVuKoUXYs5A== # */%>
<%/*
*  Fichero: axisadm017.jsp 
*
*  Fecha: 29/01/2009
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
    <title><axis:alt f="axisadm017" c="FORM" lit="100905"/></title> <%-- CONSULTA DE RECIBOS --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="Stylesheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp"/>
    
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
    
    <script type="text/javascript">
        var pantalla_origen = '<%= request.getAttribute("pantalla_origen")%>';
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_pagrecibo(val){
            if (val != 2){
                f_reciboscaja();
            }else{
                f_recibosdom();
            } 
        }
        
        function f_reciboscaja(){
            objDom.setVisibilidadPorId("campo_cobban_label", "hidden"); 
            objDom.setVisibilidadPorId("campo_cobban", "hidden"); 
            document.getElementById("campo_cobban_label").style.display ="none";
            document.getElementById("campo_cobban").style.display ="none";
            objDom.setVisibilidadPorId("campo_delega_label", "visible"); 
            objDom.setVisibilidadPorId("campo_delega", "visible"); 
            document.getElementById("campo_delega_label").style.display ="block";
            document.getElementById("campo_delega").style.display ="block";   
            objDom.setValorPorId("COBRO", "DELEGA");
        }
        
        function f_recibosdom(){
            objDom.setVisibilidadPorId("campo_delega_label", "hidden"); 
            objDom.setVisibilidadPorId("campo_delega", "hidden"); 
            document.getElementById("campo_delega_label").style.display ="none";
            document.getElementById("campo_delega").style.display ="none";
            objDom.setVisibilidadPorId("campo_cobban_label", "visible"); 
            objDom.setVisibilidadPorId("campo_cobban", "visible"); 
            document.getElementById("campo_cobban_label").style.display ="block";
            document.getElementById("campo_cobban").style.display ="block";       
            objDom.setValorPorId("COBRO", "CCOBBAN");
        }
        
        function f_onload() {
            if (objUtiles.estaVacio(objDom.getValorPorId("NRECIBO")) ) {
                f_abrir_axisadm021();
                displaySeccion("datos_recibo_children", "", "none");
                displaySeccion("cobro_recibo_children", "", "none");
                <c:if test="${!empty requestScope.T_IAX_COBRADO}">
                    displaySeccion("resumen_children", "", "none");
                </c:if>
            }else{
                if(objUtiles.estaVacio(objDom.getValorPorId("COBRADO"))){
                    displaySeccion("datos_recibo_children", "none", "");
                    displaySeccion("cobro_recibo_children", "none", "");
                    <c:if test="${!empty requestScope.T_IAX_COBRADO}">
                        displaySeccion("resumen_children", "", "none");
                    </c:if>
                }else{
                    displaySeccion("datos_recibo_children", "none", "");
                    displaySeccion("cobro_recibo_children", "", "none");
                    <c:if test="${!empty requestScope.T_IAX_COBRADO}">
                        displaySeccion("resumen_children", "none", "");
                    </c:if>
                    objDom.setDisabledPorId("but_1000086",true); //boton generar
               }
               <axis:visible c="IMP_RECIBO" f="axisadm017">
               if(objDom.getValorPorId("COBRADO")){
                    var NRECIBO = objDom.getValorPorId("NRECIBO");
                    var SSEGURO = objDom.getValorPorId("SSEGURO");
                    objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_recibo&CSSEGURO="+SSEGURO+"&CNRECIBO="+NRECIBO+"&CTIPO=RECIBO");
                }  
               </axis:visible>
               
               
           }
       
           <c:if test="${empty __formdata['SEL_COBRADOR']}">
               f_reciboscaja();
           </c:if>
           <c:if test="${!empty __formdata['SEL_COBRADOR']}">
               if ("${__formdata['SEL_COBRADOR']}" != ("2")){
                  f_reciboscaja();
               }else{
                  f_recibosdom();
               }
           </c:if>     

            if(document.getElementById('SEL_COBRADOR')!=null){
                f_pagrecibo(document.getElementById('SEL_COBRADOR').value);
            }           
           
            f_cargar_propiedades_pantalla();
        }        
        
        function displaySeccion(id, actual, nuevo){
            if(objUtiles.utilEquals(document.getElementById(id).style.display, actual))
                    document.getElementById(id).style.display = nuevo;
        }
        
        function f_but_salir() {
            // Borrar parámetros de session en servidor
            objAjax.invokeAsyncCGI("axis_axisadm017.do", callbackCancelar, "operation=salir", this);
        }
        
        function callbackCancelar() {
            if(!objUtiles.estaVacio(objDom.getValorPorId("MSG_EXIT"))){
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=" + pantalla_origen + "", "cancelar", document.miForm, "_self", objDom.getValorPorId("MSG_EXIT"));
                objDom.setValorPorId("MSG_EXIT", "");
            }else
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr020", "cancelar", document.miForm, "_self");
        }
        
        function f_but_1000086() {
        
        if (objUtiles.estaVacio(document.miForm.list_COBBANCARIO.value))
         COBBANCARIO = "${requestScope.selected_COBBANCARIO}";
         else
         COBBANCARIO = document.miForm.list_COBBANCARIO.value;
         
            objUtiles.ejecutarFormulario ("axis_axisadm017.do?CCOBBANCARIOselected="+COBBANCARIO, "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
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
            objUtiles.ejecutarFormulario ("axis_axisadm017.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_cerrar_axisimprimir() {
                objUtiles.cerrarModal("axisimprimir");
          }
        
    </script>    
</head>

<body onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisadm017" c="TITULO" lit="9000991" /></c:param>
                <c:param name="nid" value="axisadm021" />
        </c:import>
        
        
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisadm017" c="axisadm017" lit="9000798"/></c:param>     <%-- COBRO MANUAL DE RECIBOS --%>
                <c:param name="formulario"><axis:alt f="axisadm017" c="axisadm017" lit="9000798"/></c:param> <%-- COBRO MANUAL DE RECIBOS --%>
                <c:param name="form">axisadm017</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisadm017" c="axisimprimir" lit="1000205" /></c:param>
            <c:param name="nid" value="axisimprimir"></c:param>
        </c:import>
    
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="CEMPRES" id="CEMPRES" value="${requestScope.OB_IAX_RECIBOS.CEMPRES}"/>
        <input type="hidden" name="SSEGURO" id="SSEGURO" value="${requestScope.OB_IAX_GENPOLIZA.SSEGURO}"/>
        <input type="hidden" name="COBRADO" id="COBRADO" value="${requestScope.COBRADO}"/>
        <input type="hidden" name="IIMP_1" id="IIMP_1" value="${requestScope.IIMP_1}"/>
        <input type="hidden" name="IIMP_2" id="IIMP_2" value="${requestScope.IIMP_2}"/>
        <input type="hidden" name="IIMP_3" id="IIMP_3" value="${requestScope.IIMP_3}"/>
        <input type="hidden" name="IIMP_4" id="IIMP_4" value="${requestScope.IIMP_4}"/>
        <input type="hidden" name="MSG_EXIT" id="MSG_EXIT" value=""/>
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm017" c="LIT_1000565" lit="1000565" /><c:if test="${empty requestScope.acceso_externo || requestScope.acceso_externo== 'false'}"><img border="0" src="images/find.gif" onclick="f_abrir_axisadm021()" style="cursor:pointer" alt="<axis:alt f='axisadm017' c='LIT_100797' lit='100797' /> <axis:alt f='axisadm017' c='LIT_9000410' lit='9000410' />" title="<axis:alt f='axisadm017' c='LIT_100797' lit='100797' /> <axis:alt f='axisadm017' c='LIT_9000410' lit='9000410' />"/></c:if></div>
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
                                        <axis:visible f="axisadm017" c="CEMPRES"> 
                                            <td class="titulocaja">
                                                <b id="label_CEMPRES"><axis:alt f="axisadm017" c="CEMPRES" lit="101619" /></b>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisadm017" c="TRAMO"> 
                                            <td class="titulocaja">
                                                <b id="label_TRAMO"><axis:alt f="axisadm017" c="TRAMO" lit="100784" /></b>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisadm017" c="SPRODUC"> 
                                            <td class="titulocaja">
                                                <b id="label_SPRODUC"><axis:alt f="axisadm017" c="SPRODUC" lit="100829" /></b>
                                            </td>
                                        </axis:visible>
                                        <td></td>
                                        <td></td>
                                        
                                    </tr>
                                    <tr>
                                        <axis:visible f="axisadm017" c="TEMPRES"> 
                                            <td class="campocaja" >    
                                                <input type="text" name="TEMPRES" id="TEMPRES" value="${requestScope.OB_IAX_GENPOLIZA.TEMPRES}" class="campodisabled campo campotexto" style="width:100%;"
                                                <axis:atr f="axisadm017" c="TEMPRES" a="modificable=false&obligatorio=false"/> alt="<axis:alt f="axisadm017" c="TEMPRES" lit="100784" />" title="<axis:alt f="axisadm017" c="TEMPRES" lit="100784" />"/>
                                            </td>
                                        </axis:visible>
                                         <axis:visible f="axisadm017" c="TRAMO"> 
                                            <td class="campocaja" >    
                                                <input type="text" name="TRAMO" id="TRAMO" value="${requestScope.OB_IAX_GENPOLIZA.TRAMO}" class="campodisabled campo campotexto" style="width:100%;"
                                                <axis:atr f="axisadm017" c="TRAMO" a="modificable=false&obligatorio=false"/> alt="<axis:alt f="axisadm017" c="TRAMO" lit="101619" />" title="<axis:alt f="axisadm017" c="TRAMO" lit="101619" />"/>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisadm017" c="TPRODUC"> 
                                           <td class="campocaja" colspan="2">    
                                                <input type="text" name="TPRODUC" id="TPRODUC" value="${requestScope.OB_IAX_GENPOLIZA.TPRODUC}" class="campodisabled campo campotexto" style="width:100%;"
                                                <axis:atr f="axisadm017" c="TPRODUC" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    
                                    <tr>
                                        <!-- Num. Póliza -->
                                        <axis:visible f="axisadm017" c="NPOLIZA"> 
                                            <td class="titulocaja" >
                                                <b id="label_NPOLIZA"><axis:alt f="axisadm017" c="NPOLIZA" lit="9001514" /></b>
                                            </td>
                                        </axis:visible>
                                        <!-- Certificado -->
                                        <axis:visible f="axisadm017" c="NCERTIF"> 
                                            <td class="titulocaja" >
                                                <b id="label_NCERTIF"><axis:alt f="axisadm017" c="NCERTIF" lit="101300"/></b>
                                            </td>
                                        </axis:visible>
                                        <!-- Nombre tomador -->
                                        <axis:visible f="axisadm017" c="TNOMTOM">
                                            <td class="titulocaja" >
                                                <b id="label_TNOMTOM"><axis:alt f="axisadm017" c="TNOMTOM" lit="101027" /></b>
                                            </td>
                                        </axis:visible>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    
                                    <tr>
                                        <!-- Num. Póliza -->
                                        <axis:visible f="axisadm017" c="NPOLIZA"> 
                                           <td class="campocaja">    
                                                <input type="text" name="NPOLIZA" id="NPOLIZA" value="${requestScope.OB_IAX_GENPOLIZA.NPOLIZA}" class="campodisabled campo campotexto" style="width:100%;"
                                                <axis:atr f="axisadm017" c="NPOLIZA" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                        <!-- Certificado -->
                                        <axis:visible f="axisadm017" c="NCERTIF"> 
                                           <td class="campocaja">    
                                                <input type="text" name="NCERTIF" id="NCERTIF" value="${requestScope.OB_IAX_GENPOLIZA.NCERTIF}" class="campodisabled campo campotexto" style="width:35%"
                                                <axis:atr f="axisadm017" c="NCERTIF" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                        <!-- Tomador -->
                                        <axis:visible f="axisadm017" c="TNOMTOM"> 
                                           <td class="campocaja" colspan="2">    
                                                <input type="text" name="TNOMTOM" id="TNOMTOM" value="${requestScope.OB_IAX_GENPOLIZA.TNOMTOM}" class="campodisabled campo campotexto" style="width:100%;"
                                                <axis:atr f="axisadm017" c="TNOMTOM" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                      
                                        <td></td>
                                    </tr>
                                    
                                    <tr>
                                        <%-- Sucursal --%>
                                        <axis:visible f="axisadm017" c="TSUCURSAL">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisadm017" c="TSUCURSAL" lit="9002202"/></b>
                                            </td>   
                                        </axis:visible>
                                        <!-- Delegación - Agente -->
                                        <axis:ocultar f="axisadm017" c="TDELEGA" dejarHueco="false">
                                        <td class="titulocaja">
                                                <b><axis:alt f="axisadm017" c="TDELEGA" lit="1000561"/></b>
                                        </td> 
                                        </axis:ocultar>
                                        <axis:visible f="axisadm017" c="CAGENTE"> 
                                            <td class="titulocaja" colspan="2">
                                                <b id="label_CAGENTE"><axis:alt f="axisadm017" c="CAGENTE" lit="100584" /></b>
                                            </td>
                                        </axis:visible>
                                        <td></td>
                                        <td></td>
                                        <%-- Delegación --%>
                                        
                                    </tr>
                                    
                                    <tr>
                                        <%-- Sucursal --%>
                                        <axis:visible f="axisadm017" c="TSUCURSAL">
                                        <td class="campocaja">
                                             <input type="text" class="campodisabled campo campotexto" id="TSUCURSAL" name="TSUCURSAL" size="15"  style="width:90%"
                                             value="${OB_IAX_RECIBOS.TSUCURSAL}" readonly="readonly"/>
                                        </td>
                                        </axis:visible>
                                        <%-- Delegación --%>
                                        <axis:ocultar f="axisadm017" c="TDELEGA" dejarHueco="false">
                                        <td class="campocaja">
                                             <input type="text" class="campodisabled campo campotexto" id="TDELEGA" name="TDELEGA" size="15"  style="width:90%"
                                             value="${OB_IAX_RECIBOS.TDELEGA}" readonly="readonly"/>
                                        </td>
                                        </axis:ocultar>
                                        <%-- Agente --%>
                                        <axis:visible f="axisadm017" c="CAGENTE"> 
                                        <td class="campocaja" colspan="3">
                                             <input type="text" class="campodisabled campo campotexto" id="CAGENTE" name="TAGENTE" size="15" style="width:15%"
                                             value="${OB_IAX_RECIBOS.CAGENTE}" readonly="readonly"/>
                                             &nbsp;
                                             <input type="text" class="campodisabled campo campotexto" id="TAGENTE" name="TAGENTE" size="15" style="width:70%"
                                             value="${OB_IAX_RECIBOS.TAGENTE}" readonly="readonly"/>
                                        </td>
                                        </axis:visible>
                                        <td></td>
                                        
                                    </tr>
                                    <tr>
                                    <!-- Forma de pago -->
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisadm017" c="LIT_100712" lit="100712"/></b>
                                    </td> 
                                    <!-- Tipus compte -->
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisadm017" c="LIT_1000374" lit="1000374" /></b>
                                    </td>     
                                    <!-- Compte bancari -->
                                        <axis:visible f="axisadm017" c="CBANCAR"> <!-- TODO C -->
                                            <td class="titulocaja" colspan="2">
                                                <b id="label_CBANCAR"><axis:alt f="axisadm017" c="CBANCAR" lit="100965" /></b>
                                            </td>
                                        </axis:visible>

                                    <!-- bug 20761 -->
                                    <!-- cuotas tarjeta -->
                                    <axis:visible f="axisadm017" c="NCUOTAR"> 
                                    <td class="titulocaja">
                                        <b id="label_NCUOTAR"><axis:alt f="axisadm017" c="NCUOTAR" lit="9901245" /></b>
                                    </td>
                                    </axis:visible>

                                        <td/>
                                        <td/>
                                        
                                    </tr>
                                    
                                    <tr>
                                        <!-- Forma de pago -->
                                        <td class="campocaja">
                                            <input type="text" class="campodisabled campo campotexto" id="TFORPAG" name="TFORPAG" size="15" style="width:90%"
                                            value="${OB_IAX_RECIBOS.TFORPAG}" readonly="readonly"/>
                                        </td>
                                        <!-- Tipus compte -->
                                        <td class="campocaja">
                                            <input type="text" class="campodisabled campo campotexto" id="TTIPBAN" name="TTIPBAN" size="15" style="width:90%"
                                            value="${OB_IAX_RECIBOS.TTIPBAN}" readonly="readonly"/>
                                        </td>
                                        <%-- Cuenta bancaria --%>
                                        <axis:visible f="axisadm017" c="CBANCAR_1"> 
                                        <td class="campocaja" colspan="2">
                                            <input type="text" class="campodisabled campo campotexto" id="CBANCAR_1" name="CBANCAR_1" size="15" style="width:100%"
                                            value="<axis:masc f="axisadm017" c="CBANCAR_1" value="${OB_IAX_RECIBOS.CBANCAR}" />" readonly="readonly"/>
                                        </td>
                                        </axis:visible>
                                        <%-- bug 20761 --%>
                                        <%-- cuotas tarjeta --%>
                                        <axis:visible f="axisadm017" c="NCUOTAR"> 
                                        <td class="campocaja">
                                            <input type="text" class="campodisabled campo campotexto" id="NCUOTAR_1" name="NCUOTAR_1" size="15" style="width:100%"
                                            value="${OB_IAX_RECIBOS.NCUOTAR}" readonly="readonly"/>
                                        </td>
                                        </axis:visible>
                                        <td></td>
                                    </tr>
                                    
                                    <tr>
                                        <!-- Recibo -->
                                        <axis:visible f="axisadm017" c="NRECIBO"> 
                                            <td class="titulocaja">
                                                <b id="label_NRECIBO"><axis:alt f="axisadm017" c="NRECIBO" lit="800636" /></b>
                                            </td>
                                        </axis:visible>
                                        <%-- Nº Recibo Compania --%>
                                        <axis:ocultar c="CRECCIA" f="axisadm017" dejarHueco="false">
                                            <td class="titulocaja" id="LIT_CRECCIA">
                                             <b><axis:alt f="axisadm017" c="CRECCIA" lit="9001763"/></b>
                                            </td>     
                                        </axis:ocultar>     
                                        <!-- Estado del recibo -->
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisadm017" c="LIT_1000553" lit="1000553"/></b>
                                        </td>
                                        <!-- Importe -->
                                        <axis:visible f="axisadm017" c="IMPORTE"> 
                                            <td class="titulocaja">
                                                <b id="label_IMPORTE"><axis:alt f="axisadm017" c="LIT_1000563" lit="1000563" /></b>
                                            </td>
                                        </axis:visible>
                                      
                                    </tr>
                                    <tr>
                                        <!-- Recibo -->
                                         <axis:visible f="axisadm017" c="NRECIBO"> 
                                            <td class="campocaja">    
                                                <input type="text" name="NRECIBO" id="NRECIBO" value="${requestScope.NRECIBO}" class="campodisabled campo campotexto" style="width:75px;"
                                                <axis:atr f="axisdm018" c="NRECIBO" a="modificable=false&obligatorio=false"/> alt="<axis:alt f="axisadm017" c="NRECIBO" lit="800636" />" title="<axis:alt f="axisadm017" c="NRECIBO" lit="800636" />"/>
                                            </td>
                                        </axis:visible>
                                        <%-- Nº Recibo Compania --%>
                                        <axis:ocultar c="CRECCIA" f="axisadm017" dejarHueco="false">
                                        <td class="campocaja">
                                            <input type="text" class="campo campotexto campodisabled" id="CRECCIA" name="CRECCIA" <axis:atr f="axisadm017" c="CRECCIA" a="modificable=false&obligatorio=false"/>  style="width:90%"
                                            value="${OB_IAX_RECIBOS.CRECCIA}" readonly="readonly"/>
                                        </td>
                                        </axis:ocultar>         
                                        <!-- Situación /Estado -->
                                         <td class="campocaja">
                                                        <input type="text" class="campodisabled campo campotexto" id="TESTREC" name="TESTREC" size="15" style="width:90%"
                                                        value="${OB_IAX_RECIBOS.TESTREC}" readonly="readonly"/>
                                         </td>
                                        <!-- Importe -->
                                        <axis:visible f="axisadm017" c="IMPORTE"> 
                                           <td class="campocaja">   
                                                <input type="text" name="IMPORTE" id="IMPORTE" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${requestScope.OB_IAX_RECIBOS.IMPORTE}'/>" class="campodisabled campo campotexto" style="width:75%;"
                                                <axis:atr f="axisdm018" c="IMPORTE" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                       
                                    </tr>
                                    
                                    <tr>
                                        <!-- Tipo recibo -->
                                        <td class="titulocaja">
                                             <b><axis:alt f="axisadm017" c="LIT_102302" lit="102302"/></b>
                                        </td> 
                                        <!-- Fecha emision -->
                                        <axis:visible f="axisadm017" c="FEMISIO"> 
                                            <td class="titulocaja">
                                                <b id="label_FEMISIO"><axis:alt f="axisadm017" c="FEMISIO" lit="1000562" /></b>
                                            </td>
                                        </axis:visible>
                                        <!-- Estado impresion -->
                                        <td class="titulocaja">
                                                <b><axis:alt f="axisadm017" c="LIT_1000571" lit="1000571"/></b>
                                        </td> 
                                         <!-- Fecha efecto -->
                                        <axis:visible f="axisadm017" c="FEFECTO"> 
                                            <td class="titulocaja">
                                                <b id="label_FEFECTO"><axis:alt f="axisadm017" c="FEFECTO" lit="100883" /></b>
                                            </td>
                                        </axis:visible>
                                        <!-- Fecha vencimiento -->
                                        <axis:visible f="axisadm017" c="FVENCIM"> 
                                            <td class="titulocaja">
                                                <b id="label_FVENCIM"><axis:alt f="axisadm017" c="FVENCIM" lit="100885" /></b>
                                            </td>
                                        </axis:visible>
                                        
                                    </tr>
                                    
                                    <tr>
                                        <!-- Tipo recibo -->
                                        <axis:visible f="axisadm017" c="TTIPREC"> 
                                        <td class="campocaja">
                                            <input type="text" class="campodisabled campo campotexto" id="TTIPREC" name="TTIPREC" size="15" style="width:90%"
                                            value="${OB_IAX_RECIBOS.TTIPREC}" readonly="readonly"/>
                                        </td>
                                        </axis:visible>
                                        <!-- Fecha emision -->
                                        <axis:visible f="axisadm017" c="FEMISIO"> 
                                            <td class="campocaja">
                                                <input type="text" name="FEMISIO" id="FEMISIO" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${requestScope.OB_IAX_RECIBOS.FEMISIO}'/>" class="campodisabled campo campotexto" style="width:85px;"
                                                <axis:atr f="axisadm017" c="FEMISIO" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                        <!-- Estado impresion -->
                                         <axis:visible f="axisadm017" c="TESTIMP">
                                        <td class="campocaja">
                                                <input type="text" class="campodisabled campo campotexto" id="TESTIMP_1" name="TESTIMP_1" size="15" style="width:90%"
                                                value="${OB_IAX_RECIBOS.TESTIMP}" readonly="readonly" <axis:atr f="axisadm017" c="TESTIMP" a="modificable=false&obligatorio=false"/>  />
                                        </td>
                                        </axis:visible>
                                         <!-- Fecha efecto -->
                                        <axis:visible f="axisadm017" c="FEFECTO">
                                           <td class="campocaja">    
                                                <input type="text" name="FEFECTO" id="FEFECTO" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${requestScope.OB_IAX_RECIBOS.FEFECTO}'/>" class="campodisabled campo campotexto" style="width:40%;"
                                                <axis:atr f="axisadm017" c="FEFECTO" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                        <!-- Fecha vencimiento -->                                      
                                        <axis:visible f="axisadm017" c="FVENCIM"> 
                                           <td class="campocaja">    
                                                <input type="text" name="FVENCIM" id="FVENCIM" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${requestScope.OB_IAX_RECIBOS.FVENCIM}'/>" class="campodisabled campo campotexto" style="width:40%;"
                                                <axis:atr f="axisadm017" c="FVENCIM" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                    </tr>
                                    
                                    <!--       ****************************************************************************    -->
                            </table>
                        </td>
                    </tr>
                    </table>
                    
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm017" c="LIT_1000191" lit="1000191" /></div>
                    <!--campos-->
                     <table id="cobro_recibo_children" class="seccion" style="display:none">
                        <tr>
                            <td align="left">
                                 <table border="0" class="area" align="center">
                                    <tr>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:50%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <axis:visible f="axisadm017" c="FMOVIMI"> <!-- TODO C -->
                                            <td class="titulocaja">
                                                <b id="label_FMOVIMI"><axis:alt f="axisadm017" c="FMOVIMI" lit="9000805" /></b>
                                            </td>
                                        </axis:visible>
                                        
                                        <axis:ocultar f="axisadm017" c="SEL_COBRADOR"> <!-- TODO C -->
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisadm017" c="SEL_COBRADOR" lit="101516" /></b>
                                            </td>
                                        </axis:ocultar>
                                        
                                        <td class="titulocaja">
                                        <axis:ocultar f="axisadm017" c="COBBAN"> <!-- TODO C -->
                                            
                                            <div id="campo_cobban_label">
                                                <b id="label_COBBAN"><axis:alt f="axisadm017" c="COBBAN" lit="100879" /></b>
                                            </div>
                                        </axis:ocultar>
                                        
                                        
                                        <axis:ocultar f="axisadm017" c="DELEGA"> <!-- TODO C -->
                                            
                                            <div id="campo_delega_label">    
                                                <b id="label_DELEGA"><axis:alt f="axisadm017" c="DELEGA" lit="1000561" /></b>
                                            </div>
                                            
                                        </axis:ocultar>
                                        </td>
                                        
                                     </tr>
                                     <tr>
                                        <axis:visible f="axisadm017" c="FMOVIMI"> <!-- TODO C -->
                                            <td class="campocaja">    
                                                <input title="<axis:alt f='axisadm017' c='FMOVIMI' lit='9000805' />" alt="<axis:alt f='axisadm017' c='FMOVIMI' lit='9000805' />" type="text" name="FMOVIMI" id="FMOVIMI" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${requestScope.FMOVIMI}'/>" class="campowidthinputsmall campo campotexto_ob" style="width:85px;"
                                                <axis:atr f="axisdm017" c="FMOVIMI" a="formato=fecha&modificable=true&obligatorio=true"/>/><a id="icon_FMOVIMI" style="vertical-align:middle;"><img 
                                             alt="<axis:alt f="axisadm017" c="FMOVIMI" lit="9000805"/>" title="<axis:alt f="axisadm017" c="FMOVIMI" lit="9000805" />" src="images/calendar.gif"/></a>
                                            </td>
                                        </axis:visible>
                                        
                                         <!-- Bug 0020010 - JMF - 15/11/2011 cambio onclick por onchange -->
                                        <axis:ocultar f="axisadm017" c="SEL_COBRADOR"> <!-- TODO C -->
                                            <td class="titulocaja">
                                                <select title="<axis:alt f='axisadm017' c='SEL_COBRADOR' lit='101516' />" alt="<axis:alt f='axisadm017' c='SEL_COBRADOR' lit='101516' />" name = "SEL_COBRADOR" id="SEL_COBRADOR" size="1" 
                                                    class="campowidthselect campo campotexto_ob" style="width:200px;" onchange="f_pagrecibo(this.value)"
                                                    <axis:atr f="axisadm017" c="SEL_COBRADOR" a="modificable=true&obligatorio=true"/>>
                                                    <c:forEach var="tipospag" items="${T_IAX_TIPOPAGO}">
                                                        <option value = "${tipospag.CATRIBU}"
                                                            <c:choose>
                                                                <c:when test="${OB_IAX_RECIBOS.CTIPOCOB == tipospag.CATRIBU}">selected</c:when>
                                                            </c:choose>>
                                                            ${tipospag.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </axis:ocultar>
                                        
                                        <td class="campocaja"> 
                                        <axis:ocultar f="axisadm017" c="COBBAN"> <!-- TODO C -->  
                                            <div id="campo_cobban">
                                                <select title="<axis:alt f='axisadm017' c='COBBAN' lit='100879' />" alt="<axis:alt f='axisadm017' c='COBBAN' lit='100879' />" name = "list_COBBANCARIO" id="list_COBBANCARIO" size="1" 
                                                    class="campowidthselect campo campotexto_ob" style="width:200px;"
                                                    <axis:atr f="axisadm017" c="COBBAN" a="modificable=true&obligatorio=true"/>>
                                                    <c:forEach var="cobradores" items="${REC_IAX_COBRADORES}">
                                                        <option value = "${cobradores.CCOBBAN}"
                                                            <c:choose>
                                                                <c:when test="${OB_IAX_RECIBOS.CCOBBAN == cobradores.CCOBBAN}">selected</c:when>
                                                            </c:choose>>
                                                            ${cobradores.CCOBBAN} - ${cobradores.NCUENTA}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </axis:ocultar>
                                        
                                        
                                        <axis:ocultar f="axisadm017" c="DELEGA"> <!-- TODO C -->
                                              
                                            <div id="campo_delega">
                                                 <select title="<axis:alt f='axisadm017' c='DELEGA' lit='1000561' />" alt="<axis:alt f='axisadm017' c='DELEGA' lit='1000561' />" name = "list_DELEGACI" id="list_DELEGACI" size="1" 
                                                    class="campowidthselect campo campotexto_ob"
                                                    <axis:atr f="axisadm017" c="DELEGA" a="modificable=true&obligatorio=true"/>>
                                                    <c:forEach var="delegaciones" items="${REC_IAX_DELEGACIONES}">
                                                        <option value = "${delegaciones.CAGENTE}"
                                                            <c:choose>
                                                                <c:when test="${OB_IAX_RECIBOS.CDELEGA == delegaciones.CAGENTE}">selected</c:when>
                                                            </c:choose>>
                                                            ${delegaciones.CAGENTE} - ${delegaciones.TNOMBRE}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            
                                        </axis:ocultar>
                                        </td>
                                     </tr>
                                     
                                        
                                        <!--td class="titulocaja">
                                            <input type="button" class="boton" id="but_aceptar" name="but_aceptar"  value="<axis:alt f="axisadm017" c="mi" lit="1000086" />" 
                                            onclick="f_but_aceptar()"/>
                                        </td-->
                                    </table>
                                </td>
                                
                            </tr>
                        </table>
                        
                        <c:if test="${!empty requestScope.T_IAX_COBRADO}">
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm017" c="COBRADO" lit="108502" /></div>
                        <!--campos-->
                        <table id="resumen_children" class="seccion" style="display:none">
                            <tr>
                            <axis:ocultar f="axisadm017" c="DSP_COB">
                            <td align="left">
                                 <table border="0" class="area" align="left" style="width:100%;">
                                    <tr>
                                        <td>
                                            <c:set var="title0"><axis:alt f="axisadm017" c="NRECIBOR" lit="100895"/></c:set>
                                            <c:set var="title1"><axis:alt f="axisadm017" c="TPRODUC" lit="100829"/></c:set>
                                            <c:set var="title2"><axis:alt f="axisadm017" c="NPOLIZAR" lit="100836"/></c:set>
                                            <c:set var="title3"><axis:alt f="axisadm017" c="TAGENTE" lit="100584"/></c:set>
                                            <c:set var="title4"><axis:alt f="axisadm017" c="ICOMISI" lit="108482"/></c:set>
                                            <c:set var="title5"><axis:alt f="axisadm017" c="IMPORTE" lit="1000529"/></c:set>
                                            <c:set var="title6"><axis:alt f="axisadm017" c="IMPUESTO" lit="101278"/></c:set>
                                            <c:set var="title7"><axis:alt f="axisadm017" c="ICA" lit="9903550"/></c:set> 
                                            <c:set var="title8"><axis:alt f="axisadm017" c="RETEICA" lit="9903552"/></c:set>
                                            <c:set var="title9"><axis:alt f="axisadm017" c="AVITASA" lit="9903546"/></c:set>
                                            <c:set var="title10"><axis:alt f="axisadm017" c="IVACOM" lit="9903582"/></c:set>
                                            <div class="displayspace">
                                                <display:table name="${requestScope.T_IAX_COBRADO}" id="miListaId" export="false" class="dsptgtable" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
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
                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${miListaId.ICOMISI}'/></div>
                                                    </display:column>
                                                    <%--axis:visible f="axisadm017" c="IMPUESTO"> 
                                                    <display:column title="${title6}" sortable="false" sortProperty="IMPUESTO" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${miListaId.IMPUESTO}'/></div>
                                                    </display:column>
                                                    </axis:visible--%>
                                                    <axis:visible f="axisadm017" c="IMP_IVA"> 
                                                    <display:column title="${title10}" sortable="false" sortProperty="IIMP_1" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${miListaId.IIMP_1}'/></div>
                                                    </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisadm017" c="IMP_ICA"> 
                                                    <display:column title="${title7}" sortable="false" sortProperty="IIMP_2" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${miListaId.IIMP_2}'/></div>
                                                    </display:column>
                                                    </axis:visible>
                                                     <axis:visible f="axisadm017" c="IMP_RETEICA"> 
                                                     <display:column title="${title8}" sortable="false" sortProperty="IIMP_3" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${miListaId.IIMP_3}'/></div>
                                                    </display:column>
                                                    </axis:visible>
                                                     <axis:visible f="axisadm017" c="IMP_AVISOS"> 
                                                     <display:column title="${title9}" sortable="false" sortProperty="IIMP_4" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${miListaId.IIMP_4}'/></div>
                                                    </display:column>
                                                    </axis:visible>
                                                    <display:column title="${title5}" sortable="false" sortProperty="IMPORTE" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${miListaId.IMPORTE}'/></div>
                                                    </display:column>
                                                </display:table>
                                            </div>                
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            </axis:ocultar>
                            </tr>
                    </table>
                    </c:if>
                </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm017</c:param><c:param name="f">axisadm017</c:param>
            <c:param name="__botones">salir,1000086</c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
    <script type="text/javascript">
    <axis:visible f="axisadm017" c="FMOVIMI">
        Calendar.setup({
            inputField     :    "FMOVIMI",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FMOVIMI",  
            singleClick    :    true,
            firstDay       :    1
        });
    </axis:visible>
    </script>
</body>
</html>