
<%/*
*  Fichero: axisadm097.jsp
*
*  @author ozea
*  Fecha: 24/11/2015
*/
%>


<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
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
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        function f_onload() {
            f_cargar_propiedades_pantalla();
        }
        
        function f_but_cancelar() {
           parent.f_cerrar_modal('axisadm097');                      
        }
        
        function f_but_buscar(){
            
            parent.f_buscarTransferencias(document.getElementById("CAGENTE_TEXT").value);
        }
        
            /***************************************** AJAX ******************************************/
            
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
                        //objDom.setValorPorId("CAGENTE","");
                    }
                }
            }
            
            
            function callbackAjaxCambiarAgente(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado);
                objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);
                }
            }
            
            /****************************** MODAL *************************************/ 
            function f_abrir_axisctr014() {
                objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
            }
            
            function f_cerrar_axisctr014() {
                objUtiles.cerrarModal("axisctr014");
            }    
            function f_aceptar_axisctr014 (CAGENTE){
                objDom.setValorPorId("CAGENTE", CAGENTE);
                f_cerrar_axisctr014();
                objAjax.invokeAsyncCGI("modal_axisadm001.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            }
                   
    </script>
  </head>
  
  <body class=" " onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisadm097" c="TITULO" lit="9908588"/></c:param>
            <c:param name="formulario"><axis:alt f="axisadm097" c="TITULO" lit="9908588"/></c:param>
            <c:param name="form">axisadm097</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt c="titulo14" f="axisadm097" lit="1000234" /></c:param>
            <c:param name="nid" value="axisctr014" />
        </c:import>
        
        <input type="hidden" id="operation" name="operation" value=""/>         
       
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0">            
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                        <tr>
                            <axis:ocultar f="axisadm097" c="CAGENTE" dejarHueco="false"> 
                                    <td class="titulocaja" colspan="3">
                                        <b><axis:alt  c="CAGENTE" f="axisadm001" lit="100584"/></b>
                                    </td>
                            </axis:ocultar>
                        </tr>
                        <tr>                           
                            <axis:ocultar f="axisadm097" c="CAGENTE" dejarHueco="false">
                                <td class="campocaja" colspan="3">
                                    <input type="text" name="CAGENTE_TEXT" id="CAGENTE_TEXT" value="${__formdata.CAGENTE_TEXT}" class="campowidthinput campo campotexto" style="width:20%"
                                     title="<axis:alt  c="CAGENTE" f="axisadm097" lit="100584"/>" 
                                    onchange="f_actualizar_agente()" />
                                    <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                    <input readonly="true" type="text" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${__formdata.NOMBRE_TEXT}"  style="width:70%" class="campowidthinput campo campotexto"/>
                                </td> 
                            </axis:ocultar>                         
                        </tr>               
                    </table>
                </td>
            </tr>      
        </table>
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="__botones">cancelar<axis:visible f="axisadm001" c="BT_BUSCAR">,buscar</axis:visible></c:param>
            <c:param name="f">axisadm097</c:param>
        </c:import>
        
    </form>
    <c:import url="../include/mensajes.jsp" />
</body>
</html>