<%
/**
*  Fichero: axisman006.jsp
* 
*  
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="axis.util.Constantes" %>



<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!-- Código provisional, pendiente de modificar 25032011, se debe solucionar tema de capa flotante en modales -->
<style type="text/css">
.displayspaceGrandeSinBorde {
    width:100%;
    height: expression( this.scrollHeight > 219 ? "220px" : "auto" );  
    max-height:220px;
    overflow-x: hidden;
    overflow-y: auto;
}
</style>

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
        
          f_cargar_propiedades_pantalla();
          

        }            
        function f_but_cancelar() {
            
            parent.f_cerrar_axisman006();
            
        }        
       
        
        
            
    </script>
  </head>
    <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    	<div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
      
         <form name="miForm" action="axisman006.do" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
           <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisman006" c="IMPRIMIR" lit="1000205"/> </c:param>
                <c:param name="producto"><axis:alt f="axisman006" c="IMPRIMIR" lit="1000205"/> </c:param>
                <c:param name="form">axisman006</c:param>
            </c:import>
            
         <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisman006|<axis:alt f="axisman006" c="MODAL_axisman006" lit="109142"/> <axis:alt f="axisman010" c="MODAL_axisman006" lit="9906588"/></c:param>
            </c:import>
            
            <axis:visible c="DSP_BUSQUEDADOCUMENTOS" f="axisman006"> 
              <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                <td>
                 
                <table >
                         
               <tr>
                    <td colspan="4">
                                            
                        <table class="seccion">         
                          <tr><td>
                                       <c:set var="title0"><axis:alt f="axisman006" c="NOMINA" lit="9906644"/></c:set>
                                       <c:set var="title1"><axis:alt f="axisman006" c="DOCUMENTO" lit="9903661"/></c:set>
                                          <c:set var="title2"><axis:alt f="axisman006" c="FECHA" lit="100562"/></c:set>
                               </td>  
                               
                               
                               <td>
                              <div class="seccion">
                                <display:table name="${sessionScope.listdocumentos}"
                                               id="miListaId" export="false"
                                               class="dsptgtable" pagesize="15"
                                               defaultsort="1"
                                               defaultorder="ascending"
                                               sort="list" cellpadding="0"
                                               cellspacing="0"
                                               requestURI="modal_axisman006.do?paginar=true">
                                  <%@ include file="../include/displaytag.jsp"%>
                                                                
                                   <display:column title="${title0}"
                                                  sortable="true"
                                                  sortProperty="NOMINA"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    
          
                                 <div class="dspText"  onclick="f_ver_doc('${miListaId['IDGEDOX']}');"><a hrefx="#">${__formdata.NOMINA}</a></div>
                                  </display:column>
                               
                                  <display:column title="${title1}"
                                                  sortable="true"
                                                  sortProperty="DESCGEDOX"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">                                  
                                  
                                  <div class="dspText" onclick="f_ver_doc('${miListaId['IDGEDOX']}');"><a hrefx="#">${miListaId['DESCGEDOX']}</a></div>
                                    </display:column>
                                
                                   <display:column title="${title2}"
                                                  sortable="true"
                                                  sortProperty="FECHANOMINA"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                                   <div class="dspText"> <a href ="f_ver_doc("${miListaId['IDGEDOX']}");">${miListaId['FECHANOMINA']}</a></div>
                                    </display:column>
                                
                                <br>
                                </display:table>
                                </div>
                                </td>
                               </tr> 
                               
                     </table>
                     </td>
                    </td>
                
         
        </axis:visible>    
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisman006</c:param><c:param name="__botones">cancelar</c:param></c:import>
        <div class="separador">&nbsp;</div>   
        <div class="separador">&nbsp;</div>
        <div class="separador">&nbsp;</div>
    </form>    
        
       
    <c:import url="../include/mensajes.jsp" />
</div>
    </body>
 
    <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
      <script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('axisman006');
      </script >                   
    </c:if>    
    
</html>

