<%--
      NOMBRE:    axismap012.jsp
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
                    parent.f_aceptar_axismap012();
                    }
	 	f_cargar_propiedades_pantalla();
	    }

         
           
           function f_but_aceptar() {
           
            if (objValidador.validaEntrada()){
                    //Validamos los campos de pantalla, ahora llamaríamos a la función que tocara
                    objUtiles.ejecutarFormulario("modal_axismap012.do", "guardar", document.miForm, "_self",  objJsMessages.jslit_cargando);
                }
          
           }
           
           function f_but_cancelar() {
                parent.f_cerrar_modal('axismap012');
           }

            
        </script>
    </head>
 <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
              <input type="hidden" id="NORDEN" name="NORDEN" value="${__formdata.NORDEN}"/>
              <input type="hidden" id="CMAPEAD" name="CMAPEAD" value="${__formdata.CMAPEAD}"/>
            <input type="hidden" id="NODE_VALUE" name="NODE_VALUE" value="${__formdata.NODE_VALUE}"/>
            <input type="hidden" id="NODE_LABEL" name="NODE_LABEL" value="${__formdata.NODE_LABEL}"/>
          
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="lit_form" f="axismap012" lit="9901575"/></c:param>
                <c:param name="producto"><axis:alt c="lit_form" f="axismap012" lit="9901575"/></c:param>
                <c:param name="form">axismap012</c:param>
            </c:import>
            <!-- Area de campos  -->
            
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            
                            <tr>
                               
                                    <td>  <table class="area" align="center">                    
            <tr>
                <th style="width:33%;height:0px"></th>
                <th style="width:33%;height:0px"></th>
                <th style="width:33%;height:0px"></th>
            </tr>
             <tr>

                      <td class="titulocaja"><b><axis:alt f="axismap012" c="TCAMPO" lit="109373"/></b></td><%-- Condición --%>
                      <td class="titulocaja"><b><axis:alt f="axismap012" c="NVECES" lit="9901593"/></b></td><%-- Tipo --%>
                      <td class="titulocaja"><b><axis:alt f="axismap012" c="CTABLA" lit="9901594"/></b></td><%-- CTABLA --%>
                    </tr>
            <tr>
                   <td class="campocaja">
                       <input type="text" class="campowidthinput campo campotexto"  size="15" style="width:90%;"
                       title="<axis:alt f="axismap012" c="TCAMPO" lit="109373"/>"
                       <axis:atr f="axismap012" c="TCAMPO" a="obligatorio=true&modificable=true"/>
                    value="${__formdata.TCAMPO}" name="TCAMPO" id="TCAMPO" <c:if test="${!empty __formdata.TCAMPO && ( empty __formdata.ok || (!empty __formdata.ok && !(__formdata.ok == 1)))}">readonly</c:if>/>
                    
                       </td>
                        <td class="campocaja">
                       <input type="text" class="campowidthinput campo campotexto"  size="15" style="width:90%;"
                       title="<axis:alt f="axismap012" c="NVECES" lit="9901593"/>"
                       <axis:atr f="axismap012" c="NVECES" a="obligatorio=true&formato=entero&modificable=true"/>
                    value="${__formdata.NVECES}" name="NVECES" id="NVECES" <c:if test="${!empty __formdata.TCAMPO && ( empty __formdata.ok || (!empty __formdata.ok && !(__formdata.ok == 1)))}">readonly</c:if> />
                    
                       </td>
                        <td class="campocaja">
                       <input type="text" <axis:atr f="axismap012" c="CTABLA" a="obligatorio=true&formato=entero&modificable=true"/> class="campowidthinput campo campotexto"  size="15" style="width:25%;"
                    value="${__formdata.CTABLA}" title="<axis:alt f="axismap012" c="CTABLA" lit="9901594"/>" name="CTABLA" id="CTABLA" <c:if test="${!empty __formdata.TCAMPO && ( empty __formdata.ok || (!empty __formdata.ok && !(__formdata.ok == 1)))}">readonly</c:if>  />
                    <c:if test="${!empty __formdata.TDESCRIP}">
                    <input type="text" class="campowidthinput campo campotexto" readonly  size="15" style="width:70%;"
                    value="${__formdata.TDESCRIP}" name="TDESCRIP" id="TDESCRIP"  />
                    </c:if>
                       </td>
                       </tr>
           
                    
                <tr>

                      <td class="titulocaja"><b><axis:alt f="axismap012" c="TCONDICION" lit="9901595"/></b></td><%-- Condición --%>
                      <td class="titulocaja"><b><axis:alt f="axismap012" c="CTIPCAMPO" lit="100565"/></b></td><%-- Tipo --%>
                    </tr>
 <tr>
                   <td class="campocaja">
                       <input type="text" class="campowidthinput campo campotexto"  size="15" style="width:90%;"
                        title="<axis:alt f="axismap012" c="TCONDICION" lit="9901595"/>"
                       <axis:atr f="axismap012" c="TCONDICION" a="obligatorio=true&modificable=true"/>
                    value="${__formdata.TCONDICION}" <c:if test="${!empty __formdata.TCAMPO && ( empty __formdata.ok || (!empty __formdata.ok && !(__formdata.ok == 1)))}">readonly</c:if>  name="TCONDICION" id="TCONDICION" />
                    
                       </td>

                   <td class="campocaja">
                       <select name="CTIPCAMPO" style="width:93%" 
                                    id="CTIPCAMPO" size="1" 
                                    title="<axis:alt f="axismap012" c="CTIPCAMPO" lit="100565"/>"
                                    <axis:atr f="axismap012" c="CTIPCAMPO" a="modificable=true&isInputText=false"/>
                                    class="campowidthselect campo campotexto">&nbsp;
                                  <option value="<%= Integer.MIN_VALUE %>">
                                        - <axis:alt f="axismap012_form" c="SNV_COMBO" lit="108341"/> -
                                  </option>
                                  <c:forEach var="ramo"
                                             items="${__formdata.lstTipo}">
                                        <option value="${ramo.CATRIBU}"
                                                <c:if test="${!empty __formdata.CTIPCAMPO && __formdata.CTIPCAMPO == ramo.CATRIBU}">selected</c:if>>
                                             ${ramo.TATRIBU}
                                        </option>
                                  </c:forEach>
                            </select>
                      </td>
                   </tr>

                    <tr>
                      <td class="titulocaja" colspan="2"><b><axis:alt f="axismap012" c="TMASCARA" lit="100566"/></b></td><%-- Texto --%>
                      <td class="titulocaja"><b><axis:alt f="axismap012" c="TSETWHERE" lit="9002038"/></b></td><%-- Operación --%>
                    </tr>                    
                   <tr>
                     <td class="campocaja" colspan="2">
                       <input type="text"  class="campowidthinput campo campotexto" size="15" style="width:95%;"
                    value="${__formdata.TMASCARA}" name="TMASCARA" id="TMASCARA" 
                     title="<axis:alt f="axismap012" c="TMASCARA" lit="100566"/>"
                    <axis:atr f="axismap012" c="TMASCARA" a="obligatorio=false&modificable=true"/>/>
                    
                       </td>
                   <td class="campocaja">
                       <select name="TSETWHERE" style="width:93%"  
                        title="<axis:alt f="axismap012" c="TSETWHERE" lit="9002038"/>"
                       <axis:atr f="axismap012" c="TSETWHERE" a="obligatorio=true&modificable=true"/>
                       <c:if test="${!empty __formdata.TCAMPO && ( empty __formdata.ok || (!empty __formdata.ok && !(__formdata.ok == 1)))}">disabled</c:if> 
                                    id="TSETWHERE" size="1" onchange=""
                                    class="campowidthselect campo campotexto">&nbsp;
                                  <option value="<%= Integer.MIN_VALUE %>">
                                        - <axis:alt f="axismap012" c="SNV_COMBO" lit="108341"/> -
                                  </option>
                                  <c:forEach var="ramo"
                                             items="${__formdata.lstSetWhere}">
                                        <option value="${fn:substring(ramo.TATRIBU,0,1)}" 
                                        <c:if test="${!empty __formdata.TSETWHERE && __formdata.TSETWHERE ==  fn:substring(ramo.TATRIBU,0,1)}">selected</c:if>>
                                             ${ramo.TATRIBU}
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
           <c:param name="f">axismap012</c:param>
            <c:param name="__botones"><axis:ocultar f="axismap012" c = "BT_CANCELAR" dejarHueco="false">cancelar</axis:ocultar><axis:ocultar f="axismap012" c = "BT_ACEPTAR" dejarHueco="false">,aceptar</axis:ocultar> </c:param>

</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>


