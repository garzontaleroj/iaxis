<%--
/**
*  Fichero: axissin030.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
* 
*  
*  T?tulo: Base Lista Mantenimiento Causas Estado
*
*  Fecha: 11/08/2009
*/
--%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
    <c:set var="linea_trami" value="${__formdata.indexTramitacio}"/> <!-- ${LINEATRAM} -->
<%@ page contentType="text/html;charset=iso-8859-15" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><fmt:message key="151090"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript">

        function f_onload() { 
            revisarEstilos();
            //alert("En recargar pantalla");
            <c:if test="${empty lista_causas}">
                //alert("vacio");
                f_abrir_axissin029();
            </c:if>
             
        }

        function f_but_1000428(){
            f_abrir_axissin031_nuevo();
        }
        
        function f_but_salir(){
             objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axissin030", "cancelar", document.miForm, "_self");
        }
        
        function f_recargar(thiss){
        
        }
        
        function f_aceptar_axissin031(){
            //alert("Antes de llamada al formulario");
            f_cerrar_modal("axissin031");
            objUtiles.ejecutarFormulario ("axis_axissin030.do?", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }

        
        
        /*axisper021 i axisper022*/
        function f_abrir_axissin029() {
            objUtiles.abrirModal("axissin029", "src", "modal_axissin029.do?operation=form&NSINIES=0");
        }
        function f_abrir_axissin031(CCAUEST,CESTSIN) {
            //alert("Antes de abrir modal");
            objUtiles.abrirModal("axissin031", "src", "modal_axissin031.do?operation=editar_causa&CCAUEST="+CCAUEST+"&CESTSIN="+CESTSIN);
        }
        
        function f_abrir_axissin031_nuevo() {
            //alert("Antes de abrir modal");
            objUtiles.abrirModal("axissin031", "src", "modal_axissin031.do?operation=form");
        }
        
        function f_cerrar_axissin029(){
            f_cerrar_modal("axissin029");
        }          
        function f_cerrar_axissin031(){
            f_cerrar_modal("axissin031");
        }   
     
        function f_cerrar_modal(modal){
            objUtiles.cerrarModal(modal);
        } 
        
        function f_ver_causa(CCAUEST,CESTSIN){
           //alert("Antes de abrir");
           f_abrir_axissin031 (CCAUEST,CESTSIN);
        }
        
        function f_borrar_causa(CCAUEST,CESTSIN){
                 if(confirm('<fmt:message key="1000167"/>')){
                    objUtiles.ejecutarFormulario("axis_axissin030.do?CCAUEST="+CCAUEST+"&CESTSIN="+CESTSIN, "borrar_causa", document.miForm, "_self");
                 }
        }
        
        function aceptar_axissin029(CCAUEST,TCAUEST,CESTSIN){
            f_cerrar_axissin029();
            //alert("Antes de llamar al formulario");
            //alert(CCAUEST);
            //alert(TCAUEST);
            //alert(CESTSIN);
            objUtiles.ejecutarFormulario ("axis_axissin030.do?CCAUEST="+CCAUEST+"&TCAUEST="+TCAUEST+"&CESTSIN="+CESTSIN, "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);   
        }
      
        /* *************************************************************************** */
        /* ***************************** METODOS AJAX ******************************** */
        /* *************************************************************************** */

       

    
        function callbackAjaxActualizaCausas(ajaxResponseText) {
            //alert(ajaxResponseText);
            var causasCombo = document.miForm.CAUSAS;
            try {
               var doc=objAjax.domParse(ajaxResponseText);
                                    
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        objDom.borrarOpcionesDeCombo(causasCombo);
                        
                        for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                            var TCAUEST = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TCAUEST")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TCAUEST")[0].childNodes[0].nodeValue : "");
                            var CCAUEST = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CCAUEST")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CCAUEST")[0].childNodes[0].nodeValue : "");
                           
                            objDom.addOpcionACombo(CCAUEST, CCAUEST+' - '+TCAUEST, causasCombo, i);
                        }
                    }else{
                        objDom.borrarOpcionesDeCombo (causasCombo);
                        objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", causasCombo, null);
                    }
                }
                
            } catch (e) {
                objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", causasCombo, null);
                alert(objJsMessages.jslit_sin_tramitadores);
            }
        }    
        
        
    </script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
           <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><fmt:message key="9002098"/></c:param>
                <c:param name="nid" value="axissin031"/>
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><fmt:message key="9002097"/></c:param>
                <c:param name="nid" value="axissin029"/>
            </c:import>    
             
             
    <form name="miForm" action="" method="POST">
    <input type="hidden" name="operation" value="" />
        
    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><fmt:message key="180580"/></c:param>
        <c:param name="formulario"><fmt:message key="180580"/></c:param>
        <c:param name="form">axissin030</c:param>
    </c:import>
    <div class="separador">&nbsp;</div>
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo">
                        <img src="images/flecha.gif"/><b><fmt:message key="180580"/></b>
                        <img id="find" border="0" src="images/find.gif" alt="<fmt:message key="180580" />" onclick="f_abrir_axissin029();" style="cursor:pointer"/>                
                    </div>
                    <div class="separador">&nbsp;</div>
                    <c:set var="title0"><fmt:message key="180580"/></c:set>   <%-- Causa estado --%>
                    <c:set var="title1"><fmt:message key="100587"/></c:set>   <%-- Estado siniestro --%>
                    <c:set var="title2"><fmt:message key="100588"/></c:set>  <%-- Descripción --%>
                    
                    
                    <div id="dt_recibos" class="seccion displayspaceMaximo">
                        <display:table name="${lista_causas}" id="LSTCAUSAS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                             requestURI="axis_axissin030.do?paginar=true">
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="${title0}" sortable="false" sortProperty="CCAUEST" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                         ${LSTCAUSAS.CCAUEST}
                                </div>
                            </display:column>
                            <display:column title="${title1}" sortable="false" sortProperty="CESTSIN" headerClass="sortable"  media="html" autolink="false" >
                                 <div class="dspText">
                                        ${LSTCAUSAS.TESTSIN} 
                                 </div>
                            </display:column>
                            <display:column title="${title2}" sortable="false" sortProperty="TCAUEST" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                       ${LSTCAUSAS.TCAUEST}
                                </div>
                            </display:column>
                            
                            <!-- ICONOS -->
                            <display:column title=" " sortable="false" sortProperty="TESTREC" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                <div class="dspIcons">
                                    <img border="0" alt="<fmt:message key="100002"/>" title="<fmt:message key="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                    style="vertical-align:middle;cursor:pointer;" 
                                    onclick="javascript:f_ver_causa('${LSTCAUSAS.CCAUEST}','${LSTCAUSAS.CESTSIN}')"/>
                                </div>
                            </display:column>
                            
                            <display:column title=" " sortable="false" sortProperty="TESTREC" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                <div class="dspIcons">
                                    <img border="0" alt="<fmt:message key="1000564"/>" title="<fmt:message key="1000564"/>" src="images/delete.gif" width="15px" height="15px"
                                    style="vertical-align:middle;cursor:pointer;" 
                                    onclick="javascript:f_borrar_causa('${LSTCAUSAS.CCAUEST}','${LSTCAUSAS.CESTSIN}')"/>
                                </div>
                            </display:column>
                            
                        </display:table>
                    </div>
                </td>
            </tr>
        </table>
    <c:import url="../include/botonera_nt.jsp"><c:param name="__botones">salir,1000428</c:param></c:import>
    </form>
  <c:import url="../include/mensajes.jsp" />
</body>
</html>