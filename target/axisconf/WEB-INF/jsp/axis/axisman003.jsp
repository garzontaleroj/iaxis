<%/*
*  Fichero: axisman003.jsp
*
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
                if(eval("${empty __formdata.NUMEROFOLIO}")){
                    f_abrir_axisman001();
                }
            }
            
            function f_aceptar_modal(pantalla){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axisman003.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
            
            function f_aceptar_modal(pantalla, param){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axisman003.do?"+param, "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
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
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisman003", "cancelar", document.miForm, "_self");            
            }

        
            function f_limpiarForm(){
                    objDom.setValorPorId("CMETMOV","");
            }
            
                      
             function f_abrir_axisman001(){
               f_abrir_modal("axisman001",null,"&CONDICION=INTERMEDIARIOS");
               //  f_abrir_modal('axisman001',null,"&CONDICION=INTERMEDIARIOS");
                 f_limpiarForm();
            }  
            
            function f_cerrar_axisman001(){
                objUtiles.cerrarModal("axisman001");
            }
            
            function f_aceptar_axisman001(CODMANDATO,NUMEROFOLIO,CODIGOBANCO,CUENTABANCARIA,COBRADORBANC,CODTIPOTARJETA,FVENCIM){
                if (!objUtiles.estaVacio(NUMEROFOLIO)) {
                    objUtiles.cerrarModal("axisman001");
                    document.miForm.NUMEROFOLIO.value= NUMEROFOLIO;
                    objUtiles.ejecutarFormulario("axis_axisman003.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            } 
            
            
                      
              function f_borrar(ID){
               if ( objDom.getValorPorId("GUARDADO") =="0"){
                    alert("<axis:alt f="axisman003" c="AVISO" lit="180121" />");
                    return false;
                }
                objAjax.invokeAsyncCGI("axis_axisman003.do?", callbackAjaxBorrarMp, "operation=delete&NUMLIN="+ID,
                                   this, objJsMessages.jslit_cargando);
            }
            
            function callbackAjaxBorrarMp(ajaxResponseText){
            objUtiles.ejecutarFormulario ("axis_axisman003.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);    
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
            
           function f_gestionmandato(){
               objUtiles.ejecutarFormulario("axis_axisman002.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
           }
           
            function f_aceptar_axisfileupload(){
                objUtiles.cerrarModal("axisfileupload");
                objUtiles.ejecutarFormulario("axis_axisman003.do", "upload_file", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
           
            function f_anadir_documentacion() { // Añadir documentación
                var params = "&ORIGEN=GENERICO";
                objUtiles.abrirModal("axisfileupload", "src", "modal_axisfileupload.do?operation=form"+params);
            }

        </script>
</head>
<body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisfileupload|<axis:alt f="axisman003" c="TIT_AXISFILEUPLOAD" lit="1000614"/></c:param>
    </c:import>

    <form name="miForm" action="axis_axisman003.do" method="POST">
    <input type="hidden" id="operation" name="operation" value=""/>
    <input type="hidden" id="CMANDATO" name="CMANDATO" value="${__formdata.CMANDATO}"/>
    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="formulario"><axis:alt c="form" f="axisman003" lit="9906610"/></c:param>
        <c:param name="producto"><axis:alt c="form" f="axisman003" lit="9906571"/> - <axis:alt c="form" f="axisman003" lit="102239"/></c:param>
        <c:param name="form">axisman003</c:param>
    </c:import> 
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisman001|<axis:alt f="axisman001" c="MODAL_axisman001" lit="109142"/> <axis:alt f="axisman010" c="MODAL_axisman001" lit="9906588"/></c:param>
    </c:import>
    
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>
         <div class="separador">&nbsp;</div>
         <div class="titulo">
            <img src="images/flecha.gif"/>
            <axis:alt f="axisman003" c="DETALLE" lit="9001754"/> <axis:alt f="axisman003" c="DATOS" lit="9906597"/>
            <img border="0" src="images/find.gif" onclick="f_abrir_axisman001()" style="cursor:pointer"/>
         </div>
         
        <table class="seccion">
        <tr>
          <axis:visible c="DSP_DATOSMANDATO_parent" f="axisman003"> 
            <td class="campocaja">
                <div style="float:left;">
                <img src="images/mes.gif" id="DSP_DATOSMANDATO_parent" onclick="objEstilos.toggleDisplay('DSP_DATOSMANDATO', this)" style="cursor:pointer"/> 
                <b> <axis:alt f="axisman003" c="DETALLE" lit="9001754"/> <axis:alt f="axisman003" c="DATOS" lit="9906597"/></b> <axis:alt f="axisman003" c="NUMEROFOLIO" lit="9906602"/>: ${__formdata.NUMEROFOLIO}
                </div>
                <div style="float:right;" id="DATOSMANDATO"></div>
                <div class="seccion_suplementos" id="SECCION_DATOSMANDATO"></div>
                <div style="clear:both;">
                <hr class="titulo">
                </div> 
            </td>
             </axis:visible>   
        </tr>
        
          <axis:visible c="DSP_DATOSMANDATO_children" f="axisman003"> 
     
        <tr id="DSP_DATOSMANDATO_children" style="display:none">
            <td align="left" >
                 <table class="seccion" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="left" >
                            <table class="area" align="center">
                            <tr>
                                <th style="width:10%;"></th>
                                <th style="width:10%;"></th>
                                <th style="width:3%;"></th>
                                <th style="width:11%;"></th>
                                <th style="width:11%;"></th>
                                <th style="width:11%;"></th>
                                <th style="width:11%;"></th>
                                <th style="width:11%;"></th>
                                <th style="width:11%;"></th>
                                <th style="width:11%;"></th>
                            </tr>  
                            <tr>
                                <td class="titulocaja" colspan="2">
                                <axis:ocultar f="axisman003" c="label_DDEUDOR" dejarHueco="false">
                                   <b id="label_DDEUDOR" ><axis:alt f="axisman003" c="DDEUDOR" lit="9903661"/> <axis:alt f="axisman003" c="DDEUDOR" lit="9906590"/></b>
                                </axis:ocultar>
                                </td>     
                                <td></td>
                                <td class="titulocaja" colspan="4">
                                <axis:ocultar f="axisman003" c="label_NDEUDOR" dejarHueco="false">
                                   <b id="label_NDEUDOR" ><axis:alt f="axisman003" c="NDEUDOR" lit="105940"/> <axis:alt f="axisman003" c="NDEUDOR" lit="9906590"/></b>
                                </axis:ocultar>
                                </td>                              
                            </tr>
                            <tr>                               
                                <td class="campocaja" colspan="2">
                                <axis:ocultar f="axisman003" c="DDEUDOR" dejarHueco="false">
                                    <input type="text" class="campo campotexto" value="${__formdata.DDEUDOR}" name="DDEUDOR" id="DDEUDOR" 
                                           title="<axis:alt f="axisman003" c="DDEUDOR" lit="9903661"/> <axis:alt f="axisman003" c="DDEUDOR" lit="9906590"/>"
                                           size="15" readonly="true"/>
                                            </axis:ocultar>
                                </td>
                                <td></td>
                                <td class="campocaja" colspan="4">
                                <axis:ocultar f="axisman003" c="NDEUDOR" dejarHueco="false">
                                    <input type="text" class="campo campotexto" value="${__formdata.NDEUDOR}" name="NDEUDOR" id="NDEUDOR" 
                                           title="<axis:alt f="axisman003" c="NDEUDOR" lit="105940"/> <axis:alt f="axisman003" c="NDEUDOR" lit="9906590"/>"
                                           size="15" readonly="true"/>
                                           </axis:ocultar>
                                </td>                                                           
                            </tr>
                            <tr>
                                <td class="titulocaja" colspan="2">
                                  <axis:ocultar f="axisman003" c="label_DMANDANTE" dejarHueco="false">
                                   <b id="label_DMANDANTE" ><axis:alt f="axisman003" c="DMANDANTE" lit="9903661"/> <axis:alt f="axisman003" c="DMANDANTE" lit="9906591"/></b>
                                    </axis:ocultar>
                                </td>                           
                                <td></td>
                                <td class="titulocaja" colspan="4">
                                 <axis:ocultar f="axisman003" c="label_NMANDANTE" dejarHueco="false">
                                   <b id="label_NMANDANTE" ><axis:alt f="axisman003" c="NMANDANTE" lit="105940"/> <axis:alt f="axisman003" c="NMANDANTE" lit="9906591"/></b>
                                 </axis:ocultar>
                                </td>    
                                <td class="titulocaja" colspan="2">
                                 <axis:ocultar f="axisman003" c="label_TELEFONOS" dejarHueco="false">
                                   <b id="label_TELEFONOS" ><axis:alt f="axisman003" c="TELEFONOS" lit="9906647"/></b>
                                 </axis:ocultar>
                                </td>   
                            </tr>
                            <tr>
                                <td class="campocaja" colspan="2">
                                   <axis:ocultar f="axisman003" c="DMANDANTE" dejarHueco="false">
                                    <input type="text" class="campo campotexto" value="${__formdata.DMANDANTE}" name="DMANDANTE" id="DMANDANTE" 
                                           title="<axis:alt f="axisman003" c="DMANDANTE" lit="9903661"/> <axis:alt f="axisman003" c="DMANDANTE" lit="9906591"/>"
                                           size="15" readonly="true"/>
                                           </axis:ocultar>
                                </td>
                                <td></td>
                                <td class="campocaja" colspan="4">
                                 <axis:ocultar f="axisman003" c="NMANDANTE" dejarHueco="false">
                                    <input type="text" class="campo campotexto" value="${__formdata.NMANDANTE}" name="NMANDANTE" id="NMANDANTE" 
                                           title="<axis:alt f="axisman003" c="NMANDANTE" lit="105940"/> <axis:alt f="axisman003" c="NMANDANTE" lit="9906591"/>"
                                           size="15" readonly="true"/>
                                           </axis:ocultar>
                                </td>   
                                <td class="campocaja" colspan="2">
                                 <axis:ocultar f="axisman003" c="TELEFONOS" dejarHueco="false">
                                   
                                    <input type="text" class="campo campotexto" value="${__formdata.TELEFONOS}" name="TELEFONOS" id="TELEFONOS" 
                                           title="<axis:alt f="axisman003" c="TELEFONOS" lit="9906647"/>"
                                           style="width: 120px;" readonly="true"/>
                                </axis:ocultar>
                                </td> 
                           </tr>
                           <tr>
                                <td class="titulocaja" colspan="2">
                                  <axis:ocultar f="axisman003" c="label_CFORPAG" dejarHueco="false">
                                    <b id="label_CFORPAG" ><axis:alt f="axisman003" c="CFORPAG" lit="9902938"/></b>
                                  </axis:ocultar>
                                </td>
                                <td>
                                </td>
                                
                                <axis:ocultar f="axisman003" c="CBANCO" dejarHueco="false">
                                  <td class="titulocaja" id="td_CBANCO">
                                     <b id="label_CBANCO"><axis:alt f="axisman003" c="CBANCO" lit="9000964"/></b>
                                  </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisman003" c="CNCTACTE" dejarHueco="false">
                                  <td class="titulocaja" id="td_CNCTACTE" colspan="2"> 
                                     <b id="label_CNCTACTE"><axis:alt f="axisman003" c="CNCTACTE" lit="9906592"/></b>
                                  </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisman003" c="CTIPCC" dejarHueco="false">
                                  <td class="titulocaja" id="td_CTIPCC">
                                     <b id="label_CTIPCC"><axis:alt f="axisman003" c="CTIPCC" lit="9902671"/></b>
                                  </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisman003" c="CNUMTAR" dejarHueco="false">
                                  <td class="titulocaja" id="td_CNUMTAR" colspan="2"> 
                                     <b id="label_CNUMTAR"><axis:alt f="axisman003" c="CNUMTAR" lit="9906593"/></b>
                                  </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisman003" c="CINSEMI" dejarHueco="false">
                                  <td class="titulocaja" id="td_CINSEMI" colspan="2"> 
                                     <b id="label_CINSEMI"><axis:alt f="axisman003" c="CINSEMI" lit="9906594"/></b>
                                  </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisman003" c="FVENCIM" dejarHueco="false">
                                  <td class="titulocaja" id="td_FVENCIM" colspan="2"> 
                                     <b id="label_FVENCIM"><axis:alt f="axisman003" c="FVENCIM" lit="100885"/></b>
                                  </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <td class="campocaja" colspan="2">
                                    <axis:ocultar f="axisman003" c="CMETMOV" dejarHueco="false">
                                    <input type="hidden" value="${__formdata.CMETMOV}" name="CMETMOV" id="CMETMOV"/>
                                 </axis:ocultar>
                                 <axis:ocultar f="axisman003" c="CFORPAG" dejarHueco="false">
                                    <input type="text" class="campo campotexto" value="${__formdata.CFORPAG}" name="CFORPAG" id="CFORPAG" 
                                           title="<axis:alt f="axisman003" c="CFORPAG" lit="9902938"/>"
                                           size="15" readonly="true"/>
                                           </axis:ocultar>
                                </td> 
                                <td>
                                </td>
                                
                                <axis:ocultar f="axisman003" c="CBANCO" dejarHueco="true">
                                  <td class="campocaja" id="td_CBANCO">
                                      <input type="text" class="campo campotexto" value="${__formdata.CBANCO}" name="CBANCO" id="CBANCO" 
                                             title="<axis:alt f="axisman003" c="CBANCO" lit="9000964"/>"
                                             size="15" readonly="true"/>
                                  </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisman003" c="CNCTACTE" dejarHueco="true">
                                  <td class="campocaja" id="td_CNCTACTE" colspan="2">
                                      <input type="text" class="campo campotexto" value="${__formdata.CNCTACTE}" name="CNCTACTE" id="CNCTACTE" 
                                             title="<axis:alt f="axisman003" c="CNCTACTE" lit="9906592"/>"
                                             size="15" readonly="true"/>
                                  </td> 
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisman003" c="CTIPCC" dejarHueco="false">
                                  <td class="campocaja" id="td_CTIPCC">
                                      <input type="text" class="campo campotexto" value="${__formdata.CTIPCC}" name="CTIPCC" id="CTIPCC" 
                                             title="<axis:alt f="axisman003" c="CTIPCC" lit="9902671"/>"
                                             size="15" readonly="true"/>
                                  </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisman003" c="CNUMTAR" dejarHueco="false">
                                  <td class="campocaja" id="td_CNUMTAR" colspan="2"> 
                                      <input type="text" class="campo campotexto" value="${__formdata.CNUMTAR}" name="CNUMTAR" id="CNUMTAR" 
                                             title="<axis:alt f="axisman003" c="CNUMTAR" lit="9906593"/>"
                                             size="15" readonly="true"/>
                                  </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisman003" c="CINSEMI" dejarHueco="false">
                                  <td class="campocaja" id="td_CINSEMI" colspan="2"> 
                                      <input type="text" class="campo campotexto" value="${__formdata.CINSEMI}" name="CINSEMI" id="CINSEMI" 
                                             title="<axis:alt f="axisman003" c="CINSEMI" lit="9906594"/>"
                                             size="15" readonly="true"/>
                                  </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisman003" c="FVENCIM" dejarHueco="false">
                                  <td class="campocaja" id="td_FVENCIM">
                                      <input type="text" class="campo campotexto" value="${__formdata.FVENCIM}" name="FVENCIM" id="FVENCIM" 
                                             title="<axis:alt f="axisman003" c="FVENCIM" lit="9000495"/>"
                                             style="width: 50px;" readonly="true"/>
                                  </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <td class="titulocaja">
                                <axis:ocultar f="axisman003" c="label_NUMEROFOLIO" dejarHueco="false">
                                     <b id="label_NUMEROFOLIO"><axis:alt f="axisman003" c="NUMEROFOLIO" lit="9906602"/></b>
                                  </axis:ocultar>
                                </td>
                                <td class="titulocaja">
                                  <axis:ocultar f="axisman003" c="label_CFECMAN" dejarHueco="false">
                                     <b id="label_CFECMAN" ><axis:alt f="axisman003" c="CFECMAN" lit="9906603"/></b>
                                 </axis:ocultar>
                                </td>
                                <td>
                                </td>
                                <td class="titulocaja"> 
                                    <axis:ocultar f="axisman003" c="label_CSUCURSAL" dejarHueco="false">
                                   <b id="label_CSUCURSAL"><axis:alt f="axisman003" c="CSUCURSAL" lit="9002202"/></b>
                                     </axis:ocultar>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td class="titulocaja">
                                  <axis:ocultar f="axisman003" c="label_FFINVIG" dejarHueco="false">
                                     <b id="label_FFINVIG" ><axis:alt f="axisman003" c="FFINVIG" lit="9000717"/></b>
                                 </axis:ocultar>
                                </td>
                            </tr>
                            <tr>
                                <td class="campocaja">
                                  <axis:ocultar f="axisman003" c="NUMEROFOLIO" dejarHueco="false">
                                    <input type="text" class="campo campotexto" value="${__formdata.NUMEROFOLIO}" name="NUMEROFOLIO" id="NUMEROFOLIO" 
                                           title="<axis:alt f="axisman003" c="NUMEROFOLIO" lit="9906602"/>"
                                           size="15" readonly="true"/>
                                           </axis:ocultar>
                                </td>
                                <td class="campocaja">
                                  <axis:ocultar f="axisman003" c="CFECMAN" dejarHueco="false">
                                    <input type="text" class="campo campotexto" value="<fmt:formatDate value="${__formdata.CFECMAN}" pattern="dd/MM/yyyy"/>" name="CFECMAN" id="CFECMAN" 
                                           title="<axis:alt f="axisman003" c="CFECMAN" lit="9906603"/>"
                                           size="15" readonly="true"/>
                                           </axis:ocultar>
                                </td>
                                <td>
                                </td>
                                <td class="campocaja" colspan="3">
                                <axis:ocultar f="axisman003" c="CSUCURSAL" dejarHueco="false">
                                    <input type="text" class="campo campotexto" value="${__formdata.CSUCURSAL}" name="CSUCURSAL" id="CSUCURSAL" 
                                           title="<axis:alt f="axisman003" c="CSUCURSAL" lit="9002202"/>"
                                           size="15" readonly="true"/>
                                   </axis:ocultar>
                                </td> 
                                <td class="campocaja">
                                  <axis:ocultar f="axisman003" c="FFINVIG" dejarHueco="false">
                                    <input type="text" class="campo campotexto" value="<fmt:formatDate value="${__formdata.FFINVIG}" pattern="dd/MM/yyyy"/>" name="FFINVIG" id="FFINVIG" 
                                           title="<axis:alt f="axisman003" c="FFINVIG" lit="9000717"/>"
                                           size="15" readonly="true"/>
                                           </axis:ocultar>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr><td></td></tr>
                <tr>
                    <td>
                    <table class="area" align="center">
                        <tr><th></th></tr>
                        <tr><td>  <axis:ocultar f="axisman003" c="DOCUMENTOS" dejarHueco="false"><b><axis:alt f="axisman003" c="DOCUMENTOS" lit="9001358"/></b></axis:ocultar>  </td></tr>
                        <tr>
                            <td>
                            
                    
                <c:set var="title0"><axis:alt f="axisman003" c="NOMBREDOC" lit="9903661"/></c:set>
                <c:set var="title1"><axis:alt f="axisman003" c="FDOCCREA" lit="9001910"/></c:set>
                <c:set var="title2"><axis:alt f="axisman003" c="DOCEDITA" lit="9901356"/></c:set>
                <c:set var="title3"><axis:alt f="axisman003" c="IDDOCUMENTO" lit="9902311"/></c:set>
                <div class="displayspace">
                    <display:table name="${__formdata.documentos}" id="documento" export="false" class="dsptgtable" pagesize="-1" defaultsort="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                     requestURI="">
                        <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="${title0}" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">
                                    <c:choose>
                                        <c:when test="${empty documento.NOMBREDOC}">
                                            <axis:alt f="axisman003" c="NOMBREDOC" lit="9906597"/> ${__formdata.NUMEROFOLIO}
                                        </c:when>
                                        <c:otherwise>
                                            ${documento.NOMBREDOC}
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </display:column>
                            <display:column title="${title1}" sortable="false" headerClass="sortable" media="html" autolink="false" style="width: 100px">
                                <div class="dspDate"><fmt:formatDate value="${documento.FDOCCREA}" pattern="dd/MM/yyyy"/></div>
                            </display:column>
                            <display:column title="${title2}" sortable="false" headerClass="sortable" media="html" autolink="false" style="width: 60px">
                                <div class="dspIcons" id="DOCEDITA">
                                    <c:if test="${documento.DOCEDITA == 1 and __formdata.PERMGESTION == 1}">
                                        <img border="0"
                                        alt="<axis:alt f="axisman003" c="DOCEDITA" lit="9901356"/>"
                                        title1="<axis:alt f="axisman003" c="DOCEDITA" lit="9901356"/>"
                                        src="images/lapiz.gif" width="15px" height="15px" style="cursor:pointer;"
                                        onclick="javascript:f_anadir_documentacion();"/>
                                    </c:if>
                                </div>
                            </display:column>
                            <display:column title="${title3}" sortable="false" headerClass="sortable" media="html" autolink="false" style="width: 60px">
                                <div class="dspIcons" id="IDDOCUMENTO">
                                    <c:if test="${not empty documento.IDDOCUMENTO}">
                                        <img border="0"
                                        alt="<axis:alt f="axisman003" c="IDDOCUMENTO" lit="9902311"/>"
                                        title1="<axis:alt f="axisman003" c="IDDOCUMENTO" lit="9902311"/>"
                                        src="images/new.gif" width="15px" height="15px" style="cursor:pointer;"
                                        onclick="javascript:f_ver_doc('${documento.IDDOCUMENTO}');"/>
                                    </c:if>
                                </div>
                            </display:column>
                     </display:table>
                </div>

                    
                            </td>
                        </tr>
                    </table
                    </td>
                </tr>
            </table>    
            </td> 
        </tr>
       
          </axis:visible>       
         
        <axis:visible c="DSP_ESTADO_parent" f="axisman003"> 
        <tr>
            <td class="campocaja">
                <div style="float:left;">
                <img src="images/mes.gif" id="DSP_ESTADO_parent" onclick="objEstilos.toggleDisplay('DSP_ESTADO', this)" style="cursor:pointer"/> 
                <b> <axis:alt f="axisman003" c="ESTADO" lit="9905523"/></b> ${__formdata.estadoActual}
                <c:if test="${not empty __formdata.subEstadoActual}">- <axis:alt f="axisman003" c="SUBESTA" lit="103218"/>: ${__formdata.subEstadoActual}</c:if>
                </div>
                <div style="float:right;" id="ESTADO"></div>
                <div class="seccion_suplementos" id="SECCION_ESTADO"></div>
                <div style="clear:both;">
                <hr class="titulo">
                </div> 
            </td>
        </tr>
        </axis:visible>  
         <axis:visible c="DSP_ESTADO_children" f="axisman003"> 
        <tr id="DSP_ESTADO_children" style="display:none">
            <td class="campocaja" >
                <c:set var="title0"><axis:alt f="axisman003" c="ESTADO" lit="9905523"/></c:set>
                <c:set var="title1"><axis:alt f="axisman003" c="SUBESTA" lit="103218"/></c:set>
                <c:set var="title2"><axis:alt f="axisman003" c="FCANEST" lit="100562"/></c:set>
                <c:set var="title3"><axis:alt f="axisman003" c="UCANEST" lit="100894"/></c:set>
                <div class="displayspace">
                    <display:table name="${__formdata.estados}" id="estado" export="false" class="dsptgtable" pagesize="-1" defaultsort="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                     requestURI="axis_axisman003.do?paginar=false&subpantalla=DSP_ESTADO">
                        <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="${title0}" sortable="true" sortProperty="ESTADO" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">${estado.ESTADO}</div>
                            </display:column>
                            <display:column title="${title1}" sortable="true" sortProperty="SUBESTA" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">${estado.SUBESTA}</div>
                            </display:column>
                            <display:column title="${title2}" sortable="true" sortProperty="FCANEST" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspDate"><fmt:formatDate value="${estado.FCANEST}" pattern="dd/MM/yyyy"/></div>
                            </display:column>
                            <display:column title="${title3}" sortable="true" sortProperty="UCANEST" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">${estado.UCANEST}</div>
                            </display:column>
                     </display:table>
                </div>
            </td>
        </tr>
         </axis:visible>  
         
            <axis:visible c="DSP_POLIZAS_parent" f="axisman003"> 
        <tr>
            <td class="campocaja">
                <div style="float:left;">
                <img src="images/mes.gif" id="DSP_POLIZAS_parent" onclick="objEstilos.toggleDisplay('DSP_POLIZAS', this)" style="cursor:pointer"/> 
                <b> <axis:alt f="axisman003" c="POLIZAS" lit="9902164"/></b> 
                </div>
                <div style="float:right;" id="POLIZAS"></div>
                <div class="seccion_suplementos" id="SECCION_POLIZAS"></div>
                <div style="clear:both;">
                <hr class="titulo">
                </div> 
            </td>
        </tr>
          </axis:visible>
              <axis:visible c="DSP_POLIZAS_children" f="axisman003"> 
        <tr id="DSP_POLIZAS_children" style="display:none">
            <td class="campocaja" >
                <c:set var="title0"><axis:alt f="axisman003" c="POLIZA" lit="9001875"/></c:set>
                <c:set var="title1"><axis:alt f="axisman003" c="ITEM" lit="9905286"/></c:set>
                <c:set var="title2"><axis:alt f="axisman003" c="ESTADO" lit="9906721"/></c:set>
                <c:set var="title3"><axis:alt f="axisman003" c="ESTPOL" lit="9905523"/></c:set>
                <c:set var="title4"><axis:alt f="axisman003" c="FASIGNA" lit="9906640"/></c:set>
                <c:set var="title5"><axis:alt f="axisman003" c="UASIGNA" lit="9906641"/></c:set>
                <c:set var="title6"><axis:alt f="axisman003" c="FDESASI" lit="9906642"/></c:set>
                <c:set var="title7"><axis:alt f="axisman003" c="UDESASI" lit="9906643"/></c:set>
                <div class="displayspace">
                    <display:table name="${__formdata.polizas}" id="poliza" export="false" class="dsptgtable" pagesize="-1" defaultsort="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                     requestURI="axis_axisman003.do?paginar=false&subpantalla=DSP_POLIZAS">
                        <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="${title0}" sortable="true" sortProperty="POLIZA" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">${poliza.POLIZA}</div>
                            </display:column>
                            <display:column title="${title1}" sortable="true" sortProperty="ITEM" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">${poliza.ITEM}</div>
                            </display:column>
                            <display:column title="${title2}" sortable="true" sortProperty="ESTADO" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">${poliza.ESTADO}</div>
                            </display:column>
                            <display:column title="${title3}" sortable="true" sortProperty="ESTPOL" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">${poliza.ESTPOL}</div>
                            </display:column>
                            <display:column title="${title4}" sortable="true" sortProperty="FASIGNA" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText"><fmt:formatDate value="${poliza.FASIGNA}" pattern="dd/MM/yyyy"/></div>
                            </display:column>
                            <display:column title="${title5}" sortable="true" sortProperty="UASIGNA" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">${poliza.UASIGNA}</div>
                            </display:column>
                            <display:column title="${title6}" sortable="true" sortProperty="FDESASI" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText"><fmt:formatDate value="${poliza.FDESASI}" pattern="dd/MM/yyyy"/></div>
                            </display:column>
                            <display:column title="${title7}" sortable="true" sortProperty="UDESASI" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">${poliza.UDESASI}</div>
                            </display:column>
                     </display:table>
                </div>
            </td>
        </tr>
          </axis:visible>
           <axis:visible c="DSP_GESTIONES_parent" f="axisman003"> 
        <tr>
            <td class="campocaja">
                <div style="float:left;">
                <img src="images/mes.gif" id="DSP_GESTIONES_parent" onclick="objEstilos.toggleDisplay('DSP_GESTIONES', this)" style="cursor:pointer"/> 
                <b> <axis:alt f="axisman003" c="GESTIONES" lit="9902550"/></b>
                <c:if test="${not empty __formdata.accionActual}"> <axis:alt f="axisman003" c="ACCION" lit="9000844"/>: ${__formdata.accionActual}</c:if>
                <c:if test="${not empty __formdata.fechaRevision}"> - <axis:alt f="axisman003" c="FREVISI" lit="105403"/>: <fmt:formatDate value="${__formdata.fechaRevision}" pattern="dd/MM/yyyy"/></c:if>
                </div>
                <div style="float:right;" id="GESTIONES"></div>
                <div class="seccion_suplementos" id="SECCION_GESTIONES"></div>
                <div style="float:right;">
                  <c:if test="${__formdata.PERMGESTION == 1}">
                    <img border="0" alt="<axis:alt f="axisctr003" c="GESTION" lit="9000552"/>" title="<axis:alt f="axisctr003" c="GESTION" lit="9000552"/>" src="images/new.gif" style="cursor:pointer;" onclick="f_gestionmandato();"/>
                  </c:if>
                </div>
                <div style="clear:both;">
                <hr class="titulo">
                </div> 
            </td>
        </tr>
          </axis:visible>
             <axis:visible c="DSP_GESTIONES_children" f="axisman003"> 
        <tr id="DSP_GESTIONES_children" style="display:none">
            <td class="campocaja">
                <c:set var="title0"><axis:alt f="axisman003" c="FACCION" lit="9903927"/></c:set>
                <c:set var="title1"><axis:alt f="axisman003" c="ACCION" lit="9000844"/></c:set>
                <c:set var="title2"><axis:alt f="axisman003" c="MOTRECH" lit="9906608"/></c:set>
                <c:set var="title3"><axis:alt f="axisman003" c="COMENT" lit="9902597"/></c:set>
                <div class="displayspaceMaximo">
                    <display:table name="${__formdata.gestiones}" id="gestion" export="false" class="dsptgtable" pagesize="-1" defaultsort="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                     requestURI="axis_axisman003.do?paginar=false&subpantalla=DSP_GESTIONES">
                        <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="${title0}" sortable="true" sortProperty="FACCION" headerClass="sortable" media="html" autolink="false" style="width: 100px">
                                <div class="dspText"><fmt:formatDate value="${gestion.FACCION}" pattern="dd/MM/yyyy"/></div>
                            </display:column>
                            <display:column title="${title1}" sortable="true" sortProperty="ACCION" headerClass="sortable" media="html" autolink="false" style="width: 150px">
                                <div class="dspText">${gestion.ACCION}</div>
                            </display:column>
                            <display:column title="${title2}" sortable="true" sortProperty="MOTRECH" headerClass="sortable" media="html" autolink="false" style="width: 200px">
                                <div class="dspText">${gestion.MOTRECH}</div>
                            </display:column>
                            <display:column title="${title3}" sortable="true" sortProperty="COMENT" headerClass="sortable" media="html" autolink="false" style="word-break:break-all;">
                                <div class="dspText">${gestion.COMENT}</div>
                            </display:column>
                     </display:table>
                </div>
            </td>
        </tr>
        </axis:visible>
       </table>
      </td>
     </tr>
    </table>
    </form>    
    <c:import url="../include/botonera_nt.jsp">
       <c:param name="f">axisman003</c:param>
       <c:param name="__botones"><axis:ocultar f="axisman003" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar></c:param>
    </c:import>
    <c:import url="../include/mensajes.jsp" />    
</body>
</html>


