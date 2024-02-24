<%/*
*  Fichero: axisret005.jsp
* 
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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/tree.css" type="text/css"></link>
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
    <c:import url="../include/carga_framework_js.jsp" />    

    <style type="text/css">
        .displayspaceMaximo {
            width:99.8%;
            height: expression( this.scrollHeight > 349 ? "350px" : "auto" );
            max-height:350px;
            overflow-x: hidden;
            overflow-y: auto;
            border: 1px solid #DDDDDD;
        }
    </style>

    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_but_cancelar() {
           parent.f_cerrar_modal("axisret005");
        }


        
        function f_onload() {
          f_cargar_propiedades_pantalla(); 
            revisarEstilos();
            
            <c:if test="${__formdata.OK=='OK'}" >
                    //alert('<axis:alt f="axisret005" c="LIT_MESA_OK" lit="1000405" />');
                    parent.f_aceptar_axisret005();
            </c:if>
            
        }
        
        function f_but_aceptar() {
           
             if (objValidador.validaEntrada()) {           
                    objUtiles.ejecutarFormulario("modal_axisret005.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);                      
                    
            }
           
        }
     
        /* ******************************************************************************************** */
        /* *********************************** tratamiento agentes ************************************ */
        /* ******************************************************************************************** */
        
        function f_abrir_axisctr014() {
            //alert("Antes de abrir modal");
            var CAGENTE_TEXT = document.miForm.CAGENTE_TEXT.value;
            //if(document.miForm.CAGENTE_TEXT.value!=null && document.miForm.CAGENTE_TEXT.value!=''){
                //bug 0025580 objDom.setValorPorId("CAGENTE", CAGENTE_TEXT);
                //bug 0025580 objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=busqueda_agente&CAGENTE="+document.miForm.CAGENTE.value);
                //bug 0025580
                objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=NUEVA_PRODUCCION_ACTIVO");
            //}else{
            //    objAjax.invokeAsyncCGI("modal_axisret005.do", callbackAjaxCargarAgente, "operation=obtener_agente&CAGENTE=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            //}
        }
            
        function f_cerrar_axisctr014() {
            objUtiles.cerrarModal("axisctr014")
        }    
           
        function f_aceptar_axisctr014 (CAGENTE){
            objDom.setValorPorId("CAGENTE", CAGENTE);
            f_cerrar_axisctr014();
            objAjax.invokeAsyncCGI("modal_axisret005.do", callbackAjaxCargarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
        }
        
        function f_but_buscar() {
            f_abrir_axisctr014();
        }
       
        
        function callbackAjaxCargarAgente(ajaxResponseText){
        //alert(ajaxResponseText);        
            var doc=objAjax.domParse(ajaxResponseText);
            
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0])){
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
        
        
        
       function f_actualizar_agente(){
            if (objValidador.validaEntrada()) {
                 objAjax.invokeAsyncCGI("modal_axisret005.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE_TEXT) + 
                        "&TRAMO=null&CRAMO=null", this, objJsMessages.jslit_cargando);
            } else {
                objDom.setValorPorId("TAGENTE","");
            }
        }
       
       
        /* ******************************************************************************************** */
        /* ******************************************************************************************** */
        /* ******************************************************************************************** */
    </script>
  </head>
  
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axisret005.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisret005" c="TITULO" lit="9904206"/></c:param> <%-- Búsqueda Agentes --%>
            <c:param name="formulario"><axis:alt f="axisret005" c="TITULO" lit="9904206"/></c:param> <%-- Búsqueda Agentes --%>
            <c:param name="form">axisret005</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisper007|<axis:alt f="axisret005" c="TITULO_PANT" lit="9000714"/></c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisret005" c="TITULO" lit="1000234"/></c:param>
                <c:param name="nid" value="axisctr014" />
        </c:import>
        
        <input type="hidden" id="operation" name="operation" value=""/>
        <input type="hidden" id="MODO_AGENTE" name="MODO_AGENTE" value="${__formdata.MODO_AGENTE}"/>
        <input type="hidden" id="IDCONVENIO" name="IDCONVENIO" value="${__formdata.IDCONVENIO}"/>
        <input type="hidden" id="CAGENTE" name="CAGENTE" value="${__formdata.CAGENTE}"/>
        <input type="hidden" name="CUENTA" id="CUENTA" value="${fn:length(__formdata.LISTA_AGENTES)}">
    
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="3">            
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                        <tr>
                            <td>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:25%;height:0%;"/>
                                        <th style="width:25%;height:0%;"/>
                                        <th style="width:25%;height:0%;"/>
                                        <th style="width:25%;height:0%;"/>
                                    </tr>

                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisret005" c="CAGENTE_TEXT" lit="9902363"/></b> <%-- Intermediario --%>
                                            
                                        </td>
                                        
                                        <td class="titulocaja" colspan="3">
                                            <b><axis:alt f="axisret005" c="NOMBRE_TEXT" lit="100588"/>&nbsp;<axis:alt f="axisret005" c="INTERMED_D" lit="9902363"/></b> <%-- Descripción Intermediario--%>
                                        </td>                  
                                                                               
                                    </tr>
                                    <tr>
                                        <td class="campocaja">                 
                                                                 
                                            <input type="text" name="CAGENTE_TEXT" id="CAGENTE_TEXT" style="width:65%;" value="${formdata.CAGENTE}" class="campowidthinput campo campotexto" 
                                                    <axis:atr f="axisctr001" c="CAGENTE" a="modificable=true"/> onchange="f_actualizar_agente()" />
                                                <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                                &nbsp;&nbsp;&nbsp;
                                               
                                            
                                       
                                       
                                        </td>
                                                                              
                                        <td class="campocaja" colspan="3">                             
                                             <input readonly="true" type="text" style="width:50%;" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${formdata.NOMBRE}" class="campowidthinput campo campotexto"/>
                                        </td>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                 
                                    </tr>
                                    
                                    
   
                                </table>
                            </td>
                        </tr>                        
                    </table>
                </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisret005</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>
        <div class="separador">&nbsp;</div>
    </form>
    <c:import url="../include/mensajes.jsp" />
    
   

</body>
</html>