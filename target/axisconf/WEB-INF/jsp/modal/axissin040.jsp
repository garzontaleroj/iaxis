<%--
/**
*  Fichero: axissin040.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a>
*  
*  T?tulo: Modal modificar datos DESTINATARIOS  
*
*  Fecha: 19/02/2009
*/
--%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>
<script type="text/javascript">
 function f_onclickCheckbox(thiss) {
           thiss.value =  ((thiss.checked)?1:0);
           objDom.setValorPorId(thiss.id, thiss.value);
        }
        
function f_actData(thiss){        
        thiss.value = f_formatdate(thiss);
        }     
        function f_formatdate(entrada){
         var jDate = new JsFecha();

         if (!jDate.validaFecha(entrada.value)|| entrada.value.indexOf("/") == -1){
            if(entrada.value.length>0){
                entrada.value=jDate.formateaFecha(entrada.value);            
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                    if (entrada.value == 'undefined'){
                        entrada.value = '';
                    }
                }else{
                    entrada.value = '';//alert('Formato fecha incorrecto para el campo '+ title);
                }
        }
        }
        return entrada.value;
        }        
        
</script>    


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
    <c:set var="linea_trami" value="${__formdata.indexTramitacio}"/> <!-- ${LINEATRAM} -->
<%@ page contentType="text/html;charset=iso-8859-15" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axissin040" c="TIT_HTML" lit="151090"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript">
        function f_onload() {
     
      
      
        formdataPAIS = '${__formdata.CPAISRE}';
        var val1 = "<%=request.getAttribute("OK")%>"; 
        var NSINIES = "${__formdata.NSINIES}";
            if (val1=="OK"){
                parent.f_aceptar_axissin040(NSINIES); //TODO: Dato EJ. para volver a la pantalla
                this.f_but_cancelar();
            }

        try{ 
     
        if (!objUtiles.estaVacio(formdataPAIS)){
            if (!objUtiles.estaVacio(f_buscar_TPAIS(formdataPAIS))){
                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + f_buscar_TPAIS(formdataPAIS)+"</b>");
            }
         }else {
          objDom.setValorHTMLPorId("TPAIS_span", "<b></b>");
           
         }
         } catch (e) {}    
         
         f_cargar_propiedades_pantalla();
        }
        
	 function f_buscar_TPAIS(CPAIS) {
                <% 
                if (((java.util.Map) request.getAttribute("__formdata"))!= null){
                java.util.Map formdata = ((java.util.Map) request.getAttribute("__formdata"));
                if (((java.util.Map) formdata.get("listvalores"))!= null){
                java.util.Map lista = (java.util.Map)formdata.get("listvalores");
                if (((java.util.ArrayList)lista.get("lstPaises"))!= null){
                java.util.ArrayList paises = (java.util.ArrayList)lista.get("lstPaises");
                for(int i = 0;i<paises.size();i++){
                java.util.HashMap paisHash = (java.util.HashMap)paises.get(i);
                %>
                pais = <%=paisHash.get("CPAIS")%>
                if (CPAIS == pais){
                return "<%=paisHash.get("TPAIS")%>"
                }
                <%}}}}%> 
        }        

      function f_onchange_CPAIS() {
            var CPAIS=objDom.getValorPorId("CPAISRE");
            if (!objUtiles.estaVacio(CPAIS)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPAIS";
                qs=qs+"&CPAIS="+CPAIS
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axissin040.do", callbackajaxdireccion, qs, this)
            } else {
                objDom.setValorPorId("CPAISRE", "");
                objDom.setValorHTMLPorId("TPAIS_span", "");
                
            }
        }        

        function callbackajaxdireccion (ajaxResponseText){
        try{
                 var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPAISRE", "");
                            
                        }else{
                            objDom.setValorPorId("CPAISRE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS"), 0, 0));
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAIS")[0])){
                                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAIS"), 0, 0) + "</b>");
                            }
                        }
                    }
                }
                 
   
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }        
        
        function f_but_aceptar(){
             if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario ("modal_axissin040.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);   
             }
        }
        
        function f_but_cancelar(){
            parent.f_cerrar_modal("axissin040");
        }
        
        function f_recargar(thiss){
           
             
                if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'CTIPDES')){
                 
                    objDom.setValorPorId("SPERSON",'');
                    objDom.setValorPorId("SNIP",'');
                    if (!objUtiles.estaVacio( objDom.getValorPorId("NOMBRE") )){
     
                        objDom.setValorPorId("NOMBRE",'');
                        objDom.setValorPorId("NNUMIDE",'');
                    
                    }
                
                }
        
                if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'BANC')){
                  
                        var CBANCAR = objUtiles.utilSplit(thiss.value, "/")[0]; // CBANCAR
                        var CTIPBAN = objUtiles.utilSplit(thiss.value, "/")[1]; // CTIPBAN
                        objDom.setValorPorId("CBANCAR", CBANCAR);
                        objDom.setValorPorId("CTIPBAN", CTIPBAN);
                }             
      
              //  objUtiles.ejecutarFormulario ("modal_axissin040.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);   
        }   
        
        
        
/*axisper021 i axisper022*/
      function f_abrir_axisper021 () {
      var SSEGURO = "${__formdata.SSEGURO}";
            objUtiles.abrirModal("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="+document.miForm.CAGENTE.value+"&SSEGURO="+SSEGURO);
      }
      function f_cerrar_axisper022(){
      f_cerrar_modalespersona("axisper022");
      }          
      function f_cerrar_axisper021(){
      f_cerrar_modalespersona("axisper021");
      }   
      function f_nova_persona(){
      f_cerrar_modalespersona("axisper021");
      objUtiles.abrirModal("axisper022","src","modal_axisper022.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="+document.miForm.CAGENTE.value);  
      }
      function f_cerrar_modalespersona(modal){
      objUtiles.cerrarModal(modal);
      } 
      function f_aceptar_persona(SPERSON,CAGENTE, SNIP, modal){
   
        f_cerrar_modalespersona(modal);
        document.miForm.SNIP.value = SNIP;
        document.miForm.SPERSON.value = SPERSON;
        document.miForm.CAGENTE_VISIO.value = CAGENTE;
         if (!objUtiles.estaVacio(SPERSON)){
       objUtiles.ejecutarFormulario ("modal_axissin040.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);   
       // objAjax.invokeAsyncCGI("modal_axissin040.do?SPERSON="+SPERSON+"&CAGENTE="+document.miForm.CAGENTE.value, callbackAjaxActualitzaPersona, "operation=ajax_actualiza_persona", this, objJsMessages.jslit_cargando);
        }
      }
      

    
        function callbackAjaxActualitzaPersona (ajaxResponseText) {
    try{
       //alert(ajaxResponseText);
        var doc = objAjax.domParse(ajaxResponseText);

        
        if (!objAppMensajes.existenErroresEnAplicacion(doc)) {   
             objDom.setValorPorId("NNUMIDE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0));
             var NOMBRE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0);
             var APELLIDO1 = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0);
             var APELLIDO2 = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0);
             objDom.setValorPorId("NOMBRE", NOMBRE+' ' + APELLIDO1 +' '+ APELLIDO2);
             objDom.setValorPorId("SPERSON", objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0));
            
            /*
                if(objUtiles.existeObjetoXml(doc.getElementsByTagName("CCC")[0])){
                    var elementos = doc.getElementsByTagName("OB_IAX_CCC");
                    
                    var cccCombo = document.miForm.BANC;     
                    objDom.borrarOpcionesDeCombo(cccCombo);
                    objDom.addOpcionACombo(-1, '<axis:alt f="axissin040" c="SNV_COMBO" lit="1000348"/>', cccCombo, 0);
                   for (i = 0; i < elementos.length; i++) {
                
                        var codigo1 = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CBANCAR")[0]) ?
                                     objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CBANCAR"), 0, 0) : "";
                   
                        var codigo2 = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CTIPBAN")[0]) ?
                                     objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CTIPBAN"), 0, 0) : "";                                     
                
                        var codigo = codigo1+'/'+codigo2;
                                     
                        var desc   = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CBANCAR")[0]) ?
                                     objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CBANCAR"), 0, 0): "";
                            
                        objDom.addOpcionACombo(codigo, desc, cccCombo, i+1);
                    }
                    
                }   */             

             
        }          
     
    }catch(e){}
    }

        function f_abrir_axisper014(CNORDBAN,selectedPerson) {
         
            objUtiles.abrirModal("axisper014", "src", "modal_axisper014.do?operation=form&SPERSON="+selectedPerson+"&CNORDBAN=" + CNORDBAN+"&CAGENTE="+document.miForm.CAGENTE.value);            
        }  
        function f_aceptar_axisper014(selectedPerson){
            f_cerrar_axisper014();
            objUtiles.ejecutarFormulario ("modal_axissin040.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
        }
        function f_cerrar_axisper014(){
            objUtiles.cerrarModal("axisper014");
        }    


       
        function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION){
             objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
              "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION+"&TIPO=DATE");
        }
        
        function f_aceptar_axiscom001(CODIGO, TEXTO, CODIGO_CONSULTA){
            f_cerrar_axiscom001();
            if (!objUtiles.estaVacio(TEXTO))
                TEXTO = objUtiles.replaceAll(TEXTO, "-quote-", "\'");
            if (CODIGO_CONSULTA == "LISTA_PAIS") {
                objDom.setValorPorId("CPAISRE", CODIGO);
                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + TEXTO + "</b>");
            }
        }
        
        function f_cerrar_axiscom001() {
            objUtiles.cerrarModal("axiscom001");
        }        

       function f_actualitza(obj){
             objDom.setValorPorId("CPAGDES",obj.checked ? 1 : 0);
        }        
        
       
       /* ************************************** Actualizar forma de pago ******************************** */ 
        
         function f_cambia_tipo_pago(obj){

            if (flag == 0){
            flag =1;
            
                
                //habilitar-deshabilitar garant�a
                var CFORPAG = objDom.getValorComponente(obj);
                
                validar_visualizacion(CFORPAG);
                
                
                objAjax.invokeAsyncCGI("modal_axissin040.do", callbackajaxformapago, 
                        "operation=ajax_cambiar_forma_pago&CFORPAG="+CFORPAG,
                        this, objJsMessages.jslit_cambiando_forma_pago);
                        }
                        flag = 0;
            }
            
            
        function guardar_revalorizacion_1(){
        objDom.setValorPorId("PREVALI", ""); //Borramos PREVALI
        f_carga_dependencias();
        revisarEstilos();
        if(!objUtiles.utilEquals(objDom.getVisibilidadPorId("PREVALI"), "visible")){
          objDom.setValorPorId("PREVALI", "0");
        }else{
        document.miForm.PREVALI.focus();
        }
        
     }
     
        
        
    </script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
     <!--********** CALENDARIO ************************* -->
    <!-- Hoja de estilo del Calendario -->
    <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
    <!-- Script principal del calendario -->
    <script type="text/javascript" src="scripts/calendar.js"></script>
    <!-- Idioma del calendario, en funci�n del Locale -->
    <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
    <!-- Setup del calendario -->
    <script type="text/javascript" src="scripts/calendar-setup.js"></script>
    <!--*********************************** -->   
           <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axissin040" c="MODAL_AXISPER022" lit="1000214"/></c:param>
                <c:param name="nid" value="axisper022"/>
            </c:import> 
                        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axissin040" c="MODAL_AXISPER021" lit="1000235"/></c:param>
                <c:param name="nid" value="axisper021"/>
            </c:import>    
    <!-- MODAL -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
        </c:import>            
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axissin040" c="MODAL_AXISPER014" lit="1000235" /></c:param>
        <c:param name="nid" value="axisper014" />
        </c:import>         
    <form name="miForm" action="modal_axissin040.do" method="POST">
    <input type="hidden" name="operation" value="guardar" />
    <input type="hidden" name="NSINIES" value="${__formdata.NSINIES}"/>
    <input type="hidden" name="NTRAMIT" value="${__formdata.NTRAMIT}"/>
    <input type="hidden" name="SSEGURO" value="${__formdata.SSEGURO}"/>
    <input type="hidden" name="CTIPDES" value="${__formdata.CTIPDES}"/>
    <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}"/>
    <input type="hidden" name="CAGENTE_VISIO" value="${__formdata.CAGENTE_VISIO}"/>
    <input type="hidden" name="SNIP" value="${__formdata.SNIP}"/>
    <input type="hidden" name="subpantalla" value="tramitaciones"/>
    <input type="hidden" name="seccion" value="tramitaciones_destinatarios"/>
    <input type="hidden" name="isNew" value="${__formdata.isNew}"/>
    <input type="hidden" name="indexTramitacio" value="${__formdata.indexTramitacio}"/>    
    
    <input type="hidden" name="SPRODUC"  value="${__formdata.SPRODUC}" />
    <input type="hidden" name="CACTIVI"  value="${__formdata.CACTIVI}" />
    <input type="hidden" name="CTRAMIT"  value="${__formdata.CTRAMIT}" />
    <input type="hidden" name="CCAUSIN"  value="${__formdata.CCAUSIN}" />
    <input type="hidden" name="CMOTSIN"  value="${__formdata.CMOTSIN}" />
    <input type="hidden" name="NPRESTA"  value="${__formdata.NPRESTA}" />
    <input type = "hidden" id = "label_PREVALI" name = "label_PREVALI">
    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt f="axissin040" c="TITULO" lit="9900994"/></c:param>
        <c:param name="formulario"><axis:alt f="axissin040" c="TITULO" lit="9900994"/></c:param>
        <c:param name="form">axissin040</c:param>
    </c:import>
    <div class="separador">&nbsp;</div>
    <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                 <%--CodTramit:${sessionScope.tramitaciones_min[linea_trami].CTRAMIT} --%>
                <!-- *************************************************************************** -->
                <!-- **************************  DATOS GENERALES ******************************* -->
                <!-- *************************************************************************** -->
                <table class="seccion">
                    <tr>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                    </tr>
                    <tr>
                        <td class="titulocaja">
                            <b><axis:alt f="axissin040" c="TTIPTRA" lit="9001028"/></b><!-- Tipus tramitacio -->
                        </td>
                       <td class="titulocaja">
                            <b><axis:alt f="axissin040" c="TTRAMIT" lit="100588"/></b><!-- Tipus dany  -->
                        </td>                        
                        <td class="titulocaja">
                            <b><axis:alt f="axissin040" c="TTCAUSIN" lit="9000901"/></b><!-- Tipus dany  -->
                        </td>
                       <td class="titulocaja">
                            <b><axis:alt f="axissin040" c="CINFORM" lit="9000905"/></b><!-- Tramitaci�n informativa -->
                            
                        </td>                        
                        
                    </tr>
                    
                    <tr>
                        <td class="campocaja">
                         <input type="text" name="TTIPTRA" value="${sessionScope.tramitaciones_min[linea_trami].TTIPTRA}" class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin040" c="TTIPTRA" a="modificable=false&obligatorio=false"/> />
                            
                        </td>
                        <td class="campocaja">
                         <input type="text" name="TTRAMIT" value="${sessionScope.tramitaciones_min[linea_trami].TTRAMIT}" class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin040" c="TTRAMIT" a="modificable=false"/> />
                            
                        </td>                        
                        <td class="campocaja">
                            <input type="text" name="TTCAUSIN" value="${sessionScope.tramitaciones_min[linea_trami].TTCAUSIN}" class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin040" c="TTCAUSIN" a="modificable=false"/> />
                        </td>
                        <td class="campocaja" align="left">
                        <input type="checkbox" disabled  id="CINFORM" name="CINFORM" <axis:atr f="axissin040" c="CINFORM" a="modificable=false"/> value="${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.CINFORM}" 
                        <c:if test="${sessionScope.tramitaciones_min[linea_trami].CINFORM == '1'}">checked</c:if> >
                        </td>                        
                        

                    </tr>
                    
                    
                    <tr>
                    <td class="titulocaja">
                            <b><axis:alt f="axissin040" c="TESTTRA" lit="100587"/></b><!-- Estado -->
                        </td>
                        <td class="titulocaja">
                            <b><axis:alt f="axissin040" c="TSUBTRA" lit="9000852"/></b><!--Subestado -->
                        </td>
                        <td class="titulocaja">
                            <b><axis:alt f="axissin040" c="TUNITRA" lit="9000900"/></b><!-- Unidad tramitacion -->
                        </td>
                        <td class="titulocaja">
                            <b><axis:alt f="axissin040" c="TTRAMITAD" lit="140769"/></b><!-- Tramitador -->
                        </td>
 
                        <td class="titulocaja">
                            
                        </td>
                    </tr>
                    <tr>
                    <td class="campocaja">
                            <input type="text" name="TESTTRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TESTTRA}" class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin040" c="TESTTRA" a="modificable=false"/> />
                        </td>
                        <td class="campocaja">
                            <input type="text" name="TSUBTRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TSUBTRA}" class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin040" c="TSUBTRA" a="modificable=false"/> />                        
                        </td>                          
                        <td class="campocaja">
                            <input type="text" name="TUNITRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TUNITRA}" class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin040" c="TUNITRA" a="modificable=false"/> />
                        
                            
                        </td>
                        <td class="campocaja">
                           <input type="text" name="TTRAMITAD" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TTRAMITAD}" class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin040" c="TTRAMITAD" a="modificable=false"/> />
                        </td>

                                          
                        <td class="campocaja">
                             
                        </td>
                    </tr>
                    
                    
                </table>
                <!-- Primera Seccion -->
                <div class="separador">&nbsp;</div>
                <!-- Segunda seccion -->
                <table class="seccion">
                    <tr>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                    </tr>
                    <tr>
                        <td class="titulocaja">
                            <b><axis:alt f="axissin040" c="CFORPAG" lit="100712"/></b><!-- Forma de pago -->
                        </td>
                        <td class="titulocaja">
                            <b><axis:alt f="axissin040" c="IBRUREN" lit="100563"/></b><!-- Importe -->
                            <axis:visible f="axissin040" c="CMONEDA">
                                <b> - <axis:alt f="axissin040" c="CMONEDA" lit="108645"/></b><!-- Moneda -->
                            </axis:visible>
                        </td>
                        <td class="titulocaja">
                           <b><axis:alt f="axissin040" c="CTIPDUR" lit="1000376"/></b><!-- Tipo duracion -->
                        </td>
                        <td class="titulocaja">
                          <b><axis:alt f="axissin040" c="F1PAREN" lit="9901167"/></b><!--  Fecha primera renta.-->
                        </td>
                        <td class="titulocaja">
                          <b><axis:alt f="axissin040" c="FUPAREN" lit="9901540"/></b><!--  Fecha ult. renta-->
                        </td>
                    </tr>
                    
                    <tr>
                        <axis:visible f="axissin040" c="CFORPAG">
                                        <td class="campocaja">
                                            <select  name = "CFORPAG" id ="CFORPAG" <axis:atr f="axisctr031" c="CFORPAG" a="isInputText=false&obligatorio=true"/> size="1" onchange="javascript:f_cambia_tipo_pago(this)" class="campowidthselect campo campotexto">&nbsp;
                                               <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin040" c="SELECCIONAR" lit="1000348"/> - </option>
                                                <c:forEach items="${__formdata.listvalores.formaPago}" var="formaPago">
                                                    <option value = "${formaPago.CATRIBU}" <c:if test="${formaPago.CATRIBU  == __formdata.CFORPAG}">selected</c:if>>${ formaPago.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                        </axis:visible>
                        <axis:visible f="axissin040" c="IBRUREN">
                        <td class="campocaja">
                            <input type="text" name="IBRUREN" id="IBRUREN" value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IBRUREN}'/>" 
                            alt="<axis:alt f="axissin040" c="IBRUREN" lit="100563"/>" title="<axis:alt f="axissin040" c="IBRUREN" lit="100563"/>"
                            class="campowidthinput campo campotexto" style="width:75%"
                            <axis:atr f="axissin040" c="IBRUREN" a="modificable=true&obligatorio=true"/> /> 
                        </axis:visible>
                        <axis:visible f="axissin040" c="CMONEDA">
                            <input type="text" name="CMONEDA" id="CMONEDA" value="USD" 
                            alt="<axis:alt f="axissin040" c="IBRUREN" lit="108645"/>" title="<axis:alt f="axissin040" c="IBRUREN" lit="108645"/>"
                            class="campowidthinput campo campotexto" style="width:15%"
                            <axis:atr f="axissin040" c="CMONEDA" a="modificable=false&obligatorio=true"/> /> 
                        </axis:visible>
                        <axis:visible f="axissin040" c="IBRUREN">
                        </td>
                        </axis:visible>
                        <axis:visible f="axissin040" c="CTIPDUR">
                        <td>
                            <select name="CTIPDUR" id="CTIPDUR" onchange=""  size="1" title="<axis:alt f="axissin040" c="CTIPDUR" lit="1000376"/>" class="campowidthselect campo campotexto"  style="width:90%;"
                                    <axis:atr f="axissin040" c="CTIPDUR" a="isInputText=false&modificable=true&obligatorio=true"/>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin040" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listvalores.lstDurPre}">
                                            <option value = "${element.CATRIBU}" 
                                                <c:if test="${element.CATRIBU == __formdata.CTIPDUR}"> selected </c:if> />
                                                ${element.TATRIBU}
                                            </option>
                                        </c:forEach>
                            </select>
                        </td>
                        </axis:visible>
                        <axis:visible f="axissin040" c="F1PAREN">
                        <td>
                                                    <input style="width:85%" type="text" class="campowidthinput campo campotexto" id="F1PAREN" name="F1PAREN" size="15" onchange="f_actData(this)"
                                                    value ="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.F1PAREN}"/>" title="<axis:alt f="axissin040" c="F1PAREN" lit="9901167"/>" <axis:atr f="axisadm034" c="F1PAREN" a="modificable=true&obligatorio=true&formato=fecha"/>/>
                                                    <a id="icon_F1PAREN" style="vertical-align:middle;" href="#">
                                                    <img border="0" alt="<axis:alt f="axissin040" c="F1PAREN" lit="9901167" />" title="<axis:alt f="axissin040" c="F1PAREN" lit="9901167" />" src="images/calendar.gif"/>
                                                    </a>
                        </td>
                        </axis:visible>
                        <axis:visible f="axissin040" c="FUPAREN">
                        <td class="campocaja">
                                                    <input style="width:85%" type="text" class="campowidthinput campo campotexto" id="FUPAREN" name="FUPAREN" size="15" onchange="f_actData(this)"
                                                    value ="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FUPAREN}"/>" title="<axis:alt f="axissin040" c="FUPAREN" lit="9901540"/>" <axis:atr f="axisadm034" c="FUPAREN" a="modificable=true&formato=fecha"/>/>
                                                    <a id="icon_FUPAREN" style="vertical-align:middle;" href="#">
                                                    <img border="0" alt="<axis:alt f="axissin040" c="FUPAREN" lit="9901540" />" title="<axis:alt f="axissin040" c="FUPAREN" lit="9901540" />" src="images/calendar.gif"/>
                                                    </a>
                        </td>
                        </axis:visible>
                  </tr>
                  
                  
                                   
                <tr>
                        <td class="titulocaja">
                            <b><axis:alt f="axissin040" c="CREVALI" lit="109951"/></b><!-- Tipo revalorizaci�n -->
                        </td>
                        <td class="titulocaja">
                            <b id="label_PREVALI"><axis:alt f="axissin040" c="PREVALI" lit="1000382" /></b><!-- Importe revalorizaci�n -->
                        </td>
                        <%--<c:if test="${!empty __formdata.SPERSON}">--%>
                        
                        <td class="titulocaja" colspan="2">
                            <b><axis:alt f="axissin040" c="BANC" lit="100965"/></b><!--Cuenta bancaria -->
                        </td>
                     <%--   </c:if>--%>
                        
                        <td class="titulocaja">
                            <b><axis:alt f="axissin040" c="NPARTOT" lit="9002014"/></b><!-- Participaciones totales -->
                        </td>
                </tr>
                <tr>
                         <axis:visible f="axissin040" c="CREVALI">
                                         <td class="campocaja">
                                            <select style="width:200px;" name = "CREVALI" id ="CREVALI" size="1" <axis:atr f="axisctr031" c="CREVALI" a="isInputText=false&obligatorio=true"/> onchange="guardar_revalorizacion_1()" 
                                            class="campowidthselect campo campotexto">&nbsp;
                                              <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin040" c="SNV_COMBO" lit="1000348"/> - </option>
                                                <c:forEach items="${__formdata.listvalores.tipoRev}" var="tipoReval">
                                                    <option value = "${tipoReval.CATRIBU}" 
                                                    <c:if test="${__formdata.CREVALI==tipoReval.CATRIBU}">selected</c:if>> ${tipoReval.TATRIBU} </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                        </axis:visible>
                        
                        <axis:visible f="axissin040" c="IREVALI">
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" id="PREVALI" name="PREVALI" 
                                            formato="decimal"  obligatorio="true" title="<axis:alt f="axissin040" c="PREVALI" lit="1000382" />" size="15" value="<fmt:formatNumber pattern='###,##0.00' value='${__formdata.PREVALI}'/>"/> 
                                                <input type="hidden" class="campowidthinput campo campotexto" id="IREVALI" name="IREVALI" 
                                            formato="decimal"   title="<axis:alt f="axissin040" c="PREVALI" lit="1000382" />" size="15" value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IREVALI}'/>"/>
                                        </td>
                                        
                                        
                        </axis:visible>
                        
                        <td class="campocaja" colspan="2">
                           <select name = "BANC" style="width:85%" id ="BANC" size="1"  onchange="f_recargar(this);"
                                class="campowidthselect campo campotexto" <axis:atr f="axissin011" c="CBANCAR" a="isInputText=false&obligatorio=true"/>>&nbsp;
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin040" c="SNV_COMBO" lit="1000348"/> - </option>
                                <c:forEach items="${__formdata.listvalores.cuentasbancarias}" var="cuentaTomador">
                                    <option value = "${cuentaTomador.CBANCAR}/${cuentaTomador.CTIPBAN}" <c:if test="${cuentaTomador.CBANCAR  == __formdata.CBANCAR}">selected</c:if>>${cuentaTomador.TCBANCAR}
                                    </option>
                                </c:forEach>
                            </select>
                            
                            <input type="hidden" id="CBANCAR" name="CBANCAR" value="${__formdata.CBANCAR}">
                            <input type="hidden" id="CTIPBAN" name="CTIPBAN" value="${__formdata.CTIPBAN}">     
                            <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}" class="campowidthinput campo campotexto" style="width:90%"
                             <a href="javascript:f_abrir_axisper014(null,document.miForm.SPERSON.value)">
                                <img border="0" onclick="javascript:f_abrir_axisper014(null,document.miForm.SPERSON.value)" alt="<axis:alt c='BT_NUEVO_CCC' f='axissin040' lit='1000438'/>" title="<axis:alt c='BT_NUEVO_CCC' f='axissin040' lit='1000438'/>" src="images/new.gif"/>
                            </a>                            

                        </td>
                                     
                        <td class="campocaja">
                             <input type="text" class="campowidthinput campo campotexto" size="3" maxlength="3" value="${__formdata.NPARTOT}" name="NPARTOT" id="NPARTOT" onchange="" style="width:90%;" />
                        </td>
                </tr>
                <tr>
                        <td class="titulocaja">
                            <b><axis:alt f="axissin040" c="CESTADO" lit="100587"/></b><!-- Estado -->
                        </td>
                        <td class="titulocaja">
                            <b><axis:alt f="axissin040" c="CBLOPAG" lit="9001326"/></b><!-- Estados pagos -->
                        </td>
                        
                </tr>
                <tr>
                        <axis:visible f="axissin040" c="CESTADO">
                                         <td class="campocaja">
                                            <select style="width:200px;" name = "CESTADO" id ="CESTADO" size="1" <axis:atr f="axissin040" c="CESTADO" a="isInputText=false&obligatorio=true"/> onchange="" 
                                            class="campowidthselect campo campotexto">&nbsp;
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin040" c="SNV_COMBO" lit="1000348"/> - </option>
                                                <c:forEach items="${__formdata.listvalores.lstEstados}" var="estado">
                                                    <option value = "${estado.CATRIBU}" 
                                                    <c:if test="${__formdata.CESTADO==estado.CATRIBU}">selected</c:if>> ${estado.TATRIBU} </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                        </axis:visible>
                        
                        <axis:visible f="axissin040" c="CBLOPAG">
                                         <td class="campocaja">
                                            <select style="width:200px;" name = "CBLOPAG" id ="CBLOPAG" size="1" <axis:atr f="axissin040" c="CBLOPAG" a="isInputText=false&obligatorio=true"/> onchange=""
                                            class="campowidthselect campo campotexto">&nbsp;
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin040" c="SNV_COMBO" lit="1000348"/> - </option>
                                                <c:forEach items="${__formdata.listvalores.lstEstPag}" var="estpag">
                                                    <option value = "${estpag.CATRIBU}" 
                                                    <c:if test="${__formdata.CBLOPAG==estpag.CATRIBU}">selected</c:if>> ${estpag.TATRIBU} </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                        </axis:visible>
                
                </tr>
                <!--   ***************************************  ****************************************** -->
                <!--   ***************************************  ****************************************** -->
                <!--   ***************************************  ****************************************** -->
                
                <tr>
                        <axis:visible f="axissin040" c="PAGAS_EXTRA">
                         <%--c:if  test="${requestScope.CFORPAGREN == 12}"--%>
                            <td colspan="6">    
                            <table  cellpadding="0" cellspacing="5" class="area">      
                                <tr><td>
                                    &nbsp;<input type="hidden" value="${PCMODEXTRA}" id="PCMODEXTRA" name="PCMODEXTRA">
                                </td>
                                <td class="titulocaja">
                                    &nbsp;&nbsp;<u><b><axis:alt f="axissin040" c="MESES" lit="9000670"/></b></u>
                                </td>
                                </tr>
                                <tr><td>
                                    &nbsp;
                                </td>
                                
                                <td align="left" class="titulocaja">   
                                    <div class="separador">&nbsp;</div>
                                    
                                    <table class="seccion" style="width:75%;">
                                        <tr>
                                            <th style="width:20%;height:0%;"/>   
                                            <th style="width:20%;height:0%;"/>
                                            <th style="width:20%;height:0%;"/>
                                            <th style="width:20%;height:0%;"/>
                                        </tr>  
                                        <tr class="gridNotEven">
                                          <td><div style="float:left;"><axis:alt f="axissin040" c="NMES1" lit="9000674"/></div> <div style="float:right;"> 
                                            <input type="checkbox" name="NMES1" id="NMES1" value = "${__formdata.NMES1}" onclick="f_onclickCheckbox(this);" 
                                             <c:if test="${__formdata.NMES1 == 1}"> checked</c:if>
                                             <c:if test="${PCMODEXTRA == 0}"> disabled</c:if> > 
                                            </div> </td>
                                          <td><div style="float:left;"><axis:alt f="axissin040" c="NMES4" lit="9000677"/></div> <div style="float:right;"> 
                                            <input type="checkbox" name="NMES4" id="NMES4" value = "${__formdata.NMES4}" onclick="f_onclickCheckbox(this);"
                                             <c:if test="${__formdata.NMES4 == 1}"> checked</c:if>
                                             <c:if test="${PCMODEXTRA == 0}"> disabled</c:if> >
                                          </div> </td>
                                          <td><div style="float:left;"><axis:alt f="axissin040" c="NMES7" lit="9000680"/></div> <div style="float:right;"> 
                                            <input type="checkbox" name="NMES7" id="NMES7" value = "${__formdata.NMES7}" onclick="f_onclickCheckbox(this);"
                                             <c:if test="${__formdata.NMES7 == 1}"> checked</c:if>
                                             <c:if test="${PCMODEXTRA == 0}"> disabled</c:if> > 
                                            </div> </td>
                                          <td><div style="float:left;"><axis:alt f="axissin040" c="NMES10" lit="9000683"/></div> <div style="float:right;"> 
                                            <input type="checkbox" name="NMES10" id="NMES10" value = "${__formdata.NMES10}" onclick="f_onclickCheckbox(this);"
                                            <c:if test="${__formdata.NMES10 == 1}"> checked</c:if>
                                             <c:if test="${PCMODEXTRA == 0}"> disabled</c:if> > 
                                          </div> </td>
                                        </tr>
                                        <tr class="gridEven">
                                          <td><div style="float:left;"><axis:alt f="axissin040" c="NMES2" lit="9000675"/></div> <div style="float:right;"> 
                                            <input type="checkbox" name="NMES2" id="NMES2" value = "${__formdata.NMES2}" onclick="f_onclickCheckbox(this);"
                                            <c:if test="${__formdata.NMES2 == 1}"> checked</c:if> 
                                            <c:if test="${PCMODEXTRA == 0}"> disabled</c:if> > 
                                          </div> </td>
                                          <td><div style="float:left;"><axis:alt f="axissin040" c="NMES5" lit="9000678"/></div> <div style="float:right;"> 
                                            <input type="checkbox" name="NMES5" id="NMES5" value = "${__formdata.NMES5}" onclick="f_onclickCheckbox(this);"
                                            <c:if test="${__formdata.NMES5 == 1}"> checked</c:if>
                                            <c:if test="${PCMODEXTRA == 0}"> disabled</c:if> > 
                                          </div> </td>
                                          <td><div style="float:left;"><axis:alt f="axissin040" c="NMES8" lit="9000681"/></div> <div style="float:right;"> 
                                            <input type="checkbox" name="NMES8" id="NMES8" value = "${__formdata.NMES8}" onclick="f_onclickCheckbox(this);"
                                            <c:if test="${__formdata.NMES8 == 1}"> checked</c:if>
                                            <c:if test="${PCMODEXTRA == 0}"> disabled</c:if> > 
                                          </div> </td>
                                          <td><div style="float:left;"><axis:alt f="axissin040" c="NMES11" lit="9000684"/></div> <div style="float:right;"> 
                                            <input type="checkbox" name="NMES11" id="NMES11" value = "${__formdata.NMES11}" onclick="f_onclickCheckbox(this);"
                                            <c:if test="${__formdata.NMES11 == 1}"> checked</c:if>
                                            <c:if test="${PCMODEXTRA == 0}"> disabled</c:if> > 
                                          </div> </td>
                                        </tr>
                                        <tr class="gridNotEven">
                                          <td><div style="float:left;"><axis:alt f="axissin040" c="NMES3" lit="9000676"/></div> <div style="float:right;"> 
                                            <input type="checkbox" name="NMES3" id="NMES3" value = "${__formdata.NMES3}" onclick="f_onclickCheckbox(this);"
                                            <c:if test="${__formdata.NMES3 == 1}"> checked</c:if>
                                             <c:if test="${PCMODEXTRA == 0}"> disabled</c:if> > 
                                            </div> </td>
                                          <td><div style="float:left;"><axis:alt f="axissin040" c="NMES6" lit="9000679"/></div> <div style="float:right;"> 
                                            <input type="checkbox" name="NMES6" id="NMES6" value = "${__formdata.NMES6}" onclick="f_onclickCheckbox(this);"
                                            <c:if test="${__formdata.NMES6 == 1}"> checked</c:if>
                                            <c:if test="${PCMODEXTRA == 0}"> disabled</c:if> > 
                                          </div> </td>
                                          <td><div style="float:left;"><axis:alt f="axissin040" c="NMES9" lit="9000682"/></div> <div style="float:right;"> 
                                            <input type="checkbox" name="NMES9" id="NMES9" value = "${__formdata.NMES9}" onclick="f_onclickCheckbox(this);"
                                            <c:if test="${__formdata.NMES9 == 1}"> checked</c:if>
                                            <c:if test="${PCMODEXTRA == 0}"> disabled</c:if> > 
                                          </div> </td>
                                          <td><div style="float:left;"><axis:alt f="axissin040" c="NMES12" lit="9000685"/></div> <div style="float:right;"> 
                                            <input type="checkbox" name="NMES12" id="NMES12" value = "${__formdata.NMES12}" onclick="f_onclickCheckbox(this);"
                                            <c:if test="${__formdata.NMES12 == 1}"> checked</c:if>
                                            <c:if test="${PCMODEXTRA == 0}"> disabled</c:if> > 
                                          </div> </td>
                                        </tr>
                                    </table>   
                                </td>
                            </table>    
                            </td>
                         <%--/c:if--%>  
                       </axis:visible>
                    </tr>
                
                <!--   ***************************************  ****************************************** -->
                <!--   ***************************************  ****************************************** -->
                    
                </table>
                
                
            </td>
        </tr>
    </table>
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin040</c:param><c:param name="f">axissin040</c:param><c:param name="f">axissin040</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>
    </form>
    
    <script type="text/javascript">
            
            Calendar.setup({
            inputField     :    "F1PAREN",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_F1PAREN",  
            singleClick    :    true,
            firstDay       :    1
            });
           
           
            Calendar.setup({
            inputField     :    "FUPAREN",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FUPAREN",  
            singleClick    :    true,
            firstDay       :    1
            });
    </script>
    
  <c:import url="../include/mensajes.jsp" />
</body>
</html>