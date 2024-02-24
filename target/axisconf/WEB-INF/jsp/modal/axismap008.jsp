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
        
        <!--Inicio Sólo si vamos a tener un campo fecha !-->
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
        <!-- fin Sólo si vamos a tener un campo fecha !-->
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
            var ok = "${__formdata.ok}";
                
                if (!objUtiles.estaVacio(ok) && ok == '0'){
                    parent.f_aceptar_axismap008();
                    }
                    
	 	f_cargar_propiedades_pantalla();
	    }

           
          
           
           function f_but_aceptar() {
             if (objValidador.validaEntrada())
                    objUtiles.ejecutarFormulario("modal_axismap008.do", "guardar", document.miForm, "_self",  objJsMessages.jslit_cargando);
           }
           
           function f_but_cancelar() {
                parent.f_cerrar_modal('axismap008');
           }
        

            
        </script>
    </head>
 <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            
            <input type="hidden" id="CMAPEAD" name="CMAPEAD" value="${__formdata.CMAPEAD}"/>
            <input type="hidden" id="NODE_VALUE" name="NODE_VALUE" value="${__formdata.NODE_VALUE}"/>
            <input type="hidden" id="NODE_LABEL" name="NODE_LABEL" value="${__formdata.NODE_LABEL}"/>
            
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="lit_form" f="axismap008" lit="9903585"/></c:param>
                <c:param name="producto"><axis:alt c="lit_form" f="axismap008" lit="9903585"/></c:param>
                <c:param name="form">axismap008</c:param>
            </c:import>
            <!-- Area de campos  -->
            
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion"> 
                        <tr>
                        <td>
                            <table class="area" align="center"> 
            <tr>
                <th style="width:33%;height:0px"></th>
                <th style="width:33%;height:0px"></th>
                <th style="width:33%;height:0px"></th>

                    <tr>
                      <td class="titulocaja"><b><axis:alt f="axismap008" c="TTAG" lit="9901587"/></b></td><%-- Objeto --%>
                      <td class="titulocaja"><b><axis:alt f="axismap008" c="TPARE" lit="9901588"/></b></td><%-- Padre --%>
                      <td class="titulocaja"><b><axis:alt f="axismap008" c="NORDFILL" lit="500102"/></b></td><%-- Orden --%>
                    </tr>
                     <tr>
                      <td class="campocaja">
                       <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;"
                       <c:if test="${!empty __formdata.TTAG && ( empty __formdata.ok || (!empty __formdata.ok && !(__formdata.ok == 1)))}">readonly</c:if> 
                    value="${__formdata.TTAG}" title="<axis:alt f="axismap008" c="TTAG" lit="9901587"/>"  name="TTAG" id="TTAG" <axis:atr f="axismap008" c="TTAG" a="obligatorio=true&modificable=true"/> />
                      </td>
                      <td class="campocaja">

                    <select name="TPARE" style="width:93%" title="<axis:alt f="axismap008" c="TPARE" lit="9901588"/>"  <axis:atr f="axismap008" c="TPARE" a="obligatorio=true&modificable=true&isInputText=false"/>
                                    <c:if test="${!empty __formdata.TTAG && ( empty __formdata.ok || (!empty __formdata.ok && !(__formdata.ok == 1)))}">disabled</c:if> 
                                    id="TPARE" size="1" onchange=""
                                    class="campowidthselect campo campotexto">&nbsp;
                                  <option value="<%= Integer.MIN_VALUE %>">
                                        - <axis:alt f="axismap008" c="SNV_COMBO" lit="108341"/> -
                                  </option>
                                  <c:forEach var="arbol"
                                             items="${__formdata.RED_ARBOL}">
                                        <option value="${arbol.TTAG}"
                                                <c:if test="${!empty __formdata.TPARE && __formdata.TPARE == arbol.TTAG}">selected</c:if>>
                                                ${arbol.TTAG}
                                        </option>
                                  </c:forEach>
                            </select>
                    
                      </td>
                       <td class="campocaja">
                    
                       <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;"
                    value="${__formdata.NORDFILL}"  <c:if test="${!empty __formdata.TTAG && ( empty __formdata.ok || (!empty __formdata.ok && !(__formdata.ok == 1)))}">readonly</c:if> 
                    title="<axis:alt f="axismap008" c="NORDFILL" lit="500102"/>" name="NORDFILL" id="NORDFILL" <axis:atr f="axismap008" c="NORDFILL" a="obligatorio=true&formato=entero&modificable=true"/> />
                 
                       </td>
                    </tr>

                   
                     <tr>
                      <td class="titulocaja" colspan="2"><b><axis:alt f="axismap008" c="CTABLAFILLS" lit="9901589"/></b></td><%-- Tabla hijos --%>
                      <td class="titulocaja"><b><axis:alt f="axismap008" c="CATRIBUTS" lit="9901590"/></b></td><%-- Atributos --%>
                    </tr>
                    <tr>
                    <td class="campocaja" colspan="2">
              
                   <select name="CTABLAFILLS" style="width:93%" title="<axis:alt f="axismap008" c="CTABLAFILLS" lit="9901589"/>"  <axis:atr f="axismap008" c="CTABLAFILLS" a="obligatorio=false&modificable=true&isInputText=false"/>
                                    id="CTABLAFILLS" size="1" onchange=""
                                    class="campowidthselect campo campotexto">&nbsp;
                                  <option value="<%= Integer.MIN_VALUE %>">
                                        - <axis:alt f="axismap008" c="SNV_COMBO" lit="108341"/> -
                                  </option>
                                  <c:forEach var="ramo"
                                             items="${__formdata.lsttablahijos}">
                                        <option value="${ramo.CTABLA}"
                                                <c:if test="${!empty __formdata.CTABLAFILLS && __formdata.CTABLAFILLS == ramo.CTABLA}">selected</c:if>>
                                              ${ramo.DESCRIPCIO}
                                        </option>
                                  </c:forEach>
                            </select>
                    
                    </td>
                    <td class="campocaja">
                       <input type="text" title="<axis:alt f="axismap008" c="CATRIBUTS" lit="9901590"/>" <axis:atr f="axismap008" c="CATRIBUTS" a="obligatorio=false&formato=entero&modificable=true"/> class="campowidthinput campo campotexto" size="15" style="width:90%;"
                    value="${__formdata.CATRIBUTS}" name="CATRIBUTS" id="CATRIBUTS"/>
                       </td>
                    </tr>
                    
                    </table>   
                      </td>
                </tr>
            </table>
    
                    </td>
                </tr>
            </table>
    
     </form>
    
    

<c:import url="../include/botonera_nt.jsp">
           <c:param name="f">axismap008</c:param>
            <c:param name="__botones"><axis:visible f="axismap008" c = "BT_CANCELAR">cancelar</axis:visible><axis:visible f="axismap008" c = "BT_ACEPTAR">,aceptar</axis:visible> </c:param>

</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>


