<%/* Revision:# zaAUDbL67h1nLCBJ7aXpFw== # */%>
<%/*
*  Fichero: axisctr014.jsp
*
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavi Gallego</a>
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*
*
*  Fecha: 14/11/2007
*/
%>

<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"></style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">
            
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
        	 <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
							retocarPAGE_CSS('axisctr014');
					</c:if>                                        
            f_cargar_propiedades_pantalla(); 
            document.miForm.CAGENTE.focus();
            // Retocar tabla en IE
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
            
            if (document.getElementById("TSUCURSAL").value == 0)
                objUtiles.toggleColumna("miListaId",4,0);                
                
        }
        
     
        
        function f_but_aceptar() {
            if(typeof document.miForm.seleccionaAgente == 'undefined' || typeof document.miForm.seleccionaAgente == 'null')
                alert(objJsMessages.jslit_busca_primero_agente);
            else{
                var hayChecked = objUtiles.f_GuardaCasillasChecked ("seleccionaAgente");
                if (!hayChecked) 
                    alert(objJsMessages.jslit_selecciona_de_lista_agente);
                else 
                    f_seleccionar_agente(hayChecked);
            }
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axisctr014();
        }        
        
        function f_but_buscar() {
            //Si la validación es correcta, ejecutamos la acción
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisctr014.do", "busqueda_agente", document.miForm, "_self", objJsMessages.jslit_buscando_agentes);
            }
        }
         
        function f_seleccionar_agente(CODI){
            if (objUtiles.estaVacio(CODI))
                alert (objJsMessages.jslit_error_de_seleccion);
            else{
                parent.f_aceptar_axisctr014 (CODI);
            }
         }
    </script>
  </head>
  
    <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    	<div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" id="TSUCURSAL" name="TSUCURSAL" value="${__formdata.TSUCURSAL}"/> 
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario">
                <% if(request.getAttribute("lit_producto") != null){ %>
                	 <axis:alt c="formulario" f="axisctr014" lit="9000508" /> ${lit_producto}
                <% } else{ %>
                	
                	<axis:alt c="formulario" f="axisctr014" lit="1000062" />
                <% } %>
                </c:param>
                
                <c:param name="producto">
                <% if(request.getAttribute("lit_producto") != null){ %>
                	 <axis:alt c="formulario" f="axisctr014" lit="9000508" /> ${lit_producto}
                <% } else{ %>
                	
                	<axis:alt c="formulario" f="axisctr014" lit="1000062" />
                <% } %>
                </c:param>
                
                <c:param name="form">axisctr014</c:param>
            </c:import>
            
            <input type="hidden" id="CONDICION" name="CONDICION" value="${__formdata.CONDICION}"/> 
            <input type="hidden" id="PARTNER" name="PARTNER" value="${__formdata.PARTNER}"/> 
            
            <input type="hidden" id="lit_producto" name="lit_producto" value="${lit_producto}"/> 
            
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
               
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:15%;height:0%;"/>
                                <th style="width:65%;height:0%;"/>
                                <th style="width:20%;height:0%;"/>
                            </tr>
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt c="CAGENTE" f="axisctr014" lit="1000109" /></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt c="TNOMBRE" f="axisctr014" lit="105940" /></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt c="NNUMNIF" f="axisctr014" lit="105330" /></b>
                                </td>
                            </tr>
                            <tr>
                                 <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata['CAGENTE']}" formato="entero" name="CAGENTE" id="CAGENTE" 
                                    style="width:90%" title="<axis:alt c="CAGENTE" f="axisctr014" lit="9000531"/>"<axis:atr f="axisctr014" c="CAGENTE" />/> 
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata['NOMBRE']}" name="NOMBRE" id="NOMBRE" size="15"
                                    style="width:97%" title="<axis:alt c="NOMBRE" f="axisctr014" lit="105940"/>"/>
                                </td>
                                 <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata['NNUMIDE']}" name="NNUMIDE" id="NNUMIDE"
                                    style="width:90%" title="<axis:alt c="NNUMNIF" f="axisctr014" lit="105330"/>" />
                                </td>
                            </tr>
                            <axis:visible f="axisctr014" c="TIPAGE">
                             <tr>
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axisctr014" c="TIP_AGENTE" lit="9000519"/></b> <%-- Tipo Agente --%>
                                    </td>
                            </tr>
                             <tr>
                                 <td class="campocaja" colspan="2">                                
                                            <select name="TIPAGENTE" id="TIPAGENTE" size="1" class="campowidthselect campo campotexto" style="width:79%;">&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr014" c="SELECC" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.LISTVALORES.LSTTIPOAGENTE}">
                                                    <option value = "${element.CATRIBU}"
                                                    <c:if test="${__formdata.TIPAGENTE == element.CATRIBU}"> selected = "selected"</c:if>>
                                                        ${element.TATRIBU} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                            </tr>
                            </axis:visible>
                        </table>

                        <div class="separador">&nbsp;</div>
                        <!-- DisplayTag Agentes -->
                        <c:set var="title0"><axis:alt c="NNUMIDE" f="axisctr014" lit="105330"/></c:set>
                        <c:set var="title1"><axis:alt c="TNOMBRE" f="axisctr014" lit="105940"/></c:set>
                        <c:set var="title2"><axis:alt c="CODI_CAGENTE" f="axisctr014" lit="1000109"/></c:set>
                        <c:set var="title3"><axis:alt c="TSUCURSAL" f="axisctr014" lit="9002202"/></c:set>
                        <div class="seccion displayspaceGrande">
                            <display:table name="${sessionScope.axisctr014_listaAgentes}" id="miListaId" export="false" class="dsptgtable" pagesize="8" defaultsort="1" defaultorder="ascending" requestURI="modal_axisctr014.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                    <div class="dspIcons"><input type="radio" id="seleccionaAgente" name="seleccionaAgente" value="${miListaId['CODI']}"/></div>
                                </display:column>
                                 <display:column title="${title2}" sortable="true" sortProperty="CODI" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                    <div class="dspNumber">${miListaId['CODI']}</div>
                                </display:column>                                
                                <display:column title="${title0}" sortable="true" sortProperty="NNUMIDE" headerClass="headwidth20 sortable"  media="html" autolink="false" >
                                    <div class="dspNumber">${miListaId['NNUMIDE']}</div>
                                </display:column>
                                <display:column title="${title1}" sortable="true" sortProperty="NOMBRE" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText"><a href="javascript:f_seleccionar_agente('${miListaId['CODI']}')">${miListaId['NOMBRE']}</a></div>
                                </display:column>
                                <axis:visible c="TSUCURSAL" f="axisctr014">
                                    <display:column title="${title3}" sortable="true" sortProperty="TSUCURSAL" headerClass="sortable"  media="html" autolink="false">
                                        <div class="dspText">${miListaId['TSUCURSAL']}</div>
                                    </display:column>
                                </axis:visible>
                            </display:table>
                        
                            <c:choose>
                            <c:when test="${!empty sessionScope.axisctr014_listaAgentes &&  !(fn:containsIgnoreCase(header['User-Agent'],'ipad') )}">
                                <script language="javascript">objUtiles.retocarDsptagtable("miListaId");</script>
                            </c:when>
                            <c:otherwise>
                            	 <c:if test="${!(fn:containsIgnoreCase(header['User-Agent'],'ipad') )}">
                                <script language="javascript">
                                   objLista.esconderListaSpans();
                                   objLista.esconderListaLinks();     
                                </script>
                              </c:if>
                            </c:otherwise>
                            </c:choose>
                        </div>
                    </td>
                </tr>
            </table>
            <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisctr014</c:param>        
                <c:param name="__botones">cancelar,buscar,aceptar</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
        </div>
    </body>
</html>