<%/* Revision:# PuGJU0W7sO4UVuKoUXYs5A== # */%>
<%
/**
*  Fichero: axisadm058.jsp
*  @author <a href = "mailto:icanada@csi-ti.com">Ivan Canada</a>  
*	Consulta Cobradores Bancarios
*  Fecha: 30/09/2010
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt c="TIT_FORM" f="axisadm058" lit="100681"/></title>
        
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload(){
                objEstilos.toggleDisplay('DSP_COBRADOR', document.getElementById("DSP_COBRADOR_parent"));
                f_cargar_propiedades_pantalla(); 
               
                <c:if test="${empty __formdata.CCOBBAN}">                  
                        var ok = "${__formdata.OK}";        
                        if (objUtiles.estaVacio(ok)){
                                f_abrir_axisadm061();
                        }                            
                </c:if>
            }
                     
            function f_seleccionar_indice(posicion) {    
                objDom.setValorPorId ("INDICE",posicion);                   
                objUtiles.ejecutarFormulario("axis_axisadm058.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
           
            function f_but_cancelar() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm058", "cancelar", document.miForm, "_self");                  
            }
            
            function f_formatdate(entrada,title){
                var jDate = new JsFecha();
                if(entrada.value.length>0){
                    entrada.value=jDate.formateaFecha(entrada.value);
                
                    if(jDate.validaFecha(entrada.value)){
                        entrada.value=jDate.formateaFecha(entrada.value);
                    }else{
                        alert("<axis:alt c="aler" f="axisadm058" lit="1000421"/>");
                    }
                }
            }       
            
            function f_imprimir_fitxer(pfitxer){            
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?mantenerExtension=mantenerExtension&mimetype="+escape("text/xml")+"&operation=tunnel&file="+pfitxer,600,200);
            }  
            
            function f_but_9000569(){                      
                 var FVAL_BUS = objDom.getValorPorId("FVALORA");                 
                 objUtiles.ejecutarFormulario("axis_axisadm058.do?FVAL_BUS="+FVAL_BUS, "montar_fichero", document.miForm, "_self", objJsMessages.jslit_cargando);                               
            }
            
            function f_modificar_cobrador() {
               var CCOBBAN = '${__formdata.listaCobradores[0].OB_IAX_COBBANCARIO.CCOBBAN}';
               var PARAMS = "&CCOBAN_BUS="+CCOBBAN+
                         "&MODIF="+"true"; 
               <c:if test="${empty __formdata.MODIF_CUENTA_MODIF}">                  
                         var PARAMS = "&CCOBAN_BUS="+CCOBBAN+
                         "&MODIF="+"false"; 
                </c:if>                    
                                                     
                            
               objUtiles.abrirModal("axisadm059", "src", "modal_axisadm059.do?operation=form"+PARAMS); 
            }
            
            function f_nuevo_cobradorsel() {
                 var CCOBBAN = '${__formdata.listaCobradores[0].OB_IAX_COBBANCARIO.CCOBBAN}';
                 var PARAMS = "&CCOBAN_BUS="+CCOBBAN+                                              
                              "&MODIF="+"true";                            
                            
               objUtiles.abrirModal("axisadm060", "src", "modal_axisadm060.do?operation=form"+PARAMS); 
            }
            
            function f_modif_cobradorsel() {
                var NORDEN =  '${__formdata.listaCobradores_sel[__formdata.INDICE].OB_IAX_COBBANCARIOSEL.NORDEN}';                 
                var CCOBBAN = '${__formdata.listaCobradores[0].OB_IAX_COBBANCARIO.CCOBBAN}';
                
                var PARAMS = "&CCOBAN_BUS="+CCOBBAN+   
                              "&NORDEN_BUS="+NORDEN+       
                              "&MODIF="+"false";                            
                            
                objUtiles.abrirModal("axisadm060", "src", "modal_axisadm060.do?operation=form"+PARAMS); 
            }
            
            function f_modif_cobradorsel_lista(NORDEN1,CCOBBAN1) {
                var NORDEN =  NORDEN1;                 
                var CCOBBAN = CCOBBAN1;               
                var PARAMS = "&CCOBAN_BUS="+CCOBBAN+   
                              "&NORDEN_BUS="+NORDEN+       
                              "&MODIF="+"false";                            
                            
               objUtiles.abrirModal("axisadm060", "src", "modal_axisadm060.do?operation=form"+PARAMS); 
            }

            /*******************************************************************************************/
            /***************************************** MODAL *******************************************/
            /*******************************************************************************************/
            function f_cerrar_axisadm061() {
                objUtiles.cerrarModal("axisadm061");
            }
            
            function f_abrir_axisadm061(){
                objUtiles.abrirModal("axisadm061", "src", "modal_axisadm061.do?operation=form"); 
            }
            
            
            function f_cerrar_axisadm060() {
                objUtiles.cerrarModal("axisadm060");
            }            
            
            function f_buscar(CCOBBAN) {
                f_cerrar_axisadm061();
                objDom.setValorPorId("CCOBBAN",CCOBBAN);              
                objUtiles.ejecutarFormulario("axis_axisadm058.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);                
            }            
            
            function f_cerrar_axisadm059() {
                objUtiles.cerrarModal("axisadm059");
            }
            
            function f_aceptar_axisadm059() {
                f_cerrar_axisadm059();
                objUtiles.ejecutarFormulario("axis_axisadm058.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);                
            }
            
            
            function f_aceptar_axisadm060() {
                f_cerrar_axisadm060();
                objUtiles.ejecutarFormulario("axis_axisadm058.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);                
            }
            
        </script>
        
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
      
        <input type="hidden" name="operation"/>     
        <input type="hidden" name="INDICE" id="INDICE"  value="${__formdata.INDICE}" id="INDICE"/>
        <input type="hidden" name="CEMPRES" id="CEMPRES"  value="${__formdata.CEMPRES}" id="CEMPRES"/>
        <input type="hidden" name="SPRODUC" id="SPRODUC"  value="${__formdata.SPRODUC}" id="SPRODUC"/>
        <input type="hidden" name="NPOLIZA" id="NPOLIZA"  value="${__formdata.NPOLIZA}" id="NPOLIZA"/>
        <input type="hidden" name="NCERTIF" id="NCERTIF"  value="${__formdata.NCERTIF}" id="NCERTIF"/>
		<input type="hidden" name="MODIF_CUENTA_MODIF" id="MODIF_CUENTA_MODIF" <axis:atr f="axisadm058" c="MODIF_CUENTA_MODIF"/> />
        
        
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt c="titulo" f="axisadm058" lit="9901513"/></c:param>
                <c:param name="formulario"><axis:alt c="formulario" f="axisadm058" lit="9901513"/></c:param>
                <c:param name="form">axisadm058</c:param>
        </c:import>
        
         <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt c="titulo61" f="axisadm058" lit="9901515"/></c:param>          
            <c:param name="nid" value="axisadm061" />
        </c:import>
        
         <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt c="titulo59" f="axisadm058" lit="9901531"/></c:param>
            <c:param name="nid" value="axisadm059" />
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt c="titulo60" f="axisadm058" lit="9901535"/></c:param>
            <c:param name="nid" value="axisadm060" />
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
           <c:param name="nid_y_titulo">axisimprimir|<axis:alt c="axisimprimir" f="axisadm058" lit="1000205"/>|true</c:param>
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

    <!-- Area de campos  -->
    <div class="separador">&nbsp;</div>
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0"> 
        <tr>
          <td>
          
            <div class="titulo"><img src="images/flecha.gif"/><axis:alt c="flecha" f="axisadm058" lit="9901513" />
            <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisadm061()" style="cursor:pointer"/> </div>
                                                  
            <!--campos-->
             <table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>                            
                               <axis:ocultar f="axisadm058" c="CCOBBAN" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- CCOBBAN -->
                                         <b><axis:alt f="axisadm058" c="CCOBBAN" lit="100879"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>    
                                <axis:ocultar f="axisadm058" c="NCUENTA" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- CCOBBAN -->
                                         <b><axis:alt f="axisadm058" c="NCUENTA" lit="100965"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>    
                                <axis:ocultar f="axisadm058" c="CDOMENT" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- CCOBBAN -->
                                         <b><axis:alt f="axisadm058" c="CDOMENT" lit="9001624"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>    
                                <axis:ocultar f="axisadm058" c="CDOMSUC" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- CCOBBAN -->
                                         <b><axis:alt f="axisadm058" c="CDOMSUC" lit="9002202"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>    
                             </tr>
                             <tr>                             
                                <axis:ocultar f="axisadm058" c="CCOBBAN" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="CCOBBAN" name="CCOBBAN" size="15" style="width:40%"                                                           
                                                           value =  "${__formdata.listaCobradores[0].OB_IAX_COBBANCARIO.CCOBBAN}"
                                                           <axis:atr f="axisadm058" c="CCOBBAN" a="modificable=false"/>/>  
                                    <axis:visible f="axisadm058" c="BT_EDITAR"> 
                                        <img border="0" alt="<axis:alt c="lapiz" f="axisadm058" lit="100002"/>" title1="<axis:alt c="lapiz" f="axisadm058" lit="100002"/>" src="images/lapiz.gif" 
                                                    style="cursor:pointer;" onclick="javascript:f_modificar_cobrador()"/>                                                                                                 
                                    </axis:visible>
                                    </td>                             
                                </axis:ocultar> 
                                <axis:ocultar f="axisadm058" c="NCUENTA" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="NCUENTA" name="NCUENTA" size="15" 
                                                           value =  "<axis:masc f="axisadm058" c="NCUENTA" value="${__formdata.listaCobradores[0].OB_IAX_COBBANCARIO.TTIPBAN}" />"
                                                           <axis:atr f="axisadm058" c="NCUENTA" a="modificable=false"/>/>                      
                                    </td>                             
                                </axis:ocultar>                              
                                <axis:ocultar f="axisadm058" c="CDOMENT" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="CDOMENT" name="CDOMENT" size="15" 
                                                           value =  "${__formdata.listaCobradores[0].OB_IAX_COBBANCARIO.CDOMENT}"
                                                           <axis:atr f="axisadm058" c="CDOMENT" a="modificable=false"/>/>                      
                                    </td>                             
                                </axis:ocultar>
                                <axis:ocultar f="axisadm058" c="CDOMSUC" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="CDOMSUC" name="CDOMSUC" size="15" 
                                                           value =  "${__formdata.listaCobradores[0].OB_IAX_COBBANCARIO.CDOMSUC}"
                                                           <axis:atr f="axisadm058" c="CDOMSUC" a="modificable=false"/>/>                      
                                    </td>                             
                                </axis:ocultar>    
                             </tr>
                              <%-- Seccion 2 --%>
                              <tr>  
                                <axis:ocultar f="axisadm058" c="DESCRIPCION" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- CCOBBAN -->
                                         <b><axis:alt f="axisadm058" c="DESCRIPCION" lit="100588"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>    
                                <axis:ocultar f="axisadm058" c="NPRISEL" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- CCOBBAN -->
                                         <b><axis:alt f="axisadm058" c="NPRISEL" lit="9000574"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar> 
                                <axis:ocultar f="axisadm058" c="TSUFIJO" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- CCOBBAN -->
                                         <b><axis:alt f="axisadm058" c="TSUFIJO" lit="9001734"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>    
                                <axis:ocultar f="axisadm058" c="NNUMNIF" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- CCOBBAN -->
                                         <b><axis:alt f="axisadm058" c="NNUMNIF" lit="105904"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>    
                             </tr>
                             <tr>                             
                                                           
                                <axis:ocultar f="axisadm058" c="DESCRIPCION" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="DESCRIPCION" name="DESCRIPCION" size="15" 
                                                           value =  "${__formdata.listaCobradores[0].OB_IAX_COBBANCARIO.DESCRIPCION}"
                                                           <axis:atr f="axisadm058" c="DESCRIPCION" a="modificable=false"/>/>                      
                                    </td>                             
                                </axis:ocultar>                              
                                <axis:ocultar f="axisadm058" c="NPRISEL" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="NPRISEL" name="NPRISEL" size="15" 
                                                           value =  "${__formdata.listaCobradores[0].OB_IAX_COBBANCARIO.NPRISEL}"
                                                           <axis:atr f="axisadm058" c="NPRISEL" a="modificable=false"/>/>                      
                                    </td>                             
                                </axis:ocultar>
                                <axis:ocultar f="axisadm058" c="TSUFIJO" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="TSUFIJO" name="TSUFIJO" size="15" 
                                                           value =  "${__formdata.listaCobradores[0].OB_IAX_COBBANCARIO.TSUFIJO}"
                                                           <axis:atr f="axisadm058" c="TSUFIJO" a="modificable=false"/>/>                      
                                    </td>                             
                                </axis:ocultar>                                
                                <axis:ocultar f="axisadm058" c="NNUMNIF" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="NNUMNIF" name="NNUMNIF" size="15" 
                                                           value =  "${__formdata.listaCobradores[0].OB_IAX_COBBANCARIO.NNUMNIF}"
                                                           <axis:atr f="axisadm058" c="NNUMNIF" a="modificable=false"/>/>                      
                                    </td>                             
                                </axis:ocultar>  
                             </tr>
                             <%-- Seccion 3 --%>
                              <tr>      
                               <axis:ocultar f="axisadm058" c="TCOBBAN" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- TCOBBAN -->
                                         <b><axis:alt f="axisadm058" c="TCOBBAN" lit="100785"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>                                  
                               <axis:ocultar f="axisadm058" c="PRECIMP" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- PRECIMP -->
                                         <b><axis:alt f="axisadm058" c="PRECIMP" lit="9901651"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>                                  
                                <axis:ocultar f="axisadm058" c="CBAJA" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- CBAJA -->                                    
                                         <b><axis:alt f="axisadm058" c="CBAJA" lit="9901519"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisadm058" c="CAGRUPREC" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- CBAJA -->                                    
                                         <b><axis:alt f="axisadm058" c="CAGRUPREC" lit="9902650"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar> 
                             </tr>
                             <tr>    
                               <axis:ocultar f="axisadm058" c="TCOBBAN" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="TCOBBAN" name="TCOBBAN" size="15" 
                                                           value =  "${__formdata.listaCobradores[0].OB_IAX_COBBANCARIO.TCOBBAN}"
                                                           <axis:atr f="axisadm058" c="TCOBBAN" a="modificable=false"/>/>                      
                                    </td>                             
                               </axis:ocultar>                              
                               <axis:ocultar f="axisadm058" c="PRECIMP" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="PRECIMP" name="PRECIMP" size="15"  style="width:30%"                                                        
                                                           value =  "<fmt:formatNumber pattern='###,##0.00' value='${__formdata.listaCobradores[0].OB_IAX_COBBANCARIO.PRECIMP}'/>"
                                                           <axis:atr f="axisadm058" c="PRECIMP" a="modificable=false"/>/>                      
                                    </td>                             
                                </axis:ocultar>                               
                                <axis:ocultar f="axisadm058" c="CBAJA" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="checkbox" id="CBAJA" name="CBAJA" value="${__formdata.listaCobradores[0].OB_IAX_COBBANCARIO.CBAJA}" <c:if test="${__formdata.listaCobradores[0].OB_IAX_COBBANCARIO.CBAJA == 1}">checked="true"</c:if> onchange="f_onclickCheckbox(this);" 
                                          <axis:atr f="axisadm058" c="CBAJA" a="modificable=false&isinputtext=false"/>/>   
                                        
                                          
                                    </td>                             
                                </axis:ocultar>
                                <axis:ocultar f="axisadm058" c="CAGRUPREC" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="checkbox" id="CAGRUPREC" name="CAGRUPREC" value="${__formdata.listaCobradores[0].OB_IAX_COBBANCARIO.CAGRUPREC}" <c:if test="${__formdata.listaCobradores[0].OB_IAX_COBBANCARIO.CAGRUPREC == 1}">checked="true"</c:if> onchange="f_onclickCheckbox(this);" 
                                          <axis:atr f="axisadm058" c="CAGRUPREC" a="modificable=false&isinputtext=false"/>/>   
                                        
                                          
                                    </td>                             
                                </axis:ocultar>
                             </tr>    
                             <!--- Sección Cobrador --->                           
                            <tr>                                
                                <td class="campocaja" colspan ="4">
                                    <div style="float:left;">
                                            <img id="DSP_COBRADOR_parent" src="images/mes.gif" 
                                                onclick="objEstilos.toggleDisplay('DSP_COBRADOR', this)" 
                                                style="cursor:pointer"/> 
                                            <b><axis:alt f="axisadm058" c="DSP_COBRADOR_1" lit="9901530"></axis:alt></b>
                                    </div>
                                    
                                    <axis:visible f="axisadm058" c="BT_ANADIR" >
                                    <div style="float:right;" id="COBRADOR">                                     
                                    <img border="0" alt="<axis:alt c="IMG_LISTA_COB" f="axisadm058" lit="1000428"/>" title="<axis:alt c="form_lit" f="axisadm058" lit="1000428"/>" src="images/new.gif" style="cursor:pointer;" onclick="javascript:f_nuevo_cobradorsel()"/>  
                                    <c:if test="${!empty __formdata.listaCobradores_sel}">
                                          
                                    </c:if>                                                        
                                    </div>
                                    </axis:visible>
                                    
                                    <div class="seccion_cobrador"  id="SECCION_COBRADOR"></div>                                            
                                            <div style="clear:both;">
                                                <hr class="titulo">
                                            </div>         
                                    </td> </tr>         
                                    
                                    <tr id="DSP_COBRADOR_children" style="display:none">
                                     <td class="campocaja" colspan = "4"> 
                                     
                               
                                        <axis:ocultar c="DSP_COBRADOR" f="axisctr58" dejarHueco="false">                                                                
                                                  <c:set var="title1"><axis:alt c="orden" f="axisadm058" lit="500102"/></c:set>  <%-- orden --%>
                                                  <c:set var="title2"><axis:alt c="agente" f="axisadm058" lit="100584"/></c:set>   <%-- agente --%>
                                                  <c:set var="title3"><axis:alt c="ramo" f="axisadm058" lit="100784"/></c:set>   <%-- Ramo --%>
                                                  <c:set var="title4"><axis:alt c="producto" f="axisadm058" lit="100829"/></c:set>  <%-- Producto --%>
                                                  <c:set var="title5"><axis:alt c="banco" f="axisadm058" lit="9000964"/></c:set>   <%-- Banco --%>   
                                                  <c:set var="title6"><axis:alt c="editar" f="axisadm058" lit="9901356"/></c:set>   <%-- Editar --%>   
                                                  <% int i=0; %>
                                                  <c:set var="pos"><%=i%></c:set>
                                                  <!-- Valores de columnas -->
                                                  <div class="displayspace">                                             
                                                    <display:table name="${__formdata.listaCobradores_sel}" id="miListaId" export="false" class="dsptgtable" 
                                                    pagesize="-1" defaultsort="2" defaultorder="descending" sort="list" cellpadding="0" cellspacing="0" 
                                                    requestURI="axis_axisadm058.do?operation=form&paginar=true">
                                                      <%@ include file="../include/displaytag.jsp"%>                                                   
                                                      <%--display:column headerClass="headwidth5 sortable fixed" title="" media="html" autolink="false" >
                                                        <div class="dspIcons">                                                
                                                          <input value="${pos}"  <c:if test="${pos== __formdata.INDICE}">checked</c:if> onclick="javascript:f_seleccionar_indice('${pos}')" type="radio" id="radioNVERSIO" name="radioNVERSIO" selected="true"/>
                                                        </div>
                                                      </display:column --%>
                                                      <axis:visible f="axisadm058" c="NORDEN"> 
                                                          <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_COBBANCARIOSEL.NORDEN" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                            <div class="dspNumber">${miListaId.OB_IAX_COBBANCARIOSEL.NORDEN}</div>
                                                          </display:column>
                                                      </axis:visible>                                                        
                                                      <axis:visible f="axisadm058" c="CAGENTE"> 
                                                          <display:column title="${title2}" sortable="true" sortProperty="CAGENTE" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                              <div class="dspText">${miListaId.OB_IAX_COBBANCARIOSEL.TAGENTE}</div>
                                                          </display:column>
                                                      </axis:visible>                                                    
                                                      <axis:visible f="axisadm058" c="TRAMO"> 
                                                          <display:column title="${title3}" sortable="true" sortProperty="TRAMO" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                             <div class="dspText">${miListaId.OB_IAX_COBBANCARIOSEL.TRAMO}</div>  
                                                          </display:column>  
                                                      </axis:visible>   
                                                      <axis:visible f="axisadm058" c="TITULO"> 
                                                          <display:column title="${title4}" sortable="true" sortProperty="TITULO" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                             <div class="dspText">${miListaId.OB_IAX_COBBANCARIOSEL.TTITULO}</div>                                           
                                                          </display:column>  
                                                      </axis:visible>   
                                                      <axis:visible f="axisadm058" c="CBANCO"> 
                                                          <display:column title="${title5}" sortable="true" sortProperty="CBANCO" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                             <div class="dspText">${miListaId.OB_IAX_COBBANCARIOSEL.TBANCO}</div>                                           
                                                          </display:column>  
                                                      </axis:visible>    
                                                      <axis:visible f="axisadm058" c="CBANCO"> 
                                                          <display:column title="" sortable="true" sortProperty="CBANCO" headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >                                    
                                                             <div class="dspIcon" align="center">
                                                                    <img align="center" border="0" alt="<axis:alt c="mod_lit" f="axisadm058" lit="100002"/>" title1="<axis:alt c="mod_img" f="axisadm058" lit="100002"/>" src="images/lapiz.gif" 
                                                                    style="cursor:pointer;" onclick="javascript:f_modif_cobradorsel_lista('${miListaId.OB_IAX_COBBANCARIOSEL.NORDEN}','${miListaId.OB_IAX_COBBANCARIOSEL.CCOBBAN}')"/>  
                                                             </div>
                                                           </display:column>  
                                                      </axis:visible>   
                                                      
                                                        <%i++;%>
                                                        <c:set var="pos"><%=i%></c:set>
                                                    </display:table>
                                                  </div>  
                                            </axis:ocultar>
                                            
                                          
                                      
                                      </td>
                                    </tr>
                                   
                                     
                             
                            </tr>    
                    </table>
            </table>    
    </table>
    
    <%--<c:param name="__botones">cancelar<c:if test="${__formdata.CESTADO == 1 || __formdata.CMODO == 'NVIGEN'}">,aceptar</c:if></c:param>--%>
    <c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axisadm058</c:param>        
        <c:param name="__botones">cancelar</c:param>
    </c:import>
</form>



<c:import url="../include/mensajes.jsp" />
</body>
</html>

