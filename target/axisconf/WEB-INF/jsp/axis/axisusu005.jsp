<%/**
*  Fichero: axisusu002.jsp
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavier Gallego</a>  
*
*  Fecha: 11/07/2008
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
 
<html>
    <head>
        <title><fmt:message key="1000233"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <style type="text/css">
            .displayspaceMaximo {
                width:99.8%;
                height: expression( this.scrollHeight > 349 ? "350px" : "auto" );
                max-height:350px;
                overflow-x: hidden;
                overflow-y: auto;
                border: 1px solid #DDDDDD;
            }
        </style>
        <c:import url="../include/carga_framework_js.jsp" />
        
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
                revisarEstilos();
            }


            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisusu005", "cancelar", document.miForm, "_self");
            }           
            
            function f_but_anadir() {
                objUtiles.abrirModal("axisusu006", "src", "modal_axisusu006.do?operation=form");        
            }
            
            function f_but_buscar(){
                objUtiles.ejecutarFormulario ("axis_axisusu005.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_borrar_maquina(CMAQFISI, CTERMINAL){
                var answer = confirm(objJsMessages.jslit_confirma_borrar);
                if (answer){
                    f_borrar_formulario();
                    objUtiles.ejecutarFormulario ("axis_axisusu005.do?CMAQFISIDEL=" + CMAQFISI + "&CTERMINALDEL=" + CTERMINAL, "borrar", document.miForm, "_self", objJsMessages.jslit_borrando_registro);
                }
            } 
            
            /****************************************************************************************/
            /********************************* MODAL AXISUSU003 *************************************/
            /****************************************************************************************/
            function f_axisusu006_aceptar(){
                f_cerrar_modal("axisusu006");
                f_borrar_formulario();
                objUtiles.ejecutarFormulario ("axis_axisusu005.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_cerrar_modal(cual) {
                objUtiles.cerrarModal(cual);
            }
            
            /****************************************************************************************/
            /********************************* OTROS *************************************/
            /****************************************************************************************/
            function f_borrar_formulario(){
                document.miForm.CMAQFISI.value="";
                document.miForm.CTERMINAL.value="";
            }
        </script>
    </head>
    
    <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>             
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><fmt:message key="9000590"/></c:param> <%-- Mantenimiento de terminales --%>
                <c:param name="titulo"><fmt:message key="9000590"/></c:param> <%-- Mantenimiento de terminales --%>
                <c:param name="form">axisusu005</c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisusu006|<fmt:message key="9000590"/></c:param>
            </c:import>

            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp; </div>                                        
                        <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="1000178" /></div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                                <b><fmt:message key="9000596"/></b> <%-- Màquina física --%>
                                            </td>
                                            <td class="titulocaja">
                                                <b><fmt:message key="9000597"/></b> <%-- Terminal --%>
                                            </td>
                                            <td class="titulocaja">
                                                &nbsp;
                                            </td>
                                            <td class="titulocaja">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="CMAQFISI" name="CMAQFISI" size="15"
                                                style="width:80%" value="${__formdata.CMAQFISI}"/>
                                            </td>
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="CTERMINAL" name="CTERMINAL" size="15"
                                                style="80%" value="${__formdata.CTERMINAL}"/>
                                            </td>
                                            <td class="campocaja">
                                                <img id="find" border="0" src="images/find.gif" alt="<fmt:message key="9000508"/>" title="<fmt:message key="9000508"/>"
                                                onclick="f_but_buscar()" style="cursor:pointer"/>
                                            </td>
                                            <td class="titulocaja">
                                                &nbsp;
                                            </td>
                                        </tr>             
                                    </table>
                                </td>
                            </tr>
                        </table>
                        
                        <div class="separador">&nbsp; </div>                         
                        <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="1000345" /></div>
                        <table class="seccion">                            
                            <tr>               
                                <td>
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td colspan = "4">
                                                <%-- DisplayTag Terminales --%>
                                                <c:set var="title0"><fmt:message key="9000596"/></c:set>  <%-- Máquina fisica --%>
                                                <c:set var="title1"><fmt:message key="9000597"/></c:set>    <%-- Terminal --%>
            
                                                <div class="displayspaceMaximo">
                                                    <display:table name="${requestScope.LSTMAQUINAS}" id="LSTMAQUINAS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                         requestURI="axis_axisusu005.do?paginar=true">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column title="${title0}" sortable="true" sortProperty="CMAQFISI" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${LSTMAQUINAS.CMAQFISI}
                                                            </div>
                                                        </display:column>
                                                        <display:column title="${title1}" sortable="true" sortProperty="CTERMINAL" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${LSTMAQUINAS.CTERMINAL}
                                                            </div>
                                                        </display:column>             
                                                        <display:column title="" sortable="true" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                            <div class="dspIcons"><a href="javascript:f_borrar_maquina('${LSTMAQUINAS.CMAQFISI}', '${LSTMAQUINAS.CTERMINAL}')"><img border="0" alt="<fmt:message key="1000127" />" title="<fmt:message key="1000127" />" src="images/delete.gif"/></a></div>
                                                        </display:column>               
                                                    </display:table>                                                        
                                                </div>
                                                <div class="separador">&nbsp; </div>            
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
                <c:param name="f">axisusu005</c:param>
                <c:param name="__botones">salir,anadir</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>