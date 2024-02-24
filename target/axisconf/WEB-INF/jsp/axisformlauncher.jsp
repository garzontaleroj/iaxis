<%/*Revision:# PuGJU0W7sO4UVuKoUXYs5A== #*/%>
<%/**
*  Fichero: axisformlauncher.jsp
*  Pantalla con ORACLE Splash y que lanza en window nuevo el form solicitado
*  Incluye nuevo formato con títulos en la parte superior
*  @author <a href = "mailto:echristen@csi-ti.com">Elmar Christen</a>  
*  Fecha: 08/05/2008
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="./include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            var formwindow=null;
            function f_onload() {
				var form_act = "${__formdata.FORM_ACT}";
				if(form_act.indexOf("_adf") >= 0){
					formwindow=window.open( "formlauncher.do?operation=launch&form_act=${__formdata.FORM_ACT}&dt=<%=new java.util.Date().getTime()%>", "_blank");
					formwindow.focus();
					f_but_cancelar();
					}
				else
				{
					windowopenatts="";
					windowopenatts=windowopenatts+"width="+ screen.availWidth+","
					windowopenatts=windowopenatts+"heigh=:"+ screen.availHeight+","
					windowopenatts=windowopenatts+"top=0,"
					windowopenatts=windowopenatts+"left=0,"
					windowopenatts=windowopenatts+"menubar=no"
					formwindow=window.open( "formlauncher.do?operation=launch&form_act=${__formdata.FORM_ACT}&dt=<%=new java.util.Date().getTime()%>", "FORMWINDOW", windowopenatts);
					formwindow.focus();
				}
			}
            function f_onunload() {
                //De momento nada, que si no cierra el popup
                /*if (formwindow!=null) {
                    formwindow.close();
                }
                */
            }
            
            
            function f_but_cancelar() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisformlauncher", "cancelar", document.miForm, "_self");
            }           
            
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/
            
            // TODO Implementar CallBack Ajax

  
            
        </script>
    </head>
    <body  onload="f_onload()" onunload="f_onunload()">
        <c:import url="./include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
            
            <c:import url="./include/titulo_nt.jsp">
                <c:param name="formulario">ORACLE FORM LAUNCHER</c:param>
                <c:param name="form">axisformlauncher</c:param>
            </c:import>
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/> ${__formdata.FORM_ACT}</div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 2 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <tr>
                                            <th style="width:100%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td class="campocaja" style="text-align:center">
                                                <img src="images/oracleformssplash.png" alt="Orcale FORM" title="Orcacle FORM" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table> 
                    </td>
                </tr>
            </table>
             <div class="separador">&nbsp;</div>
            <c:import url="./include/botonera_nt.jsp"><c:param name="__botones">cancelar</c:param></c:import>
        </form>
        <c:import url="./include/mensajes.jsp" />
    </body>
</html>