<%/*
*  Fichero: axisadm002.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a> 
*
*  Fecha: 04/07/2008
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
    <title><axis:alt f="axisadm031" c="cab_consrebu" lit="100905"/></title> <%-- CONSULTA DE RECIBOS --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="Stylesheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp"/>
    

    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {  
            revisarEstilos();
            var sdevolu = "${__formdata.SDEVOLU}";
            if (objUtiles.estaVacio(sdevolu)){ 
                 f_but_buscar();
            }
            
            // ini bug 0022030
            var Pplantilla = objDom.getValorPorId("PPLANTILLA");
            if (Pplantilla == '1' )
            {                 
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_cartas&SGESCARTA=" + "" + "&SDEVOLU=" + sdevolu, 0, 0);
            }
            // fin bug 0022030
            
            f_cargar_propiedades_pantalla();
        }
        
        function f_cerrar_axisimprimir() {
            objUtiles.cerrarModal("axisimprimir");
            //objUtiles.ejecutarFormulario("modal_axisadm034.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
     
        }
        
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm037", "cancelar", document.miForm, "_self");
        }
        
        function f_but_buscar() {
            document.miForm.TFILE.value = '';
            document.miForm.TFILE_CARTAS.value = '';
            // bug 0022030 
            document.miForm.PPLANTILLA.value = '';
            f_abrir_modal('axisadm037');
        }
        
        function f_aceptar_axisadm037(SDEVOLU){
            f_cerrar_modal('axisadm037');
            document.miForm.SDEVOLU.value = SDEVOLU;
            objUtiles.ejecutarFormulario("axis_axisadm031.do", "init", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
         
  
        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }

        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
            if (cual == 'axisadm018')
                objUtiles.ejecutarFormulario("axis_axisadm031.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_aceptar_modal(cual, params) {
            f_cerrar_modal(cual);
            if (cual == 'axisadm037' || cual == 'axisadm018')
                objUtiles.ejecutarFormulario("axis_axisadm031.do" + params, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_detallrecibo(NRECIBO){
           objUtiles.abrirModal('axisadm003', "src", "axis_axisadm003.do?operation=form&NRECIBO=" + NRECIBO+'&origen=axisadm031');        
        }
        
        function f_modificarrecibo(NRECIBO){
           objUtiles.abrirModal('axisadm018', "src", "axis_axisadm018.do?operation=form&NRECIBO=" + NRECIBO+'&origen=axisadm031');        
        }
        function f_but_aceptar(){
             objUtiles.ejecutarFormulario("axis_axisadm031.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_but_9000745(){
             objUtiles.ejecutarFormulario("axis_axisadm031.do", "generar_listados", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_but_140646(){
             objUtiles.ejecutarFormulario("axis_axisadm031.do", "generar_cartas", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_set_revisar(thiss,NRECIBO){
            var CDEVSIT = thiss.checked ? 2 : 1;
            var sdevolu = "${__formdata.SDEVOLU}";
            
            var params = "?NRECIBO="+NRECIBO;
            params = params + "&CDEVSIT="+CDEVSIT;
            params = params + "&SDEVOLU="+sdevolu;
            
            
            objAjax.invokeAsyncCGI("axis_axisadm031.do"+params, callbackGenerico, 
                            "operation=ajax_guardarRecRevis",
                            this, objJsMessages.jslit_emitiendo_poliza);
        
        }
        
        function f_set_estimp_rec(sdevolu,nrecibo,thiss){
            var cestimp = thiss.checked ? 3 : 1;

            objAjax.invokeAsyncCGI("axis_axisadm031.do?PSDEVOLU="+sdevolu+"&PNRECIBO="+nrecibo+"&PCESTIMP="+cestimp,
                            callbackGenerico, "operation=ajax_setestimp",
                            this, objJsMessages.jslit_cargando);
        }
        
        function f_set_accpreconocida(NRECIBO,thiss){
            var caccpre = thiss.value;
            
            objAjax.invokeAsyncCGI("axis_axisadm031.do?PNRECIBO="+NRECIBO+"&PCACCPRE="+caccpre,
                            callbackGenerico, "operation=ajax_setcaccpre",
                            this, objJsMessages.jslit_cargando);
        }
        
        function callbackGenerico (ajaxResponseText) {
                var doc = objAjax.domParse(ajaxResponseText);
                // Comprobar errores
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                   null;
                }
        }


   
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisadm031" c="tit_gestdevo" lit="102805"/></c:param>     <%-- Gestión de devoluciones--%>
                <c:param name="formulario"><axis:alt f="axisadm031" c="for_gestdevo" lit="102805"/></c:param> <%-- Gestión de devoluciones --%>
                <c:param name="form">axisadm031</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisadm031" c="cam_cercador_dev" lit="9001616" /></c:param>
                <c:param name="nid" value="axisadm037" />
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisadm031" c="cam_consulta_reb" lit="1000564" /></c:param>
                <c:param name="nid" value="axisadm003" />
        </c:import> 
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisadm031" c="cam_modifica_reb" lit="102058" /></c:param>
                <c:param name="nid" value="axisadm018" />
        </c:import> 
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisadm031" c="cam_impressio_doc" lit="1000205" />|true</c:param>
        </c:import>   
        
        
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="SDEVOLU" id="SDEVOLU" value="${__formdata.SDEVOLU}"/>
        <input type="hidden" name="TFILE" id="TFILE" value="${__formdata.TFILE}"/>
        <input type="hidden" name="TFILE_CARTAS" id="TFILE_CARTAS" value="${__formdata.TFILE_CARTAS}"/>
        <input type="hidden" name="PPLANTILLA" id="PPLANTILLA" value="${__formdata.PPLANTILLA}"/>
        <input type="hidden" name="RESALTAR" id="RESALTAR" value="${__formdata.RESALTAR}"/>
        <div class="separador">&nbsp;</div>       
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="titulo">
                    <img src="images/flecha.gif"/><axis:alt f="axisadm031" c="cam_dades_dev" lit="9001625" />
                    <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisadm031" c="cam_cercar" lit="100797" />" onclick="f_but_buscar();" style="cursor:pointer"/>                
                    </div>
                    <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:10%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                           <axis:visible f="axisadm031" c="CEMPRES" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm031" c="CEMPRES" lit="101619" /></b>
                                                </td>
                                             </axis:visible>	
                                           <axis:visible f="axisadm031" c="SDEVOLU" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm031" c="SDEVOLU" lit="9001617" /></b>
                                                </td>
                                             </axis:visible>	
                                             <axis:visible f="axisadm031" c="TPRENOM" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm031" c="TPRENOM" lit="9001623" /></b>
                                                </td>
                                             </axis:visible>
                                           
	                                             
                                        </tr>
                                        <tr>
                                        <axis:visible f="axisadm031" c="TEMPRES">
                                                    
                                                     <td class="campocaja">
                                                            <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="TEMPRES" name="TEMPRES" size="15"
                                                            title="<axis:alt f="axisadm031" c="CEMPRES" lit="101619" />"
                                                            value="${__formdata.TEMPRES}" <axis:atr f="axisadm031" c="TEMPRES" a="modificable=false"/>/>
                                                     </td>     
                                                     
                                          </axis:visible> 
                                          <axis:visible f="axisadm031" c="SDEVOLU">
                                                    
                                                     <td class="campocaja">
                                                    <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="SEQDEVOLU" name="SEQDEVOLU" size="15"
                                                    title="<axis:alt f="axisadm031" c="SDEVOLU" lit="9001617" />"
                                                    value="${__formdata.SDEVOLU}" <axis:atr f="axisadm031" c="SEQDEVOLU" a="modificable=false"/>/>
                                           </axis:visible>   
                                            <axis:visible f="axisadm031" c="TPRENOM">
                                                     
                                                   <td class="campocaja" colspan="2">
                                                    <input style="width:94%" type="text" class="campowidthinput campo campotexto" id="TPRENOM" name="TPRENOM" size="15"
                                                    title="<axis:alt f="axisadm031" c="TPRENOM" lit="9001623" />"
                                                    value="${__formdata.TPRENOM}" <axis:atr f="axisadm031" c="TPRENOM" a="modificable=false"/>/>
                                                    </td>  
                                                     
                                          </axis:visible> 
                                            
                                         </tr>
                                         <tr>
                                         <axis:visible f="axisadm031" c="FSOPORTE" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm031" c="FSOPORTE" lit="9001618" /></b>
                                                </td>
                                             </axis:visible>	
                                             <axis:visible f="axisadm031" c="CDOMENT" >
                                                <td class="titulocaja" colspan="2">
                                                    <b><axis:alt f="axisadm031" c="CDOMENT" lit="9001624" /></b>
                                                </td>
                                             </axis:visible>
                                             <axis:visible f="axisadm031" c="CDOMSUC" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm031" c="CDOMSUC" lit="9000436" /></b>
                                                </td>
                                             </axis:visible>
                                         </tr>
                                         <tr>
                                         
                                         <axis:visible f="axisadm031" c="FSOPORTE">
                                                 <td class="campocaja">
                                                    <input style="width:50%" type="text" class="campowidthinput campo campotexto" id="FSOPORTE" name="FSOPORTE" size="15"
                                                    value ="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FSOPORT}"/>" title="<axis:alt f="axisadm031" c="FSOPORTE" lit="9001618" />" <axis:atr f="axisadm031" c="FSOPORTE" a="modificable=false&formato=fecha"/>/>
                                                </td>
                                            </axis:visible>
                                            <axis:visible f="axisadm031" c="CDOMENT">
                                                       <td class="campocaja" colspan="2">
                                                            <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="CDOMENT" name="CDOMENT" size="15"
                                                    title="<axis:alt f="axisadm031" c="CDOMENT" lit="9001624" />"
                                                    value="${__formdata.TDOMENT}" <axis:atr f="axisadm031" c="CDOMENT" a="modificable=false"/>/>
                                                     </td>   
                                                     </axis:visible>
                                                     <axis:visible f="axisadm031" c="CDOMSUC">
                                                     <td class="campocaja">
                                                            <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="CDOMSUC" name="CDOMSUC" size="15"
                                                    title="<axis:alt f="axisadm031" c="CDOMSUC" lit="9000436" />"
                                                    value="${__formdata.TDOMSUC}" <axis:atr f="axisadm031" c="CDOMSUC" a="modificable=false"/>/>
                                                     </td>
                                                     </axis:visible>
                                         
                                         </tr>
                                         <tr>
                                            <axis:visible f="axisadm031" c="FCARGA" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm031" c="FCARGA" lit="9001619" /></b>
                                                </td>
                                             </axis:visible>
                                             <axis:visible f="axisadm031" c="CUSUARI" >
                                                <td class="titulocaja" colspan="2">
                                                    <b><axis:alt f="axisadm031" c="CUSUARI" lit="100894" /></b>
                                                </td>
                                             </axis:visible>
                                         </tr>
                                         
                                         <tr>
                                            <axis:visible f="axisadm031" c="FCARGA">
                                                 <td class="campocaja">
                                                    <input style="width:50%" type="text" class="campowidthinput campo campotexto" id="FCARGA" name="FCARGA" size="15"
                                                    title="<axis:alt f="axisadm031" c="FCARGA" lit="9001619" />"
                                                    value ="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCARGA}"/>"  <axis:atr f="axisadm031" c="FCARGA" a="modificable=false&formato=fecha"/>/>
                                                </td>
                                                 </axis:visible>
                                                  <axis:visible f="axisadm031" c="CUSUARI">
                                                <td class="campocaja" colspan="2">
                                                            <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="CUSUARI" name="CUSUARI" size="15"
                                                    title="<axis:alt f="axisadm031" c="CUSUARI" lit="100894" />"
                                                    value="${__formdata.CUSUARI}" <axis:atr f="axisadm031" c="CUSUARI" a="modificable=false"/>/>
                                                     </td>
                                                     </axis:visible>
                                           
                                         </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>   
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm031" c="cam_detall_dev" lit="9001661" /></div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <%--table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0"--%>
                                    <table border="0" class="area" align="left" style="width:100%;">
                                        <tr>
                                            <td>
                                            <c:set var="title1"><axis:alt f="axisadm031" c="NRECIBO" lit="100895"/></c:set>
                                            <c:set var="title2"><axis:alt f="axisadm031" c="TDEVMOT" lit="9001626"/></c:set>
                                            <c:set var="title3"><axis:alt f="axisadm031" c="NRECCCC" lit="9001627"/></c:set>
                                            <c:set var="title4"><axis:alt f="axisadm031" c="TCOBBAN" lit="9001036"/></c:set>
                                            <c:set var="title5"><axis:alt f="axisadm031" c="CCOBBAN" lit="9001628"/></c:set>
                                            <c:set var="title6"><axis:alt f="axisadm031" c="IRECDEV" lit="100563"/></c:set>
                                            <c:set var="title7"><axis:alt f="axisadm031" c="TDEVSIT" lit="9001629"/></c:set>
                                            
                                            <c:set var="title8"><axis:alt f="axisadm031" c="NPOLIZA" lit="100624" /></c:set>
                                            <c:set var="title9"><axis:alt f="axisadm031" c="TRAMO" lit="100784" /></c:set>
                                            <c:set var="title10"><axis:alt f="axisadm031" c="TPRODUCTO" lit="1000307" /></c:set>
                                            <c:set var="title11"><axis:alt f="axisadm031" c="TSUCURSAL" lit="9002202" /></c:set>
                                            <c:set var="title12"><axis:alt f="axisadm031" c="TAGENTE" lit="100584" /></c:set>
                                            <c:set var="title13"><axis:alt f="axisadm031" c="NFRACCI" lit="9903786" /></c:set>
                                            <c:set var="title14"><axis:alt f="axisadm031" c="CREMBAN" lit="9001945" /></c:set>
                                            <c:set var="title15"><axis:alt f="axisadm031" c="TESTREC" lit="1000553" /></c:set>
                                            
                                            <c:set var="title16"><axis:alt f="axisadm031" c="CACCPRE" lit="9903810" /></c:set>
                                            <c:set var="title17"><axis:alt f="axisadm031" c="CACCRET" lit="9903811" /></c:set>
                                            <c:set var="title18"><axis:alt f="axisadm031" c="FREMESA" lit="9903601" /></c:set>
                                            <c:set var="title19"><axis:alt f="axisadm031" c="NDIAGRA" lit="9903879" /></c:set>
                                            <c:set var="title20"><axis:alt f="axisadm031" c="NO_IMP" lit="9903880" /></c:set>
                                            <c:set var="title21"><axis:alt f="axisadm031" c="FCONVENIO" lit="9903198" /></c:set>
                                            <c:set var="title22"><axis:alt f="axisadm031" c="NIMPAGAD" lit="9904402" /></c:set>
                                            <c:set var="title23"><axis:alt f="axisadm031" c="CAGENTE" lit="1000109" /></c:set>
                                            
                                            <%--div class="displayspaceMaximo"--%>
                                            <script language="Javascript">
                                                //alert(objUtiles.miInnerWidth()*0.9)
                                                //poniendo scroll a nivel de body o div, no lo presenta, o presenta el scroll horizontal protegido
                                                document.write('<div class="seccion displayspaceMaximo" style="overflow-x:auto;width:'+objUtiles.miInnerWidth()*0.89+'px">');
                                            </script>
                                            <display:table name="${__formdata.recibos}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" requestURI="axis_axisadm031.do?paginar=true" cellpadding="0" cellspacing="0" style="width:100%" >
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <axis:visible f="axisadm031" c="CAGENTE">
                                                    <display:column title="${title23}" headerClass="sortable" sortProperty="CAGENTE" style="width:10%" media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.CAGENTE}</div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axisadm031" c="TAGENTE">
                                                    <display:column title="${title12}" headerClass="sortable" sortProperty="TAGENTE" style="width:10%" media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.TAGENTE}</div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axisadm031" c="NPOLIZA">
                                                    <display:column title="${title8}" headerClass="sortable" sortProperty="NPOLIZA" style="width:5%" media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.NPOLIZA}</div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axisadm031" c="NRECIBO">
                                                    <display:column title="${title1}" headerClass="sortable" sortProperty="NRECIBO" style="width:5%" media="html" autolink="false" >
                                                        <div class="dspText">
                                                            <c:choose>
                                                                <c:when test="${miListaId.CESTANT==1 && __formdata.RESALTAR==1}">
                                                                    <b style="color:red">${miListaId.NRECIBO}</b>
                                                                </c:when>
                                                                <c:otherwise>
                                                                     ${miListaId.NRECIBO}    
                                                                 </c:otherwise>
                                                             </c:choose>
                                                        </div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axisadm031" c="NFRACCI">
                                                    <display:column title="${title13}" headerClass="sortable" sortProperty="NFRACCI" style="width:5%"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.NFRACCI}</div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axisadm031" c="IRECDEV">
                                                    <display:column title="${title6}" headerClass="sortable" sortProperty="IRECDEV" style="width:5%" media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.IRECDEV}"/></div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axisadm031" c="CREMBAN">
                                                    <display:column title="${title14}" headerClass="sortable" sortProperty="CREMBAN" style="width:5%" media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.CREMBAN}</div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axisadm031" c="CACCPRE">
                                                    <display:column title="${title16}" headerClass="sortable" sortProperty="CACCPRE" style="width:10%" media="html" autolink="false" >
                                                        <div class="dspText">
                                                            <select name = "CACCPRE" id="CACCPRE"  style="width:95%;" size="1"  title="<axis:alt f="axisadm031" c="CACCPRE" lit="9903810"/>"
                                                            <axis:atr f="axisadm031" c="CACCPRE" a="modificable=true&isInputText=false"/> 
                                                            class="campowidthselect campo campotexto" onchange=" f_set_accpreconocida(${miListaId.NRECIBO},this);" >
                                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axisadm031" lit="108341"/> - </option>
                                                                <c:forEach var="grupos" items="${__formdata.listValores.lstconcepto}">
                                                                    <option value = "${grupos.CATRIBU}"
                                                                        <c:if test="${grupos.CATRIBU == miListaId.CACCPRE}">selected</c:if>>
                                                                        ${grupos.TATRIBU}
                                                                    </option>
                                                                </c:forEach>
                                                            </select>                            
                                                        </div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axisadm031" c="NIMPAGAD">
                                                    <display:column title="${title22}" headerClass="sortable" sortProperty="NIMPAGAD" style="width:10%" media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.NIMPAGAD}</div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axisadm031" c="TDEVMOT">
                                                    <display:column title="${title2}" headerClass="sortable" sortProperty="TDEVMOT" style="width:8%" media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.TDEVMOT}</div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axisadm031" c="CACCRET">
                                                    <display:column title="${title17}" headerClass="sortable" sortProperty="CACCRET" style="width:10%" media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.TACCRET}</div>
                                                    </display:column>
                                                </axis:visible>
                                                
                                                
                                                
                                                
                                                
                                                <axis:visible f="axisadm031" c="TSUCURSAL">
                                                    <display:column title="${title11}" headerClass="sortable" sortProperty="TSUCURSAL" style="width:10%" media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.TSUCURSAL}</div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axisadm031" c="TRAMO">
                                                    <display:column title="${title9}" headerClass="sortable" sortProperty="TRAMO" style="width:10%" media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.TRAMO}</div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axisadm031" c="TPRODUCTO">
                                                    <display:column title="${title10}" headerClass="sortable" sortProperty="TPRODUCTO" style="width:10%"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.TPRODUCTO}</div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axisadm031" c="TESTREC">
                                                    <display:column title="${title15}" headerClass="sortable" sortProperty="TESTREC" style="width:10%" media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.TESTREC}</div>
                                                    </display:column>
                                                </axis:visible>
                                                
                                                
                                                <axis:visible f="axisadm031" c="NO_IMP">
                                                    <display:column title="${title20}" headerClass="sortable" sortProperty="TESTREC" style="width:5%" media="html" autolink="false" >
                                                         <div class="dspIcons">
                                                            <input type="checkbox" id="NO_IMP" name="NO_IMP" <c:if test="${miListaId.NO_IMP == 1}">checked</c:if> value="${miListaId.NO_IMP}" onclick="f_set_estimp_rec(${miListaId.SDEVOLU},${miListaId.NRECIBO},this);"
                                                            <axis:atr f="axisadm031" c="NO_IMP" a="modificable=true&obligatorio=false&isInputText=false"/> />
                                                         </div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axisadm031" c="FREMESA">
                                                    <display:column title="${title18}" headerClass="sortable" sortProperty="FREMESA" style="width:10%" media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FREMESA}"/></div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axisadm031" c="NDIAGRA">
                                                    <display:column title="${title19}" headerClass="sortable" sortProperty="NDIAGRA" style="width:5%" media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatNumber pattern="###,##0" value="${miListaId.NDIAGRA}"/></div>
                                                    </display:column>
                                                </axis:visible>
                                                
                                                <axis:visible f="axisadm031" c="FCONVENIO">
                                                    <display:column title="${title21}" headerClass="sortable" sortProperty="FCONVENIO" style="width:5%" media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FCONVENIO}"/></div>
                                                    </display:column>
                                                </axis:visible>
                                                
                                                
                                                <axis:visible f="axisadm031" c="NRECCCC">
                                                    <display:column title="${title3}" headerClass="sortable" sortProperty="NRECCCC" style="width:5%"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.NRECCCC}</div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axisadm031" c="TCOBBAN">
                                                    <display:column title="${title4}" headerClass="sortable" sortProperty="TCOBBAN" style="width:8%" media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.TCOBBAN}</div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axisadm031" c="CCOBBAN">
                                                    <display:column title="${title5}" headerClass="sortable" sortProperty="CCOBBAN" style="width:8%" media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.CCOBBAN}</div>
                                                    </display:column>
                                                </axis:visible>
                                                
                                                <axis:visible f="axisadm031" c="TDEVSIT">
                                                    <display:column title="${title7}" sortable="false" sortProperty="CDEVSIT" style="width:5%" headerClass="sortable" media="html" autolink="false" >
                                                        <input type="hidden" name="CDEVSIT" id="CDEVSIT" value="${miListaId.CDEVSIT}"/>
                                                        <c:choose>
                                                        <c:when test="${miListaId.CDEVSIT == 3}">
                                                            <div class="dspText">${miListaId.TDEVSIT}</div>
                                                        </c:when>
                                                        <c:otherwise>
                                                             <div class="dspIcons">  <input type="checkbox" id="REVISADO" name="REVISADO" onclick="f_set_revisar(this,'${miListaId.NRECIBO}')" value="${miListaId.CDEVSIT}" 
                                                             <c:if test="${miListaId.CDEVSIT == '2'}">checked</c:if> ></div>    
                                                         </c:otherwise>
                                                         </c:choose>
                                                    </display:column> 
                                                </axis:visible>
                                                <axis:visible f="axisadm031" c="BT_MAS">
                                                    <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                        <div class="dspIcons"><img border="0" alt="<axis:alt f="axisadm031" c="ico_consultar" lit="1000439"/>" title1="<axis:alt f="axisadm031" c="ico_consultarmas" lit="1000439"/>" src="images/mas.gif" width="11px" height="11px"
                                                        style="cursor:pointer;" onclick="f_detallrecibo('${miListaId.NRECIBO}')"/></div>
                                                    </display:column>
                                                </axis:visible> 
                                                <axis:visible f="axisadm031" c="BT_EDITAR">
                                                    <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                        <div class="dspIcons"><img border="0" alt="<axis:alt f="axisadm031" c="ico_editar" lit="100002"/>" title1="<axis:alt f="axisadm031" c="ico_editarmas" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                        style="cursor:pointer;" onclick="javascript:f_modificarrecibo('${miListaId.NRECIBO}')"/></div>
                                                    </display:column> 
                                                </axis:visible>
                                                                                               
                                             </display:table> 
                                            </div>	
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <c:if test="${!empty __formdata.TFILE || !empty __formdata.TFILE_CARTAS}">
                        <div class="separador">&nbsp;</div>   
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm031" c="cam_generaciofitxer" lit="102803" /></div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table border="0" class="area" align="center" style="width:100%;">
                                        <tr>
                                        <c:if test="${!empty __formdata.TFILE}">                
                                            <td>&nbsp;&nbsp;<b> <axis:alt f="axisadm031" c="cam_llistat" lit="9000745" /> :&nbsp; </b>
                                            <a href="javascript:void(0)" onclick="objUtiles.abrirModal('axisimprimir', 'src', 'modal_axisimprimir.do?operation=tunnel&file='+document.miForm.TFILE.value)">  <%-- +"&mimetype=csv" --%>
                                               ${__formdata.TFILE}
                                            </a>
                                           </td>
                                         </c:if>
                                         <c:if test="${!empty __formdata.TFILE_CARTAS}">                
                                            <td>&nbsp;&nbsp;<b> <axis:alt f="axisadm031" c="cam_cartesimpreses" lit="140648" /> :&nbsp; </b>
                                            <a href="javascript:void(0)" onclick="objUtiles.abrirModal('axisimprimir', 'src', 'modal_axisimprimir.do?operation=tunnel&file='+document.miForm.TFILE_CARTAS.value)">  <%-- +"&mimetype=csv" --%>
                                               ${__formdata.TFILE_CARTAS}
                                            </a>
                                           </td>
                                         </c:if>
                                       </tr>
                                    </table>
                                </td>
                        </tr>
                    </table>
                    </c:if>
                    <c:if test="${!empty __formdata.LIST_FICHEROS}">
                        <div class="separador">&nbsp;</div>     
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr031" c="listaImpresion" lit="112247"/></div>
                        <table class="seccion">
                            <tr>
                                <th style="width:30%;height:0px"></th>
                                <th style="width:35%;height:0px"></th>
                                <th style="width:35%;height:0px"></th>
            
                            </tr>
                            <tr>
                                <td>
                                    <c:set var="title0"><axis:alt f="axisctr031" c="title0" lit="107913"/></c:set>
                                    <div class="displayspaceMaximo">
                                    <display:table name="${__formdata.LIST_FICHEROS}" id="ReportsList" export="false" class="dsptgtable" pagesize="-1" cellpadding="0" cellspacing="0"
                                                   requestURI="axis_axisadm031.do?paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title0}" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                <div style="cursor:pointer" onclick="objUtiles.abrirModal('axisimprimir', 'src', 'modal_axisimprimir.do?operation=tunnel&file='+escape( (this.innerText!=undefined)?this.innerText:this.textContent))"><u>${ReportsList.OB_IAX_IMPRESION.FICHERO}</u></div>
                                             </div>
                                            </display:column>                                                             
                                        </display:table>                                          
                                    </div>                                                         
                                    <div class="separador">&nbsp; </div>
                                </td>
                            </tr>
                        </table>
                 </c:if>
                 </td>
            </tr>
            
        </table>
        
        <!-- bug 22206 -->
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm031</c:param><c:param name="f">axisadm031</c:param>
            <c:param name="__botones"><axis:visible c="BT_SALIR" f="axisadm031">,salir</axis:visible>,<axis:visible c="BT_LISTADO" f="axisadm031">,9000745</axis:visible>,<axis:visible c="BT_CARTAS" f="axisadm031">,140646</axis:visible>,<axis:visible c="BT_ACEPTAR" f="axisadm031">,aceptar</axis:visible></c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
</body>
</html>