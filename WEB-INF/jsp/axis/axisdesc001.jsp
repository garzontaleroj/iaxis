<%/**
*  Fichero: axisdesc001.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a>
*  
*  Pantalla de CONSULTA DE CUADROS DE DESCUENTO
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
        <title><axis:alt f="axisdesc001" c="NOMFORM" lit=""/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        
       
        
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">
        
            
            function f_but_salir() {
            //Esborrem les vars de session
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisdesc001", "cancelar", document.miForm, "_self");
            }
            
            function f_but_buscar(){
                objUtiles.ejecutarFormulario ("axis_axisdesc001.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_abrir_axisdesc002(){
                objUtiles.abrirModal("axisdesc002", "src", "modal_axisdesc002.do?operation=form"); 
            }
            
            function f_cerrar_axisdesc002(){
                objUtiles.cerrarModal("axisdesc002");
            }
            
            function f_abrir_axisdesc003(CDESC,CMODO){
                objUtiles.abrirModal("axisdesc003", "src", "modal_axisdesc003.do?operation=init&CDESC="+CDESC+"&CMODO="+CMODO); 
            }
            
            function f_cerrar_axisdesc003(CMODO){
                objUtiles.cerrarModal("axisdesc003");
                
                if(CMODO == "NUEVO"){
                    f_but_buscar(null,null,null,null,null,null);
                }
                else{
                   var cdesc = objDom.getValorPorId("VCDESC");
                   var tdesc = objDom.getValorPorId("VTDESC");
                   var cestado = objDom.getValorPorId("VCESTADO");
                   var ctipo = objDom.getValorPorId("VCTIPO");
                   var finivig = objDom.getValorPorId("VFINIVIG");
                   var ffinvig = objDom.getValorPorId("VFFINVIG");
                
                   f_but_buscar(cdesc,tdesc,cestado,ctipo,finivig,ffinvig);
                }
            }
            
            
            
            function f_abrir_axisdesc009(CDESC){
                objUtiles.abrirModal("axisdesc009", "src", "modal_axisdesc009.do?operation=init&CDESC="+CDESC); 
            }
            
            function f_but_9903494(){
                objUtiles.abrirModal("axisdesc008", "src", "modal_axisdesc008.do?operation=form"); 
            }
            
            function f_cerrar_axisdesc008(){
                objUtiles.cerrarModal("axisdesc008");
            }
            
            function f_but_103669(){
                objUtiles.abrirModal("axisdesc009", "src", "modal_axisdesc009.do?operation=form"); 
            }
            
            function f_cerrar_axisdesc009(){  
                objUtiles.cerrarModal("axisdesc009");
                f_but_buscar(null,null,null,null,null,null);
            }
            
            function f_onload(){
                f_cargar_propiedades_pantalla();
                <c:if test="${empty sessionScope.listaCuadros}">
                     f_abrir_axisdesc002();
                </c:if>
            }
            
            // ************************************************************************************ //
            // *******************************   ABRIR MODAL AXISCOM003  ************************** //
            // ************************************************************************************ //
            function f_but_nuevo(){
                var MODO = "MODIFICAR";
                f_abrir_axisdesc003(MODO);
            }
            
            
            function f_but_9901307(CDESC,CMODO){
                f_abrir_axisdesc003(CDESC,CMODO);
            }
            
            function f_but_9901313(){
                f_abrir_modal('axisdesc004');
            }
            
            function f_cerrar_axisdesc004(){  
                objUtiles.cerrarModal("axisdesc004");
            }
            
            
            
            
            
            function f_but_9901312(){
                objUtiles.abrirModal("axisdesc005", "src", "modal_axisdesc005.do?operation=form&CDESC"+CDESC);
            }
            
            function f_abrir_axisdesc005(CDESC){
                //alert(CDESC);
                objUtiles.abrirModal("axisdesc005", "src", "modal_axisdesc005.do?operation=init&CDESC="+CDESC);
            }
            
            function f_cerrar_axisdesc005(){  
                objUtiles.cerrarModal("axisdesc005");
            }
            
            function f_abrir_axisdesc007(CDESC){
                //alert(CDESC);
                objUtiles.abrirModal("axisdesc007", "src", "modal_axisdesc007.do?operation=form&CDESC="+CDESC);
            }
            
            function f_abrir_axisdesc004(CDESC){
                //alert("cod. DESCUENTO"+CDESC);
                objUtiles.abrirModal("axisdesc004", "src", "modal_axisdesc004.do?operation=form&CDESC="+CDESC);
            }
                        
                        
            function f_cerrar_axisdesc007(){  
                objUtiles.cerrarModal("axisdesc007");
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
                            
            function f_but_buscar(CDESC,TDESC,CESTADO,CTIPO,FINIVIG,FFINVIG){
                f_cerrar_modal('axisdesc002');
                var params = "?CDESC="+CDESC+"&TDESC="+TDESC+"&CESTADO="+CESTADO+"&FINIVIG="+FINIVIG+"&FFINVIG="+FFINVIG;
                
                objDom.setValorPorId("VCDESC",CDESC);
                objDom.setValorPorId("VTDESC",TDESC);
                objDom.setValorPorId("VCESTADO",CESTADO);
                objDom.setValorPorId("VCTIPO",CTIPO);
                objDom.setValorPorId("VFINIVIG",FINIVIG);
                objDom.setValorPorId("VFFINVIG",FFINVIG);
                
                objUtiles.ejecutarFormulario("axis_axisdesc001.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
                
            }
                            
            function f_but_004() {
            }
                            
            function f_but_005() {
                f_abrir_modal('axisdesc005');
            }
                            
            function f_but_006() {
                //alert("Antes de abrir");
                f_abrir_modal('axisdesc006');
            }
                            
            function f_aceptar_axisdesc004(cual) {
                f_cerrar_modal('axisdesc004');
            }
                            
            function f_aceptar_axisdesc005(cual) {
                f_cerrar_modal('axisdesc005');
            }
                            
            function f_aceptar_axisdesc006() {
                f_cerrar_modal('axisdesc006');
            }
                            
            function f_aceptar_axisdesc007() {
                f_cerrar_modal('axisdesc007');
            }
           
        </script>
        
    </head>
    
    <body onload="f_onload()">
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisdesc001" c="TIT_002" lit="9903495" /></c:param>
            <c:param name="nid" value="axisdesc002" />
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisdesc001" c="TIT_003" lit="9903496" /></c:param>
            <c:param name="nid" value="axisdesc003" />
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisdesc001" c="TIT_0082" lit="9903502" /></c:param>
            <c:param name="nid" value="axisdesc008" />
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisdesc001" c="TIT_009" lit="9903509" /></c:param>
            <c:param name="nid" value="axisdesc009" />
        </c:import>
        
                <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisdesc001" c="TIT_004" lit="9903505"/></c:param>
            <c:param name="nid" value="axisdesc004" />
        </c:import>
        
                        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisdesc001" c="TIT_005" lit="9903506" /></c:param>
            <c:param name="nid" value="axisdesc005" />
        </c:import>
        
                        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisdesc001" c="TIT_007" lit="9903508" /></c:param>
            <c:param name="nid" value="axisdesc007" />
        </c:import>
        
                        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisdesc001" c="TIT_008" lit="9903509" /></c:param>
            <c:param name="nid" value="axisdesc008" />
        </c:import>
        
        <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <c:set var="pantalla" value="axisdesc001"/>
    <form name="miForm" action="" method="POST">
        <input type="hidden" id="operation" name="operation" value="" />
  
        <input type="hidden" id="VCDESC" name="VCDESC" value="${__formdata.VCDESC}"/>
        <input type="hidden" id="VTDESC" name="VTDESC" value="${__formdata.VTDESC}"/>
        <input type="hidden" id="VCESTADO" name="VCESTADO" value="${__formdata.VCESTADO}"/>
        <input type="hidden" id="VCTIPO" name="VCTIPO" value="1"/>
        <input type="hidden" id="VFINIVIG" name="VFINIVIG" value="${__formdata.VFINIVIG}"/>
        <input type="hidden" id="VFFINVIG" name="VFFINVIG" value="${__formdata.VFFINVIG}"/>
        
    <c:set var="pantalla" value="axisdesc001"/>
    <c:set var="literalPantalla" value="9903492"/>
    <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt c="TITULO" f="axisdesc001" lit="9903492"/></c:param>
            <c:param name="formulario"><axis:alt f="axisdesc001" c="TITPANT" lit="${literalPantalla}"/></c:param>
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
                                                <axis:alt f="axisdesc001" c="FIND" lit="9903493"/>
                                                <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisdesc002()" style="cursor:pointer"/>
                                              </div>
                                                <div style="float:right">
                                                <img id="new" border="0" src="images/new.gif" title="<axis:alt f="axisdesc001" c="NEW" lit="1000428"/>" alt="<axis:alt f="axisdesc001" c="NEW" lit="1000428"/>"  onclick="f_but_9901307('','NUEVO')" style="cursor:pointer"/>
                                            		</div>
                                                
                                            </div>
                                            
                                            <div class="separador">&nbsp;</div>
                                            <!-- DisplayTag ListaPersonas -->
                                            <c:set var="title1"><axis:alt f="axisdesc001" c="CDESC" lit="103465"/></c:set>
                                            <c:set var="title2"><axis:alt f="axisdesc001" c="TDESC" lit="100588"/></c:set>                                           
                                            <c:set var="title4"><axis:alt f="axisdesc001" c="TESTADO" lit="100587"/></c:set>
                                            <c:set var="title5"><axis:alt f="axisdesc001" c="FINIVIG" lit="100890"/></c:set>
                                            <c:set var="title6"><axis:alt f="axisdesc001" c="FFINVIG" lit="101422"/></c:set>
                                            <!--Iconos -->
                                            <c:set var="title8"><axis:alt f="axisdesc001" c="ALTA" lit="9001816"/></c:set><!-- Alta/Det -->
                                            <c:set var="title9"><axis:alt f="axisdesc001" c="EDIT" lit="9901356"/></c:set><!-- Editar -->
                                            <c:set var="title10"><axis:alt f="axisdesc001" c="NOVVIG" lit="9901355"/></c:set><!-- Nova.Vig -->
                                            <c:set var="title11"><axis:alt f="axisdesc001" c="DETALLE" lit="102239"/></c:set><!-- Detalle -->
                                            <c:set var="title12"><axis:alt f="axisdesc001" c="HISTORICO" lit="9901313"/></c:set><!-- Histórico -->
                                            <c:set var="title14"><axis:alt f="axisdesc001" c="DUPLICAR" lit="103669"/></c:set><!-- Duplicar -->
                                            
                                            
                                            <div class="seccion displayspacePersonas">
                                                <display:table name="${sessionScope.listaCuadros}" id="miListaId" export="false" class="dsptgtable" pagesize="15"  requestURI="axis_axisdesc001.do?operation=form&paginar=true" excludedParams="*" sort="list" cellpadding="0" cellspacing="0">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                    <%--display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                                        <div class="dspIcons"><input <c:if test="${miListaId['listaProcesos']}">checked</c:if> type="radio" id="seleccionadesc" name="seleccionadesc" value="${miListaId['desc']}"/></div>
                                                    </display:column--%>
                                                     <display:column title="${title1}" sortable="true" sortProperty="desc" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.OB_IAX_CUADRODESCUENTO.CDESC}</div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="desc" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.OB_IAX_CUADRODESCUENTO.TDESC}</div>
                                                    </display:column>                                                   
                                                    <display:column title="${title4}" sortable="true" sortProperty="BROKEN" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.OB_IAX_CUADRODESCUENTO.TESTADO}</div>
                                                    </display:column>
                                                    <display:column title="${title5}" sortable="true" sortProperty="LAST_DATE" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.OB_IAX_CUADRODESCUENTO.FINIVIG}"/></div>
                                                    </display:column>
                                                    <display:column title="${title6}" sortable="true" sortProperty="FAILURES" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.OB_IAX_CUADRODESCUENTO.FFINVIG}"/></div>
                                                    </display:column>
                                                    <display:column title="${title9}" sortable="false"  headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                        <div class="dspIcons"><img border="0" alt="<axis:alt f="axisdesc001" c="EDIT2" lit="9903496"/>" title1="<axis:alt f="axisdesc001" c="EDIT2" lit="9903496"/>" src="images/lapiz.gif" 
                                                        style="cursor:pointer;" onclick="javascript:f_but_9901307('${miListaId.OB_IAX_CUADRODESCUENTO.CDESC}','MODIF')"/></div>
                                                    </display:column>
                                                     <display:column title="${title11}" sortable="false"  headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                        <div class="dspIcons"><img border="0" alt="<axis:alt f="axisdesc001" c="DETALLE2" lit="9903508"/>" title1="<axis:alt f="axisdesc001" c="DETALLE2" lit="9903508"/>" src="images/mas.gif" 
                                                        style="cursor:pointer;" onclick="javascript:f_abrir_axisdesc007('${miListaId.OB_IAX_CUADRODESCUENTO.CDESC}')"/></div>
                                                    </display:column>
                                                    <display:column title="${title14}" sortable="false"  headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                        <div class="dspIcons"><img border="0" alt="<axis:alt f="axisdesc001" c="DUP" lit="9903509"/>" title1="<axis:alt f="axisdesc001" c="DUP" lit="9903509"/>" src="images/copiar.gif" width="16px" height="16px"
                                                        style="cursor:pointer;" onclick="javascript:f_abrir_axisdesc009('${miListaId.OB_IAX_CUADRODESCUENTO.CDESC}')"/></div> 
                                                    </display:column>
                                                     <display:column title="${title10}" sortable="false"  headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                        <c:if test="${miListaId.OB_IAX_CUADRODESCUENTO.CESTADO == 2 && empty(miListaId.OB_IAX_CUADRODESCUENTO.FFINVIG)}">
                                                        <div class="dspIcons"><img border="0" alt="<axis:alt f="axisdesc001" c="NOVVIG2" lit="9901307"/>" title1="<axis:alt f="axisdesc001" c="NOVVIG2" lit="9901307"/>" src="images/fecha.gif" 
                                                        style="cursor:pointer;" onclick="javascript:f_but_9901307('${miListaId.OB_IAX_CUADRODESCUENTO.CDESC}','NVIGEN')"/></div>
                                                        </c:if>
                                                    </display:column>
                                                     <display:column title="${title8}" sortable="false"  headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                        <div class="dspIcons"><img border="0" alt="<axis:alt f="axisdesc001" c="HIST" lit="9903506"/>" title1="<axis:alt f="axisdesc001" c="HIST" lit="9903506"/>" src="images/file.gif"  
                                                        style="cursor:pointer;" onclick="javascript:f_abrir_axisdesc005('${miListaId.OB_IAX_CUADRODESCUENTO.CDESC}')"/></div>
                                                    </display:column>
                                                    <display:column title="${title12}" sortable="false"  headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                        <div class="dspIcons"><img border="0" alt="<axis:alt f="axisdesc001" c="ALTA2" lit="9903505"/>" title1="<axis:alt f="axisdesc001" c="ALTA2" lit="9903505"/>" src="images/folder.gif" 
                                                        style="cursor:pointer;" onclick="javascript:f_abrir_axisdesc004('${miListaId.OB_IAX_CUADRODESCUENTO.CDESC}')"/></div>
                                                    </display:column>
                                                    
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
<c:import url="../include/botonera_nt.jsp"><c:param name="f">axisdesc001</c:param>
    <c:param name="__botones">salir<axis:ocultar f="axisdesc001" c="BT_COMPROD">,9903494</axis:ocultar></c:param>
</c:import>
 <%--c:param name="__botones">salir,nuevo,103669,9901307,9903494,9901312,9901313</c:param--%>

</form>

<c:import url="../include/mensajes.jsp" />
    
</body>
</html>

