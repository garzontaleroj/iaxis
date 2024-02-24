<%/*
*  Fichero: axispro039.jsp
*
*  @author <a href="mailto:rkirchner@csi-ti.com">Alex Martinez</a>
*  Fecha: 29/06/2009
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
           parent.f_aceptar_modal("axispro039");
        }
        
        function f_onload() {
                     
        }
       
        function f_asignar(SCLABEN){
            objUtiles.ejecutarFormulario("modal_axispro039.do?PSCLABEN="+SCLABEN+"&PSPRODUC="+document.miForm.SPRODUC.value, "asignar_clausula", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_borrar(SCLABEN){
            objUtiles.ejecutarFormulario("modal_axispro039.do?PSCLABEN="+SCLABEN+"&PSPRODUC="+document.miForm.SPRODUC.value, "borrar_clausula", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_asigdefecto(SCLABEN){
            objUtiles.ejecutarFormulario("modal_axispro039.do?PSCLABEN="+SCLABEN+"&PSPRODUC="+document.miForm.SPRODUC.value, "asig_clausuladef", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
            
    </script>
  </head>
  
  <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axispro039.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><fmt:message key="9001874"/></c:param>
            <c:param name="form">axispro039</c:param>
            <c:param name="titulo"><fmt:message key="9001874"/></c:param>
        </c:import>

        <input type="hidden" id="SPRODUC" name="SPRODUC" value="${__formdata.SPRODUC}"/>
        <input type="hidden" id="operation" name="operation" value=""/>
    
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div  style="color: #FF9900"><b>${mntproducto.SPRODUC} - ${mntproducto.TITULO[0].OB_IAX_PRODTITULO.TTITULO}</b></div>
                    <div  class="titulo"><b><fmt:message key="9001871"/></b></div>
                    <table class="seccion">
                        <tr>
                            <td>
                                <c:set var="title0"><fmt:message key="101792" /></c:set>
                                <c:set var="title1"><fmt:message key="100713" /></c:set>
                                <div class="displayspace">
                       
                                <display:table name="CLAUSULAS" id="CLAUSULAS"  export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="modal_axispro039.do?paginar=true">
                                    <%@ include file="../include/displaytag.jsp"%>
                           
                                    <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PRODBENEFICIARIOS.TCLABEN" headerClass="headwidth20 sortable" media="html" autolink="false" style="width:85%">
                                        <div class="dspText">
                                        ${CLAUSULAS.OB_IAX_PRODBENEFICIARIOS.TCLABEN}
                                        </div>
                                    </display:column>
                                    <display:column title="${title1}" headerClass="headwidth5 sortable" sortProperty="OB_IAX_PRODBENEFICIARIOS.CDEFECTO" media="html" autolink="false" style="width:10%"> 
                                        <div class="dspIcons"><input type="radio" name="CPAGDEF" <c:if test="${CLAUSULAS.OB_IAX_PRODBENEFICIARIOS.CDEFECTO == 1}">checked</c:if> onclick="f_asigdefecto('${CLAUSULAS.OB_IAX_PRODBENEFICIARIOS.SCLABEN}')"/></div>                
                                    </display:column>
                                    <display:column title="" headerClass="headwidth5 sortable " media="html" style="width:5%" autolink="false">
                                        <div class="dspIcons">
                                            <img border="0" alt='<fmt:message key="9001333"/>' title1='<fmt:message key="100002"/>'
                                                 src="images/delete.gif" width="15px" height="15px" style="cursor:pointer;" onclick="javascript:f_borrar('${CLAUSULAS.OB_IAX_PRODBENEFICIARIOS.SCLABEN}')"/>
                                        </div>
                                    </display:column>
                                </display:table>
                                
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="titulo">
                        <div  style="float:left;"><b><fmt:message key="9001872"/></b></div>
                        <div style="float:right;">
                           <img id="find" border="0" src="images/new.gif"
                                 alt='<fmt:message key="1000428" />'
                                 onclick=""
                                 style="cursor:pointer"/>
                        </div>
                    </div>     
                    <table class="seccion">
                        <tr>
                            <td>
                                <c:set var="title0"><fmt:message key="101792" /></c:set>
                                <div class="displayspace">
                                 <display:table name="CLAUSULAS_SEL" id="CLAUSULAS_SEL"  export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="modal_axispro039.do?paginar=true">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PRODBENEFICIARIOS.TCLABEN" headerClass="headwidth20 sortable" media="html" autolink="false" style="width:85%">
                                        <div class="dspText">
                                        ${CLAUSULAS_SEL.TCLABEN}
                                        </div>
                                    </display:column>
                                    <display:column title="" headerClass="headwidth5 sortable" sortProperty="OB_IAX_PRODBENEFICIARIOS.CDEFECTO" media="html" autolink="false" style="width:10%"> 
                                        <div class="dspIcons"><input type="checkbox" name="" onclick="javascript:f_asignar('${CLAUSULAS_SEL.SCLABEN}')"></div> 
                                    </display:column>
                                    <display:column title="" headerClass="headwidth5 sortable " media="html" style="width:5%" autolink="false">
                                        <div class="dspIcons">
                                            <img border="0" alt='<fmt:message key="100002"/>' title1='<fmt:message key="100002"/>'
                                                 src="images/lapiz.gif" width="15px" height="15px" style="cursor:pointer;" onclick=""/>
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
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="__botones">salir</c:param></c:import>
        
    </form>
    <c:import url="../include/mensajes.jsp" />
</body>
</html>