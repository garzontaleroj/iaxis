<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%-- 
*  Fichero: axisper006.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*
*  Fecha: 24/04/2008
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
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
    <c:set var="isAxisper002Embedded" value="true"/>
    
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
            f_cargar_propiedades_pantalla(); 
            try { f_onload_axisper002() } catch (e) {}
               <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisper006');
					</c:if>
        }
        
        function f_but_anadir_direccion() {
            f_abrir_axisper002();
        }
        
        function f_but_salir() {
            parent.f_cerrar_axisper006(document.axisper006Form.faceptar.value);
        }                
        
        function f_borrar_direccion(CDOMICI) {
            objUtiles.ejecutarFormulario("modal_axisper006.do?CDOMICI=" + CDOMICI, "eliminarDireccion",  document.axisper006Form, "_self", objJsMessages.jslit_cargando);   
        }
        
        // TODO: Se utilizará o no?
        function disableOrEnableElements(enabled) {
            var visibility = enabled ? "visible" : "hidden";
            objDom.setVisibilidadPorId("but_salir", visibility);
            objDom.setVisibilidadPorId("but_anadir_direccion", visibility);
            
        }
        
        /****************************************************************************************/
        /********************************* MODAL AXPER002 ***************************************/
        /****************************************************************************************/
        
        function f_abrir_axisper002(CDOMICI) {
            var isAxisper002Embedded = "${isAxisper002Embedded}";
            var FACEPTAR = document.axisper006Form.faceptar.value;
            if (isAxisper002Embedded == "true") 
                objUtiles.ejecutarFormulario("modal_axisper006.do?CDOMICI=" + CDOMICI, "editarDireccion",  document.axisper006Form, "_self", objJsMessages.jslit_cargando);   
            else
                objUtiles.abrirModal("axisper002", "src", "modal_axisper002.do?operation=form&SPERSON=${__formdata.SPERSON}&CDOMICI=" + CDOMICI+"&FACEPTAR="+FACEPTAR, 800, 300);            
            
        }
        
        function f_cerrar_axisper002() {
            var isAxisper002Embedded = "${isAxisper002Embedded}";
            if (isAxisper002Embedded == "true")
                objUtiles.ejecutarFormulario("modal_axisper006.do?esconderAxisper002Embed=true", "form", document.axisper006Form, "_self", objJsMessages.jslit_cargando);   
            else            
                objUtiles.cerrarModal("axisper002");
        }
        
        function f_aceptar_axisper002() {
            var isAxisper002Embedded = "${isAxisper002Embedded}";
            if (isAxisper002Embedded == "true")
                objUtiles.ejecutarFormulario("modal_axisper006.do?esconderAxisper002Embed=true", "form", document.axisper006Form, "_self", objJsMessages.jslit_cargando);   
            else {
                // Cerrar modal y recargar la pantalla
                f_cerrar_axisper002();
                objUtiles.ejecutarFormulario("modal_axisper006.do", "form", document.axisper006Form, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
    </script>
  </head>
  <body onload="f_onload()">
  	   <div id="wrapper" class="wrapper">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisper002|<axis:alt f="axisper006" c="nid" lit="1000212"/></c:param>
    </c:import>
    
    <form name="axisper006Form" action="" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="SPERSON"  value="${__formdata.SPERSON}"/>
        <input type="hidden" name="faceptar" value="${__formdata.faceptar}"/>
            
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisper006" c="formulario" lit="1000215" /></c:param>
            <c:param name="producto"><axis:alt f="axisper006" c="producto" lit="1000215" /></c:param>
            <c:param name="form">axisper006</c:param>
        </c:import>        
    
        <c:if test="${isAxisper002Embedded == 'true'}">    
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
        </c:import>
        </c:if>
    
    </form>
    
    <!-- Area de campos  -->
    <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <div class="separador">&nbsp;</div>

                <table class="seccion">
                    <tr>
                        <td>
                            <!-- DisplayTag Direcciones -->
                            <c:set var="title1"><axis:alt f="axisper006" c="CDOMICI" lit="1000082"/></c:set>
                            <c:set var="title2"><axis:alt f="axisper006" c="TTIPDIR" lit="1000375"/></c:set>
                            <c:set var="title3"><axis:alt f="axisper006" c="TDOMICI" lit="101078"/></c:set>
                            <c:set var="title4"><axis:alt f="axisper006" c="CPOSTAL" lit="100823"/></c:set>
                            <c:set var="title5"><axis:alt f="axisper006" c="TPOBLAC" lit="100817"/></c:set>
                            <c:set var="title6"><axis:alt f="axisper006" c="TPROVIN" lit="100756"/></c:set>                                
                            <c:set var="title7"><axis:alt f="axisper006" c="TPAIS" lit="100816"/></c:set>   
                            <c:set var="title8"><axis:alt f="axisper006" c="FDEFECTO" lit="9906891"/></c:set>   
                            <div class="displayspace" style="width:100%;height:100%">
                              <display:table name="${__formdata.T_IAX_DIRECCIONES}" id="T_IAX_DIRECCIONES" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                               requestURI="modal_axisper006.do?paginar=true">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.CDOMICI" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                    <div class="dspText">${T_IAX_DIRECCIONES.OB_IAX_DIRECCIONES.CDOMICI}</div>
                                </display:column>
                                <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.TTIPDIR" headerClass="sortable" media="html" autolink="false" >
                                    <div class="dspText">${T_IAX_DIRECCIONES.OB_IAX_DIRECCIONES.TTIPDIR}</div>
                                </display:column>
                                 <axis:visible f="axisper006" c="FDEFECTO">
                                    <display:column title="${title8}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.FDEFECTO" headerClass="sortable" media="html" autolink="false" >
                                  
                                     <div class="dspText"> 
                                              <c:if test="${T_IAX_DIRECCIONES.OB_IAX_DIRECCIONES.FDEFECTO==0}"> 
                  <axis:alt f='axisper006' c='NO' lit='101779'/>
                   </c:if>
                   <c:if test="${T_IAX_DIRECCIONES.OB_IAX_DIRECCIONES.FDEFECTO==1}"> 
                 <axis:alt f='axisper006' c='SI' lit='101778'/>
                   </c:if>            
                                     </div>     
                             
                                </display:column>
                                </axis:visible>
                                <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.TDOMICI" headerClass="sortable" media="html" autolink="false" >
                                    <div class="dspText">${T_IAX_DIRECCIONES.OB_IAX_DIRECCIONES.TDOMICI}</div>
                                </display:column>
                                <axis:visible f="axisper006" c="CPOSTAL">
                                    <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.CPOSTAL" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">${T_IAX_DIRECCIONES.OB_IAX_DIRECCIONES.CPOSTAL}</div>
                                    </display:column>    
                                </axis:visible>
                                <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.TPOBLAC" headerClass="sortable" media="html" autolink="false" >
                                    <div class="dspText">${T_IAX_DIRECCIONES.OB_IAX_DIRECCIONES.TPOBLAC}</div>
                                </display:column>
                                <axis:visible c="TPROVIN" f="axisper006">  
                                    <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.TPROVIN" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">${T_IAX_DIRECCIONES.OB_IAX_DIRECCIONES.TPROVIN}</div>
                                    </display:column>
                                </axis:visible>
                                <display:column title="${title7}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.TPAIS" headerClass="sortable" media="html" autolink="false" >
                                    <div class="dspText">${T_IAX_DIRECCIONES.OB_IAX_DIRECCIONES.TPAIS}</div>
                                </display:column>
                                <!--modo simulación, siempre permite modificar Y eliminar domicilio-->
                               
                                        <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false" >
										 <c:set var="tipdir"  value="99"/>
											<c:choose>
												<c:when test="${T_IAX_DIRECCIONES.OB_IAX_DIRECCIONES.CTIPDIR != tipdir && T_IAX_DIRECCIONES.OB_IAX_DIRECCIONES.NUEVA==0}">                                        
													<axis:visible c="BT_EDITAR" f="axisper006">
														<div class="dspIcons"><a href="javascript:f_abrir_axisper002('${T_IAX_DIRECCIONES.OB_IAX_DIRECCIONES.CDOMICI}')"><img border="0" alt="<axis:alt f='axisper006' c='lapiz1' lit='100002'/> <axis:alt f='axisper006' c='lapiz2' lit='105889'/>" title="<axis:alt f='axisper006' c='lapiz3' lit='100002'/> <axis:alt f='axisper006' c='lapiz4' lit='105889'/>" src="images/lapiz.gif"/></a></div>
													</axis:visible>
												</c:when>
												<c:otherwise>
														<div class="dspIcons"><a href="javascript:f_abrir_axisper002('${T_IAX_DIRECCIONES.OB_IAX_DIRECCIONES.CDOMICI}')"><img border="0" alt="<axis:alt f='axisper006' c='lapiz1' lit='100002'/> <axis:alt f='axisper006' c='lapiz2' lit='105889'/>" title="<axis:alt f='axisper006' c='lapiz3' lit='100002'/> <axis:alt f='axisper006' c='lapiz4' lit='105889'/>" src="images/lapiz.gif"/></a></div>
												</c:otherwise>
											 </c:choose>
                                        </display:column>    
                                            <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false" >
											 <c:set var="tipdir"  value="99"/>
											 <c:choose>
												<c:when test="${T_IAX_DIRECCIONES.OB_IAX_DIRECCIONES.CTIPDIR != tipdir && T_IAX_DIRECCIONES.OB_IAX_DIRECCIONES.NUEVA==0}">                                        
													<axis:visible c="BT_BORRAR" f="axisper006"> 
														<div class="dspIcons"><a href="javascript:f_borrar_direccion('${T_IAX_DIRECCIONES.OB_IAX_DIRECCIONES.CDOMICI}')"><img border="0" alt="<axis:alt f='axisper006' c='delete1' lit='1000127'/> <axis:alt f='axisper006' c='delete2' lit='105889'/>" title="<axis:alt f='axisper006' c='delete3' lit='1000127'/> <axis:alt f='axisper006' c='delete4' lit='105889'/>" src="images/delete.gif"/></a></div>
													</axis:visible>
												</c:when>
												<c:otherwise>
														<div class="dspIcons"><a href="javascript:f_borrar_direccion('${T_IAX_DIRECCIONES.OB_IAX_DIRECCIONES.CDOMICI}')"><img border="0" alt="<axis:alt f='axisper006' c='delete1' lit='1000127'/> <axis:alt f='axisper006' c='delete2' lit='105889'/>" title="<axis:alt f='axisper006' c='delete3' lit='1000127'/> <axis:alt f='axisper006' c='delete4' lit='105889'/>" src="images/delete.gif"/></a></div>
												</c:otherwise>
											</c:choose>
											</display:column>
                                        
                                
                              </display:table>
                            </div>
                        </td>
                    <tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <c:if test="${isAxisper002Embedded == 'true' && !empty sessionScope.mostrarAxisper002Embed}">
                <div id="axisper002_embed">
                    <jsp:include page="axisper002.jsp">
                        <jsp:param name="embedded" value="${isAxisper002Embedded}"/>
                    </jsp:include>
                </div>
                </c:if>
            </td>
        </tr>
    </table>			

    <c:if test="${isAxisper002Embedded == 'false' || empty sessionScope.mostrarAxisper002Embed}">
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisper006</c:param><c:param name="f">axisper006</c:param>
        <c:param name="__botones">salir<axis:visible c="BT_ANADIR" f="axisper006">,anadir_direccion</axis:visible></c:param>
    </c:import>
    </c:if>
    
    <c:import url="../include/mensajes.jsp" />
    </div>
   </body>
</html>

