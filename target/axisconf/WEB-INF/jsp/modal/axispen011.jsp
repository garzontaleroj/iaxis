<%/*
*  Fichero: axispen011.jsp
*
*  Fecha: 15/12/2009
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
    <title><fmt:message key="9900899"/></title> 
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>  
   
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {         
            
            if (document.miForm.volverPadre.value == 1)           
                parent.f_cerrar_modal('axispen011');
                objUtiles.ejecutarFormulario("axis_axispen001.do", "busqueda_depositarias", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axispen011');
        }
        
        

        function f_but_aceptar() {

                objUtiles.ejecutarFormulario("modal_axispen011.do", "nueva_depositaria", document.miForm, "_self", objJsMessages.jslit_cargando);                
                document.miForm.volverPadre.value = 1;
                
                //objAjax.invokeAsyncCGI("modal_axispen011.do?SPERSON="+miForm.SPERSON.value+"&NNUMIDE="+miForm.NNUMIDE.value+"&NOMBRE="+miForm.NOMBRE.value+"&FALTA="+miForm.FALTA.value+"&CCODDEP=null", callbackAjaxActualitzaPersona, "operation=nueva_depositaria", this, objJsMessages.jslit_cargando);

        }
        
        
        function f_recargar(thiss){

        objDom.setValorPorId("SPERSON",'');
        
         
        if (!objUtiles.estaVacio( objDom.getValorPorId("NOMBRE") )){
            objDom.setValorPorId("NOMBRE",'');
            objDom.setValorPorId("NNUMIDE",'');
        }
        if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'BANC')){
                var CBANCAR = objUtiles.utilSplit(thiss.value, "/")[0]; // CBANCAR
                var CTIPBAN = objUtiles.utilSplit(thiss.value, "/")[1]; // CTIPBAN
                objDom.setValorPorId("CBANCAR", CBANCAR);
                objDom.setValorPorId("CTIPBAN", CTIPBAN);
        }             
        
            objUtiles.ejecutarFormulario ("modal_axispen011.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);   
            
        }   
        
/*axisper021 i axisper022*/
      function f_abrir_axisper021 () {
            objUtiles.abrirModal("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBLICAS");
      }
      function f_cerrar_axisper022(){
      f_cerrar_modalespersona("axisper022");
      }          
      function f_cerrar_axisper021(){
      f_cerrar_modalespersona("axisper021");
      }   
      function f_nova_persona(){
      f_cerrar_modalespersona("axisper021");
      objUtiles.abrirModal("axisper022","src","modal_axisper022.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBLICAS");  
      }
      function f_cerrar_modalespersona(modal){
      objUtiles.cerrarModal(modal);
      } 
      function f_aceptar_persona(SPERSON,CAGENTE, modal){
      
        f_cerrar_modalespersona(modal);
         if (!objUtiles.estaVacio(SPERSON)){
        objAjax.invokeAsyncCGI("modal_axispen011.do?SPERSON="+SPERSON+"&CAGENTE="+CAGENTE, callbackAjaxActualitzaPersona, "operation=ajax_actualiza_persona", this, objJsMessages.jslit_cargando);
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
            

                if(objUtiles.existeObjetoXml(doc.getElementsByTagName("CCC")[0])){
                    var elementos = doc.getElementsByTagName("OB_IAX_CCC");
                    
                    var cccCombo = document.miForm.BANC;     
                    objDom.borrarOpcionesDeCombo(cccCombo);
                    objDom.addOpcionACombo(-1, '<fmt:message key="1000348"/>', cccCombo, 0);
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
                    
                }                

             
        }          
     
    }catch(e){}
    }
     
        
    </script>    
</head>

<body onunload="javascript:f_onload()">
    
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
          
          
    <form name="miForm" action="modal_axispen011.do" method="POST">     
    <input type="hidden" name="operation" value="" />
    <input type="hidden" name="volverPadre"  value="0" />
    
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><fmt:message key="9900902"/></c:param>     
                <c:param name="formulario"><fmt:message key="9900899"/></c:param> 
                <c:param name="form">axispen011</c:param>
        </c:import>
        
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><fmt:message key="1000235"/></c:param>
                <c:param name="nid" value="axisper021"/>
            </c:import>    
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><fmt:message key="1000214"/></c:param>
                <c:param name="nid" value="axisper022"/>
            </c:import>             
            
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
                                        <th style="width:10%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:10%;height:0px"></th>
                                        <th style="width:60%;height:0px"></th>
                                        
                                    </tr>
<% System.out.println("atributo parametro : " + request.getParameter("parametro")); %>     

<% if (!request.getParameter("parametro").equalsIgnoreCase("alta")) { %>
                                    <tr>
                                      <axis:visible f="axispen011" c="CCODDEP" >
                                             <td class="text" >
                                                  <b><axis:alt c="CCODDEP" f="axisper001" lit="1000109"/></b>                                             
                                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CCODDEP}" name="CCODDEP" id="CCODDEP" style="width:100%;" 
                                                <axis:atr f="axispen011" c="CCODDEP" a="modificable=false"/> /> 
                                            </td>
                                        </axis:visible>
                                    </tr>
<%}%>                                    
                                    <tr>
                                            <td class="titulocaja" >
                                                  <b><axis:alt c="NNUMIDE" f="axisper001" lit="105330"/></b>  
                                            <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}" class="campowidthinput campo campotexto" style="width:90%"
                                                <axis:atr f="axispen011" c="SPERSON" a="modificable=true"/> /> 
                                                <input type="text" name="NNUMIDE" value="${__formdata.NNUMIDE}" class="campowidthinput campo campotexto_ob" style="width:70%"
                                                <axis:atr f="axispen011" c="NNUMIDE" a="modificable=false"/> /> 
                                                <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisper021()" style="cursor:pointer"/>  
                                            </td>
                                            <td class="titulocaja" colspan="2">
                                                <b><axis:alt c="NOMBRE" f="axispen011" lit="105940"/></b>                                              
                                                <input type="text" name="NOMBRE" value="${__formdata.NOMBRE}" class="campowidthinput campo campotexto_ob" style="width:90%"
                                                <axis:atr f="axispen011" c="NOMBRE" a="modificable=false"/> /> 
                                            </td>
                                            <td></td>
                                    </tr>
                                    <tr>
                                        <axis:visible f="axispen011" c="FALTA">
                                         <td class="titulocaja">
                                            <b><axis:alt c="FALTA" f="axispen011" lit="9000437"/></b>       
                                            <input type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FALTA}"/>" name="FALTA" id="FALTA"  style="width:70%;"
                                            <axis:atr f="axispen011" c="FALTA" a="modificable=true&formato=fecha"/> title="<fmt:message key="9000437"/>"
                                            <a style="vertical-align:middle;"><img id="popup_calendario_FALTA" alt="<fmt:message key="9000437"/>" title="<fmt:message key="9000437" />" src="images/calendar.gif"/></a>
                                            <div class="separador">&nbsp;</div>
                                            <div class="separador">&nbsp;</div>                                            
                                        </td>                                        
                                        </axis:visible>          
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
        <!--<c:if test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}">,aceptar </c:if>-->
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="__botones">cancelar,aceptar</c:param> 
        </c:import>
    
    </form>

        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FALTA",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FALTA", 
                singleClick    :    true,
                firstDay       :    1
            });
            Calendar.setup({
                inputField     :    "FALTAcerca",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FALTAcerca", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>

    
    <c:import url="../include/mensajes.jsp"/>



</body>
</html>