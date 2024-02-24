<%/* Revision:# EGMtpNc9vPL2fRpb86IizQ== # */%>
<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <c:import url="../include/carga_framework_js.jsp" /> 
    <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <!--*********************************** -->      
    <script type="text/javascript">    
        function f_onload() {
	 <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisctr036');
					</c:if>        
            var OK_acceptar = "${requestScope.OK_acceptar}"; 
            if (!objUtiles.estaVacio(OK_acceptar)){
                alert("${PRETEN_MENSAJES}")
                parent.f_aceptar_modal("axisctr190");
            }
             f_cargar_propiedades_pantalla();                                  
        }    
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisctr190');                      
        }
        function f_but_aceptar(){
                     //objUtiles.ejecutarFormulario("modal_axisctr190.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando); 
          if (objValidador.validaEntrada()) {
            objUtiles.ejecutarFormulario("modal_axisctr190.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando); 
          }           
        }  
        function f_abrir_axisctr014(){
        	console.log("entro");
            objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=NUEVA_PRODUCCION");
        }
        
        function f_aceptar_axisctr014(CAGENTE){
            objDom.setValorPorId("CAGENTE", CAGENTE);
            f_cerrar_axisctr014();
            objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
        }
        
        function f_cerrar_axisctr014() {
            objUtiles.cerrarModal("axisctr014")
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
        
        
        
        
    </script>
  </head>
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
  <div id="wrapper" class="wrapper">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
          <%--form name="miForm" enctype='multipart/form-data' action="" method="POST" accept-charset='UTF-8'--%>     
          <form name="miForm" action="modal_axisctr190.do" method="POST">
          <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisctr190" c="TITULO" lit="9903993"/></c:param>
            <c:param name="form">axisctr190</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr001" c="TIT_AXISCTR014" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
        </c:import>
    <link rel="stylesheet" href="styles/displaytag.css">    
    <!--********** CALENDARIO ************************* -->
    <!-- Hoja de estilo del Calendario -->
    <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
    <!-- Script principal del calendario -->
    <script type="text/javascript" src="scripts/calendar.js"></script>
    <!-- Idioma del calendario, en función del Locale -->
    <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
    <!-- Setup del calendario -->
    <script type="text/javascript" src="scripts/calendar-setup.js"></script>        
        <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>       
        <input type="hidden" id="operation" name="operation" value=""/> 
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>                                                                                                 
                    <table class="seccion">                                            
                            <div class="titulo">
                            <img src="images/flecha.gif"/><axis:alt f="axisctr190" c="DSP_PSU" lit="9903994" />
                                <span class="titulocaja" style="color:black;font-weight:normal;padding-bottom:2px;.vertical-align:bottom">           
                                 </span>                
                            </div>  
                        <tr>
                            <th style="width:2%;height:0%">&nbsp;</th>
                            <th style="width:20%;height:0%">&nbsp;</th>
                        </tr>
                       <tr><td></td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr190" c="FEFECTO" lit="100883"/></b>
                            </td> 
                        </tr>
                        <tr><td></td>
                                 <td class="campocaja" >
                                    <input  type="text" class="campowidthinput campo campotexto_ob" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEFECTO}"/>" name="FEFECTO" id="FEFECTO"  style="width:50%;"
                                    title= "<axis:alt f="axisctr190" c="FEFECTO" lit="100883"/>"  <axis:atr f="axisctr190" c="FEFECTO" a="modificable=true&obligatorio=true&formato=fecha"/>  />
                                    <a style="vertical-align:middle;"><img id="popup_calendario_FEFECTO" alt="<axis:alt f="axisctr190" c="FEFECTO" lit="100883"/>"  src="images/calendar.gif" /> </a>
                                </td>


                        </tr>  
                        
                        <tr><td></td>
	                          <axis:visible f="axisctr001" c="CAGENTE"> 
                                     <td class="titulocaja">
                               			 <b><axis:alt f="axisctr190" c="CAGENTE" lit="9906274"/></b>
                            		</td> 
                                     <td class="titulocaja">
                               			 <b><axis:alt f="axisctr190" c="NOMBRE_TEXT" lit="9910199"/></b>
                            		</td> 
                              </axis:visible>
                        
                        </tr>
                        
                        <tr><td></td>
	                          <axis:visible f="axisctr001" c="CAGENTE"> 
                                    <td class="campocaja">
                                        <input type="text" name="CAGENTE_TEXT" title="<axis:alt f="axisctr001" c="CAGENTE" lit="100584" />" id="CAGENTE_TEXT" value="${sessionScope.axisctr_agente.CODI}" class="campowidthinput campo campotexto" style="width:70%" formato="entero"
                                        <axis:atr f="axisctr001" c="CAGENTE_TEXT" a="modificable=false&obligatorio=true&visible=false"/> />
                                        <img id="IMG_CAGENTE_TEXT" border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                    </td>
                                     <td class="campocaja">    
                                        <input readonly="true" type="text" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${sessionScope.axisctr_agente.NOMBRE}" class="campowidthinput campo campotexto"/>
                                    </td>
                              </axis:visible>
                        
                        </tr>
                        
                                              
                        <tr><td></td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr190" c="TRESUMEN" lit="108502"/></b>
                            </td>    
                        </tr>
                        <tr><td></td>
                            <td colspan="4" style="width:100%;"  class="campocaja">
                                <textarea <axis:atr f="axisctr190" c="TRESUMEN" a="modificable=false"/> class="campowidthinput campo campotexto_ob" style="width:100%;" name="RESUMEN" id="TRESUMEN"><axis:alt f="axisctr190" c="TRESUMEN" lit="9903998"/></textarea>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axisctr190</c:param>
            <c:param name="__botones">
                   cancelar,aceptar </c:param></c:import>       
         </form>                       
        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FEFECTO",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FEFECTO", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>             
     <c:import url="../include/mensajes.jsp"/>
    </div>
</body>
</html>