<%/**
*  Fichero: axiscalculafecha.jsp
*  @author <a href="mailto:jaesteban@csi-ti.com">Johan Esteban</a>
*   
*  Modal - Calcula fecha
*
*  Fecha: 18/03/2016
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
<% String codPantalla = "axiscalculafecha"; %>
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
      <script type="text/javascript" src="scripts/jsFecha.js"></script>
      <c:import url="../include/carga_framework_js.jsp" />
    <!--*********************************** -->

<script language="Javascript" type="text/javascript">

    function f_onload() {
        f_cargar_propiedades_pantalla();
        var value = document.getElementById("FECHAINICIO").value;
        var myDate = value.replace("_", "");
        objDom.setValorPorId("FEFEPLAZO", myDate);
    }
    
    function f_but_cancelar() {
        parent.f_cerrar_calculadora();
    }
    
    function f_but_aceptar() {
        if (!objUtiles.estaVacio(document.getElementById("FECHAFIN").value)){
            parent.f_actualiza_vencimiento(document.getElementById("FECHAFIN").value, document.getElementById("CAMPO").value);
        }
    }    
    
    function isNumberKey(evt)
    {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false; 
         return true;
    }
    
    function isNumberKey(evt)
    {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false; 
         return true;
    }
    
    function sumarFecha()
    {  
        var objFecha = new JsFecha();
        var myDate = new Date(objFecha.stringToDate(document.getElementById("FEFEPLAZO").value));
        
        myDate.setDate(myDate.getDate() + Number(document.getElementById("NDIAS").value));
        myDate.setMonth(myDate.getMonth() + (Number(document.getElementById("NMESES").value)));
        myDate.setFullYear(myDate.getFullYear() + Number(document.getElementById("NAÑOS").value));
        
        objDom.setValorPorId("FECHAFIN", objFecha.formateaFecha(myDate.getDate() + "/" + (myDate.getMonth() + 1) + "/" + myDate.getFullYear()));
    }    

</script>
</head>
<body class=" " onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
  
    
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" id="CAMPO" name="CAMPO" value="${__formdata.CAMPO}"/>
        <input type="hidden" id="FECHAINICIO" name="FECHAINICIO" value="${__formdata.FECHAINICIO}"/>

        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisctr010" c="TITULOPANTA" lit="9908904"/></c:param>
            <c:param name="producto"><axis:alt f="axisctr010" c="TITULOPANTA" lit="9908904"/></c:param>
            <c:param name="form">axiscalculafecha</c:param>
        </c:import>
        
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>                    
                    <table class="seccion">
                        <tr><div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axiscalculafecha" c="LIT_1000096" lit="1000096" /></div></tr>
                        
                        <td align="left">
                            <table class="area" align="center">
                                <tr>
                                    <th style="width:15%;height:0px"></th>
                                    <th style="width:5%;height:0px"></th>
                                    <th style="width:5%;height:0px"></th>
                                    <th style="width:5%;height:0px"></th>
                                    <th style="width:70%;height:0px"></th>
                                </tr>
                                
                                <tr>                                    
                                    <axis:ocultar f="axiscalculafecha" c="FEFEPLAZO" >
                                        <td class="titulocaja" style="white-space:nowrap">
                                            <b id="label_FEFEPLAZO" align="right"><axis:alt f="axiscalculafecha" c="LIT_9908885" lit="9908885" /></b>
                                        </td>                                          
                                    </axis:ocultar>
                                        
                                    <axis:ocultar f="axiscalculafecha" c="NDIAS"  >
                                        <td class="titulocaja" style="white-space:nowrap">
                                            <b id="label_PEJECUCION"><axis:alt f="axiscalculafecha" c="LIT_9906429" lit="9906429" /></b>
                                        </td>
                                    </axis:ocultar>

                                    <axis:ocultar f="axiscalculafecha" c="NMESES"  >
                                        <td class="titulocaja" style="white-space:nowrap">
                                            <b id="label_PEJECUCION"><axis:alt f="axiscalculafecha" c="LIT_9000496" lit="9000496" /></b>
                                        </td>
                                    </axis:ocultar>

                                    <axis:ocultar f="axiscalculafecha" c="NAÑOS"  >
                                        <td class="titulocaja" style="white-space:nowrap">
                                            <b id="label_PEJECUCION"><axis:alt f="axiscalculafecha" c="LIT_9901109" lit="9901109" /></b>
                                        </td>
                                    </axis:ocultar>
                                </tr>
                                
                                <tr>
                                    <axis:ocultar f="axiscalculafecha" c="FEFEPLAZO" >
                                        <td class="campocaja"  style="white-space:nowrap">
                                            <input style="width:80px" maxlength="10" onchange="f_actualitza_fvencim(this);" type="text" class="campowidthinput campo campotexto" id="FEFEPLAZO" name="FEFEPLAZO" size="15"
                                            <axis:atr f="axiscalculafecha" c="FEFEPLAZO" a="modificable=false&obligatorio=true"/>
                                            value="${__formdata.FEFEPLAZO}"
                                            title="<axis:alt f="axiscalculafecha" c="LIT_9908885" lit="9908885"/>"/>
                                        </td>
                                    </axis:ocultar>
                                    
                                   <axis:ocultar f="axiscalculafecha" c="NDIAS" >
                                        <td class="campocaja">
                                            <input type="text" style="width:80%" class="campowidthinput campo campotexto" id="NDIAS" name="NDIAS" onchange="sumarFecha()" onkeypress="return isNumberKey(event)" title="<axis:alt f="axiscalculafecha" c="LIT_9906429" lit="9906429"/>"
                                            size="15"  value ="" <axis:atr f="axiscalculafecha" c="NDIAS" a="modificable=true&obligatorio=false&formato=entero"/>/>&nbsp;
                                        </td>
                                    </axis:ocultar>
									
                                   <axis:ocultar f="axiscalculafecha" c="NMESES" >
                                        <td class="campocaja">
                                            <input type="text" style="width:80%" class="campowidthinput campo campotexto" id="NMESES" name="NMESES" onchange="sumarFecha()" onkeypress="return isNumberKey(event)" title="<axis:alt f="axiscalculafecha" c="LIT_9000496" lit="9000496"/>"
                                            size="15"  value ="" <axis:atr f="axiscalculafecha" c="NMESES" a="modificable=true&obligatorio=false&formato=entero"/>/>&nbsp;
                                        </td>
                                    </axis:ocultar>
									
                                   <axis:ocultar f="axiscalculafecha" c="NAÑOS" >
                                        <td class="campocaja">
                                            <input type="text" style="width:80%" class="campowidthinput campo campotexto" id="NAÑOS" name="NAÑOS" onchange="sumarFecha()" onkeypress="return isNumberKey(event)" title="<axis:alt f="axiscalculafecha" c="LIT_9901109" lit="9901109"/>"
                                            size="15"  value ="" <axis:atr f="axiscalculafecha" c="NAÑOS" a="modificable=true&obligatorio=false&formato=entero"/>/>&nbsp;
                                        </td>
                                    </axis:ocultar>                                    
                                </tr>
                                
                                <tr>
                                    <td class="titulocaja" style="white-space:nowrap">
                                        <axis:ocultar f="axiscalculafecha" c="FECHAFIN" >
                                            <b id="label_FECHAFIN"><axis:alt f="axiscalculafecha" c="LIT_9908886" lit="9908886" /></b>
                                        </axis:ocultar>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <axis:ocultar f="axiscalculafecha" c="FECHAFIN" >
                                        <td class="campocaja"  style="white-space:nowrap"> 
                                            <c:set var="FECHAFIN"><fmt:formatDate pattern="dd/MM/yyyy" value="${sessionScope.axisctr_datosGestion.FECHAFIN}"/></c:set>
                                            <input style="width:80px" maxlength="10" type="text" class="campowidthinput campo campotexto" id="FECHAFIN" name="FECHAFIN" size="15"
                                            <axis:atr f="axiscalculafecha" c="FECHAFIN" a="modificable=false&obligatorio=true&formato=fecha"/>
                                            value=""
                                            title="<axis:alt f="axiscalculafecha" c="LIT_9908885" lit="9908885"/>"/><a id="icon_FECHAFIN" style="vertical-align:middle;"><img 
                                            alt="<axis:alt f="axiscalculafecha" c="LIT_108341" lit="108341"/>" title="<axis:alt f="axiscalculafecha" c="LIT_9908885" lit="9908885" />" src="images/calendar.gif"/></a>
                                        </td>
                                    </axis:ocultar>
                                </tr>
                            </table>
                        </td>
                    </table>
                </td>
            </tr>
        </table>
        
        <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axiscalculafecha</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>           
    </form>
    
    <c:import url="../include/mensajes.jsp" />   

</body>
</html>