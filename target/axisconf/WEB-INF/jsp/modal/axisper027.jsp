<%-- 
*  Fichero: axisper027.jsp : seccion sarlaft
*
*  Fecha: 26/07/2011
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="axis.util.Constantes" %>
<%@ page import="java.util.*" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <c:import url="../include/carga_framework_js.jsp" />
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
    
    <script language="Javascript" type="text/javascript">
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        function f_onload() {    
            var RES_SARLAFT = "${__formdata.RES_SARLAFT}"; 
            
            if (RES_SARLAFT=='0')
            {
                parent.f_aceptar_axisper027("${__formdata.SPERSON}");
            }
            f_cargar_propiedades_pantalla();   
        }
                
        function f_but_aceptar() {
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisper027.do", "grabarPersona", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }
       
	function f_but_cancelar() {
            parent.f_cerrar_axisper027();
        }      
        
        
        function f_formatdate(entrada,title){
             var jDate = new JsFecha();
                if(entrada.value.length>0){
                    entrada.value=jDate.formateaFecha(entrada.value);
                
                    if(jDate.validaFecha(entrada.value)){
                        entrada.value=jDate.formateaFecha(entrada.value);
                    }else{
                        alert("<axis:alt f="axisctr090" c="ALER_ERR" lit="1000421"/>");
                    }
                }
            }            
      
        
        
      
      
    </script>
  </head>
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="faceptar" name="faceptar" value="${__formdata.faceptar}"/>
            <%-- Esto es necesario tenerlo como hidden para volverlo a enviar a servidor para grabar --%>
            <input type="hidden" id="isNew"  name="isNew" value="${__formdata.isNew}"/>
            <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>
            <input type="hidden" id="SPEREAL" name="SPEREAL" value="${__formdata.SPEREAL}"/>
            <input type="hidden" id="selectedCTIPPER" name="selectedCTIPPER" value="${__formdata.selectedCTIPPER}"/>
            <input type="hidden" id="CAGENTE" name="CAGENTE" value="${__formdata.CAGENTE}"/>
            <input type="hidden" id="ORIGEN" name="ORIGEN" value="" />
            <input type="hidden" id="SNIP" name="SNIP" value="" />
            <input type="hidden" id="CAGENTE_VISIO" name="CAGENTE_VISIO"  value="" />
                          
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisrea027" c="TIT026" lit="9902423" /></c:param>
                <c:param name="producto"><axis:alt f="axisrea027" c="TIT026" lit="9902423" /></c:param>
                <c:param name="form">axisper027</c:param>
            </c:import>

            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        
                        <table class="seccion">
                            <tr>                                
                                <th style="width:15%;height:0px"></th>
                                <th style="width:55%;height:0px"></th>
                                <th style="width:5%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>          
                            
                                <axis:visible f="axisrea027" c="FEFECTO">
                                        <td class="titulocaja" id="LIT_FEFECTO">
                                            <b><axis:alt f="axisrea027" c="FEFECTO" lit="100883"/></b>
                                        </td>
                                </axis:visible>                                
                               
                            </tr>
                            <tr>
                              <axis:visible f="axisrea027" c="FEFECTO" >
                                    <td class="campocaja">
                                                        <input type="text" onblur="javascript:f_formatdate(this,'')" formato="fecha" <axis:atr f="axisrea027" c="FEFECTO" a="modificable=true&isInputText=true&obligatorio=true"/>  alt="<axis:alt f="axisrea027" c="FEFECTO" lit="100883"/>" title="<axis:alt f="axisrea027" c="FEFECTO" lit="100883"/>"
                                                        name="FEFECTO" id="FEFECTO"  value="<fmt:formatDate value="${__formdata.FEFECTO}" pattern="dd/MM/yyyy" />" style="width:100px;" class="campowidthinput campo campotexto_ob"/>
                                                        <axis:visible c="ICO_FEFECTO" f="axisrea027">
                                                            <a id="icon_FEFECTO" style="vertical-align:middle;">
                                                            <img alt="<axis:alt f="axisrea027" c="SELECT" lit="108341"/>" title="<axis:alt f="axisrea027" c="ICO_FEFECTO" lit="100883" />" src="images/calendar.gif"/></a>
                                                        </axis:visible>
                                    </td>
                                </axis:visible>
                                                                             
                            </tr>                           
                            
                        </table>
                    </td>
                </tr>
            </table>			
            
            <div class="separador">&nbsp;</div>
           
            
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisrea027</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form>


<script type="text/javascript">
    Calendar.setup({
        inputField     :    "FEFECTO",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FEFECTO", 
        singleClick    :    true,
        firstDay       :    1
    });
</script>
        
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>

