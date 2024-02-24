<%/**
*  Fichero: axiscomi001.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a>
*  
*  Pantalla de CONSULTA DE CUADROS DE COMISION
*
*  Fecha: 09/07/2010
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
        <title><axis:alt f="axiscomi001" c="NOMFORM" lit=""/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        
       
        
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">
        
            
            function f_but_salir() {
            //Esborrem les vars de session
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axiscomi001", "cancelar", document.miForm, "_self");
            }
            
            function f_but_buscar(){
                objUtiles.ejecutarFormulario ("axis_axiscomi001.do", "buscarprocesos", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_abrir_axiscomi002(){
                objUtiles.abrirModal("axiscomi002", "src", "modal_axiscomi002.do?operation=form"); 
            }
            
            function f_cerrar_axiscomi002(){
                objUtiles.cerrarModal("axiscomi002");
            }
            
            function f_abrir_axiscomi003(CCOMISI,CMODO){
                objUtiles.abrirModal("axiscomi003", "src", "modal_axiscomi003.do?operation=init&CCOMISI="+CCOMISI+"&CMODO="+CMODO); 
            }
            
            function f_cerrar_axiscomi003(CMODO){
                objUtiles.cerrarModal("axiscomi003");
                
                if(CMODO == "NUEVO"){
                    f_but_buscar(null,null,null,null,null,null);
                }
                else{
                   var ccomisi = objDom.getValorPorId("VCCOMISI");
                   var tcomisi = objDom.getValorPorId("VTCOMISI");
                   var cestado = objDom.getValorPorId("VCESTADO");
                   var ctipo = objDom.getValorPorId("VCTIPO");
                   var finivig = objDom.getValorPorId("VFINIVIG");
                   var ffinvig = objDom.getValorPorId("VFFINVIG");
                
                   f_but_buscar(ccomisi,tcomisi,cestado,ctipo,finivig,ffinvig);
                }
            }
            
            // TCS_2 - ACL - 22/01/2019
			function f_borrar_CUADRO(CCOMISI) {
                var answer = confirm(objJsMessages.jslit_confirma_borrar);
                if (answer)
                    objUtiles.ejecutarFormulario("axis_axiscomi001.do?subpantalla=masdatos&CCOMISI="+CCOMISI, "eliminarCUADRO", document.miForm, "_self", objJsMessages.jslit_cargando);
                } 
            
            function f_abrir_axiscomi009(CCOMISI){
                objUtiles.abrirModal("axiscomi009", "src", "modal_axiscomi009.do?operation=init&CCOMISI="+CCOMISI); 
            }
            
            function f_but_9901308(){
                objUtiles.abrirModal("axiscomi008", "src", "modal_axiscomi008.do?operation=form"); 
            }
            
            function f_cerrar_axiscomi008(){
                objUtiles.cerrarModal("axiscomi008");
            }
            
            function f_but_103669(){
                objUtiles.abrirModal("axiscomi009", "src", "modal_axiscomi009.do?operation=form"); 
            }
            
            function f_cerrar_axiscomi009(){  
                objUtiles.cerrarModal("axiscomi009");
                f_but_buscar(null,null,null,null,null,null);
            }
            
            function f_onload(){
                f_cargar_propiedades_pantalla();
                <c:if test="${empty sessionScope.listaCuadros}">
                     f_abrir_axiscomi002();
                </c:if>
            }
            
            // ************************************************************************************ //
            // *******************************   ABRIR MODAL AXISCOM003  ************************** //
            // ************************************************************************************ //
            function f_but_nuevo(){
                var MODO = "MODIFICAR";
                f_abrir_axiscomi003(MODO);
            }
            
            
            function f_but_9901307(CCOMISI,CMODO){
                f_abrir_axiscomi003(CCOMISI,CMODO);
            }
            
            function f_but_9901313(){
                f_abrir_modal('axiscomi004');
            }
            
            function f_cerrar_axiscomi004(){  
                objUtiles.cerrarModal("axiscomi004");
            }
            
            
            
            
            
            function f_but_9901312(){
                objUtiles.abrirModal("axiscomi005", "src", "modal_axiscomi005.do?operation=form&CCOMISI"+CCOMISI);
            }
            
            function f_abrir_axiscomi005(CCOMISI){
                //alert(CCOMISI);
                objUtiles.abrirModal("axiscomi005", "src", "modal_axiscomi005.do?operation=init&CCOMISI="+CCOMISI);
            }
            
            function f_cerrar_axiscomi005(){  
                objUtiles.cerrarModal("axiscomi005");
            }
            
            function f_abrir_axiscomi007(CCOMISI){
                //alert(CCOMISI);
                objUtiles.abrirModal("axiscomi007", "src", "modal_axiscomi007.do?operation=form&CCOMISI="+CCOMISI);
            }
            
            function f_abrir_axiscomi004(CCOMISI){
                //alert("cod. comision"+CCOMISI);
                objUtiles.abrirModal("axiscomi004", "src", "modal_axiscomi004.do?operation=form&CCOMISI="+CCOMISI);
            }
                        
                        
            function f_cerrar_axiscomi007(){  
                objUtiles.cerrarModal("axiscomi007");
            }
            
            function f_abrir_modal(cual, noXButton, optionalQueryString) {
							if (objUtiles.estaVacio(optionalQueryString))
							optionalQueryString = "";
							
							if (noXButton)
							objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");
							
							objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);
						}


            function f_cerrar_modal(cual) {
                objUtiles.cerrarModal(cual);
            }
						
            function f_aceptar_modal(cual, params) {
                f_cerrar_modal(cual);
                if (cual == 'axisctr078')
                    objUtiles.ejecutarFormulario("axis_axisctr079.do" + params, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
                            
            function f_but_buscar(CCOMISI,TCOMISI,CESTADO,CTIPO,FINIVIG,FFINVIG){
                f_cerrar_modal('axiscomi002');
                var params = "?CCOMISI="+CCOMISI+"&TCOMISI="+TCOMISI+"&CESTADO="+CESTADO+"&FINIVIG="+FINIVIG+"&FFINVIG="+FFINVIG;
                
                objDom.setValorPorId("VCCOMISI",CCOMISI);
                objDom.setValorPorId("VTCOMISI",TCOMISI);
                objDom.setValorPorId("VCESTADO",CESTADO);
                objDom.setValorPorId("VCTIPO",CTIPO);
                objDom.setValorPorId("VFINIVIG",FINIVIG);
                objDom.setValorPorId("VFFINVIG",FFINVIG);
                
                objUtiles.ejecutarFormulario("axis_axiscomi001.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
                
            }
                            
            function f_but_004() {
            }
                            
            function f_but_005() {
                f_abrir_modal('axiscomi005');
            }
                            
            function f_but_006() {
                //alert("Antes de abrir");
                f_abrir_modal('axiscomi006');
            }
                            
            function f_aceptar_axiscomi004(cual) {
                f_cerrar_modal('axiscomi004');
            }
                            
            function f_aceptar_axiscomi005(cual) {
                f_cerrar_modal('axiscomi005');
            }
                            
            function f_aceptar_axiscomi006() {
                f_cerrar_modal('axiscomi006');
            }
                            
            function f_aceptar_axiscomi007() {
                f_cerrar_modal('axiscomi007');
            }
           
        </script>
        
    </head>
    
    <body onload="f_onload()">
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axiscomi001" c="TIT_002" lit="9901318" /></c:param>
            <c:param name="nid" value="axiscomi002" />
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axiscomi001" c="TIT_003" lit="9901322" /></c:param>
            <c:param name="nid" value="axiscomi003" />
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axiscomi001" c="TIT_0082" lit="9901327" /></c:param>
            <c:param name="nid" value="axiscomi008" />
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axiscomi001" c="TIT_009" lit="9901325" /></c:param>
            <c:param name="nid" value="axiscomi009" />
        </c:import>
        
                <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axiscomi001" c="TIT_004" lit="9901309"/></c:param>
            <c:param name="nid" value="axiscomi004" />
        </c:import>
        
                        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axiscomi001" c="TIT_005" lit="9901310" /></c:param>
            <c:param name="nid" value="axiscomi005" />
        </c:import>
        
                        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axiscomi001" c="TIT_007" lit="9901311" /></c:param>
            <c:param name="nid" value="axiscomi007" />
        </c:import>
        
                        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axiscomi001" c="TIT_008" lit="9901325" /></c:param>
            <c:param name="nid" value="axiscomi008" />
        </c:import>
        
        <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <c:set var="pantalla" value="axiscomi001"/>
    <form name="miForm" action="" method="POST">
        <input type="hidden" id="operation" name="operation" value="" />
  
        <input type="hidden" id="VCCOMISI" name="VCCOMISI" value="${__formdata.VCCOMISI}"/>
        <input type="hidden" id="VTCOMISI" name="VTCOMISI" value="${__formdata.VTCOMISI}"/>
        <input type="hidden" id="VCESTADO" name="VCESTADO" value="${__formdata.VCESTADO}"/>
        <input type="hidden" id="VCTIPO" name="VCTIPO" value="${__formdata.VCTIPO}"/>
        <input type="hidden" id="VFINIVIG" name="VFINIVIG" value="${__formdata.VFINIVIG}"/>
        <input type="hidden" id="VFFINVIG" name="VFFINVIG" value="${__formdata.VFFINVIG}"/>
        
    <c:set var="pantalla" value="axiscomi001"/>
    <c:set var="literalPantalla" value="9901304"/>
    <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt c="TITULO" f="axiscomi001" lit="9901304"/></c:param>
            <c:param name="formulario"><axis:alt f="axiscomi001" c="TITPANT" lit="${literalPantalla}"/></c:param>
            <c:param name="form">${pantalla}</c:param>
    </c:import>
        
    <table class="mainTableDimensions base"  align="center" cellpadding="0" cellspacing="0"> 
       <tr>
            <td>
                
                    <table class="seccion">
                        <tr>
                            <td align="left" >
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:15%;height:0%;"/>
                                        <th style="width:15%;height:0%;"/>
                                        <th style="width:15%;height:0%;"/>
                                        <th style="width:15%;height:0%;"/>
                                        <th style="width:15%;height:0%;"/>
                                        <th style="width:15%;height:0%;"/>
                                        <th style="width:10%;height:0%;"/>
                                    </tr>
                                    <tr>
                                        <td colspan="7">
                                            <div class="titulo" >
                                            	<div style="float:left">
                                                    <img src="images/flecha.gif"/>
                                                    <axis:alt f="axiscomi001" c="FIND" lit="9000619"/>
                                                    <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axiscomi002()" style="cursor:pointer"/>
                                                </div>
                                                <axis:visible f="axiscomi001" c="BT_NEW">
                                                <div style="float:right">
                                                    <img id="new" border="0" src="images/new.gif" title="<axis:alt f="axiscomi001" c="NEW" lit="1000428"/>" alt="<axis:alt f="axiscomi001" c="NEW" lit="1000428"/>"  onclick="f_but_9901307('','NUEVO')" style="cursor:pointer"/>
                                                </div>
                                                </axis:visible>
                                            </div>
                                            
                                            <div class="separador">&nbsp;</div>
                                            <!-- DisplayTag ListaPersonas -->
                                            <c:set var="title1"><axis:alt f="axiscomi001" c="CCOMISI" lit="103465"/></c:set>
                                            <c:set var="title2"><axis:alt f="axiscomi001" c="TCOMISI" lit="100588"/></c:set>
                                            <c:set var="title3"><axis:alt f="axiscomi001" c="TTIPO" lit="100565"/></c:set>
                                            <c:set var="title4"><axis:alt f="axiscomi001" c="TESTADO" lit="100587"/></c:set>
                                            <c:set var="title5"><axis:alt f="axiscomi001" c="FINIVIG" lit="100890"/></c:set>
                                            <c:set var="title6"><axis:alt f="axiscomi001" c="FFINVIG" lit="101422"/></c:set>
                                            <!--Iconos -->
                                            <c:set var="title8"><axis:alt f="axiscomi001" c="ALTA" lit="9001816"/></c:set><!-- Alta/Det -->
                                            <c:set var="title9"><axis:alt f="axiscomi001" c="EDIT" lit="9901356"/></c:set><!-- Editar -->
                                            <c:set var="title10"><axis:alt f="axiscomi001" c="NOVVIG" lit="9901355"/></c:set><!-- Nova.Vig -->
                                            <c:set var="title11"><axis:alt f="axiscomi001" c="DETALLE" lit="102239"/></c:set><!-- Detalle -->
                                            <c:set var="title12"><axis:alt f="axiscomi001" c="HISTORICO" lit="9901313"/></c:set><!-- Histórico -->
                                            <c:set var="title14"><axis:alt f="axiscomi001" c="DUPLICAR" lit="103669"/></c:set><!-- Duplicar -->
											<c:set var="title15"><axis:alt f="axiscomi001" c="ELIMINAR" lit="1000127"/></c:set><!-- Eliminar -->
                                            
                                            
                                            <div class="seccion displayspacePersonas">
                                                <display:table name="${sessionScope.listaCuadros}" id="miListaId" export="false" class="dsptgtable" pagesize="15"  requestURI="axis_axiscomi001.do?operation=form&paginar=true" excludedParams="*" sort="list" cellpadding="0" cellspacing="0">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                    <%--display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                                        <div class="dspIcons"><input <c:if test="${miListaId['listaProcesos']}">checked</c:if> type="radio" id="seleccionacomi" name="seleccionacomi" value="${miListaId['comi']}"/></div>
                                                    </display:column--%>
                                                     <display:column title="${title1}" sortable="true" sortProperty="comi" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.OB_IAX_CUADROCOMISION.CCOMISI}</div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="comi" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.OB_IAX_CUADROCOMISION.TCOMISI}</div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true" sortProperty="WHAT" headerClass="sortable"  media="html" autolink="false" >
                                                       <div class="dspText">${miListaId.OB_IAX_CUADROCOMISION.TTIPO}</div>
                                                    </display:column>
                                                    <display:column title="${title4}" sortable="true" sortProperty="BROKEN" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.OB_IAX_CUADROCOMISION.TESTADO}</div>
                                                    </display:column>
                                                    <display:column title="${title5}" sortable="true" sortProperty="LAST_DATE" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.OB_IAX_CUADROCOMISION.FINIVIG}"/></div>
                                                    </display:column>
                                                    <display:column title="${title6}" sortable="true" sortProperty="FAILURES" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.OB_IAX_CUADROCOMISION.FFINVIG}"/></div>
                                                    </display:column>
                                                    <axis:visible f="axiscomi001" c="BT_EDITAR">
                                                       <display:column title="${title9}" sortable="false"  headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                          <div class="dspIcons">
                                                             <img border="0" alt="<axis:alt f="axiscomi001" c="EDIT2" lit="9901322"/>" title1="<axis:alt f="axiscomi001" c="EDIT2" lit="9901322"/>" src="images/lapiz.gif" 
                                                        style="cursor:pointer;" onclick="javascript:f_but_9901307('${miListaId.OB_IAX_CUADROCOMISION.CCOMISI}','MODIF')"/>
                                                          </div>
                                                       </display:column>
                                                    </axis:visible>
                                                    <display:column title="${title11}" sortable="false"  headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                        <div class="dspIcons"><img border="0" alt="<axis:alt f="axiscomi001" c="DETALLE2" lit="9901311"/>" title1="<axis:alt f="axiscomi001" c="DETALLE2" lit="9901311"/>" src="images/mas.gif" 
                                                        style="cursor:pointer;" onclick="javascript:f_abrir_axiscomi007('${miListaId.OB_IAX_CUADROCOMISION.CCOMISI}')"/></div>
                                                    </display:column>
                                                    <axis:visible f="axiscomi001" c="BT_DUPLICAR">
                                                       <display:column title="${title14}" sortable="false"  headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                           <div class="dspIcons"><img border="0" alt="<axis:alt f="axiscomi001" c="DUP" lit="9901325"/>" title1="<axis:alt f="axiscomi001" c="DUP" lit="9901325"/>" src="images/copiar.gif" width="16px" height="16px"
                                                        style="cursor:pointer;" onclick="javascript:f_abrir_axiscomi009('${miListaId.OB_IAX_CUADROCOMISION.CCOMISI}')"/></div> 
                                                       </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axiscomi001" c="BT_NEWVIG">
                                                       <display:column title="${title10}" sortable="false"  headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                           <c:if test="${miListaId.OB_IAX_CUADROCOMISION.CESTADO == 2 && empty(miListaId.OB_IAX_CUADROCOMISION.FFINVIG)}">
                                                           <div class="dspIcons"><img border="0" alt="<axis:alt f="axiscomi001" c="NOVVIG2" lit="9901307"/>" title1="<axis:alt f="axiscomi001" c="NOVVIG2" lit="9901307"/>" src="images/fecha.gif" 
                                                        style="cursor:pointer;" onclick="javascript:f_but_9901307('${miListaId.OB_IAX_CUADROCOMISION.CCOMISI}','NVIGEN')"/></div>
                                                           </c:if>
                                                       </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axiscomi001" c="BT_ALTA">
                                                       <display:column title="${title8}" sortable="false"  headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                           <div class="dspIcons"><img border="0" alt="<axis:alt f="axiscomi001" c="HIST" lit="9901310"/>" title1="<axis:alt f="axiscomi001" c="HIST" lit="9901310"/>" src="images/file.gif"  
                                                        style="cursor:pointer;" onclick="javascript:f_abrir_axiscomi005('${miListaId.OB_IAX_CUADROCOMISION.CCOMISI}')"/></div>
                                                       </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axiscomi001" c="BT_HISTO">
                                                       <display:column title="${title12}" sortable="false"  headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                        <div class="dspIcons"><img border="0" alt="<axis:alt f="axiscomi001" c="ALTA2" lit="9901309"/>" title1="<axis:alt f="axiscomi001" c="ALTA2" lit="9901309"/>" src="images/folder.gif" 
                                                        style="cursor:pointer;" onclick="javascript:f_abrir_axiscomi004('${miListaId.OB_IAX_CUADROCOMISION.CCOMISI}')"/></div>
                                                       </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axiscomi001" c="BT_DELCUADRO">
				                                  <c:if test="${! ocultarIconosEdicion && __configform.axiscomi001__BT_BORRAR_CUADRO__visible != 'false'}">
				                                    <display:column title="${title15}" sortable="false"
				                                                    sortProperty=""
				                                                    headerClass="headwidth5 sortable fixed"
				                                                    media="html"
				                                                    autolink="false">
				                                      <div class="dspIcons">
				                                        
				                                          <img border="0"
				                                               alt="<axis:alt f='axiscomi001' c='LIT30' lit='89906211'/>"
				                                               title="<axis:alt f='axiscomi001' c='LIT31' lit='89906211'/>"
				                                               src="images/delete.gif"
				                                               onclick="f_borrar_CUADRO('${miListaId.OB_IAX_CUADROCOMISION.CCOMISI}')"/>
				                                        
				                                      </div>
				                                    </display:column>
				                                  </c:if>
				                                  </axis:visible>
												  
                                                </display:table>
                                            </div>	
                                        </td>
                                    </tr>    
                                    <tr>
                                        <td>
                                            <div class="separador">&nbsp;</div>
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
<c:import url="../include/botonera_nt.jsp"><c:param name="f">axiscomi001</c:param>
    <c:param name="__botones">salir<axis:ocultar f="axiscomi001" c="BT_COMPROD">,9901308</axis:ocultar></c:param>
</c:import>
 <%--c:param name="__botones">salir,nuevo,103669,9901307,9901308,9901312,9901313</c:param--%>

</form>

<c:import url="../include/mensajes.jsp" />
    
</body>
</html>

