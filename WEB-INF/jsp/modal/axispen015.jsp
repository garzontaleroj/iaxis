<%/*
*  Fichero: axispen010.jsp
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
    <title><fmt:message key="9900844"/></title> <%-- Buscador de promotors --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
     
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {
            
            var ok = "${__formdata.OK}"
            
            if(ok == 1){
                parent.f_aceptar_axispen015()
            }
                
            revisarEstilos();               
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axispen015');
        }
        
        function f_but_aceptar(){
            objUtiles.ejecutarFormulario("modal_axispen015.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando); 
        }
        
        function f_abrir_axisper021 () {
            objUtiles.abrirModal("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBLICAS");
        }
        
        function f_cerrar_axisper021(){
            f_cerrar_modalespersona("axisper021");
        }
        
        function f_aceptar_persona(SPERSON,CAGENTE, modal){
        f_cerrar_modalespersona(modal);
         if (!objUtiles.estaVacio(SPERSON)){
        objAjax.invokeAsyncCGI("modal_axispen015.do?SPERSON="+SPERSON+"&CAGENTE="+CAGENTE, callbackAjaxActualitzaPersona, "operation=ajax_actualiza_persona", this, objJsMessages.jslit_cargando);
        }
      }
      
      function f_nova_persona(){
      f_cerrar_modalespersona("axisper021");
      objUtiles.abrirModal("axisper022","src","modal_axisper022.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="+document.miForm.CAGENTE.value);  
      }
      function f_cerrar_modalespersona(modal){
      objUtiles.cerrarModal(modal);
      }
        
        function callbackAjaxActualitzaPersona (ajaxResponseText) {
            try{
                var doc = objAjax.domParse(ajaxResponseText);
       
                if(!objAppMensajes.existenErroresEnAplicacion(doc)) {   
                    
                    var NNUMIDE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0);
                    objDom.setValorPorId("NNUMIDE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0));
                    var NOMBRE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0);
                    var APELLIDO1 = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0);
                    var APELLIDO2 = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0);
                    objDom.setValorPorId("NOMBRE", NOMBRE+' ' + APELLIDO1 +' '+ APELLIDO2);
                    var SPERSON = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0);
                    objDom.setValorPorId("SPERSON", objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0));
           
                    document.miForm.SPERSON.value = SPERSON;
                    document.miForm.NNUMIDE.value = NNUMIDE;
                    document.miForm.NOMBRE.value = NOMBRE+' ' + APELLIDO1 +' '+ APELLIDO2;
           
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("CCC")[0])){
                    var elementos = doc.getElementsByTagName("CCC");
                    //alert(elementos.length)
                    var cccCombo = document.miForm.BANC;     
                    objDom.borrarOpcionesDeCombo(cccCombo);
                    objDom.addOpcionACombo(-1, <fmt:message key="1000348"/>, cccCombo, 0);
                    
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
               }catch(e){}
        }
        
        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><fmt:message key="9900911"/></c:param>     <%-- Buscador de promotores --%>
                <c:param name="formulario"><fmt:message key="9900911"/></c:param> <%-- Buscador de promotores --%>
                <c:param name="form">axispen015</c:param>
        </c:import>
            
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}"/>
        
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><fmt:message key="1000235"/></c:param>
                <c:param name="nid" value="axisper021"/>
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
                                        <th style="width:30%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:30%;height:0px"></th>   
                                    </tr>
                                    <tr>
                                        <axis:visible f="axispen010" c="PLANESPEN" > <!-- TODO C -->
                                            <td class="titulocaja">
                                                <b><axis:alt f="axispen015" c="PLANESPEN" lit="9900775"></axis:alt></b>  
                                            </td>
                                        </axis:visible>
                                    </tr>                                    
                                     <tr>                      
                                        <td class="campocaja">
                                            <axis:visible f="axispen010" c="PLANESPEN" >
                                                <select name = "PLANESPEN" id="PLANESPEN"   size="1" onchange="" class="campowidthselect campo campotexto">
                                                    <option value = "<%= Integer.MIN_VALUE %>"> - <fmt:message key="108341"/> - </option>
                                                    <c:forEach var="planes" items="${list_planes}">
                                                        <option value = "${planes.OB_IAX_PLANPENSIONES.CCODPLA}"
                                                            <c:if test="${planes.OB_IAX_PLANPENSIONES.CCODPLA == __formdata.PLANESPEN}">selected</c:if>>
                                                            ${planes.OB_IAX_PLANPENSIONES.TNOMPLA}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </axis:visible>
                                        </td> 
                                     </tr>                                                               
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                                <div class="separador">&nbsp;</div>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:30%;height:0px"></th>   
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                                <b><axis:alt f="axispen015" c="VCONTRATO" lit="9900900"></axis:alt></b>  
                                         </td> 
                                    </tr>                                    
                                     <tr>                      
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.VCONTRATO}" name="VCONTRATO" id="VCONTRATO" style="width:75%;">
                                        </td> 
                                     </tr>
                                     <tr>
                                        <td class="titulocaja">
                                                <b><axis:alt f="axispen015" c="SPERSON" lit="105330"></axis:alt></b>  
                                         </td> 
                                         <td class="titulocaja">
                                                <b><axis:alt f="axispen015" c="NOMBRE" lit="105940"></axis:alt></b>  
                                         </td>
                                    </tr> 
                                     <tr>
                                        <td class="campocaja">
                                            <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}" class="campowidthinput campo campotexto" style="width:90%"
                                                <axis:atr f="axissin011" c="SPERSON" a="modificable=true"/> /> 
                                            <input type="text" name="NNUMIDE" value="${__formdata.NNUMIDE}" class="campowidthinput campo campotexto_ob" style="width:80%"
                                                <axis:atr f="axissin011" c="NNUMIDE" a="modificable=false"/> /> 
                                            <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisper021()" style="cursor:pointer"/>  
                                        </td>
                                        <td class="campocaja" colspan="2">
                                            <input type="text" name="NOMBRE" value="${__formdata.NOMBRE}" class="campowidthinput campo campotexto_ob" style="width:50%"
                                            <axis:atr f="axissin012" c="NOMBRE" a="modificable=false"/> /> 
                                        </td>
                                     </tr>
                                     <tr>
                                        <td class="titulocaja">
                                                <b><axis:alt f="axispen015" c="IVALORL" lit="9900901"></axis:alt></b>  
                                         </td> 
                                    </tr> 
                                     
                                     <tr>                      
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.IVALORL}" name="IVALORL" id="IVALORL" style="width:75%;">
                                        </td> 
                                     </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="__botones">cancelar,aceptar</c:param> 
        </c:import>    
    </form>    
    <c:import url="../include/mensajes.jsp"/>

</body>
</html>