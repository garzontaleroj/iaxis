<%/**
*  Fichero: axisgfi005.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a>
*  
*
* Descripción de pantalla
*
*  Fecha: 03/07/2009
*/
%>

<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axisgfi005" c="TITULO_HTML" lit="1000231"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">
        
            function f_but_salir() {
            //Esborrem les vars de session
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisgfi005", "cancelar", document.axisgfi005, "_self");
            }
            
            function f_onload(){   
               <% if (request.getAttribute("__formdata") != null &&
                       ((java.util.Map) request.getAttribute("__formdata")).get("BUSQUEDA") == null) { %>
                    f_abrir_axisgfi011();
                <% } %>
                f_cargar_propiedades_pantalla();
            }
            
            function f_abrir_axisgfi011(){
                document.axisgfi005.TERMINO_BUS.value = null;
                document.axisgfi005.TIPO_BUS.value = null;
                document.axisgfi005.ORIGEN_BUS.value = null;
                document.axisgfi005.DESCRIPCION_BUS.value = null;
                document.axisgfi005.OPERADOR_BUS.value = null;
                objUtiles.abrirModal("axisgfi011", "src", "modal_axisgfi011.do?operation=form",800,500);
            }
            
            function f_aceptar_axisgfi011(TERMINO,TIPO,ORIGEN,DESCRIPCION,OPERADOR){
                f_cerrar_axisgfi011();
                //TERMINO="+TERMINO+"&TIPO="+TIPO+"&ORIGEN="+ORIGEN+"&DESCRIPCION="+DESCRIPCION+"&OPERADOR="+OPERADOR
                document.getElementById('TERMINO_BUS').value = TERMINO;
                document.getElementById('TIPO_BUS').value = TIPO;
                document.getElementById('ORIGEN_BUS').value = ORIGEN;
                document.getElementById('DESCRIPCION_BUS').value = DESCRIPCION;
                document.getElementById('OPERADOR_BUS').value = OPERADOR;
                objUtiles.ejecutarFormulario ("axis_axisgfi005.do", "buscar", document.axisgfi005, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_cerrar_axisgfi011() {
                objUtiles.cerrarModal("axisgfi011");
            } 
            
            function f_abrir_axisgfi012(NUEVO,TERMINO){
                objUtiles.abrirModal("axisgfi012", "src", "modal_axisgfi012.do?operation=form&TERMINO="+TERMINO+"&NUEVO="+NUEVO,800,500);
            }
            
            function f_cerrar_axisgfi012() {
                objUtiles.cerrarModal("axisgfi012");
            }
            
            function f_aceptar_axisgfi012(termino){
                f_cerrar_axisgfi012();
                <c:choose>                                     
                <c:when test="${!empty __formdata.TERMINOS &&  fn:length(__formdata.TERMINOS) > 1}">
                    objUtiles.ejecutarFormulario ("axis_axisgfi005.do", "buscar", document.axisgfi005, "_self", objJsMessages.jslit_cargando);
                </c:when>
                <c:otherwise>
                 //document.axisgfi005.TERMINO_BUS.value = termino;
                 objUtiles.ejecutarFormulario ("axis_axisgfi005.do", "buscar", document.axisgfi005, "_self", objJsMessages.jslit_cargando);
                </c:otherwise>
                </c:choose>
                
                
            }
            
            function f_borrar_termino(TERMINO){
                var answer = confirm(objJsMessages.jslit_confirma_borrar);
        
                if (answer){
                    objUtiles.ejecutarFormulario ("axis_axisgfi005.do?PTERMINO="+TERMINO, "borrar", document.axisgfi005, "_self", objJsMessages.jslit_cargando);
                   // objUtiles.ejecutarFormulario ("axis_axisgfi005.do", "buscar", document.axisgfi005, "_self", objJsMessages.jslit_cargando);
                }
            }
            
            function f_abrir_axisgfi023(){
                
                var termino;
                if (!objUtiles.estaVacio(document.axisgfi005.checked_termino)) 
                    termino = objUtiles.f_GuardaCasillasChecked("checked_termino");
            
                if (typeof termino == 'boolean' || objUtiles.estaVacio (termino))
                    alert('<axis:alt f="axisgfi005" c="VAL_TERMINO" lit="9002002" />');  
                else{
                    // Si hay una seleccionada, llamar al Action.
                    objUtiles.abrirModal("axisgfi023", "src", "modal_axisgfi023.do?operation=form&TERMINO="+termino,800,500);
                }    
            }
            
            function f_cerrar_axisgfi023() {
                objUtiles.cerrarModal("axisgfi023");
            }
            
            
        </script>
        
    </head>
    
    <body onload="f_onload()">
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisgfi005" c="TITULO_AXISGFI011" lit="9001994" /></c:param>
            <c:param name="nid" value="axisgfi011" />
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisgfi005" c="TITULO_AXISGFI012" lit="9001991" /></c:param>
            <c:param name="nid" value="axisgfi012" />
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisgfi005" c="TITULO_AXISGFI023" lit="9002003" /></c:param>
            <c:param name="nid" value="axisgfi023" />
        </c:import>
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
    <c:set var="pantalla" value="axisgfi005"/>
<form name="axisgfi005" action="" method="POST">
        <input type="hidden" id="operation" name="operation" value="" />
        <input type="hidden" id="TERMINO_BUS" name="TERMINO_BUS" value="${TERMINO_BUS}" />
        <input type="hidden" id="TIPO_BUS" name="TIPO_BUS" value="${TIPO_BUS}" />
        <input type="hidden" id="ORIGEN_BUS" name="ORIGEN_BUS" value="${ORIGEN_BUS}" />
        <input type="hidden" id="DESCRIPCION_BUS" name="DESCRIPCION_BUS" value="${DESCRIPCION_BUS}" />
        <input type="hidden" id="OPERADOR_BUS" name="OPERADOR_BUS" value="${OPERADOR_BUS}" />
        
    <c:set var="pantalla" value="axisgfi005"/>
    <c:set var="literalPantalla" value="9001990"/>
    <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt c="TITULO" f="axisgfi005" lit="9001990"/></c:param>
            <c:param name="formulario"><axis:alt f="axisgfi005" c="TITULO_FORM" lit="${literalPantalla}"/></c:param>
            <c:param name="form">${pantalla}</c:param>
    </c:import>
        
<table>
    <tr>
        <td>
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0"> 
                <tr>
                    <td>
                       <div class="titulo">
                            <img src="images/flecha.gif"/>
                                <axis:alt f="axisgfi005" c="LIT_9001990" lit="9001990" />
                            <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisgfi011()" style="cursor:pointer"/>
                        </div>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:2%;height:0px"></th>
                                <th style="width:76%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:2%;height:0px"></th>
                            </tr>
                            <tr>
                                <td></td>
                                <td align="left" colspan="3" >
                                    <div class="displayspaceMaximo">
                                        <c:set var="title0"><axis:alt f="axisgfi005" c="TERMINO" lit="9001991" /></c:set>
                                        <c:set var="title1"><axis:alt f="axisgfi005" c="TTIPO" lit="100565" /></c:set>
                                        <c:set var="title2"><axis:alt f="axisgfi005" c="TORIGEN" lit="9000443" /></c:set>                               
                                        <c:set var="title3"><axis:alt f="axisgfi005" c="TDESC" lit="100588" /></c:set>
                                        <c:set var="title4"><axis:alt f="axisgfi005" c="TOPERADOR" lit="9001992" /></c:set>
                                        
                                        <display:table name="${__formdata.TERMINOS}" id="TERMINOS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                      requestURI="axis_axisgfi005.do?operation=form&paginar=true" > 
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" style="width:1%">    
                                                <div class="dspIcons"><input type="radio" id="checked_termino" name="checked_termino" value="${TERMINOS.TERMINO}"/></div>
                                            </display:column>
                                            <display:column title="${title0}" sortable="true" sortProperty="" headerClass="sortable fixed"  style="width:20%" media="html" autolink="false" >
                                                <div class="dspText">${TERMINOS.TERMINO} </div>
                                            </display:column>
                                            <display:column title="${title1}" sortable="true" sortProperty="" headerClass="sortable fixed" style="width:7%" media="html" autolink="false" >
                                                <div class="dspText">${TERMINOS.TTIPO} </div>
                                            </display:column>
                                            <display:column title="${title2}" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" style="width:15%" autolink="false" >
                                                <div class="dspText">${TERMINOS.TORIGEN} </div>
                                            </display:column>
                                            <display:column title="${title3}" sortable="true" sortProperty="" headerClass="sortable fixed" style="width:20%" media="html" autolink="false" >
                                                <div class="dspText">${TERMINOS.TDESC}</div>
                                            </display:column>                                   
                                            <display:column title="${title4}" sortable="true" sortProperty="" headerClass="sortable fixed" style="width:7%" media="html" autolink="false" >
                                                <div class="dspText">${TERMINOS.TOPERADOR}</div>
                                            </display:column>                                                                      
                                            <display:column title="" sortable="true" sortProperty="" headerClass="sortable fixed" style="width:5%"  media="html" autolink="false" >
                                                <div class="dspIcons">
                                                            <img border="0"
                                                                 alt='<axis:alt f="axisgfi005" c="EDITAR" lit="9002007"/>'
                                                                 title1='<axis:alt f="axisgfi005" c="EDITAR" lit="9002007"/>'
                                                                 src="images/lapiz.gif"
                                                                 width="15px" height="15px"
                                                                 style="cursor:pointer;"
                                                                 onclick="f_abrir_axisgfi012(0,'${TERMINOS.TERMINO}')"/>
                                                </div>
                                            </display:column>
                                            <display:column title="" sortable="true" sortProperty="" headerClass="sortable fixed" style="width:5%" media="html" autolink="false" >
                                                <div class="dspIcons">
                                                            <img border="0"
                                                                 alt='<axis:alt f="axisgfi005" c="DELETE" lit="9002008"/>'
                                                                 title1='<axis:alt f="axisgfi005" c="DELETE" lit="9002008"/>'
                                                                 src="images/delete.gif"
                                                                 width="15px" height="15px"
                                                                 style="cursor:pointer;"
                                                                onclick="f_borrar_termino('${TERMINOS.TERMINO}')"/>
                                                </div>
                                            </display:column> 
                                        </display:table>
                                    </div>
                                    <div class="separador">&nbsp;</div>
                                </td> 
                            </tr>
                            <tr>
                                <td colspan="2"></td>
                                <td> 
                                    <input type="button" class="boton" id="but_vigencia" value='<axis:alt f="axisgfi005" c="BT_VIGENCIA" lit="9001993" />' 
                                            onclick="f_abrir_axisgfi023()"/>
                                </td>
                                <td > 
                                    <input type="button" class="boton" id="but_añadir" value='<axis:alt f="axisgfi005" c="BT_ANADIR" lit="104825" />' 
                                            onclick="f_abrir_axisgfi012(1)"/>
                                    <div class="separador">&nbsp;</div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>   
            </table>
        </td>
    </tr>
</table>
        
        
<div class="separador">&nbsp;</div>
<!-- Botonera -->
<c:import url="../include/botonera_nt.jsp"><c:param name="f">axisgfi005</c:param><c:param name="f">axisgfi005</c:param>
    <c:param name="__botones">salir</c:param>
</c:import><%--,<axis:visible c="BT_ACEPTAR" f="axisgfi005">aceptar</axis:visible>--%>

</form>

<c:import url="../include/mensajes.jsp" />
    
</body>
</html>

