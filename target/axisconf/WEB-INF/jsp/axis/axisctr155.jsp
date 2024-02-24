<%/**
*  Fichero: axisctr155.jsp
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
        <title><fmt:message key="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
                <c:if test="${empty noabrirmodal}">f_abrir_axisctr154 ();</c:if>
            }
            
            function f_but_cancelar() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr155", "cancelar", document.miForm, "_self");
                
            }           
            
            function f_but_buscar() {
                f_abrir_axisctr154 ();
            }
            
            /****************************************************************************************/
            /********************************** MODAL AXPLANTILLAJSP_MODAL **************************/
            /****************************************************************************************/
            var ptho=null;
            function f_abrir_axisctr154() {
                objUtiles.abrirModal("axisctr154", "src", "modal_axisctr154.do?operation=init");
            }
            function f_cerrar_axisctr154() {
                objUtiles.cerrarModal("axisctr154");
            }   
            
            function f_aceptar_axisctr154(pcinout,numfich,ffhasta) {
                f_cerrar_axisctr154();
                document.miForm.pcinout.value=pcinout;
                document.miForm.numfich.value=numfich;
                document.miForm.fhasta.value=ffhasta;
                objUtiles.ejecutarFormulario ("axis_axisctr155.do", "form", document.miForm,"_self");
            }
            
            function f_tunnel() {
                var PTNOMFICH = document.miForm.PTNOMFICH.value;
                if (PTNOMFICH.length>0) {
                    objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+escape(PTNOMFICH)); //+"&mimetype=csv"
                }
            }
            
        </script>
    </head>
    <body  onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="axis_axisctr155.do" method="POST">
            <input type="hidden" name="operation" value="form"/> 
            <input type="hidden" name="pcinout" value="${__formdata.pcinout}"/> 
            <input type="hidden" name="numfich" value="${__formdata.numfich}"/> 
            <input type="hidden" name="fhasta" value="${__formdata.fhasta}"/> 
               <!-- Pantalla modal -->
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisctr154|<fmt:message key="9901020" /></c:param>
            </c:import>
             <c:import url="../include/modal_estandar.jsp">
                    <c:param name="nid_y_titulo">axisimprimir|<fmt:message key="1000205" />|true</c:param>
             </c:import>

             <c:import url="../include/titulo_nt.jsp">
                    <c:param name="modalidad"><fmt:message key="9901020" /></c:param>
                    <c:param name="formulario"><fmt:message key="9901020" /></c:param>
                    <c:param name="form">axisctr155</c:param>
            </c:import>                
           
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="1000574"/> <img border="0" src="images/find.gif" onclick="f_but_buscar()" style="cursor:pointer" alt="<fmt:message key="9000508" /> <fmt:message key="9900743" />" title="<fmt:message key="9000508" /> <fmt:message key="9900743" />"/></div>
                        <!-- Sección 1 -->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:33%;height:0px"></th>
                                            <th style="width:33%;height:0px"></th>
                                            <th style="width:33%;height:0px"></th>
                                       
                                        </tr>
                                        <tr>
                                            <td class="titulocaja" >
                                                <b><fmt:message key="1000574"/> <fmt:message key="109232"/> </b>
                                            </td>
                                            <td class="titulocaja" >
                                            </td>
                                            <td class="titulocaja">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" class="campocaja dim100">
                                            <input type="text" name="PTNOMFICH" id="PTNOMFICH" class="campo" style="border:0;background-color:transparent;cursor:pointer;text-decoration:underline" value="${PTNOMFICH}" onclick="f_tunnel()"/>
                                            </td>
                                        </tr>
                                    </table>                                    
                                </td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>
                        
                    </td>
                </tr>
            </table>
            
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="__botones">cancelar</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>