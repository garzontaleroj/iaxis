<%
/**
*  Fichero: Axis Firma Digital - axisctr186.jsp
*  Fecha: 28/06/2012
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@page import="com.lowagie.text.*" %>
<%@page import="com.lowagie.text.pdf.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.lang.*" %>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<%-- DECLARACION VARS JAVA SERVERS --%> 
<%

int imageViewContainerWidth=400; 
int imageViewContainerHeight=200;

boolean hayQueFirmar=false;
String textRst=request.getParameter("textRst");
if (textRst!=null && textRst.trim().length()>0) {
	//hay que firmar!!!
	hayQueFirmar=true;
}
%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>


<html>
  <head>
    <!-- import archivos estilos/js -->  
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>

    <script type="text/javascript" src="scripts/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="scripts/jquery.import_js.js"></script>
    <script type="text/javascript" src="scripts/jquery.cookie.js"></script>
    <script type="text/javascript" src="scripts/jquery.jscrollpane.js"></script>
    <script type="text/javascript" src="scripts/jquery.mousewheel.js"></script>
    <script type="text/javascript" src="scripts/jquery.treeview-1.5pre.js"></script>
    <script type="text/javascript" src="scripts/jquery.ipad_html5drawing.js"></script>

      
    <!-- Código javascript -->
    <script language="Javascript" type="text/javascript">
    	var BRUSH_PRESSURE_Q=0.01;
    	var CANVAS_YOFFSET_Q=-90;
    	var CANVAS_XOFFSET_Q=-40;
    	var BRUSH_LINEWIDTH_Q=1;

function f_but_borrar() {
  var canvas = document.getElementById('imageView');
  var context = canvas.getContext('2d');   
	context.clearRect ( 0 , 0 , canvas.width , canvas.height ); 
}
    
        function f_onload() {    
            <c:if test="${RESOK==0}">
              alert("<axis:alt f="axisctr186" c="RESULTADO_OK" lit="109904"/>");
              f_but_cancelar() ;
            </c:if>
            f_cargar_propiedades_pantalla();
        }
                
        function f_but_aceptar() {
            try{
                var canvas = document.getElementById('imageView');
                var context = canvas.getContext('2d');   
                var dataURL = canvas.toDataURL("image/jpg");
                var pp = document.getElementById('textRst');
                document.miForm.FIRMAB64.value=pp;
                pp.value=dataURL.replace(/^data:image\/(png|jpg);base64,/, "");
                document.miForm.submit();
                
            }catch (e){
                alert("<axis:alt f="axisctr186" c="USO_CHROME_ERROR_1" lit="9903889"/>. <axis:alt f="axisctr186" c="USO_CHROME_ERROR_2" lit="9903925"/>");
            }
        }
       
        function f_but_cancelar() {
            parent.f_cerrar_axisctr186();
        }      

        
        function f_but_salir() {
            parent.f_cerrar_axisctr186();
        } 
        
      
        
    </script>
    
<style type="text/css">
<!--
#imageViewContainer{position:relative;}
#imageView{ border: 1px solid #000;}		
-->
</style> 
    

  </head>
     <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="modal_axisctr186.do" method="POST">
            <input type="hidden" id="operation" name="operation" value="aceptar"/>
            <input type="hidden" id="IDDOC" name="IDDOC" value="${__formdata.IDDOC}"/>
            <input type="hidden" id="TFICHERO" name="TFICHERO" value="${__formdata.FICHERO}"/>
            <input type="hidden" id="TCONFIRMA" name="TCONFIRMA" value="${__formdata.TCONFIRMA}"/>
            <input type="hidden" id="CCODPLAN" name="CCODPLAN" value="${__formdata.CCODPLAN}"/>
            <input type="hidden" id="FIRMAB64" name="FIRMAB64" value="" />

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisctr186" c="FIRMA" lit="9903322" /></c:param>
                <c:param name="producto"></c:param>
                <c:param name="form">axisctr186</c:param>
            </c:import>


            <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                
                    <div class="titulo">
                        <img src="images/flecha.gif"/><axis:alt f="axisctr186" c="cam_dades_dev" lit="9903322" />
                    </div>
                    <table class="seccion" >
                      <tr>
                        <td>
                          <table class="area" align="center">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            
                            <!-- Seleccionar el navegador utilizado -->

                            <tr>
                            				<td class="titulocaja" colspan="4">
																			<c:choose>
																				<c:when test="${fn:containsIgnoreCase(header['User-Agent'],'ipad')}">
																					<div id="imageViewContainer"><canvas id="imageView" width="<%=imageViewContainerWidth%>" height="<%=imageViewContainerHeight%>"></canvas></div>
																					<script type="text/javascript">
																						//Configuracion deseado por el cliente. Cualquier cambio de estos valores implica el uso de CFGs, con estos valores por defecto
																						BRUSH_PRESSURE_Q=1.0;
																						CANVAS_YOFFSET_Q=-72;
																						CANVAS_XOFFSET_Q=-45;
																						BRUSH_LINEWIDTH_Q=3;
																					</script>
																					<script type="text/javascript" src="scripts/ipad_html5drawing.js"></script>
																				</c:when>
																				<c:otherwise>
																					<div id="imageViewContainer"><canvas id="imageView" width="<%=imageViewContainerWidth%>" height="<%=imageViewContainerHeight%>"></canvas></div>
																					<script type="text/javascript">
																						//Configuracion deseado por el cliente. Cualquier cambio de estos valores implica el uso de CFGs, con estos valores por defecto
																						BRUSH_PRESSURE_Q=1.0;
																						CANVAS_YOFFSET_Q=-90;
																						CANVAS_XOFFSET_Q=-40;
																						BRUSH_LINEWIDTH_Q=2;
																					</script>
																					<script type="text/javascript" src="scripts/opera_html5drawing.js"></script>
																				</c:otherwise>
																			</c:choose>
                                  	</td>
                                </tr>    

                          
																<tr>
																	<td class="titulocaja" colspan="4">
																		<b><axis:alt f="axisctr186" c="PDF" lit="9903328"/>:</b>
																	</td>
																</tr>
                                <tr>
																<td class="campocaja" colspan="4">
																	<c:set var="cadena">${__formdata.FICHERO}</c:set>   
																	<c:set var="charbad">\</c:set>      
																	<input class="campo" style="width:300px" type="text" name="PDFsinFirma" id="PDFsinFirma" value="${cadena}" />
																	</td>
																</tr>
                                <tr>
																	<td class="campocaja" align="left" colspan="2">
																		<input class="boton" id="but_borrar" name="but_borrar" type="button" value="<axis:alt f="axisctr186" c="BUT_BORRAR" lit="9001333"/>" onclick="f_but_borrar()" />
																	</td>
																	<td class="campocaja" align="right" colspan="2">
																		<input class="campo"  style="width:120px" type="hidden" id="textRst" name="textRst" readonly value="${__formdata.textRst}"/>
																		<input class="boton" id="but_firma" name="but_firma" type="button" value="<axis:alt f="axisctr186" c="BUT_FIRMAR" lit="9903656"/>" onclick="f_but_aceptar()" />
																	</td>
																</tr>  
                           </table>
                         </td>
                      </tr>
                     </table>
                </td>
            </tr>

            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr186</c:param><c:param name="__botones">salir</c:param></c:import>
    </form>      
    <c:import url="../include/mensajes.jsp" />
    
    </body>
</html>

