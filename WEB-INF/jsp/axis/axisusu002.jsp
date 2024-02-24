<%/**
*  Fichero: axisusu002.jsp
*  Pantalla de consulta / mantenimiento de usuarios.
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>  
*
*  Fecha: 11/07/2008
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
 
<html>
    <head>
        <title><axis:alt f="axisusu002" c="NOMBREPANTALLA" lit="formulario.axisnombrepantalla"/></title>
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
                objUtiles.ejecutarFormulario ("axis_axisusu002.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }

            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisusu002", "cancelar", document.miForm, "_self");
            }           
            
            function f_but_anadir() {
                objDom.setVisibilidadPorId('but_cerrar_modal_axisusu003', 'hidden');
                objUtiles.abrirModal("axisusu003", "src", "modal_axisusu003.do?operation=form&usuario=axis.isNewUser");        
            }
            
            function f_borrar_usuario(CUSUARI) {
                if (confirm("<axis:alt f='axisusu002' c='BORRAR' lit='1000167'/>"))
                    objUtiles.ejecutarFormulario ("axis_axisusu002.do?CUSUARI=" + CUSUARI, "borrar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }

            /****************************************************************************************/
            /********************************* MODAL AXISUSU003 *************************************/
            /****************************************************************************************/
            
            function f_cerrar_modal(cual) {
                objUtiles.cerrarModal("axisusu003");
            }
            
            function f_aceptar_modal(cual) {
                objDom.setValorPorId("USERNAME", "");
                objDom.setValorPorId("CDELEGA", "null");
                f_cerrar_modal(cual);
                objUtiles.ejecutarFormulario ("axis_axisusu002.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_cerrar_axisctr014() {
                objUtiles.cerrarModal("axisctr014")
            } 
            
            function f_abrir_axisctr014() {
                if (objValidador.validaEntrada()) {
                    objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
                }
            }
            
            function f_aceptar_axisctr014 (CAGENTE){
                f_cerrar_axisctr014();
                objAjax.invokeAsyncCGI("axis_axisage031.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            }
            
            function callbackAjaxCambiarAgente(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                    var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                    objDom.setValorPorId("CDELEGA", CAGENTEformateado);                      
                }
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
                <c:param name="formulario"><axis:alt f="axisusu002" c="MANT_USUARIOS" lit="9000589"/></c:param> <%-- Mantenimiento de usuarios --%>
                <c:param name="titulo"><axis:alt f="axisusu002" c="MANT_USUARIOS_TIT" lit="9000589"/></c:param> <%-- Mantenimiento de usuarios --%>
                <c:param name="form">axisusu002</c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisusu003|<axis:alt f="axisusu002" c="CAMBIO_DATOS_USUARIO" lit="1000233"/></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisusu002" c="TIT_AXISCTR014" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
            </c:import>

            
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp; </div>                                        
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisusu002" c="FILTRO" lit="1000178" /></div>
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
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisusu002" c="NOMBRE_USUARIO_TIT" lit="101995"/></b> <%-- Nombre usuario --%>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisusu002" c="DELEGACION_TIT" lit="1000561"/></b> <%-- Delegación --%>
                                            </td>
                                            <td class="titulocaja">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="USERNAME" name="USERNAME" size="15"
                                                style="width:80%" value="${__formdata.USERNAME}"/>
                                            </td>
                                            <td class="campocaja" colspan="2">
                                                <select class="campowidthselect campo campotexto" id="CDELEGA" name="CDELEGA" size="1"
                                                style="width:81%" title="<axis:alt f="axisusu002" c="DELEGACION" lit="1000561"/>"/>
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisusu002" c="DELEGACION_VALOR" lit="1000348"/> - </option>
                                                    <c:forEach items="${__formdata.LSTVALORES.LSTAGENTES}" var="item">
                                                        <option value="${item.CODI}" <c:if test="${__formdata.CDELEGA != null && item.CODI  == __formdata.CDELEGA}">selected</c:if>>${item.NOMBRE}</option>
                                                    </c:forEach>
                                                </select>    
                                                &nbsp;&nbsp;
                                                <axis:visible f="axisage031" c="IAGENTE">
                                            		
                                        			<img border="0" id="IAGENTE" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>	                                        	
                                        		</axis:visible>
                                                <!-- <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisusu002" c="BUSCAR" lit="9000508"/>" title="<axis:alt f="axisusu002" c="BUSCAR_TIT" lit="9000508"/>"
                                                onclick="f_but_buscar()" style="cursor:pointer"/>-->
                                            </td>
                                        </tr>              
                                    </table>
                                </td>
                            </tr>
                        </table>
                        
                        <div class="separador">&nbsp; </div>                         
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisusu002" c="RESULTADOS_TIT" lit="1000345" /></div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <table class="area" align="center">
                                        <tr>
                                            <td>
                                                <div class="separador">&nbsp; </div>
                                                <%-- DisplayTag Usuarios --%>
                                                <c:set var="title0"><axis:alt f="axisusu002" c="CODIGOS_TIT" lit="1000109"/></c:set>  <%-- Código --%>
                                                <c:set var="title1"><axis:alt f="axisusu002" c="NOMBRE_USUARIO_TIT" lit="101995"/></c:set>   <%-- Nombre usuario --%>
                                                <c:set var="title2"><axis:alt f="axisusu002" c="IDIOMA_TIT" lit="1000246"/></c:set>  <%-- Idioma --%>
                                                <c:set var="title3"><axis:alt f="axisusu002" c="DELEGACION_TIT" lit="1000561"/></c:set>  <%-- Delegación --%>
                                                <c:set var="title4"><axis:alt f="axisusu002" c="EMPLEADO_TIT" lit="9000588"/></c:set>  <%-- Empleado --%>
                                                <c:set var="title5"><axis:alt f="axisusu002" c="ESTADO_TIT" lit="100587"/></c:set>  <%-- Estado --%>
                                                <div class="displayspaceMaximo">
                                                    <display:table name="${__formdata.LSTUSUARIOS}" id="LSTUSUARIOS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                         requestURI="axis_axisusu002.do?paginar=true">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column title="${title0}" sortable="true" sortProperty="CUSUARI" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                            <a href="javascript:objDom.setVisibilidadPorId('but_cerrar_modal_axisusu003', 'hidden');objUtiles.abrirModal('axisusu003', 'src', 'modal_axisusu003.do?operation=form&usuario=${LSTUSUARIOS.CUSUARI}')">
                                                                ${LSTUSUARIOS.CUSUARI}
                                                                </a>
                                                            </div>
                                                        </display:column>
                                                        <display:column title="${title1}" sortable="true" sortProperty="TUSUNOM" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                            <a href="javascript:objDom.setVisibilidadPorId('but_cerrar_modal_axisusu003', 'hidden');objUtiles.abrirModal('axisusu003', 'src', 'modal_axisusu003.do?operation=form&usuario=${LSTUSUARIOS.CUSUARI}')">
                                                                ${LSTUSUARIOS.TUSUNOM}
                                                                </a>
                                                            </div>
                                                        </display:column>
                                                        <axis:visible f="axisusu002" c="TIDIOMA" >
                                                        <display:column title="${title2}" sortable="true" sortProperty="TIDIOMA" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                            <a href="javascript:objDom.setVisibilidadPorId('but_cerrar_modal_axisusu003', 'hidden');objUtiles.abrirModal('axisusu003', 'src', 'modal_axisusu003.do?operation=form&usuario=${LSTUSUARIOS.CUSUARI}')">
                                                                ${LSTUSUARIOS.TIDIOMA}
                                                                </a>
                                                            </div>
                                                        </display:column>
                                                        </axis:visible>
                                                        <display:column title="${title3}" sortable="true" sortProperty="CDELEGA" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                            <a href="javascript:objDom.setVisibilidadPorId('but_cerrar_modal_axisusu003', 'hidden');objUtiles.abrirModal('axisusu003', 'src', 'modal_axisusu003.do?operation=form&usuario=${LSTUSUARIOS.CUSUARI}')">
                                                                ${LSTUSUARIOS.CDELEGA}
                                                                </a>
                                                            </div>
                                                        </display:column>
                                                        <display:column title="${title5}" sortable="true" sortProperty="CEMPLEADO" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                <a href="javascript:objDom.setVisibilidadPorId('but_cerrar_modal_axisusu003', 'hidden');objUtiles.abrirModal('axisusu003', 'src', 'modal_axisusu003.do?operation=form&usuario=${LSTUSUARIOS.CUSUARI}')">
                                                                ${LSTUSUARIOS.TESTADO}                                           
                                                                </a>
                                                            </div>
                                                        </display:column>  
                                                        <axis:visible f="axisusu002" c="CEMPLEADO" >
                                                        <display:column title="${title4}" sortable="true" sortProperty="CEMPLEADO" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                               <a href="javascript:objDom.setVisibilidadPorId('but_cerrar_modal_axisusu003', 'hidden');objUtiles.abrirModal('axisusu003', 'src', 'modal_axisusu003.do?operation=form&usuario=${LSTUSUARIOS.CUSUARI}')">
                                                                ${LSTUSUARIOS.CEMPLEADO}
                                                                </a>                                           
                                                            </div>
                                                        </display:column>
                                                        </axis:visible>
                                                        <display:column title="" sortable="true" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                             <div class="dspIcons">
                                                               <axis:visible f="axisusu002" c="BUT_MODIFICAR" >
                                                                <a href="javascript:objDom.setVisibilidadPorId('but_cerrar_modal_axisusu003', 'hidden');objUtiles.abrirModal('axisusu003', 'src', 'modal_axisusu003.do?operation=form&usuario=${LSTUSUARIOS.CUSUARI}')"><img border="0" alt="<axis:alt f='axisusu002' c='EDITAR' lit='100002'/>"  
                                                                title="<axis:alt f='axisusu002' c='EDITAR_TOT' lit='100002'/>" src="images/lapiz.gif"/></a>
                                                                </axis:visible>
                                                                </div>
                                                            </div>
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
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisusu002</c:param>
                <c:param name="__botones">salir<axis:visible f="axisusu002" c="BUT_ANADIR" >,anadir</axis:visible>,buscar</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>