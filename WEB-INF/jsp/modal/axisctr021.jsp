<%/*
*  Fichero: axisctr021.jsp
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavi Gallego</a> 
*  
*  	Esta pantalla debe mostrarse encima de la pantalla de pólizas pendientes de emitir (AXCTR018). 
*       A través de dicha pantalla, el usuario podrá rechazar movimientos de retención pólizas previamente 
*       seleccionados en la pantalla de pólizas pendientes de emitir. Esta pantalla debe recibir como parámetros de entrada:
*
*	Número de seguro de la póliza retenida (sseguro).
*	Número de riesgo para el que se ha generado la retención de la póliza (nriesgo).
*	Número de movimiento a rechazar (nmovimi).
*	Número de suplemento a rechazar (o 0 si se rechaza una propuesta de alta) (nsuplem).
*
*
*
*  Fecha: 16/10/2007
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page import="java.util.List" %>

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

        function f_onload() {
        	 <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisctr021');
					</c:if>
          <axis:visible c="CMOTMOV" f="axisctr021">
            document.miForm.CMOTMOV.focus()
            </axis:visible>
            
            f_cargar_propiedades_pantalla();
        }
                
        function f_but_aceptar() {
        	if(objValidador.validaEntrada()){
        	
        	
            parent.f_aceptar_axisctr021(objDom.getValorPorId("SSEGURO"), objDom.getValorPorId("NMOVIMI"), objDom.getValorPorId("NRIESGO"),
                        objDom.getValorPorId("NSUPLEM"), objDom.getValorPorId("CMOTMOV"), objDom.getValorPorId("TOBSERVA"));
            
        	}
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axisctr021();
        }        
    </script>
  </head>
    <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    	<div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata['SSEGURO']}" />
            <input type="hidden" name="NMOVIMI" id="NMOVIMI" value="${__formdata['NMOVIMI']}" />
            <input type="hidden" name="NRIESGO" id="NRIESGO" value="${__formdata['NRIESGO']}" />
            <input type="hidden" name="NSUPLEM" id="NSUPLEM" value="${__formdata['NSUPLEM']}" />
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisctr021" c="TIT_FORM" lit="1000189" /></c:param>
                <c:param name="producto"><axis:alt f="axisctr021" c="TIT_FORM" lit="1000189" /></c:param>
                <c:param name="form">axisctr021</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                    <!--campos-->
                    <table class="seccion">
                         <tr>
                            <td align="left">
                                <table class="area" align="center">
                                
                                <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                            <axis:ocultar c="CMOTMOV" f="axisctr021">
                              <td class="campocaja">
                                  <b><axis:alt f="axisctr021" c="CMOTMOV" lit="1000296" /></b>
                              </td>
                              </axis:ocultar>
                            </tr>
                            <tr>
                             <axis:ocultar c="CMOTMOV" f="axisctr021">
                                <td class="campocaja" colspan="2">
                                  <select name = "CMOTMOV" id ="CMOTMOV" size="1" obligatorio="true"
                                  <axis:atr f="axisctr021" c="CMOTMOV" a="isInputText=false"/>
                                  onchange="" class="campowidthselect campo campotexto">
                                        <option value="null"> - <axis:alt f="axisctr021" c="SNV_COMBO" lit="1000347" /> - </option>
                                        <c:forEach var="motivosRe" items="${__formdata['T_IAX_MOTIVOSPOL']}">
                                            <option value = "${motivosRe.CMOTMOV}">${motivosRe.CMOTMOV} - ${motivosRe.TMOTMOV}</option>
                                        </c:forEach>
                                  </select>
                              </td>
                              </axis:ocultar>
                            </tr>
                            <tr>
                              <td class="campocaja">
                                  <b><axis:alt f="axisctr021" c="TOBSERVA" lit="101162" /></b>
                              </td>
                            </tr>
                            <tr>
                               <td class="campocaja" colspan="4">
                                  <textarea class="campo campotexto" rows="5" cols="100" style="width:100%;" name="TOBSERVA" id="TOBSERVA" title="<axis:alt f="axisctr021" c="TOBSERVA" lit="101162" />"<axis:atr f="axisctr021" c="TOBSERVA" a="modificable=true&obligatorio=true"/>></textarea>
                              </td>
                            </tr>
                        </table>		
                    </td>
                </tr>
            </table>
              </td>
                </tr>
            </table>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr021</c:param><c:param name="f">axisctr021</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
  </div>
    </body>
</html>

