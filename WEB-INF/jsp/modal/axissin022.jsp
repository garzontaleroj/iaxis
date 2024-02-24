<%/**
*  Fichero: axissin022.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a>
*
*  Fecha: 25/05/2009
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ page import="java.lang.String" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
<link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
<link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
<c:import url="../include/carga_framework_js.jsp"/>

<script language="Javascript" type="text/javascript">
// Código javascript

    function f_llenar_motivos(valor){
           objAjax.invokeAsyncCGI("modal_axissin022.do", callbackAjaxRecuperarMotivos, "operation=ajax_recuperar_motivos&CVALOR="+valor, this, objJsMessages.jslit_actualizando_registro);
    }
    
    function callbackAjaxRecuperarMotivos(ajaxResponseText){
            try {  
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {                                
                    var elementos = doc.getElementsByTagName("element");
                    var modelocombo = document.miForm.CMOTSIN;     
                    objDom.borrarOpcionesDeCombo(modelocombo);
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        var elementos = doc.getElementsByTagName("element");
                        var modelocombo = document.miForm.CMOTSIN;     
                        objDom.borrarOpcionesDeCombo(modelocombo);
                        for (i = 0; i < elementos.length; i++) {
                            var codigo = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CMOTSIN")[0]) ?
                                         objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CMOTSIN"), 0, 0) : "";
                            var desc   = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("TMOTSIN")[0]) ?
                                         objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TMOTSIN"), 0, 0): "";
                           // objDom.addOpcionACombo(codigo, desc, modelocombo, i+1);
                           objDom.addOpcionACombo(codigo, desc, modelocombo, i);
                        }
                        
                    }
                    if (elementos.length == 0){
                        objDom.addOpcionACombo(null, "Seleccione", modelocombo, 0);
                        var elementos = doc.getElementsByTagName("element");
                        var versioncombo = document.miForm.CMOTSIN;     
                        objDom.borrarOpcionesDeCombo(versioncombo);
                        objDom.addOpcionACombo(null, "Seleccione", versioncombo, 0);
                    }
                    
                } 
             } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
               }
            }

    function f_but_cancelar(){
        parent.f_cerrar_modal("axissin022");
    }
    
    function f_but_aceptar(){
        objUtiles.ejecutarFormulario("modal_axissin022.do","guardar_causamotivo", document.miForm, "_self", objJsMessages.jslit_cargando);
        parent.f_aceptar_axissin22();
    }
    
    function f_onload(){
        f_cargar_propiedades_pantalla();

     // revisarEstilos();
     // var ver="${ERROR}";
     //    if (!objUtiles.estaVacio(ver) && '${ERROR}' == 0){
     //        f_but_cancelar();
     //    }
    }    
    
    function f_marcar(check){
        if(check.checked)
            document.miForm.CPAGAUT.value = 1;
        else
            document.miForm.CPAGAUT.value = 0;
    }
    
    function f_marcar2(check){
        if(check.checked)
            document.miForm.CDESAUT.value = 1;
        else
            document.miForm.CDESAUT.value = 0;
    }

    // bug 0022490
    function f_marcar3(check){
        if(check.checked)
            document.miForm.CULTPAG.value = 1;
        else
            document.miForm.CULTPAG.value = 0;
    }

// Fin código javascript
</script>

<body onload="f_onload()">

            <c:import url="../include/precargador_ajax.jsp">
                <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
            </c:import>
            
<form name="miForm" action="" method="POST">

            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="HCSCAUMOT"  value="${CSCAUMOT}" />
            <input type="hidden" name="HCCAUSIN"  value="${CCAUSIN}" />
            <input type="hidden" name="HCMOTSIN"  value="${CMOTSIN}" />
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario">
                    <axis:alt f="axissin022" c="titulont_formulario" lit="9001716"/>
                </c:param>
                <c:param name="producto">
                    <axis:alt f="axissin022" c="titulont_producto" lit="9001716"/>
                </c:param>
                <c:param name="form">axissin022</c:param>
            </c:import>
            
            
            <!-- Area de campos  -->
            <table class="mainModalDimensions base" align="center"
                   cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion" >
                            <tr>
                                <th style="width:2%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:10%; height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:10%; height:0px"></th>
                                <th style="width:23%; height:0px"></th>
                                
                            </tr>
                            <tr>
                                <td></td>
                                <!-- Cod.Motivo/Causa -->
                                 <axis:visible c="CSCAUMOT" f="axissin022">
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin022" c="tit_CSCAUMOT" lit="800440"/></b>
                                </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <td></td>
                                <axis:visible c="CSCAUMOT" f="axissin022">
                                <td class="campocaja" >
                                    <input type="text" name="CSCAUMOT" id="CSCAUMOT"  value="${CSCAUMOT}"  class="campowidthinput campo campotexto"
                                    <c:if test="${isNew eq 'No'}"> readonly="true"</c:if> />
                                </td>
                                </axis:visible>
                            </tr>

                            <tr>
                                <td></td>
                                <!-- Causa -->
                                <axis:visible c="CCAUSIN" f="axissin022">
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axissin022" c="tit_CCAUSIN" lit="101040"/></b>
                                </td>
                                </axis:visible>
                                <!-- Motiu -->
                                <axis:visible c="CMOTSIN" f="axissin022">
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axissin022" c="tit_CMOTSIN" lit="102577"/></b>
                                </td>
                                </axis:visible>
                                <!-- T.Movimiento -->
                                <axis:visible c="CMOVIMI" f="axissin022">
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axissin022" c="tit_CMOVIMI" lit="1000591"/></b>
                                </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <td></td>
                                <!-- Causa -->
                                <axis:visible c="CCAUSIN" f="axissin022">
                                <td class="campocaja" colspan="2">
                                    <select name = "CCAUSIN" id="CCAUSIN"  <axis:atr f="axissin022" c="CCAUSIN" a="modificable=true&isInputText=false"/>
                                         value="" size="1" onchange="f_llenar_motivos(this.value)" class="campowidthselect campo campotexto"
                                         <c:if test="${isNew eq 'No'}"> disabled</c:if>>
                                                <option value=""> - <axis:alt f="axissin022" c="cam_CCAUSIN" lit="108341"/> - </option>
                                                <c:forEach var="causas" items="${LSTCAUSAS}">
                                                    <option value = "${causas.CCAUSIN}"
                                                     <c:if test="${(!empty CCAUSIN) && CCAUSIN == causas.CCAUSIN}">selected</c:if>>
                                                     ${causas.TCAUSIN}</option>  
                                                </c:forEach>
                                    </select>
                                </td>
                                </axis:visible>
                                <!-- Motiu -->
                                <axis:visible c="CMOTSIN" f="axissin022">
                                <td class="campocaja" colspan="2">
                                    <select name = "CMOTSIN" id="CMOTSIN"  <axis:atr f="axissin022" c="CMOTIVO" a="modificable=true&isInputText=false"/>
                                         value="" size="1" onchange="" class="campowidthselect campo campotexto" <c:if test="${isNew eq 'No'}"> disabled</c:if> >
                                                <option value=""> - <axis:alt f="axissin022" c="cam_CMOTSIN" lit="108341"/> - </option>
                                                <c:forEach var="motivos" items="${LSTMOTIVOS}">
                                                    <option value = "${motivos.CMOTSIN}"
                                                     <c:if test="${(!empty CMOTSIN) && CMOTSIN == motivos.CMOTSIN}">selected</c:if>>
                                                     ${motivos.TMOTSIN}</option>  
                                                </c:forEach>
                                    </select>
                                </td>
                                </axis:visible>
                                <!-- T. Movimiento -->
                                <axis:visible c="CMOVIMI" f="axissin022">
                                <td class="campocaja" colspan="2" >
                                     <select name = "CMOVIMI" id="CMOVIMI"  <axis:atr f="axissin022" c="CMOVIMI" a="modificable=true&isInputText=false"/>
                                         value="" size="1" onchange="" class="campowidthselect campo campotexto">
                                                <option value=""> - <axis:alt f="axissin022" c="cam_CMOVIMI" lit="108341"/> - </option>
                                                <c:forEach var="movi" items="${LSTMOVIMIENTOS}">
                                                    <option value = "${movi.CATRIBU}"
                                                     <c:if test="${(!empty CMOVIMI) && CMOVIMI == movi.CATRIBU}">selected</c:if>>
                                                     ${movi.TATRIBU}</option>  
                                                </c:forEach>
                                    </select>
                                </td>
                                </axis:visible>
                            </tr>   
                            <tr>
                                <td></td>
                                <!-- Cod. Apertura Siniestro -->
                                <axis:visible c="CMOTMOV" f="axissin022">
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axissin022" c="tit_CMOTMOV" lit="9001691"/></b>
                                </td>
                                </axis:visible>
                                <!-- Acc. Finalización siniestro -->
                                <axis:visible c="CMOTFIN" f="axissin022">
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axissin022" c="tit_CMOTFIN" lit="9001692"/></b>
                                </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <td></td>
                                <!-- Cod. Apertura Siniestro -->
                                <axis:visible c="CMOTMOV" f="axissin022">
                                <td class="campocaja" colspan="2">
                                    <select name = "CMOTMOV" id="CMOTMOV"  <axis:atr f="axissin022" c="CMOTMOV" a="modificable=true&isInputText=false"/>
                                         value="" size="1" onchange="" class="campowidthselect campo campotexto">
                                                <option value=""> - <axis:alt f="axissin022" c="cam_CMOTMOV" lit="108341"/> - </option>
                                                <c:forEach var="movi" items="${LSTACCIONES}">
                                                    <option value = "${movi.CMOTMOV}"
                                                     <c:if test="${(!empty CMOTMOV) && CMOTMOV == movi.CMOTMOV}">selected</c:if>>
                                                     ${movi.TMOTMOV}</option>  
                                                </c:forEach>
                                    </select>
                                </td>
                                </axis:visible>
                                <!-- Acc. Finalización siniestro -->
                                <axis:visible c="CMOTFIN" f="axissin022">
                                <td class="campocaja" colspan="2">
                                    <select name = "CMOTFIN" id="CMOTFIN"  <axis:atr f="axissin022" c="CMOTFIN" a="modificable=true&isInputText=false"/>
                                         value="" size="1" onchange="" class="campowidthselect campo campotexto">
                                                <option value=""> - <axis:alt f="axissin022" c="cam_CMOTFIN" lit="108341"/> - </option>
                                                <c:forEach var="movi" items="${LSTACCIONES}">
                                                    <option value = "${movi.CMOTMOV}"
                                                     <c:if test="${(!empty CMOTFIN) && CMOTFIN == movi.CMOTMOV}">selected</c:if>>
                                                     ${movi.TMOTMOV}</option>  
                                                </c:forEach>
                                    </select>
                                </td >
                                </axis:visible>
                                
                            </tr>
                            <tr>
                                <td></td>
                                <!-- Pagos Automaticos -->
                                <axis:visible c="CPAGAUT" f="axissin022">
                                <td class="campocaja" colspan="2">
                                    <b><axis:alt f="axissin022" c="cam_CPAGAUT" lit="9001693"/></b> <input type="checkbox" name="CPAGAUT" id="CPAGAUT"  value="${CPAGAUT}"  <c:if test="${CPAGAUT == 1}"> checked </c:if> onclick="f_marcar(this)"/>
                               </td>
                               </axis:visible>
                               <!-- Creación automática de destinatario -->
                                <axis:visible c="CDESAUT" f="axissin022">
                                <td class="campocaja" colspan="2">
                                    <b><axis:alt f="axissin022" c="cam_CDESAUT" lit="9900954"/></b> <input type="checkbox" name="CDESAUT" id="CDESAUT"  value="${CDESAUT}"  <c:if test="${CDESAUT == 1}"> checked </c:if> onclick="f_marcar2(this)"/>
                               </td>
                               </axis:visible>

                                <!-- bug 0022490 -->
                                <!-- ultimo pago -->
                                <axis:visible c="CULTPAG" f="axissin022">
                                <td class="campocaja" colspan="2">
                                    <b><axis:alt f="axissin022" c="cam_CULTPAG" lit="9902312"/></b> <input type="checkbox" name="CULTPAG" id="CULTPAG"  value="${CULTPAG}"  <c:if test="${CULTPAG == 1}"> checked </c:if> onclick="f_marcar3(this)"/>
                               </td>
                               </axis:visible>

                            </tr>
                        </table>
                    </td>
                </tr>
              </table>
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin022</c:param><c:param name="f">axissin022</c:param>
                <c:param name="__botones"><axis:visible c="BTCANCELAR" f="axissin022">cancelar,</axis:visible><axis:visible c="BTACEPTAR" f="axissin022">aceptar</axis:visible></c:param>
            </c:import>
            
</form>
<c:import url="../include/mensajes.jsp"/>
</body>



