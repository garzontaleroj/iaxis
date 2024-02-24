<%/*
*  Fichero: axisadm064.jsp 
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
    <title><axis:alt c="titulo1" f="axisadm064" lit="9902139"/></title> <%-- CONSULTA DE RECIBOS --%>
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
                f_abrir_modal("axisadm001");
                displaySeccion("datos_recibo_children", "", "none");
                displaySeccion("estado_recibo_children", "", "none");
               
            }else{
                if(objUtiles.estaVacio(objDom.getValorPorId("IMPAGADO"))){
                    displaySeccion("datos_recibo_children", "none", "");
                    displaySeccion("estado_recibo_children", "none", "");
                 
                }else{                  
                    displaySeccion("datos_recibo_children", "none", "");
                    displaySeccion("estado_recibo_children", "", "none");                 
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
            objAjax.invokeAsyncCGI("axis_axisadm064.do", callbackCancelar, "operation=salir", this);
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
            objUtiles.ejecutarFormulario ("axis_axisadm064.do?CCOBBANCARIOselected="+CCOBBAN, "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        
        function f_set_precimp()
        {
              document.miForm.PRECIMP.value = document.getElementById("PRECIMP").checked ? "1" : "0";            
        }
        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
       function f_cerrar_modal(cual) {
        objUtiles.cerrarModal(cual);
         }
         
         
        function f_aceptar_modal_recerca_rebut(NRECIBO) {            
            objDom.setValorPorId("NRECIBO", NRECIBO);
            f_cerrar_modal('axisadm001');        
            objUtiles.ejecutarFormulario ("axis_axisadm064.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);              
        }
             
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
            objDom.setVisibilidadPorId("but_cerrar_modal_"+cual, "hidden");  
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
      
        
    </script>    
</head>

<body onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
      
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisadm001|<axis:alt f="axisadm064" c="MODAL_AXIADM001" lit="1000552"/>|XoN</c:param>
        </c:import>
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt c="titulo64" f="axisadm064" lit="9902139"/></c:param>     <%-- IMPAGO DE RECIBOS --%>
                <c:param name="formulario"><axis:alt c="form64" f="axisadm064" lit="9902139"/></c:param> <%-- IMPAGO DE RECIBOS --%>
                <c:param name="form">axisadm064</c:param>
        </c:import>
    
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="IMPAGADO" id="IMPAGADO" value="${requestScope.IMPAGADO}"/>
        <input type="hidden" name="MSG_EXIT" id="MSG_EXIT" value=""/>
        
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt c="flecha1" f="axisadm064" lit="1000565" />&nbsp;<c:if test="${empty requestScope.acceso_externo || requestScope.acceso_externo== 'false'}"><img border="0" src="images/find.gif" onclick="f_abrir_modal('axisadm001')" style="cursor:pointer" alt="<axis:alt c="flecha2" f="axisadm064" lit='100797' /> <axis:alt c="flecha3" f="axisadm064" lit='9000410' />" title="<axis:alt c="flecha4" f="axisadm064" lit='100797' /> <axis:alt c="flecha5" f="axisadm064" lit='9000410' />"/></c:if></div>
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
                                        <axis:visible f="axisadm064" c="CEMPRES"> 
                                            <td class="titulocaja">
                                                <b id="label_CEMPRES"><axis:alt c="CEMPRES" f="axisadm064" lit="101619" /></b>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisadm064" c="SPRODUC"> 
                                            <td class="titulocaja">
                                                <b id="label_SPRODUC"><axis:alt c="SPRODUC" f="axisadm064" lit="100829" /></b>
                                            </td>
                                        </axis:visible>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <axis:visible f="axisadm064" c="TEMPRES"> 
                                            <td class="campocaja" >    
                                                <input type="text" name="TEMPRES" id="TEMPRES" value="${requestScope.OB_IAX_GENPOLIZA.TEMPRES}" class="campodisabled campo campotexto" style="width:100%;"
                                                <axis:atr f="axisadm064" c="TEMPRES" a="modificable=false&obligatorio=false"/> alt="<axis:alt c="TEMPRES" f="axisadm064" lit="101619" />" title="<axis:alt c="TEMPRES" f="axisadm064" lit="101619" />"/>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisadm064" c="TPRODUC"> 
                                           <td class="campocaja" colspan="2">    
                                                <input type="text" name="TPRODUC" id="TPRODUC" value="${requestScope.OB_IAX_GENPOLIZA.TPRODUC}" class="campodisabled campo campotexto" style="width:100%;"
                                                <axis:atr f="axisadm064" c="TPRODUC" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    
                                    <tr>
                                        <!-- Num. Póliza -->
                                        <axis:visible f="axisadm064" c="NPOLIZA"> 
                                            <td class="titulocaja" >
                                                <b id="label_NPOLIZA"><axis:alt c="NPOLIZA1" f="axisadm064" lit="9001514" /></b>
                                            </td>
                                        </axis:visible>
                                        <!-- Certificado -->
                                        <axis:visible f="axisadm064" c="NCERTIF"> 
                                            <td class="titulocaja" >
                                                <b id="label_NCERTIF"><faxis:alt c="NCERTIF" f="axisadm064" lit="101300"/></b>
                                            </td>
                                        </axis:visible>
                                        <!-- Nombre tomador -->
                                        <axis:visible f="axisadm064" c="TNOMTOM">
                                            <td class="titulocaja" >
                                                <b id="label_TNOMTOM"><axis:alt c="TNOMTOM" f="axisadm064" lit="101027" /></b>
                                            </td>
                                        </axis:visible>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    
                                    <tr>
                                        <!-- Num. Póliza -->
                                        <axis:visible f="axisadm064" c="NPOLIZA"> 
                                           <td class="campocaja">    
                                                <input type="text" name="NPOLIZA" id="NPOLIZA" value="${requestScope.OB_IAX_GENPOLIZA.NPOLIZA}" class="campodisabled campo campotexto" style="width:100%;"
                                                <axis:atr f="axisadm064" c="NPOLIZA" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                        <!-- Certificado -->
                                        <axis:visible f="axisadm064" c="NCERTIF"> 
                                           <td class="campocaja">    
                                                <input type="text" name="NCERTIF" id="NCERTIF" value="${requestScope.OB_IAX_GENPOLIZA.NCERTIF}" class="campodisabled campo campotexto" style="width:35%"
                                                <axis:atr f="axisadm064" c="NCERTIF" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                        <!-- Tomador -->
                                        <axis:visible f="axisadm064" c="TNOMTOM"> 
                                           <td class="campocaja" colspan="2">    
                                                <input type="text" name="TNOMTOM" id="TNOMTOM" value="${requestScope.OB_IAX_GENPOLIZA.TNOMTOM}" class="campodisabled campo campotexto" style="width:100%;"
                                                <axis:atr f="axisadm064" c="TNOMTOM" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                      
                                        <td></td>
                                    </tr>
                                    
                                    <tr>
                                        <!-- Delegación - Agente -->
                                         <%-- Delegación --%>
                                        <td class="titulocaja">
                                                <b><axis:alt c="CAGENTE_TIT" f="axisadm064" lit="1000561"/></b>
                                        </td>   
                                        <axis:visible f="axisadm064" c="CAGENTE"> 
                                            <td class="titulocaja" colspan="2">
                                                <b id="label_CAGENTE"><axis:alt c="CAGENTE_CAMPO" f="axisadm064" lit="100584" /></b>
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
                                        <axis:visible f="axisadm064" c="CAGENTE"> 
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
                                        <b><axis:alt c="CTIPBAN" f="axisadm064" lit="1000374" /></b>
                                    </td>     
                                    <!-- Compte bancari -->
                                        <axis:visible f="axisadm064" c="CBANCAR"> <!-- TODO C -->
                                            <td class="titulocaja" colspan="3">
                                                <b id="label_CBANCAR"><axis:alt c="CBANCAR" f="axisadm064" lit="100965" /></b>
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
                                        <axis:visible f="axisadm064" c="CBANCAR_1"> 
                                        <td class="campocaja" colspan="2">
                                            <input type="text" class="campodisabled campo campotexto" id="CBANCAR_1" name="CBANCAR_1" size="15" style="width:100%"
                                            value="${OB_IAX_RECIBOS.CBANCAR}" readonly="readonly"/>
                                        </td>
                                        </axis:visible>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    
                                    <tr>
                                        <!-- Recibo -->
                                        <axis:visible f="axisadm064" c="NRECIBO"> 
                                            <td class="titulocaja">
                                                <b id="label_NRECIBO"><axis:alt c="NRECIBO1" f="axisadm064" lit="800636" /></b>
                                            </td>
                                        </axis:visible>
                                         <%-- Nº Recibo Compania --%>
                                        <axis:ocultar c="CRECCIA" f="axisadm064" dejarHueco="false">
                                            <td class="titulocaja" id="LIT_CRECCIA">
                                             <b><axis:alt f="axisadm064" c="CRECCIA" lit="9001763"/></b>
                                            </td>     
                                        </axis:ocultar>                                          
                                        <!-- Estado del recibo -->
                                        <td class="titulocaja">
                                            <b><axis:alt c="CESTREC" f="axisadm064" lit="1000553"/></b>
                                        </td>
                                        <!-- Importe -->
                                        <axis:visible f="axisadm064" c="IMPORTE"> 
                                            <td class="titulocaja">
                                                <b id="label_IMPORTE"><axis:alt c="IMPORTE1" f="axisadm064" lit="1000563" /></b>
                                            </td>
                                        </axis:visible>
                                       
                                    </tr>
                                    <tr>
                                        <!-- Recibo -->
                                         <axis:visible f="axisadm064" c="NRECIBO"> 
                                            <td class="campocaja">    
                                                <input type="text" name="NRECIBO" id="NRECIBO" value="${requestScope.NRECIBO}" class="campodisabled campo campotexto" style="width:75px;"
                                                <axis:atr f="axisadm064" c="NRECIBO" a="modificable=false&obligatorio=false"/> alt="<axis:alt c="NRECIBO2" f="axisadm064" lit="800636" />" title="<axis:alt c="NRECIBO3" f="axisadm064" lit="800636" />"/>
                                            </td>
                                        </axis:visible>                                        
                                        <%-- Nº Recibo Compania --%>
                                        <axis:ocultar c="CRECCIA" f="axisadm064" dejarHueco="false">
                                        <td class="campocaja">
                                            <input type="text" class="campo campotexto campodisabled" id="CRECCIA" name="CRECCIA" <axis:atr f="axisadm064" c="CRECCIA" a="modificable=false&obligatorio=false"/>  style="width:90%"
                                            value="${OB_IAX_RECIBOS.CRECCIA}" readonly="readonly"/>
                                        </td>
                                        </axis:ocultar>      
                                        <!-- Situación /Estado -->
                                         <td class="campocaja">
                                                        <input type="text" class="campodisabled campo campotexto" id="TESTREC" name="TESTREC" size="15" style="width:90%"
                                                        value="${OB_IAX_RECIBOS.TESTREC}" readonly="readonly"/>
                                         </td>
                                        <!-- Importe -->
                                        <axis:visible f="axisadm064" c="IMPORTE"> 
                                           <td class="campocaja">    
                                                <input type="text" name="IMPORTE" id="IMPORTE" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${requestScope.OB_IAX_RECIBOS.IMPORTE}'/>" class="campodisabled campo campotexto" style="width:75%;"
                                                <axis:atr f="axisadm064" c="IMPORTE" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                       
                                    </tr>
                                    
                                    <tr>
                                        <!-- Tipo recibo -->
                                        <td class="titulocaja">
                                             <b><axis:alt c="CTIPREC" f="axisadm064" lit="102302"/></b>
                                        </td> 
                                        <!-- Fecha emision -->
                                        <axis:visible f="axisadm064" c="FEMISIO"> 
                                            <td class="titulocaja">
                                                <b id="label_FEMISIO"><axis:alt c="FEMISIO" f="axisadm064" lit="1000562" /></b>
                                            </td>
                                        </axis:visible>
                                        <!-- Estado impresion -->
                                        <td class="titulocaja">
                                                <b><axis:alt c="CESTIMP" f="axisadm064" lit="1000571"/></b>
                                        </td> 
                                         <!-- Fecha efecto -->
                                        <axis:visible f="axisadm064" c="FEFECTO"> 
                                            <td class="titulocaja">
                                                <b id="label_FEFECTO"><axis:alt c="FEFECTO" f="axisadm064" lit="100883" /></b>
                                            </td>
                                        </axis:visible>
                                        <!-- Fecha vencimiento -->
                                        <axis:visible f="axisadm064" c="FVENCIM"> 
                                            <td class="titulocaja">
                                                <b id="label_FVENCIM"><axis:alt c="FVENCIM" f="axisadm064" lit="100885" /></b>
                                            </td>
                                        </axis:visible>
                                        
                                    </tr>
                                    
                                    <tr>
                                        <!-- Tipo recibo -->
                                        <axis:visible f="axisadm064" c="TTIPREC"> 
                                        <td class="campocaja">
                                            <input type="text" class="campodisabled campo campotexto" id="TTIPREC" name="TTIPREC" size="15" style="width:90%"
                                            value="${OB_IAX_RECIBOS.TTIPREC}" readonly="readonly"/>
                                        </td>
                                        </axis:visible>
                                        <!-- Fecha emision -->
                                        <axis:visible f="axisadm064" c="FEMISIO"> 
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
                                        <axis:visible f="axisadm064" c="FEFECTO">
                                           <td class="campocaja">    
                                                <input type="text" name="FEFECTO" id="FEFECTO" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${requestScope.OB_IAX_RECIBOS.FEFECTO}'/>" class="campodisabled campo campotexto" style="width:40%;"
                                                <axis:atr f="axisadm064" c="FEFECTO" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                        <!-- Fecha vencimiento -->                                      
                                        <axis:visible f="axisadm064" c="FVENCIM"> 
                                           <td class="campocaja">    
                                                <input type="text" name="FVENCIM" id="FVENCIM" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${requestScope.OB_IAX_RECIBOS.FVENCIM}'/>" class="campodisabled campo campotexto" style="width:40%;"
                                                <axis:atr f="axisadm064" c="FVENCIM" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                        </axis:visible>
                                    </tr>
                                    
                                    <!--       ****************************************************************************    -->
                            </table>
                        </td>
                    </tr>
                    </table>
                        
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt c="FLECHA6" f="axisadm064" lit="9902139" /></div>
                    <!--campos-->
                     <table id="estado_recibo_children" class="seccion" style="display:none">
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
                                     
                                        <axis:ocultar f="axisadm001" c="CESTREC" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisadm064" c="CESTREC" lit="1000553"/></b> <%-- Estat rebut --%>
                                        </td>
                                        </axis:ocultar>                                    
                                   
                                        <td>&nbsp;</td>
                                     </tr>
                                 
                                     
                                     <tr>                                     
                                      <axis:ocultar f="axisadm064" c="CESTREC" dejarHueco="false">
                                       <td class="campocaja">                                
                                            <select name="CESTREC" id="CESTREC" size="1" class="campowidthselect campo campotexto" <axis:atr f="axisadm064" c="CESTREC" a="isInputText=false"/> style="width:94%;">&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm064" c="BLANCO" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.lstestadorecibo}">
                                                    <option value = "${element.CATRIBU}"
                                                    <c:if test="${__formdata.CESTREC == element.CATRIBU}"> selected = "selected"</c:if> />
                                                        ${element.TATRIBU} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>     
                                        </axis:ocultar>  
                                        <td class="titulocaja">                                            
                                        </td>
                                     </tr>
                                    </table>
                                </td>
                                
                            </tr>
                        </table>
                        
                        
                </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axisadm064</c:param>        
            <c:param name="__botones">salir,100009</c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
    <script type="text/javascript">
    <axis:visible f="axisadm064" c="FECHA">
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