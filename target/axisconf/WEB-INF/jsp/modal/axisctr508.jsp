<%/* Revision:# MP8BWwjj9vm3L468jjopAQ== # */%>

<%--
/**
*  Fichero: axisctr508.jsp
*  
*  Titulo: Modal mantetenimniento personas relacionadas proceso judicial
*
*  Fecha: 03/03/2009
*/
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt c="titulo" f="axisctr508" lit="9909784"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    
    <script type="text/javascript">
    
            
        function f_onload() { 
                 if (${requestScope.grabarOK == true}) {
                    parent.f_cerrar_modal("axisctr508");
        }
                         if (${requestScope.validacionFallo == true}) {
                    parent.f_cerrar_axisctr508();
                         }
    

        f_cargar_propiedades_pantalla(); 
    
     
        }
        
        function f_but_aceptar(){
        
            if (objValidador.validaEntrada()) {
                      objUtiles.ejecutarFormulario ("modal_axisctr508.do", "guardar", document.Axissin0066Form, "_self", objJsMessages.jslit_cargando);

            }
        }

        function f_but_cancelar(){
            parent.f_cerrar_modal("axisctr508");
        }

	
    </script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
	
    
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
    
    
    <form name="Axissin0066Form" action="" method="POST">
    <input type="hidden" name="operation" value="guardar" />
    <input type="hidden" name="CEMPRES" value="${__formdata.CEMPRES}"/>
    <input type="hidden" name="CGRUP" id="CGRUP" value="${__formdata.CGRUP}"/>
    <input type="hidden" name="CSUBGRUP" id="CSUBGRUP" value="${__formdata.CSUBGRUP}"/>
    <input type="hidden" name="CVERSION" id="CVERSION" value="${__formdata.CVERSION}"/>    
    <input type="hidden" name="CNIVEL" id="CNIVEL" value="${__formdata.CNIVEL}"/> 

    <input type="hidden" name="ORIGEN" id="ORIGEN" value="${__formdata.ORIGEN}"/>
    <c:import url="../include/titulo_nt.jsp">
        
        <c:param name="titulo"><axis:alt c="titulo" f="axisctr508" lit="9909784"/></c:param>
        <c:param name="formulario"><axis:alt c="form" f="axisctr508" lit="9909784"/></c:param>
        <c:param name="form">axisctr508</c:param>
        
    </c:import>

  

    <div class="separador">&nbsp;</div>
    <table  class="mainModalDimensions base"  align="center" cellpadding="0" cellspacing="0"><!--id="tabla1" -->
        <tr>
            <td>
                <!-- Seccion -->
                <div class="titulo"> 
                    <img  src="images/flecha.gif"/>
                    <axis:alt c="flecha" f="axisctr508" lit="9909791" /> 
                </div>  
                <div class="separador">&nbsp;</div>
                <table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center"--> <!-- UNO -->
                            <tr>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                
                            </tr>
                            <tr>
                                 <td class="titulocaja" >
                                     
                                  </td>
                              <axis:ocultar f="axisctr508" c="IMPVALOR1" dejarHueco="false"> 
                                  <td class="titulocaja" colspan = "2">
                                        <b><axis:alt f="axisctr508" c="IMPVALOR1" lit="9909789"></axis:alt></b>
                                  </td>
                              </axis:ocultar>
                              
                               <!-- SPV IAXIS 4201 Se retiran los titulos  -->
                            </tr>
                            <tr>  
                                <td class="campocaja" >
                                    <b><axis:alt f="axisctr508" c="TIT_DEDUCIBLE" lit="9909790"></axis:alt></b>
                                </td> 
                               <!-- SPV IAXIS 4201 Se retira componente tipo lista -->
                                 <axis:ocultar c="CVALOR1" f="axisctr508" dejarHueco="false">
                                <td class="campocaja" >
                                   <!-- SPV IAXIS 4201 valor default porcentaje-->
                                    <select name = "CVALOR1" id="CVALOR1" style="width:100%" size="1"  class="campowidthselect campo campotexto" <axis:atr f="axisctr508" c="CVALOR1" a="modificable=true&obligatorio=true"/> 
                                     alt="<axis:alt c="CVALOR1" f="axisctr508" lit="9909789" />" title="<axis:alt c="CVALOR1" f="axisctr508" lit="9909789" />" > 
                                     
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axisctr508" lit="1000348"/> - </option>
                                                <c:forEach var="unidades" items="${__formdata.listaTipoUnidad}">
                                                    <option value = "${unidades.CATRIBU}"
                                                        <c:if test="${unidades.CATRIBU == 1}">selected</c:if>>
                                                        ${unidades.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                    </select>
                                </td>  
                                </axis:ocultar>
                                <td class="campocaja">
                                <axis:visible f="axisctr508" c="IMPVALOR1">
                                    <input type="text" class="campowidthinput campo campotexto" style="width:100%"   id="IMPVALOR1" name="IMPVALOR1" size="5"   
                                     <axis:atr f="axisctr508" c="IMPVALOR1" a="obligatorio=true"/>  
                                     value="${__formdata.IMPVALOR1}" title="<axis:alt c="IMPVALOR1" f="axisctr508" lit="9909789" />" 
                                     alt="<axis:alt c="IMPVALOR1" f="axisctr508" lit="9909789" />" /> 
                                 </axis:visible>
                                </td>
                                <!-- SPV  IAXIS 4201 Se retira componente tipo lista y otros-->
                              </tr>


                            </table> <!-- UNO -->

            </td>
        </tr>
    </table>
  </td>
</tr>
</table>
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr508</c:param><c:param name="f">axisctr508</c:param><c:param name="f">axisctr508</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>
    </form>
    <script type="text/javascript">

</script>
  <c:import url="../include/mensajes.jsp" />
</body>
</html>
