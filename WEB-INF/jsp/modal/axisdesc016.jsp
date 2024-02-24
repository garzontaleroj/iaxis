<%/* Revision:# PuGJU0W7sO4UVuKoUXYs5A== # */%>
<%/*
*  Fichero: axisdesc016.jsp
*
*  Fecha: 16/05/2013
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

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

       function f_but_cancelar() {
            var modo = "${__formdata.CMODO}";
            parent.f_cerrar_modal('axisdesc016');
       }
       
       function f_onload(){
        
            var ok = "${__formdata.OK}";
            var modo = "${__formdata.CMODO}";
            
            if ( !objUtiles.estaVacio(ok) && ok == 0){
               parent.f_aceptar_axisdesc016(document.axisdesc016Form.CCAMPANYA.value);
            }
            
            
             f_cargar_propiedades_pantalla();
       }
       
       function f_but_aceptar(){
            if (objValidador.validaEntrada()) {
                     if ( !objNumero.validaNumero(objDom.getValorPorId("PDTO"), true) || objDom.getValorPorId("PDTO") > 100) {
                      document.axisdesc016Form.PDTO.focus();
                     document.axisdesc016Form.PDTO.value="";
                     alert('<axis:alt f="axis016" c="TPORCEN" lit="9901044"/>');
           }
            else{
                f_habilitar_campos();
               objUtiles.ejecutarFormulario ("modal_axisdesc016.do", "aceptar", document.axisdesc016Form, "_self", objJsMessages.jslit_cargando);
            }
            }
         /*   if (objValidador.validaEntrada()) 
                parent.f_aceptar_axisdesc016(document.axisdesc016Form.CCAMPANYA.value);*/
       }
       
        function f_habilitar_campos(){
            var checkboxs = document.getElementsByTagName("input");//mirem els checkbox
            var selects = document.getElementsByTagName("select");
           // var checkboxs = document.getElementsByTagName("checkbox");
            for(var i=0;i<selects.length;i++){
                if(selects[i].attributes.length>0) {
                   var selectId = selects[i].getAttribute("id");
                     try{
                         if (document.getElementById(selectId).style.visibility != 'hidden' ){
                             if(selects[i].getAttribute("type") != "button"  &&
                                objDom.estaDisabled(selectId))
                                    objDom.setDisabledPorId(selectId,false);
                         }
                     }catch(e){}
                }
            }
             for(var i=0;i<checkboxs.length;i++){
                if(checkboxs[i].attributes.length>0) {
                   var checkboxsId = checkboxs[i].getAttribute("id");
                    if(document.getElementsByTagName("input")[i].type == "checkbox"){
                    
                     try{
                         if (document.getElementById(checkboxsId).style.visibility != 'hidden' ){
                             if(checkboxs[i].getAttribute("type") != "button"  &&
                                objDom.estaDisabled(checkboxsId))
                                    objDom.setDisabledPorId(checkboxsId,false);
                         }
                     }catch(e){}
                     }
                }
            }
        }
    
    function f_abrir_axisctr014(tipage) {
            document.axisdesc016Form.CTIPAGE_BUSC.value = tipage;
            var PARTNER;
            if(tipage == 4)
                PARTNER =  document.axisdesc016Form.CAGENTE_2.value;
                
            objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=CTIPAGECON_"+tipage+"&PARTNER="+PARTNER+"&CTIPAGE="+tipage);
           
        }
            
        function f_cerrar_axisctr014() {
            objUtiles.cerrarModal("axisctr014")
        }    
           
        function f_aceptar_axisctr014 (CAGENTE){
            objDom.setValorPorId("CAGENTE", CAGENTE);
            f_cerrar_axisctr014();
            objAjax.invokeAsyncCGI("modal_axisdesc016.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
        }

    
    function f_actualizar_agente(tipage){
            var PARTNER;
            if(tipage == 4)
                PARTNER =  document.axisdesc016Form.CAGENTE_2.value;
    
          if (objNumero.validaNumero(objDom.getValorPorId("CAGENTE_"+tipage), false)) {
             document.axisdesc016Form.CTIPAGE_BUSC.value = tipage;
            objAjax.invokeAsyncCGI("modal_axisdesc016.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CONDICION=CTIPAGECON_"+tipage+"&PARTNER="+PARTNER+"&CAGENTE=" + objDom.getValorPorId("CAGENTE_"+tipage) 
                                    , this, objJsMessages.jslit_cargando);
          }
          else
          objDom.setValorPorId("CAGENTE_"+tipage, "");
        }
        
        function callbackAjaxCargarAgente(ajaxResponseText){
            var tipage = document.axisdesc016Form.CTIPAGE_BUSC.value;
            var doc=objAjax.domParse(ajaxResponseText);
            var elementos = doc.getElementsByTagName("element");
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                    var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                    var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                    objDom.setValorPorId("CAGENTE_"+tipage, CAGENTEformateado); 
                    objDom.setValorPorId("CAGENTE", CAGENTEformateado); 
                    objDom.setValorPorId("NOMBRE_"+tipage, NOMBREformateado); 
                }else{
                    objDom.setValorPorId("NOMBRE_"+tipage,""); 
                    objDom.setValorPorId("CAGENTE_"+tipage,"");
                    objDom.setValorPorId("CAGENTE","");
                }
            }
            var CAGENTE_4 =  document.axisdesc016Form.CAGENTE_4.value;
            if(tipage==2 && !objUtiles.estaVacio(CAGENTE_4)){
                f_actualizar_agente(4);
            }
        }
            
        function callbackAjaxCambiarAgente(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                //objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado);
                //objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);
                objDom.setValorPorId("CAGENTE_"+document.getElementById("CTIPAGE_BUSC").value, CAGENTEformateado);
                objDom.setValorPorId("NOMBRE_"+document.getElementById("CTIPAGE_BUSC").value, NOMBREformateado);
            }
        }
      
        function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION,CODIGO_CP){
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
                objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + TEXTO + "</b>");
            }   
        }
        
        function f_cerrar_axiscom001() {
            objUtiles.cerrarModal("axiscom001");
        }
        
        /****************************************************************************************/
        /************************************** UTILES *******************************************/
        /****************************************************************************************/
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
        
        function f_onchange_CPAIS() {
            var CPAIS=objDom.getValorPorId("CPAIS");

            if (!objUtiles.estaVacio(CPAIS) && (objNumero.validaNumero(objDom.getValorPorId("CPAIS"), false))){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPAIS";
                qs=qs+"&CPAIS="+CPAIS
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisper002.do", callbackajaxdireccion, qs, this)
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
            if (!objUtiles.estaVacio(CPOBLAC) && (objNumero.validaNumero(objDom.getValorPorId("CPOBLAC"), false))){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPOBLAC";
                qs=qs+"&CPAIS="+CPAIS
                qs=qs+"&CPOBLAC="+CPOBLAC
                qs=qs+"&CPROVIN="+CPROVIN
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisper002.do", callbackajaxdireccion, qs, this)
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
            if (!objUtiles.estaVacio(CPROVIN) && (objNumero.validaNumero(objDom.getValorPorId("CPROVIN"), false))){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPROVIN";
                qs=qs+"&CPAIS="+CPAIS
                qs=qs+"&CPROVIN="+CPROVIN
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisper002.do", callbackajaxdireccion, qs, this)
            }else{
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
                limpiaCampos("CPROVIN");
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
        
        function f_seleccionar_producto(){             
                objDom.setValorPorId ("SPRODUC", objUtiles.utilSplit(document.axisdesc016Form.SPRODUCTO.value, "/")[0]);
                objDom.setValorPorId ("TTITULO", objUtiles.utilSplit(document.axisdesc016Form.SPRODUCTO.value, "/")[1]);
            }
    </script>
  </head>
    <body onload="f_onload()" class=" ">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axiscomi018" c="titulo" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
        </c:import>
        
        <form name="axisdesc016Form" action="" method="POST">
            <input type="hidden" name="operation" value="">
            <input type="hidden" name="CMODO" value="${__formdata.CMODO}">
            <input type="hidden" name="ESTADO" value="${__formdata.CESTADO}">
            <input type="hidden" name="TIPO" value="${__formdata.CTIPO}">
            <input type="hidden" name="CIDIOMA_USU" id="CIDIOMA_USU" value="${__formdata.CIDIOMA_USU}">
            <input type="hidden" name="CCAMPANYA" id="CCAMPANYA" value="${__formdata.CCAMPANYA}">
            <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}"/>
            <input type="hidden" name="TPAIS" value="${__formdata.TPAIS}"/>
            <input type="hidden" name="TPROVIN" value="${__formdata.TPROVIN}"/>
            <input type="hidden" name="TPOBLAC" value="${__formdata.TPOBLAC}"/>
            <input type="hidden" name="TTITULO" id="TTITULO" value=""/>
            <input type="hidden" name="SPRODUC" id="SPRODUC" value="${__formdata.SPRODUC}"/>
            <input type="hidden" name="CTIPAGE_BUSC" id="CTIPAGE_BUSC" value="${__formdata.CTIPAGE_BUSC}"/>

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisdesc016" c="FORM" lit="9905600" /></c:param>
                <c:param name="producto"><axis:alt f="axisdesc016" c="FORM" lit="9905600" /></c:param>
                <c:param name="form">axisdesc016</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">    
                        <tr>
                            <td align="left" >
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:40%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <!-- Codigo -->
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisdesc016" c="CCAMPANYA" lit="1000109" /></b>
                                        </td>
                                    </tr>    
                                    <tr>    
                                        <axis:ocultar f="axisdesc016" c="CCAMPANYA">
                                            <td class="campocaja">
                                               <input type="text" name="TCAMPANYA" id="TCAMPANYA" 
                                                        style="width:auto;" value="${__formdata.TCAMPANYA}"
                                                        class="campowidthinput campo campotexto"
                                                    <axis:atr f="axiscdesc016" c="TCAMPANYA" a="modificable=false&obligatorio=true"/>/>
                                            </td>
                                          </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axiscomi018" c="CAGENTE_TEXT" lit="9002202"/></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <input type="text" name="CAGENTE_2" id="CAGENTE_2"
                                                   style="width:auto;" value="${__formdata.CAGENTE_2}"
                                                   class="campowidthinput campo campotexto"
                                                   title='<axis:alt f="axiscomi018" c="CAGENTE_2" lit="9002202" />'
                                                   <axis:atr f="axisdesc016" c="CAGENTE_2" a="modificable=true&obligatorio=true"/>
                                                   onchange="f_actualizar_agente(2)"
                                                  
                                                     <c:if test="${__formdata.MODO == 'MODIF'}">
                                                    <axis:atr f="axiscomi018" c="CAGENTE" a="modificable=false&obligatorio=true"/>
                                                    </c:if> 
                                                   />
                                             <c:if test="${__formdata.MODO == 'NEW' }">      
                                            <img border="0" src="images/find.gif"
                                                 onclick="f_abrir_axisctr014(2)"
                                                 style="cursor:pointer" alt="<axis:alt f="axisdesc016" c="BUSCAR" lit="100797" />"/> </c:if> 
                                            &nbsp;&nbsp;&nbsp;
                                          </td>
                                          <td class="campocaja" colspan="3">
                                            <input readonly="true" type="text" style="width:75%;"
                                                   name="NOMBRE_2" id="NOMBRE_2"
                                                   value="${__formdata.NOMBRE_2}"
                                                   class="campowidthinput campo campotexto"/>
                                          </td>
                                          <td class="titulocaja">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisdesc016" c="CAGENTE_4" lit="9902363"/></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <input type="text" name="CAGENTE_4" id="CAGENTE_4"
                                                   style="width:auto" value="${__formdata.CAGENTE_4}"
                                                   class="campowidthinput campo campotexto"
                                                   title='<axis:alt f="axisdesc016" c="CAGENTE_4" lit="9902363" />'
                                                   <axis:atr f="axisdesc016" c="CAGENTE_4" a="modificable=true&obligatorio=true"/>
                                                   onchange="f_actualizar_agente(4)"
                                              <c:if test="${__formdata.MODO == 'MODIF'}">
                                                    <axis:atr f="axisdesc016" c="CAGENTE_4" a="modificable=false&obligatorio=true"/>
                                                    </c:if> 
                                                   />
                                             <c:if test="${__formdata.MODO == 'NEW' }">      
                                            <img border="0" src="images/find.gif"
                                                 onclick="f_abrir_axisctr014(4)"
                                                 style="cursor:pointer" alt="<axis:alt f="axisdesc016" c="BUSCAR" lit="100797" />"/> </c:if> 
                                            &nbsp;&nbsp;&nbsp;
                                          </td>
                                          <td class="campocaja" colspan="3">
                                            <input readonly="true" type="text" style="width:75%;"
                                                   name="NOMBRE_4" id="NOMBRE_4"
                                                   value="${__formdata.NOMBRE_4}"
                                                   class="campowidthinput campo campotexto"/>
                                          </td>
                                          <td class="titulocaja">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisdesc016" c="CPAIS" lit="100816"/></b>
                                        </td>
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisdesc016" c="CPROVIN" lit="100756"/></b>
                                        </td>
                                        <td class="titulocaja" colspan="2">                                    
                                            <b><axis:alt f="axisdesc016" c="CPOBLAC" lit="100817"/></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja" colspan="2">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPAIS}" name="CPAIS" id="CPAIS" onchange="f_onchange_CPAIS()" style="width:18%;"
                                            <axis:atr f="axisdesc016" c="CPAIS" a="modificable=true&obligatorio=true"/>
                                            <c:if test="${__formdata.MODO == 'MODIF'}">
                                                    <axis:atr f="axisdesc016" c="CPAIS" a="modificable=false&obligatorio=true"/>
                                            </c:if> />&nbsp;
                                            <c:if test="${__formdata.MODO == 'NEW' }">  
                                            <img id="findPais" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS', null)" 
                                                 style="cursor:pointer" alt="<axis:alt f="axisdesc016" c="BUSCAR" lit="100797" />"/>
                                            </c:if>
                                            &nbsp;<span id="TPAIS_span"><b>${__formdata.TPAIS}</b></span>
                                        </td>
                                        <td class="campocaja" colspan="2">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPROVIN}" name="CPROVIN" id="CPROVIN" onchange="f_onchange_CPROVIN()" style="width:18%;"
                                            <axis:atr f="axisdesc016" c="CPROVIN" a="modificable=true&obligatorio=true"/>
                                            <c:if test="${__formdata.MODO == 'MODIF'}">
                                                    <axis:atr f="axisdesc016" c="CPROVIN" a="modificable=false&obligatorio=true"/>
                                            </c:if> 
                                            />
                                            &nbsp;
                                            <c:if test="${__formdata.MODO == 'NEW' }"> 
                                            <img id="findProvincia" style="visibility:${empty __formdata.CPAIS ? 'hidden' : 'visible'};cursor:pointer" border="0" 
                                                 src="images/find.gif" onclick="f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', document.axisdesc016Form.CPAIS.value)"
                                                 alt="<axis:alt f="axisdesc016" c="BUSCAR" lit="100797" />"/>                
                                            </c:if>
                                            &nbsp;<span id="TPROVIN_span"><b>${__formdata.TPROVIN}</b></span>
                                        </td>
                                        
                                        <td class="campocaja" colspan="2">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOBLAC}" name="CPOBLAC" id="CPOBLAC" onchange="f_onchange_CPOBLAC()" style="width:18%;"
                                            <axis:atr f="axisdesc016" c="CPOBLAC" a="modificable=true&obligatorio=true"/>
                                            <c:if test="${__formdata.MODO == 'MODIF'}">
                                                    <axis:atr f="axisdesc016" c="CPOBLAC" a="modificable=false&obligatorio=true"/>
                                            </c:if>
                                            />
                                            <c:if test="${__formdata.MODO == 'NEW' }"> 
                                            &nbsp;<img id="findPoblacion" style="visibility:${empty __formdata.CPROVIN ? 'hidden' : 'visible'};cursor:pointer" border="0" 
                                                       src="images/find.gif" alt="<axis:alt f="axisdesc016" c="BUSCAR" lit="100797" />"
                                                       onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION', document.axisdesc016Form.CPROVIN.value, 'null')"/>                
                                            </c:if>
                                            &nbsp;<span id="TPOBLAC_span"><b>${__formdata.TPOBLAC}</b></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisdesc016" c="CAGRTIPO">
                                            <td class="titulocaja" >
                                                <b><axis:alt f="axisdesc016" c="CAGRTIPO" lit="180009"/></b>
                                            </td>
                                        </axis:ocultar>
                                        <axis:visible f="axisdesc016" c="SPRODUC"> <!-- TODO C -->
                                            <td class="titulocaja"  colspan="2">
                                                <b><axis:alt f="axisctr102" c="SPRODUC" lit="100829" /></b>                                        
                                            </td>
                                        </axis:visible>
                                        <td class="titulocaja" >
                                           <b>% <axis:alt f="axisdesc016" c="PDTO" lit="1000119"/></b>
                                        </td>
                                    </tr>    
                                    <tr>
                                        <axis:ocultar f="axisdesc016" c="CAGRTIPO">
                                            <td class="campocaja">
                                                <select name = "CAGRTIPO" id="CAGRTIPO" style="width:100%;" size="1"  class="campowidthselect campo campotexto"
                                                        <axis:atr f="axisdesc016" c="CAGRTIPO" a="isInputText=false&modificable=true&obligatorio=true"/>
                                                        <c:if test="${__formdata.MODO == 'MODIF'}">
                                                            <axis:atr f="axisdesc017" c="CAGRTIPO" a="isInputText=false&modificable=false&obligatorio=true"/>
                                                        </c:if>>
                                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisdesc017" c="SELECCIONAR" lit="108341"/> - </option>
                                                        <c:forEach var="agrupa" items="${__formdata.listaArupaciones}">
                                                            <option value = "${agrupa.CAGRTIPO}"
                                                                <c:if test="${agrupa.CAGRTIPO == __formdata.CAGRTIPO}">selected</c:if>>
                                                                    ${agrupa.CAGRTIPO}
                                                            </option>
                                                        </c:forEach>
                                                </select>
                                            </td>
                                        </axis:ocultar>
                                        <axis:visible f="axisdesc016" c="axisctr102_comboProductos"> <!-- TODO C -->
                                            <td class="campocaja" colspan="2">
                                                <select title="<axis:alt f="axisdesc016" c="SPRODUC" lit="100829" />" name = "SPRODUCTO" style="width:95%;" 
                                                   id ="SPRODUCTO" size="1" onchange="f_seleccionar_producto()"  class="campowidthselect campo campotexto"
                                                   <axis:atr f="axisdesc016" c="SPRODUC" a="isInputText=false&modificable=true&obligatorio=true"/>
                                                   <c:if test="${__formdata.MODO == 'MODIF'}">
                                                    <axis:atr f="axisdesc016" c="SPRODUC" a="isInputText=false&modificable=false&obligatorio=true"/>
                                                </c:if>>
                                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr102" c="LIT_SELEC_PRD" lit="103155"/> - </option>
                                                    <c:forEach var="productos" items="${__formdata.listaProductos}">
                                                        <option value = "${productos.SPRODUC}/${productos.TTITULO}"
                                                            <c:if test="${productos.SPRODUC == __formdata.SPRODUC}">selected</c:if>>
                                                            ${productos.TTITULO}                            
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </axis:visible>
                                        <td class="campocaja" >
                                            <input type="text" class="campowidthinput campo" maxlength="3" size="15" value="${__formdata.PDTO}" name="PDTO" id="PDTO"  style="width:25%;"  />
                                        </td>
                                    </tr>
                        </table>
                    </td>
                </tr>
            </table>					
            
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisdesc016</c:param><c:param name="f">axisdesc016</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
               
           
            
        </form>
      <c:import url="../include/mensajes.jsp" />
    </body>
</html>

