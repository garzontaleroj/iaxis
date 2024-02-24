<%/* Revision:# PxGYERXD/tPeprPAxMmNnA== # */%>

<%--
/**
*  Fichero: axissin039.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
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
<c:set var="nombrePantalla" value="miForm"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
        
    <c:set var="linea_trami">
        ${__formdata.indexTramitacio}
    </c:set>
<head>
    <title><axis:alt f="axissin039" c="AXISSIN039_TITLE" lit="100604"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>

    <script type="text/javascript">
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////// ACCIONES BASICAS DE PANTALLA /////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    function f_onload() { 
                //Recupera del formadata el CPAIS y la variable NSINIES
                formdataPAIS = '${__formdata.LOCALIZA.CPAIS}';
                 var NSINIES = "${__formdata.NSINIES}"; 
        objDom.setValorPorId("NSINIES_O",NSINIES);
                //Si la grabacion de la persona ha sido correcta se cierra la página y se recarga la pantalla base.
                var val1 = "<%=request.getAttribute("OK")%>"; 
                if (val1=="OK"){
                        parent.f_aceptar_axissin039(NSINIES,document.miForm.subpantalla_base.value); 
                        this.f_but_cancelar();
                }
                //Comprobamos el valor DEC_SPERSON
                var DEC_SPERSON_ALTA = "${__formdata.DEC_SPERSON_ALTA}";
                var DEC_SPERSON = "${__formdata.DEC_SPERSON}";
                
                if (!objUtiles.estaVacio(DEC_SPERSON_ALTA)){ 
                        document.miForm.DEC_SPERSON.value = DEC_SPERSON_ALTA;
                        DEC_SPERSON = DEC_SPERSON_ALTA;
                        f_get_persona(DEC_SPERSON_ALTA);
                }
                //try - catch segun el valor de si DEC_SPERSON está informado o no
                
                try{  
                    if (!objUtiles.estaVacio(DEC_SPERSON)){ 
                        <c:if test="${__formdata.MODO!='MOD'}" >
                        f_actualizar_campos(0);
                        </c:if>
                    }else{
                        
                        <c:if test="${__formdata.MODO!='MOD'}" >
                        f_actualizar_campos(1);
                        </c:if>
                    }
                }catch(e){}
            <c:choose>
           <c:when test="${!empty __formdata.TDESC}">
           
           	f_verifica_textarea(1);
           </c:when> 
           <c:when test="${empty __formdata.TDESC}">
           f_verifica_textarea(0);
           </c:when>
           </c:choose>
           
            f_cargar_propiedades_pantalla();
                    
    }
                
                
                
    function f_but_aceptar(){
            if (objValidador.validaEntrada()) {
                      objUtiles.ejecutarFormulario ("modal_axissin039.do", "guardar", document.miForm, "_self");  
            }
    }
        
    function f_but_cancelar(){
            parent.f_cerrar_modal("axissin039");
    }
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////// CAMBIAR - ACTUALIZAR PANTALLA ////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 

   
    
    function cargar_direccion(NRIESGO){
                       
            if(isNaN(document.miForm.NRIESGO.value) ){ //No hay ninguno seleccionado
                alert("<axis:alt f="axissin039" c="NOSELECTION" lit="1000413" />");
            }else{
            //alert(document.miForm.NRIESGO.value);
                NRIESGO= document.miForm.NRIESGO.value;
                objAjax.invokeAsyncCGI("modal_axissin039.do", callbackAjaxCargarDireccion, 
                    "operation=ajax_cargardireccion&NRIESGO_SEL=" + NRIESGO , this, objJsMessages.jslit_actualizando_registro);
            }
            
            
    }
    
    // CallBack cargar direccion
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
                        
                        
                        objDom.setValorComponente(document.miForm.CPROVIN, CPROVIN);
                        objDom.setValorComponente(document.miForm.CPAIS, CPAIS);
                        objDom.setValorComponente(document.miForm.CPOSTAL, CPOSTAL);
                        objDom.setValorComponente(document.miForm.CPOBLAC, CPOBLAC);
                        objDom.setValorComponente(document.miForm.TNOMVIA, TDOMICI);
                        
                        
                    }else{
                       
                    }
                }
                
            } catch (e) {
                objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", motivosCombo, null);
                alert(objJsMessages.jslit_sin_motivos);
            }
        }        

       
        
    //CallBack seleccionar causa
    function callbackAjaxSelectedCausa(ajaxResponseText) {
            var motivosCombo = document.miForm.CMOTSIN;
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

    function f_verifica_textarea(valor) {                
        // Verifica la seccion seleccionada : Si se introduce la descripcion o se introducen los datos de la persona.
        if (valor == 0){
                //Desahbiliatmos el campo descripcion y cambiamos su estilo
                <c:if test="${__formdata.LSTPERSONASRE != 1}"> 
                document.miForm.TDESC.readonly = true;
                document.miForm.TDESC.disabled = true;
                document.miForm.TDESC.value = "";
                
                //Habilitamos los campos y limpiamos sus valores
                        
                document.miForm.NNUMIDE.disabled = false;
                
                <axis:visible f="axissin039" c="TNOMBRE">
                    document.miForm.TNOMBRE.disabled = false;
                </axis:visible>
                <axis:visible f="axissin039" c="TNOMBRE1">
                    document.miForm.TNOMBRE1.disabled = false;
                </axis:visible>
                <axis:visible f="axissin039" c="TNOMBRE2">
                    document.miForm.TNOMBRE2.disabled = false;
                </axis:visible>
                
                document.miForm.TAPELLI1.disabled = false;
                document.miForm.TAPELLI2.disabled = false;
                document.miForm.CTIPIDE.disabled = false;
                document.miForm.CTIPIDE_AUX.disabled = false;
                document.miForm.TTELEFON.disabled = false;
                <axis:ocultar f="axissin039" c="TMOVIL">
                    document.miForm.TMOVIL.disabled = false;
                </axis:ocultar>
                <axis:ocultar f="axissin039" c="TEMAIL">
                    document.miForm.TEMAIL.disabled = false;
                </axis:ocultar>
                </c:if>
                try{
                objDom.setDisplayPorId("REINICIAR_PERSONA","");
                objDom.setDisplayPorId("BUSCAR_PERSONA","");
                objDom.setDisplayPorId("NOVA_PERSONA","");
                var DEC_SPERSON = "${__formdata.DEC_SPERSON}";
                if (!objUtiles.estaVacio(DEC_SPERSON_ALTA)){ 
                    objDom.setDisplayPorId("INFO_PERSONA","");
                }else{
                    objDom.setDisplayPorId("INFO_PERSONA","none");
                }
                
              }catch(e){}      
                <c:if test="${__formdata.LSTPERSONASRE != 1}"> 
                <axis:visible f="axissin039" c="TNOMBRE">
                document.miForm.TNOMBRE.className = "campowidthinput campo campotexto";
                </axis:visible>
                <axis:visible f="axissin039" c="TNOMBRE1">
                    document.miForm.TNOMBRE1.className = "campowidthinput campo campotexto";
                </axis:visible>
                <axis:visible f="axissin039" c="TNOMBRE2">
                    document.miForm.TNOMBRE2.className = "campowidthinput campo campotexto";
                </axis:visible>
                document.miForm.TAPELLI1.className = "campowidthinput campo campotexto";
                document.miForm.TAPELLI2.className = "campowidthinput campo campotexto";
                document.miForm.CTIPIDE.className = "campowidthinput campo campotexto";
                document.miForm.NNUMIDE.className = "campowidthinput campo campotexto";
                document.miForm.TTELEFON.className = "campowidthinput campo campotexto";
                <axis:ocultar f="axissin039" c="TMOVIL">
                    document.miForm.TMOVIL.className = "campowidthinput campo campotexto";
                </axis:ocultar>
                <axis:ocultar f="axissin039" c="TEMAIL">
                    document.miForm.TEMAIL.className = "campowidthinput campo campotexto";
                </axis:ocultar>
                </c:if>
             //   document.miForm.TDESC.className = "campowidthinput campo campodisabled";
             f_cargar_propiedades_pantalla();
                   

        }else{ 
            //objDom.setClassNamePorComponente(document.miForm.TDESC, "campowidthinput campo campotexto_ob");
            <c:if test="${__formdata.LSTPERSONASRE != 1}"> 
            document.miForm.TDESC.readonly = false;
            document.miForm.TDESC.disabled = false;
            
            document.miForm.NNUMIDE.value = '';
            <axis:visible f="axissin039" c="TNOMBRE">
            document.miForm.TNOMBRE.value  = '';
            </axis:visible>
            <axis:visible f="axissin039" c="TNOMBRE1">
                document.miForm.TNOMBRE1.value  = '';
            </axis:visible>
            <axis:visible f="axissin039" c="TNOMBRE2">
                document.miForm.TNOMBRE2.value  = '';
            </axis:visible>
            document.miForm.TAPELLI1.value = '';
            document.miForm.TAPELLI2.value = '';
            document.miForm.CTIPIDE.value  = "<%= Integer.MIN_VALUE %>";
            document.miForm.CTIPIDE_AUX.value = '';
            document.miForm.TTELEFON.value  = '';
            <axis:ocultar f="axissin039" c="TMOVIL">
                document.miForm.TMOVIL.value  = '';
            </axis:ocultar>
            <axis:ocultar f="axissin039" c="TEMAIL">
                document.miForm.TEMAIL.value  = '';
            </axis:ocultar>
            document.miForm.NNUMIDE.disabled = true;
            <axis:visible f="axissin039" c="TNOMBRE">
            document.miForm.TNOMBRE.disabled = true;
            </axis:visible>
            <axis:visible f="axissin039" c="TNOMBRE1">
                document.miForm.TNOMBRE1.disabled = true;
            </axis:visible>
            <axis:visible f="axissin039" c="TNOMBRE2">
                document.miForm.TNOMBRE2.disabled = true;
            </axis:visible>
            document.miForm.TAPELLI1.disabled = true;
            document.miForm.TAPELLI2.disabled = true;
            document.miForm.CTIPIDE.disabled = true;
            document.miForm.CTIPIDE_AUX.disabled = true;
            document.miForm.TTELEFON.disabled = true;
            <axis:ocultar f="axissin039" c="TMOVIL">
                document.miForm.TMOVIL.disabled = true;
            </axis:ocultar>
            <axis:ocultar f="axissin039" c="TEMAIL">
                document.miForm.TEMAIL.disabled = true;
            </axis:ocultar>
            
            document.miForm.TDESC.className = "campowidthinput campo campotexto";
            </c:if>
            try{
                objDom.setDisplayPorId("REINICIAR_PERSONA","none");
                objDom.setDisplayPorId("BUSCAR_PERSONA","none");
                objDom.setDisplayPorId("NOVA_PERSONA","none");
                objDom.setDisplayPorId("INFO_PERSONA","none");
                //BUSCAR_PERSONA REINICIAR_PERSONA NOVA_PERSONA INFO_PERSONA
            }catch(e){
                alert(e);
            }                
            f_cargar_propiedades_pantalla();

            }
        
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
                objAjax.invokeAsyncCGI("modal_axissin039.do", callbackajaxdireccion, qs, this)
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
                objAjax.invokeAsyncCGI("modal_axissin039.do", callbackajaxdireccion, qs, this)
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
                objAjax.invokeAsyncCGI("modal_axissin039.do", callbackajaxdireccion, qs, this)
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
                objAjax.invokeAsyncCGI('modal_axissin039.do', callbackAjaxOnblurCPOSTAL, 'operation=getProvinPobla&CPOSTAL=' + CPOSTAL, this);
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
        
      
     
      function f_cargar_declarante(){
                objDom.setValorPorId("DEC_SPERSON", ""); 
                objDom.setValorPorId("LIMPIAR_DATOS", "false");
                objUtiles.ejecutarFormulario("modal_axissin039.do?SP_DEC=vaciar", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            
            }
            function f_existe_persona(NNUMIDE){
            	
                 objAjax.invokeAsyncCGI("modal_axissin039.do", callbackajaxexistePersona, 
                  "operation=ajax_existe_persona&NNUMIDE=" + NNUMIDE+"&CAGENTE="+document.miForm.CAGENTE.value , this, objJsMessages.jslit_actualizando_registro);
            }
            
             function callbackajaxexistePersona(ajaxResponseText) {
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var PSPERSON_NEW = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("PSPERSON_NEW")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("PSPERSON_NEW"), 0, 0) : "");                    
                    if (!objUtiles.estaVacio(PSPERSON_NEW)){
                        var mensaje = "<axis:alt f='axissin039' c='NOPERSONA' lit='9901033'/>";
                        if (confirm(mensaje)){
                        var cagente = "${__formdata.CAGENTE}";
                         objUtiles.abrirModal("axisper021","src","modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&faceptar=f_aceptar_axisper021&NNUMNIF="+document.miForm.NNUMIDE.value+"&CAGENTE="+cagente+"&CONSULT_INI=1");
                         }
                          
                    }
                }
            }  
            
            function f_abrir_axisper021(){
            	var cagente = "${__formdata.CAGENTE}";
               var flagInomidados = "${__formdata.VALINNOMIDADOS}";
               var CTIPREL = objDom.getValorPorId("CTIPREL");
			   //CTIPREL=4 --> Asegurados innominados
               if(flagInomidados==0 || CTIPREL!=4){
               	   objUtiles.abrirModal("axisper021","src","modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBPRIV&faceptar=f_aceptar_axisper021&CAGENTE="+cagente);
               }else{
            	   	var NRIESGO = "${__formdata.NRIESGO}";
            	   	var SSEGURO = "${__formdata.SSEGURO}";
            	   	var TRIESGO = "${__formdata.TRIESGO}";
            	    objUtiles.abrirModal("axissin063","src","modal_axissin063.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&faceptar=f_aceptar_axissin063&CAGENTE="+cagente+"&HNRIESGO="+NRIESGO+"&HTRIESGO="+TRIESGO+"&SSEGURO="+SSEGURO);
               }
            }
            
            function f_aceptar_persona(SPERSON){
                objDom.setValorPorId("DEC_SPERSON", SPERSON); 
                objUtiles.cerrarModal("axisper021");
                f_get_persona(SPERSON);
            } 
            
            function f_aceptar_persona(SPERSON, CAGENTE, v, pantalla){
                objDom.setValorPorId("DEC_SPERSON", SPERSON); 
                objDom.setValorPorId("CAGENTE", CAGENTE); 
                objUtiles.cerrarModal(pantalla);
                f_get_persona(SPERSON);
            } 
            
            function f_get_persona(SPERSON){
                 objAjax.invokeAsyncCGI("modal_axissin039.do", callbackajaxGetPersona, 
                  "operation=ajax_get_persona&SPERSON=" + SPERSON+"&CAGENTE="+document.miForm.CAGENTE.value+"&DEC_SPERSON="+document.miForm.DEC_SPERSON.value , this, objJsMessages.jslit_actualizando_registro);
            }
        
          function callbackajaxGetPersona(ajaxResponseText) {
                var doc=objAjax.domParse(ajaxResponseText);
                //alert(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    
                    <c:if test="${__formdata.LSTPERSONASRE != 1}"> 
                    document.miForm.NNUMIDE.value = '';
                    
                    <axis:visible f="axissin039" c="TNOMBRE">
                        document.miForm.TNOMBRE.value  = '';
                    </axis:visible>
                    <axis:visible f="axissin039" c="TNOMBRE1">
                        document.miForm.TNOMBRE1.value  = '';
                    </axis:visible>
                    <axis:visible f="axissin039" c="TNOMBRE2">
                        document.miForm.TNOMBRE2.value  = '';
                    </axis:visible>
                    document.miForm.TAPELLI1.value = '';
                    document.miForm.TAPELLI2.value = '';
                    document.miForm.CTIPIDE.value  = "<%= Integer.MIN_VALUE %>";
                    document.miForm.CTIPIDE_AUX.value = '';
                    document.miForm.TTELEFON.value  = '';
                    document.miForm.DEC_SPERSON.value  = '';
                    
                    <axis:ocultar f="axissin039" c="TMOVIL">
                        document.miForm.TMOVIL.value  = '';
                    </axis:ocultar>
                    <axis:ocultar f="axissin039" c="TEMAIL">
                        document.miForm.TEMAIL.value  = '';
                    </axis:ocultar>
                    </c:if>
                    
                    var TNOMBRE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0) : "");  
                    
                    var TNOMBRE1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE1")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE1"), 0, 0) : "");  
                    if (objUtiles.estaVacio(TNOMBRE1)){
                        TNOMBRE1 = TNOMBRE;
                    }
                    
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

                    for (var i = 0; i < objDom.numeroDeTags(doc, "CONTACTOS") ; i++) {
                        var CTIPCON = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTIPCON")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPCON"), i, 0) +" " : "";
                            if (CTIPCON == 1 || CTIPCON == 5 || CTIPCON == 6) {
                                var TVALCON = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TVALCON")[0]) ? 
                                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TVALCON"), i, 0) +" " : "";
                                document.miForm.TTELEFON.value = TVALCON;
                                break;
                                
                            }
                     }
                    
                    <c:if test="${__formdata.LSTPERSONASRE != 1}"> 
                    <axis:ocultar f="axissin039" c="TMOVIL">
                      for (var i = 0; i < objDom.numeroDeTags(doc, "OB_IAX_CONTACTOS") ; i++) {
                        var CTIPCON = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTIPCON")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPCON"), i, 0) +" " : "";
                            if (CTIPCON == 6 || CTIPCON == 8) {
                                var TVALCON = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TVALCON")[0]) ? 
                                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TVALCON"), i, 0) +" " : "";
                               document.miForm.TMOVIL.value = TVALCON;
                                break;
                                
                            }
                     }
              
             
                    </axis:ocultar>
                    <axis:ocultar f="axissin039" c="TEMAIL">
                     for (var i = 0; i < objDom.numeroDeTags(doc, "OB_IAX_CONTACTOS") ; i++) {
                        var CTIPCON = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTIPCON")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPCON"), i, 0) +" " : "";
                            if (CTIPCON == 3) {
                                var TVALCON = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TVALCON")[0]) ? 
                                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TVALCON"), i, 0) +" " : "";
                                document.miForm.TEMAIL.value = TVALCON;
                                break;
                                
                            }
                     }
                    </axis:ocultar>
                    
                    <axis:visible f="axissin039" c="TNOMBRE">
                    document.miForm.TNOMBRE.value = TNOMBRE;
                    </axis:visible>
                    <axis:visible f="axissin039" c="TNOMBRE1">
                        document.miForm.TNOMBRE1.value = TNOMBRE1;
                    </axis:visible>
                    <axis:visible f="axissin039" c="TNOMBRE2">
                        document.miForm.TNOMBRE2.value = TNOMBRE2;
                    </axis:visible>
                    document.miForm.TAPELLI1.value = TAPELLI1;
                    document.miForm.TAPELLI2.value = TAPELLI2;
                    document.miForm.CTIPIDE.value = CTIPIDE;
                    document.miForm.CTIPIDE_AUX.value = CTIPIDE;
                    document.miForm.NNUMIDE.value = NNUMIDE;
                    objDom.setValorPorId("DEC_SPERSON", SPERSON); 
                    
                    objDom.setVisibilidadPorId("INFO_PERSONA",""); 
                     </c:if>
                     
                   f_actualizar_campos(0);
                }
            } 
            
        
        function f_cerrar_modalespersona(pantalla){
             objUtiles.cerrarModal(pantalla);
         }
        function f_cerrar_axisper021(){
                objUtiles.cerrarModal("axisper021");
        } 
        function f_actualizar_campos(resetear){
      
            if (resetear == 1){
                    <c:if test="${__formdata.LSTPERSONASRE != 1}"> 
                    document.miForm.NNUMIDE.value = '';
                    <axis:visible f="axissin039" c="TNOMBRE">
                    document.miForm.TNOMBRE.value  = '';
                    </axis:visible>
                    <axis:visible f="axissin039" c="TNOMBRE1">
                    document.miForm.TNOMBRE1.value  = '';
                    </axis:visible>
                    <axis:visible f="axissin039" c="TNOMBRE2">
                    document.miForm.TNOMBRE2.value  = '';
                    </axis:visible>
                    document.miForm.TAPELLI1.value = '';
                    document.miForm.TAPELLI2.value = '';
                    document.miForm.CTIPIDE.value  = "<%= Integer.MIN_VALUE %>";
                    document.miForm.CTIPIDE_AUX.value = '';
                    document.miForm.TTELEFON.value  = '';
                    document.miForm.DEC_SPERSON.value  = '';
                    
                    <axis:ocultar f="axissin039" c="TMOVIL">
                    document.miForm.TMOVIL.value  = '';
                    </axis:ocultar>
                    <axis:ocultar f="axissin039" c="TEMAIL">
                    document.miForm.TEMAIL.value  = '';
                    </axis:ocultar>
                    
                    <axis:visible f="axissin039" c="TNOMBRE">
                    document.miForm.TNOMBRE.readOnly = false;
                    </axis:visible>
                    <axis:visible f="axissin039" c="TNOMBRE1">
                    document.miForm.TNOMBRE1.readOnly = false;
                    </axis:visible>
                    <axis:visible f="axissin039" c="TNOMBRE2">
                    document.miForm.TNOMBRE2.readOnly = false;
                    </axis:visible>
                    document.miForm.TAPELLI1.readOnly = false;
                    document.miForm.TAPELLI2.readOnly = false;
                    document.miForm.CTIPIDE.disabled = false;
                    document.miForm.NNUMIDE.readOnly = false;
                    document.miForm.TTELEFON.readOnly=false;
                    
                    <axis:ocultar f="axissin039" c="TMOVIL">
                    document.miForm.TMOVIL.readOnly=false;
                    </axis:ocultar>
                    <axis:ocultar f="axissin039" c="TEMAIL">
                    document.miForm.TEMAIL.readOnly=false;
                    </axis:ocultar>
                    
                    objDom.setVisibilidadPorId("INFO_PERSONA","hidden");    
                    
                    <axis:visible f="axissin039" c="TNOMBRE">
                    document.miForm.TNOMBRE.className = "campowidthinput campo campotexto";
                    </axis:visible>
                    <axis:visible f="axissin039" c="TNOMBRE1">
                    document.miForm.TNOMBRE1.className = "campowidthinput campo campotexto";
                    </axis:visible>
                    <axis:visible f="axissin039" c="TNOMBRE2">
                    document.miForm.TNOMBRE2.className = "campowidthinput campo campotexto";
                    </axis:visible>
                    document.miForm.TAPELLI1.className = "campowidthinput campo campotexto";
                    document.miForm.TAPELLI2.className = "campowidthinput campo campotexto";
                    document.miForm.CTIPIDE.className = "campowidthinput campo campotexto";
                    document.miForm.NNUMIDE.className = "campowidthinput campo campotexto";
                    
                    <axis:ocultar f="axissin039" c="TMOVIL">
                    document.miForm.TMOVIL.className = "campowidthinput campo campotexto";
                    </axis:ocultar>
                    <axis:ocultar f="axissin039" c="TEMAIL">
                    document.miForm.TEMAIL.className = "campowidthinput campo campotexto";
                    </axis:ocultar>
                    </c:if>
                    f_cargar_propiedades_pantalla();
               }else{
                    <c:if test="${__formdata.LSTPERSONASRE != 1}"> 
                    <axis:visible f="axissin039" c="TNOMBRE">
                    document.miForm.TNOMBRE.readOnly = true;
                    </axis:visible>
                    <axis:visible f="axissin039" c="TNOMBRE1">
                    document.miForm.TNOMBRE1.readOnly = true;
                    </axis:visible>
                    <axis:visible f="axissin039" c="TNOMBRE2">
                    document.miForm.TNOMBRE2.readOnly = true;
                    </axis:visible>
                    document.miForm.TAPELLI1.readOnly = true;
                    document.miForm.TAPELLI2.readOnly = true;
                    if (!objUtiles.estaVacio(document.miForm.CTIPIDE)
                    && !objUtiles.estaVacio(document.miForm.CTIPIDE_AUX.value) ){
                         document.miForm.CTIPIDE.value = document.miForm.CTIPIDE_AUX.value;
                    }
                    document.miForm.TTELEFON.readOnly=true;
                    <axis:ocultar f="axissin039" c="TMOVIL">
                    document.miForm.TMOVIL.readOnly=true;
                    </axis:ocultar>
                    <axis:ocultar f="axissin039" c="TEMAIL">
                    document.miForm.TEMAIL.readOnly=true;
                    </axis:ocultar>
                    
                    document.miForm.CTIPIDE.disabled = true;
                    document.miForm.NNUMIDE.readOnly = true;
                    
                   
                    <%--objDom.setVisibilidadPorId("INFO_PERSONA","ocultar"); --%>
                   
                    
                    </c:if>
                    
                    
                    f_cargar_propiedades_pantalla();
                }
              
        }
        
        function f_consulta_persona(){
            if (objUtiles.estaVacio(document.getElementById('DEC_SPERSON').value)){ 
                objDom.setValorPorId("DEC_SPERSON", document.getElementById('SPERSON').value);
            }
            
            objDom.setValorPorId("LIMPIAR_DATOS", "false");
            objUtiles.ejecutarFormulario("modal_axissin039.do", "consulta_persona", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_alta_persona(){
            /*
            objDom.setValorPorId("LIMPIAR_DATOS", "false");
            objUtiles.ejecutarFormulario("modal_axissin039.do", "alta_persona", document.miForm, "_self", objJsMessages.jslit_cargando);
            */
            var CAGENTE = "${__formdata.CAGENTE_PERSN}";
            //alert(CAGENTE);
            objUtiles.abrirModal("axisper022","src","modal_axisper022.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="+CAGENTE);  
        }
        
        function f_cerrar_axisper022(){
            f_cerrar_modalespersona("axisper022");
        } 
        
        function f_sel_persona(SPERSON,CTIPREL,NNUMIDE,TNOMBRE,TAPELLI1,TAPELLI2,TTELEFON,TDESC,TNOMBRE2,TMOVIL,TEMAIL){
            
            document.miForm.SPERSON_SE.value = SPERSON;
            //document.miForm.CTIPIDE_SE.value = CTIPIDE;
            document.miForm.CTIPREL_SE.value = CTIPREL;
            document.miForm.NNUMIDE_SE.value = NNUMIDE;
            document.miForm.TNOMBRE_SE.value = TNOMBRE;
            document.miForm.TAPELLI1_SE.value = TAPELLI1;
            document.miForm.TAPELLI2_SE.value = TAPELLI2;
            document.miForm.TTELEFON_SE.value = TTELEFON;
            document.miForm.TDESC_SE.value = TDESC;
            document.miForm.TNOMBRE2_SE.value = TNOMBRE2;
            document.miForm.TMOVIL_SE.value = TMOVIL;
            document.miForm.TEMAIL_SE.value = TEMAIL;
        }
        
        function f_nova_persona(){
            f_cerrar_modalespersona("axisper021");
            var CAGENTE = "${__formdata.CAGENTE_PERSN}";
            objUtiles.abrirModal("axisper022","src","modal_axisper022.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="+CAGENTE);  
        }
        
        function f_cerrar_axisper022(){
            f_cerrar_modalespersona("axisper022");
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
			document.miForm.CPOSTAL.focus();      
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
    
    
    <form name="miForm" action="" method="POST">
    <input type="hidden" name="operation" value="guardar" />
    <input type="hidden" name="SPRODUC" value="${__formdata.SPRODUC}"/>
    <input type="hidden" name="NSINIES" value="${__formdata.NSINIES}"/>
    <input type="hidden" name="NRIESGO" value="${__formdata.NRIESGO}"/>
    <input type="hidden" name="NTRAMIT" value="${__formdata.NTRAMIT}"/>
    <input type="hidden" name="SSEGURO" value="${__formdata.SSEGURO}"/>
    <input type="hidden" name="NPERSREL" value="${__formdata.NPERSREL}"/>
    <input type="hidden" name="indexTramitacio" value="${__formdata.indexTramitacio}"/>
    <input type="hidden" name="subpantalla_base" value="${__formdata.subpantalla_base}"/>
    <input type="hidden" name="seccion" value="${__formdata.seccion}"/> 
    
    <input type="hidden" name="EDICION" value="${__formdata.EDICION}"/>
    <input type="hidden" name="seccion" value="movimientos"/>
    <input type="hidden" name="CACTIVI" value="${__formdata.OB_IAX_DATPOLIZA.CACTIVI}"/>
    <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}" />
    <input type="hidden" name="CTIPIDE_AUX" id="CTIPIDE_AUX" value="${__formdata.CTIPIDE_AUX}" />
    <input type="hidden" name="LIMPIAR_DATOS" id="LIMPIAR_DATOS" value="" />
    <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.T_IAX_TOMADORES[0].OB_IAX_TOMADORES.SPERSON}" />
    
    <input type="hidden" name="LSTPERSONASRE" value="${__formdata.LSTPERSONASRE}"/>
    <input type="hidden" name="SPERSON_SE" value="${__formdata.SPERSON_SE}"/>
    <input type="hidden" name="CTIPIDE_SE" value="${__formdata.CTIPIDE_SE}"/>
    <input type="hidden" name="NNUMIDE_SE" value="${__formdata.NNUMIDE_SE}"/>
    <input type="hidden" name="TNOMBRE_SE" value="${__formdata.TNOMBRE_SE}"/>
    <input type="hidden" name="TAPELLI1_SE" value="${__formdata.TAPELLI1_SE}"/>
    <input type="hidden" name="TAPELLI2_SE" value="${__formdata.TAPELLI2_SE}"/>
    <input type="hidden" name="TTELEFON_SE" value="${__formdata.TTELEFON_SE}"/>
    <input type="hidden" name="TDESC_SE" value="${__formdata.TDESC_SE}"/>
    <input type="hidden" name="TNOMBRE2_SE" value="${__formdata.TNOMBRE2_SE}"/>
    <input type="hidden" name="TMOVIL_SE" value="${__formdata.TMOVIL_SE}"/>
    <input type="hidden" name="TEMAIL_SE" value="${__formdata.TEMAIL_SE}"/>
    <input type="hidden" name="NTRAMITACION" value="${__formdata.NTRAMITACION}"/>
    <input type="hidden" name="NTRAMIT9999" value="${__formdata.NTRAMIT9999}"/>
    
    <input type="hidden" name="CTIPREL_SE" value="${__formdata.CTIPREL_SE}"/>
    
    
    
            
    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt f="axissin039" c="TIT_AXISSIN039" lit="9001131"/></c:param>
        <c:param name="formulario"><axis:alt f="axissin039" c="FORM_AXISSIN039" lit="9001131"/></c:param>
        <c:param name="form">axissin039</c:param>
    </c:import>
    <!-- MODAL -->
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
        </c:import>
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin035</c:param>
    </c:import>    
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axissin039" c="PERSONAS" lit="102073"/></c:param>
            <c:param name="nid">axisper021</c:param>
    </c:import> 
    <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axissin032" c="titul_axisper063" lit="9907751"/></c:param>
                <c:param name="nid">axissin063</c:param>
    </c:import>  
     <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisper022|<axis:alt f="axisprf001" c="MODAL_AXISPER022" lit="1000235" /></c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisper010|<axis:alt f="axisprf100" c="MODAL_AXISPER010" lit="110275" /></c:param>
    </c:import>
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper041|<axis:alt c="axisper041_TITULO" f="axisper041" lit="9002274"/></c:param>
    </c:import>	
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper042|<axis:alt c="axisper042_TITULO" f="axisper042" lit="9002274"/></c:param>
	</c:import>
	
    <div class="separador">&nbsp;</div>
    <table  class="mainModalDimensions base"  align="center" cellpadding="0" cellspacing="0"><!--id="tabla1" -->
        <tr>
            <td>
                <!-- Seccion -->
                
                <table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center"--> <!-- UNO -->
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                            </tr>
                            <!--   ******************************************************************************* -->
                            <!--   ******************************************************************************* -->
                            <!--   ******************************************************************************* -->
                            <!--   ******************************************************************************* -->
                            
                           
                             
                            <tr>
                              
                            <td class="titulocaja">
                                <b><axis:alt f="axissin039" c="NSINIES_LIT" lit="101298"/></b><!-- Numero de Siniestro-->
                            </td>
             
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin039" c="TIPUSTRAMITACIO" lit="9001028"/></b>
                                </td>
                               <td class="titulocaja">
                                    <b><axis:alt f="axissin039" c="DESCRIPCIO" lit="100588"/></b>
                                </td>                        
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin039" c="TIPUSANY" lit="9000901"/></b>
                                </td>
                               <td class="titulocaja">
                                    <b><axis:alt f="axissin039" c="TRAMITACIOINFORMATIVA" lit="9000905"/></b><!-- Tramitación informativa -->
                                    
                                </td>                        
                        
                            </tr>
                            <tr>
                             <td class="campocaja">
                         <input type="text" name="NSINIES_O" id="NSINIES_O"  class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin039" c="NSINIES" a="modificable=false"/> />
                            
                        </td>
                                    <td class="campocaja">
                                     <input type="text" name="TTIPTRA" value="${sessionScope.tramitaciones_min[linea_trami].TTIPTRA}" class="campodisabled campo campotexto" style="width:90%"
                                        <axis:atr f="axissin011" c="TTIPTRA" a="modificable=false&obligatorio=false"/> />
                                        
                                    </td>
                                    <td class="campocaja">
                                     <input type="text" name="TTRAMIT" value="${sessionScope.tramitaciones_min[linea_trami].TTRAMIT}" class="campodisabled campo campotexto" style="width:90%"
                                        <axis:atr f="axissin011" c="TTRAMIT" a="modificable=false"/> />
                                        
                                    </td>                        
                                    <td class="campocaja">
                                        <input type="text" name="TTCAUSIN" value="${sessionScope.tramitaciones_min[linea_trami].TTCAUSIN}" class="campodisabled campo campotexto" style="width:90%"
                                        <axis:atr f="axissin011" c="TTCAUSIN" a="modificable=false"/> />
                                    </td>
                                    <td class="campocaja" align="left">
                                    <input type="checkbox" disabled  id="CINFORM" name="CINFORM" <axis:atr f="axissin011" c="CINFORM" a="modificable=false"/> value="${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.CINFORM}" 
                                    <c:if test="${sessionScope.tramitaciones_min[linea_trami].CINFORM == '1'}">checked</c:if> >
                                    </td>                        
                                    
            
                             </tr>
                               
                                
                             <tr>
                                <td class="titulocaja">
                                        <b><axis:alt f="axissin039" c="ESTADO" lit="100587"/></b><!-- Estado -->
                                    </td>
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin039" c="SUBESTADO" lit="9000852"/></b><!--Subestado -->
                                    </td>
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin039" c="UNIDADTRAMITA" lit="9000900"/></b><!-- Unidad tramitacion -->
                                    </td>
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin039" c="TRAMITADOR" lit="140769"/></b><!-- Tramitador -->
                                    </td>
             
                                    <td class="titulocaja">
                                        
                                    </td>
                                </tr>
                                <tr>
                                 
                                <td class="campocaja">
                                        <input type="text" name="TESTTRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TESTTRA}" class="campodisabled campo campotexto" style="width:90%"
                                        <axis:atr f="axissin011" c="TESTTRA" a="modificable=false"/> />
                                    </td>
                                    <td class="campocaja">
                                        <input type="text" name="TSUBTRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TSUBTRA}" class="campodisabled campo campotexto" style="width:90%"
                                        <axis:atr f="axissin011" c="TSUBTRA" a="modificable=false"/> />                        
                                    </td>                          
                                    <td class="campocaja">
                                        <input type="text" name="TUNITRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TUNITRA}" class="campodisabled campo campotexto" style="width:90%"
                                        <axis:atr f="axissin011" c="TUNITRA" a="modificable=false"/> />
                                    
                                        
                                    </td>
                                    <td class="campocaja">
                                       <input type="text" name="TTRAMITAD" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TTRAMITAD}" class="campodisabled campo campotexto" style="width:90%"
                                        <axis:atr f="axissin011" c="TTRAMITAD" a="modificable=false"/> />
                                    </td>
            
                                                      
                                    <td class="campocaja">
                                         
                                    </td>
                        </tr>
                        
                        <c:if test="${__formdata.LSTPERSONASRE == 1}">  


                            <tr> 
                                        <td class="campocaja" colspan="5">
                                            <!-- bug 0024690 cambio literal title2 abans 102844  -->
                                            <c:set var="title1"><axis:alt f="axissin039" c="tNPERSREL" lit="9000455" /></c:set><!-- N?m.l�a -->
                                            <c:set var="title2"><axis:alt f="axissin039" c="tCTIPIDE" lit="9001604" /></c:set><!-- Relacion -->
                                            <c:set var="title3"><axis:alt f="axissin039" c="tNNUMIDE" lit="102999" /></c:set><!--N?m. Document-->
                                            <c:set var="title4"><axis:alt f="axissin039" c="tTNOMBRE" lit="105940" /></c:set><!--Nombre-->
                                            <c:set var="title5"><axis:alt f="axissin039" c="tTAPELLI1" lit="108243" /></c:set><!--Apellido 1--> 
                                            <c:set var="title6"><axis:alt f="axissin039" c="tTAPELLI2" lit="108246" /></c:set><!--Apellido 2-->
                                            <c:set var="title7"><axis:alt f="axissin039" c="tTTELEFON" lit="9000992" /></c:set><!--Tel馯no-->
                                            <c:set var="title8"><axis:alt f="axissin039" c="tTDESC" lit="100588" /></c:set><!--Descripci?>
                                            <c:set var="title9"><axis:alt f="axissin039" c="tEDITAR" lit="100002" /></c:set><!--Editar-->
                                            <c:set var="title10"><axis:alt f="axissin039" c="tDELETE" lit="1000127"/></c:set><!--Eliminar-->
                                            <c:set var="title11"><axis:alt f="axissin039" c="tTNOMBRE2" lit="9902260"/></c:set><!--Segundo nombre-->
                                            <c:set var="title12"><axis:alt f="axissin039" c="tTMOVIL" lit="9903007"/></c:set><!--movil-->
                                            <c:set var="title13"><axis:alt f="axissin039" c="tTEMAIL" lit="109792"/></c:set><!--email-->
                                            <c:set var="num_tramitacion">0</c:set>  
                    
                                            <div class="displayspace">
                                              <display:table name="${__formdata.LISTPERRELACIONADAS}" id="T_IAX_PERSONAS" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column headerClass="headwidth5 sortable" title=" " media="html" autolink="false" sortable="false">
                                                    <div class="dspIcons">
                                                    <input value="" type="radio" id="PERRELACIONADAS" name="PERRELACIONADAS"
                                                            onclick="javascript:f_sel_persona('${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.SPERSON}',
                                                                                              '${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.CTIPREL}',
                                                                                              '${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.NNUMIDE}',
                                                                                              '${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.TNOMBRE}',
                                                                                              '${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.TAPELLI1}',
                                                                                              '${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.TAPELLI2}',
                                                                                              '${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.TTELEFON}',
                                                                                              '${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.DEC_SPERSON}',
                                                                                              '${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.TNOMBRE2}',
                                                                                              '${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.TMOVIL}',
                                                                                              '${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.TEMAIL}')" 
                                                    /></div>
                                                </display:column>
                                                <display:column title="${title1}" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspNumber">${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.NPERSREL}</div>
                                                </display:column>
                                                <!-- bug 0024690 cambio antes CTIPIDE -->
                                                <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspNumber">${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.TTIPREL}</div>
                                                </display:column>
                                                <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspNumber">${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.NNUMIDE}</div>
                                                </display:column>
                                                <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspNumber">${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.TNOMBRE}</div>
                                                </display:column>
                                                 <display:column title="${title11}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspNumber">${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.TNOMBRE2}</div>
                                                </display:column>
                                                <display:column title="${title5}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspNumber">${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.TAPELLI1}</div>
                                                </display:column>
                                                <display:column title="${title6}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspNumber">${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.TAPELLI2}</div>
                                                </display:column>
                                                <display:column title="${title7}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspNumber">${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.TTELEFON}</div>
                                                </display:column>
                                                <display:column title="${title12}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspNumber">${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.TMOVIL}</div>
                                                </display:column>
                                                <display:column title="${title8}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspNumber">${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.TDESC}</div>
                                                </display:column>
                                                <display:column title="${title13}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspNumber">${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.TEMAIL}</div>
                                                </display:column>
                                                
                                            <%--    <axis:ocultar f="axissin006" c="BT_SIN_EDITAR"> 
                                                <display:column title="${title9}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                     <div class="dspIcons" id="BT_SIN_EDITAR"><img border="0" alt="<axis:alt f="axissin039" c="BT_SIN_EDITAR" lit="100002"/>" title1="<axis:alt f="axissin039" c="BT_SIN_EDITAR" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="f_abrir_modal('axissin039',null,'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&NPERSREL='+${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.NPERSREL}+'&MODO=MOD'+'&NSINIES='+document.miForm.NSINIES.value+'&subpantalla=tramitaciones&seccion=tramitaciones_personarel');"/></div>
                                                    
                                                </display:column>
                                                 </axis:ocultar>
                                                 <axis:ocultar f="axissin006" c="BT_SIN_DELETE"> 
                                                <display:column title="${title10}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                    <div class="dspIcons" id="BT_SIN_DELETE"><img border="0" alt="<axis:alt f="axissin039" c="BT_SIN_DELETE" lit="1000127"/>" title1="<axis:alt f="axissin039" c="BT_SIN_DELETE" lit="1000127"/>" src="images/delete.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="javascript:f_borrar_personarel(${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.NPERSREL});"/></div>
                                                </display:column>
                                                </axis:ocultar>
                                               --%>
                                            </display:table>
                                            </div>
                                        </td>
                                   
                            </tr>  
                            </c:if>
                    
                            
                            <!-- RADIOS SELECCION -->
                            <c:if test="${__formdata.LSTPERSONASRE != 1}">  

                                            <!-- ini bug 0024690 -->
                                            <tr>
                                               <axis:ocultar f="axissin039" c="CTIPREL">
                                                    <td class="titulocaja">
                                                            <b><axis:alt f="axissin039" c="CTIPREL" lit="9902248"/></b><!-- Tipo de persona relacionada -->
                                                    </td>
                                               </axis:ocultar>
                                            </tr>
                                            <tr>
                                               <axis:ocultar f="axissin039" c="CTIPREL">
                                                <td class="campocaja">
                                                <select name="CTIPREL" id="CTIPREL" onchange=""  size="1" title="<axis:alt f="axissin039" c="CTIPREL" lit="9902248"/>" class="campowidthselect campo campotexto"  style="width:100%;"
                                                <axis:atr f="axissin039" c="CTIPREL" a="modificable=true"/>>&nbsp;
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin039" c="SV_COMBO" lit="9902248"/> - </option>
                                                    <c:forEach var="element" items="${__formdata.listValores.tipPerRela}">
                                                        <option value = "${element.CATRIBU}" 
                                                            <c:if test="${element.CATRIBU == __formdata.CTIPREL}"> selected </c:if> />
                                                            ${element.TATRIBU} 
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                                </td>
                                               </axis:ocultar>
                                            </tr>
                                            <!-- fin bug 0024690 -->

                                            <tr><!-- Dades persona -->
                                                <td class="titulocaja" colspan="2">
                                                   <input value="0" type="radio"  id="radioLocaliza" name="radioLocaliza" onclick="f_verifica_textarea(this.value);" <c:if test="${empty __formdata.TDESC}">checked</c:if>/><!-- LOCALIZA -->
                                                   <b><axis:alt f="axissin039" c="PERSONA" lit="110275" /></b> 
                                                </td>         
                                                <!-- Descripció -->
                                                <td class="titulocaja" colspan="2">
                                                    <input value="1" type="radio" id="radioLocaliza" name="radioLocaliza" onclick="f_verifica_textarea(this.value);"  <c:if test="${!empty __formdata.TDESC}">checked</c:if>/>
                                                    <b><axis:alt f="axissin039" c="DESCRIPCION" lit="100588" /></b>&nbsp;
                                                    
                                                </td>
                                                
                                            </tr>                            
                            
                            <!-- NNUMIDE -->
                                <tr>
                                    <td class="titulocaja">
                                        <input type="hidden" id="DEC_SPERSON" name="DEC_SPERSON" value="${__formdata.DEC_SPERSON}">
                                        <b><axis:alt f="axissin039" c="DEC_SPERSON" lit="102844"/></b>
                                    </td>
                                    <td class="titulocaja">
                                        <axis:visible f="axissin032" c="NNUMIDE">
                                            <b><axis:alt f="axissin039" c="NNUMIDE" lit="102999" /></b>
                                        </axis:visible>
                                    </td>  
                                </tr>
                                
                                <tr>
                                    <td class="campocaja">
                                 <select name="CTIPIDE" id="CTIPIDE" onchange=""  size="1" title="<axis:alt f="axissin039" c="CTIPIDE" lit="109774"/>" class="campowidthselect campo campotexto"  style="width:100%;"
                                    <axis:atr f="axisper010" c="CTIPIDE" a="isInputText=false&modificable=true"/>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin039" c="SV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipDocum}">
                                            <option value = "${element.CATRIBU}" 
                                                <c:if test="${element.CATRIBU == __formdata.CTIPIDE}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                    </td>
                             <td class="campocaja">
                                <axis:visible f="axissin032" c="NNUMIDE">
                                    <input   type="text" class="campowidthinput campo campotexto" onchange="f_existe_persona(this.value)" 
                                    id="NNUMIDE" name="NNUMIDE" size="15"  value="${__formdata.NNUMIDE}"/>
                                </axis:visible>
                                </td>  
                                
                                <td class="campocaja">
                                    <img border="0" id="BUSCAR_PERSONA" name="BUSCAR_PERSONA" src="images/find.gif" title="<axis:alt f="axissin039" c="BUSCAR_PERSONA" lit="1000065"/>" alt="<axis:alt f="axissin039" c="BUSCAR_PERSONA" lit="1000065"/>" onclick="f_abrir_axisper021()" style="cursor:pointer"/>
                                    &nbsp;&nbsp;
                                    <img border="0" name="REINICIAR_PERSONA" id="REINICIAR_PERSONA" src="images/update.gif" title="<axis:alt f="axissin039" c="REINICIAR_PERSONA" lit="9901042"/>" alt="<axis:alt f="axissin039" c="REINICIAR_PERSONA" lit="9901042"/>" onclick="f_actualizar_campos(1)" style="cursor:pointer"/>
                                    &nbsp;&nbsp;
                                    <axis:ocultar f="axissin039" c="NOVA_PERSONA">   
                                        <img border="0" id="NOVA_PERSONA" name="NOVAPERSONA" src="images/new.gif" title="<axis:alt f="axissin039" c="NOVA_PERSONA" lit="1000436"/>" alt="<axis:alt f="axissin039" c="NOVA_PERSONA" lit="1000436"/>" onclick="f_alta_persona()" style="cursor:pointer"/>
                                    </axis:ocultar>   
                                    &nbsp;&nbsp;
                                    <axis:ocultar f="axissin039" c="INFO_PERSONA">   
                                        <img border="0" id="INFO_PERSONA" name="INFO_PERSONA" title="<axis:alt f="axissin039" c="INFO_PERSONA" lit="9000968"/>" alt="<axis:alt f="axissin039" c="INFO_PERSONA" lit="9000968"/>" name="INFO_PERSONA" src="images/informacion.gif" onclick="f_consulta_persona()" style="cursor:pointer"/>
                                    </axis:ocultar>   
                                    &nbsp;&nbsp;
                                </td>
                                 
                                
                            </tr>
                            <tr>
                                <!-- Nombre -->
                                 <axis:visible f="axissin039" c="TNOMBRE">   
                                 <td class="titulocaja"> 
                                    <b><axis:alt f="axissin039" c="TNOMBRE" lit="105940" /></b>
                                </td>
                                </axis:visible>
                                 <!-- Nombre 1-->
                                    <axis:visible f="axissin039" c="TNOMBRE1">
                                  	 <td class="titulocaja"> 
                                        <b><axis:alt f="axissin039" c="TNOMBRE1" lit="105940" /></b>
                                     </td>
                                  </axis:visible>
                                 <!-- Nombre2 -->
                                 <axis:visible f="axissin039" c="TNOMBRE2">
                                      <td class="titulocaja"> 
										<b><axis:alt f="axissin039" c="TNOMBRE2" lit="9902260" /></b>
									  </td>
                                </axis:visible>
                                <!-- 1r Apellido -->
                                <td class="titulocaja">
                                <axis:ocultar f="axissin039" c="TAPELLI1">
                                    <b><axis:alt f="axissin039" c="TAPELLI1" lit="108243" /></b>
                                </axis:ocultar>
                                </td>
                                <!-- 2n Apellido -->
                                <td class="titulocaja">
                                <axis:ocultar f="axissin039" c="TAPELLI2">
                                    <b><axis:alt f="axissin039" c="TAPELLI2" lit="108246" /></b>
                                </axis:ocultar>
                                </td>
                                 <!-- Telefono -->
                                <td class="titulocaja">
                                <axis:ocultar f="axissin039" c="TTELEFON">
                                    <b><axis:alt f="axissin039" c="TTELEFON" lit="9000992" /></b>
                                </axis:ocultar>
                                </td>           
                                                                 
                            </tr>
                            <tr>
                                <!-- Nombre -->
                               <axis:visible f="axissin039" c="TNOMBRE">
                                <td class="campocaja">
                                    <input   type="text" class="campowidthinput campo campotexto" id="TNOMBRE" name="TNOMBRE" size="15"  value="${__formdata.TNOMBRE}"/>
                                </td>
                                </axis:visible>
                                <!-- Nombre 1 -->
                                <axis:visible f="axissin039" c="TNOMBRE1">
                                	 <td class="campocaja">
                                    <input   type="text" class="campowidthinput campo campotexto" id="TNOMBRE1" name="TNOMBRE1" 
                                    <axis:atr f="axissin039" c="TNOMBRE1" a="obligatorio=false"/>
                                    size="15"  value="${__formdata.TNOMBRE}"/>
                                    </td>
                                </axis:visible>
                                
                                <!-- Nombre 2-->
                                <axis:visible f="axissin039" c="TNOMBRE2">
                                	 <td class="campocaja">
                                    <input type="text"  class="campowidthinput campo campotexto" id="TNOMBRE2" name="TNOMBRE2" 
                                    <axis:atr f="axissin039" c="TNOMBRE2" a="obligatorio=false"/>
                                    size="15"  value="${__formdata.TNOMBRE2}"/>
                                      </td>
                                </axis:visible>
                                
                                <!-- 1r Apellido -->
                                <td class="campocaja">
                                <axis:ocultar f="axissin039" c="TAPELLI1">
                                    <input   type="text" class="campowidthinput campo campotexto" id="TAPELLI1" name="TAPELLI1" size="15"  value="${__formdata.TAPELLI1}"/>
                                </axis:ocultar>
                                </td>
                                <!-- 2n Apellido -->
                                <td class="campocaja">
                                <axis:ocultar f="axissin039" c="TAPELLI2">
                                    <input   type="text" class="campowidthinput campo campotexto" id="TAPELLI2" name="TAPELLI2" size="15"  value="${__formdata.TAPELLI2}"/>
                                </axis:ocultar>
                                </td> 
                                <!-- Telefono -->
                                <td class="campocaja">
                                <axis:ocultar f="axissin039" c="TTELEFON">
                                    <input   type="text" class="campowidthinput campo campotexto" id="TTELEFON" name="TTELEFON" size="15"  value="${__formdata.TTELEFON}"/>
                                </axis:ocultar>
                                </td>    
                            </tr>     
                            <tr>   
                               <%-- </td>  --%>
                                 <!-- Telefono movil-->
                               
                                <axis:ocultar f="axissin039" c="TMOVIL">  
                                	 <td class="titulocaja">
                                    <b><axis:alt f="axissin039" c="TMOVIL" lit="9903007" /></b>
                                    </td> 	
                                </axis:ocultar>
                                
                                   <!-- email -->
                                
                                <axis:ocultar f="axissin039" c="TEMAIL"> 
                                	<td class="titulocaja">
                                    <b><axis:alt f="axissin039" c="TEMAIL" lit="109792" /></b>
                                    	 </td>  
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <!-- Telefono mov-->
                                <axis:ocultar f="axissin039" c="TMOVIL">
                                	  <td class="campocaja">
                                    <input  type="text" class="campowidthinput campo campotexto" id="TMOVIL" name="TMOVIL"
                                    <axis:atr f="axissin039" c="TMOVIL" a="obligatorio=false"/>
                                    size="8"  value="${__formdata.TMOVIL}"/>
                                     </td> 
                                </axis:ocultar>
                               
                                 <!-- email -->
                                <axis:ocultar f="axissin039" c="TEMAIL">
                                	<td class="campocaja">
                                    <input  type="text" class="campowidthinput campo campotexto" id="TEMAIL" name="TEMAIL" 
                                     <axis:atr f="axissin039" c="TEMAIL" a="obligatorio=false"/>
                                    size="15"  value="${__formdata.TEMAIL}"/>
                                    </td>  
                                </axis:ocultar>
                            </tr>   
                            </c:if>
                         </table>
                    </td>
                </tr>
                            
                            
                            <c:if test="${__formdata.LSTPERSONASRE != 1}"> 
                            <tr>
                             <!-- Descripción de la persona-->
 
                                <td class="titulocaja">
                                <axis:ocultar c="TDESC" f="axissin039" dejarHueco="false">
                                    <b><axis:alt f="axissin039" c="TDESC" lit="100588" /></b>
                                </axis:ocultar>
                                </td>
                            </tr>
                            <tr>
                            <!-- Descripción del siniestro -->
                                 <td colspan="4" style="width:100%;"  class="campocaja"> <!-- colspan="5" -->
                                 <%--axis:ocultar c="TDESC" f="axissin039" dejarHueco="false" --%>
                                     <textarea id="TDESC" name="TDESC" class="campowidthinput campo campotexto" style="width:100%;" >${__formdata.TDESC}</textarea>
                                 <%--/axis:ocultar--%>
                                 </td>
                              </tr>
                             </c:if> 
                             
                            
                           <%-- </table> --%>
            
            
            
                
                
            </td>
        </tr>
    </table>
  </td>
</tr>
</table>
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin039</c:param><c:param name="f">axissin039</c:param><c:param name="f">axissin039</c:param><c:param name="f">axissin039</c:param><c:param name="f">axissin039</c:param><c:param name="f">axissin039</c:param><c:param name="f">axissin039</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>
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
                inputField     :    "FNOTIFI",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FNOTIFI", 
                singleClick    :    true,
                firstDay       :    1
            });
</script>
  <c:import url="../include/mensajes.jsp" />
</body>
</html>

