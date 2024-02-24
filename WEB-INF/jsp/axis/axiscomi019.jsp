<%/**
*  Fichero: axiscomi019.jsp
*  Pantalla de consulta / mantenimiento de usuarios.
*  @author <a href = "mailto:igil@csi-ti.com">Ivan Gil</a>  
*
*  Fecha: 11/07/2008
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
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
        <title><axis:alt f="axiscomi019" c="NOMBREPANTALLA" lit="formulario.axisnombrepantalla"/></title>
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
                f_cargar_propiedades_pantalla();
                revisarEstilos();
            }

            function f_but_buscar() {
                objUtiles.ejecutarFormulario ("axis_axiscomi019.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }

            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axiscomi019", "cancelar", document.miForm, "_self");
            }           
            
            function f_but_anadir() {
                objDom.setVisibilidadPorId('but_cerrar_modal_axiscomi020', 'hidden');
                objUtiles.abrirModal("axiscomi020", "src", "modal_axiscomi020.do?operation=form&CEMPRES=axis.isNew");        
            }
            
            function f_borrar(SEL_CEMPRESA, SEL_NMES_I, SEL_NMES_F, SEL_PANULAC , obj) {
            
                objDom.setValorPorId("SEL_CEMPRESA", SEL_CEMPRESA);
                objDom.setValorPorId("SEL_NMES_I", SEL_NMES_I);
                objDom.setValorPorId("SEL_NMES_F", SEL_NMES_F);
                objDom.setValorPorId("SEL_PANULAC", SEL_PANULAC);
                if (confirm("<axis:alt f='axiscomi019' c='BORRAR' lit='1000167'/>"))
                    objUtiles.ejecutarFormulario ("axis_axiscomi019.do", "borrar", document.miForm, "_self", objJsMessages.jslit_borrando_registro);
            }

            /****************************************************************************************/
            /********************************* MODAL AXIScomi020 *************************************/
            /****************************************************************************************/
            
            function f_cerrar_modal(cual) {
                objUtiles.cerrarModal(cual);
            }
            
            function f_aceptar_modal(cual) {
               
 
                f_cerrar_modal(cual);
                objUtiles.ejecutarFormulario ("axis_axiscomi019.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
        </script>
    </head>
    
    <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
            <input type="hidden" name="SEL_NMES_I" id="SEL_NMES_I" value="${__formdata.SEL_NMES_I}"/>
            <input type="hidden" name="SEL_NMES_F" id="SEL_NMES_F" value="${__formdata.SEL_NMES_F}"/>
            <input type="hidden" name="SEL_CEMPRESA" id="SEL_CEMPRESA" value="${__formdata.SEL_CEMPRESA}"/>
            <input type="hidden" name="SEL_PANULAC" id="SEL_PANULAC" value="${__formdata.PANULAC}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axiscomi019" c="MANT_RETROCESION" lit="9908134"/></c:param> <%-- Mantenimiento de usuarios --%>
                <c:param name="titulo"><axis:alt f="axiscomi019" c="MANT_RETROCESION_TIT" lit="9908134"/></c:param> <%-- Mantenimiento de usuarios --%>
                <c:param name="form">axiscomi019</c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axiscomi020|<axis:alt f="axiscomi019" c="CAMBIO_DATOS_OF_COMMISIONS" lit="9908134"/></c:param>
            </c:import>

            
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp; </div>                                        
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axiscomi019" c="FILTRO" lit="1000178" /></div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                        <axis:ocultar f="axiscomi019" c="CEMPRESA">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axiscomi019" c="EMPRESA" lit="101619"/></b> <%-- Empresa --%>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axiscomi019" c="NMES_I">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axiscomi019" c="MES_I" lit="9908142"/></b> <%-- Mes Inicial --%>
                                            </td>   
                                        </axis:ocultar>
                                        <axis:ocultar f="axiscomi019" c="NMES_F">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axiscomi019" c="MES_F" lit="9908138"/></b> <%-- Mes final --%>
                                            </td>   
                                        </axis:ocultar>
                                        <axis:ocultar f="axiscomi019" c="PANULAC">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axiscomi019" c="ANULAC" lit="9908139"/></b> <%-- Porcentaje retrocesion comision --%>
                                            </td>   
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axiscomi019" c="CEMPRESA">
                                            <td class="campocaja">                                
                                                <select name="CEMPRESA" id="CEMPRESA" size="1" class="campowidthselect campo campotexto" style="width:79%;">&nbsp;
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axiscomi019" c="CEMPRES" lit="1000348"/> - </option>
                                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTEMPRESAS}">
                                                        <option value = "${element.CEMPRES}"
                                                        <c:if test="${__formdata.CEMPRESA == element.CEMPRES || fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == 1}"> selected = "selected"</c:if>>
                                                            ${element.TEMPRES} 
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td> 
                                        </axis:ocultar>
                                        <axis:ocultar f="axiscomi019" c="NMES_I">

                                            <td class="campocaja">                             
                                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                value="${__formdata.NMES_I}" name="NMES_I" id="NMES_I" formato="entero"
                                                style="width:40%;" title="<axis:alt f="axiscomi019" c="MES_I" lit="9908142"/>" />
                                            </td> 
                                        </axis:ocultar>
                                        <axis:ocultar f="axiscomi019" c="NMES_F">

                                            <td class="campocaja">                             
                                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                value="${__formdata.NMES_F}" name="NMES_F" id="NMES_F" formato="entero"
                                                style="width:40%;" title="<axis:alt f="axiscomi019" c="MES_F" lit="9908138"/>" />
                                            </td> 
                                        </axis:ocultar>
                                        <axis:ocultar f="axiscomi019" c="PANULAC">

                                            <td class="campocaja">                             
                                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                value="${__formdata.PANULAC}" name="PANULAC" id="PANULAC" formato="entero"
                                                style="width:40%;" title="<axis:alt f="axiscomi019" c="ANULAC" lit="9908139"/>" />
                                            </td> 
                                        </axis:ocultar>                                        

 
                                        </tr>              
                                    </table>
                                </td>
                            </tr>
                        </table>
                        
                        <div class="separador">&nbsp; </div>                         
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axiscomi019" c="RESULTADOS_TIT" lit="1000345" /></div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <table class="area" align="center">
                                        <tr>
                                            <td>
                                                <div class="separador">&nbsp; </div>
                                                <%-- DisplayTag Usuarios --%>
                                                <c:set var="title1"><axis:alt f="axiscomi019" c="NMES_I_TIT" lit="9908142"/></c:set>   <%-- Numero mes inicial--%>
                                                <c:set var="title2"><axis:alt f="axiscomi019" c="NMES_F_TIT" lit="9908138"/></c:set>  <%-- Numero mes final --%>
                                                <c:set var="title3"><axis:alt f="axiscomi019" c="PANULAC_TIT" lit="9908139"/></c:set>  <%-- Porcentaje retrocesion comision --%>
                                                <div class="displayspaceMaximo">
                                                    <display:table name="${__formdata.LSTPRETCOMI}" id="LSTPRETCOMI" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                         requestURI="axis_axiscomi019.do?paginar=true">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column title="${title1}" sortable="true" sortProperty="NMES_I" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${LSTPRETCOMI.NMES_I}
                                                            </div>
                                                        </display:column>
                                                        <axis:visible f="axiscomi019" c="NMES_F" >
                                                        <display:column title="${title2}" sortable="true" sortProperty="NMES_F" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${LSTPRETCOMI.NMES_F}
                                                            </div>
                                                        </display:column>
                                                        </axis:visible>
                                                        <display:column title="${title3}" sortable="true" sortProperty="PANULAC" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${LSTPRETCOMI.PANULAC}
                                                            </div>
                                                        </display:column>       
                                                     
                                                        <display:column title="" sortable="true" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                             <div class="dspIcons">
                                                               <axis:visible f="axiscomi019" c="BUT_MODIFICAR" >
                                                                <a href="javascript:objDom.setVisibilidadPorId('but_cerrar_modal_axiscomi020', 'hidden');objUtiles.abrirModal('axiscomi020', 'src', 'modal_axiscomi020.do?operation=form&CEMPRES=${LSTPRETCOMI.CEMPRES}&NMES_I=${LSTPRETCOMI.NMES_I}&NMES_F=${LSTPRETCOMI.NMES_F}&PANULAC=${LSTPRETCOMI.PANULAC}')"><img border="0" alt="<axis:alt f='axiscomi019' c='EDITAR' lit='9908140'/>"  
                                                                title="<axis:alt f='axiscomi019' c='EDITAR_TOT' lit='9908140'/>" src="images/lapiz.gif"/></a>
                                                                </axis:visible>
                                                                </div>
                                                           
                                                        </display:column>  

                                                        <axis:visible f="axiscomi019" c="BTN_DEL" >
                                                        <display:column title=""
                                                                    headerClass="headwidth5 sortable"
                                                                    media="html"
                                                                    autolink="false">
                                                        <div class="dspIcons">
                                                            <a href="javascript:f_borrar('${LSTPRETCOMI.CEMPRES}', '${LSTPRETCOMI.NMES_I}', '${LSTPRETCOMI.NMES_F}', '${LSTPRETCOMI.PANULAC}', this)">
                                                                <img border="0"
                                                                     alt='<axis:alt f="axiscomi019" c="ICO_DEL" lit="1000127" />'
                                                                     title='<axis:alt f="axiscomi019" c="ICO_DEL" lit="1000127" />'
                                                                     src="images/delete.gif"/>
                                                            </a>
                                                        </div>
                                                        </display:column>
                                                        </axis:visible>
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
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axiscomi019</c:param>
                <c:param name="__botones">salir<axis:visible f="axiscomi019" c="BUT_ANADIR" >,anadir</axis:visible></c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>