<%--/**
*  Fichero: axispro001.jsp
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavier Gallego</a>
*  
*  T?tulo: Modal Formas de pago
*
*  Fecha: 18/04/2008
*/
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axispro006" c="LIT_101908" lit="101908"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    
    <script type="text/javascript">
        function f_onload(){
            for(var i=0; i<document.miForm.CPAGDEF.length; i++){ 
                if(document.miForm.CPAGDEF[i].checked){
                    objDom.setValorPorId("RADIO_ANT", document.miForm.CPAGDEF[i].value);
                }
            }
            f_cargar_propiedades_pantalla();
        }
        
        function f_but_aceptar(){
            objAjax.invokeAsyncCGI("modal_axispro006.do", callbackAjaxSetForPago, "operation=ajax_setforpago&SPRODUC="+objDom.getValorPorId("SPRODUC"), this, objJsMessages.jslit_cargando);
        }
        
        function callbackAjaxSetForPago(ajaxResponseText){
            try{
                var doc=objAjax.domParse(ajaxResponseText);
                //alert(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_OK")[0]))
                        parent.f_aceptar_axispro006();
                }
            }catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            } 
        }
        
        function f_but_cancelar(){
            parent.f_cerrar_modal("axispro006");
        }
        
        
        function f_actualiza_hidden(pchecked, pcforpag){          
           var ant = objDom.getValorPorId("RADIO_ANT");
           objDom.setValorPorId("CPAGDEF1_"+ant, 0);          
           objDom.setValorPorId("CPAGDEF1_"+pcforpag, ((pchecked)?1:0));                     
           
           if(ant == 0 && 
              objDom.getValorPorId("CPAGDEF1_"+ant) == 0 && 
              objDom.getValorPorId("CREVFPG1_"+ant) == 1){ 
              
               document.getElementById("CREVFPG_"+ant).click();
           }
           
           //guardamos el anterior radio marcado
           objDom.setValorPorId("RADIO_ANT", pcforpag);
           
        }
        
        function f_actualiza_hidden_CREVFPG(pchecked, pcforpag){ 
           objDom.setValorPorId("CREVFPG1_"+pcforpag, ((pchecked)?1:0));
        }

        function f_actualizar_pago(CFORPAG, TFORPAG, COBLIGA, PRECARG, CPAGDEF, CREVFPG, obj){
            if(objValidador.validaEntrada()){
                if(!objUtiles.estaVacio(PRECARG) && (parseFloat(PRECARG)<0 || parseFloat(PRECARG)>100)){
                    alert("objJsMessages.jslit_error_precarg");
                    obj.focus();
                }else{
                    objDom.setValorPorId("CFORPAG_ACT", CFORPAG);
                    objDom.setValorPorId("TFORPAG_ACT", TFORPAG);
                    objDom.setValorPorId("COBLIGA_ACT", ((COBLIGA)?1:0));
                    objDom.setValorPorId("PRECARG_ACT", PRECARG);
                    objDom.setValorPorId("CPAGDEF_ACT", CPAGDEF);
                    objDom.setValorPorId("CREVFPG_ACT", ((objUtiles.estaVacio(CREVFPG))?0:CREVFPG));
                                       
                    if(objDom.getValorPorId("CREVFPG1_"+CFORPAG) == 1 && objDom.getValorPorId("CPAGDEF1_"+CFORPAG) == 0){                   
                        for(var i=0; i<document.miForm.CPAGDEF.length; i++){ 
                            if(document.miForm.CPAGDEF[i].value == CFORPAG){
                                document.miForm.CPAGDEF[i].checked = true;
                                document.miForm.CPAGDEF[i].click();
                            }
                            else{
                                document.miForm.CPAGDEF[i].checked = false;
                            }
                        }
                    }

                    objAjax.invokeAsyncCGI("modal_axispro006.do", callbackAjaxActualizarPago, "operation=ajax_actualizar_pago&CFORPAG_ACT="+ objDom.getValorPorId("CFORPAG_ACT") +
                            "&TFORPAG_ACT="+ objDom.getValorPorId("TFORPAG_ACT") + "&COBLIGA_ACT="+ objDom.getValorPorId("COBLIGA_ACT") +
                            "&PRECARG_ACT="+ objDom.getValorPorId("PRECARG_ACT") + "&CPAGDEF_ACT="+ objDom.getValorPorId("CPAGDEF_ACT") +
                            "&CREVFPG_ACT="+ objDom.getValorPorId("CREVFPG_ACT"), this, objJsMessages.jslit_cargando);
                }
            }
        }
        
        function callbackAjaxActualizarPago (ajaxResponseText){
            try{
                var doc=objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_OK")[0])){
                        //Just do it
                    }
                        
                    
                }
            }catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            } 
        }
        
        function comprobar_recargo(PRECARG){
            if(objValidador.validaEntrada()){
               if(!objUtiles.estaVacio(PRECARG) && (parseFloat(PRECARG)<0 || parseFloat(PRECARG)>100)){
                    alert("objJsMessages.jslit_error_precarg");
                    obj.focus();
               } 
            }
        }
    </script>
</head>
<body onload="javascript:f_onload()">

<c:import url="../include/precargador_ajax.jsp">
    <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
</c:import>
<form name="miForm" action="modal_axispro006.do" method="POST">
<input type="hidden" name="operation" value="" />
<input type="hidden" name="SPRODUC" id="SPRODUC" value="${__formdata.SPRODUC}" />
<input type="hidden" name="CFORPAG_ACT" id="CFORPAG_ACT" value="" />
<input type="hidden" name="TFORPAG_ACT" id="TFORPAG_ACT" value="" />
<input type="hidden" name="COBLIGA_ACT" id="COBLIGA_ACT" value="" />
<input type="hidden" name="PRECARG_ACT" id="PRECARG_ACT" value="" />
<input type="hidden" name="CPAGDEF_ACT" id="CPAGDEF_ACT" value="" />
<input type="hidden" name="CREVFPG_ACT" id="CREVFPG_ACT" value="" />
<input type="hidden" name="RADIO_ANT" id="RADIO_ANT" value="${__formdata.FORPAGDEF}" />
<c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt f="axispro006" c="LIT_1000222" lit="1000222"/></c:param>
        <c:param name="formulario"><axis:alt f="axispro006" c="LIT_1000222" lit="1000222"/></c:param>
        <c:param name="form">axispro006</c:param>
</c:import>

<div class="separador">&nbsp;</div>

<table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <table class="area" align="center" style="width:100%;">
                <tr>
                    <td>
                        <c:set var="title0"><axis:alt f="axispro006" c="LIT_100713" lit="100713"/></c:set>
                        <c:set var="title1"><axis:alt f="axispro006" c="LIT_105677" lit="105677"/></c:set>
                        <c:set var="title2"><axis:alt f="axispro006" c="LIT_1000485" lit="1000485"/></c:set>
                        <div class="displayspaceProductos">
                            <display:table name="${axispro_listaFormas}" id="miListaId" export="false" class="dsptgtable" pagesize="7"  defaultsort="3"  defaultorder="ascending" sort="list"  cellpadding="0" cellspacing="0" 
                                requestURI="axis_axispro006.do?paginar=true">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="" sortable="false" sortProperty="OB_IAX_PRODFORMAPAGO.TFORPAG" headerClass="sortable"  media="html" autolink="false">
                                    <div class="dspText">${miListaId.OB_IAX_PRODFORMAPAGO.TFORPAG}</div>
                                </display:column>
                                <display:column title="" sortable="false" sortProperty="OB_IAX_PRODFORMAPAGO.COBLIGA" headerClass="headwidth5 sortable" media="html" autolink="false">
                                    <div class="dspIcons"><input type="checkbox" name="COBLIGA_${miListaId.OB_IAX_PRODFORMAPAGO.CFORPAG}" id="COBLIGA_${miListaId.OB_IAX_PRODFORMAPAGO.CFORPAG}" <c:if test="${miListaId.OB_IAX_PRODFORMAPAGO.COBLIGA == 1}">checked</c:if> 
                                        onclick="javascript:f_actualizar_pago('${miListaId.OB_IAX_PRODFORMAPAGO.CFORPAG}', '${miListaId.OB_IAX_PRODFORMAPAGO.TFORPAG}', this.checked,
                                        null, document.miForm.CPAGDEF1_${miListaId.OB_IAX_PRODFORMAPAGO.CFORPAG}.value , document.miForm.CREVFPG1_${miListaId.OB_IAX_PRODFORMAPAGO.CFORPAG}.value)"/></div>                         
                                </display:column>
                                <display:column title="${title0}" headerClass="headwidth5 sortable" sortable="false" sortProperty="OB_IAX_PRODFORMAPAGO.CPAGDEF" media="html" autolink="false" style="width:10%">
                                    <div class="dspIcons">
                                    <input type="radio" name="CPAGDEF" id="CPAGDEF" value="${miListaId.OB_IAX_PRODFORMAPAGO.CFORPAG}" <c:if test="${miListaId.OB_IAX_PRODFORMAPAGO.CPAGDEF == 1}">checked</c:if> 
                                    onclick="javascript:f_actualiza_hidden(this.checked, ${miListaId.OB_IAX_PRODFORMAPAGO.CFORPAG});f_actualizar_pago('${miListaId.OB_IAX_PRODFORMAPAGO.CFORPAG}', '${miListaId.OB_IAX_PRODFORMAPAGO.TFORPAG}', document.miForm.COBLIGA_${miListaId.OB_IAX_PRODFORMAPAGO.CFORPAG}.checked,
                                        null, document.miForm.CPAGDEF1_${miListaId.OB_IAX_PRODFORMAPAGO.CFORPAG}.value, document.miForm.CREVFPG1_${miListaId.OB_IAX_PRODFORMAPAGO.CFORPAG}.value);"/>
                                        <input type="hidden"  name="CPAGDEF1_${miListaId.OB_IAX_PRODFORMAPAGO.CFORPAG}" id="CPAGDEF1_${miListaId.OB_IAX_PRODFORMAPAGO.CFORPAG}"  value="${miListaId.OB_IAX_PRODFORMAPAGO.CPAGDEF}" />
                                        </div> 
                                </display:column>
                                
                                <display:column title="${title1}" headerClass="headwidth5 sortable" sortable="false"  sortProperty="OB_IAX_PRODFORMAPAGO.CREVFPG" media="html" autolink="false" style="width:10%">
                                    <div class="dspIcons">
                                        <c:if test="${miListaId.OB_IAX_PRODFORMAPAGO.CFORPAG == 0}">
                                            <input type="checkbox" name="CREVFPG_${miListaId.OB_IAX_PRODFORMAPAGO.CFORPAG}" id="CREVFPG_${miListaId.OB_IAX_PRODFORMAPAGO.CFORPAG}"  value="${miListaId.OB_IAX_PRODFORMAPAGO.CREVFPG}" <c:if test="${miListaId.OB_IAX_PRODFORMAPAGO.CREVFPG == 1}">checked </c:if>
                                      onclick="javascript:f_actualiza_hidden_CREVFPG(this.checked, ${miListaId.OB_IAX_PRODFORMAPAGO.CFORPAG});f_actualizar_pago('${miListaId.OB_IAX_PRODFORMAPAGO.CFORPAG}', '${miListaId.OB_IAX_PRODFORMAPAGO.TFORPAG}', '${miListaId.OB_IAX_PRODFORMAPAGO.COBLIGA}',
                                        null, document.miForm.CPAGDEF1_${miListaId.OB_IAX_PRODFORMAPAGO.CFORPAG}.value, ((this.checked)?1:0))"/>
                                        </c:if>
                                        <input type="hidden"  name="CREVFPG1_${miListaId.OB_IAX_PRODFORMAPAGO.CFORPAG}" id="CREVFPG1_${miListaId.OB_IAX_PRODFORMAPAGO.CFORPAG}" value="${miListaId.OB_IAX_PRODFORMAPAGO.CREVFPG}"/>
                                        </div>         
                                </display:column>
                                </display:table>
                        </div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<c:import url="../include/botonera_nt.jsp"><c:param name="f">axispro006</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>
</form>
<c:import url="../include/mensajes.jsp" />

</body>
</html>
