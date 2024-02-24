<%/**
*  Fichero: axispro029.jsp
*  Pantalla de mantenimiento de tipos de provisiones.
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>  
*
*  Fecha: 07/01/2009
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
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
                document.getElementById("CEMPRES").focus();
            }
            
            function f_but_buscar() {
                if (objValidador.validaEntrada())
                    objUtiles.ejecutarFormulario ("axis_axispro029.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }

            function f_but_nuevo() {
                if (objValidador.validaEntrada())
                    objUtiles.abrirModal('axispro030', 'src', 'modal_axispro030.do?operation=form&isNew=true&CEMPRES=' + objDom.getValorPorId("CEMPRES"));
            }

            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axispro029", "cancelar", document.miForm, "_self");
            }           
            
            /****************************************************************************************/
            /********************************* MODAL AXISIMP005 *************************************/
            /****************************************************************************************/
            
            function f_cerrar_modal(cual) {
                objUtiles.cerrarModal(cual);
            }
            
            function f_aceptar_modal(cual, params) {
                f_cerrar_modal(cual);
                if (cual == "axispro030" )
                    // Recargar AXISPRO029
                    objUtiles.ejecutarFormulario ("axis_axispro029.do" + (!objUtiles.estaVacio(params) ? params : ""), 
                        "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }

            /*
            function f_borrar_provision(CPROVIS) {
                // if (confirm("<fmt:message key='1000167'/>"))
                    // objUtiles.ejecutarFormulario ("axis_axispro029.do?CPROVIS=" + CUSUARI, "borrar", document.miForm, "_self");
            }
            */

        </script>
    </head>
   
    <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>             
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><fmt:message key="9000727"/></c:param> <%-- Mantenimiento de Tipos de Provisiones --%>
                <c:param name="titulo"><fmt:message key="9000727"/></c:param>     <%-- Mantenimiento de Tipos de Provisiones --%>
                <c:param name="form">axispro029</c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axispro030|<fmt:message key="9000728"/></c:param> <%-- Mantenimiento de Provisiones --%>
            </c:import>
            
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp; </div>                                        
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                                <b><fmt:message key="101619"/></b>   <%-- Empresa --%>
                                            </td>
                                            <td class="titulocaja">
                                                &nbsp;
                                            </td>                    
                                        </tr>
                                        <tr>
                                            <%-- Empresa --%>
                                            <td class="campocaja">
                                                <select name = "CEMPRES" id ="CEMPRES" size="1" onchange="f_but_buscar()" class="campo campotexto" style="width:90%" obligatorio="true"
                                                title="<fmt:message key="101619"/>">
                                                    <option value="null"> - <fmt:message key="1000348"/> - </option>
                                                    <c:forEach items="${__formdata.LISTVALORES.LSTEMPRESAS}" var="item">
                                                        <option value = "${item.CEMPRES}" <c:if test="${__formdata.CEMPRES != 'null' && __formdata.CEMPRES == item.CEMPRES}"> selected </c:if>>${item.TEMPRES}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            
                                            <td class="campocaja">
                                            <!--    <img id="find" border="0" src="images/find.gif" onclick="f_but_buscar()" style="cursor:pointer" alt="<fmt:message key="9000508"/>" title="<fmt:message key="9000508"/>"/>
                                            -->
                                            </td>
                                        <tr>
                                            <td colspan = "4">
                                                <div class="separador">&nbsp; </div>                                        
                                                <div class="separador">&nbsp; </div>                                        
                                                <%-- DisplayTag Provisiones --%>
                                                <c:set var="title0"><fmt:message key="1000518"/></c:set>  <%-- Provisión --%>
                                                <c:set var="title1"><fmt:message key="9000437"/></c:set>  <%-- F. Alta --%>
        
                                                <div class="displayspaceMaximo">
                                                    <display:table name="${requestScope.LSTPROVISIONES}" id="LSTPROVISIONES" export="false" class="dsptgtable" pagesize="-1" cellpadding="0" cellspacing="0"
                                                         requestURI="axis_axispro029.do?paginar=true">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column title="${title0}" sortable="true" sortProperty="TCPROVIS" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${LSTPROVISIONES.TCPROVIS} - ${LSTPROVISIONES.TLPROVIS}
                                                            </div>
                                                        </display:column>
                                                        <display:column title="${title1}" sortable="true" sortProperty="FALTA" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                <fmt:formatDate value="${LSTPROVISIONES.FALTA}" pattern="dd/MM/yyy"/>
                                                            </div>
                                                        </display:column>
                                                        <display:column title="" sortable="true" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                             <div class="dspIcons">                                                                
                                                                <a href="javascript:objUtiles.abrirModal('axispro030', 'src', 'modal_axispro030.do?operation=form&isNew=false&CEMPRES=${__formdata.CEMPRES}&CPROVIS=${LSTPROVISIONES.CPROVIS}')"><img border="0" alt="<fmt:message key='100002'/>"  
                                                                title="<fmt:message key='100002'/>" src="images/lapiz.gif"/></a></div>
                                                            </div>
                                                        </display:column>               
                                                        <%-- Borrar provisión? 
                                                        <display:column title="" sortable="true" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                             <div class="dspIcons">
                                                                <a href="javascript:f_borrar_provision('${LSTUSUARIOS.CPROVIS}')"><img border="0" alt="<fmt:message key='1000127'/>"  
                                                                title="<fmt:message key='1000127'/>" src="images/delete.gif"/></a></div>
                                                            </div>
                                                        </display:column>               
                                                        --%>
                                                    </display:table>                                                        
                                                </div>
                                                <div class="separador">&nbsp; </div>                                        
                                            </td>                                                
                                        </tr>
                                    </table>           
                                </td>
                            </tr>
                        </table>                        
                        
                        <div class="separador">&nbsp; </div>                                        
                        <c:import url="../include/botonera_nt.jsp">
                            <c:param name="f">axispro029</c:param>
                            <c:param name="__botones">salir,nuevo</c:param>
                        </c:import>
                        
                    </td>
                </tr>
            </table>
            
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>
