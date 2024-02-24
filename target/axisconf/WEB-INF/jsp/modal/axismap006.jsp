<%/*
*  Fichero: axismap006.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*
*  Fecha: 22/10/2010
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
        revisarEstilos();        
        var ok = "${__formdata.OK}";
        
        if (!objUtiles.estaVacio(ok))
            f_but_cancelar();
        }
        

       function f_but_cancelar() {
                parent.f_cerrar_modal('axismap006');
        }   

        function f_but_aceptar(){
            objUtiles.ejecutarFormulario("modal_axismap006.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);            
        }
                
    </script>
  </head>
    <body class=" " onload="f_onload()"  >
        <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="SPERSON" id="SPERSON" value="" />
            <input type="hidden" name="SNIP" id="SNIP" value="" />
            <input type="hidden" name="CMAPEAD" id="CMAPEAD" value="${__formdata.CMAPEAD}"/>
            <input type="hidden" name="CMAPEAD1" id="CMAPEAD1" value="${__formdata.CMAPEAD}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><fmt:message key="9901581"/></c:param><%-- Modificar detalle map --%>
                <c:param name="producto"><fmt:message key="9901581"/></c:param><%-- Modificar detalle --%>
                <c:param name="form">axismap006</c:param>
            </c:import>

            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                <th style="width:25%;height:0px"></th>
                <th style="width:25%;height:0px"></th>
                <th style="width:25%;height:0px"></th>
                <th style="width:25%;height:0px"></th>
  
                    <tr>
                      <td class="titulocaja"><b><fmt:message key="500102"/></b></td><%-- Orden --%>
                      <td class="titulocaja"><b><fmt:message key="9901591"/></b></td><%-- Posicion --%>
                      <td class="titulocaja"><b><fmt:message key="9901592"/></b></td><%-- Longitud --%>
                      <td class="titulocaja"><b><fmt:message key="9901587"/></b></td><%-- Objeto --%>
                    </tr>
                     <tr>
                      <td class="campocaja">
                        <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;"
                    value="${__formdata.NORDEN}" name="NORDEN" id="NORDEN" readonly="readonly"/>
                      </td>
                      <td class="campocaja">
                       <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;"
                    value="${__formdata.NPOSICION}" name="NPOSICION" id="NPOSICION" />
                    
                      </td>
                       <td class="campocaja">
                       <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;"
                    value="${__formdata.NLONGITUD}" name="NLONGITUD" id="NLONGITUD" />
                    
                       </td>
                        <td class="campocaja">
                       <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;"
                    value="${__formdata.TTAG}" name="TTAG" id="TTAG" readonly="readonly"/>
                    
                       </td>
                    </tr>

                    
                     
                   
                    
                    
                                     </table>
                                </td>
                                        </tr>
                                     </table>
                                </td>
                            </tr>
                        </table>
                    
                     
                            
                    </td>
                </tr>
            </table>						
            
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axismap006</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>

