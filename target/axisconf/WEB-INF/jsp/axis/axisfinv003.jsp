<%/*
*  Fichero: axisfinv003.jsp
*
*  Fecha: 23/03/2009
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
    <title><axis:alt f="axisfinv003" c="TIT_PANTALLA" lit="9001305"/></title> <%-- ALTA/MODIFICACIÓN VALORES LIQUIDATIVOS/OPERACIONES --%>
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
            
            f_cargar_propiedades_pantalla();
        }
        
        
        function f_but_aceptar(){           
            if(objValidador.validaEntrada()){
            f_control_valor("ACEPTAR");
            objDom.setDisabledPorId("but_aceptar", true);           
            }
        }
        
        function f_but_9001312(){//Calcular
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario ("axis_axisfinv003.do", "calcular", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        
        function f_but_cancelar() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisfinv002", "cancelar", document.miForm, "_self");
        }
        
       // CEMPRES, CCODFON, FVALOR y IUNIACT.        
        function f_control_valor(origen){     
            
               objDom.setDisabledPorId("but_aceptar", true);           
               var params = "&CEMPRES=" + objDom.getValorPorId("CEMPRES") + "&CCODFON=" + objDom.getValorPorId("CCODFON") 
               + "&FVALOR=" + objDom.getValorPorId("FVALOR") + "&IUNIACT=" + objDom.getValorPorId("IUNIACT")+ "&PATRIMONIO=" + objDom.getValorPorId("PATRIMONIO") + "&ORIGEN=" + origen ; 
               objAjax.invokeAsyncCGI("axis_axisfinv003.do", callbackAjaxControlValor, 
                     "operation=ajax_comprovarValor" + params, this,objJsMessages.jslit_cargando);           
           
        }
        
        function callbackAjaxControlValor(ajaxResponseText){            
            try{  
               
                objDom.setDisabledPorId("but_aceptar", false);
                var doc=objAjax.domParse(ajaxResponseText);            
               
                objAppMensajes.existenErroresEnAplicacion(doc);
       
                var mensaje_info="";
                
                //Montamos el mensaje con infos
                     
                      if(objUtiles.existeObjetoXml(doc.getElementsByTagName("m__infos")[0])){
                            for(var i=0;i<doc.getElementsByTagName("element").length;i++){
                                if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TIPINFO")[0]) &&
                                     !objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("m__infos")[0]) ){
                        
                                        if(mensaje_info == "") mensaje_info = ( ( objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TINFO")[0])  ) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TINFO")[0].childNodes[0].nodeValue : (( objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CINFO")[0]) ) ? objJsMessages.jslit_informacion_general + doc.getElementsByTagName("element")[i].getElementsByTagName("CINFO")[0].childNodes[0].nodeValue : objJsMessages.jslit_informacion_general ) );
                                        else mensaje_info = mensaje_info + "<br>" + ( ( objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TINFO")[0])  ) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TINFO")[0].childNodes[0].nodeValue : (( objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CINFO")[0]) ) ? objJsMessages.jslit_informacion_general + doc.getElementsByTagName("element")[i].getElementsByTagName("CINFO")[0].childNodes[0].nodeValue : objJsMessages.jslit_informacion_general ) );
                
                                }
                            }
                     }
                     
                     
              
          
                
                var ORIGEN = objDom.getValorNodoDelComponente(doc.getElementsByTagName("ORIGEN"), 0, 0);
               
               
                if(ORIGEN!=null && ORIGEN == 'ACEPTAR'){
                
                    if (doc.getElementsByTagName("m__infos")[0] != null)  {  //Si hay mensajes de info se acepta y se continua
                  
                       if(confirm(mensaje_info)){
                             objUtiles.ejecutarFormulario ("axis_axisfinv003.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
                            
                       }
                    }else{  // Si no hay errores ni mensajes de info
                             objUtiles.ejecutarFormulario ("axis_axisfinv003.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
                    }
                }
                
            }catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
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
                <c:param name="titulo"><axis:alt f="axisfinv003" c="TITULAR" lit="9001305"/></c:param>     <%-- ALTA/MODIFICACIÓN VALORES LIQUIDATIVOS/OPERACIONES --%>
                <c:param name="formulario"><axis:alt f="axisfinv003" c="SUBTIT" lit="9001305"/></c:param> <%-- ALTA/MODIFICACIÓN VALORES LIQUIDATIVOS/OPERACIONES --%>
                <c:param name="form">axisfinv003</c:param>
        </c:import>
    
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="CEMPRES_FILTRO" id="CEMPRES_FILTRO" value="${requestScope.CEMPRES_FILTRO}"/>
        <input type="hidden" name="CCODFON_FILTRO" id="CCODFON_FILTRO" value="${requestScope.CCONFON_FILTRO}"/>
        <input type="hidden" name="FVALOR_FILTRO" id="FVALOR_FILTRO" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${requestScope.FVALOR_FILTRO}'/>"/>

        <input type="hidden" name="CEMPRES" id="CEMPRES" value="${requestScope.CEMPRES}"/>
        <input type="hidden" name="CCODFON" id="CCODFON" value="${requestScope.CCODFON}"/>
        <input type="hidden" name="TFONABV" id="TFONABV" value="${requestScope.TFONABV}"/>
        <input type="hidden" name="CTIPFON" id="CTIPFON" value="${__formdata.CTIPFON}"/>
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo"><img src="images/flecha.gif"/><b><axis:alt f="axisfinv003" c="TIT_DATOS" lit="1000178"/></b></div>
                    <table class="seccion">
                            <tr>
                            <td align="left">
                                 <table border="0" class="area" align="center">
                                    <tr>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <axis:visible f="axisfinv003" c="CCODFON"> 
                                            <td class="titulocaja" >
                                                <b id="label_CCODFON"><axis:alt f="axisfinv003" c="CCODFON_LIT" lit="1000179" /></b>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisfinv003" c="FVALOR"> 
                                            <td class="titulocaja">
                                                <b id="label_FVALOR"><axis:alt f="axisfinv003" c="FVALOR_LIT" lit="1000590" /></b>
                                            </td>
                                        </axis:visible>
                                     </tr>
                                     <tr>
                                        <axis:visible f="axisfinv003" c="CCODFON"> 
                                            <td class="campocaja">    
                                                <input type="text" name="CCODFON_TFONABV" id="CCODFON_TFONABV" value="${requestScope.CCODFON} - ${requestScope.TFONABV}" class="campowidthinput campo campotexto"
                                                <axis:atr f="axisfinv003" c="CCODFON" a="modificable=false&obligatorio=false"/> alt="<axis:alt f="axisfinv003" c="CCODFON_ALT" lit="1000179" />" title="<axis:alt f="axisfinv003" c="CCODFON_ALT" lit="1000179" />"/>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisfinv003" c="FVALOR"> 
                                            <td class="campocaja">    
                                                <input type="text" name="FVALOR" id="FVALOR" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${requestScope.FVALOR}"/>" class="campowidthinput campo campotexto"
                                                <axis:atr f="axisfinv003" c="FVALOR" a="modificable=false&obligatorio=false"/> alt="<axis:alt f="axisfinv003" c="FAVLOR_ALT" lit="1000590" />" title="<axis:alt f="axisfinv003" c="FVALOR_ALT" lit="1000590" />"/>
                                            </td>
                                        </axis:visible>
                                     </tr>
                                     <tr>
                                        <axis:visible f="axisfinv003" c="IIMPCMP"> 
                                            <td class="titulocaja" >
                                                <b id="label_IIMPCMP"><axis:alt f="axisfinv003" c="IIMPCMP_LIT" lit="9001297" /></b>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisfinv003" c="NUNICMP"> 
                                            <td class="titulocaja">
                                                <b id="label_NUNICMP"><axis:alt f="axisfinv003" c="NUNICMP_LIT" lit="9001298" /></b>
                                            </td>
                                        </axis:visible>
                                     </tr>
                                     <tr>
                                        <axis:visible f="axisfinv003" c="IIMPCMP"> 
                                            <td class="campocaja">    
                                                <input type="text" name="IIMPCMP" id="IIMPCMP" value="<fmt:formatNumber pattern="###,##0.000000" value='${requestScope.IIMPCMP}'/>" class="campowidthinput campo campotexto"
                                                <axis:atr f="axisfinv003" c="IIMPCMP" a="modificable=true&obligatorio=false&formato=decimal"/> alt="<axis:alt f="axisfinv003" c="IIMPCMP_ALT" lit="9001297" />" title="<axis:alt f="axisfinv003" c="IIMPCMP_ALT" lit="9001297" />"/>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisfinv003" c="NUNICMP"> 
                                            <td class="campocaja">    
                                                <input type="text" name="NUNICMP" id="NUNICMP" value="<fmt:formatNumber pattern="###,##0.000000" value='${requestScope.NUNICMP}'/>" class="campowidthinput campo campotexto"
                                                <axis:atr f="axisfinv003" c="NUNICMP" a="modificable=true&obligatorio=false&formato=decimal"/> alt="<axis:alt f="axisfinv003" c="NUNICMP_ALT" lit="9001298" />" title="<axis:alt f="axisfinv003" c="NUNICMP_ALT" lit="9001298" />"/>
                                            </td>
                                        </axis:visible>
                                     </tr>
                                     <tr>
                                        <axis:visible f="axisfinv003" c="IIMPVNT"> 
                                            <td class="titulocaja" >
                                                <b id="label_IIMPVNT"><axis:alt f="axisfinv003" c="IIMPVNT_LIT" lit="9001299" /></b>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisfinv003" c="NUNIVNT"> 
                                            <td class="titulocaja">
                                                <b id="label_NUNIVNT"><axis:alt f="axisfinv003" c="NUNIVNT_LIT" lit="9001300" /></b>
                                            </td>
                                        </axis:visible>
                                     </tr>
                                     <tr>
                                        <axis:visible f="axisfinv003" c="IIMPVNT"> 
                                            <td class="campocaja">    
                                                <input type="text" name="IIMPVNT" id="IIMPVNT" value="<fmt:formatNumber pattern="###,##0.000000" value='${requestScope.IIMPVNT}'/>" class="campowidthinput campo campotexto"
                                                <axis:atr f="axisfinv003" c="IIMPVNT" a="modificable=true&obligatorio=false&formato=decimal"/> alt="<axis:alt f="axisfinv003" c="IIMPVNT_ALT" lit="9001299" />" title="<axis:alt f="axisfinv003" c="IIMPVNT_ALT" lit="9001299" />"/>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisfinv003" c="NUNIVNT"> 
                                            <td class="campocaja">    
                                                <input type="text" name="NUNIVNT" id="NUNIVNT" value="<fmt:formatNumber pattern="###,##0.000000" value='${requestScope.NUNIVNT}'/>" class="campowidthinput campo campotexto"
                                                <axis:atr f="axisfinv003" c="NUNIVNT" a="modificable=true&obligatorio=false&formato=decimal"/> alt="<axis:alt f="axisfinv003" c="NUNIVNT_ALT" lit="9001300" />" title="<axis:alt f="axisfinv003" c="NUNIVNT_ALT" lit="9001300" />"/>
                                            </td>
                                        </axis:visible>
                                     </tr>
                                     <tr>
                                        <axis:visible f="axisfinv003" c="IUNIACT"> 
                                            <td class="titulocaja" >
                                                <b id="label_IUNIACT"><axis:alt f="axisfinv003" c="IUNIACT_LIT" lit="9001296" /></b>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisfinv003" c="IUNIACTCMP"> 
                                            <td class="titulocaja" >
                                                <b id="label_IUNIACTCMP"><axis:alt f="axisfinv003" c="IUNIACTCMP_LIT" lit="9906967" /></b>
                                            </td>
                                        </axis:visible>
                                        <c:if test="${__formdata.CTIPFON==1}">
                                        <axis:visible f="axisfinv003" c="IUNIACTVTASHW"> 
                                            <td class="titulocaja" >
                                                <b id="label_IUNIACTVTASHW"><axis:alt f="axisfinv003" c="IUNIACTVTASHW_LIT" lit="9906968" /></b>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisfinv003" c="IUNIACTCMPSHW"> 
                                            <td class="titulocaja" >
                                                <b id="label_IUNIACTCMPSHW"><axis:alt f="axisfinv003" c="IUNIACTCMPSHW_LIT" lit="9906969" /></b>
                                            </td>
                                        </axis:visible>
                                        </c:if>
                                        <axis:visible f="axisfinv003" c="PATRIMONIO"> 
                                            <td class="titulocaja" >
                                                <b id="label_PATRIMONIO"><axis:alt f="axisfinv003" c="PATRIMONIO_LIT" lit="9901844" /></b>
                                            </td>
                                        </axis:visible>
                                     </tr>
                                     <tr>
                                        <axis:visible f="axisfinv003" c="IUNIACT"> 
                                            <td class="campocaja">                                                
                                                <input  type="text" name="IUNIACT" id="IUNIACT" value="<fmt:formatNumber pattern="###,#####0.000000" value='${IUNIACT}'/>" class="campowidthinput campo campotexto"
                                                <axis:atr f="axisfinv003" c="IUNIACT" a="modificable=true&obligatorio=true&formato=decimal"/> alt="<axis:alt f="axisfinv003" c="IUNIACT_ALT" lit="9001296" />" title="<axis:alt f="axisfinv003" c="IUNIACT_ALT" lit="9001296" />"/>
                                            </td>
                                        </axis:visible>
                                           <axis:visible f="axisfinv003" c="IUNIACTCMP"> 
                                            <td class="campocaja">                                                
                                                <input  type="text" name="IUNIACTCMP" id="IUNIACTCMP" value="<fmt:formatNumber pattern="###,#####0.000000" value='${IUNIACTCMP}'/>" class="campowidthinput campo campotexto"
                                                <axis:atr f="axisfinv003" c="IUNIACTCMP" a="modificable=true&obligatorio=true&formato=decimal"/> alt="<axis:alt f="axisfinv003" c="IUNIACTCMP_ALT" lit="9906967" />" title="<axis:alt f="axisfinv003" c="IUNIACTCMP_ALT" lit="9906967" />"/>
                                            </td>
                                        </axis:visible>
                                        <c:if test="${__formdata.CTIPFON==1}">
                                           <axis:visible f="axisfinv003" c="IUNIACTVTASHW"> 
                                            <td class="campocaja">                                                
                                                <input  type="text" name="IUNIACTVTASHW" id="IUNIACTVTASHW" value="<fmt:formatNumber pattern="###,#####0.000000" value='${IUNIACTVTASHW}'/>" class="campowidthinput campo campotexto"
                                                <axis:atr f="axisfinv003" c="IUNIACTVTASHW" a="modificable=true&obligatorio=false&formato=decimal"/> alt="<axis:alt f="axisfinv003" c="IUNIACTVTASHW_ALT" lit="9001296" />" title="<axis:alt f="axisfinv003" c="IUNIACTVTASHW_ALT" lit="9001296" />"/>
                                            </td>
                                        </axis:visible>
                                           <axis:visible f="axisfinv003" c="IUNIACTCMPSHW"> 
                                            <td class="campocaja">                                                
                                                <input  type="text" name="IUNIACTCMPSHW" id="IUNIACTCMPSHW" value="<fmt:formatNumber pattern="###,#####0.000000" value='${IUNIACTCMPSHW}'/>" class="campowidthinput campo campotexto"
                                                <axis:atr f="axisfinv003" c="IUNIACTCMPSHW" a="modificable=true&obligatorio=false&formato=decimal"/> alt="<axis:alt f="axisfinv003" c="IUNIACTCMPSHW_ALT" lit="9001296" />" title="<axis:alt f="axisfinv003" c="IUNIACTCMPSHW_ALT" lit="9001296" />"/>
                                            </td>
                                        </axis:visible>
                                        </c:if>
                                        <axis:visible f="axisfinv003" c="PATRIMONIO"> 
                                            <td class="campocaja">                                                
                                                <input  type="text" name="PATRIMONIO" id="PATRIMONIO" value="<fmt:formatNumber pattern="###,#####0.000000" value='${__formdata.PATRIMONIO}'/>" class="campowidthinput campo campotexto"
                                                <axis:atr f="axisfinv003" c="PATRIMONIO" a="modificable=true&obligatorio=false&formato=decimal"/> alt="<axis:alt f="axisfinv003" c="PATRIMONIO_ALT" lit="9901844" />" title="<axis:alt f="axisfinv003" c="PATRIMONIO_ALT" lit="9901844" />"/>
                                            </td>
                                        </axis:visible>
                                     </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <axis:visible f="axisfinv003" c="IVALACT"> 
                        <div class="titulo"><img src="images/flecha.gif"/><b><axis:alt f="axisfinv003" c="IVALACT_IMG" lit="111046"/></b></div>
                    </axis:visible>    
                    <table class="seccion">
                            <tr>
                            <td align="left">
                                 <table border="0" class="area" align="center">
                                    <tr>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:75%;height:0px"></th>                                        
                                    </tr>
                                    <tr>
                                        <axis:visible f="axisfinv003" c="IVALACT"> 
                                            <td class="titulocaja" >
                                                <b id="label_IVALACTFONDO"><axis:alt f="axisfinv003" c="IVALACT_LIT" lit="9001301" /></b>
                                            </td>
                                        </axis:visible>
                                    </tr>
                                    <tr>
                                        <axis:visible f="axisfinv003" c="IVALACT"> 
                                            <td class="campocaja">                                                
                                                <input type="text" name="IVALACT" id="IVALACT" value="<fmt:formatNumber pattern="###,##0.000000" value='${requestScope.IVALACT}'/>" class="campowidthinput campo campotexto"
                                                <axis:atr f="axisfinv003" c="IVALACT" a="modificable=false&obligatorio=false&formato=decimal"/> alt="<axis:alt f="axisfinv003" c="IVALACT_ALT" lit="9001301" />" title="<axis:alt f="axisfinv003" c="IVALACT_ALT" lit="9001301" />"/>
                                            </td>
                                        </axis:visible>
                                    </tr>
                                </table>
                            </td>
                            </tr>
                    </table>
                </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisfinv003</c:param>
             <c:param name="f">axisfinv003</c:param>
            <c:param name="__botones">cancelar,<axis:visible c="BT_CANCELAR" f="axisfinv003">9001312,</axis:visible>aceptar</c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
</body>
</html>