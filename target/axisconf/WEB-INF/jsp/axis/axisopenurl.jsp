<%/*Revision:# Uj4SltTrXFj/9jpYUTCsKw== #*/%>
<%/**
*  Fichero: axisopenurl.jsp
*  Lanza una nueva pantalla con una URL
*  @author <a href = "mailto:jboixader@csi-ti.com">Jordi Boixader</a>  
*  Fecha: 23/05/2008
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
        <c:import url="../include/carga_framework_js.jsp" />
		<style type="text/css">
		html, body, form { min-height: 100% ; height: 100%;}
		.visibleDiv
		{
			left: 10px;
			bottom: 10px;
			width: 98%;
			margin-left:auto;
			position: fixed; background-color: #FFFFFF;
		}
</style>
		
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            var formwindow=null;
            function f_onload() {
               f_cargar_propiedades_pantalla();
			   
               <c:if test="${__formdata.CVISTA == '0' }" >
                    var url ='<c:out value="${__formdata.URL}" />';
                    if (url.length > 0){
                        abrirPopUp(url);
                    }               
               </c:if>
			   
			   <c:if test="${__formdata.CVISTA == '1' }" >
                    var url ='<c:out value="${__formdata.URL}" />';
					formwindow=window.open( url, "EXTERNO");
					formwindow.focus();
					f_but_cancelar();
               </c:if>
            }
            function abrirPopUp(url){
                windowopenatts="";
                windowopenatts=windowopenatts+"width="+Math.floor(screen.availWidth*0.95)+","
                windowopenatts=windowopenatts+"height="+Math.floor(screen.availHeight*0.85)+","
                windowopenatts=windowopenatts+"top=1,"
                windowopenatts=windowopenatts+"left=1,"
                windowopenatts=windowopenatts+"menubar=yes,"
                windowopenatts=windowopenatts+"resizable=yes,"
                windowopenatts=windowopenatts+"location=yes,"
                windowopenatts=windowopenatts+"scrollbars=yes,"
                windowopenatts=windowopenatts+"toolbar=yes"
                
                formwindow=window.open( url, "w<%=new java.util.Date().getTime()%>", windowopenatts);
                formwindow.focus()
            }
            function f_onunload() {
                //De momento nada, que si no cierra el popup
                /*if (formwindow!=null) {
                    formwindow.close();
                }
                */
            }
            
            
            function f_but_cancelar() {
                if (objUtiles.estaVacio(objDom.getValorPorId("local")))            
                    objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisformlauncher", "cancelar", document.miForm, "_self");
                else
                   parent.f_cancelar_axisopenurl();                
            }           
           
        </script>
    </head>
    <body onload="f_onload();" onunload="f_onunload();">
        <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
            <input type="hidden" name="local" id="local" value="${__formdata.local}"/> 
            
            <c:choose>
            <c:when test="${__formdata.CVISTA == '1'}">
            </c:when> 
            <c:when test="${__formdata.CVISTA == '2'}">
				<table border="0" class="mainTableDimensions base" style="height:93%;" align="center" cellpadding="0" cellspacing="0">
					<tr><td style="height:100%;width:100%;">
					<div style="height:100%;width:100%;">
						<iframe src="${__formdata.URL}" frameborder="0" style="height:100%;width:100%;"></iframe>
					</div>
					</td></tr>
				</table>
            </c:when>    
            <c:otherwise>
				<c:import url="../include/titulo_nt.jsp">
					<c:param name="formulario"></c:param>
					<c:param name="form">axisopenurl</c:param>
				</c:import>
                <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><span onclick="abrirPopUp('<c:out value="${__formdata.URL}" />')" onmouseover="this.style.cursor='pointer';"><c:out value="${__formdata.URL}" /></span></div>
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
                                                <img src="images/web.jpg" alt="<c:out value="${__formdata.URL}" />"  title="<c:out value="${__formdata.URL}" />" width="400px" height="255px" />
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
            </c:otherwise>
            </c:choose>
            
			<div class="visibleDiv">
				<c:import url="../include/botonera_nt.jsp">
				<c:param name="f">axisopenurl</c:param>
				<c:param name="__botones">cancelar</c:param>
				</c:import>
			</div>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>