<%/*
*  Fichero: axiscaj001.jsp
*
*  Fecha: 29/06/2009
*/
%>
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
        
            function f_onload() {
                f_cargar_propiedades_pantalla();
              <% if (request.getAttribute("__formdata") != null )
                {  %>
                    var CAGENTE = "${__formdata.CAGENTE}";
                    if (objUtiles.estaVacio(CAGENTE)) {
                        f_abrir_axisctr014();
                    }else{
                        $("#CAGENTE").val(CAGENTE);
                    }
             <% }  %> 
                
            }
            
           
            
            function f_aceptar_modal(pantalla){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axiscaj001.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
            
            function f_aceptar_modal(pantalla, param){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axiscaj001.do?"+param, "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
    
            function f_abrir_modal(cual, noXButton, optionalQueryString) {
              
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                
                if (noXButton) 
                    objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    

                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
            }
            
            function f_cerrar_modal(pantalla){
                objUtiles.cerrarModal(pantalla);
            }      
            
            function f_but_salir(){
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axiscaj001", "cancelar", document.miForm, "_self");            
            }

            function f_aceptar_axisper001 (selectedPerson){
                $("#SPERSON").val(selectedPerson);
                f_cerrar_modal("axisctr014");
                objUtiles.ejecutarFormulario("axis_axiscaj001.do?SPERSON="+selectedPerson, "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
            
            function f_aceptar_axisper010(selectedPerson,selectedagent){
                $("#SPERSON").val(selectedPerson);
                objUtiles.cerrarModal("axisper010");
                objUtiles.ejecutarFormulario("axis_axiscaj001.do?&SPERSON="+selectedPerson+"&CAGENTEselected="+selectedagent, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            function f_limpiarForm(){
                    objDom.setValorPorId("CMETMOV","");
                    objDom.setValorPorId("CMONOPE","");
                    objDom.setValorPorId("IMOVIMI","0");
                    objDom.setValorPorId("IAUTOLIQP","0");
                    objDom.setValorPorId("IAUTOLIQI","0");
                    objDom.setValorPorId("DIFERENCIAL","0");
                    objDom.setValorPorId("IPAGSIN","0");
                    objDom.setValorPorId("NCHEQUE","");
                    objDom.setValorPorId("CCHQORI","");
                    objDom.setValorPorId("CBANTRANS","");
                    objDom.setValorPorId("CCC","");
                    objDom.setValorPorId("CTIPTAR","");
                    objDom.setValorPorId("NTARGET","");
                    objDom.setValorPorId("FCADTAR","");
                    objDom.setValorPorId("FICHEROS","");
                    objDom.setValorPorId("GUARDADO","");
            }
            
            function f_abrir_axisctr014(){
                 f_abrir_modal('axisctr014',null,"&CONDICION=INTERMEDIARIOS");
                 f_limpiarForm();
            }  
            
            function f_cerrar_axisctr014(){
                objUtiles.cerrarModal("axisctr014");
            }   
            function f_aceptar_axisctr014(CODI){
                if (!objUtiles.estaVacio(CODI)) {
                    $("#CAGENTE").val(CODI);
                    objUtiles.cerrarModal("axisctr014");
                    objUtiles.ejecutarFormulario("axis_axiscaj001.do?&CAGENTE="+CODI+"&LIMPIA=1", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            } 
            
            function f_but_nueva_persona() {
                f_abrir_axisper005();
            }
            
            function  f_abrir_axisper005() {
                objUtiles.cerrarModal("axisper001");
                objUtiles.abrirModal("axisper005", "src", "modal_axisper005.do?operation=form&faceptar=f_aceptar_axisper005"+"&ORIGEN=AXISPRF001" );
            }
            
            function f_abrir_axisper010NOU(isNew){
                f_cerrar_axisctr014();
                objDom.setVisibilidadPorId('but_cerrar_modal_axisper010', 'hidden');
                objUtiles.abrirModal("axisper010","src","modal_axisper010.do?operation=form&isNew="+isNew);
            }  
            
            function f_but_9905075(){
            if($("#IMOVIMI").val()<=0){
            alert("<axis:alt f="axiscaj001" c="AVISO" lit="9906384" />");
                    return false;
            }
            
              if ( objDom.getValorPorId("GUARDADO") =="0"){
                    alert("<axis:alt f="axiscaj001" c="AVISO" lit="180121" />");
                    return false;
              }
              if (objValidador.validaEntrada()) {
                    f_abrir_modal("axiscaj010",null,"&SPERSON="+$("#SPERSON").val()+
                                                    "&NNUMIDE="+$("#NNUMIDE").val()+
                                                    "&TNOMBRE="+$("#TNOMBRE").val()+
                                                    "&IMOVIMI="+$("#IMOVIMI").val()+
                                                    "&IAUTOLIQP="+$("#IAUTOLIQP").val()+
                                                    "&IAUTOLIQI="+$("#IAUTOLIQI").val()+
                                                    "&DIFERENCIAL="+$("#DIFERENCIAL").val()+
                                                    "&IPAGSIN="+$("#IPAGSIN").val()+
                                                    "&CMONOPE="+$("#CMONOPE").val()+
                                                    "&CAGENTE="+$("#CAGENTE").val()+
                                                    "&CLIQUIDO="+$("#CLIQUIDO").val()+
                                                    "&PCLIQUIDO="+$("#PCLIQUIDO").val()+
                                                    "&CAGENTE_BUSCAR="+$("#CAGENTE_BUSCAR").val());
              }  
            }
            
            
            
           
            
            function f_but_aceptar(){
                 if (!objValidador.validaEntrada()) {
                    return false;
                 }
               if ( objUtiles.estaVacio(objDom.getValorPorId("FICHEROS"))){
                    alert("<axis:alt f="axiscaj001" c="AVISO" lit="9905614" />");
                    return false;
                }
                if ( objDom.getValorPorId("GUARDADO") =="0"){
                    alert("<axis:alt f="axiscaj001" c="AVISO" lit="180121" />");
                    return false;
                }
                
                objUtiles.ejecutarFormulario("axis_axiscaj001.do","m_aceptar",document.miForm, "_self", objJsMessages.jslit_cargando);   
             
            }
            
            function callbackAjaxInsMovCaja(ajaxResponseText){
           
                var doc=objAjax.domParse(ajaxResponseText); 
                
                var elementos = doc.getElementsByTagName("PSEQCAJA");
              
                if ((elementos!=null) && (elementos.length > 0)){
                    for (i = 0; i < elementos.length; i++) {
                        var SEQCAJA = objDom.getValorNodoDelComponente(elementos, i, 0);
                        objDom.setValorPorId("SEQCAJA",SEQCAJA);
                    }
                    if (!objUtiles.estaVacio(objDom.getValorPorId("SEQCAJA"))){
                        objUtiles.ejecutarFormulario("axis_axiscaj001.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
                    } else {
                        alert ("Error");
                    }
                }else{
                    alert ("Error");
                }
            }
            
            function guardarMoneda(){
                objAjax.invokeAsyncCGI("axis_axiscaj001.do?", callbackAjaxGuardarMoneda, "operation=guardar_moneda&CMONOPE="+$("#CMONOPE").val(),
                                   this, objJsMessages.jslit_cargando);
            }
            
            function callbackAjaxGuardarMoneda(ajaxResponseText){
           
            }
            
              function f_borrar(ID){
               if ( objDom.getValorPorId("GUARDADO") =="0"){
                    alert("<axis:alt f="axiscaj001" c="AVISO" lit="180121" />");
                    return false;
                }
                objAjax.invokeAsyncCGI("axis_axiscaj001.do?", callbackAjaxBorrarMp, "operation=delete&NUMLIN="+ID,
                                   this, objJsMessages.jslit_cargando);
            }
            
            function callbackAjaxBorrarMp(ajaxResponseText){
            objUtiles.ejecutarFormulario ("axis_axiscaj001.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);    
                 }
                                   
            function f_cambiar(){
                f_cargar_propiedades_pantalla();
            }
           function f_stripInvalidChars( str ){
                str =str.toUpperCase() + '';
                var rgx = /^[\060-\071]|[\101-\132]|[\141-\172]|[\055]$/i;
                var out = '';
                for( var i = 0; i < str.length; i++ ){
                    if( rgx.test( str.charAt(i) ) ){
                        out += str.charAt(i);
                    }
                }
                return out;
            }
            
            function f_cleanInvalidChars(idobject){
                var value="";
                value=f_stripInvalidChars(objDom.getValorPorId(idobject));
                objDom.setValorPorId(idobject,value);
            }
            
             function f_gestion_linea(PMODO,NNUMLIN){
                 if ( objDom.getValorPorId("GUARDADO") =="0"){
                    alert("<axis:alt f="axiscaj001" c="AVISO" lit="180121" />");
                    return false;
              }
                objUtiles.abrirModal("axiscaj017","src","modal_axiscaj017.do?operation=form");
           }
             function f_cerrar_axiscaj017(){
                objUtiles.cerrarModal("axiscaj017");
                objUtiles.ejecutarFormulario ("axis_axiscaj001.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);    
           
            }            
             function f_aceptar_axiscaj017(){
                f_cerrar_axiscaj017();
            }
        </script>
    </head>
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>

    <form name="miForm" action="axis_axiscaj001.do" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.ALLAGENTE[0].SPERSON}"/>
            <input type="hidden" id="IMPASIG" name="IMPASIG" value="${__formdata.IMPASIG}"/>
            <input type="hidden" id="CAGENTE" name="CAGENTE" value="${__formdata.CAGENTE}"/>
            <input type="hidden" id="SEQCAJA" name="SEQCAJA" value="${__formdata.SEQCAJA}"/>
            <input type="hidden" id="FICHEROS" name="FICHEROS" value="${__formdata.FICHEROS}"/>   
            <input type="hidden" id="MEDIOPAGO" name="MEDIOPAGO" value="${__formdata.MEDIOPAGO}"/>    
            <input type="hidden" id="MONEDA" name="MONEDA" value="${__formdata.CMONOPE}"/>
            <input type="hidden" id="CLIQUIDO" name="CLIQUIDO" value="${__formdata.ALLAGENTE[0].CLIQUIDO}"/>
             <input type="hidden" id="PCLIQUIDO" name="PCLIQUIDO" value="${__formdata.ALLAGENTE[0].PCLIQUIDO}"/>
            <input type="hidden" id="CAGENTE_BUSCAR" name="CAGENTE_BUSCAR" value="${__formdata.CAGENTE_BUSCAR}"/>
            <input type="hidden" id="GUARDADO" name="GUARDADO" value="${__formdata.guardat}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="form" f="axiscaj001" lit="9905076"/></c:param>
                <c:param name="producto"><axis:alt c="form" f="axiscaj001" lit="9905076"/></c:param>
                <c:param name="form">axiscaj001</c:param>
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisctr014|<axis:alt f="axiscaj001" c="MODAL_AXISctr014" lit="9902364" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisper010|<axis:alt f="axiscaj001" c="MODAL_AXISPER010" lit="110275" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axiscaj010|<axis:alt f="axiscaj001" c="MODAL_AXISCAJ010" lit="9905082" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axiscaj017|<axis:alt f="axiscaj001" c="MODAL_AXISCAJ017" lit="" /></c:param>
            </c:import>
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                <td>
                 <div class="titulo">
                    <img src="images/flecha.gif"/>
                    <axis:alt f="axiscob001" c="DATOS_AGE" lit="100584"/> - 
                    <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                </div>
                <table class="seccion" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="left" >
                            <table class="area" align="center">
                            <tr>
                                <th style="width:10%;"></th>
                                <th style="width:25%;"></th>
                                <th style="width:25%;"></th>                                
                                <th ></th>   
                            </tr>  
                            
                            <tr>
                                <axis:ocultar f="axiscaj001" c="CAGENTE" dejarHueco="false"> 
                                    <td class="titulocaja">
                                       <b><axis:alt f="axiscaj001" c="CAGENTE" lit="9000531"/></b>
                                    </td>
                                </axis:ocultar> 
                                <axis:ocultar f="axiscaj001" c="TNOMBRE" dejarHueco="false"> 
                                    <td class="titulocaja">
                                       <b><axis:alt f="axiscaj001" c="TNOMBRE" lit="100584"/></b>
                                    </td>
                                </axis:ocultar>
                                 <axis:ocultar f="axiscaj001" c="NNUMIDE" dejarHueco="false"> 
                                    <td class="titulocaja">
                                       <b><axis:alt f="axiscaj001" c="NNUMIDE" lit="9903661"/></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                  <axis:ocultar f="axiscaj001" c="CAGENTE" >
                                    <td class="campocaja">
                                        <input type="text" class="campodisabled campo campotexto" value="${__formdata.AGENTE.CODI}" name="CAGENTETEXT" id="CAGENTETEXT" 
                                               readonly="true" style="width:90%" size="15"  />
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axiscaj001" c="TNOMBRE" >
                                    <td class="campocaja">
                                        <input type="text" class="campodisabled campo campotexto" value="${__formdata.AGENTE.NOMBRE}" name="TNOMBRE" id="TNOMBRE" 
                                               readonly="true" style="width:100%" size="15" />
                                    </td>
                                </axis:ocultar>
                                 <axis:ocultar f="axiscaj001" c="NNUMIDE" >
                                    <td class="campocaja">
                                        <input type="text" class="campodisabled campo campotexto" value="${__formdata.AGENTE.NNUMIDE}" name="NNUMIDE" id="NNUMIDE" 
                                               readonly="true" style="width:100%" size="15" />
                                    </td>
                                </axis:ocultar>
                            </tr>
                          
                        </table>
            </td>
        </tr>
         <tr>
                <td>
                 <div class="titulo">
                    <img src="images/flecha.gif"/>
                    <axis:alt f="axiscob001" c="PAG_MASIV" lit="9905076"/>
                </div>
               <table class="seccion" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="left" >
                            <table class="area" align="center">
                            <tr>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>                                
                                <th style="width:25%;height:0px"></th>  
                                 <th style="width:25%;height:0px"></th> 
                            </tr>
                            <tr>
                                <axis:ocultar f="axiscaj001" c="CMONOPE" dejarHueco="false"> 
                                    <td class="titulocaja">
                                       <b><axis:alt f="axiscaj001" c="CMONOPE" lit="108645"/></b>
                                    </td>                                    
                                </axis:ocultar>
                                
                                 <axis:ocultar f="axiscaj001" c="IAUTOLIQP" dejarHueco="false"> 
                                    <td class="titulocaja" id="tit_IAUTOLIQP">
                                       <b id="label_IAUTOLIQP"><axis:alt f="axiscaj001" c="IAUTOLIQP" lit="9906372"/></b>
                                    </td>
                                </axis:ocultar>
                                
                                 <axis:ocultar f="axiscaj001" c="IAUTOLIQI" dejarHueco="false"> 
                                    <td class="titulocaja" id="tit_IAUTOLIQI">
                                       <b id="label_IAUTOLIQI"><axis:alt f="axiscaj001" c="IAUTOLIQI" lit="9906373"/></b>
                                    </td>
                                </axis:ocultar>
                                
                                  <axis:ocultar f="axiscaj001" c="DIFERENCIAL" dejarHueco="false"> 
                                    <td class="titulocaja">
                                       <b><axis:alt f="axiscaj001" c="DIFERENCIAL" lit="9002191"/></b>
                                    </td>                                    
                                </axis:ocultar>
                                                              
                                <axis:ocultar f="axiscaj001" c="IMOVIMI" dejarHueco="false"> 
                                    <td class="titulocaja">
                                       <b><axis:alt f="axiscaj001" c="IMOVIMI" lit="9000475"/></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axiscaj001" c="CMONOPE" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <select name="CMONOPE" id="CMONOPE" size="1" class="campowidthselect campo campotexto_ob" style="width:84%;" 
                                            title="<axis:alt f="axiscaj001" c="CMONOPE" lit="108645"/>"
                                            <axis:atr f="axiscaj001" c="CMONOPE" a="obligatorio=true&isInputText=false"/> ">
                                            <option value="<%= Integer.MIN_VALUE %>">
                                                <axis:alt f="axiscaj001" c="SELECCIONAR" lit="108341"/>                                
                                            </option>
                                            <c:forEach var="lstmoneda" items="${__formdata.MONEDAS}">
                                                <option value="${lstmoneda.CMONEDA}"
                                                <c:if test="${__formdata.CMONOPE == lstmoneda.CMONEDA}">selected</c:if>>
                                                ${lstmoneda.TMONEDA}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>                             
                                    <axis:ocultar f="axiscaj001" c="IAUTOLIQP" dejarHueco="false" >
                                    <td class="campocaja" id="td_IAUTOLIQP">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                               name="IAUTOLIQP" id="IAUTOLIQP" size="15"
                                               title="<axis:alt f="axiscaj001" c="IAUTOLIQP" lit="9906372"/>"
                                               <axis:atr f="axiscaj001" c="IAUTOLIQP" a="obligatorio=true&formato=decimal"/> 
                                               value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IAUTOLIQP}"/>"/>
                                    </td>
                                </axis:ocultar>                                
                                 <axis:ocultar f="axiscaj001" c="IAUTOLIQI" dejarHueco="false" >
                                    <td class="campocaja" id="td_IAUTOLIQI">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                               name="IAUTOLIQI" id="IAUTOLIQI" size="15"
                                               title="<axis:alt f="axiscaj001" c="IAUTOLIQI" lit="9906373"/>"
                                               <axis:atr f="axiscaj001" c="IAUTOLIQI" a="obligatorio=true&formato=decimal"/> 
                                               value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IAUTOLIQI}"/>"/>
                                    </td>
                                </axis:ocultar> 
                                
                                 <axis:ocultar f="axiscaj001" c="DIFERENCIAL" >
                                    <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" name="DIFERENCIAL" id="DIFERENCIAL" 
                                         title="<axis:alt f="axiscaj001" c="DIFERENCIAL" lit="9002191"/>"
                                          <axis:atr f="axiscaj001" c="DIFERENCIAL" a="obligatorio=true"/>
                                             formato="decimalNegativo"
                                           size="15" 
                                           value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.DIFERENCIAL}"/>"
                                           />
                                    </td>
                                </axis:ocultar>                                
                                <axis:ocultar f="axiscaj001" c="IMOVIMI" >
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto"   name="IMOVIMI" id="IMOVIMI" 
                                             title="<axis:alt f="axiscaj001" c="IMOVIMI" lit="9000475"/>"
                                                 <axis:atr f="axiscaj001" c="IMOVIMI" a="modificable=false"/> 
                                               size="15"  
                                               value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IMOVIMI}"/>"
                                               />
                                    </td>                                    
                                </axis:ocultar>
                            </tr>   
                               <tr>
                                        <td class = "campocaja" colspan="5" >
                                            <div class="separador">&nbsp;</div>  
                                             <div style="float:left;">
                                                   <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axiscaj001" c="TITULO" lit="109479"/></div>
                                             </div>
                                             <div style="float:right;">
                                                <axis:visible f="axiscaj001" c="NEW_MEDIOPAGO" >
                                                    <a href="javascript:f_gestion_linea('1')">  <img border="0" src="images/new.gif"/></a>
                                                </axis:visible>
                                              </div>

                                        </td>
                                     </tr>
                                     <axis:ocultar f="axisctr004" c="DSP_CUENTAS" dejarHueco="false">   
                                         <tr>
                                            <td class = "campocaja" colspan="5">
                                            
                                            <c:set var="title0"><axis:alt f="axiscaj001" c="TITULO" lit="9902938"/></c:set>
                                            <c:set var="title1"><axis:alt f="axiscaj001" c="TITULO" lit="9906374"/></c:set>
                                            <c:set var="title2"><axis:alt f="axiscaj001" c="TITULO" lit="9000964"/></c:set>
                                            <c:set var="title3"><axis:alt f="axiscaj001" c="TITULO" lit="9001727"/></c:set>
                                            <c:set var="title4"><axis:alt f="axiscaj001" c="TITULO" lit="9000475"/></c:set>
                                           
                                            <div class="displayspaceGrande">
                                                <display:table name="${__formdata.cuentas}" id="miListaId" export="false" style="width:100%;" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                                 requestURI="axis_axiscaj001.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <axis:visible c="NNUMLIN" f="axiscaj001">
                                                        <display:column title="${title3}" sortable="true" style="width:2%;" sortProperty="NNUMLIN" headerClass="sortable fixed"  media="html" autolink="false" >
                                                             <div class="dspNumber">${miListaId['numlin']}</div>
                                                        </display:column>
                                                    </axis:visible>                                                    
                                                    <axis:visible c="MEDIOPAGO" f="axiscaj001">
                                                        <display:column title="${title0}" sortable="true" style="width:7%;" sortProperty="TIPOLIN" headerClass="sortable fixed"  media="html" autolink="false" >
                                                              <div class="dspText">${miListaId['medioPagoDesc']}</div>
                                                        </display:column>
                                                     </axis:visible>   
                                                     <axis:visible c="BANCO" f="axiscaj001">
                                                         <display:column title="${title2}" sortable="true" style="width:30%;" sortProperty="TIPOLIN" headerClass="sortable fixed"  media="html" autolink="false" >
                                                              <div class="dspText">${miListaId['bancoDesc']}</div>
                                                         </display:column>
                                                     </axis:visible>
                                                      <axis:visible c="NUMCT" f="axiscaj001">
                                                         <display:column title="${title1}" sortable="true" style="width:12%;" sortProperty="TIPOLIN" headerClass="sortable fixed"  media="html" autolink="false" >
                                                              <div class="dspText">${miListaId['numero']}</div>
                                                         </display:column>
                                                     </axis:visible>
                                                      <axis:visible c="IMPORTE" f="axiscaj001">
                                                         <display:column title="${title4}" sortable="true" style="width:8%;" sortProperty="TIPOLIN" headerClass="sortable fixed"  media="html" autolink="false" >
                                                               <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId['importe']}"/></div>
                                                         </display:column>
                                                     </axis:visible>                                                   
                                                     <axis:visible f="axiscaj001" c="BT_SIN_DELETE"> 
                                                        <display:column title="" headerClass="sortable fixed" media="html" style="width:3%;" autolink="false" >
                                                       
                                                            <div class="dspIcons"><img border="0" alt="<axis:alt f="axiscaj001" c="TITULO" lit="1000127"/>" title1="<axis:alt f="axiscaj001" c="TITULO" lit="1000127"/>" src="images/delete.gif" width="15px" height="15px"
                                                            style="cursor:pointer;" onclick="javascript:f_borrar('${miListaId['numlin']}');"/></div>
                                                      
                                                        </display:column>
                                                    </axis:visible>
                                                </display:table>
                                              </div>                                            
                                            </td>
                                          </tr>
                                      </axis:ocultar>   
                                  
                            
                            </table>
                    </td>
                </tr>
                </table>
                
               </td>
         </tr>
             <!-- <tr>
                <td>
                 <div class="titulo">
                    <img src="images/flecha.gif"/>
                    <axis:alt f="axiscob001" c="PAG_MASIV" lit="9902938"/>
                </div>
              <table class="seccion" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="left" >
                            <table class="area" align="center">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>                                
                                <th style="width:25%;height:0px"></th>   
                            </tr>
                             
                            <tr>
                                <axis:ocultar f="axiscaj001" c="CMETMOV" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CMETMOV">
                                       <b id="label_CMETMOV" ><axis:alt f="axiscaj001" c="CMETMOV" lit="9902938"/></b>
                                    </td>
                                </axis:ocultar>
                               
                            </tr>
                            <tr>
                                <axis:ocultar f="axiscaj001" c="CMETMOV" dejarHueco="false"> 
                                    <td class="campocaja"  id = "td_CMETMOV">
                                        <select name="CMETMOV" id="CMETMOV" size="1" class="campowidthselect campo campotexto_ob" style="width:84%;" 
                                                title="<axis:alt f="axiscaj001" c="CMETMOV" lit="9902938"/>" onchange="f_but_9000479();"
                                            <axis:atr f="axiscaj001" c="CMETMOV" a="obligatorio=true&isInputText=false"/>>
                                            <option value="<%= Integer.MIN_VALUE %>">
                                                <axis:alt f="axiscaj001" c="SELECCIONAR" lit="108341"/>                                
                                            </option>
                                            <c:forEach var="medio_mov" items="${__formdata.FORMAPAGO}">
                                                <option value="${medio_mov.CATRIBU}"
                                                <c:if test="${__formdata.CMETMOV == medio_mov.CATRIBU}">selected</c:if>>
                                                ${medio_mov.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                               
                            </tr>
                           
                            <tr>
                             <axis:ocultar f="axiscaj001" c="NCHEQUE" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_NCHEQUE">
                                       <b id="label_NCHEQUE" ><axis:alt f="axiscaj001" c="NCHEQUE" lit="9905071"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axiscaj001" c="CCHQORI" dejarHueco="false"> 
                                    <td class="titulocaja" id="tit_CCHQORI">
                                       <b id="label_CCHQORI"><axis:alt f="axiscaj001" c="CCHQORI" lit="9905072"/></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            
                            <tr>
                             <axis:ocultar f="axiscaj001" c="NCHEQUE" dejarHueco="false" >
                                    <td class="campocaja" id = "td_NCHEQUE">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NCHEQUE}" name="NCHEQUE" id="NCHEQUE" 
                                              <axis:atr f="axiscaj001" c="NCHEQUE" a="obligatorio=true"/> 
                                               onchange="f_cleanInvalidChars(this.id)"  onkeyup="f_cleanInvalidChars(this.id)"
                                               title="<axis:alt f="axiscaj001" c="NCHEQUE" lit="9905071"/>" size="15" />
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axiscaj001" c="CCHQORI" >
                                    <td class="campocaja" id = "td_CCHQORI">
                                        <select name="CCHQORI" id="CCHQORI" size="1" class="campowidthselect campo campotexto" style="width:84%;;" 
                                            title="<axis:alt f="axiscaj001" c="CCHQORI" lit="9905072"/>"
                                            <axis:atr f="axiscaj001" c="CCHQORI" a="obligatorio=true&isInputText=false"/> >
                                            <option value="<%= Integer.MIN_VALUE %>">
                                                <axis:alt f="axiscaj001" c="SELECCIONAR" lit="108341"/>                                
                                            </option>
                                            <c:forEach var="cheque_ori" items="${__formdata.BANCOS}">
                                                <option value="${cheque_ori.CBANCO}"
                                                <c:if test="${__formdata.CCHQORI == cheque_ori.CBANCO}">selected</c:if>>
                                                ${cheque_ori.TBANCO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                            </tr>
                           
                            
                            <tr>
                                <axis:ocultar f="axiscaj001" c="CBANTRANS" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CBANTRANS">
                                       <b id="label_CBANTRANS"><axis:alt f="axiscaj001" c="CBANTRANS" lit="9000964"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axiscaj001" c="CCC" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CCC"> 
                                       <b id="label_CCC"><axis:alt f="axiscaj001" c="CCC" lit="9903154"/></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axiscaj001" c="CBANTRANS" >
                                    <td class="campocaja" id = "td_CBANTRANS">
                                        <select name="CBANTRANS" id="CBANTRANS" size="1" class="campowidthselect campo campotexto" style="width:84%;;" 
                                            title="<axis:alt f="axiscaj001" c="CBANTRANS" lit="9000964"/>"
                                            <axis:atr f="axiscaj001" c="CBANTRANS" a="obligatorio=true&isInputText=false"/>>
                                            <option value="<%= Integer.MIN_VALUE %>">
                                                <axis:alt f="axiscaj001" c="SELECCIONAR" lit="108341"/>                                
                                            </option>
                                            <c:forEach var="bancos" items="${__formdata.BANCOS}">
                                                <option value="${bancos.CBANCO}"
                                                <c:if test="${__formdata.CBANTRANS == bancos.CBANCO}">selected</c:if>>
                                                ${bancos.TBANCO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axiscaj001" c="CCC" >
                                    <td class="campocaja" id = "td_CCC">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CCC}" name="CCC" id="CCC" 
                                              <axis:atr f="axiscaj001" c="CCC" a="obligatorio=true"/> 
                                              onchange="f_cleanInvalidChars(this.id)"  onkeyup="f_cleanInvalidChars(this.id)"
                                             title="<axis:alt f="axiscaj001" c="CCC" lit="9903154"/>"  size="15" />
                                    </td>
                                </axis:ocultar>
                            </tr>
                            
                            <tr>
                                <axis:ocultar f="axiscaj001" c="CTIPTAR" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CTIPTAR"> 
                                       <b id="label_CTIPTAR"><axis:alt f="axiscaj001" c="CTIPTAR" lit="9902671"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axiscaj001" c="NTARGET" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_NTARGET"> 
                                       <b id="label_NTARGET"><axis:alt f="axiscaj001" c="NTARGET" lit="9902646"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axiscaj001" c="FCADTAR" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_FCADTAR"> 
                                       <b id="label_FCADTAR"><axis:alt f="axiscaj001" c="FCADTAR" lit="9902236"/></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axiscaj001" c="CTIPTAR" >
                                    <td class="campocaja" id = "td_CTIPTAR">
                                        <select name="CTIPTAR" id="CTIPTAR" size="1" class="campowidthselect campo campotexto" style="width:84%;;" 
                                            title="<axis:alt f="axiscaj001" c="CTIPTAR" lit="9902671"/>"
                                            <axis:atr f="axiscaj001" c="CTIPTAR" a="obligatorio=true&modificable=false&isInputText=false"/>>
                                            <option value="<%= Integer.MIN_VALUE %>">
                                                <axis:alt f="axiscaj001" c="SELECCIONAR" lit="108341"/>                                
                                            </option>
                                            <c:forEach var="tiposTar" items="${__formdata.LSTCTIPTAR}">
                                                <option value="${tiposTar.CATRIBU}"
                                                <c:if test="${__formdata.CTIPTAR == tiposTar.CATRIBU}">selected</c:if>>
                                                ${tiposTar.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axiscaj001" c="NTARGET" >
                                    <td class="campocaja" id = "td_NTARGET">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NTARGET}" name="NTARGET" id="NTARGET" 
                                            <axis:atr f="axiscaj001" c="NTARGET" a="obligatorio=true&isInputText=false&formato=entero"/>
                                            title="<axis:alt f="axiscaj001" c="NTARGET" lit="9902646"/>" size="15" />
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar c="FCADTAR" f="axiscaj001" dejarHueco="false">
                                    <td class="campocaja" id = "td_FCADTAR">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" 
                                          <axis:atr f="axiscaj001" c="FCADTAR" a="obligatorio=true&isInputText=false&modificable=false"/>
                                               title="<axis:alt f="axiscaj001" c="FCADTAR" lit="9902236"/>"
                                               value="${__formdata.FCADTAR}" name="FCADTAR" id="FCADTAR" 
                                               readonly="readonly"
                                               style="width:40%;;" alt="<axis:alt f="axiscaj001" c="FCADTAR" lit="9902236"/>" title="<axis:alt f="axisadm036" c="FCADTAR" lit="9902236"/>" />
                                     <a id="icon_FCADTAR" style="vertical-align:middle;" href="#"><img id="popup_calendario_FCADTAR" alt="<axis:alt f="axiscaj001" c="SEL_FCADTAR" lit="9902236"/>" title="<axis:alt f="axiscaj001" c="ALT_FCADTAR" lit="9902236" />" src="images/calendar.gif"/></a>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            
                            <tr>
                                <axis:ocultar f="axiscaj001" c="CMONOPE" dejarHueco="false"> 
                                    <td class="titulocaja">
                                       <b><axis:alt f="axiscaj001" c="CMONOPE" lit="108645"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axiscaj001" c="IMOVIMI" dejarHueco="false"> 
                                    <td class="titulocaja">
                                       <b><axis:alt f="axiscaj001" c="IMOVIMI" lit="9000475"/></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axiscaj001" c="CMONOPE" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <select name="CMONOPE" id="CMONOPE" size="1" class="campowidthselect campo campotexto_ob" style="width:84%;" 
                                            title="<axis:alt f="axiscaj001" c="CMONOPE" lit="108645"/>"
                                            <axis:atr f="axiscaj001" c="CMONOPE" a="obligatorio=true&isInputText=false"/> ">
                                            <option value="<%= Integer.MIN_VALUE %>">
                                                <axis:alt f="axiscaj001" c="SELECCIONAR" lit="108341"/>                                
                                            </option>
                                            <c:forEach var="lstmoneda" items="${__formdata.MONEDAS}">
                                                <option value="${lstmoneda.CMONEDA}"
                                                <c:if test="${__formdata.CMONOPE == lstmoneda.CMONEDA}">selected</c:if>>
                                                ${lstmoneda.TMONEDA}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axiscaj001" c="IMOVIMI" >
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" name="IMOVIMI" id="IMOVIMI" 
                                             title="<axis:alt f="axiscaj001" c="IMOVIMI" lit="9000475"/>"
                                                 <axis:atr f="axiscaj001" c="IMOVIMI" a="obligatorio=true&formato=decimal"/> 
                                                 formato="decimal"
                                               size="15" 
                                               value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IMOVIMI}"/>"
                                               />
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axiscaj001" c="IAUTOLIQ" dejarHueco="false"> 
                                    <td class="titulocaja" id="tit_IAUTOLIQ">
                                       <b id="label_IAUTOLIQ"><axis:alt f="axiscaj001" c="IAUTOLIQ" lit="9905074"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axiscaj001" c="IPAGSIN" dejarHueco="false"> 
                                    <td class="titulocaja" id="tit_IPAGSIN">
                                       <b id="label_IPAGSIN"><axis:alt f="axiscaj001" c="IPAGSIN" lit="9904161"/></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axiscaj001" c="IAUTOLIQ" dejarHueco="false" >
                                    <td class="campocaja" id="td_IAUTOLIQ">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                               name="IAUTOLIQ" id="IAUTOLIQ" size="15"
                                               title="<axis:alt f="axiscaj001" c="IAUTOLIQ" lit="9905074"/>"
                                               <axis:atr f="axiscaj001" c="IAUTOLIQ" a="obligatorio=true&formato=decimal"/> 
                                               value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IAUTOLIQ}"/>"
                                                />
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axiscaj001" c="IPAGSIN" dejarHueco="false" >
                                    <td class="campocaja" id="td_IPAGSIN">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                               name="IPAGSIN" id="IPAGSIN" size="15" 
                                               title="<axis:alt f="axiscaj001" c="IPAGSIN" lit="9904161"/>"
                                               <axis:atr f="axiscaj001" c="IPAGSIN" a="obligatorio=true&formato=decimal"/> 
                                               value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IPAGSIN}"/>"
                                               />
                                    </td>
                                </axis:ocultar>
                            </tr>
                            </table>
                    </td>
                </tr>
                </table>
              
             
              
              
              
               </td>
         </tr> -->
        </table>
    </form>    
    <c:import url="../include/botonera_nt.jsp">
       <c:param name="f">axiscaj001</c:param>
       <c:param name="__botones"><axis:ocultar f="axiscaj001" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar><axis:ocultar f="axiscaj001" c="BT_FICHEROS">,9905075</axis:ocultar><axis:ocultar f="axiscaj001" c="BT_ACEPTAR">,aceptar</axis:ocultar></c:param>
    </c:import>
      <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FCADTAR",     
                ifFormat       :    "%m%y",      
                button         :    "popup_calendario_FCADTAR", 
                singleClick    :    true,
                firstDay       :    1
            });    
        </script><!--%d/-->
    <c:import url="../include/mensajes.jsp" />    
</body>
</html>


