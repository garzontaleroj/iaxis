<%-- 
* Fichero: axisctr511.jsp 
* @author <a href = "mailto:jaesteban@csi-ti.com">Johan Esteban</a> * 
* Fecha: 22/09/2016*
/--%>
<%@ page contentType="text/html;charset=UTF-8" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<html>
    <head>
        <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
        <%-- Especial per controlar els scroll amb iPad--%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet"
              media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)"/>
        <style type="text/css" id="page-css">
            </style>
        <%-- FI Especial per controlar els scroll amb iPad--%>
        <c:import url="../include/carga_framework_js.jsp"/>
        <script language="Javascript" type="text/javascript">
          /****************************************************************************************/
          /*********************************** NAVEGACION *****************************************/

          /****************************************************************************************/
          function f_onload_axisctr511() {

             f_cargar_propiedades_pantalla();
             
          }



          function f_but_cancelar() {
              parent.f_cerrar_axisctr511();
          }
        </script>
    </head>
    
    <body onload="f_onload_axisctr511()">
        <div id="wrapper" class="wrapper">
            <c:import url="../include/precargador_ajax.jsp">
                <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
            </c:import>
             
            <form name="axisctr511Form" action="" method="POST">
                <input type="hidden" id = "operation" name="operation" value=""/>
                
                <c:import url="../include/titulo_nt.jsp">
                    <c:param name="formulario">
                        <axis:alt f="axisctr511" c="titulos" lit="89908096" />
                    </c:param>
                    <c:param name="producto">
                        <axis:alt f="axisctr511" c="titulos" lit="89908095" />
                    </c:param> 
                    <c:param name="form">axisctr511</c:param>
                </c:import>
                
                <!-- Area de campos  -->
                <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0"
                       style="height:130px">
                    <div class="separador">&nbsp;</div>
                   <div class="separador">&nbsp;</div>
                    
                    
                    <tr>
                        <td>
                        <div class="titulo">
	                        <div style="float: left">
								<img src="images/flecha.gif" />
								<axis:alt f="axisctr511" c="titulos" lit="1000102" />
							</div>
                        </div>
                        
                        
                            <!-- DisplayTag tomadores -->
                            <c:set var="title0"><axis:alt f="axisctr511" c="TOMADOR" lit="9908119"/></c:set>
                            <c:set var="title1"><axis:alt f="axisctr511" c="CUMULO" lit="89908093"/></c:set>
                            <c:set var="title2"><axis:alt f="axisctr511" c="CUPO" lit="9909108"/></c:set>
                            <c:set var="title3"><axis:alt f="axisctr511" c="CALIFICACION" lit="89908092"/></c:set>
                            <c:set var="title4"><axis:alt f="axisctr511" c="ID" lit="9904434"/></c:set>
                            
                            <div class="separador">&nbsp;</div>
                            <div class="displayspace">
                                <display:table name="${sessionScope.TOMADOR}" id="TOMADOR" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                 requestURI="axis_${pantalla}.do?paginar=true">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    
                                    <display:column title="${title4}" sortable="true" sortProperty="SCLABEN" headerClass="headwidth11 sortable"  media="html" autolink="false" >
                                        <div class="dspNumber">
											${TOMADOR.NIT}
										</div>
                                    </display:column>
                                    
                                    <display:column title="${title0}" sortable="true" sortProperty="SCLABEN" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText">
											${TOMADOR.NOMBRE}
										</div>
                                    </display:column>
                                   
                                    <display:column title="${title1}" sortable="true" sortProperty="TCLABEN" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspNumber">
                                        	${TOMADOR.CUMULO}
                                        </div>
                                    </display:column>
                                    
                                    <display:column title="${title2}" sortable="true" sortProperty="TCLABEN" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspNumber">
                                        	${TOMADOR.CUPO}
                                        </div>
                                    </display:column>
                                    
                                    <display:column title="${title3}" sortable="true" sortProperty="CALIFICACION" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">
                                        <c:choose>
                                        	<c:when test="${TOMADOR.DIAS >= 90}">
                                        		Alta(Información CIFIN desactualizada)
                                        	</c:when> 
                                        	<c:when test="${TOMADOR.DIAS == NULL}">
                                        		Alta(sin Información CIFIN )
                                        	</c:when> 
                                        	<c:otherwise>
                                        		${TOMADOR.CALIFICACION}
                                        	</c:otherwise>
                                        </c:choose>	
                                        </div>
                                    </display:column>
                                    
                                </display:table>
                            </div>
                            <div class="separador">&nbsp;</div>
                        </td>
                    </tr>
                    
                  
                    
                    
                    <tr>
                        <td>
                        <div class="separador">&nbsp;</div>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
	                        <div style="float: left">
								<img src="images/flecha.gif" />
								<axis:alt f="axisctr511" c="titulos" lit="89908094" />
							</div>
						</div>
                            <!-- DisplayTag codeudores -->
                            <c:set var="title0"><axis:alt f="axisctr511" c="CODEUDOR" lit="9909291"/></c:set>
                            <c:set var="title1"><axis:alt f="axisctr511" c="CUMULO" lit="89908093"/></c:set>
                            <c:set var="title2"><axis:alt f="axisctr511" c="CUPO" lit="9909108"/></c:set>
                            <c:set var="title3"><axis:alt f="axisctr511" c="CALIFICACION" lit="89908092"/></c:set>
                            <c:set var="title4"><axis:alt f="axisctr511" c="ID" lit="9904434"/></c:set>
                            
                            <div class="separador">&nbsp;</div>
                            <div class="displayspace">
                                <display:table name="${sessionScope.CODEUDORES}" id="CODEUDOR" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                 requestURI="axis_${pantalla}.do?paginar=true">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    
                                    <display:column title="${title4}" sortable="true" sortProperty="SCLABEN" headerClass="headwidth11 sortable"  media="html" autolink="false" >
                                        <div class="dspNumber">
											${CODEUDOR.NNUMIDE}
										</div>
                                    </display:column>
                                    
                                    <display:column title="${title0}" sortable="true" sortProperty="SCLABEN" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText">
											${CODEUDOR.NOMBRE}
										</div>
                                    </display:column>
                                   
                                    <display:column title="${title1}" sortable="true" sortProperty="TCLABEN" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspNumber">
                                        	${CODEUDOR.CUMULO}
                                        </div>
                                    </display:column>
                                    
                                    <display:column title="${title2}" sortable="true" sortProperty="TCLABEN" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspNumber">
                                        	${CODEUDOR.CUPO}
                                        </div>
                                    </display:column>
                                    
                                    <display:column title="${title3}" sortable="true" sortProperty="CALIFICACION" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">
	                                        <c:choose>
	                                        	<c:when test="${CODEUDOR.DIAS >= 90}">
	                                        		Alta(Información CIFIN desactualizada)
	                                        	</c:when> 
	                                        	<c:when test="${CODEUDOR.DIAS == NULL}">
	                                        		Alta(sin Información CIFIN )
	                                        	</c:when> 
	                                        	<c:otherwise>
	                                        		${CODEUDOR.CALIFICACION}
	                                        	</c:otherwise>
	                                        </c:choose>
                                        </div>
                                    </display:column>
                                    
                                </display:table>
                            </div>
                            <div class="separador">&nbsp;</div>
                        </td>
                    </tr>  
                    
                    
                </table>
                <c:import url="../include/botonera_nt.jsp">
                    <c:param name="f">axisctr511</c:param>
                    <c:param name="__botones">cancelar
                    </c:param>
                </c:import>
            </form>             
            <c:import url="../include/mensajes.jsp"/>
        </div>
    </body>
</html>