<%/*
*  Fichero: Axissin035.jsp
* 11/12/2009
* @author <a href="amartinez@csi-ti.com">Alex Martinez</a>
*
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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title> <fmt:message key="9001551"/></title> 
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    
  <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/ 
        
        function f_onload() {
           <c:if test="${empty listaEventos}">
                    //alert("Antes de abrir modal");
                    f_abrir_axissin034();
          </c:if>
        }
      
        function f_but_salir() {
            var sini = document.miForm.SINIESTRO.value;
            if(!objUtiles.estaVacio(sini)){
                parent.f_cerrar_axissin035();
            }
            else{
                objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
                }
        }      
        
        function f_abrir_axissin034() {
               objUtiles.abrirModal("axissin034","src","modal_axissin034.do?operation=form");               
        }
        
        function f_cerrar_axissin034(){
            objUtiles.cerrarModal("axissin034");
        }
        
        function f_but_buscar(CEVENTO,DEVENTO,FECHAINI,FECHAFIN){
            objUtiles.ejecutarFormulario("axis_axissin035.do?CEVENTO="+CEVENTO+"&DEVENTO="+DEVENTO+"&FECHAINI="+FECHAINI+"&FECHAFIN="+FECHAFIN, "buscar", document.miForm, "_self");
        }
        
        function f_cerrar_axissin036(){
            objUtiles.cerrarModal("axissin036");
        }
        
        function f_but_nuevo(){
            objUtiles.abrirModal("axissin036","src","modal_axissin036.do?operation=form"); 
        }
        
        function f_editar(CEVENTO){
            objUtiles.abrirModal("axissin036","src","modal_axissin036.do?operation=form&CEVENTO="+CEVENTO); 
        }
        
        function f_but_aceptar_axissin036(CEVENTO){
            objUtiles.ejecutarFormulario ("axis_axissin035.do?CEVENTO="+CEVENTO, "buscar", document.miForm, "_self");
        }
        
        function f_borrar(CEVENTO){
            var answer = confirm(objJsMessages.jslit_confirma_borrar);
            if (answer){  
                objUtiles.ejecutarFormulario ("axis_axissin035.do?CEVENTO="+CEVENTO, "borrar", document.miForm, "_self");
            }
        }
        
        function f_but_sele(CEVENTO,TTITEVE){
            var sini = document.miForm.SINIESTRO.value;
            if(!objUtiles.estaVacio(sini)){
                parent.f_aceptar_axissin035(CEVENTO,TTITEVE);
            }
        }
               
    </script>   
</head>

<body  onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><fmt:message key="9900841" /></c:param>
                <c:param name="nid" value="axissin034" />
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><fmt:message key="9900842" /></c:param>
                <c:param name="nid" value="axissin036" />
    </c:import>
        
    <form name="miForm" action="" method="POST">         

        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><b><fmt:message key="9900809"/></b></c:param>    
            <c:param name="formulario"> <b> <fmt:message key="9900809"/></b></c:param> 
            <c:param name="form">Axissin035</c:param>
        </c:import>
        
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="SINIESTRO" value="${__formdata.SINIESTRO}"/>
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:20px">
            <tr> 
                <td> 
                    <table class="seccion" align="center">                     
                        <div class="separador">&nbsp;</div>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo" ><img src="images/flecha.gif"/><fmt:message key="9900809"/><%-- Detalle --%> &nbsp; ${resumen} &nbsp; <img border="0" src="images/find.gif" onclick="f_abrir_axissin034()" style="cursor:pointer" alt="<fmt:message key="9000508"/>" title="<fmt:message key="9000508"/>"/></div>
                        
                        
                        <tr>
                            <td >
                                <table class="area" align="center">
                                    <tr>
                                        <td>
                                            <div class="separador">&nbsp;</div>
                                            <!-- DisplayTag ListaPersonas -->
                                            <c:set var="title1"><axis:alt f="axissin035" c="CEVENTO" lit="9900810"/></c:set>
                                            <c:set var="title2"><axis:alt f="axissin035" c="TTITEVE" lit="100785"/></c:set>
                                            <c:set var="title3"><axis:alt f="axissin035" c="TEVENTO" lit="100588"/></c:set>
                                            <c:set var="title4"><axis:alt f="axissin035" c="FINIEVE" lit="9000526"/></c:set>
                                            <c:set var="title5"><axis:alt f="axissin035" c="FFINEVE" lit="9000527"/></c:set>
                                            <div class="seccion displayspacePersonas">
                                            
                                            
                                                <display:table name="${sessionScope.listaEventos}" id="listaEventos" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" requestURI="axis_axissin035.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                    <axis:ocultar f="axissin035" c="CEVENTO">   
                                                    <display:column title="${title1}" style="width:15%" sortable="true" sortProperty="CEVENTO" headerClass="fixed sortable"  media="html" autolink="false" >
                                                        <div class="dspText"><a href="javascript:f_but_sele('${listaEventos['CEVENTO']}','${listaEventos['TTITEVE']}')">${listaEventos['CEVENTO']}</a></div>
                                                    </display:column>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axissin035" c="TTITEVE">
                                                    <display:column title="${title2}" style="width:15%" sortable="true" sortProperty="TTITEVE" headerClass="fixed sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${listaEventos['TTITEVE']}</div>
                                                    </display:column>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axissin035" c="TEVENTO">
                                                    <display:column title="${title3}" style="width:30%" sortable="true" sortProperty="TEVENTO" headerClass="fixed sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${listaEventos['TEVENTO']}</div>
                                                    </display:column>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axissin035" c="FINIEVE">
                                                    <display:column title="${title4}" style="width:15%" sortable="true" sortProperty="FINIEVE" headerClass="fixed sortable"  media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatDate pattern='dd/MM/yyyy' value="${listaEventos['FINIEVE']}"/></div>
                                                    </display:column>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axissin035" c="FFINEVE">
                                                    <display:column title="${title5}" style="width:15%" sortable="true" sortProperty="FFINEVE" headerClass="fixed sortable"  media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatDate pattern='dd/MM/yyyy' value="${listaEventos['FFINEVE']}"/></div>
                                                    </display:column>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axissin035" c="EDITAR">
                                                    <display:column title="" style="width:5%" headerClass="fixed sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            <a href="javascript:f_editar('${listaEventos['CEVENTO']}')">
                                                            <img border="0" alt="<fmt:message key="9001671"/>" title="<fmt:message key="9001671"/>" src="images/lapiz.gif"/>
                                                            </a>
                                                        </div>
                                                    </display:column>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axissin035" c="BORRAR">
                                                    <display:column title="" style="width:5%" headerClass="sortable"  media="html" autolink="false" >
                                                       <div class="dspText">
                                                            <a href="javascript:f_borrar('${listaEventos['CEVENTO']}')">
                                                            <img border="0" alt="<fmt:message key="9001672"/>" title="<fmt:message key="9001672"/>" src="images/delete.gif"/>
                                                            </a>
                                                        </div>
                                                    </display:column>
                                                    </axis:ocultar>
                                                </display:table>
                                            </div>	
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
            <c:param name="__botones">salir,nuevo</c:param> 
        </c:import>
    
    </form>

    <c:import url="../include/mensajes.jsp"/>

</body>
</html>