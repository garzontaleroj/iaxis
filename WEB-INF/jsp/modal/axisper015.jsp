<%/* Revision:# SvUDVwSMae2JM/+wmFRwUg== # */%>
<%-- 
*  Fichero: axisper015.jsp
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a>
*
*  Fecha: 23/07/2008
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes" %>
<%@ page import="java.util.*" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
  
        var nav4 = window.Event ? true : false;
		function ValidNum(evt) {
		    // NOTE: Backspace = 8, Enter = 13, '0' = 48, '9' = 57
		    	var key = nav4 ? evt.which : evt.keyCode;
			    return (key <= 13 || (key >= 48 && key <= 57));
		}
        
        function f_onload() {
      <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisper015');
	</c:if>
            var PSPERSONOUT = "${requestScope.PSPERSONOUT}"; 
            
            if (!objUtiles.estaVacio(PSPERSONOUT)){
                parent.f_aceptar_axisper015( PSPERSONOUT);
            }
            f_cargar_propiedades_pantalla(); 
            
            var CPAIS = document.miForm.CPAISEXP.value;
            
            if (!objUtiles.estaVacio(CPAIS)){
                if (!objUtiles.estaVacio(f_buscar_TPAISEXP(CPAIS))){
                    objDom.setValorHTMLPorId("TPAISEXP_span", "<b>" + f_buscar_TPAISEXP(CPAIS)+"</b>");
                }
            }
            

        }
    
 
                
        function f_but_aceptar() {
            if (objValidador.validaEntrada()) {
            try { document.miForm.TPAISEXP.value = document.getElementById("TPAISEXP_span").innerHTML;} catch (e) {}
            try { document.miForm.TDEPARTEXP.value = document.getElementById("TDEPARTEXP_span").innerHTML;} catch (e) {}
            try { document.miForm.TCIUDADEXP.value = document.getElementById("TCIUDADEXP_span").innerHTML;} catch (e) {}
                 objUtiles.ejecutarFormulario("modal_axisper015.do?SWIDEPRI="+document.miForm.CDEFECTO.value, "grabarPersona", document.miForm, "_self", objJsMessages.jslit_cargando);   
               
            }
        }
       
        function f_buscar_TPAISEXP(CPAISEXP) {
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
                if (CPAISEXP == pais){
                objDom.setVisibilidadPorId("findProvincia", "visible");  
                return "<%=paisHash.get("TPAIS")%>"
                }
                <%}}}}%> 
               
        }  
        function f_but_cancelar() {
            parent.f_cerrar_axisper015();
        }        
 
         
         /****************************************************************************************/
        /*********************************** CALLBACK AJAX **************************************/
        /****************************************************************************************/
            
       
      
      function f_onchange_CPAISEXP() {
            var CPAISEXP=objDom.getValorPorId("CPAISEXP");
            
            if (!objUtiles.estaVacio(CPAISEXP)){
                 var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPAIS_RESIDENCIA";
                qs=qs+"&CPAIS_RESIDENCIA="+CPAISEXP
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisper010.do", callbackajaxdireccionCPAISEXP, qs, this)
            } else {
                 objDom.setValorPorId("CPAISEXP", "");
                objDom.setValorHTMLPorId("TPAISEXP_span", "");
                objDom.setVisibilidadPorId("findProvincia", "hidden");
                limpiaCampos("CPAISEXP");
            }
        }
        
         function callbackajaxdireccionCPAISEXP (ajaxResponseText){
            try{ 
            
           // alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                   
                 
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS_RESIDENCIA")[0])) {
                    
                       if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPAISEXP", "");
                           // limpiaCampos("CPAIS");
                        }else{
                            objDom.setValorPorId("CPAISEXP", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS_RESIDENCIA"), 0, 0));
                           
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAISRESIDENCIA")[0])){
                                objDom.setValorHTMLPorId("TPAISEXP_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAISRESIDENCIA"), 0, 0) + "</b>");
                                limpiaCampos("CPAISEXP");
                                objDom.setVisibilidadPorId("findProvincia", "visible");   
                                }
                        }
                    }
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
        
        
     
    
         function f_onchange_CDEPARTEXP() {
            var CPAIS_DIRECCION=objDom.getValorPorId("CPAISEXP");
            var CPROVIN=objDom.getValorPorId("CDEPARTEXP");
            if (!objUtiles.estaVacio(CPROVIN)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPROVIN";
                qs=qs+"&CPAIS_DIRECCION="+CPAIS_DIRECCION
                qs=qs+"&CPROVIN="+CPROVIN
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisper005.do", callbackajaxdireccionDEPARCIUD, qs, this)
            }else{
                objDom.setValorPorId("CDEPARTEXP", "");
                objDom.setValorHTMLPorId("TDEPARTEXP_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
                limpiaCampos("CDEPARTEXP");
            }
        }
        
         function f_onchange_CCIUDADEXP() {
            var CPAIS_DIRECCION=objDom.getValorPorId("CPAISEXP");
            var CPOBLAC=objDom.getValorPorId("CCIUDADEXP");
            var CPROVIN=objDom.getValorPorId("CDEPARTEXP");
            if (!objUtiles.estaVacio(CPOBLAC)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPOBLAC";
                qs=qs+"&CPAIS_DIRECCION="+CPAIS_DIRECCION
                qs=qs+"&CPOBLAC="+CPOBLAC
                qs=qs+"&CPROVIN="+CPROVIN
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisper005.do", callbackajaxdireccionDEPARCIUD, qs, this)
            } else {
             
                limpiaCampos("CDEPARTEXP");
            }
        }
        
             function callbackajaxdireccionDEPARCIUD (ajaxResponseText){
             
             try{
              var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPROVIN")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CDEPARTEXP", "");
                            limpiaCampos("CDEPARTEXP");
                        }else{
                            objDom.setValorPorId("CDEPARTEXP", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPROVIN"), 0, 0));
                            objDom.setVisibilidadPorId("findPoblacion", "visible");
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPROVIN")[0])){
                            //alert(objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPROVIN"), 0, 0));
                            objDom.setValorHTMLPorId("TDEPARTEXP_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPROVIN"), 0, 0) + "</b>");
                                
                                limpiaCampos("CDEPARTEXP");
                            }
                        }
                    }
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPOBLAC")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CCIUDADEXP", "");
                        }else{
                            objDom.setValorPorId("CCIUDADEXP", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPOBLAC"), 0, 0));
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPOBLAC")[0])){
                                objDom.setValorHTMLPorId("TCIUDADEXP_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOBLAC"), 0, 0) + "</b>");
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
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
                
        function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION,CODIGO_CP){
             objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
              "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION + "&CODIGO_CP=" + CODIGO_CP);
          
        }
        
        function f_aceptar_axiscom001(CODIGO, TEXTO, CODIGO_CONSULTA){
            f_cerrar_axiscom001();
            if (!objUtiles.estaVacio(TEXTO))
                TEXTO = objUtiles.replaceAll(TEXTO, "-quote-", "\'");
            if (CODIGO_CONSULTA == "LISTA_PAIS") {
                objDom.setValorPorId("CPAISEXP", CODIGO);
                objDom.setVisibilidadPorId("findProvincia", "visible");                
                objDom.setValorHTMLPorId("TPAISEXP_span", "<b>" + TEXTO + "</b>");
                limpiaCampos("CPAISEXP");
            }
            else if (CODIGO_CONSULTA == "LISTA_PROVINCIA") {
                objDom.setValorPorId("CDEPARTEXP", CODIGO);
                objDom.setVisibilidadPorId("findPoblacion", "visible");
                objDom.setValorHTMLPorId("TDEPARTEXP_span", "<b>" + TEXTO + "</b>");
                limpiaCampos("CDEPARTEXP");
            }
            else if (CODIGO_CONSULTA == "LISTA_POBLACION") {
                objDom.setValorPorId("CCIUDADEXP", CODIGO);
                objDom.setValorHTMLPorId("TCIUDADEXP_span", "<b>" + TEXTO + "</b>");
            }   
        }
        
        function f_cerrar_axiscom001() {
            objUtiles.cerrarModal("axiscom001");
        }
     
        
        /****************************************************************************************/
        /************************************** UTILS *******************************************/
        /****************************************************************************************/
        
        function actualitzarCheckbox(obj){
         objDom.setValorPorId("CDEFECTO", ((objDom.getComponenteMarcado(obj))? "1" : "0" ));
        }
        
    
          function limpiaCampos (CAMPO){
            if(objUtiles.utilEquals(CAMPO, "CPAISEXP")){
                //Limpio província
                objDom.setValorPorId("CDEPARTEXP", "");
                objDom.setValorHTMLPorId("TDEPARTEXP_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
            }
            
            if(objUtiles.utilEquals(CAMPO, "CPAISEXP") ||
                objUtiles.utilEquals(CAMPO, "CDEPARTEXP")){
                    //Limpio población
                    objDom.setValorPorId("CCIUDADEXP", "");
                    objDom.setValorHTMLPorId("TCIUDADEXP_span", "");
            }
        }

  
        
      
    </script>
  </head>
    <body onload="f_onload()">
    	<div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
       </c:import>
     <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
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
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="faceptar" value="${__formdata.faceptar}"/>
            <%-- Esto es necesario tenerlo como hidden para volverlo a enviar a servidor para grabar --%>
            <input type="hidden" name="isNew" value="${__formdata.isNew}"/>
            <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}"/>
            <input type="hidden" name="SPEREAL" value="${__formdata.SPEREAL}"/>
            <input type="hidden" name="CESTPER" value="${__formdata.CESTPER}"/>
            <imput type="hidden" name="SWIDEPRI" id="SWIDEPRI" value="${__formdata.SWIDEPRI}"/>
            <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}"/>
            <input type="hidden" name="CTIPPER" value="${__formdata.CTIPPER}"/>  
            <input type="hidden" name="TPAISEXP" value="${__formdata.TPAISEXP}"/>
            <input type="hidden" name="TDEPARTEXP" value="${__formdata.TDEPARTEXP}"/>
            <input type="hidden" name="TCIUDADEXP" value="${__formdata.TCIUDADEXP}"/>
            <!--<input type="hidden" name="FECHAEXP" value="${__formdata.FECHAEXP}"/>-->
            <input type="hidden" name="MODO" value="${__formdata.MODO}"/>
            

            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisper015" c="tit_form" lit="9000432" /></c:param>
                <c:param name="producto"><axis:alt f="axisper015" c="tit_form" lit="9000432" /></c:param>
                <c:param name="form">axisper015</c:param>
            </c:import>

            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 2}"> <%-- TIDENTI == 2: Persona Jurídica --%>
                        <div class="separador">&nbsp;</div>
                       <%-- Datos IDENTIFICADORES --%>
                    
                        <table class="seccion">
                            <tr>
                                <th style="width:4%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper015" c="TIT_DOC" lit="109774"/></b>
                                </td>
                                 <td class="titulocaja">
                                    <b><axis:alt f="axisper015" c="TIT_DOC" lit="105330"/></b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="campocaja">
                                <c:choose>
                                 <c:when test="${empty __formdata.isNew || __formdata.isNew}">
                                                   
                                    <select name="CTIPIDE" id="CTIPIDE" size="1" class="campowidthselect campo campotexto_ob" style="width:90%;" >&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper015" c="TIT_CTIPIDE" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipDocum}">
                                            <option value = "${element.CATRIBU}" 
                                                <c:set var="tempCTIPIDE">temp${__formdata.CTIPIDE}</c:set>
                                                <c:if test="${tempCTIPIDE!= 'tempnull'}">
                                                    <c:set var="tempCATRIBU">temp${element.CATRIBU}</c:set>
                                                    <c:if test="${tempCATRIBU == tempCTIPIDE}"> selected = "selected" </c:if>
                                                </c:if>/>
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>                                        
                                </c:when>
                                <c:otherwise>
                                    <input type="text" readonly class="campowidthinput campo campotexto" size="15" maxlength="3" value="${__formdata.TTIPIDE}" name="TTIPIDE" id="TTIPIDE" style="width:90%;" />                                
                                    
                                     <input type="hidden"  class="campowidthinput campo campotexto" size="15" maxlength="3" value="${__formdata.CTIPIDE}" name="CTIPIDE" id="CTIPIDE" style="width:50%;" />                                
                                </c:otherwise>
                                </c:choose>
                                </td>
                                <td class="campocaja" >
                                    <input type="text" onkeypress="return ValidNum(event);"  <c:if test="${__formdata.SWIDEPRI != 1}">class="campowidthinput campo campotexto_ob"</c:if> <c:if test="${__formdata.SWIDEPRI == 1}">readonly="true" class="campowidthinput campo campotexto"</c:if> size="15" value="${__formdata.NNUMIDE}"  name="NNUMIDE" id="NNUMIDE" style="width:50%;"/>
                                </td>
                                 <td class="campocaja">
                                <b><axis:alt f="axisper015" c="TIT_CDEFECTO" lit="100713"/></b>
                                <input  type="checkbox" id="CDEFECTO" disabled="true"  name="CDEFECTO" value="${__formdata.SWIDEPRI}" a="modificable=false"
                                <c:if test="${empty __formdata.isNew || __formdata.isNew}">onClick="javascript:actualitzarCheckbox(this)" </c:if> 
                                <c:if test="${__formdata.SWIDEPRI == 1}">checked</c:if> 
                                <axis:atr f="axisper015" c="CDEFECTO" a="isinputtext=false"  />/>
                            </td>
                            </tr>
                    
                            <tr>
                             <axis:visible c="CPAISEXP" f="axisper015">
                            <td>
                                &nbsp;
                            </td> 
                            </axis:visible>
                            <axis:visible c="CPAISEXP" f="axisper015">
                                <td class="titulocaja">
                                    <b id="label_CPAISEXP"><axis:alt f="axisper015" c="CPAISEXP" lit="9903741"/></b>
                                </td>
                            </axis:visible>
                            
                            <axis:visible c="CDEPARTEXP" f="axisper015">
                                <td class="titulocaja">
                                    <b id="label_CDEPARTEXP"><axis:alt f="axisper015" c="CDEPARTEXP" lit="9903953"/></b>
                                </td>
                            </axis:visible>
                            
                            <axis:visible c="CCIUDADEXP" f="axisper015">
                                <td class="titulocaja">                                    
                                    <b id="label_CCIUDADEXP"><axis:alt f="axisper015" c="CCIUDADEXP" lit="9903740"/></b>
                                </td>
                            </axis:visible>
                            
                            <axis:visible c="FECHAEXP" f="axisper015">
                                 <td class="titulocaja">
                                    <b id="label_FECHAEXP"><axis:alt f="axisper015" c="FECHAEXP" lit="9903739"/></b>
                                </td>
                            </axis:visible>
                            
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            
                            <axis:visible c="CPAISEXP" f="axisper015">
                                <td class="campocaja" id="td_CPAISEXP">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPAISEXP}" name="CPAISEXP" id="CPAISEXP" onchange="f_onchange_CPAISEXP()" style="width:18%;" 
                                            title="<axis:alt f="axisper015" c="CPAISEXP" lit="9903741"/>"
                                            <axis:atr f="axisper015" c="CPAISEXP" a="obligatorio=false"/>/>
                                            &nbsp;<img id="findPais" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS', null)" style="cursor:pointer"/>
                                    &nbsp;<span id="TPAISEXP_span"><b>${__formdata.TPAISEXP}</b></span>
                                </td>
                            </axis:visible>
                            <axis:visible c="CDEPARTEXP" f="axisper015">
                                <td class="campocaja"  id="td_CDEPARTEXP">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CDEPARTEXP}" name="CDEPARTEXP" id="CDEPARTEXP" onchange="f_onchange_CDEPARTEXP()" style="width:18%;"  
                                           title="<axis:alt f="axisper015" c="CDEPARTEXP" lit="9903953"/>"
                                           <axis:atr f="axisper015" c="CDEPARTEXP" a="obligatorio=false"/>/>
                                    &nbsp;<img id="findProvincia" style="visibility:${empty __formdata.CPAISEXP ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', document.miForm.CPAISEXP.value)"/>                
                                    &nbsp;<span id="TDEPARTEXP_span"><b>${__formdata.TDEPARTEXP}</b></span>
                                </td>
                            </axis:visible>
                            <axis:visible c="CCIUDADEXP" f="axisper015">
                                <td class="campocaja" id="td_CCIUDADEXP">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CCIUDADEXP}" name="CCIUDADEXP" id="CCIUDADEXP" onchange="f_onchange_CCIUDADEXP()" style="width:18%;"
                                           title="<axis:alt f="axisper015" c="CCIUDADEXP" lit="9903740"/>"
                                           <axis:atr f="axisper015" c="CCIUDADEXP" a="obligatorio=false"/>/>
                                    &nbsp;<img id="findPoblacion" style="visibility:${empty __formdata.CDEPARTEXP ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION', document.miForm.CDEPARTEXP.value, null )"/>                
                                    &nbsp;<span id="TCIUDADEXP_span"><b>${__formdata.TCIUDADEXP}</b></span>
                                </td>
                                </axis:visible>
                            <axis:visible c="FECHAEXP" f="axisper015">
                                 <td class="campocaja" id="td_FECHAEXP">
                                    <input onmousemove="this.title=document.getElementById('label_FECHAEXP').innerText" type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FECHADEXP}"/>" name="FECHAEXP" id="FECHAEXP"  style="width:35%;"
                                    title= "<axis:alt f="axisper015" c="FECHAEXP" lit="9903739"/>"  <axis:atr f="axisper015" c="FECHAEXP" a="modificable=true&obligatorio=false&formato=fecha"/>  />
                                    <a style="vertical-align:middle;"><img id="popup_calendario_FECHAEXP" alt="<axis:alt f="axisper015" c="FECHAEXP" lit="9903739"/>"  src="images/calendar.gif" onmousemove="this.title=document.getElementById('label_FECHAEXP').innerText"/></a>
                                </td>
                           </axis:visible>
                        </tr>
                         
                        </table>
                        </c:if>
                     
                    
                    </td>
                </tr>
            </table>			
            
            <div class="separador">&nbsp;</div>
            <div class="separador">&nbsp;</div>
            <div class="separador">&nbsp;</div>
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisper015</c:param><c:param name="f">axisper015</c:param>
                <c:param name="__botones">cancelar<c:if test="${__formdata.SWIDEPRI != 1  || (__configform.axisper015__CPAISEXP__visible == 'true' && __configform.axisper015__CPAISEXP__valordefecto != null)}">,aceptar</c:if></c:param>
            </c:import>
        </form>
        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FECHAEXP",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FECHAEXP", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>
   
        <c:import url="../include/mensajes.jsp" />
</div>
    </body>
</html>

