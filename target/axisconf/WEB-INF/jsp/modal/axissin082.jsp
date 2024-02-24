<%--
/**
*  Fichero: axissin082.jsp
*  
*  Titulo: Modal mantetenimniento audiencias relacionadas proceso judicial
*
*  Fecha: 19/12/2016
*/
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt c="titulo" f="axissin082" lit="9910189"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    
    <script type="text/javascript">
    
            
        function f_onload() { 
            if (${requestScope.grabarOK == true}) {
                parent.f_aceptar_axissin082();
            }
            
            f_cargar_propiedades_pantalla(); 
        
    
            f_campos_adicionales();

        }
        
        function f_but_aceptar(){
            if (objValidador.validaEntrada()) {
            
                var generoAlarma = 0;
                var pasoValidacion = 1;
                
                if(!objUtiles.estaVacio(objDom.getValorPorId("CAUDIEN")) ||  !objUtiles.estaVacio(objDom.getValorPorId("TLAUDIE"))  && !objUtiles.estaVacio(objDom.getValorPorId("CDESPA"))){
                    if(!objUtiles.estaVacio(objDom.getValorPorId("CAUDIEN")) &&  !objUtiles.estaVacio(objDom.getValorPorId("TLAUDIE"))  && !objUtiles.estaVacio(objDom.getValorPorId("CDESPA"))){
                        pasoValidacion = 0;
                    }else{
                        alert("Indicar datos de lugar Audiencia completos");
                        generoAlarma = 1;
                    }
                }
                
                pasoValidacion = 1;
                
                if(!objUtiles.estaVacio(objDom.getValorPorId("CAUDIENO")) ||  !objUtiles.estaVacio(objDom.getValorPorId("TLAUDIEO"))  && !objUtiles.estaVacio(objDom.getValorPorId("CDESPAO"))){
                    if(!objUtiles.estaVacio(objDom.getValorPorId("CAUDIENO")) &&  !objUtiles.estaVacio(objDom.getValorPorId("TLAUDIEO"))  && !objUtiles.estaVacio(objDom.getValorPorId("CDESPAO"))){
                        pasoValidacion = 0;
                    }else{
                        alert("Indicar datos de lugar Audiencia Origen completos");
                        generoAlarma = 1;
                    }
                }  
                if (generoAlarma==0){
                      objUtiles.ejecutarFormulario ("modal_axissin082.do", "guardar_audiencia", document.Axissin0082Form, "_self", objJsMessages.jslit_cargando);
                }

            }
        }
        
        function f_actualizar_persona (){
            objAjax.invokeAsyncCGI("modal_axissin082.do", callbackAjaxActualizarPersona, "operation=actualizar_persona&NNUMIDE=" + document.getElementById("NNUMIDEAUDEN").value, this, objJsMessages.jslit_actualizando_registro);
        }        
                
        function callbackAjaxActualizarPersona(ajaxResponseText) {
         
            var doc = objAjax.domParse(ajaxResponseText);
            try {            
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {

                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NNUMIDE")[0])) {
                        objDom.setValorPorId("NNUMIDEAUDEN", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0)));
                    } else {
                        objDom.setValorPorId("NNUMIDEAUDEN", "");
                    }
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NOMBRE")[0])) {
                        objDom.setValorPorId("NOMBREAUDEN", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0)));
                        objDom.setValorPorId("SABOGAU",objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0));
                        
                    } else {
                        objDom.setValorPorId("NOMBREAUDEN", "");
                    }
                
                } else {                       
                    objDom.setValorPorId("NOMBREAUDEN", "");
                }
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }
        
        function f_abrir_axisper008() {
            objUtiles.abrirModal("axisper008", "src", "modal_axisper008.do?operation=form&faceptar=f_aceptar_axisper008&ORIGEN=AXISSIN082" );
        }
        
        function f_aceptar_axisper008(selectedPerson,selectedAgent){            
            f_cerrar_axisper008();
            f_aceptar_persona(selectedPerson);            
        }
                
        function f_aceptar_persona(SPERSON){                 
            if (!objUtiles.estaVacio(SPERSON)){
                objAjax.invokeAsyncCGI("modal_axissin082.do?SPERSON_R="+SPERSON, callbackAjaxVerPersona, "operation=ver_persona", this, objJsMessages.jslit_cargando);
            }
        }
          
        function f_cerrar_axisper008(){
            objUtiles.cerrarModal("axisper008");
        }
                
        
        function callbackAjaxVerPersona(ajaxResponseText) {
          
            var doc = objAjax.domParse(ajaxResponseText);
             
            try {            
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {

                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NNUMIDE")[0])) {
                        objDom.setValorPorId("NNUMIDEAUDEN", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0)));
                    } else {
                        objDom.setValorPorId("NNUMIDEAUDEN", "");
                    }
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE")[0])) {
                        var APELLIDO1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0) : "");
                        var APELLIDO2 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI2")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0) : "");
                        var NOMBRE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0) : "");
                        objDom.setValorPorId("NOMBREAUDEN",  NOMBRE + ' ' + APELLIDO1 + ' ' + APELLIDO2);
                        objDom.setValorPorId("SABOGAU",objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0));
     
                    } else if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0])) {   
                        var APELLIDO1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0) : "");
                        objDom.setValorPorId("NOMBREAUDEN", APELLIDO1); 
                        objDom.setValorPorId("SABOGAU",objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0));
     
                    }else{
                        objDom.setValorPorId("NOMBREAUDEN", "");
                    }
                
                } else {                       
                    objDom.setValorPorId("NOMBREAUDEN", "");
                }
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }
        
        function f_campos_adicionales(){
            var CESTADO =objDom.getValorPorId("CESTADO");
            var CORAL =objDom.getValorPorId("CORAL");
            if(CORAL == 2 || objUtiles.estaVacio(objDom.getValorPorId("CORAL")) || objUtiles.estaVacio(objDom.getValorPorId("CESTADO"))){
                ocultar_campos();
            }else 
                if(CESTADO == 1){
                    ocultar_campos();
                    objDom.setVisibilidadPorId("CRESOLU_td", "visible");
                    objDom.setVisibilidadPorId("FNUEVA_td", "visible");
                    objDom.setVisibilidadPorId("CRESOLU_tit", "visible");
                    objDom.setVisibilidadPorId("FNUEVA_tit", "visible");
                }else if(CESTADO == 2){
                    ocultar_campos();
                }else if(CESTADO == 3){
                    ocultar_campos();
                    objDom.setVisibilidadPorId("FNUEVA_td", "visible");
                    objDom.setVisibilidadPorId("FNUEVA_tit", "visible");
                }
        }
        
        function ocultar_campos(){
           objDom.setVisibilidadPorId("CRESOLU_td", "hidden");
           objDom.setVisibilidadPorId("FINSTA1_td", "hidden");
           objDom.setVisibilidadPorId("FINSTA2_td", "hidden");
           objDom.setVisibilidadPorId("FNUEVA_td", "hidden");
           objDom.setVisibilidadPorId("CRESOLU_tit", "hidden");
           objDom.setVisibilidadPorId("FINSTA1_tit", "hidden");
           objDom.setVisibilidadPorId("FINSTA2_tit", "hidden");
           objDom.setVisibilidadPorId("FNUEVA_tit", "hidden");            
        }
        
        function f_but_cancelar(){
            parent.f_aceptar_axissin082();
        }

	
    </script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisper008|<axis:alt c="axisper008_TITULO" f="axisprf000" lit="1000235"/></c:param>
    </c:import>
	
    
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
    
    
    <form name="Axissin0082Form" action="" method="POST">
    <input type="hidden" name="operation" value="guardar" />
    <input type="hidden" name="SABOGAU" id="SABOGAU" value="${__formdata.SABOGAU}"/>
    <input type="hidden" name="CTRAMITAD" id="CTRAMITAD" value="${__formdata.CTRAMITAD}"/>
    <c:import url="../include/titulo_nt.jsp">
        
        <c:param name="titulo"><axis:alt c="titulo" f="axissin082" lit="9910189"/></c:param>
        <c:param name="formulario"><axis:alt c="form" f="axissin082" lit="9910189"/></c:param>
        <c:param name="form">axissin082</c:param>
        
    </c:import>

  

    <div class="separador">&nbsp;</div>
    <table  class="mainModalDimensions base"  align="center" cellpadding="0" cellspacing="0"><!--id="tabla1" -->
        <tr>
            <td>
                <!-- Seccion -->
                <div class="titulo"> 
                    <img  src="images/flecha.gif"/>
                    <axis:alt c="flecha" f="axissin082" lit="9909218" /> 
                </div>  
                <div class="separador">&nbsp;</div>

                <table class="seccion" style="padding: 20px;">
                    <tr>
                        <td class="titulocaja" >
                            <b><axis:alt f="axissin082" c="NSINIES" lit="9909219"></axis:alt></b>
                        </td>
                        <td class="titulocaja" >
                            <b><axis:alt f="axissin082" c="NTRAMIT" lit="9910211"></axis:alt></b>
                        </td>
                        <td class="titulocaja">
                            <b><axis:alt c="NORDEN" f="axissin082" lit="9905245" /></b>
                        </td>
                        <td class="titulocaja">
                            <b><axis:alt c="NAUDIEN" f="axissin082" lit="9910195" /></b>
                        </td>    
                    </tr>
                    <tr>               
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo campotexto" style="width:65%"   id="NSINIES" name="NSINIES" size="15"   
                             <axis:atr f="axissin082" c="NSINIES" a="modificable=false"/>  value="${__formdata.NSINIES}" title="<axis:alt c="NSINIES" f="axissin082" lit="9909219" />" alt="<axis:alt c="NSINIES" f="axissin082" lit="9909219" />" /> 
                        </td>
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo campotexto" style="width:65%"   id="NTRAMIT" name="NTRAMIT" size="15"   
                             <axis:atr f="axissin082" c="NTRAMIT" a="modificable=false"/>  value="${__formdata.NTRAMIT}" title="<axis:alt c="NTRAMIT" f="axissin082" lit="9910211" />" alt="<axis:alt c="NTRAMIT" f="axissin082" lit="9910211" />" /> 
                        </td>
                        <td class="campocaja"  >
                            <input   type="text" class="campowidthinput campo campotexto" alt="<axis:alt c="NORDEN" f="axissin082" lit="9905245" />" title="<axis:alt c="NORDEN" f="axissin082" lit="9905245" />"
                                <axis:atr f="axissin082" c="NORDEN" a="modificable=false"/>
                                id="NORDEN" style="width:20%" name="NORDEN" size="15" value="${__formdata.NORDEN}"/>
                        </td>
                        <td class="campocaja"  >
                            <input   type="text" class="campowidthinput campo campotexto" alt="<axis:alt c="NAUDIEN" f="axissin082" lit="9910195" />" title="<axis:alt c="NAUDIEN" f="axissin082" lit="9910195" />"
                                <axis:atr f="axissin082" c="NAUDIEN" a="modificable=false"/>
                                id="NAUDIEN" style="width:20%" name="NAUDIEN" size="15" value="${__formdata.NAUDIEN}"/>
                        </td>                       
                    </tr>
                    <tr>           
                        <td class="titulocaja">
                            <b><axis:alt c="FAUDIEN" f="axissin082" lit="9909200" /></b>
                        </td>
                        <td class="titulocaja">
                            <b><axis:alt c="HAUDIEN" f="axissin082" lit="9909201" /></b>
                        </td>
                        <td class="titulocaja" colspan="2" >
                            <b><axis:alt c="TAUDIEN" f="axissin082" lit="9909236" /></b>
                        </td>
                    </tr>
                    <tr>
                        <td class="campocaja"  >
                        <axis:visible f="axissin082" c="FAUDIEN">
                            <input   type="text"  class="campowidthinput campo campotexto" id="FAUDIEN"  name="FAUDIEN"  style="width:40%" alt="<axis:alt c="FAUDIEN" f="axissin082" lit="1000510"/>" title="<axis:alt c="FSINIES" f="axissin082" lit="1000510" />"
                                <axis:atr f="axissin082" c="FAUDIEN" a="modificable=true&formato=fecha&obligatorio=false"/> value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FAUDIEN}"/>"/>                                    
                            <a style="vertical-align:middle;" id="icon_FAUDIEN"><img id="popup_calendario_FAUDIEN" src="images/calendar.gif"/></a>&nbsp;&nbsp;                                
                        </axis:visible>
                        </td>
                        <td class="campocaja"  >
                        <axis:visible f="axissin082" c="HAUDIEN">    
                            <input   type="text" class="campowidthinput campo campotexto" alt="<axis:alt c="HAUDIEN" f="axissin082" lit="9901534" />" title="<axis:alt c="HAUDIEN" f="axissin082" lit="9901534" />"
                                <axis:atr f="axissin082" c="HAUDIEN" a="modificable=true"/>
                                id="HAUDIEN" style="width:20%" name="HAUDIEN" size="15" value="${__formdata.HAUDIEN}"/>
                        </axis:visible>
                        </td>
                        <td class="campocaja" colspan="2" >
                            <select name = "TAUDIEN" id="TAUDIEN" style="width:100%" size="1"  class="campowidthselect campo campotexto" 
                                alt="<axis:alt c="TAUDIEN" f="axissin082" lit="9909236" />" title="<axis:alt c="TAUDIEN" f="axissin082" lit="9909236" />" > 
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin082" lit="1000348"/> - </option>
                                <c:forEach var="tipos" items="${__formdata.listaClases}">
                                    <option value = "${tipos.CATRIBU}"
                                        <c:if test="${tipos.CATRIBU == __formdata.TAUDIEN}">selected</c:if>>
                                        ${tipos.TATRIBU}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
           
                        <td class="titulocaja">
                            <b><axis:alt c="CDESPA" f="axissin082" lit="9909238" /></b>
                        </td>
                        <td class="titulocaja" colspan="2">
                            <b><axis:alt c="TLAUDIE" f="axissin082" lit="9909239" /></b>
                        </td>
                        <td class="titulocaja">
                            <b><axis:alt c="CAUDIEN" f="axissin082" lit="9909202" /></b>
                        </td>                                        
                    </tr>
                    <tr>
                        <td class="campocaja">
                            <select name = "CDESPA" id="CDESPA" style="width:100%" size="1"  class="campowidthselect campo campotexto" 
                                alt="<axis:alt c="CDESPA" f="axissin082" lit="9909238" />" title="<axis:alt c="CDESPA" f="axissin082" lit="9909238" />" > 
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin082" lit="1000348"/> - </option>
                                <c:forEach var="tipos" items="${__formdata.listaDespachos}">
                                    <option value = "${tipos.CATRIBU}"
                                        <c:if test="${tipos.CATRIBU == __formdata.CDESPA}">selected</c:if>>
                                        ${tipos.TATRIBU}
                                    </option>
                                </c:forEach>
                            </select>
                        </td> 
                        <td class="campocaja" colspan="2" >
                        <axis:visible f="axissin082" c="TLAUDIE">    
                            <input   type="text" class="campowidthinput campo campotexto" alt="<axis:alt c="TLAUDIE" f="axissin082" lit="9909239" />" title="<axis:alt c="TLAUDIE" f="axissin082" lit="9909239" />"
                                <axis:atr f="axissin082" c="TLAUDIE" a="modificable=true"/>
                                id="TLAUDIE" style="width:100%" name="TLAUDIE" size="100" value="${__formdata.TLAUDIE}"/>
                        </axis:visible>
                        </td>
                        <td class="campocaja" colspan="2">
                            <select name = "CAUDIEN" id="CAUDIEN" style="width:100%" size="1"  class="campowidthselect campo campotexto" 
                                alt="<axis:alt c="CAUDIEN" f="axissin082" lit="9909202" />" title="<axis:alt c="CAUDIEN" f="axissin082" lit="9909202" />" > 
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin082" lit="1000348"/> - </option>
                                <c:forEach var="tipos" items="${__formdata.listaCiudades}">
                                    <option value = "${tipos.CPOSTAL}"
                                        <c:if test="${tipos.CPOSTAL == __formdata.CAUDIEN}">selected</c:if>>
                                        ${tipos.TEXTO}
                                    </option>
                                </c:forEach>
                            </select>
                        </td> 
                    </tr>
                    <tr>
           
                        <td class="titulocaja">
                            <b><axis:alt c="CDESPAO" f="axissin082" lit="9909240" /></b>
                        </td>
                        <td class="titulocaja" colspan="2">
                            <b><axis:alt c="TLAUDIEO" f="axissin082" lit="9909242" /></b>
                        </td>
                        <td class="titulocaja">
                            <b><axis:alt c="CAUDIENO" f="axissin082" lit="9909243" /></b>
                        </td>                                        
                    </tr>
                    <tr>
                        <td class="campocaja">
                            <select name = "CDESPAO" id="CDESPAO" style="width:100%" size="1"  class="campowidthselect campo campotexto" 
                                alt="<axis:alt c="CDESPAO" f="axissin082" lit="9909240" />" title="<axis:alt c="CDESPAO" f="axissin082" lit="9909240" />" > 
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin082" lit="1000348"/> - </option>
                                <c:forEach var="tipos" items="${__formdata.listaDespachos}">
                                    <option value = "${tipos.CATRIBU}"
                                        <c:if test="${tipos.CATRIBU == __formdata.CDESPAO}">selected</c:if>>
                                        ${tipos.TATRIBU}
                                    </option>
                                </c:forEach>
                            </select>
                        </td> 
                        <td class="campocaja" colspan="2" >
                        <axis:visible f="axissin082" c="TLAUDIEO">    
                            <input   type="text" class="campowidthinput campo campotexto" alt="<axis:alt c="TLAUDIEO" f="axissin082" lit="9909242" />" title="<axis:alt c="TLAUDIEO" f="axissin082" lit="9909242" />"
                                <axis:atr f="axissin082" c="TLAUDIEO" a="modificable=true"/>
                                id="TLAUDIEO" style="width:100%" name="TLAUDIEO" size="100" value="${__formdata.TLAUDIEO}"/>
                        </axis:visible>
                        </td>
                        <td class="campocaja" colspan="2">
                            <select name = "CAUDIENO" id="CAUDIENO" style="width:100%" size="1"  class="campowidthselect campo campotexto" 
                                alt="<axis:alt c="CAUDIENO" f="axissin082" lit="9909243" />" title="<axis:alt c="CAUDIENO" f="axissin082" lit="9909243" />" > 
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin082" lit="1000348"/> - </option>
                                <c:forEach var="tipos" items="${__formdata.listaCiudades}">
                                    <option value = "${tipos.CPOSTAL}"
                                        <c:if test="${tipos.CPOSTAL == __formdata.CAUDIENO}">selected</c:if>>
                                        ${tipos.TEXTO}
                                    </option>
                                </c:forEach>
                            </select>
                        </td> 
                    </tr>
                    <tr>
                        <td class="titulocaja">
                            <b><axis:alt c="NNUMIDEAUDEN" f="axissin082" lit="9909244" /></b>
                        </td>
                    </tr>
                    <tr>
                    <td class="campocaja"  >
                        <axis:visible f="axissin082" c="NNUMIDEAUDEN">    
                        <input   type="text" class="campowidthinput campo campotexto" alt="<axis:alt c="NNUMIDEAUDEN" f="axissin082" lit="9909244" />" title="<axis:alt c="NNUMIDEAUDEN" f="axissin082" lit="9909244" />"
                        onchange="javascript:f_actualizar_persona();"
                        value="${__formdata.NNUMIDEAUDEN}"
                         <axis:atr f="axissin082" c="NNUMIDEAUDEN" a="modificable=true"/>
                         id="NNUMIDEAUDEN" style="width:80%" name="NNUMIDEAUDEN"/>
                        <img id="findPersonaAudi" border="0" src="images/find.gif" onclick="f_abrir_axisper008()" style="cursor:pointer"/>                
                        </axis:visible>
                    </td>
                        <td class="campocaja" colspan="2" >
                        <axis:visible f="axissin082" c="NOMBREAUDEN">    
                        <input   type="text" class="campowidthinput campo campotexto" alt="<axis:alt c="NOMBREAUDEN" f="axissin082" lit="9909244" />" title="<axis:alt c="NOMBREAUDEN" f="axissin082" lit="9909244" />"
                          <axis:atr f="axissin082" c="NOMBREAUDEN" a="modificable=false"/>
                         id="NOMBREAUDEN" style="width:100%" name="NOMBREAUDEN" size="100" 
                         value="${__formdata.NOMBREAUDEN}"/>
                        </axis:visible>
                        </td>
                    </tr>
                    <tr>
           
                        <td class="titulocaja">
                            <b><axis:alt c="CORAL" f="axissin082" lit="9909245" /></b>
                        </td>
                        <td class="titulocaja" >
                            <b><axis:alt c="CESTADO" f="axissin082" lit="100587" /></b>
                        </td>
                        <td class="titulocaja" id="CRESOLU_tit">
                            <b><axis:alt c="CRESOLU" f="axissin082" lit="9903489" /></b>
                        </td>   
                        <td class="titulocaja" id="FINSTA1_tit" >
                            <b><axis:alt c="FINSTA1" f="axissin082" lit="9909246" /></b>
                        </td>   
                        <td class="titulocaja" id="FINSTA2_tit">
                            <b><axis:alt c="FINSTA2" f="axissin082" lit="9909247" /></b>
                        </td> 
                        <td class="titulocaja" id="FNUEVA_tit">
                            <b><axis:alt c="FNUEVA" f="axissin082" lit="9909248" /></b>
                        </td> 
                    </tr>
                    <tr>
                        <td class="campocaja">
                            <select name = "CORAL" id="CORAL" style="width:100%" size="1"  class="campowidthselect campo campotexto" 
                                onchange="javascript:f_campos_adicionales();"
                                alt="<axis:alt c="CORAL" f="axissin082" lit="9909245" />" title="<axis:alt c="CORAL" f="axissin082" lit="9909245" />" > 
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin082" lit="1000348"/> - </option>
                                <c:forEach var="tipos" items="${__formdata.listaOral}">
                                    <option value = "${tipos.CATRIBU}"
                                        <c:if test="${tipos.CATRIBU == __formdata.CORAL}">selected</c:if>>
                                        ${tipos.TATRIBU}
                                    </option>
                                </c:forEach>
                            </select>
                        </td> 
                        <td class="campocaja">
                            <select name = "CESTADO" id="CESTADO" style="width:100%" size="1"  class="campowidthselect campo campotexto" 
                                onchange="javascript:f_campos_adicionales();"
                                alt="<axis:alt c="CESTADO" f="axissin082" lit="100587" />" title="<axis:alt c="CESTADO" f="axissin082" lit="100587" />" > 
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin082" lit="1000348"/> - </option>
                                <c:forEach var="tipos" items="${__formdata.listaEstados}">
                                    <option value = "${tipos.CATRIBU}"
                                        <c:if test="${tipos.CATRIBU == __formdata.CESTADO}">selected</c:if>>
                                        ${tipos.TATRIBU}
                                    </option>
                                </c:forEach>
                            </select>
                        </td> 
                        <td class="campocaja" id="CRESOLU_td">
                            <select name = "CRESOLU" id="CRESOLU" style="width:100%" size="1"  class="campowidthselect campo campotexto" 
                                alt="<axis:alt c="CRESOLU" f="axissin082" lit="9903489" />" title="<axis:alt c="CRESOLU" f="axissin082" lit="9903489" />" > 
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin082" lit="1000348"/> - </option>
                                <c:forEach var="tipos" items="${__formdata.listaResolucion}">
                                    <option value = "${tipos.CATRIBU}"
                                        <c:if test="${tipos.CATRIBU == __formdata.CRESOLU}">selected</c:if>>
                                        ${tipos.TATRIBU}
                                    </option>
                                </c:forEach>
                            </select>
                        </td> 
                        <td class="campocaja" id="FINSTA1_td" >
                            <axis:visible f="axissin082" c="FINSTA1">
                            <input   type="text"  class="campowidthinput campo campotexto" id="FINSTA1"  name="FINSTA1"  style="width:40%" 
                            alt="<axis:alt c="FINSTA1" f="axissin082" lit="9909246"/>" title="<axis:alt c="FINSTA1" f="axissin082" lit="9909246" />"
                                <axis:atr f="axissin082" c="FINSTA1" a="modificable=true&formato=fecha&obligatorio=false"/> 
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINSTA1}"/>"/>                                    
                            <a style="vertical-align:middle;" id="icon_FINSTA1"><img id="popup_calendario_FINSTA1" src="images/calendar.gif"/></a>&nbsp;&nbsp;                                
                            </axis:visible>
                        </td>  
                        <td class="campocaja" id="FINSTA2_td" >
                            <axis:visible f="axissin082" c="FINSTA2">
                            <input   type="text"  class="campowidthinput campo campotexto" id="FINSTA2"  name="FINSTA2"  style="width:40%" 
                            alt="<axis:alt c="FINSTA2" f="axissin082" lit="9909247"/>" title="<axis:alt c="FINSTA2" f="axissin082" lit="9909247" />"
                                <axis:atr f="axissin082" c="FINSTA2" a="modificable=true&formato=fecha&obligatorio=false"/> 
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINSTA2}"/>"/>                                    
                            <a style="vertical-align:middle;" id="icon_FINSTA2"><img id="popup_calendario_FINSTA2" src="images/calendar.gif"/></a>&nbsp;&nbsp;                                
                            </axis:visible>
                        </td>  
                        <td class="campocaja"  id="FNUEVA_td">
                            <axis:visible f="axissin082" c="FNUEVA">
                            <input   type="text"  class="campowidthinput campo campotexto" id="FNUEVA"  name="FNUEVA"  style="width:40%" 
                            alt="<axis:alt c="FNUEVA" f="axissin082" lit="9909248"/>" title="<axis:alt c="FNUEVA" f="axissin082" lit="9909248" />"
                                <axis:atr f="axissin082" c="FNUEVA" a="modificable=true&formato=fecha&obligatorio=false"/> 
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FNUEVA}"/>"/>                                    
                            <a style="vertical-align:middle;" id="icon_FNUEVA"><img id="popup_calendario_FNUEVA" src="images/calendar.gif"/></a>&nbsp;&nbsp;                                
                            </axis:visible>
                        </td> 
                    </tr>
                    <tr>
                        <td class="titulocaja">
                            <b><axis:alt c="TRESULT" f="axissin082" lit="9909249" /></b>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6" style="width:100%;" class="campocaja">
                            <axis:ocultar c="TRESULT" f="axissin082" dejarHueco="false">
                            <textarea class="campowidthinput campo campotexto" style="width:100%;" name="TRESULT" id="TRESULT">${__formdata.TRESULT}</textarea>
                            </axis:ocultar>
                        </td>
                    </tr>
                </table>

  </td>
</tr>
</table>
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin082</c:param><c:param name="f">axissin082</c:param><c:param name="f">axissin082</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>
    </form>
    <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FAUDIEN",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FAUDIEN", 
                singleClick    :    true,
                firstDay       :    1
            });
            Calendar.setup({
                inputField     :    "FINSTA1",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FINSTA1", 
                singleClick    :    true,
                firstDay       :    1
            });
            Calendar.setup({
                inputField     :    "FINSTA2",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FINSTA2", 
                singleClick    :    true,
                firstDay       :    1
            });
            Calendar.setup({
                inputField     :    "FNUEVA",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FNUEVA", 
                singleClick    :    true,
                firstDay       :    1
            });
    </script>
  <c:import url="../include/mensajes.jsp" />
</body>
</html>
