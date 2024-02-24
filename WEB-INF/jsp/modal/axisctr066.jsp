<%/*
*  Fichero: axisctr066.jsp
*
*  Fecha: 16/12/2009
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><fmt:message key="9900854"/></title> <%-- Buscador de comissions d'adquisició --%>    
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    
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
   
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() { 
            var agent = document.getElementById("CAGENTE_TEXT");
            agent.focus();
            agent.focused = true;
            revisarEstilos();            
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisctr066');
        }
        
        function canviaSelectedAgent(){        
            var agent = document.getElementById("CAGENTE_TEXT");            
            agent.focused = false;
        
        }
        
        function f_but_buscar() {
            if (objValidador.validaEntrada()) {     
                var elem = document.getElementById("CAGENTE_TEXT");                         
        //        if(!elem.focused){
                    var CAGENTE = document.getElementById("CAGENTE_TEXT").value;
                    var FEFEINI = document.getElementById("FEFEINI").value;
                    var FEFEFIN = document.getElementById("FEFEFIN").value;                                        
                    parent.f_aceptar_axisctr066(CAGENTE,FEFEINI,FEFEFIN);                                
        //        }

            }
        }
        
        
        function thiss(thiss){
            thiss.value = f_formatdate(thiss);
        }
        
        function f_formatdate(entrada){
         var jDate = new JsFecha();

            if(entrada.value.length>0){
                entrada.value=jDate.formateaFecha(entrada.value);            
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    entrada.value = '';//alert('Formato fecha incorrecto para el campo '+ title);
                }
        }
         return entrada.value;
        }
       
     /****************************************************************************************/
     /******************************* Gestió Agent *****************************************/
     /****************************************************************************************/      
        
             function f_abrir_axisctr014() {
                objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
            }
            
            function f_cerrar_axisctr014() {
                objUtiles.cerrarModal("axisctr014")
            }    
            function f_aceptar_axisctr014 (CAGENTE){
                objDom.setValorPorId("CAGENTE", CAGENTE);
                f_cerrar_axisctr014();
                objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            }
        
        
           function f_actualizar_agente(){
               var agent = document.getElementById("CAGENTE_TEXT");
               agent.focused = true;               
               objAjax.invokeAsyncCGI("modal_axisctr066.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE_TEXT), this, objJsMessages.jslit_cargando);
                     //objAjax.invokeAsyncCGI("modal_axisctr066.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE_TEXT) + 
                       //     "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO), this, objJsMessages.jslit_cargando);
                    
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
                    }else{
                        
                        objDom.setValorPorId("NOMBRE_TEXT",""); 
                        objDom.setValorPorId("CAGENTE_TEXT","");
                        objDom.setValorPorId("CAGENTE","");
                    }
            
                
                }
             
            }
        
        
        
        
        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">       
   
      <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><fmt:message key="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
        </c:import> 
   
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><fmt:message key="9900854"/></c:param>     <%-- Buscador de comissions d'adquisició --%>  
                <c:param name="formulario"><fmt:message key="9900854"/></c:param> <%-- Buscador de comissions d'adquisició --%>  
                <c:param name="form">axisctr066</c:param>
        </c:import>
            
        <input type="hidden" name="operation" value=""/>
                
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                                <div class="separador">&nbsp;</div>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:40%;height:0px"></th>
                                        <th style="width:30%;height:0px"></th>
                                        <th style="width:10%; height:0px"></th>
                                    </tr>
                                    <tr>
                                         <axis:visible f="axisctr001" c="CAGENTE"> 
                                            <td class="titulocaja">
                                                <b><fmt:message key="100584" /></b>
                                            </td>
                                            <td class="titulocaja">
                                                <b><fmt:message key="105940" /></b>
                                            </td>
                                         </axis:visible>
                                    </tr>
                                    <tr>
                                     <axis:visible f="axisctr066" c="CAGENTE"> 
                                        <td class="campocaja">
                                            <input type="text" name="CAGENTE_TEXT" id="CAGENTE_TEXT" value="${sessionScope.axisctr_agente.CODI}" class="campowidthinput campo campotexto" style="width:70%"
                                            <axis:atr f="axisctr001" c="CAGENTE" a="modificable=true"/> onchange="f_actualizar_agente()"  onfocus="this.focused=true;"/>
                                            <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                        </td>
                                         <td class="campocaja">    
                                            <input readonly="true" type="text" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${sessionScope.axisctr_agente.NOMBRE}" class="campowidthinput campo campotexto"/>
                                        </td>
                                     </axis:visible>
                                    </tr>
                                    
                                    
                                    <tr>
                                      <axis:ocultar f="axisctr066" c="FEFEINI" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_FEFEINI"><fmt:message key="9000716"/></b> <%-- F.ini.vigencia --%>
                                            </td>            
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr066" c="FEFEFIN" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_FEFEFIN"><fmt:message key="9000717"/></b> <%-- F.fin vigencia --%>
                                            </td>            
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                    
                                      <axis:ocultar f="axisctr066" c="FEFEINI" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FEFEINI" name="FEFEINI" size="15" onfocus="canviaSelectedAgent()" onchange="thiss(this);"
                                                <axis:atr f="axisctr066" c="FEFEINI" a="formato=fecha"/>
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEFEINI}"/>" style="width:70%"
                                                title="<fmt:message key="9000716"/>"/><a style="vertical-align:middle;"><img
                                                id="icon_FEFEINI" alt="<fmt:message key="108341"/>" title="<fmt:message key="108341" />"  src="images/calendar.gif"/></a>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr066" c="FEFEFIN" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FEFEFIN" name="FEFEFIN" size="15" onfocus="canviaSelectedAgent()" onchange="thiss(this);" 
                                                <axis:atr f="axisctr066" c="FEFEFIN" a="formato=fecha"/>
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEFEFIN}"/>" style="width:35%"
                                                title="<fmt:message key="9000717"/>"/><a style="vertical-align:middle;"><img
                                                id="icon_FEFEFIN" alt="<fmt:message key="108341"/>" title="<fmt:message key="108341" />" src="images/calendar.gif"/></a>
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
        <div class="separador">&nbsp; </div>                                                                                                                                                                        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="__botones">cancelar,buscar</c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
    
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FEFEINI",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEFEINI", 
            singleClick    :    true,
            firstDay       :    1
        });
        Calendar.setup({
            inputField     :    "FEFEFIN",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEFEFIN", 
            singleClick    :    true,
            firstDay       :    1
        });
    </script>

</body>
</html>