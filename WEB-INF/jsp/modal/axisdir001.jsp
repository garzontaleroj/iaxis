<%-- 
*  Fichero: axisdir001.jsp
*  @author <a href = "mailto:xjrodriguez@csi-ti.com">Jonny Rodriguez</a>
*
*  Fecha: 24/02/2012
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="axis.util.Constantes" %>
<%@ page import="java.util.*" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
     <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />
    
   
   
    <c:import url="../include/carga_framework_js.jsp" />
    
    
    <script language="Javascript" type="text/javascript">
    
    

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
            
            f_cargar_propiedades_pantalla();
            actualizarFormulario(0);
            
            
        }
        
        function f_but_cancelar() {
            parent.f_cancelar_axisdir001('axisdir001',document.axisdir001Form.IDFINCA.value);
        }
        
        function f_but_buscar() {
        
            //validaEntrada();
            if (objValidador.validaEntrada()) {
            CPOSTAL = document.axisdir001Form.CPOSTAL.value;
            CTIPVIA = document.axisdir001Form.CTIPVIA.value;
            TNOMVIA = document.axisdir001Form.TNOMVIA.value;
            NDESDE = document.axisdir001Form.NDESDE.value;
            NHASTA = document.axisdir001Form.NHASTA.value;
            CDESDE = document.axisdir001Form.CDESDE.value;
            CHASTA = document.axisdir001Form.CHASTA.value;
            CTIPFINCA = document.axisdir001Form.CTIPFINCA.value;
            CPAIS = document.axisdir001Form.CPAIS.value;
            CPROVIN = document.axisdir001Form.CPROVIN.value;
            CPOBLAC = document.axisdir001Form.CPOBLAC.value;
            CLOCALIDAD = document.axisdir001Form.IDLOCAL.value;
            AFINCA = document.axisdir001Form.AFINCA.value;
            INE = document.axisdir001Form.INE.value;
            var ESCALERA = null;
            <axis:visible c="ESCALERA" f="axisdir001">
                ESCALERA = document.axisdir001Form.ESCALERA.value;
            </axis:visible>
            var PISO = null;
            <axis:visible c="PISO" f="axisdir001">
                PISO = document.axisdir001Form.PISO.value;
            </axis:visible>
            var PUERTA = null;
            <axis:visible c="PUERTA" f="axisdir001">
                PUERTA = document.axisdir001Form.PUERTA.value;
            </axis:visible>
            REFERENCIA = document.axisdir001Form.REFERENCIA.value;
            IDFINCA = document.axisdir001Form.IDFINCA.value;
        
            parent.f_buscar_direcciones(CPOSTAL, CTIPVIA, TNOMVIA, NDESDE, NHASTA, CDESDE, CHASTA, CTIPFINCA, CPAIS, CPROVIN, CPOBLAC, CLOCALIDAD, AFINCA, INE, ESCALERA, PISO, PUERTA, REFERENCIA, IDFINCA);
           }
           
        }
        
        function f_onblur_CPOSTAL(CPOSTAL) {
            if (!objUtiles.estaVacio(CPOSTAL)){
				document.axisdir001Form.CPAIS.focus();
                objAjax.invokeAsyncCGI('modal_axisdir001.do', callbackAjaxOnblurCPOSTAL, 'operation=getProvinPobla&CPOSTAL=' + CPOSTAL, this);
            }
        }
        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
                
        function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION, CODIGO_CP){
             objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
              "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION + "&CODIGO_CP=" + CODIGO_CP);
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
                objDom.setVisibilidadPorId("findLocalidad", "visible");
                objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + TEXTO + "</b>");
                limpiaCampos("CPOBLAC");
            }
            else if (CODIGO_CONSULTA == "LISTA_DIR_LOCALIDAD") {
                objDom.setValorPorId("IDLOCAL", CODIGO);
                objDom.setValorHTMLPorId("TLOCALIDAD_span", "<b>" + TEXTO + "</b>");
            } 
        }
        
        function f_cerrar_axiscom001() {
            objUtiles.cerrarModal("axiscom001");
        }
        
        /****************************************************************************************/
        /*********************************** CALLBACK AJAX **************************************/
        /****************************************************************************************/
        
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
                        objDom.setVisibilidadPorId("findLocalidad", "visible");
                    } else {
                        objDom.setValorPorId("CPOBLAC", "");
                        objDom.setVisibilidadPorId("findLocalidad", "hidden");
                    }
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPOBLAC")[0])) {
                        document.getElementById("TPOBLAC_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOBLAC"), 0, 0) + "</b>";
                    } else {
                        document.getElementById("TPOBLAC_span").innerHTML = "";       
                    }
                    
                    // Localidad
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("IDLOCAL")[0])) {
                        objDom.setValorPorId("CPOBLAC", objDom.getValorNodoDelComponente(doc.getElementsByTagName("IDLOCAL"), 0, 0));           
                    } else {
                        objDom.setValorPorId("IDLOCAL", "");
                    }
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TLOCALI")[0])) {
                        document.getElementById("TLOCALIDAD_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TLOCALI"), 0, 0) + "</b>";
                    } else {
                        document.getElementById("TLOCALIDAD_span").innerHTML = "";       
                    }
					}
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
        
        function f_onblur_CPAIS () {
            f_onchange_CPAIS();
        }
      
      function f_onchange_CPAIS() {
            var CPAIS=objDom.getValorPorId("CPAIS");
            //alert(CPAIS);
            if (!objUtiles.estaVacio(CPAIS)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPAIS";
                qs=qs+"&CPAIS="+CPAIS
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisdir001.do", callbackajaxdireccion, qs, this)
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
                objAjax.invokeAsyncCGI("modal_axisdir001.do", callbackajaxdireccion, qs, this)
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
                objAjax.invokeAsyncCGI("modal_axisdir001.do", callbackajaxdireccion, qs, this)
            }else{
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
                limpiaCampos("CPROVIN");
            }
        }
        
        function f_onchange_IDLOCAL() {
            var IDLOCAL=objDom.getValorPorId("IDLOCAL");
            
            if (!objUtiles.estaVacio(IDLOCAL)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"IDLOCAL";
                qs=qs+"&IDLOCAL="+IDLOCAL
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisdir001.do", callbackajaxdireccion, qs, this)
            }else{
                objDom.setValorPorId("IDLOCAL", "");
                objDom.setValorHTMLPorId("TLOCALIDAD_span", "");
                objDom.setVisibilidadPorId("findLocalidad", "hidden");
                limpiaCampos("IDLOCAL");
            }
        }
        
        function callbackajaxdireccion (ajaxResponseText){
            try{ 
                //alert(ajaxResponseText);
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
                            objDom.setVisibilidadPorId("findLocalidad", "visible");
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPOBLAC")[0]))
                                objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOBLAC"), 0, 0) + "</b>");
                        }
                    }
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("IDLOCAL")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("IDLOCAL", "");
                            objDom.setValorHTMLPorId("TLOCALIDAD_span", "<b>" + objJsMessages.jslit_codigo_poblacion_incorrecto +"</b>");
                        }else{
                            objDom.setValorPorId("IDLOCAL", objDom.getValorNodoDelComponente(doc.getElementsByTagName("IDLOCAL"), 0, 0));
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TLOCALI")[0]))
                                objDom.setValorHTMLPorId("TLOCALIDAD_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TLOCALI"), 0, 0) + "</b>");
                        }
                    }
             }   
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
        
        function actualizarFormulario(value) {
            
            document.axisdir001Form.VALBUSQUEDA.value = value;
            f_cargar_propiedades_pantalla();
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
		
		function f_cerrar_modal(pantalla){
            objUtiles.cerrarModal(pantalla);
        }
		
		function f_aceptar_axisper042(CPOSTAL){
			f_cerrar_modal("axisper042");
			objDom.setValorPorId("CPOSTAL", CPOSTAL);
			document.axisdir001Form.CPOSTAL.focus();            
		}
		
		function f_abrir_axisper042 () {
			objUtiles.abrirModal("axisper042", "src", "modal_axisper042.do?operation=form");
		}
        
    </script>
  </head>
  <body onload="f_onload()" >
  
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisdir002|<axis:alt f="axisctr041" c="TITULO_DOMIC" lit=""/></c:param> <%-- INTRODUCCIÓN DE UN RIESGO DOMICILIO --%>
            </c:import>
		
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper041|<axis:alt c="axisper041_TITULO" f="axisper041" lit="9002274"/></c:param>
    </c:import>
	
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper042|<axis:alt c="axisper042_TITULO" f="axisper042" lit="9002274"/></c:param>
	</c:import>
  
        <form name="axisdir001Form" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="TPAIS" value="${__formdata.TPAIS}"/>
            <input type="hidden" name="TPROVIN" value="${__formdata.TPROVIN}"/>
            <input type="hidden" name="TPOBLAC" value="${__formdata.TPOBLAC}"/>
             <input type="hidden" name="VALBUSQUEDA" value="${__formdata.TBUSQUEDA}"/>
             <input type="hidden" name="IDFINCA" value="${__formdata.IDFINCA}"/>
             
        
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisdir001" c="TIT_FORM" lit="1000215" /></c:param>
                <c:param name="producto"><axis:alt f="axisdir001" c="TIT_FORM" lit="1000215" /></c:param>
                <c:param name="form">axisdir001</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                    <c:param name="titulo"><axis:alt f="axisdir001" c="TIT_AXISDIR001" lit="1000215" /></c:param>
                    <c:param name="nid" value="axisdir001" />
            </c:import>
            
            
            
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:130px">
                <div class="separador">&nbsp;</div>
                <tr>
                    <td>
                        <table class="seccion">
                            <tr>
                                <th style="width:4%;height:0px"></th>
                                <th style="width:16%;height:0px"></th>
                                <th style="width:16%;height:0px"></th>
                                <th style="width:16%;height:0px"></th>
                                <th style="width:16%;height:0px"></th>
                                <th style="width:16%;height:0px"></th>
                                <th style="width:16%;height:0px"></th>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    &nbsp;
                                </td>
                                <axis:visible c="TBUSQUEDA" f="axisdir001">
                                <td class="titulocaja">
                                    <input id="TBUSQUEDA" name="TBUSQUEDA" type="radio" value="1" checked="checked" 
                                        <axis:atr f="axisdir001" c="TBUSQUEDA" a="modificable=true"/>
                                        onclick="javascript: actualizarFormulario(0);" /> <b><axis:alt f="axisdir001" c="TBUSQUEDA1" lit="9903374"/></b>
                                </td>
                                <td class="titulocaja">
                                    <input id="TBUSQUEDA" name="TBUSQUEDA" type="radio" value="2" 
                                        <axis:atr f="axisdir001" c="TBUSQUEDA" a="modificable=true"/>
                                        onclick="javascript: actualizarFormulario(1);" /> <b><axis:alt f="axisdir001" c="TBUSQUEDA2" lit="9903375"/></b>
                                </td>
                                </axis:visible>
                                <td class="titulocaja" colspan="2">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7" align="left">
                                    <div class="titulo" style="margin-left:10px;font-size: 11px;width:98%">
                                        <img src="images/flecha.gif"/>
                                        <axis:alt f="axisdir001" c="LIT_SEGUNDO_SUBTITULO" lit="9903374"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7">
                                    &nbsp;
                                </td>
                            </tr
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:visible c="CPOSTAL" f="axisdir001">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisdir001" c="CPOSTAL" lit="101081"/></b>
                                    </td>
                                </axis:visible>
                                <axis:visible c="CTIPVIA" f="axisdir001">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisdir001" c="CTIPVIA" lit="110028"/></b>
                                    </td>
                                </axis:visible>
                                <axis:visible c="TNOMVIA" f="axisdir001">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisdir001" c="TNOMVIA" lit="110029"/></b>
                                    </td>
                                </axis:visible>
                                <axis:visible c="NDESDE" f="axisdir001">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisdir001" c="NDESDE" lit="9903380"/></b>
                                    </td>
                                </axis:visible>
                                <axis:visible c="CDESDE" f="axisdir001">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisdir001" c="CDESDE" lit="9903381"/></b>
                                    </td>
                                </axis:visible>
                                <axis:visible c="CTIPFINCA" f="axisdir001">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisdir001" c="CTIPFINCA" lit="9903348" /></b>
                                    </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:visible c="CPOSTAL" f="axisdir001">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOSTAL}" name="CPOSTAL" id="CPOSTAL" 
                                           style="text-transform:uppercase;width:60%;" onblur="f_onblur_CPOSTAL(this.value)"
                                           title="<axis:alt f="axisdir001" c="CPOSTAL" lit="101081"/>"
                                           <axis:atr f="axisdir001" c="CPOSTAL" a="obligatorio=false&modificable=true"/> />
										   &nbsp;
											<axis:ocultar c="CPOSTALFIND" f="axisdir001" dejarHueco="false">
												<img id="findCpostal" border="0" src="images/find.gif" onclick="f_abrir_axisper042();" style="cursor:pointer" alt=""/>
											</axis:ocultar>
                                    </td>
                                </axis:visible>
                                <axis:visible c="CTIPVIA" f="axisdir001">
                                    <td class="campocaja">
                                        <select name="CTIPVIA" id="CTIPVIA" size="1" class="campowidthselect campo campotexto" style="width:60%;"
                                         <axis:atr f="axisdir001" c="CTIPVIA" a="obligatorio=false&modificable=true&isInputText=false"/>>&nbsp;
                                            <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisdir001" c="BLANCO" lit="1000348"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listValores.tipVias}">
                                                <option value="${element.CTIPVIA}" > 
                                                    ${element.TTIPOVIA} 
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:visible>
                                <axis:visible c="TNOMVIA" f="axisdir001">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOMVIA}" name="TNOMVIA" id="TNOMVIA" 
                                        <axis:atr f="axisdir001" c="TNOMVIA" a="obligatorio=true"/>
                                        style="width:90%;"/>
                                    </td>
                                </axis:visible>
                                <axis:visible c="NDESDE" f="axisdir001">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NDESDE}" name="NDESDE" id="NDESDE" 
                                        <axis:atr f="axisdir001" c="NDESDE" a="obligatorio=true"/> style="width:25%;"
                                        title="<axis:alt f="axisdir001" c="LITNDESDE" lit="9903710"/>"/>
                                        &nbsp;&nbsp;
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NHASTA}" name="NHASTA" id="NHASTA" 
                                        style="width:25%;" <axis:atr f="axisdir001" c="NHASTA" a="obligatorio=false"/>/>
                                    </td>
                                </axis:visible>
                                <axis:visible c="CDESDE" f="axisdir001">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CDESDE}" name="CDESDE" id="CDESDE" 
                                        style="width:25%;" <axis:atr f="axisdir001" c="CDESDE" a="obligatorio=false"/>/>
                                        &nbsp;&nbsp;
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CHASTA}" name="CHASTA" id="CHASTA" 
                                        style="width:25%;" <axis:atr f="axisdir001" c="CHASTA" a="obligatorio=false"/>/>
                                    </td>
                                </axis:visible>
                                <axis:visible c="CTIPFINCA" f="axisdir001">
                                    <td class="campocaja">
                                        <select name="CTIPFINCA" id="CTIPFINCA" class="campowidthselect campo campotexto" style="width:80%;"
                                            <axis:atr f="axisdir001" c="CTIPFINCA" a="modificable=true&isInputText=false"/>>
                                            <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisdir001" c="BLANCO" lit="1000348"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listValores.tipFincas}">
                                                <option value="${element.CATRIBU}" <c:if test="${element.CATRIBU == 1}"> selected = "selected"</c:if>> 
                                                    ${element.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:visible>
                            </tr>
                            
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:visible c="CPAIS" f="axisdir001">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisdir001" c="CPAIS" lit="100816"/></b>
                                    </td>
                                </axis:visible>
                                <axis:visible c="CPROVIN" f="axisdir001">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisdir001" c="CPROVIN" lit="100756"/></b>
                                    </td>
                                </axis:visible>
                                <axis:visible c="CPOBLAC" f="axisdir001">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisdir001" c="CPOBLAC" lit="9903396"/></b>
                                    </td>
                                </axis:visible>
                                <axis:visible c="CLOCALIDAD" f="axisdir001">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisdir001" c="LOCALIDAD" lit="9903353"/></b>
                                    </td>
                                </axis:visible>
                                <axis:visible c="AFINCA" f="axisdir001">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisdir001" c="AFINCA" lit="9903352"/></b>
                                    </td>
                                </axis:visible>
                                <axis:visible c="INE" f="axisdir001">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisdir001" c="INE" lit="9903376"/></b>
                                    </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:visible c="CPAIS" f="axisdir001">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPAIS}" name="CPAIS" id="CPAIS" 
                                           style="text-transform:uppercase;width:20%;" onchange="f_onchange_CPAIS()"
                                           title="<axis:alt f="axisdir001" c="CPAIS" lit="100816"/>"
                                           <axis:atr f="axisdir001" c="CPAIS" a="obligatorio=true"/> />
                                         &nbsp;
                                         <axis:visible c="FINDPAIS" f="axisdir001">
                                         <img id="findPais" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS', null, document.axisdir001Form.CPOSTAL.value)" style="cursor:pointer"/>
                                         </axis:visible>
                                    &nbsp;<span id="TPAIS_span"><b>${__formdata.TPAIS}</b></span>
                                    </td>
                                </axis:visible>
                                <axis:visible c="CPROVIN" f="axisdir001">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPROVIN}" name="CPROVIN" id="CPROVIN" 
                                        style="width:20%;" <axis:atr f="axisdir001" c="CPROVIN" a="obligatorio=true"/> onchange="f_onchange_CPROVIN()" 
                                        title="<axis:alt f="axisdir001" c="CPROVIN" lit="100756"/>"/>&nbsp;
                                        <axis:visible c="FINDPROVINCIA" f="axisdir001">
                                        <img id="findProvincia" style="visibility:${empty __formdata.CPAIS ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" 
                                          onclick="f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', document.axisdir001Form.CPAIS.value, document.axisdir001Form.CPOSTAL.value)" />
                                        </axis:visible>
                                    &nbsp;<span id="TPROVIN_span"><b>${__formdata.TPROVIN}</b></span>
                                    </td>
                                 </axis:visible>   
                                <axis:visible c="CPOBLAC" f="axisdir001">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOBLAC}" name="CPOBLAC" id="CPOBLAC" 
                                        style="width:20%;" <axis:atr f="axisdir001" c="CPOBLAC" a="obligatorio=true"/> onchange="f_onchange_CPOBLAC()" 
                                        title="<axis:alt f="axisdir001" c="CPOBLAC" lit="9903396"/>"/>&nbsp;
                                        <axis:visible c="FINDPOBLACION" f="axisdir001">
                                        <img id="findPoblacion" style="visibility:${empty __formdata.CPROVIN ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" 
                                        onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION', document.axisdir001Form.CPROVIN.value, document.axisdir001Form.CPOSTAL.value)" />
                                        </axis:visible>
                                    &nbsp;<span id="TPOBLAC_span"><b>${__formdata.TPOBLAC}</b></span>
                                    </td>
                                </axis:visible>
                                <axis:visible c="IDLOCAL" f="axisdir001">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.IDLOCAL}" name="IDLOCAL" id="IDLOCAL" 
                                        title="<axis:alt f="axisdir001" c="IDLOCAL" lit="9903353"/>" onchange="f_onchange_IDLOCAL()"
                                        <axis:atr f="axisdir001" c="IDLOCAL" a="obligatorio=true"/>
                                        style="width:20%;" />&nbsp;
                                        <axis:visible c="FINDLOCALIDAD" f="axisdir001">
                                        <img id="findLocalidad" style="visibility:${empty __formdata.CPOBLAC ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('9903401', 'LISTA_DIR_LOCALIDAD', document.axisdir001Form.CPROVIN.value, document.axisdir001Form.CPOBLAC.value)" />
                                        </axis:visible>
                                    &nbsp;<span id="TLOCALIDAD_span"><b>${__formdata.TLOCALIDAD}</b></span>
                                    </td>
                                </axis:visible>
                                <axis:visible c="AFINCA" f="axisdir001">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.AFINCA}" name="AFINCA" id="AFINCA" 
                                        title="<axis:alt f="axisdir001" c="AFINCA" lit="9903352"/>" <axis:atr f="axisdir001" c="AFINCA" a="obligatorio=false"/>
                                        style="width:70%;"/>
                                    </td>
                                </axis:visible>
                                <axis:visible c="INE" f="axisdir001">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.INE}" name="INE" id="INE" 
                                        style="width:70%;" <axis:atr f="axisdir001" c="INE" a="obligatorio=false"/>/>
                                    </td>
                                </axis:visible>
                            </tr>
                            
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:visible c="ESCALERA" f="axisdir001">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisdir001" c="ESCALERA" lit="9903382" /></b>
                                    </td>
                                </axis:visible>
                                <axis:visible c="PISO" f="axisdir001">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisdir001" c="PISO" lit="9903383" /></b>
                                    </td>
                                </axis:visible>
                                <axis:visible c="PUERTA" f="axisdir001">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisdir001" c="PUERTA" lit="9903384" /></b>
                                    </td>
                                </axis:visible>
                                <td class="titulocaja" colspan="3">
                                    <b>&nbsp;</b>
                                </td>
                                
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:visible c="ESCALERA" f="axisdir001">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.ESCALERA}" name="ESCALERA" id="ESCALERA" 
                                           style="text-transform:uppercase;width:60%;" 
                                           title="<axis:alt f="axisdir001" c="ESCALERA" lit="101081"/>"
                                           <axis:atr f="axisdir001" c="ESCALERA" a="obligatorio=false"/> />
                                    </td>
                                </axis:visible>
                                <axis:visible c="PISO" f="axisdir001">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.PISO}" name="PISO" id="PISO" 
                                        <axis:atr f="axisdir001" c="PISO" a="obligatorio=true"/>
                                        style="width:40%;"/>
                                    </td>
                                </axis:visible>
                                <axis:visible c="PUERTA" f="axisdir001">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.PUERTA}" name="PUERTA" id="PUERTA" 
                                        <axis:atr f="axisdir001" c="PUERTA" a="obligatorio=true"/>
                                        style="width:40%;"/>
                                    </td>
                                </axis:visible>
                                <td class="campocaja" colspan="3">
                                    &nbsp;
                                </td>
                            </tr>
                            
                            <tr>
                                <td colspan="7">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7" align="left">
                                    <div class="titulo" style="margin-left:10px;font-size: 11px;width:98%">
                                        <img src="images/flecha.gif"/>
                                        <axis:alt f="axisdir001" c="LIT_TERCER_SUBTITULO" lit="9903375"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7">
                                    &nbsp;
                                </td>
                            </tr
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:visible c="REFERENCIA" f="axisdir001">
                                <td class="campocaja" colspan="6">
                                   <b><axis:alt f="axisdir001" c="REFERENCIA" lit="9902225"/></b>&nbsp;
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.REFERENCIA}" name="REFERENCIA" id="REFERENCIA" 
                                       style="text-transform:uppercase;width:10%;" 
                                       title="<axis:alt f="axisdir001" c="REFERENCIA" lit="9902225"/>"
                                       <axis:atr f="axisdir001" c="REFERENCIA" a="obligatorio=false"/>
                                       />
                                </td>
                                </axis:visible>
                            </tr>
                            
                        </table>
                    </td>
                </tr>
            </table>
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisdir001</c:param>
                <c:param name="__botones">cancelar,buscar</c:param>
            </c:import>
        </form>
        
        <c:import url="../include/mensajes.jsp"/>
  </body>
</html>