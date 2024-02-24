<%/*
*  Fichero: axispro041.jsp
*
*  @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
*  Fecha: 06/04/2010
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
    
    <c:import url="../include/carga_framework_js.jsp" />    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_but_salir() {
           parent.f_cerrar_modal("axispro040");
        }
        
        function f_onload(){
        
            var ok = "${OK}";
            if (ok == 1){
                parent.f_cerrar_modal("axispro040");
                parent.recargar_garantias_lista();
                parent.abrirModalGarantias(document.miForm.CGARANT.value);
            }
            revisarEstilos();
        }
        
      
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        
        
        function f_get_textogar(){
            objUtiles.ejecutarFormulario("modal_axispro040.do", "buscargar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_aceptar(){
            if (objValidador.validaEntrada())
                objUtiles.ejecutarFormulario("modal_axispro040.do", "setgarantia", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_abrir_axiscom001(){
             objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=9901156"+
              "&CODIGO_CONSULTA=LISTA_GARANTIAS");
        }
        
        function f_aceptar_axiscom001(CODIGO, TEXTO, CODIGO_CONSULTA){
            
            f_cerrar_axiscom001();

            if (!objUtiles.estaVacio(TEXTO))
                TEXTO = objUtiles.replaceAll(TEXTO, "-quote-", "\'");
            
            if (CODIGO_CONSULTA == "LISTA_GARANTIAS") {
                objDom.setValorPorId("CGARANT", CODIGO);
                f_get_textogar();
            }
            
        }
        
        function f_cerrar_axiscom001() {
            objUtiles.cerrarModal("axiscom001");
        }
           
    </script>
  </head>
  
  <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
    </c:import>
    
    <form name="miForm" action="modal_axispro040.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><fmt:message key="101603"/></c:param>
            <c:param name="form">axispro040</c:param>
            <c:param name="titulo"><fmt:message key="101603"/></c:param>
        </c:import>
        
        <input type="hidden" id="SPRODUC" name="SPRODUC" value="${__formdata.SPRODUC}"/>
        <input type="hidden" id="CACTIVI" name="CACTIVI" value="${__formdata.CACTIVI}"/>
        
    
        <input type="hidden" id="operation" name="operation" value=""/>
    
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                        <tr>
                            <th style="width:2%;height:0px"></th>
                            <th style="width:5%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:15%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:15%;height:0px"></th>
                            <th style="width:15%;height:0px"></th>
                            <th style="width:15%;height:0px"></th>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="titulocaja">
                                <b><fmt:message key="1000109" /></b>
                            </td>
                            <td class="titulocaja">
                                <b><fmt:message key="100561" /></b>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto_ob" value="${__formdata.CGARANT}" 
                                    name="CGARANT" id="CGARANT" size="15" onchange="f_get_textogar()" obligatorio="true"
                                    title="<fmt:message key="1000109"/>"/>
                            </td>
                            <td class="campocaja" colspan="3">
                                <input type="text" class="campowidthinput campo campotexto" value="${__formdata.TGARANT}" name="TGARANT" id="TGARANT" size="15" readonly="true" style="width:90%"/>
                                <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axiscom001()" style="cursor:pointer"/> 
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="titulocaja">
                                <b><fmt:message key="500102" /></b>
                            </td>
                            <td class="titulocaja">
                                <b><fmt:message key="102517" /></b>
                            </td>
                            <td class="titulocaja">
                                <b><fmt:message key="1000488" /></b>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto_ob"  title="<fmt:message key="500102"/>"
                                obligatorio="true" value="${__formdata.NORDEN}" name="NORDEN" id="NORDEN" size="15"/>
                            </td>
                            <td class="campocaja" >
                                <select name = "CTIPGAR" id="CTIPGAR" title="<fmt:message key="102517"/>" obligatorio="true" size="1" 
                                        class="campowidthselect campo campotexto_ob"> 
                                    <option value = ""> - <fmt:message key="108341"/> - </option>
                                    <c:forEach var="listtipgar" items="${LISTTIPGAR}">
                                        <option value = "${listtipgar.CATRIBU}"
                                            <c:if test="${(!empty __formdata.CTIPGAR)&& listtipgar.CATRIBU == __formdata.CTIPGAR}"> selected </c:if>>
                                            ${listtipgar.TATRIBU}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td>
                                <select name = "CTIPCAP" id="CTIPCAP" title="<fmt:message key="1000488" />" obligatorio="true"  size="1" 
                                        class="campowidthselect campo campotexto_ob">
                                    <option value = ""> - <fmt:message key="108341"/> - </option>
                                    <c:forEach var="listtipcap" items="${LISTTIPCAP}">
                                        <option value = "${listtipcap.CATRIBU}"
                                            <c:if test="${(!empty __formdata.CTIPCAP)&& listtipcap.CATRIBU == __formdata.CTIPCAP}"> selected </c:if>>
                                                ${listtipcap.TATRIBU}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                    </table>
                    
               </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="__botones">salir,aceptar</c:param></c:import>
        
    </form>
    <c:import url="../include/mensajes.jsp" />
    
</body>
</html>