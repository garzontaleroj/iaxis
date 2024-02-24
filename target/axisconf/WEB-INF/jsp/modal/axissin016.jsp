<%/* Revision:# viuKoNnyC3HvZxDIYCiaOg== # */%>
<%/*
*  Fichero: axissin016.jsp
  
*  Titulo: Modal modificar movimientos tramitación
*
*  Fecha: 03/03/2009
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
    <title><axis:alt f="axissin016" c="TITULO" lit="9001130"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript">
        function f_onload() { 
            var val1 = "<%=request.getAttribute("OK")%>"; 
            var tramdef = "<%=request.getAttribute("TRAMDEF")%>"; 
            var NSINIES = "${__formdata.NSINIES}";
             objDom.setValorPorId("NSINIES_O",NSINIES);
            
            if (val1=="OK"){
                <c:if test="${__formdata.CESTTRA==3}">  
                    objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_trami&NSINIES="+document.miForm.NSINIES.value+"&NTRAMIT="+document.miForm.NTRAMIT.value+"&CESTADO="+document.miForm.CESTTRA.value+"&TIPO=SINIES_TRAMI");
                </c:if>
                <c:if test="${__formdata.CESTTRA!=3}">  
                    parent.f_aceptar_axissin016(NSINIES); //TODO: Dato EJ. para volver a la pantalla
                    this.f_but_cancelar(); 
                </c:if>
            }
            f_cargar_propiedades_pantalla();
        }
        
        
        function f_cerrar_axisimprimir(){
            var NSINIES = "${__formdata.NSINIES}";
            parent.f_aceptar_axissin016(NSINIES); //TODO: Dato EJ. para volver a la pantalla
            this.f_but_cancelar();
        } 

       // bug 0021196 
       function f_cambia_estado(){
            
            CCESTADO = document.miForm.CESTTRA.value;
           
            if (CCESTADO != null){
                objAjax.invokeAsyncCGI("modal_axissin016.do", callbackAjaxActualizaCausas, 
                    "operation=ajax_actualiza_causas_cambio_estado&CNUEVO_ESTADO="+CCESTADO, this, objJsMessages.jslit_actualizando_registro);}
        }

        // bug 0021196
        function callbackAjaxActualizaCausas(ajaxResponseText) {
            //alert(ajaxResponseText);
               <axis:visible c="CCAUEST" f="axissin016">
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
              </axis:visible>
        }   

       
        
        function f_but_aceptar(){
            var tramdef = "<%=request.getAttribute("TRAMDEF")%>"; 
            //Bug 23940
            //if (tramdef==1) {
            //    objDom.setDisabledPorId ("CUNITRA", false);
            //    objDom.setDisabledPorId ("CTRAMIT", false);
            //}            
            
            /*Bug 26472/165729
                objUtiles.ejecutarFormulario ("modal_axissin016.do", "guardar", document.miForm, "_self");  
            */
            var NSINIES = "${__formdata.NSINIES}";
            if ($("#CESTTRA").val()!=0){
                f_valida_ult_tra();
            }else{
                objUtiles.ejecutarFormulario ("modal_axissin016.do", "guardar", document.miForm, "_self");  
            }
            
            /*fin Bug 26472/165729                */
            
            //if (tramdef==1) {
            //    objDom.setDisabledPorId ("CUNITRA", true);
            //    objDom.setDisabledPorId ("CTRAMIT", true);
            //}            
        }
        
        function f_but_cancelar(){
            parent.f_cerrar_modal("axissin016");
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
                objAjax.invokeAsyncCGI("modal_axissin016.do", callbackAjaxSelectedCunitra, 
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
        
        function f_valida_ult_tra(){
                objAjax.invokeAsyncCGI("modal_axissin016.do", callbackAjaxValidaUltTra, 
                    "operation=ajax_valida_ult_tra&NSINIES="+$("#NSINIES").val()+"&NTRAMIT="+$("#NTRAMIT").val(), this, objJsMessages.jslit_actualizando_registro);
        }
        
        function callbackAjaxValidaUltTra(ajaxResponseText) {
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var PTLITERA = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("PTLITERA")[0]))? 
                objDom.getValorNodoDelComponente(doc.getElementsByTagName("PTLITERA"), 0, 0) : "");                    
                if (!objUtiles.estaVacio(PTLITERA)){
                    if (confirm(PTLITERA)){
                       objUtiles.ejecutarFormulario ("modal_axissin016.do", "guardar", document.miForm, "_self");  
                    }
                }else{
                    objUtiles.ejecutarFormulario ("modal_axissin016.do", "guardar", document.miForm, "_self");  
                }
            }
        }
        // INICIO IAXIS-4713 EA 2019-07-29
        function f_abrir_axissin067(){
            var CUNITRA =objDom.getValorPorId("CUNITRA");
            var CTRAMIT =objDom.getValorPorId("CTRAMIT");
            var CEMPRES =objDom.getValorPorId("CEMPRES");
            
            var SPRODUC =objDom.getValorPorId("SPRODUC");
            var SSEGURO =objDom.getValorPorId("SSEGURO");
            var CCAUSIN =objDom.getValorPorId("CCAUSIN");
            var CMOTSIN =objDom.getValorPorId("CMOTSIN");
            var CACTIVI =objDom.getValorPorId("CACTIVI");                
            var NRIESGO =objDom.getValorPorId("NRIESGO");                
            var CTRAMTE =objDom.getValorPorId("CTRAMTE");
            var CESTSIN =objDom.getValorPorId("CESTSIN");

    
                    objUtiles.abrirModal("axissin067", "src", "modal_axissin067.do?operation=form&CUNITRA="+CUNITRA+"&CTRAMIT="+CTRAMIT+"&SPRODUC="+SPRODUC+"&SSEGURO="+SSEGURO+"&CCAUSIN="+CCAUSIN+"&CMOTSIN="+CMOTSIN+"&CACTIVI="+CACTIVI
                    		+"&NRIESGO="+NRIESGO+"&CTRAMTE="+CTRAMTE+"&CESTSIN="+CESTSIN+"&CEMPRES="+CEMPRES);

            }  
        
        function f_cerrar_modal(pantalla){
            objUtiles.cerrarModal(pantalla);
        }
     // FIN IAXIS-4713 EA 2019-07-29
    </script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="modal_axissin016.do" method="POST">
    <input type="hidden" name="operation" id="operation" value="guardar" />
    <input type="hidden" name="subpantalla" id="subpantalla" value="tramitaciones"/>
    <input type="hidden" name="seccion" id="seccion" value="movimientos"/>
    <input type="hidden" name="CEMPRES" id="CEMPRES" value="${sessionScope.tramitaciones_min[linea_trami].CEMPRES}"/>
    <input type="hidden" name="NSINIES" id="NSINIES" value="${__formdata.NSINIES}"/>
    <input type="hidden" name="NTRAMIT" id="NTRAMIT" value="${__formdata.NTRAMIT}"/>
    <input type="hidden" name="indexTramitacio" value="${__formdata.indexTramitacio}"/>
    <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}"/>
    <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}"/>
    <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}"/>    
    <input type="hidden" name="NESTADO" id="NESTADO" value="${__formdata.NESTADO}"/> 
    <input type="hidden" name="CTRAMIT_MODIFVISIBLE" id="CTRAMIT_MODIFVISIBLE" value="${__formdata.CTRAMIT}"/>    
    <input type="hidden" name="CUNITRA_MODIFVISIBLE" id="CUNITRA_MODIFVISIBLE" value="${__formdata.CUNITRA}"/>  
    
    <input type="hidden" name="SPRODUC" id="SPRODUC" value="${__formdata.SPRODUC}"/>
    <input type="hidden" name="CACTIVI" id="CACTIVI" value="${__formdata.CACTIVI}"/>
     
     <c:import url="../include/modal_estandar.jsp">
                    <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axissin016" c="lit_1000205" lit="1000205" /></c:param>
    </c:import>
    <!--  INICIO IAXIS-4713 EA 2019-07-29 -->
    <c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axissin067|<axis:alt c="axissin067_TITULO" f="axissin067" lit="9909363"/></c:param>
	</c:import>
	<!--  FIN IAXIS-4713 EA 2019-07-29 -->
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt f="axissin016" c="TITULO" lit="9001130"/></c:param>
        <c:param name="formulario"><axis:alt f="axissin016" c="TITULO" lit="9001130"/></c:param>
        <c:param name="form">axissin016</c:param>
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
                     <td class="titulocaja">
                            <b><fmt:message key="101298"/></b><!-- Tipus tramitacio -->
                        </td>
                        <td class="titulocaja">
                            <b><axis:alt f="axissin016" c="TTIPTRA" lit="9001028"/></b><!-- Tipus tramitacio -->
                        </td>
                        <axis:ocultar c="NRADICA" f="axissin016" dejarHueco="false">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin016" c="NRADICA" lit="100588"/></b><!-- Tipus tramit  -->
                        </td> 
                         </axis:ocultar>
                        <c:if test="${sessionScope.tramitaciones_min[linea_trami].CTRAMIT!=20}">
						<axis:visible c="TTCAUSIN" f="axissin016" >
                        <td class="titulocaja">
                            <b><axis:alt f="axissin016" c="TTCAUSIN" lit="9000901"/></b><!-- Tipus dany  -->
                        </td>
                         </axis:visible>
                         <axis:visible c="CINFORM" f="axissin016" >
                        <td class="titulocaja">
                            <b><axis:alt f="axissin016" c="CINFORM" lit="9000905"/></b><!-- Tramitación informativa -->
                            
                        </td> 
                        </axis:visible>
                        </c:if>
                    </tr>
                    
                    <tr>
                       <td class="campocaja">
                         <input type="text" name="NSINIES_O" id="NSINIES_O"  class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin009" c="NSINIES" a="modificable=false"/> />
                            
                        </td>
                        <td class="campocaja">
                         <input type="text" name="TTIPTRA" value="${sessionScope.tramitaciones_min[linea_trami].TTIPTRA}" class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin016" c="TTIPTRA" a="modificable=false"/> />
                            
                        </td>
                        <axis:visible f="axissin016" c="NRADICA">
                        <td class="campocaja">
                         <input type="text" name="NRADICA" value="${sessionScope.tramitaciones_min[linea_trami].NRADICA}" class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin016" c="NRADICA" a="modificable=false"/> />
                            
                        </td> 
                         </axis:visible> 
                         <c:if test="${sessionScope.tramitaciones_min[linea_trami].CTRAMIT!=20}">
                         
                          <axis:ocultar c="TTCAUSIN" f="axissin016">
                        <td class="campocaja">
                            <input type="text" name="TTCAUSIN" value="${sessionScope.tramitaciones_min[linea_trami].TTCAUSIN}" class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin016" c="TTCAUSIN" a="modificable=false"/> />
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="CINFORM" f="axissin016">
                        <td class="campocaja" align="left">
                            <input type="checkbox" disabled  id="CINFORM" name="CINFORM" <axis:atr f="axissin011" c="CINFORM" a="modificable=false"/> value="${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.CINFORM}" 
                            <c:if test="${sessionScope.tramitaciones_min[linea_trami].CINFORM == '1'}">checked</c:if> >
                        </td>  
                        </axis:ocultar>
                        </c:if>
                    </tr>
                    
                    <tr>
                        <!-- Estado -->                                      
                        <td class="titulocaja">
                            <b><axis:alt f="axissin016" c="CESTTRA" lit="100587"/></b>
                        </td>
                        
                        <td class="titulocaja">
                            <b><axis:alt f="axissin016" c="CSUBTRA" lit="9902790"/></b><!-- Subestado -->
                        </td>
                        
                        <axis:visible c="CUNITRA" f="axissin016">                            
                        <td class="titulocaja">
                            <b><axis:alt f="axissin016" c="CUNITRA" lit="9000900"/></b><!-- Unidad de tramitacion -->
                        </td>
                        </axis:visible>  
                        
                        <axis:visible c="CTRAMIT" f="axissin016">                            
                        <td class="titulocaja">
                           <b><axis:alt f="axissin016" c="CTRAMIT" lit="9910018"/></b><!-- Tramitador -->
                        </td>
                        </axis:visible>                          
                    </tr>
                    <tr>
                    
                  
                        <!-- Estat -->
                        <td class="campocaja">
                             <select name="CESTTRA" id="CESTTRA" onchange="javascript:f_cambia_estado();" size="1" class="campowidthselect campo campotexto_ob"  style="width:180px">
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin016" c="COMBO_CESTTRA" lit="1000348"/> - </option>
                                <c:forEach var="lstestado" items="${__formdata.listvalores.tipo_estado}">
                                    <option value = "${lstestado.CATRIBU}" 
                                    <c:if test="${lstestado.CATRIBU == __formdata.CESTTRA}"> selected </c:if> >
                                        ${lstestado.TATRIBU} 
                                    </option>
                                </c:forEach>
                            </select>
                        </td>

                        <!-- Subestat -->
                        <axis:visible c="CSUBTRA" f="axissin016">                        
                        <td class="campocaja">
                            <select name="CSUBTRA" id="CSUBTRA" size="1" class="campowidthselect campo campotexto_ob" style="width:180px">
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin016" c="COMBO_CSUBTRA" lit="1000348"/> - </option>
                                <c:forEach var="subestado" items="${__formdata.listvalores.tipo_subestado}">
                                    <option value = "${subestado.CATRIBU}" 
                                    <c:if test="${subestado.CATRIBU == __formdata.CSUBTRA}"> selected </c:if> />
                                        ${subestado.TATRIBU} 
                                    </option>  
                                </c:forEach>
                            </select>
                        </td>
                        </axis:visible>  
                        
                        <!-- Unitat Tramitació -->
                        <axis:visible c="CUNITRA" f="axissin016">
                        <td class="campocaja">
                            <select name = "CUNITRA" id ="CUNITRA" size="1" onchange="f_cambia_cunitra(this)" class="campowidthselect campo campotexto_ob" <axis:atr f="axissin016" c="CUNITRA" a="modificable=true&isInputText=false"/> >                                                    
                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin016" c="COMBO_CUNITRA" lit="1000348"/> - </option>
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
                        <axis:visible c="CTRAMIT" f="axissin016">                        
                        <td class="campocaja">
                            <select name = "CTRAMIT" id ="CTRAMIT" size="1" class="campowidthselect campo campotexto_ob"  <axis:atr f="axissin016" c="CTRAMIT" a="modificable=true&isInputText=false"/>   >
                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin016" c="COMBO_CTRAMIT" lit="1000348"/> - </option>
                                <c:forEach var="ttramitadOp" items="${__formdata.listvalores.lsttramit}">
                                    <option value = "${ttramitadOp.CTRAMITAD}" 
                                    <c:if test="${__formdata.CTRAMITAD  != 'null' && ttramitadOp.CTRAMITAD == __formdata.CTRAMIT}">selected</c:if>>
                                        ${ttramitadOp.TTRAMITAD} 
                                    </option>
                                </c:forEach>
                            </select>
                            <!--  INICIO IAXIS-4713 EA 2019-07-29 -->
                            <axis:visible c="BT_FIND_PJ" f="axissin007"> 
							<img id="find" border="0" src="images/find.gif" onclick="f_abrir_axissin067();" style="cursor:pointer"/>
							</axis:visible>
							<!-- FIN IAXIS-4713 EA 2019-07-29 -->
                        </td>
                        </axis:visible>  
                        
                    </tr>

                    <!-- ini bug 0021196 -->                                      
                    <tr>
                        <!-- causa movimiento -->                                      
                        <axis:visible c="CCAUEST" f="axissin016">                            
                        <td class="titulocaja">
                           <b><axis:alt f="axissin016" c="TCAUEST" lit="9002029"/></b>
                        </td>
                        </axis:visible>                          
                    </tr>
                    <tr>
                        <!-- causa movimiento -->                                      
                        <axis:visible c="CCAUEST" f="axissin016">                        
                        <td class="campocaja">
                            <select name = "CCAUEST" id ="CCAUEST" size="1" class="campowidthselect campo campotexto_ob">
                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin016" c="COMBO_CCAUEST" lit="1000348"/> - </option>

                                <c:forEach var="campo" items="${__formdata.listvalores.causa_movimiento}">
                                    <option value = "${campo.CCAUEST}" 
                                    <c:if test="${campo.CCAUEST == __formdata.CCAUEST}"> selected </c:if> >
                                         ${campo.TCAUEST} 
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        </axis:visible>                          
                    </tr>
                    <!-- fin bug 0021196 -->                                                         
                    
                    <tr>
                    
                </table>
            </td>
        </tr>
    </table>
    <!-- IAXIS-4887 -->
    <c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axissin016</c:param>
        <c:param name="__botones">cancelar<axis:visible f="axissin016" c="BT_ACEPTAR">,aceptar</axis:visible></c:param>
    </c:import>
    </form>
  <c:import url="../include/mensajes.jsp" />
</body>
</html>
