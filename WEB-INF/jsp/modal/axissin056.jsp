<%/*
*  Fichero: axissin056.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*  
*  Titulo: Modal movimiento siniestro
*
*  Fecha: 23/10/2012
*/
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>
    <c:set var="linea_trami" value="${__formdata.indexTramitacio}"/> <!-- ${LINEATRAM} -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axissin056" c="TITULO" lit="9001473"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript">
        function f_onload() { 
                      
            var val1 = "<%=request.getAttribute("OK")%>"; 
            var tramdef = "<%=request.getAttribute("TRAMDEF")%>"; 
            var NSINIES = "${__formdata.NSINIES}";


             if (val1=="OK"){
                 parent.f_aceptar_axissin056(NSINIES); //TODO: Dato EJ. para volver a la pantalla
                this.f_but_cancelar(); 
            }

            f_cargar_propiedades_pantalla();
            
        }
        
        
            function f_cerrar_axisimprimir(){
            //alert("En cerrar");
            var NSINIES = "${__formdata.NSINIES}";
            parent.f_aceptar_axissin056(NSINIES); //TODO: Dato EJ. para volver a la pantalla
            this.f_but_cancelar();
          
        } 

       // bug 0021196 
       function f_cambia_estado(){
            
            CCESTADO = document.miForm.CESTTE.value;
           
            if (CCESTADO != null){
                objAjax.invokeAsyncCGI("modal_axissin056.do", callbackAjaxActualizaCausas, 
                    "operation=ajax_actualiza_causas_cambio_estado&CNUEVO_ESTADO="+CCESTADO, this, objJsMessages.jslit_actualizando_registro);}
        }

        // bug 0021196
        function callbackAjaxActualizaCausas(ajaxResponseText) {
            //alert(ajaxResponseText);
            var causasCombo = document.miForm.CCAUEST;
            try {
               var doc=objAjax.domParse(ajaxResponseText);
                                    
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        objDom.borrarOpcionesDeCombo(causasCombo);
                        
                        for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                            var TCAUEST = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TCAUEST")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TCAUEST")[0].childNodes[0].nodeValue : "");
                            var CCAUEST = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CCAUEST")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CCAUEST")[0].childNodes[0].nodeValue : "");
                           
                            objDom.addOpcionACombo(CCAUEST, CCAUEST+' - '+TCAUEST, causasCombo, i);
                        }
                    }else{
                        objDom.borrarOpcionesDeCombo (causasCombo);
                        objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", causasCombo, null);
                    }
                }
                
            } catch (e) {
                objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", causasCombo, null);
                alert(objJsMessages.jslit_sin_tramitadores);
            }
        }   

       
        
        function f_but_aceptar(){
            objUtiles.ejecutarFormulario ("modal_axissin056.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_cancelar(){
            parent.f_cerrar_modal("axissin056");
        }

        function callbackajaxaceptar(ajaxResponseText) {
            var doc=objAjax.domParse(ajaxResponseText);
            //alert(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_OK")[0])){
                    //alert(objJsMessages.jslit_operacion_ok+" "+objJsMessages.jslit_numero_siniestro+" "+doc.getElementsByTagName("OPERACION_AJAX_OK")[0].childNodes[0].nodeValue);
                    //Guardamos el número de siniestro
                    objDom.setValorPorId("NSINIES", doc.getElementsByTagName("OPERACION_AJAX_OK")[0].childNodes[0].nodeValue);
                    //Ahora todos los botones estan activos
                    document.miForm.but_consultar_siniestros.disabled=false;
                    document.miForm.but_151477.disabled=false; 
                    document.miForm.but_100009.disabled=true;
                }
            }
        }  

        function f_cambia_cunitra(obj){
            if (obj.value != "null"){
                objAjax.invokeAsyncCGI("modal_axissin056.do", callbackAjaxSelectedCunitra, 
                    "operation=ajax_selected_cunitra&CUNITRA="+document.miForm.CUNITRA.value+"&CEMPRES="+document.miForm.CEMPRES.value, this, objJsMessages.jslit_actualizando_registro);}
        }
        
        function callbackAjaxSelectedCunitra(ajaxResponseText) {
            var tramitadoresCombo = document.miForm.CTRAMIT;
            try {
               var doc=objAjax.domParse(ajaxResponseText);
                                    
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        objDom.borrarOpcionesDeCombo(tramitadoresCombo);
                        
                        for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                            var TTRAMITAD = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TTRAMITAD")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TTRAMITAD")[0].childNodes[0].nodeValue : "");
                            var CTRAMITAD = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CTRAMITAD")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CTRAMITAD")[0].childNodes[0].nodeValue : "");
                           
                            objDom.addOpcionACombo(CTRAMITAD, TTRAMITAD, tramitadoresCombo, i);
                        }
                    }else{
                        objDom.borrarOpcionesDeCombo (tramitadoresCombo);
                        objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", tramitadoresCombo, null);
                    }
                }
                
            } catch (e) {
                objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", tramitadoresCombo, null);
                alert(objJsMessages.jslit_sin_tramitadores);
            }
        }
            
    </script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="modal_axissin056.do" method="POST">
    <input type="hidden" name="operation" value="guardar" />
    <input type="hidden" name="subpantalla" value="tramitaciones"/>
    <input type="hidden" name="seccion" value="movimientos"/>
    <input type="hidden" name="CEMPRES" value="${__formdata.CEMPRES}"/>
    <input type="hidden" name="NSINIES" value="${__formdata.NSINIES}"/>
    <%--input type="hidden" name="NTRAMTE" value="${__formdata.NTRAMTE}"/%--%>
    <input type="hidden" name="TTRAMTE" value="${__formdata.TTRAMTE}"/>
    <input type="hidden" name="indexTramitacio" value="${__formdata.indexTramitacio}"/>
    <input type="hidden" name="SSEGURO" value="${__formdata.SSEGURO}"/>
    <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}"/>
    <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}"/>    
    
    <%-- pepe --%>
    <input type="hidden" name="CESTSIN" value="${__formdata.CESTSIN}"/>    
    <input type="hidden" name="FESTSIN" value="${__formdata.FESTSIN}"/>    

     <c:import url="../include/modal_estandar.jsp">
                    <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axissin056" c="lit_1000205" lit="1000205" /></c:param>
    </c:import>
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt f="axissin056" c="TITULO" lit="9001473"/></c:param>
        <c:param name="formulario"><axis:alt f="axissin056" c="TITULO" lit="9001473"/></c:param>
        <c:param name="form">axissin056</c:param>
    </c:import>
    <div class="separador">&nbsp;</div>
    <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
               <table class="seccion">
                    <tr>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                    </tr>
                                        
                    <tr>
                        <axis:visible c="CUNITRA" f="axissin056">                            
                        <td class="titulocaja">
                            <b><axis:alt f="axissin056" c="CUNITRA" lit="9000900"/></b><!-- Unidad de tramitacion -->
                        </td>
                        </axis:visible>                          
                        <axis:visible c="TTRAMITAD" f="axissin056">                            
                        <td class="titulocaja">
                           <b><axis:alt f="axissin056" c="TTRAMITAD" lit="140769"/></b><!-- Tramitador -->
                        </td>
                        </axis:visible>                          
                    </tr>

                    <tr>
                        <!-- Unitat Tramitació -->
                        <axis:visible c="CUNITRA" f="axissin056">
                        <td class="campocaja">
                            <select name = "CUNITRA" id ="CUNITRA" size="1" onchange="f_cambia_cunitra(this)" class="campowidthselect campo campotexto_ob">                                                    
                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin056" c="COMBO_CUNITRA" lit="1000348"/> - </option>
                                <c:forEach var="cunitraOp" items="${__formdata.listvalores.lstcunitra}">
                                    <option value = "${cunitraOp.CTRAMITAD}" 
                                    <c:if test="${cunitraOp.CTRAMITAD == __formdata.CUNITRA}">selected</c:if>>
                                        ${cunitraOp.TTRAMITAD}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        </axis:visible>                                 
                        <!-- Tramitador -->
                        <axis:visible c="CTRAMIT" f="axissin056">                        
                        <td class="campocaja">
                            <select name = "CTRAMIT" id ="CTRAMIT" size="1" class="campowidthselect campo campotexto_ob">
                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin056" c="COMBO_CTRAMIT" lit="1000348"/> - </option>
                                <c:forEach var="ttramitadOp" items="${__formdata.listvalores.lsttramit}">
                                    <option value = "${ttramitadOp.CTRAMITAD}" 
                                    <c:if test="${__formdata.CTRAMITAD  != 'null' && ttramitadOp.CTRAMITAD == __formdata.CTRAMIT}">selected</c:if>>
                                        ${ttramitadOp.TTRAMITAD} 
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        </axis:visible>  
                        
                    </tr>
                    
                    <tr>
                    
                </table>
            </td>
        </tr>
    </table>
    <c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axissin056</c:param>
        <c:param name="__botones">cancelar,aceptar</c:param>
    </c:import>
    </form>
  <c:import url="../include/mensajes.jsp" />
</body>
</html>