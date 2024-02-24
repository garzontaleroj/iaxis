<%--
/**
*  Fichero: axissin011.jsp
*  @author <a href = "mailto:frodriguez@csi-ti.com">Felipe Rodriguez</a>
*  
*  Imprimir documentación pendiente
*
*  Fecha: 27/02/2015
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
    <title><axis:alt f="axissin061" c="TITULO" lit="151090"/></title>
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
            f_cargar_propiedades_pantalla(); 
            formdataPAIS = '${__formdata.CPAISRE}';
            var OK = "<%=request.getAttribute("OK")%>"; 
            var NSINIES = "${__formdata.NSINIES}";
                if (OK=="OK"){
                       f_imprimir_pendiente();
                }
        }
        
        function f_cerrar_axisimprimir(){
			objUtiles.cerrarModal("axisimprimir");
			var NSINIES = "${__formdata.NSINIES}";
			parent.f_aceptar_axissin061(NSINIES);
        }
        
        function f_aceptar_axissin061(NSINIES, PANTALLA, SECCION) {
            //alert("Aceptando la reserva");
            
            objUtiles.cerrarModal("axissin010");
			//objUtiles.ejecutarFormulario ("modal_axissin061.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
            objUtiles.ejecutarFormulario ("modal_axissin06.do", "genera_docupendiente", document.miForm, "_self", objJsMessages.jslit_cargando);   
            
        }
        
        
        
        function f_imprimir_pendiente(){
         objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_trami&NSINIES="+document.miForm.NSINIES.value+"&NTRAMIT="+document.miForm.NTRAMIT.value+"&CESTADO="+0+"&TIPO=SINIES_DOCPEN");
        }

		    

        
        
        function f_but_9907322(){
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario ("modal_axissin061.do", "genera_docupendiente", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
        function f_but_cancelar(){
            parent.f_cerrar_modal("axissin061");
        }
        
        function f_cerrar_modal(pantalla){
            objUtiles.cerrarModal(pantalla);
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
				objUtiles.ejecutarFormulario ("modal_axissin061.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);   
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
		<c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axissin061" c="MODAL_IMPRIMIR" lit="1000205" /></c:param>
	</c:import>  
	<!-- AXISSIN010 ALTA RESERVA  -->
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axissin010|<axis:alt f="axissin061" c="MODAL_AXISSIN010" lit="9000982"/></c:param>
	</c:import>
    <form name="miForm" action="modal_axissin061.do" method="POST">
    <input type="hidden" name="operation" value="guardar" />
    <input type="hidden" name="CACTIVI" id="CACTIVI" value="${__formdata.CACTIVI}"/>
    <input type="hidden" name="NTRAMTE" id="NTRAMTE" value="${__formdata.NTRAMTE}"/>
    <input type="hidden" name="CESTTRA" value="${__formdata.CESTTRA}"/>
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
    <%System.out.println("entra 5");%>     
    <!-- CAMBIO DE ESTADO -->
    <input type="hidden" name="NSINIES_AUX" id="NSINIES_AUX" value="${__formdata.NSINIES_AUX}"/>
    <input type="hidden" name="CTIPDES_AUX" id="CTIPDES_AUX" value="${__formdata.CTIPDES_AUX}"/>
    <input type="hidden" name="CUNITRA_AUX" id="CUNITRA_AUX" value="${__formdata.CUNITRA_AUX}"/>
    <input type="hidden" name="CTRAMITAD_AUX" id="CTRAMITAD_AUX" value="${__formdata.CTRAMITAD_AUX}"/>
    <input type="hidden" name="FESTSIN_AUX" id="FESTSIN_AUX" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FESTSIN_AUX}"/>"/>
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt f="axissin061" c="TITULO_FORM" lit="9907321"/></c:param>
        <c:param name="formulario"><axis:alt f="axissin061" c="TITULO_FORM" lit="9907321"/></c:param>
        <c:param name="form">axissin061</c:param>
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
						  <b><axis:alt f="axissin061" c="LISTA_DOCUMENTOS" lit="9907321"/></b><!-- Estat actual -->
						</td>
						
					</tr>
                    
                   <tr>
                    <td colspan="22" style="width:100%;"  class="campocaja"> 
                                 <axis:visible f="axissin061" c="LISTA_DOCUMENTOS">
                                     <textarea class="campodisabled campo campotexto" title=title="<axis:alt f="axissin061" c="LISTA_DOCUMENTOS" lit="9907321"/>" <axis:atr f="axissin061" c="LISTA_DOCUMENTOS" a="modificable=true&isInputText=false&obligatorio=true"/> 
                                     value = "" style="width:100%;overFlow:auto;" cols="30" rows="8" name="LISTA_DOCUMENTOS" id="LISTA_DOCUMENTOS">${__formdata.listvalores.LISTA_DOCUMENTOS}</textarea>
                                 </axis:visible>
                    </td>
                   </tr>
				</table>    
			</td>
		</tr>
	</table>
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin061</c:param><c:param name="__botones">cancelar,9907322</c:param></c:import>
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
