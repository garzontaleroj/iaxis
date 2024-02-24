<%--
      NOMBRE:    axismap011.jsp
      @author <a href = "mailto:autor@csi-ti.com">Autor creación</a>
      Fecha: DD/MM/YYYY
      PROPÓSITO (descripción pantalla): 
      Ejemplo : Pantalla de Busqueda de pólizas
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        DD/MM/YYYY   XXX(iniciales)     1. Creación de la pantalla. Bug.9296
      2.0        DD/MM/YYYY   XXX(iniciales)     2. Ejemplo : Añadir funcionalidad Ramo - Producto . Bug.: XXXX
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
                    parent.f_aceptar_axismap011();
                    }
	 	f_cargar_propiedades_pantalla();
	    }

         
           
           function f_but_aceptar() {
           
            if (objValidador.validaEntrada()){
                    //Validamos los campos de pantalla, ahora llamaríamos a la función que tocara
                    objUtiles.ejecutarFormulario("modal_axismap011.do", "guardar", document.miForm, "_self",  objJsMessages.jslit_cargando);
                }
          
           }
           
           function f_but_cancelar() {
                parent.f_cerrar_modal('axismap011');
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
                <c:param name="formulario"><axis:alt c="lit_form" f="axismap011" lit="9901575"/></c:param>
                <c:param name="producto"><axis:alt c="lit_form" f="axismap011" lit="9901575"/></c:param>
                <c:param name="form">axismap011</c:param>
            </c:import>
            <!-- Area de campos  -->
            
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            
                            <tr>
                            <td><table class="area" align="center">                    
            <tr>
                 <th style="width:25%;height:0px"></th>
                <th style="width:25%;height:0px"></th>
                <th style="width:25%;height:0px"></th>
                <th style="width:25%;height:0px"></th>
             
                    <tr>
                      <td class="titulocaja"><b><axis:alt f="axismap011" c="NORDEN" lit="500102"/></b></td><%-- orden --%>
                      <td class="titulocaja"><b><axis:alt f="axismap011" c="NPOSICION" lit="9901591"/></b></td><%-- Posición --%>
                      <td class="titulocaja"><b><axis:alt f="axismap011" c="NLONGITUD" lit="9901592"/></b></td><%-- Longitud --%>
                      <td class="titulocaja"><b><axis:alt f="axismap011" c="TTAG" lit="9903589"/></b></td><%-- Longitud --%>
                    </tr>
                     <tr>
                      <td class="campocaja">
                      
                        <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;"  <axis:atr f="axismap011" c="NORDEN" a="obligatorio=true&modificable=true"/>
                    value="${__formdata.NORDEN}" <c:if test="${!empty __formdata.NORDEN && ( empty __formdata.ok || (!empty __formdata.ok && !(__formdata.ok == 1)))}">readonly</c:if> name="NORDEN" id="NORDEN" title="<axis:alt f="axismap011" c="NORDEN" lit="500102"/>" />
                      
                      </td>
                      <td class="campocaja">
                       <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;"  <axis:atr f="axismap011" c="NPOSICION" a="obligatorio=false&formato=entero&modificable=true"/>
                    value="${__formdata.NPOSICION}" title="<axis:alt f="axismap011" c="NPOSICION" lit="9901591"/>" name="NPOSICION" id="NPOSICION" />
                    
                      </td>
                       <td class="campocaja">
                       <input type="text" class="campowidthinput campo campotexto" title="<axis:alt f="axismap011" c="NLONGITUD" lit="9901592"/>" size="15" style="width:90%;"
                    value="${__formdata.NLONGITUD}" name="NLONGITUD" id="NLONGITUD"   <axis:atr f="axismap011" c="NLONGITUD" a="obligatorio=false&formato=entero&modificable=true"/>/>
                    
                       </td>
                      <td class="campocaja">
                       <select name="TTAG" style="width:93%"
                       <c:if test="${!empty __formdata.NORDEN && ( empty __formdata.ok || (!empty __formdata.ok && !(__formdata.ok == 1)))}">disabled</c:if>
                       title="<axis:alt f="axismap011" c="TTAG" lit="9903589"/>"  <axis:atr f="axismap008" c="TPARE" a="obligatorio=false&modificable=true&isInputText=false"/>
                                    id="TTAG" size="1" onchange=""
                                    class="campowidthselect campo campotexto">&nbsp;
                                  <option value="null">
                                        - <axis:alt f="axismap008" c="SNV_COMBO" lit="108341"/> -
                                  </option>
                                  <c:forEach var="arbol"
                                             items="${__formdata.RED_ARBOL}">
                                        <option value="${arbol.TTAG}"
                                                <c:if test="${!empty __formdata.TTAG && __formdata.TTAG == arbol.TTAG}">selected</c:if>>
                                                ${arbol.TTAG}
                                        </option>
                                  </c:forEach>
                            </select>
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
           <c:param name="f">axismap011</c:param>
            <c:param name="__botones"><axis:ocultar f="axismap011" c = "BT_CANCELAR" dejarHueco="false">cancelar</axis:ocultar><axis:ocultar f="axismap011" c = "BT_ACEPTAR" dejarHueco="false">,aceptar</axis:ocultar> </c:param>

</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>


