<%
/**
*  Fichero: axisgfi024.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a>
*  Fecha: 22/07/2009
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
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
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />
    
    <script language="Javascript" type="text/javascript">
        function f_onload() {
           
            
            var ver="${ERROR}";
            var salir = 0;
            if (!objUtiles.estaVacio(ver) && '${ERROR}' == 0){
                salir = 1;
                parent.f_aceptar_axisgfi012();
            }
            
            f_cargar_propiedades_pantalla();
            
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axisgfi024();
        }        
         
        function f_but_aceptar() {
        
           // if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario ("modal_axisgfi024.do","aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
          //  }
         }
         
    </script>
  </head>
    <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="ISNEW" name="ISNEW" value="${ISNEW}" />
            <input type="hidden" id="CLAVE" name="CLAVE" value="${CLAVE}" />
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisgfi024" c="FORM" lit="9002011" /></c:param>
                <c:param name="producto"><axis:alt f="axisgfi024" c="PRODUCTO" lit="9002011"/></c:param>
                <c:param name="form">axisgfi024</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:5%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                               
                            </tr>
                            <tr><td><div class="separador">&nbsp;</div></td></tr>
                            <tr>
                                <td></td>
                                <td class="titulocaja" >
                                    <b><axis:alt f="axisgfi024" c="TERMINO" lit="9001991" /></b>
                                </td>
                            </tr>
                                <td></td>
                                <td class="campocaja" colspan="3">
                                    <input type="text" class="campowidthinput campo campotexto" value="${TERMINO}" name="TERMINO" id="TERMINO" title="<axis:alt f="axisgfi024" c="TERMINO" lit="9001991"/>" size="15" 
                                           <axis:atr f="axisgfi024" c="TERMINO" a="modificable=false&obligatorio=true"/>/>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="titulocaja" >
                                    <b><axis:alt f="axisgfi024" c="FECHA_EFE" lit="100883" /></b>
                                </td>
                                <td class="titulocaja" >
                                    <b><axis:alt f="axisgfi024" c="VALOR" lit="101159"/></b>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="campocaja"> 
                                    <input style="width:85%"  type="text" class="campowidthinput campo campotexto" id="FECHA_EFE" name="FECHA_EFE" size="15" 
                                            <axis:atr f="axisctr024" c="FECHA_EFE" a="modificable=true&obligatorio=true&formato=fecha"/>
                                            value="<fmt:formatDate pattern="dd/MM/yyyy" value="${TERMVIGENCIA[0].FECHA_EFECTO}"/>"
                                            title="<axis:alt f="axisctr024" c="FECHA_EFE" lit="100883"/>"/><a id="icon_FECHA_EFE" style="vertical-align:middle;"><img 
                                             alt="<axis:alt f="axisctr024" c="FECHA_EFE" lit="100883"/>" title="<axis:alt f="axisctr004" c="FECHA_EFE" lit="100883"/>" src="images/calendar.gif"/></a>
                                     
                                     
                                </td> 
                           
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="<fmt:formatNumber pattern='#,##0.#############' value='${TERMVIGENCIA[0].VALOR}'/>"  name="VALOR" id="VALOR"  size="15" 
                                    title="<axis:alt f="axisgfi024" c="VALOR" lit="101159"/>" <axis:atr f="axisgfi024" c="VALOR" a="modificable=true&obligatorio=true"/>/>
                                </td> 
                            </tr>
                            <tr><td><div class="separador">&nbsp;</div></td></tr>
                        </table>
                        <div class="separador">&nbsp;</div>
                    </td>
                </tr>
            </table>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisgfi024</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>
     </form>
     <script type="text/javascript">
    Calendar.setup({
        inputField     :    "FECHA_EFE",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FECHA_EFE", 
        singleClick    :    true,
        firstDay       :    1
    });


</script>  
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>

