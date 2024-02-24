<%/*
*  Fichero: axisage020.jsp
*
*  @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
*  Fecha: 27/02/2012
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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/tree.css" type="text/css"></link>
    
    <c:import url="../include/carga_framework_js.jsp" />    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_but_cancelar() {
           parent.f_cerrar_modal('axisage020');                      
        }
        
        function f_but_aceptar() {
            if (objValidador.validaEntrada())
                objUtiles.ejecutarFormulario("modal_axisage020.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }

        function f_onload() {
           f_cargar_propiedades_pantalla();  
           
           var ok = "${__formdata.OK}";
           if(!objUtiles.estaVacio(ok) && ok == 0){
                parent.f_cerrar_modal('axisage020'); 
           }
        }

    </script>
  </head>
  
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axisage020.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisage020" c="titulo" lit="9903336"/></c:param>   
            <c:param name="formulario"><axis:alt f="axisage020" c="formulario" lit="9903336"/></c:param> 
            <c:param name="form">axisage020</c:param>
        </c:import>
       
        <input type="hidden" name="operation" value=""/>        
        <input type="hidden" id="CAGENTE" name="CAGENTE" value="${__formdata.CAGENTE}"/>  
        <input type="hidden" id="NORDEN" name="NORDEN" value="${__formdata.NORDEN}"/>  

        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">            
            <tr>
                <td>                    
                    <table class="area" align="center">                    
                        <tr>
                            <th style="width:15%;height:0px"></th>
                            <th style="width:15%;height:0px"></th>
                            <th style="width:15%;height:0px"></th>
                            <th style="width:15%;height:0px"></th>
                            <th style="width:15%;height:0px"></th>
                            <th style="width:25%;height:0px"></th>
                        </tr>   
                        <tr>
                            <td class="titulocaja" colspan = "3">
                                <b><axis:alt f="axisage020" c="CTIPO" lit="100565"/></b>                      
                            </td>
                         </tr>
                        <tr>
                            <td class="campocaja" colspan = "3">   
                                <select name="CTIPO" id="CTIPO" size="1" class="campowidthselect campo campotexto" style="width:100%;" 
                                title="<axis:alt f="axisage020" c="CTIPO" lit="100565"/>" 
                                <axis:atr f="axisage020" c="CTIPO" a="obligatorio=true"/>>&nbsp;
                                    <option value="null"> - <axis:alt f="axisage020" c="BLANCO" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTTIPO}">
                                        <option value = "${element.CATRIBU}"
                                        <c:if test="${__formdata.CTIPO == element.CATRIBU}"> selected = "selected"</c:if>>
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="titulocaja" colspan = "3">
                                <b><axis:alt f="axisage020" c="NOMBRE" lit="105940"/></b>                      
                            </td>
                            <td class="titulocaja" colspan = "2">
                                <b><axis:alt f="axisage020" c="CARGO" lit="9902638"/></b>                      
                            </td>
                         </tr>
                        <tr>
                            <td class="campocaja" colspan = "3">
                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                value="${__formdata.NOMBRE}" name="NOMBRE" id="NOMBRE" 
                                style="width:90%;" title="<axis:alt f="axisage020" c="NOMBRE" lit="105940"/>"/>
                            </td>
                            <td class="campocaja" colspan = "2">
                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                value="${__formdata.CARGO}" name="CARGO" id="CARGO" 
                                style="width:100%;" title="<axis:alt f="axisage020" c="CARGO" lit="9902638"/>"/>
                            </td>           
                        </tr>
                        <tr>
                            <td class="titulocaja">
                                <b><axis:alt f="axisage020" c="TELEFONO" lit="9000992"/></b>                      
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisage020" c="TELEFONO2" lit="9903007"/></b>                      
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisage020" c="FAX" lit="9903323"/></b>                      
                            </td>
                         </tr>
                        <tr>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" maxlength="10"
                                value="${__formdata.TELEFONO}" name="TELEFONO" id="TELEFONO" 
                                style="width:75%;" title="<axis:alt f="axisage020" c="TELEFONO" lit="9000992"/>"  formato="entero"/>
                            </td>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" maxlength="10"
                                value="${__formdata.TELEFONO2}" name="TELEFONO2" id="TELEFONO2" 
                                style="width:75%;" title="<axis:alt f="axisage020" c="TELEFONO2" lit="9903007"/>"  formato="entero"/>
                            </td>   
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" maxlength="10"
                                value="${__formdata.FAX}" name="FAX" id="FAX" 
                                style="width:75%;" title="<axis:alt f="axisage020" c="FAX" lit="9903323"/>"  formato="entero"/>
                            </td> 
                        </tr>
                        <tr>
                            <td class="titulocaja" colspan="2">
                                <b><axis:alt f="axisage020" c="WEB" lit="9903324"/></b>                      
                            </td>
                            <td class="titulocaja" colspan="2">
                                <b><axis:alt f="axisage020" c="EMAIL" lit="9903325"/></b>                      
                            </td>
                         </tr>
                        <tr>
                            <td class="campocaja" colspan="2">
                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                value="${__formdata.WEB}" name="WEB" id="WEB" 
                                style="width:100%;" title="<axis:alt f="axisage020" c="WEB" lit="9903324"/>"/>
                            </td>
                            <td class="campocaja" colspan="2">
                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                value="${__formdata.EMAIL}" name="EMAIL" id="EMAIL" 
                                style="width:100%;" title="<axis:alt f="axisage020" c="EMAIL" lit="9903007"/>"/>
                            </td>  
                        </tr>
                    </table>   
                </td>
            </tr>
        </table>
   
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisage020</c:param><c:param name="f">axisage020</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>
        <div class="separador">&nbsp; </div>                                        
                                                                                
    </form>
    <c:import url="../include/mensajes.jsp" />

</body>
</html>