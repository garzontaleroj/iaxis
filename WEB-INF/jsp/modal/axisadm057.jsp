<%/*
*  Fichero: axisadm057.jsp
*  @author <a href = "mailto:icanada@csi-ti.com">Ivan Canada</a> 
*
*  Fecha: 12/07/2010
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
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

       function f_but_cancelar() {          
            parent.f_cerrar_axisadm057();
       }
       
       function f_onload(){
       
            var ok = "${__formdata.OK}";            
            
            if ( !objUtiles.estaVacio(ok) && ok == 0){
               parent.f_recarga_datos();
               f_but_cancelar();
            }
       
            f_cargar_propiedades_pantalla();
       }
       
       function f_cargar_propiedades_pantalla(){
                f_cargapropietatexpander();
                f_cargar_valores_defecto();
                objDependencias.modificarPropiedadesSegunModificableYVisible();
                f_carga_dependencias();
                revisarEstilos();
        }

       
       function f_but_aceptar(){
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario ("modal_axisadm057.do", "aceptar", document.axisadm057Form, "_self", objJsMessages.jslit_cargando);
            }
       }       
       
        
    </script>
  </head>
    <body onload="f_onload()" class=" ">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="f">axisadm057</c:param>
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="axisadm057Form" action="" method="POST">
            <input type="hidden" name="operation" value="">
            <input type="hidden" name="CMODO" value="${__formdata.CMODO}">    
            <input type="hidden" name="CEMPRES" value="${__formdata.CEMPRES}">    

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><fmt:message key="9901473" /></c:param>                
                <c:param name="form">axisadm057</c:param>
            </c:import>
            
            
            <!-- Area de campos  -->
            <div class="separador">&nbsp;</div>
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">    
                        <tr>
                            <td align="left" >
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:30%;height:0px"></th>
                                        <th style="width:30%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:40%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisadm057" c="PINTFUT"> 
                                            <td class="titulocaja" ><%-- Porcentaje Interes --%>
                                                <b><axis:alt f="axisadm057" c="PINTFUT" lit="9901468"></axis:alt></b>                                 
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm057" c="PCREDIBI"> 
                                            <td class="titulocaja" ><%-- Porcentaje de Credibilidad --%>
                                                <b><axis:alt f="axisadm057" c="PCREDIBI" lit="9901469"></axis:alt></b>                                 
                                            </td>
                                        </axis:ocultar>
                                    </tr>    
                                    <tr>    
                                        <%-- Interes Futuro --%>
                                        <axis:ocultar f="axisadm057" c="PINTFUT"> 
                                            <td class="campocaja">
                                                <input type="text" class="campo campotexto" id="PINTFUT" name="PINTFUT" size="20" style="width:40%" obligatorio = "true"
                                                                   alt="<fmt:message key="9901468"/>" title="<fmt:message key="9901468"/>"
                                                                   value="<fmt:formatNumber pattern='###,##0.00' value='${__formdata.PINTFUT}'/>"/>                                                        
                                            </td>
                                        </axis:ocultar>
                                         <%-- Porcentaje Credibilidad --%>
                                        <axis:ocultar f="axisadm057" c="PCREDIBI"> 
                                            <td class="campocaja">
                                                <input type="text" class="campo campotexto" id="PCREDIBI" name="PCREDIBI" size="20" style="width:40%" obligatorio = "true"
                                                                   alt="<fmt:message key="9901469"/>" title="<fmt:message key="9901469"/>"
                                                                   value="<fmt:formatNumber pattern='###,##0.00' value='${__formdata.PCREDIBI}'/>"/>                                                        
                                            </td>
                                        </axis:ocultar>   
                                    </tr>      
                                     <tr>                                  
                                        <td class="titulocaja" colspan="2"><!-- CRITERIOS -->
                                                 <b><axis:alt f="axisadm054" c="TCRITERIO" lit="9901472"></axis:alt></b>                                 
                                        </td>                            
                                    </tr>
                                    <tr>
                                        <td colspan="2">  
                                            <textarea class="campo" name="TCRITERIO" rows="2" cols="50" 
                                             alt="<fmt:message key="9901472"/>" title="<fmt:message key="9901472"/>"
                                            obligatorio="true" style="wdith:99%" <axis:atr f="axisadm057" c="TCRITERIO" a="obligatorio=true"/>> </textarea>                                      
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
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>            
           
            
        </form>
      <c:import url="../include/mensajes.jsp" />
    </body>
</html>

