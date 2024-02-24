<%
/*
*  Fichero: axisusu009.jsp
*  @author <a href = "mailto:mnustes@csi-ti.com">Marlon Nustes</a> 
*  Fecha: 01/10/2015
*/
%>

<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css"/>
        <%-- Especial para controlar los scroll con iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
        <%-- Especial para controlar los scroll con iPad --%>
        <c:import url="../include/carga_framework_js.jsp" />
        
        <script language="Javascript" type="text/javascript">
            function f_onload() {
                if (document.all) // ES Explorer
                    document.getElementById("tabla1").style.marginLeft="1.3%";
                f_cargar_propiedades_pantalla();
            }
            
            function f_but_cancelar() {
                parent.f_cerrar_modal("axisusu009");
            }
            
            function f_but_buscar() {
                if (objValidador.validaEntrada()) {
                    objUtiles.ejecutarFormulario("modal_axisusu009.do", "busqueda", document.miForm, "_self", objJsMessages.jslit_cargando);   
                }
            }
            
            function f_but_aceptar() {
            
                if(objUtiles.estaVacio(document.miForm.seleccionaLinea))
                    alert(objJsMessages.jslit_selecciona_registro);
                else{
                    var hayChecked = objUtiles.f_GuardaCasillasChecked ("seleccionaLinea");
    
                    if(typeof hayChecked == 'boolean') 
                        alert(objJsMessages.jslit_selecciona_registro);
                    else {
                        seleccionaRegistro(hayChecked);
                    }
                }
            }
            
            function seleccionaRegistro (PCUSUARI) {
                if (objUtiles.estaVacio(PCUSUARI))
                    alert (objJsMessages.jslit_selecciona_registro);
                else{
                    parent.f_aceptar_axisusu009(PCUSUARI);                
                }
            }
            
        </script>
    </head>
    <body onload="f_onload();">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisusu009|axisusu009</c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            
            <input type="hidden" name="operation" value=""/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisusu009" c="FORM" lit="9000589" /></c:param>
                <c:param name="producto"><axis:alt f="axisusu009" c="FORM" lit="9000589" /></c:param>
                <c:param name="form">axisusu009</c:param>
            </c:import>
            
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:10px;">
            <tr>
            <td>
                <div class="separador">&nbsp;</div>
                <div class="titulo">
                    <img src="images/flecha.gif"/>
                    <b><axis:alt f="axisusu009" c="LIT32" lit="1000104"/></b>
                </div>
                <table class="seccion" >
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
                        <axis:ocultar f="axisusu009" c="CUSUARIO" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axisusu009" c="CUSUARIO" lit="9905097"/></b>
                        </td>                                            
                        </axis:ocultar>
                        
                        <axis:ocultar f="axisusu009" c="CNOMUSUARIO" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axisusu009" c="CNOMUSUARIO" lit="101995"/></b>
                        </td>                                            
                        </axis:ocultar>                                                          
                    </tr>
                    <tr>
                        <axis:visible f="axisusu009" c="CUSUARIO">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.CUSUARIO}" name="CUSUARIO" id="CUSUARIO" size="10" <axis:atr f="axisusu009" c="CUSUARIO" a="obligatorio=false"/>/>
                        </td>
                        </axis:visible>  
                        
                        <axis:visible f="axisusu009" c="CNOMUSUARIO">
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CNOMUSUARIO}" name="CNOMUSUARIO" id="CNOMUSUARIO" size="10" />
                        </td>
                        </axis:visible>               
                    </tr>
                </table>
                </td>                        
                </tr>
                </table>
                <div class="separador">&nbsp;</div>
                
                <c:set var="title0"><axis:alt f="axisusu009" c="TTCPOSTAL" lit="9905097"/></c:set>
                <c:set var="title1"><axis:alt f="axisusu009" c="TTCPAIS" lit="101995"/></c:set>
                <c:set var="title2"><axis:alt f="axisusu009" c="TTCPROVIN" lit="1000561"/></c:set>
                
                <div class="seccion displayspacePersonas"> 
                <display:table name="${sessionScope.T_IAX_USERS}"
                    id="miListaId" export="false"
                    class="dsptgtable" pagesize="15"
                    defaultsort="1"
                    defaultorder="ascending"
                    sort="list" cellpadding="0"
                    cellspacing="0"
                    requestURI="modal_axisusu009.do?paginar=true">               
                
                <%@ include file="../include/displaytag.jsp"%>
                
                <display:column title="" 
                    sortable="false" 
                    headerClass="headwidth5 sortable"  
                    media="html" autolink="false">    
                    <div class="dspIcons">
                    <input  type="radio" id="seleccionaLinea" name="seleccionaLinea" value="${miListaId.OB_IAX_USERS.CUSUARI}"/>
                    </div>
                </display:column>
                
                <display:column title="${title0}"
                    sortable="true"
                    sortProperty="OB_IAX_USERS.CUSUARI"
                    headerClass="sortable fixed"
                    media="html" autolink="false">
                    <div class="dspText">
                    <a href='javascript:seleccionaRegistro("${miListaId.OB_IAX_USERS.CUSUARI}")'>${miListaId.OB_IAX_USERS.CUSUARI}</a>                    
                    </div>                
                </display:column>
                
                <display:column title="${title1}"
                    sortable="true"
                    sortProperty="OB_IAX_USERS.NOMBRE"
                    headerClass="sortable fixed"
                    media="html" autolink="false">
                    <div class="dspText">
                    ${miListaId.OB_IAX_USERS.NOMBRE}
                    </div>                
                </display:column>
                
                <display:column title="${title2}"
                    sortable="true"
                    sortProperty="OB_IAX_USERS.TAGENTE"
                    headerClass="sortable fixed"
                    media="html" autolink="false">
                    <div class="dspText">
                    ${miListaId.OB_IAX_USERS.TAGENTE}
                    </div>
                </display:column>              
                                                                   
                </display:table> 
                </div>
                
            </td>
            </tr>            
            </table>
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisusu009</c:param>
                <c:param name="__botones"><axis:visible f="axisusu009" c="BT_CANCELAR">cancelar</axis:visible><axis:visible f="axisusu009" c="BT_BUSCAR">,buscar</axis:visible><axis:visible f="axisusu009" c="BT_ACEPTAR">,aceptar</axis:visible></c:param>
            </c:import>
        </form> 
        
        <c:import url="../include/mensajes.jsp" />
    </body>
    <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
        <script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('axisusu009');
        </script>                   
    </c:if>
    
</html>