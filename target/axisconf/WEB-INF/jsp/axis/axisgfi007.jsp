<%/*
*  Fichero: axisgfi007.jsp - BUCLES
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a> 
*
*  Fecha: 29/07/2009
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
    <title><axis:alt f="axisgfi007" c="TITULO_HTML" lit="9000439"/></title> <%-- CONSULTA DE REEMBOLSOS --%>
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
             <c:if test="${empty __formdata.BUCLE &&  empty lista_bucles}">
                 f_but_buscar();
             </c:if>
                    
                       
             f_cargar_propiedades_pantalla();
        }
        
        function f_but_salir() {
            //alert("salir");
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisgfi007", "cancelar", document.miForm, "_self");
        }
        
        function f_but_buscar() {
            f_abrir_modal('axisgfi018', true);
        }
        
        function f_but_alta(TERMINO,NITERAC,OPERACION,NEW) {
           
            TERMINO = objUtiles.replaceAll(TERMINO, "-quote-", "\'");
            NITERAC = objUtiles.replaceAll(NITERAC, "-quote-", "\'");
            
            //alert(OPERACION); //alert(NEW);
            f_abrir_modal('axisgfi019', true,'&TERMINO='+TERMINO+'&NITERAC='+NITERAC+'&OPERACION='+OPERACION+'&NEW='+NEW);
        }
        
       
        function f_but_aceptar() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisgfi007", "cancelar", document.miForm, "_self");
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
        
        
        function f_abrir_modal_axisgfi019(cual, noXButton, optionalQueryString) {
        
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
        
              
        function f_aceptar_axisgfi018(TERMINO,ITERACION,OPERACION){
            document.getElementById('TERMINO').value = objUtiles.replaceAll(TERMINO, "-quote-", "\'");
            document.getElementById('ITERACION').value = objUtiles.replaceAll(ITERACION, "-quote-", "\'");
            document.getElementById('OPERACION').value = objUtiles.replaceAll(OPERACION, "-quote-", "\'");
            f_cerrar_modal('axisgfi018');
            //alert("Antes de la llamada al formulario");
            objUtiles.ejecutarFormulario("axis_axisgfi007.do", "consultar", document.miForm, "_self", objJsMessages.jslit_cargando);
            
        }
        
        
        function f_aceptar_axigfi019 (TERMINO,ITERACION,OPERACION,NEW){
            //alert("f_aceptar_axigfi019");
            f_cerrar_modal('axisgfi019');
            document.miForm.OPERAC.value=OPERACION;
            document.getElementById('TERMINO').value = objUtiles.replaceAll(TERMINO, "-quote-", "\'");
            document.getElementById('ITERACION').value = objUtiles.replaceAll(ITERACION, "-quote-", "\'");
            //alert("Antes de guardar valores del formulario" + ITERACION);
            
            objUtiles.ejecutarFormulario("axis_axisgfi007.do?NEW="+NEW, "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
        
        }
        
        function f_but_editar_bucle(TERMINO,NITERAC,OPERACION,NEW){
            TERMINO = objUtiles.replaceAll(TERMINO, "-quote-", "\'");
            NITERAC = objUtiles.replaceAll(NITERAC, "-dc-", "\"");
            NITERAC = objUtiles.replaceAll(NITERAC, "-colon-", "\,");
            OPERACION = objUtiles.replaceAll(OPERACION, "-quote-", "\'");
            //alert(NITERAC); //alert(NEW);
            f_abrir_modal('axisgfi019', true,'&TERMINO='+TERMINO+'&NITERAC='+NITERAC+'&OPERACION='+OPERACION+'&NEW='+NEW);
        
        }
        
        
        function mostrar(nombreCapa){ 
            document.getElementById(nombreCapa).style.visibility="visible"; 
        } 

        function ocultar(nombreCapa){ 
        document.getElementById(nombreCapa).style.visibility="hidden"; 
        } 
        
        function f_but_borrar_bucle(TERMINO){
            var resultado = confirm('<axis:alt f="axisgfi007" c="BORRAR" lit="9000711"/>'); 
           
            if(resultado){
                objUtiles.ejecutarFormulario("axis_axisgfi007.do?TERME="+TERMINO, "borrar_bucle", document.miForm, "_self", objJsMessages.jslit_cargando);
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
    <input type="hidden" name="TERMINO" id="TERMINO" value="${ __formdata.TERMINO}" />
    <input type="hidden" name="ITERACION" id="ITERACION" value="${ __formdata.ITERACION}" />
    <input type="hidden" name="OPERACION" id="OPERACION" value="${ __formdata.OPERACION}" />
    
    <input type="hidden" name="OPERAC" value="" />
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisgfi007" c="TITULO" lit="9002036"/></c:param>     <%-- Pantalla BUCLES --%>
                <c:param name="formulario"><axis:alt f="axisgfi007" c="FORM" lit="9002036"/></c:param> <%-- Pantalla BUCLES --%>
                <c:param name="form">axisgfi007</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisgfi018|<axis:alt f="axisgfi007" c="TITULO_AXISGFI018" lit="9002040"/>|XoN</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisgfi019|<axis:alt f="axisgfi007" c="TITULO_AXISGFI019" lit="9901761"/>|XoN</c:param>
        </c:import>
                
                   <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">            
                        <tr>
                            <td>
                             <div class="titulo">
                            <img src="images/flecha.gif"/>
                            <b><axis:alt f="axisgfi007" c="LIT_9002146" lit="9002146"/>&nbsp;</b><img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisgfi007" c="LIT_9000508" lit="9000508"/>" title="" onclick="f_abrir_modal('axisgfi018', true);" style="cursor:pointer"/>
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
                                                                    <c:set var="title0"></c:set>  <%--  --%>
                                                                    <c:set var="title1"><axis:alt f="axisgfi007" c="TERMINO" lit="9001991"/></c:set>  <%-- Termino --%>
                                                                    <c:set var="title2"><axis:alt f="axisgfi007" c="NITERAC" lit="9002037"/></c:set>  <%-- Iteracion --%>
                                                                    <c:set var="title3"><axis:alt f="axisgfi007" c="OPERACION" lit="9002038"/></c:set>  <%-- Operación --%>
                                                                    <c:set var="title4"><axis:alt f="axisgfi007" c="EDITAR" lit="9000724"/></c:set>  <%-- Modificar --%>
                                                                    <c:set var="title6"><axis:alt f="axisgfi007" c="BORRAR" lit="1000127"/></c:set>  <%-- Eliminar --%>
                                                                    <c:set var="quote">'</c:set>
                                                                    <c:set var="colon">,</c:set>
                                                                    <c:set var="dc">"</c:set>
                                                                    <div id="dt_tramos" class="seccion displayspaceMaximo">
                                                                                <display:table name="${lista_bucles}" id="LSTBUCLES" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                                                             requestURI="axis_axisgfi007.do?paginar=true">
                                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                                
                                                                                <display:column title="${title1}" sortable="true" sortProperty="TERMINO" headerClass="sortable"  media="html" autolink="false" >
                                                                                    <div class="dspNumber">
                                                                                                ${LSTBUCLES.TERMINO}
                                                                                    </div>
                                                                                </display:column>
                                                                                <display:column title="${title2}" sortable="true" sortProperty="NITERAC" headerClass="sortable"  media="html" autolink="false" >
                                                                                    <div class="dspText">
                                                                                                ${LSTBUCLES.NITERAC}
                                                                                    </div>
                                                                                </display:column>
                                                                                <display:column title="${title3}" sortable="true" sortProperty="OPERACION" headerClass="sortable"  media="html" autolink="false" >
                                                                                    <div class="dspText">
                                                                                                ${LSTBUCLES.OPERACION}
                                                                                    </div>
                                                                                </display:column>
                                                                                <c:set var="V_TERMINO">${empty  LSTBUCLES.TERMINO ? "," : fn:replace(LSTBUCLES.TERMINO, colon, '-colon-')}</c:set>
                                                                                <c:set var="V_NITERAC">${empty  LSTBUCLES.NITERAC ? "," : fn:replace(LSTBUCLES.NITERAC, colon, '-colon-')}</c:set>
                                                                                <c:set var="V_NITERA">${empty  V_NITERAC ? "" : fn:replace(V_NITERAC, dc, '-dc-')}</c:set>
                                                                                <display:column title="${title4}" sortable="false"  headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                                                
                                                                                    <div class="dspIcons"><img border="0" alt="<axis:alt f="axisgfi007" c="EDITAR" lit="100002"/>" title="<axis:alt f="axisgfi007" c="EDITAR" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                                                    style="cursor:pointer;vertical-align:middle;" 
                                                                                    onclick="javascript:f_but_editar_bucle('${V_TERMINO}','${V_NITERA}','${LSTBUCLES.OPERACION}','0');"  />
                                                                                    </div><!--Editar una plantilla -->
                                                                                </display:column>
                                                                                
                                                                                <display:column title="${title6}" sortable="false"  headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                                                    <div class="dspIcons"><img border="0" alt="<axis:alt f="axisgfi007" c="BORRAR" lit="1000127"/>" title="<axis:alt f="axisgfi007" c="BORRAR" lit="1000127"/>" src="images/delete.gif" width="15px" height="15px"
                                                                                    style="cursor:pointer;vertical-align:middle;" 
                                                                                    onclick="javascript:f_but_borrar_bucle('${V_TERMINO}');"  />
                                                                                    </div><!--Editar una plantilla -->
                                                                                </display:column>
                                                                                
                                                                            </display:table>
                                                                    </div>
                               
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4" align="right">           
                                                        <input type="button" onclick="f_but_alta('','','','1')" class="boton" style="margin-right:20px;" value="<axis:alt f='axisgfi007' c='ALTA' lit='1000428'/>"/>
                                                    </td>
                                                </tr>
                       
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisgfi007</c:param>
            <c:param name="__botones">salir</c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
</body>
</html>