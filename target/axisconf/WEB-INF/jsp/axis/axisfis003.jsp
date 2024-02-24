<%
/**
*  Fichero: axisfis003.jsp
*  @author <a href = "mailto:joan_torres@csi-ti.com">joan torres</a>  
*	Facturas
*  Fecha: 31/05/2012
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
        <title><axis:alt c="TIT_FORM" f="axisfis003" lit="100681"/></title>
        
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload(){
                f_cargar_propiedades_pantalla(); 
                <c:if test="${empty __formdata.OB_FACTURA.NFACT}">                  
                    f_abrir_axisfis002();                          
                </c:if>
            }
                     
            function f_but_cancelar() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisfis003", "cancelar", document.miForm, "_self");                  
            }

            function f_but_9905858() {
                //alert("autorizar");
                objUtiles.ejecutarFormulario ("axis_axisfis003.do", "autoriza", document.miForm, "_self", objJsMessages.jslit_cargando);    
            } 
            
            function f_but_aceptar() {               
                if (objValidador.validaEntrada())
                objUtiles.ejecutarFormulario("axis_axisfis003.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);                
            }
            
            function f_but_emitir() {               
                if (objValidador.validaEntrada())
                objUtiles.ejecutarFormulario("axis_axisfis003.do", "emitir", document.miForm, "_self", objJsMessages.jslit_cargando);                
            }
            
            function f_but_anular() {               
                if (objValidador.validaEntrada())
                objUtiles.ejecutarFormulario("axis_axisfis003.do", "anular", document.miForm, "_self", objJsMessages.jslit_cargando);                
            }
            
            function f_but_imprimir(){
                alert('FACTURA IMPRESA!');
            }
            
            /*function f_but_imprimir_fitxer(pfitxer){            
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?mantenerExtension=mantenerExtension&mimetype="+escape("text/xml")+"&operation=tunnel&file="+pfitxer,600,200);
            }*/
            
             function f_ver_documentacion(pfitxer){  
             <c:if test="${!empty __formdata.IDDOCGEDOX}">                  
                   pfitxer = objUtiles.replaceAll(pfitxer, "barrainvertida", "\\");
                   objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?mantenerExtension=mantenerExtension&mimetype="+escape("application/pdf")+"&operation=tunnel&file="+escape(pfitxer),600,200);
             </c:if>      
            }

            /*******************************************************************************************/
            /***************************************** MODAL *******************************************/
            /*******************************************************************************************/
            function f_cerrar_axisfis002() {
                objUtiles.cerrarModal("axisfis002");
            }
            
            function f_abrir_axisfis002(){
                objUtiles.abrirModal("axisfis002", "src", "modal_axisfis002.do?operation=form"); 
            } 
            
            function f_buscar(NFACT,SFACT,CAGENTE) {
                f_cerrar_axisfis002();
                f_cerrar_axisfis004();
                objDom.setValorPorId("NFACT",NFACT);              
                //objDom.setValorPorId("SFACT",SFACT);
                objDom.setValorPorId("CAGENTE",CAGENTE); 
                objUtiles.ejecutarFormulario("axis_axisfis003.do", "init", document.miForm, "_self", objJsMessages.jslit_cargando);                
            } 
            
            function f_cerrar_axisfis004() {
                objUtiles.cerrarModal("axisfis004");
            }
            
            function f_abrir_axisfis004(){
                objUtiles.abrirModal("axisfis004", "src", "modal_axisfis004.do?operation=form"); 
            }
            
            function f_aceptar_axisfis004() {
                objUtiles.cerrarModal("axisfis004");
            }
            
            function f_nuevo(){
                f_cerrar_axisfis002();
                f_abrir_axisfis004(); 
            }
            
    // **************************************
    // **************************************
    // Añadir nueva fila a tabla compañía
    // **************************************
    // **************************************
        
    function anyadir_fila_desglose(){    
             if (objValidador.validaEntrada()){
                 <c:if test="${!empty __formdata.NFACT}">
                     objAjax.invokeAsyncCGI("axis_axisfis003.do?PNFACT="+"${__formdata.NFACT}",
                                             callbackAjaxInsDet, "operation=ajax_ins_detalle", this,
                                             objJsMessages.jslit_cargando,0);
                 </c:if>
             }
    }
 
    
    function borrar_fila_desglose(num){         
        borrar_fila_desglose_js(num);                 
    }
    // **************************************
    // **************************************
    // Borra una fila determinada por js
    // **************************************
    // **************************************
    function borrar_fila_desglose_js(num){         
           f_del_desglose(num);   
    }
    

    function f_guardar_desglose(num_fila_guardar){                 
         try{
            var NORDEN = document.getElementById("NORDENOBJ_"+num_fila_guardar).value;
            }catch(e){}
         try{
            var TCONCEPTO = document.getElementById("TCONCEPTO_"+num_fila_guardar).value;
            }catch(e){}
         try{
            var IIMPORTE = document.getElementById("IIMPORTE_"+num_fila_guardar).value;
            }catch(e){}
         try{
            var NFACT = document.getElementById("NFACT").value;
            }catch(e){}    
         if (TCONCEPTO!='' && IIMPORTE!=''){
             objAjax.invokeAsyncCGI("axis_axisfis003.do?PNFACT='"+NFACT+"'&PNORDEN="+NORDEN+"&PTCONCEPTO="+TCONCEPTO+"&PIIMPORTE="+IIMPORTE,
                                     callbackAjaxGuardarDesglose, "operation=ajax_guardar_detalle", this,
                                     objJsMessages.jslit_cargando,num_fila_guardar);         
         }
    }
    
    function f_del_desglose(num_fila_guardar){                 
         try{
            var NORDEN = document.getElementById("NORDENOBJ_"+num_fila_guardar).value;
            }catch(e){}
         try{
            var NFACT = document.getElementById("NFACT").value;
            }catch(e){}
         objAjax.invokeAsyncCGI("axis_axisfis003.do?PNORDEN="+NORDEN+"&PNFACT='"+NFACT+"'",callbackAjaxEliminarDesglose,
                                "operation=ajax_del_detalle",this,objJsMessages.jslit_cargando,num_fila_guardar);
    }

    function callbackAjaxGuardarDesglose(ajaxResponseText, num_fila) {
                try {                
                    var doc = objAjax.domParse(ajaxResponseText);
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)){     
                        document.getElementById("IIMPNETO_"+num_fila).value = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PIIMPNETO"), 0, 0);
                        document.getElementById("IIMPCTA_"+num_fila).value = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PIIMPCTA"), 0, 0);
                        document.getElementById("IIRPF_"+num_fila).value = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PIIRPF"), 0, 0);
                        document.getElementById("IMPTOTAL").value = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PIIMPNETO_TOTAL"), 0, 0);
                    }
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
    }     
    
     function callbackAjaxEliminarDesglose(ajaxResponseText, num_fila) {
                try {                
                    var doc = objAjax.domParse(ajaxResponseText);
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)){                
                        // Verificamos que no se han producido excepciones JAVA ni errores en la peticion PL (en este orden)
                        objUtiles.ejecutarFormulario("axis_axisfis003.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                        //null;
                    }
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }      
    }  
    
    function callbackAjaxInsDet(ajaxResponseText) {
                try {                
                    var doc = objAjax.domParse(ajaxResponseText);
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)){                
                        // Verificamos que no se han producido excepciones JAVA ni errores en la peticion PL (en este orden)
                        objUtiles.ejecutarFormulario("axis_axisfis003.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando); 
                    }
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
    }
        </script>
        
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
      
        <input type="hidden" name="operation"/>  
        <input type="hidden" name="CEMPRES" value="${__formdata.OB_FACTURA.CEMPRES}" id="CEMPRES">
        <input type="hidden" name="SFACT" value="${__formdata.OB_FACTURA.SFACT}" id="SFACT">
        
        
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt c="titulo" f="axisfis003" lit="9000442"/></c:param>
                <c:param name="formulario"><axis:alt c="formulario" f="axisfis003" lit="9000442"/></c:param>
                <c:param name="form">axisfis003</c:param>
        </c:import>
        
         <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt c="titulo02" f="axisfis003" lit="9903743"/></c:param>          
            <c:param name="nid" value="axisfis002" />
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt c="titulo04" f="axisfis003" lit="9903742"/></c:param>          
            <c:param name="nid" value="axisfis004" />
        </c:import>

        <c:import url="../include/modal_estandar.jsp">
           <c:param name="nid_y_titulo">axisimprimir|<axis:alt c="axisimprimir" f="axisfis003" lit="1000205"/>|true</c:param>
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
          
            <div class="titulo"><img src="images/flecha.gif"/><axis:alt c="flecha" f="axisfis003" lit="9000442" />
            <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisfis002()" style="cursor:pointer"/> </div>
                                                  
            <!--campos-->
             <table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center">
                            <tr>
                                <th style="width:30%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                            </tr>
                            <tr>                            
                                <axis:ocultar f="axisfis003" c="NFACT" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- CCOBBAN -->
                                         <b><axis:alt f="axisfis003" c="NFACT" lit="9903744"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>    
                                <axis:ocultar f="axisfis003" c="FFACT" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- CCOBBAN -->
                                         <b><axis:alt f="axisfis003" c="FFACT" lit="9000956"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>    
                                <axis:ocultar f="axisfis003" c="TTIPFACT" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- CCOBBAN -->
                                         <b><axis:alt f="axisfis003" c="TTIPFACT" lit="9903745"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>    
                             </tr>
                             <tr>                             
                                <axis:ocultar f="axisfis003" c="NFACT" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="NFACT" name="NFACT" size="40"  maxlength="40"                                                       
                                               value = "${__formdata.OB_FACTURA.NFACT}"
                                                <axis:atr f="axisfis003" c="NFACT" a="modificable=false"/>/>  
                                    </td>                             
                                </axis:ocultar> 
                                <axis:ocultar f="axisfis003" c="FFACT" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="FFACT" name="FFACT" size="15"  style="width:40%"
                                               value = "<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.OB_FACTURA.FFACT}' />"
                                               <axis:atr f="axisfis003" c="FFACT" a="modificable=false"/>/>                      
                                    </td>                             
                                </axis:ocultar>                              
                                <axis:ocultar f="axisfis003" c="TTIPFACT" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="TTIPFACT" name="TTIPFACT" size="15"  style="width:40%"
                                               value =  "${__formdata.OB_FACTURA.TTIPFACT}"
                                               <axis:atr f="axisfis003" c="TTIPFACT" a="modificable=false"/>/>                      
                                    </td>                             
                                </axis:ocultar>
                             </tr>
                              <%-- Seccion 2 --%>
                              <tr>  
                                <axis:ocultar f="axisfis003" c="CAGENTE" dejarHueco="false"> 
                                    <td class="titulocaja" colspan=2 ><!-- CCOBBAN -->
                                         <b><axis:alt f="axisfis003" c="CAGENTE" lit="9901930"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>    
                                <axis:ocultar f="axisfis003" c="NIF" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- CCOBBAN -->
                                         <b><axis:alt f="axisfis003" c="NIF" lit="105904"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>   
                             </tr>
                             <tr>                             
                                                           
                                <axis:ocultar f="axisfis003" c="CAGENTE" dejarHueco="false"> 
                                    <td class="campocaja" colspan=2 >
                                        <input type="text" class="campo campotexto" id="CAGENTE" name="CAGENTE" size="15"  style="width:21%"
                                                           value =  "${__formdata.OB_FACTURA.CAGENTE}"
                                                           <axis:atr f="axisfis003" c="CAGENTE" a="modificable=false"/>/>
                                        &nbsp;&nbsp;
                                        <input type="text" class="campo campotexto" id="TNOMBRE" name="TNOMBRE" size="30"  style="width:70%"
                                                           value =  "${__formdata.OB_FACTURA.TNOMBRE}"
                                                           <axis:atr f="axisfis003" c="TNOMBRE" a="modificable=false"/>/>
                                    </td>                             
                                </axis:ocultar>                              
                                <axis:ocultar f="axisfis003" c="NIF" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="NNUMIDE" name="NNUMIDE" size="15"  style="width:40%"
                                                           value =  "${__formdata.OB_FACTURA.NNUMIDE}"
                                                           <axis:atr f="axisfis003" c="NNUMIDE" a="modificable=false"/>/>                      
                                    </td>                             
                                </axis:ocultar>
                             </tr>
                             <%-- Seccion 3 --%>
                              <tr>      
                               <axis:ocultar f="axisfis003" c="ESTADO" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- TCOBBAN -->
                                         <b><axis:alt f="axisfis003" c="ESTADO" lit="100587"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>                                  
                                <axis:ocultar f="axisfis003" c="CTIPDOC" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- 150996 Tipo documento  -->
                                         <b><axis:alt f="axisfis003" c="CTIPDOC" lit="150996"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>                                  
                                <axis:ocultar f="axisfis003" c="NFOLIO" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- 9900827 Folio -->
                                         <b><axis:alt f="axisfis003" c="NFOLIO" lit="9900827"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>                                  
                                <axis:ocultar f="axisfis003" c="CCARPETA" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- 9902601 Carpeta -->
                                         <b><axis:alt f="axisfis003" c="CCARPETA" lit="9902601"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>     
                                <axis:ocultar f="axisfis003" c="IDDOCGEDOX" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- 9903661 Documento -->
                                         <b><axis:alt f="axisfis003" c="IDDOCGEDOX" lit="9903661"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>     
                             </tr>
                             <tr>    
                               <axis:ocultar f="axisfis003" c="ESTADO" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="ESTADO" name="ESTADO" size="15" style="width:90%"
                                               value =  "${__formdata.OB_FACTURA.TESTADO}"
                                               <axis:atr f="axisfis003" c="ESTADO" a="modificable=false"/>/>                      
                                    </td>                             
                               </axis:ocultar> 
                               <axis:ocultar f="axisfis003" c="CTIPDOC" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="CTIPDOC" name="CTIPDOC" size="15" style="width:90%"
                                               value =  "${__formdata.OB_FACTURA.TTIPDOC}"
                                               <axis:atr f="axisfis003" c="CTIPDOC" a="modificable=false"/>/>                      
                                    </td>                             
                               </axis:ocultar>         
                               <axis:ocultar f="axisfis003" c="NFOLIO" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="NFOLIO" name="NFOLIO" size="15" style="width:90%"
                                               value =  "${__formdata.OB_FACTURA.NFOLIO}"
                                               <axis:atr f="axisfis003" c="FOLIO" a="modificable=false"/>/>                      
                                    </td>                             
                               </axis:ocultar>         
                               <axis:ocultar f="axisfis003" c="CCARPETA" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="CCARPETA" name="CCARPETA" size="15" style="width:90%"
                                               value =  "${__formdata.OB_FACTURA.CCARPETA}"
                                               <axis:atr f="axisfis003" c="CCARPETA" a="modificable=false"/>/>                      
                                    </td>                             
                               </axis:ocultar>  
                               <axis:ocultar f="axisfis003" c="IDDOCGEDOX" dejarHueco="false"> 
                                    <td class="campocaja" style="white-space:nowrap;" > 
                                        <input type="text" class="campo campotexto" id="IDDOCGEDOX" name="IDDOCGEDOX" size="15" style="width:90%"
                                               value =  "${__formdata.OB_FACTURA.IDDOCGEDOX}"
                                               <axis:atr f="axisfis003" c="IDDOCGEDOX" a="modificable=false"/>/>  
                                               <a href="javascript:void(0)" onclick="f_ver_documentacion('${fn:replace(__formdata.OB_FACTURA.RUTAGEDOX.OPTPATH, '\\','barrainvertida' )}');"> <img border="0" alt="<axis:alt f="axisfis003" c="BT_SIN_NUEVO_TRAM_DOC" lit="105330"/>" title="<axis:alt f="axisfis003" c="BT_SIN_NUEVO_TRAM_DOC" lit="105330"/>" src="images/document.gif"/></a>
                                    </td>                             
                               </axis:ocultar>  
                               
                             </tr>    
                             <!--- Sección Detalle Factura --->                           
                             <axis:ocultar f="axisfis003" c="DSP_DESGLOSE" dejarHueco="false"> <!-- TODO C -->
                                <tr>
                                    <td class="campocaja" colspan="5">
                                                                                        
                                               <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisfis003" c="DSP_DESGLOSE" lit="9903758" /></div>
                                        &nbsp;
                                        <table class="seccion" cellpadding="0" cellspacing="0" align="right" style="width:99%">
                
                                        <tbody id="desglose" align="right">
                                        
                                                <tr>
                                                    <axis:ocultar f="axisfis003" c="TCONCEPTO" dejarHueco="false">
                                                        <th style="width:10%;height:0px"></th>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisfis003" c="IIMPORTE" dejarHueco="false">
                                                        <th style="width:10%;height:0px"></th>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisfis003" c="IIRPF" dejarHueco="false">
                                                        <th style="width:10%;height:0px"></th>                                    
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisfis003" c="IIMPNETO" dejarHueco="false">
                                                        <th style="width:10%;height:0px"></th>                                    
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisfis003" c="IIMPCTA" dejarHueco="false">
                                                        <th style="width:10%;height:0px"></th>                                    
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisfis003" c="ELIMINAR" dejarHueco="false">
                                                        <th style="width:3%;height:0px"></th>
                                                    </axis:ocultar>  
                                                </tr>
                                                <tr class="gridEvenHover">   

                                                    <axis:ocultar f="axisfis003" c="TCONCEPTO" dejarHueco="false">
                                                        <td class="dspText" align="center"><b><axis:alt c="TCONCEPTO" f="axisfis003" lit="9000715"/></b></td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisfis003" c="IIMPORTE" dejarHueco="false">
                                                        <td class="dspText" align="center"><b><axis:alt c="IIMPORTE" f="axisfis003" lit="100563"/></b></td>                                        
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisfis003" c="IIRPF" dejarHueco="false">
                                                        <td class="dspText" align="center"><b><axis:alt c="IIRPF" f="axisfis003" lit="112579"/></b></td>                                        
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisfis003" c="IIMPCTA" dejarHueco="false">
                                                        <td class="dspText" align="center"><b><axis:alt c="IIMPCTA" f="axisfis003" lit="9904227"/></b></td>                                        
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisfis003" c="IIMPNETO" dejarHueco="false">
                                                        <td class="dspText" align="center"><b><axis:alt c="IIMPNETO" f="axisfis003" lit="1000527"/></b></td>                                        
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisfis003" c="ELIMINAR" dejarHueco="false">
                                                        <td>&nbsp;</td>
                                                    </axis:ocultar>  
                                                </tr>
                                                
                                                <!-- C:IF  SI EL OBJETO LISTA ES NULO PINTAMOS UNA LINEA EN BLANCO -->
                                                <c:if test="${empty __formdata.OB_FACTURA.DETFACTURA}">  
                                                    <tr tipo="ri" id="fila_0" class="gridNotEven" >   
                                                 
                                                    <axis:ocultar f="axisfis003" c="TCONCEPTO" dejarHueco="false">
                                                        <td class="dspText">                                               
                                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="TCONCEPTO_0" name="TCONCEPTO_0" 
                                                            title="<axis:alt c='TCONCEPTO' f='axisfis003' lit='9000715'/>"  size="5" onclick=""
                                                            <c:if test="${__formdata.OB_FACTURA.CESTADO == 0}">
                                                                <axis:atr f="axisfis003" c="TCONCEPTO" a="obligatorio=true&modificable=true"/>
                                                            </c:if>
                                                            <c:if test="${__formdata.OB_FACTURA.CESTADO != 0}">
                                                                <axis:atr f="axisfis003" c="TCONCEPTO" a="obligatorio=false&modificable=false"/>
                                                            </c:if>
                                                            onchange="javascript:f_guardar_desglose(0);" value=""/>
                                                            
                                                            <input type="hidden"  id="NORDEN_0" name="NORDEN_0" value=""/>
                                                            
                                                            <input type="hidden"  id="NORDENOBJ_0" name="NORDENOBJ_0" value=""/>
                                                        </td>        
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisfis003" c="IIMPORTE" dejarHueco="false">
                                                        <td class="dspText">                                               
                                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="IIMPORTE_0" name="IIMPORTE_0" 
                                                            title="<axis:alt c='IIMPORTE' f='axisfis003' lit='100563'/>"  size="5" onclick=""
                                                            <c:if test="${__formdata.OB_FACTURA.CESTADO == 0}">
                                                                <axis:atr f="axisfis003" c="IIMPORTE" a="obligatorio=true&modificable=true"/>
                                                            </c:if>
                                                            <c:if test="${__formdata.OB_FACTURA.CESTADO != 0}">
                                                                <axis:atr f="axisfis003" c="IIMPORTE" a="obligatorio=false&modificable=false"/>
                                                            </c:if>
                                                            onchange="javascript:f_guardar_desglose(0);" value=""/>
                                                        </td>        
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisfis003" c="IIRPF" dejarHueco="false">
                                                        <td class="dspText">                                               
                                                            <%--input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="IIRPF_0" name="IIRPF_0" 
                                                            title="<axis:alt c='IIRPF' f='axisfis003' lit='112579'/>"  size="5" onclick=""
                                                            <c:if test="${__formdata.OB_FACTURA.CESTADO == 0}">
                                                                <axis:atr f="axisfis003" c="IIRPF" a="obligatorio=true&modificable=true"/>
                                                            </c:if>
                                                            <c:if test="${__formdata.OB_FACTURA.CESTADO != 0}">
                                                                <axis:atr f="axisfis003" c="IIRPF" a="obligatorio=false&modificable=false"/>
                                                            </c:if>
                                                            onchange="javascript:f_guardar_desglose(0);" value=""/--%>
                                                            &nbsp;
                                                        </td>        
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisfis003" c="IIMPCTA" dejarHueco="false">
                                                        <td class="dspText">                                               
                                                            <%--input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="IIMPCTA_0" name="IIMPCTA_0" 
                                                            title="<axis:alt c='IIMPCTA' f='axisfis003' lit='9904227'/>"  size="5" onclick=""
                                                            <c:if test="${__formdata.OB_FACTURA.CESTADO == 0}">
                                                                <axis:atr f="axisfis003" c="IIMPCTA" a="obligatorio=true&modificable=true"/>
                                                            </c:if>
                                                            <c:if test="${__formdata.OB_FACTURA.CESTADO != 0}">
                                                                <axis:atr f="axisfis003" c="IIMPCTA" a="obligatorio=false&modificable=false"/>
                                                            </c:if>
                                                            onchange="javascript:f_guardar_desglose(0);" value=""/--%>
                                                            &nbsp;
                                                        </td>        
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisfis003" c="IIMPNETO" dejarHueco="false">
                                                        <td class="dspText">                                               
                                                            &nbsp;
                                                        </td>        
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisfis003" c="ELIMINAR" dejarHueco="false">
                                                        <td class="dspText">
                                                            <c:if test="${__formdata.OB_FACTURA.CESTADO == 0}">
                                                                <a href="javascript:borrar_fila_desglose(${i.count-1})"  id ="eliminar_${i.count-1}"><img border="0" alt="<axis:alt f="axisfis003" c="DELETE" lit="1000127" />"  title="<axis:alt f="axisfis003" c="DELETE" lit="1000127"/>" src="images/delete.gif"/></a>
                                                            </c:if>
                                                        </td>
                                                    </axis:ocultar>
                                                    </tr>
                                                 </c:if>
                                                <!--SI NO PINTAMOS LAS FILAS RELLENADAS -->
                                                
                                                
                                                 
                                                <c:if test="${!empty __formdata.OB_FACTURA.DETFACTURA}">                                                                      
                                                
                                                    <c:forEach items="${__formdata.OB_FACTURA.DETFACTURA}" var="lista" varStatus="i">                                    
                                                    
                                                        <tr tipo="ri" id="fila_${i.count-1}" title="fila_${i.count-1}"
                                                            <c:if test="${i.count mod 2 ==0}">                                                                      
                                                                class="gridEven"                                                        
                                                            </c:if>
                                                            <c:if test="${i.count mod 2 !=0}">                                                                      
                                                                class="gridNotEven"                                                        
                                                            </c:if>
                                                        >                                                                                      
                                                            <axis:ocultar f="axisfis003" c="TCONCEPTO" dejarHueco="false">
                                                                <td class="dspText">                                               
                                                                    <%--input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="TCONCEPTO_${i.count-1}" name="TCONCEPTO_${i.count-1}" 
                                                                    title="<axis:alt c='TCONCEPTO' f='axisfis003' lit='9000715'/>"  size="5" onclick=""
                                                                    <c:if test="${__formdata.OB_FACTURA.CESTADO == 0}">
                                                                        <axis:atr f="axisfis003" c="TCONCEPTO" a="obligatorio=true&modificable=true"/> 
                                                                    </c:if>
                                                                    <c:if test="${__formdata.OB_FACTURA.CESTADO != 0}">
                                                                        <axis:atr f="axisfis003" c="TCONCEPTO" a="obligatorio=false&modificable=false"/> 
                                                                    </c:if>
                                                                    onchange="javascript:f_guardar_desglose(${i.count-1});"
                                                                    value="${lista.OB_IAX_DETFACTURA.TCONCEPTO}"/--%>
                                                                    
                                                                    <select name="TCONCEPTO_${i.count-1}" id ="TCONCEPTO_${i.count-1}" size="1"  class="campowidthinput campo campotexto_ob" style="width:90%"
                                                                     title="<axis:alt c='TCONCEPTO' f='axisfis003' lit='9000715'/>" onchange="javascript:f_guardar_desglose(${i.count-1});"
                                                                    <c:if test="${__formdata.OB_FACTURA.CESTADO == 0}">
                                                                        <axis:atr f="axisfis003" c="TCONCEPTO" a="isInputText=false&obligatorio=true&modificable=true"/> >
                                                                    </c:if>
                                                                    <c:if test="${__formdata.OB_FACTURA.CESTADO != 0}">
                                                                        <axis:atr f="axisfis003" c="TCONCEPTO" a="isInputText=false&obligatorio=false&modificable=false"/> >
                                                                    </c:if>
                                                                        <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt c="SELECC" f="axisfis003" lit="108341"/> - </option>                                                                                                        
                                                                        <c:forEach items="${__formdata.LISTVALORES.LSTCONCEPTO}" var="item">
                                                                            <option value = "${item.CATRIBU}" <c:if test="${!empty lista.OB_IAX_DETFACTURA.CCONCEPTO && lista.OB_IAX_DETFACTURA.CCONCEPTO == item.CATRIBU}"> selected </c:if>>${item.TATRIBU}</option>
                                                                        </c:forEach>
                                                                    </select>

                                                                    <input type="hidden"  id="NORDEN_${i.count-1}" name="NORDEN_${i.count-1}"  
                                                                           value="${i.count-1}"/>
                                                                    
                                                                    <input type="hidden"  id="NORDENOBJ_${i.count-1}" name="NORDENOBJ_${i.count-1}"  
                                                                           value="${lista.OB_IAX_DETFACTURA.NORDEN}"/>
                                                                </td>        
                                                            </axis:ocultar>
                                                            <axis:ocultar f="axisfis003" c="IIMPORTE" dejarHueco="false">
                                                                <td class="dspText">                                               
                                                                    <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="IIMPORTE_${i.count-1}" name="IIMPORTE_${i.count-1}" 
                                                                    title="<axis:alt c='IIMPORTE' f='axisfis003' lit='100563'/>"  size="5" onclick=""
                                                                    <c:if test="${__formdata.OB_FACTURA.CESTADO == 0}">
                                                                        <axis:atr f="axisfis003" c="IIMPORTE" a="obligatorio=true&modificable=true"/>
                                                                    </c:if>
                                                                    <c:if test="${__formdata.OB_FACTURA.CESTADO != 0}">
                                                                        <axis:atr f="axisfis003" c="IIMPORTE" a="obligatorio=false&modificable=false"/>
                                                                    </c:if>
                                                                    onchange="javascript:f_guardar_desglose(${i.count-1});"
                                                                    value="<fmt:formatNumber value='${lista.OB_IAX_DETFACTURA.IIMPORTE}' pattern='${__formatNumberPatterns[__defaultCMONINT]}'/>" />
                                                                </td>        
                                                            </axis:ocultar>
                                                            <axis:ocultar f="axisfis003" c="IIRPF" dejarHueco="false">
                                                                <td class="dspText">                                               
                                                                    <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="IIRPF_${i.count-1}" name="IIRPF_${i.count-1}" 
                                                                    title="<axis:alt c='IIRPF' f='axisfis003' lit='112579'/>"  size="5" onclick=""
                                                                    <axis:atr f="axisfis003" c="IIRPF" a="modificable=false"/>
                                                                    value="<fmt:formatNumber value='${lista.OB_IAX_DETFACTURA.IIRPF}' pattern='${__formatNumberPatterns[__defaultCMONINT]}'/>" />
                                                                </td>        
                                                            </axis:ocultar>
                                                            <axis:ocultar f="axisfis003" c="IIMPCTA" dejarHueco="false">
                                                                <td class="dspText">                                               
                                                                    <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="IIMPCTA_${i.count-1}" name="IIMPCTA_${i.count-1}" 
                                                                    title="<axis:alt c='IIMPCTA' f='axisfis003' lit='9904227'/>"  size="5" onclick=""
                                                                    <axis:atr f="axisfis003" c="IIMPCTA" a="modificable=false"/>
                                                                    value="<fmt:formatNumber value='${lista.OB_IAX_DETFACTURA.IIMPCTA}' pattern='${__formatNumberPatterns[__defaultCMONINT]}'/>" />
                                                                </td>        
                                                            </axis:ocultar>
                                                            <axis:ocultar f="axisfis003" c="IIMPNETO" dejarHueco="false">
                                                                <td class="dspText">                                               
                                                                    <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="IIMPNETO_${i.count-1}" name="IIMPNETO_${i.count-1}" 
                                                                    title="<axis:alt c='IIMPNETO' f='axisfis003' lit='1000527'/>"  size="5" onclick=""
                                                                    <axis:atr f="axisfis003" c="IIMPNETO" a="modificable=false"/>
                                                                    value="<fmt:formatNumber value='${lista.OB_IAX_DETFACTURA.IIMPNETO}' pattern='${__formatNumberPatterns[__defaultCMONINT]}'/>" />
                                                                </td>        
                                                            </axis:ocultar>
                                                            <axis:ocultar f="axisfis003" c="ELIMINAR" dejarHueco="false">
                                                                <td class="dspText">
                                                                    <c:if test="${__formdata.OB_FACTURA.CESTADO == 0}">
                                                                        <a href="javascript:borrar_fila_desglose(${i.count-1})"  id ="eliminar_${i.count-1}"><img border="0" alt="<axis:alt f="axisfis003" c="DELETE" lit="1000127" />"  title="<axis:alt f="axisfis003" c="DELETE" lit="1000127"/>" src="images/delete.gif"/></a>
                                                                    </c:if>
                                                                </td>
                                                            </axis:ocultar>
                                                        </tr>    
                                                    </c:forEach> 
                                                  </c:if>
                                                <!--SI NO PINTAMOS LAS FILAS RELLENADAS -->
                                            <!-- ******************** fin filas: boton anyadir  ******************************** -->                                            
                                            </tbody>  
                                            
                                        </table>
                                             
                                            
                                    </td>
                                    </tr>
                                    <c:if test="${__formdata.OB_FACTURA.CESTADO == 0}">
                                        <tr>
                                            <axis:visible f="axisfis003" c="BUT_ANADIR" >
                                                <td style="text-align:right" colspan="4">
                                                        <input type="button" class="boton" id="but_anadir" value="<axis:alt f="axisfis003" c="ANADIR" lit="104825" />" onclick="javascript:anyadir_fila_desglose()" />
                                                </td>
                                            </axis:visible>
                                        </tr>
                                    </c:if>
                                </axis:ocultar>

                            <tr>
                                <td>
                                </td>
                                <td>
                                </td>
                                <axis:ocultar f="axisfis003" c="IMPTOTAL" dejarHueco="false">
                                    <td class="titulocaja" style="text-align:right" ><!-- CBAJA --> 
                                        <b><axis:alt f="axisfis003" c="IMPTOTAL" lit="9000474"></axis:alt></b> 
                                    </td> 
                                </axis:ocultar>
                                <axis:ocultar f="axisfis003" c="IMPTOTAL" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="IMPTOTAL" name="IMPTOTAL" size="15"  style="width:50%"                                                        
                                               value =  "<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.OB_FACTURA.IIMPNETO_TOTAL}'/>"
                                               <axis:atr f="axisfis003" c="IMPTOTAL" a="modificable=false"/>/>   
                                    </td>                             
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                </td>
                                <axis:ocultar f="axisfis003" c="TIPIVA" dejarHueco="false"> 
                                    <td class="titulocaja" style="text-align:right" ><!-- CBAJA --> 
                                        <b><axis:alt f="axisfis003" c="TIPIVA" lit="101340"></axis:alt></b> 
                                    </td> 
                                </axis:ocultar>  
                                <axis:ocultar f="axisfis003" c="TIPIVA" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="TIPIVA" name="TIPIVA" size="15"  style="width:50%"                                                        
                                               value =  "${__formdata.OB_FACTURA.TTIPIVA}"
                                               <axis:atr f="axisfis003" c="TIPIVA" a="modificable=false"/>/>                      
                                    </td>                             
                                </axis:ocultar> 
                            </tr>
                    </table>
            </table>    
    </table>
    
    <c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axisfis003</c:param>        
        <c:param name="__botones">cancelar<axis:visible c="BT_AUTORIZA" f="axisfis003">,9905858</axis:visible><%--c:if test="${__formdata.OB_FACTURA.CESTADO != 0&&!empty __formdata.OB_FACTURA.NFACT}">,imprimir</c:if--%><c:if test="${__formdata.OB_FACTURA.CESTADO == 0}">,aceptar</c:if><c:if test="${__formdata.OB_FACTURA.CESTADO == 0}">,anular</c:if><c:if test="${__formdata.OB_FACTURA.CESTADO == 0}">,emitir</c:if></c:param>
    </c:import>
</form>

<c:import url="../include/mensajes.jsp" />
</body>
</html>

