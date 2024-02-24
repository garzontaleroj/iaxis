<%-- 
*  Fichero: axisper019.jsp
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a>
*
*  Fecha: 23/07/2008
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
     <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
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

    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload_axisper019() {
        	 <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisper019');
					</c:if>
            revisarEstilos();
            var grabarOK = '${requestScope.grabarOK}';
            if (!objUtiles.estaVacio(grabarOK) && grabarOK == "0")
                    parent.f_aceptar_axisper019();             
                
        }
                
        function f_but_aceptar() {
            if (objValidador.validaEntrada()) {
                    objUtiles.ejecutarFormulario("modal_axisper019.do", "grabar", document.axisper019Form, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
        function f_but_cancelar() {
                parent.f_cerrar_modal("axisper019");                
        }    
        
        function actualitzarCheckbox(obj){
         objDom.setValorPorId("CENTER", ((objDom.getComponenteMarcado(obj))? "1" : "0" ));
        }

    </script>
  
  
  </head>
  <body onload="f_onload_axisper019()">
  <div id="wrapper" class="wrapper">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
  
  
 
    <form name="axisper019Form" action="" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="SPERSON"  value="${__formdata.SPERSON}"/>
        <input type="hidden" name="faceptar" value="${__formdata.faceptar}"/>
        <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}"/>
        <input type="hidden" name="NANOmarcat" value="${__formdata.NANOmarcat}"/>
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><fmt:message key="9001276" /></c:param>
            <c:param name="producto"><fmt:message key="9001275" /></c:param>
            <c:param name="form">axisper019</c:param>
        </c:import>


        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:130px">
            <div class="separador">&nbsp;</div>
            <tr>
                <td>
   <!-- Datos IRPF  -->
                    <table class="area">

                                        <tr>
                                      
                                        <c:if test="${!empty __formdata.NORDEN}">
                                            <th style="width:10%;height:0px"></th>
                                        </c:if>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>                                            
                        </tr>
                                                    <tr>
                                                         <c:if test="${!empty __formdata.NORDEN}">
                                                             <td class="titulocaja">
                                                                    <b><fmt:message key="500102"/></b>
                                                             </td>
                                                         </c:if>
                                                         <td class="titulocaja"><b><fmt:message key="1000064"/></b></td>
                                <td class="titulocaja"><b><fmt:message key="9901108"/></b></td>
                                                         <td class="titulocaja"><b><fmt:message key="9000882"/></b></td>
                                                         <td class="titulocaja"><b><fmt:message key="9000887"/></b></td>                                                         
                                                    </tr> 
                                                    <tr>
                                                        <c:if test="${!empty __formdata.NORDEN}">
                                                            <td class="campocaja" >
                                                                
                                                                         <input type="text" name="NORDEN" id="NORDEN"  value="${__formdata.NORDEN}"  class="campowidthinput campo campotexto" style="width:95%"
                                                                         <axis:atr f="axisper019" c="NORDEN" a="modificable=false"/>/>
                                                                
                                                            </td> 
                                                        </c:if>                                                         
                                                       <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FNACIMI}"/>" name="FNACIMI" id="FNACIMI"  style="width:60%;"
                                                            <axis:atr f="axisper019" c="FNACIMI" a="modificable=true&formato=fecha"/> title="<fmt:message key="100959"/>" title="<fmt:message key="1000064"/>" <axis:atr f="axisper019" c="FNACIMI" a="modificable=true&obligatorio=true"/>  />
                                                            <a style="vertical-align:middle;"><img id="popup_calendario_FNACIMI" alt="<fmt:message key="108341"/>" title="<fmt:message key="100959" />" src="images/calendar.gif"/></a>                                                        
                                </td>  
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FADOPCION}"/>" name="FADOPCION" id="FADOPCION"  style="width:60%;"
                                            <axis:atr f="axisper019" c="FADOPCION" a="modificable=true&formato=fecha"/> title="<fmt:message key="100959"/>" title="<fmt:message key="1000064"/>" <axis:atr f="axisper019" c="FADOPCION" a="modificable=true&obligatorio=true"/>  />
                                    <a style="vertical-align:middle;"><img id="popup_calendario_FADOPCION" alt="<fmt:message key="108341"/>" title="<fmt:message key="100959" />" src="images/calendar.gif"/></a>                                                        
                                                        </td>    
                                                        <td class="campocaja">
                                                                   <select name="CGRADO" id="CGRADO" <axis:atr f="axisper019" c="CGRADO" a="modificable=true&isInputText=false"/> size="1" style="width:100%"  class="campowidthselect campo campotexto">&nbsp;
                                                                            <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="1000348"/> - </option>
                                                                        <c:forEach var="element" items="${__formdata.listValores.lstgraumin}">
                                                                            <option value = "${element.CATRIBU}" 
                                                                                <c:if test="${element.CATRIBU == __formdata.CGRADO}"> selected </c:if> />
                                                                                ${element.TATRIBU} 
                                                                            </option>
                                                                        </c:forEach>
                                                                    </select>                                                        
                                                        </td>                                                          
                                                        <td class="campocaja">
                                                                 <input type="checkbox" name="CENTER" onclick="actualitzarCheckbox(this)"  <c:if test="${__formdata.CENTER == 1}">checked</c:if> value="${__formdata.CENTER}"  
                                                                 <axis:atr f="axisper019" c="CENTER" a="modificable=true"/>/></td>
                                                        </td>                                                              
                                                    </tr>  
                    </table>                               
                </td>
            </tr>
                                              </table>                               
                                                           
                                                                        
                                     <!-- ************************* FIN DATOS IRPF  ********************* -->     			
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>


        
    </form>
    
        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FNACIMI",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FNACIMI", 
                singleClick    :    true,
                firstDay       :    1
            });
            Calendar.setup({
                inputField     :    "FADOPCION",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FADOPCION", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>
 
    <c:import url="../include/mensajes.jsp" />
    </div>
   </body>
</html>


