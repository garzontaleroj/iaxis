<!--
/**
*  Fichero: axisfis005.jsp
*  @author <a href = "mailto:joan_torres@csi-ti.com">joan torres</a>  
*	Facturas
*  Fecha: 31/05/2012
*/
-->
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
        <title><axis:alt c="TIT_FORM" f="axisfis005" lit="9906537"/></title>
        
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
               
            }
                     
            function f_but_cancelar() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisfis005", "cancelar", document.miForm, "_self");                  
            }
            
            function f_but_9001304() {               
                if (objValidador.validaEntrada()){                
                    objDom.setValorPorId("FOLIOERRORSEND",f_componer_flujos());  
                    objUtiles.ejecutarFormulario("axis_axisfis005.do", "asignar", document.miForm, "_self", objJsMessages.jslit_cargando);      
                }
            }
            
            function f_but_9000497() {               
                if (objValidador.validaEntrada()){                
                    objDom.setValorPorId("FOLIOERRORSEND",f_componer_flujos());  
                    objUtiles.ejecutarFormulario("axis_axisfis005.do", "generar", document.miForm, "_self", objJsMessages.jslit_cargando);      
                }         
            }
            
            function f_but_anular() {               
                if (objValidador.validaEntrada())
                objUtiles.ejecutarFormulario("axis_axisfis005.do", "anular", document.miForm, "_self", objJsMessages.jslit_cargando);                
            }
            
            function f_but_imprimir(){
                alert('FACTURA IMPRESA!');
            }
            
            /*function f_but_imprimir_fitxer(pfitxer){            
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?mantenerExtension=mantenerExtension&mimetype="+escape("text/xml")+"&operation=tunnel&file="+pfitxer,600,200);
            }*/

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
                objUtiles.ejecutarFormulario("axis_axisfis005.do", "init", document.miForm, "_self", objJsMessages.jslit_cargando);                
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
    
  

    function f_buscar_datos_carpeta(ccarpeta){
        if (!objUtiles.estaVacio(ccarpeta)){
              objAjax.invokeAsyncCGI("axis_axisfis005.do?CCARPETA="+ccarpeta,
                                         callbackAjaxDatosCarpeta, "operation=ajax_datos_carpeta", this,
                                         objJsMessages.jslit_cargando);  
        }
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
             objAjax.invokeAsyncCGI("axis_axisfis005.do?PNFACT='"+NFACT+"'&PNORDEN="+NORDEN+"&PTCONCEPTO="+TCONCEPTO+"&PIIMPORTE="+IIMPORTE,
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
         objAjax.invokeAsyncCGI("axis_axisfis005.do?PNORDEN="+NORDEN+"&PNFACT='"+NFACT+"'",callbackAjaxEliminarDesglose,
                                "operation=ajax_del_detalle",this,objJsMessages.jslit_cargando,num_fila_guardar);
    }

    function callbackAjaxDatosCarpeta(ajaxResponseText) {
                try {                
                    var doc = objAjax.domParse(ajaxResponseText);
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)){     
                        document.getElementById("DESTIPDOC").value = objDom.getValorNodoDelComponente(doc.getElementsByTagName("DESTIPDOC"), 0, 0);
                        document.getElementById("NFINALD").value = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NFINAL"), 0, 0);
                        document.getElementById("NINICIOD").value = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NINICIO"), 0, 0);
                        document.getElementById("TOTAL").value = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TOTAL"), 0, 0);
                        document.getElementById("ASIGNADAS").value = objDom.getValorNodoDelComponente(doc.getElementsByTagName("ASIGNADAS"), 0, 0);
                    } else{
                        document.getElementById("DESTIPDOC").value ="";
                        document.getElementById("NFINALD").value  ="";
                        document.getElementById("NINICIOD").value  ="";
                        document.getElementById("TOTAL").value  ="";
                        document.getElementById("ASIGNADAS").value ="";
                        document.getElementById("SFACTURA").value ="";
                        document.getElementById("NINICIO").value ="";
                        document.getElementById("NFINAL").value ="";
                        document.getElementById("FOLIOERROR").value ="";
                    }

                } catch (e) {
                    document.getElementById("DESTIPDOC").value ="";
                    document.getElementById("NFINALD").value  ="";
                    document.getElementById("NINICIOD").value  ="";
                    document.getElementById("TOTAL").value  ="";
                    document.getElementById("ASIGNADAS").value ="";
                    document.getElementById("SFACTURA").value ="";
                    document.getElementById("NINICIO").value ="";
                    document.getElementById("NFINAL").value ="";
                    document.getElementById("FOLIOERROR").value ="";
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
    }     


    
     function callbackAjaxEliminarDesglose(ajaxResponseText, num_fila) {
                try {                
                    var doc = objAjax.domParse(ajaxResponseText);
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)){                
                        // Verificamos que no se han producido excepciones JAVA ni errores en la peticion PL (en este orden)
                        objUtiles.ejecutarFormulario("axis_axisfis005.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
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
                        objUtiles.ejecutarFormulario("axis_axisfis005.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando); 
                    }
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
    }
    
    
    function f_add_fila(){
        if ( !objUtiles.estaVacio(objDom.getValorPorId("FOLIOERROR")) ){
            var x = document.getElementById("FOLIOSERROR");
            var option = document.createElement("option");
            option.text =  objDom.getValorPorId("FOLIOERROR");
            option.value =  objDom.getValorPorId("FOLIOERROR");
            x.add(option);
            objDom.setValorPorId("FOLIOERROR","");
            document.getElementById("FOLIOERROR").focus();
        }
    } 
    function f_delete_fila(){
        var x=document.getElementById("FOLIOSERROR");
        if (x.selectedIndex>=0){
            x.remove(x.selectedIndex);
        }
    } 
  function f_componer_flujos(){    
        var linea="";
        var x = document.getElementById("FOLIOSERROR");
        for (var i=0; i < x.options.length ; i++){
            var option = x.options[i];
            linea +=  option.value +  ((i==(x.options.length-1))?"":",");
        } 
        return linea;
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
                <c:param name="titulo"><axis:alt c="titulo" f="axisfis005" lit="9906537"/></c:param>
                <c:param name="formulario"><axis:alt c="formulario" f="axisfis005" lit="9906537"/></c:param>
                <c:param name="form">axisfis005</c:param>
        </c:import>
        
         <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt c="titulo02" f="axisfis005" lit="9903743"/></c:param>          
            <c:param name="nid" value="axisfis002" />
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt c="titulo04" f="axisfis005" lit="9903742"/></c:param>          
            <c:param name="nid" value="axisfis004" />
        </c:import>

        <c:import url="../include/modal_estandar.jsp">
           <c:param name="nid_y_titulo">axisimprimir|<axis:alt c="axisimprimir" f="axisfis005" lit="1000205"/>|true</c:param>
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
          
            <div class="titulo"><img src="images/flecha.gif"/><axis:alt c="flecha" f="axisfis005" lit="9902601" /></div>
            
                                                  
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
                                <axis:ocultar f="axisfis005" c="CCARPETA" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- 9902601 Carpeta -->
                                         <b><axis:alt f="axisfis005" c="CCARPETA" lit="9902601"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>    
                                 
                             </tr>
                             <tr>                             
                                <axis:ocultar f="axisfis005" c="CCARPETA" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="CCARPETA" name="CCARPETA" size="40"  maxlength="40"    title="<axis:alt f="axisfis005" c="CCARPETA" lit="9902601"/>"                                                   
                                               value = "${__formdata.CCARPETA}"
                                                <axis:atr f="axisfis005" c="CCARPETA" a="modificable=true&obligatorio=true"/>  onchange="f_buscar_datos_carpeta(this.value)"/>  
                                    </td>                            
                                </axis:ocultar> 
                                
                             </tr>
                              <%-- Seccion 2 --%>
                              <tr>  
                                
                                <axis:ocultar f="axisfis005" c="DESTIPDOC" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- CCOBBAN -->
                                         <b><axis:alt f="axisfis005" c="DESTIPDOC" lit="109774"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>   
                             </tr>
                             <tr>                             

                                <axis:ocultar f="axisfis005" c="DESTIPDOC" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="DESTIPDOC" name="DESTIPDOC" size="15"  style="width:70%"
                                                           value =  "${__formdata.DESTIPDOC}"
                                                           <axis:atr f="axisfis005" c="DESTIPDOC" a="modificable=false"/>/>                      
                                    </td>                             
                                </axis:ocultar>
                             </tr>
                             <%-- Seccion 3 --%>
                              <tr>      
                               <axis:ocultar f="axisfis005" c="NINICIOD" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- TCOBBAN -->
                                         <b><axis:alt f="axisfis005" c="NINICIO" lit="9906540"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>                                  
                                <axis:ocultar f="axisfis005" c="NFINALD" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- 150996 Tipo documento  -->
                                         <b><axis:alt f="axisfis005" c="NFINALD" lit="9906541"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>                                  
                                <axis:ocultar f="axisfis005" c="TOTAL" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- 9902601 Carpeta -->
                                         <b><axis:alt f="axisfis005" c="TOTAL" lit="101093"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>     
                                <axis:ocultar f="axisfis005" c="ASIGNADAS" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- 9903661 Documento -->
                                         <b><axis:alt f="axisfis005" c="ASIGNADAS" lit="9906542"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>     
                             </tr>
                             <tr>    
                               <axis:ocultar f="axisfis005" c="NINICIOD" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="NINICIOD" name="NINICIOD" size="15" style="width:90%"
                                               value =  "${__formdata.NINICIOD}"
                                               <axis:atr f="axisfis005" c="NINICIOD" a="modificable=false"/>/>                      
                                    </td>                             
                               </axis:ocultar> 
                               <axis:ocultar f="axisfis005" c="NFINALD" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="NFINALD" name="NFINALD" size="15" style="width:90%"
                                               value =  "${__formdata.NFINALD}"
                                               <axis:atr f="axisfis005" c="NFINALD" a="modificable=false"/>/>                      
                                    </td>                             
                               </axis:ocultar>         
                               <axis:ocultar f="axisfis005" c="TOTAL" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="TOTAL" name="TOTAL" size="15" style="width:90%"
                                               value =  "${__formdata.TOTAL}"
                                               <axis:atr f="axisfis005" c="TOTAL" a="modificable=false"/>/>                      
                                    </td>                             
                               </axis:ocultar>         
                               <axis:ocultar f="axisfis005" c="ASIGNADAS" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="ASIGNADAS" name="ASIGNADAS" size="15" style="width:90%"
                                               value =  "${__formdata.ASIGNADAS}"
                                               <axis:atr f="axisfis005" c="ASIGNADAS" a="modificable=false"/>/>                      
                                    </td>                             
                               </axis:ocultar>  
                              
                               
                             </tr>  
                             <tr>
                               <td class="campocaja" colspan="5">
                                               <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisfis005" c="DSP_DESGLOSE" lit="9906539" /></div>
                                        &nbsp;
                               </td>
                             </tr>
                             <tr>   
                            
                             
                               <axis:ocultar f="axisfis005" c="SFACTURA" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- TCOBBAN -->
                                         <b><axis:alt f="axisfis005" c="SFACTURA" lit="9906543"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>                                  
                                <axis:ocultar f="axisfis005" c="NINICIO" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- 150996 Tipo documento  -->
                                         <b><axis:alt f="axisfis005" c="NINICIO" lit="9906544"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>                                  
                                <axis:ocultar f="axisfis005" c="NFINAL" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- 9902601 Carpeta -->
                                         <b><axis:alt f="axisfis005" c="NFINAL" lit="9906545"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>     
                                    
                             </tr>
                             <tr>    
                               <axis:ocultar f="axisfis005" c="SFACTURA" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="SFACTURA" name="SFACTURA" size="15" style="width:90%"
                                               value =  "${__formdata.SFACTURA}"
                                               <axis:atr f="axisfis005" c="SFACTURA" a="modificable=true"/>/>                      
                                    </td>                             
                               </axis:ocultar> 
                               <axis:ocultar f="axisfis005" c="NINICIO" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="NINICIO" name="NINICIO" size="15" style="width:90%"
                                               value =  "${__formdata.NINICIO}"
                                               <axis:atr f="axisfis005" c="NINICIO" a="modificable=true"/>/>                      
                                    </td>                             
                               </axis:ocultar>         
                               <axis:ocultar f="axisfis005" c="NFINAL" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="NFINAL" name="NFINAL" size="15" style="width:90%"
                                               value =  "${__formdata.NFINAL}"
                                               <axis:atr f="axisfis005" c="NFINAL" a="modificable=true"/>/>                      
                                    </td>                             
                               </axis:ocultar>         
                              
                              
                               
                             </tr>  
                             
                             
                             <tr>
                                    <td class="campocaja" colspan="5">
                                                                                        
                                               <div class="titulo" ><img src="images/flecha.gif"/><axis:alt f="axisfis005" c="DSP_DESGLOSE" lit="105413" /></div>
                                        &nbsp;
                                       
                                        <table class="seccion" cellpadding="0" cellspacing="0" align="left" style="width:99%">
                
                                        <tbody id="Errores" align="right">
                                        
                                                <tr>
                                                    
                                                        <th style="width:10%;height:0px"></th>
                                                    
                                                        <th style="width:10%;height:0px"></th>
                                                  
                                                        <th style="width:10%;height:0px"></th>                                    
                                                   
                                                        <th style="width:10%;height:0px"></th>                                    
                                                   
                                                        <th style="width:10%;height:0px"></th>                                    
                                                    
                                                        <th style="width:3%;height:0px"></th>
                                                   
                                                </tr>
                                                </tbody>
                                                <tr>
                                                    <axis:ocultar f="axisfis005" c="FOLIO" dejarHueco="false"> 
                                                        <td class="titulocaja" ><!-- TCOBBAN -->
                                                             <b><axis:alt f="axisfis005" c="FOLIO" lit="9900827"></axis:alt></b>                                                                          
                                                        </td>
                                                    </axis:ocultar>                                  
                                                    <axis:ocultar f="axisfis005" c="ACCIONES" dejarHueco="false"> 
                                                        <td class="titulocaja" ><!-- 150996 Tipo documento  -->
                                                             <b><axis:alt f="axisfis005" c="ACCIONES" lit="9000594"></axis:alt></b>                                                                          
                                                        </td>
                                                    </axis:ocultar>                                  
                                                       
                                                 </tr>
                                                 <tr id="errores">    
                                                   <axis:ocultar f="axisfis005" c="FOLIO" dejarHueco="false"> 
                                                        <td class="campocaja">
                                                        
                                                            <input type="text" class="campo campotexto" id="FOLIOERROR" name="FOLIOERROR" size="15" style="width:90%"
                                                                   <axis:atr f="axisfis005" c="FOLIO_ERROR" a="modificable=true"/>/> 
                                                             <input type="hidden" class="campo campotexto" id="FOLIOERRORSEND" name="FOLIOERRORSEND" size="15" style="width:90%"
                                                                   <axis:atr f="axisfis005" c="FOLIO_ERROR" a="modificable=true"/>/>        
                                                                   
                                                        <select name="FOLIOSERROR" id="FOLIOSERROR" size="10" class="campowidthselect campo campotexto" style="width:90%;"  >
                                                            <c:forEach var="element" items="${__formdata.ERRORES}">
                                                                <option value = "${element}" >
                                                                    ${element} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                        </td>                             
                                                   </axis:ocultar> 
                                                   <axis:ocultar f="axisfis005" c="ELIMINAR" dejarHueco="false"> 
                                                        <td class="campocaja">
                                                           
                                                           <img border="0"
                                                                         id="ICO_ANADIR"
                                                                         name="ICO_ANADIR"
                                                                         alt='<axis:alt f="axisfis005" c="ANADIR" lit="104825"/>'
                                                                         title='<axis:alt f="axisfis005" c="ANADIR" lit="104825"/>'
                                                                         src="images/new.gif"
                                                                         onclick="javascript:f_add_fila()"/>
                                                            <img border="0" alt="<axis:alt f="axisfis005" c="ELIMINAR" lit="1000127" />"  title="<axis:alt f="axisfis005" c="ELIMINAR" lit="1000127"/>" src="images/delete.gif"
                                                            onclick="javascript:f_delete_fila()"/>
                                                        </td>                             
                                                   </axis:ocultar>         
                                                    
                                                
                                                
                                                </tr>
                                                
                                                
                                                </table>
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
        <c:param name="f">axisfis005</c:param>        
        <c:param name="__botones">cancelar,9000497,9001304</c:param>
    </c:import>
</form>



<c:import url="../include/mensajes.jsp" />
</body>
</html>

