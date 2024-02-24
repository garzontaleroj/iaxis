
<%
	/*Revision:# MrGAoi4iMGYTWJ4kMp+zXg== #*/
%>
<%
	/**
	*  Fichero: axisrea045.jsp 
	*
	*  Fecha: 01/09/2015
	*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}" />
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes" />

<%@ page contentType="text/html;charset=iso-8859-15"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
<head>
<title><axis:alt f="axisrea045" c="TITULO" lit="9906707" /></title>
<link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
<link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
<link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
<c:import url="../include/carga_framework_js.jsp" />
<link rel="stylesheet" type="text/css" media="all"
	href="styles/calendar-green.css" title="green" />
<!-- Script principal del calendario -->
<script type="text/javascript" src="scripts/calendar.js"></script>
<!-- Idioma del calendario, en función del Locale -->
<script type="text/javascript"
	src="scripts/calendar-${sessionScope.__locale}.js"></script>
<!-- Setup del calendario -->
<script type="text/javascript" src="scripts/calendar-setup.js"></script>
<!--*********************************** -->
<script type="text/javascript"> 
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
               objDom.setValorPorId("PSCESREA", "");
               var flagsalir="${__formdata.FLAGSALIR}";
               if(flagsalir=="OK"){
                   objUtiles.ejecutarFormulario("axis_axisrea045.do", "salirPrincipal", document.miForm, "_self", objJsMessages.jslit_cargando); 
               }
               if(flagsalir=="OPEN"){
                   f_abrir_modal("axisrea046",true);
                   document.getElementById("FLAGSALIR").value="";
               }
                f_cargar_propiedades_pantalla(); 
                <c:forEach items="${__formdata.T_IAX_ESTCESIONESREA}" var="element"> 
                    Calendar.setup({
                        inputField     :    "FEFECTO${element.OB_IAX_ESTCESIONESREA.SCESREA}",     
                        ifFormat       :    "%d/%m/%Y",      
                        button         :    "icon_FEFECTO${element.OB_IAX_ESTCESIONESREA.SCESREA}", 
                        singleClick    :    true,
                        firstDay       :    1
                    });
                    
                    Calendar.setup({
                        inputField     :    "FVENCIM${element.OB_IAX_ESTCESIONESREA.SCESREA}",     
                        ifFormat       :    "%d/%m/%Y",      
                        button         :    "icon_FVENCIM${element.OB_IAX_ESTCESIONESREA.SCESREA}", 
                        singleClick    :    true,
                        firstDay       :    1
                    });
                </c:forEach>  
		<c:if test="${empty __formdata.SSEGURO && empty __formdata.NSINIES }">
                    f_abrir_modal("axisrea046",true);
                </c:if>
				//INICIO (21991 - 37294): AGG 10/02/2016
                <%--<c:if test="${empty __formdata.VESTADO_POLIZA && __formdata.VESTADO_POLIZA ne 'A'}">
                    <c:forEach items="${__formdata.T_IAX_ESTCESIONESREA}" var="objeto">
                         window.setTimeout("f_deshabilitar_registro(${objeto.OB_IAX_ESTCESIONESREA.SCESREA})",100);             
                    </c:forEach>
                </c:if>--%>
				//FIN (21991 - 37294): AGG 10/02/2016
               
                /*Lista que maneja los campos que han sido modificados para que bloquee los campos de fechas o de importes segun sea el caso.*/
                <c:forEach items="${sessionScope.listaBloqueo}" var="entry">
                    var importe = "${entry.value}";
                    var parametros = importe.split(",");
                    var bandera = parametros[0];
                    var porcentaje = parametros[1];
                
                    if (bandera == "importe"){
                        window.setTimeout("f_deshabilitar_fechas(${entry.key})",100);
                    }else{
                        window.setTimeout("f_deshabilitar_importes_porcentaje(${entry.key},"+porcentaje+")",100);
                    }                    
                </c:forEach>
                
                /*Ciclo que bloquea los campos de las cesiones anuladas.*/
				//INICIO (21991 - 37294): AGG 10/02/2016
                <c:forEach items="${__formdata.T_IAX_ESTCESIONESREA}" var="objeto">
                    <c:if test="${objeto.OB_IAX_ESTCESIONESREA.CGENERA eq '7' || not empty objeto.OB_IAX_ESTCESIONESREA.FANULAC}" >
                         window.setTimeout("f_deshabilitar_registro(${objeto.OB_IAX_ESTCESIONESREA.SCESREA})",100);
                    </c:if>                 
                </c:forEach>
				//FIN (21991 - 37294): AGG 10/02/2016
                //
            }
            
            
            function f_reabrir_axisrea046(){
                var sseguro=document.miForm.SSEGURO.value;            
                objUtiles.ejecutarFormulario("axis_axisrea045.do?sseguro="+sseguro+"&PMODOPANTALLA=recargar", "ejecutarBorrado", document.miForm, "_self", objJsMessages.jslit_cargando);   
               
                
            }
            function f_but_aceptar(){
                var sseguro="${__formdata.SSEGURO}";
                objUtiles.ejecutarFormulario("axis_axisrea045.do?sseguro="+sseguro+"&PMODOPANTALLA=recargar", "compruebaPorcentajes", document.miForm, "_self", objJsMessages.jslit_cargando);
            }

            function f_but_cancelar() {
                <c:choose>
                    <c:when test="${__formdata.PMODOPANTALLA eq 'axisrea046' || __formdata.PMODOPANTALLA eq 'recargar' || __formdata.PMODOPANTALLA eq 'mensaje'}">
                        var documento = document.miForm;
						//INI - AXIS 4404 - SE AGREGA MODAL DE CARGA 
                        objUtiles.ejecutarFormulario("axis_axisrea045.do", "cancelar", document.miForm, "_self", objJsMessages.jslit_cargando);
						//FIN - AXIS 4404 - SE AGREGA MODAL DE CARGA 
                    </c:when>
                    <c:otherwise>
                        parent.f_cerrar_axisrea045();
                    </c:otherwise>
                </c:choose>
            }
			

            function f_but_9908429(){
                var sseguro=document.miForm.SSEGURO.value;   
                var pmodopantalla="${__formdata.PMODOPANTALLA}";
                if(pmodopantalla=='axisctr009'){
                    objUtiles.ejecutarFormulario("axis_axisrea045.do?sseguro="+sseguro+"&PMODOPANTALLA=axisctr009", "ejecutarSimulacion", document.miForm, "_self", objJsMessages.jslit_cargando);   
                }else{
                    objUtiles.ejecutarFormulario("axis_axisrea045.do?sseguro="+sseguro+"&PMODOPANTALLA=recargar", "ejecutarSimulacion", document.miForm, "_self", objJsMessages.jslit_cargando);   
                }
                
            }
            
            function f_validaFechas(sseguro,estcesrea,cgarant,fefecto,entrada,porcentaje){
           
                var idfefecto="FEFECTO"+estcesrea;
                var idfevecimiento="FVENCIM"+estcesrea
                var fefecto_o=document.getElementById(idfefecto).value;
                var fvencimiento_o=document.getElementById(idfevecimiento).value; 
                
                objUtiles.ejecutarFormulario("axis_axisrea045.do?sseguro="+sseguro+"&estcesrea="+estcesrea+"&cgarant="+cgarant+"&fefecto="+fefecto_o+"&fvencimiento="+fvencimiento_o+"&pporcesion="+porcentaje+"&PMODOPANTALLA=recargar", "validaFechas", document.miForm, "_self", objJsMessages.jslit_cargando);   
  
            }

            function formatDate(fecha){
                var ano=fecha.substring(0,4);
                var mes=fecha.substring(5,7);
                var dia=fecha.substring(8,10);
                
                var formatFecha=dia+"/"+mes+"/"+ano;
                
                return formatFecha;
            }
            function f_actualizarTramo(objeto,scesrea){
                var tramo = objeto.value;
               //INI - AXIS 4404 - SE AGREGA MODAL DE CARGA  
               objUtiles.ejecutarFormulario("axis_axisrea045.do?tramo="+tramo+"&scesrea="+scesrea+"&PMODOPANTALLA=recargar", "actualizaTramo", document.miForm, "_self", objJsMessages.jslit_cargando);
			   //FIN - AXIS 4404 - SE AGREGA MODAL DE CARGA 
            }
            
            function f_actualizarpcesion(seguro,scesrea,entrada,picesion,picapces){
                var pporcesion = entrada.value;
                if(!isNaN(pporcesion)) {//valida campo numerico
                 if (pporcesion>=0){
                   //INI - AXIS 4404 - SE AGREGA MODAL DE CARGA  
                   objUtiles.ejecutarFormulario("axis_axisrea045.do?pporcesion="+pporcesion+"&pseguro="+seguro+"&pscesrea="+scesrea+"&picesion="+picesion+"&picapces="+picapces+"&PMODOPANTALLA=recargar", "actualizarPorcentajeCesion", document.miForm, "_self", objJsMessages.jslit_cargando);
				   //FIN - AXIS 4404 - SE AGREGA MODAL DE CARGA 
                 }else{
                    alert("<axis:alt f="axisper010" c="MENSAJE2" lit="9902884"/>");
                 }
                 }else {
                    alert("<axis:alt f="axisper010" c="MENSAJE2" lit="9906320"/>");
                }
            }
			
            function f_actualizaricapital(seguro,scesrea,pporcesion,picesion,entrada){
                var picapces = entrada.value;

                if(!isNaN(picapces)) {//valida campo numerico
                 if (picapces>=0){
                   //INI - AXIS 4404 - SE AGREGA MODAL DE CARGA  
                   objUtiles.ejecutarFormulario("axis_axisrea045.do?pporcesion="+pporcesion+"&pseguro="+seguro+"&pscesrea="+scesrea+"&picesion="+picesion+"&picapces="+picapces+"&PMODOPANTALLA=recargar", "actualizarPorcentajeCesion", document.miForm, "_self", objJsMessages.jslit_cargando);
				   //FIN - AXIS 4404 - SE AGREGA MODAL DE CARGA 
                 }else{
                    alert("<axis:alt f="axisper010" c="MENSAJE2" lit="9902884"/>");
                 }
                 }else {
                    alert("<axis:alt f="axisper010" c="MENSAJE2" lit="9906320"/>");
                }
            }
			
            function f_actualizaricesion(seguro,scesrea,pporcesion,entrada,picapces){
                var picesion = entrada.value;
                
                if(!isNaN(picesion)) {//valida campo numerico
                 if (picesion>=0){
                 //INI - AXIS 4404 - SE AGREGA MODAL DE CARGA 
                 objUtiles.ejecutarFormulario("axis_axisrea045.do?pporcesion="+pporcesion+"&pseguro="+seguro+"&pscesrea="+scesrea+"&picesion="+picesion+"&picapces="+picapces+"&PMODOPANTALLA=recargar", "actualizarPorcentajeCesion", document.miForm, "_self", objJsMessages.jslit_cargando);
				 //FIN - AXIS 4404 - SE AGREGA MODAL DE CARGA 
                 }else{
                    alert("<axis:alt f="axisper010" c="MENSAJE2" lit="9902884"/>");
                 }
                 }else {
                    alert("<axis:alt f="axisper010" c="MENSAJE2" lit="9906320"/>");
                }
                
            }
            
            function f_seleccionar_cesion(ncesion,ssegpol,cgarant,cgenera,ctramo,nmovimi,pscesrea,pcesion,pscontra,pnversion,psseguro,pfefecto,pfvencimiento,pnriesgo,psprocess,pipritarrea,psobreprima,pdetces,pipleno,picapaci,pnmovigen,piextrap,piextrea,pitarifrea){
                document.getElementById("VNCESION").value = ncesion;
                document.getElementById("VSSEGPOL").value = ssegpol;
                document.getElementById("VCGARANT").value = cgarant;
                document.getElementById("VCGENERA").value = cgenera;
                document.getElementById("VCTRAMO").value = ctramo;
                document.getElementById("VMOVIMI" ).value = nmovimi;
                document.getElementById("PSCESREA" ).value = pscesrea;
                document.getElementById("PCESION" ).value = pcesion;
                document.getElementById("VSCONTRA" ).value = pscontra;
                document.getElementById("VNVERSION" ).value = pnversion;
                document.getElementById("VSSEGURO" ).value = psseguro;
                document.getElementById("VFEFECTO" ).value = formatDate(pfefecto);
                document.getElementById("VFVECIMI" ).value = formatDate(pfvencimiento);
                //
                document.getElementById("VNRIESGO").value = pnriesgo;
                document.getElementById("VSPROCES").value = psprocess;
                document.getElementById("VIPRITARREA").value = pipritarrea;
                document.getElementById("VPSOBREPRIMA").value = psobreprima;
                document.getElementById("VCDETCES").value = pdetces;
                document.getElementById("VIPLENO").value = pipleno;
                document.getElementById("VICAPACI").value = picapaci;
                document.getElementById("VNMOVIGEN").value = pnmovigen;
                document.getElementById("VIEXTRAP").value = piextrap;
                document.getElementById("VIEXTREA").value = piextrea;
                document.getElementById("VITARIFREA").value = pitarifrea;
                //objUtiles.ejecutarFormulario("axis_axisrea045.do", "actualizarImporteCesion", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_nuevo_axisrea045() {
                var scesrea=document.getElementById("PSCESREA").value;
                if(objUtiles.estaVacio(scesrea)){
                    alert("<axis:alt f="axisper010" c="MENSAJE2" lit="9908448"/>");
                }else{
                    var fefecto=document.getElementById("VFEFECTO" ).value;
                    var fvemcimi=document.getElementById("VFVECIMI" ).value;
                    objUtiles.ejecutarFormulario("axis_axisrea045.do?PMODOPANTALLA=recargar&fefecto="+fefecto+"&fvencimiento="+fvemcimi, "nuevaCesion", document.miForm, "_self", objJsMessages.jslit_cargando);
                    
                }
            }
			

            function f_formatdate(entrada,valor){
                 var jDate = new JsFecha();
                    <%--if(entrada.value.length>0){
                        entrada.value=jDate.formateaFecha(entrada.value);
                    
                        if(jDate.validaFecha(entrada.value)){
                            entrada.value=jDate.formateaFecha(entrada.value);
                        }else{
                            alert("<axis:alt f="axisper010" c="MENSAJE2" lit="1000421"/>");
                        }
                    }--%>
                    if (entrada.value != ''){
                        if((entrada.value.length == 8) || (entrada.value.length == 10)){
                            entrada.value = jDate.formateaFecha(entrada.value);
                            if(jDate.validaFecha(entrada.value)){
                                entrada.value=jDate.formateaFecha(entrada.value);
                            }else{
                                alert("<axis:alt f="axisper010" c="MENSAJE2" lit="1000421"/>");
                                entrada.value = valor;
                            }
                        }else{
                            alert("<axis:alt f="axisper010" c="MENSAJE2" lit="1000421"/>");
                            entrada.value = valor;
                        }
                    }         
            }
            function f_deshabilitar_registro(identificacion){
                f_deshabilitar_fechas(identificacion);
                f_deshabilitar_importes(identificacion);
                document.getElementById("btnradiocesion"+identificacion).style.visibility = 'hidden';
                document.getElementById("TRAMO"+identificacion).className  = "campowidthselect campo campotexto campodisabled";
                document.getElementById("TRAMO"+identificacion).disabled = true;
            }
            
            function f_deshabilitar_importes(identificacion) {
                document.getElementById("PCESION"+identificacion).className  = "campowidthinput campo campotexto campodisabled";
                document.getElementById("PCESION"+identificacion).readOnly = true;
                document.getElementById("ICAPCES"+identificacion).className  = "campowidthinput campo campotexto campodisabled";
                document.getElementById("ICAPCES"+identificacion).readOnly = true; 
                document.getElementById("ICESION"+identificacion).className  = "campowidthinput campo campotexto campodisabled";
                document.getElementById("ICESION"+identificacion).readOnly = true;
                
            }
            function f_deshabilitar_importes_porcentaje(identificacion,porcentaje) {
                if(porcentaje != 0){
                    document.getElementById("PCESION"+identificacion).className  = "campowidthinput campo campotexto campodisabled";
                    document.getElementById("PCESION"+identificacion).readOnly = true;
                    document.getElementById("ICAPCES"+identificacion).className  = "campowidthinput campo campotexto campodisabled";
                    document.getElementById("ICAPCES"+identificacion).readOnly = true; 
                    document.getElementById("ICESION"+identificacion).className  = "campowidthinput campo campotexto campodisabled";
                    document.getElementById("ICESION"+identificacion).readOnly = true;
                }
            }
            
            function f_deshabilitar_fechas(identificacion) {
                document.getElementById("FEFECTO"+identificacion).className  = "campowidthinput campo campotexto campodisabled";
                document.getElementById("FEFECTO"+identificacion).readOnly = true;
                document.getElementById("FVENCIM"+identificacion).className  = "campowidthinput campo campotexto campodisabled";
                document.getElementById("FVENCIM"+identificacion).readOnly = true; 
                document.getElementById("icon_FEFECTO"+identificacion).style.visibility = 'hidden';
                document.getElementById("icon_FVENCIM"+identificacion).style.visibility = 'hidden';

            }
            
            function f_abrir_axisrea046() {
               
                objUtiles.abrirModal("axisrea046","src","modal_axisrea046.do?operation=form");
            }
	 /****************************************************************************************/
	/************************************** MODAL *******************************************/
       /****************************************************************************************/
         function f_abrir_modal(cual, noXButton, optionalQueryString) {
            var SSEGURO = document.miForm.SSEGURO.value;
            if (noXButton)
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");
				objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form");        
        }
        
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
            objUtiles.ejecutarFormulario("flujodetrabajo.do?forigen=axisrea045", "cancelar", document.miForm, "_self");
        }
        
        //INI - AXIS 4105 - 05/06/2019 - AABG - SE AGREGA NUEVO PARAMETRO MOVIMIENTO
        function f_set_poliza(NPOLIZA,NSINIES,SSEGURO,CGENERA, NMOVIGEN){
           
            document.miForm.NSINIES.value = NSINIES;
            document.miForm.SSEGURO.value = SSEGURO;
            document.miForm.NPOLIZA.value = NPOLIZA;
            document.miForm.CGENERA.value = CGENERA;
            document.miForm.NMOVIGEN.value = NMOVIGEN;
            
            f_cerrar_modal("axisrea046");
            
            objUtiles.ejecutarFormulario ("axis_axisrea045.do?sseguro="+SSEGURO+"&PMODOPANTALLA=axisrea046", "form", document.miForm, "_self", objJsMessages.jslit_cargando);     

        }
        //FIN - AXIS 4105 - 05/06/2019 - AABG - SE AGREGA NUEVO PARAMETRO MOVIMIENTO
            
        function f_cerrar_axisrea046() {
                objUtiles.cerrarModal("axisrea046");
                f_but_cancelar();
        }
    
        function f_aceptar_axisrea046(NSINIES, SSEGURO, SPRODUC, CACTIVI) {
               objUtiles.cerrarModal("axisrea046");
               objDom.setValorPorId("NSINIES", NSINIES);
               objDom.setValorPorId("SSEGURO", SSEGURO);
               objDom.setValorPorId("SPRODUC", SPRODUC);
               objDom.setValorPorId("CACTIVI", CACTIVI);
               document.miForm.NSINIES.value = NSINIES;
               objDom.setDisabledPorId("but_mas_recibos", false);
        }
        
        function f_set_variables_simulacion(SSEGURO,ESTCESREA,FEFECTO,FVENCIMIENTO){
            objDom.setValorPorId("ESTCESREA_O", ESTCESREA);
            objDom.setValorPorId("SSEGURO_O", SSEGURO);
            objDom.setValorPorId("FEFECTO_O", FEFECTO);
            objDom.setValorPorId("FVENCIMIENTO_O", FVENCIMIENTO);
        }		
        </script>
</head>
<body onload="f_onload()">
	<form name="miForm" action="" method="POST">
		<c:import url="../include/titulo_nt.jsp">
			<c:param name="formulario">
				<axis:alt f="axisrea045" c="TITULO" lit="9001860" />
			</c:param>
			<c:param name="titulo">
				<axis:alt f="axisrea045" c="TITULO" lit="9001860" />
			</c:param>
			<c:param name="form">axisrea045</c:param>
		</c:import>

		<c:import url="../include/precargador_ajax.jsp">
			<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
		</c:import>

		<c:import url="../include/modal_estandar.jsp">
			<c:param name="nid_y_titulo">axisrea046|<axis:alt
					f="axisrea045" c="NIDAXISPRO002" lit="1000188" />#axispro003|<axis:alt
					f="axisrea045" c="TITAXISPRO003" lit="1000219" />#axispro013|<axis:alt
					f="axisrea045" c="TITULOAXISPRO003_2" lit="152707" />
			</c:param>
		</c:import>

		<input type="hidden" name="operation" value="" /> <input type="hidden"
			name="VESTADO_POLIZA" value="${__formdata.VESTADO_POLIZA}" />
		<!--  CAMPOS NUEVA CESION MANUAL-->
		<input type="hidden" name="VNCESION" id="VNCESION"
			value="${__formdata.VNCESION}" /> <input type="hidden"
			name="VSSEGPOL" id="VSSEGPOL" value="${__formdata.VSSEGPOL}" /> <input
			type="hidden" name="VCGARANT" id="VCGARANT"
			value="${__formdata.VCGARANT}" /> <input type="hidden"
			name="VCGENERA" id="VCGENERA" value="${__formdata.VCGENERA}" /> <input
			type="hidden" name="VCTRAMO" id="VCTRAMO"
			value="${__formdata.VCTRAMO}" /> <input type="hidden" name="VMOVIMI"
			id="VMOVIMI" value="${__formdata.VMOVIMI}" /> <input type="hidden"
			name="VSCONTRA" id="VSCONTRA" value="${__formdata.VSCONTRA}" /> <input
			type="hidden" name="VNVERSION" id="VNVERSION"
			value="${__formdata.VNVERSION}" /> <input type="hidden"
			name="VFEFECTO" id="VFEFECTO" value="${__formdata.VFEFECTO}" /> <input
			type="hidden" name="VFVECIMI" id="VFVECIMI"
			value="${__formdata.VFVECIMI}" /> <input type="hidden"
			name="VSSEGURO" id="VSSEGURO" value="${__formdata.VSSEGURO}" /> <input
			type="hidden" name="VNRIESGO" id="VNRIESGO" /> <input type="hidden"
			name="VSPROCES" id="VSPROCES" /> <input type="hidden"
			name="VIPRITARREA" id="VIPRITARREA" /> <input type="hidden"
			name="VPSOBREPRIMA" id="VPSOBREPRIMA" /> <input type="hidden"
			name="VCDETCES" id="VCDETCES" /> <input type="hidden" name="VIPLENO"
			id="VIPLENO" /> <input type="hidden" name="VICAPACI" id="VICAPACI" />
		<input type="hidden" name="VNMOVIGEN" id="VNMOVIGEN" /> <input
			type="hidden" name="VIEXTRAP" id="VIEXTRAP" /> <input type="hidden"
			name="VIEXTREA" id="VIEXTREA" /> <input type="hidden"
			name="VITARIFREA" id="VITARIFREA" /> <input type="hidden"
			name="PSCESREA" id="PSCESREA" value="${__formdata.PSCESREA}" /> <input
			type="hidden" name="PCESION" id="PCESION"
			value="${__formdata.PCESION}" /> <input type="hidden" name="SSEGURO"
			id="SSEGURO" value="${__formdata.SSEGURO}" /> <input type="hidden"
			name="NPOLIZA" id="NPOLIZA" value="${__formdata.NPOLIZA}" /> <input
			type="hidden" name="NSINIES" id="NSINIES"
			value="${__formdata.NSINIES}" /> <input type="hidden" name="CGENERA"
			id="CGENERA" value="${__formdata.CGENERA}" /> <input type="hidden"
			name="FLAGSALIR" id="FLAGSALIR" value="${__formdata.FLAGSALIR}" />
			<input type="hidden" name="NMOVIGEN"
			id="NMOVIGEN" value="${__formdata.NMOVIGEN}" />


		<table class="mainTableDimensions base" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td>
					<table class="seccion">
						<tr>
							<td class="titulocaja" colspan="4">
								<div class="titulo">
									<img src="images/flecha.gif" />
									<axis:alt f="axisrea045" c="LIT_LIST_CTTO" lit="9000745" />
									<img border="0" src="images/find.gif"
										onclick="f_reabrir_axisrea046();" style="cursor: pointer">
								</div>
							</td>
						</tr>
						<tr>
							<td><axis:visible f="axisrea045" c="ALTA_CESIONREA">
									<a href="javascript:f_nuevo_axisrea045()"> <img
										style="float: right;" border="0"
										alt="<axis:alt f="axisrea045" c="ALT_IMG_NUEVO" lit="9001816"/>"
										title="<axis:alt f="axisrea045" c="ALT_IMG_NUEVO_OS" lit="9001816"/>"
										src="images/new.gif" />
									</a>
								</axis:visible></td>
						</tr>
						<tr>
							<td>
								<!-- DisplayTag ListaPersonas --> <c:set var="title0">
									<axis:alt f="axisrea045" c="NMOVIMI" lit="9001868" />
								</c:set> <c:set var="title1">
									<axis:alt f="axisrea045" c="CGARANT" lit="110994" />
								</c:set> <c:set var="title2">
									<axis:alt f="axisrea045" c="SCONTRA" lit="9001894" />
								</c:set> <c:set var="title3">
									<axis:alt f="axisrea045" c="NVERSION" lit="9001146" />
								</c:set> <c:set var="title4">
									<axis:alt f="axisrea045" c="FEFECTO" lit="100883" />
								</c:set> <c:set var="title5">
									<axis:alt f="axisrea045" c="FVENCIM" lit="100885" />
								</c:set> <c:set var="title6">
									<axis:alt f="axisrea045" c="PCESION" lit="9905437" />
								</c:set> <c:set var="title7">
									<axis:alt f="axisrea045" c="ICAPCES" lit="9001933" />
								</c:set> <c:set var="title8">
									<axis:alt f="axisrea045" c="ICESION" lit="9001919" />
								</c:set> <c:set var="title9">
									<axis:alt f="axisrea045" c="CTRAMO" lit="9000609" />
								</c:set> <c:set var="title10">
									<axis:alt f="axisrea045" c="TMOVIMI" lit="1000591" />
								</c:set> <c:set var="title11">
									<axis:alt f="axisrea045" c="FGENERA" lit="9908590" />
								</c:set>

								<div class="seccion displayspaceMaximo">
									<display:table name="${__formdata.T_IAX_ESTCESIONESREA}"
										id="estcesionesrea" export="false" class="dsptgtable"
										pagesize="-1" sort="list" cellpadding="0" cellspacing="0"
										requestURI="">
										<c:set var="VFEFECTO">FEFECTO${estcesionesrea.OB_IAX_ESTCESIONESREA.SCESREA}</c:set>
										<c:set var="VFVENCIM">FVENCIM${estcesionesrea.OB_IAX_ESTCESIONESREA.SCESREA}</c:set>
										<c:set var="VPCESION">PCESION${estcesionesrea.OB_IAX_ESTCESIONESREA.SCESREA}</c:set>
										<c:set var="VICAPCES">ICAPCES${estcesionesrea.OB_IAX_ESTCESIONESREA.SCESREA}</c:set>
										<c:set var="VICESION">ICESION${estcesionesrea.OB_IAX_ESTCESIONESREA.SCESREA}</c:set>
										<c:set var="VTRAMO">TRAMO${estcesionesrea.OB_IAX_ESTCESIONESREA.SCESREA}</c:set>

										<%@ include file="../include/displaytag.jsp"%>

										<axis:visible f="axisrea045" c="BTNRADIOCESION">
											<display:column headerClass="headwidth5 sortable" title=""
												media="html" autolink="false">
												<div class="dspIcons">
													<!--input value="${miListaPolizas['NPOLIZA']}/${miListaPolizas['NCERTIF']}/${miListaPolizas.NSINIES}" -->
													<input
														value="${estcesionesrea.OB_IAX_ESTCESIONESREA.SCESREA}"
														type="radio"
														onclick="f_seleccionar_cesion('${estcesionesrea.OB_IAX_ESTCESIONESREA.NCESION}','${estcesionesrea.OB_IAX_ESTCESIONESREA.SSEGPOL}','${estcesionesrea.OB_IAX_ESTCESIONESREA.CGARANT}','${estcesionesrea.OB_IAX_ESTCESIONESREA.CGENERA}','${estcesionesrea.OB_IAX_ESTCESIONESREA.CTRAMO}','${estcesionesrea.OB_IAX_ESTCESIONESREA.NMOVIMI}','${estcesionesrea.OB_IAX_ESTCESIONESREA.SCESREA}','${estcesionesrea.OB_IAX_ESTCESIONESREA.PCESION}','${estcesionesrea.OB_IAX_ESTCESIONESREA.SCONTRA}','${estcesionesrea.OB_IAX_ESTCESIONESREA.NVERSIO}','${estcesionesrea.OB_IAX_ESTCESIONESREA.SSEGURO}','${estcesionesrea.OB_IAX_ESTCESIONESREA.FEFECTO}','${estcesionesrea.OB_IAX_ESTCESIONESREA.FVENCIM}','${estcesionesrea.OB_IAX_ESTCESIONESREA.NRIESGO}','${estcesionesrea.OB_IAX_ESTCESIONESREA.SPROCES}','${estcesionesrea.OB_IAX_ESTCESIONESREA.IPRITARREA}','${estcesionesrea.OB_IAX_ESTCESIONESREA.PSOBREPRIMA}','${estcesionesrea.OB_IAX_ESTCESIONESREA.CDETCES}','${estcesionesrea.OB_IAX_ESTCESIONESREA.IPLENO}','${estcesionesrea.OB_IAX_ESTCESIONESREA.ICAPACI}','${estcesionesrea.OB_IAX_ESTCESIONESREA.NMOVIGEN}','${estcesionesrea.OB_IAX_ESTCESIONESREA.IEXTRAP}','${estcesionesrea.OB_IAX_ESTCESIONESREA.IEXTREA}','${estcesionesrea.OB_IAX_ESTCESIONESREA.ITARIFREA}');"
														id="btnradiocesion${estcesionesrea.OB_IAX_ESTCESIONESREA.SCESREA}"
														name="btnradiocesion" />
												</div>
											</display:column>
										</axis:visible>
										<axis:visible f="axisrea045" c="NMOVIMI">
											<display:column title="${title0}" sortable="true"
												headerClass="sortable" media="html" autolink="false"
												sortProperty="OB_IAX_ESTCESIONESREA.NMOVIMI">
												<div class="dspText">${estcesionesrea.OB_IAX_ESTCESIONESREA.NMOVIMI}
													- ${estcesionesrea.OB_IAX_ESTCESIONESREA.MOVIMIENTO}</div>
											</display:column>
										</axis:visible>
										<%--                                     <axis:visible f="axisrea045" c="CGARANT"> --%>
										<%--                                         <display:column title="${title1}" sortable="true"  --%>
										<%--                                                         headerClass="sortable" media="html" autolink="false"  --%>
										<%--                                                         sortProperty="OB_IAX_ESTCESIONESREA.CGARANT" --%>
										<%--                                                         > --%>
										<%--                                             <div class="dspText">${estcesionesrea.OB_IAX_ESTCESIONESREA.CGARANT} - ${estcesionesrea.OB_IAX_ESTCESIONESREA.AMPARO}</div> --%>
										<%--                                         </display:column> --%>
										<%--                                     </axis:visible> --%>
										<axis:visible f="axisrea045" c="SCONTRA">
											<display:column title="${title2}" sortable="true"
												headerClass="sortable" media="html" autolink="false"
												sortProperty="OB_IAX_ESTCESIONESREA.SCONTRA">
												<div class="dspText">${estcesionesrea.OB_IAX_ESTCESIONESREA.SCONTRA}
													- ${estcesionesrea.OB_IAX_ESTCESIONESREA.CONTRATO}</div>
											</display:column>
										</axis:visible>
										<axis:visible f="axisrea045" c="NVERSION">
											<display:column title="${title3}" sortable="true"
												headerClass="sortable" media="html" autolink="false"
												sortProperty="OB_IAX_ESTCESIONESREA.NVERSIO">
												<div class="dspText">${estcesionesrea.OB_IAX_ESTCESIONESREA.NVERSIO}</div>
											</display:column>
										</axis:visible>
										<axis:visible f="axisrea045" c="FEFECTO">
											<display:column title="${title4}" sortable="true"
												headerClass="sortable" media="html" autolink="false"
												sortProperty="OB_IAX_ESTCESIONESREA.FEFECTO"
												style="width:15%">
												<div class="dspText">
													<input type="text" class="campowidthinput campo campotexto"
														size="8"
														value="<fmt:formatDate pattern="dd/MM/yyyy" value="${estcesionesrea.OB_IAX_ESTCESIONESREA.FEFECTO}"/>"
														onchange="f_validaFechas(${estcesionesrea.OB_IAX_ESTCESIONESREA.SSEGPOL},${estcesionesrea.OB_IAX_ESTCESIONESREA.SCESREA},${estcesionesrea.OB_IAX_ESTCESIONESREA.CGARANT},'${estcesionesrea.OB_IAX_ESTCESIONESREA.FEFECTO}','${estcesionesrea.OB_IAX_ESTCESIONESREA.FVENCIM}','${estcesionesrea.OB_IAX_ESTCESIONESREA.PCESION}');"
														name="${VFEFECTO}" id="${VFEFECTO}" style="width: 85%;"
														<axis:atr f="axisrea045" c="FEFECTO" a="modificable=true&formato=fecha"/> />
													<a style="vertical-align: middle;"><img
														id="icon_FEFECTO${estcesionesrea.OB_IAX_ESTCESIONESREA.SCESREA}"
														alt="<axis:alt f="axisrea045" c="FEFECTO" lit="100883"/>"
														title="<axis:alt f="axisrea045" c="FEFECTO" lit="100883" />"
														src="images/calendar.gif" /></a>
												</div>
											</display:column>
										</axis:visible>
										<axis:visible f="axisrea045" c="FVENCIM">
											<display:column title="${title5}" sortable="true"
												headerClass="sortable" media="html" autolink="false"
												sortProperty="OB_IAX_ESTCESIONESREA.FVENCIM"
												style="width:15%">
												<div class="dspText">
													<input type="text" class="campowidthinput campo campotexto"
														size="8"
														value="<fmt:formatDate pattern="dd/MM/yyyy" value="${estcesionesrea.OB_IAX_ESTCESIONESREA.FVENCIM}"/>"
														onchange="f_validaFechas(${estcesionesrea.OB_IAX_ESTCESIONESREA.SSEGPOL},${estcesionesrea.OB_IAX_ESTCESIONESREA.SCESREA},${estcesionesrea.OB_IAX_ESTCESIONESREA.CGARANT},'${estcesionesrea.OB_IAX_ESTCESIONESREA.FEFECTO}','${estcesionesrea.OB_IAX_ESTCESIONESREA.FVENCIM}','${estcesionesrea.OB_IAX_ESTCESIONESREA.PCESION}');"
														name="${VFVENCIM}" id="${VFVENCIM}" style="width: 85%;"
														<axis:atr f="axisrea045" c="FVENCIM" a="modificable=true&formato=fecha"/> />
													<a style="vertical-align: middle;"><img
														id="icon_FVENCIM${estcesionesrea.OB_IAX_ESTCESIONESREA.SCESREA}"
														alt="<axis:alt f="axisrea045" c="FVENCIM" lit="100885"/>"
														title="<axis:alt f="axisrea045" c="FVENCIM" lit="100885" />"
														src="images/calendar.gif" /></a>
												</div>
											</display:column>
										</axis:visible>
										<axis:visible f="axisrea045" c="PCESION">
											<display:column title="${title6}" sortable="true"
												headerClass="sortable" media="html" autolink="false"
												sortProperty="OB_IAX_ESTCESIONESREA.PCESION">
												<div class="dspText">
													<input type="text" class="campowidthinput campo campotexto"
														size="9" maxlength="60"
														value="${estcesionesrea.OB_IAX_ESTCESIONESREA.PCESION}"
														name="${VPCESION}" id="${VPCESION}" style="width: 100%;"
														title="<axis:alt f="axisrea045" c="PCESION" lit="9905437"/>"
														onchange="f_actualizarpcesion(${estcesionesrea.OB_IAX_ESTCESIONESREA.SSEGPOL}, ${estcesionesrea.OB_IAX_ESTCESIONESREA.SCESREA},this,${estcesionesrea.OB_IAX_ESTCESIONESREA.ICESION},${estcesionesrea.OB_IAX_ESTCESIONESREA.ICAPCES});"
														<axis:atr f="axisrea045" c="PCESION"/> />
												</div>
											</display:column>
										</axis:visible>
										<axis:visible f="axisrea045" c="ICAPCES">
											<display:column title="${title7}" sortable="true"
												headerClass="sortable" media="html" autolink="false"
												sortProperty="OB_IAX_ESTCESIONESREA.ICAPCES">
												<div class="dspText">
													<input type="text" class="campowidthinput campo campotexto"
														size="9" maxlength="60"
														value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${estcesionesrea.OB_IAX_ESTCESIONESREA.ICAPCES}'/>"
														name="${VICAPCES}" id="${VICAPCES}" style="width: 100%;"
														title="<axis:alt f="axisrea045" c="ICAPCES" lit="9905437"/>"
														onchange="f_actualizaricapital(${estcesionesrea.OB_IAX_ESTCESIONESREA.SSEGPOL}, ${estcesionesrea.OB_IAX_ESTCESIONESREA.SCESREA},${estcesionesrea.OB_IAX_ESTCESIONESREA.PCESION},${estcesionesrea.OB_IAX_ESTCESIONESREA.ICESION},this);"
														<axis:atr f="axisrea045" c="ICAPCES"/> />
												</div>
											</display:column>
										</axis:visible>
										<axis:visible f="axisrea045" c="ICESION">
											<display:column title="${title8}" sortable="true"
												headerClass="sortable" media="html" autolink="false"
												sortProperty="OB_IAX_ESTCESIONESREA.ICESION">
												<div class="dspText">
													<input type="text" class="campowidthinput campo campotexto"
														size="9" maxlength="60"
														value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${estcesionesrea.OB_IAX_ESTCESIONESREA.ICESION}'/>"
														name="${VICESION}" id="${VICESION}" style="width: 100%;"
														title="<axis:alt f="axisrea045" c="ICESION" lit="9905437"/>"
														onchange="f_actualizaricesion(${estcesionesrea.OB_IAX_ESTCESIONESREA.SSEGPOL}, ${estcesionesrea.OB_IAX_ESTCESIONESREA.SCESREA},${estcesionesrea.OB_IAX_ESTCESIONESREA.PCESION},this,${estcesionesrea.OB_IAX_ESTCESIONESREA.ICAPCES});"
														<axis:atr f="axisrea045" c="ICESION"/> />
												</div>
											</display:column>
										</axis:visible>
										<axis:visible f="axisrea045" c="CTRAMO">
											<display:column title="${title9}" sortable="true"
												headerClass="sortable" media="html" autolink="false"
												sortProperty="OB_IAX_ESTCESIONESREA.CTRAMO">
												<div class="dspText">
													<select title="${title9}" name="${VTRAMO}" id="${VTRAMO}"
														size="1" class="campowidthselect campo campotexto"
														style="width: 200px;"
														onchange="f_actualizarTramo(this,${estcesionesrea.OB_IAX_ESTCESIONESREA.SCESREA})"
														<axis:atr f="axisrea045" c="ICESION"/>>
														<option value="<%=Integer.MIN_VALUE%>">-
															<axis:alt f="axisadm018" c="BLANCO" lit="1000348" /> -
														</option> -->
														<c:forEach items="${sessionScope.listTramo}"
															var="listTramo" varStatus="cont">
															
														  	<c:if test="${estcesionesrea.OB_IAX_ESTCESIONESREA.CTRAMPA == null}">
																<option value="${listTramo.CATRIBU}"
																	<c:if test="${estcesionesrea.OB_IAX_ESTCESIONESREA.CTRAMO == listTramo.CATRIBU}">selected</c:if>>
																	${listTramo.TATRIBU}</option>
															</c:if>
															
															<c:if test="${estcesionesrea.OB_IAX_ESTCESIONESREA.CTRAMPA != null}">
																<option value="${listTramo.CATRIBU}"
																	<c:if test="${estcesionesrea.OB_IAX_ESTCESIONESREA.CTRAMPA + 10 == listTramo.CATRIBU}">selected</c:if>>
																	${listTramo.TATRIBU}</option>
															</c:if>
																
														</c:forEach>
													</select>
												</div>
											</display:column>
										</axis:visible>
										<axis:visible f="axisrea045" c="TMOVIMI">
											<display:column title="${title10}" sortable="true"
												headerClass="sortable" media="html" autolink="false"
												sortProperty="OB_IAX_ESTCESIONESREA.CTIPOMOV">

												<div class="dspText">${estcesionesrea.OB_IAX_ESTCESIONESREA.CTIPOMOV}</div>
											</display:column>
										</axis:visible>
										<axis:visible f="axisrea045" c="FGENERA">
											<display:column title="${title11}" sortable="true"
												headerClass="sortable" media="html" autolink="false"
												sortProperty="OB_IAX_ESTCESIONESREA.FGENERA">
												<fmt:formatDate
													value="${estcesionesrea.OB_IAX_ESTCESIONESREA.FGENERA}"
													pattern="dd/MM/yyyy" />
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
		<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axisrea045</c:param>
			<c:param name="__botones">cancelar,<axis:visible
					c="BT_SIMULACION" f="axisrea045">9908429</axis:visible>,<axis:visible
					c="BT_ACEPTAR" f="axisrea045">aceptar</axis:visible>
			</c:param>
		</c:import>
		<!-- Área de campos  -->
		<!-- Simulacion -->
		<axis:visible f="axisrea045" c="SIMULACION">
			<table class="mainTableDimensions base" align="center"
				cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<table class="seccion">
							<tr>
								<td class="titulocaja" colspan="4">
									<div class="titulo">
										<img src="images/flecha.gif" />
										<axis:alt f="axisrea045" c="LIT_LIST_SIMULACION" lit="9908429" />
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<!-- DisplayTag ListaPersonas --> <c:set var="title0">
										<axis:alt f="axisrea045" c="EMPRESA" lit="101619" />
									</c:set> <c:set var="title1">
										<axis:alt f="axisrea045" c="SPRODUC" lit="100829" />
									</c:set> <c:set var="title2">
										<axis:alt f="axisrea045" c="SREACONT" lit="9908433" />
									</c:set> <c:set var="title3">
										<axis:alt f="axisrea045" c="NVERSION" lit="9908430" />
									</c:set> <c:set var="title4">
										<axis:alt f="axisrea045" c="CTRAMO" lit="9000609" />
									</c:set> <c:set var="title5">
										<axis:alt f="axisrea045" c="FCIERRE" lit="9908432" />
									</c:set> <c:set var="title6">
										<axis:alt f="axisrea045" c="MONEDA" lit="108645" />
									</c:set> <c:set var="title7">
										<axis:alt f="axisrea045" c="CONCEPTO" lit="9000715" />
									</c:set> <c:set var="title8">
										<axis:alt f="axisrea045" c="IMPORTE" lit="100563" />
									</c:set>


									<div class="seccion displayspaceMaximo">
										<display:table name="${__formdata.T_IAX_SIM_ESTCESIONESREA}"
											id="estcesionesrea_sim" export="false" class="dsptgtable"
											pagesize="-1" sort="list" cellpadding="0" cellspacing="0"
											requestURI="">

											<%@ include file="../include/displaytag.jsp"%>
											<axis:visible f="axisrea045" c="DESCEMPRESA">
												<display:column title="${title0}" sortable="true"
													headerClass="sortable" media="html" autolink="false"
													sortProperty="OB_IAX_SIM_ESTCESIONESREA.DESC_EMPRESA">
													<div class="dspText">${estcesionesrea_sim.OB_IAX_SIM_ESTCESIONESREA.DESC_EMPRESA}
													</div>
												</display:column>
											</axis:visible>
											<axis:visible f="axisrea045" c="SPRODUC">
												<display:column title="${title1}" sortable="true"
													headerClass="sortable" media="html" autolink="false"
													sortProperty="OB_IAX_SIM_ESTCESIONESREA.SPRODUC">
													<div class="dspText">${estcesionesrea_sim.OB_IAX_SIM_ESTCESIONESREA.SPRODUC}</div>
												</display:column>
											</axis:visible>
											<axis:visible f="axisrea045" c="DESC_REASEGURA">
												<display:column title="${title2}" sortable="true"
													headerClass="sortable" media="html" autolink="false"
													sortProperty="OB_IAX_SIM_ESTCESIONESREA.DESC_REASEGURA">
													<div class="dspText">${estcesionesrea_sim.OB_IAX_SIM_ESTCESIONESREA.COD_REASEGURA}
														-
														${estcesionesrea_sim.OB_IAX_SIM_ESTCESIONESREA.DESC_REASEGURA}</div>
												</display:column>
											</axis:visible>
											<axis:visible f="axisrea045" c="NVERSIO">
												<display:column title="${title3}" sortable="true"
													headerClass="sortable" media="html" autolink="false"
													sortProperty="OB_IAX_SIM_ESTCESIONESREA.NVERSIO">
													<div class="dspText">${estcesionesrea_sim.OB_IAX_SIM_ESTCESIONESREA.NVERSIO}</div>
												</display:column>
											</axis:visible>
											<axis:visible f="axisrea045" c="CTRAMO">
												<display:column title="${title4}" sortable="true"
													headerClass="sortable" media="html" autolink="false"
													sortProperty="OB_IAX_SIM_ESTCESIONESREA.CTRAMO"
													style="width:15%">
													<div class="dspText">${estcesionesrea_sim.OB_IAX_SIM_ESTCESIONESREA.CTRAMO}
														-
														${estcesionesrea_sim.OB_IAX_SIM_ESTCESIONESREA.DESC_TRAMO}</div>
												</display:column>
											</axis:visible>
											<axis:visible f="axisrea045" c="FCIERRE">
												<display:column title="${title5}" sortable="true"
													headerClass="sortable" media="html" autolink="false"
													sortProperty="OB_IAX_SIM_ESTCESIONESREA.FCIERRE"
													style="width:15%">
													<fmt:formatDate
														value="${estcesionesrea_sim.OB_IAX_SIM_ESTCESIONESREA.FCIERRE}"
														pattern="dd/MM/yyyy" />
												</display:column>
											</axis:visible>
											<axis:visible f="axisrea045" c="CMONEDA">
												<display:column title="${title6}" sortable="true"
													headerClass="sortable" media="html" autolink="false"
													sortProperty="OB_IAX_SIM_ESTCESIONESREA.CMONEDA">
													<div class="dspText">${estcesionesrea_sim.OB_IAX_SIM_ESTCESIONESREA.CMONEDA}</div>
												</display:column>
											</axis:visible>
											<axis:visible f="axisrea045" c="DESC_CONCEPT">
												<display:column title="${title7}" sortable="true"
													headerClass="sortable" media="html" autolink="false"
													sortProperty="OB_IAX_ESTCESIONESREA.DESC_CONCEPT">

													<div class="dspText">${estcesionesrea_sim.OB_IAX_SIM_ESTCESIONESREA.COD_CONCEPT}
														-
														${estcesionesrea_sim.OB_IAX_SIM_ESTCESIONESREA.DESC_CONCEPT}</div>
												</display:column>
											</axis:visible>
											<axis:visible f="axisrea045" c="IMPORTE">
												<display:column title="${title8}" sortable="true"
													headerClass="sortable" media="html" autolink="false"
													sortProperty="OB_IAX_ESTCESIONESREA.IMPORTE">
													<div class="dspText">${estcesionesrea_sim.OB_IAX_SIM_ESTCESIONESREA.IMPORTE}</div>
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
		</axis:visible>
	</form>
	<c:import url="../include/mensajes.jsp" />
</body>
</html>