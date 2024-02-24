<%/*
*  Fichero: Axisdesc009.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a> 
*
*  Fecha: 13/07/2010
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

       function f_but_cancelar() {
            parent.f_cerrar_axisdesc009();
       }
       
       function f_but_aceptar(){
       	if (objValidador.validaEntrada()) {
            objUtiles.ejecutarFormulario ("modal_axisdesc009.do", "aceptar", document.axisdesc009Form, "_self", objJsMessages.jslit_cargando);
        }
            
       }
       
       function f_onload(){
            revisarEstilos();
            f_cargar_propiedades_pantalla();
            
            var ok = "${__formdata.OK}";
            
            if ( !objUtiles.estaVacio(ok) && ok == 0){
               f_but_cancelar();
            }
       }
        
    </script>
  </head>
    <body onload="f_onload()" class=" ">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="axisdesc009Form" action="" method="POST">
            <input type="hidden" name="operation" value="">

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisdesc009" c="FORM" lit="9903509" /></c:param>
                <c:param name="producto"><axis:alt f="axisdesc009" c="FORM" lit="9903509" /></c:param>
                <c:param name="form">Axisdesc009</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">    
                        <tr>
                            <td align="left" >
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:12%;height:0px"></th>
                                        <th style="width:10%;height:0px"></th>
                                        <th style="width:35%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:28%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="separador">&nbsp;</div>
                                            <div class="separador">&nbsp;</div>
                                        </td>
                                    </tr>
                                    <tr>  
                                         <!-- Cuadro original -->
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisdesc009" c="ORIGINAL" lit="9901323" /></b>
                                        </td>
                                        <td class="campocaja" >
                                            <input type="text" readonly class="campowidthinput campo campotexto" name="PCDESC_ORI" id="PCDESC_ORI"  value="${__formdata.PCDESC_ORI}" />
                                        </td>
                                        <td class="campocaja" >
                                            <input type="text" readonly class="campowidthinput campo campotexto" name="TCODIGO_ORIGINAL" id="TCODIGO_ORIGINAL"  value="${__formdata.TCODIGO_ORIGINAL}"  />     
                                        </td>
                                    </tr>           
                                    <tr>  
                                         <!-- Cuadro nuevo -->
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisdesc009" c="NUEVO" lit="9901324" /></b>
                                        </td>
                                        <td class="campocaja"  >                                           
																						<input type="text" name="PCDESC_NUEVO" id="PCDESC_NUEVO"  value="${__formdata.PCDESC_NUEVO}"  
                                                   class="campowidthinput campo campotexto"
                                                   title="<axis:alt f="axisdesc009" c="NUEVO" lit="103465"  />"
                                                   <axis:atr f="axisdesc009" c="PCDESC_NUEVO" a="obligatorio=true&formato=entero"/>/>                                                     
                                        </td>
                                        <td class="campocaja"  >
                                            <input type="text" name="PTDESC_NUEVO" id="PTDESC_NUEVO"  value="${__formdata.PTDESC_NUEVO}"  
                                                   class="campowidthinput campo campotexto"
                                                   title="<axis:alt f="axisdesc009" c="NUEVO" lit="100588"  />"
                                                   <axis:atr f="axisdesc009" c="PTDESC_NUEVO" a="obligatorio=true"/>/>
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
                <c:param name="f">axisdesc009</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
            
        </form>
      <c:import url="../include/mensajes.jsp" />
    </body>
</html>

