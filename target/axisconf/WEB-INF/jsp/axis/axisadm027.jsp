<%/* Revision:# 58/PtBeeLTkpEee0s+el9A== # */%>
<%/*
*  Fichero: axisadm027.jsp 
*
*  Fecha: 08/02/2009
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
    <title><axis:alt c="titulo1" f="axisadm027" lit="9000842"/></title> <%-- CONSULTA DE RECIBOS --%>
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
        
        function f_onload() {
            
            f_cargar_propiedades_pantalla();
        
            if (objUtiles.estaVacio(objDom.getValorPorId("NRECIBO")) ) {
                f_abrir_axisadm021();
                displaySeccion("datos_recibo_children", "", "none");
                displaySeccion("impago_recibo_children", "", "none");
                displaySeccion("resumen_children", "", "none");
            }else{
                if(objUtiles.estaVacio(objDom.getValorPorId("IMPAGADO"))){
                    displaySeccion("datos_recibo_children", "none", "");
                    displaySeccion("impago_recibo_children", "none", "");
                    <c:if test="${!empty requestScope.T_IAX_IMPAGADO}">
                        displaySeccion("resumen_children", "", "none");
                    </c:if>
                }else{
                    //alert("segunda opcion");
                    displaySeccion("datos_recibo_children", "none", "");
                    displaySeccion("impago_recibo_children", "", "none");
                    displaySeccion("resumen_children", "none", "");
                    objDom.setDisabledPorId("but_100009",true); //boton 
                }
            }
        }       
      
        
        function displaySeccion(id, actual, nuevo){
            if(objUtiles.utilEquals(document.getElementById(id).style.display, actual))
                    document.getElementById(id).style.display = nuevo;
        }
        
        function f_but_salir() {
            // Borrar parámetros de session en servidor
            objAjax.invokeAsyncCGI("axis_axisadm027.do", callbackCancelar, "operation=salir", this);
        }
        
        function callbackCancelar() {
            if(!objUtiles.estaVacio(objDom.getValorPorId("MSG_EXIT"))){
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=" + pantalla_origen + "", "cancelar", document.miForm, "_self", objDom.getValorPorId("MSG_EXIT"));
                objDom.setValorPorId("MSG_EXIT", "");
            }else
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr020", "cancelar", document.miForm, "_self");
        }
        
        function f_but_100009() {
            var listcobban = objDom.getValorPorId("list_COBBANCARIO");
            if (objUtiles.estaVacio(listcobban))
            {
                CCOBBAN = "${OB_IAX_RECIBOS.CCOBBAN}";
            }
            else
            {
                CCOBBAN = listcobban;
            }
            
            //objDom.setValorPorId("list_COBBANCARIO", CCOBBAN);
            objUtiles.ejecutarFormulario ("axis_axisadm027.do?CCOBBANCARIOselected="+CCOBBAN, "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        
        function f_set_precimp()
        {
              document.miForm.PRECIMP.value = document.getElementById("PRECIMP").checked ? "1" : "0";            
        }
        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_abrir_axisadm021() {
            var PESTREC = 1;
            objUtiles.abrirModal("axisadm021","src","modal_axisadm021.do?operation=init&PESTREC=" + PESTREC);
        }
        
        function f_cerrar_axisadm021(NRECIBO_NULL) {
            objUtiles.cerrarModal("axisadm021");
        }    
        function f_aceptar_axisadm021 (NRECIBO){
            objDom.setValorPorId("NRECIBO", NRECIBO);
            f_cerrar_axisadm021();
            objUtiles.ejecutarFormulario ("axis_axisadm027.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }  
      function f_abrir_axisctr019() {
                objUtiles.abrirModal("axisctr019","src","modal_axisctr019.do?operation=form");
            }
            
            function f_cerrar_axisctr019() {
                objUtiles.cerrarModal("axisctr019");
            }   
            
        function f_aceptar_axisctr019 (SSEGURO, POL, CERT) {
                f_cerrar_axisctr019();
                objDom.setValorComponente(document.miForm.SSEGURO, SSEGURO);
                objUtiles.ejecutarFormulario ("axis_axisadm027.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);     
            }
        
    </script>    
</head>

<body onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt c="titulo2" f="axisadm027" lit="9000991" /></c:param>
                <c:param name="nid" value="axisadm021" />
        </c:import>
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt c="titulo27" f="axisadm027" lit="9000842"/></c:param>     <%-- IMPAGO DE RECIBOS --%>
                <c:param name="formulario"><axis:alt c="form27" f="axisadm027" lit="9000842"/></c:param> <%-- IMPAGO DE RECIBOS --%>
                <c:param name="form">axisadm027</c:param>
        </c:import>
               <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt c="TITULO_BUSC" f="axisctr301" lit="1000188"/></c:param>
                <c:param name="nid" value="axisctr019" />
            </c:import>
    
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="IMPAGADO" id="IMPAGADO" value="${requestScope.IMPAGADO}"/>
        <input type="hidden" name="MSG_EXIT" id="MSG_EXIT" value=""/>
        <input type="hidden" name="IIMP_1" id="IIMP_1" value="${requestScope.IIMP_1}"/>
        <input type="hidden" name="IIMP_2" id="IIMP_2" value="${requestScope.IIMP_2}"/>
        <input type="hidden" name="IIMP_3" id="IIMP_3" value="${requestScope.IIMP_3}"/>
        <input type="hidden" name="IIMP_4" id="IIMP_4" value="${requestScope.IIMP_4}"/>
		<input type="hidden" name="ICOMBRU" id="ICOMBRU" value="${requestScope.ICOMBRU}"/>
        <input type="hidden" name="SSEGURO" id="SSEGURO" value="${formdata.SSEGURO}"/>
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt c="flecha1" f="axisadm027" lit="1000565" />&nbsp;<c:if test="${empty requestScope.acceso_externo || requestScope.acceso_externo== 'false'}"><img border="0" src="images/find.gif" onclick="f_abrir_axisadm021()" style="cursor:pointer" alt="<axis:alt c="flecha2" f="axisadm027" lit='100797' /> <axis:alt c="flecha3" f="axisadm027" lit='9000410' />" title="<axis:alt c="flecha4" f="axisadm027" lit='100797' /> <axis:alt c="flecha5" f="axisadm027" lit='9000410' />"/></c:if></div>
                        <!-- campos detalle recibo-->
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
                                        <axis:visible f="axisadm027" c="CEMPRES"> 
                                            <td class="titulocaja">
                                                <b id="label_CEMPRES"><axis:alt c="CEMPRES" f="axisadm027" lit="101619" /></b>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisadm027" c="SPRODUC"> 
                                            <td class="titulocaja">
                                                <b id="label_SPRODUC"><axis:alt c="SPRODUC" f="axisadm027" lit="100829" /></b>
                                            </td>
                                        </axis:visible>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <axis:visible f="axisadm027" c="TEMPRES"> 
                                            <td class="campocaja" >    
                                                <input type="text" name="TEMPRES" id="TEMPRES" value="${requestScope.OB_IAX_GENPOLIZA.TEMPRES}" class="campodisabled campo campotexto" style="width:100%;"
                                                <axis:atr f="axisadm027" c="TEMPRES" a="modificable=false&obligatorio=false"/> alt="<axis:alt c="TEMPRES" f="axisadm027" lit="101619" />" title="<axis:alt c="TEMPRES" f="axisadm027" lit="101619" />"/>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisadm027" c="TPRODUC"> 
                                           <td class="campocaja" colspan="2">    
                                                <input type="text" name="TPRODUC" id="TPRODUC" value="${requestScope.OB_IAX_GENPOLIZA.TPRODUC}" class="campodisabled campo campotexto" style="width:100%;"
                                                <axis:atr f="axisadm027" c="TPRODUC" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    
                                    <tr>
                                        <!-- Num. Póliza -->
                                        <axis:visible f="axisadm027" c="NPOLIZA"> 
                                            <td class="titulocaja" >
                                                <b id="label_NPOLIZA"><axis:alt c="NPOLIZA1" f="axisadm027" lit="9001514" /></b>
                                            </td>
                                        </axis:visible>
                                        <!-- Certificado -->
                                        <axis:visible f="axisadm027" c="NCERTIF"> 
                                            <td class="titulocaja" >
                                                <b id="label_NCERTIF"><faxis:alt c="NCERTIF" f="axisadm027" lit="101300"/></b>
                                            </td>
                                        </axis:visible>
                                        <!-- Nombre tomador -->
                                        <axis:visible f="axisadm027" c="TNOMTOM">
                                            <td class="titulocaja" >
                                                <b id="label_TNOMTOM"><axis:alt c="TNOMTOM" f="axisadm027" lit="101027" /></b>
                                            </td>
                                        </axis:visible>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    
                                    <tr>
                                        <!-- Num. Póliza -->
                                        <axis:visible f="axisadm027" c="NPOLIZA"> 
                                           <td class="campocaja">    
                                                <input type="text" name="NPOLIZA" id="NPOLIZA" value="${requestScope.OB_IAX_GENPOLIZA.NPOLIZA}" class="campodisabled campo campotexto" style="width:100%;"
                                                <axis:atr f="axisadm027" c="NPOLIZA" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                        <!-- Certificado -->
                                        <axis:visible f="axisadm027" c="NCERTIF"> 
                                           <td class="campocaja">    
                                                <input type="text" name="NCERTIF" id="NCERTIF" value="${requestScope.OB_IAX_GENPOLIZA.NCERTIF}" class="campodisabled campo campotexto" style="width:35%"
                                                <axis:atr f="axisadm027" c="NCERTIF" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                        <!-- Tomador -->
                                        <axis:visible f="axisadm027" c="TNOMTOM"> 
                                           <td class="campocaja" colspan="2">    
                                                <input type="text" name="TNOMTOM" id="TNOMTOM" value="${requestScope.OB_IAX_GENPOLIZA.TNOMTOM}" class="campodisabled campo campotexto" style="width:100%;"
                                                <axis:atr f="axisadm027" c="TNOMTOM" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                      
                                        <td></td>
                                    </tr>
                                    
                                    <tr>
                                        <!-- Delegación - Agente -->
                                         <%-- Delegación --%>
                                        <td class="titulocaja">
                                                <b><axis:alt c="CAGENTE_TIT" f="axisadm027" lit="1000561"/></b>
                                        </td>   
                                        <axis:visible f="axisadm027" c="CAGENTE"> 
                                            <td class="titulocaja" colspan="2">
                                                <b id="label_CAGENTE"><axis:alt c="CAGENTE_CAMPO" f="axisadm027" lit="100584" /></b>
                                            </td>
                                        </axis:visible>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    
                                    <tr>
                                        <%-- Delegación --%>
                                        <td class="campocaja">
                                             <input type="text" class="campodisabled campo campotexto" id="TDELEGA" name="TDELEGA" size="15"  style="width:90%"
                                             value="${OB_IAX_RECIBOS.TDELEGA}" readonly="readonly"/>
                                        </td>
                                        <%-- Agente --%>
                                        <axis:visible f="axisadm027" c="CAGENTE"> 
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
                                    <td class="titulocaja">
                                        <b><axis:alt c="titulo_1" f="CFORPAG" lit="100712"/></b>
                                    </td> 
                                    <!-- Tipus compte -->
                                    <td class="titulocaja">
                                        <b><axis:alt c="CTIPBAN" f="axisadm027" lit="1000374" /></b>
                                    </td>     
                                    <!-- Compte bancari -->
                                        <axis:visible f="axisadm027" c="CBANCAR"> <!-- TODO C -->
                                            <td class="titulocaja" colspan="3">
                                                <b id="label_CBANCAR"><axis:alt c="CBANCAR" f="axisadm027" lit="100965" /></b>
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
                                        <axis:visible f="axisadm027" c="CBANCAR_1"> 
                                        <td class="campocaja" colspan="2">
                                            <input type="text" class="campodisabled campo campotexto" id="CBANCAR_1" name="CBANCAR_1" size="15" style="width:100%"
                                            value="<axis:masc f="axisadm027" c="CBANCAR_1" value="${OB_IAX_RECIBOS.CBANCAR}" />" readonly="readonly"/>
                                        </td>
                                        </axis:visible>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    
                                    <tr>
                                        <!-- Recibo -->
                                        <axis:visible f="axisadm027" c="NRECIBO"> 
                                            <td class="titulocaja">
                                                <b id="label_NRECIBO"><axis:alt c="NRECIBO1" f="axisadm027" lit="800636" /></b>
                                            </td>
                                        </axis:visible>
                                         <%-- Nº Recibo Compania --%>
                                        <axis:ocultar c="CRECCIA" f="axisadm027" dejarHueco="false">
                                            <td class="titulocaja" id="LIT_CRECCIA">
                                             <b><axis:alt f="axisadm027" c="CRECCIA" lit="9001763"/></b>
                                            </td>     
                                        </axis:ocultar>                                          
                                        <!-- Estado del recibo -->
                                        <td class="titulocaja">
                                            <b><axis:alt c="CESTREC" f="axisadm027" lit="1000553"/></b>
                                        </td>
                                        <!-- Importe -->
                                        <axis:visible f="axisadm027" c="IMPORTE"> 
                                            <td class="titulocaja">
                                                <b id="label_IMPORTE"><axis:alt c="IMPORTE1" f="axisadm027" lit="1000563" /></b>
                                            </td>
                                        </axis:visible>
                                       
                                    </tr>
                                    <tr>
                                        <!-- Recibo -->
                                         <axis:visible f="axisadm027" c="NRECIBO"> 
                                            <td class="campocaja">    
                                                <input type="text" name="NRECIBO" id="NRECIBO" value="${requestScope.NRECIBO}" class="campodisabled campo campotexto" style="width:75px;"
                                                <axis:atr f="axisadm027" c="NRECIBO" a="modificable=false&obligatorio=false"/> alt="<axis:alt c="NRECIBO2" f="axisadm027" lit="800636" />" title="<axis:alt c="NRECIBO3" f="axisadm027" lit="800636" />"/>
                                            </td>
                                        </axis:visible>                                        
                                        <%-- Nº Recibo Compania --%>
                                        <axis:ocultar c="CRECCIA" f="axisadm027" dejarHueco="false">
                                        <td class="campocaja">
                                            <input type="text" class="campo campotexto campodisabled" id="CRECCIA" name="CRECCIA" <axis:atr f="axisadm027" c="CRECCIA" a="modificable=false&obligatorio=false"/>  style="width:90%"
                                            value="${OB_IAX_RECIBOS.CRECCIA}" readonly="readonly"/>
                                        </td>
                                        </axis:ocultar>      
                                        <!-- Situación /Estado -->
                                         <td class="campocaja">
                                                        <input type="text" class="campodisabled campo campotexto" id="TESTREC" name="TESTREC" size="15" style="width:90%"
                                                        value="${OB_IAX_RECIBOS.TESTREC}" readonly="readonly"/>
                                         </td>
                                        <!-- Importe -->
                                        <axis:visible f="axisadm027" c="IMPORTE"> 
                                           <td class="campocaja">    
                                                <input type="text" name="IMPORTE" id="IMPORTE" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${requestScope.OB_IAX_RECIBOS.IMPORTE}'/>" class="campodisabled campo campotexto" style="width:75%;"
                                                <axis:atr f="axisadm027" c="IMPORTE" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                       
                                    </tr>
                                    
                                    <tr>
                                        <!-- Tipo recibo -->
                                        <td class="titulocaja">
                                             <b><axis:alt c="CTIPREC" f="axisadm027" lit="102302"/></b>
                                        </td> 
                                        <!-- Fecha emision -->
                                        <axis:visible f="axisadm027" c="FEMISIO"> 
                                            <td class="titulocaja">
                                                <b id="label_FEMISIO"><axis:alt c="FEMISIO" f="axisadm027" lit="1000562" /></b>
                                            </td>
                                        </axis:visible>
                                        <!-- Estado impresion -->
                                        <td class="titulocaja">
                                                <b><axis:alt c="CESTIMP" f="axisadm027" lit="1000571"/></b>
                                        </td> 
                                         <!-- Fecha efecto -->
                                        <axis:visible f="axisadm027" c="FEFECTO"> 
                                            <td class="titulocaja">
                                                <b id="label_FEFECTO"><axis:alt c="FEFECTO" f="axisadm027" lit="100883" /></b>
                                            </td>
                                        </axis:visible>
                                        <!-- Fecha vencimiento -->
                                        <axis:visible f="axisadm027" c="FVENCIM"> 
                                            <td class="titulocaja">
                                                <b id="label_FVENCIM"><axis:alt c="FVENCIM" f="axisadm027" lit="100885" /></b>
                                            </td>
                                        </axis:visible>
                                        
                                    </tr>
                                    
                                    <tr>
                                        <!-- Tipo recibo -->
                                        <axis:visible f="axisadm027" c="TTIPREC"> 
                                        <td class="campocaja">
                                            <input type="text" class="campodisabled campo campotexto" id="TTIPREC" name="TTIPREC" size="15" style="width:90%"
                                            value="${OB_IAX_RECIBOS.TTIPREC}" readonly="readonly"/>
                                        </td>
                                        </axis:visible>
                                        <!-- Fecha emision -->
                                        <axis:visible f="axisadm027" c="FEMISIO"> 
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
                                        <axis:visible f="axisadm027" c="FEFECTO">
                                           <td class="campocaja">    
                                                <input type="text" name="FEFECTO" id="FEFECTO" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${requestScope.OB_IAX_RECIBOS.FEFECTO}'/>" class="campodisabled campo campotexto" style="width:40%;"
                                                <axis:atr f="axisadm027" c="FEFECTO" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                        <!-- Fecha vencimiento -->                                      
                                        <axis:visible f="axisadm027" c="FVENCIM"> 
                                           <td class="campocaja">    
                                                <input type="text" name="FVENCIM" id="FVENCIM" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${requestScope.OB_IAX_RECIBOS.FVENCIM}'/>" class="campodisabled campo campotexto" style="width:40%;"
                                                <axis:atr f="axisadm027" c="FVENCIM" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                    </tr>
                                    
                                    <!--       ****************************************************************************    -->
                            </table>
                        </td>
                    </tr>
                    </table>
                        
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt c="FLECHA6" f="axisadm027" lit="9000990" /></div>
                    <!--campos-->
                     <table id="impago_recibo_children" class="seccion" style="display:none">
                        <tr>
                            <td align="left">
                                 <table border="0" class="area" align="center">
                                    <tr>
                                        <th style="width:10%;height:0px"></th>
                                        <th style="width:10%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:70%;height:0px"></th>
                                    </tr>
                                     <tr>
                                     <!-- etm -->
                                      <axis:ocultar f="axisadm027" c="CMOTIVO" dejarHueco="false"> <!-- TODO C -->
                                            <td class="titulocaja">
                                                <b id="label_CMOTIVO"><axis:alt c="CMOTIVO" f="axisadm027" lit="9901743" /></b>
                                            </td>
                                        </axis:ocultar>
                                     <!-- etm -->
                                        
                                        <axis:visible f="axisadm027" c="FECHA"> <!-- TODO C -->
                                            <td class="titulocaja">
                                                <b id="label_FECHA"><axis:alt c="FECHA" f="axisadm027" lit="9000843" /></b>
                                            </td>
                                        </axis:visible>
                                        <axis:ocultar f="axisadm027" c="COBBAN" dejarHueco="false"> <!-- TODO C -->
                                            <td class="titulocaja">
                                                <b id="label_COBBAN"><axis:alt c="COBBAN" f="axisadm027" lit="100879" /></b>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm027" c="PRECIMP" dejarHueco="false"> <!-- TODO C -->
                                             <td class="titulocaja" id="LIT_PRECIMP">
                                                  <b><axis:alt f="axisadm027" c="PRECIMP" lit="9901651"/></b>
                                            </td>
                                        </axis:ocultar>
                                        <c:if test="${requestScope.retVal == '2'}">
                                                         <td class="titulocaja"><b><axis:alt c="NPOLIZA" f="axisamd027" lit="100624" /></b></td>
                                         </c:if>

                                        <td>&nbsp;</td>
                                     </tr>
                                 
                                     
                                     <tr>
                                      <!-- etm INI-->
                             
                                     <axis:ocultar f="axisadm027" c="CMOTIVO" dejarHueco="false"> <!-- TODO C -->
                                            <td class="campocaja">    
                                                <select title="<axis:alt c="CMOTIVO" f="axisadm027" lit='9901743' />" alt="<axis:alt c="CMOTIVO" f="axisadm027" lit='9901743' />" name = "lst_motimpago" id="lst_motimpago" size="1" 
                                                    class="campowidthselect campo campotexto_ob" style="width:200px;"
                                                    <axis:atr f="axisadm027" c="CMOTIVO" a="modificable=true&obligatorio=true"/>>
                                                    <c:forEach var="lstmotimpago" items="${requestScope.lstmotimpago}">
                                                        <option value = "${lstmotimpago.CATRIBU}"
                                                            <c:choose>
                                                                <c:when test="${__formdata.CMOTIVO == lstmotimpago.CATRIBU}">selected</c:when>
                                                            </c:choose>>
                                                            ${lstmotimpago.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </axis:ocultar>
                                     <!-- etm FIN-->
                                        <axis:visible f="axisadm027" c="FECHA"> <!-- TODO C -->
                                            <td class="campocaja">    
                                                <input title="<axis:alt c="FECHA" f="axisadm027" lit='9000843' />" alt="<axis:alt c="FECHA" f="axisadm027" lit='9000843' />" type="text" name="FECHA" id="FECHA" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${requestScope.FECHA}'/>" class="campowidthinputsmall campo campotexto_ob" style="width:75px;"
                                                <axis:atr f="axisadm027" c="FECHA" a="formato=fecha&modificable=true&obligatorio=true"/>/><a id="icon_FECHA" style="vertical-align:middle;"><img 
                                             alt="<axis:alt c="FECHA" f="axisadm027" lit="9000843"/>" title="<axis:alt c="FECHA" f="axisadm027" lit="9000843" />" src="images/calendar.gif"/></a>
                                            </td>
                                        </axis:visible>
                                        <axis:ocultar f="axisadm027" c="COBBAN" dejarHueco="false"> <!-- TODO C -->
                                            <td class="campocaja">    
                                                <select title="<axis:alt c="COBBAN" f="axisadm027" lit='100879' />" alt="<axis:alt c="COBBAN" f="axisadm027" lit='100879' />" name = "list_COBBANCARIO" id="list_COBBANCARIO" size="1" 
                                                    class="campowidthselect campo campotexto_ob" style="width:200px;"
                                                    <axis:atr f="axisadm027" c="COBBAN" a="modificable=true&obligatorio=true"/>>
                                                    <c:forEach var="cobradores" items="${requestScope.REC_IAX_COBRADORES}">
                                                        <option value = "${cobradores.CCOBBAN}"
                                                            <c:choose>
                                                                <c:when test="${OB_IAX_RECIBOS.CCOBBAN == cobradores.CCOBBAN}">selected</c:when>
                                                            </c:choose>>
                                                            ${cobradores.CCOBBAN} - ${cobradores.NCUENTA}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </axis:ocultar>
                                        
                                        <axis:ocultar c="PRECIMP" f="axisadm027" dejarHueco="false">
                                                    <td class="campocaja"> 
                                                        <input type="checkbox" id="PRECIMP" name="PRECIMP" <c:if test="${OB_IAX_RECIBOS.PRECIMP == 1}">checked</c:if> value="${OB_IAX_RECIBOS.PRECIMP}" onclick="f_set_precimp();"
                                                        <axis:atr f="axisadm027" c="PRECIMP" a="modificable=true&obligatorio=false"/> />
                                                    </td>
                                        </axis:ocultar>
                                      <td>
                    <c:if test="${requestScope.retVal == '2'}">
                        <input type="text" class="campowidthinput campo campotexto"  name="NPOLIZA2" id="NPOLIZA2" value="${datos_poliza.NPOLIZA}" readonly="true" Style="width:75%"/>
                        <img border="0" src="images/find.gif" onclick="f_abrir_axisctr019()" style="cursor:pointer"/>
                    </c:if>
                    </td>
                                     </tr>
                                    </table>
                                </td>
                                
                            </tr>
                        </table>
                        
                        <c:if test="${!empty requestScope.T_IAX_IMPAGADO}">
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt c="FLECHA7" f="axisadm027" lit="108502" /></div>
                        <!--campos-->
                        <table id="resumen_children" class="seccion" style="display:none">
                            <tr>
                            <td align="left">
                                 <table border="0" class="area" align="left" style="width:100%;">
                                    <tr>
                                        <td>
                                            <c:set var="title0"><axis:alt c="NRECIBO4" f="axisadm027" lit="100895"/></c:set>
                                            <c:set var="title1"><axis:alt c="TPRODUC" f="axisadm027" lit="100829"/></c:set>
                                            <c:set var="title2"><axis:alt c="NPOLIZA2" f="axisadm027" lit="100836"/></c:set>
                                            <c:set var="title3"><axis:alt c="TAGENTE" f="axisadm027" lit="100584"/></c:set>
                                            <c:set var="title4"><axis:alt c="ICOMBRU" f="axisadm027" lit="108482"/></c:set>
                                            <c:set var="title5"><axis:alt c="IMPORTE2" f="axisadm027" lit="1000529"/></c:set>
                                            <c:set var="title6"><axis:alt f="axisadm027" c="IMPUESTO" lit="101278"/></c:set>
                                            <c:set var="title7"><axis:alt f="axisadm027" c="ICA" lit="9903550"/></c:set>
                                            <c:set var="title8"><axis:alt f="axisadm027" c="RETEICA" lit="9903552"/></c:set>
                                            <c:set var="title9"><axis:alt f="axisadm027" c="AVITASA" lit="9903546"/></c:set>
                                            <c:set var="title10"><axis:alt f="axisadm027" c="IVACOM" lit="9903582"/></c:set>
                                            <div class="displayspace">
                                                <display:table name="${requestScope.T_IAX_IMPAGADO}" id="miListaId" export="false" class="dsptgtable" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
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
                                                    <axis:visible f="axisadm027" c="AGENTE"> 
                                                    <display:column title="${title3}" sortable="false" sortProperty="TAGENTE" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                        <div class="dspText">${OB_IAX_RECIBOS.TAGENTE}</div>
                                                    </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisadm027" c="ICOMISI"> 
                                                    <display:column title="${title4}" sortable="false" sortProperty="ICOMBRU" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${miListaId.ICOMBRU}'/></div>
                                                    </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisadm027" c="IMP_IVA"> 
                                                    <display:column title="${title10}" sortable="false" sortProperty="IIMP_1" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${miListaId.IIMP_1}'/></div>
                                                    </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisadm027" c="IMP_ICA"> 
                                                    <display:column title="${title7}" sortable="false" sortProperty="IIMP_2" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${miListaId.IIMP_2}'/></div>
                                                    </display:column>
                                                    </axis:visible>
                                                     <axis:visible f="axisadm027" c="IMP_RETEICA"> 
                                                     <display:column title="${title8}" sortable="false" sortProperty="IIMP_3" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${miListaId.IIMP_3}'/></div>
                                                    </display:column>
                                                    </axis:visible>
                                                     <axis:visible f="axisadm027" c="IMP_AVISOS"> 
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
                            </tr>
                    </table>
                    </c:if>
                </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axisadm027</c:param>        
            <c:param name="__botones">salir,100009</c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
    <script type="text/javascript">
    <axis:visible f="axisadm027" c="FECHA">
        Calendar.setup({
            inputField     :    "FECHA",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FECHA",  
            singleClick    :    true,
            firstDay       :    1
        });
    </axis:visible>
    </script>
</body>
</html>
