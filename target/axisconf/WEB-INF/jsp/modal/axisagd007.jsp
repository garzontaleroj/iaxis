<%--
      NOMBRE:    axisagd007.jsp
      PROPÓSITO (descripción pantalla): 
      Ejemplo : Pantalla de responder agenda
--%>

<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*" %>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
                f_cargar_propiedades_pantalla();
            }
	    
 	 
           
           function f_but_aceptar() {
             if (objValidador.validaEntrada())
                parent.f_aceptar_mensaje(objDom.getValorPorId("TMENSAJE"), objDom.getValorPorId("CTIPRES"));
           }
           
           function f_but_cancelar() {
                parent.f_cerrar_modal('axisagd007');
           }
        

            
        </script>
    </head>
 <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="TMENSAJE" f="axisagd007" lit="9902104"/></c:param>
                <c:param name="producto"><axis:alt c="TMENSAJE" f="axisagd007" lit="9902104"/></c:param>
                <c:param name="form">axisagd007</c:param>
            </c:import>
            <!-- Area de campos  -->
            
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisagd007" c="TMENSAJE" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisagd007" c="TMENSAJE" lit="9902104" /></b>
                                    </td>
                                </axis:ocultar>
                               
                                
                            </tr>
                            <tr>
                                <axis:ocultar f="axisagd007" c="TMENSAJE" dejarHueco="false">
                                    <td class="campocaja" colspan="4">
                                        <textarea class="campowidthinput campo campotexto"  rows="5" cols="10"
                                        <axis:atr f="axisagd007" c="TMENSAJE" a="obligatorio=true&modificable=true&isInputText=false"/>
                                         name="TMENSAJE" id="TMENSAJE" title="<axis:alt f="axisagd007" c="TMENSAJE" lit="9902104" />">${__formdata.TMENSAJE}</textarea>
                                    </td>
                                </axis:ocultar>
                               
                            </tr>
                            <c:if test="${!empty __formdata.motivos && fn:length(__formdata.motivos) != 0}">
                            <tr>
                                <axis:ocultar f="axisagd007" c="CTIPRES" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisagd007" c="CTIPRES" lit="9000594" /></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>    
                                    <axis:visible f="axisagd007" c="CTIPRES">    
                                        <td class="campocaja" colspan="3">                                   
                                                    <select name = "CTIPRES" style="width:95%" id ="CTIPRES" size="1"  
                                                        class="campowidthselect campo campotexto_ob" 
                                                        <axis:atr f="axisagd007" c="CTIPRES" a="modificable=true&obligatorio=true"/>
                                                       title="<axis:alt f="axisagd007" c="CTIPRES" lit="9000594"/>">                                              
                                                        <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisagd007" c="SELEC" lit="1000348"/> - </option>                                                                                                   
                                                        <c:forEach items="${__formdata.motivos}" var="lstmotivos">
                                                            <option value = "${lstmotivos.CTIPRES}" <c:if test="${lstmotivos.CTIPRES  == __formdata.CTIPRES}">selected</c:if>>${lstmotivos.TRESPUE}</option>
                                                        </c:forEach>
                                                    </select>                             
                                        </td>
                                    </axis:visible>
                            </tr>
                            </c:if>
                            <c:if test="${__formdata.CCLAGD == 2}">
                            <tr>
                                <axis:ocultar f="axisagd007" c="AVISO" dejarHueco="false">
                                    <td class="campocaja" colspan="4">
                                        <textarea class="campowidthinput campo campotexto"  rows="5" cols="10" readonly="readonly"
                                        <axis:atr f="axisagd007" c="TAVISO" a="obligatorio=true&modificable=true&isInputText=false"/>
                                         name="TAVISO" id="TAVISO" title="<axis:alt f="axisagd007" c="AVISO" lit="9000642" />"><axis:alt f="axisagd007" c="AVISO" lit="9902407" /></textarea>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            </c:if>
                        </table>
                       
                      
                    </td>
                </tr>
            <tr>
    
     
    <td colspan="4">
    

        <c:import url="../include/botonera_nt.jsp">
                   <c:param name="f">axisagd007</c:param>
                    <c:param name="__botones"><axis:ocultar f="axisagd007" c = "BT_CANCELAR" dejarHueco="false">cancelar</axis:ocultar><axis:ocultar f="axisagd007" c = "BT_ACEPTAR" dejarHueco="false">,aceptar</axis:ocultar> </c:param>
        
        </c:import>
        </td>
    </tr>
</table>
</form>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>


