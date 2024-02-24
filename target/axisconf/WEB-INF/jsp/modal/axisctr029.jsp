<%/*
*  Fichero: axisctr029.jsp
*
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*
*  Fecha: 28/02/2007
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
       <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>    
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">
        function f_onload() {
        	<c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
								retocarPAGE_CSS('axisctr029');
							</c:if>
            // Retocar tabla en IE
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
                
            // Seleccionaremos el primero
            if (objUtiles.estaVacio(document.miForm.radioAsegurado.length)) {
                document.miForm.radioAsegurado.checked = true;
                document.miForm.radioAsegurado.onclick();
            } else {
                document.miForm.radioAsegurado[0].checked = true;            
                document.miForm.radioAsegurado[0].onclick();
            }     
            f_cargar_propiedades_pantalla();
        }
        
        function f_but_cerrar() {
            parent.f_cerrar_axisctr029();
        }
        function f_actualiza_campos_asegurado (TTIPIDE, NNUMIDE, NOMBRE, TSEXPER, FNACIMI) {
            document.miForm.TTIPIDE.value = TTIPIDE;
            document.miForm.NNUMIDE.value = NNUMIDE;
            document.miForm.NOMBRE.value  = NOMBRE;
            document.miForm.TSEXPER.value = TSEXPER;
            document.miForm.FNACIMI.value = objUtiles.formateaTimeStamp2(FNACIMI);
        }
        
    </script>
  </head>
    <body onload="f_onload()">
        <div id="wrapper" class="wrapper">
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario">
                    <axis:alt f="axisctr029" c="LIT_PANTALLA" lit="1000195"/>
                </c:param>
                <c:param name="producto">
                    <axis:alt f="axisctr029" c="LIT_PANTALLA" lit="1000195"/>
                </c:param>
                <c:param name="form">axisctr029</c:param>
            </c:import>

            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">
                            <tr>
                                <td align="left">
                                    <div class="displayspace">
                                         <c:set var="title0">
                                            <axis:alt f="axisctr029" c="TIT_ASEGURADOS" lit="108228"/>
                                         </c:set>
                                         
                                         <display:table name="${__formdata.T_IAX_PERSONAS}" id="T_IAX_PERSONAS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="modal_axisctr029.do?paginar=true"> 
                                           <%@ include file="../include/displaytag.jsp"%>
                                           <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                               <div class="dspIcons"><input type="radio" id="radioAsegurado" name="radioAsegurado" onclick="f_actualiza_campos_asegurado('${T_IAX_PERSONAS.OB_IAX_PERSONAS.TTIPIDE}', '${T_IAX_PERSONAS.OB_IAX_PERSONAS.NNUMIDE}', '${T_IAX_PERSONAS.OB_IAX_PERSONAS.TNOMBRE} ${T_IAX_PERSONAS.OB_IAX_PERSONAS.TAPELLI1} ${T_IAX_PERSONAS.OB_IAX_PERSONAS.TAPELLI2}', '${T_IAX_PERSONAS.OB_IAX_PERSONAS.TSEXPER}', '${T_IAX_PERSONAS.OB_IAX_PERSONAS.FNACIMI}')"/></div>
                                           </display:column>
                                           <display:column title="${title0}" sortable="true" sortProperty="NRIESGO" headerClass="sortable"  media="html" autolink="false" >
                                               <div class="dspText">${T_IAX_PERSONAS.OB_IAX_PERSONAS.TTIPIDE}: ${T_IAX_PERSONAS.OB_IAX_PERSONAS.NNUMIDE} - ${T_IAX_PERSONAS.OB_IAX_PERSONAS.TAPELLI1} ${T_IAX_PERSONAS.OB_IAX_PERSONAS.TAPELLI2}, ${T_IAX_PERSONAS.OB_IAX_PERSONAS.TNOMBRE}</div>                          
                                           </display:column>
                                        </display:table>
                                   </div>                                            
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td >
                    <table class="seccion">
                        <tr>
                            <td align="left">
                               <table class="area" align="center">
                                    <tr>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                    </tr>
                                    <tr>                   
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr029" c="TTIPIDE" lit="150996"/></b>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr029" c="NNUMIDE" lit="105330"/></b>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr029" c="NOMBRE" lit="105940"/></b>
                                        </td>
                                    </tr>
                                    <tr>                   
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" id="TTIPIDE" name="TTIPIDE" size="15"
                                            value="" readonly="true" />
                                        </td>                    
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" id="NNUMIDE" name="NNUMIDE" size="15"
                                            value="" readonly="true" />
                                        </td>
                                        <td class="campocaja" colspan="2">
                                            <input type="text" class="campowidthinput campo campotexto" id="NOMBRE" name="NOMBRE" size="15"
                                            value="" readonly="true" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr029" c="TSEXPER" lit="100962"/></b>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr029" c="FNACIMI" lit="1000064"/></b>
                                        </td>
                                    </tr>
                                    <tr>
                                         <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" id="TSEXPER" name="TSEXPER" size="15"
                                            value="" readonly="true" />
                                        </td>                    
                                         <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" id="FNACIMI" name="FNACIMI" size="15"
                                            value="" readonly="true" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    </td>
                </tr>
            </table>

            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr029</c:param>
                <c:param name="__botones">cerrar</c:param>
            </c:import>
            <c:import url="../include/mensajes.jsp" />
        </form>
      </div>
    </body>
</html>
            