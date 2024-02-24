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
        <c:import url="../include/carga_framework_js.jsp" />
        
        <%--Inicio Sólo si vamos a tener un campo fecha --%>
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
        <%-- fin Sólo si vamos a tener un campo fecha --%>
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
                f_cargar_propiedades_pantalla();
                var guardat = "${__formdata.guardat}";
                if ((!objUtiles.estaVacio(guardat))&&(guardat=="0")){
                    parent.f_aceptar_axissin049();
                }else if (objUtiles.estaVacio(guardat)){
                    getPoblacDesc();
                }
                //Si es modo consulta
                if (objDom.getValorPorId("MODO")=='2'){
                    setWindowsReadOnly();
                }
                f_cargar_propiedades_pantalla();
                
 	    }
            function setWindowsReadOnly(){
                objDom.setVisibilidadPorId("but_aceptar", "hidden");
                var inputs=document.getElementsByTagName("input");
                for (i=0;i<inputs.length;i++) {
                    if ((inputs[i].id != null) && (inputs[i].id != "")&& (inputs[i].id != "but_cancelar")){
                        objDom.setDisabledPorId(inputs[i].id, true);
                        inputs[i].setAttribute("obligatorio", "false");
                    }
                }
                
                
                
                
                var imgenes=document.getElementsByTagName("img");
                for (i=0;i<imgenes.length;i++) {
                    if ((imgenes[i].id != null) && (imgenes[i].id != "")){
                        objDom.setVisibilidadPorId(imgenes[i].id, "hidden");
                        imgenes[i].setAttribute("obligatorio", "false");
                    }
                }
                var selects=document.getElementsByTagName("select");
                for (i=0;i<selects.length;i++) {
                    if ((selects[i].id != null) && (selects[i].id != "")){
                        objDom.setDisabledPorId(selects[i].id, true);
                        selects[i].setAttribute("obligatorio", "false");
                    }
                }
                var textareas=document.getElementsByTagName("textarea");
                for (i=0;i<textareas.length;i++) {
                    if ((textareas[i].id != null) && (textareas[i].id != "")){
                        objDom.setDisabledPorId(textareas[i].id, true);
                        textareas[i].setAttribute("obligatorio", "false");
                    }
                }
            }
            function getPoblacDesc(){
                var vpais = objDom.getValorPorId("CPAIS");
                var vprovin = objDom.getValorPorId("CPROVIN");
                var vpoble = objDom.getValorPorId("CPOBLAC");
                if (!objUtiles.estaVacio(vpais)){
                    f_onchange_CPAIS();
                }
                if (!objUtiles.estaVacio(vprovin)){
                    objDom.setValorPorId("CPROVIN", vprovin);
                    f_onchange_CPROVIN();
                }
                if (!objUtiles.estaVacio(vpoble)){
                    objDom.setValorPorId("CPOBLAC", vpoble);
                    f_onchange_CPOBLAC();
                }
                
            }
        
            function f_but_cancelar(){
                parent.f_cerrar_axissin049();
            }
            function f_but_aceptar() {
                if (objValidador.validaEntrada()){
                objAjax.invokeAsyncCGI_JSON("modal_axissin049.do?operation=preguntaMensajes"+
                                            "&NSINIES="+objDom.getValorPorId("NSINIES")+
                                            "&NTRAMIT="+objDom.getValorPorId("NTRAMIT")+
                                            "&CORGJUD="+objDom.getValorPorId("CORGJUD")+
                                            "&NORGJUD="+objDom.getValorPorId("NORGJUD")+
                                            "&NLINJUZ="+objDom.getValorPorId("NLINJUZ")+
                                            "&TREFJUD="+objDom.getValorPorId("TREFJUD")+
                                            "&CSIGLAS="+objDom.getValorPorId("CSIGLAS")+
                                            "&TDIREC="+objDom.getValorPorId("TDIREC")+
                                            "&CPOSTAL="+objDom.getValorPorId("CPOSTAL")+
                                            "&CPAIS="+objDom.getValorPorId("CPAIS")+
                                            "&CPROVIN="+objDom.getValorPorId("CPROVIN")+
                                            "&CPOBLAC="+objDom.getValorPorId("CPOBLAC")+
                                            "&TASUNTO="+objDom.getValorPorId("TASUNTO")+
                                            "&NCLASEDE="+objDom.getValorPorId("NCLASEDE")+
                                            "&NTIPOPRO="+objDom.getValorPorId("NTIPOPRO")+
                                            "&NPROCEDI="+objDom.getValorPorId("NPROCEDI")+
                                            "&FNOTIASE="+objDom.getValorPorId("FNOTIASE")+
                                            "&FRECPDEM="+objDom.getValorPorId("FRECPDEM")+
                                            "&FNOTICIA="+objDom.getValorPorId("FNOTICIA")+
                                            "&FCONTASE="+objDom.getValorPorId("FCONTASE")+
                                            "&FCONTCIA="+objDom.getValorPorId("FCONTCIA")+
                                            "&FAUDPREV="+objDom.getValorPorId("FAUDPREV")+
                                            "&FJUICIO="+objDom.getValorPorId("FJUICIO")+
                                            "&CMONJUZ="+objDom.getValorPorId("CMONJUZ")+
                                            "&CPLEITO="+objDom.getValorPorId("CPLEITO")+
                                            "&IPLEITO="+objDom.getValorPorId("IPLEITO")+
                                            "&IALLANA="+objDom.getValorPorId("IALLANA")+
                                            "&ISENTENC="+objDom.getValorPorId("ISENTENC")+
                                            "&ISENTCAP="+objDom.getValorPorId("ISENTCAP")+
                                            "&ISENTIND="+objDom.getValorPorId("ISENTIND")+
                                            "&ISENTCOS="+objDom.getValorPorId("ISENTCOS")+
                                            "&ISENTINT="+objDom.getValorPorId("ISENTINT")+
                                            "&ISENTOTR="+objDom.getValorPorId("ISENTOTR")+
                                            "&CARGUDEF="+objDom.getValorPorId("CARGUDEF")+
                                            "&CRESPLEI="+objDom.getValorPorId("CRESPLEI")+
                                            "&CAPELANT="+objDom.getValorPorId("CAPELANT")+
                                            "&THIPOASE="+objDom.getValorPorId("THIPOASE")+
                                            "&THIPOTER="+objDom.getValorPorId("THIPOTER")+
                                            "&TTIPRESP="+objDom.getValorPorId("TTIPRESP")+
                                            "&COPERCOB="+objDom.getValorPorId("COPERCOB")+
                                            "&TREASMED="+objDom.getValorPorId("TREASMED")+
                                            "&CESTPROC="+objDom.getValorPorId("CESTPROC")+
                                            "&CETAPROC="+objDom.getValorPorId("CETAPROC")+
                                            "&TCONCJUR="+objDom.getValorPorId("TCONCJUR")+
                                            "&TESTRDEF="+objDom.getValorPorId("TESTRDEF")+
                                            "&TRECOMEN="+objDom.getValorPorId("TRECOMEN")+
                                            "&TOBSERV="+objDom.getValorPorId("TOBSERV")+
                                            "&FCANCEL="+objDom.getValorPorId("FCANCEL"), callbacPregunta, objJsMessages.jslit_cargando);
                }
            }
            
            function callbacPregunta(p){
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
                if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                    var mensajes = p.JSON2.resultado.OTEXTO;
                    if (!objUtiles.estaVacio(p.JSON2.resultado.OTEXTO)){
                       var confirma=confirm(mensajes);
                       if (confirma) {
                          objUtiles.ejecutarFormulario("modal_axissin049.do", "aceptar", document.miForm, "_self",  objJsMessages.jslit_cargando);
                       }
                    }else{
                        objUtiles.ejecutarFormulario("modal_axissin049.do", "aceptar", document.miForm, "_self",  objJsMessages.jslit_cargando);
                    }
                }  else{alert ("hay errores");}
            }
            
            function f_recargar(){
                f_cargar_propiedades_pantalla();
            }
        
        /*********************************************************************************************/
         function f_onchange_CPAIS() {
            var CPAIS=objDom.getValorPorId("CPAIS");
            if (!objUtiles.estaVacio(CPAIS)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPAIS";
                qs=qs+"&CPAIS="+CPAIS
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisctr042.do", callbackajaxdireccion, qs, this)
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
                objAjax.invokeAsyncCGI("modal_axisctr042.do", callbackajaxdireccion, qs, this)
            } else {
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
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
                objAjax.invokeAsyncCGI("modal_axisctr042.do", callbackajaxdireccion, qs, this)
            }else{
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
                limpiaCampos("CPROVIN");
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
        }
        
        function callbackajaxdireccion (ajaxResponseText){
            try{ 
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPAIS", "");
                            objDom.setValorHTMLPorId("TPAIS_span", "<b>" + objJsMessages.jslit_codigo_pais_incorrecto +"</b>");
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
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPROVIN")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPROVIN", "");
                            objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + objJsMessages.jslit_codigo_provincia_incorrecto +"</b>");
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
                            objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + objJsMessages.jslit_codigo_poblacion_incorrecto +"</b>");
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
        
        function f_onblur_CPOSTAL(CPOSTAL) {
            if (!objUtiles.estaVacio(CPOSTAL)){
				document.miForm.CPAIS.focus();
                objAjax.invokeAsyncCGI('modal_axisctr042.do', callbackAjaxOnblurCPOSTAL, 'operation=getProvinPobla&CPOSTAL=' + CPOSTAL, this);
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
        function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION, CPOSTAL){
             objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
              "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION+ "&CODIGO_CP=" + CPOSTAL);
        }
        
        function f_aceptar_axiscom001(CODIGO, TEXTO, CODIGO_CONSULTA){
            f_cerrar_axiscom001();
            if (!objUtiles.estaVacio(TEXTO))
                TEXTO = objUtiles.replaceAll(TEXTO, "-quote-", "\'");
          
            if (CODIGO_CONSULTA == "LISTA_PAIS") {
                objDom.setValorPorId("CPAIS", CODIGO);
                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + TEXTO + "</b>");
                objDom.setVisibilidadPorId("findProvincia", "visible");
                limpiaCampos("CPAIS");
             }else if (CODIGO_CONSULTA == "LISTA_PROVINCIA") {
                objDom.setValorPorId("CPROVIN", CODIGO);
                objDom.setVisibilidadPorId("findPoblacion", "visible");
                objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + TEXTO + "</b>");
                limpiaCampos("CPROVIN");
             }else if (CODIGO_CONSULTA == "LISTA_POBLACION") {
                objDom.setValorPorId("CPOBLAC", CODIGO);
                objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + TEXTO + "</b>");
             }
        }
        
        function f_cerrar_axiscom001() {
            objUtiles.cerrarModal("axiscom001");
        }
        
        function actualizaImporteTotal(){
            var total=0;
            if (objDom.getValorPorId("ISENTCAP")!=''){
                total+=parseInt(objDom.getValorPorId("ISENTCAP"));
            }
            if (objDom.getValorPorId("ISENTIND")!=''){
                total+=parseInt(objDom.getValorPorId("ISENTIND"));
            }
            if (objDom.getValorPorId("ISENTCOS")!=''){
                total+=parseInt(objDom.getValorPorId("ISENTCOS"));
            }
            if (objDom.getValorPorId("ISENTINT")!=''){
                total+=parseInt(objDom.getValorPorId("ISENTINT"));
            }
            objDom.setValorPorId("ISENTENC",total);
        }
        /*******************************************************************************************/
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
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>

   <form name="miForm" action="" method="POST">
       <input type="hidden" id="operation" name="operation" value=""/>
       <input type="hidden" name="NSINIES" id="NSINIES" value="${__formdata.NSINIES}"/>
       <input type="hidden" name="NTRAMIT" id="NTRAMIT" value="${__formdata.NTRAMIT}"/>
       <input type="hidden" name="NLINJUZ" id="NLINJUZ" value="${__formdata.NLINJUZ}"/>
       <input type="hidden" name="MODO" id="MODO" value="${__formdata.MODO}"/>
       
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
        </c:import>
		
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper041|<axis:alt c="axisper041_TITULO" f="axisper041" lit="9002274"/></c:param>
    </c:import>
	
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper042|<axis:alt c="axisper042_TITULO" f="axisper042" lit="9002274"/></c:param>
	</c:import>
           
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axissin049" c="TIT_axissin049" lit="9902756" /></c:param>
                <c:param name="formulario"><axis:alt f="axissin049" c="TIT_axissin049" lit="9902756" /></c:param>
                <c:param name="form">axissin049</c:param>
            </c:import>
            
            <div class="separador">&nbsp;</div>
                      <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                    <table class="seccion">
                        <tr>
                            <td>
                                <table class="area" align="center">
                                   <tr>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                   </tr>    
                                   <tr>
                                        <axis:ocultar f="axissin049" c="CORGJUD">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axissin049" c="CORGJUD" lit="9902795" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="NORGJUD">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axissin049" c="NORGJUD" lit="9902758" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="TREFJUD">
                                         <td class="titulocaja">
                                            <b><axis:alt f="axissin049" c="TREFJUD" lit="9902759" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="TDIREC">
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axissin049" c="TDIREC" lit="9000914" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="CORGJUD">
                                        <td class="campocaja" id="td_CORGJUD" >
                                            <select name="CORGJUD" id="CORGJUD" onchange="f_recargar();"
                                            style="width:95%;" size="1"  title="<axis:alt c="CORGJUD" f="axissin049" lit="9902795"/>"
                                            <axis:atr f="axissin049" c="CORGJUD" a="modificable=true&isInputText=false&obligatorio=true"/> 
                                            class="campowidthselect campo campotexto">
                                            <option value = ""> - <axis:alt c="COMBO_SNV" f="axissin049" lit="108341"/> - </option>
                                            <c:forEach var="cmb_CORGJUD" items="${__formdata.lst_CORGJUD}">
                                                <option value = "${cmb_CORGJUD.CATRIBU}"
                                                    <c:if test="${!empty __formdata.CORGJUD && cmb_CORGJUD.CATRIBU == __formdata.CORGJUD}">selected</c:if>>
                                                    ${cmb_CORGJUD.TATRIBU}
                                                </option>
                                            </c:forEach>
                                            </select>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="NORGJUD">
                                        <td class="campocaja">
                                            <!-- varchar de certificado -->
                                            <input type="text" class="campo campotexto" id="NORGJUD" name="NORGJUD" size="10" style="width:90%"
                                            <axis:atr f="axissin049" c="CORGJUD" a="obligatorio=true"/> value="${__formdata.NORGJUD}" maxlength="10" 
                                            title="<axis:alt f="axissin049" c="NORGJUD" lit="9902758"/>"/>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="TREFJUD">
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" id="TREFJUD" name="TREFJUD" size="15"
                                            value="${__formdata.TREFJUD}" maxlength="20" title="<axis:alt f="axissin049" c="TREFJUD" lit="9902759"/>" 
                                            <axis:atr f="axissin049" c="TREFJUD" a="obligatorio=false"/> />
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="TDIREC">
                                         <!-- producto -->
                                        <td class="campocaja" colspan="2">
                                            <input type="text" style="width:95%" class="campowidthinput campo campotexto" id="TDIREC" name="TDIREC" size="15"
                                            value="${__formdata.TDIREC}" maxlength="100" title="<axis:alt f="axissin049" c="TDIREC" lit="9000914"/>" 
                                            <axis:atr f="axissin049" c="TDIREC" a="obligatorio=false"/>/>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="CPOSTAL">
                                        <td class="titulocaja" colspan="1">
                                            <b><axis:alt f="axissin049" c="CPOSTAL" lit="101081"/></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="CPAIS">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axissin049" c="CPAIS" lit="100816" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="CPROVIN">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axissin049" c="CPROVIN" lit="100756"/></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="CPOBLAC">
                                         <td class="titulocaja">
                                            <b><axis:alt f="axissin049" c="CPOBLAC" lit="100817"/></b>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="CPOSTAL">
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOSTAL}" name="CPOSTAL" id="CPOSTAL" 
                                            style="text-transform:uppercase;width:40%;" onblur="f_onblur_CPOSTAL(this.value)"
                                            <axis:atr f="axissin049" c="CPOSTAL" a="modificable=true"/>/>
											&nbsp;
											<axis:ocultar c="CPOSTALFIND" f="axisper012" dejarHueco="false">
												<img id="findCpostal" border="0" src="images/find.gif" onclick="f_abrir_axisper042();" style="cursor:pointer" alt=""/>
											</axis:ocultar>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="CPAIS">
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPAIS}" name="CPAIS" id="CPAIS" 
                                            onchange="f_onchange_CPAIS()" style="width:18%;"  <axis:atr f="axissin049" c="CPAIS" a="formato=entero"/> 
                                            title="<axis:alt f="axissin049" c="CPAIS" lit="100816"/>" />&nbsp;<img id="findPais" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS', null);" style="cursor:pointer"/>
                                            &nbsp;<span id="TPAIS_span"><b>${__formdata.TPAIS}</b></span>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="CPROVIN">
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.CPROVIN}" name="CPROVIN" id="CPROVIN" onchange="f_onchange_CPROVIN()" style="width:18%;"
                                            <axis:atr f="axissin049" c="CPROVIN" a="formato=entero&obligatorio=true"/> title="<axis:alt f="axissin049" c="CPROVIN" lit="100756"/>"/>&nbsp;<img id="findProvincia" style="visibility:${empty __formdata.CPAIS ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', objDom.getValorPorId('CPAIS'))"/>                
                                            &nbsp;<span id="TPROVIN_span"><b>${__formdata.TPROVIN}</b></span>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="CPOBLAC">
                                        <td class="campocaja" colspan="2">
                                            <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.CPOBLAC}" name="CPOBLAC" id="CPOBLAC" onchange="f_onchange_CPOBLAC()" style="width:18%;"
                                            <axis:atr f="axissin049" c="CPOBLAC" a="formato=entero&obligatorio=true"/> title="<axis:alt f="axissin049" c="CPOBLAC" lit="100817"/>"/>
                                            &nbsp;<img id="findPoblacion" style="visibility:${empty __formdata.CPROVIN ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION', document.miForm.CPROVIN.value, document.miForm.CPOSTAL.value);"/>                
                                            &nbsp;<span id="TPOBLAC_span"><b>${__formdata.TPOBLAC}</b></span>
                                        </td>  
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="TASUNTO">
                                        <td class="titulocaja" colspan="1">
                                            <b><axis:alt f="axissin049" c="TASUNTO" lit="9902760"/></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="NCLASEDE">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axissin049" c="NCLASEDE" lit="9902761" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="NTIPOPRO">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axissin049" c="NTIPOPRO" lit="9902762"/></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="NPROCEDI">
                                         <td class="titulocaja">
                                            <b><axis:alt f="axissin049" c="NPROCEDI" lit="9902763"/></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="FNOTIASE">
                                         <td class="titulocaja" id="tit_FNOTIASE">
                                            <b id="label_FNOTIASE"><axis:alt f="axissin049" c="FNOTIASE" lit="9900795"/></b>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="TASUNTO">
                                        <!-- Numero de poliza -->
                                        <td class="campocaja">
                                            <input type="text" class="campo campotexto" id="TASUNTO" name="TASUNTO" style="width:90%"
                                            <axis:atr f="axissin049" c="TASUNTO" a="obligatorio=false"/> value="${__formdata.TASUNTO}" maxlength="30" 
                                            title="<axis:alt f="axissin049" c="TASUNTO" lit="9902760"/>"/>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="NCLASEDE">
                                        <td class="campocaja" id="td_NCLASEDE" >
                                            <select name="NCLASEDE" id="NCLASEDE" onchange="f_recargar();"
                                            style="width:95%;" size="1"  title="<axis:alt c="NCLASEDE" f="axissin049" lit="9902761"/>"
                                            <axis:atr f="axissin049" c="NCLASEDE" a="modificable=true&isInputText=false&obligatorio=true"/> 
                                            class="campowidthselect campo campotexto">
                                            <option value = ""> - <axis:alt c="COMBO_SNV" f="axissin049" lit="108341"/> - </option>
                                            <c:forEach var="cmb_NCLASEDE" items="${__formdata.lst_NCLASEDE}">
                                                <option value = "${cmb_NCLASEDE.CATRIBU}"
                                                    <c:if test="${!empty __formdata.NCLASEDE && cmb_NCLASEDE.CATRIBU == __formdata.NCLASEDE}">selected</c:if>>
                                                    ${cmb_NCLASEDE.TATRIBU}
                                                </option>
                                            </c:forEach>
                                            </select>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="NTIPOPRO">
                                        <td class="campocaja" id="td_NTIPOPRO" >
                                            <select name="NTIPOPRO" id="NTIPOPRO" onchange="f_recargar();"
                                            style="width:95%;" size="1"  title="<axis:alt c="NTIPOPRO" f="axissin049" lit="9902762"/>"
                                            <axis:atr f="axissin049" c="NTIPOPRO" a="modificable=true&isInputText=false&obligatorio=true"/> 
                                            class="campowidthselect campo campotexto">
                                            <option value = ""> - <axis:alt c="COMBO_SNV" f="axissin049" lit="108341"/> - </option>
                                            <c:forEach var="cmb_NTIPOPRO" items="${__formdata.lst_NTIPOPRO}">
                                                <option value = "${cmb_NTIPOPRO.CATRIBU}"
                                                    <c:if test="${!empty __formdata.NTIPOPRO && cmb_NTIPOPRO.CATRIBU == __formdata.NTIPOPRO}">selected</c:if>>
                                                    ${cmb_NTIPOPRO.TATRIBU}
                                                </option>
                                            </c:forEach>
                                            </select>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="NPROCEDI">
                                         <!-- producto -->
                                        <td class="campocaja" colspan="1">
                                            <input type="text" style="width:95%" class="campowidthinput campo campotexto" id="NPROCEDI" name="NPROCEDI" size="15"
                                            value="${__formdata.NPROCEDI}" maxlength="50" title="<axis:alt f="axissin049" c="NPROCEDI" lit="9902763"/>" 
                                            <axis:atr f="axissin049" c="NPROCEDI" a="obligatorio=true"/>/>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="FNOTIASE">
                                        <td class="campocaja" id="td_FNOTIASE">
                                           <input style="width:75%"  type="text" class="campowidthinput campo campotexto" id="FNOTIASE" name="FNOTIASE" size="15"
                                            value ="<fmt:formatDate value="${__formdata.FNOTIASE}" pattern="dd/MM/yyyy"/>" onblur="" 
                                            title="<axis:alt f="axissin049" c="FNOTIASE" lit="9900795"/>" <axis:atr f="axissin049" c="FNOTIASE" a="modificable=true&obligatorio=true&formato=fecha"/>/>
                                            <a id="icon_FNOTIASE" style="vertical-align:middle;" href="#">
                                                <img border="0" alt="<axis:alt f="axissin049" c="ICO_FNOTIASE" lit="108341" />" title="<axis:alt f="axissin049" c="FNOTIASE" lit="9900795"/>" src="images/calendar.gif"/></a>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="FRECPDEM">
                                        <td class="titulocaja" id="tit_FRECPDEM">
                                            <b id="label_FRECPDEM"><axis:alt f="axissin049" c="FRECPDEM" lit="9902765" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="FNOTICIA">
                                        <td class="titulocaja" id="tit_FNOTICIA">
                                            <b id="label_FNOTICIA"><axis:alt f="axissin049" c="FNOTICIA" lit="9902806" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="FCONTASE">
                                         <td class="titulocaja" id="tit_FCONTASE">
                                            <b id="label_FCONTASE"><axis:alt f="axissin049" c="FCONTASE" lit="9902766" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="FCONTCIA">
                                        <td class="titulocaja" colspan="1" id="tit_FCONTCIA">
                                            <b id="label_FCONTCIA"><axis:alt f="axissin049" c="FCONTCIA" lit="9902767" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="FAUDPREV">
                                        <td class="titulocaja" colspan="1" id="tit_FAUDPREV">
                                            <b id="label_FAUDPREV"><axis:alt f="axissin049" c="FAUDPREV" lit="9902768" /></b>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="FRECPDEM">
                                        <td class="campocaja" id="td_FRECPDEM">
                                           <input style="width:75%"  type="text" class="campowidthinput campo campotexto" id="FRECPDEM" name="FRECPDEM" size="15"
                                            value ="<fmt:formatDate value="${__formdata.FRECPDEM}" pattern="dd/MM/yyyy"/>" onblur="" 
                                            title="<axis:alt f="axissin049" c="FRECPDEM" lit="9902765"/>" <axis:atr f="axissin049" c="FRECPDEM" a="modificable=true&obligatorio=false&formato=fecha"/>/>
                                            <a id="icon_FRECPDEM" style="vertical-align:middle;" href="#">
                                                <img border="0" alt="<axis:alt f="axissin049" c="ICO_FRECPDEM" lit="9902765" />" title="<axis:alt f="axissin049" c="FRECPDEM" lit="9902765"/>" src="images/calendar.gif"/></a>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="FNOTICIA">
                                        <td class="campocaja" id="td_FNOTICIA">
                                           <input style="width:75%"  type="text" class="campowidthinput campo campotexto" id="FNOTICIA" name="FNOTICIA" size="15"
                                            value ="<fmt:formatDate value="${__formdata.FNOTICIA}" pattern="dd/MM/yyyy"/>" onblur="" 
                                            title="<axis:alt f="axissin049" c="FNOTICIA" lit="9902806"/>" <axis:atr f="axissin049" c="FNOTICIA" a="modificable=true&obligatorio=false&formato=fecha"/>/>
                                            <a id="icon_FNOTICIA" style="vertical-align:middle;" href="#">
                                                <img border="0" alt="<axis:alt f="axissin049" c="ICO_FNOTICIA" lit="9902806" />" title="<axis:alt f="axissin049" c="FNOTICIA" lit="9902806"/>" src="images/calendar.gif"/></a>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="FCONTASE">
                                        <td class="campocaja" id="td_FCONTASE">
                                           <input style="width:75%"  type="text" class="campowidthinput campo campotexto" id="FCONTASE" name="FCONTASE" size="15"
                                            value ="<fmt:formatDate value="${__formdata.FCONTASE}" pattern="dd/MM/yyyy"/>" onblur="" 
                                            title="<axis:alt f="axissin049" c="FCONTASE" lit="9902766"/>" <axis:atr f="axissin049" c="FCONTASE" a="modificable=true&obligatorio=false&formato=fecha"/>/>
                                            <a id="icon_FCONTASE" style="vertical-align:middle;" href="#">
                                                <img border="0" alt="<axis:alt f="axissin049" c="ICO_FCONTASE" lit="9902766" />" title="<axis:alt f="axissin049" c="FCONTASE" lit="9902766"/>" src="images/calendar.gif"/></a>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="FCONTCIA">
                                        <td class="campocaja" id="td_FCONTCIA">
                                           <input style="width:75%"  type="text" class="campowidthinput campo campotexto" id="FCONTCIA" name="FCONTCIA" size="15"
                                            value ="<fmt:formatDate value="${__formdata.FCONTCIA}" pattern="dd/MM/yyyy"/>" onblur="" 
                                            title="<axis:alt f="axissin049" c="FCONTCIA" lit="9902767"/>" <axis:atr f="axissin049" c="FCONTCIA" a="modificable=true&obligatorio=false&formato=fecha"/>/>
                                            <a id="icon_FCONTCIA" style="vertical-align:middle;" href="#">
                                                <img border="0" alt="<axis:alt f="axissin049" c="ICO_FCONTCIA" lit="9902767" />" title="<axis:alt f="axissin049" c="FCONTCIA" lit="9902767"/>" src="images/calendar.gif"/></a>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="FAUDPREV">
                                        <td class="campocaja" id="td_FAUDPREV">
                                           <input style="width:75%"  type="text" class="campowidthinput campo campotexto" id="FAUDPREV" name="FAUDPREV" size="15"
                                            value ="<fmt:formatDate value="${__formdata.FAUDPREV}" pattern="dd/MM/yyyy"/>" onblur="" 
                                            title="<axis:alt f="axissin049" c="FAUDPREV" lit="9902768"/>" <axis:atr f="axissin049" c="FAUDPREV" a="modificable=true&obligatorio=false&formato=fecha"/>/>
                                            <a id="icon_FAUDPREV" style="vertical-align:middle;" href="#">
                                                <img border="0" alt="<axis:alt f="axissin049" c="ICO_FAUDPREV" lit="9902768" />" title="<axis:alt f="axissin049" c="FAUDPREV" lit="9902768"/>" src="images/calendar.gif"/></a>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="FJUICIO">
                                        <td class="titulocaja" id="tit_FJUICIO">
                                            <b><axis:alt f="axissin049" c="FJUICIO" lit="9902770" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="CMONJUZ">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axissin049" c="CMONJUZ" lit="9902771" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="CPLEITO">
                                         <td class="titulocaja">
                                            <b><axis:alt f="axissin049" c="CPLEITO" lit="9902772" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="IPLEITO">
                                        <td class="titulocaja" colspan="1" id="tit_IPLEITO">
                                            <b id="label_IPLEITO"><axis:alt f="axissin049" c="IPLEITO" lit="9902773" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="IALLANA">
                                        <td class="titulocaja" colspan="1" id="tit_IALLANA">
                                            <b id="label_IALLANA"><axis:alt f="axissin049" c="IALLANA" lit="9902774" /></b>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="FJUICIO">
                                        <td class="campocaja" id="td_FJUICIO">
                                           <input style="width:75%"  type="text" class="campowidthinput campo campotexto" id="FJUICIO" name="FJUICIO" size="15"
                                            value ="<fmt:formatDate value="${__formdata.FJUICIO}" pattern="dd/MM/yyyy"/>" onblur="" 
                                            title="<axis:alt f="axissin049" c="FJUICIO" lit="9902770"/>" <axis:atr f="axissin049" c="FJUICIO" a="modificable=true&obligatorio=false&formato=fecha"/>/>
                                            <a id="icon_FJUICIO" style="vertical-align:middle;" href="#">
                                                <img border="0" alt="<axis:alt f="axissin049" c="ICO_FJUICIO" lit="9902770" />" title="<axis:alt f="axissin049" c="FJUICIO" lit="9902770"/>" src="images/calendar.gif"/></a>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="CMONJUZ">
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" id="CMONJUZ" name="CMONJUZ" size="15"
                                            value="${__formdata.CMONJUZ}" maxlength="3" title="<axis:alt f="axissin049" c="CMONJUZ" lit="9902771"/>" 
                                            <axis:atr f="axissin049" c="CMONJUZ" a="obligatorio=false"/> />
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="CPLEITO">
                                        <td class="campocaja" id="td_CPLEITO" >
                                            <select name="CPLEITO" id="CPLEITO" onchange="f_recargar();"
                                            style="width:95%;" size="1"  title="<axis:alt c="CPLEITO" f="axissin049" lit="9902772"/>"
                                            <axis:atr f="axissin049" c="CPLEITO" a="modificable=true&isInputText=false&obligatorio=true"/> 
                                            class="campowidthselect campo campotexto">
                                            <option value = ""> - <axis:alt c="COMBO_SNV" f="axissin049" lit="108341"/> - </option>
                                            <c:forEach var="cmb_CPLEITO" items="${__formdata.lst_CPLEITO}">
                                                <option value = "${cmb_CPLEITO.CATRIBU}"
                                                    <c:if test="${!empty __formdata.CPLEITO && cmb_CPLEITO.CATRIBU == __formdata.CPLEITO}">selected</c:if>>
                                                    ${cmb_CPLEITO.TATRIBU}
                                                </option>
                                            </c:forEach>
                                            </select>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="IPLEITO">
                                        <td class="campocaja" id="td_IPLEITO">
                                            <input type="text" class="campo campotexto" id="IPLEITO" name="IPLEITO" size="15" style="width:90%"
                                            <axis:atr f="axissin049" c="IPLEITO" a="formato=decimal&obligatorio=true"/> 
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IPLEITO}'/>" 
                                            title="<axis:alt f="axissin049" c="IPLEITO" lit="9902773"/>"/>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="IALLANA">
                                        <td class="campocaja">
                                            <input type="text" class="campo campotexto" id="IALLANA" name="IALLANA" size="15" style="width:90%"
                                            <axis:atr f="axissin049" c="IALLANA" a="formato=decimal&obligatorio=false"/> 
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IALLANA}'/>" 
                                            title="<axis:alt f="axissin049" c="IALLANA" lit="9902774"/>"/>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="ISENTCAP">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axissin049" c="ISENTCAP" lit="9902776" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="ISENTIND">
                                         <td class="titulocaja">
                                            <b><axis:alt f="axissin049" c="ISENTIND" lit="9902777" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="ISENTCOS">
                                        <td class="titulocaja" colspan="1">
                                            <b><axis:alt f="axissin049" c="ISENTCOS" lit="9902779" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="ISENTINT">
                                        <td class="titulocaja" colspan="1">
                                            <b><axis:alt f="axissin049" c="ISENTINT" lit="9902780" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="ISENTENC">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axissin049" c="ISENTENC" lit="9902775" /></b>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="ISENTCAP">
                                        <td class="campocaja">
                                            <input type="text" class="campo campotexto" id="ISENTCAP" name="ISENTCAP" size="15" style="width:90%"
                                            <axis:atr f="axissin049" c="ISENTCAP" a="formato=decimal&obligatorio=false"/> 
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.ISENTCAP}'/>" 
                                            title="<axis:alt f="axissin049" c="ISENTCAP" lit="9902776"/>"
                                            onblur="actualizaImporteTotal()"/>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="ISENTIND">
                                        <td class="campocaja">
                                            <input type="text" class="campo campotexto" id="ISENTIND" name="ISENTIND" size="15" style="width:90%"
                                            <axis:atr f="axissin049" c="ISENTIND" a="formato=decimal&obligatorio=false"/> 
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.ISENTIND}'/>" 
                                            title="<axis:alt f="axissin049" c="ISENTIND" lit="9902777"/>"
                                            onblur="actualizaImporteTotal()"/>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="ISENTCOS">
                                        <td class="campocaja">
                                            <input type="text" class="campo campotexto" id="ISENTCOS" name="ISENTCOS" size="15" style="width:90%"
                                            <axis:atr f="axissin049" c="ISENTCOS" a="formato=decimal&obligatorio=false"/> 
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.ISENTCOS}'/>" 
                                            title="<axis:alt f="axissin049" c="ISENTCOS" lit="9902779"/>"
                                            onblur="actualizaImporteTotal()"/>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="ISENTINT">
                                        <td class="campocaja">
                                            <input type="text" class="campo campotexto" id="ISENTINT" name="ISENTINT" size="15" style="width:90%"
                                            <axis:atr f="axissin049" c="ISENTINT" a="formato=decimal&obligatorio=false"/> 
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.ISENTINT}'/>" 
                                            title="<axis:alt f="axissin049" c="ISENTINT" lit="9902780"/>"
                                            onblur="actualizaImporteTotal()"/>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="ISENTENC">
                                        <td class="campocaja">
                                            <input type="text" class="campo campotexto" id="ISENTENC" name="ISENTENC" size="15" style="width:90%"
                                            <axis:atr f="axissin049" c="ISENTENC" a="formato=decimal&obligatorio=false"/> 
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.ISENTENC}'/>" 
                                            title="<axis:alt f="axissin049" c="ISENTENC" lit="9902775"/>" readonly/>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="ISENTOTR">
                                        <td class="titulocaja" id="tit_ISENTOTR">
                                            <b id="label_ISENTOTR"><axis:alt f="axissin049" c="ISENTOTR" lit="9902781" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="CARGUDEF">
                                        <td class="titulocaja" id="tit_CARGUDEF">
                                            <b id="label_CARGUDEF"><axis:alt f="axissin049" c="CARGUDEF" lit="9902782" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="CRESPLEI">
                                         <td class="titulocaja" id="tit_CRESPLEI">
                                            <b id="label_CRESPLEI"><axis:alt f="axissin049" c="CRESPLEI" lit="9902783" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="CAPELANT">
                                        <td class="titulocaja" colspan="1" id="tit_CAPELANT">
                                            <b id="label_CAPELANT"><axis:alt f="axissin049" c="CAPELANT" lit="9902784" /></b>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="ISENTOTR">
                                        <td class="campocaja">
                                            <input type="text" class="campo campotexto" id="ISENTOTR" name="ISENTOTR" size="15" style="width:90%"
                                            <axis:atr f="axissin049" c="ISENTOTR" a="formato=decimal&obligatorio=false"/> 
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.ISENTOTR}'/>" 
                                            title="<axis:alt f="axissin049" c="ISENTOTR" lit="9902781"/>"/>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="CARGUDEF">
                                        <td class="campocaja" id="td_CARGUDEF" >
                                            <select name="CARGUDEF" id="CARGUDEF" onchange="f_recargar();"
                                            style="width:95%;" size="1"  title="<axis:alt c="CARGUDEF" f="axissin049" lit="9902782"/>"
                                            <axis:atr f="axissin049" c="CARGUDEF" a="modificable=true&isInputText=false"/> 
                                            class="campowidthselect campo campotexto">
                                            <option value = ""> - <axis:alt c="COMBO_SNV" f="axissin049" lit="108341"/> - </option>
                                            <c:forEach var="cmb_CARGUDEF" items="${__formdata.lst_CARGUDEF}">
                                                <option value = "${cmb_CARGUDEF.CATRIBU}"
                                                    <c:if test="${!empty __formdata.CARGUDEF && cmb_CARGUDEF.CATRIBU == __formdata.CARGUDEF}">selected</c:if>>
                                                    ${cmb_CARGUDEF.TATRIBU}
                                                </option>
                                            </c:forEach>
                                            </select>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="CRESPLEI">
                                        <td class="campocaja" id="td_CRESPLEI" >
                                            <select name="CRESPLEI" id="CRESPLEI" onchange="f_recargar();"
                                            style="width:95%;" size="1"  title="<axis:alt c="CRESPLEI" f="axissin049" lit="9902783"/>"
                                            <axis:atr f="axissin049" c="CRESPLEI" a="modificable=true&isInputText=false"/> 
                                            class="campowidthselect campo campotexto">
                                            <option value = ""> - <axis:alt c="COMBO_SNV" f="axissin049" lit="108341"/> - </option>
                                            <c:forEach var="cmb_CRESPLEI" items="${__formdata.lst_CRESPLEI}">
                                                <option value = "${cmb_CRESPLEI.CATRIBU}"
                                                    <c:if test="${!empty __formdata.CRESPLEI && cmb_CRESPLEI.CATRIBU == __formdata.CRESPLEI}">selected</c:if>>
                                                    ${cmb_CRESPLEI.TATRIBU}
                                                </option>
                                            </c:forEach>
                                            </select>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="CAPELANT">
                                        <td class="campocaja" id="td_CAPELANT" >
                                            <select name="CAPELANT" id="CAPELANT" onchange="f_recargar();"
                                            style="width:95%;" size="1"  title="<axis:alt c="CAPELANT" f="axissin049" lit="9902784"/>"
                                            <axis:atr f="axissin049" c="CAPELANT" a="modificable=true&isInputText=false"/> 
                                            class="campowidthselect campo campotexto">
                                            <option value = ""> - <axis:alt c="COMBO_SNV" f="axissin049" lit="108341"/> - </option>
                                            <c:forEach var="cmb_CAPELANT" items="${__formdata.lst_CAPELANT}">
                                                <option value = "${cmb_CAPELANT.CATRIBU}"
                                                    <c:if test="${!empty __formdata.CAPELANT && cmb_CAPELANT.CATRIBU == __formdata.CAPELANT}">selected</c:if>>
                                                    ${cmb_CAPELANT.TATRIBU}
                                                </option>
                                            </c:forEach>
                                            </select>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="THIPOASE">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axissin049" c="THIPOASE" lit="9902785" /></b>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="THIPOASE">
                                        <td class="campocaja" colspan="5"> 
                                            <textarea rows="2" class="campo campotexto" <axis:atr f="axissin049" c="THIPOASE" a="modificable=true&isInputText=false"/> style="width:100%;"  
                                            title="<axis:alt f="axissin049" c="THIPOASE" lit="9902785"/>" name="THIPOASE" id="THIPOASE">${__formdata.THIPOASE}</textarea>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="THIPOTER">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axissin049" c="THIPOTER" lit="9902786" /></b>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="THIPOTER">
                                        <td class="campocaja" colspan="5"> 
                                            <textarea rows="2" class="campo campotexto" <axis:atr f="axissin049" c="THIPOTER" a="modificable=true&isInputText=false"/> style="width:100%;"  
                                            title="<axis:alt f="axissin049" c="THIPOTER" lit="9902786"/>" name="THIPOTER" id="THIPOTER">${__formdata.THIPOTER}</textarea>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="TTIPRESP">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axissin049" c="TTIPRESP" lit="9902787" /></b>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="TTIPRESP">
                                        <td class="campocaja" colspan="5"> 
                                            <textarea rows="2" class="campo campotexto" <axis:atr f="axissin049" c="TTIPRESP" a="modificable=true&isInputText=false"/> style="width:100%;"  
                                            title="<axis:alt f="axissin049" c="TTIPRESP" lit="9902787"/>" name="TTIPRESP" id="TTIPRESP">${__formdata.TTIPRESP}</textarea>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="COPERCOB">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axissin049" c="COPERCOB" lit="9902788" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="CESTPROC">
                                         <td class="titulocaja">
                                            <b><axis:alt f="axissin049" c="CESTPROC" lit="9902790" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="CETAPROC">
                                        <td class="titulocaja" colspan="1">
                                            <b><axis:alt f="axissin049" c="CETAPROC" lit="9902791" /></b>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="COPERCOB">
                                        <td class="campocaja" id="td_COPERCOB" >
                                            <select name="COPERCOB" id="COPERCOB" onchange="f_recargar();"
                                            style="width:95%;" size="1"  title="<axis:alt c="COPERCOB" f="axissin049" lit="9902788"/>"
                                            <axis:atr f="axissin049" c="COPERCOB" a="modificable=true&isInputText=false"/> 
                                            class="campowidthselect campo campotexto">
                                            <option value = ""> - <axis:alt c="COMBO_SNV" f="axissin049" lit="108341"/> - </option>
                                            <c:forEach var="cmb_COPERCOB" items="${__formdata.lst_COPERCOB}">
                                                <option value = "${cmb_COPERCOB.CATRIBU}"
                                                    <c:if test="${!empty __formdata.COPERCOB && cmb_COPERCOB.CATRIBU == __formdata.COPERCOB}">selected</c:if>>
                                                    ${cmb_COPERCOB.TATRIBU}
                                                </option>
                                            </c:forEach>
                                            </select>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="CESTPROC">
                                        <td class="campocaja" id="td_CESTPROC" >
                                            <select name="CESTPROC" id="CESTPROC" onchange="f_recargar();"
                                            style="width:95%;" size="1"  title="<axis:alt c="CESTPROC" f="axissin049" lit="9902790"/>"
                                            <axis:atr f="axissin049" c="CESTPROC" a="modificable=true&isInputText=false"/> 
                                            class="campowidthselect campo campotexto">
                                            <option value = ""> - <axis:alt c="COMBO_SNV" f="axissin049" lit="108341"/> - </option>
                                            <c:forEach var="cmb_CESTPROC" items="${__formdata.lst_CESTPROC}">
                                                <option value = "${cmb_CESTPROC.CATRIBU}"
                                                    <c:if test="${!empty __formdata.CESTPROC && cmb_CESTPROC.CATRIBU == __formdata.CESTPROC}">selected</c:if>>
                                                    ${cmb_CESTPROC.TATRIBU}
                                                </option>
                                            </c:forEach>
                                            </select>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="CETAPROC">
                                        <td class="campocaja" id="td_CETAPROC" >
                                            <select name="CETAPROC" id="CETAPROC" onchange="f_recargar();"
                                            style="width:95%;" size="1"  title="<axis:alt c="CETAPROC" f="axissin049" lit="9902791"/>"
                                            <axis:atr f="axissin049" c="CETAPROC" a="modificable=true&isInputText=false"/> 
                                            class="campowidthselect campo campotexto">
                                            <option value = ""> - <axis:alt c="COMBO_SNV" f="axissin049" lit="108341"/> - </option>
                                            <c:forEach var="cmb_CETAPROC" items="${__formdata.lst_CETAPROC}">
                                                <option value = "${cmb_CETAPROC.CATRIBU}"
                                                    <c:if test="${!empty __formdata.CETAPROC && cmb_CETAPROC.CATRIBU == __formdata.CETAPROC}">selected</c:if>>
                                                    ${cmb_CETAPROC.TATRIBU}
                                                </option>
                                            </c:forEach>
                                            </select>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="TREASMED">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axissin049" c="TREASMED" lit="9902789" /></b>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="TREASMED">
                                        <td class="campocaja" colspan="5"> 
                                            <textarea rows="2" class="campo campotexto" <axis:atr f="axissin049" c="TREASMED" a="modificable=true&isInputText=false"/> style="width:100%;"  
                                            title="<axis:alt f="axissin049" c="TREASMED" lit="9902789"/>" name="TREASMED" id="TREASMED">${__formdata.TREASMED}</textarea>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    
                                    <tr>
                                        <axis:ocultar f="axissin049" c="TCONCJUR">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axissin049" c="TCONCJUR" lit="9902792" /></b>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="TCONCJUR">
                                        <td class="campocaja" colspan="5"> 
                                            <textarea rows="2" class="campo campotexto" <axis:atr f="axissin049" c="TCONCJUR" a="modificable=true&isInputText=false"/> style="width:100%;"  
                                            title="<axis:alt f="axissin049" c="TCONCJUR" lit="9902792"/>" name="TCONCJUR" id="TCONCJUR">${__formdata.TCONCJUR}</textarea>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="TESTRDEF">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axissin049" c="TESTRDEF" lit="9902793" /></b>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="TESTRDEF">
                                        <td class="campocaja" colspan="5"> 
                                            <textarea rows="2" class="campo campotexto" <axis:atr f="axissin049" c="TESTRDEF" a="modificable=true&isInputText=false"/> style="width:100%;"  
                                            title="<axis:alt f="axissin049" c="TESTRDEF" lit="9902793"/>" name="TESTRDEF" id="TESTRDEF">${__formdata.TESTRDEF}</textarea>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="TRECOMEN">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axissin049" c="TRECOMEN" lit="9902794" /></b>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="TRECOMEN">
                                        <td class="campocaja" colspan="5"> 
                                            <textarea rows="2" class="campo campotexto" <axis:atr f="axissin049" c="TRECOMEN" a="modificable=true&isInputText=false"/> style="width:100%;"  
                                            title="<axis:alt f="axissin049" c="TRECOMEN" lit="9902794"/>" name="TRECOMEN" id="TRECOMEN">${__formdata.TRECOMEN}</textarea>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="TOBSERV">
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axissin049" c="TOBSERV" lit="101162" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="FCANCEL">
                                         <td class="titulocaja">
                                            <b><axis:alt f="axissin049" c="FCANCEL" lit="9000546" /></b>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axissin049" c="TOBSERV">
                                        <td class="campocaja" colspan="2">
                                            <input type="text" class="campo campotexto" id="TOBSERV" name="TOBSERV" size="15" style="width:90%"
                                            <axis:atr f="axissin049" c="TOBSERV" a="obligatorio=false"/> value="${__formdata.TOBSERV}" maxlength="80" 
                                            title="<axis:alt f="axissin049" c="TOBSERV" lit="101162"/>"/>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axissin049" c="FCANCEL">
                                        <td class="campocaja">
                                           <input style="width:75%"  type="text" class="campowidthinput campo campotexto" id="FCANCEL" name="FCANCEL" size="15"
                                            value ="<fmt:formatDate value="${__formdata.FCANCEL}" pattern="dd/MM/yyyy"/>" onblur="" 
                                            title="<axis:alt f="axissin049" c="FCANCEL" lit="9000546"/>" <axis:atr f="axissin049" c="FCANCEL" a="modificable=true&obligatorio=false&formato=fecha"/>/>
                                            <a id="icon_FCANCEL" style="vertical-align:middle;" href="#">
                                                <img border="0" alt="<axis:alt f="axissin049" c="ICO_FCANCEL" lit="9000546" />" title="<axis:alt f="axissin049" c="FCANCEL" lit="9000546"/>" src="images/calendar.gif"/></a>
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
    </form>

<c:import url="../include/botonera_nt.jsp">
   <c:param name="f">axisctr183</c:param>
   <c:param name="__botones">cancelar,aceptar</c:param>
</c:import>
<c:import url="../include/mensajes.jsp" />


<script type="text/javascript">

<axis:visible f="axissin049" c="FNOTIASE" >
    Calendar.setup({
        inputField     :    "FNOTIASE",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FNOTIASE",  
        singleClick    :    true,
        firstDay       :    1
    });
</axis:visible>

<axis:visible f="axissin049" c="FCANCEL" >
    Calendar.setup({
        inputField     :    "FCANCEL",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FCANCEL",  
        singleClick    :    true,
        firstDay       :    1
    });
</axis:visible>


<axis:visible f="axissin049" c="FAUDPREV" >
    Calendar.setup({
        inputField     :    "FAUDPREV",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FAUDPREV",  
        singleClick    :    true,
        firstDay       :    1
    });
</axis:visible>
<axis:visible f="axissin049" c="FCONTCIA" >
    Calendar.setup({
        inputField     :    "FCONTCIA",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FCONTCIA",  
        singleClick    :    true,
        firstDay       :    1
    });
</axis:visible>
<axis:visible f="axissin049" c="FCONTASE" >
    Calendar.setup({
        inputField     :    "FCONTASE",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FCONTASE",  
        singleClick    :    true,
        firstDay       :    1
    });
</axis:visible>
<axis:visible f="axissin049" c="FNOTICIA" >
    Calendar.setup({
        inputField     :    "FNOTICIA",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FNOTICIA",  
        singleClick    :    true,
        firstDay       :    1
    });
</axis:visible>
<axis:visible f="axissin049" c="FRECPDEM" >
    Calendar.setup({
        inputField     :    "FRECPDEM",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FRECPDEM",  
        singleClick    :    true,
        firstDay       :    1
    });
</axis:visible>
<axis:visible f="axissin049" c="FJUICIO" >
    Calendar.setup({
        inputField     :    "FJUICIO",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FJUICIO",  
        singleClick    :    true,
        firstDay       :    1
    });
</axis:visible>


                                    
                                    
                                    
                                    
</script>
    
</body>


</html>



