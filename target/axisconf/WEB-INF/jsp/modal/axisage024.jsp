<%/*
*  Fichero: axisage024.jsp
*
*  @author <a href="mailto:jdelrio@csi-ti.com">Javier del Rio</a>
*  Fecha: 09/05/2012
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
           parent.f_cerrar_modal('axisage024');                      
        }
        
        function f_but_aceptar() {
            if (objValidador.validaEntrada())
                objUtiles.ejecutarFormulario("modal_axisage024.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }

        function f_onload() {
           f_cargar_propiedades_pantalla();  
           
           var ok = "${__formdata.OK}";
           if(!objUtiles.estaVacio(ok) && ok == 0){
                parent.f_cerrar_modal('axisage024'); 
           }
        }

    </script>
  </head>
  
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axisage024.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisage024" c="titulo" lit="9903677"/></c:param>   
            <c:param name="formulario"><axis:alt f="axisage024" c="formulario" lit="9903677"/></c:param> 
            <c:param name="form">axisage024</c:param>
        </c:import>
       
        <input type="hidden" name="operation" value=""/>        
        <input type="hidden" id="CAGENTE" name="CAGENTE" value="${__formdata.CAGENTE}"/>          
        <input type="hidden" id="CENTIDADASEG_ORIG" name="CENTIDADASEG_ORIG" value="${__formdata.CENTIDADASEG_ORIG}"/>     

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
                                <b><axis:alt f="axisage024" c="CTIPENTIDADASEG" lit="9001624"/></b>                      
                            </td>
                         </tr>
                        <tr>
                            <td class="campocaja" colspan = "3">   
                                <select name="CTIPENTIDADASEG" id="CTIPENTIDADASEG" size="1" class="campowidthselect campo campotexto" style="width:100%;" 
                                title="<axis:alt f="axisage024" c="CTIPENTIDADASEG" lit="9001624"/>" 
                                <axis:atr f="axisage024" c="CTIPENTIDADASEG" a="obligatorio=true"/>>&nbsp;
                                    <option value="null"> - <axis:alt f="axisage024" c="BLANCO" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTTIPO}">
                                        <option value = "${element.CATRIBU}"
                                        <c:if test="${__formdata.CTIPENTIDADASEG == element.CATRIBU}"> selected = "selected"</c:if>>
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>                        
                    </table>   
                </td>
            </tr>
        </table>
   
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisage024</c:param><c:param name="f">axisage024</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>
        <div class="separador">&nbsp; </div>                                        
                                                                                
    </form>
    <c:import url="../include/mensajes.jsp" />

</body>
</html>