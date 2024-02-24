<%/*
*  Fichero: axispro042.jsp
*
*  @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
*  Fecha: 07/04/2010
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_but_salir() {
           parent.f_cerrar_modal("axispro042");
        }
        
        function f_onload(){
            revisarEstilos();
        }
        
        function f_but_buscar(){
            objUtiles.ejecutarFormulario("modal_axispro042.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_aceptar() {                    
        var hayChecked = objUtiles.f_GuardaCasillasChecked("radioPregunta");
        if(typeof hayChecked == 'boolean') {
            alert(objJsMessages.jslit_selecciona_producto);
        }else{
            f_seleccionar (hayChecked);
        }
        }
        
        function f_seleccionar(CPREGUN){
            if (objUtiles.estaVacio(CPREGUN))
                alert (objJsMessages.jslit_error_de_seleccion);
            else
                parent.f_aceptar_axispro042(CPREGUN);
        }
           
    </script>
  </head>
  
  <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axispro042.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><fmt:message key="9901152"/></c:param>
            <c:param name="form">axispro042</c:param>
            <c:param name="titulo"><fmt:message key="9901152"/></c:param>
        </c:import>

        
        <input type="hidden" id="operation" name="operation" value=""/>
        <input type="hidden" id="modo" name="modo" value="${__formdata.MODO}"/>
    
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                        <tr>
                            <th style="width:2%;height:0px"></th>
                            <th style="width:5%;height:0px"></th>
                            <th style="width:15%;height:0px"></th>
                            <th style="width:15%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:15%;height:0px"></th>
                            <th style="width:15%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="titulocaja">
                                <b><fmt:message key="102738" /></b>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="campocaja" colspan="4">
                                <input type="text" class="campowidthinput campo campotexto" value="${__formdata.TPREGUN}" name="TPREGUN" id="TPREGUN" size="15" />
                            </td>
                        </tr>
                    </table>
                    <div class="separador">&nbsp;</div>
                    <c:set var="title0"><fmt:message key="1000109"/></c:set>
                    <c:set var="title1"><fmt:message key="102738"/></c:set>
                    
                    <div class="seccion displayspaceGrande">
                        <display:table name="${LISTAPREGUNTAS}" id="LISTAPREGUNTAS" export="false" class="dsptgtable" pagesize="8" defaultsort="2" defaultorder="ascending" requestURI="modal_axispro042.do?operation=buscar&paginar=true" sort="list" cellpadding="0" cellspacing="0">
                        <%@ include file="../include/displaytag.jsp"%>
                        <display:column headerClass="headwidth5 sortable" title="" media="html" autolink="false" >
                            <div class="dspIcons">
                            <input value="${LISTAPREGUNTAS['CPREGUN']}" type="radio" onclick="" id="radioPregunta" name="radioPregunta"/></div>
                        </display:column>
                        <display:column title="${title0}" sortable="true" sortProperty="CPREGUN" headerClass=" headwidth5 sortable"  media="html" autolink="false" >
                            <div class="dspText"><a href="javascript:f_seleccionar('${LISTAPREGUNTAS['CPREGUN']}')">${LISTAPREGUNTAS['CPREGUN']}</a></div>
                        </display:column>
                        <display:column title="${title1}" sortable="true" sortProperty="TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                            <div class="dspText"><a href="javascript:f_seleccionar('${LISTAPREGUNTAS['CPREGUN']}')">${LISTAPREGUNTAS['TPREGUN']}</a></div>
                        </display:column>                        
                        </display:table>
                    </div>
                    
                </td>
            </tr>
            
        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="__botones">salir,buscar,aceptar</c:param></c:import>
        
    </form>
    <c:import url="../include/mensajes.jsp" />
</body>
</html>