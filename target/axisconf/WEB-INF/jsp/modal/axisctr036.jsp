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
    <title><axis:alt f="axisctr036" c="TIT_HTML" lit="9000494"/></title>
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
    <script type="text/javascript" src="scripts/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="scripts/jquery.tokenize.js"></script>
    <link rel="stylesheet" type="text/css" href="styles/jquery.tokenize.css" />
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {
	 <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisctr036');
					</c:if>
            var OK_acceptar = "${requestScope.OK_acceptar}"; 
            if (!objUtiles.estaVacio(OK_acceptar)){
                parent.f_aceptar_modal("axisctr036");
            }
            
             f_cargar_propiedades_pantalla();
             <axis:visible c="LISTAENFER" f="axisctr036"> 
                $("#LISTAENFER").attr("style", "visibility: hidden");
                $("#LISTAENFER").attr("style", "display: none");
            </axis:visible>
      
        }


        
        function f_but_cancelar() {
           parent.f_cerrar_modal('axisctr036');                      
        }
        
        function f_but_aceptar() {
        
          if(objValidador.validaEntrada()){
                var selecccion = null;
                <axis:visible c="LISTAENFER" f="axisctr036">
                    selecccion = $('select#LISTAENFER').val();
                </axis:visible>
                objUtiles.ejecutarFormulario ("modal_axisctr036.do?ENFERSEL=" + selecccion, 
                                              "acceptar", document.miForm, "_self", objJsMessages.jslit_cargando);          
            }
        }
        
        function f_cargadep(){
            <axis:visible c="LISTAENFER" f="axisctr036">
                $('#LISTAENFER').data('tokenize').clear();
            </axis:visible>
            f_cargar_propiedades_pantalla();
            <axis:visible c="LISTAENFER" f="axisctr036"> 
                $("#LISTAENFER").attr("style", "visibility: hidden");
                $("#LISTAENFER").attr("style", "display: none");
            </axis:visible>
            
            
        }
        
        $(document).ready(function(){  
            $('#LISTAENFER').tokenize({displayDropdownOnFocus : true,
                                       nbDropdownElements: 3000});
            $('.TokensContainer').css("width", "450px");
        });
    
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" >
    <div id="wrapper" class="wrapper">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisctr036" c="TIT_FORM" lit="9000548"/></c:param>   
                <c:param name="formulario"><axis:alt f="axisctr036" c="TIT_FORM" lit="9000548"/></c:param>
                <c:param name="form">axisctr036</c:param>
        </c:import>
        
        <input type="hidden" name="operation" value=""/>
        <%-- Inici Bug 0027262/0027262 - 14/08/2013 - RCL - Autorzación masiva propuestas retenidas --%>
        <input type="hidden" name="PMODO" id="PMODO" value="${__formdata.PMODO}"/>
        <input type="hidden" name="CCONTROLS" id="CCONTROLS" value="${__formdata.CCONTROLS}"/>
        <%-- Fi Bug 0027262/0027262 - 14/08/2013 - RCL - Autorzación masiva propuestas retenidas --%>
       
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo" ><img src="images/flecha.gif"/><axis:alt f="axisctr036" c="DSP_RECHAZO" lit="9000548"/> </div>
                    

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
                                    
                                    <axis:ocultar c="CMOTMOV" f="axisctr036">
                                     <td class="titulocaja"><b><axis:alt f="axisctr036" c="CMOTMOV" lit="1000296"/></b></td>
                                     </axis:ocultar>
                                     </tr>
                                    <tr>
                                    <axis:ocultar c="CMOTMOV" f="axisctr036">
                                        <td class="campocaja" colspan="3">                                
                                            <select name="CMOTMOV" id="CMOTMOV" <axis:atr f="axisctr035" c="CMOTMOV" a="isInputText=false"/> size="1" class="campowidthselect campo campotexto" style="width:450px;"
                                            obligatorio="true" title="<axis:alt f="axisctr036" c="CMOTMOV" lit="1000296"/>"
                                            onchange="f_cargadep();">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr036" c="SNV_COMBO" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${sessionScope.axisctr_listasDatosRechazos.rechazos}">
                                                    <option value = "${element.CMOTMOV}"
                                                    <c:if test="${__formdata.CMOTMOV == element.CMOTMOV}"> selected = "selected"</c:if>>
                                                        ${element.TMOTMOV} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    
                                    <tr>                                    
                                        <axis:ocultar c="POSTPPER" f="axisctr036">
                                            <td id="tit_POSTPPER" class="titulocaja"><b><axis:alt f="axisctr036" c="POSTPPER" lit="9908345"/></b></td>
                                        </axis:ocultar>
                                        
                                        <axis:ocultar c="PERPOST" f="axisctr036">
                                            <td id="tit_PERPOST" class="titulocaja"><b><axis:alt f="axisctr036" c="PERPOST" lit="106053"/></b></td>
                                        </axis:ocultar>
                                        
                                    </tr>
                                    
                                    <tr>
                                    <axis:visible c="POSTPPER" f="axisctr036">
                                        <td id="td_POSTPPER" class="campocaja">
                                        <input type="text"  class="campowidthinput campo campotexto" value="${__formdata.POSTPPER}" name="POSTPPER" id="POSTPPER" style="width:225px;"
                                          <axis:atr f="axisctr036" c="POSTPPER" a="modificable=true"/> 
                                          title="<axis:alt f="axisctr036" c="POSTPPER" lit="9908345"/>"/>
                                        </td>                                    
                                    </axis:visible>
                                    
                                    <axis:visible c="PERPOST" f="axisctr036">
                                        <td id="td_PERPOST" class="campocaja">                                
                                            <select name="PERPOST" id="PERPOST" <axis:atr f="axisctr036" c="PERPOST" a="isInputText=false"/> size="1" class="campowidthselect campo campotexto" style="width:225px;"
                                            title="<axis:alt f="axisctr036" c="PERPOST" lit="106053"/>">
                                                
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr036" c="SNV_COMBO" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${sessionScope.axisctr_listasDatosRechazos.lstperiodo}">
                                                    <option value = "${element.CATRIBU}"
                                                    <c:if test="${__formdata.CATRIBU == element.CATRIBU}"> selected = "selected"</c:if>>
                                                        ${element.TATRIBU} 
                                                    </option>
                                                </c:forEach>
                                                
                                            </select>
                                        </td>
                                    </axis:visible>
                                    
                                    </tr>    
                                                                     
                                    <tr>                                    
                                        <axis:ocultar c="LISTAENFER" f="axisctr036">
                                            <td id="label_LISTAENFER" class="titulocaja"><b><axis:alt f="axisctr036" c="LISTAENFER" lit="9908344"/></b></td>
                                        </axis:ocultar>
                                    </tr>
                                     
                                    <tr>                                    
                                    <axis:visible c="LISTAENFER" f="axisctr036"> 
                                        <td id="td_LISTAENFER"> 
                                             <select name="LISTAENFER" id="LISTAENFER"                                                     
                                                     multiple='multiple'  class="campowidthselect"
                                                     <axis:atr f="axisctr036" c="LISTAENFER" a="isInputText=false"/>
                                                     title="<axis:alt f="axisctr036" c="LISTAENFER" lit="9908344"/>">
                                                     <c:forEach var="element" items="${sessionScope.axisctr_listaenfermedades}">
                                                        <option value = "${element.CINDEX}"
                                                        <c:if test="${element.ORIGEN == 1}"> style="font-weight:bold"</c:if>>
                                                            ${element.CODENF} - ${element.DESENF} 
                                                        </option>
                                                    </c:forEach>
                                            </select>                                                                            
                                      </td>                                    
                                      </axis:visible> 
                                    </tr>
                                    
                                    <tr>
                                      <td class="titulocaja"><b><axis:alt f="axisctr036" c="TOBSERV" lit="101162"/></b></td>
                                    </tr>
                                     <tr>
                                     <axis:visible f="axisctr035" c="TOBSERV">
                                        <td class="campocaja" colspan="4">
                                         <textarea title="<axis:alt f="axisctr036" c="TOBSERV" lit="101162"/>" <axis:atr f="axisctr036" c="TOBSERV" a="modificable=true&obligatorio=true"/> cols="" rows="8" class="campo campotexto" id="TOBSERV" name="TOBSERV" size="15" 
                                         style="width:98%;overflow-x:hidden;overflow-y:auto">${__formdata.TOBSERV}</textarea>
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
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr036</c:param>
              <c:param name="__botones">cancelar,aceptar</c:param> 
        </c:import>
    
    </form>
    
    <c:if test="${empty requestScope.OK_acceptar}">
     <c:import url="../include/mensajes.jsp"/>
    </c:if>
<%--
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FEFECTO",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEFECTO", 
            singleClick    :    true,
            firstDay       :    1
        });
     </script>
--%>
</div>
</body>
</html>