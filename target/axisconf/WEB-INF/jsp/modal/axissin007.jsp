<%/* Revision:# eH5kLYAGPBU8i8wx/YDGkA== # */%>
<%--
/**
*  Fichero: axissin011.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*  
*  Titulo: Modal modificar Alta / Modificación Tramitación
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
<%@ page contentType="text/html;charset=iso-8859-15" %>
<c:set var="linea_trami" value="${sessionScope.indexTramitacio}"/> <!-- ${LINEATRAM} -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axissin007" c="title" lit="151090"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript">
        function f_onload() { 
        
        //objDom.setDisabledPorId("but_mas_recibos", true);
        
        <c:if test="${__formdata.TIPO_TRAMITACION==null||__formdata.TIPO_TRAMITACION==0}">
            
           //alert("Se pliegan los motivos");        
        </c:if>
        
    <%--     c:if test="${sessionScope.LINEA==null">
            <c:set var="linea" value="0"/>
        </c:if --%>
        
       <c:if test="${tipo_tram==5}">
                    if (objUtiles.estaVacio(objDom.getValorPorId("TLOCALI")  )){
                        f_verifica_textarea(1);
                    }else{
                        f_verifica_textarea(0);
                    }
        </c:if>
        
            var val1 = "<%=request.getAttribute("OK")%>"; 
             var NSINIES = "${__formdata.NSINIES}"; 
             objDom.setValorPorId("NSINIES_O",NSINIES);
            var NTRAMIT = "${__formdata.indexTramitacio}";
            if (val1=="OK"){
                 //alert("ha ido ok");
                 parent.f_aceptar_axissin007(NSINIES,NTRAMIT);
            }
            
         <c:if test="${__formdata.CTIPTRA==1 || __formdata.CTIPTRA==2}">   
                var ver="${__formdata.DETALLE.CVERSION}";
              
                if (!objUtiles.estaVacio(ver)){
                    objDom.setVisibilidadPorId("TVERSION","visible");
                }
                else{
                    objDom.setVisibilidadPorId("TVERSION","hidden");
                }  
        </c:if>
            
          
        // Si estamos en modo modificacion llamamos a la modelo y a la version con la marca
        <c:if test="${sessionScope.CMODO =='ALTA_SINIESTROS'}">
                //alert("Antes de marca");
                f_onchange_CMARCA();
        </c:if>
            
        f_carga_dependencias();
        f_cargar_propiedades_pantalla();    
        }
        
        
        function f_but_aceptar(){
            //alert("Antes proceso");
            var CTRAMIT = objUtiles.utilSplit(document.miForm.CTRAMITA.value, "-")[0]; 
            //alert(CTRAMIT);
            var CTIPTRA = objUtiles.utilSplit(document.miForm.CTRAMITA.value, "-")[1]; 
            //alert(CTIPTRA);
            //var CTCAUSIN = objUtiles.utilSplit(document.miForm.CTRAMITA.value, "-")[2];
            //alert(CTCAUSIN);
            
            //if (!objUtiles.estaVacio(CTCAUSIN)){
            //    objDom.setValorPorId("CTCAUSIN", CTCAUSIN);
            //}
            
            objDom.setValorPorId("CTRAMIT", CTRAMIT);
            objDom.setValorPorId("CTIPTRA", CTIPTRA);
            document.miForm.CTRAMIT.value=CTRAMIT;
            document.miForm.CTIPTRA.value=CTIPTRA;
            
            <c:if test="${__formdata.MOD_TRAM=='MOD' || __formdata.MOD_TRAM=='ALTA'}">
            if (objValidador.validaEntrada()) {
                <c:if test="${tipo_tram==1 || tipo_tram==2}">
                    objUtiles.ejecutarFormulario ("modal_axissin007.do?TVERSION="+$("#TVERSION").val()+
                                                                      "&CMARCA="+$("#CMARCA").val()+
                                                                      "&CMODELO="+$("#CMODELO").val()+
                                                                      "&CVERSION="+$("#CVERSION").val()+
                                                                      "&ANYO="+$("#ANYO").val()+
                                                                      "&CTIPMAT="+$("#CTIPMAT").val()+
                                                                      "&CMATRIC="+$("#CMATRIC").val()+
                                                                      "&CODMOTOR="+$("#CODMOTOR").val()+
                                                                      "&CCILINDRAJE="+$("#CCILINDRAJE").val()+
                                                                      "&CTIPVEH="+$("#CTIPVEH").val()+
                                                                      "&CCHASIS="+$("#CCHASIS").val()+
                                                                      "&NBASTID="+$("#NBASTID").val(),
                                                                      "guardar_cambios", document.miForm, "_self",objJsMessages.jslit_cargando);   
                </c:if>
                <c:if test="${tipo_tram!=1 && tipo_tram!=2}">
                    objUtiles.ejecutarFormulario ("modal_axissin007.do?",
                                                                      "guardar_cambios", document.miForm, "_self",objJsMessages.jslit_cargando);   
                </c:if>
            }
            
            </c:if>
            
            <c:if test="${__formdata.MOD_TRAM=='CONS'}">
                parent.f_cerrar_modal("axissin007");
            </c:if>
        }
        
        function f_but_cancelar(){
           parent.f_cerrar_modal("axissin007");
        }
        
         function f_but_salir(){
           parent.f_cerrar_modal("axissin007");
        }
        
        
    /****************************************************************************************/
    /*********************************** FUNC AJAX  *****************************************/
    /****************************************************************************************/
    
                function f_onchange_CMARCA() {
            //alert("En cargar marca");
                var CMARCA=objDom.getValorPorId("CMARCA");
            
                //alert("antes de llamar a marca");
                if (!objUtiles.estaVacio(CMARCA)){
                    var qs="operation=ajax_cargar_modelos";
                    qs=qs+"&CMARCA="+CMARCA;
                    qs=qs+"&CTRAMIT="+$("#CTRAMITA").val();
                    objAjax.invokeAsyncCGI("modal_axissin007.do", callbackajaxModelos, qs, this);
                } 
            }    

            function callbackajaxModelos (ajaxResponseText){
                //TODO:Además habrá que poner a cero el combo de versiones
                
                //alert(ajaxResponseText);
                //alert(document.miForm.CMODELO_AUX.value);
                //alert("despues");
                try{ 
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var comboModelos = document.miForm.CMODELO;   
             
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        objDom.borrarOpcionesDeCombo(comboModelos);
                            objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", comboModelos, 0);
                            for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                                //alert("Dentro del FOR");                     
                                var TMODELO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TMODELO")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TMODELO")[0].childNodes[0].nodeValue : "");
                                var CMODELO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CMODELO")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CMODELO")[0].childNodes[0].nodeValue : "");
                               
                                objDom.addOpcionACombo(CMODELO, TMODELO, comboModelos, i+1);
                            }
                                if(document.miForm.CMODELO_AUX){
                                valor = document.miForm.CMODELO_AUX.value;
                                }else{
                                valor=0;
                                }
                                //alert("VALOR" + valor);
                                document.miForm.CMODELO.selectedIndex = valor;
                                
                                <c:if test="${sessionScope.CMODO =='ALTA_SINIESTROS'}">
                                    //alert("Antes de version");
                                    f_busca_TVERSION();
                                </c:if>
            
                                
                                
                                
                        }else{
                            objDom.borrarOpcionesDeCombo (comboModelos);
                            objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", comboModelos, null);
                        }
                    }
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " +
                    e.message);
                }
            }
            
            function f_busca_TVERSION(){
            
                var CVERSION=document.miForm.CVERSION_AUX.value;
                //alert("CVERSION: "+CVERSION);
                if (!objUtiles.estaVacio(CVERSION)){
                    var qs="operation=ajax_obtener_tversion"; 
                    qs=qs+"&CVERSION="+CVERSION;
                    objAjax.invokeAsyncCGI("modal_axissin007.do", callbackajaxTversion, qs, this);
                   
                } 
            
            
            }
            
            
            function callbackajaxTversion (ajaxResponseText){
                //alert(ajaxResponseText);
                try{ 
                var doc = objAjax.domParse(ajaxResponseText);
                 if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                                
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        
                        var TVERSION = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[0].getElementsByTagName("TVERSION")[0])) ? doc.getElementsByTagName("element")[0].getElementsByTagName("TVERSION")[0].childNodes[0].nodeValue : "");
                     
                        document.miForm.TVERSION.value = TVERSION;
                     
                       
                    }
                 }
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
                }
            }
            
            
            
               
            function f_onchange_CMODELO() {
                //alert("En cambiar modelo");
                var CMARCA=objDom.getValorPorId("CMARCA");
                var CMODELO=objDom.getValorPorId("CMODELO");
                //alert("Antes de llamada: "+CMARCA+"***"+CMODELO);
                if (!objUtiles.estaVacio(CMARCA)&& !objUtiles.estaVacio(CMODELO)){
                    var qs="operation=ajax_cargar_versiones";
                    qs=qs+"&CMARCA="+CMARCA;
                    qs=qs+"&CMODELO="+CMODELO;
                    qs=qs+"&CTRAMIT="+$("#CTRAMIT").val();
                    objAjax.invokeAsyncCGI("modal_axissin007.do", callbackajaxVersiones, qs, this);
                } 
            }    

            function callbackajaxVersiones (ajaxResponseText){
                //alert(ajaxResponseText);
                try{ 
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var comboAsientos = document.miForm.CVERSION;   
             
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        objDom.borrarOpcionesDeCombo(comboAsientos);
                            objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", comboAsientos, 0);
                            for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                                                     
                                var TATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0].childNodes[0].nodeValue : "");
                                var CATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0].childNodes[0].nodeValue : "");
                               
                                objDom.addOpcionACombo(CATRIBU, TATRIBU, comboAsientos, i+1);
                            }
                                valor = documento.miForm.VERSION_AUX.value;
                                document.miForm.VERSION.selectedIndex = valor;
                        }else{
                            objDom.borrarOpcionesDeCombo (comboAsientos);
                            objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", comboAsientos, null);
                        }
                    }
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
                }
            }
        
                 
    /****************************************************************************************/
    /******************************** OCULTAR SECCIONES  ************************************/
    /****************************************************************************************/
            
            function ocultar_seccion (ths, objeto, img_mes, img_menys) {
          
            
	    var thisSeccionId=ths;
            var actualDisplayValue=document.getElementById(thisSeccionId).style.display;
                
            var resto = document.getElementsByTagName("table");
		
            for (i=0; i < resto.length; i++) {            
                if(resto[i].getAttribute("tipo")=='cont'){
                     resto[i].style.display="none";
                }
            }

            if (actualDisplayValue=="none"){ 
                actualDisplayValue="";// en vez de "block", mejor "" para evitar FireFox bug
              
            }else{ 
                actualDisplayValue="none";
               
            }
            
            document.getElementById(thisSeccionId).style.display=actualDisplayValue;
          
          }
        
        
        
        function f_but_cargar_secciones(TIPO){ //TODO: Recuperar el Tipo tramitacion a partir del CTRMIT!!!
            //alert(TIPO);
                        
            //Hacer visible el que toca según el CTRAMIT!!! (pte)
            if(TIPO==4){
            ocultar_seccion('seccion_descripcion');
            } else if(TIPO==3){
            ocultar_seccion('seccion_persona');
            } else if(TIPO==5){
            ocultar_seccion('seccion_direccion');
            } else if(TIPO==1||TIPO==2){
            //alert("en tipo 2");
            ocultar_seccion('seccion_vehiculo');
            } else if(TIPO==6||TIPO==7){
            ocultar_seccion('seccion_conductor');
            }
           
           
        }
        
        
        function cambiar_seccion(){
             var CTRAMIT = objDom.getValorPorId("CTRAMITA");  //Código de tramitacion que contiene el codigo y el tipo
             if(CTRAMIT!=-1 && CTRAMIT!=null){
                 var cadena = CTRAMIT.split("-");
                 document.miForm.CTCAUSIN.value=cadena[2];
                 document.miForm.CTIPTRA.value=cadena[1];
                 document.miForm.CTRAMIT.value=cadena[0];
             }
           
           if(document.miForm.CTRAMIT.value==20 && document.miForm.CTRAMIT.value==21){
               f_cargar_propiedades_pantalla();
               f_cambia_subestado(this); //BUG CONF-513 - 12/01/2017 - OJSO
           }else{
         
                objUtiles.ejecutarFormulario ("modal_axissin007.do", "cargar_seccion", document.miForm, "_self", objJsMessages.jslit_cargando);   
           }
        }
        
        //BUG CONF-513 - 12/01/2017 - OJSO
        function f_cambia_subestado(obj){
                    
            if (obj.value != "null"){
                objAjax.invokeAsyncCGI("modal_axissin007.do", callbackAjaxSelectedCambSubestado,                     
                    "operation=ajax_cargar_subestados&CEMPRES="+document.miForm.CEMPRES.value+"&CTIPTRA="+document.miForm.CTIPTRA.value, this, objJsMessages.jslit_actualizando_registro);}
        }
        
        function callbackAjaxSelectedCambSubestado(ajaxResponseText) {
            var subestadosCombo = document.miForm.CSUBTRA;
            try {
               var doc=objAjax.domParse(ajaxResponseText);
                                    
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0]) && doc.getElementsByTagName("element").length > 0){
                        objDom.borrarOpcionesDeCombo(subestadosCombo);
                        objDom.addOpcionACombo(null, "- Seleccione -", subestadosCombo, 0);
                        for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                            var TATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0].childNodes[0].nodeValue : "");
                            var CATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0].childNodes[0].nodeValue : "");
                           
                            objDom.addOpcionACombo(CATRIBU, TATRIBU, subestadosCombo, i+1);
                        }
                    }else{
                        objDom.borrarOpcionesDeCombo (subestadosCombo);
                        objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", subestadosCombo, null);
                    }
                }
                
            } catch (e) {
                objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", subestadosCombo, null);
                //alert(objJsMessages.jslit_sin_tramitadores);
            }
        }
        //BUG CONF-513 - 12/01/2017 - OJSO
        
        ///////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////
        
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
				document.miForm.CPAIS.focus();
                objAjax.invokeAsyncCGI('modal_axissin017.do', callbackAjaxOnblurCPOSTAL, 'operation=getProvinPobla&CPOSTAL=' + CPOSTAL, this);
            }
        }
        
        
        function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION){
             //alert("Antes de abrir modal");
             //alert("CODIGO LITERAl: "+CODIGO_LITERAL);
             //alert("CODIGO CONSULTA: "+CODIGO_CONSULTA);
             //alert("CODIGO CONDICION: "+CODIGO_CONDICION);
             objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
              "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION+"&TIPO=DATE");
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
        
    /****************************************************************************************/
    /*********************************** MODAL 058 ******************************************/
    /****************************************************************************************/
    function f_abrir_axisctr058() {
    var CMARCA=objDom.getValorPorId("CMARCA");
    var CMODELO=objDom.getValorPorId("CMODELO");
    //alert(CMARCA);
    //alert(CMODELO);
      if (!objUtiles.estaVacio(CMARCA) && !objUtiles.estaVacio(CMODELO)){
                    objDom.setVisibilidadPorId("but_cerrar_modal_axisctr058", "hidden");
                    objUtiles.abrirModal("axisctr058", "src", "modal_axisctr058.do?operation=form&XCMARCA="+CMARCA+"&XCMODELO="+CMODELO+"&CTRAMIT="+$("#CTRAMIT").val());            
      }else
                    alert("<axis:alt f="axissin007" c="modal058" lit="9001260"/>"); 
    }

    function f_cerrar_axisctr058(){
            objUtiles.cerrarModal("axisctr058");
    }


    function f_aceptar_axisctr058(cversion){
    //alert("En volver y recargar");
    //alert("CVERSION: "+cversion);
       f_cerrar_axisctr058();
       document.miForm.CVERSION.value = cversion;
       //objAjax.invokeAsyncCGI("modal_axissin007.do", callbackAjaxRecuperarVersion, "operation=ajax_recuperar_version&CVERSION="+cversion, this, objJsMessages.jslit_actualizando_registro);
       
       var strURL="axis_axisctr148.do?operation=recuperar_version_json&CVERSION="+cversion+"&CTRAMIT="+$("#CTRAMIT").val();
       var ajaxTexto=objJsMessages.jslit_cargando;
       objAjax.invokeAsyncCGI_JSON(strURL, callbackjsonRecuperarVersion, ajaxTexto)
    }
        
    function callbackAjaxRecuperarVersion(ajaxResponseText){
    //alert("Volver"+ajaxResponseText);
            try {  
                  var doc = objAjax.domParse(ajaxResponseText);
                  if (!objAppMensajes.existenErroresEnAplicacion(doc))  {
                    objDom.setValorPorId("TVERSION", objDom.getValorNodoDelComponente(doc.getElementsByTagName("TVERSION"), 0, 0));
                    objDom.setVisibilidadPorId("TVERSION","visible");
                   
                    }
                } catch (e) { 
                  if (isDebugAjaxEnabled == "true")
                     alert (e.name + " " + e.message);
                  } 
           }
        
        
        ///////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////
        
        // PERSONAS ///////////////////////////////////////////////////////////////////
        
        /*axisper021 i axisper022*/
        function f_abrir_axisper021 () {
            objUtiles.abrirModal("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="+document.miForm.CAGENTE.value);
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
        function f_aceptar_persona(SPERSON,CAGENTE,SNIP, modal){
            //alert("En aceptar persona");
            f_cerrar_modalespersona(modal);
            
            if (!objUtiles.estaVacio(SPERSON)){
                objAjax.invokeAsyncCGI("modal_axissin007.do?SPERSON="+SPERSON+"&CAGENTE="+CAGENTE, callbackAjaxActualitzaPersona, "operation=ajax_actualiza_persona", this, objJsMessages.jslit_cargando);
            }
        }
      
        function callbackAjaxActualitzaPersona (ajaxResponseText) {
            try{
                //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
       
                if(!objAppMensajes.existenErroresEnAplicacion(doc)) {   
                    
                    var NNUMIDE = objUtiles.existeObjetoXml(doc.getElementsByTagName("NNUMIDE")[0]) ? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0) : "";
                    objDom.setValorPorId("NNUMIDE", NNUMIDE);
                    var NOMBRE = objUtiles.existeObjetoXml(doc.getElementsByTagName("TNOMBRE")[0]) ? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0) : "";
                    var APELLIDO1 = objUtiles.existeObjetoXml(doc.getElementsByTagName("TAPELLI1")[0]) ? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0) : "";
                    var APELLIDO2 = objUtiles.existeObjetoXml(doc.getElementsByTagName("TAPELLI2")[0]) ? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0) : "";
                    objDom.setValorPorId("NOMBRE", NOMBRE+' ' + APELLIDO1 +' '+ APELLIDO2);
                    var SPERSON = objUtiles.existeObjetoXml(doc.getElementsByTagName("SPERSON")[0]) ? objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0) : "";
                    objDom.setValorPorId("SPERSON", SPERSON);
           
                    document.miForm.SPERSON.value = SPERSON;
                    document.miForm.NNUMIDE.value = NNUMIDE;
                    document.miForm.NOMBRE.value = NOMBRE+' ' + APELLIDO1 +' '+ APELLIDO2;
           
                    //alert("SPERSON xml:"+objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0));
                    //alert("NNUMIDE: xml"+objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0));
                    //alert("NOMBRE: xml"+objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0));
           
           
                    //alert("SPERSON:"+document.miForm.SPERSON.value);
                    //alert("NNUMIDE:"+document.miForm.NNUMIDE.value);
                    //alert("NOMBRE:"+document.miForm.NOMBRE.value);
           
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("CCC")[0])){
                    var elementos = doc.getElementsByTagName("CCC");
                    //alert(elementos.length)
                    var cccCombo = document.miForm.BANC;     
                    objDom.borrarOpcionesDeCombo(cccCombo);
                    objDom.addOpcionACombo(-1, <axis:alt f="axissin007" c="ccc" lit="1000348"/>, cccCombo, 0);
                    
                    //alert("Accion 1");
                    
                        for (i = 1; i < elementos.length; i++) {
                            var codigo1 = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CBANCAR")[0]) ?
                                     objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CBANCAR"), 0, 0) : "";
                            var codigo2 = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CTIPBAN")[0]) ?
                                     objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CTIPBAN"), 0, 0) : "";                                     
                            var codigo = codigo1+'/'+codigo2;
                                     
                            var desc   = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CBANCAR")[0]) ?
                            objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CBANCAR"), 0, 0): "";
                            objDom.addOpcionACombo(codigo, desc, cccCombo, i);
                        }   
                    
                    }                

             
                }      
                
                 //alert("Accion 2");
     
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
        // FIN PERSONAS ///////////////////////////////////////////////////////////////////
        function f_onclickCheckbox(thiss) {
           thiss.value =  ((thiss.checked)?1:0);
           objDom.setValorPorId(thiss.id, thiss.value);
        }

  function f_cambia_cunitra(obj){
            if (obj.value != "null"){
                objAjax.invokeAsyncCGI("modal_axissin007.do", callbackAjaxSelectedCunitra, 
                    "operation=ajax_selected_cunitra&CUNITRA="+document.miForm.CUNITRA.value+"&CEMPRES="+document.miForm.CEMPRES.value, this, objJsMessages.jslit_actualizando_registro);}
        }
        
        function callbackAjaxSelectedCunitra(ajaxResponseText) {
            var tramitadoresCombo = document.miForm.CTRAMITAD;
            try {
               var doc=objAjax.domParse(ajaxResponseText);
                                    
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        objDom.borrarOpcionesDeCombo(tramitadoresCombo);
                        
                        for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                            var TTRAMITAD = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TTRAMITAD")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TTRAMITAD")[0].childNodes[0].nodeValue : "");
                            var CTRAMITAD = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CTRAMITAD")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CTRAMITAD")[0].childNodes[0].nodeValue : "");
                           
                            objDom.addOpcionACombo(CTRAMITAD, CTRAMITAD+' - '+TTRAMITAD, tramitadoresCombo, i);
                        }
                    }else{
                        objDom.borrarOpcionesDeCombo (tramitadoresCombo);
                        objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", tramitadoresCombo, null);
                    }
                }
                
            } catch (e) {
                objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", tramitadoresCombo, null);
                alert(objJsMessages.jslit_sin_tramitadores);
            }
        }    
        
function f_verifica_textarea(valor) {                
        // Habilita o deshabilita el TextArea segun si 
        // Se ha seleccionado o no, una clusula definida
        
        if (valor == 0){
            
            document.miForm.TLOCALI.readonly = false;
            document.miForm.TLOCALI.disabled = false;
            objDom.setClassNamePorComponente(document.miForm.TLOCALI, "campowidthinput campo campotexto_ob");
            document.miForm.TLOCALI.focus();
            objDom.setVisibilidadPorId("direccions", "hidden");
            document.getElementById("direccions").style.display="none" ;
 
            limpiaCampos("TODO");
        }else{ 
           
            objDom.setValorPorId("TLOCALI","") ;
            document.getElementById("TLOCALI").disabled = "true";
            objDom.setVisibilidadPorId("direccions", "visible");
            document.getElementById("direccions").style.display="block" ;
            document.miForm.TLOCALI.readonly = true;
            objDom.setClassNamePorComponente(document.miForm.TLOCALI, "campo campodisabled");
            objDom.setValorComponente(document.miForm.TLOCALI, "");
            
        }
        }
        
        function f_datosriesgo(){
           objUtiles.ejecutarFormulario("modal_axissin007.do", "datossitriesgo", document.miForm, "_self");  
        }
        
        function f_llenar_tipo(marca){
                var strURL="axis_axisctr148.do?operation=tipos_vehiculo_json&cmarca="+marca+"&ctramit="+$("#CTRAMIT").val();
                var ajaxTexto=objJsMessages.jslit_cargando;
                objAjax.invokeAsyncCGI_JSON(strURL, callbacktipos_vehiculo, ajaxTexto)
        }
        
        function callbacktipos_vehiculo(p) {
            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
            try{
                if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                    var tipvehcombo = document.miForm.CTIPVEH;  
                    objDom.setValorPorId("CVERSION", "");
                    objDom.setValorPorId("TVERSION", "");
                    objDom.borrarOpcionesDeCombo(tipvehcombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axissin007" c="SNV_VALOR" lit="108341"/> - ', tipvehcombo, 0);
                    if (!objUtiles.estaVacio(p.JSON2.lista)){
                        for (i = 0; i < p.JSON2.lista.length; i++) {
                            var codigo = p.JSON2.lista[i].CTIPVEH;
                            var desc   = p.JSON2.lista[i].TTIPVEH;
                            <axis:visible f="axissin007" c="CODIGOS">
                            desc = desc +"("+codigo+")";
                            </axis:visible>
                            objDom.addOpcionACombo(codigo, desc, tipvehcombo, i+1);
                        }
                    }
                    if (!objUtiles.estaVacio(p.JSON2.lista) && p.JSON2.lista.length == 1){
                        var codigo = p.JSON2.lista[0].CTIPVEH;
                        document.miForm.CTIPVEH.value =codigo;
                        if (!objUtiles.estaVacio(document.miForm.CTIPVEHSEL.value) ){
                           document.miForm.CTIPVEH.value = document.miForm.CTIPVEHSEL.value;
                        }
                        document.miForm.CMODELO.selectedIndex = 0;
                        f_llenar_modelo( document.miForm.CMARCA.value);
                    }else{
                       if (!objUtiles.estaVacio(document.miForm.CTIPVEHSEL.value) ){
                            document.miForm.CTIPVEH.value = document.miForm.CTIPVEHSEL.value;
                        }
                        document.miForm.CMODELO.selectedIndex = 0;
                        f_llenar_modelo(document.miForm.CMARCA.value);
                    }
                }
            }catch(e){}
        }
            
        function f_llenar_clase(tipo){
                var strURL="axis_axisctr148.do?operation=clases_vehiculo_json&CTIPVEH="+tipo+"&CMARCA="+document.miForm.CMARCA.value;
                var ajaxTexto=objJsMessages.jslit_cargando;
                objAjax.invokeAsyncCGI_JSON(strURL, callbackclase_vehiculo, ajaxTexto)
        }  
        
        function callbackclase_vehiculo(p) {
            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
            if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                 <axis:visible c="CCLAVEH" f="axissin007">
                    var clasecombo = document.miForm.CCLAVEH;     
                    objDom.borrarOpcionesDeCombo(clasecombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axissin007" c="SNV_VALOR" lit="108341"/> - ', clasecombo, 0);
                    if (!objUtiles.estaVacio(p.JSON2.lista)){
                        for (i = 0; i < p.JSON2.lista.length; i++) {
                            var codigo = p.JSON2.lista[i].CCLAVEH;
                            var desc   = p.JSON2.lista[i].TCLAVEH;
                            <axis:visible f="axissin007" c="CODIGOS">
                            desc = desc +"("+codigo+")";
                            </axis:visible>
                            objDom.addOpcionACombo(codigo,desc, clasecombo, i+1);
                        }  
                    }                         
                    if (!objUtiles.estaVacio(p.JSON2.lista) && p.JSON2.lista.length == 1){
                        var codigo = p.JSON2.lista[0].CCLAVEH;
                        document.miForm.CCLAVEH.value = codigo;
                    }
                 </axis:visible>
            }
            f_llenar_modelo( document.miForm.CMARCA.value);
        }
            
        function f_abrir_axisctr058(cmarca,cmodelo) {
            if (!objUtiles.estaVacio(cmarca) ){//&& !objUtiles.estaVacio(cmodelo)){
                objDom.setVisibilidadPorId("but_cerrar_modal_axisctr058", "hidden");
                var ctipveh = document.miForm.CTIPVEH.value;
                var cversion = document.miForm.CVERSION.value;
                var ctramit = document.miForm.CTRAMIT.value;
                
                objUtiles.abrirModal("axisctr058", "src", "modal_axisctr058.do?operation=form&xCVERSION="+cversion+"&xCTIPVEH="+ctipveh+"&XCMARCA="+cmarca+"&XCMODELO="+cmodelo+"&CTRAMIT="+ctramit);            
            }
            else
                alert('<axis:alt f="axissin007" c="LIT_ERROR_MARCA" lit="9001260"/>'); 
        }
        
        function f_cerrar_axisctr058(){
                objUtiles.cerrarModal("axisctr058");
        }
        
        /*function f_llenar_modelo_porclase(valor){
            var ctipveh = document.miForm.CTIPVEH.value;
            document.miForm.CCLAVEH.value= valor;
            var cmarca = document.miForm.CMARCA.value;
            objAjax.invokeAsyncCGI("axis_axisctr148.do", callbackAjaxRecuperarModelo, "operation=ajax_recuperar_modelo&CVALOR="+cmarca+"&CTIPVEH="+ctipveh+"&CCLAVEH="+valor, this, objJsMessages.jslit_actualizando_registro);
            f_cargar_propiedades_pantalla();
        }*/
        
        function callbackAjaxRecuperarModelo(ajaxResponseText){
            try {  
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {                                
                    var elementos = doc.getElementsByTagName("element");
                    var modelocombo = document.miForm.CMODELO;     
                    objDom.borrarOpcionesDeCombo(modelocombo);
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        var elementos = doc.getElementsByTagName("element");
                        var modelocombo = document.miForm.CMODELO;     
                        objDom.borrarOpcionesDeCombo(modelocombo);
                            
                        objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axissin007" c="SNV_VALOR" lit="108341"/> - ', modelocombo, 0);
                        
                        for (i = 0; i < elementos.length; i++) {
                            var codigo = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CMODELO")[0]) ?
                                         objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CMODELO"), 0, 0) : "";
                            var desc   = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("TMODELO")[0]) ?
                                         objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TMODELO"), 0, 0): "";
                            <axis:visible f="axissin007" c="CODIGOS">
                                desc = desc +"("+codigo+")";
                            </axis:visible>
                            objDom.addOpcionACombo(codigo, desc, modelocombo, i+1);
                        }
                        if (!objUtiles.estaVacio(document.miForm.CMODELOSEL.value))
                            document.miForm.CMODELO.value = document.miForm.CMODELOSEL.value;
                        }
                        if (elementos.length == 0){
                            objDom.addOpcionACombo(null, "Seleccione", modelocombo, 0);
                            var elementos = doc.getElementsByTagName("element");
                            var versioncombo = document.miForm.CMODELO;     
                            objDom.borrarOpcionesDeCombo(versioncombo);
                            objDom.addOpcionACombo(null, "Seleccione", versioncombo, 0);
                        }
                    } 
                 } catch (e) {
                        if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                 }
        }
        
        function f_cambiar_anyo(anyo){
            var strURL="axis_axisctr148.do?operation=anyos_version_json&CVERSION="+document.miForm.CVERSION.value;
            var ajaxTexto=objJsMessages.jslit_cargando;
            objAjax.invokeAsyncCGI_JSON(strURL, callbackanyo_version, ajaxTexto)
        }
        function callbackanyo_version(p) {
            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
            var anyoact = document.miForm.ANYO.value;
            if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
               <axis:visible c="ANYO" f="axisctr148">
               valorcomercial = '';
               var clasecombo = document.miForm.ANYO;     
               objDom.borrarOpcionesDeCombo(clasecombo);
               objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axissin007" c="SNV_VALOR" lit="108341"/> - ', clasecombo, 0);
               if (!objUtiles.estaVacio(p.JSON2.lista)){
                    for (i = 0; i < p.JSON2.lista.length; i++) {
                    var codigo = p.JSON2.lista[i].ANYO;
                    var desc   = p.JSON2.lista[i].ANYO;
                    var valor = p.JSON2.lista[i].VCOMERCIAL;
                    var VNUEVO = p.JSON2.lista[i].VNUEVO;
                    objDom.addOpcionACombo(codigo, desc, clasecombo, i+1);
                        if (anyoact == codigo ){
                            valorcomercial=valor;
                        }
                    }  
               }                         
               if (!objUtiles.estaVacio(p.JSON2.lista) && p.JSON2.lista.length == 1){
                    var codigo = p.JSON2.lista[0].ANYO;
                    document.miForm.ANYO.value =codigo;
               }else{
                    if (!objUtiles.estaVacio(valorcomercial) && !objUtiles.estaVacio(anyoact)){
                        document.miForm.ANYO.value =anyoact;
                    }
               }
               </axis:visible>
            }
        }
        function f_limpiar(valor){
            //Si el valor es 1 limpiamos todo, 2 todo menos puertas, 3 todo menos combustible
            <axis:visible c="CVERSION" f="axissin007">
                document.miForm.CVERSION.value = '';
            </axis:visible>
            <axis:visible c="TVERSION" f="axissin007">
                document.miForm.TVERSION.value = "";
                objDom.setVisibilidadPorId("TVERSION","hidden");
            </axis:visible>
                if (objUtiles.estaVacio(   document.miForm.CMARCASEL.value))
                    document.miForm.CTIPMAT.selectedIndex = 0;
                if (valor == 5){
                 document.miForm.CMARCA.selectedIndex = 0;
                 document.miForm.CMODELO.selectedIndex = 0;
                 document.miForm.CTIPVEH.selectedIndex = 0;
                }
                if (objUtiles.estaVacio(   document.miForm.CMARCASEL.value))
                 document.miForm.CMATRIC.value = "";
                <axis:visible c="ANYO" f="axissin007">
                   var tipvehcombo = document.miForm.ANYO;     
                    objDom.borrarOpcionesDeCombo(tipvehcombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axissin007" c="SNV_VALOR" lit="108341"/> - ', tipvehcombo, 0);
                </axis:visible>
                if(document.getElementById("CMATRIC").style.visibility=="hidden"){
                    objDom.setVisibilidadPorId("CMATRIC","visible");
                    objDom.setVisibilidadPorId("TCMATRIC","visible");
                }
                f_cargar_propiedades_pantalla();
            }
            
            function f_recuperar_version(){
                var strURL="axis_axisctr148.do?operation=recuperar_version_json&CVERSION="+$("#CVERSION").val()+"&CTRAMIT="+$("#CTRAMIT").val();
                var ajaxTexto=objJsMessages.jslit_cargando;
                objDom.setValorPorId("TVERSION","");
                objDom.setValorPorId("ANYO","");
                objAjax.invokeAsyncCGI_JSON(strURL, callbackjsonRecuperarVersion, ajaxTexto)
            }
            
            function callbackjsonRecuperarVersion(p){
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
                try{
                    if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                        if (!objUtiles.estaVacio(p.JSON2.lista)){
                            <axis:visible c="CTIPVEH" f="axissin007">
                            if (!objUtiles.estaVacio(p.JSON2.listatipos)){
                                var tipvehcombo = document.miForm.CTIPVEH;     
                                objDom.borrarOpcionesDeCombo(tipvehcombo);
                                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axissin007" c="SNV_VALOR" lit="108341"/> - ', tipvehcombo, 0);
                                if (!objUtiles.estaVacio(p.JSON2.listatipos)){
                                    for (i = 0; i < p.JSON2.listatipos.length; i++) {
                                        var codigo = p.JSON2.listatipos[i].CTIPVEH;
                                        var desc   = p.JSON2.listatipos[i].TTIPVEH;
                                        <axis:visible f="axissin007" c="CODIGOS">
                                        desc = desc +"("+codigo+")";
                                        </axis:visible>
                                        objDom.addOpcionACombo(codigo, desc, tipvehcombo, i+1);
                                     }
                                 }
                            }
                            </axis:visible>
                            <axis:visible c="CMODELO" f="axissin007">
                            if (!objUtiles.estaVacio(p.JSON2.listamodelos)){
                                var clasecombo = document.miForm.CMODELO;     
                                objDom.borrarOpcionesDeCombo(clasecombo);
                                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axissin007" c="SNV_VALOR" lit="108341"/> - ', clasecombo, 0);
                                if (!objUtiles.estaVacio(p.JSON2.listamodelos)){
                                    for (i = 0; i < p.JSON2.listamodelos.length; i++) {
                                        var codigo = p.JSON2.listamodelos[i].CMODELO;
                                        var desc   = p.JSON2.listamodelos[i].TMODELO;
                                        <axis:visible f="axissin007" c="CODIGOS">
                                        desc = desc +"("+codigo+")";
                                        </axis:visible>
                                        objDom.addOpcionACombo(codigo,desc, clasecombo, i+1);
                                     }  
                                }       
                            }
                            </axis:visible>
                            <axis:visible c="ANYOS" f="axissin007">
                            if (!objUtiles.estaVacio(p.JSON2.listaanyos)){
                                var clasecombo = document.miForm.ANYO;     
                                objDom.borrarOpcionesDeCombo(clasecombo);
                                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axissin007" c="SNV_VALOR" lit="108341"/> - ', clasecombo, 0);
                                if (!objUtiles.estaVacio(p.JSON2.listaanyos)){
                                    for (i = 0; i < p.JSON2.listaanyos.length; i++) {
                                        var codigo = p.JSON2.listaanyos[i].ANYO;
                                        var desc   = p.JSON2.listaanyos[i].ANYO;
                                        objDom.addOpcionACombo(codigo,desc, clasecombo, i+1);
                                    }  
                                }     
                            }
                            </axis:visible>
                            objDom.setVisibilidadPorId("TVERSION","visible");   
                            <axis:visible c="CMARCA" f="axissin007">
                            objDom.setValorPorId("CMARCA", objUtiles.estaVacio( p.JSON2.lista[0].CMARCA ) ?"" :  p.JSON2.lista[0].CMARCA  );
                            </axis:visible>
                            <axis:visible c="TVERSION" f="axissin007">
                            objDom.setValorPorId("TVERSION",objUtiles.estaVacio( p.JSON2.lista[0].TVERSION ) ?"" :  p.JSON2.lista[0].TVERSION);
                            </axis:visible>
                            <axis:visible c="TTIPVEH" f="axissin007">
                            objDom.setValorPorId("TTIPVEH", objUtiles.estaVacio( p.JSON2.lista[0].TTIPVEH ) ?"" :  p.JSON2.lista[0].TTIPVEH);
                            </axis:visible>
                            <axis:visible c="TCLAVEH" f="axissin007">
                            objDom.setValorPorId("TCLAVEH", objUtiles.estaVacio( p.JSON2.lista[0].TCLAVEH ) ?"" :  p.JSON2.lista[0].TCLAVEH);
                            </axis:visible>
                            <axis:visible c="CTIPVEH" f="axissin007">
                            objDom.setValorPorId("CTIPVEH", objUtiles.estaVacio( p.JSON2.lista[0].CTIPVEH ) ?"" :  p.JSON2.lista[0].CTIPVEH);
                            </axis:visible>
                           <axis:visible c="CMODELO" f="axissin007">
                            objDom.setValorPorId("CMODELO", objUtiles.estaVacio( p.JSON2.lista[0].CMODELO ) ?"" :  p.JSON2.lista[0].CMODELO);
                            </axis:visible>
                       }
                    }else{f_limpiar(5);}
                }catch(e){
                    CVERSION = objDom.getValorPorId("CVERSION");
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                    
                    f_limpiar(5);
                    objDom.setValorPorId("CVERSION",CVERSION);
                }       
           }
           
           function f_llenar_modelo(valor){
                //f_limpiar(1);
                //f_cargar_propiedades_pantalla();
                if(valor != 99999){
                var ctipveh = document.miForm.CTIPVEH.value;
                var cmodelo = '';
                cmodelo = document.miForm.CMODELO.value;
                
                objAjax.invokeAsyncCGI("axis_axisctr148.do", callbackAjaxRecuperarModelo, "operation=ajax_recuperar_modelo&CVALOR="+valor+"&CTIPVEH="+ctipveh+"&CCLAVEH="+cmodelo+"&CTRAMIT="+$("#CTRAMIT").val(), this, objJsMessages.jslit_actualizando_registro);
                f_cargar_propiedades_pantalla();
                }
            }
            
            function cambio_modelo(){
                if(!objUtiles.estaVacio(objDom.getValorPorId("CVERSION"))){
                    objDom.setValorPorId("CVERSION","");
                    objDom.setValorPorId("TVERSION","");
                }
                if(!objUtiles.estaVacio(objDom.getValorPorId("ANYO"))){
                    objDom.setValorPorId("ANYO","");
                }
            }
            
            function limpiar_cambio_tipo(){
                if(!objUtiles.estaVacio(objDom.getValorPorId("CVERSION"))){
                    objDom.setValorPorId("CVERSION","");
                    objDom.setValorPorId("TVERSION","");
                }
                if(!objUtiles.estaVacio(objDom.getValorPorId("ANYO"))){
                    objDom.setValorPorId("ANYO","");
                }
            }
            
            function conMayusculas(field) {
                field.value = field.value.toUpperCase()
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
			document.miForm.CPAIS.focus();     
			objAjax.invokeAsyncCGI('modal_axissin017.do', callbackAjaxOnblurCPOSTAL, 'operation=getProvinPobla&CPOSTAL=' + CPOSTAL, this);             
		}
				
		function f_abrir_axisper042 () {
			objUtiles.abrirModal("axisper042", "src", "modal_axisper042.do?operation=form");
		}
                function f_abrir_axissin067(){
                var CUNITRA =objDom.getValorPorId("CUNITRA");
                var CTRAMIT =objDom.getValorPorId("CTRAMIT");
                var CEMPRES =objDom.getValorPorId("CEMPRES");
                
                var SPRODUC =objDom.getValorPorId("SPRODUC");
                var SSEGURO =objDom.getValorPorId("SSEGURO");
                var CCAUSIN =objDom.getValorPorId("CCAUSIN");
                var CMOTSIN =objDom.getValorPorId("CMOTSIN");
                var CACTIVI =objDom.getValorPorId("CACTIVI");                
                var NRIESGO =objDom.getValorPorId("NRIESGO");                
                var CTRAMTE =objDom.getValorPorId("CTRAMTE");
                var CESTSIN =objDom.getValorPorId("CESTSIN");
    
        
                        objUtiles.abrirModal("axissin067", "src", "modal_axissin067.do?operation=form&CUNITRA="+CUNITRA+"&CTRAMIT="+CTRAMIT+"&SPRODUC="+SPRODUC+"&SSEGURO="+SSEGURO+"&CCAUSIN="+CCAUSIN+"&CMOTSIN="+CMOTSIN+"&CACTIVI="+CACTIVI
                        		+"&NRIESGO="+NRIESGO+"&CTRAMTE="+CTRAMTE+"&CESTSIN="+CESTSIN+"&CEMPRES="+CEMPRES);
 
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

	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axissin067|<axis:alt c="axissin067_TITULO" f="axissin067" lit="9909363"/></c:param>
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
    <form name="miForm" action="modal_axissin007.do" method="POST">
    <input type="hidden" name="operation" value="guardar" />
    <input type="hidden" name="SPRODUC" id="SPRODUC" value="${__formdata.SPRODUC}"/>
    <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}"/>
    <input type="hidden" name="NRIESGO" id="NRIESGO" value="${__formdata.NRIESGO}"/>
    <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}"/>
    <input type="hidden" name="CACTIVI" id="CACTIVI" value="${__formdata.CACTIVI}"/>
    <input type="hidden" name="CMOTSIN" id="CMOTSIN" value="${__formdata.CMOTSIN}"/>
    <input type="hidden" name="CCAUSIN" id="CCAUSIN" value="${__formdata.CCAUSIN}"/>
    <input type="hidden" name="NSINIES" value="${__formdata.NSINIES}"/>
    <input type="hidden" name="NTRAMTE" value="${__formdata.NTRAMTE}"/>
    <input type="hidden" name="CTRAMTE" id="CTRAMTE" value="${__formdata.CTRAMTE}"/>
    <input type="hidden" name="NMOVTRA" value="${__formdata.NMOVTRA}" />
    <input type="hidden" name="CESTSIN" id="CESTSIN" value="${__formdata.CESTSIN}"/>
    <!--<input type="hidden" name="CVERSION" value="${__formdata.CVERSION}" />-->
    <input type="hidden" name="subpantalla" value="tramitaciones"/>
    <input type="hidden" name="seccion" value=""/>
    <input type="hidden" name="CTIPTRA" id="CTIPTRA" value="${__formdata.CTIPTRA}"/>
    <input type="hidden" name="CTRAMIT" id="CTRAMIT" value="${__formdata.CTRAMIT}"/>
    <input type="hidden" name="CEMPRES" id="CEMPRES" value="${__formdata.CEMPRES}"/>
    <input type="hidden" name="NTRAM" value="${__formdata.NTRAM}"/>
    <!-- MARCA, MODELO, VERSION recuperacion al modificar-->
    <input type="hidden" name="CMODELO_AUX" value="${__formdata.DETALLE.CMODELO}"/>
    <input type="hidden" name="CVERSION_AUX" value="${__formdata.DETALLE.CVERSION}"/>
    <input type="hidden" name="REC" value="${__formdata.REC}" />
    <input type="hidden" id="CTIPVEHSEL" name="CTIPVEHSEL" value="" />
    <input type="hidden" id="CMODELOSEL" name="CMODELOSEL" value="" />
    <input type="hidden" id="CMARCASEL" name="CMARCASEL" value="" />
    
    <input type="hidden" name="TPOBLAC" value="${__formdata.DIRECCION.TPOBLAC}" />
    <input type="hidden" name="TPROVIN" value="${__formdata.DIRECCION.TPROVIN}" />
    <input type="hidden" name="TPAIS" value="${__formdata.DIRECCION.TPAIS}" />
    
    <input type="hidden" name="CTIPIDE" value=""/><!--MODIFICADO CON DOCUMENTO-->
    <input type="hidden" name="indexTramitacio" value="${sessionScope.indexTramitacio}"/>
    <!-- PARA CONTROLAR CABECERA DESHABILITADA EN MODO MOD -->
    <c:if test="${__formdata.MOD_TRAM=='MOD'||__formdata.MOD_TRAM=='CONS'}">
        <!--input type="hidden" name="CTCAUSIN" value="${__formdata.CTCAUSIN}"/-->
        <input type="hidden" name="CESTTRA" value="${__formdata.MOVIMIENTO.CESTTRA}"/>
        <input type="hidden" name="CSUBTRA" value="${__formdata.MOVIMIENTO.CSUBTRA}"/>
        <input type="hidden" name="CUNITRA" value="${__formdata.MOVIMIENTO.CUNITRA}"/>
        <input type="hidden" name="CTRAMITAD" value="${__formdata.MOVIMIENTO.CTRAMITAD}"/>
        <input type="hidden" name="TUNITRA" value="${__formdata.MOVIMIENTO.TUNITRA}"/>
        <input type="hidden" name="TTRAMITAD" value="${__formdata.MOVIMIENTO.TTRAMITAD}"/>
        <!--input type="hidden" name="CINFORM" value="${__formdata.MOVIMIENTO.CINFORM}"/-->
    </c:if>
    
    <input type="hidden" name="MOD_TRAM" id="MOD_TRAM" value="${__formdata.MOD_TRAM}" />
    
    <!-- ini bug 0023536 -->
    <input type="hidden" name="OCULCSUBTIPTRA" value="${__formdata.OCULCSUBTIPTRA}"/>
    <!-- fin bug 0023536 -->
    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt c="TITULO" f="axissin007" lit="9000979"/></c:param>
        <c:param name="formulario"><axis:alt c="TITULO" f="axissin007" lit="9000979"/></c:param>
        <c:param name="form">axissin007</c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisctr058|<axis:alt f="axissin006" c="TIT_AXISCTR058" lit="9001258"></axis:alt></c:param>
        </c:import>
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axissin007" c="TIT_AXISPER021" lit="1000235"/></c:param>
                <c:param name="nid" value="axisper021"/>
    </c:import>   
    
    <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axissin007" c="TIT_AXISPER022" lit="1000436"/></c:param>
                <c:param name="nid" value="axisper022"/>
    </c:import>    
    
    <div class="separador">&nbsp;</div>
    <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td> 
       <!-- CTRAMIT -->
                <!-- ******************************************************************************************************** -->
                <!-- ******************************************************************************************************** -->
                <!-- *******************************************  DATOS GENERALES ******************************************* -->
                <!-- ******************************************************************************************************** -->
                <!-- ******************************************************************************************************** -->
                
                <table class="seccion">
                
                    <tr>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                    </tr>
                    <tr>
                    <td class="titulocaja">
                                <b><axis:alt f="axissin007" c="NSINIES_LIT" lit="101298"/></b><!-- Numero de Siniestro-->
                            </td>
                         <axis:ocultar c="CTRAMITA" f="axissin007" dejarHueco="false">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin007" c="CTRAMITA" lit="9001028"/></b><!-- Tipus tramitacio -->
                        </td>
                        </axis:ocultar>
                      <axis:visible c="CTCAUSIN" f="axissin007" >
                        <td class="titulocaja" id="td_CTCAUSIN">
                            <b id="label_CTCAUSIN"><axis:alt f="axissin007" c="CTCAUSIN" lit="9000901" /></b><!-- Tipus dany  -->
                        </td>
                      </axis:visible>
                      <axis:ocultar c="CESTTRA" f="axissin007" dejarHueco="false">
                        <td class="titulocaja">
                            <b id="label_CESTTRA"><axis:alt f="axissin007" c="CESTTRA" lit="100587"/></b><!-- Estado -->
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="CSUBTRA" f="axissin007" dejarHueco="false">
                        <td class="titulocaja">
                            <b id="label_CSUBTRA"><axis:alt f="axissin007" c="CSUBTRA" lit="9902790"/></b><!--Subestado -->
                        </td>
                        </axis:ocultar>
                    </tr>
                    
                    <tr>
                      <td class="campocaja">
                         <input type="text" name="NSINIES_O" id="NSINIES_O"  class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin007" c="NSINIES" a="modificable=false"/> />
                            
                        </td>
                        <axis:ocultar f="axissin007" c="CTRAMITA" dejarHueco="false">
                        <td class="campocaja">
                            <select name="CTRAMITA" id="CTRAMITA"
                                <axis:atr f="axissin007" c="CTRAMITA" a="isInputText=false&obligatorio=true&modificable=true"/> 
                                size="1" onchange="javascript:cambiar_seccion();"  
                                class="campowidthselect campo campotexto_ob" <c:if test="${__formdata.MOD_TRAM=='MOD'||__formdata.MOD_TRAM=='CONS'}">disabled</c:if> 
                                style="width:90%;" title="<axis:alt f='axissin007' c='CTRAMITA' lit='9001028'/>" >
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin007" c="SNV_COMBO" lit="1000348"/> - </option>
                                <c:forEach var="tipotram" items="${listValores.tipo_tramitacion}">
                                    <option value = "${tipotram.CTRAMIT}-${tipotram.CTIPTRA}-${tipotram.CTCAUSIN}" 
                                    <c:if test="${tipotram.CTRAMIT == __formdata.CTRAMIT || __formdata.OB_IAX_SIN_TRAMITACION.CTRAMIT == tipotram.CTRAMIT}"> selected </c:if> />
                                        ${tipotram.TTRAMIT} 
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        </axis:ocultar>
                     <axis:ocultar c="CTCAUSIN" f="axissin007">
                        <td class="campocaja"  id="td_CTCAUSIN" colspan="1">
                            <select name="CTCAUSIN" id="CTCAUSIN" size="1" <axis:atr f="axissin007" c="CTCAUSIN" a="modificable=true&isInputText=false&obligatorio=true"/> class="campowidthselect campo campotexto_ob" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> 
                                   style="width:90%;" title="<axis:alt f='axissin007' c='CTCAUSIN' lit='9000901'/>">
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin007" c="SNV_COMBO" lit="1000348"/> - </option>
                                <c:forEach var="tipotram" items="${listValores.tipo_dano}">
                                    <option value = "${tipotram.CATRIBU}" 
                                    <c:if test="${tipotram.CATRIBU == __formdata.CTCAUSIN || __formdata.OB_IAX_SIN_TRAMITACION.CTCAUSIN == tipotram.CATRIBU}"> selected </c:if> />
                                        ${tipotram.TATRIBU} 
                                    </option>
                                </c:forEach>
                            </select><!-- __formdata.CTCAUSIN -->
                        </td>
                      </axis:ocultar>
                        
                        <td class="campocaja"  id="td_CESTTRA" colspan="1">
                             <select name="CESTTRA" id="CESTTRA" size="1" <axis:atr f="axissin007" c="CESTTRA" a="modificable=true&isInputText=false&obligatorio=true"/> class="campowidthselect campo campotexto_ob" <c:if test="${__formdata.MOD_TRAM=='MOD'||__formdata.MOD_TRAM=='CONS'}">disabled</c:if> 
                             style="width:90%;" title="<axis:alt f='axissin007' c='CESTTRA' lit='100587'/>">
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin007" c="SNV_COMBO" lit="1000348"/> - </option>
                                <c:forEach var="estado" items="${listValores.tipo_estado}">
                                    <option value = "${estado.CATRIBU}" 
                                    <c:if test="${estado.CATRIBU == __formdata.CESTTRA || (estado.CATRIBU == 0 && sessionScope.CMODO =='ALTA_SINIESTROS' && __formdata.MOVIMIENTO.CESTTRA==null) 
                                    || estado.CATRIBU == __formdata.OB_IAX_SIN_TRAMITACION.MOVIMIENTO.CESTTRA}"> selected </c:if> >
                                        ${estado.TATRIBU} 
                                    </option>
                                </c:forEach>
                            </select><!-- __formdata.MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.CESTTRA -->
                        </td>
                        <axis:ocultar f="axissin007" c="CSUBTRA">
                        <td class="campocaja" id="td_CSUBTRA" colspan="1">
                            <select name="CSUBTRA" id="CSUBTRA" size="1"  <axis:atr f="axissin007" c="CSUBTRA" a="obligatorio=true&modificable=true&isInputText=false"/> class="campowidthselect campo campotexto_ob" <c:if test="${__formdata.MOD_TRAM=='MOD'||__formdata.MOD_TRAM=='CONS'}">disabled</c:if> 
                                    style="width:90%;" title="<axis:alt f='axissin007' c='CSUBTRA' lit='9000852'/>">
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin007" c="SNV_COMBO" lit="1000348"/> - </option>
                                <c:forEach var="subestado" items="${listValores.tipo_subestado}">
                                    <option value = "${subestado.CATRIBU}" 
                                    <c:if test="${subestado.CATRIBU == __formdata.CSUBTRA || subestado.CATRIBU == __formdata.OB_IAX_SIN_TRAMITACION.MOVIMIENTO.CSUBTRA}"> selected </c:if> >
                                        ${subestado.TATRIBU} 
                                    </option>
                                </c:forEach>
                            </select><!-- __formdata.MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.CSUBTRA -->
                        </td>
                         </axis:ocultar>
                    </tr>
                    
                    
                    <tr>
                        <td class="titulocaja" id="td_CUNITRA" colspan="1">
                            <b id="label_CUNITRA"><axis:alt f="axissin007" c="CUNITRA" lit="9000900"/></b><!-- Unidad tramitacion -->
                        </td>
                        <td class="titulocaja"  id="td_CTRAMITAD" colspan="1">
                            <b id="label_CTRAMITAD"><axis:alt f="axissin007" c="CTRAMITAD" lit="9910018"/></b><!-- Tramitador -->
                        </td>
                        <axis:visible c="CCULPAB" f="axissin007">
                            <td class="titulocaja"  id="td_CCULPAB" colspan="1">
                                <b id="label_CCULPAB"><axis:alt f="axissin007" c="CCULPAB" lit="1000511"/></b><!-- Tramitación informativa -->
                            </td>
                        </axis:visible>
                        <axis:visible c="CINFORM" f="axissin007">
                        <td class="titulocaja"  id="td_CINFORM" colspan="1">
                            <b id="label_CINFORM"><axis:alt f="axissin007" c="CINFORM" lit="9000905"/></b><!-- Tramitación informativa -->
                            
                        </td>
                        </axis:visible>
                        
                    </tr>
                    <tr>
                         <!-- Unitat Tramitació -->
                        <axis:visible c="CUNITRA" f="axissin007">
                        <td class="campocaja" id="td_CUNITRA" colspan="1">
                            <select name = "CUNITRA" id ="CUNITRA" size="1" onchange="f_cambia_cunitra(this)" 
                            <axis:atr f="axissin007" c="CUNITRA" a="modificable=true&isInputText=false&obligatorio=true"/> 
                            class="campowidthselect campo campotexto_ob" <c:if test="${__formdata.MOD_TRAM=='MOD'||__formdata.MOD_TRAM=='CONS'}">disabled</c:if>>                                                    
                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin007" c="SNV_COMBO" lit="1000348"/> - </option>
                                <c:forEach var="cunitraOp" items="${listValores.lstcunitra}">
                                    <option value = "${cunitraOp.CTRAMITAD}" 
                                    <c:if test="${cunitraOp.CTRAMITAD == __formdata.CUNITRA
                                    || cunitraOp.CTRAMITAD == __formdata.OB_IAX_SIN_TRAMITACION.MOVIMIENTO.CUNITRA
                                    }">selected</c:if>>
                                        ${cunitraOp.TTRAMITAD}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        </axis:visible>  
                               
                        <!-- Tramitador -->
                        <axis:visible c="CTRAMITAD" f="axissin007">                        
                        <td class="campocaja" id="td_CTRAMITAD" colspan="1">
                            <select name = "CTRAMITAD" id ="CTRAMITAD" size="1"
                            <axis:atr f="axissin007" c="CTRAMITAD" a="modificable=true&isInputText=false&obligatorio=true"/> 
                            style="width:80%"
                            class="campowidthselect campo campotexto_ob" <c:if test="${__formdata.MOD_TRAM=='MOD'||__formdata.MOD_TRAM=='CONS'}">disabled</c:if>>                                                    
                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin007" c="SNV_COMBO" lit="1000348"/> - </option>
                                <c:forEach var="ttramitadOp" items="${listValores.lsttramit}">
                                    <option value = "${ttramitadOp.CTRAMITAD}" 
                                    <c:if test="${ttramitadOp.CTRAMITAD == __formdata.CTRAMITAD
                                    || ttramitadOp.CTRAMITAD == __formdata.OB_IAX_SIN_TRAMITACION.MOVIMIENTO.CTRAMITAD
                                    }">selected</c:if>>
                                        ${ttramitadOp.CTRAMITAD} - ${ttramitadOp.TTRAMITAD} 
                                    </option>
                                </c:forEach>
                            </select>
                            <axis:visible c="BT_FIND_PJ" f="axissin007"> 
                         <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axissin067()" style="cursor:pointer"/>      
                        </axis:visible>
                        </td>
                        </axis:visible> 
                        <axis:ocultar f="axissin007" c="CCULPAB">
                                <td class="campocaja" id="td_CCULPAB" colspan="1">
                                    <select  name = "CCULPAB" id ="CCULPAB" size="1" class="campowidthselect campo campotexto">                                                    
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin007" c="SNV_COMBO" lit="1000348"/> - </option>
                                    <c:forEach var="responsOp" items="${__formdata.T_IAX_RESPONSABILIDAD}">
                                        <option value = "${responsOp.CATRIBU}" <c:if test="${ !empty __formdata.OB_IAX_SIN_TRAMITACION.CCULPAB && responsOp.CATRIBU == __formdata.OB_IAX_SIN_TRAMITACION.CCULPAB}">selected</c:if>>
                                                ${responsOp.TATRIBU}
                                        </option>
                                    </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axissin007" c="CINFORM">
                        <td class="campocaja" align="left" id="td_CINFORM" colspan="1">
                        <input type="checkbox"  id="CINFORM" name="CINFORM" onclick="f_onclickCheckbox(this)" <axis:atr f="axissin007" c="CINFORM" a="modificable=true&isInputText=false"/> <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> 
                        value="<c:if test="${!empty __formdata.OB_IAX_SIN_TRAMITACION.CINFORM}">${__formdata.OB_IAX_SIN_TRAMITACION.CINFORM}</c:if><c:if test="${empty __formdata.OB_IAX_SIN_TRAMITACION.CINFORM}">${__formdata.CINFORM}</c:if>"
                        <c:if test="${__formdata.CINFORM == '1' || __formdata.OB_IAX_SIN_TRAMITACION.CINFORM == '1'}">checked</c:if> >
                        </td><!-- __formdata.CINFORM -->
                         
                          </axis:ocultar>                  
                    </tr>
                    <tr>
                    	  <axis:ocultar c="CCOMPANI" f="axissin007" dejarHueco="false">
			                        <td class="titulocaja" id="td_CCOMPANI" colspan="1">
			                            <b id="label_CCOMPANI"><axis:alt f="axissin007" c="CCOMPANI" lit="9000600"/></b><!-- Cia -->
			                        </td>
			                  </axis:ocultar>
			                  <axis:ocultar c="CPOLCIA" f="axissin007" dejarHueco="false">
			                        <td class="titulocaja" id="td_CPOLCIA" colspan="1">
			                            <b id="label_CPOLCIA"><axis:alt f="axissin007" c="CPOLCIA" lit="800242"/></b><!-- No Póliza  -->
			                        </td>
                       </axis:ocultar>
                          <axis:ocultar c="NSINCIA" f="axissin007" dejarHueco="false">
                              <td class="titulocaja" id="td_NSINCIA" colspan="1">
                                    <b id="label_NSINCIA"><axis:alt f="axissin007" c="NSINCIA" lit="9901399" /></b>
                              </td>
                        </axis:ocultar>
                        <axis:ocultar c="IPERIT" f="axissin007" dejarHueco="false">
				                      <td class="titulocaja" id="td_IPERIT" colspan="1">
				                            <b id="label_IPERIT"><axis:alt f="axissin007" c="IPERIT" lit="9000904"/></b><!-- I Peritaje -->
				                      </td>
				                </axis:ocultar>                            
                        <!-- bug 0023536 -->
                        <axis:ocultar c="IRECLAM" f="axissin007" dejarHueco="false">
                        <td class="titulocaja"  id="td_IRECLAM"  >
                            <b id="label_IRECLAM"><axis:alt c="IRECLAM" f="axissin007" lit="9904304"/></b><!-- Importe reclamado -->
                        </td>
                        </axis:ocultar>
                        <!-- bug 0023536 -->
                        <axis:ocultar c="IINDEMN" f="axissin007" dejarHueco="false">
                        <td class="titulocaja"  id="td_IINDEMN"  >
                            <b id="label_IINDEMN"><axis:alt c="IINDEMN" f="axissin007" lit="9904305"/></b><!-- Importe indemnizado 9904305 -->
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="NRADICA" f="axissin007" dejarHueco="false">
                              <td class="titulocaja" id="td_NRADICA" colspan="1">
                                    <b id="label_NRADICA"><axis:alt f="axissin007" c="NRADICA" lit="9909199" /></b>
                              </td>
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <axis:visible f="axissin007" c="CCOMPANI">
			                       <td class="campocaja" id="td_CCOMPANI" colspan="1">
			                            <select name="CCOMPANI" id="CCOMPANI" <axis:atr f="axissin007" c="CCOMPANI" a="modificable=true&isInputText=false&obligatorio=true"/> size="1" class="campowidthselect campo campotexto" style="width:90%;" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> >
			                                <option value = "-1"> - <axis:alt f="axissin007" c="SNV_COMBO" lit="1000348"/> - </option>
			                                <c:forEach var="cia" items="${listValores.tipo_cia}">
			                                    <option value = "${cia.CCOMPANI}" 
			                                    <c:if test="${cia.CCOMPANI == __formdata.OB_IAX_SIN_TRAMITACION.CCOMPANI}"> selected </c:if> />
			                                        ${cia.TCOMPANI} 
			                                    </option>
			                                </c:forEach>
			                            </select>
			                        </td>
                        </axis:visible>
                        <axis:visible f="axissin007" c="CPOLCIA">
			                        <td class="campocaja" id="td_CPOLCIA">
			                            <input type="text" name="CPOLCIA" id="CPOLCIA" value="${__formdata.OB_IAX_SIN_TRAMITACION.CPOLCIA}" class="campowidthinput campo campotexto" style="width:90%" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if>
			                            <axis:atr f="axissin007" c="CPOLCIA" a="modificable=true&obligatorio=false"/> />
			                        </td>
                        </axis:visible>
                        <axis:visible f="axissin007" c="NSINCIA">
                              <td class="campocaja"  id="td_NSINCIA">
                                    <input  tabindex="36" type="text" class="campowidthinput campo campotexto" id="NSINCIA" name="NSINCIA" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if>
                                    <axis:atr f="axissin007" c="NSINCIA" a="modificable=true&obligatorio=false"/> size="15"  value="${__formdata.OB_IAX_SIN_TRAMITACION.NSINCIA}"/>
                              </td>
                        </axis:visible>
                        <axis:visible f="axissin007" c="IPERIT">
                            <td class="campocaja"   id="td_IPERIT">
                                 <input type="text" name="IPERIT" id="IPERIT" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.OB_IAX_SIN_TRAMITACION.IPERIT}"/>" class="campowidthinput campo campotexto" style="width:90%" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if>
                                <axis:atr f="axissin007" c="IPERIT" a="modificable=true&obligatorio=false"/> />
                            </td>
                        </axis:visible>
                        <!-- bug 0023536 -->
                        <axis:ocultar f="axissin007" c="IRECLAM">
                            <td class="campocaja" id="td_IRECLAM">
                                 <input type="text" name="IRECLAM" id="IRECLAM" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.DETALLE.IRECLAM}"/>" class="campowidthinput campo campotexto" style="width:90%" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if>
                                <axis:atr f="axissin007" c="IRECLAM" a="modificable=true&obligatorio=false"/> />
                            </td>
                        </axis:ocultar>
                        <!-- bug 0023536 -->
                        <axis:ocultar f="axissin007" c="IINDEMN">
                            <td class="campocaja" id="td_IINDEMN">
                                 <input type="text" name="IINDEMN" id="IINDEMN" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.DETALLE.IINDEMN}"/>" class="campowidthinput campo campotexto" style="width:90%" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if>
                                <axis:atr f="axissin007" c="IINDEMN" a="modificable=true&obligatorio=false"/> />
                            </td>
                        </axis:ocultar>
                        <axis:visible f="axissin007" c="NRADICA">
                              <td class="campocaja"  id="td_NRADICA">
                                    <input type="text" class="campowidthinput campo campotexto" id="NRADICA" name="NRADICA" 
                                    <axis:atr f="axissin007" c="NRADICA" a="modificable=true&obligatorio=false"/>  value="${__formdata.OB_IAX_SIN_TRAMITACION.NRADICA}"/>
                              </td>
                        </axis:visible>
                    </tr>
                </table>
                <div class="separador">&nbsp;</div>
                  
                <!-- ******************************************************************************************************** -->
                <!-- ******************************************************************************************************** -->
                <!-- *******************************************  SECCION TIPO 4 ******************************************* -->
                <!-- ******************************************************************************************************** -->
                <!-- ******************************************************************************************************** -->
              
                <c:if test="${tipo_tram=='4'}">
                <div id="seccion_descripcion" ><!-- style="display:none" -->
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin007" c="TIPO4" lit="100588"/></div>
                
                
                
                <table class="seccion">
                    <tr>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                    </tr>
                    <tr>
                        <!-- Tipo documento -->
                        <td class="titulocaja">
                             <b><axis:alt f="axissin007" c="SPERSON" lit="105330" /></b>
                        </td>
                        <!-- Número documento -->
                        <td class="titulocaja">
                             <b><axis:alt f="axissin007" c="NOMBRE" lit="105940" /></b>
                        </td>
                        <!-- Nombre -->
                        <td class="titulocaja">
                             
                        </td>
                        <!-- Estat persona --> 
                        <td class="titulocaja">
                           
                        </td>
                    </tr>
                    <tr>
                        <td class="campocaja">
                                <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}" class="campowidthinput campo campotexto_ob" style="width:70%" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if>
                                <axis:atr f="axissin007" c="SPERSON" a="modificable=true"/> /> 
                                <input type="text" name="NNUMIDE" value="${__formdata.DETALLE.PERSONA.NNUMIDE}" class="campowidthinput campo campotexto_ob" style="width:70%"
                                <axis:atr f="axissin007" c="NNUMIDE" a="modificable=false&obligatorio=true"/> /> 
                                <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisper021()" style="cursor:pointer"/>  
                        </td>
                        <td class="campocaja" colspan="2">
                                <input type="text" name="NOMBRE" value="${__formdata.DETALLE.PERSONA.TNOMBRE}" class="campowidthinput campo campotexto_ob" style="width:90%" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if>
                                <axis:atr f="axissin007" c="NOMBRE" a="modificable=false&obligatorio=true"/> /> 
                        </td>
                        <td></td>
                        
                    </tr>
                    <!-- ini bug 0023536 -->
                    <axis:ocultar c="CSUBTIPTRA" f="axissin007">
                    <c:if test="${__formdata.OCULCSUBTIPTRA == 0}">
                    <tr>
                        <td class="titulocaja">
                            <b><axis:alt f="axissin007" c="TSUBTIPTRA" lit="9904233"/></b><!-- Subtipo de tramitacion  -->
                        </td>
                    </tr>
                         <axis:visible f="axissin007" c="CCOMPANI">
			                        <td class="campocaja">
			                            <select name="CCOMPANI" id="CCOMPANI" <axis:atr f="axissin007" c="CCOMPANI" a="modificable=true&isInputText=false&obligatorio=true"/> size="1" class="campowidthselect campo campotexto" style="width:90%;" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> >
			                                <option value = "-1"> - <axis:alt f="axissin007" c="SNV_COMBO" lit="1000348"/> - </option>
			                                <c:forEach var="cia" items="${listValores.tipo_cia}">
			                                    <option value = "${cia.CCOMPANI}" 
			                                    <c:if test="${cia.CCOMPANI == __formdata.OB_IAX_SIN_TRAMITACION.CCOMPANI}"> selected </c:if> />
			                                        ${cia.TCOMPANI} 
			                                    </option>
			                                </c:forEach>
			                            </select>
			                        </td>
                        </axis:visible>
                    
                    <tr>
                        <td class="campocaja"> 
                            <select name="CSUBTIPTRA" id="CSUBTIPTRA" size="1"  <axis:atr f="axissin007" c="CSUBTIPTRA" a="obligatorio=false&modificable=true&isInputText=false"/> class="campowidthselect campo campotexto_ob" <c:if test="${__formdata.MOD_TRAM=='MOD'||__formdata.MOD_TRAM=='CONS'}">disabled</c:if> 
                                    style="width:90%;" title="<axis:alt f='axissin007' c='CSUBTIPTRA' lit='9904233'/>">
                                <option value = "-1"> - <axis:alt f="axissin007" c="SNV_COMBO" lit="1000348"/> - </option>
                                <c:forEach var="varsubtipotra" items="${listValores.subtipo_tramitacion}">
                                    <option value = "${varsubtipotra.CATRIBU}" 
                                    <c:if test="${varsubtipotra.CATRIBU == __formdata.OB_IAX_SIN_TRAMITACION.CSUBTIPTRA }"> selected </c:if> />
                                        ${varsubtipotra.TATRIBU} 
                                    </option>
                                </c:forEach>
                            </select><!-- __formdata.MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.CSUBTIPTRA -->
                        </td>
                    </tr>
                    </c:if>
                    </axis:ocultar>
                    <!-- fin bug 0023536 -->
                    
                    <tr>
                    <!-- Descripción Tramitacion -->
                        <td class="titulocaja">
                           <!-- bug 0023536 literal 9001147 por 100588 -->
                           <b><axis:alt f="axissin007" c="DESCTRAMIT" lit="100588" /></b>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" style="width:100%;"  class="campocaja"> 
                            <textarea class="campo campotexto" <axis:atr f="axissin007" c="DESCTRAMIT" a="modificable=true&isInputText=false"/> <c:if test="${__formdata.MOD_TRAM=='CONS'}">readonly</c:if> style="width:100%;"  name="DESCTRAMIT" onkeydown=" if(this.value.length>= 500 && event.keyCode != 8 && event.keyCode != 46){return false;}"  id="DESCTRAMIT">${__formdata.DETALLE.DESCTRAMIT}</textarea>
                        </td>
                    </tr>
                </table>
                
                </c:if>
                
                </div><!-- Fin seccion ocultable descripcion -->
                
                <!-- ******************************************************************************************************** -->
                <!-- ******************************************************************************************************** -->
                <!-- ******************************************* SECCION TIPO 3 ******************************************* -->
                <!-- ******************************************************************************************************** -->
                <!-- ******************************************************************************************************** -->
                
                <c:if test="${tipo_tram==3}">
                
                <div class="separador">&nbsp;</div>
                
                <div id="seccion_persona" ><!-- style="display:none" -->
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin007" c="SECCIO_PERSONA" lit="111523"/></div>
                
                
                <table class="seccion">
                    <tr>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                    </tr>
                    <tr>
                        <!-- Tipo documento -->
                        <td class="titulocaja">
                             <b><axis:alt f="axissin007" c="NNUMIDE" lit="105330" /></b>
                        </td>
                        <!-- Número documento -->
                        <td class="titulocaja">
                             <b><axis:alt f="axissin007" c="NOMBRE" lit="105940" /></b>
                        </td>
                        <!-- Nombre -->
                        <td class="titulocaja">
                             
                        </td>
                        <!-- Estat persona --> 
                        <td class="titulocaja">
                           
                        </td>
                    </tr>
                    <tr>
                       
                        <td class="campocaja">
                                <input type="hidden" name="SPERSON" value="${__formdata.DETALLE.PERSONA.SPERSON}" class="campowidthinput campo campotexto_ob" style="width:70%" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if>
                                <axis:atr f="axissin007" c="SPERSON" a="modificable=true"/> /> 
                                <input type="text" name="NNUMIDE" value="${__formdata.DETALLE.PERSONA.NNUMIDE}" class="campowidthinput campo campotexto_ob" style="width:70%"
                                <axis:atr f="axissin007" c="NNUMIDE" a="modificable=false&obligatorio=true"/> /> 
                                <c:if test="${__formdata.MOD_TRAM !='CONS'}">
                                <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisper021()" style="cursor:pointer"/>  
                                </c:if>
                        </td>
                        <td class="campocaja" colspan="2">
                                <input type="text" name="NOMBRE" value="${__formdata.DETALLE.PERSONA.TNOMBRE}" class="campowidthinput campo campotexto_ob" style="width:90%" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if>
                                <axis:atr f="axissin007" c="NOMBRE" a="modificable=false&obligatorio=true"/> /> 
                        </td>
                        <td></td>
                        
                    </tr>
                    
                    <tr>
                        <td class="titulocaja"><!-- -->
                            <b><axis:alt f="axissin007" c="CESTPER" lit="9000793"/></b><!-- Estado persona -->
                        </td>
                    </tr>
                    <tr>
                        <td class="campocaja">
                             <select name="CESTPER" id="CESTPER" size="1" <axis:atr f="axissin007" c="CESTPER" a="modificable=true&isInputText=false&obligatorio=true"/> class="campowidthselect campo campotexto" style="width:90%;"   <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if>> 
                                <option value = "-1"> - <axis:alt f="axissin007" c="SNV_COMBO" lit="1000348"/> - </option>
                                <c:forEach var="est_persona" items="${listValores.tipo_estado_persona}">
                                    <option value = "${est_persona.CATRIBU}" 
                                    <c:if test="${est_persona.CATRIBU == __formdata.DETALLE.CESTPER}"> selected </c:if> />
                                        ${est_persona.TATRIBU} 
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    
                    <tr>
                    <!-- Descripción Tramitacion -->
                        <td class="titulocaja">
                           <b><axis:alt f="axissin007" c="DESCTRAMIT" lit="9001147" /></b>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" style="width:100%;"  class="campocaja"> 
                            <textarea class="campo campotexto" <axis:atr f="axissin007" c="DESCTRAMIT" a="modificable=true&isInputText=false"/> style="width:100%;" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> name="DESCTRAMIT" onkeydown=" if(this.value.length>= 500 && event.keyCode != 8 && event.keyCode != 46){return false;}" id="DESCTRAMIT">${__formdata.DETALLE.DESCTRAMIT}</textarea>
                        </td>
                    </tr>
                </table>
                
                </c:if>
                
                </div><!-- Fin de seccion ocultable persona -->
                
                <!-- ******************************************************************************************************** -->
                <!-- ******************************************************************************************************** -->
                <!-- *******************************************  SECCION TIPO 5  ******************************************* -->
                <!-- ******************************************************************************************************** -->
                <!-- ******************************************************************************************************** -->
               
                <c:if test="${tipo_tram==5}">
                <div class="separador">&nbsp;</div>
                <div id="seccion_direccion"><!-- style="display:none" -->
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin007" c="SECCION_DIRECCION" lit="9000914"/></div>
                
                <table class="seccion">
                    <tr>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                    </tr>
                    <tr>
                                <!-- Tipo documento -->
                                 <td class="titulocaja">
                                    <b><axis:alt f="axissin007" c="NNUMIDE" lit="105330" /></b>
                                </td>
                                <!-- Número documento -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin007" c="NOMBRE" lit="105940" /></b>
                                </td>
                                <!-- Nombre -->
                                <td class="titulocaja" colspan="2">
                                    
                                </td>
                                <td class="titulocaja">
                                    
                                </td>                                  
                            </tr>
                            <tr>
                          
                            <td class="campocaja">
                                <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}"  class="campowidthinput campo campotexto_ob" style="width:70%"
                                <axis:atr f="axissin007" c="SPERSON" a="modificable=true"/> /> 
                                <input type="text" name="NNUMIDE" value="${__formdata.NNUMIDE}" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> class="campowidthinput campo campotexto_ob" style="width:70%"
                                <axis:atr f="axissin007" c="NNUMIDE" a="modificable=false&obligatorio=true"/> /> 
                                <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisper021()" style="cursor:pointer" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if>/>  
                            </td>
                            <td class="campocaja" colspan="2">
                                <input type="text" name="NOMBRE" value="${__formdata.NOMBRE}" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> class="campowidthinput campo campotexto_ob" style="width:90%"
                                <axis:atr f="axissin007" c="NOMBRE" a="modificable=false&obligatorio=true"/> /> 
                            </td>
                        <td></td>
                            <td></td>
                                                             
                            </tr>                            
                            
                            <tr>
                                <!-- Lugar Ocurrencia -->
                                 
                                 <td colspan="5">
                                        <table class="area" align="center">
                                            <tr>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                            </tr>
                                           
                            
                            <!-- *************************************************************************************-->
                            <!-- *************************** SECCION NUEVA DIRECCION *********************************-->
                            <!-- *************************************************************************************-->
                            <axis:ocultar c="LOCALI" f="axissin017" dejarHueco="false">
                            <tr>
                                <!-- Zona Ocurrencia -->
                                
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin007" c="NLOCALI" lit="110492" /></b>
                                </td>
                            </tr>
                            <tr>
                                <!-- Lugar Ocurrencia -->
                                 
                                 <td colspan="4"> <!-- colspan="5" -->
                                 <input   type="hidden"  id="NLOCALI" name="NLOCALI" size="15"  value="${__formdata.LOCALIZA.NLOCALI}"/>
                                        <table class="area" align="center">
                                            <tr>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                            </tr>
                                            <!-- Inicio Seccion -->
                                            <tr>
                                                <td class="titulocaja" colspan="4">
                                                
                                                   <input value="0" type="radio"  id="radioLocaliza" name="radioLocaliza" onclick="f_verifica_textarea(this.value);" <c:if test="${!empty __formdata.DETALLE.TDESCDIRECCION}">checked</c:if>
                                                   <c:if test="${ __formdata.MOD_TRAM=='CONS'}">disabled</c:if> />
                                                   <b><axis:alt f="axissin007" c="radioLocaliza" lit="100588" /></b> 
                                                </td>
                                            </tr>
                                            <tr>
                                            <td colspan="4">
                                            <table id="textTlocali">
                                            <tr>
                                               <td colspan="4" style="width:100%;" class="campocaja">
                                                    <textarea class="campowidthinput campo campotexto_ob" style="width:100%;" onkeydown=" if(this.value.length>= 100 && event.keyCode != 8 && event.keyCode != 46){return false;}" name="TLOCALI" id="TLOCALI">${__formdata.DETALLE.TDESCDIRECCION}</textarea>
                                                </td>
                                            </tr>
                                             </table>
                                            </div>
                                            </td>
                                            </tr>
                                            <tr>
                                                <td class="titulocaja" colspan="4">
                                                    <input value="1" type="radio" id="radioLocaliza" name="radioLocaliza" onclick="f_verifica_textarea(this.value);"  <c:if test="${empty __formdata.DETALLE.TDESCDIRECCION}">checked</c:if> <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if>/>
                                                    <b><axis:alt f="axissin007" c="radioLocaliza2" lit="9000914" /></b>
                                                </td>
                                            </tr>

                                            
                                            <tr>
                                            <td colspan="4">
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
                                                    <b><axis:alt f="axissin007" c="CSIGLAS" lit="110028" /></b>
                                                </td>
                                                
                                                <!-- Nombre -->
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin007" c="TNOMVIA" lit="110029" /></b>
                                                </td>
                                                <!-- Número -->
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin007" c="NNUMVIA" lit="800440" /></b>
                                                </td>
                                                <!--  Otros -->
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin007" c="TCOMPLE" lit="110031" /></b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <!-- Tipo via -->
                                                <td class="campocaja">
                                                    <select name="CSIGLAS" id="CSIGLAS" size="1" class="campowidthselect campo campotexto_ob" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> style="width:80%;">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin007" c="SNV_COMBO" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${listValores.lstTipoVia}">
                                                            <option value = "${element.CSIGLAS}" 
                                                            <c:if test="${element.CSIGLAS == __formdata.DIRECCION.CSIGLAS || element.CSIGLAS == __formdata.CSIGLAS}"> selected </c:if> />
                                                                ${element.TDENOM} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                                
                                                 <!-- Nombre -->
                                                <td class="campocaja">
                                                    <input   type="text" class="campowidthinput campo campotexto_ob" onkeydown=" if(this.value.length>= 200 && event.keyCode != 8 && event.keyCode != 46){return false;}" id="TNOMVIA" name="TNOMVIA" size="15" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if>  
                                                    value="<c:if test="${!empty __formdata.DIRECCION.TNOMVIA}">${__formdata.DIRECCION.TNOMVIA}</c:if><c:if test="${empty __formdata.DIRECCION.TNOMVIA}">${__formdata.TNOMVIA}</c:if>"/>
                                                </td>
                                                <!-- Número -->
                                                <td class="campocaja">
                                                    <input   type="text" class="campowidthinput campo campotexto_ob" id="NNUMVIA" name="NNUMVIA" size="15" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if>  
                                                    value="<c:if test="${!empty __formdata.DIRECCION.NNUMVIA}">${__formdata.DIRECCION.NNUMVIA}</c:if><c:if test="${empty __formdata.DIRECCION.NNUMVIA}">${__formdata.NNUMVIA}</c:if>"/>
                                                </td>
                                                <!-- Otros -->
                                                <td class="campocaja" colspan="2">
                                                    <input    type="text" class="campowidthinput campo campotexto_ob" onkeydown=" if(this.value.length>= 100 && event.keyCode != 8 && event.keyCode != 46){return false;}" id="TCOMPLE" maxlength="100"  name="TCOMPLE" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> 
                                                    value="<c:if test="${!empty __formdata.DIRECCION.TCOMPLE}">${__formdata.DIRECCION.TCOMPLE}</c:if><c:if test="${empty __formdata.DIRECCION.TCOMPLE}">${__formdata.TCOMPLE}</c:if>"/>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <!-- C.P -->
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin007" c="CPOSTAL" lit="101081" /></b>
                                                </td>
                                                
                                                <!-- Pais -->
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin007" c="TPAIS" lit="100816" /></b>
                                                </td>
                                                <!-- Provincia -->
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin007" c="TPROVIN" lit="100756" /></b>
                                                </td>
                                                <!--  Población -->
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin007" c="TPOBLAC" lit="100817" /></b>
                                                </td>
                                            </tr>
                                            <tr>
                                                 <!-- C.P -->
                                               <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="<c:if test="${!empty __formdata.DIRECCION.CPOSTAL}">${__formdata.DIRECCION.CPOSTAL}</c:if><c:if test="${empty __formdata.DIRECCION.CPOSTAL}">${__formdata.CPOSTAL}</c:if>" name="CPOSTAL" id="CPOSTAL" 
                                                    style="text-transform:uppercase;width:60%;" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> onblur="f_onblur_CPOSTAL(this.value)"/>
													&nbsp;
													<axis:ocultar c="CPOSTALFIND" f="axissin007" dejarHueco="false">
														<img id="findCpostal" border="0" src="images/find.gif" onclick="f_abrir_axisper042();" style="cursor:pointer" alt=""/>
													</axis:ocultar>
                                                </td>                                
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto_ob" size="3" maxlength="3" value="<c:if test="${!empty __formdata.DIRECCION.CPAIS}">${__formdata.DIRECCION.CPAIS}</c:if><c:if test="${empty __formdata.DIRECCION.CPAIS}">${__formdata.CPAIS}</c:if>" name="CPAIS" id="CPAIS"  <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if>   onchange="f_onchange_CPAIS()" style="width:18%;" />&nbsp;<img id="findPais" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS', null)" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> style="cursor:pointer"/>
                                                    &nbsp;<span id="TPAIS_span"><b><c:if test="${!empty __formdata.DIRECCION.TPAIS}">${__formdata.DIRECCION.TPAIS}</c:if><c:if test="${empty __formdata.DIRECCION.TPAIS}">${__formdata.TPAIS}</c:if></b></span>
                                                </td>
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto_ob" size="15" maxlength="3" value="<c:if test="${!empty __formdata.DIRECCION.CPROVIN}">${__formdata.DIRECCION.CPROVIN}</c:if><c:if test="${empty __formdata.DIRECCION.CPROVIN}">${__formdata.CPROVIN}</c:if>"  name="CPROVIN" id="CPROVIN"   <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> onchange="f_onchange_CPROVIN()" style="width:18%;"  />
                                                    &nbsp;<img id="findProvincia" style="visibility:${(empty __formdata.CPAIS && empty __formdata.DIRECCION.CPAIS)? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', document.miForm.CPAIS.value)" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if>/>                
                                                    &nbsp;<span id="TPROVIN_span"><b><c:if test="${!empty __formdata.DIRECCION.TPROVIN}">${__formdata.DIRECCION.TPROVIN}</c:if><c:if test="${empty __formdata.DIRECCION.TPROVIN}">${__formdata.TPROVIN}</c:if></b></span>
                                                </td>
                                                
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto_ob" size="15" maxlength="5" value="<c:if test="${!empty __formdata.DIRECCION.CPOBLAC}">${__formdata.DIRECCION.CPOBLAC}</c:if><c:if test="${empty __formdata.DIRECCION.CPOBLAC}">${__formdata.CPOBLAC}</c:if>" name="CPOBLAC" id="CPOBLAC"  <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if>  onchange="f_onchange_CPOBLAC()" style="width:18%;" />
                                                    &nbsp;<img id="findPoblacion" style="visibility:${ (empty __formdata.CPROVIN && empty __formdata.DIRECCION.CPROVIN) ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION', document.miForm.CPROVIN.value,document.miForm.CPOSTAL.value)" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if>/>                
                                                    &nbsp;<span id="TPOBLAC_span"><b><c:if test="${!empty __formdata.DIRECCION.TPOBLAC}">${__formdata.DIRECCION.TPOBLAC}</c:if><c:if test="${empty __formdata.DIRECCION.TPOBLAC}">${__formdata.TPOBLAC}</c:if></b></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <axis:visible c="FGISX" f="AXISSIN007">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin007" c="FGISX" lit="9901026"/></b>
                                                    </td>
                                                </axis:visible>
                                                <axis:visible c="FGISY" f="AXISSIN007">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin007" c="FGISY" lit="9901027"/></b>
                                                    </td>
                                                </axis:visible>
                                                <axis:visible c="FGISZ" f="AXISSIN007">
                                                    <td class="titulocaja">                                    
                                                        <b><axis:alt f="axissin007" c="FGISZ" lit="9901028"/></b>
                                                    </td>
                                                </axis:visible>
                                            </tr>
                                            <tr>
                                                <axis:visible c="FGISX" f="AXISSIN007">
                                                    <td class="campocaja">
                                                        <input type="text" class="campowidthinput campo campotexto" size="15" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if>
                                                                value="<c:if test="${!empty __formdata.DIRECCION.FGISX}">${__formdata.DIRECCION.FGISX}</c:if><c:if test="${empty __formdata.DIRECCION.FGISX}">${__formdata.FGISX}</c:if>" name="FGISX" id="FGISX" style="width:25%;"/>
                                                    </td>
                                                </axis:visible>
                                                <axis:visible c="FGISY" f="AXISSIN007">
                                                    <td class="campocaja">
                                                        <input type="text" class="campowidthinput campo campotexto" size="15" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if>
                                                                value="<c:if test="${!empty __formdata.DIRECCION.FGISY}">${__formdata.DIRECCION.FGISY}</c:if><c:if test="${empty __formdata.DIRECCION.FGISY}">${__formdata.FGISY}</c:if>" name="FGISY" id="FGISY" style="width:25%;"/>
                                                    </td>
                                                </axis:visible>
                                                <axis:visible c="FGISZ" f="AXISSIN007">
                                                    <td class="campocaja">
                                                        <input type="text" class="campowidthinput campo campotexto" size="15" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if>
                                                            value="<c:if test="${!empty __formdata.DIRECCION.FGISZ}">${__formdata.DIRECCION.FGISZ}</c:if><c:if test="${empty __formdata.DIRECCION.FGISZ}">${__formdata.FGISZ}</c:if>" name="FGISZ" id="FGISZ" style="width:25%;"/>
                                                            
                                                    </td>  
                                                </axis:visible>
                                            </tr>
                                            <tr>
                                            <td style="text"> 
                                                    <div class="separador">&nbsp;</div>
                                                    <input type="button" class="boton" id="but_mas_recibos" value="<axis:alt f="axissin007" c="RECIBOS" lit="9900859" />" onclick="f_datosriesgo()" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> />
                                                </td>
                                            </tr>
                                            
                                            
                                            
                                        </table>
                                      <%--  </div>--%>
                                        </td>
                                        </tr>
                                        </table>
                                 </td>
                                 
                            </tr>
                            </axis:ocultar>
                            <!-- ***************************************************************************************-->
                            <!-- ******************************* SECCION NUEVA DIRECCION *******************************-->
                            <div class="separador">&nbsp;</div>
                            <tr>
                             <!-- Descripción del tramitacion -->
                               
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin007" c="DESCTRAMIT" lit="9001147" /></b>
                                </td>
                            </tr>
                            <tr>
                            <!-- Descripción del tramitacion -->
                                 <td colspan="5" style="width:100%;"  class="campocaja"> 
                                     <textarea class="campo campotexto" <axis:atr f="axissin007" c="DESCTRAMIT" a="modificable=true&isInputText=false"/> <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> style="width:100%;" onkeydown=" if(this.value.length>= 500 && event.keyCode != 8 && event.keyCode != 46){return false;}" name="DESCTRAMIT" id="DESCTRAMIT">${__formdata.OB_IAX_SIN_TRAMITACION.DETALLE.DESCTRAMIT}</textarea>
                                 </td>
                            </tr>
                </table>
                
                </c:if>
                
                </div><!-- Fin de seccion vehiculo -->
                
                <!-- ******************************************************************************************************** -->
                <!-- ******************************************************************************************************** -->
                <!-- *******************************************  SECCION TIPO 1/2 ****************************************** -->
                <!-- ******************************************************************************************************** -->
                <!-- ******************************************************************************************************** -->
                
                <c:if test="${tipo_tram==1 || tipo_tram==2}"> <!-- __formdata.CTRAMIT -->
                <div class="separador">&nbsp;</div>
                <div id="seccion_vehiculo"><!-- style="display:none" -->
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin007" c="TIT_VEHICULO" lit="9001026"/></div>
                
                <table class="seccion">
                    <tr>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                    </tr>
                    <tr>
                                <!-- Tipo documento -->
                                 <td class="titulocaja">
                                    <b><axis:alt f="axissin007" c="SPERSON" lit="105330" /></b>
                                </td>
                                <!-- Número documento -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin007" c="NOMBRE" lit="105940" /></b>
                                </td>
                                <!-- Nombre -->
                                <td class="titulocaja" colspan="2">
                                    
                                </td>
                                <td class="titulocaja">
                                    
                                </td>                  
                            </tr>
                            <tr>
                                <!-- Tipo documento -->
                                <td class="campocaja">
                                    <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}"  class="campowidthinput campo campotexto_ob" style="width:70%"
                                    <axis:atr f="axissin007" c="SPERSON" a="modificable=true"/> /> 
                                    <input type="text" name="NNUMIDE" value="${__formdata.DETALLE.PERSONA.NNUMIDE}" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> class="campowidthinput campo campotexto_ob" style="width:70%"
                                    <axis:atr f="axissin007" c="NNUMIDE" a="modificable=false&obligatorio=true"/> /> 
                                    <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisper021()" style="cursor:pointer"/>  
                                </td>
                                <td class="campocaja" colspan="2">
                                    <input type="text" name="NOMBRE" value="${__formdata.DETALLE.PERSONA.TNOMBRE}" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> class="campowidthinput campo campotexto_ob" style="width:90%"
                                    <axis:atr f="axissin007" c="NOMBRE" a="modificable=false&obligatorio=true"/> /> 
                                </td>
                                <td class="campocaja"></td>
                                <td class="campocaja"></td>
                            </tr>   
                   <tr>
                        <axis:ocultar f="axissin007" c="CVERSION" dejarHueco="false">
                        <td class="titulocaja">
                            <b><axis:alt c="CVERSION" f="axissin007" lit="9904186" /></b>
                        </td>
                        </axis:ocultar>   
                        <td></td>
                        <td class="titulocaja">
                            <b><axis:alt f="axissin007" c="CTIPMAT" lit="9001044"/></b><!-- Tipo Matricula -->
                        </td>
                        <td class="titulocaja">
                            <b><axis:alt f="axissin007" c="CMATRIC" lit="9001045"/></b><!-- matricula -->
                        </td>
                    </tr>
                   <tr>
                        <axis:ocultar f="axissin007" c="CVERSION" dejarHueco="false">
                        <td class="campocaja">
                            <input type="text" name="CVERSION" id="CVERSION" onchange="f_recuperar_version()" 
                                   value="${__formdata.DETALLE.CVERSION}"  class="campowidthinput campo campotexto"
                                   title="<axis:alt c="CVERSION" f="axissin007" lit="9001146" />"
                                   <c:if test="${tipo_tram==1}">
                                   <axis:atr f="axissin007" c="CVERSION" a="obligatorio=true&modificable=false"/>
                                   </c:if>
                                   <c:if test="${tipo_tram!=1}">
                                   <axis:atr f="axissin007" c="CVERSION" a="obligatorio=true&modificable=true"/>
                                   </c:if>
                                   />
                        </td>  
                        </axis:ocultar>  
                        <td class="campocaja">
                            <input type="text" name="TVERSION" id="TVERSION"  value="${__formdata.DETALLE.TVERSION}" style="background-color:transparent;border:0px;font-weight:bold;color:orange" class="campowidthinput campo campotexto" disabled/> 
                        </td>
                        <axis:ocultar f="axissin007" c="CTIPMAT" dejarHueco="false">
                        <td class="campocaja">
                              <select name="CTIPMAT" id="CTIPMAT" 
                                <c:if test="${tipo_tram==1}">
                               <axis:atr f="axissin007" c="CTIPMAT" a="obligatorio=true&modificable=false&isInputText=false"/>
                               </c:if>
                               <c:if test="${tipo_tram!=1}">
                               <axis:atr f="axissin007" c="CTIPMAT" a="obligatorio=true&modificable=true&isInputText=false"/>
                               </c:if>
                                 size="1" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> class="campowidthselect campo campotexto" style="width:90%;">
                                <option value = "-1"> - <axis:alt f="axissin007" c="SNV_COMBO" lit="1000348"/> - </option>
                                <c:forEach var="tipomat" items="${listValores.tipo_matricula}">
                                    <option value = "${tipomat.CATRIBU}" 
                                    <c:if test="${tipomat.CATRIBU == __formdata.DETALLE.CTIPMAT}"> selected </c:if> />
                                        ${tipomat.TATRIBU} 
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        </axis:ocultar>  
                        <axis:ocultar f="axissin007" c="CMATRIC" dejarHueco="false">
                        <td class="campocaja">
                            <input type="text" name="CMATRIC" id="CMATRIC" value="${__formdata.DETALLE.CMATRIC}" class="campowidthinput campo campotexto" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> style="width:90%"
                             <c:if test="${tipo_tram==1}">
                           <axis:atr f="axissin007" c="CMATRIC" a="&modificable=false"/>
                           </c:if>
                           <c:if test="${tipo_tram!=1}">
                           <axis:atr f="axissin007" c="CMATRIC" a="&modificable=true"/>
                           </c:if>
                        </td>
                        </axis:ocultar>  
                   </tr>
                   <tr>
                        <axis:ocultar f="axissin007" c="CMARCA" dejarHueco="false">
                        <!-- Marca -->
                        <td class="titulocaja">
                            <b><axis:alt c="CMARCA" f="axissin007" lit="9001046" /></b>
                        </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin007" c="CTIPVEH" dejarHueco="false">
                        <!-- tipo vehicle -->
                        <td class="titulocaja">
                            <b><axis:alt c="CTIPVEH" f="axissin007" lit="9001059" /></b>
                        </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin007" c="CMODELO" dejarHueco="false">
                        <!-- Model -->
                        <td class="titulocaja" id="LCMODELO">
                            <b><axis:alt c="CMODELO" f="axissin007" lit="108515" /></b>
                        </td> 
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <axis:ocultar f="axissin007" c="CMARCA" dejarHueco="false">
                        <td class="campocaja">
                            <select name = "CMARCA" id="CMARCA"   size="1" onchange="limpiar_cambio_tipo();f_llenar_tipo(this.value)" 
                                    title="<axis:alt c="CMARCA" f="axissin007" lit="9001046" />"
                                    class="campowidthselect campo campotexto"  
							      <c:if test="${tipo_tram==1}">
                                  <axis:atr f="axissin007" c="CMARCA" a="&modificable=false&isInputText=false&obligatorio=true"/>
                                  </c:if>
                                  <c:if test="${tipo_tram!=1}">
                                  <axis:atr f="axissin007" c="CMARCA" a="&modificable=true&isInputText=false&obligatorio=true"/>
                                  </c:if>
								  >
                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin007" c="SELECCIONAR" lit="108341"/> - </option>                              
                                <c:forEach var="lista_marcas" items="${listValores.MARCAS}">
                                <c:set var="c_marca">0${__formdata.DETALLE.CMARCA}</c:set>
								<option value = "${lista_marcas.CMARCA}"
                                  <c:if test="${(!empty __formdata.DETALLE.CMARCA)&& 
                                               ((lista_marcas.CMARCA < '100'  && 
                                                 lista_marcas.CMARCA == c_marca) 
										     || (lista_marcas.CMARCA == __formdata.DETALLE.CMARCA)
                                               )}"> selected </c:if>>
                                  ${lista_marcas.TMARCA}<axis:visible f="axissin007" c="CODIGOS">(${lista_marcas.CMARCA})</axis:visible> </option>
                                </c:forEach>
                            </select>
                        </td>
                        </axis:ocultar>   
                        <axis:ocultar f="axissin007" c="CTIPVEH" dejarHueco="false">
                        <td class="campocaja">
                            <select name = "CTIPVEH" id="CTIPVEH" size="1" onchange="limpiar_cambio_tipo();f_llenar_modelo(document.miForm.CMARCA.value)" class="campowidthselect campo campotexto"
                                    title="<axis:alt c="CTIPVEH" f="axissin007" lit="9001059" />" 
                                    <c:if test="${tipo_tram==1}">
                                   <axis:atr f="axissin007" c="CTIPVEH" a="&modificable=false&isInputText=false&obligatorio=true"/>
                                   </c:if>
                                   <c:if test="${tipo_tram!=1}">
                                   <axis:atr f="axissin007" c="CTIPVEH" a="&modificable=true&isInputText=false&obligatorio=true"/>
                                   </c:if>>
                                <option value = "${axisctr065_Version.CTIPVEH}"> - <axis:alt f="axissin045" c="TIT_PANTALLA" lit="108341"/> - </option>
                                <c:forEach var="tipveh" items="${LSTCTIPVEH}">
                                <option value = "${tipveh.CTIPVEH}"
                                        <c:if test="${tipveh.CTIPVEH == __formdata.CTIPVEH or tipveh.CTIPVEH == __formdata.DETALLE.CTIPVEH}"> selected </c:if>>
                                                    ${tipveh.TTIPVEH}<axis:visible f="axissin007" c="CODIGOS">(${tipveh.CTIPVEH})</axis:visible> </option>  
                                </c:forEach>
                           </select>
                        </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin007" c="CMODELO" dejarHueco="false">
                            <td class="campocaja">
                                <select name = "CMODELO" id="CMODELO"  size="1"  class="campowidthselect campo campotexto" onchange="cambio_modelo()"
                                        title="<axis:alt c="CMODELO" f="axissin007" lit="108515" />"
                                  <c:if test="${tipo_tram==1}">
                                  <axis:atr f="axissin007" c="CMODELO" a="&modificable=false&isInputText=false&obligatorio=true"/>
                                  </c:if>
                                  <c:if test="${tipo_tram!=1}">
                                  <axis:atr f="axissin007" c="CMODELO" a="&modificable=true&isInputText=false&obligatorio=true"/>
                                  </c:if>>
                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin007" c="SELECCIONAR" lit="108341"/> - </option>                              
                                <c:forEach var="modelos" items="${MODELOS}">
                                <option value = "${modelos.CMODELO}"
                                <c:if test="${(!empty __formdata.DETALLE.CMODELO) && modelos.CMODELO == __formdata.DETALLE.CMODELO}"> selected </c:if>>
                                ${modelos.TMODELO}<axis:visible f="axissin007" c="CODIGOS">(${modelos.CMODELO}) </axis:visible> </option>
                                </c:forEach>
                                </select>
                            </td>
                        </axis:ocultar>
                        <axis:visible c="EDIT_VERSION" f="axissin007">
                        <td colspan=2 id="BUT_EDIT">
                            <b style="font-size:11px"><axis:alt c="EDIT_VERSION" f="axissin007" lit="9001051" /></b>&nbsp&nbsp&nbsp<c:if test="${tipo_tram!=1}"><a href="javascript:f_abrir_axisctr058(document.miForm.CMARCA.value,document.miForm.CMODELO.value)"></c:if><img border="0" src="images/car.gif" /><c:if test="${tipo_tram!=1}"></a></c:if>
                        </td>
                        </axis:visible>
                   </tr>
                   <tr>
                        <!-- Model -->
                        <td class="titulocaja">
                            <table>
                                <tr>
                                    <axis:ocultar f="axissin007" c="ANYO" dejarHueco="false">
                                        <td class="titulocaja" id="td_ANYO" style="width:87px">
                                            <b><axis:alt c="ANYO" f="axissin007" lit="101606" /></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axissin007" c="CCILINDRAJE" dejarHueco="false">
                                        <td class="titulocaja" id="td_CCILINDRAJE">
                                            <b><axis:alt c="CCILINDRAJE" f="axissin007" lit="9904725" /></b>
                                        </td>
                                    </axis:ocultar>
                                </tr>
                            </table>
                        </td> 
                        <axis:visible c="CODMOTOR" f="axissin007">
                            <!-- Combustible -->
                            <td class="titulocaja" id="tit_CODMOTOR">
                                <b><axis:alt c="CODMOTOR" f="axissin007" lit="9904654" /></b>
                            </td>  
                         </axis:visible>
                         <axis:ocultar f="axissin007" c="CCHASIS" dejarHueco="false">
                             <!-- CCHASIS -->
                            <td class="titulocaja" >
                                <b><axis:alt c="CCHASIS" f="axissin007" lit="9904655" /></b>
                            </td>
                        </axis:ocultar> 
                        <axis:ocultar f="axissin007" c="NBASTID" dejarHueco="false">
                             <!-- NBASTID -->
                            <td class="titulocaja" >
                                <b><axis:alt c="NBASTID" f="axissin007" lit="9001061" /></b>
                            </td>
                        </axis:ocultar>    
                   </tr>
                   <tr>
                        <td>
                            <table>
                                <tr>
                                    <axis:ocultar f="axissin007" c="ANYO" dejarHueco="false">
                                        <td class="campocaja">
                                            <select name = "ANYO" id="ANYO"  size="1" onchange="f_cambiar_anyo(this.value)" class="campowidthselect campo campotexto"
                                                    title="<axis:alt c="ANYO" f="axissin007" lit="101606" />"
                                                    <c:if test="${tipo_tram==1}">
                                                   <axis:atr f="axissin007" c="ANYO" a="&modificable=false&isInputText=false&obligatorio=true"/>
                                                   </c:if>
                                                   <c:if test="${tipo_tram!=1}">
                                                   <axis:atr f="axissin007" c="ANYO" a="&modificable=true&isInputText=false&obligatorio=true"/>
                                                   </c:if>>
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin007" c="SELECCIONAR" lit="108341"/> - </option>                              
                                                    <c:forEach var="modelos" items="${LSTANYOS}">
                                                    <option value = "${modelos.ANYO}"
                                                    <c:if test="${(!empty __formdata.DETALLE.NANYO) && modelos.ANYO == __formdata.DETALLE.NANYO}"> selected </c:if>>
                                                          ${modelos.ANYO}</option>
                                                    </c:forEach>
                                            </select>
                                        </td>
                                    </axis:ocultar> 
                                    <axis:ocultar f="axissin007" c="CCILINDRAJE" dejarHueco="false"> 
                                        <td class="campocaja">
                                            <input type="text" name="CCILINDRAJE" id="CCILINDRAJE" 
                                                   <c:if test="${tipo_tram==1}">
                                                   <axis:atr f="axissin007" c="CCILINDRAJE" a="&modificable=false"/>
                                                   </c:if>
                                                   <c:if test="${tipo_tram!=1}">
                                                   <axis:atr f="axissin007" c="CCILINDRAJE" a="&modificable=true"/>
                                                   </c:if>
                                                   title="<axis:alt c="CCILINDRAJE" f="axissin007" lit="9904725" />"
                                                   value="${__formdata.DETALLE.CCILINDRAJE}"  class="campowidthinput campo campotexto"
                                                   maxlength="11"/>
                                        </td>
                                    </axis:ocultar>
                                </tr>
                            </table>
                       </td>
                       <axis:ocultar f="axissin007" c="CODMOTOR" dejarHueco="false">
                        <td class="campocaja">
                                <input type="text" name="CODMOTOR" id="CODMOTOR" value="${__formdata.DETALLE.CODMOTOR}"  class="campowidthinput campo campotexto"
                                 title="<axis:alt c="CODMOTOR" f="axissin007" lit="9904654" />" onchange="conMayusculas(this);f_valida_campo(this);f_buscar_matric();"
                                <c:if test="${tipo_tram==1}">
                               <axis:atr f="axissin007" c="CODMOTOR" a="&modificable=false"/>
                               </c:if>
                               <c:if test="${tipo_tram!=1}">
                               <axis:atr f="axissin007" c="CODMOTOR" a="&modificable=true"/>
                               </c:if>
                                       maxlength="25"/>
                        </td>  
                    </axis:ocultar>   
                     
                  <axis:ocultar f="axissin007" c="CCHASIS" dejarHueco="false">
                        <td class="campocaja">
                            <input type="text" name="CCHASIS" id="CCHASIS" 
                            <c:if test="${tipo_tram==1}">
                           <axis:atr f="axissin007" c="CCHASIS" a="&modificable=false"/>
                           </c:if>
                           <c:if test="${tipo_tram!=1}">
                           <axis:atr f="axissin007" c="CCHASIS" a="&modificable=true"/>
                           </c:if>
                             title="<axis:alt c="CCHASIS" f="axissin007" lit="9904655" />" onchange="conMayusculas(this);f_valida_campo(this);f_buscar_matric();"
                            value="${__formdata.DETALLE.CCHASIS}"  class="campowidthinput campo campotexto"
                                   maxlength="25"/>
                        </td>
                    </axis:ocultar> 
                     <axis:ocultar f="axissin007" c="NBASTID" dejarHueco="false">
                        <td class="campocaja">
                            <input type="text" name="NBASTID" id="NBASTID" 
                            <c:if test="${tipo_tram==1}">
                           <axis:atr f="axissin007" c="NBASTID" a="&modificable=false"/>
                           </c:if>
                           <c:if test="${tipo_tram!=1}">
                           <axis:atr f="axissin007" c="NBASTID" a="&modificable=true"/>
                           </c:if>
                            title="<axis:alt c="NBASTID" f="axissin007" lit="9001061" />" onchange="conMayusculas(this);f_valida_campo(this);f_buscar_matric();"
                            value="${__formdata.DETALLE.NBASTID}"  class="campowidthinput campo campotexto"
                                   maxlength="17"/>
                        </td>
                    </axis:ocultar> 
                   </tr>
                   <tr>
                    <!-- Descripción Tramitacion -->
                        <td class="titulocaja">
                           <b><axis:alt f="axissin007" c="DESCTRAMIT" lit="9001147" /></b>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" style="width:100%;"  class="campocaja"> 
                            <textarea class="campo campotexto" <axis:atr f="axissin007" c="DESCTRAMIT" a="modificable=true&isInputText=false"/> <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> style="width:100%;" onkeydown=" if(this.value.length>= 500 && event.keyCode != 8 && event.keyCode != 46){return false;}" name="DESCTRAMIT" id="DESCTRAMIT">${__formdata.DETALLE.DESCTRAMIT}</textarea>
                        </td>
                    </tr>
                    
                </table>
                
                </c:if>
                
                <div><!-- Fin de seccion ocultable vehiculo -->
                
                <!-- ******************************************************************************************************** -->
                <!-- ******************************************************************************************************** -->
                <!-- *******************************************  SECCION TIPO 6/7 ****************************************** -->
                <!-- ******************************************************************************************************** -->
                <!-- ******************************************************************************************************** -->
                
                <c:if test="${tipo_tram==6|| tipo_tram==7}">
                <div class="separador">&nbsp;</div>
                <div id="seccion_conductor"><!-- style="display:none" -->
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin007" c="titulo" lit="9001027"/></div>
                
                <table class="seccion">
                    <tr>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                    </tr>
                    <tr>
                    <td colspan="4" class="titulocaja">
                    <b><axis:alt f="axissin007" c="CONDUCTOR" lit="9001027" /></b>
                    </td>
                    <tr>
                                <!-- Tipo -->
                                 <td class="titulocaja">
                                    <b><axis:alt f="axissin007" c="CTIPCON" lit="100565" /></b>
                                </td>
                                <!-- Estat -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin007" c="CESTPER_AUT" lit="100587" /></b>
                                </td>
                                <!-- Alcoholemia -->
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axissin007" c="CALCOHOL" lit="9001204" /></b>
                                </td>
                                <td class="titulocaja">
                                    
                                </td>                    
                      </tr>

                        <tr>
                                <!-- Tipo -->
                                <td class="campocaja">
                                        <select name="CTIPCON" id="CTIPCON" <axis:atr f="axissin007" c="CTIPCON" a="modificable=true&isInputText=false"/> size="1" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> class="campowidthselect campo campotexto" style="width:90%;">
                                            <option value = "-1"> - <axis:alt f="axissin007" c="SNV_COMBO" lit="1000348"/> - </option>
                                            <c:forEach var="tipodoc" items="${listValores.tipo_conductor}">
                                                <option value = "${tipodoc.CATRIBU}" 
                                                <c:if test="${tipodoc.CATRIBU == __formdata.DETALLE.CTIPCON}"> selected </c:if> />
                                                    ${tipodoc.TATRIBU} 
                                                </option>
                                            </c:forEach>
                                        </select>
                                </td>
                                <!-- Estat -->
                                <td class="campocaja">
                                    <select name="CESTPER" id="CESTPER" size="1" <axis:atr f="axissin007" c="CESTPER" a="modificable=true&isInputText=false"/> <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> class="campowidthselect campo campotexto" style="width:90%;">
                                        <option value = "-1"> - <axis:alt f="axissin007" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="est_persona" items="${listValores.tipo_estado_persona}">
                                            <option value = "${est_persona.CATRIBU}" 
                                            <c:if test="${est_persona.CATRIBU == __formdata.DETALLE.CESTPER}"> selected </c:if> />
                                                ${est_persona.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <!-- Alcholemia -->
                                <td class="campocaja" colspan="2">
                                    <input type="checkbox"  id="CALCOHOL" name="CALCOHOL" <axis:atr f="axissin007" c="CALCOHOL" a="modificable=false"/> <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> value="${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.DETALLE.CALCOHOL}" 
                                    <c:if test="${__formdata.DETALLE.CALCOHOL == '1'}">checked</c:if> >
                                </td> 
                                <td class="campocaja">
                                   
                                </td>                                  
                            </tr>                         
                    
                    <tr>
                                <!-- Tipo documento -->
                                 <td class="titulocaja">
                                    <b><axis:alt f="axissin007" c="NNUMIDE" lit="105330" /></b>
                                </td>
                                <!-- Número documento -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin007" c="NOMBRE" lit="105940" /></b>
                                </td>
                                <!-- Nombre -->
                                <td class="titulocaja" colspan="2">
                                    
                                </td>
                                <td class="titulocaja">
                                    
                                </td>                            
                            </tr>
                            <tr>
                                <!-- Tipo documento -->
                                <td class="campocaja">
                                    <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}"  class="campowidthinput campo campotexto_ob" style="width:70%"
                                    <axis:atr f="axissin007" c="SPERSON" a="modificable=true"/> /> 
                                    <input type="text" name="NNUMIDE" value="${__formdata.DETALLE.PERSONA.NNUMIDE}" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> class="campowidthinput campo campotexto_ob" style="width:70%"
                                    <axis:atr f="axissin007" c="NNUMIDE" a="modificable=false&obligatorio=true"/> /> 
                                    <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisper021()" style="cursor:pointer"/>  
                                </td>
                                <td class="campocaja" colspan="2">
                                    <input type="text" name="NOMBRE" value="${__formdata.DETALLE.PERSONA.TNOMBRE}" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> class="campowidthinput campo campotexto_ob" style="width:90%"
                                    <axis:atr f="axissin007" c="NOMBRE" a="modificable=false&obligatorio=true"/> /> 
                                </td>
                                <td class="campocaja"></td>
                                <td class="campocaja"></td> 
                         </tr>  
                         <tr>
                                <!-- Fecha Permiso -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin007" c="FCARNET" lit="9001209" /></b>
                                </td>
                  
                            </tr>    
                            <tr>
                                <!-- Fecha Permiso -->
                                <td class="campocaja"  >
                                    <input   type="text"  class="campowidthinput campo campotexto_ob" id="FCARNET"  name="FCARNET"  style="width:40%"
                                    <axis:atr f="axissin007" c="FCARNET" a="modificable=true&formato=fecha"/> value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.DETALLE.FCARNET}"/>"/>                                    
                                    <a style="vertical-align:middle;"><img id="popup_calendario_FCARNET" alt="<axis:alt f="axissin007" c="FCARNET" lit="9001209"/>" title="<axis:alt f="axissin007" c="FCARNET" lit="9001209" />" src="images/calendar.gif"/></a>
                                </td>
                    </tr>

                    <tr>
                    <td colspan="4" class="titulocaja">
                    <b><axis:alt f="axissin007" c="VEHICULO" lit="9001026" /></b>
                    </td>
                    <tr>                    
                    <tr>
                        <td class="titulocaja">
                            <b><axis:alt f="axissin007" c="CTIPMAT" lit="9001044"/></b><!-- Tipo Matricula -->
                        </td>
                        <td class="titulocaja">
                            <b><axis:alt f="axissin007" c="CMATRIC" lit="9001045"/></b><!-- matricula -->
                        </td>
                        <td class="titulocaja">
                            
                        </td>
                        <td class="titulocaja">
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="campocaja">
                              <select name="CTIPMAT" id="CTIPMAT" <axis:atr f="axissin007" c="CTIPMAT" a="modificable=true&isInputText=false"/> size="1" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> class="campowidthselect campo campotexto" style="width:90%;">
                                <option value = "-1"> - <axis:alt f="axissin007" c="SNV_COMBO" lit="1000348"/> - </option>
                                <c:forEach var="tipomat" items="${listValores.tipo_matricula}">
                                    <option value = "${tipomat.CATRIBU}" 
                                    <c:if test="${tipomat.CATRIBU == __formdata.DETALLE.CTIPMAT}"> selected </c:if> />
                                        ${tipomat.TATRIBU} 
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        <td class="campocaja">
                            <input type="text" name="CMATRIC" id="CMATRIC" value="${__formdata.DETALLE.CMATRIC}" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axissin007" c="CMATRIC" a="modificable=true"/> />
                        </td>
                        <td class="campocaja">
                            
                        </td>
                        <td class="campocaja">
                             
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="titulocaja">
                            <b><axis:alt f="axissin007" c="CMARCA" lit="9001046"/></b><!-- Marca -->
                        </td>
                        <td class="titulocaja">
                            <b><axis:alt f="axissin007" c="CMODELO" lit="108515"/></b><!-- Modelo -->
                        </td>
                        <td class="titulocaja">
                           
                        </td>
                        <td class="titulocaja">
                            
                        </td>
                    </tr>
                   <tr>
                        <td class="campocaja">
                             <select name="CMARCA" id="CMARCA" <axis:atr f="axissin007" c="CMARCA" a="modificable=true&isInputText=false"/> <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> onchange="javascript:f_onchange_CMARCA()" size="1" class="campowidthselect campo campotexto" style="width:90%;">
                                <option value = "-1"> - <axis:alt f="axissin007" c="SNV_COMBO" lit="1000348"/> - </option>
                                <c:forEach var="marca" items="${listValores.marcas}">
                                    <option value = "${marca.CMARCA}" 
                                    <c:if test="${marca.CMARCA == __formdata.DETALLE.CMARCA}"> selected </c:if> />
                                        ${marca.TMARCA} 
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        <td class="campocaja">
                            <select name="CMODELO"  id="CMODELO" size="1" onchange="" class="campowidthselect campo campotexto" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> style="width:93%;">                                        
                                <option value="null"> - <axis:alt f="axissin007" c="SNV_COMBO" lit="1000348"/> - </option>
                                <option value="${__formdata.DETALLE.CMODELO}" <c:if test="${__formdata.DETALLE.CMODELO != null}"> selected </c:if> >
                                                ${__formdata.DETALLE.TMODELO} 
                                </option>
                                    <!--option value = "0">Tipo 0</option>
                                    <option value = "1">Tipo 1</option>
                                    <option value = "2">Tipo 2</option-->
                                
                             </select>
                        </td>
                        <td class="campocaja" colspan="2">
                            <b><axis:alt f="axissin007" c="TVERSION" lit="9001051" /></b>&nbsp;&nbsp;&nbsp;<a href="javascript:f_abrir_axisctr058()"><img border="0" src="images/car.gif" /></a>
                            <input type="text" name="TVERSION" id="TVERSION" value="${__formdata.DETALLE.TVERSION}" style="background-color:transparent;border:0px;font-weight:bold;color:orange" class="campowidthinput campo campotexto"/>                    
                            
                        </td>
                      
                    </tr>
                    <tr>
                    <!-- Descripción Tramitacion -->
                        <td class="titulocaja">
                           <b><axis:alt f="axissin007" c="DESCTRAMIT" lit="9001147" /></b>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" style="width:100%;"  class="campocaja"> 
                            <textarea class="campo campotexto" <axis:atr f="axissin007" c="DESCTRAMIT" a="modificable=true&isInputText=false"/> style="width:100%;" <c:if test="${__formdata.MOD_TRAM=='CONS'}">disabled</c:if> name="DESCTRAMIT" onkeydown=" if(this.value.length>= 500 && event.keyCode != 8 && event.keyCode != 46){return false;}" id="DESCTRAMIT">${__formdata.DETALLE.DESCTRAMIT}</textarea>
                        </td>
                    </tr>
                    
                </table>
                
                </c:if>
                
                </div><!-- Fin de seccion conductor -->
            </td>
        </tr>
    </table>                                                                                                                      
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin007</c:param><c:param name="f">axissin007</c:param><c:param name="__botones">
            <c:if test="${sessionScope.CMODO =='ALTA_SINIESTROS' || sessionScope.CMODO =='MODIF_SINIESTROS' }">cancelar<axis:visible f="axissin007" c="BT_ACEPTAR">,aceptar</axis:visible></c:if>
            <c:if test="${sessionScope.CMODO !='ALTA_SINIESTROS' && sessionScope.CMODO !='MODIF_SINIESTROS'}">salir</c:if>
    </c:param>
    </c:import>
    </form>
     <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FCARNET",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FCARNET", 
                singleClick    :    true,
                firstDay       :    1
            });
     </script>
  <c:import url="../include/mensajes.jsp" />
</body>
</html>
