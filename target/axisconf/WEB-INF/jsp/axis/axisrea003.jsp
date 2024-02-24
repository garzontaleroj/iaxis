<%/* Revision:# VWfDuZ7ENRPqU+KqR1iH6w== # */%>
<%/**
*  Fichero: axisrea003.jsp
*  Pantalla Introudcción Contrato Reaseguro
*  @author <a href = "mailto:icanada@csi-ti.com">Iván Cañada</a>  
*  Fecha: 02/10/2009
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
        <title><axis:alt f="axisrea003" c="LIT_NOMBRE_PANTALLA" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>             
        <c:import url="../include/carga_framework_js.jsp" />
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
        
  
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {  
            	
            	// INI - AABG - 18-02-2020 - IAXIS 12910 - Error al guardar capacidad y prioridad
            	var cap = objDom.getValorPorId('ICAPACI');
            	if(cap != null && cap != ""){
            		var trans = objValidador.valorFormateadoCampoNumerico(cap, true, true);
                	objDom.setValorPorId('ICAPACI',trans);
            	}            	
            	
            	var cap = objDom.getValorPorId('ISUBLIMITE');
            	if(cap != null && cap != ""){
            		var trans = objValidador.valorFormateadoCampoNumerico(cap, true, true);
                	objDom.setValorPorId('ISUBLIMITE',trans);
            	}
            	var prior = objDom.getValorPorId('IPRIOXL');
            	if(prior != null && prior != ""){
            		var transprior = objValidador.valorFormateadoCampoNumerico(prior, true, true);
                	objDom.setValorPorId('IPRIOXL',transprior);
            	}            	
            	// FIN - AABG - 18-02-2020 - IAXIS 12910 - Error al guardar capacidad y prioridad
            	
               
               f_cargar_propiedades_pantalla();             
               var SCONTRA_MOD = objDom.getValorPorId("SCONTRA_MOD");
               
            // INI - AABG - 18-02-2020 - IAXIS 12910 - Se coloca atributos por jquery para bloquear o no campos           
          	var EDITABLE = '${__formdata.EDITABLE}';
          	if(EDITABLE == '0'){
          		$( "#TDESCRIPCION" ).prop( "disabled", true );
          		$( "#CRAMO" ).prop( "disabled", true );
          		$( "#CVIDAGA" ).prop( "disabled", true );
          	}else{
          		$( "#TDESCRIPCION" ).prop( "disabled", false );
          		$( "#CRAMO" ).prop( "disabled", false );
          		$( "#CVIDAGA" ).prop( "disabled", false );
          	}
            // FIN - AABG - 18-02-2020 - IAXIS 12910 - Se coloca atributos por jquery para bloquear o no campos 
              
              //Como el select está hardcodeado, ponemos el valor del cdevento por jquery
                 var CDEVENTO = '${__formdata.CDEVENTO}';

                 if(!objUtiles.estaVacio(CDEVENTO)){
                    $('#CDEVENTO option[value='+CDEVENTO+']').attr('selected',true);

                 }
              
              
               if ( !objUtiles.estaVacio(SCONTRA_MOD)) {
                f_disable_campos(true);                   
                objDom.setValorPorId("NVERSIO",objDom.getValorPorId("NVERSIO2"));
               }               
            
              
               objEstilos.toggleDisplay('detalleVers', document.getElementById("detalleVers_parent"));
               objEstilos.toggleDisplay('tramos', document.getElementById('tramos_parent'));   
               f_actualitza_ctiprea(); 
               
               var ITRAMOS = objDom.getValorPorId("indexTramos");      
              
               if ( !objUtiles.estaVacio(ITRAMOS)) {
                objEstilos.toggleDisplay('cuadroces', document.getElementById('cuadroces_parent'));               
               }        
               
               var abrirRea004 = '${__formdata.abrir_axisrea004}';
               
               if(abrirRea004==1){
               
                    if(document.getElementById('ALTA_TRAMO_PROP').disabled){
                        f_abrir_axisrea004();
                    }else{
                        f_abrir_axisrea004_prop();
                    }
                    $('#abrir_axisrea004').val('');
               }
               
               <c:if test="${requestScope.grabarr=='0'}" >
               //alert("antes");
                     objDom.setDisabledPorId("but_aceptar",true);
               </c:if>
               
            }   
            
         
           function f_disable_campos(estado)
           {
              document.miForm.CRAMO.readOnly = estado;
              document.miForm.CMODALI.readOnly = estado;
              document.miForm.CTIPSEG.readOnly = estado;
              document.miForm.CCOLECT.readOnly = estado;              
              document.miForm.CGARANT.readOnly = estado;
              document.miForm.CACTIVI.readOnly = estado;
           }
            
           function f_but_salir() {               
                objUtiles.ejecutarFormulario("flujodetrabajo.do?forigen=axisrea003", "cancelar", document.miForm, "_self");
            }
            
           function f_but_cancelar() {
                
                var SCONTRA_MOD = $('#SCONTRA_MOD').val();
                var NEW_SCONTRA = $('#NEW_SCONTRA').val();
                var fomularioAceptado = $('#fomularioAceptado').val();
                if( objUtiles.estaVacio(SCONTRA_MOD) && !objUtiles.estaVacio(NEW_SCONTRA) && objUtiles.estaVacio(fomularioAceptado)){
                    //Si SCONTRA_MOD esta vacío, es que estamos añadiendo algo nuevo
                    //Si NEW_SCONTRA contiene algo, es que hemos grabado algo
                    //Si no hemos hecho aceptar
                     objAjax.invokeAsyncCGI("axis_axisrea003.do", callbackAjaxCancelar, "operation=delete_contrato&NEW_SCONTRA=" + NEW_SCONTRA, this, objJsMessages.jslit_cargando, false);
                }else{
           
                    <c:if test="${requestScope.grabarr!='0'}" >
                     document.miForm.SCONTRA.value=null;
                     objUtiles.ejecutarFormulario("axis_axisrea002.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
                    </c:if>  
                    <c:if test="${requestScope.grabarr=='0'}" >
                     //document.miForm.SCONTRA.value=null;
                     objUtiles.ejecutarFormulario("axis_axisrea002.do?SCONTRA_ON="+document.miForm.SCONTRA.value, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                    </c:if>  
                }                 
            }
            
            function callbackAjaxCancelar(){
                 objUtiles.ejecutarFormulario("axis_axisrea002.do?", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
            
           function f_but_aceptar(){       
           
                if (confirm("<axis:alt f='axisrea003' c='ALT_ALERT_CVALID' lit='9900796'/>"))
                {   
                    objDom.setValorPorId("cvalid", 1);
                    
                    var fomularioAceptado = $('#fomularioAceptado').val();
                    if( objUtiles.estaVacio(fomularioAceptado)){
                        $('#fomularioAceptado').val(1);
                    }
                     $('#abrir_axisrea004').val(0);                 
                     objUtiles.ejecutarFormulario("axis_axisrea003.do", "guardar_contrato", document.miForm, "_self", objJsMessages.jslit_cargando);  
                    
                }
                else
                {    
                    objDom.setValorPorId("cvalid", 0);
                }
                          
            }
            
            function f_but_aceptar_axisrea004(){       
           
                if (confirm("<axis:alt f='axisrea003' c='ALT_ALERT_CVALID' lit='9900796'/>"))
                {
                    objDom.setValorPorId("cvalid", 1);
                }
                else
                {
                    objDom.setValorPorId("cvalid", 0);
                }
                
                 objUtiles.ejecutarFormulario("axis_axisrea003.do", "guardar_contrato", document.miForm, "_self", objJsMessages.jslit_cargando);            
            }
            
           function f_actualitza_fecha(CAMPO){               
               objDom.setValorPorId(CAMPO,f_formatdate(document.getElementById(CAMPO)));               
           }            
           
          
          function f_formatdate(entrada){                
                var jDate = new JsFecha();

                if (!jDate.validaFecha(entrada.value)){
                    if(entrada.value.length>0){
                        entrada.value=jDate.formateaFecha(entrada.value);            
                        if(jDate.validaFecha(entrada.value)){
                            entrada.value=jDate.formateaFecha(entrada.value);
                        }else{
                            entrada = '';//alert('Formato fecha incorrecto para el campo '+ title);
                        }
                    }
                }
                return entrada.value;
            }            
                 
            function f_actualiza_number(CAMPON){                               
                //objDom.setValorPorId(CAMPON, objValidador.valorFormateadoCampoNumerico(objDom.getValorPorId(CAMPON), true, true));                  
                objDom.setValorPorId(CAMPON,objNumero.formateaNumeroCero(objDom.getValorPorId(CAMPON),true));
            } 
            
         // INI - AABG - 18-02-2020 - IAXIS 12910 - Error al guardar capacidad y prioridad
            function f_actualiza_number_no_decimal(CAMPON){
                objDom.setValorPorId(CAMPON,objNumero.formateaNumero(objDom.getValorPorId(CAMPON),true));
            } 
         // FIN - AABG - 18-02-2020 - IAXIS 12910 - Error al guardar capacidad y prioridad
            
            function f_valida_number_pcedido(PCEDIDO){
            	if( !(/^\d{9}$/.test(PCEDIDO)) ) { 
            		alert("<axis:alt f="axisrea003" c="AVISO1" lit="9904621" />");
	    			document.miForm.PCEDIDO.value = ""; 
            	}else if($("#PCEDIDO").val() < 0 || $("#PCEDIDO").val() > 100){
		    			alert("<axis:alt f="axisrea003" c="AVISO1" lit="9904621" />");
		    			document.miForm.PCEDIDO.value = "";
	            }else{
	                	objDom.setValorPorId(CAMPON,objNumero.formateaNumeroCero(objDom.getValorPorId(PCEDIDO),true));
	            }	
            }
            
            function f_actualitza_ctiprea()
            {         
                f_cargar_propiedades_pantalla();             
                var CTIPREA = objDom.getValorPorId("CTIPREA");              
               
                if (!objUtiles.estaVacio(CTIPREA))
                {                   
                    if(CTIPREA==2)
                    {
                         //objDom.setVisibilidadPorId("label_CTIPREA1","visible");
                         //objDom.setVisibilidadPorId("IRETENC","visible");
                         //objDom.setDisplayPorId("label_CTIPREA1","block");
                         //objDom.setDisplayPorId("IRETENC","block");
                    }
                    else
                    {
                        //objDom.setVisibilidadPorId("label_CTIPREA1","hidden");
                        //objDom.setVisibilidadPorId("IRETENC","hidden");
                        //objDom.setDisplayPorId("label_CTIPREA1","none");
                        //objDom.setDisplayPorId("IRETENC","none");
                    }
                    
                     if(CTIPREA==3)
                    {
                         //objDom.setVisibilidadPorId("label_CTIPREA2","visible");
                         //objDom.setVisibilidadPorId("IPRIOXL","visible");
                         //objDom.setDisplayPorId("label_CTIPREA2","block");
                         //objDom.setDisplayPorId("IPRIOXL","block");
                    }
                    else
                    {
                       //objDom.setVisibilidadPorId("label_CTIPREA2","hidden");
                        //objDom.setVisibilidadPorId("IPRIOXL","hidden");
                        //objDom.setDisplayPorId("label_CTIPREA2","none");
                        //objDom.setDisplayPorId("IPRIOXL","none");
                    }
                    
                    
                }
                else
                {
                    //objDom.setVisibilidadPorId("label_CTIPREA1","hidden");
                    //objDom.setVisibilidadPorId("IRETENC","hidden");
                    //objDom.setVisibilidadPorId("label_CTIPREA2","hidden");
                    //objDom.setVisibilidadPorId("IPRIOXL","hidden");
                    //objDom.setDisplayPorId("label_CTIPREA2","none");
                    //objDom.setDisplayPorId("IPRIOXL","none");
                    //objDom.setDisplayPorId("label_CTIPREA1","none");
                    //objDom.setDisplayPorId("IRETENC","none");
                }
            
                          
            }
            
            /****************************************************************************************/
            /********************************** MODAL AXPLANTILLAJSP_MODAL **************************/
            /****************************************************************************************/
            var ptho=null;
            function f_abrir_axisrea001() {                
                objUtiles.abrirModal("axisrea001", "src", "modal_axisrea001.do?operation=form");  
            }
            
            function f_cerrar_axisrea001() {
                objUtiles.cerrarModal('axisrea001');                
            }   
            
            function f_cerrar_modal(modal) {            
                objUtiles.cerrarModal(modal);
            }

            
            
            function f_aceptar_axisrea001(pSCONTRA) {
               document.miForm.SCONTRA.value = pSCONTRA;
               document.miForm.NVERSIO.value = null;
               f_cerrar_axisrea001();           
               objUtiles.ejecutarFormulario("axis_axisrea002.do?obtenerDatos=0", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
           
            
            function f_seleccionar_version() {
                objUtiles.ejecutarFormulario("axis_axisrea003.do?SCONTRA="+document.miForm.SCONTRA.value+"&NVERSIO="+objUtiles.f_GuardaCasillasChecked("radioNVERSIO")+"&obtenerDatos=1", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_seleccionar_tramo() {
                objUtiles.ejecutarFormulario("axis_axisrea003.do?SCONTRA="+document.miForm.SCONTRA.value+"&NVERSIO="+objUtiles.f_GuardaCasillasChecked("radioNVERSIO")+"&CTRAMO="+objUtiles.f_GuardaCasillasChecked("radioCTRAMO")+"&obtenerDatos=1", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_abrir_axisrea004(){           
                var NVER = objDom.getValorPorId("NVERSIO");
                var SCON = objDom.getValorPorId("SCONTRA_MOD");
                if(objUtiles.estaVacio(SCON)){
                    SCON = objDom.getValorPorId("NEW_SCONTRA");
                }

                 var deletedTramos = objDom.getValorPorId("deletedTramos");
                param = "&H_MODIF="+0+"&NVERSIO="+NVER+"&SCONTRA="+SCON+"&deletedTramos="+deletedTramos;

                if(objUtiles.estaVacio(SCON)){
                        //Guardaremos el contrato antes de añadir los tramos

                        if(confirm("<axis:alt f='axisrea003' c='ALT_ALERT_CVALID' lit='9906260'/>")){
                            f_but_aceptar_axisrea004();
                        }
                }else{                
                    objUtiles.abrirModal("axisrea004", "src", "modal_axisrea004.do?operation=form"+param);  
                }

            }
            
             function f_abrir_axisrea004_prop(){           
                var NVER = objDom.getValorPorId("NVERSIO");
                var SCON = objDom.getValorPorId("SCONTRA_MOD");
                var SCON = objDom.getValorPorId("SCONTRA_MOD");
                var CTIPREA = objDom.getValorPorId("CTIPREA");//BUG CONF-250  Fecha (02/09/2016) - HRE - Contratos Q1, Q2, Q3
                
                if(objUtiles.estaVacio(SCON)){
                    SCON = objDom.getValorPorId("NEW_SCONTRA");
                }
                
                 var deletedTramos = objDom.getValorPorId("deletedTramos");
                 
                param = "&H_MODIF="+0+"&NVERSIO="+NVER+"&SCONTRA="+SCON+"&deletedTramos="+deletedTramos+"&CTIPREA="+CTIPREA;//BUG CONF-250  Fecha (02/09/2016) - HRE - Contratos Q1, Q2, Q3
               
               if(objUtiles.estaVacio(SCON)){
                        //Guardaremos el contrato antes de añadir los tramos
                        if(confirm("<axis:alt f='axisrea003' c='ALT_ALERT_CVALID' lit='9906260'/>")){
                             f_but_aceptar_axisrea004();
                        }
                }else{  
                    objUtiles.abrirModal("axisrea004prop", "src", "modal_axisrea004prop.do?operation=form"+param);  
                }

            }
                
            function f_modif_axisrea004(CTRAMO, NORDEN, CFREBOR, ITOTTRA, PLOCAL, NCTRXL, NVERXL,IDAA,ILAA,CTPRIMAXL,IPRIMAFIJAXL,IPRIMAESTIMADA,CAPLICTASAXL,CTIPTASAXL,PTASAXL,CTRAMOTASAXL,IDEPXL,PCTPDXL,IMINXL,PCTMINXL,IPMD,CFREPMD,PCTPB,NANYOSLOSS,IBONOREC,CREPOS,IMPCONTADO,PCTCONTADO,IMPAVISO,CLOSSCORRIDOR,CCAPPEDRATIO,ICOSTOFIJO,PCOMISINTERM)
            {    
                var NVER = objDom.getValorPorId("NVERSIO");
                var SCON = objDom.getValorPorId("SCONTRA_MOD");
                  if(objUtiles.estaVacio(SCON)){
                    SCON = objDom.getValorPorId("NEW_SCONTRA");
                }
                var deletedTramos = objDom.getValorPorId("deletedTramos");
                param = "&H_MODIF="+1+"&CTRAMO="+CTRAMO+"&NORDEN="+NORDEN +"&CFREBOR="+CFREBOR+"&ITOTTRA="+ITOTTRA+"&PLOCAL="+PLOCAL+"&SCTRXL="+NCTRXL+"&NVERXL="+NVERXL+"&SCONTRA="+SCON+"&NVERSIO="+NVER;
              
                param = param +"&IDAA="+IDAA+"&ILAA="+ILAA+"&CTPRIMAXL="+CTPRIMAXL+"&IPRIMAFIJAXL="+IPRIMAFIJAXL+"&IPRIMAESTIMADA="+IPRIMAESTIMADA+"&CAPLICTASAXL="+CAPLICTASAXL+"&CTIPTASAXL="+CTIPTASAXL+"&PTASAXL="+PTASAXL+"&CTRAMOTASAXL="+CTRAMOTASAXL+"&PCTPDXL="+PCTPDXL;
          
                param = param +"&IMINXL="+IMINXL+"&PCTMINXL="+PCTMINXL+"&IPMD="+IPMD+"&CFREPMD="+CFREPMD+"&PCTPB="+PCTPB+"&NANYOSLOSS="+NANYOSLOSS+"&IBONOREC="+IBONOREC+"&CREPOS="+CREPOS+"&IMPCONTADO="+IMPCONTADO+"&PCTCONTADO="+PCTCONTADO;
                
                param = param +"&IMPAVISO="+IMPAVISO+"&CLOSSCORRIDOR="+CLOSSCORRIDOR+"&CCAPPEDRATIO="+CCAPPEDRATIO+"&deletedTramos="+deletedTramos+"&ICOSTOFIJO="+ICOSTOFIJO+"&PCOMISINTERM="+PCOMISINTERM;      

                objUtiles.abrirModal("axisrea004", "src", "modal_axisrea004.do?operation=form"+param); 
            }    
          
            function f_modif_axisrea004_prop(CTRAMO, NORDEN, CTIPREA, CFREBOR, ITOTTRA, PLOCAL, NCTRXL, NVERXL,IPRIMAESTIMADA,ILAA,PCTGASTOS,PTASAAJUSTE,PCTPB,IMPAVISO,IMPCONTADO,PCTCONTADO,CLOSSCORRIDOR,CCAPPEDRATIO,ICAPCOASEG,NANYOSLOSS,IBONOREC,ICOSTOFIJO,PCOMISINTERM)//BUG CONF-250  Fecha (02/09/2016) - HRE - Contratos Q1, Q2, Q·
            {
                var NVER = objDom.getValorPorId("NVERSIO");
                var SCON = objDom.getValorPorId("SCONTRA_MOD");
                if(objUtiles.estaVacio(SCON)){
                    SCON = objDom.getValorPorId("NEW_SCONTRA");
                }
                var deletedTramos = objDom.getValorPorId("deletedTramos");
                
                param = "&H_MODIF="+1+"&CTRAMO="+CTRAMO+"&NORDEN="+NORDEN +"&CTIPREA="+CTIPREA +"&CFREBOR="+CFREBOR+"&ITOTTRA="+ITOTTRA+"&PLOCAL="+PLOCAL+"&SCTRXL="+NCTRXL+"&NVERXL="+NVERXL+"&SCONTRA="+SCON+"&NVERSIO="+NVER;//BUG CONF-250  Fecha (02/09/2016) - HRE - Contratos Q1, Q2, Q·
                param = param +"&IPRIMAESTIMADA="+IPRIMAESTIMADA+"&ILAA="+ILAA+"&PCTGASTOS="+PCTGASTOS+"&PTASAAJUSTE="+PTASAAJUSTE+"&PCTPB="+PCTPB+"&IMPAVISO="+IMPAVISO+"&IMPCONTADO="+IMPCONTADO+"&PCTCONTADO="+PCTCONTADO;
                param = param +"&CLOSSCORRIDOR="+CLOSSCORRIDOR+"&CCAPPEDRATIO="+CCAPPEDRATIO+"&ICAPCOASEG="+ICAPCOASEG+"&NANYOSLOSS="+NANYOSLOSS+"&IBONOREC="+IBONOREC+"&deletedTramos="+deletedTramos+"&ICOSTOFIJO="+ICOSTOFIJO+"&PCOMISINTERM="+PCOMISINTERM;      
          
                objUtiles.abrirModal("axisrea004prop", "src", "modal_axisrea004prop.do?operation=form"+param); 
            }    
          

            function f_abrir_axisrea005(CTRAMO){  
                objDom.setValorPorId("CTRAMOSelected", CTRAMO);
                var NVER = objDom.getValorPorId("NVERSIO");   
                var SCON = objDom.getValorPorId("SCONTRA_MOD");
                if(objUtiles.estaVacio(SCON)){
                    SCON = objDom.getValorPorId("NEW_SCONTRA");
                }
               var deletedCuadroces = objDom.getValorPorId("deletedCuadroces");
                param = "&CTRAMO="+CTRAMO+"&H_MODIF="+0+"&NVERSIO="+NVER+"&SCONTRA="+SCON+"&deletedCuadroces="+deletedCuadroces; ;          
           
                objUtiles.abrirModal("axisrea005", "src", "modal_axisrea005.do?operation=form"+param);  
            }
            
            function f_modif_axisrea005(CTRAMO, CCOMPANI, PCESION, CCOMREA, ICOMFIJ, CCORRED, PRESERV, IRESERV, CRESREF, ISCONTA,PINTRES,CTIPCOMIS,PCTCOMIS,CTRAMOCOMISION,PCTGASTOSREA)
            {
               var deletedCuadroces = objDom.getValorPorId("deletedCuadroces");
                var NVER = objDom.getValorPorId("NVERSIO");
                var SCON = objDom.getValorPorId("SCONTRA_MOD");
               if(objUtiles.estaVacio(SCON)){
                    SCON = objDom.getValorPorId("NEW_SCONTRA");
                }
                
                param = "&H_MODIF="+1+"&CTRAMO="+CTRAMO+"&CCOMPANI="+CCOMPANI+"&PCESION="+PCESION+"&CCOMREA="+CCOMREA+"&ICOMFIJ="+ICOMFIJ+"&CCORRED="+CCORRED+"&PRESERV="+PRESERV+"&IRESERV="+IRESERV +"&CRESREF="+CRESREF+"&ISCONTA="+ISCONTA+"&SCONTRA="+SCON+"&NVERSIO="+NVER+"&PINTRES="+PINTRES+"&CTIPCOMIS="+CTIPCOMIS+"&PCTCOMIS="+PCTCOMIS+"&CTRAMOCOMISION="+CTRAMOCOMISION+"&PCTGASTOSREA="+PCTGASTOSREA+"&deletedCuadroces="+deletedCuadroces;      

                objUtiles.abrirModal("axisrea005", "src", "modal_axisrea005.do?operation=form"+param);  
            }    
        
            
            function f_aceptar_axisrea004(deletedTramos){
                f_cerrar_modal("axisrea004");
                $('#deletedTramos').val(deletedTramos);
                objUtiles.ejecutarFormulario("axis_axisrea003.do", "ActualitzarDisplays", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
            
            function f_aceptar_axisrea004_prop(deletedTramos){
        
                f_cerrar_modal("axisrea004prop");
                 $('#deletedTramos').val(deletedTramos);
                objUtiles.ejecutarFormulario("axis_axisrea003.do", "ActualitzarDisplays", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
            
            function f_aceptar_axisrea005(deletedCuadroces){
                $('#deletedCuadroces').val(deletedCuadroces)
                f_cerrar_modal("axisrea005");               
                objUtiles.ejecutarFormulario("axis_axisrea003.do", "ActualitzarDisplays", document.miForm, "_self", objJsMessages.jslit_cargando);               
            }
            
            function actualizarCTRAMO(indexTramos, CTRAMO){
                objDom.setValorPorId("CTRAMOSelected", CTRAMO);                
                objDom.setValorPorId("indexTramos", indexTramos);
                objUtiles.ejecutarFormulario("axis_axisrea003.do", "ActualitzarDisplays", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
            
            function f_borrar_tramo(CTRAMO)
            {             
                if (confirm("<axis:alt f='axisrea003' c='ALT_ALERT_CTRAMO' lit='1000167'/>"))
                {
                    objDom.setValorPorId("CTRAMOSelected", CTRAMO);
                   
                   //Ahora no eliminamos, simplemente filtramos
                   var deletedTramos = $('#deletedTramos');
                   if(objUtiles.estaVacio(deletedTramos.val())){
                        deletedTramos.val(CTRAMO);
                   }else{
                        deletedTramos.val(deletedTramos.val()+','+CTRAMO);
                   }
                   objUtiles.ejecutarFormulario("axis_axisrea003.do", "ActualitzarDisplays", document.miForm, "_self", objJsMessages.jslit_cargando); 
                }
            }
            
            function f_borrar_cuadroces(CTRAMO,CCOMPA)
            {       
                if (confirm("<axis:alt f='axisrea003' c='ALT_ALERT_CCOMPA' lit='1000167'/>"))
                {
                    objDom.setValorPorId("CTRAMOSelected", CTRAMO);
                    objDom.setValorPorId("CCOMPAselected", CCOMPA);
                   
                    var deletedCuadroces = $('#deletedCuadroces');
                    if(objUtiles.estaVacio(deletedCuadroces.val())){
                        deletedCuadroces.val(CTRAMO+'-'+CCOMPA);
                   }else{
                        deletedCuadroces.val(deletedCuadroces.val()+','+CTRAMO+'-'+CCOMPA);
                   }
                   
                    objUtiles.ejecutarFormulario("axis_axisrea003.do", "ActualitzarDisplays", document.miForm, "_self", objJsMessages.jslit_cargando); 
                }
            }
         
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/
            
             function f_recarga_combo() {
                //alert("En recarga combos");
                var SCONTRAPROT = objDom.getValorPorId("SCONTRAPROT");
                               
                objAjax.invokeAsyncCGI("axis_axisrea003.do", callbackAjaxActualizarCombos, 
                "operation=actualizar_combos&SCONTRAPROT=" + SCONTRAPROT, this, objJsMessages.jslit_cargando, false);
                
           
            }        
            
        
            function callbackAjaxActualizarCombos(ajaxResponseText) {
            //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                //alert("A la vueltassss");
                try {            
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                         var combo = document.getElementById("NVERSIOPROT");
                            objDom.borrarOpcionesDeCombo(combo);
                            objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", combo, null);
                            
                           //alert("A la cccccccc");
                                var elementos = doc.getElementsByTagName("element");
                                var numElementos = elementos.length;
                                
                              
                                for (i = 0; i < numElementos; i++) {
                                //alert("Dentro del combo");
                                    var codigo = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("NVERSIO")[0]) ?
                                             objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("NVERSIO"), 0, 0) : "";
                                    var desc   = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("TCONTRA")[0]) ?
                                             objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TCONTRA"), 0, 0): "";
                                    //alert(codigo+" "+desc);
                                    objDom.addOpcionACombo(codigo, desc, document.miForm.NVERSIOPROT, i+1);
                                    //alert("despues del add");
                                }
                                
                                if (numElementos == 1) {
                                    // Seleccionar la única opción del combo y ejecutar
                                    // su llamada onchange para recuperar combos dependientes
                                    combo[0].selected = "1";
                                    //combo.onchange(); 
                                }
                         
                    }
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
            }    
           
            
       
            
            function recuperaCATRIBUyTATRIBU(elemento) {
                var CATRIBU;
                var TATRIBU;
                
                if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("NVERSIO")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("NVERSIO"), 0, 0);
                    TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TCONTRA"), 0, 0);                            
               
                }
            }
			
			//INI - EDBR - 11/06/2019 - IAXIS3338 - se agrega validacion para los campo de Retencion por poliza NRETPOL y Retencion por Cumulo NRETCUL
            function f_retencion_poliza(elemento){
            	
            	if (!/^([0-9])*$/.test(elemento.value)){
            	      alert("El campo Retencion por póliza debe ser numérico");
            		  elemento.value = "";
            	}
            	//alert("retencion poliza: valor =" + elemento.value);
            }            
			
 			function f_retencion_cumulo(elemento){            	
 				if (!/^([0-9])*$/.test(elemento.value)){
          	      alert("El campo Retencion por cúmulo debe ser numérico");
          		  elemento.value = "";
          		}	
            }
			//FIN - EDBR - 11/06/2019 - IAXIS3338 - se agrega validacion para los campo de Retencion por poliza  NRETPOL y Retencion por Cumulo NRETCUL
        </script>
    </head>

    <body  onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
 
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" id="operation" value=""/> 
            <input type="hidden" name="CTRAMOselected" id="CTRAMOselected" value="${__formdata.CTRAMOselected}"/>
            <input type="hidden" name="CCOMPAselected" id="CCOMPAselected" value="${__formdata.CCOMPAselected}"/>            
            <input type="hidden" name="grabarOK" id="grabarOK" value="${__formdata.grabarOK}"/>            
            <input type="hidden" name="indexTramos" id="indexTramos"  value="${__formdata.indexTramos}"/>
            <input type="hidden" name="cvalid" id="cvalid" value="${__formdata.cvalid}"/>
            <input type="hidden" name="SCONTRA_MOD" id="SCONTRA_MOD" value="${__formdata.SCONTRA_MOD}"/>
            <input type="hidden" name="SCONTRA" id="SCONTRA" value="${__formdata.SCONTRA}"/>
            <input type="hidden" name="NEW_SCONTRA" id="NEW_SCONTRA" value="${__formdata.NEW_SCONTRA}"/>
            <input type="hidden" name="NVERSIO_AUX" id="NVERSIO_AUX"  value="${__formdata.NVERSIO}"/>  
            <input type="hidden" name="NVERSIO2" id="NVERSIO2"  value="${__formdata.NVERSIO2}"/>              
            <input type="hidden" name="deletedTramos" id="deletedTramos"  value="${__formdata.deletedTramos}"/>
            <input type="hidden" name="deletedCuadroces" id="deletedCuadroces"  value="${__formdata.deletedCuadroces}"/>
            <input type="hidden" name="abrir_axisrea004" id="abrir_axisrea004"  value="${__formdata.abrir_axisrea004}"/>
            <input type="hidden" name="fomularioAceptado" id="fomularioAceptado"  value="${__formdata.fomularioAceptado}"/>
            
            <!-- Pantalla modal -->
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisrea001|<axis:alt f="axisrea003" c="LIT_MODAL_AXISREA001" lit="9000575" /></c:param>
            </c:import>
            
             <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisrea004|<axis:alt f="axisrea003" c="LIT_MODAL_AXISREA004" lit="9002223" /></c:param>
            </c:import>
            
             <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisrea004prop|<axis:alt f="axisrea003" c="LIT_MODAL_AXISREA004_PROP" lit="9002223" /></c:param>
            </c:import>
            
             <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisrea005|<axis:alt f="axisrea003" c="LIT_MODAL_AXISREA005" lit="9002228" /></c:param>
            </c:import>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisrea003" c="LIT_NOMBRE_FOMULARIO" lit="9002222" /></c:param>
                 <%--bug:26133 2013/02/19 amj 0026133: LCOL_A002- QT 504-515 - Dar nombre a pantallas--%>
                 <%--bug:26133 2013/03/26 amj nota: 141357 se cambia literal  9000576--%>
                 <c:param name="producto"><axis:alt f="axisrea003" c="PRODUCTO" lit="9905218"/></c:param>
                 
                <c:param name="form">axisrea003</c:param>
            </c:import>         
                      
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
      
              <tr>
                <td>
                  <div class="titulo">&nbsp;<axis:alt f="axisrea003" c="LIT_TIT_DATOS_GENERALES" lit="9001754" />&nbsp;<axis:alt f="axisrea003" c="LIT_TIT_DATOS_GENERALES_CONTRA" lit="104813" />&nbsp;
                    <img src="images/flecha.gif"/>                 
                   
                    <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisrea003" c="LIT_IMG_BUSCAR" lit="100002" />" onclick="f_abrir_axisrea001();" style="cursor:pointer"/>
                        
                  </div>
                  <!-- Detalle cabecera de contrato -->
                  <table class="seccion" >
                    <tr>
                      <td>
                        <!-- Campos detalle de cabecera de contrato _ Area 1 _ -->
                        <table class="area" align="center" >
                         <tr> <!-- Se establecen las columnas-->
                            <th style="width:2%;height:0px"></th>
                            <th style="width:2%;height:0px"></th>
                            <th style="width:2%;height:0px"></th>
                            <th style="width:2%;height:0px"></th>
                            <th style="width:2%;height:0px"></th>
                            <th style="width:2%;height:0px"></th>
                          </tr>
                          <tr> <!-- Area 1. Línea 1. Títulos de campos -->
                            <%--
                            <td class="titulocaja" ><!--NUM CONTRATO -->
                              <b><axis:alt f="axisrea003" c="LIT_NCONTRA" lit="9000536"/></b>
                            </td>--%>
                             <axis:ocultar f="axisrea003" c="CEMPRES" dejarHueco="false">                            
                            <td class="titulocaja" colspan="2" ><!--TEMPRES -->
                              <b><axis:alt f="axisrea003" c="LIT_CEMPRES" lit="101619"/></b>
                            </td>
                            </axis:ocultar>
                             <axis:ocultar f="axisrea003" c="CTIPREA" dejarHueco="false">
                            <td class="titulocaja" colspan="2" ><!--TTIPREA -->
                              <b><axis:alt f="axisrea003" c="LIT_CTIPREA" lit="9902261"/></b>
                            </td>                            
                            </axis:ocultar>
                            
                           
                          </tr>
                          <tr> <!-- Area 1. Línea 1. Valores de campos -->
                            <%-- <td class="campocaja"> 
                              <axis:visible f="axisrea002NOU" c="SCONTRA"> <!-- Linia 1. Columna 1. -->
                                <input type="text" class="campo campotexto" id="SCONTRA" name="SCONTRA" size="5" style="width:25%"
                                value="${sessionScope.OB_IAX_CODICONTRATO_REA.SCONTRA}" <axis:atr f="axisrea002" c="SCONTRA" a="modificable=false"/>/>
                              </axis:visible>    
                            </td>--%>
                            <c:choose>
                                <c:when test="${empty __formdata.SCONTRA_MOD}">
                                    <td class="campocaja" colspan="2" > <%-- TEMPRES --%>
                                      <axis:ocultar f="axisrea003" c="CEMPRES"> <!-- Linia 1. Columna 3. -->
                                        <!--input type="text" class="campo campotexto" id="CEMPRES" name="CEMPRES" style="width:10%"
                                        value="${sessionScope.OB_IAX_CODICONTRATO_REA.CEMPRES}" <axis:atr f="axisrea002" c="CEMPRES" a="modificable=false&obligatorio=true"/>/-->                                                               
                                        <select name="CEMPRES" id="CEMPRES" size="1" class="campowidthselect campo campotexto" obligatorio="true" style="width:62.5%;">
                                                <option value=""> - <axis:alt f="axisrea003" c="ALT_CEMPRES_SEL" lit="101619"/> - </option>
                                                <c:forEach var="element" items="${__formdata.listaEmpresas}">
                                                        <option value = "${element.CEMPRES}" 
                                                        <c:if test="${element.CEMPRES == __formdata.CEMPRES}"> selected </c:if> />
                                                                ${element.TEMPRES} 
                                                    </option>
                                                </c:forEach>
                                        </select>                                                             
                                      </axis:ocultar>     
                                    </td>
                                </c:when>    
                                <c:otherwise>
                                 <td class="campocaja" colspan="2" > 
                                    <axis:ocultar f="axisrea003" c="CEMPRES">
                                        <input type="text" class="campo campotexto" id="TEMPRES" name="TEMPRES" size="1" style="width:62.5%"
                                            value="${__formdata.TEMPRES}" <axis:atr f="axisrea003" c="TEMPRES" a="readOnly=true&obligatorio=true"/> />
                                    </axis:ocultar>   
                                  </td>
                                 <input type="hidden" name="CEMPRES"  value="${__formdata.CEMPRES}"/>                                      
                                </c:otherwise>
                            </c:choose>    
                            
 
                           
                           <c:choose>
                             <c:when test="${empty __formdata.SCONTRA_MOD}">
                                <td class="campocaja" colspan="2"> <%-- TTIPREA --%>
                                    <axis:ocultar f="axisrea003" c="CTIPREA"> <!-- Linia 1. Columna 2. -->
                                        <select name="CTIPREA" id="CTIPREA" size="1" class="campowidthselect campo campotexto" onchange="f_actualitza_ctiprea()" obligatorio="true" style="width:62.5%;">                               
                                        <option value=""> - <axis:alt f="axisrea003" c="ALT_CTIPREA_SEL" lit="1000616"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listaTipReaseg}">
                                                <option value = "${element.CATRIBU}" 
                                                <c:if test="${element.CATRIBU == __formdata.CTIPREA}"> selected </c:if> />
                                                               ${element.TATRIBU} 
                                                </option>
                                            </c:forEach>
                                        </select>     
                                    </axis:ocultar>    
                                </td>
                               </c:when>    
                               <c:otherwise>
                                 <td class="campocaja" colspan="2" >
                               
                                    <axis:ocultar f="axisrea003" c="CTIPREA">
                                        <input type="text" class="campo campotexto" id="TTIPREA" name="TTIPREA" size="1" style="width:62.5%"
                                            value="${__formdata.TTIPREA}" <axis:atr f="axisrea003" c="TTIPREA" a="readOnly=true&obligatorio=true"/> />
                                    </axis:ocultar>   
                                  </td>
                                 <input type="hidden" name="CTIPREA" id="CTIPREA"  value="${__formdata.CTIPREA}"/>                                      
                               </c:otherwise>
                            </c:choose>            
                                
                          </tr>   
                         
                          <tr>
                                <axis:ocultar f="axisrea003" c="CMONEDA" dejarHueco="false">                            
                                    <td class="titulocaja" colspan="2" ><!--CMONEDA -->
                                      <b><axis:alt f="axisrea003" c="LIT_CMONEDA" lit="108645"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea003" c="TDESCRIPCION" dejarHueco="false">
                                    <td class="titulocaja" colspan="3" ><!--TDESCRIPCION -->
                                      <b><axis:alt f="axisrea003" c="LIT_TDESCRIPCION" lit="100588"/></b>
                                    </td>                            
                                </axis:ocultar>
                         
                          </tr>
                          
                          <tr>
                          <%-- CMONEDA --%>
                            <c:choose>
                             <c:when test="${empty __formdata.SCONTRA_MOD}">
                                <td class="campocaja" colspan="2"> 
                                    <axis:ocultar f="axisrea003" c="CMONEDA"> <!-- Linia 1. Columna 2. -->
                                        <select name="CMONEDA" id="CMONEDA" size="1" class="campowidthselect campo campotexto" onchange="" obligatorio="true" style="width:62.5%;">                               
                                        <option value=""> - <axis:alt f="axisrea003" c="ALT_CMONEDA_SEL" lit="108645"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listaMonedas}">
                                                <option value = "${element.CMONEDA}" 
                                                <c:if test="${element.CMONEDA == __formdata.CMONEDA}"> selected </c:if> />
                                                               ${element.TMONEDA} 
                                                </option>
                                            </c:forEach>
                                        </select>     
                                    </axis:ocultar>    
                                </td>
                               </c:when>    
                               <c:otherwise>
                                 <td class="campocaja" colspan="2" >
                                    <axis:ocultar f="axisrea003" c="CMONEDA">
                                        <input type="text" class="campo campotexto" id="CMONEDA" name="CMONEDA" size="1" style="width:62.5%"
                                            value="${__formdata.CMONEDA}" <axis:atr f="axisrea003" c="CMONEDA" a="readOnly=true&obligatorio=true"/> />
                                    </axis:ocultar>   
                                  </td>
                                                             
                               </c:otherwise>
                            </c:choose>     
                            <%-- TDESCRIPCION --%>
                            
                             <td class="campocaja" colspan="3">
                              <axis:ocultar f="axisrea003" c="TDESCRIPCION"> 
                                <input type="text" class="campo campotexto" id="TDESCRIPCION" name="TDESCRIPCION" size="10" style="width:80%"
                                value="${__formdata.TDESCRIPCION}" <axis:atr f="axisrea003" c="TDESCRIPCION" a="modificable=true&obligatorio=true"/> />
                              </axis:ocultar>    
                            </td>
                         
                            
                          </tr>
                        
                           
                          <tr> <!-- Area 1. Línea 2. Valores de campos -->
                            <axis:ocultar f="axisrea003" c="CRAMO" dejarHueco="false"> 
                            <td class="titulocaja" colespan="20" ><!--CRAMO -->
                              <b><axis:alt f="axisrea003" c="LIT_CRAMO" lit="100784"/></b>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisrea003" c="CMODALI" dejarHueco="false"> 
                              <td class="titulocaja" colespan="10"  ><!--CMODALI -->
                              <b><axis:alt f="axisrea003" c="LIT_CMODALI" lit="100943"/></b>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisrea003" c="CTIPSEG" dejarHueco="false"> 
                              <td class="titulocaja" colespan="10"  ><!--CTIPSEG -->
                              <b><axis:alt f="axisrea003" c="LIT_CTIPSEG" lit="102098"/></b>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisrea003" c="CCOLECT" dejarHueco="false"> 
                              <td class="titulocaja" colespan="10"  ><!--CCOLECT -->
                              <b><axis:alt f="axisrea003" c="LIT_CCOLECT" lit="9001021"/></b>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisrea003" c="ACTIVIDAD" dejarHueco="false"> 
                            <td class="titulocaja" colespan="10"  ><!--ACTIVIDAD -->
                              <b><axis:alt f="axisrea003" c="LIT_ACTIVIDAD" lit="103481"/></b>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisrea003" c="GARANTIA" dejarHueco="false"> 
                            <td class="titulocaja" colespan="10"  ><!--GARANTIA -->
                              <b><axis:alt f="axisrea003" c="LIT_CGARANTIA" lit="100561"/></b>
                            </td>
                            </axis:ocultar>
                          </tr>
                                                 
                           <tr> <!-- Area 1. Línea 2. Valores de campos -->
                            <!-- INI - CJAD - 21/JUNIO2019 - IAXIS4427 - Cambio de producto a ramo -->  
                            <td class="campocaja" colespan="10"> <%-- CRAMO --%>
                              <axis:ocultar f="axisrea003" c="CRAMO"> <!-- Linia 2. Columna 1. -->
                                <!-- CRAMO -->
                                <select name="CRAMO" id="CRAMO" size="1" class="campowidthselect campo campotexto" obligatorio="true">
                                	<option value=""> - <axis:alt f="axisrea001" c="ALT_SRAMO" lit="100784" /> - </option>
                                    	<c:forEach var="element" items="${__formdata.listaRamos}">
                                        	<option value = "${element.CRAMO}" 
                                            	<c:if test="${element.CRAMO == __formdata.CRAMO}"> selected </c:if> />
                                                ${element.TRAMO} 
                                            </option>
                                        </c:forEach>
                                </select>
                                <!-- <input type="text" class="campo campotexto" id="CRAMO" name="CRAMO" size="10" style="width:30%"
                                value="${__formdata.CRAMO}" <axis:atr f="axisrea003" c="CRAMO" a="modificable=true&obligatorio=true"/> /> -->
                                <!-- TSPRODUC -->
                                <!--<input type="text" class="campo campotexto" id="TPRODUC" name="TPRODUC" size="5" style="width:70%"
                                value="${sessionScope.OB_IAX_CODICONTRATO_REA.TPRODUC}" <axis:atr f="axisrea002" c="TPRODUC" a="modificable=false"/>/>-->
                              </axis:ocultar>    
                            </td>
                         <!-- FIN - CJAD - 21/JUNIO2019 - IAXIS4427 - Cambio de producto a ramo --> 
                            <td class="campocaja" colespan="10" > <%--CMODALI --%>
				<axis:ocultar f="axisrea003" c="CMODALI"> <!--  Linia 2. Columna 2. -->
				<!-- CMODALI -->
                                <input type="text" class="campo campotexto" id="CMODALI" name="CMODALI" size="10" style="width:30%"
                                value="${__formdata.CMODALI}" <axis:atr f="axisrea003" c="CMODALI" a="modificable=true&obligatorio=false"/>/>							
				</axis:ocultar>
                            </td>                            
                            <td class="campocaja" colespan="10" > <%--CTIPSEG --%>
				<axis:ocultar f="axisrea003" c="CTIPSEG"> <!--  Linia 2. Columna 3. -->
				<!-- CTIPSEG -->
                                <input type="text" class="campo campotexto" id="CTIPSEG" name="CTIPSEG" size="10" style="width:30%"
                                value="${__formdata.CTIPSEG}" <axis:atr f="axisrea003" c="CTIPSEG" a="modificable=true&obligatorio=false"/>/>							
				</axis:ocultar>
                            </td>                            
                            <td class="campocaja" colespan="10" > <%--CCOLECT --%>
				<axis:ocultar f="axisrea003" c="CCOLECT"> <!--  Linia 2. Columna 4. -->
				<!-- CCOLECT -->
                                <input type="text" class="campo campotexto" id="CCOLECT" name="CCOLECT" size="10" style="width:30%"
                                value="${__formdata.CCOLECT}" <axis:atr f="axisrea003" c="CCOLECT" a="modificable=true&obligatorio=false"/>/>							
				</axis:ocultar>
                            </td>    
                            <td class="campocaja" colespan="10" > <%-- ACTIVIDAD --%>
                              <axis:ocultar f="axisrea003" c="CACTIVI"> <!-- Linia 2. Columna 2. -->                                
                                <%-- TACTIVI --%>
                                <input type="text" class="campo campotexto" id="CACTIVI" name="CACTIVI" style="width:80%"
                                value="${__formdata.CACTIVI}" <axis:atr f="axisrea003" c="CACTIVI" a="modificable=true"/>/>
                              </axis:ocultar>    
                            </td>
                            <td class="campocaja" colespan="10" > <%-- GARANTIA --%>
                              <axis:ocultar f="axisrea003" c="CGARANT"> <!-- Linia 2. Columna 3. -->                                
                                <%-- TGARANT --%>
                                <input type="text" class="campo campotexto" id="CGARANT" name="CGARANT" style="width:80%"
                                value="${__formdata.CGARANT}" <axis:atr f="axisrea003" c="CGARANT" a="modificable=true"/>/>
                              </axis:ocultar>    
                            </td>
                          </tr>    
                         
          
                          <!-- Tipos de cumulo -->
                          <tr> 
                            <axis:ocultar f="axisrea003" c="CTIPCUM">
                            <td class="titulocaja" colspan="2" ><!--CTIPCUM -->
                              <b><axis:alt f="axisrea003" c="LIT_CTIPCUM" lit="150965"/></b>
                            </td>
                            </axis:ocultar>   
                            <axis:ocultar f="axisrea003" c="SCONAGR">
                              <td class="titulocaja" colspan="2"  ><!--SCONAGR -->
                              <b><axis:alt f="axisrea003" c="LIT_SCONAGR" lit="180009"/></b>
                            </td>           
                            </axis:ocultar>   
                            
                             <axis:visible f="axisrea003" c="CDEVENTO" >
                                <td class="titulocaja" id="td_CDEVENTO">                   
                                   <b id="label_CDEVENTO"><axis:alt f="axisrea003" c="LIT_CDEVENTO" lit="9906253"/></b>
                                </td>
                             </axis:visible>  
                          </tr>
                          
                          <tr> <!-- Area 1. Línea 3. Valores de campos -->
                          
                          <c:choose>
                                <c:when test="${empty __formdata.SCONTRA_MOD}">
                                    <td class="campocaja" colspan="2"> <%-- CTIPCUM --%>
                                    <axis:ocultar f="axisrea003" c="CTIPCUM"> <!-- Linia 2. Columna 1. -->                                      
                                        <select name="CTIPCUM" id="CTIPCUM" size="1" class="campowidthselect campo campotexto" obligatorio="false" style="width:62.5%;">
                                        	<option value=""> - <axis:alt f="axisrea003" c="ALT_SCONTRAMOD" lit="150965"/> - </option>
                                            	<c:forEach var="element" items="${__formdata.ListaCumul}">
                                                	<option value = "${element.CATRIBU}" 
                                                    	<c:if test="${element.CATRIBU == __formdata.CTIPCUM}"> selected </c:if> />
                                                        	${element.TATRIBU} 
                                                        </option>
                                                </c:forEach>
                                        </select>  
                                    </axis:ocultar>    
                                    </td>   
                                </c:when>    
                                <c:otherwise>
                                 <td class="campocaja" colspan="2" >
                                    <axis:ocultar f="axisrea003" c="CTIPCUM">
                                        <input type="text" class="campo campotexto" id="TTIPCUM" name="TTIPCUM" size="1" style="width:62.5%"
                                            value="${__formdata.TTIPCUM}" <axis:atr f="axisrea003" c="TTIPCUM" a="readOnly=true&obligatorio=false"/> />
                                    </axis:ocultar>   
                                  </td>
                                 <input type="hidden" name="CTIPCUM"  value="${__formdata.CTIPCUM}"/>                                      
                               </c:otherwise>
                            </c:choose>                
                                    
                            <c:choose>
                                <c:when test="${empty __formdata.SCONTRA_MOD}">
                                       <td class="campocaja" colspan="1" id="td_CDEVENTO">
                                        <axis:ocultar f="axisrea003" c="CDEVENTO">                                       
                                            <select name="CDEVENTO" id="CDEVENTO" <axis:atr f="axisrea003" c="CDEVENTO" a="modificable=true"/> size="1" class="campowidthselect campo campotexto" obligatorio="false" style="width:62.5%;">
                                                <option value="0" selected>Por Riesgo</option>
                                                <option value="1">Por Evento</option>
                                            </select>  
                                      </axis:ocultar>    
                                      </td>
                                </c:when>
                                <c:otherwise>
                                      <td class="campocaja" colspan="2" >
                                        <axis:ocultar f="axisrea003" c="CDEVENTO">
                                            <input type="text" class="campo campotexto" id="TDEVENTO" name="TDEVENTO" size="1" style="width:62.5%"
                                                value="${__formdata.TDEVENTO}" <axis:atr f="axisrea003" c="TCONAGR" a="readOnly=true&obligatorio=false"/> />
                                        </axis:ocultar>   
                                      </td>
                                     <input type="hidden" name="CDEVENTO"  value="${__formdata.CDEVENTO}"/>
                                </c:otherwise>
                            </c:choose>
                           
                           <c:choose>
                                <c:when test="${empty __formdata.SCONTRA_MOD}">
                                    <td class="campocaja" colspan="2"> <%-- SCONAGR --%>
                                    <axis:ocultar f="axisrea003" c="SCONAGR"> <!-- Linia 2. Columna 1. -->                                      
                                        <select name="SCONAGR" id="SCONAGR" size="1" class="campowidthselect campo campotexto" obligatorio="false" style="width:62.5%;">
                                            <option value=""> - <axis:alt f="axisrea003" c="ALT_SCONTRAMOD_SEL" lit="180009"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listaAgrupa}">
                                            	<option value = "${element.SCONAGR}" 
                                            	<c:if test="${element.SCONAGR == __formdata.SCONAGR}"> selected </c:if> />
                                                	${element.TCONAGR} 
                                                </option>
                                            </c:forEach>
                                        </select>  
                                  </axis:ocultar>    
                                  </td>
                              </c:when>    
                              <c:otherwise>
                                 <td class="campocaja" colspan="2" >
                                    <axis:ocultar f="axisrea003" c="SCONAGR">
                                        <input type="text" class="campo campotexto" id="TCONAGR" name="TCONAGR" size="1" style="width:62.5%"
                                            value="${__formdata.TCONAGR}" <axis:atr f="axisrea003" c="TCONAGR" a="readOnly=true&obligatorio=false"/> />
                                    </axis:ocultar>   
                                  </td>
                                 <input type="hidden" name="SCONAGR"  value="${__formdata.SCONAGR}"/>                                      
                               </c:otherwise>
                            </c:choose>          
                           
                            </tr>                            
                         <!-- Fin Area 1. Línea 3. Valores de campos -->       
                       
                                  
                       <td>
                        <tr>
                          <table class="area" align="left">
                            <tr>
                            <td>
                                <div class="separador">&nbsp;</div>
                                <div class="detalleVers_parent"><img id="detalleVers_parent" name="detalleVers_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('detalleVers', this)" style="cursor:pointer"/>
                                <b><axis:alt f="axisrea003" c="LIT_TITULO_SECC_VERS" lit="9001146"/></b> 
                                <!--<c:if test="${! empty sessionScope.OB_IAX_CODICONTRATO_REA.SCONTRA}">
                                    : &nbsp;&nbsp; ${sessionScope.OB_IAX_CODICONTRATO_REA.SCONTRA}/${__formdata.OB_IAX_CONTRATO_REA.NVERSIO} &nbsp;&nbsp; ${sessionScope.OB_IAX_CODICONTRATO_REA.TTIPREA} &nbsp;&nbsp; <axis:alt f="axisrea003" c="SSS" lit="100883"/>:<fmt:formatDate value="${__formdata.OB_IAX_CONTRATO_REA.FCONINI}" pattern="dd/MM/yyyy"/> 
                                    <c:if test="${! empty __formdata.OB_IAX_CONTRATO_REA.FCONFIN}">&nbsp;&nbsp; <axis:alt f="axisrea003" c="HHH" lit="100885"/>:<fmt:formatDate value="${__formdata.OB_IAX_CONTRATO_REA.FCONFIN}" pattern="dd/MM/yyyy"/></c:if>
                                </c:if>-->
                                </div>
                                <hr class="titulo"/>
                             </td>   
                             </tr>
                            
                            <tr id="detalleVers_children" style="display:none">
                             <td>
                                <table class="area" align="left"> 
                                    <tr> <!-- Se establecen las 3 columnas dentro de la tabla -->
                                        <th style="width:33%;height:0px"></th>                                     
                                        <th style="width:33%;height:0px"></th>                                     
                                         <th style="width:33%;height:0px"></th>                                     
                                     </tr>
                                     <tr> <!-- Area 2. Línea 1. Títulos de campos -->
                                     <axis:ocultar f="axisrea003" c="NVERSIO">
                                      <td class="titulocaja" ><!--Num version -->
                                          <b><axis:alt f="axisrea003" c="LIT_NVERSIO1" lit="9000577"/></b>
                                      </td>
                                      </axis:ocultar>    
                                      <axis:ocultar f="axisrea003" c="FCONINI">
                                      <td class="titulocaja" ><!-- Fecha efecto  -->
                                        <b><axis:alt f="axisrea003" c="LIT_FCONINI" lit="100883"/></b>
                                      </td>
                                      </axis:ocultar>   
                                     <axis:ocultar f="axisrea003" c="FCONFIN">
	                                      <td class="titulocaja" > <!-- 	Fecha finalizacion -->
	                                         <b><axis:alt f="axisrea003" c="LIT_FCONFIN" lit="9001198"/></b>
	                                       </td> 
	                                 </axis:ocultar> 
                                     </tr> <!-- FIN Area 2. Línea 1. Títulos de campos -->
                                               
                                     <tr> <!-- Area 2. Línea 1. Valores de campos -->
                                        <td class="campocaja"> <!-- Area 2. Linea 1. Columna 1. Número de versión -->
                                            <axis:ocultar f="axisrea003" c="NVERSIO">
                                            <input type="text" class="campo campotexto" id="NVERSIO" name="NVERSIO" style="width:10%"
                                            value="1" <axis:atr f="axisrea003" c="NVERSIO" a="modificable=false"/>/>
                                            </axis:ocultar>    
                                        </td>
                                        <td class="campocaja"> <!-- Area 2. Linea 1. Columna 2. Fecha inicio versión ( Fecha efecto ) -->                                      
                                            <axis:ocultar f="axisrea003" c="FCONINI">
                                            <input type="text" onchange="f_actualitza_fecha('FCONINI')" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCONINI}"/>" name="FCONINI" id="FCONINI"  style="width:40%;"
                                            <axis:atr f="axisrea003" c="FCONINI" a="modificable=true&formato=fecha"/> title="<axis:alt f="axisrea003" c="ALT_FCONINI" lit="100883"/>" title="<axis:alt f="axisrea003" c="ALT_FCONINI_N" lit="100883"/>" <axis:atr f="axisrea003" c="FCONINI" a="modificable=true&obligatorio=true"/>  />
                                            <a style="vertical-align:middle;"><img id="popup_calendario_FCONINI" alt="<axis:alt f="axisrea003" c="ALT_FCONINI_B" lit="108341"/>" title="<axis:alt f="axisrea003" c="ALT_FCONINI_C" lit="100883" />" src="images/calendar.gif"/></a>                                                        
                                            </axis:ocultar>  
                                        </td>
                                        
                                       	<td class="campocaja"> <!-- Area 2. Linea 1. Columna 3. Fecha fin versión ( Fecha vencimiento ) -->                                          
                                            <axis:ocultar f="axisrea003" c="FCONFIN">
                                            <input type="text" onchange="f_actualitza_fecha('FCONFIN')" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCONFIN}"/>" name="FCONFIN" id="FCONFIN"  style="width:40%;"
                                            <axis:atr f="axisrea003" c="FCONFIN" a="modificable=true&formato=fecha"/> title="<axis:alt f="axisrea003" c="ALT_FCONFIN" lit="9001198"/>" title="<axis:alt f="axisrea003" c="ALT_FCONFIN_N" lit="9001198"/>" <axis:atr f="axisrea003" c="FCONFIN" a="modificable=true&obligatorio=true"/>  />
                                            <a style="vertical-align:middle;"><img id="popup_calendario_FCONFIN" alt="<axis:alt f="axisrea003" c="ALT_FCONFIN_B" lit="108341"/>" title="<axis:alt f="axisrea003" c="ALT_FCONFIN_C" lit="9001198" />" src="images/calendar.gif"/></a>                                                        
                                            </axis:ocultar>  
                                        </td>
                                                                            
                                      </tr> <!-- FIN Area 2. Línea 1. Valores de campos -->
                                      <tr> <!-- Area 2. Línea 2. Títulos de campos -->
                                         <axis:ocultar f="axisrea003" c="CVIDAGA"> 
                                            <td class="titulocaja" >
                                               <b><axis:alt f="axisrea003" c="LIT_CVIDAGA" lit="9000601"/></b>
                                            </td>
                                         </axis:ocultar>
                                      <axis:ocultar f="axisrea003" c="TCONTRA">
                                        <td class="titulocaja" ><!--Descripción de la versión -->
                                            <b><axis:alt f="axisrea003" c="LIT_TCONTRA" lit="100588"/></b>
                                        </td>
                                      </axis:ocultar>   
                                      <axis:ocultar f="axisrea003" c="SCONQP">
                                        <td class="titulocaja" ><!--Contrato de protección / Núm. versión -->
                                            <b><axis:alt f="axisrea003" c="LIT_SCONQP" lit="9001594"/></b>
                                        </td>
                                      </axis:ocultar>
                                      <axis:ocultar f="axisrea003" c="IRETENC" dejarHueco="false">    
                                        <td class="titulocaja" ><!--Descripción Iretención -->                                        
                                                                              
                                            <b id="label_IRETENC"><axis:alt f="axisrea003" c="LIT_IRETENC" lit="101714"/></b>
                                      
                                        </td>
                                      </axis:ocultar>   
                                     
                                      </tr> <!-- FIN Area 2. Línea 2. Títulos de campos -->
                                      <tr> <!-- Area 2. Línea 2. Valores de campos -->
                                       <td class="campocaja"> <!-- Area 2. Linea 3. Columna 1. Forma de cálculo -->                                            
                                           <axis:ocultar f="axisrea003" c="CVIDAGA"> 
                                           <select name="CVIDAGA" id="CVIDAGA" size="1" class="campowidthselect campo campotexto" obligatorio="true" style="width:80%;">
                                             <option value=""> - <axis:alt f="axisrea003" c="ALT_CVIDAGA_SEL" lit="9000601"/> - </option>
                                                <c:forEach var="element" items="${__formdata.ListaVidaga}">
                                                    <option value = "${element.CATRIBU}" 
                                                        <c:if test="${element.CATRIBU == __formdata.CVIDAGA}"> selected </c:if> />
                                                        ${element.TATRIBU} 
                                                    </option>
                                                </c:forEach>
                                           </select>     
                                           </axis:ocultar> 
                                       </td>                                      
                                        <td class="campocaja"> <!-- Area 2. Linea 2. Columna 1. Forma de cálculo -->
                                        <axis:ocultar f="axisrea003" c="TCONTRA">
                                            <input type="text" class="campo campotexto" id="TCONTRA" name="TCONTRA" style="width:80%"
                                            value="${__formdata.TCONTRA}" <axis:atr f="axisrea003" c="TCONTRA" a="modificable=true"/>/>
                                        </axis:ocultar>    
                                        </td>                                                                                  
                                        <td class="campocaja"> <!-- Area 2. Linea 2. Columna 2. Forma de cálculo -->
                                            <axis:ocultar f="axisrea003" c="SCONQP">
                                            <input type="text" class="campo campotexto" id="SCONQP" name="SCONQP" style="width:25%"
                                            value="${__formdata.SCONQP}" <axis:atr f="axisrea003" c="SCONQP" a="modificable=true"/>/>
                                            <input type="text" class="campo campotexto" id="NVERQP" name="NVERQP" style="width:10%"
                                            value="${__formdata.NVERQP}" <axis:atr f="axisrea003" c="NVERQP" a="modificable=true"/>/>
                                            </axis:ocultar>    
                                        </td>
                                        <axis:ocultar f="axisrea003" c="IRETENC" dejarHueco="false">
                                        <td class="campocaja"> <!-- Area 2. Linea 2. Columna 3. Forma de cálculo -->
                                               
                                                <input type="text" class="campo campotexto" id="IRETENC" onchange="f_actualiza_number('IRETENC')" obligatorio="true" name="IRETENC" style="width:40%"
                                                value="${__formdata.IRETENC}" <axis:atr f="axisrea003" c="IRETENC" a="modificable=true"/>/>
                                               
                                        </td>
                                        </axis:ocultar>
                                        
                                       </tr> <!-- FIN Area 2. Línea 2. Valores de campos -->
                                       <tr> <!-- Area 2. Línea 3. Títulos de campos -->
                                        <axis:visible f="axisrea003" c="IPRIOXL" >
                                         <td class="titulocaja" id="td_IPRIOXL"><!--Descripción prima XL -->                    
                                           <b id="label_IPRIOXL"><axis:alt f="axisrea003" c="LIT_IPRIOXL" lit="9000607"/></b>
                                         </td>
                                        </axis:visible>  
                                        <axis:ocultar f="axisrea003" c="ICAPACI"> 
                                         <td class="titulocaja" >
                                            <b><axis:alt f="axisrea003" c="LIT_ICAPACI" lit="9000602"/></b>
                                          </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea003" c="PCEDIDO"> 
                                          <td class="titulocaja" >
                                            <b><axis:alt f="axisrea003" c="LIT_PCEDIDO" lit="9001595"/></b>
                                          </td>
                                          </axis:ocultar>
                                        </tr> <!-- FIN Area 2. Línea 3. Títulos de campos -->
                                        <tr> <!-- Area 2. Línea 3. Valores de campos -->
                                        <axis:visible f="axisrea003" c="IPRIOXL">
                                          <td id="td_IPRIOXL">
                                               <input type="text" class="campo campotexto" id="IPRIOXL" onchange="f_actualiza_number_no_decimal('IPRIOXL')" obligatorio="true" name="IPRIOXL" style="width:40%"
                                                value="${__formdata.IPRIOXL}" <axis:atr f="axisrea003" c="IPRIOXL" a="modificable=true"/>/>
                                          </td>
                                         </axis:visible>                                              
                                           <td class="campocaja"> <!-- Area 2. Linea 2. Columna 2. Capacidad -->
                                            <axis:ocultar f="axisrea003" c="ICAPACI">
                                            <input type="text" class="campo campotexto" id="ICAPACI" onchange="f_actualiza_number_no_decimal('ICAPACI')" obligatorio="true" name="ICAPACI" style="width:70%"
                                            value="${__formdata.ICAPACI}"  <axis:atr f="axisrea003" c="ICAPACI" a="modificable=true"/>/>
                                            </axis:ocultar>    
                                           </td>
                                           <td class="campocaja"> <!-- Area 2. Linea 3. Columna 3. % Cedido / Obervaciones -->
                                            <axis:ocultar f="axisrea003" c="PCEDIDO">
                                                <input type="numeric" class="campo campotexto" id="PCEDIDO"  name="PCEDIDO" style="width:10%"
                                                onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004prop" c="PCEDIDO" lit="9001595"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value))); if(num>100){alert('<axis:alt f="axisrea003" c="PCEDIDO" lit="1000390"/>');this.value='';this.focus()}else{this.value=num.toFixed(2).replace(objNumero.getSeparadorMiles(),objNumero.getSeparadorDecimales())}}"
                                                value="<fmt:formatNumber pattern='##.##' value='${__formdata.PCEDIDO}' />" <axis:atr f="axisrea003" c="PCEDIDO" a="modificable=true&formato=entero"/>/>
                                            </axis:ocultar>    
                                            <axis:ocultar f="axisrea003" c="TOBSERV">
                                                <input type="text" class="campo campotexto" id="TOBSERV" name="TOBSERV" style="width:80%"
                                                value="${__formdata.TOBSERV}" <axis:atr f="axisrea003" c="TOBSERV" a="modificable=true"/>/>
                                            </axis:ocultar>    
                                           </td> 
                                         </tr> <!-- FIN Area 2. Línea 3. Valores de campos -->
                                         <!-- ****************************************** NUEVOS CAMPOS ************************************** -->
                                         <!-- *********************************************************************************************** -->
                                         <!-- *********************************************************************************************** -->
                                        
                                         <tr> 
                                            <axis:ocultar f="axisrea003" c="CERCARTERA" dejarHueco="false"> 
                                            <td class="titulocaja" colespan="1" ><!--Cartera primas -->
                                              <b><axis:alt f="axisrea003" c="LIT_ERCARTERA" lit="9902212"/></b>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisrea003" c="IPRIMAESPERADAS" dejarHueco="false"> 
                                              <td class="titulocaja" colespan="1"  ><!--Primas esperadas -->
                                              <b><axis:alt f="axisrea003" c="LIT_PRIMASESPERADAS" lit="9902213"/></b>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisrea003" c="NANYOSLOSS" dejarHueco="false"> 
                                              <td class="titulocaja" colespan="1"  ><!--Años arrastre siniestros -->
                                              <b><axis:alt f="axisrea003" c="LIT_ANYOSLOSS" lit="9902191"/></b>
                                            </td>
                                            </axis:ocultar>
                                            
                                        </tr>
                                            
                                        <tr>
                                        <!-- E/R Cartera primas -->
                                        <%--c:choose>
                                                <c:when test="${empty __formdata.SCONTRA_MOD}" --%>
                                                    <td class="campocaja" colspan="1"> <%-- SCONAGR --%> 
                                                    <axis:ocultar f="axisrea003" c="CERCARTERA"> <!-- Linia 2. Columna 1. -->                                      
                                                        <select name="CERCARTERA" id="CERCARTERA" size="1" class="campowidthselect campo campotexto" obligatorio="false" style="width:62.5%;">
                                                            <option value=""> - <axis:alt f="axisrea003" c="ALT_CERCARTERA_SEL" lit="180009"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.ListaERCartera}">
                                                                <option value = "${element.CATRIBU}" 
                                                                <c:if test="${element.CATRIBU == __formdata.OB_IAX_CONTRATO_REA.CERCARTERA}"> selected </c:if> />
                                                                    ${element.TATRIBU} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>  
                                                  </axis:ocultar>    
                                                  </td>
                                              <%--/c:when>    
                                              <c:otherwise>
                                                 <td class="campocaja" colspan="1" >
                                                    <axis:ocultar f="axisrea003" c="CERCARTERA">
                                                        <input type="text" class="campo campotexto" id="CERCARTERA" name="CERCARTERA" size="1" style="width:62.5%"
                                                            value="${__formdata.CERCARTERA}" <axis:atr f="axisrea003" c="CERCARTERA" a="readOnly=true&obligatorio=false"/> />
                                                    </axis:ocultar>   
                                                  </td>
                                                   
                                               </c:otherwise>
                                            </c:choose--%>         
                                        <!-- E/R Cartera primas -->
                                        <!-- Primas esperadas -->
              
                                        <td class="campocaja" colspan="1" >
                                        <axis:ocultar f="axisrea003" c="IPRIMAESPERADAS"><!-- readOnly=true -->
                                            <input type="text" class="campo campotexto" id="IPRIMAESPERADAS" name="IPRIMAESPERADAS" size="1" style="width:62.5%"
                                            value="${__formdata.OB_IAX_CONTRATO_REA.IPRIMAESPERADAS}" <axis:atr f="axisrea003" c="IPRIMAESPERADAS" a="&obligatorio=false"/> />
                                        </axis:ocultar>   
                                        </td>
                                        <!-- Primas esperadas -->
                                        <!-- Años arrastre Siniestros -->
                                        <td class="campocaja" colspan="1" > 
                                        <axis:ocultar f="axisrea003" c="NANYOSLOSS"> 
                                            <input type="text" class="campo campotexto" id="NANYOSLOSS" name="NANYOSLOSS" size="1" style="width:62.5%"
                                            value="${__formdata.OB_IAX_CONTRATO_REA.NANYOSLOSS}" <axis:atr f="axisrea003" c="NANYOSLOSS" a="obligatorio=false"/> />
                                        </axis:ocultar>   
                                        </td>
                                        <!--  Años arrastre Siniestros -->
                                        
                                        </tr>
                                        
                                        <tr> 
                                            <axis:ocultar f="axisrea003" c="CLOSSCORRIDOR_CON" dejarHueco="false"> 
                                            <td class="titulocaja" colespan="1" ><!--Loss Corridor -->
                                              <b><axis:alt f="axisrea003" c="LIT_LOSSCORRIDOR_CON" lit="9902197"/></b>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisrea003" c="CCAPPEDRATIO_CON" dejarHueco="false"> 
                                              <td class="titulocaja" colespan="1"  ><!-- Capped Ratio -->
                                              <b><axis:alt f="axisrea003" c="LIT_CAPPEDRATIO_CON" lit="9902198"/></b>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisrea003" c="CBASEXL" dejarHueco="false">
                                              <td class="titulocaja" colspan="1" id="td_CBASEXL">
                                              <b id="label_CBASEXL"><axis:alt f="axisrea003" c="LIT_CBASEXL" lit="9902214"/></b>
                                              </td>
                                            </axis:ocultar>
                                        </tr>
                                        
                                           
                                        <tr>
                                                <!-- Loss Corridor -->
                                        <%--c:choose>
                                                <c:when test="${empty __formdata.SCONTRA_MOD}" --%>
                                                  <td class="campocaja" colspan="1"> <%-- SCONAGR --%> 
                                                  <axis:ocultar f="axisrea003" c="CLOSSCORRIDOR_CON"> <!-- Linia 2. Columna 1. -->                                      
                                                        <select name="CLOSSCORRIDOR_CON" id="CLOSSCORRIDOR_CON" size="1" class="campowidthselect campo campotexto" obligatorio="false" style="width:62.5%;">
                                                            <option value=""> - <axis:alt f="axisrea003" c="ALT_LOSSCORRIDOR_CON_SEL" lit="9902197"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.ListaLoss}">
                                                                <option value = "${element.CCODIGO}" 
                                                                 <c:if test="${element.CCODIGO == __formdata.OB_IAX_CONTRATO_REA.CLOSSCORRIDOR_CON}"> selected </c:if>>
                                                                    ${element.TDESCRIPCION} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>  
                                                  </axis:ocultar>    
                                                  </td>  
                                                 
                                              <%--/c:when>    
                                              <c:otherwise>
                                                 <td class="campocaja" colspan="1" >
                                                    <axis:ocultar f="axisrea003" c="CLOSSCORRIDOR_CON">
                                                        <input type="text" class="campo campotexto" id="CLOSSCORRIDOR_CON" name="CLOSSCORRIDOR_CON" size="1" style="width:62.5%"
                                                            value="${__formdata.CLOSSCORRIDOR_CON}" <axis:atr f="axisrea003" c="CLOSSCORRIDOR_CON" a="readOnly=true&obligatorio=false"/> />
                                                    </axis:ocultar>   
                                                  </td>
                                                   
                                               </c:otherwise>
                                            </c:choose--%>         
                                        <!--  Loss Corridor -->
                                             
                                        <!-- Capped Ratio -->
                                        <%--c:choose>
                                                <c:when test="${empty __formdata.SCONTRA_MOD}" --%>
                                                    <td class="campocaja" colspan="1"> <%-- SCONAGR --%> 
                                                    <axis:ocultar f="axisrea003" c="CCAPPEDRATIO_CON"> <!-- Linia 2. Columna 1. -->                                      
                                                        <select name="CCAPPEDRATIO_CON" id="CCAPPEDRATIO_CON" size="1" class="campowidthselect campo campotexto" obligatorio="false" style="width:62.5%;">
                                                            <option value=""> - <axis:alt f="axisrea003" c="ALT_CCAPPEDRATIO_CON_SEL" lit="9902198"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.ListaCapped}">
                                                                <option value = "${element.CCODIGO}" 
                                                                 <c:if test="${element.CCODIGO == __formdata.OB_IAX_CONTRATO_REA.CCAPPEDRATIO_CON}"> selected </c:if>>
                                                                    ${element.TDESCRIPCION} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>  
                                                  </axis:ocultar>    
                                                  </td>
                                                  
                                              <%--/c:when>    
                                              <c:otherwise>
                                                 <td class="campocaja" colspan="1" >
                                                    <axis:ocultar f="axisrea003" c="CCAPPEDRATIO_CON">
                                                        <input type="text" class="campo campotexto" id="CCAPPEDRATIO_CON" name="CCAPPEDRATIO_CON" size="1" style="width:62.5%"
                                                            value="${__formdata.CCAPPEDRATIO_CON}" <axis:atr f="axisrea003" c="CCAPPEDRATIO_CON" a="readOnly=true&obligatorio=false"/> />
                                                    </axis:ocultar--%>   
                                                  <%--/td>
                                               </c:otherwise>
                                            </c:choose --%>         
                                       
                                        
                                    
                                                    <td class="campocaja" colspan="1" id="td_CBASEXL"> <%-- SCONAGR --%>
                                                    <axis:ocultar f="axisrea003" c="CBASEXL"> <!-- Linia 2. Columna 1. -->                                      
                                                        <select name="CBASEXL" id="CBASEXL" <axis:atr f="axisrea003" c="CBASEXL" a="modificable=true"/> size="1" class="campowidthselect campo campotexto" obligatorio="false" style="width:62.5%;">
                                                            <option value=""> - <axis:alt f="axisrea003" c="ALT_CBASEXL_SEL" lit="9902214"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.ListaBaseXL}">
                                                                <option value = "${element.CATRIBU}" 
                                                                <c:if test="${element.CATRIBU == __formdata.OB_IAX_CONTRATO_REA.CBASEXL}"> selected </c:if>>
                                                                    ${element.TATRIBU} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>  
                                                  </axis:ocultar>    
                                                  </td>
                                                
                                              
                                           
                                        <!--  Base Cobertura XL -->
                                              
                                        </tr>
                                          
                                             
                                        <tr>
                                            <axis:ocultar f="axisrea003" c="SCONTRAPROT" dejarHueco="false"> 
                                                <td class="titulocaja" colespan="1"  ><!-- Contrato de protección -->
                                                    <b><axis:alt f="axisrea003" c="LIT_SCONTRAPROT" lit="9000612"/></b>
                                                </td>
                                            </axis:ocultar>
                                            
                                             <axis:ocultar f="axisrea003" c="NVERSIOPROT" dejarHueco="false"> 
                                                <td class="titulocaja" colespan="1"  ><!-- Versión de protección -->
                                                    <b><axis:alt f="axisrea003" c="LIT_NVERSIOPROT" lit="9902216"/></b>
                                                </td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axisrea003" c="PCOMEXT" dejarHueco="false"> 
                                                <td class="titulocaja" colespan="1"  ><!-- % Comisión extra prima -->
                                                    <b><axis:alt f="axisrea003" c="LIT_PCOMEXT" lit="9906742"/></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                        
                                        <!-- Contrato protección -->
                                        <%--c:choose>
                                                <c:when test="${empty __formdata.SCONTRA_MOD}"--%>
                                                    <td class="campocaja" colspan="1"> <%-- SCONAGR --%>  
                                                    <axis:ocultar f="axisrea003" c="SCONTRAPROT"> <!-- Linia 2. Columna 1. -->                                      
                                                        <select name="SCONTRAPROT" id="SCONTRAPROT" onchange="f_recarga_combo()" size="1" class="campowidthselect campo campotexto" obligatorio="false" style="width:62.5%;">
                                                            <option value=""> - <axis:alt f="axisrea003" c="ALT_SCONTRAPROT_SEL" lit="9000612"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.ListaContratoProt}">
                                                                <option value = "${element.SCONTRA}" 
                                                                 <c:if test="${element.SCONTRA == __formdata.OB_IAX_CONTRATO_REA.SCONTRAPROT}"> selected </c:if>>
                                                                   ${element.SCONTRA}-${element.TDESCRIPCION} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>  
                                                  </axis:ocultar>    
                                                  </td>
                                              <%--/c:when>    
                                              <c:otherwise>
                                                 <td class="campocaja" colspan="1" >
                                                    <axis:ocultar f="axisrea003" c="SCONTRAPROT">
                                                        <input type="text" class="campo campotexto" id="SCONTRAPROT" name="SCONTRAPROT" size="1" style="width:62.5%"
                                                            value="${__formdata.SCONTRAPROT}" <axis:atr f="axisrea003" c="SCONTRAPROT" a="readOnly=true&obligatorio=false"/> />
                                                    </axis:ocultar>   
                                                  </td>
                                                   
                                               </c:otherwise>
                                        </c:choose --%>         
                                        <!--  Contrato protección -->
                                        
                                        <!-- Versión protección -->
                                        <%--c:choose>
                                                <c:when test="${empty __formdata.SCONTRA_MOD}"--%>
                                                    <td class="campocaja" colspan="1"> <%-- SCONAGR --%>  
                                                    <axis:ocultar f="axisrea003" c="NVERSIOPROT"> <!-- Linia 2. Columna 1. -->                                      
                                                        <select name="NVERSIOPROT" id="NVERSIOPROT" size="1" class="campowidthselect campo campotexto" obligatorio="false" style="width:62.5%;">
                                                            <option value=""> - <axis:alt f="axisrea003" c="ALT_NVERSIOPROT_SEL" lit="9902216"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.listaVersiones}">
                                                                <option value = "${element.NVERSIO}" 
                                                                 <c:if test="${element.NVERSIO == __formdata.OB_IAX_CONTRATO_REA.NVERSIOPROT}"> selected </c:if>> <!-- SE RECRAGA POR AJAX -->
                                                                    ${element.TCONTRA} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>  
                                                  </axis:ocultar>    
                                                
                                                  </td>
                                                  <td>                                                  
                                         <axis:ocultar f="axisrea003" c="PCOMEXT">                                         
                                            <input type="text" class="campo campotexto" id="PCOMEXT" name="PCOMEXT" style="width:80%"
                                            value="${__formdata.PCOMEXT}" <axis:atr f="axisrea003" c="PCOMEXT" a="modificable=true"/>/>
                                        </axis:ocultar>                                                    
                                    
                                        </td>
                                              <%--/c:when>    
                                              <c:otherwise>
                                                 <td class="campocaja" colspan="1" >
                                                    <axis:ocultar f="axisrea003" c="NVERSIOPROT">
                                                        <input type="text" class="campo campotexto" id="NVERSIOPROT" name="NVERSIOPROT" size="1" style="width:62.5%"
                                                            value="${__formdata.NVERSIOPROT}" <axis:atr f="axisrea003" c="NVERSIOPROT" a="readOnly=true&obligatorio=false"/> />
                                                    </axis:ocultar>   
                                                  </td>
                                                   
                                               </c:otherwise>
                                        </c:choose --%>         
                                        <!--  Version protección -->
                                             
                                        </tr>
										
										<!-- INI - EDBR - 11/06/2019 - IAXIS3338 - se agregan los campo de Retencion por poliza NRETPOL y Retencion por Cumulo NRETCUL -->
                                        <tr>
                                        	<axis:ocultar f="axisrea003" c="PRETPOL" dejarHueco="false"> 
                                                <td class="titulocaja" colespan="1"  ><!-- Retención por póliza -->
                                                    <b><axis:alt f="axisrea003" c="LIT_PRETPOL" lit="89906319"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisrea003" c="PRETCUL" dejarHueco="false"> 
                                                <td class="titulocaja" colespan="1"  ><!-- Retención por cúmulo -->
                                                    <b><axis:alt f="axisrea003" c="LIT_PRETCUL" lit="89906320"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisrea003" c="ISUBLIMITE" dejarHueco="false"> 
                                                <td class="titulocaja" colespan="1"  ><!-- Retención por cúmulo -->
                                                    <b><axis:alt f="axisrea003" c="LIT_ISUBLIMITE" lit="89908032"/></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                        <td class="campocaja"> <!--campo Retención por póliza -->
                                            <axis:ocultar f="axisrea003" c="NRETPOL">
                                            <input type="text" maxlength="9" class="campo campotexto" id="NRETPOL" onchange="f_retencion_poliza(this)" obligatorio="true" name="NRETPOL" style="width:70%"
                                            value="${__formdata.NRETPOL}" <axis:atr f="axisrea003" c="NRETPOL" a="modificable=true&formato=entero"/>/>
                                            </axis:ocultar>    
                                           </td>
                                           <td class="campocaja"> <!-- campo Retención por cúmulo -->
                                            <axis:ocultar f="axisrea003" c="NRETCUL">
                                            <input type="text" maxlength="9" class="campo campotexto" id="NRETCUL" onchange="f_retencion_cumulo(this)" obligatorio="true" name="NRETCUL" style="width:70%"
                                            value="${__formdata.NRETCUL}" <axis:atr f="axisrea003" c="NRETCUL" a="modificable=true&formato=entero"/>/>
                                            </axis:ocultar>    
                                           </td>
                                           <td class="campocaja"> <!-- Area 2. Linea 2. Columna 2. Capacidad -->
	                                            <axis:ocultar f="axisrea003" c="ISUBLIMITE">
	                                            <input type="text" class="campo campotexto" id="ISUBLIMITE" onchange="f_actualiza_number_no_decimal('ISUBLIMITE')" obligatorio="true" name="ISUBLIMITE" style="width:70%"
	                                            value="${__formdata.ISUBLIMITE}"  <axis:atr f="axisrea003" c="ISUBLIMITE" a="modificable=true"/>/>
                                            </axis:ocultar>    
                                           </td>
                                        </tr>
                                        <!-- FIN - EDBR - 11/06/2019 - IAXIS3338 - se agregan los campo de Retencion por poliza NRETPOL y Retencion por Cumulo NRETCUL -->
                                         <!-- *********************************************************************************************** -->
                                         <!-- *********************************************************************************************** -->
                                         
                                         
                                </table>
                               
                             </td>
                             </tr> 
                            
                          </table>
                         </tr>
                      </td>   
                      <!-- TRAMOS -->
                       <tr>
                       <td>  
                        <table class="area" align="left">
                                                <tr>
                                                  <td colspan="5">
                                                  <div class="separador">&nbsp;  
                                                  </div>
                                                  <div style="float:left;" class="tramos_parent"><img src="images/mes.gif" id="tramos_parent" name="tramos_parent" onclick="objEstilos.toggleDisplay('tramos', this)" style="cursor:pointer"/>
                                                  <b><axis:alt f="axisrea003" c="ALT_NOMBRE_SECCION" lit="108676"/></b>
                                                  </div>
                                                   <axis:visible f="axisrea003" c="ALTA_TRAMO">
                                                   <div style="float:right;" id="ALTA_TRAMO"> <a href="javascript:f_abrir_axisrea004()"><img border="0" alt="<axis:alt f="axisrea003" c="ALT_IMG_NUEVO" lit="9000422"/>" title="<axis:alt f="axisrea003" c="ALT_IMG_NUEVO_OP" lit="9002223"/>" src="images/new.gif"/></a></div>
                                                   </axis:visible>
                                                   <axis:visible f="axisrea003" c="ALTA_TRAMO_PROP">
                                                   <div style="float:right;" id="ALTA_TRAMO_PROP"> <a href="javascript:f_abrir_axisrea004_prop()"><img border="0" alt="<axis:alt f="axisrea003" c="ALT_IMG_NUEVO" lit="9000422"/>" title="<axis:alt f="axisrea003" c="ALT_IMG_NUEVO_OP" lit="9002223"/> Prop." src="images/file.gif"/></a></div>
                                                   </axis:visible>
                                                   <div style="clear:both;">
                                                    <hr class="titulo">
                                                   </div>
                                                   
                                                  </td> 
                                                </tr>                                                
                                                <tr id="tramos_children" style="display:none">
                                                  <td>                                                                     
                                                    <!-- Area 2. Multirregistro de tramos -->
                                                          <!-- Área 1 -->
                                                          <table class="area" align="left"> <!-- multirregistro de tramos -->
                                                            <tr>
                                                              <td>  
                                                                                                                                 <c:set var="title1"><axis:alt f="axisrea002" c="ALT_TRAMO" lit="9000609"/></c:set>  <%-- Tramo --%>
                                                                <c:set var="title2"><axis:alt f="axisrea002" c="ALT_NRODEN" lit="500102"/></c:set>   <%-- Num. Orden --%>
                                                                <c:set var="title3"><axis:alt f="axisrea002" c="ALT_BORDERO" lit="9000610"/></c:set>   <%-- Borderó --%>
                                                                <c:set var="title4"><axis:alt f="axisrea002" c="ALT_IMPTRAMO" lit="9000474"/></c:set>   <%-- Importe tramo --%>
                                                                <c:set var="title5"><axis:alt f="axisrea002" c="ALT_IPRIOTRAMO" lit="89906330"/></c:set>   <%-- Nuevo campo prioridad TRAMO IAXIS-4611 tramo --%>
                                                                <c:set var="title6"><axis:alt f="axisrea002" c="ALT_QUOTE" lit="9000611"/></c:set>   <%-- % Cuota Parte --%>
                                                                <c:set var="title7"><axis:alt f="axisrea002" c="ALT_PROTECCION" lit="9000612"/></c:set>   <%-- Contrato protección --%>
                                                                <c:set var="title8"><axis:alt f="axisrea002" c="ALT_VERS_PROTECCION" lit="9000577"/></c:set>   <%-- Versión contrato protección --%>

                                                                
                                                                
                                                               <c:if test="${!empty __formdata.TRAMOSREA}">
                                                                    <div class="displayspace">
                                                                    <%int i = 0;%>
                                                                    <display:table name="${__formdata.TRAMOSREA}" id="pTRAMOSREA" export="false" class="dsptgtable" 
                                                                    pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                                    requestURI="axis_axisrea003.do?operation=form&paginar=true">                                                                    
                                                                        <%@ include file="../include/displaytag.jsp"%>                                                                        
                                                                         <c:set var="i"><%=i%></c:set>
                                                                           <display:column headerClass="headwidth5 sortable" title="" media="html" autolink="false" >
                                                                          <!--<div class="dspIcons">
                                                                            <input value="${pTRAMOSREA.OB_IAX_TRAMOS_REA.CTRAMO }" <c:if test="${pTRAMOSREA.OB_IAX_TRAMOS_REA.CTRAMO==__formdata.TRAMOSREA[0].OB_IAX_TRAMOS_REA.CTRAMO}">checked</c:if> onclick="javascript:f_seleccionar_tramo()" type="radio" id="radioCTRAMO" name="radioCTRAMO" selected="true"/>
                                                                          </div>-->                                                                          
                                                                         <div class="dspIcons">
                                                                            <input type="radio" name="selCTRAMO"
                                                                             <c:if test="${__formdata.indexTramos == i }"> checked </c:if>
                                                                            id="${pTRAMOSREA.OB_IAX_TRAMOS_REA.CTRAMO}" value="${pTRAMOSREA.OB_IAX_TRAMOS_REA.CTRAMO}" onclick="javascript:actualizarCTRAMO('${i}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.CTRAMO}');"/>
                                                                         </div>                                                                          
                                                                        </display:column>                                                                              
                                                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_TRAMOS_REA.TTRAMO" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                          <div class="dspText">${pTRAMOSREA.OB_IAX_TRAMOS_REA.TTRAMO}</div>
                                                                        </display:column>
                                                                        <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_TRAMOS_REA.NORDEN" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                          <div class="dspText">${pTRAMOSREA.OB_IAX_TRAMOS_REA.NORDEN}</div>
                                                                        </display:column>
                                                                        <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_TRAMOS_REA.TFREBOR" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                          <div class="dspText">${pTRAMOSREA.OB_IAX_TRAMOS_REA.TFREBOR}</div>
                                                                        </display:column>
                                                                        <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_TRAMOS_REA.ITOTTRA" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                          <div class="dspText"><fmt:formatNumber pattern="###,##0.00" value="${pTRAMOSREA.OB_IAX_TRAMOS_REA.ITOTTRA}"/></div>
                                                                        </display:column>
																		
																		   <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_TRAMOS_REA.IXLPRIO" headerClass="sortable fixed"  media="html" autolink="false" >      <!--IAXIS-4611:Campo para grabar la prioridad por tramo y el limite por tramo -->                             
                                                                      <div class="dspText"><fmt:formatNumber pattern="###,##0.00" value="${pTRAMOSREA.OB_IAX_TRAMOS_REA.IXLPRIO}"/></div>
                                                                      </display:column>
																	  
                                                                        <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_TRAMOS_REA.PLOCAL" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                          <div class="dspText">${pTRAMOSREA.OB_IAX_TRAMOS_REA.PLOCAL} <c:if test="${! empty pTRAMOSREA.OB_IAX_TRAMOS_REA.PLOCAL}"> %</c:if></div>
                                                                        </display:column>
                                                                        
                                                                       
                                                                      
                                                                        <display:column title="${title7}" sortable="true" sortProperty="OB_IAX_TRAMOS_REA.NCTRXL" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                          <div class="dspText">${pTRAMOSREA.OB_IAX_TRAMOS_REA.NCTRXL}</div>
                                                                        </display:column>
                                                                        <display:column title="${title8}" sortable="true" sortProperty="OB_IAX_TRAMOS_REA.NVERXL" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                          <div class="dspText">${pTRAMOSREA.OB_IAX_TRAMOS_REA.NVERXL}</div>
                                                                        </display:column>
                                                                         <display:column title="" sortable="false" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                                                                               
                                                                            <c:if test="${__formdata.CTIPREA=='1'|| __formdata.CTIPREA=='2' || __formdata.CTIPREA=='5'}">
																																								<div style="float:left;" id="icon_MOD_TRAMO"> 
						
                                                                                <a href="javascript:f_modif_axisrea004_prop('${pTRAMOSREA.OB_IAX_TRAMOS_REA.CTRAMO}', '${pTRAMOSREA.OB_IAX_TRAMOS_REA.NORDEN}', '${__formdata.CTIPREA}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.CFREBOR}', '${pTRAMOSREA.OB_IAX_TRAMOS_REA.ITOTTRA}', '${pTRAMOSREA.OB_IAX_TRAMOS_REA.PLOCAL}', '${pTRAMOSREA.OB_IAX_TRAMOS_REA.NCTRXL}', '${pTRAMOSREA.OB_IAX_TRAMOS_REA.NVERXL}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.IPRIMAESTIMADA}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.ILAA}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.PCTGASTOS}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.PTASAAJUSTE}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.PCTPB}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.IMPAVISO}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.IMPCONTADO}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.PCTCONTADO}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.CLOSSCORRIDOR}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.CCAPPEDRATIO}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.ICAPCOASEG}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.NANYOSLOSS}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.IBONOREC}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.ICOSTOFIJO}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.PCOMISINTERM}');"><img border="0" alt="<axis:alt f="axisrea003" c="ALT_NVERSXL1_VAL" lit="9000552"/>&nbsp;<axis:alt f="axisrea003" c="ALT_NVERSXL_VAL" lit="9000609"/>" title="<axis:alt f="axisrea003" c="ALT_NVERSXL3_VAL" lit="9000552"/>&nbsp;<axis:alt f="axisrea003" c="ALT_NVERSXL4_VAL" lit="9000609"/>" src="images/lapiz.gif"/></a>                                                                         
																																								</div> 
                                                                            </c:if>
                                                                            <c:if test="${__formdata.CTIPREA!='1'&& __formdata.CTIPREA!='2'&& __formdata.CTIPREA!='5'}">
																																								<div style="float:left;" id="icon_MOD_TRAMO_PROP" > 
																																								
                                                                                <a href="javascript:f_modif_axisrea004('${pTRAMOSREA.OB_IAX_TRAMOS_REA.CTRAMO}', '${pTRAMOSREA.OB_IAX_TRAMOS_REA.NORDEN}', '${pTRAMOSREA.OB_IAX_TRAMOS_REA.CFREBOR}', '${pTRAMOSREA.OB_IAX_TRAMOS_REA.ITOTTRA}', '${pTRAMOSREA.OB_IAX_TRAMOS_REA.PLOCAL}', '${pTRAMOSREA.OB_IAX_TRAMOS_REA.NCTRXL}', '${pTRAMOSREA.OB_IAX_TRAMOS_REA.NVERXL}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.IDAA}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.ILAA}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.CTPRIMAXL}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.IPRIMAFIJAXL}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.IPRIMAESTIMADA}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.CAPLICTASAXL}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.CTIPTASAXL}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.PTASAXL}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.CTRAMOTASAXL}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.IDEPXL}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.PCTPDXL}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.IMINXL}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.PCTMINXL}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.IPMD}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.CFREPMD}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.PCTPB}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.NANYOSLOSS}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.IBONOREC}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.CREPOS}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.IMPCONTADO}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.PCTCONTADO}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.IMPAVISO}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.CLOSSCORRIDOR}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.CCAPPEDRATIO}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.ICOSTOFIJO}','${pTRAMOSREA.OB_IAX_TRAMOS_REA.PCOMISINTERM}');"><img border="0" alt="<axis:alt f="axisrea003" c="ALT_NVERSXL7_VAL" lit="9000552"/>&nbsp;<axis:alt f="axisrea003" c="ALT_NVERSXL8_VAL" lit="9000609"/>" title="<axis:alt f="axisrea003" c="ALT_NVERSXL5_VAL" lit="9000552"/>&nbsp;<axis:alt f="axisrea003" c="ALT_NVERSXL6_VAL" lit="9000609"/>" src="images/lapiz.gif"/></a>
                                                                              
																																								</div>   
                                                                            </c:if>
																																						<div style="float:left;"> 
                                                                                <a href="javascript:f_borrar_tramo('${pTRAMOSREA.OB_IAX_TRAMOS_REA.CTRAMO}');"><img border="0" alt="<axis:alt f="axisrea003" c="ALT_LINK_VAL" lit="9001333"/>" title="<axis:alt f="axisrea003" c="ALT_LINK_OPC" lit="9001333"/>" src="images/delete.gif"/></a>
                                                                            </div>                                                                           
                                                                        </display:column>
                                                                        <%i++;%>
                                                                      </display:table>                                                                                                    
                                                                    </div>  
                                                                </c:if>
                                                                <c:if test="${empty __formdata.TRAMOSREA}">
                                                                    <b><axis:alt f="axisrea003" c="ALT_LEY_VAL" lit="120135"/></b>
                                                                </c:if>   
                                                              </td>
                                                            </tr>   
                                                          
                                                            <!-- CUADROCES -->                                                                
                                                            <tr>
                                                              <td>
                                                                <c:if test="${!empty __formdata.TRAMOSREA}">
                                                                <table class="area" align="center"> <!-- cuadros -->
                                                                  <tr>
                                                                  <td>
                                                                  <table class="area" align="left">
                                                                    <tr>
                                                                    
                                                                    <td colspan="5">
                                                                      <div class="separador">&nbsp;</div>
                                                                      <div style="float:left;" class="cuadroces_parent"><img id="cuadroces_parent" name="cuadroces_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('cuadroces', this)" style="cursor:pointer"/>
                                                                        <b><axis:alt f="axisrea003" c="ALT_TIT_CUADROCES" lit="9000617"/></b>                                                                  
                                                                      </div>
                                                                 
                                                                      
                                                                      <div style="float:right;"> <a href="javascript:f_abrir_axisrea005('${__formdata.TRAMOSREA[__formdata.indexTramos].OB_IAX_TRAMOS_REA.CTRAMO}')"><img border="0" alt="<axis:alt f="axisrea003" c="LIT_IMG_VAL" lit="9002228"/>" title="<axis:alt f="axisrea003" c="LIT_IMG_OPC" lit="9002228"/>" src="images/new.gif"/></a></div>                                                                           
                                                                        <div style="clear:both;">
                                                                      <hr class="titulo"/>
                                                                      </div>
                                                                     </td> 
                                                                    </tr>
                                                                    
                                                                       
                                                                    <tr id="cuadroces_children" style="display:none"> <!-- multirregistro de cuadros -->
                                                                      <td> 
                                                                        <c:set var="title1"><axis:alt f="axisrea003" c="ALT_CIA" lit="9000600"/></c:set>  <%-- Compañía --%>
                                                                        <c:set var="title2"><axis:alt f="axisrea003" c="ALT_CESION" lit="9000613"/></c:set>   <%-- Porcentaje cesion --%>
                                                                        <c:set var="title3"><axis:alt f="axisrea003" c="ALT_COMISI" lit="9000619"/></c:set>   <%-- Cuadro Comisiones --%>
                                                                        <c:set var="title4"><axis:alt f="axisrea003" c="ALT_CORREDOR" lit="9000614"/></c:set>   <%-- Corredor --%>
                                                                        <c:set var="title6"><axis:alt f="axisrea003" c="ALT_RESERVAS" lit="9000615"/></c:set>   <%-- Reservas --%>
                                                                        <c:set var="title7"><axis:alt f="axisrea003" c="ALT_SINIESTROS" lit="9000616"/></c:set>   <%-- Siniestros al contado --%>
                                                                   
                                                                        <div class="displayspace">
                                                                                                               
                                                                      
                                                                          <display:table name="${__formdata.TRAMOSREA[__formdata.indexTramos].OB_IAX_TRAMOS_REA.CUADROCES}" id="pCUADROCES" export="false" class="dsptgtable" 
                                                                          pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                                          requestURI="axis_axisrea003.do?operation=form&paginar=true">
                                                                            <%@ include file="../include/displaytag.jsp"%>
                                                                            
                                                                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_CUADROCES.CCOMPANI" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                              <div class="dspText">${pCUADROCES.OB_IAX_CUADROCES_REA.CCOMPANI}.-${pCUADROCES.OB_IAX_CUADROCES_REA.TCOMPANI}</div>
                                                                            </display:column>
                                                                            <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_CUADROCES_REA.PCESION" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                              <div class="dspText">${pCUADROCES.OB_IAX_CUADROCES_REA.PCESION}<c:if test="${! empty pCUADROCES.OB_IAX_CUADROCES_REA.PCESION}"> %</c:if></div>
                                                                            </display:column>
                                                                            <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_CUADROCES_REA.CCOMREA" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                              <c:if test="${! empty pCUADROCES.OB_IAX_CUADROCES_REA.CCOMREA}">
                                                                                <div class="dspText">${pCUADROCES.OB_IAX_CUADROCES_REA.CCOMREA}.-${pCUADROCES.OB_IAX_CUADROCES_REA.TCOMREA}</div>
                                                                              </c:if>
                                                                              <c:if test="${empty pCUADROCES.OB_IAX_CUADROCES_REA.CCOMREA && !empty pCUADROCES.OB_IAX_CUADROCES_REA.ICOMFIJ}">
                                                                                <div class="dspText"><fmt:formatNumber pattern="###,##0.00" value="${pCUADROCES.OB_IAX_CUADROCES_REA.ICOMFIJ}"/></div>
                                                                              </c:if>
                                                                            </display:column>
                                                                            <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_CUADROCES_REA.DESCORRED" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                              <div class="dspText">${pCUADROCES.OB_IAX_CUADROCES_REA.DESCORRED}</div>
                                                                            </display:column>
                                                                            <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_CUADROCES_REA.PRESERV" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                              <c:if test="${! empty pCUADROCES.OB_IAX_CUADROCES.PRESERV}">
                                                                                <div class="dspText">${pCUADROCES.OB_IAX_CUADROCES_REA.PRESERV}<c:if test="${! empty pCUADROCES.OB_IAX_CUADROCES_REA.PRESERV}"> %</c:if></div>
                                                                              </c:if>
                                                                              <c:if test="${empty pCUADROCES.OB_IAX_CUADROCES_REA.PRESERV && ! empty pCUADROCES.OB_IAX_CUADROCES_REA.IRESERV}">
                                                                                <div class="dspText"><fmt:formatNumber pattern="###,##0.00" value="${pCUADROCES.OB_IAX_CUADROCES_REA.IRESERV}"/></div>
                                                                              </c:if>
                                                                              <c:if test="${empty pCUADROCES.OB_IAX_CUADROCES_REA.PRESERV &&! empty pCUADROCES.OB_IAX_CUADROCES_REA.IRESERV && ! empty pCUADROCES.OB_IAX_CUADROCES_REA.CRESREF}">
                                                                                <div class="dspText">${pCUADROCES.OB_IAX_CUADROCES_REA.CRESREF}</div>
                                                                              </c:if>
                                                                            </display:column>
                                                                            <display:column title="${title7}" sortable="true" sortProperty="OB_IAX_CUADROCES_REA.ISCONTA" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                              <div class="dspText">${pCUADROCES.OB_IAX_CUADROCES_REA.ISCONTA}</div>
                                                                            </display:column>   
                                                                             <display:column title="" sortable="false" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                            <div style="float:left;"> 
                                                                                <a href="javascript:f_modif_axisrea005('${pCUADROCES.OB_IAX_CUADROCES_REA.CTRAMO}', '${pCUADROCES.OB_IAX_CUADROCES_REA.CCOMPANI}', '${pCUADROCES.OB_IAX_CUADROCES_REA.PCESION}', '${pCUADROCES.OB_IAX_CUADROCES_REA.CCOMREA}', '${pCUADROCES.OB_IAX_CUADROCES_REA.ICOMFIJ}', '${pCUADROCES.OB_IAX_CUADROCES_REA.CCORRED}', '${pCUADROCES.OB_IAX_CUADROCES_REA.PRESERV}', '${pCUADROCES.OB_IAX_CUADROCES_REA.IRESERV}', '${pCUADROCES.OB_IAX_CUADROCES_REA.CRESREF}', '${pCUADROCES.OB_IAX_CUADROCES_REA.ISCONTA}','${pCUADROCES.OB_IAX_CUADROCES_REA.PINTRES}','${pCUADROCES.OB_IAX_CUADROCES_REA.CTIPCOMIS}','${pCUADROCES.OB_IAX_CUADROCES_REA.PCTCOMIS}','${pCUADROCES.OB_IAX_CUADROCES_REA.CTRAMOCOMISION}','${pCUADROCES.OB_IAX_CUADROCES_REA.PCTGASTOS}');"><img border="0" alt="<axis:alt f="axisrea003" c="ALT_IMG_ISCONTA" lit="9000552"/>" title="<axis:alt f="axisrea003" c="ALT_ISONTA_LIT" lit="9000552"/>" src="images/lapiz.gif"/></a>                                                                         
                                                                                <a href="javascript:f_borrar_cuadroces('${pCUADROCES.OB_IAX_CUADROCES_REA.CTRAMO}','${pCUADROCES.OB_IAX_CUADROCES_REA.CCOMPANI}');"><img border="0" alt="<axis:alt f="axisrea003" c="ALT_IMG_VAR" lit="9001333"/>" title="<axis:alt f="axisrea003" c="ALT_IMG_VAR_OPC" lit="9001333"/>" src="images/delete.gif"/></a>
                                                                            </div>     
                                                                            </display:column>
                                                                            
                                                                          </display:table>  
                                                                        </div>                       
                                                                      </td>
                                                                    </tr> <!-- fin multirregistro de cuadros -->
                                                                      
                                                                </table> <!-- fin cuadros -->  
                                                                </td>
                                                                </tr>
                                                              </td>
                                                            </tr> <!-- CUADROCES -->
                                                          </table>  
                                                          </c:if><!--Empty TramosRea-->
                                                  </td>
                                                </tr>
                                              </table>                                              
                                              <!-- Fin seccion --> 
                                            </td>  
                                            </tr>
                                          </table>
                                         
                    </tr>
                    </td>
                    <!-- FIN TRAMOS -->   
                </td>
              </tr>
            </table>
        
            
           

            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea003</c:param><c:param name="f">axisrea003</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param> 
            </c:import>
             
        </form>
        
         <script type="text/javascript">
                Calendar.setup(                
                {
                inputField     :    "FCONINI",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FCONINI", 
                singleClick    :    true,
                firstDay       :    1
                }
                );
                Calendar.setup(                
                {
                inputField     :    "FCONFIN",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FCONFIN", 
                singleClick    :    true,
                firstDay       :    1
                }
                );
        </script>
        
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>
