<%--
      NOMBRE:    axismap009.jsp
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
                       
                if (!objUtiles.estaVacio(ok) && ok == '0')
                    parent.f_aceptar_axismap009();
                
	 	f_cargar_propiedades_pantalla();
	    }

        
          
           
           function f_but_cancelar() {
                parent.f_cerrar_modal('axismap009');
           }
        
        
         function f_but_aceptar() {    
            if (objValidador.validaEntrada()) 
                 objUtiles.ejecutarFormulario("modal_axismap009.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }

            
        </script>
    </head>
 <body class=" " onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            
            <input type="hidden" id="CMAPEAD" name="CMAPEAD" value="${__formdata.CMAPEAD}"/>
            
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="FORM" f="axismap009" lit="9901577"/></c:param>
                <c:param name="producto"><axis:alt c="FORM" f="axismap009" lit="9901577"/></c:param>
                <c:param name="form">axismap009</c:param>
            </c:import>
            <!-- Area de campos  -->
            
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:50%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                                <axis:ocultar f="axismap009" c="CMAPCOM" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismap009" c="CMAPCOM" lit="9903579" /></b>
                                    </td>
                                </axis:ocultar>
                              
                                
                            </tr>
                            <tr>
                                <axis:ocultar f="axismap009" c="CMAPCOM" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                        <axis:atr f="axismap009" c="CMAPCOM" a="obligatorio=true&modificable=true"/>
                                        style="width:95%;" size="15" value="${__formdata.CMAPCOM}" name="CMAPCOM" id="CMAPCOM"
                                         title="<axis:alt f="axismap009" c="CMAPCOM" lit="9903579" />"/>
                                    </td>
                                </axis:ocultar>
                               
                            </tr>
                        </table>
                       
                     <c:import url="../include/botonera_nt.jsp">
                       <c:param name="f">axismap009</c:param>
                        <c:param name="__botones"><axis:visible f="axismap009" c = "BT_CANCELAR">cancelar</axis:visible><axis:visible f="axismap009" c = "BT_ACEPTAR">,aceptar</axis:visible> </c:param>
            
            </c:import>
                    </td>
                </tr>
                
            </table>
    
     </form>
    
    


<c:import url="../include/mensajes.jsp" />
    
</body>
</html>


