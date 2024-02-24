<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%/**
*  Fichero: axisctr090.jsp
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavier Pastor</a>
*  
*  Liquidación de comisiones
*
*
*  Fecha: 15/07/2009
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axisctr090" c="TITULO" lit="9001776"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        
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
        
        
        <c:import url="../include/carga_framework_js.jsp" />
     <script type="text/javascript">        
        
            function f_onload() {
             <c:if test="${empty __formdata.LIQUID || __formdata.LIQUID == 1 }">
               objDom.setVisibilidadPorId("SPR","hidden");
               objDom.setVisibilidadPorId("SPR_TEXT","hidden");
            
             </c:if>
             <c:if test="${!empty __formdata.LIQUID && __formdata.LIQUID == 0 }">
                objDom.setVisibilidadPorId("SPR","visible");
                objDom.setVisibilidadPorId("SPR_TEXT","visible");            
             </c:if>  
            
              var CAGENTE = "${__formdata.CAGENTE}";
            
              if (!objUtiles.estaVacio(CAGENTE) ){
               document.miForm.CAGENTE_TEXT.value = CAGENTE;
               document.miForm.NOMBRE_TEXT.value = "${__formdata.TAGENTE}";
              }   
              
              f_cargar_procesos();
              f_cargar_propiedades_pantalla();
                
            }
              
            function f_recargar(){
               var a = 1;
               //alert("RECARGO");               
              //  objUtiles.ejecutarFormulario ("axis_axisctr090.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);    
                
            }
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr080", "cancelar", document.miForm, "_self");
            } 
            
    
            <%-- BUG: 24993 2012-12-06 AEG se agrega llamado : objValidador.validaEntrada --%>
            function f_actualizar_agente(){
              if (objValidador.validaEntrada()) {  
                     objAjax.invokeAsyncCGI("axis_axisctr090.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE_TEXT), this, objJsMessages.jslit_cargando);
              }
             }
             
            function f_imprimir_fitxer(pfitxer){
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?mantenerExtension=mantenerExtension&mimetype="+escape("text/xml")+"&operation=tunnel&file="+pfitxer,600,200);
            }  
            
             function f_formatdate(entrada,title){
             var jDate = new JsFecha();
                if(entrada.value.length>0){
                    entrada.value=jDate.formateaFecha(entrada.value);
                
                    if(jDate.validaFecha(entrada.value)){
                        entrada.value=jDate.formateaFecha(entrada.value);
                    }else{
                        alert("<axis:alt f="axisctr090" c="ALER_ERR" lit="1000421"/>");
                    }
                }
            }            
            
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/    
        
            function callbackAjaxCambiarAgente(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);

                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado);
                objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);
                objDom.setValorPorId("CAGENTE", CAGENTEformateado); 
                objDom.setValorPorId("TAGENTE", NOMBREformateado); 
                    }
            }
            
                 
            function callbackAjaxCargarAgente(ajaxResponseText){
                
                var doc=objAjax.domParse(ajaxResponseText);
                
                var elementos = doc.getElementsByTagName("element");
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                        objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado); 
                        objDom.setValorPorId("CAGENTE", CAGENTEformateado); 
                        objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado); 
                        objDom.setValorPorId("TAGENTE", NOMBREformateado); 
                    }else{
                        
                        objDom.setValorPorId("NOMBRE_TEXT",""); 
                        objDom.setValorPorId("CAGENTE_TEXT","");
                        objDom.setValorPorId("CAGENTE","");
                         objDom.setValorPorId("TAGENTE", ""); 
                    }
            
                
                }
             
            }
            
            <%-- BUG: 24993 2012-12-06 AEG se agrega la funcion : f_cargar_datos() --%>
            function f_cargar_datos() {
               //DEMO GENERALI
               //var V_RUTA = "${__formdata.V_RUTA}";
               var V_RUTA = $("#TFILE").val();
               //FIN DEMO GENERALI
               
               f_cargar_procesos();
               if (!objUtiles.estaVacio(V_RUTA)){ 
                 objDom.setVisibilidadPorId("TFILE","hidden");
                 objDom.setVisibilidadPorId("label_TFILE","hidden");
               }
            }
            
            function f_cargar_procesos()
            {     
            
                var CEMPRES = document.miForm.CEMPRES.value;
                var PMODO =  document.miForm.PMODO_AUX.value;
                var FECLIQ = document.miForm.FECLIQ.value;   
                             
                 if (objUtiles.estaVacio(PMODO)){       
                    PMODO = objDom.getValorPorId("PMODO");
                 }                           
              
                objAjax.invokeAsyncCGI("axis_axisctr090.do", callbackAjaxCargaProc, 
                   "operation=ajax_cargar_procesos&CEMPRES=" + CEMPRES + "&PMODO=" +PMODO + "&FECLIQ="+FECLIQ,
                   this, objJsMessages.jslit_cargando);
            
            }
            
            
            function callbackAjaxCargaProc(ajaxResponseText) {                
               
                try{ 
                var doc = objAjax.domParse(ajaxResponseText);                
                                
           //     if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var comboProc = document.miForm.SPR;   
                    var SELECT;
             
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        objDom.borrarOpcionesDeCombo(comboProc);
                            objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", comboProc, 0);
                            for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                                                     
                                var TDESC = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TDESC")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TDESC")[0].childNodes[0].nodeValue : "");
                                var SPROCES = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("SPROCES")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("SPROCES")[0].childNodes[0].nodeValue : "");
                               
                                objDom.addOpcionACombo(SPROCES, TDESC, comboProc, i+1);                                
                                
                                if (objDom.getValorPorId("SPROCES") == SPROCES)
                                {
                                    comboProc[i+1].selected = "1";                     
                                }
                            }   
                            
                           
                        }else{
                            objDom.borrarOpcionesDeCombo (comboProc);
                            objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", comboProc, null);
                        }
               //  }
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
                }   
            }
            
            
            function f_abrir_axisctr014() {
                objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
            }
            
            function f_cerrar_axisctr014() {
                objUtiles.cerrarModal("axisctr014")
            }    
            function f_aceptar_axisctr014 (CAGENTE){
                objDom.setValorPorId("CAGENTE", CAGENTE);
                f_cerrar_axisctr014();
                objAjax.invokeAsyncCGI("axis_axisctr090.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            }  
            
            function f_but_aceptar(){
             if (objValidador.validaEntrada()){
                 objUtiles.ejecutarFormulario ("axis_axisctr090.do", "liquidar", document.miForm, "_self", objJsMessages.jslit_cargando);    
                 }
            }
         
            function f_enviar_fichero(FILE){
            
                if(FILE!=null && FILE!=''){
                            //alert(FILE);
                            //alert(document.miForm.FILE.value);
                                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+document.miForm.FILE.value+"&mimetype=csv"); //+"&mimetype=csv"
                }
            
            
            }
            
            function f_ver(id){
              if(id == 1){
                  objDom.setVisibilidadPorId("SPR","hidden");
                  objDom.setVisibilidadPorId("SPR_TEXT","hidden");
                  f_recargar();
             }else if (id == 0){
                  objDom.setVisibilidadPorId("SPR","visible");
                  objDom.setVisibilidadPorId("SPR_TEXT","visible");
                  revisarEstilos();
              }else if (id == 3){
              
                  var LIQUID = "${__formdata.LIQUID}" 
                  objDom.setVisibilidadPorId("SPR","visible");
                  objDom.setVisibilidadPorId("SPR_TEXT","visible");
                  revisarEstilos();
              }
              
             
            }
            
            function f_real(){
                objDom.setValorPorId("PREVIO_REAL","real");      
                objDom.setValorPorId("PMODO_AUX",0);      
                
                
                
                //document.getElementById("LIQUID").value = 1;                
                //objDom.setValorPorId("LIQUID",1);                 
               // f_recargar();            
            }
            
            function f_previo(){
                objDom.setValorPorId("PREVIO_REAL","previo"); 
                objDom.setValorPorId("PMODO_AUX",1);    
                //document.getElementById("LIQUID").value = 1;
                
                //objDom.setValorPorId("LIQUID",1); 
                f_recargar();            
            }
            
            function f_actualizar_valor(thiss){
            document.miForm.SPROCES.value = thiss;
            }
        </script>
    </head>

    
    <body onload="f_onload()">
<c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
        <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="CAGENTE" id = "CAGENTE" value="${__formdata.CAGENTE}"/>
        <input type="hidden" name="TAGENTE" id = "TAGENTE" value="${__formdata.TAGENTE}"/>
        <input type="hidden" name="SPROCES" id = "SPROCES" value="${__formdata.SPROCES}"/>
        <input type="hidden" name="PREVIO_REAL" id = "PREVIO_REAL" value="${__formdata.PREVIO_REAL}"/>
        <input type="hidden" name="PMODO_AUX" id = "PMODO_AUX" value="${__formdata.PMODO_AUX}"/>
       
        
             <c:import url="../include/titulo_nt.jsp">
                    <c:param name="titulo"><axis:alt f="axisctr090" c="TITULO_090" lit="9001776" /></c:param>
                    <c:param name="form">axisctr090</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr090" c="TITULO_014" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                    <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisctr090" c="TITULO_IMPR" lit="1000205" />|true</c:param>
            </c:import>
           
  
    
           
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                  <table class="seccion">
                      <tr>
                        <td>
                        
                        
                          <table class="area" align="center">
                             <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>                          
                                
                            </tr>
                                    <tr>
                                        <td class = "campocaja" colspan="4" >
                                            <div class="separador">&nbsp;</div>     
                                            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr090" c="TITULO_90" lit="9001776"/>
                                        </td>
                                     </tr>
                                     <tr>
                                         <td  class = "titulocaja" colspan="2">
                                           <b><axis:alt f="axisctr090" c="CEMPRES" lit="101619" /></b>
                                         </td>
                                         <td  class = "titulocaja" colspan="2">
                                               <b><axis:alt f="axisctr090" c="CAGENTE" lit="100584" /></b>
                                        </td>
                                      </tr>
                                      <tr>
                                       <%-- Empresa --%>
                                            <td class="campocaja" colspan="2"> 
                                                <select name = "CEMPRES" id ="CEMPRES" size="1" onchange="f_recargar(); f_cargar_procesos();" class="campo campotexto" style="width:90%"
                                                title="<axis:alt f="axisctr090" c="CEMPRES" lit="101619"/>">
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr090" c="SELECTED" lit="1000348"/> - </option>
                                                    <c:forEach items="${__formdata.listValores.LSTEMPRESAS}" var="item">
                                                        <option value = "${item.CEMPRES}" <c:if test="${__formdata.CEMPRES == item.CEMPRES}"> selected </c:if>>${item.TEMPRES}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                             <axis:visible f="axisctr090" c="CAGENTE"> 
                                             <td class="campocaja" colspan="2">
                                                <%-- BUG: 24993 2012-12-06 AEG se agrega formato="entero" --%>
                                                <input type="text" name="CAGENTE_TEXT" id="CAGENTE_TEXT" value="${__formdata.CODI}" class="campowidthinput campo campotexto" style="width:20%"
                                                <axis:atr f="axisctr090" c="CAGENTE" a="modificable=true"/> onchange="f_actualizar_agente()" formato="entero" />
                                                <a id="icon_CAGENTE" >
                                                <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/></a>
                                                <input  style="width:70%" type="text" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${__formdata.NOMBRE}" <axis:atr f="axisctr090" c="CAGENTE" a="modificable=false"/> class="campowidthinput campo campotexto"/>
                                            </td>
                                             </axis:visible>
                                        </tr>
                                        <tr>
                                             <!--F.inicio antes mes -->    
                                             <td  class = "titulocaja">
                                               <b><axis:alt f="axisctr090" c="FECLIQ" lit="9902234" /></b>
                                             </td> 
                                         
                                             <!-- Proceso -->
                                              <td>
                                              </td>
                                              <td id="SPR_TEXT"  class="titulocaja" colspan="2">
                                               <b><axis:alt f="axisctr090" c="SPR_TEXT" lit="9001980" /></b>
                                             </td>
                                       </tr>
                                       
                                        <tr>           
                                          
                                            <td class="campocaja" colspan="1">
                                                        <%-- BUG: 24993 2012-12-06 AEG se cambia la funcion del onchange : onchange="f_cargar_datos()" --%>
                                                        <input type="text" onchange="f_cargar_datos()" onblur="javascript:f_formatdate(this,'')" formato="fecha" <axis:atr f="axisctr090" c="FECLIQ" a="modificable=true&isInputText=true"/>  alt="<axis:alt f="axisctr090" c="FECLIQ" lit="9902234"/>" title="<axis:alt f="axisctr090" c="FECLIQ" lit="9902234"/>"
                                                        name="FECLIQ" id="FECLIQ"  value="<fmt:formatDate value="${__formdata.FECLIQ}" pattern="dd/MM/yyyy" />" style="width:100px;" class="campowidthinput campo campotexto_ob"/>
                                                        <axis:visible c="ICO_FECLIQ" f="axisctr090">
                                                        <a id="icon_FECLIQ" style="vertical-align:middle;">
                                                        <img alt="<axis:alt f="axisctr090" c="SELECT" lit="108341"/>" title="<axis:alt f="axisctr090" c="FECLIQ" lit="9902234" />" src="images/calendar.gif"/></a>
                                                        </axis:visible>
                                            </td>
                    
                                              <td class="titulocaja">
                                              <axis:visible c="RD_LIQUIDA" f="axisctr090">
                                                <input  value="1" onclick="f_ver(1); f_cargar_procesos();" type="radio" id="LIQUID" name="LIQUID" <c:if test="${__formdata.LIQUID == 1 || empty __formdata.LIQUID}"> checked </c:if> />                                                
                                                <b><axis:alt f="axisctr090" c="LIQUID_1" lit="9001771"/></b>                                                
                                              </axis:visible>
                                              <axis:visible c="RD_EXECUTE" f="axisctr090">
                                                <input  value="0" onclick="f_ver(0); f_cargar_procesos();" type="radio" id="LIQUID" name="LIQUID" <axis:atr f="axisctr090" c="RD_EXECUTE" a="modificable=true"/> <c:if test="${__formdata.LIQUID == 0}"> checked </c:if> />
                                                <b><axis:alt f="axisctr090" c="LIQUID_2" lit="9901190"/></b>   
                                              </axis:visible>
												<axis:ocultar f="axisctr090" c="LIQUID_3" dejarHueco="false">  
												<td class="titulocaja">
                                                    <input  value="3" onclick="f_ver(3); f_cargar_procesos();" type="radio" id="LIQUID" name="LIQUID" <c:if test="${__formdata.LIQUID == 3}"> checked </c:if> />
                                                    <b><axis:alt f="axisctr090" c="LIQUID_3" lit="9908770"/></b>
												 </td>	
                                                </axis:ocultar> 
                                              </td> 
                                                
                                           
                                                <td  colspan="2">
                                                <select name= "SPR" id ="SPR" size="1" onchange="f_actualizar_valor(this.value)" class="campo campotexto" style="width:70%"
                                                  title="<axis:alt f="axisctr090" c="SPR" lit="101619"/>">
                                                    <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisctr090" c="SELECTED" lit="1000348"/> - </option>
                                                    <c:forEach items="${__formdata.SPR}" var="item">
                                                         <option value = "${item.SPROCES}"
                                                        <c:if test="${item.SPROCES == __formdata.SPROCES}"> selected </c:if>>                                                        
                                                        ${item.TDESC}</option>
                                                    </c:forEach>
                                                </select>                                           
                                                </td>                                                                                               
                                      </tr>
                                      
                                      <tr>                                       
                                        <td class="titulocaja">
                                          <axis:visible c="RD_PREVIO" f="axisctr090">
                                            <input  value="1" type="radio" id="PMODO" onclick="f_previo(); f_cargar_procesos();" name="PMODO" <c:if test="${__formdata.PMODO == 1 || empty __formdata.PMODO}"> checked </c:if> />
                                            <b><axis:alt f="axisctr090" c="PMODO_1" lit="9000632" /></b>  
                                            </axis:visible>
                                            <axis:visible c="RD_REAL" f="axisctr090">
                                            <input  value="0" type="radio" id="PMODO" onclick="f_real(); f_cargar_procesos();" name="PMODO" <axis:atr f="axisctr090" c="RD_REAL" a="modificable=true"/>  <c:if test="${__formdata.PMODO == 0}"> checked </c:if> />
                                            <b><axis:alt f="axisctr090" c="PMODO_2" lit="9000506" /></b>  
                                            </axis:visible>
                                        </td>                                         
                                      </tr>
                                      <tr>
                                             <axis:ocultar f="axisctr090" c="SUCURSAL" dejarHueco="false">   
                                             <td  class = "titulocaja">
                                               <b><axis:alt f="axisctr090" c="SUCURSAL" lit="9002202" /></b>
                                             </td>
                                             </axis:ocultar>
                                             <axis:ocultar f="axisctr090" c="ADNSUC" dejarHueco="false">   
                                             <td  class = "titulocaja">
                                               <b><axis:alt f="axisctr090" c="ADNSUC" lit="9902313" /></b>
                                             </td>
                                             </axis:ocultar>                                             

                                             <!-- joan -->
                                             <axis:ocultar f="axisctr090" c="CAB_CLIQUIDO" dejarHueco="false">   
                                             <td  class = "titulocaja">
                                             <b><axis:alt f="axisctr090" c="CAB_CLIQUIDO" lit="9902535"/></b> <%-- Corte de cuentas --%>
                                             </td>
                                             </axis:ocultar>                                             
                                             <!-- joan -->
                                             
                                     </tr>
                                     <tr>
                                             <axis:ocultar f="axisctr090" c="SUCURSAL" dejarHueco="false">   
                                             <td>
                                               <select name= "SUCURSAL" id ="SUCURSAL" size="1" onchange="" class="campo campotexto" style="width:70%"
                                                  title="<axis:alt f="axisctr090" c="SUCURSAL" lit="9002202"/>">
                                                    <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisctr090" c="SELECTED" lit="1000348"/> - </option>
                                                    <c:forEach items="${__formdata.listValores.LSTASUC}" var="item">
                                                         <option value = "${item.CAGENTE}"
                                                        <c:if test="${item.CAGENTE == __formdata.SUCURSAL}"> selected </c:if>>                                                        
                                                        ${item.TAGENTE}</option>
                                                    </c:forEach>
                                                </select>  
                                             </td>
                                             </axis:ocultar>
                                             <axis:ocultar f="axisctr090" c="ADNSUC" dejarHueco="false">   
                                             <td>
                                               <select name= "ADNSUC" id ="ADNSUC" size="1" onchange="" class="campo campotexto" style="width:70%"
                                                  title="<axis:alt f="axisctr090" c="ADNSUC" lit="9902313"/>">
                                                    <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisctr090" c="SELECTED" lit="1000348"/> - </option>
                                                    <c:forEach items="${__formdata.listValores.LSTAGENTES}" var="item">
                                                         <option value = "${item.CAGENTE}"
                                                        <c:if test="${item.CAGENTE == __formdata.ADNSUC}"> selected </c:if>>                                                        
                                                        ${item.TAGENTE}</option>
                                                    </c:forEach>
                                                </select>  
                                             </td>
                                             </axis:ocultar>
                                             
                                             <!-- ini BUG 0020164 - 15/11/2011 - JMF -->
                                             <axis:ocultar f="axisctr090" c="CLIQUIDO" dejarHueco="false">   
                                            <td class="titulocaja">
                                               <input  value="2" type="radio" id="CLIQUIDO" name="CLIQUIDO" <c:if test="${__formdata.CLIQUIDO == 2 || empty __formdata.CLIQUIDO}"> checked </c:if> />                                                
                                               <b><axis:alt f="axisctr090" c="CLIQUIDO_2" lit="103233"/></b>                                                
                                               <input  value="1" type="radio" id="CLIQUIDO" name="CLIQUIDO" <c:if test="${__formdata.CLIQUIDO == 1}"> checked </c:if> />                                                
                                               <b><axis:alt f="axisctr090" c="CLIQUIDO_1" lit="101778"/></b>                                                
                                               <input  value="0" type="radio" id="CLIQUIDO" name="CLIQUIDO" <c:if test="${__formdata.CLIQUIDO == 0}"> checked </c:if> />
                                               <b><axis:alt f="axisctr090" c="CLIQUIDO_0" lit="101779"/></b>                                                
                                            </td>  
                                            </axis:ocultar>
                                             <!-- fin BUG 0020164 - 15/11/2011 - JMF -->
                                     </tr>
                        </table>
                   </td>
                </tr>
                
                <tr>
                <td>
                <!-- Seccion 4 Informes-->
                                        <axis:visible f="axisctr090" c="TFILE">
                                        <div class="separador">&nbsp;</div>
                                        <table class="area" align="center">  
                                                 <tr>
                                                        <th style="width:50%;height:0px"></th>        
                                                        <th style="width:50%;height:0px"></th>
                                                 </tr>       
                                                 <c:if test="${!empty __formdata.V_RUTA}">
                                                    <tr>
                                                        <axis:ocultar f="axisctr090" c="TFILE" dejarHueco="false">
                                                            <td class="titulocaja">
                                                                <b id="label_TFILE"><axis:alt f="axisctr090" c="label_TFILE" lit="107913"/></b> <%-- Links fitxers generats --%>
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                </c:if>                                       
                                                <c:if test="${!empty __formdata.V_RUTA}">                                   
                                                    <tr>
                                                        <axis:ocultar f="axisctr090" c="TFILE" dejarHueco="false">
                                                            <td class="campocaja" id="fichero">
                                                                  <input type="text" readonly 
                                                               style="text-decoration:underline;background-color:transparent;border:0;cursor:pointer" 
                                                               onclick="javascript:f_imprimir_fitxer(this.value)" class="campowidthinput campo campotexto_ob" size="15"  name="TFILE" id="TFILE"
                                                               title="<axis:alt f="axisctr090" c="TFILE" lit="107913"/>" value="${__formdata.V_RUTA}"/>                                                                                                        
                                                            </td>                                          
                                                        </axis:ocultar>
                                                        <td>                                            
                                                    </tr>
                                                    <tr>
                                                        <axis:ocultar f="axisctr090" c="TFILE" dejarHueco="false">
                                                            <td class="campocaja" id="fichero">
                                                                  <input type="text" readonly 
                                                               style="text-decoration:underline;background-color:transparent;border:0;cursor:pointer" 
                                                               onclick="javascript:f_imprimir_fitxer(this.value)" class="campowidthinput campo campotexto_ob" size="15"  name="TFILE2" id="TFILE2"
                                                               title="<axis:alt f="axisctr090" c="TFILE" lit="107913"/>" value="${__formdata.V_RUTA2}"/>                                                                                                        
                                                            </td>  
                                                        </axis:ocultar>
                                                        <td>                                            
                                                    </tr>   
                                                   </c:if>                                                   
                                            </table>                                            
                                        <div class="separador">&nbsp;</div>
                                        </axis:visible>
                                        </td>
                                        </tr>
                
            </table>
            </td>
                </tr>
            </table>            
            
            <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axisctr090</c:param>
            <c:param name="__botones">salir,aceptar</c:param>
            </c:import>
                
       </form>
       
<script type="text/javascript">
    Calendar.setup({
        inputField     :    "FECLIQ",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FECLIQ", 
        singleClick    :    true,
        firstDay       :    1
    });
    

    </script>

</form>
     <c:import url="../include/mensajes.jsp"/>
    
    </body>

</html>
