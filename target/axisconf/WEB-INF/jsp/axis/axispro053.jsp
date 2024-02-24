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
        <title><axis:alt f="axispro053" c="NOMBREPANTALLA" lit="formulario.axisnombrepantalla"/></title>
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
            }

            function f_but_buscar() {
                objUtiles.ejecutarFormulario ("axis_axispro053.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }

            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axispro053", "cancelar", document.miForm, "_self");
            }           
            
            function f_but_anadir() {
                objDom.setVisibilidadPorId('but_cerrar_modal_axispro052', 'hidden');
                objUtiles.abrirModal("axispro052", "src", "modal_axispro052.do?operation=form&usuario=axis.isNewUser");        
            }

            function f_abre_modal(cual, noXButton, optionalQueryString) {

                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";

                if (noXButton)
                    objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");

                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
            }
        
            function f_aceptar_modal(cual, subpantalla) {
                f_cerrar_modal(cual);
                
                if (!objUtiles.estaVacio(subpantalla))
                    document.miForm.subpantalla.value = subpantalla;
                    
                objUtiles.ejecutarFormulario("axis_axispro001.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }

            function f_borrar_interficie(CCODIGO, CVALAXIS) {
                objDom.setValorPorId("CCODIGO_AUX", CCODIGO);
                objDom.setValorPorId("CVALAXIS_AUX", CVALAXIS);
                var answer = confirm(objJsMessages.jslit_confirma_borrar);
                if (answer)            
                    objUtiles.ejecutarFormulario("axis_axispro053.do?", "eliminar_interficie", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            /****************************************************************************************/
            /********************************* MODAL AXISUSU003 *************************************/
            /****************************************************************************************/
            
            function f_cerrar_modal(cual) {
                objUtiles.cerrarModal(cual);
            }

        function f_aceptar_axispro002(SPRODUC) {
            f_cerrar_modal("axispro052");   
            objUtiles.ejecutarFormulario ("axis_axispro053.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        </script>
    </head>
    
    <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>             
            <input type="hidden" name="CCODIGO_AUX" id ="CCODIGO_AUX" value=""/>
            <input type="hidden" name="CVALAXIS_AUX" id ="CVALAXIS_AUX" value=""/>
            <input type="hidden" name="CVALEM_AUXP" id ="CVALEM_AUXP" value=""/>
            <input type="hidden" name="CVALAXISDEF_AUX" id ="CVALAXISDEF_AUX" value=""/>
            <input type="hidden" name="CVALDE_AUXF" id ="CVALDEF_AUX" value=""/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axispro053" c="MANT_INTERFICIES" lit="9906236"/></c:param> <%-- Mantenimiento de interficies --%>
                <c:param name="titulo"><axis:alt f="axispro053" c="MANT_INTERFICIES_TIT" lit="9906236"/></c:param> <%-- Mantenimiento de interficies --%>
                <c:param name="form">axispro053</c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axispro052|<axis:alt f="axispro052" c="MANTENIMIENTO_INTERFACE" lit="9906236"/></c:param>
            </c:import>

            
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp; </div>                                        
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axispro053" c="FILTRO" lit="1000178" /></div>
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
                                                <b><axis:alt f="axispro053" c="CODIGO" lit="1000109"/></b> <%-- Codigo --%>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axispro053" c="VALAXIS" lit="9906215"/></b> <%-- Delegación --%>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axispro053" c="VALEMP" lit="9906216"/></b> <%-- Delegación --%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="CCODIGO" name="CCODIGO" size="15"
                                                style="width:80%" value="${__formdata.CCODIGO}"/>
                                            </td>
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="CVALAXIS" name="CVALAXIS" size="15"
                                                style="width:80%" value="${__formdata.CVALAXIS}"/>
                                            </td>
                                            <td>
                                                <input type="text" class="campowidthinput campo campotexto" id="CVALEMP" name="CVALEMP" size="15"
                                                style="width:80%" value="${__formdata.CVALEMP}"/>&nbsp;&nbsp;&nbsp;&nbsp;
                                                <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axispro053" c="BUSCAR" lit="9000508"/>" title="<axis:alt f="axispro053" c="BUSCAR_TIT" lit="9000508"/>"
                                                onclick="f_but_buscar()" style="cursor:pointer"/>
                                            </td>
                                        </tr>              
                                    </table>
                                </td>
                            </tr>
                        </table>
                        
                        <div class="separador">&nbsp; </div>                         
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axispro053" c="RESULTADOS_TIT" lit="1000345" /></div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <table class="area" align="center">
                                        <tr>
                                            <td>
                                                <div class="separador">&nbsp; </div>
                                                <%-- DisplayTag Usuarios --%>
                                                <c:set var="title0"><axis:alt f="axispro053" c="CODIGOS_TIT" lit="1000109"/></c:set>  <%-- Código --%>
                                                <c:set var="title1"><axis:alt f="axispro053" c="VALAXIS_TIT" lit="9906215"/></c:set>   <%-- Val. Axis --%>
                                                <c:set var="title2"><axis:alt f="axispro053" c="VALAXISDEF_TIT" lit="9906217"/></c:set>  <%--Val. Defecto Axis --%>
                                                <c:set var="title3"><axis:alt f="axispro053" c="VALEMP_TIT" lit="9906216"/></c:set>  <%-- Val. Empresa --%>
                                                <c:set var="title4"><axis:alt f="axispro053" c="VALDEF_TIT" lit="9906218"/></c:set>  <%-- Val. Defecto Empresa --%>
                                                <c:set var="title5"><axis:alt f="axispro001" c="EDITA" lit="9901356" /></c:set><!-- Editar -->
                                                <c:set var="title6"><axis:alt f="axispro001" c="BORRA" lit="1000127" /></c:set><!-- Eliminar -->
                                                <div class="displayspaceMaximo">
                                                    <display:table name="${__formdata.LSTINTERFICIES}" id="LSTINTERFICIES" export="false" class="dsptgtable" pagesize="5" sort="list" cellpadding="0" cellspacing="0"
                                                        requestURI="axis_axispro053.do?paginar=true&operation=interficies">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_INTERFICIES.CCODIGO" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${LSTINTERFICIES.OB_IAX_INTERFICIES.CCODIGO}
                                                            </div>
                                                        </display:column>
                                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_INTERFICIES.CVALAXIS" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${LSTINTERFICIES.OB_IAX_INTERFICIES.CVALAXIS}
                                                            </div>
                                                        </display:column>
                                                        <axis:visible f="axispro053" c="CVALAXISDEF" >
                                                        <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_INTERFICIES.CVALAXISDEF" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${LSTINTERFICIES.OB_IAX_INTERFICIES.CVALAXISDEF}
                                                            </div>
                                                        </display:column>
                                                        </axis:visible>
                                                        <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_INTERFICIES.CVALEMP" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${LSTINTERFICIES.OB_IAX_INTERFICIES.CVALEMP}
                                                            </div>
                                                        </display:column>
                                                        <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_INTERFICIES.CVALDEF" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${LSTINTERFICIES.OB_IAX_INTERFICIES.CVALDEF}                                           
                                                            </div>
                                                        </display:column>
                                                        <display:column title="${title5}" style="width:4%" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                                            <div class="dspNumber"><img border="0" alt='<axis:alt f="axispro001" c="EDITA_INT" lit="9901356"/>' title='<axis:alt f="axispro001" c="EDITA_INT" lit="9901356"/>' src="images/lapiz.gif" onClick="javascript:f_abre_modal('axispro052',null,'&isNew=no&CCODIGO='+'${LSTINTERFICIES.OB_IAX_INTERFICIES.CCODIGO}'+'&CVALAXIS='+'${LSTINTERFICIES.OB_IAX_INTERFICIES.CVALAXIS}'+'&CVALAXISDEF='+'${LSTINTERFICIES.OB_IAX_INTERFICIES.CVALAXISDEF}'+'&CVALEMP='+'${LSTINTERFICIES.OB_IAX_INTERFICIES.CVALEMP}'+'&CVALDEF='+'${LSTINTERFICIES.OB_IAX_INTERFICIES.CVALDEF}');" style="cursor:pointer"/></div>
                                                        </display:column>
                                                        <display:column title="${title6}" style="width:4%" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                                            <div class="dspNumber"><img border="0" alt='<axis:alt f="axispro001" c="BORRA_INT" lit="9001333"/>' title='<axis:alt f="axispro001" c="BORRA_INT" lit="9001333"/>' src="images/delete.gif" onclick="javascript:f_borrar_interficie('${LSTINTERFICIES.OB_IAX_INTERFICIES.CCODIGO}','${LSTINTERFICIES.OB_IAX_INTERFICIES.CVALAXIS}');" style="cursor:pointer"/></div>
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
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axispro053</c:param>
                <c:param name="__botones">salir,anadir</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>