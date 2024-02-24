<%/**
*  Fichero: axisctr005.jsp
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavier Gallego</a>
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*
*  Quinta pantalla del flujo de trabajo "Contratación póliza". Esta pantalla no es necesaria en el caso de que el producto solo permita un asegurado.
*
* 	La pantalla muestra los asegurados introducidos en un multirregistro. Desde esta pantalla se puede acceder al flujo de pantallas de beneficiarios y garantías para informar de los datos del contrato para cada uno de los asegurados introducidos (pulsando doble clic sobre el multirregistro o pulsando sobre el botón verde de cada registro). Cada vez que se informa de los datos de un asegurado, al volver a esta pantalla queda informado el importe total de la prima.
*       El aplicativo no debe dejar avanzar (botón siguiente) hasta que no se haya cumplimentado la información de beneficiarios, preguntas y garantías para cada uno de los asegurados. Si todo está cumplimentado accederemos a la pantalla de cláusulas de la póliza.
*
*
*
*  Fecha: 29/10/2007
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axisctr005" c="TITULO" lit="1000182"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>  
        <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)"> .wrapper{width: 100%;height: 80px;overflow: auto;} </style>
        <%-- FI Especial per controlar els scroll amb iPad --%>
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
                 var OK_TARIFICAR = '${__formdata.OK_TARIF}';
				 
				 <c:if test="${__configform.axisctr005__BT_TARIFICAR__visible == 'true'}">
					 if ($("#TARIFICADO").val()!=1 ||
						 objUtiles.estaVacio(OK_TARIFICAR) ||
						 OK_TARIFICAR != 'OK'){
						$("#but_siguiente").attr("disabled","true");
					 }
				 </c:if>
				 
				 f_cargar_propiedades_pantalla();
            }
            
            function f_disable_buttons(){
                objDom.setVisibilidadPorId("but_cancelar", "hidden");
            }
            function f_but_anterior() {
                // objUtiles.ejecutarFormulario("axis_axisctr004.do", "form", document.miForm, "_self");
                objUtiles.ejecutarFormulario("axis_axisctr005.do", "anterior", document.miForm, "_self");
            }
            function f_but_siguiente() {
                // objUtiles.ejecutarFormulario("axis_axisctr006.do", "form", document.miForm, "_self");
                objUtiles.ejecutarFormulario("axis_axisctr005.do", "siguiente", document.miForm, "_self");
            }
            
            function f_but_riesgo(NRIESGO){
                    
                    objDom.setValorPorId("FORM_ACT", "axisctr005");
                    document.miForm.NRIESGO.value = NRIESGO;
                    //BUG 27539/157297 - RCL - 30/10/2013 - Añadimos 'cargando'
                    objUtiles.ejecutarFormulario ("axis_axisctr005.do", "editar", document.miForm, "_self", objJsMessages.jslit_cargando);
           
            }
            
            function f_but_nou(NRIESGO){
                    
                    objDom.setValorPorId("FORM_ACT", "axisctr005");
                    document.miForm.NRIESGO.value = NRIESGO;
                    objUtiles.ejecutarFormulario ("axis_axisctr005.do", "nou", document.miForm, "_self");
               
           
            }            
            
            function f_but_cancelar() {
                //objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr005", "cancelar", document.miForm, "_self");
            }
            
                     
            // TODO: Pendiente revisar 
            function f_seleccionar_producto (SPRODUC){ 
                //Ejecutamos formulario según producto seleccionado 
                if (!objUtiles.estaVacio (SPRODUC)) {
                    objDom.setValorPorId ("SPRODUC", SPRODUC);
                } else {
                    var hayAlgunChecked = objUtiles.f_GuardaCasillasChecked ("radioProducto", "SPRODUC");
                    if (!hayAlgunChecked) {
                        alert (objJsMessages.jslit_selecciona_producto);
                        return;
                    }
                }
                objUtiles.ejecutarFormulario ("axis_axisctr001.do", "siguiente", document.miForm, "_self");
                //en la funcion siguiente de este service guardará información sobre el producto
            }
            
            
			function f_borrar_riesgo(NRIESGO){
				var answer = confirm(objJsMessages.jslit_confirma_borrar);
				
				if (answer){
					objDom.setValorPorId ("NRIESGO", NRIESGO);
					objUtiles.ejecutarFormulario ("axis_axisctr005.do", "borrar_riesgo", document.miForm, "_self");
				}
			}            
            
			function f_but_tarif(){
			    $("#TARIFICADO").val(1);
				objUtiles.ejecutarFormulario ("axis_axisctr005.do", "tarificar", document.miForm, "_self");
			}
        </script>
    </head>
    <body onload="f_onload()">
        <!-- BUG 27539/157297 - RCL - 30/10/2013 - Añadimos 'cargando' -->
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="NRIESGO" id="NRIESGO" value=""/>
            <input type="hidden" name="FORM_ACT" id="FORM_ACT" value=""/>
			<input type="hidden" name="NCERTIF" id="NCERTIF" value="${__formdata.NCERTIF}"/>
			<input type="hidden" name="TARIFICADO" id="TARIFICADO" value="${__formdata.TARIFICADO}"/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"><axis:alt f="axisctr005" c="MODALIDAD" lit="101110"/>
                <axis:visible f="axisctr005" c="NPOLIZA"> 
                <axis:alt f="axisctr005" c="TITULO_FORM" lit="101779"/> 
                <axis:alt f="axisctr005" c="TITULO_FORM" lit="102707"/> ${__formdata.NPOLIZA}
                </axis:visible>
                <axis:visible f="axisctr005" c="PTMOTMOV"> ${__formdata.PTMOTMOV}
                </axis:visible>
                </c:param>
                <c:param name="titulo"></c:param>
                <c:param name="formulario"><axis:alt f="axisctr005" c="TITULO" lit="1000182"/></c:param>
                  
                <c:param name="form">axisctr005</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr005" c="TITULO" lit="1000182"/></div>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- displaytag! -->
                                   <%-- <c:if test="${!empty sessionScope.axisctr005_ListaRiesgos}"> --%>                                    
                                        <c:set var="title0"><axis:alt f="axisctr005" c="NRIESGO" lit="800440"/></c:set>
                                        <c:set var="title1"><axis:alt f="axisctr005" c="TRIESGO" lit="102500"/></c:set>
                                        <c:set var="title2"><axis:alt f="axisctr005" c="PRIMATOTAL" lit="140531"/></c:set>
                                        <c:set var="title3"><axis:alt f="axisctr005" c="BT_EDIT_RISC" lit="100002"/></c:set>
                                        <div class="displayspace">
                                            <display:table name="${sessionScope.axisctr005_ListaRiesgos}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                             requestURI="axis_axisctr005.do?paginar=true">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title0}" sortable="false" sortProperty="NRIESGO" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                    <div class="dspNumber">${miListaId.OB_IAX_GESTRIESGOS.NRIESGO}</div>
                                                </display:column>
                                                <display:column title="${title1}" sortable="false" sortProperty="TRIESGO" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspText">
                                                    <c:if test="${empty miListaId.OB_IAX_GESTRIESGOS.permiteModificarPlan ||  miListaId.OB_IAX_GESTRIESGOS.permiteModificarPlan == 0}">
                                                    <a href="javascript:f_but_riesgo(${miListaId.OB_IAX_GESTRIESGOS.NRIESGO})">
                                                    </c:if>
                                                    ${miListaId.OB_IAX_GESTRIESGOS.TRIESGO}
                                                    <c:if test="${empty miListaId.OB_IAX_GESTRIESGOS.permiteModificarPlan ||  miListaId.OB_IAX_GESTRIESGOS.permiteModificarPlan == 0}">
                                                    </a>
                                                    </c:if>
                                                    </div>
                                                </display:column>
                                                <axis:visible f="axisctr005" c="PRIMATOTAL">
                                                <display:column title="${title2}" sortable="false" sortProperty="PRIMATOTAL" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspNumber">
                                                        <fmt:formatNumber pattern="${__formatNumberPatterns[CMONEDAPROD]}" value="${miListaId.OB_IAX_GESTRIESGOS.PRIMATOTAL}"/>
                                                    </div>
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible f="axisctr005" c="BT_EDIT_RISC">
                                                    <display:column title="${title3}" headerClass="headwidth5 sortable" media="html" autolink="false">
                                                        <c:if test="${empty miListaId.OB_IAX_GESTRIESGOS.permiteModificarPlan ||  miListaId.OB_IAX_GESTRIESGOS.permiteModificarPlan == 0}">
                                                        <div class="dspIcons">
                                                            <a href="javascript:f_but_riesgo(${miListaId.OB_IAX_GESTRIESGOS.NRIESGO})"><img border="0" alt="<axis:alt f="axisctr005" c="BT_EDIT_RISC" lit="100002"/>" title="<axis:alt f="axisctr005" c="BT_EDIT_RISC" lit="100002"/>" src="images/update.gif"/></a>
                                                        </div>
                                                        </c:if>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axisctr005" c="BT_DEL_RISC">
                                                   <display:column title=" " headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                   <c:if test="${empty miListaId.OB_IAX_GESTRIESGOS.permiteModificarPlan ||  miListaId.OB_IAX_GESTRIESGOS.permiteModificarPlan == 0}">
                                                   <div class="dspIcons"><a href="javascript:f_borrar_riesgo('${miListaId.OB_IAX_GESTRIESGOS.NRIESGO}')"><img border="0" alt="<axis:alt f="axisctr005" c="BT_DEL_RISC" lit="1000127"/>" title="<axis:alt f="axisctr005" c="BT_DEL_RISC" lit="1000127"/>" src="images/delete.gif"/></a></div>
                                                   </c:if>
                                                   </display:column>
                                                </axis:visible >                                                
                                            </display:table>
                                            </div>
                                  
                                    <%--</c:if> --%>
                                </td>
                            </tr>
                        </table>
                         <table class="seccion">
                            <tr>
                                <th style="width:60%; height:0px"></th>
                                <th style="width:25%; height:0px;"></th>
                                <th style="width:7%; height:0px"></th>
                                <th style="width:10%; height:0px"></th>
                            </tr>

                            <tr>
                                <axis:visible f="axisctr005" c="SUMAPRIMATOTAL"> <!-- TODO: c: SUMAPRIMATOTAL -->
                                   
                                      <td class="campocaja" align="right"><b><axis:alt f="axisctr005" c="SUMAPRIMATOTAL" lit="1000336"/></b>&nbsp;&nbsp;</td>
                                    <td class="campocaja" align="right" colspan="2">
                                        
                                        <input class="campowidthinput campo camponumerico" type="text" id="SUMAPRIMATOTAL" name="SUMAPRIMATOTAL" size="15" style="align:right" 
                                        <axis:atr f="axisctr005" c="SUMAPRIMATOTAL" a="modificable=false"/>
                                        value="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONEDAPROD]}" value="${sessionScope.axisctr005_primaTotal}"/>" />
                                        
                                    <div class="separador">&nbsp;</div>
                                    </td>
                                    <td>&nbsp;</td>
                                </axis:visible>
                            </tr>
							<tr>
								<td colspan="4" style="text-align:center" id="td_but_tarif">
									<axis:visible f="axisctr005" c="BT_TARIFICAR"> 
									<input type="button" class="boton" id="but_tarif" onclick="f_but_tarif()" value="<axis:alt f="axisctr005" c="BUSCAR" lit="9907317"/>"/>                                            
									</axis:visible>
								</td>
                            </tr>
                            <td align="right" colspan="4">
                               <axis:visible f="axisctr005" c="BT_NOU_RIE"> <!-- TODO: C:but_anadir -->
                               <input type="button" class="boton" id="BT_NUEVO" name ="BT_NUEVO"   value="<axis:alt f="axisctr005" c="BT_NOU_RIE" lit="9001286"/>" onclick="f_but_nou();" />                      
                               </axis:visible>                            
                        </table>
                    </td>
                </tr>
            </table>
            <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisctr005</c:param>
                <c:param name="__botones">cancelar<axis:visible f="axisctr005" c="BT_ANT">,anterior</axis:visible>,siguiente</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>

