<%/*
*  Fichero: axisctr189.jsp
*
*  BFP   BUG: 21947
*  Fecha: 22/05/2012
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
            f_cargar_propiedades_pantalla(); 
        }
        
     
    
        
        function f_but_cancelar() {
        try{
           parent.f_cerrar_modal('axisctr189');                      
           }catch(e){
             objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr189", "cancelar", document.miForm, "_self");
           }
        }
        
        
       function  f_actualizar_importe(PCOMISI,CGARANT,CMODCOM,NINIALT,NFINALT,FINIEFE){
         if (objValidador.validaEntrada()){
         var strURL="modal_axisctr189.do?operation=guardarCambios_json&CGARANT="+CGARANT+"&PCOMISI="+PCOMISI+"&CMODCOM="+CMODCOM+"&NINIALT="+NINIALT+"&NFINALT="+NFINALT+"&FINIEFE="+FINIEFE;
        var ajaxTexto=objJsMessages.jslit_cargando;
        objAjax.invokeAsyncCGI_JSON(strURL, callbackActImporte, ajaxTexto);
        }
       
       }
       
       function callbackActImporte(p){
          objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
	    
           objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado");
            
            
       
       }
        
         function f_but_siguiente() {
                objUtiles.ejecutarFormulario("modal_axisctr189.do", "siguiente", document.miForm, "_self", objJsMessages.jslit_cargando);
         }
    
     function f_but_anterior() {
        objUtiles.ejecutarFormulario("modal_axisctr189.do", "anterior", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
    </script>
  </head>
    <body onload="f_onload()">
    
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="CONSULTA" id="CONSULTA" value="${__formdata.CONSULTA}"/> 
                      
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="formulario" f="axisctr189" lit="9903766" /></c:param>
                <c:param name="producto"><axis:alt c="producto" f="axisctr189" lit="9903766" /></c:param>
                <c:param name="form">axisctr189</c:param>
            </c:import>
               <div class="separador">&nbsp;</div>
             <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
               <div class="separador">&nbsp;</div>
                                     
                    <div class="titulo">
                        <img src="images/flecha.gif"/><axis:alt c="producto" f="axisctr189" lit="9903766" />
                    </div>
                                               
                <table class="seccion">
                    <tr>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                    </tr><tr>
                    <td colspan="6">
                        <c:set var="title0"><axis:alt c="DGARANTIA" f="axisctr189" lit="110994"/></c:set>
                        <c:set var="title1"><axis:alt c="DMODALIDAD" f="axisctr189" lit="9001744"/></c:set>
                        <c:set var="title2"><axis:alt c="VPORCENTAGE" f="axisctr189" lit="9001222"/></c:set>
                         <div id="DSP_COMISIONGAR" class="displayspaceGrandeOver" style="visibility:hidden;">&nbsp;</div>
                         <div id="Dt_COMISIONGAR" class="displayspaceMaximo">
                                <display:table name="${__formdata.lstComisiones}" id="miListaId" export="false" pagesize="-1"  requestURI="modal_axisctr189.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                <%@ include file="../include/displaytag.jsp"%>
                                 <display:column title="${title0}" sortable="true" style="width:40%" sortProperty="OB_IAX_GARANSEGCOM.TGARANT" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId.OB_IAX_GARANSEGCOM.TGARANT}</div>
                                </display:column>                                
                                <display:column title="${title1}" sortable="true" style="width:40%" sortProperty="OB_IAX_GARANSEGCOM.TMODCOM" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId.OB_IAX_GARANSEGCOM.TMODCOM}</div>
                                </display:column>
                                <display:column title="${title2}" sortable="true" style="width:20%" sortProperty="OB_IAX_GARANSEGCOM.PCOMISI" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspNumber">
                                    	<c:choose>
                                    		<c:when test="${!empty __formdata.CONSULTA && __formdata.CONSULTA==1}">
			                                    <fmt:formatNumber value="${miListaId.OB_IAX_GARANSEGCOM.PCOMISI}" pattern="###,##0.00"/>
                  											</c:when>
                  											<c:otherwise>
                  												<input type="text" id="${miListaId.OB_IAX_GARANSEGCOM.TGARANT}_${miListaId.OB_IAX_GARANSEGCOM.TMODCOM}" 
			                                    class="campo campotexto" name="${miListaId.OB_IAX_GARANSEGCOM.TGARANT}_${miListaId.OB_IAX_GARANSEGCOM.TMODCOM}" formato="decimal" value="<fmt:formatNumber value="${miListaId.OB_IAX_GARANSEGCOM.PCOMISI}" pattern="###,##0.00"/>" 
			                                     onchange="f_actualizar_importe(this.value,'${miListaId.OB_IAX_GARANSEGCOM.CGARANT}','${miListaId.OB_IAX_GARANSEGCOM.CMODCOM}','${miListaId.OB_IAX_GARANSEGCOM.NINIALT}','${miListaId.OB_IAX_GARANSEGCOM.NFINALT}','<fmt:formatDate value="${miListaId.OB_IAX_GARANSEGCOM.FINIEFE}" pattern="dd/MM/yyyy"/>')"/>
                  											</c:otherwise>
                  										</c:choose>
                                  </div>
                                </display:column>
                            </display:table>
                         </div>
                        </td>
                        </tr>
                        
                        </table>
                        
                    </td>
                </tr>
            </table>
                 <div class="separador">&nbsp;</div>     <div class="separador">&nbsp;</div>
                      <div class="separador">&nbsp;</div>     <div class="separador">&nbsp;</div>
                           <div class="separador">&nbsp;</div>     <div class="separador">&nbsp;</div>
            <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisctr189</c:param>        
                <c:param name="__botones">cancelar<c:if test="${empty __formdata.CONSULTA}">,anterior,siguiente</c:if> </c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
       
    </body>
</html>