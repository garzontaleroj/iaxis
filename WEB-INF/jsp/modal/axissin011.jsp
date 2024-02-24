<%/* Revision:# SF3v5ceTqaHG7mhYwnlJEQ== # */%>
<%--
/**
*  Fichero: axissin011.jsp
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

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
    <c:set var="linea_trami" value="${__formdata.indexTramitacio}"/> <!-- ${LINEATRAM} -->
<%@ page contentType="text/html;charset=iso-8859-15" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt c='TITLE' f='axissin011' lit='151090'/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript">
        function f_onload() { 
            f_cargar_propiedades_pantalla();

        formdataPAIS = '${__formdata.CPAISRE}';
        var val1 = "<%=request.getAttribute("OK")%>"; 
        var NSINIES = "${__formdata.NSINIES}";
        objDom.setValorPorId("NSINIES_O",NSINIES);
        var CAGENTE = objDom.getValorPorId("CAGENTE"); 
        var SPROFES = "${__formdata.SPROFES}";
        $("#SPROFES").val(SPROFES);
        var SPERSON = "${__formdata.SPERSON}";
        $("#SPERSON").val(SPERSON);
        var NNUMIDE = "${__formdata.NNUMIDE}";
        $("#NNUMIDE").val(NNUMIDE);
        /*var TNOMBRE = "${__formdata.TNOMBRE}";
        $("#NOMBRE").val(TNOMBRE);*/
        
        if (objUtiles.estaVacio(CAGENTE)){
            objDom.setValorPorId("CAGENTE",objDom.getValorPorId("CAG_AUX"));
        }
        
            if (val1=="OK"){
                parent.f_aceptar_axissin011(NSINIES,SPROFES); //TODO: Dato EJ. para volver a la pantalla
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
                objAjax.invokeAsyncCGI("modal_axissin011.do", callbackajaxdireccion, qs, this)
            } else {
                objDom.setValorPorId("CPAISRE", "");
                objDom.setValorHTMLPorId("TPAIS_span", "");
                
             }
        }      
      
      function f_onchange_CPROVIN() {
    	  var CPAIS=objDom.getValorPorId("CPAISRE");
          var CPROVIN=objDom.getValorPorId("CPROVIN");
          if (!objUtiles.estaVacio(CPROVIN)){
              var qs="operation=ajax_direccion";
              qs=qs+"&op="+"CPROVIN";
              qs=qs+"&CPAIS="+CPAIS;
              qs=qs+"&CPROVIN="+CPROVIN;
              qs=qs+"&dt="+(new Date().getTime());
              //qs=qs+"&sin_provincias"+document.miForm.sinProvincias.value;
              objAjax.invokeAsyncCGI("modal_axissin011.do", callbackajaxdireccion, qs, this)
          }else{
              objDom.setValorPorId("CPROVIN", "");
              objDom.setValorHTMLPorId("TPROVIN_span", "");
              objDom.setVisibilidadPorId("findPoblacion", "hidden");
              limpiaCampos("CPROVIN");
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
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPROVIN")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                        	objDom.setValorPorId("CPROVIN", "");
                            //limpiaCampos("CPROVIN");
                        }else{
                            objDom.setValorPorId("CPROVIN", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPROVIN"), 0, 0));
                            objDom.setVisibilidadPorId("findProvincia", "visible");
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPROVIN")[0])){
                            	objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPROVIN"), 0, 0) + "</b>");
                                
                               // limpiaCampos("CPROVIN");
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
            <c:if test="${__configform.axissin011__CPAGDES__visible!=false}" > 
                objDom.setValorPorId("CPAGDES",$("#CPAGDES").is(":checked")? 1 : 0);
            </c:if>
            if ($("#CTIPDES").val()==54 ||
			    $("#CTIPDES").val()==21 ||
				$("#CTIPDES").val()==22 ||
				$("#CTIPDES").val()==23 ||
				$("#CTIPDES").val()==24 ||
				$("#CTIPDES").val()==25 ||
				$("#CTIPDES").val()==26){
                $("#SPERSON").val($("#SPERSED").val());
            }

            if (objValidador.validaEntrada()) {   
                objUtiles.ejecutarFormulario ("modal_axissin011.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
        function f_but_cancelar(){
            parent.f_cerrar_modal("axissin011");
        }
        function f_recargar(thiss){

        if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'CTIPDES')){
        objDom.setValorPorId("SPERSON",'');
        objDom.setValorPorId("SNIP",'');
            if (!objUtiles.estaVacio( objDom.getValorPorId("NOMBRE") )){
                objDom.setValorPorId("NOMBRE",'');
                objDom.setValorPorId("NNUMIDE",'');
                
            }

          objDom.setValorPorId('PASIGNA','');
        }
        
           if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'BANC')){
                var CBANCAR = objUtiles.utilSplit(thiss.value, "@@")[0]; // CBANCAR
                var CTIPBAN = objUtiles.utilSplit(thiss.value, "@@")[1]; // CTIPBAN
                objDom.setValorPorId("CBANCAR", CBANCAR);
                objDom.setValorPorId("CTIPBAN", CTIPBAN);
            }             

            objUtiles.ejecutarFormulario ("modal_axissin011.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);   
        }   
        
        
        
/*axisper021 i axisper022x*/
      function f_abrir_axisper021 () {
      var SSEGURO = "${__formdata.SSEGURO}";
            objUtiles.abrirModal("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBPRIV&CAGENTE="+document.miForm.CAGENTE.value+"&SSEGURO="+SSEGURO);
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
        var porigen = 'INT';
        if (modal =='axisper022')
         porigen = 'NUEVO';
    
        document.miForm.ORIGEN.value = porigen;
        document.miForm.SNIP.value = SNIP;
        document.miForm.SPERSON.value = SPERSON;
        document.miForm.CAGENTE_VISIO.value = CAGENTE;
         if (!objUtiles.estaVacio(SPERSON)){
       objUtiles.ejecutarFormulario ("modal_axissin011.do?CAGE="+document.miForm.CAGENTE.value, "traspasar", document.miForm, "_self", objJsMessages.jslit_cargando);   
       // objAjax.invokeAsyncCGI("modal_axissin011.do?SPERSON="+SPERSON+"&CAGENTE="+document.miForm.CAGENTE.value, callbackAjaxActualitzaPersona, "operation=ajax_actualiza_persona", this, objJsMessages.jslit_cargando);
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
                    objDom.addOpcionACombo(-1, '<axis:alt c="OPC_COMBO" f="axissin011" lit="1000348"/>', cccCombo, 0);
                    
                    
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
            objUtiles.ejecutarFormulario ("modal_axissin011.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
        }
        function f_cerrar_axisper014(){
            objUtiles.cerrarModal("axisper014");
        }    

        function f_abrir_axisprf000(){
            f_abrir_modal('axisprf000',null,"&pantalla=destinatario");
        }
        
        function f_but_salir(){
            objUtiles.ejecutarFormulario ("modal_axissin011.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);            
        }
        
        function f_aceptar_modal(pantalla, param){
            if(pantalla="axisprf000"){
                $("#isNew").val("");
            }
            objUtiles.cerrarModal(pantalla);
            objUtiles.ejecutarFormulario ("modal_axissin011.do?"+param, "form", document.miForm, "_self", objJsMessages.jslit_cargando);            
        }
            
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
              
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
            
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    

            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
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
            else if (CODIGO_CONSULTA == "LISTA_PROVINCIA") {
                objDom.setValorPorId("CPROVIN", CODIGO);
                objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + TEXTO + "</b>");
            }
        }
        
        function f_cerrar_axiscom001() {
            objUtiles.cerrarModal("axiscom001");
        }        

       function f_actualitza(obj){
             objDom.setValorPorId("CPAGDES",obj.checked ? 1 : 0);
        }        
        function asignarPercent(sel){
            
            var values = sel.options[sel.selectedIndex].value.split("|");
            
            var sperson = values[0];
            var percent = values[1];
             objDom.setValorPorId("SPERSON",sperson);
            if(percent){
                objDom.setValorPorId('PASIGNA',percent );
            }else{
                objDom.setValorPorId('PASIGNA','' );
            }
        }

        function f_abrir_axiper018(selectedSperson,cagente, nano){
            <%-- objDom.setVisibilidadPorId('but_cerrar_modal_axisper018', 'hidden');--%>
            var nanosel = nano;
            if(!objUtiles.estaVacio(selectedSperson)){
            	if(objUtiles.estaVacio(nano))
            		nanosel = objDom.getValorPorId("NANO");
            	
                objUtiles.abrirModal("axisper018","src","modal_axisper018.do?operation=init&SPERSONselected="+selectedSperson+"&CAGENTEselected="+document.miForm.CAGENTE.value+"&NANOselected="+nanosel);
            }else{   
                alert("-Campos Destinatario y Asegurado requeridos");
            }
        }
        function f_aceptar_axisper018(){
            objUtiles.cerrarModal("axisper008");
            objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&faceptar=f_aceptar_mtn_axisper001", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }        
        
        function f_aceptar2_axisper018(NANO){
            objUtiles.cerrarModal("axisper018");            
            objDom.setValorPorId("NANO", NANO);
            document.miForm.NANO.value = NANO;
            
        } 
      
        function f_cerrar_axisper018(){
          objUtiles.cerrarModal("axisper018");
        }
        
        
    </script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
           <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt c="TITULO_022" f="axissin011" lit="1000214"/></c:param>
                <c:param name="nid" value="axisper022"/>
            </c:import> 
                        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt c="TITULO_021" f="axissin011" lit="1000235"/></c:param>
                <c:param name="nid" value="axisper021"/>
            </c:import>    
    <!-- MODAL -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
        </c:import>            
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt c="TITULO_014" f="axissin011" lit="1000235"/></c:param>
        <c:param name="nid" value="axisper014" />
        </c:import>    
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisprf000|<axis:alt f="axisprf001" c="MODAL_AXISPRF000" lit="9904785" /></c:param>
        </c:import>
    <form name="miForm" action="modal_axissin011.do" method="POST">
    <input type="hidden" name="operation" value="guardar" />
    
    <input type="hidden" name="ORIGEN" id="ORIGEN" value="${__formdata.ORIGEN}"/>
    <input type="hidden" name="NSINIES" id="NSINIES" value="${__formdata.NSINIES}"/>
    <input type="hidden" name="NTRAMIT" id="NTRAMIT" value="${__formdata.NTRAMIT}"/>
    <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}"/>
    <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}"/>
    <input type="hidden" name="NANO" id="NANO" value="${__formdata.NANO}"/>
    <input type="hidden" name="CAGENTE_VISIO" id="CAGENTE_VISIO" value="${__formdata.CAGENTE_VISIO}"/>
    <input type="hidden" name="SNIP" id="SNIP" value="${__formdata.SNIP}"/>
    <input type="hidden" name="subpantalla" id="subpantalla" value="tramitaciones"/>
    <input type="hidden" name="seccion" id="seccion" value="tramitaciones_destinatarios"/>
    <input type="hidden" name="isNew" id="isNew" value="${__formdata.isNew}"/>
    <input type="hidden" name="indexTramitacio" id="indexTramitacio" value="${__formdata.indexTramitacio}"/>    
    
    <input type="hidden" name="SPRODUC"  id="SPRODUC" value="${__formdata.SPRODUC}" />
    <input type="hidden" name="CACTIVI"  id="CACTIVI" value="${__formdata.CACTIVI}" />
    <input type="hidden" name="CTRAMIT"  id="CTRAMIT" value="${__formdata.CTRAMIT}" />
    <input type="hidden" name="CCAUSIN"  id="CCAUSIN" value="${__formdata.CCAUSIN}" />
    <input type="hidden" name="CMOTSIN"  id="CMOTSIN" value="${__formdata.CMOTSIN}" />
    
    
    <input type="hidden" name="NTRAMIT9999" id="NTRAMIT9999" value="${__formdata.NTRAMIT9999}" />
    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt c="TITULO" f="axissin011" lit="9000896"/></c:param>
        <c:param name="formulario"><axis:alt c="TITULO" f="axissin011" lit="9000896"/></c:param>
        <c:param name="form">axissin011</c:param>
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
                    <axis:ocultar f="axissin011" c="NSINIES" dejarHueco="false">
                      <td class="titulocaja">
                            <b><axis:alt f="axissin011" c="LIT_NSINIES" lit="101298"/></b><!--Numero siniestro -->  
                        </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin011" c="TTIPTRA" dejarHueco="false">
                        <td class="titulocaja">
                                <b><axis:alt f="axissin011" c="LIT_TTIPTRA" lit="9001028"/></b><!-- Tipus tramitacio -->                               
                        </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin011" c="TTRAMIT" dejarHueco="false">
                       <td class="titulocaja">
                                <b><axis:alt f="axissin011" c="LIT_TTRAMIT" lit="100588"/></b><!-- Tipus dany  -->
                        </td>                        
                        </axis:ocultar>
                        <axis:ocultar f="axissin011" c="TTCAUSIN" dejarHueco="false">
                        <td class="titulocaja">
                                <b><axis:alt f="axissin011" c="LIT_TTCAUSIN" lit="9000901"/></b><!-- Tipus dany  -->                                
                        </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin011" c="CINFORM" dejarHueco="false">
                       <td class="titulocaja">
                                <b><axis:alt f="axissin011" c="LIT_CINFORM" lit="9000905"/></b><!-- Tramitación informativa -->                                    
                        </td>                        
                        </axis:ocultar>
                        
                    </tr>
                    
                    <tr>
                     <axis:ocultar f="axissin011" c="NSINIES" dejarHueco="false">
                     <td class="campocaja">
                           <input type="text" name="NSINIES_O" id="NSINIES_O"  class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin011" c="NSINIES" a="modificable=false"/> />
                            
                        </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin011" c="TTIPTRA" dejarHueco="false">
                            <td class="campocaja">
                             <input type="text" name="TTIPTRA" value="${sessionScope.tramitaciones_min[linea_trami].TTIPTRA}" class="campodisabled campo campotexto" style="width:90%"
                                <axis:atr f="axissin011" c="TTIPTRA" a="modificable=false&obligatorio=false"/> />                                
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin011" c="TTRAMIT" dejarHueco="false">
                            <td class="campocaja">
                             <input type="text" name="TTRAMIT" value="${sessionScope.tramitaciones_min[linea_trami].TTRAMIT}" class="campodisabled campo campotexto" style="width:90%"
                                <axis:atr f="axissin011" c="TTRAMIT" a="modificable=false"/> />                                
                            </td>      
                        </axis:ocultar>
                        <axis:ocultar f="axissin011" c="TTCAUSIN" dejarHueco="false">
                            <td class="campocaja">
                                <input type="text" name="TTCAUSIN" value="${sessionScope.tramitaciones_min[linea_trami].TTCAUSIN}" class="campodisabled campo campotexto" style="width:90%"
                                <axis:atr f="axissin011" c="TTCAUSIN" a="modificable=false"/> />
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin011" c="CINFORM" dejarHueco="false">
                            <td class="campocaja" align="left">
                            <input type="checkbox" disabled  id="CINFORM" name="CINFORM" <axis:atr f="axissin011" c="CINFORM" a="modificable=false"/> value="${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.CINFORM}" 
                            <c:if test="${sessionScope.tramitaciones_min[linea_trami].CINFORM == '1'}">checked</c:if> >
                            </td>                        
                        </axis:ocultar>
                    </tr>
                    
                    
                    <tr>
                        <axis:ocultar f="axissin011" c="TESTTRA" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin011" c="LIT_TESTTRA" lit="100587"/></b><!-- Estado -->                                              
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin011" c="TSUBTRA" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin011" c="LIT_TSUBTRA" lit="9000852"/></b><!--Subestado -->                                
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin011" c="TUNITRA" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin011" c="LIT_TUNITRA" lit="9000900"/></b><!-- Unidad tramitacion -->                                
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin011" c="TTRAMITAD" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin011" c="LIT_TTRAMITAD" lit="140769"/></b><!-- Tramitador -->                                
                            </td> 
                        </axis:ocultar>
                        <td class="titulocaja">                            
                        </td>
                    </tr>
                    <tr>
                        <axis:ocultar f="axissin011" c="TESTTRA" dejarHueco="false">
                            <td class="campocaja">
                                <input type="text" name="TESTTRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TESTTRA}" class="campodisabled campo campotexto" style="width:90%"
                                <axis:atr f="axissin011" c="TESTTRA" a="modificable=false"/> />
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin011" c="TSUBTRA" dejarHueco="false">
                            <td class="campocaja">
                                <input type="text" name="TSUBTRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TSUBTRA}" class="campodisabled campo campotexto" style="width:90%"
                                <axis:atr f="axissin011" c="TSUBTRA" a="modificable=false"/> />                        
                            </td>      
                        </axis:ocultar>
                        <axis:ocultar f="axissin011" c="TUNITRA" dejarHueco="false">
                            <td class="campocaja">
                                <input type="text" name="TUNITRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TUNITRA}" class="campodisabled campo campotexto" style="width:90%"
                                <axis:atr f="axissin011" c="TUNITRA" a="modificable=false"/> />
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin011" c="TTRAMITAD" dejarHueco="false">
                            <td class="campocaja">
                               <input type="text" name="TTRAMITAD" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TTRAMITAD}" class="campodisabled campo campotexto" style="width:90%"
                                <axis:atr f="axissin011" c="TTRAMITAD" a="modificable=false"/> />
                            </td>
                        </axis:ocultar>
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
                        <c:if test="${!empty __formdata.RETEN_PROVINCIAS && __formdata.RETEN_PROVINCIAS == 1}"><th style="width:20%;height:0px"></th></c:if>
                    </tr>
                     <tr>
                        <axis:ocultar f="axissin011" c="CTIPDES" dejarHueco="false">
                        <td class="titulocaja">
                               <b><axis:alt f="axissin011" c="LIT_CTIPDES" lit="9001213"/></b><!-- Tipo Destinatario -->                                
                        </td>
                          </axis:ocultar>
                            <c:if test="${__formdata.CTIPDES == 8 || __formdata.CTIPDES==2 || __formdata.CTIPDES==9}">
                            <td class="titulocaja">
                              <b><axis:alt f="axissin011" c="LIT_CACTPRO" lit="101736"/></b><!-- Actividad Provisional  -->
                            </td>
                            </c:if>
                       <axis:visible f="axissin011" c="PCTIPCAP">
                        <td class="titulocaja">
                           <b><axis:alt c="PCTIPCAP" f="axissin011" lit="9901393"/></b><!-- Forma cobro prestacion -->
                        </td>
                       </axis:visible>
                       <axis:visible f="axissin011" c="PCRELASE">
                        <td class="titulocaja">
                          <b><axis:alt c="PCRELASE" f="axissin011" lit="9901394"/></b><!-- Tipo relación persona -->
                        </td>
                       </axis:visible>
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axissin011" c="CTIPDES" dejarHueco="false">
                            <td class="campocaja">
                                <select name="CTIPDES" id="CTIPDES" size="1" onchange="f_recargar(this);" class="campowidthselect campo campotexto" style="width:90%;"
                                    <axis:atr f="axissin011" c="TTRAMITAD" a="obligatorio=true"/>>
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axissin011" lit="1000348"/> - </option>
                                <c:forEach var="tipodest" items="${__formdata.listvalores.lsttipdest}">
                                    <option value = "${tipodest.CATRIBU}" 
                                    <c:if test="${tipodest.CATRIBU== __formdata.CTIPDES}"> selected </c:if> />
                                        ${tipodest.TATRIBU}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        </axis:ocultar>
                        <c:if test="${__formdata.CTIPDES == 8 || __formdata.CTIPDES==2 || __formdata.CTIPDES==9}">
                        <axis:ocultar f="axissin011" c="CACTPRO" dejarHueco="false">
                        <td class="campocaja">
                            <select name="CACTPRO" id="CACTPRO" size="1" class="campowidthselect campo campotexto_ob" style="width:90%;">
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axissin011" lit="1000348"/> - </option>
                                <c:forEach var="tipoact" items="${__formdata.listvalores.lstcactpro}">
                                    <option value = "${tipoact.CACTPRO}" 
                                    <c:if test="${tipoact.CACTPRO == __formdata.CACTPRO}"> selected </c:if> />
                                        ${tipoact.TACTPRO} 
                                    </option>
                                </c:forEach>
                             </select>
                        </td>
                        </axis:ocultar>
                        </c:if>
                        <axis:visible f="axissin011" c="PCTIPCAP">
                        <td>
                            <select name="PCTIPCAP" id="PCTIPCAP" onchange=""  size="1" title="<axis:alt c='PCTIPCAP' f='axissin011' lit='9901393'/>" class="campowidthselect campo campotexto"  style="width:90%;"
                                    <axis:atr f="axissin011" c="PCTIPCAP" a="isInputText=false&modificable=true"/>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axissin011" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listvalores.lstCobPres}">
                                            <option value = "${element.CATRIBU}" 
                                                <c:if test="${element.CATRIBU == __formdata.PCTIPCAP}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                            </select>
                        </td>
                        </axis:visible>
                        <axis:visible f="axissin011" c="PCRELASE">
                        <td>
                            <select name="PCRELASE" id="PCRELASE" onchange=""  size="1" title="<axis:alt c='PCRELASE' f='axissin011' lit='9901394'/>" class="campowidthselect campo campotexto"  style="width:90%;"
                                    <axis:atr f="axissin011" c="PCRELASE" a="isInputText=false&modificable=true"/>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axissin011" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listvalores.lstRelAse}">
                                            <option value = "${element.CATRIBU}" 
                                                <c:if test="${element.CATRIBU == __formdata.PCRELASE}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                            </select>
                        </td>
                        </axis:visible>
                  </tr>
                  <c:if test="${!empty __formdata.CTIPDES &&__formdata.CTIPDES!=1 && __formdata.CTIPDES!=7 && __formdata.CTIPDES!=15
                                    && __formdata.CTIPDES!=16 && __formdata.CTIPDES!=50 && __formdata.CTIPDES!=51 && __formdata.CTIPDES!=56}">
                  <!-- Secciones ocultables -->
                  <tr>
                      <axis:ocultar f="axissin011" c="SPERSON" dejarHueco="false">
                        <td class="titulocaja">
                                <b><axis:alt f="axissin011" c="LIT_SPERSON" lit="105330"/></b><!-- Document -->                                
                        </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin011" c="NOMBRE" dejarHueco="false">
                        <td class="titulocaja">
                                <b><axis:alt f="axissin011" c="LIT_NOMBRE" lit="105940"/></b><!-- Nombre -->                                
                        </td>
                        </axis:ocultar>
                        <td></td>
                        <c:if test="${!empty  __formdata.CTIPDES &&
                                             (__formdata.CTIPDES==54 or
											  __formdata.CTIPDES==21 or
											  __formdata.CTIPDES==22 or
											  __formdata.CTIPDES==23 or
											  __formdata.CTIPDES==24 or
											  __formdata.CTIPDES==25 or
											  __formdata.CTIPDES==26)}">
                            <axis:ocultar f="axissin045" c="SPERSED" dejarHueco="false"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin045" c="SPERSED" lit="9902589"/></b>
                                </td>         
                            </axis:ocultar>  
                        </c:if>
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axissin011" c="SPERSON" dejarHueco="false">
                        <td class="campocaja">
                            <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}"/>
                            <input type="hidden" name="SPROFES" id="SPROFES" value="${__formdata.SPROFES}"/> 
                            <input type="text" name="NNUMIDE" id="NNUMIDE" value="${__formdata.NNUMIDE}" class="campowidthinput campo campotexto_ob" style="width:90%"
                            <axis:atr f="axissin011" c="NNUMIDE" a="modificable=false"/> /> 
                            <c:if test="${!empty __formdata.CTIPDES &&
                                                (__formdata.CTIPDES!=53 &&
                                                 __formdata.CTIPDES!=54 &&
                                                 __formdata.CTIPDES!=21 &&
                                                 __formdata.CTIPDES!=22 &&
                                                 __formdata.CTIPDES!=23 &&
                                                 __formdata.CTIPDES!=24 &&
                                                 __formdata.CTIPDES!=25 &&
                                                 __formdata.CTIPDES!=26)}">
                            <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisper021()" style="cursor:pointer"/>  
                            </c:if>
                            <c:if test="${!empty __formdata.CTIPDES &&
                                                 (__formdata.CTIPDES==53 or
                                                  __formdata.CTIPDES==54 or
											      __formdata.CTIPDES==21 or
											      __formdata.CTIPDES==22 or
											      __formdata.CTIPDES==23 or
											      __formdata.CTIPDES==24 or
											      __formdata.CTIPDES==25 or
											      __formdata.CTIPDES==26)}">
                            <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisprf000()" style="cursor:pointer"/>  
                            </c:if>
                        </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin011" c="NOMBRE" dejarHueco="false">
                        <td class="campocaja" colspan="2">
                            <input type="text" name="NOMBRE" id="NOMBRE" value="${__formdata.NOMBRE}" class="campowidthinput campo campotexto_ob" style="width:90%"
                            <axis:atr f="axissin011" c="NOMBRE" a="modificable=false"/> /> 
                        </td>                        
                        </axis:ocultar> 
                        <c:if test="${!empty  __formdata.CTIPDES &&
                                             (__formdata.CTIPDES==54 or
											  __formdata.CTIPDES==21 or
											  __formdata.CTIPDES==22 or
											  __formdata.CTIPDES==23 or
											  __formdata.CTIPDES==24 or
											  __formdata.CTIPDES==25 or
											  __formdata.CTIPDES==26)}">
                            <axis:ocultar f="axissin011" c="SPERSED" dejarHueco="false"> 
                                <td class="campocaja" id="td_SPERSED">
                                    <select name ="SPERSED" id="SPERSED" title="<axis:alt f="axissin011" c="SPERSED" lit="9902589"/>"  size="1" 
                                        class="campowidthselect campo campotexto_ob" 
                                        <axis:atr f="axissin011" c="SPERSED" a="modificable=true&isInputText=false&obligatorio=false"/>>
                                        <option value = ""> - <axis:alt f="axissin011" c="SELECCIONES" lit="108341"/> - </option>
                                        <c:forEach var="listados" items="${__formdata.lstsedes}">
                                            <option value = "${listados.SPERSON}" 
                                            <c:if test="${(!empty __formdata.SPERSED)&& listados.SPERSON == __formdata.SPERSED}"> selected </c:if>>
                                            ${listados.TNOMBRE}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>
                        </c:if>
                </tr>
                </c:if>
                <!-- Segunda seccion -->
                <c:if test="${__formdata.CTIPDES==7}">
                <tr>
                     <axis:ocultar f="axissin011" c="SPERSON" dejarHueco="false">
                        <td class="titulocaja" colspan="3">
                                <b><axis:alt f="axissin011" c="LIT_SPERSON_TOMADOR" lit="101027"/></b><!-- Tomador -->                                
                        </td>
                     </axis:ocultar>
                        <td></td>
                      
                    </tr>
                    <tr>
                      <axis:ocultar f="axissin011" c="SPERSON" dejarHueco="false">
                        <td class="campocaja" colspan="3">
                             <select name="SPERSON" id="SPERSON" onchange="f_recargar(this)"  size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                    <axis:atr f="axissin011" c="SPERSON" a="obligatorio=false"/>>
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axissin011" lit="1000348"/> - </option>
                                <c:forEach var="estado" items="${__formdata.listvalores.lsttomadores}">
                                    <option value = "${estado.OB_IAX_TOMADORES.SPERSON}" 
                                    <c:if test="${estado.OB_IAX_TOMADORES.SPERSON == __formdata.SPERSON}"> selected </c:if> />
                                        ${estado.OB_IAX_TOMADORES.SPERSON} -
                                        ${estado.OB_IAX_TOMADORES.TNOMBRE}
                                        ${estado.OB_IAX_TOMADORES.TAPELLI1} 
                                        ${estado.OB_IAX_TOMADORES.TAPELLI2} 
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        </axis:ocultar>
                        <td></td>
                </tr>
                </c:if>
                <c:if test="${__formdata.CTIPDES==1}">
                <!-- Tercera seccuion -->
                <tr>
                    <axis:ocultar f="axissin011" c="SPERSON" dejarHueco="false">
                        <td class="titulocaja" colspan="3">
                                <b><axis:alt f="axissin011" c="LIT_SPERSON_ASEGURADO" lit="101028"/></b><!-- Asegurado -->                                
                        </td>
                    </axis:ocultar>
                        <td></td>
                      
                    </tr>
                    <tr>
                    <axis:ocultar f="axissin011" c="SPERSON" dejarHueco="false">
                        <td class="campocaja" colspan="3">
                             <select name="SPERSON" id="SPERSON" size="1" onchange="f_recargar(this);"  class="campowidthselect campo campotexto" style="width:90%;"
                                    <axis:atr f="axissin011" c="SPERSON" a="obligatorio=false"/>>
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axissin011" lit="1000348"/> - </option>
                                <c:forEach var="estado" items="${__formdata.listvalores.lstasegurados}">
                                    <option value = "${estado.OB_IAX_ASEGURADOS.SPERSON}" 
                                    <c:if test="${estado.OB_IAX_ASEGURADOS.SPERSON == __formdata.SPERSON}"> selected </c:if> />
                                        ${estado.OB_IAX_ASEGURADOS.SPERSON} -
                                        ${estado.OB_IAX_ASEGURADOS.TNOMBRE}
                                        ${estado.OB_IAX_ASEGURADOS.TAPELLI1} 
                                        ${estado.OB_IAX_ASEGURADOS.TAPELLI2} 
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </axis:ocultar>
                        <td></td>
                </tr>
                </c:if>
                 <c:if test="${__formdata.CTIPDES==15}">
                <tr>
                        <axis:ocultar c="SPERSON" f="SPERSON" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin012" c="LIT_SPERSON_PERJUDICADO" lit="9903447"/></b>
                            </td>
                        </axis:ocultar>
                    <tr>
                    <tr>
                         <td class="campocaja" colspan="2"> 
                         
                                <select name="SPERSON" id="SPERSON" size="1" onchange=""  class="campowidthselect campo campotexto" style="width:75%;"
                                    <axis:atr f="axissin012" c="CPERJUDICADO" a="modificable=true&isInputText=false"/> >
                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin012" c="BLANCO" lit="1000348"/> - </option>
                                    <c:forEach var="tipoper" items="${__formdata.listvalores.lstperjudicados}">
                                        <option value = "${tipoper.SPERSON}" 
                                        <c:if test="${tipoper.SPERSON == __formdata.SPERSON}"> selected </c:if> />
                                            ${tipoper.OB_IAX_ASEGURADOS.SPERSON} -
                                            ${tipoper.OB_IAX_ASEGURADOS.TNOMBRE}
                                            ${tipoper.OB_IAX_ASEGURADOS.TAPELLI1} 
                                            ${tipoper.OB_IAX_ASEGURADOS.TAPELLI2} 
                                        </option>
                                    </c:forEach>
                                </select>   
                        </td>
                    </tr>
                </c:if>    
                <c:if test="${__formdata.CTIPDES==16}">
                <tr>
                        <axis:ocultar c="SPERSON" f="SPERSON" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin012" c="LIT_SPERSON_BENDESIG" lit="9906128"/></b>
                            </td>
                        </axis:ocultar>
                    <tr>
                    <tr>
                         <td class="campocaja" colspan="2"> 
                                <select name="SPERSON_POR" id="SPERSON_POR" size="1" onchange="asignarPercent(this);f_recargar(this);"  class="campowidthselect campo campotexto" style="width:75%;"
                                    <axis:atr f="axissin012" c="CBENDESIG" a="modificable=true&isInputText=false"/> >
                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin012" c="BLANCO" lit="1000348"/> - </option>
                                    <c:forEach var="tipoper" items="${__formdata.listvalores.lstbendesig}">
                                        <option 
                                        <c:if test="${tipoper.SPERSON == __formdata.SPERSON}">
                                         selected 
                                         </c:if>
                                         value="${tipoper.SPERSON}|${tipoper.PPARTICIP}" >
                                            ${tipoper.TNOMBRE}
                                        </option>
                                    </c:forEach>
                                </select>   
                                <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>
                        </td>
                    </tr>
                </c:if>  
                <!-- Bug 27766-->
                <c:if test="${__formdata.CTIPDES==50}">
                <tr>
                     <axis:ocultar f="axissin011" c="SPERSON" dejarHueco="false">
                        <td class="titulocaja" colspan="3">
                                <b><axis:alt f="axissin011" c="LIT_SPERSON_TOMADOR" lit="9906366"/></b><!-- Beneficiario Pignoración -->                                
                        </td>
                     </axis:ocultar>
                        <td></td>
                      
                    </tr>
                    <tr>
                      <axis:ocultar f="axissin011" c="SPERSON" dejarHueco="false">
                        <td class="campocaja" colspan="3">
                             <select name="SPERSON" id="SPERSON" onchange="f_recargar(this)"  size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                    <axis:atr f="axissin011" c="SPERSON" a="obligatorio=false"/>>
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axissin011" lit="1000348"/> - </option>
                                <c:forEach var="estado" items="${__formdata.listvalores.lstpignorados}">
                                    <option value = "${estado.SPERSON}" 
                                    <c:if test="${estado.SPERSON == __formdata.SPERSON}"> selected </c:if> />
                                       
                                         ${estado.SPERSON} -
                                        ${estado.TNOMBRE} 
                                        ${estado.TAPELLI1} 
                                         <!--
                                        ${estado.OB_IAX_TOMADORES.SPERSON} -
                                        ${estado.OB_IAX_TOMADORES.TNOMBRE}
                                        ${estado.OB_IAX_TOMADORES.TAPELLI1} 
                                        ${estado.OB_IAX_TOMADORES.TAPELLI2} -->
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        </axis:ocultar>
                        <td></td>
                </tr>
                </c:if>
                
                
                <c:if test="${__formdata.CTIPDES==51}">
                <tr>
                     <axis:ocultar f="axissin011" c="SPERSON" dejarHueco="false">
                        <td class="titulocaja" colspan="3">
                                <b><axis:alt f="axissin011" c="LIT_SPERSON_TOMADOR" lit="9906369"/></b><!-- Beneficiario Especificados en Póliza -->                                
                        </td>
                     </axis:ocultar>
                        <td></td>
                      
                    </tr>
                    <tr>
                      <axis:ocultar f="axissin011" c="SPERSON" dejarHueco="false">
                        <td class="campocaja" colspan="3">
                             <select name="SPERSON" id="SPERSON" onchange="f_recargar(this)"  size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                    <axis:atr f="axissin011" c="SPERSON" a="obligatorio=false"/>>
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axissin011" lit="1000348"/> - </option>
                                <c:forEach var="estado" items="${__formdata.listvalores.lstbeneficiariosnominales}">
                                    <option value = "${estado.OB_IAX_TOMADORES.SPERSON}" 
                                    <c:if test="${estado.OB_IAX_TOMADORES.SPERSON == __formdata.SPERSON}"> selected </c:if> />
                                         ${estado.SPERSON} -
                                        ${estado.TNOMBRE} 
                                        ${estado.TAPELLI1} 
                                        <!--
                                        ${estado.OB_IAX_TOMADORES.SPERSON} -
                                        ${estado.OB_IAX_TOMADORES.TNOMBRE}
                                        ${estado.OB_IAX_TOMADORES.TAPELLI1} 
                                        ${estado.OB_IAX_TOMADORES.TAPELLI2} -->
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        </axis:ocultar>
                        <td></td>
                </tr>
                </c:if>
                <c:if test="${__formdata.CTIPDES==56}">
                <!-- Tercera seccuion -->
                <tr>
                    <axis:ocultar f="axissin011" c="SPERSON" dejarHueco="false">
                        <td class="titulocaja" colspan="3">
                                <b><axis:alt f="axissin011" c="LIT_SPERSON_ASEGURADO" lit="101028"/></b><!-- Asegurado -->                                
                        </td>
                    </axis:ocultar>
                        <td></td>
                      
                    </tr>
                    <tr>
                    <axis:ocultar f="axissin011" c="SPERSON" dejarHueco="false">
                        <td class="campocaja" colspan="3">
                             <select name="SPERSON" id="SPERSON" size="1" onchange="f_recargar(this);"  class="campowidthselect campo campotexto" style="width:90%;"
                                    <axis:atr f="axissin011" c="SPERSON" a="obligatorio=false"/>>
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axissin011" lit="1000348"/> - </option>
                                <c:forEach var="estado" items="${__formdata.listvalores.lstaseginnominados}">
                                    <option value = "${estado.SPERSON}" 
                                    <c:if test="${estado.SPERSON == __formdata.SPERSON}"> selected </c:if> />
                                        ${estado.SPERSON} -
                                        ${estado.TNOMBRE}
                                        ${estado.TAPELLI1} 
                                        ${estado.TAPELLI2} 
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </axis:ocultar>
                        <td></td>
                </tr>
                </c:if>
                
                <!-- -->
                
                
                
                
                <tr>
                    <axis:ocultar f="axissin011" c="PASIGNA" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin011" c="LIT_PASIGNA" lit="9001329"/></b><!-- % Asignación -->                                
                            </td>
                    </axis:ocultar>
                    <axis:ocultar f="axissin011" c="CPAISRE" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin011" c="LIT_CPAISRE" lit="9000789"/></b><!-- País de residencia -->                                
                            </td>
                    </axis:ocultar>
                    
                    <c:if test="${!empty __formdata.RETEN_PROVINCIAS && __formdata.RETEN_PROVINCIAS == 1}">
	                    <td class="titulocaja">
	                         <b><axis:alt f="axissin011" c="TPROVIN" lit="100756"/></b>
	                     </td>
                    </c:if>
                    
                    <axis:ocultar f="axissin011" c="BANC" dejarHueco="false">
                            <%--<c:if test="${!empty __formdata.SPERSON}">--%>
                            <td class="titulocaja">
                                <b><axis:alt f="axissin011" c="LIT_BANC" lit="100965"/></b><!-- Cuenta bancaria -->                                
                            </td>                        
                    </axis:ocultar>
                    <axis:ocultar f="axissin011" c="CPAGDES" dejarHueco="false">
                         <%--   </c:if>--%>
                            <td class="titulocaja">
                                <b><axis:alt f="axissin011" c="LIT_CPAGDES" lit="9000978"/></b><!-- Acepta Pagos -->                                
                            </td>
                    </axis:ocultar>
                </tr>
                <tr>
                    <axis:ocultar f="axissin011" c="PASIGNA" dejarHueco="false">
                        <td class="campocaja">
                            <input type="text" name="PASIGNA" id="PASIGNA" value="${__formdata.PASIGNA}" class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axissin011" c="PASIGNA" a="modificable=true"/> /> 
                        </td>
                    </axis:ocultar>
                    <axis:ocultar f="axissin011" c="CPAISRE" dejarHueco="false">
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo campotexto" size="3" maxlength="3" value="${empty __formdata.CPAISRE ? sessionScope.CPAISRE__DEFAULT : __formdata.CPAISRE}" name="CPAISRE" id="CPAISRE" onchange="f_onchange_CPAIS()" style="width:18%;" 
                            <axis:atr f="axissin011" c="CPAISRE" a="modificable=true"/>/>
                            &nbsp;<img id="findPais" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS', null)" style="cursor:pointer"/>
                            &nbsp;<span id="TPAIS_span"><b>${__formdata.TPAIS}</b></span>
                        </td>
                    </axis:ocultar>
                    <c:if test="${!empty __formdata.RETEN_PROVINCIAS && __formdata.RETEN_PROVINCIAS == 1}">
	                    <td class="campocaja">
	                         <input type="text" class="campowidthinput campo campotexto" size="15" maxlength="3" value="${__formdata.CPROVIN == 0 ? null : __formdata.CPROVIN}" name="CPROVIN" id="CPROVIN" onchange="f_onchange_CPROVIN()" style="width:18%;" 
	                          title="<axis:alt f="axissin011" c="CPROVIN" lit="100756"/>" />
	                         &nbsp;<img id="findProvincia" style="visibility:${empty __formdata.CPAISRE && empty sessionScope.CPAISRE__DEFAULT ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', document.miForm.CPAISRE.value)"/>                
	                         &nbsp;<span id="TPROVIN_span"><b>${__formdata.TPROVIN}</b></span>
	                    </td>
                    </c:if>
                    
                        <%--<c:if test="${!empty __formdata.SPERSON}">--%>
                    <axis:ocultar f="axissin011" c="BANC" dejarHueco="false">
                      <td class="campocaja">
                        
                            <axis:encryptflag f="axissin011" c="BANC" />
                            <select name = "BANC" style="width:80%" id ="BANC" size="1"  onchange="f_recargar(this);"
                                class="campowidthselect campo campotexto" <axis:atr f="axissin011" c="CBANCAR" a="isInputText=false"/>>&nbsp;
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axissin011" lit="1000348"/> - </option>
                                <c:forEach items="${__formdata.listvalores.cuentasbancarias}" var="cuentaTomador">
                                    <option value = "<axis:encrypt f="axissin011" c="BANC" value="${cuentaTomador.CBANCAR}" />@@${cuentaTomador.CTIPBAN}" <c:if test="${cuentaTomador.CBANCAR  == __formdata.CBANCAR}">selected</c:if>><axis:masc f="axissin011" c="BANC" value="${cuentaTomador.TCBANCAR}" />
                                    </option>
                                </c:forEach>
                            </select>
                            <axis:encryptflag f="axissin011" c="CBANCAR" />
                            <input type="hidden" id="CBANCAR" name="CBANCAR" value="<axis:encrypt f="axissin011" c="CBANCAR" value="${__formdata.CBANCAR}" />">
                            <input type="hidden" id="CTIPBAN" name="CTIPBAN" value="${__formdata.CTIPBAN}">                            
                          <axis:visible f="axissin011" c="BT_NUEVO_CCC">
                                <a href="javascript:f_abrir_axisper014(null,document.miForm.SPERSON.value)">
                                <img border="0" alt="<axis:alt c='BT_NUEVO_CCC' f='axissin011' lit='1000438'/>" title="<axis:alt c='BT_NUEVO_CCC' f='axissin011' lit='1000438'/>" src="images/new.gif"/></a>                            
                          </axis:visible>
                        </td>
                    </axis:ocultar>
                    <axis:ocultar f="axissin011" c="CPAGDES" dejarHueco="false">
                        <td class="campocaja">
                            <input type="checkbox"  name="CPAGDES" id="CPAGDES" value="${__formdata.CPAGDES}" onclick="f_actualitza(this);" <c:if test="${__formdata.CPAGDES == 1}">checked</c:if>>  
                        </td>
                    </axis:ocultar>
                    
                    
                    <axis:visible f="axissin011" c="MODELO145">
                     
                      <td class="campocaja">
                        <c:if test="${__configform.axissin011__BT_ANADIR_IRPF__visible != 'false'}">
                            <input type="button" value="modelo 145" id="modelo145"  name="modelo145" class="boton"
                                    onclick= "f_abrir_axiper018('${__formdata.SPERSON}','${__formdata.CAGENTE}','${__formdata.NANO}')" />
                        </c:if>
                      </td>
                    </axis:visible>
                </tr>
                    
                </table>
                
                
            </td>
        </tr>
    </table>
    
    <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axissin011" c="MODPER018" lit="9001275"/>
      </c:param>
      <c:param name="nid" value="axisper018"/>
    </c:import>
    
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin011</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>
    </form>
  <c:import url="../include/mensajes.jsp" />
</body>
</html>