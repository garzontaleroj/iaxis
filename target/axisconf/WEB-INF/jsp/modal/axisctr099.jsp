<%/*
*  Fichero: axisctr099.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a> 
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
    <title><fmt:message key="9000494"/></title> <%-- EDICIÓN DATOS DE CIERRES --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
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
        
        function f_onload() {
            revisarEstilos();            
        }
        
        function f_but_cancelar() {
           parent.f_cerrar_modal('axisctr099');                      
        }
        
        function f_but_aceptar() {
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario ("modal_axisctr099.do", "guardar_cambios", document.miForm, "_self", objJsMessages.jslit_cargando);                                
                         
                parent.f_aceptar_modal('axisctr099');
            }
        }
        
        function f_onclickCheckbox(thiss) {
           thiss.value =  ((thiss.checked)?1:0);
           objDom.setValorPorId(thiss.id, thiss.value);
        }

    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_aceptar() }">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">             
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><fmt:message key="9002156"/></c:param>     <%-- Estado de gestión de propuestas retenidas --%>
                <c:param name="formulario"><fmt:message key="9002156"/></c:param> <%-- Estado de gestión de propuestas retenidas --%>
                <c:param name="form">axisctr099</c:param>
        </c:import>
        
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="SSEGURO" value="${__formdata.SSEGURO}"/>
        <input type="hidden" name="NRIESGO" value="${__formdata.NRIESGO}"/>
        <input type="hidden" name="NMOVIMI" value="${__formdata.NMOVIMI}"/>
        <input type="hidden" name="CMOTRET" value="${__formdata.CMOTRET}"/>
        <input type="hidden" name="NMOTRET" value="${__formdata.NMOTRET}"/>
        <input type="hidden" name="CESTGEST" value="${__formdata.CESTGEST}"/>        
        <input type="hidden" name="CAPLTOD" value="${__formdata.CAPLTOD}"/>        
       
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo">
                    </div>

                    <table class="seccion" align="center">
                        <tr>
                            <td >
                                <table class="area" align="center">   
                                <tr>
                                        <td class="titulocaja" colspan="2">
                                            <b><fmt:message key="9002158"/></b> <%-- Estados de gestión --%>
                                        </td>
                                        <td class="titulocaja">                                            
                                                <b><fmt:message key="9002159"/></b> <%-- Aplicar todos --%>                                            
                                        </td>
                                    </tr>
                                    <tr>                                       
                                        <td class="campocaja" colspan="2">                                
                                            <select name="NCESTGEST" id="NCESTGEST" size="1" class="campowidthselect campo campotexto" style="width:65%;">&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.LISTVALORES.GSTCESTGEST}">
                                                    <option value = "${element.CATRIBU}"
                                                    <c:if test="${__formdata.CESTGEST == element.CATRIBU}"> selected = "selected"</c:if>>
                                                        ${element.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="campocaja" align="left">
                                            <input type="checkbox"  id="NCAPLTOD" name="NCAPLTOD" onclick="f_onclickCheckbox(this)" <axis:atr f="axisctr099" c="NCAPLTOD" a="modificable=true"/> value="${__formdata.CAPLTOD}" 
                                            <c:if test="${__formdata.CAPLTOD == '1'}">checked</c:if> >
                                        </td><!-- __formdata.CINFORM -->
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp">
              <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>

    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FCANCEL",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FCANCEL", 
            singleClick    :    true,
            firstDay       :    1
        });
     </script>

</body>
</html>