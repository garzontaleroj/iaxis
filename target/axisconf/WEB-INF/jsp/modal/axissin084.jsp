
<%--
/**
*  Fichero: axissin084.jsp
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
    <title><axis:alt f="axissin084" c="TIT1" lit="9000615"/> <axis:alt f="axissin084" c="TIT2" lit="109479"/>/<axis:alt f="axissin084" c="TIT3" lit="9000897"/> </title>
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
    function darFormatovalor(IRESERVA) {
    	f_calculopes(IRESERVA);
        objDom.setValorPorId("IRESERVA",(objNumero.formateaNumeroCero(IRESERVA, true)).split(',')[0]); 
    }
    /*INI IAXIS-14364 EAD 2020-10-05*/
    function f_calculopes(value){
    	
    	VALOR = value;
        var CMONRESORI = 'COP';
        param = '';
        if (VALOR != null ) {
            var CMONRES = objDom.getValorPorId("CMONRES");
            param = param +'&CMONRES='+CMONRES;   
            param = param +'&CMONRESORI='+CMONRESORI;    
            param = param +'&VALOR='+VALOR;  
            
            objAjax.invokeAsyncCGI("modal_axissin010.do", callbackAjax_Cal_Impor_Pes, "operation=ajax_cal_impor_pes"+param, this, objJsMessages.jslit_cargando);
         } 
        
    }
    function callbackAjax_Cal_Impor_Pes (ajaxResponseText) {
        try{ 
              var doc = objAjax.domParse(ajaxResponseText);
              
               if (!objAppMensajes.existenErroresEnAplicacion(doc)) {   
                  var VALORCONVERTIDO = objUtiles.hayValorElementoXml(doc.getElementsByTagName("PVALORCONVERTIDO")[0])  ?
                                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("PVALORCONVERTIDO"), 0, 0) +" " : "";
                    
                   var str = VALORCONVERTIDO; 
                    var VALORCONVRES = str.replace(".",",");
                 } 
                 f_formatearconNeg(VALORCONVRES);
                 objDom.setValorPorId("IVARRES",VALORCONVRES);
        } catch(e){
             if (isDebugAjaxEnabled == "true")
                 alert (e.name + " " + e.message);
        }
     }
    /*FIN IAXIS-14364 EAD 2020-10-05*/
        function f_onload() { 
            f_cargar_propiedades_pantalla();
            f_carga_dependencias();
            f_ocultar_campos();
            
            
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
                 parent.f_aceptar_axissin084(document.miForm.NSINIES,'','');
                 </c:otherwise>
                 </c:choose>
            }
        			
			
            <c:if test="${ (__formdata.FRESINI != null || __formdata.VFRESINI != null)  && __formdata.ESBAJA == 1}" >
                document.miForm.FRESINI.value = "<fmt:formatDate value='${__formdata.VFRESINI}' pattern='dd/MM/yyyy' />";				
				objDom.setDisabledPorId("FRESINI",true);
                objDom.setVisibilidadPorId("icon_FRESINI","hidden");
            </c:if>

			
         
            
						
            <c:if test="${__formdata.MODO == 'EDITAR'}">
                
                objDom.setDisabledPorId("GARANTIA",true);
                
				
            </c:if>
            
            <c:if test="${__formdata.MODO == 'VARIARRES'}">
                objDom.setVisibilidadPorId("but_9001312", 'hidden');
             
                objDom.setDisabledPorId("GARANTIA", true);
             
                //objDom.setDisabledPorId("IRESERVA", true);
               
                <c:if test="${__formdata.GARANTIA != null && __formdata.TCAPITAL == null}">
                
                	f_cargar_franquicia();
                	
             	</c:if>
            </c:if>
            
            <c:if test="${__formdata.MODO != 'VARIARRES'}">
                objDom.setVisibilidadPorId("but_9001312", 'hidden');
               // objDom.setDisabledPorId("IRESERVA", true);
            </c:if>
			
			
			
			
         
            
           
           
           
            var IRESERVA = 0;
            if (IRESERVA<0){
                IRESERVA = 0;
            }
          
            
            revisarEstilos();

           
        }
		
		
        
       
        
        function f_cargarDep(){
            f_cargar_propiedades_pantalla();
          
        }
        
        function f_but_aceptar(){
           //f_guardar()
           /*INI IAXIS-14364 EAD 2020-09-24*/
           f_calculopes(document.miForm.IRESERVA.value);
           if(validar_datos()){  
        	   
           }else{
        	   return false;
           }
           /*FIN IAXIS-14364 EAD 2020-09-24*/
           
           if(  true ){
           f_guardar_old();
           }else{
              alert("<axis:alt f="axissin084" c="SELECCIONE" lit="101679"/> "+" de "+"<axis:alt f="axissin084" c="SELECCIONE" lit="9001156"/>");  
           }
        }
        /*INI IAXIS-14364 EAD 2020-09-24*/
        function validar_datos(){        		
        	if(document.miForm.IVARRES.value==''||document.miForm.IVARRES.value.split(',')[0]*1<0||document.miForm.IRESERVA.value.replaceAll('.','')*1<=0||document.miForm.IRESERVA.value==''||document.miForm.TCAPITAL.value==''){
        		alert("Los valores deben ser mayores a 0.");
        		return false;
        	}
        	if(document.miForm.IVARRES.value.split(',')[0]*1>document.miForm.TCAPITAL.value.replaceAll('.','')*1){
        		alert("El Valor Pretendido no debe superar el Valor Asegurado.");
        		return false;		
        	}        	
        	return true;
        }
        /*FIN IAXIS-14364 EAD 2020-09-24*/
        
        function f_ocultar_campos(){
               
                    
            if(true){
                <c:if test="${__configform.axissin084__GARANTIA__obligatorio==true}">
                    document.miForm.GARANTIA.setAttribute("obligatorio","true");
                    document.miForm.GARANTIA.className="campowidthselect campo campotexto_ob";
                    
                    if ($("#CALIFRANQ").is(':hidden')){
                        
                    }
                </c:if>
                <c:if test="${__configform.axissin084__GARANTIA__obligatorio!=true}">
                    document.miForm.GARANTIA.setAttribute("obligatorio",false);
                    document.miForm.GARANTIA.className="campowidthselect campo campotexto";
                    if ($("#CALIFRANQ").is(':hidden')){
                       
                    }
                </c:if>
                
            }else{
                document.miForm.GARANTIA.setAttribute("obligatorio","true");
                document.miForm.GARANTIA.className="campowidthselect campo campotexto_ob";
                
                if ($("#CALIFRANQ").is(':hidden')){
                  
                }
            }
            revisarEstilos();
        }

        function f_but_cancelar(){
            parent.f_cerrar_modal("axissin084");
        }
        
        function f_cargar_franquicia(){
                
          var numero = objDom.getValorPorId("IPREREC");
          var numero_formateado = objNumero.cambiarSeparadorMilesPorDecimales(numero);
          if (isNaN(numero_formateado)) {
              alert('<axis:alt f="axissin084" c="IPREREC_LIT" lit="9900853"/>:<axis:alt f="axissin084" c="IPREREC_AVISO" lit="1000422"/>');
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
              objAjax.invokeAsyncCGI("modal_axissin084.do", callbackajaxFranquiciaGar, qs, this);
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
                    
                    objAjax.invokeAsyncCGI("modal_axissin084.do", callbackajaxGarantias, qs, this);
                    
		    document.miForm.VGARANTIA.value = "";
                    document.miForm.TCAPITAL.value = "";
                    
        }
        
        
        function f_guardar(){
                   
                    var qs="operation=ajax_guardar";
                    qs=qs+"&CESTTRA="+document.miForm.CESTTRA.value;
                    qs=qs+"&GARANTIA="+document.miForm.GARANTIA.value;
                    qs=qs+"&TFRANQ="+0;
                    qs=qs+"&ICAPRIE="+0;
                    qs=qs+"&IPENALI="+document.miForm.IPENALI.value;
                    
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
                   
                    objAjax.invokeAsyncCGI("modal_axissin084.do", callbackajaxGuardar, qs, this);
        }
        
        
        function f_guardar_old(){        
            revisarEstilos();  
            var q;
             if (objValidador.validaEntrada()) {
                if ($("#IRESERVA").is(':disabled')){
                    q="IRESERVA="+$("#IRESERVA").val();
                }
                if ($("#IMPUESTOS_SAP").val()==1){
                    
                    var PRETENC = $("#PRETENC_SAP_NPORCENT").val();
                    q+="&PRETENC="+PRETENC;
                    var PIVA = $("#PIVA_SAP_NPORCENT").val();
                    q+="&PIVA="+PIVA;
                    var PRETEIVA = $("#PRETEIVA_SAP_NPORCENT").val();
                    q+="&PRETEIVA="+PRETEIVA;
                    var PRETEICA = $("#PRETEICA_SAP_NPORCENT").val();
                    q+="&PRETEICA="+PRETEICA;
                }
                objUtiles.ejecutarFormulario ("modal_axissin084.do?"+q, "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
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
                   
                 }
                 
                 //document.miForm.IRESERVA.value='';
                 
                 
                 if(objUtiles.existeObjetoXml(doc.getElementsByTagName("CAPITAL")[0])){
                     var CAPITAL = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CAPITAL"), 0, 0);
                     document.miForm.TCAPITAL.value=objNumero.cambiarSeparadorMilesPorDecimales(CAPITAL);                                    
                 }
                 if(objUtiles.existeObjetoXml(doc.getElementsByTagName("P_RESERVA")[0])){
                     var P_RESERVA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("P_RESERVA"), 0, 0);
                     
                 }
                       
                }
               f_cargar_propiedades_pantalla();
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
          
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
        
       
        
       
        
        
        
    
        
      
        
       function f_but_9001312(){
            document.miForm.CALCULO.value = 1;
            //f_calcularImporte(1);
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

     
        
        
        
        function f_calcula_ifranq(){
            
            objUtiles.ejecutarFormulario ("modal_axissin084.do", "calculifranq", document.miForm, "_self", objJsMessages.jslit_cargando);  
        }
                
        function f_valida_IPREREC(){  
          var numero = document.miForm.IPREREC.value;
          if (isNaN(numero)) {
                alert('<axis:alt f="axissin084" c="IPREREC_LIT" lit="9900853"/>:<axis:alt f="axissin084" c="IPREREC_AVISO" lit="1000422"/>');
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
            if (!objUtiles.estaVacio(thiss) ){               
                var SPERSON = objUtiles.utilSplit(thiss.value, "/")[0]; // SPERSON
                var CTIPDES = objUtiles.utilSplit(thiss.value, "/")[1]; // CTIPDES
                var SPROFES = objUtiles.utilSplit(thiss.value, "/")[2]; // SPROFES
                
                objDom.setValorPorId("SPERSON", SPERSON);
                                  
                objDom.setValorPorId("CTIPDES", CTIPDES);
                
                objDom.setValorPorId("SPROFES", SPROFES);
            }else{
            }
            f_cargar_propiedades_pantalla();    
            objUtiles.ejecutarFormulario ("modal_axissin084.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);    
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
        
        
    </script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
    <c:param name="titulo"><axis:alt f="axissin084" c="titulo_axissin011" lit="9000896" /></c:param>
    <c:param name="nid" value="axissin011" />
    </c:import>
    <form name="miForm" action="modal_axissin084.do" method="POST">
    <input type="hidden" id="operation" name="operation" value="guardar" />
    <input type="hidden" id="NSINIES" name="NSINIES" value="${__formdata.NSINIES}"/>
    <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
    <input type="hidden" id="NMOVIMI" name="NMOVIMI" value="${__formdata.NMOVIMI}"/>
    <input type="hidden" id="SPRODUC" name="SPRODUC" value="${__formdata.SPRODUC}"/>
    <input type="hidden" id="NTRAMIT" name="NTRAMIT" value="${__formdata.NTRAMIT}"/>
    <input type="hidden" id="subpantalla" name="subpantalla" value="tramitaciones"/>
    <input type="hidden" id="seccion" name="seccion" value="tramitaciones_amparos"/>
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
    <axis:visible f="axissin084" c="CTIPCOA"> 
    <input type="hidden" name="CTIPCOA" id="CTIPCOA" value="<%=request.getSession().getAttribute("CTIPCOA")%>"
    <axis:atr f="axissin084" c="CTIPCOA" a="modificable=false"/>/>
    </axis:visible>
    <c:set var="linea_trami">
        ${__formdata.indexTramitacio}
    </c:set>
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt f="axissin084" c="TIT_PANTALLA" lit="1000196"/></c:param>
        <c:param name="formulario"><axis:alt f="axissin084" c="TIT_PANTALLA" lit="1000196"/></c:param>
        <c:param name="form">axissin084</c:param>
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
                     <axis:ocultar f="axissin084" c="NSINIES" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin084" c="NSINIES_LIT" lit="101298"/></b><!-- Numero de Siniestro-->
                            </td>
                       </axis:ocultar>    
                       <axis:ocultar f="axissin084" c="TTIPTRA" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin084" c="TTIPTRA_LIT" lit="9001028"/></b><!-- Tipus tramitacio -->
                            </td>
                       </axis:ocultar>    
                       <axis:ocultar f="axissin084" c="TTRAMIT" dejarHueco="false"> 
                           <td class="titulocaja">
                                <b><axis:alt f="axissin084" c="TTRAMIT_LIT" lit="100588"/></b><!-- Tipus dany  -->
                            </td>         
                        </axis:ocultar>    
                        <axis:ocultar f="axissin084" c="TTCAUSIN" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin084" c="TTCAUSIN_LIT" lit="9000901"/></b><!-- Tipus dany  -->
                            </td>
                        </axis:ocultar>    
                        <axis:ocultar f="axissin084" c="CINFORM" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin084" c="CINFORM_LIT" lit="9000905"/></b><!-- Tramitación informativa -->                            
                            </td>          
                        </axis:ocultar>    
                    </tr>
                    <tr>
                         <axis:ocultar f="axissin084" c="NSNIES" dejarHueco="false"> 
                     <td class="campocaja">
                           <input type="text" name="NSINIES_O" id="NSINIES_O"  class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin009" c="NSINIES" a="modificable=false"/> />
                            
                        </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin084" c="TTIPTRA" dejarHueco="false"> 
                            <td class="campocaja">
                             <input type="text" name="TTIPTRA" id="TTIPTRA" value="${sessionScope.tramitaciones_min[linea_trami].TTIPTRA}" class="campodisabled campo campotexto" style="width:90%" title="<axis:alt f="axissin084" c="TTIPTRA_ALT" lit="9001028"/>"
                                <axis:atr f="axissin084" c="TTIPTRA" a="modificable=false"/> />                                
                            </td>
                        </axis:ocultar>    
                        <axis:ocultar f="axissin084" c="TTRAMIT" dejarHueco="false"> 
                            <td class="campocaja">
                             <input type="text" id="TTRAMIT" name="TTRAMIT" value="${sessionScope.tramitaciones_min[linea_trami].TTRAMIT}" class="campodisabled campo campotexto" style="width:90%" title="<axis:alt f="axissin084" c="TTRAMIT_ALT" lit="100588"/>"
                                <axis:atr f="axissin084" c="TTRAMIT" a="modificable=false"/> />                                
                            </td>                        
                        </axis:ocultar>    
                        <axis:ocultar f="axissin084" c="TTCAUSIN" dejarHueco="false"> 
                            <td class="campocaja">
                                <input type="text" id="TTCAUSIN" name="TTCAUSIN" value="${sessionScope.tramitaciones_min[linea_trami].TTCAUSIN}" class="campodisabled campo campotexto" style="width:90%" title="<axis:alt f="axissin084" c="TTCAUSIN_ALT" lit="9000901"/>"
                                <axis:atr f="axissin084" c="TTCAUSIN" a="modificable=false"/> />
                            </td>
                        </axis:ocultar>    
                        <axis:ocultar f="axissin084" c="CINFORM" dejarHueco="false"> 
                            <td class="campocaja" align="left">
                                <input type="checkbox" disabled  id="CINFORM" name="CINFORM" <axis:atr f="axissin084" c="CINFORM" a="modificable=false"/> value="${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.CINFORM}" title="<axis:alt f="axissin084" c="CINFORM_ALT" lit="9000905"/>"
                                <c:if test="${sessionScope.tramitaciones_min[linea_trami].CINFORM == '1'}">checked</c:if> >
                            </td>                        
                        </axis:ocultar>    
                    </tr>
                    <tr>
                        <axis:ocultar f="axissin084" c="TESTTRA" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin084" c="TESTTRA_LIT" lit="100587"/></b><!-- Estado -->
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin084" c="TSUBTRA" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin084" c="TSUBTRA_LIT" lit="9000852"/></b><!--Subestado -->
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin084" c="TUNITRA" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin084" c="TUNITRA_LIT" lit="9000900"/></b><!-- Unidad tramitacion -->
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin084" c="TTRAMITAD" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin084" c="TTRAMITAD_LIT" lit="9910018"/></b><!-- Tramitador -->
                            </td>
                         </axis:ocultar>   
                        <td class="titulocaja">
                            
                        </td>
                    </tr>
                    <tr>
                        <axis:ocultar f="axissin084" c="TESTTRA" dejarHueco="false"> 
                            <td class="campocaja">
                                <input type="text" name="TESTTRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TESTTRA}" class="campodisabled campo campotexto" style="width:90%" title="<axis:alt f="axissin084" c="TESTTRA_ALT" lit="100587"/>"
                                <axis:atr f="axissin084" c="TESTTRA" a="modificable=false"/> />
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin084" c="TSUBTRA" dejarHueco="false"> 
                            <td class="campocaja">
                                <input type="text" name="TSUBTRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TSUBTRA}" class="campodisabled campo campotexto" style="width:90%" title="<axis:alt f="axissin084" c="TSUBTRA_ALT" lit="9000852"/>"
                                <axis:atr f="axissin084" c="TSUBTRA" a="modificable=false"/> />                        
                            </td>                          
                        </axis:ocultar>
                        <axis:ocultar f="axissin084" c="TUNITRA" dejarHueco="false"> 
                            <td class="campocaja">
                                <input type="text" name="TUNITRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TUNITRA}" class="campodisabled campo campotexto" style="width:90%" title="<axis:alt f="axissin084" c="TUNITRA_ALT" lit="9000900"/>"
                                <axis:atr f="axissin084" c="TUNITRA" a="modificable=false"/> />
                            </td>
                        </axis:ocultar>    
                        <axis:ocultar f="axissin084" c="TTRAMITAD" dejarHueco="false"> 
                            <td class="campocaja">
                               <input type="text" name="TTRAMITAD" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TTRAMITAD}" class="campodisabled campo campotexto" style="width:90%" title="<axis:alt f="axissin084" c="TTRAMITAD_ALT" lit="9910018"/>"
                                <axis:atr f="axissin084" c="TTRAMITAD" a="modificable=false"/> />
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
                        <axis:visible f="axissin084" c="CESTTRA">
                        <td class="titulocaja">
                            <b>Tipo <axis:alt f="axissin084" c="CESTTRA_LIT" lit="110994"/></b><!-- Tipo reserva -->
                        </td>
                        </axis:visible>
                         <axis:visible f="axissin084" c="CMONRES" >
                            <td class="titulocaja" id="labe_CMONRES">
                                <b id="label_CMONRES"><axis:alt f="axissin084" c="CMONRES" lit="108645" /></b>
                            </td>
                         </axis:visible>
                        <axis:ocultar f="axissin084" c="GARANTIA" dejarHueco="false"> 
                            <td class="titulocaja" >
                                <div id="literal_gar" ><b><axis:alt f="axissin084" c="GARANTIA_LIT" lit="9902924"/></b><!-- Garantia --></div>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin084" c="IVARRES" dejarHueco="false"><!--  IAXIS-14364 EAD 2020-10-05 -->                          
                        	<td id="td_IVARRES" class="titulocaja">
                                    <div id="literal_IVARRES" ><b id="label_IVARRES"><axis:alt f="axissin084" c="IVARRES_LIT" lit="9903367"/></b><!-- Variación en la reserva --></div>
                        	</td>
                        	</axis:ocultar>
                        <axis:ocultar f="axissin084" c="TCAPITAL" dejarHueco="false"> 
                            <td class="titulocaja">
                                <div id="literal_capi" ><b><axis:alt f="axissin084" c="TCAPITAL_LIT" lit="9903367"/> COP</b><!-- Capital --></div>
                            </td>  
                        </axis:ocultar>
                       
                       
                        
                    </tr>
              
                    <tr>
                        <!-- Tipo reserva -->
                        
                        <axis:ocultar f="axissin084" c="GARANTIA" dejarHueco="false"> 
                                <td class="campocaja">
                                    <select name="GARANTIA" id ="GARANTIA" size="1" onchange="javascript:f_cargar_franquicia();" <axis:atr f="axissin084" c="GARANTIA" a="isInputText=false"/> class="campowidthselect campo campotexto" style="width:200px" title="<axis:alt f="axissin084" c="GARANTIA_ALT" lit="110994"/>">
                                        <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axissin084" c="LITNULL" lit="1000348"/> - </option>
                                        <c:forEach var="lstreserva" items="${__formdata.lista_garantias}">
                                            <option value="${lstreserva.CGARANT}"
                                            <c:if test="${lstreserva.CGARANT == __formdata.GARANTIA}"> selected </c:if>>
                                                ${lstreserva.TGARANT}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>   
							
					<!-- IAXIS-4131 20/12/2019-->
                        <axis:ocultar f="axissin084" c="CMONRES" >
                            <td class="campocaja">
                                <select name = "CMONRES" id ="CMONRES" size="1" 
                                    class="campowidthselect campo campotexto" <axis:atr f="axissin084" c="CMONRES" a="isInputText=false&modificable=false"/>>&nbsp;
                                     <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axissin084" c="SELEC" lit="1000348"/> - </option>                                                                                                   
                                    <c:forEach items="${listValores.lista_monedas}" var="monedaRes">
                                        <option value = "${monedaRes.CMONINT}" <c:if test="${monedaRes.CMONINT  == __formdata.CMONRES}">selected</c:if>>${monedaRes.TMONEDA}</option>
                                           
                                    </c:forEach>
                                </select>
                            </td>
                        </axis:ocultar>
                        <!-- IAXIS-4131 20/12/2019-->
                                                                                  
                            <axis:ocultar f="axissin084" c="TCAPITAL" dejarHueco="false"> 
                                <td class="campocaja">
                                     <input type="text" name="TCAPITAL" id ="TCAPITAL" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.TCAPITAL}"/>" class="campowidthinput campo campotexto" style="width:90%" title="<axis:alt f="axissin084" c="TCAPITAL_ALT" lit="110994"/>"
                                     <axis:atr f="axissin084" c="TCAPITAL" a="modificable=false&obligatorio=false&formato=decimal"/> />
                                </td>
                            </axis:ocultar> 
                       
                              <axis:ocultar f="axissin084" c="IVARRES" dejarHueco="false"><!--  IAXIS-14364 EAD 2020-10-05 -->                         
                                <td class="campocaja">
                                    <input type="text" name="IVARRES" id="IVARRES" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value=""/>" 
                                    class="campowidthinput campo campotexto" style="width:90%"
                                    
                                    <axis:atr f="axissin084" c="IVARRES" a="modificable=false&obligatorio=false"/> 
                                    title="<axis:alt f="axissin084" c="IVARRES_ALT" lit="9909281"/>" />
                                     
                                </td>
                            </axis:ocultar> 
                            
                            <axis:ocultar f="axissin084" c="IRESERVA" dejarHueco="false"> 
                                <td class="campocaja">
                                     <input type="text" onChange = "darFormatovalor(this.value)" name="IRESERVA" id ="IRESERVA" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IRESERVA}"/>" class="campowidthinput campo campotexto" style="width:90%" title="<axis:alt f="axissin084" c="IRESERVA_ALT" lit="9903367"/>"
                                     <axis:atr f="axissin084" c="IRESERVA" a="obligatorio=false&formato=decimal"/> />
                                </td>
                            </axis:ocultar> 
                            
                        </tr>
                        
                     
                    
                </table>               
            </td>
        </tr>
    </table>
    <c:import url="../include/botonera_nt.jsp">
    	  <c:param name="f">axissin084</c:param>
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
