<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%-- 
*  Fichero: axisper050.jsp : seccion calculo nivel de riesgo
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
        	  f_cargar_propiedades_pantalla();        	    	 
                      	     
        }
                
        function f_but_aceptar() {
           
        	parent.f_aceptar_axisper050();
           
        }
       
	function f_but_cancelar() {
		parent.f_aceptar_axisper050();
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
        
        function calular_riesgo(){        	
                // objDom.setValorComponente(document.miForm.SSEGURO, SSEGURO);
                 objUtiles.ejecutarFormulario ("modal_axisper050.do", "m_calcula_riesgo", document.miForm, "_self", objJsMessages.jslit_cargando);     
            
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
            <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>
            <input type="hidden" id="CORRECTO" name="CORRECTO" value="${__formdata.CORRECTO}"/>
            
                          
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisper050" c="TIT026" lit="9910015" /></c:param>
                <c:param name="producto"><axis:alt f="axisper050" c="TIT026" lit="9910015" /></c:param>
                <c:param name="form">axisper050</c:param>
            </c:import>

            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        
                        <table class="seccion">
                            <tr>                                
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:70%;height:0px"></th>
                            </tr>
                            <tr>          
                            
                                <axis:visible f="axisper050" c="FEFECTO">
                                        <td class="titulocaja" id="LIT_FEFECTO">
                                            <b><axis:alt f="axisper050" c="FEFECTO" lit="100883"/></b>
                                        </td>
                                </axis:visible>        
                                
                                <axis:visible f="axisper050" c="VFINANCIAR">
                                        <td class="titulocaja" id="LIT_VFINANCIAR">
                                            <b><axis:alt f="axisper050" c="VFINANCIAR" lit="9910014"/></b>
                                        </td>
                                </axis:visible> 
                                
                                
                                                                          
                               
                            </tr>
                            <tr>
                              <axis:visible f="axisper050" c="FEFECTO" >
                                    <td class="campocaja">
                                                        <input type="text" onblur="javascript:f_formatdate(this,'')" formato="fecha" <axis:atr f="axisrea027" c="FEFECTO" a="modificable=true&isInputText=true&obligatorio=true"/>  alt="<axis:alt f="axisrea027" c="FEFECTO" lit="100883"/>" title="<axis:alt f="axisrea027" c="FEFECTO" lit="100883"/>"
                                                        name="FEFECTO" id="FEFECTO"  value="<fmt:formatDate value="${__formdata.FEFECTO}" pattern="dd/MM/yyyy" />" style="width:100px;" class="campowidthinput campo campotexto_ob"/>
                                                        <axis:visible c="ICO_FEFECTO" f="axisper050">
                                                            <a id="icon_FEFECTO" style="vertical-align:middle;">
                                                            <img alt="<axis:alt f="axisper050" c="SELECT" lit="108341"/>" title="<axis:alt f="axisrea027" c="ICO_FEFECTO" lit="100883" />" src="images/calendar.gif"/></a>
                                                        </axis:visible>
                                    </td>                                                                          
                                </axis:visible>
                               <axis:visible c="axisper050" f="VFINANCIAR">
                                   
                                <td class="campocaja" >
                                    <input type="text" class="campowidthinput campo campotexto" size="30" value="${__formdata.VFINANCIAR}" name="VFINANCIAR" id="VFINANCIAR" title="<axis:alt f="axisper050" c="VFINANCIAR" lit="9910014"/>" style="width:100%;"
                                   <axis:atr f="axisper050" c="VFINANCIAR" a="modificable=true&obligatorio=true"/>/>
                                     

                                </td>
                                 </axis:visible> 
                                    
                                <td align="left" >
                                                                <div class="separador">&nbsp;</div>
                                                                <axis:ocultar f="axisper050" c="BT_CALCULA_RIESGO" dejarHueco="false">
                                                                <input type="button" class="boton" value="<axis:alt f="axisper050" c="BT_CALCULA_RIESGO" lit="9910015"/>" 
                                                                onclick="javascript:calular_riesgo('${__formdata.FEFECTO}','${__formdata.VFINANCIAR}')" />
                                                                </axis:ocultar>                                                               
<!--                                                                 <div class="separador">&nbsp;</div> -->
                               </td>                                             
                            </tr>                           
                            
                        </table>
                    </td>
                </tr>
            </table>			
            
            <div class="separador">&nbsp;</div>
           
            
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisper050</c:param>
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

