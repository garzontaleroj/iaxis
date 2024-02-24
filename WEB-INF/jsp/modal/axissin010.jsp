<%/* Revision:# 9qSWwi+iKpBiy5cM6HV4QA== # */%>
<%--
/**
*  Fichero: axissin010.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*  
*  T?tulo: Siniestros RESERVAS
*
*  Fecha: 20/02/2009
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
    <title><axis:alt f="axissin010" c="TIT1" lit="9000615"/> <axis:alt f="axissin010" c="TIT2" lit="109479"/>/<axis:alt f="axissin010" c="TIT3" lit="9000897"/> </title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    
    <!--********** CALENDARIO ************************* -->
    <!-- Hoja de estilo del Calendario -->
    <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
    <!-- Script principal del calendario -->
    <script type="text/javascript" src="scripts/calendar.js"></script>
    <!-- Idioma del calendario, en función del Locale -->
    <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
    <!-- Setup del calendario -->
    <script type="text/javascript" src="scripts/calendar-setup.js"></script>
    <!--*********************************** -->  
    
    <script type="text/javascript">

        function f_onload() { 
            f_cargar_propiedades_pantalla();
            f_carga_dependencias();
            f_ocultar_campos();
            
			<c:if test="${__formdata.CSOLIDARIDAD == 1}">
            document.miForm.CSOLIDARIDAD.checked = true;
            </c:if>
            
            var NSINIES = "${__formdata.NSINIES}"; 
            objDom.setValorPorId("NSINIES_O",NSINIES);
            var ERROR_IMPUESTOS = "${__formdata.ERROR_IMPUESTOS}";
            if (ERROR_IMPUESTOS==1){
                $("#but_aceptar").attr("disabled", "disabled");
            }
                
            var val1 = "<%=request.getAttribute("OK")%>"; 
            if (val1=="OK"){                 
                 <c:choose>
                 <c:when test="${!empty __formdata.ORIGEN && __formdata.ORIGEN eq 'axissin027'}">
                 
                 parent.f_aceptar_axissin027(document.miForm.NSINIES,'','');
                 </c:when>
                 <c:otherwise>
                 parent.f_aceptar_axissin010(document.miForm.NSINIES,'','');
                 </c:otherwise>
                 </c:choose>
            }
        			
			
            <c:if test="${ (__formdata.FRESINI != null || __formdata.VFRESINI != null)  && __formdata.ESBAJA == 1}" >
                document.miForm.FRESINI.value = "<fmt:formatDate value='${__formdata.VFRESINI}' pattern='dd/MM/yyyy' />";				
				objDom.setDisabledPorId("FRESINI",true);
                objDom.setVisibilidadPorId("icon_FRESINI","hidden");
            </c:if>

			
            <c:if test="${__formdata.ESBAJA == 1 && __formdata.CESTTRA == 1}">
                objDom.setValorPorId("CALCULO",1);
                objDom.setValorPorId("VCALCULO",1);
                objDom.setDisabledPorId("CALCULO",true);
            </c:if>
            
						
            <c:if test="${__formdata.MODO == 'EDITAR'}">
                objDom.setDisabledPorId("CESTTRA",true);
                objDom.setDisabledPorId("GARANTIA",true);
                objDom.setDisabledPorId("CALCULO",true);
				
            </c:if>
            
            <c:if test="${__formdata.MODO == 'VARIARRES'}">
                objDom.setVisibilidadPorId("but_9001312", 'hidden');
                objDom.setDisabledPorId("CESTTRA", true);
                objDom.setDisabledPorId("GARANTIA", true);
                objDom.setDisabledPorId("CALCULO", true);
                objDom.setDisabledPorId("IRESERVA", true);
                
                <c:if test="${__formdata.GARANTIA != null && __formdata.TFRANQ == null && __formdata.TCAPITAL == null}">
                	f_cargar_franquicia();
             	</c:if>
            </c:if>
            
            <c:if test="${__formdata.MODO != 'VARIARRES'}">
                objDom.setVisibilidadPorId("but_9001312", 'hidden');
                objDom.setDisabledPorId("IRESERVA", true);
            </c:if>
			
			f_cfg_fechas_baja();
			
			
            <c:if test="${__formdata.FRESINI != null && __formdata.FRESFIN != null && __configform.axissin010__NDIASBAJA__visible!=true}">
                f_calcula_dias();
            </c:if>
            
            <c:if test="${__formdata.CESTTRA == null }">
                objDom.setValorPorId("CESTTRA",1);
                document.miForm.CESTTRA.onchange();
            </c:if>
            
            var ICAPRIE = objNumero.quitarSeparadorMiles($("#ICAPRIE").val());
            ICAPRIE = parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(ICAPRIE));
            var TFRANQ =  objNumero.quitarSeparadorMiles($("#TFRANQ").val());
            TFRANQ = parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(TFRANQ));
            var IRESERVA = ICAPRIE - TFRANQ;
            if (IRESERVA<0){
                IRESERVA = 0;
            }
            if ($("#CALIFRANQ").is(':visible')){
                if (!objUtiles.estaVacio($("#ICAPRIE").val())&&
                    !objUtiles.estaVacio($("#TFRANQ").val())&&
                    ICAPRIE>0){
                    objDom.setValorPorId ("IRESERVA",objNumero.cambiarSeparadorMilesPorDecimales(IRESERVA.toString()));
                    f_formatear(document.miForm.IRESERVA);
                }
                f_dependencia_campos_calculo();
            }
            
            revisarEstilos();

            <c:if test="${__formdata.CSOLIDARIDAD_MODIF == 0 }">
    			objDom.setDisabledPorId("CSOLIDARIDAD",true);
            </c:if>
        }
		
		function f_cfg_fechas_baja() {
		<%--
        /**
        *  La configuración de el modo edicion de los campos de Fecha Inicio y Fecha Fin del periodo de BAJA vienen
		*  determinados por los parametros NOUFRESINI y NOUFRESFIN cuando estamos creando un nuevo periodo de reserva y
		*  por EDIFRESINI y EDIFRESFIN cuando estamos modificando un periodo de reserva (MODO = 'EDITAR'). 
		*
        *  Fecha: 26/04/2015
        */
        --%>
		    //alert("Visibilidad fechas");
		    <c:if test="${__formdata.ESBAJA == 1}">
				<c:if test="${__formdata.MODO != 'EDITAR'}">
					<c:if test="${__configform.axissin010__NOUFRESINI__modificable==true}" > 
						objDom.setDisabledPorId("FRESINI",false);
						objDom.setVisibilidadPorId("icon_FRESINI","visible");
					</c:if>
					<c:if test="${__configform.axissin010__NOUFRESINI__modificable!=null && __configform.axissin010__NOUFRESINI__modificable!=true}" >  
						objDom.setDisabledPorId("FRESINI",true);
						objDom.setVisibilidadPorId("icon_FRESINI","hidden");
					</c:if>
					<c:if test="${__configform.axissin010__NOUFRESFIN__modificable==true}" >
						objDom.setDisabledPorId("FRESFIN",false);
						objDom.setVisibilidadPorId("icon_FRESFIN","visible");
					</c:if>
					<c:if test="${__configform.axissin010__NOUFRESFIN__modificable!=null && __configform.axissin010__NOUFRESFIN__modificable!=true}" > 
						objDom.setDisabledPorId("FRESFIN",true);
						objDom.setVisibilidadPorId("icon_FRESFIN","hidden");
					</c:if>
				</c:if>
				
				
				<c:if test="${__formdata.MODO == 'EDITAR'}">
					<c:if test="${__configform.axissin010__EDIFRESINI__modificable==true}" >
						objDom.setDisabledPorId("FRESINI",false);
						objDom.setVisibilidadPorId("icon_FRESINI","visible");
					</c:if>
					<c:if test="${__configform.axissin010__EDIFRESINI__modificable!=null && __configform.axissin010__EDIFRESINI__modificable!=true}" > 
                        $("#FRESINI").attr("readonly",true);
						objDom.setVisibilidadPorId("icon_FRESINI","hidden");
					</c:if>
					<c:if test="${__configform.axissin010__EDIFRESFIN__modificable==true}" >
						objDom.setDisabledPorId("FRESFIN",false);
						objDom.setVisibilidadPorId("icon_FRESFIN","visible");
					</c:if>
					<c:if test="${__configform.axissin010__EDIFRESFIN__modificable!=null && __configform.axissin010__EDIFRESFIN__modificable!=true}" > 
						$("#FRESFIN").attr("readonly",true);
						objDom.setVisibilidadPorId("icon_FRESFIN","hidden");
					</c:if>
				</c:if>
			</c:if>
		}
        
        function f_dependencia_campos_calculo(){
            f_carga_dependencias();
			 <c:if test="${__formdata.CSOLIDARIDAD == 1}">
             document.miForm.CSOLIDARIDAD.checked = true;
             </c:if>
			 
            if ($("#CALIFRANQ").is(':visible')){
                if($("#CALCULO").val()==0){
                    $("#ICAPRIE").show();
                    $("#label_ICAPRIE").show();
                    $("#CALIFRANQ").show();
                    objDom.setDisabledPorId("IRESERVA",true);
                } else if($("#CALCULO").val()==1){
                    $("#ICAPRIE").hide();
                    $("#label_ICAPRIE").hide();
                    $("#CALIFRANQ").hide();
                    objDom.setDisabledPorId("IRESERVA",false);
                }
            }
        }
        
        function f_cargarDep(){
            f_cargar_propiedades_pantalla();
            f_dependencia_campos_calculo();
        }
        
        function f_but_aceptar(){
           //f_guardar()
           objDom.setValorPorId("CSOLIDARIDAD", ((document.miForm.CSOLIDARIDAD.checked)? "1" : "0"));
           if(  !objUtiles.estaVacio($('#IRESERVA').val() ) ){
           f_guardar_old();
           }else{
              alert("<axis:alt f="axissin010" c="SELECCIONE" lit="101679"/> "+" de "+"<axis:alt f="axissin010" c="SELECCIONE" lit="9001156"/>");  
           }
        }
        
        function f_ocultar_campos(){
            var TIPORES = document.miForm.CESTTRA.value;     
                    
            if(TIPORES!=1){
                <c:if test="${__configform.axissin010__GARANTIA__obligatorio==true}">
                    document.miForm.GARANTIA.setAttribute("obligatorio","true");
                    document.miForm.GARANTIA.className="campowidthselect campo campotexto_ob";
                    
                    if ($("#CALIFRANQ").is(':hidden')){
                        objDom.setValorPorId ("TFRANQ","");
                    }
                </c:if>
                <c:if test="${__configform.axissin010__GARANTIA__obligatorio!=true}">
                    document.miForm.GARANTIA.setAttribute("obligatorio",false);
                    document.miForm.GARANTIA.className="campowidthselect campo campotexto";
                    if ($("#CALIFRANQ").is(':hidden')){
                        objDom.setValorPorId ("TFRANQ","");
                    }
                </c:if>
                
            }else{
                document.miForm.GARANTIA.setAttribute("obligatorio","true");
                document.miForm.GARANTIA.className="campowidthselect campo campotexto_ob";
                
                if ($("#CALIFRANQ").is(':hidden')){
                    objDom.setValorPorId ("TFRANQ","");
                }
            }
            revisarEstilos();
        }

        function f_but_cancelar(){
            parent.f_cerrar_modal("axissin010");
        }
        
        function f_cargar_franquicia(){
                
          var numero = objDom.getValorPorId("IPREREC");
          var numero_formateado = objNumero.cambiarSeparadorMilesPorDecimales(numero);
          if (isNaN(numero_formateado)) {
              alert('<axis:alt f="axissin010" c="IPREREC_LIT" lit="9900853"/>:<axis:alt f="axissin010" c="IPREREC_AVISO" lit="1000422"/>');
              //document.miForm.IPREREC.value='';
              document.miForm.GARANTIA.value = <%=Integer.MIN_VALUE%>;                           
           
           }else{
              var GARANTIA = document.miForm.GARANTIA.value;
              var qs="operation=ajax_franquicia_garantia";
              qs=qs+"&SSEGURO="+document.miForm.SSEGURO.value;
              qs=qs+"&GARANTIA="+GARANTIA;
              qs=qs+"&NRIESGO="+document.miForm.NRIESGO.value;
              qs=qs+"&NSINIES="+document.miForm.NSINIES.value;
              qs=qs+"&NTRAMIT="+document.miForm.NTRAMIT.value;
              qs=qs+"&CTIPRES="+document.miForm.CESTTRA.value;
              objAjax.invokeAsyncCGI("modal_axissin010.do", callbackajaxFranquiciaGar, qs, this);
            }
                 
        }
        
           
        function f_cargar_garantias(){                   
                    var qs="operation=ajax_garantias";
                    qs=qs+"&SSEGURO="+document.miForm.SSEGURO.value;
                    var FSINIES = "${__formdata.FSINIES}";
                    qs=qs+"&FSINIES="+document.miForm.FSINIES.value;
                    var CCAUSIN = "${__formdata.CCAUSIN}";
                    qs=qs+"&CCAUSIN="+CCAUSIN;
                    var CMOTSIN = "${__formdata.CMOTSIN}";
                    qs=qs+"&CMOTSIN="+CMOTSIN;
                    var NRIESGO = "${__formdata.NRIESGO}";
                    qs=qs+"&NRIESGO="+NRIESGO;
                    var CTRAMIT = "${__formdata.CTRAMIT}";
                    qs=qs+"&CTRAMIT="+CTRAMIT;
                    var NTRAMIT = "${__formdata.NTRAMIT}";
                    qs=qs+"&NTRAMIT="+NTRAMIT;
                    var NSINIES = "${__formdata.NSINIES}";
                    qs=qs+"&NSINIES="+NSINIES;
                    var CESTTRA = $("#CESTTRA").val();
                    qs=qs+"&CESTTRA="+CESTTRA;
                    objAjax.invokeAsyncCGI("modal_axissin010.do", callbackajaxGarantias, qs, this);
                    
		    document.miForm.VGARANTIA.value = "";
                    document.miForm.TCAPITAL.value = "";
                    document.miForm.TFRANQ.value = "";
        }
        
        
        function f_guardar(){
                   
                    var qs="operation=ajax_guardar";
                    qs=qs+"&CESTTRA="+document.miForm.CESTTRA.value;
                    qs=qs+"&GARANTIA="+document.miForm.GARANTIA.value;
                    qs=qs+"&TFRANQ="+document.miForm.TFRANQ.value;
                    qs=qs+"&ICAPRIE="+document.miForm.ICAPRIE.value;
                    qs=qs+"&IPENALI="+document.miForm.IPENALI.value;
                    qs=qs+"&CALCULO="+document.miForm.CALCULO.value;
                    qs=qs+"&FRESFIN="+document.miForm.FRESFIN.value;
                    qs=qs+"&FRESINI="+document.miForm.FRESINI.value;
                    qs=qs+"&IRESERVA="+document.miForm.IRESERVA.value;
                    qs=qs+"&TTIPTRA="+document.miForm.TTIPTRA.value;
                    qs=qs+"&TTRAMIT="+document.miForm.TTRAMIT.value;
                    qs=qs+"&TTCAUSIN="+document.miForm.TTCAUSIN.value;
                    qs=qs+"&CINFORM="+document.miForm.CINFORM.value;
                    qs=qs+"&TESTTRA="+document.miForm.TESTTRA.value;
                    qs=qs+"&TUNITRA="+document.miForm.TUNITRA.value;
                    qs=qs+"&TTRAMITAD="+document.miForm.TTRAMITAD.value;
                    qs=qs+"&TSUBTRA="+document.miForm.TSUBTRA.value;
                   
                    objAjax.invokeAsyncCGI("modal_axissin010.do", callbackajaxGuardar, qs, this);
        }
        
        
        function f_guardar_old(){        
            revisarEstilos();  
            var q;
             if (objValidador.validaEntrada()) {
                if ($("#IRESERVA").is(':disabled')){
                    q="IRESERVA="+$("#IRESERVA").val();
                }
                if ($("#IMPUESTOS_SAP").val()==1){
                    f_guarda_impuestos();
                    var PRETENC = $("#PRETENC_SAP_NPORCENT").val();
                    q+="&PRETENC="+PRETENC;
                    var PIVA = $("#PIVA_SAP_NPORCENT").val();
                    q+="&PIVA="+PIVA;
                    var PRETEIVA = $("#PRETEIVA_SAP_NPORCENT").val();
                    q+="&PRETEIVA="+PRETEIVA;
                    var PRETEICA = $("#PRETEICA_SAP_NPORCENT").val();
                    q+="&PRETEICA="+PRETEICA;
					var SOLIDARIDAD = $("#CSOLIDARIDAD").val();
                    q+="&PSOLIDARIDAD="+SOLIDARIDAD;
                }
                objUtiles.ejecutarFormulario ("modal_axissin010.do?"+q, "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
             }
       
        }
        
        
        function callbackajaxGarantias(ajaxResponseText){
            try{ 
              
                var doc = objAjax.domParse(ajaxResponseText);
                var comboGarantia = document.miForm.GARANTIA;  
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
             
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        //alert("Existe elemento 0");
                            objDom.borrarOpcionesDeCombo(comboGarantia);
                            objDom.addOpcionACombo(<%=Integer.MIN_VALUE%>, " - " + objJsMessages.jslit_seleccionar + " - ", comboGarantia, 0);
                                    for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                                        var TGARANT = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TGARANT")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TGARANT")[0].childNodes[0].nodeValue : "");
                                        var CGARANT = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CGARANT")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CGARANT")[0].childNodes[0].nodeValue : "");
                                        objDom.addOpcionACombo(CGARANT, TGARANT, comboGarantia, i+1);
                                        //alert(CGARANT);
                                        //alert(TGARANT);
                                    }

                    }else{
                            objDom.borrarOpcionesDeCombo(comboGarantia);
                            objDom.addOpcionACombo("<%=Integer.MIN_VALUE%>", " - " + objJsMessages.jslit_seleccionar + " - ", comboGarantia, null);
                    }
                }
                f_ocultar_campos();
                f_cargar_propiedades_pantalla();
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
            f_carga_dependencias();
        }
        
        
        function callbackajaxFranquiciaGar(ajaxResponseText){
            try{ 
               
                var doc = objAjax.domParse(ajaxResponseText);
                
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                
                 if(objUtiles.existeObjetoXml(doc.getElementsByTagName("IMPORTE")[0])){
                    var IMPORTE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPORTE"), 0, 0);                            
                    document.miForm.TFRANQ.value=IMPORTE;
                 }
                 
                 document.miForm.IRESERVA.value='';
                 document.miForm.IVARRES.value='';
                 
                 if(objUtiles.existeObjetoXml(doc.getElementsByTagName("CAPITAL")[0])){
                     var CAPITAL = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CAPITAL"), 0, 0);
                     document.miForm.TCAPITAL.value=objNumero.cambiarSeparadorMilesPorDecimales(CAPITAL);                                    
                 }
                 if(objUtiles.existeObjetoXml(doc.getElementsByTagName("P_RESERVA")[0])){
                     var P_RESERVA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("P_RESERVA"), 0, 0);
                     document.miForm.IRESERVAACT.value=objNumero.cambiarSeparadorMilesPorDecimales(P_RESERVA);
                 }
                       
                }
               f_cargar_propiedades_pantalla();
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
            f_fechareserva();
            f_carga_dependencias();
        }
        
        
        function callbackajaxGuardar(ajaxResponseText){
            try{ 
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                
                }
                f_cargar_propiedades_pantalla();
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }
        
        function f_calcularImporte(tipcal){
           if (tipcal != null && tipcal ==1 ) {
              //automatic
              var FSINIES = objDom.getValorPorId("FSINIES");
              var param = '';
              param = param +'?FSINIES='+FSINIES;
              var SSEGURO = objDom.getValorPorId("SSEGURO");
              param = param +'&SSEGURO='+SSEGURO;        
              var NRIESGO = objDom.getValorPorId("NRIESGO");
              param = param +'&NRIESGO='+NRIESGO;                
              var NSINIES = objDom.getValorPorId("NSINIES");
              param = param +'&NSINIES='+NSINIES;                
              var NTRAMIT = objDom.getValorPorId("NTRAMIT");
              param = param +'&NTRAMIT='+NTRAMIT;            
              var CTRAMIT = objDom.getValorPorId("CTRAMIT");
              param = param +'&CTRAMIT='+CTRAMIT;                
              var SPRODUC = objDom.getValorPorId("SPRODUC");
              param = param +'&SPRODUC='+SPRODUC; 
              var CACTIVI = objDom.getValorPorId("CACTIVI");
              param = param +'&CACTIVI='+CACTIVI; 
              var CGARANT = document.miForm.GARANTIA.value;
              param = param +'&CGARANT='+CGARANT;                
              var CCAUSIN = objDom.getValorPorId("CCAUSIN");
              param = param +'&CCAUSIN='+CCAUSIN;                
              var CMOTSIN = objDom.getValorPorId("CMOTSIN");
              param = param +'&CMOTSIN='+CMOTSIN;                
              var FNOTIFI = objDom.getValorPorId("FNOTIFI");
              param = param +'&FNOTIFI='+FNOTIFI;                
              var FECVAL = objDom.getValorPorId("FMOVRES");
              param = param +'&FECVAL='+FECVAL;                
              var FPERINI = objDom.getValorPorId("FRESINI");
              param = param +'&FPERINI='+FPERINI;        
              var FPERFIN = objDom.getValorPorId("FRESFIN");
              param = param +'&FPERFIN='+FPERFIN; 
              var CESTTRA = objDom.getValorPorId("CESTTRA");
              param = param +'&CESTTRA='+CESTTRA; 
              var NDIASBAJA = objDom.getValorPorId("NDIASBAJA");
              param = param +'&NDIASBAJA='+NDIASBAJA; 
              
              objAjax.invokeAsyncCGI("modal_axissin010.do"+param, callbackAjax_Calcular_Importe, "operation=ajax_calcular_importe", this, objJsMessages.jslit_cargando);
           }
           else{
              //manual
              objDom.setValorPorId("IRESERVA", "");
              objDom.setValorPorId("IPENALI", "");
              objDom.setValorPorId("ICAPRIE", "");
           }
        }        
        
        
        function callbackAjax_Calcular_Importe (ajaxResponseText) {
           try{
                var doc = objAjax.domParse(ajaxResponseText);

                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {   
                    var PPIVALORA = objUtiles.hayValorElementoXml(doc.getElementsByTagName("PIVALORA")[0]) ? 
                                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("PIVALORA"), 0, 0) +" " : "";   
                    var PPIPENALI = objUtiles.hayValorElementoXml(doc.getElementsByTagName("PIPENALI")[0]) ? 
                                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("PIPENALI"), 0, 0) +" " : "";                       
                    var PPICAPRIS = objUtiles.hayValorElementoXml(doc.getElementsByTagName("PICAPRIS")[0]) ? 
                                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("PICAPRIS"), 0, 0) +" " : "";   
                    var PPIFRANQ  = objUtiles.hayValorElementoXml(doc.getElementsByTagName("PIFRANQ")[0]) ? 
                                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("PIFRANQ"), 0, 0) +" " : "";   
                    
                    var ipago = document.miForm.IPAGO.value;
                    var irecobro = document.miForm.IRECOBRO.value;
                   
                    irecobro = (objUtiles.estaVacio(irecobro)) ?0 :objNumero.toDoNumberOperation(irecobro);
                    ipago = (objUtiles.estaVacio(ipago)) ?0 :objNumero.toDoNumberOperation(ipago);


                    if(!objUtiles.estaVacio(PPIVALORA)){
                         var ireserva = parseFloat(PPIVALORA) - parseFloat(ipago) + parseFloat(irecobro);
                    }
                
                    var xireserva=objNumero.cambiarSeparadorMilesPorDecimales((""+ireserva));
                    objDom.setValorPorId("IRESERVA", xireserva);
                    f_formatear(document.miForm.IRESERVA);
                    
                    var xPPIPENALI=objNumero.cambiarSeparadorMilesPorDecimales((""+PPIPENALI));
                    objDom.setValorPorId("IPENALI", xPPIPENALI);
                    f_formatear(document.miForm.IPENALI);
                    
                    var xPPICAPRIS=objNumero.cambiarSeparadorMilesPorDecimales((""+PPICAPRIS));
                    objDom.setValorPorId("ICAPRIE", xPPICAPRIS);
                    f_formatear(document.miForm.ICAPRIE);
                    
                    var xPPIFRANQ=objNumero.cambiarSeparadorMilesPorDecimales((""+PPIFRANQ));
                    objDom.setValorPorId("IFRANQ", xPPIFRANQ);
                    objDom.setValorPorId("TFRANQ", xPPIFRANQ);
                    f_formatear(document.miForm.IFRANQ);
                    f_formatear(document.miForm.TFRANQ);
                 }   
                 
                f_cargar_propiedades_pantalla();
                f_cargarDep();
                
				<c:if test="${ (__formdata.FRESINI != null || __formdata.VFRESINI != null)  && __formdata.ESBAJA == 1}" >
					f_cfg_fechas_baja();
                </c:if>				
                
                <c:if test="${__formdata.ESBAJA == 1}">
                    objDom.setValorPorId("CALCULO",1);
                    objDom.setValorPorId("VCALCULO",1);
                    objDom.setDisabledPorId("CALCULO",true);
                </c:if>
           } catch(e){
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
           }
        }
        
        function f_calcula_ffin(){
            
            var fechaini = document.miForm.FRESINI.value;
            var dias = document.miForm.DIAS.value;
            var fecha = new Date();
            if(!objUtiles.estaVacio(fechaini) && !objUtiles.estaVacio(dias) ){
                fecha.setDate(fechaini.substr(0,2));
                fecha.setMonth(fechaini.substr(3,2)-1);
                fecha.setFullYear(fechaini.substr(6,4));

                var dms = fecha.getTime();
                var dmspp = eval(dms + (dias - 1) * 86400000);

                var fechafin=new Date();
                fechafin.setTime(dmspp );
                
                if((fechafin.getMonth()+1) < 10)
                    var mes = '0'+(fechafin.getMonth()+1);
                else
                    var mes = fechafin.getMonth()+1;
                
                var dia = fechafin.getDate();    
                if(dia < 10)
                    dia = '0'+dia;
                  
                document.miForm.FRESFIN.value = dia+'/'+mes+'/'+fechafin.getFullYear();
               
                document.miForm.IRESERVA.value = '';
                f_cambiofresfin();
           } 
        }
        
        function f_calcula_dias(ver){
            <c:if test="${__configform.axissin010__NDIASBAJA__visible!=true}">
                var fechaini = document.miForm.FRESINI.value;
                var fechafin = document.miForm.FRESFIN.value;
                
                if(!objUtiles.estaVacio(fechaini) && !objUtiles.estaVacio(fechafin) ){
                    
                    var miFecha1 = new Date( fechaini.substr(6,4), fechaini.substr(3,2)-1, fechaini.substr(0,2) ) ; 
                    var miFecha2 = new Date( fechafin.substr(6,4), fechafin.substr(3,2)-1, fechafin.substr(0,2) )  ;
               
                    var diferencia = miFecha2.getTime() - miFecha1.getTime();
                    var dias = Math.floor(diferencia /(1000 * 60 * 60 * 24));
        
                    document.miForm.DIAS.value = dias + 1;
                }
                
                if( !objUtiles.estaVacio(ver) ){
                    document.miForm.IRESERVA.value = '';
                    f_cambiofresfin();
                }
            </c:if>            
        }
        
        function f_fechareserva(){
        
            var ctipres = document.miForm.CESTTRA.value;
            var cgarant = document.miForm.GARANTIA.value;
            
            if(!objUtiles.estaVacio(ctipres) && ctipres != "null" && !objUtiles.estaVacio(cgarant) && cgarant != "null"){
                objUtiles.ejecutarFormulario ("modal_axissin010.do", "fechareserva", document.miForm, "_self", objJsMessages.jslit_cargando);    
            }
        }
        
       function f_but_9001312(){
            document.miForm.CALCULO.value = 1;
            f_calcularImporte(1);
       }
       
       function f_cambiofresfin(){
            if(!objUtiles.estaVacio(objDom.getValorPorId("FRESFIN"))){
                var param = '';
                                  
                var NSINIES = objDom.getValorPorId("NSINIES");
                param = param +'&NSINIES='+NSINIES;                
                var NTRAMIT = objDom.getValorPorId("NTRAMIT");
                param = param +'&NTRAMIT='+NTRAMIT;            
                var CGARANT = document.miForm.GARANTIA.value;
                param = param +'&CGARANT='+CGARANT;                
                var FPERFIN = objDom.getValorPorId("FRESFIN");
                param = param +'&FPERFIN='+FPERFIN; 
                var CESTTRA = objDom.getValorPorId("CESTTRA");
                param = param +'&CESTTRA='+CESTTRA; 
                objAjax.invokeAsyncCGI("modal_axissin010.do", callbackAjax_cambiofresfin, "operation=ajax_cambiofresfin"+param, this, objJsMessages.jslit_cargando);
            }
       }
       
       function callbackAjax_cambiofresfin (ajaxResponseText) {
           try{
                
                 var doc = objAjax.domParse(ajaxResponseText);
                 
                 if (!objAppMensajes.existenErroresEnAplicacion(doc)) {   
                    var FRESFIN_OUT = objUtiles.hayValorElementoXml(doc.getElementsByTagName("PFRESFIN_OUT")[0]) ? 
                                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("PFRESFIN_OUT"), 0, 0) +" " : "";   
                       
                    var fecha = FRESFIN_OUT.substr(8,2)+'/'+FRESFIN_OUT.substr(5,2)+'/'+FRESFIN_OUT.substr(0,4);
                    
                    var f = document.miForm.FRESFIN.value;
                    var fecha_ant = f.substr(6,4)+f.substr(3,2)+ f.substr(0,2);
                    var fecha_n = FRESFIN_OUT.substr(0,4) + FRESFIN_OUT.substr(5,2) +  FRESFIN_OUT.substr(8,2);
                    
                    if(fecha_ant < fecha_n)
                        alert("<axis:alt f="axissin010" c="ALERT1" lit="9900998"/>"+fecha);
                        
                    document.miForm.FRESFIN.value = fecha;
                 }   
                f_cargar_propiedades_pantalla();
                <c:if test="${ (__formdata.FRESINI != null || __formdata.VFRESINI != null)  && __formdata.ESBAJA == 1}" >
					f_cfg_fechas_baja();
                </c:if>
                
                <c:if test="${__formdata.ESBAJA == 1}">
                    objDom.setValorPorId("CALCULO",1);
                    objDom.setValorPorId("VCALCULO",1);
                    objDom.setDisabledPorId("CALCULO",true);
                </c:if>
           } catch(e){
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
           }
        }
       function callbackAjax_Cal_Impor_Pes (ajaxResponseText) {
           try{
                 
        	     reserva = parseFloat('${__formdata.IRESERVAACT}');
                 var doc = objAjax.domParse(ajaxResponseText);
                 
                  if (!objAppMensajes.existenErroresEnAplicacion(doc)) {   
                     var VALORCONVERTIDO = objUtiles.hayValorElementoXml(doc.getElementsByTagName("PVALORCONVERTIDO")[0])  ?
                                       objDom.getValorNodoDelComponente(doc.getElementsByTagName("PVALORCONVERTIDO"), 0, 0) +" " : "";
                       
                      var str = VALORCONVERTIDO; 
                       var VALORCONVRES = str.replace(".",",");
                       var VALORCONVRES = str.replace(" ","");
                    } 
                    f_formatearconNeg(VALORCONVRES);
                    objDom.setValorPorId("IVARRES",VALORCONVRES);
                    suma=parseFloat(parseFloat(reserva)+parseFloat(VALORCONVRES.replace(',','.')));
                    
                    if (suma < 0){
                        alert('<axis:alt f="axissin010" c="CHNUM" lit="9907783"/>');
                        thiss.value = '';
                    }
                    else{
                        document.miForm.IRESERVA.value = suma;
                        objDom.setValorPorId ("IRESERVA",objNumero.cambiarSeparadorMilesPorDecimales(IRESERVA.value.toString()));
                        f_formatear(document.miForm.IRESERVA);
                    }
           } catch(e){
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
           }
        }
       
       /*******************************************
              Formateo Numeros
        ********************************************/
         function validarNumeros(IMPORTE){
             if (!objUtiles.estaVacio(IMPORTE)){
                 IMPORT = objValidador.valorFormateadoCampoNumerico(IMPORTE, true, true);
                 if(objNumero.validaNumero(IMPORT, true)){
                     return this.formateaNumeroCero(IMPORT, true);
                 }
                 else{
                     return   '';
                 }
             }
             else return IMPORTE;
         }
         
        function formateaNumeroCero(entrada, isDecimal){
            // es crida al reformateixador  ###.###,00
            var fnum=objNumero.formateaNumero(entrada,isDecimal);
            if(entrada.indexOf(objNumero.getSeparadorDecimales())<0){
                fnum += objNumero.getSeparadorDecimales() + '00';
            }
            // si es tracta d'un 0 el converteix a 0,00
            if(fnum=='0') fnum += objNumero.getSeparadorDecimales() + '00';
            return fnum;

        }
         
        function f_formatear(thiss){
            thiss.value = validarNumeros(thiss.value);
        }
        
        function f_calculoma(thiss){
            document.miForm.CALCULO.value = 0;
            f_formatear(thiss);
        }
        
        /* Actualizar formateo fechas */
        /* Actualizar formato fechas */
        function f_actData(thiss){
            //alert("Aquí");
            thiss.value = f_formatdate(thiss);
        }     

        function f_formatdate(entrada){
            var jDate = new JsFecha();
    
            if (!jDate.validaFecha(entrada.value)|| entrada.value.indexOf("/") == -1){
                if(entrada.value.length>0){
                    entrada.value=jDate.formateaFecha(entrada.value);            
                    if(jDate.validaFecha(entrada.value)){
                        entrada.value=jDate.formateaFecha(entrada.value);
                    }else{
                        entrada.value = '';//alert('Formato fecha incorrecto para el campo '+ title);
                    }
                }
            }
            return entrada.value;
        }
        
        function f_calcula_ipenali(){
            document.miForm.IPENALI.value = '';
            objUtiles.ejecutarFormulario ("modal_axissin010.do", "calculipenali", document.miForm, "_self", objJsMessages.jslit_cargando);  
        }
        
        function f_calcula_ifranq(){
            document.miForm.TFRANQ.value = '';
            objUtiles.ejecutarFormulario ("modal_axissin010.do", "calculifranq", document.miForm, "_self", objJsMessages.jslit_cargando);  
        }
                
        function f_valida_IPREREC(){  
          var numero = document.miForm.IPREREC.value;
          if (isNaN(numero)) {
                alert('<axis:alt f="axissin010" c="IPREREC_LIT" lit="9900853"/>:<axis:alt f="axissin010" c="IPREREC_AVISO" lit="1000422"/>');
                document.miForm.IPREREC.value='';
                //return false;
          }
        }
        
        function replaceAll( text, busca, reemplaza ){
          while (text.toString().indexOf(busca) != -1)
              text = text.toString().replace(busca,reemplaza);
          return text;
        }
        
        function f_recargar(thiss){
            if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'DESTINATARI')){               
                var SPERSON = objUtiles.utilSplit(thiss.value, "/")[0]; // SPERSON
                var CTIPDES = objUtiles.utilSplit(thiss.value, "/")[1]; // CTIPDES
                var SPROFES = objUtiles.utilSplit(thiss.value, "/")[2]; // SPROFES
                
                objDom.setValorPorId("SPERSON", SPERSON);
                                  
                objDom.setValorPorId("CTIPDES", CTIPDES);
                
                objDom.setValorPorId("SPROFES", SPROFES);
            }else{
            }
            f_cargar_propiedades_pantalla();    
            objUtiles.ejecutarFormulario ("modal_axissin010.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);    
        } 
        
        function f_aceptar_axissin011(NSINIES, SPROFES) {
          //alta destinatarios, desde pagos
            objDom.setValorPorId("NSINIES", NSINIES);
            objDom.setValorPorId("SPROFES", SPROFES);
            f_recargar(null);
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
        
        function f_guarda_impuestos(){
            var NPORCENT;
            var CTIPIND;
            if (!objUtiles.estaVacio($("#PRETENC_SAP").val())){ 
                NPORCENT = objNumero.cambiarSeparadorMilesPorDecimales(objUtiles.utilSplit($("#PRETENC_SAP").val(), "|")[0]); // NPORCENT
                if (!objUtiles.estaVacio(NPORCENT)){
                    f_formatear(NPORCENT);
                }
                CTIPIND = objUtiles.utilSplit($("#PRETENC_SAP").val(), "|")[1]; // CTIPIND
                $("#PRETENC_CTIPIND").val(CTIPIND);
                CTIPIND = $("#PRETENC_CTIPIND").val();
                $("#PRETENC_SAP_NPORCENT").val(NPORCENT);
                NPORCENT = $("#PRETENC_SAP_NPORCENT").val();
            }
            if (!objUtiles.estaVacio($("#PIVA_SAP").val())){ 
                NPORCENT = objNumero.cambiarSeparadorMilesPorDecimales(objUtiles.utilSplit($("#PIVA_SAP").val(), "|")[0]); // NPORCENT
                if (!objUtiles.estaVacio(NPORCENT)){
                    f_formatear(NPORCENT);
                }
                CTIPIND = objUtiles.utilSplit($("#PIVA_SAP").val(), "|")[1]; // CTIPIND   
                $("#PIVA_CTIPIND").val(CTIPIND);
                $("#PIVA_SAP_NPORCENT").val(NPORCENT);
            }
            if (!objUtiles.estaVacio($("#PRETEIVA_SAP").val())){ 
                NPORCENT = objNumero.cambiarSeparadorMilesPorDecimales(objUtiles.utilSplit($("#PRETEIVA_SAP").val(), "|")[0]); // NPORCENT
                if (!objUtiles.estaVacio(NPORCENT)){
                    f_formatear(NPORCENT);
                }
                CTIPIND = objUtiles.utilSplit($("#PRETEIVA_SAP").val(), "|")[1]; // CTIPIND   
                $("#PRETEIVA_CTIPIND").val(CTIPIND);
                $("#PRETEIVA_SAP_NPORCENT").val(NPORCENT);
            }
            if (!objUtiles.estaVacio($("#PRETEICA_SAP").val())){ 
                NPORCENT = objNumero.cambiarSeparadorMilesPorDecimales(objUtiles.utilSplit($("#PRETEICA_SAP").val(), "|")[0]); // NPORCENT
                if (!objUtiles.estaVacio(NPORCENT)){
                    f_formatear(NPORCENT);
                }
                CTIPIND = objUtiles.utilSplit($("#PRETEICA_SAP").val(), "|")[1]; // CTIPIND   
                $("#PRETEICA_CTIPIND").val(CTIPIND);
                $("#PRETEICA_SAP_NPORCENT").val(NPORCENT);
            }
        }
        
        function f_formatear(thiss){
            thiss.value = validarNumeros(thiss.value);
        }
        
        function validarNumeros(IMPORTE){
            if (!objUtiles.estaVacio(IMPORTE)){
                IMPORT = objValidador.valorFormateadoCampoNumerico(IMPORTE, true, true);
                if(objNumero.validaNumero(IMPORT, true)){
                    return this.formateaNumeroCero(IMPORT, true);
                }
                else{
                    return   '';
                }
            }else return IMPORTE;
        }
        
        function formateaNumeroCero(entrada, isDecimal){
            // es crida al reformateixador  ###.###,00
            var fnum=objNumero.formateaNumero(entrada,isDecimal);
            if(entrada.indexOf(objNumero.getSeparadorDecimales())<0){
                fnum += objNumero.getSeparadorDecimales() + '00';
            }
            // si es tracta d'un 0 el converteix a 0,00
            if(fnum=='0') fnum += objNumero.getSeparadorDecimales() + '00';
            return fnum;
        }
        
        function f_formatearconNeg(thiss){
            thiss.value = validarNumerosconNeg(thiss.value);
        }
        
        function validarNumerosconNeg(IMPORTE){
            if (!objUtiles.estaVacio(IMPORTE)){
                if(objNumero.validarNegativos(IMPORTE)){
                    return objNumero.formateaNumeroMoneda(IMPORTE);
                }
                else{
                    return   '';
                }
            }else return IMPORTE;
        }
        
        function f_calculovarres(thiss){
            valor = thiss.value;
            reserva = parseFloat('${__formdata.IRESERVAACT}');
            f_formatearconNeg(thiss);
            suma = parseFloat(reserva) + parseFloat(valor); 
            if (suma < 0){
                alert('<axis:alt f="axissin010" c="CHNUM" lit="9907783"/>');
                thiss.value = '';
            }
            else{
                document.miForm.IRESERVA.value = suma;  
                objDom.setValorPorId ("IRESERVA",objNumero.cambiarSeparadorMilesPorDecimales(IRESERVA.value.toString()));
                f_formatear(document.miForm.IRESERVA);
            }
        }
        function f_calculopes(thiss){
        	
        	VALOR = thiss.value;
            reserva = parseFloat('${__formdata.IRESERVAACT}');
            cmonres = '${__formdata.CMONRES}';
            f_formatearconNeg(thiss);
            var CMONRESORI = 'COP';
            param = '';
            if (VALOR != null ) {
                //automatic
                //IAXIS_14872 AABC cambios paa reservas de gastos y Ulae
                var CMONRES = objDom.getValorPorId("CMONRES");
                var NSINIES = objDom.getValorPorId("NSINIES");
                var CTIPRES = objDom.getValorPorId("CTIPRES");
                var CGARANT = document.miForm.GARANTIA.value;
                param = param +'&CMONRES='+CMONRES;   
                param = param +'&CMONRESORI='+CMONRESORI;    
                param = param +'&VALOR='+VALOR;  
                param = param +'&NSINIES='+NSINIES;
                param = param +'&CTIPRES='+CTIPRES;
                param = param +'&CGARANT='+CGARANT;
                
                objAjax.invokeAsyncCGI("modal_axissin010.do", callbackAjax_Cal_Impor_Pes, "operation=ajax_cal_impor_pes"+param, this, objJsMessages.jslit_cargando);
             }
             else{
                //manual
                objDom.setValorPorId("IVARRESPES", "");
             } 
            
        }
    </script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
    <c:param name="titulo"><axis:alt f="axissin010" c="titulo_axissin011" lit="9000896" /></c:param>
    <c:param name="nid" value="axissin011" />
    </c:import>
    <form name="miForm" action="modal_axissin010.do" method="POST">
    <input type="hidden" id="operation" name="operation" value="guardar" />
    <input type="hidden" id="NSINIES" name="NSINIES" value="${__formdata.NSINIES}"/>
    <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
    <input type="hidden" id="NMOVIMI" name="NMOVIMI" value="${__formdata.NMOVIMI}"/>
    <input type="hidden" id="SPRODUC" name="SPRODUC" value="${__formdata.SPRODUC}"/>
    <input type="hidden" id="NTRAMIT" name="NTRAMIT" value="${__formdata.NTRAMIT}"/>
    <input type="hidden" id="subpantalla" name="subpantalla" value="tramitaciones"/>
    <input type="hidden" id="seccion" name="seccion" value="tramitaciones_reservas"/>
    <input type="hidden" id="indexTramitacio" name="indexTramitacio" value="${__formdata.indexTramitacio}"/>    
    <input type="hidden" id="CCAUSIN" name="CCAUSIN" value="${__formdata.CCAUSIN}"/>
    <input type="hidden" id="CMOTSIN" name="CMOTSIN" value="${__formdata.CMOTSIN}"/>
    <input type="hidden" id="FSINIES" name="FSINIES" value="<fmt:formatDate value='${__formdata.FSINIES}' pattern='dd/MM/yyyy' />"/>    
    <input type="hidden" id="NRIESGO" name="NRIESGO" value="${__formdata.NRIESGO}"/>
    <input type="hidden" id="FNOTIFI" name="FNOTIFI" value="<fmt:formatDate value='${__formdata.FNOTIFI}' pattern='dd/MM/yyyy' />"/>    
    <input type="hidden" id="CACTIVI" name="CACTIVI" value="${__formdata.CACTIVI}"/>    
    <input type="hidden" id="CTRAMIT" name="CTRAMIT" value="${__formdata.CTRAMIT}"/> 
    <input type="hidden" id="FMOVRES" name="FMOVRES" value="<fmt:formatDate value='${__formdata.FMOVRES}' pattern='dd/MM/yyyy' />"/> 
    <input type="hidden" id="VFRESINI" name="VFRESINI" value="<fmt:formatDate value='${__formdata.VFRESINI}' pattern='dd/MM/yyyy' />"/> 
    <input type="hidden" id="ESBAJA" name="ESBAJA" value="${__formdata.ESBAJA}"/>
    <input type="hidden" id="VCALCULO" name="VCALCULO" value="${__formdata.CALCULO}"/>
    <input type="hidden" id="MODO" name="MODO" value="${__formdata.MODO}"/>
    <input type="hidden" id="NMOVRES" name="NMOVRES" value="${__formdata.NMOVRES}"/>
    <input type="hidden" id="VCESTTRA" name="VCESTTRA" value="${__formdata.CESTTRA}"/>
    <input type="hidden" id="VGARANTIA" name="VGARANTIA" value="${__formdata.GARANTIA}"/>
    <input type="hidden" id="VIRESERVA" name="VIRESERVA" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IRESERVA}"/>"/>
    <input type="hidden" id="IPAGO" name="IPAGO" value=""/>
    <input type="hidden" id="IRECOBRO" name="IRECOBRO" value=""/>
    <input type="hidden" id="CTIPRES" name="CTIPRES" value="${__formdata.CTIPRES}"/>
    <input type="hidden" id="FULTPAG" name="FULTPAG" value="<fmt:formatDate value='${__formdata.FULTPAG}' pattern='dd/MM/yyyy' />"/> 
    <input type="hidden" id="SIDEPAG" name="SIDEPAG" value="${__formdata.SIDEPAG}"/>
    <input type="hidden" id="ORIGEN" name="ORIGEN" value="${__formdata.ORIGEN}"/>
    <input type="hidden" id="IFRANQ" name="IFRANQ" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IFRANQ}"/>"/>
    <input type="hidden" name="CTIPDES" id="CTIPDES" value="${__formdata.CTIPDES}"/>
    <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}"/>
    <input type="hidden" name="SPROFES" id="SPROFES" value="${__formdata.SPROFES}"/>
    <input type="hidden" name="CAGENTE"  id="CAGENTE" value="${__formdata.CAGENTE}"/>
    <input type="hidden" name="IMPUESTOS_SAP" id="IMPUESTOS_SAP" value="${__formdata.IMPUESTOS_SAP}"/>
    <input type="hidden" name="PIVA_CTIPIND" id="PIVA_CTIPIND" value="${__formdata.PIVA_CTIPIND}"/>
    <input type="hidden" name="PIVA_SAP_NPORCENT" id="PIVA_SAP_NPORCENT" value="${__formdata.PIVA_SAP_NPORCENT}"/>
    <input type="hidden" name="PRETEICA_CTIPIND" id="PRETEICA_CTIPIND" value="${__formdata.PRETEICA_CTIPIND}"/>
    <input type="hidden" name="PRETEIVA_CTIPIND" id="PRETEIVA_CTIPIND" value="${__formdata.PRETEIVA_CTIPIND}"/>
    <input type="hidden" name="PRETENC_CTIPIND" id="PRETENC_CTIPIND" value="${__formdata.PRETENC_CTIPIND}"/>
    <input type="hidden" name="PRETEICA_SAP_NPORCENT" id="PRETEICA_SAP_NPORCENT" value="${__formdata.PRETEICA_SAP_NPORCENT}"/>
    <input type="hidden" name="PRETEIVA_SAP_NPORCENT" id="PRETEIVA_SAP_NPORCENT" value="${__formdata.PRETEIVA_SAP_NPORCENT}"/>
    <input type="hidden" name="PRETENC_SAP_NPORCENT" id="PRETENC_SAP_NPORCENT" value="${__formdata.PRETENC_SAP_NPORCENT}"/>
    <axis:visible f="axissin010" c="CTIPCOA"> 
    <input type="hidden" name="CTIPCOA" id="CTIPCOA" value="<%=request.getSession().getAttribute("CTIPCOA")%>"
    <axis:atr f="axissin010" c="CTIPCOA" a="modificable=false"/>/>
    </axis:visible>
    <c:set var="linea_trami">
        ${__formdata.indexTramitacio}
    </c:set>
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt f="axissin010" c="TIT_PANTALLA" lit="9000982"/></c:param>
        <c:param name="formulario"><axis:alt f="axissin010" c="TIT_PANTALLA" lit="9000982"/></c:param>
        <c:param name="form">axissin010</c:param>
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
                     <axis:ocultar f="axissin010" c="NSINIES" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin010" c="NSINIES_LIT" lit="101298"/></b><!-- Numero de Siniestro-->
                            </td>
                       </axis:ocultar>    
                       <axis:ocultar f="axissin010" c="TTIPTRA" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin010" c="TTIPTRA_LIT" lit="9001028"/></b><!-- Tipus tramitacio -->
                            </td>
                       </axis:ocultar>    
                       <axis:ocultar f="axissin010" c="TTRAMIT" dejarHueco="false"> 
                           <td class="titulocaja">
                                <b><axis:alt f="axissin010" c="TTRAMIT_LIT" lit="100588"/></b><!-- Tipus dany  -->
                            </td>         
                        </axis:ocultar>    
                        <axis:ocultar f="axissin010" c="TTCAUSIN" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin010" c="TTCAUSIN_LIT" lit="9000901"/></b><!-- Tipus dany  -->
                            </td>
                        </axis:ocultar>    
                        <axis:ocultar f="axissin010" c="CINFORM" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin010" c="CINFORM_LIT" lit="9000905"/></b><!-- Tramitación informativa -->                            
                            </td>          
                        </axis:ocultar>    
                    </tr>
                    <tr>
                         <axis:ocultar f="axissin010" c="NSNIES" dejarHueco="false"> 
                     <td class="campocaja">
                           <input type="text" name="NSINIES_O" id="NSINIES_O"  class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin009" c="NSINIES" a="modificable=false"/> />
                            
                        </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin010" c="TTIPTRA" dejarHueco="false"> 
                            <td class="campocaja">
                             <input type="text" name="TTIPTRA" id="TTIPTRA" value="${sessionScope.tramitaciones_min[linea_trami].TTIPTRA}" class="campodisabled campo campotexto" style="width:90%" title="<axis:alt f="axissin010" c="TTIPTRA_ALT" lit="9001028"/>"
                                <axis:atr f="axissin010" c="TTIPTRA" a="modificable=false"/> />                                
                            </td>
                        </axis:ocultar>    
                        <axis:ocultar f="axissin010" c="TTRAMIT" dejarHueco="false"> 
                            <td class="campocaja">
                             <input type="text" id="TTRAMIT" name="TTRAMIT" value="${sessionScope.tramitaciones_min[linea_trami].TTRAMIT}" class="campodisabled campo campotexto" style="width:90%" title="<axis:alt f="axissin010" c="TTRAMIT_ALT" lit="100588"/>"
                                <axis:atr f="axissin010" c="TTRAMIT" a="modificable=false"/> />                                
                            </td>                        
                        </axis:ocultar>    
                        <axis:ocultar f="axissin010" c="TTCAUSIN" dejarHueco="false"> 
                            <td class="campocaja">
                                <input type="text" id="TTCAUSIN" name="TTCAUSIN" value="${sessionScope.tramitaciones_min[linea_trami].TTCAUSIN}" class="campodisabled campo campotexto" style="width:90%" title="<axis:alt f="axissin010" c="TTCAUSIN_ALT" lit="9000901"/>"
                                <axis:atr f="axissin010" c="TTCAUSIN" a="modificable=false"/> />
                            </td>
                        </axis:ocultar>    
                        <axis:ocultar f="axissin010" c="CINFORM" dejarHueco="false"> 
                            <td class="campocaja" align="left">
                                <input type="checkbox" disabled  id="CINFORM" name="CINFORM" <axis:atr f="axissin010" c="CINFORM" a="modificable=false"/> value="${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.CINFORM}" title="<axis:alt f="axissin010" c="CINFORM_ALT" lit="9000905"/>"
                                <c:if test="${sessionScope.tramitaciones_min[linea_trami].CINFORM == '1'}">checked</c:if> >
                            </td>                        
                        </axis:ocultar>    
                    </tr>
                    <tr>
                        <axis:ocultar f="axissin010" c="TESTTRA" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin010" c="TESTTRA_LIT" lit="100587"/></b><!-- Estado -->
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin010" c="TSUBTRA" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin010" c="TSUBTRA_LIT" lit="9000852"/></b><!--Subestado -->
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin010" c="TUNITRA" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin010" c="TUNITRA_LIT" lit="9000900"/></b><!-- Unidad tramitacion -->
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin010" c="TTRAMITAD" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin010" c="TTRAMITAD_LIT" lit="9910018"/></b><!-- Tramitador -->
                            </td>
                         </axis:ocultar>   
                        <td class="titulocaja">
                            
                        </td>
                    </tr>
                    <tr>
                        <axis:ocultar f="axissin010" c="TESTTRA" dejarHueco="false"> 
                            <td class="campocaja">
                                <input type="text" name="TESTTRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TESTTRA}" class="campodisabled campo campotexto" style="width:90%" title="<axis:alt f="axissin010" c="TESTTRA_ALT" lit="100587"/>"
                                <axis:atr f="axissin010" c="TESTTRA" a="modificable=false"/> />
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin010" c="TSUBTRA" dejarHueco="false"> 
                            <td class="campocaja">
                                <input type="text" name="TSUBTRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TSUBTRA}" class="campodisabled campo campotexto" style="width:90%" title="<axis:alt f="axissin010" c="TSUBTRA_ALT" lit="9000852"/>"
                                <axis:atr f="axissin010" c="TSUBTRA" a="modificable=false"/> />                        
                            </td>                          
                        </axis:ocultar>
                        <axis:ocultar f="axissin010" c="TUNITRA" dejarHueco="false"> 
                            <td class="campocaja">
                                <input type="text" name="TUNITRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TUNITRA}" class="campodisabled campo campotexto" style="width:90%" title="<axis:alt f="axissin010" c="TUNITRA_ALT" lit="9000900"/>"
                                <axis:atr f="axissin010" c="TUNITRA" a="modificable=false"/> />
                            </td>
                        </axis:ocultar>    
                        <axis:ocultar f="axissin010" c="TTRAMITAD" dejarHueco="false"> 
                            <td class="campocaja">
                               <input type="text" name="TTRAMITAD" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TTRAMITAD}" class="campodisabled campo campotexto" style="width:90%" title="<axis:alt f="axissin010" c="TTRAMITAD_ALT" lit="9910018"/>"
                                <axis:atr f="axissin010" c="TTRAMITAD" a="modificable=false"/> />
                            </td>
                        </axis:ocultar>
                        
                        <td class="campocaja">
                             
                        </td>
                    </tr>
                </table>

                <div class="separador">&nbsp;</div>                
                
                <table class="seccion">
                    <tr>
                        <th style="width:21%;height:0px"></th>
                        <th style="width:15%;height:0px"></th>
                        <th style="width:15%;height:0px"></th>
                        <th style="width:15%;height:0px"></th>
                        <th style="width:15%;height:0px"></th>
                        <th style="width:15%;height:0px"></th>
                       
                    </tr>
                    
                      <tr>
                         <axis:visible f="axissin010" c="CMONRES" >
                            <td class="titulocaja" id="labe_CMONRES">
                                <b id="label_CMONRES"><axis:alt f="axissin010" c="CMONRES" lit="108645" /></b>
                            </td>
                         </axis:visible>
                         <axis:visible f="axissin010" c="DESTINATARI" >
                            <td class="titulocaja" id="tb_DESTINATARI" colspan="2">
                                <b id="label_DESTINATARI"><axis:alt f="axissin010" c="DESTINATARI" lit="9000909" /></b>
                            </td>
                         </axis:visible>
                         <axis:ocultar f="axissin010" c="NLOCALI" dejarHueco="false"> 
                           <td class="titulocaja">
                            <b id="label_NLOCALI"><axis:alt f="axissin010" c="NLOCALI" lit="9002272"/></b>
                           </td>
                        </axis:ocultar> 
                      </tr>
                      <tr>
                        <axis:ocultar f="axissin010" c="CMONRES" >
                            <td class="campocaja">
                                <select name = "CMONRES" id ="CMONRES" size="1" disabled="disabled"
                                    class="campowidthselect campo campotexto" <axis:atr f="axissin010" c="CMONRES" a="isInputText=false"/>>&nbsp;
                                     <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axissin010" c="SELEC" lit="1000348"/> - </option>                                                                                                   
                                    <c:forEach items="${listValores.lista_monedas}" var="monedaRes">
                                        <option value = "${monedaRes.CMONINT}" <c:if test="${monedaRes.CMONINT  == __formdata.CMONRES}">selected</c:if>>${monedaRes.TMONEDA}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </axis:ocultar>
                          <axis:ocultar c="DESTINATARI" f="axissin010" dejarHueco="false">
                                <td class="campocaja" colspan="2">
                                    <select name="DESTINATARI" id="DESTINATARI" size="1" onchange="f_recargar(this);" class="campowidthselect campo campotexto" style="width:85%;"
                                            title="<axis:alt f="axissin010" c="DESTINATARI" lit="9000909"/>">
                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin010" c="LSTDESTINATARI" lit="1000348"/> - </option>
                                            <c:forEach var="desti" items="${listValores.lstdestinataris}">
                                                <option value = "${desti.OB_IAX_SIN_TRAMI_DESTINATARIO.PERSONA.SPERSON}/${desti.OB_IAX_SIN_TRAMI_DESTINATARIO.CTIPDES}/${desti.OB_IAX_SIN_TRAMI_DESTINATARIO.SPROFES}" 
                                                <c:if test="${desti.OB_IAX_SIN_TRAMI_DESTINATARIO.PERSONA.SPERSON == __formdata.SPERSON}"> selected </c:if> />
                                                ${desti.OB_IAX_SIN_TRAMI_DESTINATARIO.PERSONA.SPERSON} -
                                                ${desti.OB_IAX_SIN_TRAMI_DESTINATARIO.PERSONA.TNOMBRE}
                                                ${desti.OB_IAX_SIN_TRAMI_DESTINATARIO.PERSONA.TAPELLI1} 
                                                ${desti.OB_IAX_SIN_TRAMI_DESTINATARIO.PERSONA.TAPELLI2} 
                                                </option>
                                            </c:forEach>
                                    </select>
                                    <a href="javascript:f_abrir_modal('axissin011',null,'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+'${__formdata.NTRAMIT}'+'&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&CTRAMIT='+document.miForm.CTRAMIT.value+'&CCAUSIN='+document.miForm.CCAUSIN.value+'&CMOTSIN='+document.miForm.CMOTSIN.value);">
                                     <%-- <a href="javascript:f_abrir_axisssin011(null,document.miForm.SPERSON.value)">--%>
                                    <img border="0" alt="<axis:alt f="axissin010" c="DESTINATARI_ICO" lit="9001513"/>" title="<axis:alt f="axissin010" c="DESTINATARI_ICO" lit="9001513"/>" src="images/new.gif"/></a>                            
                                </td>
                            </axis:ocultar>  
                            <axis:visible f="axissin010" c="NLOCALI"> 
                                <td class="campocaja">
                                    <select name="NLOCALI" id="NLOCALI" size="1" class="campowidthselect campo campotexto" style="width:90%;" onchange="f_recarga_reteica()">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin010" c="LIT_SELEC" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.lstlocalizacion}">
                                            <option value = "${element.NLOCALI}" 
                                                <c:if test="${element.NLOCALI == __formdata.NLOCALI}"> selected </c:if> />
                                                ${element.TLOCALI} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:visible>
                        </tr>
                        <tr>
                            <axis:ocultar f="axissin010" c="PIVA_SAP" dejarHueco="false"> 
                                <td id="td_PIVA_SAP" class="titulocaja">
                                 <b><axis:alt f="axissin010" c="PIVA_SAP" lit="9001320"/></b>
                                </td>
                             </axis:ocultar>
                             <axis:ocultar f="axissin010" c="PRETENC_SAP" dejarHueco="false"> 
                                <td id="td_PRETENC_SAP" class="titulocaja">
                                 <b><axis:alt f="axissin010" c="PRETENC_SAP" lit="9001319"/></b>
                                </td>
                             </axis:ocultar>
                             <axis:ocultar f="axissin010" c="PRETEIVA_SAP" dejarHueco="false"> 
                                <td id="td_PRETEIVA_SAP" class="titulocaja">
                                 <b><axis:alt f="axissin010" c="PRETEIVA_SAP" lit="9902695"/></b>
                                </td>
                             </axis:ocultar>
                             <axis:ocultar f="axissin010" c="PRETEICA_SAP" dejarHueco="false"> 
                                <td id="td_PRETEICA_SAP" class="titulocaja">
                                 <b><axis:alt f="axissin010" c="PRETEICA_SAP" lit="9902696"/></b>
                                </td>
                             </axis:ocultar>
                        </tr>
                        <tr>
                            <axis:visible f="axissin010" c="PIVA_SAP"> 
                                <td class="campocaja" id="td_PIVA_SAP">
                                    <select name="PIVA_SAP" id="PIVA_SAP" size="1" class="campowidthselect campo campotexto" style="width:90%;" onChange="javascript:f_guarda_impuestos();">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin010" c="LIT_SELEC" lit="1000348"/> - </option>
                                        <c:forEach var="e_piva" items="${__formdata.lstPIVA}">
                                            <option value = "${e_piva.PORCENT}|${e_piva.CTIPIND}" 
                                                <c:if test="${e_piva.CTIPIND == __formdata.PIVA_CTIPIND}"> selected </c:if> />
                                                ${e_piva.TINDICA} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:visible>
                            <axis:visible f="axissin010" c="PRETENC_SAP"> 
                                <td class="campocaja" id="td_PRETENC_SAP">
                                    <select name="PRETENC_SAP" id="PRETENC_SAP" size="1" class="campowidthselect campo campotexto" style="width:90%;" onChange="javascript:f_actualizarImporte(this, 0);">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin010" c="LIT_SELEC" lit="1000348"/> - </option>
                                        <c:forEach var="e_pretenc" items="${__formdata.lstPRETENC}">
                                            <option value = "${e_pretenc.PORCENT}|${e_pretenc.CTIPIND}" 
                                                <c:if test="${e_pretenc.CTIPIND == __formdata.PRETENC_CTIPIND}"> selected </c:if> />
                                                ${e_pretenc.TINDICA} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:visible>
                            <axis:visible f="axissin010" c="PRETEIVA_SAP"> 
                                <td class="campocaja" id="td_PRETEIVA_SAP">
                                    <select name="PRETEIVA_SAP" id="PRETEIVA_SAP" size="1" class="campowidthselect campo campotexto" style="width:90%;" onChange="javascript:f_actualizarImporte(this, 0);">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin010" c="LIT_SELEC" lit="1000348"/> - </option>
                                        <c:forEach var="e_reteiva" items="${__formdata.lstPRETEIVA}">
                                            <option value = "${e_reteiva.PORCENT}|${e_reteiva.CTIPIND}" 
                                                <c:if test="${e_reteiva.CTIPIND == __formdata.PRETEIVA_CTIPIND}"> selected </c:if> />
                                                ${e_reteiva.TINDICA} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:visible>
                            <axis:visible f="axissin010" c="PRETEICA_SAP"> 
                                <td class="campocaja" id="td_PRETEICA_SAP">
                                    <select name="PRETEICA_SAP" id="PRETEICA_SAP" size="1" class="campowidthselect campo campotexto" style="width:90%;" onChange="javascript:f_actualizarImporte(this, 0);">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin010" c="LIT_SELEC" lit="1000348"/> - </option>
                                        <c:forEach var="e_reteica" items="${__formdata.lstPRETEICA}">
                                            <option value = "${e_reteica.PORCENT}|${e_reteica.CTIPIND}" 
                                                <c:if test="${e_reteica.CTIPIND == __formdata.PRETEICA_CTIPIND}"> selected </c:if> />
                                                ${e_reteica.TINDICA} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:visible>
                        </tr>
                   <tr>
                        <axis:visible f="axissin010" c="CESTTRA">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin010" c="CESTTRA_LIT" lit="9001155"/></b><!-- Tipo reserva -->
                        </td>
                        </axis:visible>
                        <axis:ocultar f="axissin010" c="GARANTIA" dejarHueco="false"> 
                            <td class="titulocaja">
                                <div id="literal_gar" ><b><axis:alt f="axissin010" c="GARANTIA_LIT" lit="110994"/></b><!-- Garantia --></div>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin010" c="TCAPITAL" dejarHueco="false"> 
                            <td class="titulocaja">
                                <div id="literal_capi" ><b><axis:alt f="axissin010" c="TCAPITAL_LIT" lit="1000073"/></b><!-- Capital --></div>
                            </td>  
                        </axis:ocultar>
                        <axis:ocultar f="axissin010" c="TFRANQ" dejarHueco="false"> 
                            <td class="titulocaja">
                                <div id="literal_fran" ><b><axis:alt f="axissin010" c="TFRANQ_LIT" lit="9000940"/></b><!-- Franquicia --></div>
                            </td>      
                        </axis:ocultar>
                        <axis:ocultar f="axissin010" c="CALCULO" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin010" c="CALCULO_LIT" lit="9001023"/></b><!-- Calculo -->
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin010" c="IRESERVA" dejarHueco="false"> 
                            <td class="titulocaja">
                                 <b><axis:alt f="axissin010" c="IRESERVA_LIT" lit="9001156"/></b><!-- Imp. Reserva -->
                            </td>
                        </axis:ocultar>
                    </tr>
              
                    <tr>
                        <!-- Tipo reserva -->
                        <axis:visible f="axissin010" c="CESTTRA">
                        <td class="campocaja">
                            <select id="CESTTRA" name="CESTTRA" title="<axis:alt f="axissin010" c="CESTTRA_ALT" lit="9001155"/>" onchange="javascript:f_cargar_garantias();f_cargarDep();" <axis:atr f="axissin010" c="CESTTRA" a="isInputText=false&obligatorio=true"/> size="1" class="campowidthselect campo campotexto">
                                <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axissin010" c="LITNULL" lit="1000348"/> - </option>
                                <c:forEach var="lstestado" items="${listValores.tipo_reserva}">
                                    <option value="${lstestado.CATRIBU}"
                                    <c:if test="${lstestado.CATRIBU == __formdata.CESTTRA}"> selected </c:if>>
                                         ${lstestado.TATRIBU}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>    
                        </axis:visible>
                        <axis:ocultar f="axissin010" c="GARANTIA" dejarHueco="false"> 
                                <td class="campocaja">
                                    <select name="GARANTIA" id ="GARANTIA" size="1" onchange="javascript:f_cargar_franquicia();" <axis:atr f="axissin010" c="GARANTIA" a="isInputText=false"/> class="campowidthselect campo campotexto" style="width:200px" title="<axis:alt f="axissin010" c="GARANTIA_ALT" lit="110994"/>">
                                        <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axissin010" c="LITNULL" lit="1000348"/> - </option>
                                        <c:forEach var="lstreserva" items="${__formdata.lista_garantias}">
                                            <option value="${lstreserva.CGARANT}"
                                            <c:if test="${lstreserva.CGARANT == __formdata.GARANTIA}"> selected </c:if>>
                                                ${lstreserva.TGARANT}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>   
                            <axis:ocultar f="axissin010" c="TCAPITAL" dejarHueco="false"> 
                                <td class="campocaja">
                                     <input type="text" name="TCAPITAL" id ="TCAPITAL" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.TCAPITAL}"/>" class="campowidthinput campo campotexto" style="width:90%" title="<axis:alt f="axissin010" c="TCAPITAL_ALT" lit="1000073"/>"
                                     <axis:atr f="axissin010" c="TCAPITAL" a="modificable=false&obligatorio=false&formato=decimal"/> />
                                </td>
                            </axis:ocultar> 
                            <axis:ocultar f="axissin010" c="TFRANQ" dejarHueco="false"> 
                                <td class="campocaja">
                                     <input type="text" name="TFRANQ" id="TFRANQ" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.TFRANQ}"/>" class="campowidthinput campo campotexto" style="width:80%" title="<axis:alt f="axissin010" c="TFRANQ_ALT" lit="9000940"/>"
                                     <axis:atr f="axissin010" c="TFRANQ" a="modificable=false&obligatorio=false"/> />
                                <axis:ocultar f="axissin010" c="CALIFRANQ">
                                 <img border="0" src="images/calculadora.gif" onclick="f_calcula_ifranq()" style="cursor:pointer" 
                                    alt="<axis:alt f="axissin010" c="IFRANQ" lit=""/>" title="<axis:alt f="axissin010" c="IFRANQ" lit=""/>"
                                    id="CALIFRANQ" name="CALIFRANQ"/>  
                                </axis:ocultar>  
                                </td>
                            </axis:ocultar>  
                            
                            <axis:ocultar f="axissin010" c="CALCULO" dejarHueco="false"> 
                                <td class="campocaja">
                                    <select name="CALCULO" id ="CALCULO" size="1" class="campowidthselect campo campotexto" <axis:atr f="axissin010" c="CALCULO" a="isInputText=false&obligatorio=true"/> style="width:100px" title="<axis:alt f="axissin010" c="CALCULO_ALT" lit="9001023"/>"
                                        onchange="f_cargarDep()"  >
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin010" c="LITNULL" lit="1000348"/> - </option>
                                        <c:forEach var="lstcalculo" items="${listValores.tipo_manual}">
                                            <option value="${lstcalculo.CATRIBU}"
                                            <c:if test="${lstcalculo.CATRIBU == __formdata.CALCULO}"> selected </c:if>>
                                                 ${lstcalculo.TATRIBU}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar> 
                            
                            <axis:ocultar f="axissin010" c="IRESERVA" dejarHueco="false">                         
                                <td class="campocaja">
                                    <input type="text" name="IRESERVA" id="IRESERVA" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IRESERVA}"/>" 
                                    class="campowidthinput campo campotexto" style="width:90%"
                                    onChange = "javascript:f_calculoma(this);"
                                    <axis:atr f="axissin010" c="IRESERVA" a="formato=decimal&modificable=true&obligatorio=true"/> 
                                    title="<axis:alt f="axissin010" c="IRESERVA_ALT" lit="9001156"/>" />
                                     
                                </td>
                            </axis:ocultar>   
                        </tr>
                        <tr>
                        	<axis:ocultar f="axissin010" c="CTIPGAS" dejarHueco="false">                         
                        		<td id="td_CTIPGAS" class="titulocaja">
                            	<div id="literal_tipgas" ><b id="label_CTIPGAS"><axis:alt f="axissin010" c="CTIPGAS_LIT" lit="9902296"/></b><!-- Tipo gasto --></div>
                        		</td>
                        	</axis:ocultar>
                                
                                <axis:ocultar f="axissin010" c="IRESERVAACT" dejarHueco="false">                         
                                <td id="td_IRESERVAACT" class="titulocaja">
                                    <div id="literal_IRESERVAACT" ><b id="label_IRESERVAACT"><axis:alt f="axissin010" c="IRESERVAACT_LIT" lit="9909280"/></b><!-- Imp. actual reserva --></div>
                                </td>
                        	</axis:ocultar>
                                
                                <axis:ocultar f="axissin010" c="IVARRES" dejarHueco="false">                         
                        	<td id="td_IVARRES" class="titulocaja">
                                    <div id="literal_IVARRES" ><b id="label_IVARRES"><axis:alt f="axissin010" c="IVARRES_LIT" lit="9909281"/></b><!-- Variación en la reserva --></div>
                        	</td>
                        	</axis:ocultar>
                        	 <c:if test="${__formdata.CMONRES !='COP'}"> 
                        	<axis:ocultar f="axissin010" c="IVARRESPES" dejarHueco="false">                         
                        	<td id="td_IVARRESPES" class="titulocaja">
                                    <div id="literal_IVARRESPES" ><b id="label_IVARRESPES"><axis:alt f="axissin010" c="IVARRESPES_LIT" lit="89907075"/></b><!-- Variación en la reserva --></div>
                        	</td>
                        	</axis:ocultar>
                        	</c:if>
                                <axis:ocultar f="axissin010" c="CSOLIDARIDAD" dejarHueco="false">                         
                        	<td id="td_CSOLIDARIDAD" class="titulocaja">
                                    <div id="literal_CSOLIDARIDAD" ><b id="label_CSOLIDARIDAD"><axis:alt f="axissin010" c="CSOLIDARIDAD_LIT" lit="9910049"/></b><!-- Sin solidaridad --></div>
                        	</td>
                        	</axis:ocultar>
                        </tr>
                        <tr>
                        	<axis:ocultar f="axissin010" c="CTIPGAS" dejarHueco="false">                         
			                        <td id="td_CTIPGAS" class="campocaja">
			                            <select id="CTIPGAS" name="CTIPGAS" title="<axis:alt f="axissin010" c="CTIPGAS_ALT" lit="9902296"/>" <axis:atr f="axissin010" c="CTIPGAS" a="isInputText=false&obligatorio=false"/> size="1" class="campowidthselect campo campotexto">
			                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin010" c="LITNULL" lit="1000348"/> - </option>
			                                <c:forEach var="lstgasto" items="${listValores.tipo_gasto}">
			                                    <option value="${lstgasto.CATRIBU}"
			                                    <c:if test="${lstgasto.CATRIBU == __formdata.CTIPGAS}"> selected </c:if>>
			                                         ${lstgasto.TATRIBU}
			                                    </option>
			                                </c:forEach>
			                            </select>
			                        </td>    
                        	</axis:ocultar>
                                
                            <axis:ocultar f="axissin010" c="IRESERVAACT" dejarHueco="false">                         
                                <td class="campocaja">
                                    <input type="text" name="IRESERVAACT" id="IRESERVAACT" value="<fmt:formatNumber  value="${__formdata.IRESERVAACT}"/>" 
                                    class="campowidthinput campo campotexto" style="width:90%"
                                    <axis:atr f="axissin010" c="IRESERVAACT" a="formato=decimal&modificable=false"/> 
                                    title="<axis:alt f="axissin010" c="IRESERVAACT_ALT" lit="9909280"/>" />                                     
                                </td>
                            </axis:ocultar>                            
                            
                            <axis:ocultar f="axissin010" c="IVARRES" dejarHueco="false">                         
                                <td class="campocaja">
                                    <input type="text" name="IVARRES" id="IVARRES" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IVARRES}"/>" 
                                    class="campowidthinput campo campotexto" style="width:90%"
                                    onChange = "javascript:f_calculovarres(this);"
                                    <axis:atr f="axissin010" c="IVARRES" a="modificable=true&obligatorio=true"/> 
                                    title="<axis:alt f="axissin010" c="IVARRES_ALT" lit="9909281"/>" />
                                     
                                </td>
                            </axis:ocultar>   
                             <c:if test="${__formdata.CMONRES !='COP'}"> 
                             
                             <axis:ocultar f="axissin010" c="IVARRESPES" dejarHueco="false">                         
                                <td class="campocaja">
                                    <input type="text" name="IVARRESPES" id="IVARRESPES" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IVARRESPES}"/>" 
                                    class="campowidthinput campo campotexto" style="width:90%"
                                    onChange = "javascript:f_calculopes(this);"
                                    <axis:atr f="axissin010" c="IVARRESPES" /> 
                                    title="<axis:alt f="axissin010" c="IVARRESPES_ALT" lit="89907075"/>" />
                                     
                                </td>
                            </axis:ocultar> 
                            </c:if>  
                            
                            <axis:visible f="axissin010" c="CSOLIDARIDAD" >
                                             <td class="campocaja">
                                                <div class="dspIcons">
                                                
                                                            <input 
                                                                   type="checkbox" 
                                                                   <axis:atr f="axissin010" c="CSOLIDARIDAD" />
                                                                   id="CSOLIDARIDAD"
                                                                   name="CSOLIDARIDAD"
                                                                   value="${__formdata.CSOLIDARIDAD}"  <c:if test="${__formdata.CSOLIDARIDAD == 1}"> checked="checked"</c:if>/>
                                                 
                                                </div> 
                                             </td>    
                           </axis:visible> 
                        </tr>
                        <tr>
                             <axis:visible f="axissin010" c="ICAPRIE">
                                <td class="titulocaja">
                                   <b id="label_ICAPRIE"><axis:alt f="axissin010" c="ICAPRIE_LIT" lit="9001157"/></b><!-- Capital en Riesgo -->
                                </td>
                            </axis:visible>                            
                            <axis:visible f="axissin010" c="IPENALI">
                                <td class="titulocaja">
                                    <b id="label_IPENALI"><axis:alt f="axissin010" c="IPENALI_LIT" lit="9001158"/></b><!-- Importe Penalización -->
                                </td>
                            </axis:visible>                            
                            <axis:visible c="FRESINI" f="axissin010">                                                   
                                <td class="titulocaja">
                                    <b id="label_FRESINI"><axis:alt f="axissin010" c="FRESINI_LIT" lit="100890"/></b><!-- F.Inicio -->
                                </td>
                            </axis:visible>                            
                            <axis:visible c="FRESFIN" f="axissin010">                                                    
                                <td class="titulocaja">
                                     <b id="label_FRESFIN"><axis:alt f="axissin010" c="FRESFIN_LIT" lit="9001159"/></b><!-- F.Fin -->
                                </td>
                            </axis:visible>                              
                            <axis:ocultar c="DIAS" f="axissin010" dejarHueco="false">                                                    
                                <td class="titulocaja">
                                     <b id="label_DIAS"><axis:alt f="axissin010" c="DIAS_LIT" lit="9900972"/></b><!-- F.Fin -->
                                </td>
                            </axis:ocultar>
                            <axis:ocultar c="NDIASBAJA" f="axissin010" dejarHueco="false">                                                    
                                <td class="titulocaja">
                                     <b id="label_NDIASBAJA"><axis:alt f="axissin010" c="NDIASBAJA_LIT" lit="9900972"/></b><!-- F.Fin -->
                                </td>
                            </axis:ocultar> 
                            <axis:visible c="IPREREC" f="axissin010">                                                    
                                <td class="titulocaja">
                                     <b id="label_IPREREC"><axis:alt f="axissin010" c="IPREREC_LIT" lit="9900853"/></b><!-- Imp. previsión recobro -->
                                </td>
                            </axis:visible> 
                    </tr>

                    <tr>
                        <axis:visible f="axissin010" c="ICAPRIE">
                            <td class="campocaja">
                                 <input type="text" id="ICAPRIE" name="ICAPRIE" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.ICAPRIE}"/>" class="campowidthinput campo campotexto" style="width:60%"
                                 <axis:atr f="axissin010" c="ICAPRIE" a="modificable=true&obligatorio=true&formato=decimal"/> onChange ="javascript:f_formatear(this);" 
                                  title="<axis:alt f="axissin010" c="ICAPRIE_ALT" lit="9001157"/>" />
                            </td>
                        </axis:visible>
                        <axis:visible f="axissin010" c="IPENALI">
                            <td class="campocaja">
                                <input type="text" id="IPENALI" name="IPENALI" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IPENALI}"/>" class="campowidthinput campo campotexto" style="width:60%"
                                <axis:atr f="axissin010" c="IPENALI" a="modificable=true&obligatorio=true&formato=decimal"/> onChange ="javascript:f_formatear(this);" 
                                 title="<axis:alt f="axissin010" c="IPENALI_LIT" lit="9001158"/>" />
                                
                                <axis:visible f="axissin010" c="CALIPENALI">
                                 <img border="0" src="images/calculadora.gif" onclick="f_calcula_ipenali()" style="cursor:pointer" 
                                    alt="<axis:alt f="axisage003" c="IPENALI" lit=""/>" title="<axis:alt f="axisage003" c="IPENALI" lit=""/>"
                                    id="CALIPENALI" name="CALIPENALI"/>  
                                </axis:visible>        
                                
                            </td>
                        </axis:visible>
                        <!-- F.Inicio -->
                        <axis:visible f="axissin010" c="FRESINI">
                            <td class="campocaja">                        
                                <input type="text" class="campowidthinput campo campotexto" size="15" onblur="javascript:f_actData(this)" 
                                name="FRESINI" id="FRESINI" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata['FRESINI']}"/>"
                                style="width:70%;" <axis:atr f="axissin010" c="FRESINI" a="formato=fecha&obligatorio=true&modificable=true"/>
                                title="<axis:alt f="axissin010" c="FRESINI_ALT" lit="100890"/>"/>
                                <a  style="vertical-align:middle;"><img id="icon_FRESINI" alt="<axis:alt f="axissin010" c="FRESINI_ALT" lit="100890"/>" title="<axis:alt f="axissin010" c="FRESINI_ALT" lit="100890"/>" src="images/calendar.gif"/></a>
                            </td>                        
                        </axis:visible>                                              
                        <%--value="<fmt:formatDate value='${__formdata.FRESINI}' pattern='dd/MM/yyyy'/>"--%>                         
                        
                        <!-- F.Fin -->
                        <axis:visible f="axissin010" c="FRESFIN">
                            <td class="campocaja">
                                <input style="width:70%;" type="text" class="campowidthinput campo campotexto" id="FRESFIN" name="FRESFIN" size="15" onblur="javascript:f_actData(this);f_calcula_dias(1);"  title="<axis:alt f="axissin010" c="FRESFIN_ALT" lit="9001159"/>" 
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata['FRESFIN']}"/>" <axis:atr f="axissin010" c="FRESFIN" a="modificable=true&obligatorio=true&formato=fecha"/> 
                                />
                                <a style="vertical-align:middle;"><img id="icon_FRESFIN" alt="<axis:alt f="axissin010" c="IC_FRESFIN_ALT" lit="9001159"/>" title="<axis:alt f="axissin010" c="IC_FRESFIN_ALT" lit="9001159"/>" src="images/calendar.gif"/></a>
                            </td>
                        </axis:visible> 
                        <axis:ocultar f="axissin010" c="DIAS" dejarHueco="false">
                            <td class="campocaja">
                                <input type="text" name="DIAS" id="DIAS" value="${__formdata.NDIASBAJA}" class="campowidthinput campo campotexto" style="width:40%" title="<axis:alt f="axissin010" c="DIAS_ALT" lit="9900972"/>" 
                                <axis:atr f="axissin010" c="DIAS" a="modificable=true&obligatorio=false&formato=decimal"/>                                
                                onchange="f_calcula_ffin()"/>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin010" c="NDIASBAJA" dejarHueco="false">
                            <td class="campocaja">
                                <input tabindex="40" type="text" name="NDIASBAJA" id="NDIASBAJA" value="${__formdata['NDIASBAJA']}" class="campowidthinput campo campotexto" style="width:20%"
                                    <axis:atr f="axissin010" c="NDIASBAJA" a="modificable=true&obligatorio=true&formato=decimal"/>
                                    />
                            </td>
                        </axis:ocultar>
                        <axis:visible f="axissin010" c="IPREREC">
                            <td class="campocaja">
                                <input type="text" name="IPREREC" id="IPREREC" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IPREREC}"/>" class="campowidthinput campo campotexto" style="width:90%"
                                <axis:atr f="axissin010" c="IPREREC" a="modificable=true&obligatorio=true&formato=decimal"/>  title="<axis:alt f="axissin010" c="IPREREC_ALT" lit="9900853"/>"/>
                            </td>
                        </axis:visible>
                    </tr>
                </table>               
            </td>
        </tr>
    </table>
    <c:import url="../include/botonera_nt.jsp">
    	  <c:param name="f">axissin010</c:param>
        <c:param name="__botones">cancelar,9001312,aceptar</c:param>
    </c:import>
    </form>
    
    <c:import url="../include/mensajes.jsp" />
    
    <script type="text/javascript">       
        Calendar.setup({
            inputField     :    "FRESINI",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FRESINI",  
            singleClick    :    true,
            firstDay       :    1
        });
    
        Calendar.setup({
            inputField     :    "FRESFIN",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FRESFIN",  
            singleClick    :    true,
            firstDay       :    1
        });
    </script>
</body>
</html>
