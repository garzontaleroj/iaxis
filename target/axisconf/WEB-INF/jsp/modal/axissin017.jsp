<%/* Revision:# rxM0S3j7Nwr9dagfwnPMCg== # */%>

<%--
/**
*  Fichero: axissin016.jsp
*  
*  Titulo: Modal modificar detalle Siniestro
*
*  Fecha: 03/03/2009
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
<c:set var="nombrePantalla" value="cabecerasin"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt c="titulo" f="axissin017" lit="100604"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    
    <script type="text/javascript">
    
    
 

        function f_cambia_causa(obj){
            if (obj.value != "null"){
                SPRODUC= '${__formdata.SPRODUC}';
                objAjax.invokeAsyncCGI("modal_axissin017.do", callbackAjaxSelectedCausa, 
                    "operation=ajax_selected_causa&CODI=" + document.${nombrePantalla}Form.CCAUSIN.value + "&SPRODUC=" +SPRODUC+"&CACTIVI="+document.${nombrePantalla}Form.CACTIVI.value, obj, objJsMessages.jslit_actualizando_registro);}
        }  
        
        function f_cambia_causa_load(){
            //if (obj.value != "null"){
                //alert("Antes de cargar valores");
                SPRODUC= '${__formdata.SPRODUC}';
                objAjax.invokeAsyncCGI("modal_axissin017.do", callbackAjaxSelectedCausa, 
                    "operation=ajax_selected_causa&CODI=" + document.${nombrePantalla}Form.CCAUSIN.value + "&SPRODUC=" +SPRODUC+"&CACTIVI="+document.${nombrePantalla}Form.CACTIVI.value, this, objJsMessages.jslit_actualizando_registro);
        }  
        
        function cargar_direccion(NRIESGO){
                       
            if(isNaN(document.${nombrePantalla}Form.NRIESGO.value) ){ //No hay ninguno seleccionado
            //Actualizamos los campos de la sección dirección
            //RIESDIRECCION={CPROVIN=8, CPOSTAL=08036, TPROVIN=BARCELONA, TPOBLAC=BARCELONA, TPAIS=ESPAÑA, TDOMICI=trueta, CPAIS=42, CPOBLAC=28}, 
            alert("<axis:alt c="aler" f="axissin017" lit="1000413" />");
            }else{
            //alert(document.${nombrePantalla}Form.NRIESGO.value);
            NRIESGO= document.${nombrePantalla}Form.NRIESGO.value;
                objAjax.invokeAsyncCGI("modal_axissin017.do", callbackAjaxCargarDireccion, 
                    "operation=ajax_cargardireccion&NRIESGO_SEL=" + NRIESGO , this, objJsMessages.jslit_actualizando_registro);
      
            
            }
            
            
        }
        
        function callbackAjaxCargarDireccion(ajaxResponseText) {
           // alert(ajaxResponseText);
            
            try {
                var doc=objAjax.domParse(ajaxResponseText);
                                    
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("CPROVIN")[0])){
                        //objDom.borrarOpcionesDeCombo(motivosCombo);
                        
                        //for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                        var CPROVIN = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPROVIN")[0])) ? doc.getElementsByTagName("CPROVIN")[0].childNodes[0].nodeValue : "");
                        var CPAIS = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS")[0])) ? doc.getElementsByTagName("CPAIS")[0].childNodes[0].nodeValue : "");
                        var CPOSTAL = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPOSTAL")[0])) ? doc.getElementsByTagName("CPOSTAL")[0].childNodes[0].nodeValue : "");
                        var CPOBLAC = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPOBLAC")[0])) ? doc.getElementsByTagName("CPOBLAC")[0].childNodes[0].nodeValue : "");
                        var TPAIS = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAIS")[0])) ? doc.getElementsByTagName("TPAIS")[0].childNodes[0].nodeValue : "");
                        var TDOMICI = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TDOMICI")[0])) ? doc.getElementsByTagName("TDOMICI")[0].childNodes[0].nodeValue : "");
                        var TPROVIN = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPROVIN")[0])) ? doc.getElementsByTagName("TPROVIN")[0].childNodes[0].nodeValue : "");
                        var TPOBLAC = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPOBLAC")[0])) ? doc.getElementsByTagName("TPOBLAC")[0].childNodes[0].nodeValue : "");
                       
                        //var CMOTSIN = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CMOTSIN")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CMOTSIN")[0].childNodes[0].nodeValue : "");
                            //alert(CPROVIN);
                        //    objDom.addOpcionACombo(CMOTSIN, TMOTSIN, motivosCombo, i);
                        //}
                        
                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPOBLAC")[0])) {
                        document.getElementById("TPOBLAC_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOBLAC"), 0, 0) + "</b>";
                        } else {
                        document.getElementById("TPOBLAC_span").innerHTML = "";
                        }
                        
                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPROVIN")[0])) {
                        document.getElementById("TPROVIN_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPROVIN"), 0, 0) + "</b>";
                        } else {
                        document.getElementById("TPROVIN_span").innerHTML = "";
                        }
                        
                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPROVIN")[0])) {
                        document.getElementById("TPROVIN_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPROVIN"), 0, 0) + "</b>";
                        } else {
                        document.getElementById("TPROVIN_span").innerHTML = "";
                        }
                        
                        //if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TDOMICI")[0])) {
                        //document.getElementById("TDOMICI_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TDOMICI"), 0, 0) + "</b>";
                        //} else {
                        //document.getElementById("TDOMICI_span").innerHTML = "";
                        //}
                        
                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAIS")[0])) {
                        document.getElementById("TPAIS_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAIS"), 0, 0) + "</b>";
                        } else {
                        document.getElementById("TPAIS_span").innerHTML = "";
                        }
                        
                        
                        objDom.setValorComponente(document.${nombrePantalla}Form.CPROVIN, CPROVIN);
                        objDom.setValorComponente(document.${nombrePantalla}Form.CPAIS, CPAIS);
                        objDom.setValorComponente(document.${nombrePantalla}Form.CPOSTAL, CPOSTAL);
                        objDom.setValorComponente(document.${nombrePantalla}Form.CPOBLAC, CPOBLAC);
                        objDom.setValorComponente(document.${nombrePantalla}Form.TNOMVIA, TDOMICI);
                        
                        
                    }else{
                       
                    }
                }
                
            } catch (e) {
                objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", motivosCombo, null);
                alert(objJsMessages.jslit_sin_motivos);
            }
        }        

        
        

        function callbackAjaxSelectedCausa(ajaxResponseText) {
            var motivosCombo = document.${nombrePantalla}Form.CMOTSIN;
            try {
                var doc=objAjax.domParse(ajaxResponseText);
                                    
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        objDom.borrarOpcionesDeCombo(motivosCombo);
                        
                        for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                            var TMOTSIN = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TMOTSIN")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TMOTSIN")[0].childNodes[0].nodeValue : "");
                            var CMOTSIN = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CMOTSIN")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CMOTSIN")[0].childNodes[0].nodeValue : "");
                            
                            objDom.addOpcionACombo(CMOTSIN, TMOTSIN, motivosCombo, i);
                        }
                    }else{
                        objDom.borrarOpcionesDeCombo (motivosCombo);
                        objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", motivosCombo, null);
                    }
                }
                
            } catch (e) {
                objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", motivosCombo, null);
                alert(objJsMessages.jslit_sin_motivos);
            }
        }        



       /*function f_verifica_textarea(valor) {                
        // Habilita o deshabilita el TextArea segun si 
        // Se ha seleccionado o no, una clusula definida
        
        if (valor == 0){
            
            if(!objUtiles.estaVacio( document.getElementById("TLOCALI")) ){
            document.${nombrePantalla}Form.TLOCALI.readonly = false;
            document.${nombrePantalla}Form.TLOCALI.disabled = false;
            objDom.setClassNamePorComponente(document.${nombrePantalla}Form.TLOCALI, "campowidthinput campo campotexto");
            document.${nombrePantalla}Form.TLOCALI.focus();
            }
            if(!objUtiles.estaVacio( document.getElementById("direccions")) ){
            objDom.setVisibilidadPorId("direccions", "hidden");
            document.getElementById("direccions").style.display="none" ;
            }
            limpiaCampos("TODO");
        }else{ 
           
            objDom.setValorPorId("TLOCALI","") ;
            document.getElementById("TLOCALI").disabled = "true";
            if(!objUtiles.estaVacio( document.getElementById("direccions")) ){
            objDom.setVisibilidadPorId("direccions", "visible");
            document.getElementById("direccions").style.display="block" ;
            }
            document.${nombrePantalla}Form.TLOCALI.readonly = true;
            objDom.setClassNamePorComponente(document.${nombrePantalla}Form.TLOCALI, "campo campodisabled");
            objDom.setValorComponente(document.${nombrePantalla}Form.TLOCALI, "");
            
        }
        
        }*/
        
        
        function f_verifica_textarea(valor) {                
        // Habilita o deshabilita el TextArea segun si 
        // Se ha seleccionado o no, una clusula definida
        
        if (valor == 0){
           
            if(!objUtiles.estaVacio( document.getElementById("TLOCALI")) ){
           
            document.${nombrePantalla}Form.TLOCALI.readonly = false;
            document.${nombrePantalla}Form.TLOCALI.disabled = false;
            objDom.setClassNamePorComponente(document.${nombrePantalla}Form.TLOCALI, "campowidthinput campo campotexto");
            
            }
           
           //Habilitar la sección de campos de dirección
            if(!objUtiles.estaVacio( document.getElementById("direccions")) ){
            objDom.setVisibilidadPorId("direccions", "hidden");
            document.getElementById("direccions").style.display="none" ;
            objDom.setDisabledPorId("recargar_datos",true); //icono
            }
           //Deshabilitar la sección de campos de descripcion 
            if(!objUtiles.estaVacio( document.getElementById("textTlocali")) ){
            objDom.setVisibilidadPorId("textTlocali", "visible");
            document.getElementById("textTlocali").style.display="block" ;
            }
            
            limpiaCampos("TODO");
        }else{ 
           
            
            //objDom.setValorPorId("TLOCALI","") ;
            //document.getElementById("TLOCALI").disabled = "true";
            //Habilitar la sección de campos de direcciones
            if(!objUtiles.estaVacio( document.getElementById("direccions")) ){
            objDom.setVisibilidadPorId("direccions", "visible");
            document.getElementById("direccions").style.display="block" ;
            objDom.setDisabledPorId("recargar_datos",false); //icono
            }
            //document.${nombrePantalla}Form.TLOCALI.readonly = true;
            //objDom.setClassNamePorComponente(document.${nombrePantalla}Form.TLOCALI, "campo campodisabled");
            //objDom.setValorComponente(document.${nombrePantalla}Form.TLOCALI, "");
            //Habilitar la sección de campos de descripcion
            if(!objUtiles.estaVacio( document.getElementById("textTlocali")) ){
               //alert("Antes de ocultar text");
            objDom.setVisibilidadPorId("textTlocali", "hidden");
            document.getElementById("textTlocali").style.display="none" ;
            }
            
            
        }
        
        }
        
        
        
   
        function f_onload() { 
        f_cargar_propiedades_pantalla(); 
        f_validar_nivel();
        formdataPAIS = '${__formdata.LOCALIZA.CPAIS}';

        var val1 = "<%=request.getAttribute("OK")%>"; 
        var val1l = "<%=request.getAttribute("OK1")%>"; 
        //alert('val1'+val1);
        //alert('vall1'+val1l);
        var NSINIES = "${__formdata.NSINIES}";

            if (val1l=="OK1" && val1=="OK"){
            //alert("Ha entrado correctamente");
                parent.f_aceptar_axissin017();
                this.f_but_cancelar();                
            
               if (objUtiles.estaVacio(objDom.getValorPorId("TLOCALI")  )){
                           f_verifica_textarea(1);
               }else{
                           f_verifica_textarea(0);
                           
               }
               try{ 
                 if (!objUtiles.estaVacio(formdataPAIS)){
                    if (!objUtiles.estaVacio(f_buscar_TPAIS(formdataPAIS))){
                        objDom.setValorHTMLPorId("TPAIS_span", "<b>" + f_buscar_TPAIS(formdataPAIS)+"</b>");
                    }
                    }else {
                        objDom.setValorHTMLPorId("TPAIS_span", "<b></b>");
                        objDom.setValorPorId("CPOBLAC","");
                        objDom.setValorPorId("CPROVIN","");
           
                    }
               } catch (e) {}   
            }else{
                
                
                 if (objUtiles.estaVacio(objDom.getValorPorId("TLOCALI"))){
                           f_verifica_textarea(1);
                }else{
                           f_verifica_textarea(0);
                }
                
            }
            
              var DEC_SPERSON_ALTA = "${__formdata.DEC_SPERSON_ALTA}";
                    var DEC_SPERSON = "${__formdata.DEC_SPERSON}";
                    
                    if (!objUtiles.estaVacio(DEC_SPERSON_ALTA)){ 
                        document.${nombrePantalla}Form.DEC_SPERSON.value = DEC_SPERSON_ALTA;
                        DEC_SPERSON = DEC_SPERSON_ALTA;
                        f_get_persona(DEC_SPERSON_ALTA);
                    }
                   
                  
                try{  
                      
                      if (!objUtiles.estaVacio(DEC_SPERSON)){ 
                         f_actualizar_campos(0);
                      }else{
                        f_actualizar_campos(1);
                      }
                   }catch(e){}
                   
             var CAGENTE_SEL = "${__formdata.CAGENTE}";
             var hayErrorAvisos = "${__formdata.hayErrorAvisos}";
             if(objUtiles.estaVacio(hayErrorAvisos)){
               hayErrorAvisos = "0"
             }
             
             if (!objUtiles.estaVacio(CAGENTE_SEL) && hayErrorAvisos != 1)
                f_actualizar_agente_sel(CAGENTE_SEL);
        }
        
        function f_but_aceptar(){
            if (objValidador.validaEntrada()) {
                      objUtiles.ejecutarFormulario ("modal_axissin017.do?CCAUSINS="+document.getElementById("CCAUSIN").value+"&CTIPDECS="+document.getElementById("CTIPDEC").value+"&CMOTSINS="+document.getElementById("CMOTSIN").value, "guardar", document.${nombrePantalla}Form, "_self", objJsMessages.jslit_cargando);
            }
        }
        
        function f_but_cancelar(){
            parent.f_cerrar_modal("axissin017");
        }

	 function f_buscar_TPAIS(CPAIS) {
                <% 
                if (((java.util.Map) request.getAttribute("__formdata"))!= null){
                java.util.Map formdata = ((java.util.Map) request.getAttribute("__formdata"));
                if (((java.util.Map) formdata.get("listValores"))!= null){
                java.util.Map lista = (java.util.Map)formdata.get("listValores");
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
        
        
        
        /****************************************************************************************/
        /*********************************** CALLBACK AJAX **************************************/
        /****************************************************************************************/
      function f_onchange_CEVENTO() {
            var CEVENTO=objDom.getValorPorId("CEVENTO");
            if (!objUtiles.estaVacio(CEVENTO)){
                var qs="operation=ajax_eventos";
                qs=qs+"&op="+"CEVENTO";
                qs=qs+"&CEVENTO="+CEVENTO
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("axis_axissin006.do", callbackajaxevento, qs, this)
            } else {
                objDom.setValorPorId("CEVENTO", "");
                objDom.setValorHTMLPorId("TEVENTO_span", "");
                objDom.setVisibilidadPorId("findEvento", "hidden");
                limpiaCampos("CEVENTO");
            }
        }        

        
         function callbackAjaxOnblurCPOSTAL(ajaxResponseText) {
            try{
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
				
					var ban = objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0);
                    
                    if (ban == 2){
                        objUtiles.abrirModal("axisper041", "src", "modal_axisper041.do?operation=form&CPOSTAL=" + document.getElementById("CPOSTAL").value);
                    }
                    else
                    {
					

                    // País
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS")[0])) {
                        objDom.setValorPorId("CPAIS", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS"), 0, 0));
                        objDom.setVisibilidadPorId("findProvincia", "visible");
                    } else {
                       objDom.setValorPorId("CPAIS", "");
                       objDom.setVisibilidadPorId("findProvincia", "hidden");                    
                    }
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAIS")[0])) {
                        document.getElementById("TPAIS_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAIS"), 0, 0) + "</b>";
                    } else {
                        document.getElementById("TPAIS_span").innerHTML = "";
                    }
                    
                    // Provincia
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPROVIN")[0])) {
                        objDom.setValorPorId("CPROVIN", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPROVIN"), 0, 0));           
                        objDom.setVisibilidadPorId("findPoblacion", "visible");
                    } else {
                        objDom.setValorPorId("CPROVIN", "");
                        objDom.setVisibilidadPorId("findPoblacion", "hidden");                    
                    }
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAIS")[0])) {
                        document.getElementById("TPROVIN_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPROVIN"), 0, 0) + "</b>";
                    } else {
                        document.getElementById("TPROVIN_span").innerHTML = "";
                    }
                    

                    // Población
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPOBLAC")[0])) {
                        objDom.setValorPorId("CPOBLAC", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPOBLAC"), 0, 0));           
                    } else {
                        objDom.setValorPorId("CPOBLAC", "");
                    }
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPOBLAC")[0])) {
                        document.getElementById("TPOBLAC_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOBLAC"), 0, 0) + "</b>";
                    } else {
                        document.getElementById("TPOBLAC_span").innerHTML = "";
                    }
					}
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
        
      
       function f_onchange_CPAIS() {
            var CPAIS=objDom.getValorPorId("CPAIS");
            if (!objUtiles.estaVacio(CPAIS)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPAIS";
                qs=qs+"&CPAIS="+CPAIS
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axissin017.do", callbackajaxdireccion, qs, this)
            } else {
                objDom.setValorPorId("CPAIS", "");
                objDom.setValorHTMLPorId("TPAIS_span", "");
                objDom.setVisibilidadPorId("findProvincia", "hidden");
                limpiaCampos("CPAIS");
            }
        }
        
        function f_onchange_CPOBLAC() {
            var CPAIS=objDom.getValorPorId("CPAIS");
            var CPOBLAC=objDom.getValorPorId("CPOBLAC");
            var CPROVIN=objDom.getValorPorId("CPROVIN");
            if (!objUtiles.estaVacio(CPOBLAC)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPOBLAC";
                qs=qs+"&CPAIS="+CPAIS
                qs=qs+"&CPOBLAC="+CPOBLAC
                qs=qs+"&CPROVIN="+CPROVIN
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axissin017.do", callbackajaxdireccion, qs, this)
            } else {
             /*   objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");*/
                limpiaCampos("CPROVIN");
            }
        }
        function f_onchange_CPROVIN() {
            var CPAIS=objDom.getValorPorId("CPAIS");
            var CPROVIN=objDom.getValorPorId("CPROVIN");
            if (!objUtiles.estaVacio(CPROVIN)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPROVIN";
                qs=qs+"&CPAIS="+CPAIS
                qs=qs+"&CPROVIN="+CPROVIN
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axissin017.do", callbackajaxdireccion, qs, this)
            }else{
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
                limpiaCampos("CPROVIN");
            }
        }
        function callbackajaxdireccion (ajaxResponseText){
            try{ 
            
           // alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPAIS", "");
                            limpiaCampos("CPAIS");
                        }else{
                            objDom.setValorPorId("CPAIS", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS"), 0, 0));
                            objDom.setVisibilidadPorId("findProvincia", "visible");
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAIS")[0])){
                                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAIS"), 0, 0) + "</b>");
                                
                                limpiaCampos("CPAIS");
                            }
                        }
                    }
                 
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS_RESIDENCIA")[0])) {
                       if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPAIS", "");
                            limpiaCampos("CPAIS");
                        }else{
                            objDom.setValorPorId("CPAIS", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS_RESIDENCIA"), 0, 0));
                            if (document.miForm.isNew.value == "true"){
                                objDom.setValorPorId("CNACIONALIDAD", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS_RESIDENCIA"), 0, 0));
                            }
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAISRESIDENCIA")[0])){
                                objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAISRESIDENCIA"), 0, 0) + "</b>");
                                  
                                    if (document.miForm.isNew.value == "true"){
                                     objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAISRESIDENCIA"), 0, 0) + "</b>");
                                     }
                                
                                limpiaCampos("CPAIS_RESIDENCIA");
                            }
                        }
                    }
                    
                      if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CNACIONALIDAD")[0])) {
                       if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CNACIONALIDAD", "");
                            limpiaCampos("CNACIONALIDAD");
                        }else{
                            objDom.setValorPorId("CNACIONALIDAD", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CNACIONALIDAD"), 0, 0));
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAISNACIONALIDAD")[0])){
                                 objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAISNACIONALIDAD"), 0, 0) + "</b>");
                                limpiaCampos("CNACIONALIDAD");
                            }
                        }
                    }
                    
         
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPROVIN")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPROVIN", "");
                            limpiaCampos("CPROVIN");
                        }else{
                            objDom.setValorPorId("CPROVIN", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPROVIN"), 0, 0));
                            objDom.setVisibilidadPorId("findPoblacion", "visible");
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPROVIN")[0])){
                                objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPROVIN"), 0, 0) + "</b>");
                                
                                limpiaCampos("CPROVIN");
                            }
                        }
                    }
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPOBLAC")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPOBLAC", "");
                        }else{
                            objDom.setValorPorId("CPOBLAC", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPOBLAC"), 0, 0));
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPOBLAC")[0]))
                                objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOBLAC"), 0, 0) + "</b>");
                        }
                    }
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }

        
        
        function limpiaCampos (CAMPO){
            if(objUtiles.utilEquals(CAMPO, "CPAIS")){
                //Limpio província
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
            }
            
            if(objUtiles.utilEquals(CAMPO, "CPAIS") ||
                objUtiles.utilEquals(CAMPO, "CPROVIN")){
                    //Limpio población
                    objDom.setValorPorId("CPOBLAC", "");
                    objDom.setValorHTMLPorId("TPOBLAC_span", "");
            }
            if(objUtiles.utilEquals(CAMPO, "TODO") ){
                objDom.setValorPorId("TNOMVIA", "");
                objDom.setValorPorId("NNUMVIA", "");
                objDom.setValorPorId("TCOMPLE", "");
                objDom.setValorPorId("CSIGLAS", "<%= Integer.MIN_VALUE %>");
                objDom.setValorPorId("CPOSTAL", "");
                objDom.setValorPorId("CPAIS", "");
                objDom.setValorHTMLPorId("TPAIS_span", "");            
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setValorPorId("CPOBLAC", "");
               objDom.setValorHTMLPorId("TPOBLAC_span", "");
            }            
            
            
        }

        /**************************************  RESTO FUNCIONES POBLACION *******************************/
        function f_onblur_CPOSTAL(CPOSTAL) {
            if (!objUtiles.estaVacio(CPOSTAL)){
				document.${nombrePantalla}Form.CPAIS.focus();
                objAjax.invokeAsyncCGI('modal_axissin017.do', callbackAjaxOnblurCPOSTAL, 'operation=getProvinPobla&CPOSTAL=' + CPOSTAL, this);
            }
        }
        
        
        function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION, CODIGO_CP){
             objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
              "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION+"&TIPO=DATE&CODIGO_CP=" + CODIGO_CP);
        }
        
        function f_aceptar_axiscom001(CODIGO, TEXTO, CODIGO_CONSULTA){
            f_cerrar_axiscom001();
            if (!objUtiles.estaVacio(TEXTO))
                TEXTO = objUtiles.replaceAll(TEXTO, "-quote-", "\'");
            if (CODIGO_CONSULTA == "LISTA_PAIS") {
                objDom.setValorPorId("CPAIS", CODIGO);
                objDom.setVisibilidadPorId("findProvincia", "visible");                
                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + TEXTO + "</b>");
                limpiaCampos("CPAIS");
            }
            else if (CODIGO_CONSULTA == "LISTA_PROVINCIA") {
                objDom.setValorPorId("CPROVIN", CODIGO);
                objDom.setVisibilidadPorId("findPoblacion", "visible");
                objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + TEXTO + "</b>");
                limpiaCampos("CPROVIN");
            }
            else if (CODIGO_CONSULTA == "LISTA_POBLACION") {
                objDom.setValorPorId("CPOBLAC", CODIGO);
                objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + TEXTO + "</b>");
            }   
            else if (CODIGO_CONSULTA == "LISTA_EVENTOS") {
            try{
                objDom.setValorPorId("CEVENTO", CODIGO);
                objDom.setValorHTMLPorId("TEVENTO_span", "<b>" + TEXTO + "</b>");
                }catch(e){alert(e);}
            }
        }
        
        function f_cerrar_axiscom001() {
            objUtiles.cerrarModal("axiscom001");
        }
        
        function f_abrir_axissin035(){
            objUtiles.abrirModal("axissin035","src","axis_axissin035.do?operation=form&SINIESTRO=Si"); 
        }
        
        function f_aceptar_axissin035(CODIGO, TEXTO){
            try{
                objDom.setValorPorId("CEVENTO", CODIGO);
                objDom.setValorHTMLPorId("TEVENTO_span", "<b>" + TEXTO + "</b>");
                }
                catch(e){alert(e);}
            f_cerrar_axissin035();    
        }
        
        function f_cerrar_axissin035(){
            objUtiles.cerrarModal("axissin035");
        }
        
        
        
        
        
        
        
        


        function callbackajaxevento (ajaxResponseText){
            try{ 
            
                 //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                  
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CEVENTO")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CEVENTO", "");
                            objDom.setValorHTMLPorId("TEVENTO_span", "<b>" + objJsMessages.jslit_codigo_pais_incorrecto +"</b>");
                        }else{
                            objDom.setValorPorId("CEVENTO", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CEVENTO"), 0, 0));
                            objDom.setVisibilidadPorId("findEvento", "visible");
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TEVENTO")[0])){
                                objDom.setValorHTMLPorId("TEVENTO_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TEVENTO"), 0, 0) + "</b>");
                                
                            }
                        }
                    }
                    
  
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }            
       function f_seleccionar_riesgo(obj, valor){
            if(objDom.getComponenteMarcado(obj))
                objDom.setValorPorId("NRIESGO", valor);
            else objDom.setValorPorId("NRIESGO", "");
        }
        
        
     //////////declarante////////////
      function f_cargar_declarante(){
                objDom.setValorPorId("DEC_SPERSON", ""); 
                objDom.setValorPorId("LIMPIAR_DATOS", "false");
                objUtiles.ejecutarFormulario("modal_axissin017.do?SP_DEC=vaciar", "form", document.${nombrePantalla}Form, "_self", objJsMessages.jslit_cargando);
            
            }
            function f_existe_persona(NNUMIDE){
                 objAjax.invokeAsyncCGI("modal_axissin017.do", callbackajaxexistePersona, 
                  "operation=ajax_existe_persona&NNUMIDE=" + NNUMIDE+"&CAGENTE="+document.${nombrePantalla}Form.CAGENTE.value , this, objJsMessages.jslit_actualizando_registro);
            }
            
             function callbackajaxexistePersona(ajaxResponseText) {
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var PSPERSON_NEW = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("PSPERSON_NEW")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("PSPERSON_NEW"), 0, 0) : "");                    
                    if (!objUtiles.estaVacio(PSPERSON_NEW)){
                        var mensaje = "<axis:alt c="mens" f="axissin017" lit='9901033'/>";
                        if (confirm(mensaje)){
                        var cagente = "${__formdata.CAGENTE}";
                         objUtiles.abrirModal("axisper021","src","modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&faceptar=f_aceptar_axisper021&NNUMNIF="+document.${nombrePantalla}Form.NNUMIDE.value+"&CAGENTE="+cagente+"&CONSULT_INI=1");
                         }
                          
                    }
                }
            }  
            
            function f_abrir_axisper021(){
               var cagente = "${__formdata.CAGENTE}";
               objUtiles.abrirModal("axisper021","src","modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&faceptar=f_aceptar_axisper021&CAGENTE="+cagente);
            }
        function f_aceptar_persona(SPERSON){
            objDom.setValorPorId("DEC_SPERSON", SPERSON); 
            objUtiles.cerrarModal("axisper021");
            f_get_persona(SPERSON);
        } 
        
        function f_get_persona(SPERSON){
             objAjax.invokeAsyncCGI("modal_axissin017.do", callbackajaxGetPersona, 
              "operation=ajax_get_persona&SPERSON=" + SPERSON+"&CAGENTE="+document.${nombrePantalla}Form.CAGENTE.value , this, objJsMessages.jslit_actualizando_registro);
        }
        
          function callbackajaxGetPersona(ajaxResponseText) {
                var doc=objAjax.domParse(ajaxResponseText);
               // alert(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    
                    <axis:visible f="axissin017" c="NNUMIDE">
                    document.${nombrePantalla}Form.NNUMIDE.value = '';
                    </axis:visible>
                    <axis:visible f="axissin017" c="TNOMDEC">
                    document.${nombrePantalla}Form.TNOMDEC.value  = '';
                    </axis:visible>
                     <axis:visible f="axissin017" c="TNOM1DEC">
                    document.${nombrePantalla}Form.TNOM1DEC.value  = '';
                    </axis:visible>
                     <axis:visible f="axissin017" c="TNOM2DEC">
                    document.${nombrePantalla}Form.TNOM2DEC.value  = '';
                    </axis:visible>
                    document.${nombrePantalla}Form.TAPE1DEC.value = '';
                    document.${nombrePantalla}Form.TAPE2DEC.value = '';
                    document.${nombrePantalla}Form.CTIPIDE.value  = "<%= Integer.MIN_VALUE %>";
                    document.${nombrePantalla}Form.CTIPIDE_AUX.value = '';
                    <axis:visible f="axissin017" c="TTELDEC">
                    document.${nombrePantalla}Form.TTELDEC.value  = '';
                    </axis:visible>
                    
                     <axis:visible f="axissin017" c="TMOVILDEC">
                    document.${nombrePantalla}Form.TMOVILDEC.value  = '';
                    </axis:visible>
                     <axis:visible f="axissin017" c="TEMAILDEC">
                    document.${nombrePantalla}Form.TEMAILDEC.value  = '';
                    </axis:visible>
                    document.${nombrePantalla}Form.DEC_SPERSON.value  = '';
                    
                    var TNOMBRE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0) : "");                    
               
                   var TNOMBRE1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE1")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE1"), 0, 0) : "");
                    
                   var TNOMBRE2 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE2")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE2"), 0, 0) : "");
                    
                    var TAPELLI1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0) : "");                    
               
                    var TAPELLI2 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI2")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0) : "");                    
               
                    var CTIPIDE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTIPIDE")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPIDE"), 0, 0) : "");
               
                    var NNUMIDE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NNUMIDE")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0) : ""); 
                    
                    var SPERSON = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("SPERSON")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0) : ""); 
               
                    var contactos = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CONTACTOS")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("CONTACTOS"), 0, 0) : ""); 
                    <axis:visible f="axissin017" c="TTELDEC">
                    for (var i = 0; i < objDom.numeroDeTags(doc, "OB_IAX_CONTACTOS") ; i++) {
                        var CTIPCON = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTIPCON")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPCON"), i, 0) +" " : "";
                            if (CTIPCON == 1 || CTIPCON == 5 ) {
                                var TVALCON = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TVALCON")[0]) ? 
                                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TVALCON"), i, 0) +" " : "";
                                document.${nombrePantalla}Form.TTELDEC.value = TVALCON;
                                break;
                                
                            }
                     }
                  </axis:visible>  
                    <axis:visible f="axissin017" c="TMOVILDEC">
                      for (var i = 0; i < objDom.numeroDeTags(doc, "OB_IAX_CONTACTOS") ; i++) {
                        var CTIPCON = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTIPCON")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPCON"), i, 0) +" " : "";
                            if (CTIPCON == 6 || CTIPCON == 8) {
                                var TVALCON = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TVALCON")[0]) ? 
                                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TVALCON"), i, 0) +" " : "";
                                document.${nombrePantalla}Form.TMOVILDEC.value = TVALCON;
                                break;
                                
                            }
                     }
              
             
                    </axis:visible>
                    <axis:visible f="axissin017" c="TEMAILDEC">
                     for (var i = 0; i < objDom.numeroDeTags(doc, "OB_IAX_CONTACTOS") ; i++) {
                        var CTIPCON = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTIPCON")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPCON"), i, 0) +" " : "";
                            if (CTIPCON == 3) {
                                var TVALCON = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TVALCON")[0]) ? 
                                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TVALCON"), i, 0) +" " : "";
                                document.${nombrePantalla}Form.TEMAILDEC.value = TVALCON;
                                break;
                                
                            }
                     }
                    
                    
                    </axis:visible>
                    <axis:visible f="axissin017" c="TNOMDEC">
                    document.${nombrePantalla}Form.TNOMDEC.value = TNOMBRE;
                    </axis:visible>
                    <axis:visible f="axissin017" c="TNOM1DEC">
                    document.${nombrePantalla}Form.TNOM1DEC.value = TNOMBRE1;
                    </axis:visible>
                      <axis:visible f="axissin017" c="TNOM2DEC">
                    document.${nombrePantalla}Form.TNOM2DEC.value = TNOMBRE2;
                    </axis:visible>
                    document.${nombrePantalla}Form.TAPE1DEC.value = TAPELLI1;
                    document.${nombrePantalla}Form.TAPE2DEC.value = TAPELLI2;
                    document.${nombrePantalla}Form.CTIPIDE.value = CTIPIDE;
                    document.${nombrePantalla}Form.CTIPIDE_AUX.value = CTIPIDE;
                    document.${nombrePantalla}Form.NNUMIDE.value = NNUMIDE;
                 <%--    document.${nombrePantalla}Form.TMOVILDEC.value = TMOVILDEC;--%>
                  <%--  document.${nombrePantalla}Form.TEMAILDEC.value = TEMAILDEC;--%>
                    objDom.setValorPorId("DEC_SPERSON", SPERSON); 
                     
                   f_actualizar_campos(0);
                }
            } 
        function f_cerrar_modalespersona(pantalla){
             f_cerrar_axisper021();
         }
        function f_cerrar_axisper021(){
                objUtiles.cerrarModal("axisper021");
        } 
        function f_actualizar_campos(resetear){
        
            if (resetear == 1){
                    document.${nombrePantalla}Form.NNUMIDE.value = '';
                    <axis:visible f="axissin017" c="TNOMDEC">
                    document.${nombrePantalla}Form.TNOMDEC.value  = '';
                    </axis:visible>
                      <axis:visible f="axissin017" c="TNOM1DEC">
                    document.${nombrePantalla}Form.TNOM1DEC.value  = '';
                    </axis:visible>
                      <axis:visible f="axissin017" c="TNOM2DEC">
                    document.${nombrePantalla}Form.TNOM2DEC.value  = '';
                    </axis:visible>
                    document.${nombrePantalla}Form.TAPE1DEC.value = '';
                    document.${nombrePantalla}Form.TAPE2DEC.value = '';
                    document.${nombrePantalla}Form.CTIPIDE.value  = "<%= Integer.MIN_VALUE %>";
                    document.${nombrePantalla}Form.CTIPIDE_AUX.value = '';
                    <axis:visible f="axissin017" c="TTELDEC">
                    document.${nombrePantalla}Form.TTELDEC.value  = '';
                    </axis:visible>
                     <axis:visible f="axissin017" c="TMOVILDEC">
                    document.${nombrePantalla}Form.TMOVILDEC.value  = '';
                    </axis:visible>
                     <axis:visible f="axissin017" c="TEMAILDEC">
                    document.${nombrePantalla}Form.TEMAILDEC.value  = '';
                    </axis:visible>
                    document.${nombrePantalla}Form.DEC_SPERSON.value  = '';
                    
										f_cargar_propiedades_pantalla();                     
                    
                  /*  <axis:visible f="axissin017" c="TNOMDEC">
                    document.${nombrePantalla}Form.TNOMDEC.readOnly = false;
                    </axis:visible>
                      <axis:visible f="axissin017" c="TNOM1DEC">
                    document.${nombrePantalla}Form.TNOM1DEC.readOnly = false;
                    </axis:visible>
                     <axis:visible f="axissin017" c="TNOM2DEC">
                    document.${nombrePantalla}Form.TNOM2DEC.readOnly = false;
                    </axis:visible>
                    document.${nombrePantalla}Form.TAPE1DEC.readOnly = false;
                    document.${nombrePantalla}Form.TAPE2DEC.readOnly = false;
                    document.${nombrePantalla}Form.CTIPIDE.disabled = false;
                    document.${nombrePantalla}Form.NNUMIDE.readOnly = false;
                     document.${nombrePantalla}Form.TEMAILDEC.readOnly = false;
                    document.${nombrePantalla}Form.TMOVILDEC.readOnly = false;
                    document.${nombrePantalla}Form.TTELDEC.readOnly = false;*/
                    objDom.setVisibilidadPorId("INFO_PERSONA","hidden");    
                   /*   <axis:visible f="axissin017" c="TNOMDEC">
                    document.${nombrePantalla}Form.TNOMDEC.className = "campowidthinput campo campotexto";
                     </axis:visible>
                     <axis:visible f="axissin017" c="TNOM1DEC">
                    document.${nombrePantalla}Form.TNOM1DEC.className = "campowidthinput campo campotexto";
                    </axis:visible>
                     <axis:visible f="axissin017" c="TNOM2DEC">
                    document.${nombrePantalla}Form.TNOM2DEC.className = "campowidthinput campo campotexto";
                    </axis:visible>
                    document.${nombrePantalla}Form.TAPE1DEC.className = "campowidthinput campo campotexto";
                    document.${nombrePantalla}Form.TAPE2DEC.className = "campowidthinput campo campotexto";
                    document.${nombrePantalla}Form.CTIPIDE.className = "campowidthinput campo campotexto";
                    document.${nombrePantalla}Form.NNUMIDE.className = "campowidthinput campo campotexto";*/
               }else{
                  /*   <axis:visible f="axissin017" c="TNOMDEC">
                    document.${nombrePantalla}Form.TNOMDEC.readOnly = true;
                    </axis:visible>
                    <axis:visible f="axissin017" c="TNOM1DEC">
                    document.${nombrePantalla}Form.TNOM1DEC.readOnly = true;
                     </axis:visible>
                     <axis:visible f="axissin017" c="TNOM2DEC">
                    document.${nombrePantalla}Form.TNOM2DEC.readOnly = true;
                     </axis:visible>
                    document.${nombrePantalla}Form.TAPE1DEC.readOnly = true;
                    document.${nombrePantalla}Form.TAPE2DEC.readOnly = true;*/
                   if (!objUtiles.estaVacio(document.${nombrePantalla}Form.CTIPIDE)
                    && !objUtiles.estaVacio(document.${nombrePantalla}Form.CTIPIDE_AUX.value) ){
                         document.${nombrePantalla}Form.CTIPIDE.value = document.${nombrePantalla}Form.CTIPIDE_AUX.value;
                    }
              /*      document.${nombrePantalla}Form.CTIPIDE.disabled = true;
                    document.${nombrePantalla}Form.NNUMIDE.readOnly = true;
                    document.${nombrePantalla}Form.TTELDEC.readOnly = true;
                    document.${nombrePantalla}Form.TEMAILDEC.readOnly = true;
                    document.${nombrePantalla}Form.TMOVILDEC.readOnly = true;  */
                    objDom.setVisibilidadPorId("INFO_PERSONA","visible");
                    f_cargar_propiedades_pantalla();       
                }
        }
        
        function f_consulta_persona(){
            objDom.setValorPorId("LIMPIAR_DATOS", "false");
            objUtiles.ejecutarFormulario("modal_axissin017.do", "consulta_persona", document.${nombrePantalla}Form, "_self", objJsMessages.jslit_cargando);
        }
        function f_alta_persona(){
            objDom.setValorPorId("LIMPIAR_DATOS", "false");
            objUtiles.ejecutarFormulario("modal_axissin017.do", "alta_persona", document.${nombrePantalla}Form, "_self", objJsMessages.jslit_cargando);
        }
        
        
        
        /* *********************************** FUNCIONES PRESTACIONES **************************** */  
             function f_abrir_personarel(){
               var cagente = "${__formdata.CAGENTE}";
               //alert("HOLA");
               objUtiles.abrirModal("axisper021","src","modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&faceptar=f_aceptar_personarel&CAGENTE="+cagente);
             }
             
             function f_aceptar_personarel(SPERSON){
             //alert("En aceptar personas rel"+SPERSON);
                objDom.setValorPorId("SPERSON2", SPERSON); 
                objUtiles.cerrarModal("axisper021");
                f_get_personarel(SPERSON);
            } 
        
            function f_get_personarel(SPERSON){
            //alert("en f_get_personas rela");
             objAjax.invokeAsyncCGI("axis_axissin017.do", callbackajaxGetPersonarel, 
             "operation=ajax_get_persona&SPERSON=" + SPERSON+"&CAGENTE="+document.${nombrePantalla}Form.CAGENTE.value , this, objJsMessages.jslit_actualizando_registro);
            }
        
            function callbackajaxGetPersonarel(ajaxResponseText) {
                var doc=objAjax.domParse(ajaxResponseText);
               // alert(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    
                    document.${nombrePantalla}Form.NNUMIDEDEC1.value = '';
                     <axis:visible f="axissin017" c="TNOMDEC1">
                    document.${nombrePantalla}Form.TNOMDEC1.value  = '';
                    </axis:visible>
                    
                    var TNOMBRE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0) : "");                    
                                                        
                    var TAPELLI1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0) : "");                    
               
                    var TAPELLI2 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI2")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0) : "");  
                    
                    var NNUMIDEDEC = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NNUMIDE")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0) : ""); 
                     <axis:visible f="axissin017" c="TNOMDEC1">
                    document.${nombrePantalla}Form.TNOMDEC1.value= TNOMBRE  +" " +TAPELLI1 + " " + TAPELLI2;
											</axis:visible>
                    document.${nombrePantalla}Form.NNUMIDEDEC1.value= NNUMIDEDEC;
                 
                }
             }
             
             
             function f_validar_nivel(){
             	
             	
             	try{
                if( !objUtiles.estaVacio(CNIVEL) &&    document.${nombrePantalla}Form.CNIVEL.value==1){
                    if(document.${nombrePantalla}Form.NNUMIDEDEC1){
                      document.${nombrePantalla}Form.NNUMIDEDEC1.disabled = "true";
                      document.${nombrePantalla}Form.NNUMIDEDEC1.value="";
                      document.${nombrePantalla}Form.icon_NNUMIDE.style.visibility = "hidden";
                    }
                    
                    if(document.${nombrePantalla}Form.TNOMDEC1){
                      document.${nombrePantalla}Form.TNOMDEC1.disabled = "true";
                      document.${nombrePantalla}Form.TNOMDEC1.value="";
                    }
                } else {
                    if(document.${nombrePantalla}Form.NNUMIDEDEC1){
                      document.${nombrePantalla}Form.NNUMIDEDEC1.disabled = "false";
                      document.${nombrePantalla}Form.icon_NNUMIDE.style.visibility = "visible";
                     
                    }
                    
                    if(document.${nombrePantalla}Form.TNOMDEC1){
                      document.${nombrePantalla}Form.TNOMDEC1.disabled = "false";
          
                    }
                }
                
              }catch(e){}
                
             }
             
             
             function f_cargar_personas(){
              objAjax.invokeAsyncCGI("modal_axissin017.do", callbackajaxGetPersonasCaus, 
             "operation=ajax_actualizar_persona&SSEGURO=" + document.${nombrePantalla}Form.SSEGURO.value +"&CCAUSIN="+document.${nombrePantalla}Form.CCAUSIN.value +"&CMOTSIN="+document.${nombrePantalla}Form.CMOTSIN.value +"&CNIVEL="+document.${nombrePantalla}Form.CNIVEL.value , this, objJsMessages.jslit_actualizando_registro);
             }
             
             function callbackajaxGetPersonasCaus(ajaxResponseText) {
             
            try {  
                var doc = objAjax.domParse(ajaxResponseText);
                //alert("RESPUESTA"+ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {                                
                    var elementos = doc.getElementsByTagName("element");
                    var modelocombo = document.${nombrePantalla}Form.SPERSON2;     
                    objDom.borrarOpcionesDeCombo(modelocombo);
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        var elementos = doc.getElementsByTagName("element");
                        var modelocombo = document.${nombrePantalla}Form.SPERSON2;     
                        objDom.borrarOpcionesDeCombo(modelocombo);
                        for (i = 0; i < elementos.length; i++) {
                            var codigo = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CATRIBU")[0]) ?
                                         objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CATRIBU"), 0, 0) : "";
                            var desc   = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("TATRIBU")[0]) ?
                                         objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TATRIBU"), 0, 0): "";
                            objDom.addOpcionACombo(codigo, desc, modelocombo, i);
                        }
                        
                        
                    }
                 
                    
                } 
             } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
               }
             
             
             }
            /* ******************************  FIN FUNCIONES PRESTACIONES **************************** */  
        
                function f_onclickCheckbox(thiss) {
                    thiss.value =  ((thiss.checked)?1:0);
                    objDom.setValorPorId(thiss.id, thiss.value);
                }
                
             function f_cerrar_axisctr014() {
                objUtiles.cerrarModal("axisctr014")
            }    
            
       
            
            function f_aceptar_axisctr014 (CAGENTE){
                objDom.setValorPorId("CAGENTE", CAGENTE);
                f_cerrar_axisctr014();
                objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            }  
            
            
            function callbackAjaxCambiarAgente(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);

                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                    var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                    objDom.setValorPorId("CAGENTE_SEL", CAGENTEformateado);
                    objDom.setValorPorId("TAGENTE_SEL", NOMBREformateado);
                }
               
                
            }
            
            function f_actualizar_agente_sel(thiss){
      
               if (!objUtiles.estaVacio(thiss)){
                        objAjax.invokeAsyncCGI("axis_axisadm047.do", callbackAjaxCargarAgenteSel, "operation=ajax_actualizar_agente&CAGENTE=" + thiss, this);
              }
             }

 

        function callbackAjaxCargarAgenteSel(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            var elementos = doc.getElementsByTagName("element");
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                    var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                    var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                    objDom.setValorPorId("CAGENTE_SEL", CAGENTEformateado); 
                    objDom.setValorPorId("TAGENTE_SEL", NOMBREformateado); 
                    
                }else{
                    objDom.setValorPorId("TAGENTE_SEL",""); 
                    objDom.setValorPorId("CAGENTE_SEL","");
                }
            }
           
        }
        
         function f_abrir_axisctr014() {
            objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
        }  
	 /* ************************************************************************************************* */
    /* ***************************** MODALES AXISSIN52 -AXISSIN53 FRAUDE ******************************* */
    /* ************************************************************************************************* */
    
    /* ****************************** AXISSIN052 - detalle frau    ************************************* */
    function f_detalle_fraude(){
        //alert("antes del detall *");
        var NSINIES = document.${nombrePantalla}Form.NSINIES.value;
        var CFRAUDE = document.${nombrePantalla}Form.CFRAUDE.value;
        f_abrir_axissin052(NSINIES,CFRAUDE);
    }
    
    function f_abrir_axissin052(NSINIES,CFRAUDE) {
     //alert("antes* ");
        var SSEGURO = document.${nombrePantalla}Form.SSEGURO.value;
        objUtiles.abrirModal("axissin052","src","modal_axissin052.do?operation=form&NSINIES="+NSINIES+"&CFRAUDE="+CFRAUDE+"&SSEGURO="+SSEGURO);               
    }
        
    function f_cerrar_axissin052(){
        objUtiles.cerrarModal("axissin052");
    }
    
    function f_aceptar_axissin052(CTIPREF,TREFEXT,FREFINI,FREFFIN,srefext,TTIPREF){
        //f_anyadir_fila(CTIPREF,TREFEXT,FREFINI,FREFFIN,srefext,TTIPREF);
        f_cerrar_axissin052();
    }
    
    /* ****************************** AXISSIN053 - alta defraudador ************************************* */
    function f_alta_defraudador(){
        var NSINIES = document.${nombrePantalla}Form.NSINIES.value;
        f_abrir_axissin053(NSINIES);
    }
    
    function f_abrir_axissin053(NSINIES) {
        var SSEGURO = document.${nombrePantalla}Form.SSEGURO.value;
        objUtiles.abrirModal("axissin053","src","modal_axissin053.do?operation=form&NSINIES="+NSINIES+"&SSEGURO="+SSEGURO);               
    }
        
    function f_cerrar_axissin053(){
        objUtiles.cerrarModal("axissin053");
    }
    
    function f_aceptar_axissin053(CTIPREF,TREFEXT,FREFINI,FREFFIN,srefext,TTIPREF){
        //f_anyadir_fila(CTIPREF,TREFEXT,FREFINI,FREFFIN,srefext,TTIPREF);
        f_cerrar_axissin053();
    }
	
	function f_cerrar_modal(pantalla){
            objUtiles.cerrarModal(pantalla);
    }
		
	function f_aceptar_axisper041 (CPAIS, TPAIS, CPROVIN, TPROVIN, CPOBLAC, TPOBLAC){
            f_cerrar_modal("axisper041");
            objDom.setValorPorId("CPAIS", CPAIS);
            objDom.setVisibilidadPorId("findProvincia", "visible");
            document.getElementById("TPAIS_span").innerHTML = "<b>" + TPAIS + "</b>";
            
            objDom.setValorPorId("CPROVIN", CPROVIN);           
            objDom.setVisibilidadPorId("findPoblacion", "visible");
            document.getElementById("TPROVIN_span").innerHTML = "<b>" + TPROVIN + "</b>";
            
            objDom.setValorPorId("CPOBLAC", CPOBLAC);     
            document.getElementById("TPOBLAC_span").innerHTML = "<b>" + TPOBLAC + "</b>";
                    
    }
	
	function f_aceptar_axisper042(CPOSTAL){
		f_cerrar_modal("axisper042");
		objDom.setValorPorId("CPOSTAL", CPOSTAL);
		document.${nombrePantalla}Form.CPOSTAL.focus();    
		objAjax.invokeAsyncCGI('modal_axissin017.do', callbackAjaxOnblurCPOSTAL, 'operation=getProvinPobla&CPOSTAL=' + CPOSTAL, this);           
	}
			
	function f_abrir_axisper042 () {
		objUtiles.abrirModal("axisper042", "src", "modal_axisper042.do?operation=form");
	}
	
	
    </script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
	
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper041|<axis:alt c="axisper041_TITULO" f="axisper041" lit="9002274"/></c:param>
    </c:import>
	
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper042|<axis:alt c="axisper042_TITULO" f="axisper042" lit="9002274"/></c:param>
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
    
    
    <form name="${nombrePantalla}Form" action="" method="POST">
    <input type="hidden" name="operation" value="guardar" />
    <input type="hidden" name="NSINIES" value="${__formdata.NSINIES}"/>
     <input type="hidden" name="SPRODUC" id="SPRODUC" value="${__formdata.SPRODUC}"/>
     <input type="hidden" name="SSEGURO" value="${__formdata.OB_IAX_DATPOLIZA.SSEGURO}"/>
     <input type="hidden" name="NRIESGO" value="${__formdata.OB_IAX_DATPOLIZA.NRIESGO}"/>
    <input type="hidden" name="subpantalla" value="tramitaciones"/>
    <input type="hidden" name="EDICION" value="${__formdata.EDICION}"/>
    <input type="hidden" name="seccion" value="movimientos"/>
    <input type="hidden" name="CACTIVI" value="${__formdata.OB_IAX_DATPOLIZA.CACTIVI}"/>
    <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}" />
    <input type="hidden" name="CTIPIDE_AUX" id="CTIPIDE_AUX" value="${__formdata.CTIPIDE_AUX}" />
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt c="titulo" f="axissin017" lit="9001131"/></c:param>
        <c:param name="formulario"><axis:alt c="form" f="axissin017" lit="9001131"/></c:param>
        <c:param name="form">axissin017</c:param>
    </c:import>
    <!-- MODAL -->
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
        </c:import>
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin035</c:param>
        </c:import>    
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt c="titulo21" f="axissin017" lit="9000642"/></c:param>
            <c:param name="nid">axisper021</c:param>
    </c:import>  
     <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axissin017" c="CAGENTE" lit="100584"/></c:param>
                <c:param name="nid" value="axisctr014"></c:param>
            </c:import>
  <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axissin052" c="titulo_axissin052" lit="9903634" /></c:param>
                <c:param name="nid" value="axissin052"></c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axissin053" c="titulo_axissin053" lit="9903632" /></c:param>
                <c:param name="nid" value="axissin053"></c:param>
    </c:import>
    <div class="separador">&nbsp;</div>
    <table  class="mainModalDimensions base"  align="center" cellpadding="0" cellspacing="0"><!--id="tabla1" -->
        <tr>
            <td>
                <!-- Seccion -->
                <div class="titulo"> 
                    <img  src="images/flecha.gif"/>
                    <axis:alt c="flecha" f="axissin017" lit="104929" /> 
                </div>  
                <div class="separador">&nbsp;</div>
                <div class="titulocaja">
                    <b><axis:alt c="descpol" f="axissin017" lit="104925" />: ${__formdata.OB_IAX_DATPOLIZA.NPOLIZA}/${__formdata.OB_IAX_DATPOLIZA.NCERTIF}<axis:ocultar f="axissin017" c="CPOLCIA" dejarHueco="false"> -  ${__formdata.OB_IAX_DATPOLIZA.CPOLCIA} </axis:ocultar> - <fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OB_IAX_DATPOLIZA.FEFECTO}"/></b>
                </div>
                <table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center"--> <!-- UNO -->
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <!--th style="width:20%;height:0px"></th-->
                            </tr>
                            <tr>
                              <axis:ocultar f="axissin017" c="CAGENTE_SEL" dejarHueco="false"> <!-- TODO C -->
                                                <td class="titulocaja" colspan="3">
                                                    <b><axis:alt f="axissin017" c="CAGENTE" lit="100584"></axis:alt></b>
                                                </td>
                                            </axis:ocultar>
                            </tr>
                            <tr>
                             <axis:ocultar f="axissin017" c="CAGENTE_SEL" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja" colspan="2">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CAGENTE_SEL}" name="CAGENTE_SEL" id="CAGENTE_SEL"  title="<axis:alt f="axisctr019" c="CAGENTE_SEL" lit="100584"/>"  style="width:15%"
                                        title="<axis:alt f="axissin017" c="CAGENTE_SEL" lit="100584" />" onchange="f_actualizar_agente_sel(this.value)"/>
                                        
                                        <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                        
                                        <input type="text" class="campo campotexto" value="${__formdata.TAGENTE_SEL}" name="TAGENTE_SEL" id="TAGENTE_SEL" title="<axis:alt f="axisctr019" c="TAGENTE_SEL" lit="100584"/>" size="15" style="width:70%" readonly="true"
                                        title="<axis:alt f="axissin017" c="TAGENTE_SEL" lit="100584"/>"/>
                                    </td>
                                </axis:ocultar>      
                              </tr>
                            <!-- Riesgo -->
                            <tr>
                            <c:if test="${!empty __formdata.NSINIES && __formdata.NSINIES > 0}">
                                <!-- Siniestro -->
                                <td class="titulocaja">
                                <axis:visible f="axissin017" c="NSINIES">
                                    <b id="label_NSINIES"><axis:alt c="NSINIES" f="axissin017" lit="101298" /></b>
                                </axis:visible>
                                </td>
                            </c:if>

                                <!-- F. Ocurrencia -->
                                <td class="titulocaja">
                                <axis:visible f="axissin017" c="FSINIES">
                                    <b><axis:alt c="FSINIES" f="axissin017" lit="1000510" /></b>
                                    </axis:visible><axis:visible f="axissin017" c="HSINIES"><b>/<axis:alt c="HSINIES" f="axissin017" lit="1000242" /></b>
                                </axis:visible>
                                </td>
                                <!-- Hora Ocurrencia -->
                                 <!--td class="titulocaja">
                                    
                                </td-->

                                <!-- Data recepció -->
                                 <td class="titulocaja">
                                 <axis:visible f="axissin017" c="FNOTIFI">
                                    <b id="label_FNOTIFI"><axis:alt c="FNOTIFI" f="axissin017" lit="102913" /></b>
                                 </axis:visible>
                                </td>
                                <axis:ocultar c="CRECLAMA" f="axissin017" dejarHueco="false">

                                <!-- Reclamación -->
                                <td class="titulocaja">
                                    <b><axis:alt c="CRECLAMA" f="axissin017" lit="9000974" /></b>
                                </td>   
                                </axis:ocultar>

                            </tr>
                            <tr>
                            <c:if test="${!empty __formdata.NSINIES && __formdata.NSINIES > 0}">
                                <!-- Siniestro -->
                                <td class="campocaja">
                                <axis:visible f="axissin017" c="NSINIES">
                                    <input type="text" class="campowidthinput campo campotexto" style="width:65%"   id="NSINIESTRO" name="NSINIESTRO" size="15"   
                                     <axis:atr f="axissin017" c="NSINIESTRO" a="modificable=true&obligatorio=true"/>  value="${__formdata.NSINIES}" title="<axis:alt c="NSINIES" f="axissin017" lit="101298" />" alt="<axis:alt c="NSINIES" f="axissin017" lit="101298" />" /> 
                                 </axis:visible>
                                </td>
                            </c:if>

                                 <!-- F. Ocurrencia -->
                                <td class="campocaja"  >
                                <axis:visible f="axissin017" c="FSINIES">
                                    <input   type="text"  class="campowidthinput campo campotexto" id="FSINIES"  name="FSINIES"  style="width:40%" alt="<axis:alt c="FSINIES" f="axissin017" lit="1000510"/>" title="<axis:alt c="FSINIES" f="axissin017" lit="1000510" />"
                                    <axis:atr f="axissin017" c="FSINIES" a="modificable=true&formato=fecha&obligatorio=true"/> value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FSINIES}"/>"/>                                    
                                    <a style="vertical-align:middle;" id="icon_FSINIES"><img id="popup_calendario_FSINIES" src="images/calendar.gif"/></a>&nbsp;&nbsp;                                
                                </axis:visible>
                                <axis:visible f="axissin017" c="HSINIES">    
                                    <input   type="text" class="campowidthinput campo campotexto" alt="<axis:alt c="HSINIES" f="axissin017" lit="9901534" />" title="<axis:alt c="HSINIES" f="axissin017" lit="9901534" />"
                                    <axis:atr f="axissin017" c="HSINIES" a="modificable=true"/>
                                    id="HSINIES" style="width:20%" name="HSINIES" size="15" value="${__formdata.HSINIES}"/>
                                </axis:visible>
                                </td>
                                <!-- Hora Ocurrencia -->
                                <!--td class="campocaja">
                                    
                                </td-->
                                
                                <!-- F. Recepcion -->
                                <td class="campocaja">
                                <axis:visible f="axissin017" c="FNOTIFI">
                                    <input   type="text"  class="campowidthinput campo campotexto" id="FNOTIFI"  name="FNOTIFI"  style="width:65%" alt="<axis:alt c="FNOTIFI" f="axissin017" lit="102913"/>" title="<axis:alt c="FNOTIFI" f="axissin017" lit="102913" />"
                                    <axis:atr f="axissin017" c="FNOTIFI" a="modificable=true&formato=fecha&obligatorio=true"/> value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FNOTIFI}"/>"/>                                    
                                    <a style="vertical-align:middle;" id="icon_FNOTIFI"><img id="popup_calendario_FNOTIFI"  src="images/calendar.gif"/></a>
                                </axis:visible>
                                </td>
                                <axis:ocultar c="CRECLAMA" f="axissin017" dejarHueco="false">

                                 <!-- Reclamación -->
                                <td class="campocaja">
                                    <select name = "CRECLAMA" id="CRECLAMA" style="width:130px" size="1"  class="campowidthselect campo campotexto" 
                                     alt="<axis:alt c="CRECLAMA" f="axissin017" lit="9000974" />" title="<axis:alt c="CRECLAMA" f="axissin017" lit="9000974" />" > 
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin017" lit="1000348"/> - </option>
                                                <c:forEach var="reclam" items="${__formdata.listValores.lstreclama}">
                                                    <option value = "${reclam.CATRIBU}"
                                                        <c:if test="${reclam.CATRIBU == __formdata.CRECLAMA}">selected</c:if>>
                                                        ${reclam.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                    </select>
                                    
                                    
                                </td>  
                                </axis:ocultar>
                              
                                
                            </tr>
                            <tr>
                                <axis:ocultar c="CCAUSIN" f="axissin017" dejarHueco="false">
                                <!-- Causas -->
                                 <td class="titulocaja">
                                    <b><axis:alt c="CCAUSIN" f="axissin017" lit="180580" /></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar c="CMOTSIN" f="axissin017" dejarHueco="false">
                                <!-- Motivo -->
                                <td class="titulocaja">
                                    <b><axis:alt c="CMOTSIN" f="axissin017" lit="109651" /></b>
                                </td>
                                </td>
                                </axis:ocultar>
                                 <axis:visible f="axissin017" c="FECHAPP">
                                  <td class="titulocaja">
                                        <b><axis:alt c="FECHAPP" f="axissin017" lit="9901534" /></b>
                                  </td>
                                  </axis:visible>
                                <!-- Deteccion -->
                                 <axis:ocultar f="axissin017" c="FDETECCION" dejarHueco="false">
												<%-- INI AMANTIUM - 25/02/2022 - RC D_O --%>
                                                <%-- <td class="titulocaja" colspan="2" style="display:none"> --%>
												<td class="titulocaja" colspan="2" >                                                
                                                    <%-- <b><axis:alt f="axissin032" c="FDETECCION" lit="9908703" /></b> --%>
													<b><axis:alt f="axissin017" c="FDETECCION" lit="9908703" /></b>
                                                <%-- FIN AMANTIUM - 25/02/2022 - RC D_O --%>
                                                </td>
                                 </axis:ocultar>  
                                <axis:ocultar c="CCULPAB" f="axissin017" dejarHueco="false">
                                <!-- Responsabilidad -->
                                <td class="titulocaja">
                                    <b><axis:alt c="CCULPAB" f="axissin017" lit="1000511" /></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar c="CEVENTO" f="axissin017" dejarHueco="false">
                                <!-- Evento -->
                                <td class="titulocaja" ><!-- colspan="2" -->
                                    <b><axis:alt c="CEVENTO" f="axissin017" lit="9000973" /></b>
                                </td>
                                </axis:ocultar>

                                
                            </tr>
                            <tr>
                                <!-- Causas -->
                                <axis:ocultar c="CCAUSIN" f="axissin017" dejarHueco="false">
                                <td class="campocaja">
                                    <select name = "CCAUSIN" id="CCAUSIN" style="width:200px;"  size="1" onchange="f_cambia_causa(this)" class="campowidthselect campo campotexto" 
                                    <axis:atr f="axissin017" c="CCAUSIN" a="modificable=true&obligatorio=true&isInputText=false"/>
                                    title="<axis:alt c="CCAUSIN" f="axissin017" lit="180580" />" alt="<axis:alt c="CCAUSIN" f="axissin017" lit="180580" />" >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin017" lit="1000348"/> - </option>
                                                <c:forEach var="causa" items="${__formdata.listValores.lstcausas}">
                                                    <option value = "${causa.CCAUSIN}"
                                                        <c:if test="${causa.CCAUSIN == __formdata.CCAUSIN}">selected</c:if>>
                                                        ${causa.TCAUSIN}
                                                    </option>
                                                </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                <!-- Motivo -->
                                <axis:ocultar c="CMOTSIN" f="axissin017" dejarHueco="false">
                                <td class="campocaja">
                                    <select name = "CMOTSIN" id="CMOTSIN" style="width:200px;"  size="1" onchange="" class="campowidthselect campo campotexto" 
                                    <axis:atr f="axissin017" c="CMOTSIN" a="modificable=true&obligatorio=true&isInputText=false"/>
                                    title="<axis:alt c="CMOTSIN" f="axissin017" lit="109651" />" alt="<axis:alt c="CMOTSIN" f="axissin017" lit="109651" />" >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin017" lit="1000348"/> - </option>
                                                <c:forEach var="motivo" items="${__formdata.lstmotivos}">
                                                    <option value = "${motivo.CMOTSIN}"
                                                        <c:if test="${motivo.CMOTSIN == __formdata.CMOTSIN}">selected</c:if>>
                                                        ${motivo.TMOTSIN}
                                                    </option>
                                                </c:forEach>
                                    </select>
                                    
                                </td>
                                </axis:ocultar>
                                <axis:visible f="axissin017" c="FECHAPP">
                                <td class="campocaja">  
                                     <input style="width:40%;" type="text" class="campowidthinput campo campotexto" id="FECHAPP" name="FECHAPP" size="15"  title="<axis:alt c="FECHAPP" f="axissin017" lit='9001159' />" 
                                                        value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata['FECHAPP']}"/>" <axis:atr f="axissin017" c="FECHAPP" a="modificable=true&formato=fecha"/> 
                                                     <%--   onchange="f_calcula_dias()"   --%>/>
                                                        <a style="vertical-align:middle;" id="icon_FECHAPP"><img id="popup_calendario_FECHAPP" src="images/calendar.gif"/></a>&nbsp;&nbsp; 
                                                        
                                </td>
                                </axis:visible>                        
                         
                          
                                
                                 <!-- Fecha deteccion -->
                                     <!-- Fecha deteccion -->
                               <axis:ocultar f="axissin017" c="FDETECCION" dejarHueco="false">
											<%-- INI AMANTIUM - 25/02/2022 - RC D_O --%>
                                            <%-- <td class="campocaja" colspan="2" style="display:none"> --%>
											<td class="campocaja" colspan="2" >
                                            
                                            <%-- <input tabindex="13" type="text" class="campowidthinput campo" id="FDETECCION" title="<axis:alt f='axissin032' c='FDETECCION' lit='700362' />" name="FDETECCION" size="15"  --%>                                                
                                            <%--        value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata['FDETECCION']}"/>" <axis:atr f="axissin032" c="FSINIES" a="modificable=true&formato=fecha"/> style="width:30%"/><a style="vertical-align:middle;"><img --%>
                                            <%--        id="popup_calendario_deteccion" alt="<axis:alt f="axissin032" c="SELECCIONAR" lit="108341"/>" title="<axis:alt f="axissin032" c="FDETECCION" lit="9908703" />" src="images/calendar.gif"/></a> --%>

                                             <input tabindex="13" type="text" class="campowidthinput campo campotexto" id="FDETECCION" title="<axis:alt f='axissin017' c='FDETECCION' lit='700362' />" name="FDETECCION" size="15"                                                  
                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata['FDETECCION']}"/>" <axis:atr f="axissin017" c="FDETECCION" a="modificable=true&formato=fecha"/> style="width:30%"/><a style="vertical-align:middle;"><img 
                                                    id="popup_calendario_deteccion" alt="<axis:alt f="axissin017" c="SELECCIONAR" lit="108341"/>" title="<axis:alt f="axissin017" c="FDETECCION" lit="9908703" />" src="images/calendar.gif"/></a>
                                                    
                                            <%-- FIN AMANTIUM - 25/02/2022 - RC D_O --%>        
                                                    
                                            </td>
                               </axis:ocultar>
                                <axis:ocultar c="CCULPAB" f="axissin017" dejarHueco="false">
                                <!-- Responsabilidad -->
                                <td class="campocaja">
                                    <select name = "CCULPAB" id="CCULPAB" style="width:200px;"  size="1" onchange="" class="campowidthselect campo campotexto" 
                                    title="<axis:alt c="CCULPAB" f="axissin017" lit="1000511" />" alt="<axis:alt c="CCULPAB" f="axissin017" lit="1000511" />" >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin017" lit="1000348"/> - </option>
                                                <c:forEach var="respon" items="${__formdata.listValores.lstresponsab}">
                                                    <option value = "${respon.CATRIBU}"
                                                        <c:if test="${respon.CATRIBU == __formdata.CCULPAB}">selected</c:if>>
                                                        ${respon.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                <!-- Evento -->
                                <axis:ocultar c="CEVENTO" f="axissin017" dejarHueco="false">
                                <td class="campocaja" > <!-- colspan="2" -->
                                <input type="text" class="campowidthinput campo campotexto"  value="${__formdata.CEVENTO}"        name="CEVENTO" id="CEVENTO" onchange="f_onchange_CEVENTO()" style="width:30%;" />&nbsp;
                                    <img id="findEvento"  border="0" src="images/find.gif" style="cursor:pointer" onclick="f_abrir_axissin035()"
                                    title="<axis:alt c="CEVENTO" f="axissin017" lit="9000973" />" alt="<axis:alt c="CEVENTO" f="axissin017" lit="9000973" />" /><%--${__formdata.CEVENTO}--%>
                                    &nbsp;<span id="TEVENTO_span"><b>${__formdata.TEVENTO}</b></span>
                                </td>    
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:visible f="axissin017" c="CFRAUDE">
                                  <td class="titulocaja">
                                        <b><axis:alt f="axissin017" c="CFRAUDE" lit="9902124" /></b>
                                        <axis:visible f="axissin017" c="ALTA_FRAUDE"> 
                                        <div>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="javascript:f_alta_defraudador();" ><img border="0" alt="<axis:alt f="axissin017" c="ALTA_DEFRAU" lit="9903632"/>" title="<axis:alt f="axissin017" c="ALTA_DEFRAU" lit="9903632"/>" src="images/new.gif"></a>
                                        </div>
                                        </axis:visible>
                                  </td>
                                </axis:visible>
                                <axis:visible f="axissin017" c="CCARPETA">
                                  <td class="titulocaja">
                                        <b><axis:alt f="axissin017" c="CCARPETA" lit="9902601" /></b>
                                  </td>
                                </axis:visible>
                                <!-- ini bug 0024675 -->
                                <axis:visible f="axissin017" c="CSALVAM">
                                  <td class="titulocaja">
                                        <b><axis:alt f="axissin017" c="CSALVAM" lit="9904530" /></b>
                                  </td>
                                </axis:visible>
                                <!-- fin bug 0024675 -->
                            </tr>
                            <tr>
                                <axis:visible f="axissin017" c="CFRAUDE">
                                <td class="campocaja">
                                  
                                  <select name = "CFRAUDE" id="CFRAUDE" style="width:150px;"  size="1" onchange="" class="campowidthselect campo campotexto" 
                                  title="<axis:alt f="axissin017" c="CFRAUDE" lit="9902124" />" alt="<axis:alt f="axissin017" c="CFRAUDE" lit="9902124" />" >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin017" lit="1000348"/> - </option>
                                                <c:forEach var="meddec" items="${lsfraudes}">
                                                    <option value = "${meddec.CATRIBU}"
                                                        <c:if test="${meddec.CATRIBU == __formdata.OB_IAX_SINIESTRO.CFRAUDE}">selected</c:if>>
                                                        ${meddec.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                    </select>
                                    <axis:visible f="axissin017" c="DET_FRAUDE"> 
                                        <div style="position:absolute">
                                        <a href="javascript:f_detalle_fraude();"><img border="0" alt="<axis:alt f="axissin017" c="DET_FRAUDE" lit="9903634"/>" title="<axis:alt f="axissin017" c="DET_FRAUDE" lit="9903634"/>" src="images/mas.gif"></a>
                                        </div>
                                    </axis:visible>
                                </td>
                                </axis:visible>
                                <axis:visible f="axissin017" c="CCARPETA">
                                <td class="campocaja">
                                    <input type="checkbox" id="CCARPETA" name="CCARPETA" value="${__formdata.OB_IAX_SINIESTRO.CCARPETA}" onclick="f_onclickCheckbox(this)"
                                    <c:if test="${__formdata.OB_IAX_SINIESTRO.CCARPETA == 1}">checked</c:if>
                                    <axis:atr f="axissin017" c="CCARPETA" a="modificable=true"/> />
                                </td>
                                </axis:visible>
                                <!-- ini bug 0024675 -->
                                <axis:visible f="axissin017" c="CSALVAM">
                                <td class="campocaja">
                                    <input type="checkbox" id="CSALVAM" name="CSALVAM" value="${__formdata.OB_IAX_SINIESTRO.CSALVAM}" onclick="f_onclickCheckbox(this)"
                                    <c:if test="${__formdata.OB_IAX_SINIESTRO.CSALVAM == 1}">checked</c:if>
                                    <axis:atr f="axissin017" c="CSALVAM" a="modificable=true"/> />
                                </td>
                                </axis:visible>
                                <!-- fin bug 0024675 -->
                              
                            </tr>
                            <axis:visible c="CTIPDEC" f="axissin017">    
                            <tr>
                                          
                                          
                                            <td align="left" colspan="5">
                                           <b><axis:alt c="CTIPDEC" f="axissin017" lit="9901032" /></b>
                                    <table class="seccion" align="center">
                                        <tr>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                        </tr>
                                       
                                            
                                            <tr>
                                <axis:ocultar c="CMEDDEC" f="axissin017" dejarHueco="false">                           
                                <!-- Medio Declaración -->
                                 <td class="titulocaja">
                                    <b><axis:alt c="CMEDDEC" f="axissin017" lit="9000975" /></b>
                                </td>
                                </axis:ocultar>
                                
                                <!-- Tipo Declarante -->
                                <axis:ocultar c="CTIPDEC" f="axissin017" dejarHueco="false"> 
                                <td class="titulocaja">
                                    <b><axis:alt c="TIPO_DECLARANTE" f="axissin017" lit="9001163" /></b>
                                </td>
                                </axis:ocultar>
                                
                            </tr>
                            <tr>
                                    
                                <!-- Medio Declaración -->
                                <axis:ocultar c="CMEDDEC" f="axissin017" dejarHueco="false">
                                <td class="campocaja">
                                    <select name = "CMEDDEC" id="CMEDDEC" style="width:200px;"  size="1" onchange="" class="campowidthselect campo campotexto" 
                                    title="<axis:alt c="CMEDDEC" f="axissin017" lit="9000975" />" alt="<axis:alt c="CMEDDEC" f="axissin017" lit="9000975" />" >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin017" lit="1000348"/> - </option>
                                                <c:forEach var="meddec" items="${__formdata.listValores.lstmediodec}">
                                                    <option value = "${meddec.CATRIBU}"
                                                        <c:if test="${meddec.CATRIBU == __formdata.CMEDDEC}">selected</c:if>>
                                                        ${meddec.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                <!-- Tipo Declarante -->
                                <axis:ocultar c="CTIPDEC" f="axissin017" dejarHueco="false">
                                <td class="campocaja">
                                    <select name = "CTIPDEC" id="CTIPDEC" style="width:200px;"  size="1" onchange="f_cargar_declarante()" class="campowidthselect campo campotexto" 
                                    title="<axis:alt c="TIPO_DECLARANTE" f="axissin017" lit="9001163" />" alt="<axis:alt c="TIPO_DECLARANTE" f="axissin017" lit="9001163" />" >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin017" lit="1000348"/> - </option>
                                                <c:forEach var="tipdec" items="${__formdata.listValores.lsttipodec}">
                                                    <option value = "${tipdec.CATRIBU}"
                                                        <c:if test="${tipdec.CATRIBU == __formdata.CTIPDEC}">selected</c:if>>
                                                        ${tipdec.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                    </select>
                                </td>   
                                </axis:ocultar>
                                
                            </tr>
                            
                            
                             <c:if test="${__formdata.CTIPDEC == 0}">
                                 <tr>
                                    <td class="titulocaja" colspan="2"> 
                                    <b><axis:alt c="PRENADORS" f="axissin017" lit="1000181"/></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="campocaja" colspan="2">
                                     <select name = "DEC_SPERSON" id="DEC_SPERSON" style="width:100%;"  size="1" onchange="" class="campowidthselect campo campotexto" 
                                     title="<axis:alt c="PRENADORS" f="axissin017" lit="1000181"/>" alt="<axis:alt c="PRENADORS" f="axissin017" lit="1000181"/>" >
                                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin017" lit="1000348"/> - </option>
                                                        <c:forEach var="miListaId" items="${__formdata.T_IAX_TOMADORES}">
                                                            <option value = "${miListaId.OB_IAX_TOMADORES.SPERSON}"
                                                                <c:if test="${miListaId.OB_IAX_TOMADORES.SPERSON == __formdata.DEC_SPERSON}">selected</c:if>>
                                                                ${miListaId.OB_IAX_TOMADORES.NNUMIDE} - ${miListaId.OB_IAX_TOMADORES.TNOMBRE} ${miListaId.OB_IAX_TOMADORES.TAPELLI1} ${miListaId.OB_IAX_TOMADORES.TAPELLI2}
                                                            </option>
                                                        </c:forEach>
                                            </select>
                                            </td>
                                </tr>
                             </c:if>

                             <c:if test="${__formdata.CTIPDEC == 2 || __formdata.CTIPDEC == 1}">
                            
                             <tr>
                                    <td class="titulocaja" colspan="2"> 
                                    <c:choose>
                                        <c:when test="${__formdata.CTIPDEC == 2}">
                                             <b><axis:alt c="CTIPDEC_2" f="axissin017" lit="9001271"/></b>
                                        </c:when>
                                        <c:when test="${__formdata.CTIPDEC == 1}">
                                             <b><axis:alt c="CTIPDEC_1" f="axissin017" lit="108228"/></b>
                                        </c:when>
                                    </c:choose>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td class="campocaja" colspan="2">
                                     <select name = "DEC_SPERSON" id="DEC_SPERSON" style="width:100%;"  size="1" onchange="" class="campowidthselect campo campotexto"
                                     title="<axis:alt c="CTIPDEC_2" f="axissin017" lit="9001271"/>" alt="<axis:alt c="CTIPDEC_2" f="axissin017" lit="9001271"/>" >
                                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin017" lit="1000348"/> - </option>
                                                        <c:forEach var="miListaId" items="${__formdata.T_IAX_ASEGURADOS}">
                                                            <option value = "${miListaId.OB_IAX_ASEGURADOS.SPERSON}"
                                                                <c:if test="${miListaId.OB_IAX_ASEGURADOS.SPERSON == __formdata.DEC_SPERSON}">selected</c:if>>
                                                                ${miListaId.OB_IAX_ASEGURADOS.NNUMIDE} - ${miListaId.OB_IAX_ASEGURADOS.TNOMBRE} ${miListaId.OB_IAX_ASEGURADOS.TAPELLI1} ${miListaId.OB_IAX_ASEGURADOS.TAPELLI2}
                                                            </option>
                                                        </c:forEach>
                                            </select>
                                            </td>
                                </tr>
                              </c:if>  
                             <c:if test="${__formdata.CTIPDEC == 3}">
                             <tr>
                                    <td class="titulocaja" colspan="2"> 
                                             <b><axis:alt c="CTIPDEC_3" f="axissin017" lit="9001186"/></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="campocaja" colspan="2">
                                     <select name = "DEC_SPERSON" id="DEC_SPERSON" style="width:100%;"  size="1" onchange="" class="campowidthselect campo campotexto" 
                                     title="<axis:alt c="CTIPDEC_1" f="axissin017" lit="108228"/>" alt="<axis:alt c="CTIPDEC_1" f="axissin017" lit="108228"/>" >
                                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin017" lit="1000348"/> - </option>
                                                        <c:forEach var="miListaId" items="${__formdata.T_IAX_CONDUCTORES}">
                                                            <option value = "${miListaId.OB_IAX_ASEGURADOS.SPERSON}"
                                                                <c:if test="${miListaId.OB_IAX_ASEGURADOS.SPERSON == __formdata.DEC_SPERSON}">selected</c:if>>
                                                                ${miListaId.OB_IAX_ASEGURADOS.NNUMIDE} - ${miListaId.OB_IAX_ASEGURADOS.TNOMBRE} ${miListaId.OB_IAX_ASEGURADOS.TAPELLI1} ${miListaId.OB_IAX_ASEGURADOS.TAPELLI2}
                                                            </option>
                                                        </c:forEach>
                                            </select>
                                            </td>
                                </tr>
                             </c:if>  
                            <c:if test="${__formdata.CTIPDEC >= 4}">
                            <axis:ocultar c="TDECLARANTE" f="axissin017" dejarHueco="false">
                            
                            <tr>
                            <td class="titulocaja">
                            <input type="hidden" id="DEC_SPERSON" name="DEC_SPERSON" value="${__formdata.DEC_SPERSON}">
                                  <b><axis:alt c="DEC_SPERSON" f="axissin017" lit="102844"/></b>
                                </td>
                            <!-- NNUMIDE -->
                                <td class="titulocaja">
                                <axis:visible f="axissin017" c="NNUMIDE">
                                    <b><axis:alt c="NNUMIDE" f="axissin017" lit="102999" /></b>
                                </axis:visible>
                                </td>  
                                </tr>
                                <tr>
                                
                                   <td class="campocaja">
                                 <select name="CTIPIDE" id="CTIPIDE" onchange=""  size="1" title="<axis:alt c="CTIPIDE" f="axissin017" lit="109774"/>" class="campowidthselect campo campotexto"  style="width:100%;"
                                    <axis:atr f="axisper010" c="CTIPIDE" a="isInputText=false&modificable=true"/>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin017" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipDocum}">
                                            <option value = "${element.CATRIBU}" 
                                                <c:if test="${element.CATRIBU == __formdata.CTIPIDE}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                    </td>
                             <td class="campocaja">
                                <axis:visible f="axissin017" c="NNUMIDE">
                                    <input   type="text" class="campowidthinput campo campotexto" onchange="f_existe_persona(this.value)" 
                                    id="NNUMIDE" name="NNUMIDE" size="15"  value="${__formdata.NNUMIDE}"/>
                                </axis:visible>
                                </td>  
                                
                                <td class="campocaja">
                                <img border="0" src="images/find.gif" title="<axis:alt c="find" f="axissin017" lit="1000065"/>" alt="<axis:alt c="find" f="axissin017" lit="1000065"/>" onclick="f_abrir_axisper021()" style="cursor:pointer"/>
                                &nbsp;&nbsp;
                                <c:if test="${empty __formdata.NSINIES}">
                                <img border="0" src="images/update.gif" title="<axis:alt c="update" f="axissin017" lit="9901042"/>" alt="<axis:alt c="update" f="axissin017" lit="9901042"/>" onclick="f_actualizar_campos(1)" style="cursor:pointer"/>
                                &nbsp;&nbsp;
                              	</c:if>
                              	<!-- INI IAXIS-4887 -->
                              	<axis:visible f="axissin017" c="BT_NUEVA_PER">
	                                <img border="0" src="images/new.gif" title="<axis:alt c="new" f="axissin017" lit="1000436"/>" alt="<axis:alt c="new" f="axissin017" lit="1000436"/>" onclick="f_alta_persona()" style="cursor:pointer"/>
	                                &nbsp;&nbsp;
                                </axis:visible>
                                <!-- FIN IAXIS-4887 -->
                                <img border="0" id="INFO_PERSONA" title="<axis:alt c="INFO_PERSONA" f="axissin017" lit="9000968"/>" alt="<axis:alt c="INFO_PERSONA" f="axissin017" lit="9000968"/>" name="INFO_PERSONA" src="images/informacion.gif" onclick="f_consulta_persona()" style="cursor:pointer"/>
                                &nbsp;&nbsp;
                                
                                </td>
                                 
                                
                            </tr>
                            
                            
                            
                            <tr>
                                <!-- Nombre -->
                                 <axis:visible f="axissin017" c="TNOMDEC">
                                 <td class="titulocaja"> 
                                  
                                    <b><axis:alt c="TNOMDEC" f="axissin017" lit="105940" /></b>
                                  
                                </td>
                                </axis:visible>
                                 <!-- Nombre 1-->
                                 <td class="titulocaja"> 
                                  <axis:visible f="axissin017" c="TNOM1DEC">
                                    <b><axis:alt c="TNOM1DEC" f="axissin017" lit="105940" /></b>
                                  </axis:visible>
                                </td>
                                  <!-- Nombre2 -->
                                   <td class="titulocaja"> 
                                  <axis:visible f="axissin017" c="TNOM2DEC">
                                    <b><axis:alt c="TNOM2DEC" f="axissin017" lit="9902260" /></b>
                                  </axis:visible>
                                </td>
                                
                                <!-- 1r Apellido -->
                                <td class="titulocaja">
                                <axis:visible f="axissin017" c="TAPE1DEC">
                                    <b><axis:alt c="TAPE1DEC" f="axissin017" lit="108243" /></b>
                                </axis:visible>
                                </td>
                                <!-- 2n Apellido -->
                                <td class="titulocaja">
                                <axis:visible f="axissin017" c="TAPE2DEC">
                                    <b><axis:alt c="TAPE2DEC" f="axissin017" lit="108246" /></b>
                                </axis:visible>
                                </td>
                                 <!-- Telefono -->
                                <td class="titulocaja">
                                <axis:visible f="axissin017" c="TTELDEC">
                                    <b><axis:alt c="TTELDEC" f="axissin017" lit="9000992" /></b>
                                </axis:visible>
                               
                                </td> 
                               </tr>
                  
                            <tr>
                                <!-- Nombre -->
                                 <axis:visible f="axissin017" c="TNOMDEC">
                                <td class="campocaja">
                               
                                    <input   type="text" class="campowidthinput campo campotexto" id="TNOMDEC" name="TNOMDEC"
                                     <axis:atr f="axissin017" c="TNOMDEC" a="obligatorio=false"/>
                                    size="10"  value="${__formdata.TNOMDEC}"
                                    title="<axis:alt c="TNOMDEC" f="axissin017" lit="105940" />" alt="<axis:alt c="TNOMDEC" f="axissin017" lit="105940" />" />
                                
                                </td>
                                </axis:visible>
                                 <!-- Nombre1 -->
                                <td class="campocaja">
                                <axis:visible f="axissin017" c="TNOM1DEC">
                                    <input   type="text" class="campowidthinput campo campotexto" id="TNOM1DEC" name="TNOM1DEC"
                                     <axis:atr f="axissin017" c="TNOM1DEC" a="obligatorio=false"/>
                                    size="10"  value="${__formdata.TNOM1DEC}"
                                    title="<axis:alt c="TNOM1DEC" f="axissin017" lit="105940" />" alt="<axis:alt c="TNOM1DEC" f="axissin017" lit="105940" />" />
                                </axis:visible>
                                </td>
                                 <!-- Nombre2 -->
                                <td class="campocaja">
                                <axis:visible f="axissin017" c="TNOM2DEC">
                                    <input   type="text" class="campowidthinput campo campotexto" id="TNOM2DEC" name="TNOM2DEC" 
                                     <axis:atr f="axissin017" c="TNOM2DEC" a="obligatorio=false"/>
                                    size="10"  value="${__formdata.TNOM2DEC}"
                                    title="<axis:alt c="TNOM2DEC" f="axissin017" lit="9902260" />" alt="<axis:alt c="TNOM2DEC" f="axissin017" lit="9902260" />" />
                                </axis:visible>
                                </td>
                                <!-- 1r Apellido -->
                                <td class="campocaja">
                                <axis:visible f="axissin017" c="TAPE1DEC">
                                    <input   type="text" class="campowidthinput campo campotexto" id="TAPE1DEC" name="TAPE1DEC" 
                                    <axis:atr f="axissin017" c="TAPE1DEC" a="obligatorio=false"/>
                                    size="10"  value="${__formdata.TAPE1DEC}"
                                    title="<axis:alt c="TAPE1DEC" f="axissin017" lit="108243" />" alt="<axis:alt c="TAPE1DEC" f="axissin017" lit="108243" />" />
                                </axis:visible>
                                </td>
                                <!-- 2n Apellido -->
                                <td class="campocaja">
                                <axis:visible f="axissin017" c="TAPE2DEC">
                                    <input   type="text" class="campowidthinput campo campotexto" id="TAPE2DEC" name="TAPE2DEC" 
                                    <axis:atr f="axissin017" c="TAPE2DEC" a="obligatorio=false"/>
                                    size="10"  value="${__formdata.TAPE2DEC}"
                                    title="<axis:alt c="TAPE2DEC" f="axissin017" lit="108246" />" alt="<axis:alt c="TAPE2DEC" f="axissin017" lit="108246" />" />
                                </axis:visible>
                                </td> 
                                <!-- Telefono -->
                                <td class="campocaja">
                                <axis:visible f="axissin017" c="TTELDEC">
                                    <input   type="text" class="campowidthinput campo campotexto" id="TTELDEC" name="TTELDEC" 
                                    <axis:atr f="axissin017" c="TTELDEC" a="obligatorio=false"/>
                                    size="8"  value="${__formdata.TTELDEC}"
                                    title="<axis:alt c="TTELDEC" f="axissin017" lit="9000992" />" alt="<axis:alt c="TTELDEC" f="axissin017" lit="9000992" />" />
                                </axis:visible>
                                </td>   
                                </tr>
                                <tr>
                                   <!-- Telefono MOV-->
                                <td class="titulocaja">
                                <axis:visible f="axissin017" c="TMOVILDEC">
                                    <b><axis:alt c="TMOVILDEC" f="axissin017" lit="9903007" /></b>
                                </axis:visible>
                                </td>   
                                     <!-- EMAIL -->
                                <td class="titulocaja">
                                <axis:visible f="axissin017" c="TEMAILDEC">
                                    <b><axis:alt c="TEMAILDEC" f="axissin017" lit="109792" /></b>
                                </axis:visible>
                                </td>        
                            </tr>
                            <tr>
                                <!-- Telefono MOV-->
                                <td class="campocaja">
                                <axis:visible f="axissin017" c="TMOVILDEC">
                                    <input   type="text" class="campowidthinput campo campotexto" id="TMOVILDEC" name="TMOVILDEC" 
                                      <axis:atr f="axissin017" c="TMOVILDEC" a="obligatorio=false"/>
                                    size="8"  value="${__formdata.TMOVILDEC}"
                                    title="<axis:alt c="TMOVILDEC" f="axissin017" lit="9903007" />" alt="<axis:alt c="TMOVILDEC" f="axissin017" lit="9903007" />" />
                                </axis:visible>
                                </td> 
                                     <!-- EMAIL -->
                                <td class="campocaja">
                                <axis:visible f="axissin017" c="TEMAILDEC">
                                    <input   type="text" class="campowidthinput campo campotexto" id="TEMAILDEC" name="TEMAILDEC" 
                                      <axis:atr f="axissin017" c="TEMAILDEC" a="obligatorio=false"/>
                                    size="15"  value="${__formdata.TEMAILDEC}"
                                    title="<axis:alt c="TEMAILDEC" f="axissin017" lit="109792" />" alt="<axis:alt c="TEMAILDEC" f="axissin017" lit="109792" />" />
                                </axis:visible>
                                </td>    
                            </tr>       
                            
                            </axis:ocultar>
                            
                            </c:if>
                            
                            </tr>
                        </table>
                        </td>
                        </tr>                        
                        </axis:visible>   	   
                        <tr>
                              <!-- Sinistre Ref.externa-->
                                <axis:visible f="axissin017" c="NSINCIA">
                                    <td class="titulocaja">                             
                                        <b><axis:alt f="axissin017" c="NSINCIA" lit="9901399"></axis:alt></b>                               
                                    </td>
                                </axis:visible>
                                <!-- Sinistre Compania-->
                                <axis:visible f="axissin017" c="CCOMPANI"> 
                                    <td class="titulocaja">                                
                                        <b><axis:alt f="axissin017" c="CCOMPANI" lit="9000600"></axis:alt></b>                               
                                    </td>
                                </axis:visible>
                                   <!-- Presinistre -->
                                <axis:visible f="axissin017" c="NPRESIN">
                                    <td class="titulocaja">                                
                                        <b><axis:alt f="axissin017" c="NPRESIN" lit="9901400"></axis:alt></b>                               
                                    </td>
                                </axis:visible>
                            </tr>  
                            <tr>
                                <!--Ref externa Sinistre compania -->
                                
                                    <td class="campocaja" colspan="1" style="display:none">                                        
                                        <input type="text"
                                           class="campowidthinput campo campotexto"
                                           value="${__formdata['NSINCIA']}"
                                           name="NSINCIA" id="NSINCIA" size="15"
                                           <axis:atr f="axissin017" c="NSINCIA" a="modificable=true"/>
                                           title='<axis:alt c="NSINCA" f="axissin017" lit="9901399"/>'/>
                                    </td> 
                                
                                <!-- Sinistre Compania-->
                                <axis:visible f="axissin017" c="CCOMPANI">
                                    <td class="campocaja" colspan="1">                                   
                                        <select  name = "CCOMPANI" id ="CCOMPANI" size="1"  class="campowidthselect campo campotexto"
                                        title="<axis:alt f="axissin017" c="CCOMPANI" lit="9000600"/>" alt="<axis:alt f="axissin017" c="CCOMPANI" lit="9000600"/>" >
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt c="CCOMPANII" f="axissin017" lit="108341"/> - </option>
                                            <c:forEach items="${__formdata.listValores.CIAS}" var="cia">
                                                <option value = "${cia.CCOMPANI}" <c:if test="${__formdata.OB_IAX_SINIESTRO.CCOMPANI == cia.CCOMPANI}">selected</c:if>>${cia.TCOMPANI}</option>
                                            </c:forEach>                                                    
                                        </select>                                
                                    </td> 
                                </axis:visible>                                                                
                                  <!-- Presinistre -->                                
                                <axis:visible f="axissin017" c="NPRESIN">
                                    <td class="campocaja">
                                        <input   type="text" class="campowidthinput campo campotexto" id="NPRESIN" name="NPRESIN" size="15"  
                                        title="<axis:alt f="axissin017" c="NPRESIN" lit="9901400"/>" alt="<axis:alt f="axissin017" c="NPRESIN" lit="9901400"/>" value="${__formdata.OB_IAX_SINIESTRO.NPRESIN}"/>                                
                                    </td>    
                                </axis:visible>
                            </tr>
                            <tr>
                                <axis:visible f="axissin017" c="CPOLCIA">
                                  <td class="titulocaja">
                                        <b><axis:alt f="axissin017" c="CPOLCIA" lit="9001766" /></b>
                                  </td>
                                </axis:visible>
                                <axis:visible f="axissin017" c="IPERIT"> 
                                  <td class="titulocaja">
                                        <b><axis:alt f="axissin017" c="IPERIT" lit="9000904" /></b>
                                  </td>
                               </axis:visible>
                            </tr>
                            <tr>
                            
                                  <td class="campocaja" style="display:none">
                                         <input  tabindex="37" type="text" class="campowidthinput campo campotexto" id="CPOLCIA" name="CPOLCIA"
                                         <axis:atr f="axissin017" c="CPOLCIA" a="modificable=true"/>size="15"  value="${__formdata.OB_IAX_SINIESTRO.CPOLCIA}"
                                         title="<axis:alt f="axissin017" c="CPOLCIA" lit="9001766" />" alt="<axis:alt f="axissin017" c="CPOLCIA" lit="9001766" />" />
                                  </td>
                            
                            <axis:visible f="axissin017" c="IPERIT">
                                  <td class="campocaja">
                                        <input  tabindex="39" type="text" class="campowidthinput campo campotexto" id="IPERIT" name="IPERIT" 
                                        <axis:atr f="axissin017" c="IPERIT" a="modificable=true&formato=decimal"/> size="15"  value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.OB_IAX_SINIESTRO.IPERIT}"/>"
                                        title="<axis:alt f="axissin017" c="IPERIT" lit="9000904" />" alt="<axis:alt f="axissin017" c="IPERIT" lit="9000904" />" />
                                  </td>
                            </axis:visible>
                            </tr>
                            <!-- <tr>
                               <td class="titulocaja">
                                    <b><axis:alt c="titulocaja1" f="axissin017" lit="102500" /></b>
                                </td>
								
                            </tr> -->
                           
							<tr>
                                <td colspan="4" > <!--colspan="5" -->
                                <!-- Lista de Riesgos -->
                                <c:set var="title0"><axis:alt c="NRIESGO" f="axissin017" lit="100649" /></c:set><!--Num Riesgo-->
                                <c:set var="title1"><axis:alt c="TRIESGO" f="axissin017" lit="103417" /></c:set><!--Descricipción RIESGO -->
                                    <table>
                                    <tr>
                                    <td colspan="4"  class="campocaja"> <!--colspan="5" -->
                                    <!-- DisplayTag preguntas -->
                                    <!-- c : if test="${!empty sessionScope.axisctr_preguntasPoliza}"-->
                                    <axis:ocultar f="axissin017" c="DSP_RIESGO">
                                        <c:set var="title0">&nbsp;</c:set>
                                        <c:set var="title1"><axis:alt c="RIESGOS" f="axissin017" lit="102500"/></c:set>
                                        <div class="displayspace">                         
                                            <display:table name="${__formdata.T_IAX_RIESGOS}" id="miListaId2" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0"
                                             requestURI="modal_axissin017.do?paginar=true">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title0}" sortable="false" sortProperty="selectedRiesgo" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                        <c:if test="${__formdata.OB_IAX_SINIESTRO.NRIESGO== miListaId2.OB_IAX_RIESGOS.NRIESGO}">
                                                            <div class="dspIcons"><input checked disabled value="${miListaId2.OB_IAX_RIESGOS.NRIESGO}" type="radio" id="selectedRiesgo" name="selectedRiesgo"/></div>
                                                        </c:if>
                                                    </display:column>
                                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_RIESGOS.TRIESGO" headerClass="sortable"  media="html" autolink="false" >
                                                        <c:if test="${__formdata.OB_IAX_SINIESTRO.NRIESGO== miListaId2.OB_IAX_RIESGOS.NRIESGO}">
                                                            <div class="dspText">${miListaId2.OB_IAX_RIESGOS.TRIESGO}</div>
                                                        </c:if>
                                                    </display:column>
                                            </display:table>
                                 
                                        </div>
                                    <!--/c : if-->
                                    </axis:ocultar> 
                                </td>
                                    </tr>
                                    </table>
                                </td>
                            </tr>
							
							
							<tr>
                             <!-- Descripción del Riesgo -->
 
                                <td class="titulocaja">
                                <axis:ocultar c="TDESCRIE" f="axissin017" dejarHueco="false">
                                    <b><axis:alt c="TDESCRIE" f="axissin017" lit="102524" /></b>
                                </axis:ocultar>
                                </td>
                            </tr>
                            <tr>
                            <!-- Descripción del Riesgo -->
							<axis:ocultar c="TDESCRIE" f="axissin017" dejarHueco="false">
                                 <td colspan="4" style="width:100%;"  class="campocaja"> <!-- colspan="5" -->
                                 
                                     <textarea readonly="true" class="campowidthinput campo campotexto" style="width:100%;" <axis:atr f="axissin017" c="TDESCRIE" a="isInputText=false&modificable=true"/> onkeydown=" if(this.value.length>= 2000 && event.keyCode != 8 && event.keyCode != 46){return false;}" name="TDESCRIE" id="TDESCRIE">${miListaId2.OB_IAX_RIESGOS.TDESCRIE}</textarea>
                           
                                 </td>
							</axis:ocultar>
                              </tr>
							  
							
                            <axis:ocultar c="LOCALI" f="axissin017" dejarHueco="false">
                            <tr>
                            <td colspan="4"></td>
                            </tr>
                            <tr>
                                <!-- Zona Ocurrencia -->
                                
                                <td class="titulocaja">${__formdata.OB_IAX_SIN_MOVSINIESTRO}
                                    <b><axis:alt c="SINI" f="axissin017" lit="110492" /></b>
                                </td>
                            </tr>
                            <tr>
                                <!-- Lugar Ocurrencia -->
                                 
                                 <td colspan="4"> <!-- colspan="5" -->
                                 
                                 <input   type="hidden"  id="NLOCALI" name="NLOCALI" size="15"  value="${__formdata.LOCALIZA.NLOCALI}"/>
                                        <table class="area">
                                            <axis:ocultar c="TLOCALID" f="axissin017" dejarHueco="false">
                                            <tr>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                            </tr>
                                            <!-- Inicio Seccion -->
                                            <tr>
                                                <td class="titulocaja" colspan="2">
                                                <axis:ocultar c="TLOCALI" f="axissin017" dejarHueco="false">
                                                   <input value="0" type="radio"  id="radioLocaliza" name="radioLocaliza" onclick="f_verifica_textarea(this.value);" <c:if test="${!empty __formdata.TLOCALI}">checked</c:if>/><!-- LOCALIZA -->
                                                   <b><axis:alt c="TLOCALI" f="axissin017" lit="100588" /></b> 
                                                </axis:ocultar>
                                                </td>
                                                
                                                <td class="titulocaja" colspan="2">
                                                    <input value="1" type="radio" id="radioLocaliza" name="radioLocaliza" onclick="f_verifica_textarea(this.value);"  <c:if test="${empty __formdata.TLOCALI}">checked</c:if>/>
                                                    <b><axis:alt c="DIRECCION" f="axissin017" lit="9000914" /></b>&nbsp;
                                                    <img id="recargar_datos" alt="<axis:alt c="CARGA" f="axissin017" lit="9001481"/>&nbsp;<axis:alt c="DIRECCION" f="axissin017" lit="9000914"/>" style="vertical-align:middle;width:13px;height:13px;" title="<axis:alt c="CARGA" f="axissin017" lit="9001481" />&nbsp;<axis:alt c="DIRECCION" f="axissin017" lit="9000914"/>" onclick="javascript:cargar_direccion(${miListaId2.OB_IAX_RIESGOS.NRIESGO})" src="images/permalink.gif"/></a>
                                                </td>
                                                
                                            </tr>
                                            </axis:ocultar>
                                            <!-- SECCION DESCRIPCION DEL RIESGO -->
                                            <div id="div_dir_descripcion">
                                            <tr> 
                                            <td colspan="4">
                                            <tr>
                                               <td colspan="4" style="width:100%;" class="campocaja">
                                               <axis:ocultar c="TLOCALI" f="axissin017" dejarHueco="false">
                                                    <textarea class="campowidthinput campo campotexto" style="width:100%;" name="TLOCALI" id="TLOCALI">${__formdata.TLOCALI}</textarea>
                                               </axis:ocultar>
                                                </td>
                                            </tr>
                                            </td>
                                            </tr>
                                            </div>
                                            
                                            
                                            <!-- SECCION DESCRIPCION DEL RIESGO -->
                                            <div id="div_dir_descripcion">
                                            <tr>
                                            <td colspan="4">
                                            <axis:ocultar c="TDIRECCIONS" f="axissin017" dejarHueco="false">
                                            <table id="direccions">
                                            <tr>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                            </tr>
                                            <tr>
                                                <!-- Tipo via -->
                                                <td class="titulocaja">
                                                    <b><axis:alt c="CSIGLAS" f="axissin017" lit="110028" /></b>
                                                </td>
                                                
                                                <!-- Nombre -->
                                                <td class="titulocaja">
                                                    <b><axis:alt c="TNOMVIA" f="axissin017" lit="110029" /></b>
                                                </td>

                                                <!-- Número -->
                                                <td class="titulocaja">
                                                    <b><axis:alt c="TNUMVIA" f="axissin017" lit="800440" /></b>
                                                </td>
                                                <!--  Otros -->
                                                <td class="titulocaja">
                                                    <b><axis:alt c="TCOMPLE" f="axissin017" lit="110031" /></b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <!-- Tipo via -->
                                                <td class="campocaja">
                                                    <select name="CSIGLAS" id="CSIGLAS" size="1" class="campowidthselect campo campotexto" style="width:80%;">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin017" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.listValores.lstTipoVia}">
                                                            <option value = "${element.CSIGLAS}" 
                                                            <c:if test="${element.CSIGLAS == __formdata.LOCALIZA.CSIGLAS}"> selected </c:if> />
                                                                ${element.TDENOM} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                                
                                                 <!-- Nombre -->
                                                <td class="campocaja">
                                                    <input   type="text" class="campowidthinput campo campotexto" id="TNOMVIA" name="TNOMVIA" size="15" 
                                                    title="<axis:alt c="TNOMVIA" f="axissin017" lit="110029" />" alt="<axis:alt c="TNOMVIA" f="axissin017" lit="110029" />" value="${__formdata.LOCALIZA.TNOMVIA}"/>
                                                </td>

                                                <!-- Número -->
                                                <td class="campocaja">
                                                    <input   type="text" class="campowidthinput campo campotexto" id="NNUMVIA" name="NNUMVIA" size="15" 
                                                    title="<axis:alt c="TNUMVIA" f="axissin017" lit="800440" />" alt="<axis:alt c="TNUMVIA" f="axissin017" lit="800440" />" value="${__formdata.LOCALIZA.NNUMVIA}"/>
                                                </td>
                                                <!-- Otros -->
                                                <td class="campocaja" colspan="2">
                                                    <input    type="text" class="campowidthinput campo campotexto"  id="TCOMPLE" name="TCOMPLE" 
                                                    value="${__formdata.LOCALIZA.TCOMPLE}" title="<axis:alt c="TCOMPLE" f="axissin017" lit="110031" />" alt="<axis:alt c="TCOMPLE" f="axissin017" lit="110031" />" />
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <!-- C.P -->
                                                <td class="titulocaja">
                                                    <b><axis:alt c="CPOSTAL" f="axissin017" lit="101081" /></b>
                                                </td>
                                                
                                                <!-- Pais -->
                                                <td class="titulocaja">
                                                    <b><axis:alt c="CPAIS" f="axissin017" lit="100816" /></b>
                                                </td>
                                                <!-- Provincia -->
                                                <td class="titulocaja">
                                                    <b><axis:alt c="CPROVIN" f="axissin017" lit="100756" /></b>
                                                </td>

                                                <!--  Población -->
                                                <td class="titulocaja">
                                                    <b><axis:alt c="CPOBLAC" f="axissin017" lit="100817" /></b>
                                                </td>
                                            </tr>
                                            <tr>
                                                 <!-- C.P -->
                                               <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.LOCALIZA.CPOSTAL}" name="CPOSTAL" id="CPOSTAL" 
                                                    style="text-transform:uppercase;width:60%;" onblur="f_onblur_CPOSTAL(this.value)" title="<axis:alt c="CPOSTAL" f="axissin017" lit="101081" />" alt="<axis:alt c="CPOSTAL" f="axissin017" lit="101081" />" />
													&nbsp;
													<axis:ocultar c="CPOSTALFIND" f="axissin017" dejarHueco="false">
														<img id="findCpostal" border="0" src="images/find.gif" onclick="f_abrir_axisper042();" style="cursor:pointer" alt=""/>
													</axis:ocultar>
                                                </td>                                
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" size="3" maxlength="3" value="${__formdata.LOCALIZA.CPAIS}" 
                                                    title="<axis:alt c="CPAIS" f="axissin017" lit="100816" />" alt="<axis:alt c="CPAIS" f="axissin017" lit="100816" />" name="CPAIS" id="CPAIS" onchange="f_onchange_CPAIS()" style="width:18%;" />&nbsp;<img id="findPais" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS', null)" style="cursor:pointer"/>
                                                    &nbsp;<span id="TPAIS_span"><b>${__formdata.LOCALIZA.TPAIS}</b></span>
                                                </td>
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" maxlength="3" value="${__formdata.LOCALIZA.CPROVIN}" 
                                                    title="<axis:alt c="CPROVIN" f="axissin017" lit="100756" />" alt="<axis:alt c="CPROVIN" f="axissin017" lit="100756" />" name="CPROVIN" id="CPROVIN" onchange="f_onchange_CPROVIN()" style="width:18%;"  />
                                                    &nbsp;<img id="findProvincia" style="visibility:${empty __formdata.CPAIS ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', document.${nombrePantalla}Form.CPAIS.value)"/>                
                                                    &nbsp;<span id="TPROVIN_span"><b>${__formdata.LOCALIZA.TPROVIN}</b></span>
                                                </td>
                                                
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" maxlength="5" value="${__formdata.LOCALIZA.CPOBLAC}" 
                                                    title="<axis:alt c="CPOBLAC" f="axissin017" lit="100817" />" alt="<axis:alt c="CPOBLAC" f="axissin017" lit="100817" />" name="CPOBLAC" id="CPOBLAC" onchange="f_onchange_CPOBLAC()" style="width:18%;" />
                                                    &nbsp;<img id="findPoblacion" style="visibility:${empty __formdata.CPROVIN ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION', document.${nombrePantalla}Form.CPROVIN.value,document.${nombrePantalla}Form.CPOSTAL.value)"/>                
                                                    &nbsp;<span id="TPOBLAC_span"><b>${__formdata.LOCALIZA.TPOBLAC}</b></span>
                                                </td>

                                                
                                            </tr>
                                            </table>
                                      
                                            </td>
                                            </axis:ocultar>
                                            </tr>
                                            </div>
                                        
                                        
                                        </table>
                                 </td>
                                 
                            </tr>
                            </axis:ocultar>
                           
                            <tr>
                             <!-- Descripción del siniestro -->
 
                                <td class="titulocaja">
                                <axis:ocultar c="TSINIES" f="axissin017" dejarHueco="false">
                                    <b><axis:alt c="TSINIES" f="axissin017" lit="1000112" /></b>
                                </axis:ocultar>
                                </td>
                            </tr>
                            <tr>
                            <!-- Descripción del siniestro -->
							<axis:ocultar c="TSINIES" f="axissin017" dejarHueco="false">
                                 <td colspan="4" style="width:100%;"  class="campocaja"> <!-- colspan="5" -->
                                 
                                     <textarea class="campowidthinput campo campotexto" style="width:100%;" <axis:atr f="axissin017" c="TSINIES" a="isInputText=false&modificable=true"/> onkeydown=" if(this.value.length>= 2000 && event.keyCode != 8 && event.keyCode != 46){return false;}" name="TSINIES" id="TSINIES">${__formdata.TSINIES}</textarea>
                           
                                 </td>
							</axis:ocultar>
                              </tr>
                              <!-- Detalle Pretensión -->
                                <tr>
		                        <td class="titulocaja">
		                            <b><axis:alt c="TDETPRETEN" f="axissin017" lit="89908028" /></b><!-- Detalle Pretensión -->
		                        </td>
		                    </tr>
                             <tr>
		                    
<td colspan="6" style="width:100%;" class="campocaja">
		                            <axis:ocultar c="TDETPRETEN" f="axissin017" dejarHueco="false">
		                            <textarea maxlength="1000"  class="campowidthinput campo campotexto" style="width:100%;" name="TDETPRETEN" id="TDETPRETEN">${__formdata.TDETPRETEN}</textarea>
		                            </axis:ocultar>
		                        </td>
		                        </tr> 
                           <!-- SECCION PRESTACIONES -->
                           
                           
                           
                           
                           
                           
                           
                           <axis:visible f="axissin017" c="SINIES_PRESTACIONES">
                                <tr>
                                  <axis:visible f="axissin017" c="CNIVEL">
                                  <td class="titulocaja">
                                        <b><axis:alt c="CNIVEL" f="axissin017" lit="9901374" /></b>
                                  </td>
                                  </axis:visible>
                                   <axis:visible f="axissin017" c="SPERSON2">
                                  <td class="titulocaja" colspan="2">
                                        <b><axis:alt c="SPERSON2" f="axissin017" lit="9901375" /></b>
                                  </td>
                                  </axis:visible>                            
                                <tr>
                                </tr>
                                <axis:visible f="axissin017" c="CNIVEL">
                                  <td  class="campocaja">
                                        <select name="CNIVEL" id="CNIVEL" onchange="f_validar_nivel(); f_cargar_personas();"  size="1" title="<axis:alt c="TIPDOC" f="axissin017" lit="109774"/>" class="campowidthselect campo campotexto"  style="width:100%;"
                                        <axis:atr f="axisper010" c="NIVSINIES" a="isInputText=false&modificable=true"/> title="<axis:alt c="CNIVEL" f="axissin017" lit="9901374" />" alt="<axis:alt c="CNIVEL" f="axissin017" lit="9901374" />" >&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin017" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.nivSinies}">
                                            <option value = "${element.CATRIBU}" 
                                                <c:if test="${element.CATRIBU == __formdata.CNIVEL}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                        </select>
                                  </td>
                                </axis:visible>
                                <axis:visible f="axissin017" c="SPERSON2">
                                  <td  class="campocaja" colspan="2">
                                        <select name="SPERSON2" id="SPERSON2"  size="1" title="<axis:alt c="SPERSON_2" f="axissin017" lit="109774"/>" class="campowidthselect campo campotexto"  style="width:100%;"
                                        <axis:atr f="axissin017" c="SPERSON2" a="isInputText=false&modificable=true"/> title="<axis:alt c="SPERSON2" f="axissin017" lit="9901375" />" alt="<axis:alt c="SPERSON2" f="axissin017" lit="9901375" />" >&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin017" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstPersonasCaus}">
                                            <option value = "${element.CATRIBU}" 
                                                <c:if test="${element.CATRIBU == __formdata.CNIVEL}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                        </select>
                                  </td>
                             
                                  
                                        
                                 
                                </axis:visible>
  
                                </tr>  
                            </axis:visible>
                           
                           
                           
                           
                           
                           
                              
                              
                              
                            </table> <!-- UNO -->
            
            
            
                
                
            </td>
        </tr>
    </table>
  </td>
</tr>
</table>
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin017</c:param><c:param name="f">axissin017</c:param><c:param name="f">axissin017</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>
    </form>
    <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FSINIES",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FSINIES", 
                singleClick    :    true,
                firstDay       :    1
            });
          Calendar.setup({
                inputField     :    "FECHAPP",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FECHAPP", 
                singleClick    :    true,
                firstDay       :    1
            });
            
            Calendar.setup({
                inputField     :    "FNOTIFI",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FNOTIFI", 
                singleClick    :    true,
                firstDay       :    1
            });
               Calendar.setup({
                inputField     :    "FDETECCION",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_deteccion", 
                singleClick    :    true,
                firstDay       :    1
            });
</script>
  <c:import url="../include/mensajes.jsp" />
</body>
</html>
