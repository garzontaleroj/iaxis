<%/*
*  Fichero: axisgfi016.jsp
*
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*
*  Fecha: 23/07/2009
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
    
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript">
    
    function f_onload() {
        f_cargar_propiedades_pantalla();
    }
    
    function f_but_cancelar(){
         //alert("Antes de cerrar");
         parent.f_cerrar_modal('axisgfi015');
    }
    
    function f_but_aceptar(){
         //alert("Antes de aceptar");
         if (objValidador.validaEntrada()){
         parent.f_aceptar_axigfi015(document.miForm.FECHA.value);
         }
    }
    
   
    </script>
  </head>
  <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_aceptar() }">
  <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
<form name="miForm" action="modal_axisgfi016.do" method="POST"> 
<input type="hidden" name="operation" value="aceptar" />

<c:import url="../include/titulo_nt.jsp">
    <c:param name="formulario"><axis:alt f="axisgfi015" c="FORM" lit="9002004" /></c:param>
    <c:param name="form">axisgfi015</c:param>
</c:import>
<table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <!--campos-->
            <table class="seccion">
            <tr>
                <td>
                      <table class="area" align="center">       
                                <tr>
                                    <th style="height:0px;width:50%"></th>
                                    <th style="height:0px;width:50%"></th>
                                </tr>
                              
                                <tr>
                                    <axis:visible f="axisgfi015" c="FECHA">                
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisgfi015" c="FECHA" lit="100562" /></b>
                                        </td>                
                                    </axis:visible>
                                    <td></td>
                                </tr>
                                <tr>
                                   
                                    <axis:visible f="axisgfi015" c="FECHA">                
                                        <td class="campocaja" colspan="1" valign="middle">
                                        <%-- F. tramo --%>
                                             
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:20%;"
                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FECHA}"/>" name="FECHA" id="FECHA"
                                                    alt="<axis:alt f="axisgfi015" c="FECHA" lit="100562"/>" title="<axis:alt f="axisgfi015" c="FECHA" lit="100562"/>" formato="fecha"
                                                    <axis:atr f="axisgfi015" c="FECHA" a="formato=fecha&obligatorio=true"/><a style="vertical-align:bottom;">&nbsp;<img 
                                                    id="icon_FECHA" alt="<axis:alt f="axisgfi015" c="FECHA" lit="100562"/>" title="<axis:alt f="axisgfi015" c="FECHA" lit="100562" />" src="images/calendar.gif"/></a>
                                                   
                                        </td>
                                    </axis:visible>
                                    <td></td>
                                </tr>
                            </table>
                        </td>
                     </tr>   
               
            </table>
        </td>
    </tr>
</table>
<c:import url="../include/botonera_nt.jsp"><c:param name="f">axisgfi015</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>

</form>
<c:import url="../include/mensajes.jsp" />
<script type="text/javascript">
            Calendar.setup({
                inputField     :    "FECHA",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FECHA", 
                singleClick    :    true,
                firstDay       :    1
            });
            
         
       </script>
</body>
</html>