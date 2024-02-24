<%/*
*  Fichero: axisctr035.jsp
*  @author <a href = "mailto:xpastorr@csi-ti.com">Xavi Pastor</a> 
*
*  Fecha: 14/10/2008
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
    <title><axis:alt f="axisctr035" c="TIT_HTML" lit="9000494"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
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
        
        //*************** Captura de eventos ***********************//
        if (document.all) {
            document.onkeydown = function() {  
                	
                if(window.event){	  
                if (!e) var e = window.event;
                var elemName = e.srcElement.name;
                var elemVal = eval ("document.miForm."+elemName+".readOnly");
                //alert(elemName+" ESTA EN "+ elemVal); 
                    if ( (window.event && window.event.keyCode == 8) && elemVal==true  ) {
                        return false;  //Sólo lo anulará si está disabled el campo que lo lanza      
                    }                    
                }                
            }
        }  


        function f_onload() {

            <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
                retocarPAGE_CSS('axisctr035');
			</c:if>

            var OK_acceptar = "${requestScope.OK_acceptar}"; 
            if (!objUtiles.estaVacio(OK_acceptar)){
                if ("${__formdata.CEMPRES}"=="10"){
                    objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_doc_tipo&SEGURO="+parent.document.miForm.SSEGURO.value+"&TIPO=ACEPTAPROP");
                }else{
                    parent.f_aceptar_modal("axisctr035");
                }
            }
             f_cargar_propiedades_pantalla();
        }


        function f_but_cancelar() {
           parent.f_cerrar_modal('axisctr035');                      
        }


        function f_but_aceptar() {
            if (objValidador.validaEntrada()){
                objUtiles.ejecutarFormulario ("modal_axisctr035.do", "acceptar", document.miForm, "_self", objJsMessages.jslit_cargando); 
            }
        }


        function f_cerrar_axisimprimir(){
            f_cerrar_modal('axisimprimir'); 
            parent.f_cerrar_modal('axisctr035');              
        }        

        function f_cerrar_modal(windowsmodal){
            objUtiles.cerrarModal(windowsmodal);
        }

    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" >
    <div id="wrapper" class="wrapper">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisctr035" c="TIT_FORM" lit="9000547"/></c:param>    
                <c:param name="formulario"><axis:alt f="axisctr035" c="TIT_FORM" lit="9000547"/></c:param>
                <c:param name="form">axisctr035</c:param>
        </c:import>
        
        <input type="hidden" name="operation" value=""/>
        <%-- Inici Bug 0027262/0027262 - 14/08/2013 - RCL - Autorzación masiva propuestas retenidas --%>
        <input type="hidden" name="PMODO" id="PMODO" value="${__formdata.PMODO}"/>
        <input type="hidden" name="CCONTROLS" id="CCONTROLS" value="${__formdata.CCONTROLS}"/>
        <input type="hidden" name="HFEFECTO" id="HFEFECTO" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FEFECTO}'/>"/>
        <%-- Fi Bug 0027262/0027262 - 14/08/2013 - RCL - Autorzación masiva propuestas retenidas --%>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisctr035" c="TITULO_IMP" lit="1000205" /></c:param>
            <c:param name="nid" value="axisimprimir" />
        </c:import>
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo" ><img src="images/flecha.gif"/><axis:alt f="axisctr035" c="DSP_ACEPTAR" lit="9000547"/> </div>
                    </div>

                    <table class="seccion" align="center">
                        <tr>
                            <td >
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:25%;height:0%;"/>
                                        <th style="width:25%;height:0%;"/>
                                        <th style="width:25%;height:0%;"/>
                                        <th style="width:25%;height:0%;"/>
                                    </tr>
                                    <tr>
                                         <axis:visible f="axisctr035" c="FEFECTO"> 
                                            <td class="titulocaja"><b><axis:alt f="axisctr035" c="FEFECTO" lit="100883"/></b></td>
                                         </axis:visible>
                                    </tr>
                                    <tr>
                                         <axis:visible f="axisctr035" c="FEFECTO"> 
                                            <td class="campocaja">
                                                <input type="text" class="campo campotexto" style="width:60%" formato="fecha" id="FEFECTO" name="FEFECTO" size="15" title="<axis:alt f="axisctr035" c="FEFECTO" lit="100883"/>" 
                                                value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FEFECTO}'/>" <c:if test="${requestScope.permiteCambioFefecto != 0}"> readonly </c:if>/>
                                                
                                                <c:if test="${requestScope.permiteCambioFefecto == 0}">
                                                   <a id="icon_FEFECTO" style="vertical-align:middle;">
                                                     <img alt="<axis:alt f="axisctr035" c="ICON_FEFECTO" lit="108341"/>" title="<axis:alt f="axisctr035" c="ICON_FEFECTO" lit="108341" />" src="images/calendar.gif"/>
                                                   </a>
                                                </c:if>
                                            </td>
                                         </axis:visible>    
                                    </tr>
                                    <tr>
                                    
                                     <%--BUG9426-12032009-XVM --%>
                                     <td class="titulocaja"><b><axis:alt f="axisctr035" c="TOBSERV" lit="108502"/></b></td>
                                     </tr>
                                     <tr>
                                     <axis:visible f="axisctr035" c="TOBSERV">
                                        <td class="campocaja" colspan="4">
                                             <textarea <axis:atr f="axisctr035" c="TOBSERV" a="modificable=false"/> title="<axis:alt f="axisctr035" c="TOBSERV" lit="101162"/>" cols="" rows="8" class="campo campotexto"  id="TOBSERV" name="TOBSERV" size="15" 
                                             style="width:98%;overflow-x:hidden;overflow-y:auto">${__formdata.POBSERV}</textarea>
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
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr035</c:param><c:param name="f">axisctr035</c:param>
              <c:param name="__botones">cancelar,aceptar</c:param> 
        </c:import>
    
    </form>
    
    <c:if test="${empty requestScope.OK_acceptar}">
     <c:import url="../include/mensajes.jsp"/>
    </c:if>

    <c:if test="${requestScope.permiteCambioFefecto == 0}"> 
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FEFECTO",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEFECTO", 
            singleClick    :    true,
            firstDay       :    1
        });
     </script>
    </c:if> 
  </div>
</body>
</html>