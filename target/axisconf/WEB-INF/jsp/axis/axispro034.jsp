<%/**
*  Fichero: axispro031.jsp
*   
*  Pantalla de duplicado de actividad
*
*  Descripción de pantalla
*
*  Fecha: 12/01/2009
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        
        <script type="text/javascript">
        
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axispro031", "cancelar", document.miForm, "_self");
            }
            
            function f_but_103669() {
                if(confirm("<axis:alt f='axispro034' c='CONFIRM' lit='9001182'/>"))
                    objUtiles.ejecutarFormulario ("axis_axispro034.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);     
            }

            function f_onload(){
                var CACTIVI  = objDom.getValorPorId('CACTIVI');
                var CACTIVIC = objDom.getValorPorId('CACTIVIC');
                
                if (objUtiles.estaVacio(CACTIVI)) {
                   /* Marcar primero si no hay ninguno seleccionado */
                   var checked_actividad_origen = document.getElementsByName("checked_actividad_origen")[0];
                   if (!objUtiles.estaVacio(checked_actividad_origen)) {
                       checked_actividad_origen.checked = true;
                       checked_actividad_origen.onclick();
                   }
                }

                if (objUtiles.estaVacio(CACTIVIC)) {
                    /* Marcar primero si no hay ninguno seleccionado */
                    var checked_actividad_destino = document.getElementsByName("checked_actividad_destino")[0];
                    if (!objUtiles.estaVacio(checked_actividad_destino)) {
                       checked_actividad_destino.checked = true;
                       checked_actividad_destino.onclick();
                    }
                }
                f_cargar_propiedades_pantalla();
            } 
            
        </script>
    </head>
<body onload="f_onload()">
<c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
<form name="miForm" action="" method="POST">
    <input type="hidden" name="operation"/>
    <input type="hidden" name="CRAMO" id="CRAMO"
           value="${__formdata.CRAMO}"/>
    <input type="hidden" name="CMODALI" id="CMODALI"
           value="${__formdata.CMODALI}"/>
    <input type="hidden" name="CTIPSEG" id="CTIPSEG"
           value="${__formdata.CTIPSEG}"/>
    <input type="hidden" name="CCOLECT" id="CCOLECT"
           value="${__formdata.CCOLECT}"/>
    <input type="hidden" name="SPRODUC" id="SPRODUC"
           value="${__formdata.SPRODUC}"/>
    <input type="hidden" name="TACTIVI" id="TACTIVI"
           value="${__formdata.TACTIVI}"/>
    <input type="hidden" name="CACTIVI" id="CACTIVI"  
           value="${__formdata.CACTIVI}"/>   <%-- Actividad a duplicar ORIGEN --%>           
    <input type="hidden" name="CACTIVIC" id="CACTIVIC"
           value="${__formdata.CACTIVIC}"/>  <%-- Actividad a duplicar DESTINO --%>
    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="formulario"><axis:alt f="axispro034" c="FORM" lit="9903650"/></c:param>
        <c:param name="producto">                    
            ${mntproducto.SPRODUC} - ${mntproducto.TITULO[0].OB_IAX_PRODTITULO.TTITULO}
        </c:param>
        <c:param name="form">axispro034</c:param>
    </c:import>

    <!-- Area de campos  -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
    <tr>
    <td>
        <div class="separador">&nbsp;</div>
        <div class="titulo">
            <img src="images/flecha.gif"/><axis:alt f="axispro034" c="TITULO" lit="9001181" />
        </div>
        <table class="seccion">
            <tr>
                <td>
                    <c:set var="title0"><axis:alt f="axispro034" c="CACTIVI" lit="1000109"/></c:set>
                    <c:set var="title1"><axis:alt f="axispro034" c="TACTIVI" lit="100588"/></c:set>
                    <div class="displayspaceGrande">
                      <display:table name="${actividades}" id="T_IAX_ACTIVIDADES"
                                     export="false" class="dsptgtable" pagesize="-1"
                                     defaultsort="2" defaultorder="ascending" sort="list"
                                     cellpadding="0" cellspacing="0"
                                     requestURI="axis_axispro034.do?paginar=true&operation=form">
                        <%@ include file="../include/displaytag.jsp"%>
                        <display:column title="" sortable="false"
                                        headerClass="headwidth5 sortable" style="width:5%"
                                        media="html" autolink="false">
                          <div class="dspIcons">
                            <input type="radio" id="checked_actividad_origen"
                                   name="checked_actividad_origen"
                                   <c:if test="${__formdata.CACTIVI == T_IAX_ACTIVIDADES.CACTIVI}">checked </c:if>
                                   value="${T_IAX_ACTIVIDADES.CACTIVI}"
                                   onclick="javascript:objDom.setValorPorId('CACTIVI', this.value)"/>
                          </div>
                        </display:column>
                        <display:column title="${title0}" sortable="true"
                                        sortProperty="CACTIVI"
                                        style="width:5%" headerClass="sortable" media="html"
                                        autolink="false">
                          <div class="dspNumber" style="text-align:right">
                            ${T_IAX_ACTIVIDADES.CACTIVI}
                          </div>
                        </display:column>
                        <display:column title="${title1}" sortable="true"
                                        sortProperty="TACTIVI"
                                        style="width:70%" headerClass="sortable"
                                        media="html" autolink="false">
                          <div class="dspText">
                            ${T_IAX_ACTIVIDADES.TACTIVI}
                          </div>
                        </display:column>
                      </display:table>
                    </div>
                </td>
            </tr>
        </table>
        <div class="separador">&nbsp;</div>
        <div class="titulo">
            <img src="images/flecha.gif"/><axis:alt f="axispro034" c="DESTINO" lit="9001180" /> <%-- Activitat destí --%>
        </div>
        <table class="seccion">
            <tr>
                <td>
                    <c:set var="title0"><axis:alt f="axispro034" c="CACTIVI" lit="1000109"/></c:set>
                    <c:set var="title1"><axis:alt f="axispro034" c="TACTIVI" lit="100588"/></c:set>
                    <div class="displayspaceGrande">
                      <display:table name="${actividades}" id="T_IAX_ACTIVIDADES"
                                     export="false" class="dsptgtable" pagesize="-1"
                                     defaultsort="2" defaultorder="ascending" sort="list"
                                     cellpadding="0" cellspacing="0"
                                     requestURI="axis_axispro034.do?paginar=true&operation=form">
                        <%@ include file="../include/displaytag.jsp"%>
                        <display:column title="" sortable="false"
                                        headerClass="headwidth5 sortable" style="width:5%"
                                        media="html" autolink="false">
                          <div class="dspIcons">
                            <input type="radio" id="checked_actividad_destino"
                                   name="checked_actividad_destino"
                                   <c:if test="${__formdata.CACTIVIC == T_IAX_ACTIVIDADES.CACTIVI}">checked </c:if>
                                   value="${T_IAX_ACTIVIDADES.CACTIVI}"
                                   onclick="javascript:objDom.setValorPorId('CACTIVIC', this.value)"/>
                          </div>
                        </display:column>
                        <display:column title="${title0}" sortable="true"
                                        sortProperty="CACTIVI"
                                        style="width:5%" headerClass="sortable" media="html"
                                        autolink="false">
                          <div class="dspNumber" style="text-align:right">
                            ${T_IAX_ACTIVIDADES.CACTIVI}
                          </div>
                        </display:column>
                        <display:column title="${title1}" sortable="true"
                                        sortProperty="TACTIVI"
                                        style="width:70%" headerClass="sortable"
                                        media="html" autolink="false">
                          <div class="dspText">
                            ${T_IAX_ACTIVIDADES.TACTIVI}
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
    <!-- Area de campos  -->
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axispro034</c:param><c:param name="__botones">salir,103669</c:param></c:import>
</form>
<c:import url="../include/mensajes.jsp" />
</body>
</html>
