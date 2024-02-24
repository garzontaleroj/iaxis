<%/*
*  Fichero: axisgfi002.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a> 
*
*  Fecha: 16/07/2009
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
    <title><axis:alt f="axisgfi006" c="TITULO_HTML" lit="9000439"/></title> <%-- CONSULTA DE REEMBOLSOS --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>

    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {   
                        
            var numTramo = 0;// var numReembolso = {fn:length(__formdata.NREEMB)};
             <c:if test="${empty __formdata.NTRAMO &&  empty lista}">
                 f_but_buscar();
             </c:if>
                    
                       
             f_cargar_propiedades_pantalla();
        }
        
        function f_but_salir() {
            //alert("salir");
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisgfi006", "cancelar", document.miForm, "_self");
        }
        
        function f_but_buscar() {
            f_abrir_modal('axisgfi017', true);
        }
        
        function f_but_alta(NTRAMO,CONCEPTO,CONCEPTO_FRANJA,CONCEPTO_VALOR,isNew) {
           
            CONCEPTO = objUtiles.replaceAll(CONCEPTO, "-quote-", "\'");
            CONCEPTO_FRANJA = objUtiles.replaceAll(CONCEPTO_FRANJA, "-quote-", "\'");
            CONCEPTO_VALOR = objUtiles.replaceAll(CONCEPTO_VALOR, "-quote-", "\'");
            f_abrir_modal('axisgfi013', true,'&isNew='+isNew+'&NTRAMO='+NTRAMO+'&CONCEPTO='+CONCEPTO+'&CONCEPTO_FRANJA='+CONCEPTO_FRANJA+'&CONCEPTO_VALOR='+CONCEPTO_VALOR);
        }
        
        function f_but_vigencias(NTRAMO,CONCEPTO,CONCEPTO_FRANJA,CONCEPTO_VALOR){
             f_abrir_modal('axisgfi014', true,'&NTRAMO='+NTRAMO+'&CONCEPTO='+CONCEPTO+'&CONCEPTO_FRANJA='+CONCEPTO_FRANJA+'&CONCEPTO_VALOR='+CONCEPTO_VALOR);
        }
        
        function f_but_aceptar() {
            //objUtiles.ejecutarFormulario("axis_axisgfi006.do?NTRAMO="+NTRAMO+"&CONCEPTO="+CONCEPTO, "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisgfi006", "cancelar", document.miForm, "_self");
        }
        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
        
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            //if (noXButton) 
                //objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
        
        
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        
        function f_aceptar_modal(cual, params) {
            f_cerrar_modal(cual);
        }
        
        function f_aceptar_axigfi017(NTRAMO,CONCEPTO){
            
            CONCEPTO = objUtiles.replaceAll(CONCEPTO, "-quote-", "\'");
            
            f_cerrar_modal('axisgfi017');
            //alert("Antes de la llamada al formulario");
            objUtiles.ejecutarFormulario("axis_axisgfi006.do?NTRAMO="+NTRAMO+"&CONCEPTO="+CONCEPTO, "consultar", document.miForm, "_self", objJsMessages.jslit_cargando);
            
        }
        
        function f_aceptar_axigfi013(NTRAMO,CONCEPTO,CONCEPTO_FRANJA,CONCEPTO_VALOR){
           f_cerrar_modal('axisgfi013');
           objUtiles.ejecutarFormulario("axis_axisgfi006.do", "consultar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_editar_tramo(NTRAMO,CONCEPTO,CONCEPTO_FRANJA,CONCEPTO_VALOR){
            
            CONCEPTO = objUtiles.replaceAll(CONCEPTO, "-quote-", "\'");
            CONCEPTO_FRANJA = objUtiles.replaceAll(CONCEPTO_FRANJA, "-quote-", "\'");
            CONCEPTO_VALOR = objUtiles.replaceAll(CONCEPTO_VALOR, "-quote-", "\'");
            f_but_alta(NTRAMO,CONCEPTO,CONCEPTO_FRANJA,CONCEPTO_VALOR,0);
        }
        
        
        function mostrar(nombreCapa){ 
            document.getElementById(nombreCapa).style.visibility="visible"; 
        } 

        function ocultar(nombreCapa){ 
        document.getElementById(nombreCapa).style.visibility="hidden"; 
        } 
        
        function f_but_borrar_tramo(NTRAMO){
            var resultado = confirm('<axis:alt f="axisgfi006" c="BORRAR" lit="9000711"/>'); 
            if(resultado){
                objUtiles.ejecutarFormulario("axis_axisgfi006.do?NTRAMO="+NTRAMO, "borrar_tramo", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        

    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    <input type="hidden" name="operation" value="" />
    <input type="hidden" name="TRAMO_INICIAL" value="${ __formdata.TRAMO_INICIAL}" />
    <input type="hidden" name="CONCEPTO_INICIAL" value="${ __formdata.CONCEPTO_INICIAL}" />
    
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisgfi006" c="TITULO_AXISGFI006" lit="108676"/></c:param>     <%-- Pantalla TRAMOS --%>
                <c:param name="formulario"><axis:alt f="axisgfi006" c="FORM_AXISGFI006" lit="108676"/></c:param> <%-- Pantalla TRAMOS --%>
                <c:param name="form">axisgfi006</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisgfi017|<axis:alt f="axisgfi006" c="TITULO_AXISGFI017" lit="9001995"/>|XoN</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisgfi013|<axis:alt f="axisgfi006" c="TITULO_AXISGFI013" lit="9002000"/>|XoN</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisgfi014|<axis:alt f="axisgfi006" c="TITULO_AXISGFI014" lit="9002001"/>|XoN</c:param>
        </c:import>
        
        <div class="separador">&nbsp;</div>
                   <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">            
                        <tr>
                            <td>
                                <div class="titulo" >
                            <div style="float:left;">
                            <img src="images/flecha.gif"/><axis:alt f="axisgfi006" c="LIT_9001996" lit="9001996"/>
                               <axis:ocultar f="axisgfi006" c="BT_BUSCARTRAMOS" dejarHueco="false">                   
                                  <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisgfi006" c="LIT_9000508" lit="9000508"/>" title="" onclick="f_abrir_modal('axisgfi017', true);" style="cursor:pointer"/>
                               </axis:ocultar>                       
                               </div>
                               
                               <div style="float:right;">
                                   <axis:ocultar f="axisgfi006" c="BT_BUSCARTRAMOS" dejarHueco="false">    
                                        <img id="find" border="0" src="images/new.gif" alt="<axis:alt f="axisgfi006" c="LIT_9000508" lit="9000508"/>" title="" onclick="f_but_alta('','','','','1')" style="cursor:pointer"/>
                                    </axis:ocultar>
                               </div>
                            </div>
                                
                                <table class="seccion">
                                    <tr>
                                        <td>
                                            <table class="area" align="center">                    
                                                <tr>
                                                    <th style="width:25%;height:0%;"/>
                                                    <th style="width:25%;height:0%;"/>
                                                    <th style="width:25%;height:0%;"/>
                                                    <th style="width:25%;height:0%;"/>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                                    <c:set var="title0"><axis:alt f="axisgfi006" c="TRAMO" lit="9000609"/></c:set>  <%-- Tramo --%>
                                                                    <c:set var="title1"><axis:alt f="axisgfi006" c="CONCEPTO" lit="9000715"/></c:set>  <%-- Concepto --%>
                                                                    <c:set var="title2"><axis:alt f="axisgfi006" c="CONCEPTO_FRANJA" lit="9001997"/></c:set>  <%-- Concepto franja --%>
                                                                    <c:set var="title3"><axis:alt f="axisgfi006" c="CONCEPTO_VALOR" lit="9001998"/></c:set>  <%-- Concepto valor --%>
                                                                    <c:set var="title4"><axis:alt f="axisgfi006" c="EDITAR" lit="9000724"/></c:set>  <%-- Modificar --%>
                                                                    <c:set var="title5"><axis:alt f="axisgfi006" c="VIGENCIAS" lit="9001999"/></c:set>  <%-- Vigencias --%>
                                                                    <c:set var="title6"><axis:alt f="axisgfi006" c="BORRAR" lit="1000127"/></c:set>  <%-- Eliminar --%>
                                                                    <c:set var="quote">'</c:set>
                                                                    <div id="dt_tramos" class="seccion displayspaceMaximo">
                                                                                <display:table name="${lista}" id="LSTTRAMOS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                                                             requestURI="axis_axisgfi006.do?paginar=true">
                                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                                <display:column title="${title0}" sortable="true" sortProperty="TRAMO" headerClass="sortable"  media="html" autolink="false" >
                                                                                    <div class="dspNumber">
                                                                                                ${LSTTRAMOS.TRAMO}
                                                                                    </div>
                                                                                </display:column>
                                                                                <display:column title="${title1}" sortable="true" sortProperty="CONCEPTO" headerClass="sortable"  media="html" autolink="false" >
                                                                                    <div class="dspNumber">
                                                                                                ${LSTTRAMOS.CONCEPTO}
                                                                                    </div>
                                                                                </display:column>
                                                                                <display:column title="${title2}" sortable="true" sortProperty="CONCEPTO_FRANJA" headerClass="sortable"  media="html" autolink="false" >
                                                                                    <div class="dspText">
                                                                                        
                                                                                            ${LSTTRAMOS.CONCEPTO_FRANJA}
                                                                                    </div>
                                                                                </display:column>
                                                                                <display:column title="${title3}" sortable="true" sortProperty="CONCEPTO_VALOR" headerClass="sortable"  media="html" autolink="false" >
                                                                                    <div class="dspText">
                                                                                       
                                                                                            ${LSTTRAMOS.CONCEPTO_VALOR}
                                                                                    </div>
                                                                                </display:column>
                                                                                <c:set var="V_CONCEPTO">${empty LSTTRAMOS.CONCEPTO ? "" : fn:replace(LSTTRAMOS.CONCEPTO, quote, '-quote-')}</c:set>
                                                                                <c:set var="V_CONCEPTO_FRANJA">${empty LSTTRAMOS.CONCEPTO_FRANJA ? "" : fn:replace(LSTTRAMOS.CONCEPTO_FRANJA, quote, '-quote-')}</c:set>
                                                                                <c:set var="V_CONCEPTO_VALOR">${empty LSTTRAMOS.CONCEPTO_VALOR ? "" : fn:replace(LSTTRAMOS.CONCEPTO_VALOR, quote, '-quote-')}</c:set>
                                                                                <display:column title="${title4}" sortable="false"  headerClass="sortable"  media="html" autolink="false" >
                                                                                
                                                                                    <div class="dspIcons"><img border="0" alt="<axis:alt f="axisgfi006" c="EDITAR" lit="100002"/>" title="<axis:alt f="axisgfi006" c="EDITAR" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                                                    style="cursor:pointer;vertical-align:middle;" 
                                                                                    onclick="javascript:f_but_editar_tramo('${LSTTRAMOS.TRAMO}','${V_CONCEPTO}','${V_CONCEPTO_FRANJA}','${V_CONCEPTO_VALOR}');"  />
                                                                                    </div><!--Editar una plantilla -->
                                                                                </display:column>
                                                                                <display:column title="${title5}" sortable="false"  headerClass="sortable"  media="html" autolink="false" >
                                                                                    <div class="dspIcons"><img border="0" alt="<axis:alt f="axisgfi006" c="VIGENCIAS" lit="9001999"/>" title="<axis:alt f="axisgfi006" c="VIGENCIAS" lit="9001999"/>" src="images/mes.gif" 
                                                                                    style="cursor:pointer;vertical-align:middle;" 
                                                                                    onclick="javascript:f_but_vigencias('${LSTTRAMOS.TRAMO}','${V_CONCEPTO}','${V_CONCEPTO_FRANJA}','${V_CONCEPTO_VALOR}');"  />
                                                                                    </div><!--Editar una plantilla -->
                                                                                </display:column>
                                                                                <display:column title="${title6}" sortable="false"  headerClass="sortable"  media="html" autolink="false" >
                                                                                    <div class="dspIcons"><img border="0" alt="<axis:alt f="axisgfi006" c="BORRAR" lit="1000127"/>" title="<axis:alt f="axisgfi006" c="BORRAR" lit="1000127"/>" src="images/delete.gif" width="15px" height="15px"
                                                                                    style="cursor:pointer;vertical-align:middle;" 
                                                                                    onclick="javascript:f_but_borrar_tramo('${LSTTRAMOS.TRAMO}');"  />
                                                                                    </div><!--Editar una plantilla -->
                                                                                </display:column>
                                                                                
                                                                            </display:table>
                                                                    </div>
                               
                                                    </td>
                                                </tr>
                                                <%--tr>
                                                    <td colspan="4" align="right">           
                                                        <input type="button" onclick="f_but_alta('','','','')" class="boton" style="margin-right:20px;" value="<axis:alt f='axisgfi006' c='ALTA' lit='1000428'/>"/>
                                                    </td>
                                                </tr--%>
                       
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisgfi006</c:param>
            <c:param name="__botones">salir</c:param> 
            <%--c:param name="__botones">cancelar,aceptar</c:param--%> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
</body>
</html>