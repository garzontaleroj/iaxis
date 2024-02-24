<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%--
/**
*  Fichero: axissin011.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a>
*  
*  T?tulo: Modal modificar datos DESTINATARIOS  
*
*  Fecha: 19/02/2009
*/
--%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
    <c:set var="linea_trami" value="${__formdata.indexTramitacio}"/> <!-- ${LINEATRAM} -->
<%@ page contentType="text/html;charset=iso-8859-15" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axissin027" c="TITULO" lit="151090"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    <!--********** CALENDARIO ************************* -->
    <!-- Hoja de estilo del Calendario -->
    <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
    <!-- Script principal del calendario -->
    <script type="text/javascript" src="scripts/calendar.js"></script>
    <!-- Idioma del calendario, en funciÃ³n del Locale -->
    <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
    <!-- Setup del calendario -->
    <script type="text/javascript" src="scripts/calendar-setup.js"></script>
    <!--*********************************** -->
    <script type="text/javascript">
        function f_onload() { 
            formdataPAIS = '${__formdata.CPAISRE}';
            var val1 = "<%=request.getAttribute("OK")%>"; 
             var NSINIES = "${__formdata.NSINIES}"; 
			 var NSINIES_AUX = "${__formdata.NSINIES_AUX}"; 
        objDom.setValorPorId("NSINIES_O",NSINIES_AUX);
			f_cargar_propiedades_pantalla(); 
                if (val1=="OK"){
                    //alert("Ha ido OK");
                    
                    alert("<axis:alt f="axissin027" c="OK" lit="9001360"/>");
                    if (document.miForm.NUEVO_ESTADO.value == 6) //Si es nuevo estado declarado creamos el documento de declaraciÃ³n
                        f_imprimir();
                    else if(document.miForm.NUEVO_ESTADO.value == 3){
                    var val2 = "<%=request.getAttribute("CESTADORECHA")%>";
                       if(val2 == "OK"){
                          f_imprimir_rechazo();
                       }else{
					      parent.f_aceptar_axissin027(NSINIES);
					   }
					   
                    }
                    else {
	                    parent.f_aceptar_axissin027(NSINIES); //TODO: Dato EJ. para volver a la pantalla
                        //  this.f_but_cancelar();
                    }
                }
                
                
            
            try{ 
                if (!objUtiles.estaVacio(formdataPAIS)){
                    if (!objUtiles.estaVacio(f_buscar_TPAIS(formdataPAIS))){
                        objDom.setValorHTMLPorId("TPAIS_span", "<b>" + f_buscar_TPAIS(formdataPAIS)+"</b>");
                    }
                }else {
                    objDom.setValorHTMLPorId("TPAIS_span", "<b> </b>");
                }
            } catch (e) {}  
			
        }
        
        function f_cerrar_axisimprimir(){
			objUtiles.cerrarModal("axisimprimir");
			//f_but_cancelar();
			var NSINIES = "${__formdata.NSINIES}";
			parent.f_aceptar_axissin027(NSINIES);
        }
        
        function f_aceptar_axissin027(NSINIES, PANTALLA, SECCION) {
            //alert("Aceptando la reserva");
            
            objUtiles.cerrarModal("axissin010");
			//objUtiles.ejecutarFormulario ("modal_axissin027.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
            objUtiles.ejecutarFormulario ("modal_axissin027.do", "cambiar_estado", document.miForm, "_self", objJsMessages.jslit_cargando);   
        }
        
        function f_buscar_TPAIS(CPAIS) {
			<% 
			if (((java.util.Map) request.getAttribute("__formdata"))!= null){
			java.util.Map formdata = ((java.util.Map) request.getAttribute("__formdata"));
			if (((java.util.Map) formdata.get("listvalores"))!= null){
			java.util.Map lista = (java.util.Map)formdata.get("listvalores");
			if (((java.util.ArrayList)lista.get("lstPaises"))!= null){
			java.util.ArrayList paises = (java.util.ArrayList)lista.get("lstPaises");
			for(int i = 0;i<paises.size();i++){
			java.util.HashMap paisHash = (java.util.HashMap)paises.get(i);
			%>
			pais = <%=paisHash.get("CPAIS")%>
			if (CPAIS == pais){
			return "<%=paisHash.get("TPAIS")%>"
			}
			<%}}}}%> 
        }  
        
        function f_imprimir(){
			objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_doc_tipo&SEGURO="+document.miForm.SSEGURO.value+"&TIPO=SINIES");
        }
        
        function f_imprimir_rechazo(){
         objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_trami&NSINIES="+document.miForm.NSINIES.value+"&NTRAMIT="+document.miForm.NTRAMIT.value+"&CESTADO="+3+"&TIPO=SINIES_RECHA");
        }

		function f_onchange_CPAIS() {
            var CPAIS=objDom.getValorPorId("CPAISRE");
            if (!objUtiles.estaVacio(CPAIS)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPAIS";
                qs=qs+"&CPAIS="+CPAIS
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axissin011.do", callbackajaxdireccion, qs, this)
            } else {
                objDom.setValorPorId("CPAISRE", "");
                objDom.setValorHTMLPorId("TPAIS_span", "");
            }
        }        

        function callbackajaxdireccion (ajaxResponseText){
			try{
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPAISRE", "");
                        }else{
                            objDom.setValorPorId("CPAISRE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS"), 0, 0));
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAIS")[0])){
                                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAIS"), 0, 0) + "</b>");
                            }
                        }
                    }
                }
            } 	catch (e) {
				if (isDebugAjaxEnabled == "true")
					alert (e.name + " " + e.message);
            }
        }        
        
        function f_but_aceptar(){
        	var comunica = false;
            if (objValidador.validaEntrada()) {
				if (document.miForm.CESTSIN_PRIMERO.value == 5){
					comunica = document.miForm.COMUNICADO.checked;
            	}
				<c:choose>
					<c:when test="${empty __configform.axissin027__DSP_SINIESTRO_027__visible || (!empty __configform.axissin027__DSP_SINIESTRO_027__visible  && __configform.axisadm003__DSP_SINIESO_027__visible == 'true') }">
						<c:choose>
							<c:when test="${__formdata.NUEVO_ESTADO == 4}">
								if(comunica == false)
									f_abrir_modal('axissin010',null,'&NTRAMIT='+document.miForm.NTRAMIT.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&SPRODUC='+document.miForm.SPRODUC.value+'&NSINIES='+document.miForm.NSINIES.value+'&FSINIES='+document.miForm.FSINIES.value+'&CCAUSIN='+document.miForm.CCAUSIN.value+'&CMOTSIN='+document.miForm.CMOTSIN.value+'&NRIESGO='+document.miForm.NRIESGO.value+'&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&ORIGEN=axissin027');
								else
									objUtiles.ejecutarFormulario ("modal_axissin027.do", "cambiar_estado", document.miForm, "_self", objJsMessages.jslit_cargando);
							</c:when>
							<c:otherwise>
								objUtiles.ejecutarFormulario ("modal_axissin027.do", "cambiar_estado", document.miForm, "_self", objJsMessages.jslit_cargando);   
							</c:otherwise>
                       </c:choose>
					</c:when>
					<c:when test="${__formdata.NUEVO_ESTADO == 4}">
						if(comunica == false)
							f_abrir_modal('axissin010',null,'&NTRAMIT='+document.miForm.NTRAMIT.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&SPRODUC='+document.miForm.SPRODUC.value+'&NSINIES='+document.miForm.NSINIES.value+'&FSINIES='+document.miForm.FSINIES.value+'&CCAUSIN='+document.miForm.CCAUSIN.value+'&CMOTSIN='+document.miForm.CMOTSIN.value+'&NRIESGO='+document.miForm.NRIESGO.value+'&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&ORIGEN=axissin027');
						else
							objUtiles.ejecutarFormulario ("modal_axissin027.do", "cambiar_estado", document.miForm, "_self", objJsMessages.jslit_cargando);
					</c:when>
				    <c:otherwise>
						objUtiles.ejecutarFormulario ("modal_axissin027.do", "cambiar_estado", document.miForm, "_self", objJsMessages.jslit_cargando);   
				    </c:otherwise>
               </c:choose>
            }
        }
        
        function f_but_cancelar(){
            parent.f_cerrar_modal("axissin027");
        }
        
        function f_cerrar_modal(pantalla){
            objUtiles.cerrarModal(pantalla);
        }
  
		function f_actualitza(obj){
            objDom.setValorPorId("CPAGDES",obj.checked ? 1 : 0);
        }        
    
		function f_cambia_estado(){
            CCESTADO = document.miForm.NUEVO_ESTADO.value;
            if (CCESTADO != null){
                objAjax.invokeAsyncCGI("modal_axissin027.do", callbackAjaxActualizaCausas, 
                    "operation=ajax_actualiza_causas_cambio_estado&CNUEVO_ESTADO="+CCESTADO, this, objJsMessages.jslit_actualizando_registro);
			}
        }
        
        function callbackAjaxActualizaCausas(ajaxResponseText) {
            //alert(ajaxResponseText);
            var causasCombo = document.miForm.CAUSAS;
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
                
            } 	catch (e) {
					objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", causasCombo, null);
					alert(objJsMessages.jslit_sin_tramitadores);
            }
        }    
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            //alert("QUERY"+optionalQueryString);
			if (objUtiles.estaVacio(optionalQueryString))                
				optionalQueryString = "";
				
			if (noXButton) 
				objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
				
			objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
            
        function f_getTramitacion(indexNou, NTRAMIT){
			if (document.miForm.indexTramitacio.value != indexNou){
				document.miForm.indexTramitacio.value = indexNou;
				document.miForm.NTRAMIT.value = NTRAMIT;
				objUtiles.ejecutarFormulario ("modal_axissin027.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }
    </script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
	<%System.out.println("entra 4");%>     
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axissin027" c="MODAL_IMPRIMIR" lit="1000205" /></c:param>
	</c:import>  
	<!-- AXISSIN010 ALTA RESERVA  -->
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axissin010|<axis:alt f="axissin027" c="MODAL_AXISSIN010" lit="9000982"/></c:param>
	</c:import>
    <form name="miForm" action="modal_axissin027.do" method="POST">
    <input type="hidden" name="operation" value="guardar" />
    <input type="hidden" name="CACTIVI" id="CACTIVI" value="${__formdata.CACTIVI}"/>
    <input type="hidden" name="NTRAMTE" id="NTRAMTE" value="${__formdata.NTRAMTE}"/>
    <input type="hidden" name="CESTTRA" value="${__formdata.MOVIMIENTO.CESTTRA}"/>
    <input type="hidden" name="CCAUSIN" id ="CCAUSIN" value="${__formdata.OB_IAX_SINIESTRO.CCAUSIN}"/>
    <input type="hidden" name="CMOTSIN" id ="CMOTSIN" value="${__formdata.OB_IAX_SINIESTRO.CMOTSIN}"/>
    <input type="hidden" name="SPRODUC" id="SPRODUC" value="${__formdata.SPRODUC}"/>
    <input type="hidden" name="FSINIES" id ="FSINIES" value="<fmt:formatDate value='${__formdata.OB_IAX_SINIESTRO.FSINIES}' pattern='dd/MM/yyyy' />"/>
    <input type="hidden" name="NSINIES" id ="NSINIES" value="${__formdata.OB_IAX_SINIESTRO.NSINIES}"/>
    <input type="hidden" name="NRIESGO" id ="NRIESGO" value="${__formdata.OB_IAX_SINIESTRO.NRIESGO}"/>
    <input type="hidden" name="NTRAMIT" id="NTRAMIT" value="${__formdata.NTRAMIT}"/>
    <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}"/>
    <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}"/>
    <input type="hidden" name="subpantalla" value="tramitaciones"/>
    <input type="hidden" name="seccion" value="tramitaciones_destinatarios"/>
    <input type="hidden" name="isNew" value="no"/>
    <input type="hidden" name="indexTramitacio" id="indexTramitacio" value="${__formdata.indexTramitacio}"/> 
    <input type="hidden" name="NUEVO_ESTADO" value="${__formdata.NUEVO_ESTADO}"/>
    <input type="hidden" name="CESTSIN_PRIMERO" value="${__formdata.CESTSIN_PRIMERO}"/>
    <%System.out.println("entra 5");%>     
    <!-- CAMBIO DE ESTADO -->
    <input type="hidden" name="NSINIES_AUX" id="NSINIES_AUX" value="${__formdata.NSINIES_AUX}"/>
    <input type="hidden" name="CTIPDES_AUX" id="CTIPDES_AUX" value="${__formdata.CTIPDES_AUX}"/>
    <input type="hidden" name="CUNITRA_AUX" id="CUNITRA_AUX" value="${__formdata.CUNITRA_AUX}"/>
    <input type="hidden" name="CTRAMITAD_AUX" id="CTRAMITAD_AUX" value="${__formdata.CTRAMITAD_AUX}"/>
    <input type="hidden" name="FESTSIN_AUX" id="FESTSIN_AUX" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FESTSIN_AUX}"/>"/>
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt f="axissin027" c="TITULO_FORM" lit="9002026"/></c:param>
        <c:param name="formulario"><axis:alt f="axissin027" c="TITULO_FORM" lit="9002026"/></c:param>
        <c:param name="form">axissin027</c:param>
    </c:import>
    <div class="separador">&nbsp;</div>
	<table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td><!-- CAMPOS HIDDEN EN PANTALLA -->
				<!-- Primera Seccion -->
				<div class="separador">&nbsp;</div>
				<!-- Segunda seccion -->
				<table class="seccion">
					<tr>
						<th style="width:20%;height:0px">&nbsp;</th>
                        <th style="width:20%;height:0px">&nbsp;</th>
                        <th style="width:20%;height:0px">&nbsp;</th>
                        <th style="width:20%;height:0px">&nbsp;</th>
                        <th style="width:20%;height:0px">&nbsp;</th>
					</tr>
					<tr>
                                      
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin027" c="NSINIES" lit="101298"/></b>
                                    </td>
                    
						<td class="titulocaja">
						  <b><axis:alt f="axissin027" c="TESTSIN" lit="9002027"/></b><!-- Estat actual -->
						</td>
						<td class="titulocaja">
						   <b><axis:alt f="axissin027" c="CESTADO" lit="9002028"/></b><!-- Nou Estat -->
						</td>
						<td class="titulocaja">
						   <b><axis:alt f="axissin027" c="CAUSAS" lit="9002029"/></b><!-- Causa canvi estat -->
						</td>
						<td class="titulocaja">
						  <c:if test="${__formdata.CESTSIN_PRIMERO == 5}">
						  <b><axis:alt f="axissin027" c="COMUNICADO" lit="9910025"/></b><!-- Esta campo indica si nacio como comunicado o no -->
						  </c:if>
						</td>
						<td class="titulocaja">
						  <c:if test="${__formdata.NUEVO_ESTADO == 1}">
						  <b><axis:alt f="axissin027" c="FFIN" lit="9001198"/></b><!-- Fecha fin -->
						  </c:if>
						</td>
					</tr>
                    
					<tr>
                                         <td class="campocaja">
                                              <input type="text" name="NSINIES_O" id="NSINIES_O"  class="campodisabled campo campotexto" style="width:90%"
                                                <axis:atr f="axissin027" c="NSINIES" a="modificable=false"/> />
                                
                                        </td>
						<td class="campocaja">
							<!-- Estado actual tramitacion -->
							<input type="text" name="TESTSIN" value="${__formdata.TESTSIN_AUX}" class="campodisabled campo campotexto" style="width:90%"
							<axis:atr f="axissin027" c="TESTSIN" a="modificable=false"/> />
							<input type="hidden" name="CESTSIN" value="${__formdata.CESTSIN_AUX}" 
							<axis:atr f="axissin027" c="CESTSIN" a="modificable=false&obligatoprio=true"/> />
						</td>
						<td class="campocaja">
							 <select name="CESTADO" id="CESTADO" onchange="javascript:f_cambia_estado();" size="1" <axis:atr f="axissin027" c="CESTADO" a="modificable=true&isInputText=false&obligatorio=true"/> class="campowidthselect campo campotexto_ob" disabled style="width:90%;">
								<option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin027" c="SNV_COMBO" lit="1000348"/> - </option>
								<c:forEach var="estado" items="${__formdata.listvalores.tipo_estado}">
									<option value = "${estado.CATRIBU}" 
									<c:if test="${estado.CATRIBU == __formdata.NUEVO_ESTADO}"> selected </c:if> />
										${estado.TATRIBU} 
									</option>
								</c:forEach>
							</select><!-- __formdata.MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.CESTTRA -->
						</td>
						<td>
							<select name="CAUSAS" id="CAUSAS" size="1" title="<axis:alt f="axissin027" c="CAUSAS" lit="9002029"/>" <axis:atr f="axissin027" c="CAUSAS" a="modificable=true&isInputText=false&obligatorio=true"/> class="campowidthselect campo campotexto_ob" <c:if test="${__formdata.MOD_TRAM=='MOD'||__formdata.MOD_TRAM=='CONS'}">disabled</c:if> style="width:90%;">
								<option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin027" c="SNV_COMBO" lit="1000348"/> - </option>
								<c:forEach var="estado" items="${__formdata.listvalores.causas_estado}">
									<option value = "${estado.CCAUEST}" 
									<c:if test="${estado.CCAUEST == __formdata.CAUSAS || (estado.CATRIBU == 0 && sessionScope.CMODO =='ALTA_SINIESTROS' && __formdata.MOVIMIENTO.CESTTRA==null) }"> selected </c:if> />
										${estado.TCAUEST} 
									</option>
								</c:forEach>
							</select><!-- __formdata.MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.CESTTRA -->
						</td>
						<td>  
							<c:if test="${__formdata.CESTSIN_PRIMERO == '5'}">
								<input type="checkbox" id="COMUNICADO" name="COMUNICADO"/>
							</c:if>
						</td>
						<td>  
							<c:if test="${__formdata.NUEVO_ESTADO == '1'}">
								<%-- Fecha baja --%>
								<input type="text" class="campowidthinput campo campotexto" size="15" style="width:30%;"                                
								value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFIN}"/>"  <axis:atr f="axissin027" c="FFIN" a="modificable=true&obligatorio=true"/>
								name="FFIN" id="FFIN" title="<axis:alt f='axissin027' c='FFIN' lit='9001198'/>" />
								<a style="vertical-align:middle;"><img
								id="icon_FFIN" alt="<axis:alt f="axissin027" c="FFIN" lit="9001198"/>" title="<axis:alt f="axissin027" c="FFIN_TITTLE" lit="108341" />" src="images/calendar.gif"/></a>
							</c:if>
						</td>
					</tr>
				<c:if test="${__formdata.NUEVO_ESTADO == '3'}">
				   <tr>
                        <td class="titulocaja" id="tit_OBSERV">
                           <axis:visible f="axissin027" c="LIT_OBSERVACIONES">
                              <b><axis:alt f="axissin027" c="LIT_OBSERVACIONES" lit="101162"/></b>
                           </axis:visible>
                        </td>
                  </tr>
                  <tr>
                       <td colspan="22" style="width:100%;"  class="campocaja" id="td_OBSERV">                      
                          <axis:visible f="axissin027" c="OBSERV">
                             <textarea name="OBSERV" id="OBSERV" class="campodisabled campo campotexto" title="<axis:alt f="axissin027" c="OBSERV" lit="101162"/>" <axis:atr f="axissin027" c="OBSERV" a="modificable=true&isInputText=false&obligatorio=true"/> 
                                     value = "" style="width:100%;" cols="30" rows="8"></textarea>
									 <!--  ${__formdata.OBSERV} -->
                          </axis:visible>
                       </td>
                   </tr>
				</c:if>
					<axis:visible f="axissin027" c="DSP_SINIESTRO_027">
						<c:if test="${__formdata.NUEVO_ESTADO == 4}">
						<axis:visible f="axissin027" c="TRAMITES">
						<tr>
							<td class="campocaja" colspan="5">
								<table>
									<tr>
										<td style="width:40%" class="campocaja">
											<div style="float:left;">
												<b><axis:alt f="axissin027" c="TRAMITES" lit="9901991"/></b>
											</div>
										</td>
										<td></td>
									</tr>
									<tr>
										<td align="left" style="width:40%" colspan="4">
											<div style="float:left;width:100%">
											<jsp:include page="../axis/axissin006_datossiniestros_tramites_general.jsp">
												<jsp:param name="f" value="axissin027"/>
											</jsp:include>
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						</axis:visible>
						<axis:visible f="axissin027" c="TRAMITACION">
							<axis:visible f="axissin027" c="DSP_TRAMIT_GENERAL">
								<!-- Tramitaciones General -->
								<tr>
									<td class="campocaja" colspan="4">
										<div style="float:left;">
											<b><axis:alt f="axissin027" c="TRAMITACION_GENERAL" lit="103593"/></b>
										</div>
									</td>
								</tr>
							</axis:visible>
							<tr>
								<td align="left" style="width:40%" colspan="4">
									<jsp:include page="../axis/axissin006_datossiniestros_tramitaciones_general.jsp">
														<jsp:param name="f" value="axissin027"/>
									</jsp:include>
								</td>
							</tr>
						</axis:visible>
						<axis:visible f="axissin027" c="DSP_RESERVAS">
							<tr>
								<td class="campocaja" colspan="4">
									<div style="float:left;">
										<b><axis:alt f="axissin027" c="RESERVAS" lit="9000615"/></b> 
									</div>
									<%--div style="float:right;" id="BT_SIN_NUEVO_TRAM_RESERVA">
									<axis:visible f="axissin027" c="BT_SIN_NUEVO_TRAM_RESERVA">
										<img border="0" alt='<axis:alt f="axissin027" c="NUEVA_RESERVA" lit="9000615"/>'
											 title='<axis:alt f="axissin027" c="NUEVA_RESERVA" lit="9000615"/>'
											 src="images/new.gif" onClick="javascript:f_abrir_modal('axissin010',null,'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&SPRODUC='+document.miForm.SPRODUC.value+'&NSINIES='+document.miForm.NSINIES.value+'&FSINIES='+document.miForm.FSINIES.value+'&CCAUSIN='+document.miForm.CCAUSIN.value+'&CMOTSIN='+document.miForm.CMOTSIN.value+'&NRIESGO='+document.miForm.NRIESGO.value+'&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&ORIGEN=axissin027');"
											 />
									</axis:visible>
									</div--%>
								</td>
							</tr>
							<tr id="tramitaciones_reservas_children" >
								<td align="left" style="width:40%" colspan="4">
									<jsp:include page="../axis/axissin006_datossiniestros_tramitaciones_reservas.jsp">
										<jsp:param name="f" value="axissin027"/>
									</jsp:include>
                                    <script type="text/javascript">
                                        document.getElementById("divDatSinTramRes").style.paddingBottom= "18px";
                                    </script>
								</td>
							</tr>
						</axis:visible>
						</c:if>
					</axis:visible>
				</table>    
			</td>
		</tr>
	</table>
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin027</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>
    </form>
	<c:import url="../include/mensajes.jsp" />
	<script type="text/javascript">
		Calendar.setup({
			inputField     :    "FFIN",     
			ifFormat       :    "%d/%m/%Y",      
			button         :    "icon_FFIN", 
			singleClick    :    true,
			firstDay       :    1
		});
	</script>
</body>
</html>
