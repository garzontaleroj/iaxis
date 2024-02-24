<%/* Revision:# Nk1nMLgYObxbGWXzlN85lg== # */%>


<%
	/*
	*  Fichero: axisper047.jsp
	*  Fecha: 03/02/2009
	*/
%>
<%@ page contentType="text/html;charset=iso-8859-15"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:setLocale value="${sessionScope.__locale}" />
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
<link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
<link rel="stylesheet" href="styles/displaytag.css">
<c:import url="../include/carga_framework_js.jsp" />
<!--********** CALENDARIO ************************* -->
<!-- Hoja de estilo del Calendario -->
<link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
<!-- Script principal del calendario -->
<script type="text/javascript" src="scripts/calendar.js"></script>
<!-- Idioma del calendario, en funcin del Locale -->
<script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
<!-- Setup del calendario -->
<script type="text/javascript" src="scripts/calendar-setup.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script> -->
<!--*********************************** -->
<style>
.bold {
	font-weight: bold;
	font-size: 10px;
}

.campo {
	width: 200px;
}

.selectdisabled {
	background-color: transparent /* This hides the background */;
	background-image: none;
	-webkit-appearance: none /* Webkit Fix */;
	border: none;
	box-shadow: none;
}
</style>
<script language="Javascript" type="text/javascript">
	/****************************************************************************************/
	/*********************************** NAVEGACION *****************************************/
	/****************************************************************************************/

	function f_onload() {
		var ssarlaft = '${__formdata.SSARLAFT}';

		// Inicio IAXIS-3287 01/04/2019
		$("#miForm :input").change(function() {
        $("#miForm").data("changed",true);
        });
		var OK_acceptar = "${requestScope.OK_aceptar}"; 
		var sperson = '${__formdata.SPERSON}';
		
        if (!objUtiles.estaVacio(OK_acceptar)){
        	alert("${PRETEN_MENSAJES}");
            parent.f_but_cerrar_axisper047(sperson);
        }
        // Fin IAXIS-3287 01/04/2019
        
		<c:if test="${__formdata.ACTIONMOD != 'CONSULTA'}"> 
		/*
		Calendar.setup({
			inputField : "FCREA",
			ifFormat : "%d/%m/%Y",
			button : "icon_FCREA",
			singleClick : true,
			firstDay : 1
		});
		*/
		
		Calendar.setup({
			inputField : "EMP_FEXPEDICION",
			ifFormat : "%d/%m/%Y",
			button : "icon_EMP_FEXPEDICION",
			singleClick : true,
			firstDay : 1
		});
		/*Calendar.setup({
			inputField : "FNACIMIENTO",
			ifFormat : "%d/%m/%Y",
			button : "icon_FNACIMIENTO",
			singleClick : true,
			firstDay : 1
		});*/
		Calendar.setup({
			inputField : "FENTREVISTA",
			ifFormat : "%d/%m/%Y",
			button : "icon_FENTREVISTA",
			singleClick : true,
			firstDay : 1
		});
		/*Calendar.setup({
			inputField : "FEXPEDICDOC",
			ifFormat : "%d/%m/%Y",
			button : "icon_FEXPEDICDOC",
			singleClick : true,
			firstDay : 1
		});*/
		Calendar.setup({
			inputField : "FCONFIR",
			ifFormat : "%d/%m/%Y",
			button : "icon_FCONFIR",
			singleClick : true,
			firstDay : 1
		});
		Calendar.setup({
			inputField : "FRADICA",
			ifFormat : "%d/%m/%Y",
			button : "icon_FRADICA",
			singleClick : true,
			firstDay : 1
		});
		
		Calendar.setup({
			inputField : "FDILIGENCIA",
			ifFormat : "%d/%m/%Y",
			button : "icon_FDILIGENCIA",
			singleClick : true,
			firstDay : 1
		});
		
		/*Calendar.setup({
			inputField : "PER_FNACIMI",
			ifFormat : "%d/%m/%Y",
			button : "icon_PER_FNACIMI",
			singleClick : true,
			firstDay : 1
		});*/
		/*
		Calendar.setup({
			inputField : "PER_FEXPEDICION",
			ifFormat : "%d/%m/%Y",
			button : "icon_PER_FEXPEDICION",
			singleClick : true,
			firstDay : 1
		});*/
		
		</c:if>
		
		if(${__formdata.DET_SARLAFT.CVINTOMASE==4}){
			$("#TVINTOMASE").show();
		}else{
			$("#TVINTOMASE").hide();
		}
		if(${__formdata.DET_SARLAFT.CVINTOMBEN==4}){
			$("#TVINTOMBEM").show();		
		}else{
			$("#TVINTOMBEM").hide();
		}
		if(${__formdata.DET_SARLAFT.CVINASEBEN==4}){
			$("#TVINASEBEM").show();
		}else{
			$("#TVINASEBEM").hide();
		}	

		if(${__formdata.DET_SARLAFT.CVINCULACION==7}){
			$("#TVINCULACION").show();
		}else{
			$("#TVINCULACION").hide();
		}
	// Ini TCS_1560 - ACL - 11/02/2019	
	/*	var formdataCCIIU = '${__formdata.DET_SARLAFT.CCIIU}';
    	if (!objUtiles.estaVacio(formdataCCIIU)){
             f_onchange_CIIU();
    	}
    	                                                      
    	var formdataNCIIUPPAL = '${__formdata.DET_SARLAFT.NCIIUPPAL}';
    	
    	if (!objUtiles.estaVacio(formdataNCIIUPPAL)){
            f_onchange_NCIIUPPAL();
    	}   */
    	// Fin TCS_1560 - ACL - 11/02/2019
    	var formdataNCIIUSEC = '${__formdata.DET_SARLAFT.NCIIUSEC}';
    	if (!objUtiles.estaVacio(formdataNCIIUSEC)){
    		f_onchange_NCIIUSEC();
    	}
	//  Ini TCS_1560 - ACL - 11/02/2019 -- Validacion de condiciÃƒÂ³n para mostrar la secciÃƒÂ³n de personas publicas
	    if ($('#CPODPUB').length > 0 && $('#CVINPERPUB').length > 0) {
	    	if(document.getElementById("CPODPUB").value==0 && document.getElementById("CVINPERPUB").value==0 ){
		    	$("#td_LIT_89906137").hide();
			    $("#DS_89906137_children").hide();
	    	}else if (document.getElementById("CPODPUB").value==1 || document.getElementById("CVINPERPUB").value==1 )	{
	    		$("#td_LIT_89906137").show();
	    	}
	    }
	
	    if ($('#NRECPUB').length > 0) {
	    	if(document.getElementById("NRECPUB").value==0){
		    	$("#td_LIT_89906137").hide();
			    $("#DS_89906137_children").hide();
	    	}else if (document.getElementById("NRECPUB").value==1)	{
	    		$("#td_LIT_89906137").show();
	    	}
	    }
	    
	    if ($('#CTRAXMODEXT').length > 0 ) {
	    	if(document.getElementById("CTRAXMODEXT").value==0){
		    	$("#label_TTRAXMODEXT").hide();
			    $("#TTRAXMODEXT").hide();
	    	}else{
	    		$("#label_TTRAXMODEXT").show();
	    		$("#TTRAXMODEXT").show();	
	    	}
	    }
	    
	    if ($('#CTIPOEMP').length > 0 ) {
	    	
	    	if(document.getElementById("CTIPOEMP").value!=7){
	    		$("#label_TCUALTEMP").hide();
	    		$("#TCUALTEMP").hide();
	    	}else{
	    		$("#label_TCUALTEMP").show();
	    		$("#TCUALTEMP").show();	
	    	}
	    }
	    
        // Los siguientes campos al venir con un valor por defecto "0" (si están vacíos) desde la clase axisper047service 
        // se infiere que son nulos. Se les fija un valor vacío en lugar de "0" para poderlos validar con la función validaObligDesha().
	    
        var mand = ["PER_PAIS","PER_DEPARTAMENT","PER_CIUDAD","CCIIU", "NCIIUPPAL", "TPAIS", "TDEPATAMENTO", 
        	        "TCIUDAD","PER_PAISLUGNACIMI","PER_DEPLUGNACIMI","PER_LUGNACIMI","TNACIONALI1", "PER_NACION1", 
        	        "EMP_PAISLUGNACIMI", "EMP_DEPLUGNACIMI", "EMP_LUGNACIMI", "TNACIONALI2", "EMP_PAISEXPEDICION", 
        	        "EMP_DEPEXPEDICION","EMP_LUGEXPEDICION", "PER_PAISEXPEDICION", "PER_DEPEXPEDICION",
	    	        "PER_LUGEXPEDICION","EMP_CPAIRREPL","EMP_CDEPRREPL","EMP_CCIURREPL"];
        
        for (i=0; i< mand.length; i++){
        	if ($('#'+mand[i]).length > 0 ) {
    	    	if(document.getElementById(mand[i]).value==0){
    	    		objDom.setValorPorId(mand[i], "");
    	    	}
    	    }
        }
       
       f_cargar_propiedades_pantalla();	
		
	}

	function f_onchange_CPODPUB(CPODPUB) {
    	formdataCVINPERPUB = document.getElementById("CVINPERPUB").value;
	if ((CPODPUB == "0" || CPODPUB == '') && (formdataCVINPERPUB == "0" || formdataCVINPERPUB == '') ) {
	        	$("#td_LIT_89906137").hide();
			$("#DS_89906137_children").hide();
	        }else{
	                $("#td_LIT_89906137").show();
    		     	$("#DS_89906137_children").show();
	        }
    	}
	//  Fin TCS_1560 - ACL - 11/02/2019 
	
	function f_onchange_CVINPERPUB(CVINPERPUB) {
		formdataCPODPUB = document.getElementById("CPODPUB").value;
	    if ((CVINPERPUB == "0" || CVINPERPUB == '') && (formdataCPODPUB == "0" || formdataCPODPUB == '') ) {
	    	$("#td_LIT_89906137").hide();
			$("#DS_89906137_children").hide();
	    }else{
	    	$("#td_LIT_89906137").show();
    		$("#DS_89906137_children").show();
	    }
    }
	
	function f_onchange_NRECPUB(NRECPUB) {
		formdataNRECPUB = document.getElementById("NRECPUB").value;
	    if ((NRECPUB == "0" || NRECPUB == '') && (formdataNRECPUB == "0" || formdataNRECPUB == '') ) {
	    	$("#td_LIT_89906137").hide();
			$("#DS_89906137_children").hide();
	    }else{
	    	$("#td_LIT_89906137").show();
    		$("#DS_89906137_children").show();
	    }
    }
	
	function f_onchange_CTIPOEMP(CTIPOEMP) {
	    if ((CTIPOEMP != "7" || CTIPOEMP == '')) {
	    	objDom.setValorPorId("TCUALTEMP", "");
	    	$("#TCUALTEMP").hide();
	    	$("#label_TCUALTEMP").hide();
	    }else{
	    	$("#TCUALTEMP").show();
	    	$("#label_TCUALTEMP").show();
	    }
    }
	
	function f_onchange_CTRAXMODEXT(CTRAXMODEXT) {
	    if ((CTRAXMODEXT == "0" || CTRAXMODEXT == '')) {
	    	objDom.setValorPorId("TTRAXMODEXT", "");
	    	$("#TTRAXMODEXT").hide();
	    	$("#label_TTRAXMODEXT").hide();
	    }else{
	    	$("#TTRAXMODEXT").show();
	    	$("#label_TTRAXMODEXT").show();
	    }
    }
	
	function otroValorIngresar(){
		var cvintomase = jQuery("input[name=CVINTOMASE]:checked").val();
		var cvintomben = jQuery("input[name=CVINTOMBEN]:checked").val();
		var cvinaseben = jQuery("input[name=CVINASEBEN]:checked").val();
		if(cvintomase==4){
			$("#TVINTOMASE").show();
		}else{
			$("#TVINTOMASE").hide();
		}
		if(cvintomben==4){
			$("#TVINTOMBEM").show();		
		}else{
			$("#TVINTOMBEM").hide();
		}
		if(cvinaseben==4){
			$("#TVINASEBEM").show();
		}else{
			$("#TVINASEBEM").hide();
		}	
		  
	}
	function otroValorVinculacion(){
		var cvinculacion = jQuery("input[name=CVINCULACION]:checked").val();
		if(cvinculacion==7){
			$("#TVINCULACION").show();
		}else{
			$("#TVINCULACION").hide();
		}		  
	}
	
	
	function getTime(dato){
		var d = dato;
		var dateParts = new Date((Number(d.split("/")[2])), (Number(d.split("/")[1]) - 1), (Number(d.split("/")[0])));
		var dateis = dateParts.getTime();
		return dateis;
	}
	
	function cargar_pantalla_por_clase() {
		f_cargar_propiedades_pantalla();
		
	}

	function isNumberKey(evt)
	   {
	       var charCode = (evt.which) ? evt.which : event.keyCode
	       if (charCode > 31 && (charCode < 48 || charCode > 57))
	           return false;
	        return true;
	   }
	 
        
	// Inicio IAXIS-3287 01/04/2019
	 function f_but_duplicar(){

		 if ($("#miForm").data("changed")){
			 alert('Existen datos sin confirmar. Confírmelos antes de duplicar.');
		 } else{
			 ssarlaft = '${__formdata.SSARLAFT}';
			 if (objValidador.validaEntrada()) {
				 if (confirm('Al duplicar este formulario el mismo pasará a ser un histórico, desea continuar?')) {
					// Call to operation "duplicar" to save/duplicate the record.
		    		objUtiles.ejecutarFormulario("axis_axisper047.do", "duplicar", document.miForm, "_self", objJsMessages.jslit_cargando);
		    	 } else {
		    		 // Do nothing.
		    	 }
			 }	 
		 }	
		 
	 }
	 
	 function f_but_confirmar() {	
		 
		 var naci =  objDom.getValorPorId("PER_FNACIMI");
	        if(naci != null){
		        var numbers = naci.split('/');
		        var fecha_nacimiento = new Date(numbers[2], numbers[1]-1, numbers[0]);
		        fecha_nacimiento.setFullYear(fecha_nacimiento.getFullYear()+18);
	        }

	        var naci_juri =  objDom.getValorPorId("FNACIMIENTO");
	        if(naci_juri != null){        
		        var numbers_juri = naci_juri.split('/');
		        var fecha_nacimiento_juri = new Date(numbers_juri[2], numbers_juri[1]-1, numbers_juri[0]);
		        fecha_nacimiento_juri.setFullYear(fecha_nacimiento_juri.getFullYear()+18);
	        }
	        
	        var expe =  objDom.getValorPorId("PER_FEXPEDICION"); 
	        if(expe != null){   
		        var numbers1 = expe.split('/'); 
		        var fecha_expedicion = new Date(numbers1[2], numbers1[1]-1, numbers1[0]);
	        }
	        
	        var expe_juri =  objDom.getValorPorId("FEXPEDICDOC"); 
	        if(expe_juri != null){   
		        var numbers1_juri = expe_juri.split('/'); 
		        var fecha_expedicion_juri = new Date(numbers1_juri[2], numbers1_juri[1]-1, numbers1_juri[0]);
	        }
			
	        var fradica =  objDom.getValorPorId("FRADICA");
	        if( fradica != null ){   
	        	if (fradica.match(/-/) == '-'){
	        		var numbers1_fradica2 = fradica.split(/-/);
	        		objDom.setValorPorId("FRADICA",numbers1_fradica2[2]+'/'+(numbers1_fradica2[1])+'/'+numbers1_fradica2[0]);
	        	}
	        }
	        
	        if((naci != null && expe != null) || (naci_juri != null && expe_juri != null)){
	        	if(fecha_expedicion < fecha_nacimiento || fecha_expedicion_juri < fecha_nacimiento_juri )
	        		alert("<axis:alt f='axissin047' c='PER_FEXPEDICION' lit='89906167' />");
	        	else{
	        		if(validaObligDesha()){
	        			if (objValidador.validaEntrada()){
	        				if(validaSubtablas()){
	        					ssarlaft = '${__formdata.SSARLAFT}';
	        					var actual=new Date();
	        					var diligencia = document.miForm.FDILIGENCIA.value;
	        					var confirma = document.miForm.FCONFIR.value;
	        					if((getTime(document.miForm.FDILIGENCIA.value)<=getTime(document.miForm.FCONFIR.value)) || (diligencia != '' && confirma === '')){
	        						objAjax.invokeAsyncCGI("axis_axisper009.do",
										callBackResponse2,  
										"operation=aceptarSarlaft"+serial1("miForm")+"&CCONFIR=1",
										this, objJsMessages.jslit_actualizando_registro);
	        					} else{
	        						alert("<axis:alt f='axissin070' c='FDILIGENCIA' lit='9909965' />");	
							    }       
						    }
					    }			
				    }
			    }
	        }	
	 }	
	 
	function callBackResponse2(response){
		sperson = '${__formdata.SPERSON}';
        ssarlaft = '${__formdata.DET_SARLAFT.SSARLAFT}';
        f_onload(ssarlaft);
		parent.f_but_cerrar_axisper047(sperson);
	
	}	
	// Fin IAXIS-3287 01/04/2019
	
	function f_but_guardar() {
		
		var cconfir =  objDom.getValorPorId("CCONFIR");
		
        if (objUtiles.estaVacio(cconfir)){
        	// Si el código de verificación viene vacío (formulario no guardado anteriormente), se simula un guardado de usuario (cconfir=0)
        	// si el formulario está confirmado (cconfir==1), se deja como está para que siga estando confirmado.
        	cconfir = 0;
        }
        
        ssarlaft = '${__formdata.SSARLAFT}';
		var actual=new Date();
		var diligencia = document.miForm.FDILIGENCIA.value;
		var confirma = document.miForm.FCONFIR.value;
		
		objAjax.invokeAsyncCGI("axis_axisper009.do",
				               callBackResponse1,
				               "operation=aceptarSarlaft"+serial1("miForm")+"&CCONFIR="+cconfir, 
						       this, objJsMessages.jslit_actualizando_registro);	
	}

	function callBackResponse1(response){
        sperson = '${__formdata.SPERSON}';
        ssarlaft = '${__formdata.DET_SARLAFT.SSARLAFT}';
        f_onload(ssarlaft);
		//parent.f_but_cerrar_axisper047(sperson);
	}
	
	//Difícil que ocurra (que devuelva false) pues todos los campos siguientes vienen desde el módulo de personas.
	//Función para validar los campos que vienen vacíos desde Personas y son obligatorios.
	//Se crea una función aparte puesto que al estar deshabilitados no pueden 
	//validarse con objValidador.validaEntrada() ni tampoco con CFGs.
	function validaObligDesha(){
	
	    var elements = document.getElementById("miForm").elements;
	    var serialSar = ""; 
		var serialPer = "Campos vacíos obligatorios. Contacte al departamento de Personas para completar los siguientes campos: \n";
	    var contadorPers = 0;
	    var contadorSar = 0;
	    var mand = ["PER_PAPELLIDO", "PER_NOMBRES", "PER_TIPDOCUMENT", "PER_DOCUMENT",
	    	        "PER_FEXPEDICION", "PER_PAISEXPEDICION", "PER_DEPEXPEDICION", "PER_LUGEXPEDICION",
	    	        "PER_FNACIMI", "PER_NACION1", "PER_DIRERECI", "PER_PAIS", "PER_DEPARTAMENT",
	    	        "PER_CIUDAD", "PER_CELULAR", "NCIIUPPAL", "TOCUPACION","PER_PAISLUGNACIMI",
	    	        "PER_DEPLUGNACIMI","PER_LUGNACIMI", "PER_CDEPTOSOL", "PER_CCIUSOL","NRAZONSO",
	    	        "TNIT","TOFICINAPRI","TPAIS","TDEPATAMENTO","TCIUDAD","TTELEFONO","CCIIU","TREPRESENTANLE",
	    	        "TNOMBRES","NTIPDOC","TNUMDOC","FEXPEDICDOC","EMP_PAISEXPEDICION","EMP_DEPEXPEDICION","EMP_LUGEXPEDICION",
	    	        "FNACIMIENTO","EMP_PAISLUGNACIMI","EMP_DEPLUGNACIMI","EMP_LUGNACIMI","TNACIONALI1","TCELUREPL","EMP_TDIRSREPL",
	    	        "EMP_CPAIRREPL","EMP_CDEPRREPL","EMP_CCIURREPL","CDEPTOENTREV", "CCIUENTREV"]
	    
	    for(var i = 0 ; i < elements.length ; i++){
	    	
	    	var item = elements.item(i);
	        
	        for (j=0; j< mand.length; j++){ 
	    	    if (item.name == mand[j]){
	    	    	// Solo sarlaft. No tiene que ver con el departamento de Personas.
	    	    	if(item.name == "PER_PAISLUGNACIMI" || item.name =="PER_DEPLUGNACIMI" 
	    	           || item.name =="PER_LUGNACIMI" || item.name =="PER_CDEPTOSOL"
	    	           || item.name =="PER_CCIUSOL" || item.name =="EMP_PAISLUGNACIMI" || item.name =="EMP_DEPLUGNACIMI"
	    	        	   || item.name =="EMP_LUGNACIMI" || item.name =="CDEPTOENTREV" || item.name =="CCIUENTREV"){
	    	    		
	    	    		if(item.value == "" || item.value == null || item.value == 1000){
	    	    			serialSar += "-Campo '"+item.title+"': Campo obligatorio. \n";
	    	    			contadorSar += 1;	
	    	    	    }
	          	    // Tiene que ver con Personas.
	    	    	}else{
	          	    	if(item.value == "" || item.value == null || item.value == 1000){
	          	    		serialPer += "-Campo '"+item.title+"': Campo obligatorio. \n";
	          	    		contadorPers += 1;
	          	    }	    	
	    	   }
	       }
	     }
	   }   
	    if(contadorPers > 0){
	    	alert(serialPer);
		    return false;
	    }else if(contadorSar > 0){
	    	alert(serialSar);
	    	return false;
	    }
	    	
	  return true;   
	}
	
    // A la respuesta "Sí" de las preguntas:
    // - ¿Es usted una persona públicamente expuesta?
    // - ¿Existe algún vinculo entre usted y una persona considerada públicamente expuesta?
    // - ¿Alguno de los administradores (Representantes legales, miembros de la Junta Directiva) es una persona publicamente expuesta?		
    // - ¿Posee productos financieros en el exterior ?
    // - ¿Posee cuentas en moneda extranjera?
    // - ¿Ha presentado reclamaciones o ha recibido indemnizaciones en seguros en los dos últimos años?	
    // A la respuesta "No" de la pregunta 
    // -¿Es persona jurídica que cotiza en bolsa?
    // Se debe validar que sus respectivas secciones sean diligenciadas al menos con un registro.		
	function validaSubtablas(){
		
		// - ¿Es usted una persona públicamente expuesta?
	    // - ¿Existe algún vinculo entre usted y una persona considerada públicamente expuesta?
    	if ($('#CPODPUB').length > 0 && $('#CVINPERPUB').length > 0) {
	    	if((document.getElementById("CPODPUB").value==1 || document.getElementById("CVINPERPUB").value==1)  && (${empty __formdata.LISTAPEP}) ){
	    		alert("<axis:alt f='axissin047' c='CPODPUB' lit='89907035' />");
				return false;
	    	}
	    }
	// ¿Alguno de los administradores (Representantes legales, miembros de la Junta Directiva) es una persona publicamente expuesta?	
       if($('#NRECPUB').length > 0){
	    	if((document.getElementById("NRECPUB").value==1) && (${empty __formdata.LISTAPEP})  ){
	    		alert("<axis:alt f='axissin047' c='NRECPUB' lit='89907035' />");
				return false;
	    	}
	    }
       // - ¿Posee productos financieros en el exterior ?
       // - ¿Posee cuentas en moneda extranjera?
       if($('#CPRODFINEXT').length > 0 && $('#CCTAMODEXT').length > 0){
	    	if(((document.getElementById("CPRODFINEXT").value==1) || (document.getElementById("CCTAMODEXT").value==1))&& (${empty __formdata.LISTAARLAFTB}) ){
	    		alert("<axis:alt f='axissin047' c='CPRODFINEXT' lit='89907036' />");
				return false;
	    	}
	    }
       // - ¿Ha presentado reclamaciones o ha recibido indemnizaciones en seguros en los dos últimos años?	
       if($('#TPRESETRECLAMACI').length > 0 ){
	    	if((document.getElementById("TPRESETRECLAMACI").value==1) && (${empty __formdata.LISTAARLAFTC}) ){
	    		alert("<axis:alt f='axissin047' c='TPRESETRECLAMACI' lit='89907037' />");
				return false;
	    	}
	    }
       // ¿Es persona jurídica que cotiza en bolsa?
       if(${!empty __formdata.LISTAACC}){
	       var oblConAmpAcc = new Boolean(${__formdata.oblConAmpAcc});
    	   if(oblConAmpAcc == true && ${empty __formdata.LISTABEN}){
	    		alert("<axis:alt f='axissin047' c='LISTABEN' lit='89907038' />");
				return false;
	    	}
	    }
		return true;
	}	
	
	function serial1(form){
		var ssarlaft = '${__formdata.SSARLAFT}';
		objDom.setValorPorId("SSARLAFT",ssarlaft);
		var elements = document.getElementById(form).elements;
	    var serial="";
	    var contador = 0;
	    for(var i = 0 ; i < elements.length ; i++){
	        var item = elements.item(i);
	        if (item.name == "SSARLAFT"){
	        	contador= contador +1;
	        }
	        if(item.name != "CVINCULACION" && item.name != "RESOCIEDAD" && item.name != "CVINTOMASE" && item.name != "CVINTOMBEN" && item.name != "CVINASEBEN" && item.name != "SSARLAFT" && item.name != "CCONFIR"){
	        	serial+="&"+item.name+"="+item.value;        
	        }
	        else if (item.name == "SSARLAFT" && contador == 1 ){
	        	serial+="&"+item.name+"="+item.value;		        
	        }
	        else if(item.checked &&  item.name != "SSARLAFT")
	        	serial+="&"+item.name+"="+item.value;
	    }
	    return serial;
	}
	
	function f_but_salir() {  //INI TCS-9 AP 12/02/2019
        sperson = '${__formdata.SPERSON}';
		parent.f_but_cerrar_axisper047(sperson);
	}
	
	function f_but_cerrar_axisper047_a(){
		objUtiles.cerrarModal("axisper047_a");
		var ntipdoc = "${__formdata.tipo_documento}" ;
		var persona_natural = new Boolean(${__formdata.PERSONANATURAL});
		if ( persona_natural == true ){
			document.miForm.action="axis_axisper047.do?operation=aceptar&PER_TIPDOCUMENT="+ntipdoc;
		} else {
			document.miForm.action="axis_axisper047.do?operation=aceptar&NTIPDOC="+ntipdoc;
		}
		document.miForm.target="_self";       
        document.miForm.submit();  
	}
	function f_but_cerrar_axisper047_b(){
		objUtiles.cerrarModal("axisper047_b");
		var ntipdoc = "${__formdata.tipo_documento}" ;
		var persona_natural = new Boolean(${__formdata.PERSONANATURAL});
		if ( persona_natural == true ){
			document.miForm.action="axis_axisper047.do?operation=aceptar&PER_TIPDOCUMENT="+ntipdoc;
		} else {
			document.miForm.action="axis_axisper047.do?operation=aceptar&NTIPDOC="+ntipdoc;
		}
		
		document.miForm.target="_self";       
        document.miForm.submit();  
	}
	function f_but_cerrar_axisper047_c(){
		objUtiles.cerrarModal("axisper047_c");
		var ntipdoc = "${__formdata.tipo_documento}" ;
		var persona_natural = new Boolean(${__formdata.PERSONANATURAL});
		if ( persona_natural == true ){
			document.miForm.action="axis_axisper047.do?operation=aceptar&PER_TIPDOCUMENT="+ntipdoc;
		} else {
			document.miForm.action="axis_axisper047.do?operation=aceptar&NTIPDOC="+ntipdoc;
		}
		document.miForm.target="_self";       
        document.miForm.submit();  
	}
	function f_but_cerrar_axisper051(){
		objUtiles.cerrarModal("axisper051");

	}
	function f_but_cerrar_axisper052(){
		objUtiles.cerrarModal("axisper052");

	}
	
		
	function f_abrir_axisper047_a(){
		//Se guarda el formulario actual cada que se una cada pantalla modal para mantener la consistencia de datos del formulario.
		f_but_guardar();
		objUtiles.abrirModal("axisper047_a", "src",
				"axis_axisper047_a.do?operation=forma&MODOSARLAFT=EDICION&SPERSON=${__formdata.SPERSON}&SSARLAFT=${__formdata.SSARLAFT}");
	}
	function f_abrir_axisper051(){		
		//Se guarda el formulario actual cada que se una cada pantalla modal para mantener la consistencia de datos del formulario.
		f_but_guardar();
		objUtiles.abrirModal("axisper051", "src",
				"modal_axisper051.do?operation=form&MODOSARLAFT=EDICION&SPERSON=${__formdata.SPERSON}&SSARLAFT=${__formdata.DET_SARLAFT.SSARLAFT}");
	}
	function f_abrir_axisper052(){	
		//Se guarda el formulario actual cada que se una cada pantalla modal para mantener la consistencia de datos del formulario.
		f_but_guardar();
		objUtiles.abrirModal("axisper052", "src",
				"modal_axisper052.do?operation=form&MODOSARLAFT=EDICION&SPERSON=${__formdata.SPERSON}&SSARLAFT=${__formdata.DET_SARLAFT.SSARLAFT}");
	}
		
	function f_abrir_axisper047_b(){
		//Se guarda el formulario actual cada que se una cada pantalla modal para mantener la consistencia de datos del formulario.
		f_but_guardar();
		objUtiles.abrirModal("axisper047_b", "src",
		"axis_axisper047_b.do?operation=formb&MODOSARLAFT=EDICION&SPERSON=${__formdata.SPERSON}&SSARLAFT=${__formdata.SSARLAFT}");
	}
	function f_abrir_axisper047_c(NRECLA, MODO){
		//Se guarda el formulario actual cada que se una cada pantalla modal para mantener la consistencia de datos del formulario.
		f_but_guardar();
		objUtiles.abrirModal("axisper047_c", "src",
		"axis_axisper047_c.do?operation=formc&MODOSARLAFT="+MODO+"&SPERSON=${__formdata.SPERSON}&SSARLAFT=${__formdata.SSARLAFT}"+"&NRECLA="+NRECLA);
	}
		
	function callBackResponse(response){
		var ntipdoc = "${__formdata.tipo_documento}" ;
		var persona_natural = new Boolean(${__formdata.PERSONANATURAL});
		if ( persona_natural == true ){
			document.miForm.action="axis_axisper047.do?operation=aceptar&PER_TIPDOCUMENT="+ntipdoc;
		} else {
			document.miForm.action="axis_axisper047.do?operation=aceptar&NTIPDOC="+ntipdoc;
		}
		document.miForm.target="_self";       
        document.miForm.submit();  
	}
	function borrar_sarlaft_a(SPERSON,SSARLAFT,IDSARLAFT) {
		objAjax.invokeAsyncCGI("axis_axisper047.do",
				callBackResponse,
				"operation=borrar_sarlaft&SPERSON="+SPERSON+"&SSARLAFT="+SSARLAFT+"&DETSARLAFT=1"+"&IDSARLAFT="+IDSARLAFT,
				this, objJsMessages.jslit_actualizando_registro);		
	}
	function borrar_sarlaft_b(SPERSON,SSARLAFT,IDSARLAFT) {
		objAjax.invokeAsyncCGI("axis_axisper047.do",
				callBackResponse,
				"operation=borrar_sarlaft&SPERSON="+SPERSON+"&SSARLAFT="+SSARLAFT+"&DETSARLAFT=2"+"&IDSARLAFT="+IDSARLAFT,
				this, objJsMessages.jslit_actualizando_registro);
	}
	function borrar_sarlaft_c(SPERSON,SSARLAFT,IDSARLAFT) {
		objAjax.invokeAsyncCGI("axis_axisper047.do",
				callBackResponse,
				"operation=borrar_sarlaft&SPERSON="+SPERSON+"&SSARLAFT="+SSARLAFT+"&DETSARLAFT=3"+"&IDSARLAFT="+IDSARLAFT,
				this, objJsMessages.jslit_actualizando_registro);
	}

 	var itemp="";
 	var itemd="";
 	var itemmc="";
 	var itemnp="";
 	var itemnd="";
 	var itemmnc="";
 	var itempboolean=false;
 	var itemdboolean=false;
 	var itemmboolean=false;
	function f_pais(pais,dep,ciudad,npais){
		itemp=pais;
		itemnp=npais;
		itempboolean=true;
		itemdboolean=false;
		itemmboolean=false;
		f_abrir_axiscom001('152430', 'LISTA_PAIS', null);
		objDom.setValorPorId(dep,"");
		objDom.setValorPorId(ciudad,"");
	}
	function f_dep(pais,dep,ciudad,ndep){
		itemd=dep;
		itemnd=ndep;
		itempboolean=false;
		itemdboolean=true;
		itemmboolean=false;
		if(objDom.getValorPorId(pais)!=null || objDom.getValorPorId(pais)!=""){
			f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', objDom.getValorPorId(pais));
			objDom.setValorPorId(ciudad,"");
		}else{
			alert("seleccione el pais");
		}
	}
	function f_ciudad(pais,dep,ciudad,nciudad){
		itemmc=ciudad;
		itemmnc=nciudad;
		itempboolean=false;
		itemdboolean=false;
		itemmboolean=true;
		if(objDom.getValorPorId(dep)!=null || objDom.getValorPorId(dep)!=""){
			f_abrir_axiscom001('152432', 'LISTA_POBLACION', objDom.getValorPorId(dep), null);
		}else{
			alert("Seleccione el departamento");
		}
	}
	
	function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION,CODIGO_CP){
        objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
         "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION + "&CODIGO_CP=" + CODIGO_CP);
   }
	
	function f_aceptar_axiscom001(CODIGO, TEXTO, CODIGO_CONSULTA,CPROVIN){
		f_cerrar_axiscom001();
		
		if(itempboolean){
			objDom.setValorPorId(itemp,CODIGO);
			objDom.setValorPorId(itemnp,TEXTO);
		}
		if(itemdboolean){
			objDom.setValorPorId(itemd,CODIGO);
			objDom.setValorPorId(itemnd,TEXTO);
		}
		if(itemmboolean){
			objDom.setValorPorId(itemmc,CODIGO);
			objDom.setValorPorId(itemmnc,TEXTO);
		}
		
    }
	
	function f_cerrar_axiscom001() {
        objUtiles.cerrarModal("axiscom001");
    }
	
// Ini TCS_1560 - ACL - 11/02/2019	
    /*	function f_onchange_CIIU() {
		var CIIU=objDom.getValorPorId("CCIIU");
        if (!objUtiles.estaVacio(CIIU)){
            var qs="operation=ajax_ciiu";
            qs=qs+"&CIIU="+CIIU;
            var origen = 'CIIU';
            objAjax.invokeAsyncCGI("modal_axisper047.do", callbackajaxciiu, qs, this, null, origen)
        } 
    }
	
	function f_onchange_NCIIUPPAL() {
		var CIIU=objDom.getValorPorId("NCIIUPPAL");
        if (!objUtiles.estaVacio(CIIU)){
            var qs="operation=ajax_ciiu";
            qs=qs+"&CIIU="+CIIU;
            var origen = 'CIIU';
           objAjax.invokeAsyncCGI("modal_axisper047.do", callbackajaxciiuppal, qs, this, null, origen)
        }
      
    }     */
 // Fin TCS_1560 - ACL - 11/02/2019	
	function f_onchange_NCIIUSEC() {
		var CIIU=objDom.getValorPorId("NCIIUSEC");
        if (!objUtiles.estaVacio(CIIU)){
            var qs="operation=ajax_ciiu";
            qs=qs+"&CIIU="+CIIU;
            var origen = 'NCIIUSEC';
            objAjax.invokeAsyncCGI("axis_axisper047.do", callbackajaxciiusec, qs, this, null, origen)
        }  
    }
	
 // Ini TCS_1560 - ACL - 11/02/2019		
	/*	 function callbackajaxciiu (ajaxResponseText,origen){
         try{ 
         
             
             var doc = objAjax.domParse(ajaxResponseText);
             if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                 if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CIIU")[0])) {
                     if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                         objDom.setValorPorId("CIIU", "");
                         objDom.setValorPorId("TACTIACA", "");
                         //objDom.setValorHTMLPorId("TCCIIU_span", "<b></b>");
                         limpiaCampos("CIIU");
                        
                     }else{
                     
                     	
                         objDom.setValorPorId("CIIU", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CIIU"), 0, 0));
                        
                         if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TCIIU")[0])){

                        	 objDom.setValorPorId("TACTIACA", objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCIIU"), 0, 0));
                             //objDom.setValorHTMLPorId("TCCIIU_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCIIU"), 0, 0) + "</b>");
                             
                             limpiaCampos("CIIU");
                         }
                     }
                 }
                 }
         } catch (e) {
            if (isDebugAjaxEnabled == "true")
             alert (e.name + " " + e.message);
         }
     }
	 
	 
	 function callbackajaxciiuppal (ajaxResponseText,origen){
		try{ 
         
             
             var doc = objAjax.domParse(ajaxResponseText);
             if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                 if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CIIU")[0])) {
                     if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                         objDom.setValorPorId("NCIIUPPAL", "");
                         objDom.setValorHTMLPorId("TCCIIUPPAL_span", "<b></b>");
                         limpiaCampos("CIIU");
                        
                     }else{
                     
                     	
                         objDom.setValorPorId("NCIIUPPAL", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CIIU"), 0, 0));
                        
                         if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TCIIU")[0])){
                         
                             objDom.setValorHTMLPorId("TCCIIUPPAL_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCIIU"), 0, 0) + "</b>");
                             
                             limpiaCampos("CIIU");
                         }
                     }
                 }
                 }
         } catch (e) {
            if (isDebugAjaxEnabled == "true")
             alert (e.name + " " + e.message);
         }
     }
	 */
	 function callbackajaxciiusec (ajaxResponseText,origen){
		 try{ 
             var doc = objAjax.domParse(ajaxResponseText);
             if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                 if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NCIIUSEC")[0])) {        
                     if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                         objDom.setValorPorId("NCIIUSEC", "");
                         objDom.setValorPorId("TCCIIUSEC", "");                          
                     }else{
                         objDom.setValorPorId("NCIIUSEC", objDom.getValorNodoDelComponente(doc.getElementsByTagName("NCIIUSEC"), 0, 0));                          
                         if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TCCIIUSEC")[0])){
                        	 objDom.setValorPorId("TCCIIUSEC", objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCCIIUSEC"), 0, 0));
                         }
                     }
                 }else{
                 	objDom.setValorPorId("NCIIUSEC", "");
                 	objDom.setValorPorId("TCCIIUSEC", "");
                 }
                 }else{
                 	objDom.setValorPorId("NCIIUSEC", "");
                 	objDom.setValorPorId("TCCIIUSEC", "");
                 }
         }catch (e) {
             if (isDebugAjaxEnabled == "true")
             alert (e.name + " " + e.message);
         }
     } 
     
	 
	 
	/****************************************************************************************/
    /************************************** MODAL *******************************************/
    /****************************************************************************************/
     
	/****************************************************************************************/
    /************************************** AXISCIIU001****************************************/
    /****************************************************************************************/  
    
    function f_abrir_axisciiu001(cciiu, tcciiu, CODIGO, LITERAL){
    	 itemc=cciiu;
		 itemnc=tcciiu;
         objUtiles.abrirModal("axisciiu001", "src", "modal_axisciiu001.do?operation=form&CODIGO=" + CODIGO +"&LITERAL=" + LITERAL);
         objDom.setValorPorId(itemc, "");
         objDom.setValorHTMLPorId(itemnc, "");
	}
    
    function f_aceptar_axisciiu001(CODIGO, TEXTO){
        f_cerrar_axisciiu001();
        if (!objUtiles.estaVacio(TEXTO)){
        	objDom.setValorPorId(itemc,CODIGO);
        	if(itemnc == "TACTIACA" || itemnc == "TCCIIUPPAL" || itemnc == "TCCIIUSEC")
        		objDom.setValorPorId(itemnc,TEXTO);
        	else
				objDom.setValorHTMLPorId(itemnc, "<b>" + TEXTO + "</b>");
         }else{   
            limpiaCampos(itemc);
         }
    }
     // Fin TCS_1560 - ACL - 11/02/2019
    function limpiaCampos (CAMPO){
   
            //Limpio poblacin
            objDom.setValorPorId(CAMPO, "");
            objDom.setValorHTMLPorId(CAMPO+"_span", "");
        
    }
    
    function f_cerrar_axisciiu001() {
        objUtiles.cerrarModal("axisciiu001");
    } 
     
	/****************************************************************************************/
    /******************************JGONZALEZ - INGENIUM DATA ********************************/
    /****************************************************************************************/  
   /** INI CP0416M_SYS_PERS  18/12/2018 ACL*/
  /**  function f_cargar_DATOSPERSONA() {
		var DOCUMENTO1=objDom.getValorPorId("TNUMDOC");
		var DOCUMENTO2=objDom.getValorPorId("PER_DOCUMENT");
		var documento = "";
		
		if (!objUtiles.estaVacio(DOCUMENTO1))
			documento = DOCUMENTO1;

		if (!objUtiles.estaVacio(DOCUMENTO2))
			documento = DOCUMENTO2;
		
		if (!objUtiles.estaVacio(documento))
        	objUtiles.ejecutarFormulario("axis_axisper047.do?cargaPersona=true&Bandera=false&documentoNuevo=" + documento, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
	
    function f_cargar_DATOSNIT() {
		var DOCUMENTO=objDom.getValorPorId("TNIT");
		var nit = "";

		if (!objUtiles.estaVacio(DOCUMENTO))
			nit = DOCUMENTO;
		
		if (!objUtiles.estaVacio(nit))
        	objUtiles.ejecutarFormulario("axis_axisper047.do?cargaPersona=true&Bandera=true&tnit=" + nit , "form", document.miForm, "_self", objJsMessages.jslit_cargando);
    } */
    /* FIN CP0416M_SYS_PERS  18/12/2018 ACL */
	function f_aceptar_per_beneficiarios(IDENTIFICACION, CTIPIDEN, NNUMIDE, TNOMBRE, PPARTICI, TSOCIEDAD, NNUMIDESOC){
		objUtiles.ejecutarFormulario("axis_axisper047.do?IDENTIFICACION="+IDENTIFICACION+"&CTIPIDEN="+CTIPIDEN+"&NNUMIDE="+NNUMIDE+"&TNOMBRE="+TNOMBRE+"&PPARTICI="+PPARTICI+"&TSOCIEDAD="+TSOCIEDAD+"&NNUMIDESOC="+NNUMIDESOC
				                     , "grabar_beneficiarios", document.miForm, "_self", objJsMessages.jslit_cargando);
	}

	function f_aceptar_per_expuestas(IDENTIFICACION, CTIPREL, CTIPIDEN, TNOMBRE, NNUMIDE, CNACIONALIDAD, TNACIONALIDAD, TENTIDAD, HTCARGO, FDESVIN){
		objUtiles.ejecutarFormulario("axis_axisper047.do?IDENTIFICACION="+IDENTIFICACION+"&CTIPREL="+CTIPREL+"&CTIPIDEN="+CTIPIDEN+"&TNOMBRE="+TNOMBRE+"&NNUMIDE="+NNUMIDE+"&CNACIONALIDAD="+CNACIONALIDAD+"&TNACIONALIDAD="+TNACIONALIDAD+
									 "&TENTIDAD="+TENTIDAD+"&HTCARGO="+HTCARGO+"&FDESVIN="+FDESVIN
				                     , "grabar_expuestas", document.miForm, "_self", objJsMessages.jslit_cargando);
	}
	
    function f_open_axisper052(PIDENTIFICACION, PSSARLAFT, XCTIPIDEN, XNNUMIDE, XTNOMBRE, XPPARTICI, XTSOCIEDAD, XNNUMIDESOC) {
   		f_but_guardar();
   		objUtiles.abrirModal("axisper052", "src", "modal_axisper052.do?operation=form&IDENTIFICACION="+PIDENTIFICACION+"&XSSARLAFT="+PSSARLAFT+"&XCTIPIDEN="+XCTIPIDEN+"&XNNUMIDE="+XNNUMIDE+"&XTNOMBRE="+XTNOMBRE+"&XPPARTICI="+XPPARTICI
   							+"&XTSOCIEDAD="+XTSOCIEDAD+"&XNNUMIDESOC="+XNNUMIDESOC+"&XACTION=EDITAR");	   		
   	}
	
    function f_open_axisper051(PIDENTIFICACION, PSSARLAFT, XCTIPREL, XTNOMBRE, XCTIPIDEN, XNNUMIDE, XCPAIS, XTPAIS, XTENTIDAD, XTCARGO, XFDESVIN) {
    	f_but_guardar();
   		objUtiles.abrirModal("axisper051", "src", "modal_axisper051.do?operation=form&IDENTIFICACION="+PIDENTIFICACION+"&XCTIPREL="+XCTIPREL+"&XSSARLAFT="+PSSARLAFT+"&XTNOMBRE="+XTNOMBRE+"&XCTIPIDEN="+XCTIPIDEN+"&XNNUMIDE="+XNNUMIDE+"&XCPAIS="+XCPAIS
   							+"&XTPAIS="+XTPAIS+"&XTENTIDAD="+XTENTIDAD+"&XTCARGO="+XTCARGO+"&XFDESVIN="+XFDESVIN+"&XACTION=EDITAR");	   		
   	}
    
    function f_open_accionistas(AIDENTIFICACION, ASSARLAFT, ACTIPIDEN, ANNUMIDE, ATNOMBRE, APPARTICI, ACBOLSA, ACPEP, ACTRIBUEXT) {
    	f_but_guardar();
   		objUtiles.abrirModal("axisper047_a", "src", "axis_axisper047_a.do?operation=form&IDENTIFICACION="+AIDENTIFICACION+"&SSARLAFT="+ASSARLAFT+"&CTIPIDEN="+ACTIPIDEN+"&NNUMIDE="+ANNUMIDE+"&TNOMBRE="+ATNOMBRE+"&PPARTICI="+APPARTICI
   							+"&CBOLSA="+ACBOLSA+"&CPEP="+ACPEP+"&CTRIBUEXT="+ACTRIBUEXT+"&ACTION=EDITAR");	   		
   	}
    
    function f_open_internacionales(INACTIVI, ISPERSON, ISSARLAFT, ICTIPOPROD, ICIDNUMPROD, ITENTIDAD, ICMONTO, ICCIUDAD, ISCCIUDAD, ICPAIS, ISCPAIS, ICMONEDA, ITDEPB, ISTDEPB) {
    	f_but_guardar();
   		objUtiles.abrirModal("axisper047_b", "src", "axis_axisper047_b.do?operation=formb&NACTIVI="+INACTIVI+"&SPERSON="+ISPERSON+"&SSARLAFT="+ISSARLAFT+"&CTIPOPROD="+ICTIPOPROD+"&CIDNUMPROD="+ICIDNUMPROD+"&TENTIDAD="+ITENTIDAD+"&CMONTO="+ICMONTO
   							+"&CCIUDAD="+ICCIUDAD+"&SCCIUDAD="+ISCCIUDAD+"&CPAIS="+ICPAIS+"&SCPAIS="+ISCPAIS+"&CMONEDA="+ICMONEDA+"&TDEPB="+ITDEPB+"&STDEPB="+ISTDEPB+"&ACTION=EDITAR");	   		
   	}
    
    function borrar_sarlaft_ben (SSARLAFT, IDENTIFICACION){
	   objAjax.invokeAsyncCGI("axis_axisper047.do",
				callBackResponse,
				"operation=borrar_sarlaft&SSARLAFT="+SSARLAFT+"&DETSARLAFT=4"+"&IDENTIFICACION="+IDENTIFICACION,
				this, objJsMessages.jslit_actualizando_registro);
    }
    
    function borrar_sarlaft_exp (SSARLAFT, IDENTIFICACION){
	   objAjax.invokeAsyncCGI("axis_axisper047.do",
				callBackResponse,
				"operation=borrar_sarlaft&SSARLAFT="+SSARLAFT+"&DETSARLAFT=5"+"&IDENTIFICACION="+IDENTIFICACION,
				this, objJsMessages.jslit_actualizando_registro);
    }
    
    function borrar_sarlaft_acci (SSARLAFT, IDENTIFICACION){
	   objAjax.invokeAsyncCGI("axis_axisper047.do",
				callBackResponse,
				"operation=borrar_sarlaft&SSARLAFT="+SSARLAFT+"&DETSARLAFT=6"+"&IDENTIFICACION="+IDENTIFICACION,
				this, objJsMessages.jslit_actualizando_registro);
    }
	
</script>
</head>
<body onload="f_onload()">


	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axiscga001" c="DOCU_REQUERIDA" lit="9902423" />
		</c:param>
		<c:param name="nid" value="axisper047_a" />
	</c:import>
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axiscga001" c="DOCU_REQUERIDA" lit="9902423" />
		</c:param>
		<c:param name="nid" value="axisper047_b" />
	</c:import>
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axiscga001" c="DOCU_REQUERIDA" lit="9902423" />
		</c:param>
		<c:param name="nid" value="axisper047_c" />
	</c:import>

	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisciiu001|axisciiu001</c:param>
	</c:import>


	<form name="miForm" id="miForm" action="" method="POST">
		<input type="hidden" name="operation" value="" />

		<c:if test="${!__formdata.PERSONANATURAL}">
			<c:import url="../include/titulo_nt.jsp">
				<c:param name="producto">
					<axis:alt f="axisper047" c="TITULO" lit="9909577" />
				</c:param>
				<c:param name="formulario">
					<axis:alt f="axisper047" c="TITULO" lit="9909577" />
				</c:param>
				<c:param name="form">axisper047</c:param>
			</c:import>
		</c:if>
		<c:if test="${__formdata.PERSONANATURAL}">

			<c:import url="../include/titulo_nt.jsp">
				<c:param name="producto">
					<axis:alt f="axisper047" c="TITULO" lit="9909576" />
				</c:param>
				<c:param name="formulario">
					<axis:alt f="axisper047" c="TITULO" lit="9909576" />
				</c:param>
				<c:param name="form">axisper047</c:param>
			</c:import>
		</c:if>
		<c:import url="../include/modal_estandar.jsp">
			<c:param name="titulo">
				<axis:alt f="axiscga002" c="TIT_AXISPER001" lit="102068" />
			</c:param>
			<c:param name="nid" value="axiscom001" />
		</c:import>
		<c:import url="../include/modal_estandar.jsp">
			<c:param name="titulo">
				<axis:alt f="axisper051" c="TIT_AXISPER051" lit="89906137" />
			</c:param>
			<c:param name="nid" value="axisper051" />
		</c:import>
		<c:import url="../include/modal_estandar.jsp">
			<c:param name="titulo">
				<axis:alt f="axisper051" c="TIT_AXISPER052" lit="89906138" />
			</c:param>
			<c:param name="nid" value="axisper052" />
		</c:import>
			<input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}" /> 
            <input type="hidden" name="CCONFIR" id="CCONFIR" value="${__formdata.DET_SARLAFT.CCONFIR}" />
            <input type="hidden" name="FRADICA" id="FRADICA" value="${__formdata.DET_SARLAFT.FRADICA}" />
			<input type="hidden" name="ACTIONMOD" id="ACTIONMOD" value="${__formdata.ACTIONMOD}" />

		
		<table class="seccion" style="width: 90%;" align="center">
			<tbody>
				<tr>
					<td>
						<table class="area">
							<tr>
							<axis:ocultar dejarHueco="false" f="axisper047" c="SSARLAFT">
									<td><span class="bold"><axis:alt f="axisper047"
												c="SSARLAFT" lit="89906223"></axis:alt></span><br /> <input
										type="text" name="SSARLAFT" id="SSARLAFT" size="15"
										class="campo campotexto"
										value="${__formdata.SSARLAFT}"
										title="<axis:alt f='axisper047' c='SSARLAFT' lit='89906223'/>"
										alt="<axis:alt f='axisper047' c='SSARLAFT' lit='89906223'/>"
										<axis:atr f="axisper047" c="SSARLAFT" a="modificable=false&obligatorio=false"/> />
										</td>
								</axis:ocultar>
								<axis:ocultar dejarHueco="false" f="axisper047" c="FDILIGENCIA">
									<td><span class="bold"><axis:alt f="axisper047"
												c="FDILIGENCIA" lit="9909578"></axis:alt></span><br /> <jsp:useBean id="today" class="java.util.Date" />  <input
										type="text" name="FDILIGENCIA" id="FDILIGENCIA" size="15"
										class="campo campotexto"
										value="<c:choose><c:when test="${empty __formdata.DET_SARLAFT.FDILIGENCIA}"><fmt:formatDate pattern="dd/MM/yyyy" value="${today}"/></c:when><c:otherwise><fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.DET_SARLAFT.FDILIGENCIA}"/></c:otherwise></c:choose>"
										title="<axis:alt f='axisper047' c='FDILIGENCIA' lit='9909578'/>"
										alt="<axis:alt f='axisper047' c='FDILIGENCIA' lit='9909578'/>"
										<axis:atr f="axisper047" c="FDILIGENCIA" a="formato=fecha&modificable=true&obligatorio=true"/> />
										<a style="vertical-align: middle;"> 
										<c:if
																			test="${__formdata.ACTIONMOD != 'CONSULTA'}">
																			<img id="icon_FDILIGENCIA"
																				alt="<axis:alt f="axisper047" c="FDILIGENCIA" lit="9909578"/>"
																				title="<axis:alt f="axisper047" c="FDILIGENCIA" lit="9909578" />"
																				src="images/calendar.gif" />
																		</c:if>
									</a></td>
								</axis:ocultar>								
								
								<axis:ocultar dejarHueco="false" f="axisper047"
									c="PER_CDEPTOSOL">
									<td><span class="bold"><axis:alt f="axisper047"
												c="PER_CDEPTOSOL" lit="9902610"></axis:alt></span><br /> <input
										type="text" name="PER_CDEPTOSOL" style="width: 40px;"
										id="PER_CDEPTOSOL" readonly="readonly"
										value="${__formdata.DET_SARLAFT.PERCDEPTOSOL}"
										class="campowidthinput campo campotexto"
										<axis:atr f="axisper047" c="PER_CDEPTOSOL" a="modificable=true&obligatorio=false"/>
										alt="<axis:alt f="axisper047" c="PER_CDEPTOSOL" lit="9902610" />"
										title="<axis:alt f="axisper047" c="PER_CDEPTOSOL" lit="9902610" />" />
										 <axis:visible c="DSP_FIND" f="axisper047">
										<img id="findPais" border="0" src="images/find.gif"
										onclick="f_dep('TPAIS','PER_CDEPTOSOL','PER_TCIUSOL','PER_TDEPTOSOL')"
										style="cursor: pointer" /></axis:visible>
										<input type="text"
										name="PER_TDEPTOSOL" id="PER_TDEPTOSOL"
										value="${__formdata.DET_SARLAFT.PERTDEPTOSOL}"
										class="campowidthinput campo campotexto"
										style="width: 70px;" readonly="readonly"
										<axis:atr f="axisper047" c="PER_TDEPTOSOL" a="modificable=true&obligatorio=false"/>
										alt="<axis:alt f="axisper047" c="PER_TDEPTOSOL" lit="9902610" />"
										title="<axis:alt f="axisper047" c="PER_TDEPTOSOL" lit="9902610" />" /></td>
								</axis:ocultar>								
								<axis:ocultar dejarHueco="false" f="9902610" c="PER_CCIUSOL">
									<td><span class="bold"><axis:alt f="9902610"
												c="PER_CCIUSOL" lit="9908410"></axis:alt></span><br /> <input
										type="text" name="PER_CCIUSOL" id="PER_CCIUSOL"
										readonly="readonly" style="width: 40px;"
										value="${__formdata.DET_SARLAFT.PERCCIUSOL}"
										class="campowidthinput campo campotexto"
										<axis:atr f="9902610" c="PER_CCIUSOL" a="modificable=true&obligatorio=false"/>
										alt="<axis:alt f="9902610" c="PER_CCIUSOL" lit="9908410" />"
										title="<axis:alt f="9902610" c="PER_CCIUSOL" lit="9908410" />" />
										<axis:visible c="PER_CCIUSOL_FIND" f="axisper047">
										<img id="findCiudadSol" border="0" src="images/find.gif"
										onclick="f_ciudad('PER_PAIS','PER_CDEPTOSOL','PER_CCIUSOL','PER_TCIUSOL')"
										style="cursor: pointer" /></axis:visible>
										
										<input type="text"
										name="PER_TCIUSOL" id="PER_TCIUSOL"
										value="${__formdata.DET_SARLAFT.PERTCIUSOL}"
										class="campowidthinput campo campotexto" style="width: 70px;"
										<axis:atr f="axisper047" c="PER_TCIUSOL" a="modificable=false&obligatorio=false"/>
										alt="<axis:alt f="axisper047" c="PER_TCIUSOL" lit="9908410" />"
										title="<axis:alt f="axisper047" c="PER_TCIUSOL" lit="9908410" />" /></td>
								</axis:ocultar>
								
								<%-- INI CP0838M_SYS_PERS 28/12/2018 AP --%>
		                     				<axis:ocultar dejarHueco="false" f="axisper047" c="PER_PCSUCURSAL">
									<td><span class="bold"><axis:alt f="axisper047"
												c="PER_PCSUCURSAL" lit="9903035"></axis:alt></span><br /> <select
										title="<axis:alt f='axisper047' c='PER_PCSUCURSAL' lit='9903035' />"
										alt="<axis:alt f='axisper047' c='PER_PCSUCURSAL' lit='9909581' />"
										name="PER_PCSUCURSAL" id="PER_PCSUCURSAL" size="1" onchange=""
										<c:if test="${__formdata.ACTIONMOD == 'CONSULTA'}">disabled</c:if>
										class="campowidthselect campo campotexto_ob"
										<axis:atr f="axisper047" c="PER_PCSUCURSAL" a="isInputText=false&modificable=true&obligatorio=true"/>>
										<option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper047" c="PER_PCSUCURSAL" lit="1000348"/> - </option>
											 <c:forEach var="agente" items="${sessionScope.LS_TipoAgentes}">
		                                        <option value = "${agente.CAGENTE}" <c:if test="${agente.CAGENTE == __formdata.DET_SARLAFT.CSUCURSAL}"> selected </c:if>>
		                                            ${agente.TNOMBRE} 
		                                        </option>
		                                    </c:forEach>
									</select></td>
								</axis:ocultar>
								<%-- FIN CP0838M_SYS_PERS 28/12/2018 AP --%>

								<axis:ocultar dejarHueco="false" f="axisper047" c="PER_PCTIPSOL">
									<td><span class="bold"><axis:alt f="axisper047"
												c="PER_PCTIPSOL" lit="89906136"></axis:alt></span><br /> <select
										title="<axis:alt f='axisper047' c='PER_PCTIPSOL' lit='89906136' />"
										alt="<axis:alt f='axisper047' c='PER_PCTIPSOL' lit='9909581' />"
										name="PER_PCTIPSOL" id="PER_PCTIPSOL" size="1" onchange=""
										<c:if test="${__formdata.ACTIONMOD == 'CONSULTA'}">disabled</c:if>
										class="campowidthselect campo campotexto_ob"
										<axis:atr f="axisper047" c="PER_PCTIPSOL" a="isInputText=false&modificable=true&obligatorio=true"/>>
											<option selected value>-
												<axis:alt f="axisper047" c="BLANCO" lit="1000348" /> -
											</option>
											<c:forEach var="clase"
												items="${sessionScope.LS_VALORES_TIPOSOL}">
												<option value="${clase.CATRIBU}"
													<c:if test="${clase.CATRIBU == __formdata.DET_SARLAFT.CTIPSOL}">selected</c:if>>${clase.TATRIBU}</option>
											</c:forEach>
									</select></td>
								</axis:ocultar>

							</tr>
						</table>
						<table class="area" style="width: 70%;">
							<tr>
								<axis:ocultar dejarHueco="false" f="axisper047" c="CVINCULACION">
									<td>
										<table>
											<tr>
												<td colspan="4"><span class="bold"><axis:alt f="axisper047" c="CVINCULACION"
															lit="9909584"></axis:alt></span></td>
											</tr>
											<tr>
												<td><input type="radio" onchange="otroValorVinculacion()"
													name="CVINCULACION" value="1"
													id="CVINCULACION"
													<c:if test="${__formdata.ACTIONMOD == 'CONSULTA'}">disabled</c:if>
													<c:if test="${__formdata.DET_SARLAFT.CVINCULACION==1}">checked</c:if>
													<axis:atr f="axisper047" c="CVINCULACION" a="modificable=true&obligatorio=true"/>
													alt="<axis:alt f="axisper047" c="CVINCULACION" lit="101027" />"
													title="<axis:alt f="axisper047" c="CVINCULACION" lit="101027" />" />
													<span class="bold"><axis:alt f="axisper047"
															c="CVINCULACION" lit="101027"></axis:alt></span></td>
												<td><input type="radio" onchange="otroValorVinculacion()"
													name="CVINCULACION" value="2"
													id="CVINCULACION"
													<c:if test="${__formdata.ACTIONMOD == 'CONSULTA'}">disabled</c:if>
													<c:if test="${__formdata.DET_SARLAFT.CVINCULACION==2}">checked</c:if>
													<axis:atr f="axisper047" c="CVINCULACION" a="modificable=true&obligatorio=true"/>
													alt="<axis:alt f="axisper047" c="CVINCULACION" lit="9001911" />"
													title="<axis:alt f="axisper047" c="CVINCULACION" lit="9001911" />" />
													<span class="bold"><axis:alt f="axisper047"
															c="CVINCULACION" lit="9001911"></axis:alt></span></td>
												<td><input type="radio" onchange="otroValorVinculacion()"
													name="CVINCULACION" value="3"
													id="CVINCULACION"
													<c:if test="${__formdata.ACTIONMOD == 'CONSULTA'}">disabled</c:if>
													<c:if test="${__formdata.DET_SARLAFT.CVINCULACION==3}">checked</c:if>
													<axis:atr f="axisper047" c="CVINCULACION" a="modificable=true&obligatorio=true"/>
													alt="<axis:alt f="axisper047" c="CVINCULACION" lit="9909834" />"
													title="<axis:alt f="axisper047" c="CVINCULACION" lit="9909834" />" />
													<span class="bold"><axis:alt f="axisper047"
															c="CVINCULACION" lit="9909834"></axis:alt></span></td>
												<td><input type="radio" onchange="otroValorVinculacion()"
													name="CVINCULACION" value="7"
													id="CVINCULACION"
													<c:if test="${__formdata.ACTIONMOD == 'CONSULTA'}">disabled</c:if>
													<c:if test="${__formdata.DET_SARLAFT.CVINCULACION==7}">checked</c:if>
													<axis:atr f="axisper047" c="CVINCULACION" a="modificable=true&obligatorio=true"/>
													alt="<axis:alt f="axisper047" c="CVINCULACION" lit="9909586" />"
													title="<axis:alt f="axisper047" c="CVINCULACION" lit="9909586" />" />
													<span class="bold"><axis:alt f="axisper047"
															c="CVINCULACION" lit="9909586"></axis:alt></span></td>
											</tr>
											<tr>
												<td><input type="radio" onchange="otroValorVinculacion()"
													name="CVINCULACION" value="4"
													id="CVINCULACION"
													<c:if test="${__formdata.ACTIONMOD == 'CONSULTA'}">disabled</c:if>
													<c:if test="${__formdata.DET_SARLAFT.CVINCULACION==4}">checked</c:if>
													<axis:atr f="axisper047" c="CVINCULACION" a="modificable=true&obligatorio=true"/>
													alt="<axis:alt f="axisper047" c="CVINCULACION" lit="101028" />"
													title="<axis:alt f="axisper047" c="CVINCULACION" lit="101028" />" />
													<span class="bold"><axis:alt f="axisper047"
															c="CVINCULACION" lit="101028"></axis:alt></span></td>
												<td><input type="radio" onchange="otroValorVinculacion()"
													name="CVINCULACION" value="5"
													id="CVINCULACION"
													<c:if test="${__formdata.ACTIONMOD == 'CONSULTA'}">disabled</c:if>
													<c:if test="${__formdata.DET_SARLAFT.CVINCULACION==5}">checked</c:if>
													<axis:atr f="axisper047" c="CVINCULACION" a="modificable=true&obligatorio=true"/>
													alt="<axis:alt f="axisper047" c="CVINCULACION" lit="9909585" />"
													title="<axis:alt f="axisper047" c="CVINCULACION" lit="9909585" />" />
													<span class="bold"><axis:alt f="axisper047"
															c="CVINCULACION" lit="9909585"></axis:alt></span></td>
												<td><input type="radio" onchange="otroValorVinculacion()"
													name="CVINCULACION" value="6"
													id="CVINCULACION"
													<c:if test="${__formdata.ACTIONMOD == 'CONSULTA'}">disabled</c:if>
													<c:if test="${__formdata.DET_SARLAFT.CVINCULACION==6}">checked</c:if>
													<axis:atr f="axisper047" c="CVINCULACION" a="modificable=true&obligatorio=true"/>
													alt="<axis:alt f="axisper047" c="CVINCULACION" lit="9902363" />"
													title="<axis:alt f="axisper047" c="CVINCULACION" lit="9902363" />" />
													<span class="bold"><axis:alt f="axisper047"
															c="CVINCULACION" lit="9902363"></axis:alt></span></td>
												<td><input type="text" name="TVINCULACION" id="TVINCULACION"
													value="${__formdata.DET_SARLAFT.TVINCULACION}"
													class="campowidthinput campo campotexto"
													<axis:atr f="axisper047" c="TVINCULACION" a="modificable=true&obligatorio=false"/>
													alt="<axis:alt f="axisper047" c="TVINCULACION" lit="9909600" />"
													title="<axis:alt f="axisper047" c="TVINCULACION" lit="9909600" />" /></td>
												<td></td>
											</tr>
										</table>
									</td>
								</axis:ocultar>



								<!-- 				#RESOCIEDAD VISIBLE SOLO PARA PERSONA JURIDICA  -->
								<c:if test="${!__formdata.PERSONANATURAL}">

									<axis:ocultar dejarHueco="false" f="axisper047" c="RESOCIEDAD">
										<td>
											<table>
												<tr>
													<td colspan="2"><span class="bold"><axis:alt f="axisper047" c="RESOCIEDAD"
																lit="9909681"></axis:alt></span></td>
												</tr>
												<tr>
													<td><span class="bold"><axis:alt f="axisper047"
																c="RESOCIEDAD" lit="9905420"></axis:alt></span> <input
														type="radio"
														<c:if test="${__formdata.ACTIONMOD == 'CONSULTA'}">disabled</c:if>
														name="RESOCIEDAD"
														<c:if test="${__formdata.DET_SARLAFT.RESOCIEDAD==1}">checked</c:if>
														id="RESOCIEDAD" value="1"
														<axis:atr f="axisper047" c="RESOCIEDAD" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="RESOCIEDAD" lit="9905420" />"
														title="<axis:alt f="axisper047" c="RESOCIEDAD" lit="9905420" />" /></td>
													<td><span class="bold"><axis:alt f="axisper047"
																c="RESOCIEDAD" lit="9905421"></axis:alt></span><br /> <input
														type="radio"
														<c:if test="${__formdata.ACTIONMOD == 'CONSULTA'}">disabled</c:if>
														name="RESOCIEDAD"
														<c:if test="${__formdata.DET_SARLAFT.RESOCIEDAD==2}">checked</c:if>
														id="RESOCIEDAD" value="2"
														<axis:atr f="axisper047" c="RESOCIEDAD" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="RESOCIEDAD" lit="9905421" />"
														title="<axis:alt f="axisper047" c="RESOCIEDAD" lit="9905421" />" /></td>
												</tr>
											</table>
										</td>
									</axis:ocultar>
								</c:if>
							</tr>
						</table>
						<table class="area" style="width: 60%;">
							<tr>
								<axis:ocultar dejarHueco="false" f="axisper047" c="CVINTOMASE">
									<td colspan="6"><span class="bold"><axis:alt f="axisper047" c="CVINTOMASE"
												lit="9909587"></axis:alt></span><br />
										<div class="titulo"></div>
										</td>
								</axis:ocultar>
							</tr>
							<tr>
								<axis:ocultar dejarHueco="false" f="axisper047" c="CVINTOMASE">
									<td><span class="bold"><axis:alt f="axisper047" c="CVINTOMASE" lit="9909588"></axis:alt></span></td>
								</axis:ocultar>
								<axis:ocultar dejarHueco="false" f="axisper047" c="CVINTOMASE">
									<td><input type="radio" onchange="otroValorIngresar()"
										<c:if test="${__formdata.ACTIONMOD == 'CONSULTA'}">disabled</c:if>
										name="CVINTOMASE" value="1"
										<c:if test="${__formdata.DET_SARLAFT.CVINTOMASE==1}">checked</c:if>
										id="CVINTOMASE"
										<axis:atr f="axisper047" c="CVINTOMASE" a="modificable=true&obligatorio=false"/>
										alt="<axis:alt f="axisper047" c="CVINTOMASE" lit="9909591" />"
										title="<axis:alt f="axisper047" c="CVINTOMASE" lit="9909591" />" />
										<span class="bold"><axis:alt f="axisper047"
												c="CVINTOMASE" lit="9909591"></axis:alt></span></td>
								</axis:ocultar>
								<axis:ocultar dejarHueco="false" f="axisper047" c="CVINTOMASE">
									<td><input type="radio" onchange="otroValorIngresar()"
										<c:if test="${__formdata.ACTIONMOD == 'CONSULTA'}">disabled</c:if>
										name="CVINTOMASE" value="2"
										<c:if test="${__formdata.DET_SARLAFT.CVINTOMASE==2}">checked</c:if>
										id="CVINTOMASE"
										<axis:atr f="axisper047" c="CVINTOMASE" a="modificable=true&obligatorio=false"/>
										alt="<axis:alt f="axisper047" c="CVINTOMASE" lit="9900822" />"
										title="<axis:alt f="axisper047" c="CVINTOMASE" lit="9900822" />" />
										<span class="bold"><axis:alt f="axisper047"
												c="CVINTOMASE" lit="9900822"></axis:alt></span></td>
								</axis:ocultar>
								<axis:ocultar dejarHueco="false" f="axisper047" c="CVINTOMASE">
									<td><input type="radio" onchange="otroValorIngresar()"
										<c:if test="${__formdata.ACTIONMOD == 'CONSULTA'}">disabled</c:if>
										name="CVINTOMASE" value="3"
										<c:if test="${__formdata.DET_SARLAFT.CVINTOMASE==3}">checked</c:if>
										id="CVINTOMASE"
										<axis:atr f="axisper047" c="CVINTOMASE" a="modificable=true&obligatorio=false"/>
										alt="<axis:alt f="axisper047" c="CVINTOMASE" lit="9909592" />"
										title="<axis:alt f="axisper047" c="CVINTOMASE" lit="9909592" />" />
										<span class="bold"><axis:alt f="axisper047"
												c="CVINTOMASE" lit="9909592"></axis:alt></span></td>
								</axis:ocultar>
								<axis:ocultar dejarHueco="false" f="axisper047" c="CVINTOMASE">
									<td><input type="radio" onchange="otroValorIngresar()"
										<c:if test="${__formdata.ACTIONMOD == 'CONSULTA'}">disabled</c:if>
										name="CVINTOMASE" value="4"
										<c:if test="${__formdata.DET_SARLAFT.CVINTOMASE==4}">checked</c:if>
										id="CVINTOMASE"
										<axis:atr f="axisper047" c="CVINTOMASE" a="modificable=true&obligatorio=false"/>
										alt="<axis:alt f="axisper047" c="CVINTOMASE" lit="9909600" />"
										title="<axis:alt f="axisper047" c="CVINTOMASE" lit="9909600" />" />
										<span class="bold"><axis:alt f="axisper047"
												c="CVINTOMASE" lit="9909600"></axis:alt></span></td>
								</axis:ocultar>
								<axis:ocultar dejarHueco="false" f="axisper047" c="TVINTOMASE">
									<td><input type="text" name="TVINTOMASE" id="TVINTOMASE"
										value="${__formdata.DET_SARLAFT.TVINTOMASE}"
										class="campowidthinput campo campotexto"
										<axis:atr f="axisper047" c="TVINTOMASE" a="modificable=true&obligatorio=false"/>
										alt="<axis:alt f="axisper047" c="TVINTOMASE" lit="9909600" />"
										title="<axis:alt f="axisper047" c="TVINTOMASE" lit="9909600" />" /></td>
								</axis:ocultar>
								<td></td>
							</tr>
							<tr>
								<axis:ocultar dejarHueco="false" f="axisper047" c="CVINTOMBEN">
									<td><span class="bold"><axis:alt f="axisper047"
												c="CVINTOMBEN" lit="9909589"></axis:alt></span></td>
								</axis:ocultar>
								<axis:ocultar dejarHueco="false" f="axisper047" c="CVINTOMBEN">
									<td><input type="radio" onchange="otroValorIngresar()"
										<c:if test="${__formdata.ACTIONMOD == 'CONSULTA'}">disabled</c:if>
										name="CVINTOMBEN" value="1"
										<c:if test="${__formdata.DET_SARLAFT.CVINTOMBEN==1}">checked</c:if>
										id="CVINTOMBEN"
										<axis:atr f="axisper047" c="CVINTOMBEN" a="modificable=true&obligatorio=false"/>
										alt="<axis:alt f="axisper047" c="CVINTOMBEN" lit="9909591" />"
										title="<axis:alt f="axisper047" c="CVINTOMBEN" lit="9909591" />" />
										<span class="bold"><axis:alt f="axisper047"
												c="CVINTOMBEN" lit="9909591"></axis:alt></span></td>
								</axis:ocultar>
								<axis:ocultar dejarHueco="false" f="axisper047" c="CVINTOMBEN">
									<td><input type="radio" onchange="otroValorIngresar()"
										<c:if test="${__formdata.ACTIONMOD == 'CONSULTA'}">disabled</c:if>
										name="CVINTOMBEN" value="2"
										<c:if test="${__formdata.DET_SARLAFT.CVINTOMBEN==2}">checked</c:if>
										id="CVINTOMBEN"
										<axis:atr f="axisper047" c="CVINTOMBEN" a="modificable=true&obligatorio=false"/>
										alt="<axis:alt f="axisper047" c="CVINTOMBEN" lit="9900822" />"
										title="<axis:alt f="axisper047" c="CVINTOMBEN" lit="9900822" />" />
										<span class="bold"><axis:alt f="axisper047"
												c="CVINTOMBEN" lit="9900822"></axis:alt></span></td>
								</axis:ocultar>
								<axis:ocultar dejarHueco="false" f="axisper047" c="CVINTOMBEN">
									<td><input type="radio" onchange="otroValorIngresar()"
										<c:if test="${__formdata.ACTIONMOD == 'CONSULTA'}">disabled</c:if>
										name="CVINTOMBEN" value="3"
										<c:if test="${__formdata.DET_SARLAFT.CVINTOMBEN==3}">checked</c:if>
										id="CVINTOMBEN"
										<axis:atr f="axisper047" c="CVINTOMBEN" a="modificable=true&obligatorio=false"/>
										alt="<axis:alt f="axisper047" c="CVINTOMBEN" lit="9909592" />"
										title="<axis:alt f="axisper047" c="CVINTOMBEN" lit="9909592" />" />
										<span class="bold"><axis:alt f="axisper047"
												c="CVINTOMBEN" lit="9909592"></axis:alt></span></td>
								</axis:ocultar>
								<axis:ocultar dejarHueco="false" f="axisper047" c="CVINTOMBEN">
									<td><input type="radio" onchange="otroValorIngresar()"
										<c:if test="${__formdata.ACTIONMOD == 'CONSULTA'}">disabled</c:if>
										name="CVINTOMBEN" value="4"
										<c:if test="${__formdata.DET_SARLAFT.CVINTOMBEN==4}">checked</c:if>
										id="CVINTOMBEN"
										<axis:atr f="axisper047" c="CVINTOMBEN" a="modificable=true&obligatorio=false"/>
										alt="<axis:alt f="axisper047" c="CVINTOMBEN" lit="9909600" />"
										title="<axis:alt f="axisper047" c="CVINTOMBEN" lit="9909600" />" />
										<span class="bold"><axis:alt f="axisper047"
												c="CVINTOMBEN" lit="9909600"></axis:alt></span></td>
								</axis:ocultar>
								<axis:ocultar dejarHueco="false" f="axisper047" c="TVINTOMBEM">
									<td><input type="text" name="TVINTOMBEM" id="TVINTOMBEM"
										value="${__formdata.DET_SARLAFT.TVINTOMBEM}"
										class="campowidthinput campo campotexto"
										<axis:atr f="axisper047" c="TVINTOMBEM" a="modificable=true&obligatorio=false"/>
										alt="<axis:alt f="axisper047" c="TVINTOMBEM" lit="9909600" />"
										title="<axis:alt f="axisper047" c="TVINTOMBEM" lit="9909600" />" /></td>
								</axis:ocultar>
								<td></td>
							</tr>
							<tr>
								<axis:ocultar dejarHueco="false" f="axisper047" c="CVINASEBEN">
									<td><span class="bold"><axis:alt f="axisper047"
												c="CVINASEBEN" lit="9909590"></axis:alt></span></td>
								</axis:ocultar>
								<axis:ocultar dejarHueco="false" f="axisper047" c="CVINASEBEN">
									<td><input type="radio" onchange="otroValorIngresar()"
										<c:if test="${__formdata.ACTIONMOD == 'CONSULTA'}">disabled</c:if>
										name="CVINASEBEN" value="1"
										<c:if test="${__formdata.DET_SARLAFT.CVINASEBEN==1}">checked</c:if>
										id="CVINASEBEN"
										<axis:atr f="axisper047" c="CVINASEBEN" a="modificable=true&obligatorio=false"/>
										alt="<axis:alt f="axisper047" c="CVINASEBEN" lit="9909591" />"
										title="<axis:alt f="axisper047" c="CVINASEBEN" lit="9909591" />" />
										<span class="bold"><axis:alt f="axisper047"
												c="CVINASEBEN" lit="9909591"></axis:alt></span></td>
								</axis:ocultar>
								<axis:ocultar dejarHueco="false" f="axisper047" c="CVINASEBEN">
									<td><input type="radio" onchange="otroValorIngresar()"
										<c:if test="${__formdata.ACTIONMOD == 'CONSULTA'}">disabled</c:if>
										name="CVINASEBEN" value="2"
										<c:if test="${__formdata.DET_SARLAFT.CVINASEBEN==2}">checked</c:if>
										id="CVINASEBEN"
										<axis:atr f="axisper047" c="CVINASEBEN" a="modificable=true&obligatorio=false"/>
										alt="<axis:alt f="axisper047" c="CVINASEBEN" lit="9900822" />"
										title="<axis:alt f="axisper047" c="CVINASEBEN" lit="9900822" />" />
										<span class="bold"><axis:alt f="axisper047"
												c="CVINASEBEN" lit="9900822"></axis:alt></span></td>
								</axis:ocultar>
								<axis:ocultar dejarHueco="false" f="axisper047" c="CVINASEBEN">
									<td><input type="radio" onchange="otroValorIngresar()"
										<c:if test="${__formdata.ACTIONMOD == 'CONSULTA'}">disabled</c:if>
										name="CVINASEBEN" value="3"
										<c:if test="${__formdata.DET_SARLAFT.CVINASEBEN==3}">checked</c:if>
										id="CVINASEBEN"
										<axis:atr f="axisper047" c="CVINASEBEN" a="modificable=true&obligatorio=false"/>
										alt="<axis:alt f="axisper047" c="CVINASEBEN" lit="9909592" />"
										title="<axis:alt f="axisper047" c="CVINASEBEN" lit="9909592" />" />
										<span class="bold"><axis:alt f="axisper047"
												c="CVINASEBEN" lit="9909592"></axis:alt></span></td>
								</axis:ocultar>
								<axis:ocultar dejarHueco="false" f="axisper047" c="CVINASEBEN">
									<td><input type="radio" onchange="otroValorIngresar()"
										<c:if test="${__formdata.ACTIONMOD == 'CONSULTA'}">disabled</c:if>
										name="CVINASEBEN" value="4"
										<c:if test="${__formdata.DET_SARLAFT.CVINASEBEN==4}">checked</c:if>
										id="CVINASEBEN"
										<axis:atr f="axisper047" c="CVINASEBEN" a="modificable=true&obligatorio=false"/>
										alt="<axis:alt f="axisper047" c="CVINASEBEN" lit="9909600" />"
										title="<axis:alt f="axisper047" c="CVINASEBEN" lit="9909600" />" />
										<span class="bold"><axis:alt f="axisper047"
												c="CVINASEBEN" lit="9909600"></axis:alt></span></td>
								</axis:ocultar>
								<axis:ocultar dejarHueco="false" f="axisper047" c="TVINASEBEM">
									<td><input type="text" name="TVINASEBEM" id="TVINASEBEM"
										value="${__formdata.DET_SARLAFT.TVINASEBEM}"
										class="campowidthinput campo campotexto"
										<axis:atr f="axisper047" c="TVINASEBEM" a="modificable=true&obligatorio=false"/>
										alt="<axis:alt f="axisper047" c="TVINASEBEM" lit="9909600" />"
										title="<axis:alt f="axisper047" c="TVINASEBEM" lit="9909600" />" /></td>
								</axis:ocultar>
								<td></td>
							</tr>
						</table>
						 <c:if
							test="${!__formdata.PERSONANATURAL}">
							<table class="area">
								<tr>
									<td id="td_LIT_89906130" class="campocaja" colspan="10"><img
										id="DS_89906130_parent" src="images/mes.gif"
										onclick="objEstilos.toggleDisplay('DS_89906130', this)"
										style="cursor: pointer" /> <b> <axis:alt f="axisper047"
												c="LIT_89906130" lit="89906130" />
									</b>
										<div style="clear: both;">
											<hr class="titulo"></hr>
										</div></td>
								</tr>
								<tr>
									<td>
										<table id="DS_89906130_children" style="display: none">
											<tr>
											<!-- INI CP0416M_SYS_PERS  18/12/2018 ACL-->
												<axis:ocultar dejarHueco="false" f="axisper047" c="NRAZONSO">
													<td><span class="bold"><axis:alt f="axisper047"
																c="NRAZONSO" lit="9909594"></axis:alt></span><br /> <input
														type="text" name="NRAZONSO" id="NRAZONSO"
														value="${__formdata.razon_social}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="NRAZONSO" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="NRAZONSO" lit="9909594" />"
														title="<axis:alt f="axisper047" c="NRAZONSO" lit="9909594" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047" c="TNIT">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TNIT" lit="9905773"></axis:alt></span><br /> <input
														type="text" name="TNIT" id="TNIT"
														value="${__formdata.nit}"
														class="campowidthinput campo campotexto" onchange="f_cargar_DATOSNIT()"
														<axis:atr f="axisper047" c="TNIT" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TNIT" lit="9905773" />"
														title="<axis:alt f="axisper047" c="TNIT" lit="9905773" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047" c="TDV">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TDV" lit="9909595"></axis:alt></span><br /> <input
																onkeypress="return isNumberKey(event)"
														type="text" name="TDV" id="TDV" maxlength="1"
														value="${__formdata.DET_SARLAFT.TDV}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="TDV" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TDV" lit="9909595" />"
														title="<axis:alt f="axisper047" c="TDV" lit="9909595" />" /></td>
												</axis:ocultar>
											</tr>


											<tr>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="TOFICINAPRI">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TOFICINAPRI" lit="105889"></axis:alt></span><br /> <input
														type="text" name="TOFICINAPRI" id="TOFICINAPRI"
														value="${__formdata.direccion_jur}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="TOFICINAPRI" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TOFICINAPRI" lit="9909596" />"
														title="<axis:alt f="axisper047" c="TOFICINAPRI" lit="9909596" />" /></td>
												</axis:ocultar>


												<axis:ocultar dejarHueco="false" f="axisper047" c="TPAIS">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TPAIS" lit="9909597"></axis:alt></span><br /> <input
														type="text" name="TPAIS" id="TPAIS" readonly="readonly"
														style="width: 40px;"
														value="${__formdata.pais_oficina}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="TPAIS" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TPAIS" lit="9909597" />"
														title="<axis:alt f="axisper047" c="TPAIS" lit="9909597" />" />
														<!--  <img id="findPais" border="0" src="images/find.gif"
														onclick="f_pais('TPAIS','TDEPATAMENTO','TCIUDAD','EMPTPAIS')"
														style="cursor: pointer" />  -->
														<input type="text"
														name="EMPTPAIS" id="EMPTPAIS"
														value="${__formdata.tpais_oficina}"
														class="campowidthinput campo campotexto"
														readonly="readonly" style="width: 70px;"
														<axis:atr f="axisper047" c="EMPTPAIS" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMPTPAIS" lit="9909597" />"
														title="<axis:alt f="axisper047" c="EMPTPAIS" lit="9909597" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="TDEPATAMENTO">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TDEPATAMENTO" lit="9902610"></axis:alt></span><br /> <input
														type="text" name="TDEPATAMENTO" style="width: 40px;"
														id="TDEPATAMENTO" readonly="readonly"
														value="${__formdata.dep_oficina}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="TDEPATAMENTO" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TDEPATAMENTO" lit="9902610" />"
														title="<axis:alt f="axisper047" c="TDEPATAMENTO" lit="9902610" />" />
														<!--  <img id="findPais" border="0" src="images/find.gif"
														onclick="f_dep('TPAIS','TDEPATAMENTO','TCIUDAD','EMPTDEPATAMENTO')"
														style="cursor: pointer" />  -->
														<input type="text"
														name="EMPTDEPATAMENTO" id="EMPTDEPATAMENTO"
														value="${__formdata.tdep_oficina}"
														class="campowidthinput campo campotexto"
														style="width: 70px;" readonly="readonly"
														<axis:atr f="axisper047" c="EMPTDEPATAMENTO" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMPTDEPATAMENTO" lit="9902610" />"
														title="<axis:alt f="axisper047" c="EMPTDEPATAMENTO" lit="9902610" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047" c="TCIUDAD">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TCIUDAD" lit="9908410"></axis:alt></span><br /> <input
														type="text" name="TCIUDAD" id="TCIUDAD"
														readonly="readonly" style="width: 40px;"
														value="${__formdata.lug_oficina}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="TCIUDAD" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TCIUDAD" lit="9908410" />"
														title="<axis:alt f="axisper047" c="TCIUDAD" lit="9908410" />" />
														<!--  <img id="findPais" border="0" src="images/find.gif"
														onclick="f_ciudad('TPAIS','TDEPATAMENTO','TCIUDAD','EMPTCIUDAD')"
														style="cursor: pointer" />  -->
														<input type="text"
														name="EMPTCIUDAD" id="EMPTCIUDAD"
														value="${__formdata.tlug_oficina}"
														class="campowidthinput campo campotexto"
														readonly="readonly" style="width: 70px;"
														<axis:atr f="axisper047" c="EMPTCIUDAD" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMPTCIUDAD" lit="9908410" />"
														title="<axis:alt f="axisper047" c="EMPTCIUDAD" lit="9908410" />" /></td>
												</axis:ocultar>


												<axis:ocultar dejarHueco="false" f="axisper047"
													c="TTELEFONO">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TTELEFONO" lit="9000992"></axis:alt></span><br /> <input
														type="text" name="TTELEFONO" id="TTELEFONO"
														value="${__formdata.telefono_ofic}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="TTELEFONO" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TTELEFONO" lit="9000992" />"
														title="<axis:alt f="axisper047" c="TTELEFONO" lit="9000992" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047" c="TFAX">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TFAX" lit="9903323"></axis:alt></span><br /> <input
														type="text" name="TFAX" id="TFAX"
														value="${__formdata.fax_oficina}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="TFAX" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TFAX" lit="9903323" />"
														title="<axis:alt f="axisper047" c="TFAX" lit="9903323" />" /></td>
												</axis:ocultar>
											</tr>
											<!-- FIN CP0416M_SYS_PERS  18/12/2018 ACL -->
											<tr>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="TSUCURSAL">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TSUCURSAL" lit="9909598"></axis:alt></span><br /> <input
														type="text" name="TSUCURSAL" id="TSUCURSAL"
														value="${__formdata.DET_SARLAFT.TSUCURSAL}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="TSUCURSAL" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TSUCURSAL" lit="9909598" />"
														title="<axis:alt f="axisper047" c="TSUCURSAL" lit="9909598" />" /></td>
												</axis:ocultar>

												<axis:ocultar dejarHueco="false" f="axisper047" c="TPAISUC">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TPAISUC" lit="9909597"></axis:alt></span><br /> <input
														type="text" name="TPAISUC" id="TPAISUC"
														readonly="readonly" style="width: 40px;"
														value="${__formdata.DET_SARLAFT.TPAISUC}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="TPAISUC" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TPAISUC" lit="9909597" />"
														title="<axis:alt f="axisper047" c="TPAISUC" lit="9909597" />" />
														<axis:visible c="TPAISUC_FIND" f="axisper047"> 
														<img id="findPais" border="0" src="images/find.gif"
														onclick="f_pais('TPAISUC','TDEPATAMENTOSUC','TCIUDADSUC','EMPTPAISUC')"
														style="cursor: pointer" /></axis:visible>
														<input type="text"
														name="EMPTPAISUC" id="EMPTPAISUC"
														value="${__formdata.DET_SARLAFT.EMPTPAISUC}"
														class="campowidthinput campo campotexto"
														readonly="readonly" style="width: 70px;"
														<axis:atr f="axisper047" c="EMPTPAISUC" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMPTPAISUC" lit="9909597" />"
														title="<axis:alt f="axisper047" c="EMPTPAISUC" lit="9909597" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="TDEPATAMENTOSUC">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TDEPATAMENTOSUC" lit="9902610"></axis:alt></span><br /> <input
														type="text" name="TDEPATAMENTOSUC" style="width: 40px;"
														id="TDEPATAMENTOSUC" readonly="readonly"
														value="${__formdata.DET_SARLAFT.TDEPATAMENTOSUC}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="TDEPATAMENTOSUC" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TDEPATAMENTOSUC" lit="9902610" />"
														title="<axis:alt f="axisper047" c="TDEPATAMENTOSUC" lit="9902610" />" />
														<axis:visible c="TDEPATAMENTOSUC_FIND" f="axisper047"> 
														<img id="findPais" border="0" src="images/find.gif"
														onclick="f_dep('TPAISUC','TDEPATAMENTOSUC','TCIUDADSUC','EMPTDEPATAMENTOSUC')"
														style="cursor: pointer" /></axis:visible>
														<input type="text"
														name="EMPTDEPATAMENTOSUC" id="EMPTDEPATAMENTOSUC"
														value="${__formdata.DET_SARLAFT.EMPTDEPATAMENTOSUC}"
														class="campowidthinput campo campotexto"
														readonly="readonly" style="width: 70px;"
														<axis:atr f="axisper047" c="EMPTDEPATAMENTOSUC" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMPTDEPATAMENTOSUC" lit="9902610" />"
														title="<axis:alt f="axisper047" c="EMPTDEPATAMENTOSUC" lit="9902610" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="TCIUDADSUC">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TCIUDADSUC" lit="9908410"></axis:alt></span><br /> <input
														type="text" name="TCIUDADSUC" id="TCIUDADSUC"
														readonly="readonly" style="width: 40px;"
														value="${__formdata.DET_SARLAFT.TCIUDADSUC}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="TCIUDADSUC" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TCIUDADSUC" lit="9908410" />"
														title="<axis:alt f="axisper047" c="TCIUDADSUC" lit="9908410" />" />
														 <axis:visible c="TCIUDADSUC_FIND" f="axisper047">
														<img id="findPais" border="0" src="images/find.gif"
														onclick="f_ciudad('TPAISUC','TDEPATAMENTOSUC','TCIUDADSUC','EMPTCIUDADSUC')"
														style="cursor: pointer" /></axis:visible>
														<input type="text"
														name="EMPTCIUDADSUC" id="EMPTCIUDADSUC"
														value="${__formdata.DET_SARLAFT.EMPTCIUDADSUC}"
														class="campowidthinput campo campotexto"
														style="width: 70px;" readonly="readonly"
														<axis:atr f="axisper047" c="EMPTCIUDADSUC" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMPTCIUDADSUC" lit="9908410" />"
														title="<axis:alt f="axisper047" c="EMPTCIUDADSUC" lit="9908410" />" /></td>
												</axis:ocultar>

												<axis:ocultar dejarHueco="false" f="axisper047"
													c="TTELEFONOSUC">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TTELEFONOSUC" lit="9000992"></axis:alt></span><br /> <input
														onkeypress="return isNumberKey(event)"
														type="text" name="TTELEFONOSUC" id="TTELEFONOSUC"
														value="${__formdata.DET_SARLAFT.TTELEFONOSUC}"
														class="campowidthinput campo campotexto" 
														<axis:atr f="axisper047" c="TTELEFONOSUC" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TTELEFONOSUC" lit="9000992" />"
														title="<axis:alt f="axisper047" c="TTELEFONOSUC" lit="9000992" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047" c="TFAXSUC">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TFAXSUC" lit="9903323"></axis:alt></span><br /> <input
														onkeypress="return isNumberKey(event)"
														type="text" name="TFAXSUC" id="TFAXSUC"
														value="${__formdata.DET_SARLAFT.TFAXSUC}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="TFAXSUC" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TFAXSUC" lit="9903323" />"
														title="<axis:alt f="axisper047" c="TFAXSUC" lit="9903323" />" /></td>
												</axis:ocultar>
											</tr>
											<tr>
												<axis:ocultar dejarHueco="false" f="axisper047" c="CTIPOEMP">
													<td><span class="bold"><axis:alt f="axisper047"
																c="CTIPOEMP" lit="9909599"></axis:alt></span><br /> <select
														title="<axis:alt f='axisper047' c='CTIPOEMP' lit='9909599' />"
														alt="<axis:alt f='axisper047' c='CTIPOEMP' lit='9909599' />"
														name="CTIPOEMP" id="CTIPOEMP" size="1"
														onchange="cargar_pantalla_por_clase();f_onchange_CTIPOEMP(this.value)"
														class="campowidthselect campo campotexto_ob"
														<axis:atr f="axisper047" c="CTIPOEMP" a="isInputText=false&modificable=true&obligatorio=true"/>>
															<option selected value>-
																<axis:alt f="axisper047" c="BLANCO" lit="1000348" /> -
															</option>
															<c:forEach var="clase"
																items="${sessionScope.lstTipoEmpresa}">
																<option value="${clase.CATRIBU}"
																	<c:if test="${clase.CATRIBU == __formdata.DET_SARLAFT.CTIPOEMP}">selected</c:if>>${clase.TATRIBU}</option>
															</c:forEach>
													</select></td>
												</axis:ocultar>

												<axis:ocultar dejarHueco="false" f="axisper047"
													c="TCUALTEMP">
													<td><span class="bold" id= "label_TCUALTEMP"><axis:alt f="axisper047"
																c="TCUALTEMP" lit="9909600"></axis:alt></span><br /> <input
														type="text" name="TCUALTEMP" id="TCUALTEMP"
														value="${__formdata.DET_SARLAFT.TCUALTEMP}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="TCUALTEMP" a="modificable=true&obligatorio=true"/>
														alt="<axis:alt f="axisper047" c="TCUALTEMP" lit="9909600" />"
														title="<axis:alt f="axisper047" c="TCUALTEMP" lit="9909600" />" /></td>
												</axis:ocultar>																							
												
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="PER_CSECTOR">
													<td><span class="bold"><axis:alt f="axisper047"
																c="PER_CSECTOR" lit="9909601"></axis:alt></span><br /> <select
														title="<axis:alt f='axisper047' c='PER_CSECTOR' lit='9909601' />"
														alt="<axis:alt f='axisper047' c='PER_CSECTOR' lit='9909601' />"
														name="PER_CSECTOR" id="PER_CSECTOR" size="1"
														onchange="cargar_pantalla_por_clase();"
														class="campowidthselect campo campotexto_ob"
														<axis:atr f="axisper047" c="PER_CSECTOR" a="isInputText=false&modificable=true&obligatorio=true"/>>
															<option selected value>-
																<axis:alt f="axisper047" c="BLANCO" lit="1000348" /> -
															</option>
															<c:forEach var="clase" items="${sessionScope.lstSector}">
																<option value="${clase.CATRIBU}"
																	<c:if test="${clase.CATRIBU == __formdata.DET_SARLAFT.CSECTOR}">selected</c:if>>${clase.TATRIBU}</option>
															</c:forEach>
													</select></td>
												</axis:ocultar>	
												<%--	Ini TCS_1560 - ACL - 11/02/2019   --%>	
												<axis:ocultar dejarHueco="false" f="axisper047" c="CCIIU">
													<td><span class="bold"><axis:alt f="axisper047"
																c="CCIIU" lit="9909602"></axis:alt></span><br /> <input
														type="text" class="campowidthinput campo campotexto"
														size="15" value="${__formdata.codciiu_jur}"
														name="CCIIU" id="CCIIU" 
														title="<axis:alt f="axisper047" c="CCIIU" lit="9909091"/>"
														<axis:atr f="axisper047" c="CCIIU" a="modificable=false&obligatorio=false"/> />
														&nbsp;
													</td>
												</axis:ocultar>
												<%--	Fin TCS_1560 - ACL - 11/02/2019   --%>	
												<axis:ocultar dejarHueco="false" f="axisper047" c="TACTIACA">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TACTIACA" lit="9909603"></axis:alt></span><br /> <input
														type="text" name="TACTIACA" id="TACTIACA"
														value="${__formdata.descriciiu_jur}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="TACTIACA" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TACTIACA" lit="9909603" />"
														title="<axis:alt f="axisper047" c="TACTIACA" lit="9909603" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047" c="TMAILJURID">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TMAILJURID" lit="9903325"></axis:alt></span><br /> <input
														type="text" name="TMAILJURID" id="TMAILJURID"
														value="${__formdata.email_jur}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="TMAILJURID" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TMAILJURID" lit="9903325" />"
														title="<axis:alt f="axisper047" c="TMAILJURID" lit="9903325" />" /></td>
												</axis:ocultar>
											</tr>

										</table>
										
									</td>
								</tr>

								<tr>
									<td id="td_LIT_9909071" class="campocaja" colspan="10"><img
										id="DS_9909071_parent" src="images/mes.gif"
										onclick="objEstilos.toggleDisplay('DS_9909071', this)"
										style="cursor: pointer" /> <b> <axis:alt f="axiscga002"
												c="LIT_9909071" lit="9909071" />
									</b>
										<div style="clear: both;">
											<hr class="titulo"></hr>
										</div></td>
								</tr>

								<tr>
									<td>
										<table id="DS_9909071_children" style="display: none">
											<tr>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="TREPRESENTANLE">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TREPRESENTANLE" lit="9909635"></axis:alt></span><br /> <input
														type="text" name="TREPRESENTANLE" id="TREPRESENTANLE"
														value="${__formdata.primer_apellido}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="TREPRESENTANLE" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TREPRESENTANLE" lit="9909635" />"
														title="<axis:alt f="axisper047" c="TREPRESENTANLE" lit="9909635" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047" c="TSEGAPE">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TSEGAPE" lit="9909605"></axis:alt></span><br /> <input
														type="text" name="TSEGAPE" id="TSEGAPE"
														value="${__formdata.segundo_apellido}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="TSEGAPE" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TSEGAPE" lit="9909605" />"
														title="<axis:alt f="axisper047" c="TSEGAPE" lit="9909605" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047" c="TNOMBRES">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TNOMBRES" lit="9909607"></axis:alt></span><br /> <input
														type="text" name="TNOMBRES" id="TNOMBRES"
														value="${__formdata.nombres}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="TNOMBRES" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TNOMBRES" lit="9909607" />"
														title="<axis:alt f="axisper047" c="TNOMBRES" lit="9909607" />" /></td>
												</axis:ocultar>
											</tr>
											<tr>
												<axis:ocultar dejarHueco="false" f="axisper047" c="NTIPDOC">
													<td><span class="bold"><axis:alt f="axisper047"
																c="NTIPDOC" lit="150996"></axis:alt></span><br /> <select
														title="<axis:alt f='axisper047' c='NTIPDOC' lit='150996' />"
														alt="<axis:alt f='axisper047' c='NTIPDOC' lit='150996' />"
														name="NTIPDOC" id="NTIPDOC" size="1"
														onchange="cargar_pantalla_por_clase();"
														class="campowidthselect campo campotexto_ob"
														<axis:atr f="axisper047" c="NTIPDOC" a="isInputText=false&modificable=false"/>>
															<option selected value="1000">- <axis:alt f="axisper047" c="BLANCO" lit="1000348" /> -
															</option>
															<c:forEach var="clase" items="${sessionScope.LS_TIPOS_DOCUMENTOS}">
																<option value="${clase.CATRIBU}"
																	<c:if test="${clase.CATRIBU == __formdata.tipo_documento}">selected</c:if>>${clase.TATRIBU}</option>
															</c:forEach>
													</select></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047" c="TNUMDOC">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TNUMDOC" lit="105330"></axis:alt></span><br /> <input
														type="text" name="TNUMDOC" id="TNUMDOC"
														value="${__formdata.documento}"
														class="campowidthinput campo campotexto"
														onchange="f_cargar_DATOSPERSONA()"
														<axis:atr f="axisper047" c="TNUMDOC" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TNUMDOC" lit="105330" />"
														title="<axis:alt f="axisper047" c="TNUMDOC" lit="105330" />" /></td>
												</axis:ocultar>
											</tr>
											<tr>
												<axis:ocultar dejarHueco="false" f="axisper047" c="CCLASE">
													<td><span class="bold"><axis:alt f="axisper047"
																c="FEXPEDICDOC" lit="9909608"></axis:alt></span><br /> <input
														type="text" name="FEXPEDICDOC" id="FEXPEDICDOC" size="15"
														class="campo campotexto"
														value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.f_expedicion}"/>"
														title="<axis:alt f='axisper047' c='FEXPEDICDOC' lit='9909608'/>"
														alt="<axis:alt f='axisper047' c='FEXPEDICDOC' lit='9909608'/>"
														<axis:atr f="axisper047" c="FEXPEDICDOC" a="formato=fecha&modificable=false"/> />
														<a style="vertical-align: middle;"> 
<%-- 														    <c:if --%>
<%-- 																test="${__formdata.DET_SARLAFT.ACTIONMOD != 'CONSULTA'}"> --%>
<!-- 																<img id="icon_FEXPEDICDOC" -->
<%-- 																	alt="<axis:alt f="axisper047" c="FEXPEDICDOC" lit="9909608"/>" --%>
<%-- 																	title="<axis:alt f="axisper047" c="FEXPEDICDOC" lit="9909608" />" --%>
<!-- 																	src="images/calendar.gif" /> -->
<%-- 															</c:if> --%>
													</a></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="EMP_PAISEXPEDICION">
													<td><span class="bold"><axis:alt
																f="axisper047" c="EMP_PAISEXPEDICION" lit="9903741"></axis:alt></span><br />
														<input type="text" name="EMP_PAISEXPEDICION"
														id="EMP_PAISEXPEDICION" readonly="readonly"
														style="width: 40px;"
														value="${__formdata.pais_expedicion}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="EMP_PAISEXPEDICION" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMP_PAISEXPEDICION" lit="9903741" />"
														title="<axis:alt f="axisper047" c="EMP_PAISEXPEDICION" lit="9903741" />" />
														<axis:visible c="EMP_PAISEXPEDICION_FIND" f="axisper047">
														<img id="findPais" border="0" src="images/find.gif"
														onclick="f_pais('EMP_PAISEXPEDICION','EMP_DEPEXPEDICION','EMP_LUGEXPEDICION','EMP_TPAISEXPEDICION')"
														style="cursor: pointer" /></axis:visible>
														<input type="text"
														name="EMP_TPAISEXPEDICION" id="EMP_TPAISEXPEDICION"
														value="${__formdata.tpais_expedicion}"
														class="campowidthinput campo campotexto"
														style="width: 70px;"
														<axis:atr f="axisper047" c="EMP_TPAISEXPEDICION" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMP_TPAISEXPEDICION" lit="9903741" />"
														title="<axis:alt f="axisper047" c="EMP_TPAISEXPEDICION" lit="9903741" />" /></td>
												</axis:ocultar>

												<axis:ocultar dejarHueco="false" f="axisper047"
													c="EMP_DEPEXPEDICION">
													<td><span class="bold"><axis:alt
																f="axisper047" c="EMP_DEPEXPEDICION" lit="9903953"></axis:alt></span><br />
														<input type="text" name="EMP_DEPEXPEDICION"
														style="width: 40px;" id="EMP_DEPEXPEDICION"
														value="${__formdata.dep_expedicion}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="EMP_DEPEXPEDICION" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMP_DEPEXPEDICION" lit="9903953" />"
														title="<axis:alt f="axisper047" c="EMP_DEPEXPEDICION" lit="9903953" />" />
														<axis:visible c="EMP_DEPEXPEDICION_FIND" f="axisper047">
														<img id="findPais" border="0" src="images/find.gif"
														onclick="f_dep('EMP_PAISEXPEDICION','EMP_DEPEXPEDICION','EMP_LUGEXPEDICION','EMP_TDEPEXPEDICION')"
														style="cursor: pointer" /></axis:visible>
														
														<input type="text"
														name="EMP_TDEPEXPEDICION" id="EMP_TDEPEXPEDICION"
														value="${__formdata.tdep_expedicion}"
														class="campowidthinput campo campotexto"
														readonly="readonly" style="width: 70px;"
														<axis:atr f="axisper047" c="EMP_TDEPEXPEDICION" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMP_TDEPEXPEDICION" lit="9903953" />"
														title="<axis:alt f="axisper047" c="EMP_TDEPEXPEDICION" lit="9903953" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="EMP_LUGEXPEDICION">
													<td><span class="bold"><axis:alt
																f="axisper047" c="EMP_LUGEXPEDICION" lit="9909609"></axis:alt></span><br />
														<input type="text" name="EMP_LUGEXPEDICION"
														id="EMP_LUGEXPEDICION" readonly="readonly"
														style="width: 40px;"
														value="${__formdata.lug_expedicion}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="EMP_LUGEXPEDICION" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMP_LUGEXPEDICION" lit="9909609" />"
														title="<axis:alt f="axisper047" c="EMP_LUGEXPEDICION" lit="9909609" />" />
														<axis:visible c="EMP_LUGEXPEDICION_FIND" f="axisper047">
														<img id="findPais" border="0" src="images/find.gif"
														onclick="f_ciudad('EMP_PAISEXPEDICION','EMP_DEPEXPEDICION','EMP_LUGEXPEDICION','EMP_TLUGEXPEDICION')"
														style="cursor: pointer" /></axis:visible>
														
														<input type="text"
														name="EMP_TLUGEXPEDICION" id="EMP_TLUGEXPEDICION"
														value="${__formdata.tlug_expedicion}"
														class="campowidthinput campo campotexto"
														style="width: 70px;"
														<axis:atr f="axisper047" c="EMP_TLUGEXPEDICION" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMP_TLUGEXPEDICION" lit="9909609" />"
														title="<axis:alt f="axisper047" c="EMP_TLUGEXPEDICION" lit="9909609" />" /></td>
												</axis:ocultar>
											</tr>
											<tr>
												<axis:ocultar dejarHueco="false" f="axisper047" c="CCLASE">
													<td><span class="bold"><axis:alt f="axisper047"
																c="FNACIMIENTO" lit="1000064"></axis:alt></span><br /> <input
														type="text" name="FNACIMIENTO" id="FNACIMIENTO" size="15"
														class="campo campotexto"
														value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.f_nacimiento}"/>"
														title="<axis:alt f='axisper047' c='FNACIMIENTO' lit='1000064'/>"
														alt="<axis:alt f='axisper047' c='FNACIMIENTO' lit='1000064'/>"
														<axis:atr f="axisper047" c="FNACIMIENTO" a="formato=fecha&modificable=false"/> />
														<a style="vertical-align: middle;"> 
													</a></td>
												</axis:ocultar>

												<axis:ocultar dejarHueco="false" f="100816"
													c="EMP_PAISLUGNACIMI">
													<td><span class="bold"><axis:alt f="axisper047"
																c="EMP_PAISLUGNACIMI" lit="100816"></axis:alt> <axis:alt
																f="axisper047" c="FNACIMILUGAR" lit="9909610"></axis:alt></span><br />
														<input type="text" name="EMP_PAISLUGNACIMI"
														id="EMP_PAISLUGNACIMI" readonly="readonly"
														style="width: 40px;"
														value="${__formdata.pais_nacimiento}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="EMP_PAISLUGNACIMI" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMP_PAISLUGNACIMI" lit="100816" />"
														title="<axis:alt f="axisper047"
																c="EMP_PAISLUGNACIMI" lit="100816"></axis:alt> <axis:alt
																f="axisper047" c="FNACIMILUGAR" lit="9909610"></axis:alt>" />
														<axis:visible c="EMP_PAISLUGNACIMI_FIND" f="axisper047">
														<img id="findPais" border="0" src="images/find.gif"
														onclick="f_pais('EMP_PAISLUGNACIMI','EMP_DEPLUGNACIMI','EMP_LUGNACIMI','EMP_TPAISLUGNACIMI')"
														style="cursor: pointer" /></axis:visible>

														<input type="text"
														name="EMP_TPAISLUGNACIMI" id="EMP_TPAISLUGNACIMI"
														value="${__formdata.tpais_nacimiento}"
														class="campowidthinput campo campotexto"
														style="width: 70px;"
														<axis:atr f="axisper047" c="EMP_TPAISLUGNACIMI" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMP_TPAISLUGNACIMI" lit="100816" />"
														title="<axis:alt f="axisper047" c="EMP_TPAISLUGNACIMI" lit="100816" />" /></td>
												</axis:ocultar>

												<axis:ocultar dejarHueco="false" f="axisper047"
													c="EMP_DEPLUGNACIMI">
													<td><span class="bold"><axis:alt f="axisper047"
																c="EMP_DEPLUGNACIMI" lit="9902610"></axis:alt> <axis:alt
																f="axisper047" c="FNACIMILUGAR" lit="9909610"></axis:alt></span><br />
														<input type="text" name="EMP_DEPLUGNACIMI"
														style="width: 40px;" id="EMP_DEPLUGNACIMI"
														value="${__formdata.dep_nacimiento}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="EMP_DEPLUGNACIMI" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMP_DEPLUGNACIMI" lit="9902610" />"
														title="<axis:alt f="axisper047"
																c="EMP_DEPLUGNACIMI" lit="9902610"></axis:alt> <axis:alt
																f="axisper047" c="FNACIMILUGAR" lit="9909610"></axis:alt>" />
														<axis:visible c="EMP_DEPLUGNACIMI_FIND" f="axisper047">
														<img id="findPais" border="0" src="images/find.gif"
														onclick="f_dep('EMP_PAISLUGNACIMI','EMP_DEPLUGNACIMI','EMP_LUGNACIMI','EMP_TDEPLUGNACIMI')"
														style="cursor: pointer" /></axis:visible>
														
														<input type="text"
														name="EMP_TDEPLUGNACIMI" id="EMP_TDEPLUGNACIMI"
														value="${__formdata.tdep_nacimiento}"
														class="campowidthinput campo campotexto"
														readonly="readonly" style="width: 70px;"
														<axis:atr f="axisper047" c="EMP_TDEPLUGNACIMI" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMP_TDEPLUGNACIMI" lit="9902610" />"
														title="<axis:alt f="axisper047" c="EMP_TDEPLUGNACIMI" lit="9902610" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="EMP_LUGNACIMI">
													<td><span class="bold"><axis:alt f="axisper047"
																c="EMP_LUGNACIMI" lit="9909610"></axis:alt></span><br /> <input
														type="text" name="EMP_LUGNACIMI" id="EMP_LUGNACIMI"
														readonly="readonly" style="width: 40px;"
														value="${__formdata.lug_nacimiento}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="EMP_LUGNACIMI" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMP_LUGNACIMI" lit="9909610" />"
														title="<axis:alt f="axisper047" c="EMP_LUGNACIMI" lit="9909610" />" />
														<axis:visible c="EMP_LUGNACIMI_FIND" f="axisper047">
														<img id="findPais" border="0" src="images/find.gif"
														onclick="f_ciudad('EMP_PAISLUGNACIMI','EMP_DEPLUGNACIMI','EMP_LUGNACIMI','EMP_TLUGNACIMI')"
														style="cursor: pointer" /></axis:visible>
														
														<input type="text"
														name="EMP_TLUGNACIMI" id="EMP_TLUGNACIMI"
														value="${__formdata.tlug_nacimiento}"
														class="campowidthinput campo campotexto"
														style="width: 70px;"
														<axis:atr f="axisper047" c="EMP_TLUGNACIMI" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMP_TLUGNACIMI" lit="9909610" />"
														title="<axis:alt f="axisper047" c="EMP_TLUGNACIMI" lit="9909610" />" /></td>
												</axis:ocultar>
											</tr>
											<tr>

												<axis:ocultar dejarHueco="false" f="axisper047"
													c="TNACIONALI1">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TNACIONALI1" lit="9909611"></axis:alt></span><br /> <input
														type="text" name="TNACIONALI1" id="TNACIONALI1"
														readonly="readonly" style="width: 40px;"
														value="${__formdata.pais_nacionalidad1}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="TNACIONALI1" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TNACIONALI1" lit="9909611" />"
														title="<axis:alt f="axisper047" c="TNACIONALI1" lit="9909611" />" />
														<axis:visible c="TNACIONALI1_FIND" f="axisper047">
														<img id="findPais" border="0" src="images/find.gif"
														onclick="f_pais('TNACIONALI1','','','EMPTNACIONALI1')"
														style="cursor: pointer" /></axis:visible>
														
														<input type="text"
														name="EMPTNACIONALI1" id="EMPTNACIONALI1"
														value="${__formdata.tpais_nacionalidad1}"
														class="campowidthinput campo campotexto"
														style="width: 70px;" readonly="readonly"
														<axis:atr f="axisper047" c="EMPTNACIONALI1" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMPTNACIONALI1" lit="9909611" />"
														title="<axis:alt f="axisper047" c="EMPTNACIONALI1" lit="9909611" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="TNACIONALI2">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TNACIONALI2" lit="9909636"></axis:alt></span><br /> <input
														type="text" name="TNACIONALI2" id="TNACIONALI2"
														readonly="readonly" style="width: 40px;"
														value="${__formdata.pais_nacionalidad2}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="TNACIONALI2" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TNACIONALI2" lit="9909636" />"
														title="<axis:alt f="axisper047" c="TNACIONALI2" lit="9909636" />" />
														<axis:visible c="TNACIONALI2_FIND" f="axisper047">
														<img id="findPais" border="0" src="images/find.gif"
														onclick="f_pais('TNACIONALI2','TDEPATAMENTOSUC','TCIUDADSUC','EMPTNACIONALI2')"
														style="cursor: pointer" /></axis:visible>
														
														<input type="text"
														name="EMPTNACIONALI2" id="EMPTNACIONALI2"
														value="${__formdata.tpais_nacionalidad2}"
														class="campowidthinput campo campotexto"
														style="width: 70px;" 70px;" readonly="readonly"
														<axis:atr f="axisper047" c="EMPTNACIONALI2" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMPTNACIONALI2" lit="9909636" />"
														title="<axis:alt f="axisper047" c="EMPTNACIONALI2" lit="9909636" />" /></td>
												</axis:ocultar>
											</tr>
											<tr>											
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="EMP_TMAILREPL">
													<td><span class="bold"><axis:alt f="axisper047"
																c="EMP_TMAILREPL" lit="9903325"></axis:alt></span><br /> <input
														type="text" name="EMP_TMAILREPL" id="EMP_TMAILREPL"
														value="${__formdata.email}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="EMP_TMAILREPL" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMP_TMAILREPL" lit="9903325" />"
														title="<axis:alt f="axisper047" c="EMP_TMAILREPL" lit="9903325" />" /></td>
												</axis:ocultar>
												
												<axis:ocultar dejarHueco="false" f="axisper047" c="TTELREPL">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TTELREPL" lit="9000992"></axis:alt></span><br /> <input
														onkeypress="return isNumberKey(event)"
														type="text" name="TTELREPL" id="TTELREPL"
														value="${__formdata.telefono}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="TTELREPL" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TTELREPL" lit="9000992" />"
														title="<axis:alt f="axisper047" c="TTELREPL" lit="9000992" />" /></td>
												</axis:ocultar>
												
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="TCELUREPL">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TCELUREPL" lit="9909640"></axis:alt></span><br /> <input
																onkeypress="return isNumberKey(event)"
														type="text" name="TCELUREPL" id="TCELUREPL"
														value="${__formdata.celular}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="TCELUREPL" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TCELUREPL" lit="9909640" />"
														title="<axis:alt f="axisper047" c="TCELUREPL" lit="9909640" />" /></td>
												</axis:ocultar>
											</tr>
											<tr>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="EMP_TDIRSREPL">
													<td><span class="bold"><axis:alt f="axisper047"
																c="EMP_TDIRSREPL" lit="9909638"></axis:alt></span><br /> <input
														type="text" name="EMP_TDIRSREPL" id="EMP_TDIRSREPL"
														value="${__formdata.direccion}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="TOFICINAPRI" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMP_TDIRSREPL" lit="9909638" />"
														title="<axis:alt f="axisper047" c="EMP_TDIRSREPL" lit="9909638" />" /></td>
												</axis:ocultar>

												<axis:ocultar dejarHueco="false" f="axisper047"
													c="EMP_CPAIRREPL">
													<td><span class="bold"><axis:alt f="axisper047"
																c="EMP_CPAIRREPL" lit="9000789"></axis:alt></span><br /> <input
														type="text" name="EMP_CPAIRREPL" id="EMP_CPAIRREPL"
														readonly="readonly" style="width: 40px;"
														value="${__formdata.pais_residencia}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="EMP_CPAIRREPL" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMP_CPAIRREPL" lit="9000789" />"
														title="<axis:alt f="axisper047" c="EMP_CPAIRREPL" lit="9000789" />" />
														<axis:visible c="EMP_CPAIRREPL_FIND" f="axisper047">
														<img id="findPais" border="0" src="images/find.gif"
														onclick="f_pais('EMP_CPAIRREPL','EMP_CDEPRREPL','EMP_CCIURREPL','EMP_TPAIRREPL')"
														style="cursor: pointer" /></axis:visible>
														
														<input type="text"
														name="EMP_TPAIRREPL" id="EMP_TPAIRREPL"
														value="${__formdata.tpais_residencia}"
														class="campowidthinput campo campotexto"
														readonly="readonly" style="width: 70px;"
														<axis:atr f="axisper047" c="EMP_TPAIRREPL" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMP_TPAIRREPL" lit="9000789" />"
														title="<axis:alt f="axisper047" c="EMP_TPAIRREPL" lit="9000789" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="EMP_CDEPRREPL">
													<td><span class="bold"><axis:alt f="axisper047"
																c="EMP_CDEPRREPL" lit="9902610"></axis:alt></span><br /> <input
														type="text" name="EMP_CDEPRREPL" style="width: 40px;"
														id="EMP_CDEPRREPL" readonly="readonly"
														value="${__formdata.dep_residencia}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="EMP_CDEPRREPL" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMP_CDEPRREPL" lit="9902610" />"
														title="<axis:alt f="axisper047" c="EMP_CDEPRREPL" lit="9902610" />" />
														 <axis:visible c="EMP_CDEPRREPL_FIND" f="axisper047">
														<img id="findPais" border="0" src="images/find.gif"
														onclick="f_dep('EMP_CPAIRREPL','EMP_CDEPRREPL','EMP_CCIURREPL','EMP_TDEPRREPL')"
														style="cursor: pointer" /></axis:visible>
														
														<input type="text"
														name="EMP_TDEPRREPL" id="EMP_TDEPRREPL"
														value="${__formdata.tdep_residencia}"
														class="campowidthinput campo campotexto"
														style="width: 70px;" readonly="readonly"
														<axis:atr f="axisper047" c="EMP_TDEPRREPL" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMP_TDEPRREPL" lit="9902610" />"
														title="<axis:alt f="axisper047" c="EMP_TDEPRREPL" lit="9902610" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="EMP_CCIURREPL">
													<td><span class="bold"><axis:alt f="axisper047"
																c="EMP_CCIURREPL" lit="9908410"></axis:alt></span><br /> <input
														type="text" name="EMP_CCIURREPL" id="EMP_CCIURREPL"
														readonly="readonly" style="width: 40px;"
														value="${__formdata.lug_residencia}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="TCIUDAD" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMP_CCIURREPL" lit="9908410" />"
														title="<axis:alt f="axisper047" c="EMP_CCIURREPL" lit="9908410" />" />
														<axis:visible c="EMP_CCIURREPL_FIND" f="axisper047">
														<img id="findPais" border="0" src="images/find.gif"
														onclick="f_ciudad('EMP_CPAIRREPL','EMP_CDEPRREPL','EMP_CCIURREPL','EMP_TCIURREPL')"
														style="cursor: pointer" /></axis:visible>
														
														<input type="text"
														name="EMP_TCIURREPL" id="EMP_TCIURREPL"
														value="${__formdata.tlug_residencia}"
														class="campowidthinput campo campotexto"
														readonly="readonly" style="width: 70px;"
														<axis:atr f="axisper047" c="EMP_TCIURREPL" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="EMP_TCIURREPL" lit="9908410" />"
														title="<axis:alt f="axisper047" c="EMP_TCIURREPL" lit="9908410" />" /></td>
												</axis:ocultar>
											</tr>
											<tr>
												<axis:ocultar dejarHueco="false" f="axisper047" c="NRECPUB">
													<td rowspan="2" colspan="2"><span class="bold"><axis:alt f="axisper047"
																c="NRECPUB" lit="89906156"></axis:alt></span><br /> 
													<select title="<axis:alt f='axisper047' c='NRECPUB' lit='89906156' />"
														alt="<axis:alt f='axisper047' c='NRECPUB' lit='89906156' />"
														name="NRECPUB" id="NRECPUB" size="1"
														onchange="cargar_pantalla_por_clase();f_onchange_NRECPUB(this.value)"
														class="campowidthselect campo campotexto_ob"
														<axis:atr f="axisper047" c="NRECPUB" a="isInputText=false&modificable=true&obligatorio=true"/>>
															<option selected value>-
																<axis:alt f="axisper047" c="BLANCO" lit="1000348" /> -
															</option>
															<c:forEach var="clase" items="${sessionScope.LS_VALORES}">
																<option value="${clase.CATRIBU}"
																	<c:if test="${clase.CATRIBU == __formdata.DET_SARLAFT.NRECPUB}">selected</c:if>>${clase.TATRIBU}</option>
															</c:forEach>
													</select></td>
												</axis:ocultar>
												
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="NGRADOPOD">
													<td colspan="2"><span class="bold"><axis:alt f="axisper047"
																c="NGRADOPOD" lit="89906155"></axis:alt></span><br /> <select
														title="<axis:alt f='axisper047' c='NGRADOPOD' lit='89906155' />"
														alt="<axis:alt f='axisper047' c='NGRADOPOD' lit='89906155' />"
														name="NGRADOPOD" id="NGRADOPOD" size="1"
														onchange="cargar_pantalla_por_clase();"
														class="campowidthselect campo campotexto_ob"
														<axis:atr f="axisper047" c="NGRADOPOD" a="isInputText=false&modificable=true&obligatorio=true"/>>
															<option selected value>-
																<axis:alt f="axisper047" c="BLANCO" lit="1000348" /> -
															</option>
															<c:forEach var="clase" items="${sessionScope.LS_VALORES}">
																<option value="${clase.CATRIBU}"
																	<c:if test="${clase.CATRIBU == __formdata.DET_SARLAFT.NGRADOPOD}">selected</c:if>>${clase.TATRIBU}</option>
															</c:forEach>
													</select></td>
												</axis:ocultar>

											</tr>
											<tr>
											</tr>
											<tr>
												<axis:ocultar dejarHueco="false" f="axisper047" c="NVINCULO">
													<td rowspan="2"><span class="bold"><axis:alt f="axisper047"
																c="NVINCULO" lit="89906153"></axis:alt></span><br /> <select
														title="<axis:alt f='axisper047' c='NVINCULO' lit='89906153' />"
														alt="<axis:alt f='axisper047' c='NVINCULO' lit='89906153' />"
														name="NVINCULO" id="NVINCULO" size="1"
														onchange="cargar_pantalla_por_clase();"
														class="campowidthselect campo campotexto_ob"
														<axis:atr f="axisper047" c="NVINCULO" a="isInputText=false&modificable=true&obligatorio=false"/>>
															<option selected value>-
																<axis:alt f="axisper047" c="BLANCO" lit="1000348" /> -
															</option>
															<c:forEach var="clase" items="${sessionScope.LS_VALORES}">
																<option value="${clase.CATRIBU}"
																	<c:if test="${clase.CATRIBU == __formdata.DET_SARLAFT.NVINCULO}">selected</c:if>>${clase.TATRIBU}</option>
															</c:forEach>
													</select></td>
												</axis:ocultar>
												
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="TINDIQUEVIN">
													<td><br /> <span class="bold"><axis:alt
																f="axisper047" c="TINDIQUEVIN" lit="89907044"></axis:alt></span><br />
														<input type="text" name="TINDIQUEVIN" id="TINDIQUEVIN"
														value="${__formdata.DET_SARLAFT.TINDIQUEVIN}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="TINDIQUEVIN" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TINDIQUEVIN" lit="89907044" />"
														title="<axis:alt f="axisper047" c="TINDIQUEVIN" lit="89907044" />" /></td>
												</axis:ocultar>
											</tr>
											<tr>
											</tr>
										</table>
										
									</td>
								</tr>

								<tr>
									<td id="td_LIT_89906150" class="campocaja" colspan="10"><img
										id="DS_89906150_parent" src="images/mes.gif"
										onclick="objEstilos.toggleDisplay('DS_89906150', this)"
										style="cursor: pointer" /> <b> <axis:alt f="axisper047"
												c="LIT_89906150" lit="89906150" />
									</b>										
										<div style="clear: both;">
											<hr class="titulo"></hr>
										</div></td>
								</tr>

								<tr>
									<td>
										<table id="DS_89906150_children" style="display: none">

											<tr>
											<!-- CP0728M_SYS_PERS_Val - ACL - 23/11/2018 -- Se modifica para que muestre el vinculo de nuevo  -->
												<td>
												<c:if test="${__formdata.ACTIONMOD != 'CONSULTA'}"> <%-- TCS 1574 AP 29/01/2019 --%>
												<%--<c:if test="${__formdata.DET_SARLAFT.SSARLAFT==null}">--%>
													<div style="float: right">
															<img id="new" border="0" src="images/new.gif"
																title="<axis:alt f="axisper047" c="NEW" lit="104825"/>"
																alt="<axis:alt f="axisper047" c="NEW" lit="104825"/>"
																onclick="f_abrir_axisper047_a()" style="cursor: pointer" />
													</div>
												</c:if>
													<div class="titulo"></div>
													 <c:set var="title1">
														<axis:alt f="axisper047" c="CTIPIDEN" lit="9909619" />
													</c:set> <c:set var="title2">
														<axis:alt f="axisper047" c="NNUMIDE" lit="9904434" />
													</c:set> <c:set var="title3">
														<axis:alt f="axisper047" c="TNOMBRE" lit="9907629" />
													</c:set> <c:set var="title4">
														<axis:alt f="axisper047" c="PPARTICI" lit="104818" />
													</c:set> <c:set var="title5">
														<axis:alt f="axisper047" c="CBOLSA" lit="89906151" />
													</c:set> <c:set var="title6">
														<axis:alt f="axisper047" c="CPEP" lit="89906152" />
													</c:set> <c:set var="title7">
														<axis:alt f="axisper047" c="CTRIBUEXT" lit="89906153" />
													</c:set> <%int contador = 0;%>
													<div class="seccion displayspaceGrande" style="width: 98%">
														<display:table name="${__formdata.LISTAACC}" id="LS"
															export="false" class="dsptgtable" pagesize="-1"
															defaultsort="2" defaultorder="ascending"
															requestURI="axis_axisper047.do?paginar=true" sort="list"
															cellpadding="0" cellspacing="0">
															<%@ include file="../include/displaytag.jsp"%>
															<display:column title="${title1}" sortProperty="CTIPIDEN"
																headerClass="sortable" media="html" sortable="true"
																autolink="false">
																<div class="dspText">

																	<select class="selectdisabled"
																		<c:if test="${__formdata.ACTIONMOD != 'CONSULTA'}">disabled</c:if>>
																		<c:forEach var="element"
																			items="${sessionScope.ls_identificaciones}">
																			<option value="${element.CATRIBU}"
																				<c:if test="${element.CATRIBU == LS.CTIPIDEN}">selected</c:if>>
																				${element.TATRIBU}</option>
																		</c:forEach>
																	</select>

																</div>
															</display:column>
															<display:column title="${title2}"
																sortProperty="NNUMIDE" headerClass="sortable"
																media="html" sortable="true" autolink="false">
																<div class="dspText">${LS.NNUMIDE}</div>
															</display:column>
															<display:column title="${title3}" sortProperty="TNOMBRE"
																headerClass="sortable" media="html" sortable="true"
																autolink="false">
																<div class="dspText">${LS.TNOMBRE}</div>
															</display:column>
															<display:column title="${title4}"
																sortProperty="PPARTICI" headerClass="sortable"
																media="html" sortable="true" autolink="false">
																<div class="dspText">${LS.PPARTICI}</div>
															</display:column>
															<display:column title="${title5}" sortProperty="CBOLSA"
																headerClass="sortable" media="html" sortable="true"
																autolink="false">
																<div class="dspText">


																	<select class="selectdisabled"
																		<c:if test="${__formdata.ACTIONMOD != 'CONSULTA'}">disabled</c:if>>
																		<c:forEach var="element"
																			items="${sessionScope.LS_VALORES}">
																			<option value="${element.CATRIBU}"
																				<c:if test="${element.CATRIBU == LS.CBOLSA}">selected</c:if>>
																				${element.TATRIBU}</option>
																		</c:forEach>
																	</select>

																</div>
															</display:column>
															<display:column title="${title6}" sortProperty="CPEP"
																headerClass="sortable" media="html" sortable="true"
																autolink="false">
																<div class="dspText">
																	<select class="selectdisabled"
																		<c:if test="${__formdata.ACTIONMOD != 'CONSULTA'}">disabled</c:if>>
																		<c:forEach var="element"
																			items="${sessionScope.LS_VALORES}">
																			<option value="${element.CATRIBU}"
																				<c:if test="${element.CATRIBU == LS.CPEP}">selected</c:if>>
																				${element.TATRIBU}</option>
																		</c:forEach>
																	</select>
																</div>
															</display:column>
															<display:column title="${title7}"
																sortProperty="CTRIBUEXT" headerClass="sortable"
																media="html" sortable="true" autolink="false">
																<div class="dspText">
																	<select class="selectdisabled" disabled>
																		<option selected value>-
															            </option>
																		<c:forEach var="element"
																			items="${sessionScope.LS_PAIS}">
																			<option value="${element.CPAIS}"
																				<c:if test="${element.CPAIS == LS.CTRIBUEXT}">selected</c:if>>
																				${element.TPAIS}</option>
																		</c:forEach>
																	</select>
																</div>
															</display:column>
															<axis:visible c="DSP_ICONS" f="axisper047">
															<display:column title=""
																headerClass="headwidth5 sortable" style="width:5%"
																media="html" autolink="false">
																<div class="dspIcons">
																	<img id="find" border="0" src="images/delete.gif"
																		onclick="borrar_sarlaft_acci('${LS.SSARLAFT}','${LS.IDENTIFICACION}');"
																		style="cursor: pointer" />
																	<img border="0" alt="<axis:alt f='axisper009' c='LIT_EDITAR' lit='9901356'/>" title="<axis:alt f='axisper009' c='LIT_EDITAR' lit='9901356'/>" src="images/lapiz.gif"
                      													onclick="f_open_accionistas('${LS.IDENTIFICACION}', '${LS.SSARLAFT}','${LS.CTIPIDEN}','${LS.NNUMIDE}','${LS.TNOMBRE}','${LS.PPARTICI}','${LS.CBOLSA}','${LS.CPEP}','${LS.CTRIBUEXT}')"/>
																</div>
															</display:column>
															</axis:visible>
															<%
																contador++;
															%>
														</display:table>
													</div>
												</td>
											</tr>
										</table>
										
									</td>
								</tr>

								<tr>
									<td id="td_LIT_89906137" class="campocaja" colspan="10">
									
									<img
										id="DS_89906137_parent" src="images/mes.gif"
										onclick="objEstilos.toggleDisplay('DS_89906137', this)"
										style="cursor: pointer" /> <b> <axis:alt f="axisper047"
												c="LIT_89906137" lit="89906137" />
									</b>
										<div style="clear: both;">
											<hr class="titulo"></hr>
										</div></td>
								</tr>
								<!-- CP0637M_SYS_PERS - ACL - 19/11/2018 -- Se modifica para que muestre el vnculo de nuevo  -->
								<tr>
									<td>
									<%--	Ini TCS_1560 - ACL - 11/02/2019
										<table id="DS_89906137_children" style="display: none">  --%>
										<table id="DS_89906137_children">

											<tr>
												<td> 
												    <c:if test="${__formdata.ACTIONMOD != 'CONSULTA'}"> <%-- TCS 1574 AP 29/01/2019 --%>
													<%--<c:if test="${__formdata.DET_SARLAFT.SSARLAFT==null}">--%>
														<div style="float: right">
															<img id="new" border="0" src="images/new.gif"
																title="<axis:alt f="axisper047" c="NEW" lit="104825"/>"
																alt="<axis:alt f="axisper047" c="NEW" lit="104825"/>"
																onclick="f_abrir_axisper051()" style="cursor: pointer" />
														</div>
													</c:if>
													<div class="titulo"></div>
													 <c:set var="title1">
														<axis:alt f="axisper047" c="CTIPREL" lit="89906119" />
													</c:set> <c:set var="title2">
														<axis:alt f="axisper047" c="TNOMBRE" lit="9907629" />
													</c:set> <c:set var="title3">
														<axis:alt f="axisper047" c="CTIPIDEN" lit="9904433" />
													</c:set> <c:set var="title4">
														<axis:alt f="axisper047" c="NNUMIDE" lit="9904434" />
													</c:set> <c:set var="title5">
														<axis:alt f="axisper047" c="CPAIS" lit="9909611" />
													</c:set> <c:set var="title6">
														<axis:alt f="axisper047" c="TENTIDAD" lit="9001624" />
													</c:set> <c:set var="title7">
														<axis:alt f="axisper047" c="TCARGO" lit="9902638" />
													</c:set> <c:set var="title8">
														<axis:alt f="axisper047" c="FDESVIN" lit="89906120" />
													</c:set> <%
 	int contador1 = 0;
 %>
													<div class="seccion displayspaceGrande" style="width: 98%">
														<display:table name="${__formdata.LISTAPEP}" id="LS"
															export="false" class="dsptgtable" pagesize="-1"
															defaultsort="2" defaultorder="ascending"
															requestURI="axis_axisper047.do?paginar=true" sort="list"
															cellpadding="0" cellspacing="0">
															<%@ include file="../include/displaytag.jsp"%>
															<display:column title="${title1}" sortProperty="CTIPREL"
																headerClass="sortable" media="html" sortable="true"
																autolink="false">
																<div class="dspText">${LS.TTIPREL}</div>
															</display:column>


															<display:column title="${title2}" sortProperty="TNOMBRE"
																headerClass="sortable" media="html" sortable="true"
																autolink="false">
																<div class="dspText">${LS.TNOMBRE}</div>
															</display:column>
															<display:column title="${title3}" sortProperty="CTIPIDEN"
																headerClass="sortable" media="html" sortable="true"
																autolink="false">
																<div class="dspText">

																	<select class="selectdisabled" disabled>
																		<c:forEach var="element"
																			items="${sessionScope.ls_identificaciones}">
																			<option value="${element.CATRIBU}"
																				<c:if test="${element.CATRIBU == LS.CTIPIDEN}">selected</c:if>>
																				${element.TATRIBU}</option>
																		</c:forEach>
																	</select>

																</div>
															</display:column>
															<display:column title="${title4}" sortProperty="NNUMIDE"
																headerClass="sortable" media="html" sortable="true"
																autolink="false">
																<div class="dspText">${LS.NNUMIDE}</div>
															</display:column>
															<display:column title="${title5}" sortProperty="TPAIS"
																headerClass="sortable" media="html" sortable="true"
																autolink="false">
																<div class="dspText">${LS.TPAIS}</div>
															</display:column>
															<display:column title="${title6}" sortProperty="TENTIDAD"
																headerClass="sortable" media="html" sortable="true"
																autolink="false">
																<div class="dspText">${LS.TENTIDAD}</div>
															</display:column>
															<display:column title="${title7}"
																sortProperty="TCARGO" headerClass="sortable"
																media="html" sortable="true" autolink="false">
																<div class="dspText">${LS.TCARGO}</div>
															</display:column>
															<display:column title="${title8}"
																sortProperty="FDESVIN" headerClass="sortable"
																media="html" sortable="true" autolink="false">
																<div class="dspText">${LS.FDESVIN}</div>
															</display:column>
															<axis:visible c="DSP_ICONS" f="axisper047">
															<display:column title=""
																headerClass="headwidth5 sortable" style="width:5%"
																media="html" autolink="false">
																<div class="dspIcons">
																	<img id="find" border="0" src="images/delete.gif"
																		onclick="borrar_sarlaft_exp('${LS.SSARLAFT}','${LS.IDENTIFICACION}');"
																		style="cursor: pointer" />
																	<img border="0" alt="<axis:alt f='axisper009' c='LIT_EDITAR' lit='9901356'/>" title="<axis:alt f='axisper009' c='LIT_EDITAR' lit='9901356'/>" src="images/lapiz.gif"
                      													onclick="f_open_axisper051('${LS.IDENTIFICACION}', '${LS.SSARLAFT}','${LS.CTIPREL}','${LS.TNOMBRE}','${LS.CTIPIDEN}','${LS.NNUMIDE}','${LS.CPAIS}','${LS.TPAIS}','${LS.TENTIDAD}','${LS.TCARGO}','${LS.FDESVIN}')"/>
																</div>
															</display:column>
															</axis:visible>
															<%
																contador1++;
															%>
														</display:table>
													</div>
												</td>
											</tr>
										</table>


										
									</td>
								</tr>

								<tr>
									<td id="td_LIT_89906138" class="campocaja" colspan="10"><img
										id="DS_89906138_parent" src="images/mes.gif"
										onclick="objEstilos.toggleDisplay('DS_89906138', this)"
										style="cursor: pointer" /> <b> <axis:alt f="axisper047"
												c="LIT_89906138" lit="89906138" />
									</b>
										<div style="clear: both;">
											<hr class="titulo"></hr>
										</div></td>
								</tr>

								<tr>
									<td>
										<table id="DS_89906138_children" style="display: none">
 										<!-- CP0728M_SYS_PERS_Val - ACL - 23/11/2018 -- Se modifica para que muestre el vinculo de nuevo  -->
											<tr>
												<td><c:if test="${__formdata.ACTIONMOD != 'CONSULTA'}">  <%-- TCS 1574 AP 29/01/2019 --%>
												<%--<c:if test="${__formdata.DET_SARLAFT.SSARLAFT==null}">--%>
														<div style="float: right">
																<img id="new" border="0" src="images/new.gif"
																	title="<axis:alt f="axisper047" c="NEW" lit="104825"/>"
																	alt="<axis:alt f="axisper047" c="NEW" lit="104825"/>"
																	onclick="f_abrir_axisper052()" style="cursor: pointer" />
														</div>
													</c:if>
													<div class="titulo"></div>
													 <c:set var="title1">
														<axis:alt f="axisper047" c="CTIPIDEN" lit="9904433" />
													</c:set> <c:set var="title2">
														<axis:alt f="axisper047" c="NNUMIDE" lit="9904434" />
													</c:set> <c:set var="title3">
														<axis:alt f="axisper047" c="TNOMBRE" lit="9907629" />
													</c:set> <c:set var="title4">
														<axis:alt f="axisper047" c="PPARTICI" lit="104818" />
													</c:set> <c:set var="title5">
														<axis:alt f="axisper047" c="TSOCIEDAD" lit="89906143" />
													</c:set> <c:set var="title6">
														<axis:alt f="axisper047" c="NNUMIDESOC" lit="9905773" />
													</c:set> <%
 														int contador2 = 0;
 															%>
													<div class="seccion displayspaceGrande" style="width: 98%">
														<display:table name="${__formdata.LISTABEN}" id="LS"
															export="false" class="dsptgtable" pagesize="-1"
															defaultsort="2" defaultorder="ascending"
															requestURI="axis_axisper047.do?paginar=true" sort="list"
															cellpadding="0" cellspacing="0">
															<%@ include file="../include/displaytag.jsp"%>
															<display:column title="${title1}" sortProperty="CTIPOID"
																headerClass="sortable" media="html" sortable="true"
																autolink="false">
																<div class="dspText">
																	<select class="selectdisabled"
																		<c:if test="${__formdata.ACTIONMOD != 'CONSULTA'}">disabled</c:if>>
																		<c:forEach var="element"
																			items="${sessionScope.ls_identificaciones}">
																			<option value="${element.CATRIBU}"
																				<c:if test="${element.CATRIBU == LS.CTIPIDEN}">selected</c:if>>
																				${element.TATRIBU}</option>
																		</c:forEach>
																	</select>
															</div>
															</display:column>
															<display:column title="${title2}"
																sortProperty="CNUMEROID" headerClass="sortable"
																media="html" sortable="true" autolink="false">
																<div class="dspText">${LS.NNUMIDE}</div>
															</display:column>
															<display:column title="${title3}" sortProperty="TNOMBRE"
																headerClass="sortable" media="html" sortable="true"
																autolink="false">
																<div class="dspText">${LS.TNOMBRE}</div>
															</display:column>
															<display:column title="${title4}"
																sortProperty="CMANEJAREC" headerClass="sortable"
																media="html" sortable="true" autolink="false">
																<div class="dspText">${LS.PPARTICI}</div>
															</display:column>
															<display:column title="${title5}"
																sortProperty="CEJERCEPOD" headerClass="sortable"
																media="html" sortable="true" autolink="false">
																<div class="dspText">${LS.TSOCIEDAD}</div>
															</display:column>
															<display:column title="${title6}" sortProperty="CGOZAREC"
																headerClass="sortable" media="html" sortable="true"
																autolink="false">
																<div class="dspText">${LS.NNUMIDESOC}</div>
															</display:column>
															<axis:visible c="DSP_ICONS" f="axisper047">
															<display:column title=""
																headerClass="headwidth5 sortable" style="width:5%"
																media="html" autolink="false">
																<div class="dspIcons">
																	<img id="find" border="0" src="images/delete.gif"
																		onclick="borrar_sarlaft_ben('${LS.SSARLAFT}','${LS.IDENTIFICACION}');"
																		style="cursor: pointer" />
																	<img border="0" alt="<axis:alt f='axisper009' c='LIT_EDITAR' lit='9901356'/>" title="<axis:alt f='axisper009' c='LIT_EDITAR' lit='9901356'/>" src="images/lapiz.gif"
                      													onclick="f_open_axisper052('${LS.IDENTIFICACION}','${LS.SSARLAFT}','${LS.CTIPIDEN}','${LS.NNUMIDE}','${LS.TNOMBRE}','${LS.PPARTICI}','${LS.TSOCIEDAD}','${LS.NNUMIDESOC}')"/>
																</div>
															</display:column>
															</axis:visible>
															<%
																contador2++;
															%>
														</display:table>
													</div>
												</td>
											</tr>
										</table>

										
									</td>
								</tr>

								<tr>
									<td id="td_LIT_9909139" class="campocaja" colspan="10"><img
										id="DS_9909139_parent" src="images/mes.gif"
										onclick="objEstilos.toggleDisplay('DS_9909139', this)"
										style="cursor: pointer" /> <b> <axis:alt f="axisper047"
												c="LIT_9909139" lit="9909139" />
									</b>
										<div style="clear: both;">
											<hr class="titulo"></hr>
										</div></td>
								</tr>

								<tr>
									<td>
										<table id="DS_9909139_children" style="display: none">

											<tr>


									<!-- CP0640M_SYS_PERS_Val  - ACL - 20/12/2018 --  Se modifica el literal  -->
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="IINGRESOS">
													<td><span class="bold"><axis:alt f="axisper047"
																c="IINGRESOS" lit="89906207"></axis:alt></span><br /> <input
														onkeypress="return isNumberKey(event)" type="text"
														name="IINGRESOS" id="IINGRESOS"
														value="${__formdata.DET_SARLAFT.IINGRESOS}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="IINGRESOS" 
			a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="IINGRESOS" lit="89906207" />"
														title="<axis:alt f="axisper047" c="IINGRESOS" lit="89906207" />" /></td>
												</axis:ocultar>
												<!-- CP0727M_SYS_PERS_Val - ACL - 23/11/2018 -- Se modifica el literal para el campo egresos  -->
												<axis:ocultar dejarHueco="false" f="axisper047" c="IEGRESOS">
													<td><span class="bold"><axis:alt f="axisper047"
																c="IEGRESOS" lit="9909625"></axis:alt></span><br /> <input
																onkeypress="return isNumberKey(event)"
														type="text" name="IEGRESOS" id="IEGRESOS"
														value="${__formdata.DET_SARLAFT.IEGRESOS}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="IEGRESOS" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="IEGRESOS" lit="9909625" />"
														title="<axis:alt f="axisper047" c="IEGRESOS" lit="9909625" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047" c="IACTIVOS">
													<td><span class="bold"><axis:alt f="axisper047"
																c="IACTIVOS" lit="108957"></axis:alt></span><br /> <input
																onkeypress="return isNumberKey(event)"
														type="text" name="IACTIVOS" id="IACTIVOS"
														value="${__formdata.DET_SARLAFT.IACTIVOS}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="IACTIVOS" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="IACTIVOS" lit="108957" />"
														title="<axis:alt f="axisper047" c="IACTIVOS" lit="108957" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047" c="IPASIVOS">
													<td><span class="bold"><axis:alt f="axisper047"
																c="IPASIVOS" lit="9909626"></axis:alt></span><br /> <input
														type="text" name="IPASIVOS" id="IPASIVOS"
														value="${__formdata.DET_SARLAFT.IPASIVOS}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="IPASIVOS" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="IPASIVOS" lit="9909626" />"
														title="<axis:alt f="axisper047" c="IPASIVOS" lit="9909626" />" /></td>
												</axis:ocultar>
												</td>
											</tr>
											<tr>
											<!-- CP0727M_SYS_PERS_Val - ACL - 23/11/2018 -- Se modifica para modificar la posicin del campo patrimonio  -->
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="IPATRIMONIO">
													<td><span class="bold"><axis:alt f="axisper047"
																c="IPATRIMONIO" lit="9001295"></axis:alt></span><br /> <input
														type="text" name="IPATRIMONIO" id="IPATRIMONIO"
														onkeypress="return isNumberKey(event)"
														value="${__formdata.DET_SARLAFT.IPATRIMONIO}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="IPATRIMONIO" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="IPATRIMONIO" lit="9001295" />"
														title="<axis:alt f="axisper047" c="IPATRIMONIO" lit="9001295" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="IOTROINGRESO">
													<td><span class="bold"><axis:alt f="axisper047"
																c="IOTROINGRESO" lit="9909646"></axis:alt></span><br /> <input
														onkeypress="return isNumberKey(event)"
														type="text" name="IOTROINGRESO" id="IOTROINGRESO"
														value="${__formdata.DET_SARLAFT.IOTROINGRESO}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="IOTROINGRESO" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="IOTROINGRESO" lit="9909646" />"
														title="<axis:alt f="axisper047" c="IOTROINGRESO" lit="9909646" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="TCONCOTRING">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TCONCOTRING" lit="9909647"></axis:alt></span><br /> <input
														type="text" name="TCONCOTRING" id="TCONCOTRING"
														value="${__formdata.DET_SARLAFT.TCONCOTRING}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="TCONCOTRING" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TCONCOTRING" lit="9909647" />"
														title="<axis:alt f="axisper047" c="TCONCOTRING" lit="9909647" />" /></td>
												</axis:ocultar>
												<td></td>
											</tr>
										</table>
							</table>
						</c:if> <c:if test="${__formdata.PERSONANATURAL}">
							<table class="area">
								<tr>
									<td id="td_LIT_89906130" class="campocaja" colspan="10"><img
										id="DS_89906130_parent" src="images/mes.gif"
										onclick="objEstilos.toggleDisplay('DS_89906130', this)"
										style="cursor: pointer" /> <b> <axis:alt f="axisper047"
												c="LIT_89906130" lit="89906130" />
									</b>
										<div style="clear: both;">
											<hr class="titulo"></hr>
										</div></td>
								</tr>
								<tr>
									<td>
										<table id="DS_89906130_children" style="display: none">
											<tr>
											<!-- INI CP0416M_SYS_PERS  18/12/2018 ACL -->
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="PER_PAPELLIDO">
													<td><span class="bold"><axis:alt f="axisper047"
																c="PER_PAPELLIDO" lit="9909635"></axis:alt></span><br /> <input
														type="text" name="PER_PAPELLIDO" id="PER_PAPELLIDO"
														value="${__formdata.primer_apellido}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="PER_PAPELLIDO" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_PAPELLIDO" lit="9909635" />"
														title="<axis:alt f="axisper047" c="PER_PAPELLIDO" lit="9909635" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="PER_SAPELLIDO">
													<td><span class="bold"><axis:alt f="axisper047"
																c="PER_SAPELLIDO" lit="9909605"></axis:alt></span><br /> <input
														type="text" name="PER_SAPELLIDO" id="PER_SAPELLIDO"
														value="${__formdata.segundo_apellido}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="PER_SAPELLIDO" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_SAPELLIDO" lit="9909605" />"
														title="<axis:alt f="axisper047" c="PER_SAPELLIDO" lit="9909605" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="PER_NOMBRES">
													<td><span class="bold"><axis:alt f="axisper047"
																c="PER_NOMBRES" lit="9909607"></axis:alt></span><br /> <input
														type="text" name="PER_NOMBRES" id="PER_NOMBRES"
														value="${__formdata.nombres}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="PER_NOMBRES" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_NOMBRES" lit="9909607" />"
														title="<axis:alt f="axisper047" c="PER_NOMBRES" lit="9909607" />" /></td>
												</axis:ocultar>
											</tr>
											<tr>

												<axis:ocultar dejarHueco="false" f="axisper047"
													c="PER_TIPDOCUMENT">
													<td><span class="bold"><axis:alt f="axisper047"
																c="PER_TIPDOCUMENT" lit="150996"></axis:alt></span><br /> <select
														title="<axis:alt f='axisper047' c='PER_TIPDOCUMENT' lit='150996' />"
														alt="<axis:alt f='axisper047' c='PER_TIPDOCUMENT' lit='150996' />"
														name="PER_TIPDOCUMENT" id="PER_TIPDOCUMENT" size="1"
														onchange="cargar_pantalla_por_clase();"
														class="campowidthselect campo campotexto_ob"
														<axis:atr f="axisper047" c="PER_TIPDOCUMENT" a="isInputText=false&modificable=false"/>>
															<option selected value="1000">- <axis:alt f="axisper047" c="BLANCO" lit="1000348" /> -
															</option>
															<c:forEach var="clase"
																items="${sessionScope.LS_TIPOS_DOCUMENTOS}">
																<option value="${clase.CATRIBU}"
																	<c:if test="${clase.CATRIBU == __formdata.tipo_documento}">selected</c:if>>${clase.TATRIBU}</option>
															</c:forEach>

													</select></td>
												</axis:ocultar>


												<axis:ocultar dejarHueco="false" f="axisper047"
													c="PER_DOCUMENT">
													<td><span class="bold"><axis:alt f="axisper047"
																c="PER_DOCUMENT" lit="9908819"></axis:alt></span><br /> <input
														type="text" name="PER_DOCUMENT" id="PER_DOCUMENT"
														value="${__formdata.documento}"
														class="campowidthinput campo campotexto"
														onchange="f_cargar_DATOSPERSONA()"  
														style="width: 90%;"
														<axis:atr f="axisper047" c="PER_DOCUMENT" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_DOCUMENT" lit="9908819" />"
														title="<axis:alt f="axisper047" c="PER_DOCUMENT" lit="9908819" />" /></td>
												</axis:ocultar>
											</tr>
											<tr>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="PER_FEXPEDICION">
													<td><span class="bold"><axis:alt
																f="axisper047" c="PER_FEXPEDICION" lit="9909608"></axis:alt></span><br />
														<input type="text" name="PER_FEXPEDICION"
														id="PER_FEXPEDICION"
														value='<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.f_expedicion}"/>'
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="PER_FEXPEDICION" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_FEXPEDICION" lit="9909608" />"
														title="<axis:alt f="axisper047" c="PER_FEXPEDICION" lit="9909608" />" />
														<a style="vertical-align: middle;">
													</a></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="PER_PAISEXPEDICION">
													<td><span class="bold"><axis:alt
																f="axisper047" c="PER_PAISEXPEDICION" lit="9903741"></axis:alt></span><br />
														<input type="text" name="PER_PAISEXPEDICION"
														id="PER_PAISEXPEDICION" readonly="readonly"
														style="width: 40px;"
														value="${__formdata.pais_expedicion}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="PER_PAISEXPEDICION" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_PAISEXPEDICION" lit="9903741" />"
														title="<axis:alt f="axisper047" c="PER_PAISEXPEDICION" lit="9903741" />" />
														
<!-- 														<img id="findPais" border="0" src="images/find.gif"   -->
<!-- 														onclick="f_pais('PER_PAISEXPEDICION','PER_DEPEXPEDICION','PER_LUGEXPEDICION','PER_TPAISEXPEDICION')" -->
<!-- 														style="cursor: pointer" />  -->
														
														<input type="text"
														name="PER_TPAISEXPEDICION" id="PER_TPAISEXPEDICION"
														value="${__formdata.tpais_expedicion}"
														class="campowidthinput campo campotexto"
														style="width: 70px;"
														<axis:atr f="axisper047" c="PER_TPAISEXPEDICION" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_TPAISEXPEDICION" lit="9903741" />"
														title="<axis:alt f="axisper047" c="PER_TPAISEXPEDICION" lit="9903741" />" /></td>
												</axis:ocultar>

												<axis:ocultar dejarHueco="false" f="axisper047"
													c="PER_DEPEXPEDICION">
													<td><span class="bold"><axis:alt
																f="axisper047" c="PER_DEPEXPEDICION" lit="9903953"></axis:alt></span><br />
														<input type="text" name="PER_DEPEXPEDICION"
														style="width: 40px;" id="PER_DEPEXPEDICION"
														value="${__formdata.dep_expedicion}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="PER_DEPEXPEDICION" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_DEPEXPEDICION" lit="9903953" />"
														title="<axis:alt f="axisper047" c="PER_DEPEXPEDICION" lit="9903953" />" />
<!-- 														<img id="findPais" border="0" src="images/find.gif"   -->
<!-- 														onclick="f_dep('PER_PAISEXPEDICION','PER_DEPEXPEDICION','PER_LUGEXPEDICION','PER_TDEPEXPEDICION')" -->
<!-- 														style="cursor: pointer" />  -->
														<input type="text"
														name="PER_TDEPEXPEDICION" id="PER_TDEPEXPEDICION"
														value="${__formdata.tdep_expedicion}"
														class="campowidthinput campo campotexto"
														readonly="readonly" style="width: 70px;"
														<axis:atr f="axisper047" c="PER_TDEPEXPEDICION" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_TDEPEXPEDICION" lit="9903953" />"
														title="<axis:alt f="axisper047" c="PER_TDEPEXPEDICION" lit="9903953" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="PER_LUGEXPEDICION">
													<td><span class="bold"><axis:alt
																f="axisper047" c="PER_LUGEXPEDICION" lit="9909609"></axis:alt></span><br />
														<input type="text" name="PER_LUGEXPEDICION"
														id="PER_LUGEXPEDICION" readonly="readonly"
														style="width: 40px;"
														value="${__formdata.lug_expedicion}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="PER_LUGEXPEDICION" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_LUGEXPEDICION" lit="9909609" />"
														title="<axis:alt f="axisper047" c="PER_LUGEXPEDICION" lit="9909609" />" />
<!-- 													    <img id="findPais" border="0" src="images/find.gif"   -->
<!-- 														onclick="f_ciudad('PER_PAISEXPEDICION','PER_DEPEXPEDICION','PER_LUGEXPEDICION','PER_TLUGEXPEDICION')" -->
<!-- 														style="cursor: pointer" />  -->
														<input type="text"
														name="PER_TLUGEXPEDICION" id="PER_TLUGEXPEDICION"
														value="${__formdata.tlug_expedicion}"
														class="campowidthinput campo campotexto"
														style="width: 70px;"
														<axis:atr f="axisper047" c="PER_TLUGEXPEDICION" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_TLUGEXPEDICION" lit="9909609" />"
														title="<axis:alt f="axisper047" c="PER_TLUGEXPEDICION" lit="9909609" />" /></td>
												</axis:ocultar>
											</tr>

											<tr>
											
											<axis:ocultar dejarHueco="false" f="axisper047"
													c="PER_FNACIMI">
													<td><span class="bold"><axis:alt f="axisper047"
																c="PER_FNACIMI" lit="1000064"></axis:alt></span><br /> <input
														type="text" name="PER_FNACIMI" id="PER_FNACIMI"
														value='<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.f_nacimiento}"/>'
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="PER_FNACIMI" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_FNACIMI" lit="1000064" />"
														title="<axis:alt f="axisper047" c="PER_FNACIMI" lit="1000064" />" />
														<a style="vertical-align: middle;"> 
													</a></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="100816"
													c="PER_PAISLUGNACIMI">
													<td><span class="bold"><axis:alt f="axisper047"
																c="PER_PAISLUGNACIMI" lit="100816"></axis:alt> <axis:alt
																f="axisper047" c="FNACIMILUGAR" lit="9909610"></axis:alt></span><br />
														<input type="text" name="PER_PAISLUGNACIMI"
														id="PER_PAISLUGNACIMI" readonly="readonly"
														style="width: 40px;"
														value="${__formdata.DET_SARLAFT.PER_PAISLUGNACIMI}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="PER_PAISLUGNACIMI" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_PAISLUGNACIMI" lit="100816" />"
														title="<axis:alt f="axisper047"
																c="PER_PAISLUGNACIMI" lit="100816"></axis:alt> <axis:alt
																f="axisper047" c="FNACIMILUGAR" lit="9909610"></axis:alt>" />
														<axis:visible c="DSP_FIND" f="axisper047">
														<img id="findPais" border="0" src="images/find.gif"
														onclick="f_pais('PER_PAISLUGNACIMI','PER_DEPLUGNACIMI','PER_LUGNACIMI','PER_TPAISLUGNACIMI')"
														style="cursor: pointer" /> </axis:visible>
														<input type="text"
														name="PER_TPAISLUGNACIMI" id="PER_TPAISLUGNACIMI"
														value="${__formdata.DET_SARLAFT.PER_TPAISLUGNACIMI}"
														class="campowidthinput campo campotexto"
														style="width: 70px;"
														<axis:atr f="axisper047" c="PER_TPAISLUGNACIMI" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_TPAISLUGNACIMI" lit="100816" />"
														title="<axis:alt f="axisper047" c="PER_TPAISLUGNACIMI" lit="100816" />" /></td>
												</axis:ocultar>

												<axis:ocultar dejarHueco="false" f="axisper047"
													c="PER_DEPLUGNACIMI">
													<td><span class="bold"><axis:alt f="axisper047"
																c="PER_DEPLUGNACIMI" lit="9902610"></axis:alt> <axis:alt
																f="axisper047" c="FNACIMILUGAR" lit="9909610"></axis:alt></span><br />
														<input type="text" name="PER_DEPLUGNACIMI"
														style="width: 40px;" id="PER_DEPLUGNACIMI"
														value="${__formdata.DET_SARLAFT.PER_DEPLUGNACIMI}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="PER_DEPLUGNACIMI" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_DEPLUGNACIMI" lit="9902610" />"
														title="<axis:alt f="axisper047"
																c="PER_DEPLUGNACIMI" lit="9902610"></axis:alt> <axis:alt
																f="axisper047" c="FNACIMILUGAR" lit="9909610"></axis:alt>" />
														<axis:visible c="DSP_FIND" f="axisper047">
														<img id="findPais" border="0" src="images/find.gif"
														onclick="f_dep('PER_PAISLUGNACIMI','PER_DEPLUGNACIMI','PER_LUGNACIMI','PER_TDEPLUGNACIMI')"
														style="cursor: pointer" /></axis:visible>
														<input type="text"
														name="PER_TDEPLUGNACIMI" id="PER_TDEPLUGNACIMI"
														value="${__formdata.DET_SARLAFT.PER_TDEPLUGNACIMI}"
														class="campowidthinput campo campotexto"
														readonly="readonly" style="width: 70px;"
														<axis:atr f="axisper047" c="PER_TDEPLUGNACIMI" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_TDEPLUGNACIMI" lit="9902610" />"
														title="<axis:alt f="axisper047" c="PER_TDEPLUGNACIMI" lit="9902610" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="PER_LUGNACIMI">
													<td><span class="bold"><axis:alt f="axisper047"
																c="PER_LUGNACIMI" lit="9909610"></axis:alt></span><br /> <input
														type="text" name="PER_LUGNACIMI" id="PER_LUGNACIMI"
														readonly="readonly" style="width: 40px;"
														value="${__formdata.DET_SARLAFT.PER_LUGNACIMI}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="PER_LUGNACIMI" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_LUGNACIMI" lit="9909610" />"
														title="<axis:alt f="axisper047" c="PER_LUGNACIMI" lit="9909610" />" />
														<axis:visible c="DSP_FIND" f="axisper047">
														<img id="findPais" border="0" src="images/find.gif"
														onclick="f_ciudad('PER_PAISLUGNACIMI','PER_DEPLUGNACIMI','PER_LUGNACIMI','PER_TLUGNACIMI')"
														style="cursor: pointer" /></axis:visible>
														<input type="text"
														name="PER_TLUGNACIMI" id="PER_TLUGNACIMI"
														value="${__formdata.DET_SARLAFT.PER_TLUGNACIMI}"
														class="campowidthinput campo campotexto"
														style="width: 70px;"
														<axis:atr f="axisper047" c="PER_TLUGNACIMI" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_TLUGNACIMI" lit="9909610" />"
														title="<axis:alt f="axisper047" c="PER_TLUGNACIMI" lit="9909610" />" /></td>
												</axis:ocultar>
											</tr>
											<tr>
												<axis:ocultar dejarHueco="false" f="9909610" c="PER_NACION1">
													<td><span class="bold"><axis:alt f="9909610"
																c="PER_NACION1" lit="9909611"></axis:alt></span><br /> <input
														type="text" name="PER_NACION1" id="PER_NACION1"
														readonly="readonly" style="width: 40px;"
														value="${__formdata.pais_nacionalidad1}"
														class="campowidthinput campo campotexto"
														<axis:atr f="9909610" c="PER_NACION1" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="9909610" c="PER_NACION1" lit="9909611" />"
														title="<axis:alt f="9909610" c="PER_NACION1" lit="9909611" />" />
														<!-- <img id="findPais" border="0" src="images/find.gif"
														onclick="f_pais('PER_NACION1','TDEPB','CCIUDAD','PER_TNACION1')"
														style="cursor: pointer" />  -->
														<input type="text"
														name="PER_TNACION1" id="PER_TNACION1"
														value="${__formdata.tpais_nacionalidad1}"
														class="campowidthinput campo campotexto"
														readonly="readonly" style="width: 70px;"
														<axis:atr f="axisper047" c="PER_TNACION1" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_TNACION1" lit="9909611" />"
														title="<axis:alt f="axisper047" c="PER_TNACION1" lit="9909611" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="9909610" c="PER_NACION2">
													<td><span class="bold"><axis:alt f="9909610"
																c="PER_NACION2" lit="9909636"></axis:alt></span><br /> <input
														type="text" name="PER_NACION2" id="PER_NACION2"
														readonly="readonly" style="width: 40px;"
														value="${__formdata.DET_SARLAFT.PER_NACION2}"
														class="campowidthinput campo campotexto"
														<axis:atr f="9909610" c="PER_NACION2" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="9909610" c="PER_NACION2" lit="9909636" />"
														title="<axis:alt f="9909610" c="PER_NACION2" lit="9909636" />" />
														<axis:visible c="DSP_FIND" f="axisper047">
														<img id="findPais" border="0" src="images/find.gif"
														onclick="f_pais('PER_NACION2','TDEPB','CCIUDAD','PER_TNACION2')"
														style="cursor: pointer" /></axis:visible>
														<input type="text"
														name="PER_TNACION2" id="PER_TNACION2"
														value="${__formdata.DET_SARLAFT.PER_TNACION2}"
														class="campowidthinput campo campotexto"
														readonly="readonly" style="width: 70px;"
														<axis:atr f="axisper047" c="PER_TNACION2" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_TNACION2" lit="9909636" />"
														title="<axis:alt f="axisper047" c="PER_TNACION2" lit="9909636" />" /></td>
												</axis:ocultar>
											</tr>
											<tr>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="PER_DIRERECI">
													<td><span class="bold"><axis:alt f="axisper047"
																c="PER_DIRERECI" lit="9909638"></axis:alt></span><br /> <input
														type="text" name="PER_DIRERECI" id="PER_DIRERECI"
														value="${__formdata.direccion}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="PER_DIRERECI" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_DIRERECI" lit="9909638" />"
														title="<axis:alt f="axisper047" c="PER_DIRERECI" lit="9909638" />" /></td>
												</axis:ocultar>

												<axis:ocultar dejarHueco="false" f="axisper047" c="PER_PAIS">
													<td><span class="bold"><axis:alt f="axisper047"
																c="PER_PAIS" lit="9000789"></axis:alt></span><br /> <input
														type="text" name="PER_PAIS" id="PER_PAIS"
														readonly="readonly" style="width: 40px;"
														value="${__formdata.pais_residencia}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="PER_PAIS" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_PAIS" lit="9000789" />"
														title="<axis:alt f="axisper047" c="PER_PAIS" lit="9000789" />" />
														<!-- <img id="findPais" border="0" src="images/find.gif"
														onclick="f_pais('PER_PAIS','PER_DEPARTAMENT','PER_CIUDAD','PER_TPAIS')"
														style="cursor: pointer" /> -->
														<input type="text"
														name="PER_TPAIS" id="PER_TPAIS"
														value="${__formdata.tpais_residencia}"
														class="campowidthinput campo campotexto"
														style="width: 70px;"
														<axis:atr f="axisper047" c="PER_TPAIS" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_TPAIS" lit="9000789" />"
														title="<axis:alt f="axisper047" c="PER_TPAIS" lit="9000789" />" /></td>
												</axis:ocultar>

												<axis:ocultar dejarHueco="false" f="axisper047"
													c="PER_DEPARTAMENT">
													<td><span class="bold"><axis:alt f="axisper047"
																c="PER_DEPARTAMENT" lit="9902610"></axis:alt></span><br /> <input
														type="text" name="PER_DEPARTAMENT" style="width: 40px;"
														id="PER_DEPARTAMENT"
														value="${__formdata.dep_residencia}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="PER_DEPARTAMENT" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_DEPARTAMENT" lit="9902610" />"
														title="<axis:alt f="axisper047" c="PER_DEPARTAMENT" lit="9902610" />" />
														<!-- <img id="findPais" border="0" src="images/find.gif"
														onclick="f_dep('PER_PAIS','PER_DEPARTAMENT','PER_CIUDAD','PER_TDEPARTAMENT')"
														style="cursor: pointer" />  -->
														<input type="text"
														name="PER_TDEPARTAMENT" id="PER_TDEPARTAMENT"
														value="${__formdata.tdep_residencia}"
														class="campowidthinput campo campotexto"
														readonly="readonly" style="width: 70px;"
														<axis:atr f="axisper047" c="PER_TDEPARTAMENT" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_TDEPARTAMENT" lit="9902610" />"
														title="<axis:alt f="axisper047" c="PER_TDEPARTAMENT" lit="9902610" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="9902610" c="PER_CIUDAD">
													<td><span class="bold"><axis:alt f="9902610"
																c="PER_CIUDAD" lit="9908410"></axis:alt></span><br /> <input
														type="text" name="PER_CIUDAD" id="PER_CIUDAD"
														readonly="readonly" style="width: 40px;"
														value="${__formdata.lug_residencia}"
														class="campowidthinput campo campotexto"
														<axis:atr f="9902610" c="PER_CIUDAD" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="9902610" c="PER_CIUDAD" lit="9908410" />"
														title="<axis:alt f="9902610" c="PER_CIUDAD" lit="9908410" />" />
														<!-- <img id="findPais" border="0" src="images/find.gif"
														onclick="f_ciudad('PER_PAIS','PER_DEPARTAMENT','PER_CIUDAD','PER_TCIUDAD')"
														style="cursor: pointer" />  -->
														<input type="text"
														name="PER_TCIUDAD" id="PER_TCIUDAD"
														value="${__formdata.tlug_residencia}"
														class="campowidthinput campo campotexto"
														style="width: 70px;"
														<axis:atr f="axisper047" c="PER_TCIUDAD" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_TCIUDAD" lit="9908410" />"
														title="<axis:alt f="axisper047" c="PER_TCIUDAD" lit="9908410" />" /></td>
												</axis:ocultar>

											</tr>

											<tr>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="PER_EMAIL">
													<td><span class="bold"><axis:alt f="axisper047"
																c="PER_EMAIL" lit="9903325"></axis:alt></span><br /> <input
														type="text" name="PER_EMAIL" id="PER_EMAIL"
														value="${__formdata.email}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="PER_EMAIL" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_EMAIL" lit="9903325" />"
														title="<axis:alt f="axisper047" c="PER_EMAIL" lit="9903325" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="PER_TELEFONO">
													<td><span class="bold"><axis:alt f="axisper047"
																c="PER_TELEFONO" lit="9909763"></axis:alt></span><br /> <input
														type="text" name="PER_TELEFONO" id="PER_TELEFONO"
														value="${__formdata.telefono}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="PER_TELEFONO" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_TELEFONO" lit="9909763" />"
														title="<axis:alt f="axisper047" c="PER_TELEFONO" lit="9909763" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="PER_CELULAR">
													<td><span class="bold"><axis:alt f="axisper047"
																c="PER_CELULAR" lit="9909640"></axis:alt></span><br /> <input
														type="text" name="PER_CELULAR" id="PER_CELULAR"
														value="${__formdata.celular}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="PER_CELULAR" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_CELULAR" lit="9909640" />"
														title="<axis:alt f="axisper047" c="PER_CELULAR" lit="9909640" />" /></td>
												</axis:ocultar>
												<!-- FIN CP0416M_SYS_PERS  18/12/2018 ACL -->
											</tr>
											
											<tr>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="CACTIPPAL">
													<td><span class="bold"><axis:alt f="axisper047"
																c="CACTIPPAL" lit="9903476"></axis:alt></span><br /> <select
														title="<axis:alt f='axisper047' c='CACTIPPAL' lit='9903476' />"
														alt="<axis:alt f='axisper047' c='CACTIPPAL' lit='9903476' />"
														name="CACTIPPAL" id="CACTIPPAL" size="1"
														onchange="cargar_pantalla_por_clase();"
														class="campowidthselect campo campotexto_ob"
														<axis:atr f="axisper047" c="CACTIPPAL" a="isInputText=false&modificable=true&obligatorio=true"/>>
															<option selected value>-
																<axis:alt f="axisper047" c="BLANCO" lit="1000348" /> -
															</option>
															<c:forEach var="clase"
																items="${sessionScope.lstActividadPrincipal}">
																<option value="${clase.CATRIBU}"
																	<c:if test="${clase.CATRIBU == __formdata.DET_SARLAFT.CACTIPPAL}">selected</c:if>>${clase.TATRIBU}</option>
															</c:forEach>
													</select></td>
												</axis:ocultar>
												
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="PER_TIPOACTIVPPAL">
													<td><span class="bold"><axis:alt f="axisper047"
																c="PER_TIPOACTIVPPAL" lit="89906201"></axis:alt></span><br /> <input
														type="text" name="PER_TIPOACTIVPPAL" id="PER_TIPOACTIVPPAL"
														value="${__formdata.DET_SARLAFT.PERTIPOACTIVPPAL}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="PER_TIPOACTIVPPAL" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_TIPOACTIVPPAL" lit="89906201" />"
														title="<axis:alt f="axisper047" c="PER_TIPOACTIVPPAL" lit="89906201" />" /></td>
												</axis:ocultar>										
											<%--	Ini TCS_1560 - ACL - 11/02/2019   --%>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="NCIIUPPAL">
													<td><span class="bold"><axis:alt f="axisper047"
																c="NCIIUPPAL" lit="9909602"></axis:alt></span><br /> <input
														type="text" class="campowidthinput campo campotexto"
														size="15" value="${__formdata.codciiu}"
														name="NCIIUPPAL" id="NCIIUPPAL"
														<%--onchange="f_onchange_NCIIUPPAL()" style="width: 18%;" --%>
														title="<axis:alt f="axisper047" c="NCIIUPPAL" lit="9909091"/>"
														<axis:atr f="axisper047" c="NCIIUPPAL" a="modificable=false&obligatorio=false"/> />
														&nbsp;
														 <%--<img id="findCCIIUppal" border="0"
														src="images/find.gif"
														onclick="f_abrir_axisciiu001('NCIIUPPAL','TCCIIUPPAL',null,null)"
														style="cursor: pointer" /> --%>
														<input type="text"
														name="TCCIIUPPAL" id="TCCIIUPPAL"
														value="${__formdata.descriciiu}"
														class="campowidthinput campo campotexto"
														style="width: 200px;"
														<axis:atr f="axisper047" c="TCCIIUPPAL" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TCCIIUPPAL" lit="9908410" />"
														title="<axis:alt f="axisper047" c="TCCIIUPPAL" lit="9908410" />" />
													</td>
												</axis:ocultar>	
											<%--	Fin TCS_1560 - ACL - 11/02/2019   --%>	
											</tr>
											<tr>																								
												<axis:ocultar dejarHueco="false" f="axisper047" c="PER_SECTORPPAL">
													<td><span class="bold"><axis:alt f="axisper047"
																c="PER_SECTORPPAL" lit="89906202"></axis:alt></span><br /> <select
														title="<axis:alt f='axisper047' c='PER_SECTORPPAL' lit='89906202' />"
														alt="<axis:alt f='axisper047' c='PER_SECTORPPAL' lit='89906202' />"
														name="PER_SECTORPPAL" id="PER_SECTORPPAL" size="1"
														onchange="cargar_pantalla_por_clase();"
														class="campowidthselect campo campotexto_ob"
														<axis:atr f="axisper047" c="PER_SECTORPPAL" a="isInputText=false&modificable=true&obligatorio=true"/>>
															<option selected value>-
																<axis:alt f="axisper047" c="BLANCO" lit="1000348" /> -
															</option>
															<c:forEach var="clase" items="${sessionScope.lstSector}">
																<option value="${clase.CATRIBU}"
																	<c:if test="${clase.CATRIBU == __formdata.DET_SARLAFT.PERSECTORPPAL}">selected</c:if>>${clase.TATRIBU}</option>
															</c:forEach>
													</select></td>
												</axis:ocultar>	
												<%--	Ini TCS_1560 - ACL - 11/02/2019   --%>	
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="TOCUPACION">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TOCUPACION" lit="9904804"></axis:alt></span><br /> <input
														type="text" name="TOCUPACION" id="TOCUPACION"
														value="${__formdata.ocupacion}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="TOCUPACION" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TOCUPACION" lit="9904804" />"
														title="<axis:alt f="axisper047" c="TOCUPACION" lit="9904804" />" /></td>
												</axis:ocultar>
												<%--	Fin TCS_1560 - ACL - 11/02/2019   --%>
												<axis:ocultar dejarHueco="false" f="axisper047" c="TCARGO">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TCARGO" lit="9902638"></axis:alt></span><br /> <input
														type="text" name="TCARGO" id="TCARGO"
														value="${__formdata.DET_SARLAFT.TCARGO}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="TCARGO" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TCARGO" lit="9902638" />"
														title="<axis:alt f="axisper047" c="TCARGO" lit="9902638" />" /></td>
												</axis:ocultar>
											</tr>
											<tr>
												<axis:ocultar dejarHueco="false" f="axisper047" c="TEMPRESA">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TEMPRESA" lit="9909641"></axis:alt></span><br /> <input
														type="text" name="TEMPRESA" id="TEMPRESA"
														value="${__formdata.DET_SARLAFT.TEMPRESA}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="TEMPRESA" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TEMPRESA" lit="9909641" />"
														title="<axis:alt f="axisper047" c="TEMPRESA" lit="9909641" />" /></td>
												</axis:ocultar>
												
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="TTELEMPRESA">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TTELEMPRESA" lit="9909643"></axis:alt></span><br /> <input
														type="text" name="TTELEMPRESA" id="TTELEMPRESA"
														value="${__formdata.DET_SARLAFT.TTELEMPRESA}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="TTELEMPRESA" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TTELEMPRESA" lit="9909643" />"
														title="<axis:alt f="axisper047" c="TTELEMPRESA" lit="9909643" />" /></td>
												</axis:ocultar>
												
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="TDIREMPRESA">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TDIREMPRESA" lit="9909642"></axis:alt></span><br /> <input
														type="text" name="TDIREMPRESA" id="TDIREMPRESA"
														value="${__formdata.DET_SARLAFT.TDIREMPRESA}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="TDIREMPRESA" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TDIREMPRESA" lit="9909642" />"
														title="<axis:alt f="axisper047" c="TDIREMPRESA" lit="9909642" />" /></td>
												</axis:ocultar>
											</tr>
											<tr>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="PER_CDEPTOOFIC">
													<td><span class="bold"><axis:alt f="axisper047"
																c="PER_CDEPTOOFIC" lit="89906199"></axis:alt></span><br /> <input
														type="text" name="PER_CDEPTOOFIC" style="width: 40px;"
														id="PER_CDEPTOOFIC" readonly="readonly"
														value="${__formdata.DET_SARLAFT.PERCDEPTOOFIC}"
														class="campowidthinput campo campotexto"
														<axis:atr f="axisper047" c="PER_CDEPTOOFIC" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_CDEPTOOFIC" lit="89906199" />"
														title="<axis:alt f="axisper047" c="PER_CDEPTOOFIC" lit="89906199" />" />
														<axis:visible c="DSP_FIND" f="axisper047">
														<img id="findPais" border="0" src="images/find.gif"
														onclick="f_dep('TPAIS','PER_CDEPTOOFIC','PER_CCIUOFIC','PER_TDEPTOOFIC')"
														style="cursor: pointer" /></axis:visible><input type="text"
														name="PER_TDEPTOOFIC" id="PER_TDEPTOOFIC"
														value="${__formdata.DET_SARLAFT.PERTDEPTOOFIC}"
														class="campowidthinput campo campotexto"
														style="width: 70px;" readonly="readonly"
														<axis:atr f="axisper047" c="PER_TDEPTOOFIC" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_TDEPTOOFIC" lit="89906199" />"
														title="<axis:alt f="axisper047" c="PER_TDEPTOOFIC" lit="89906199" />" /></td>
												</axis:ocultar>								
												<axis:ocultar dejarHueco="false" f="89906200" c="PER_CCIUOFIC">
													<td><span class="bold"><axis:alt f="89906200"
																c="PER_CCIUOFIC" lit="89906200"></axis:alt></span><br /> <input
														type="text" name="PER_CCIUOFIC" id="PER_CCIUOFIC"
														readonly="readonly" style="width: 40px;"
														value="${__formdata.DET_SARLAFT.PERCCIUOFIC}"
														class="campowidthinput campo campotexto"
														<axis:atr f="89906200" c="PER_CCIUOFIC" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="89906200" c="PER_CCIUOFIC" lit="89906200" />"
														title="<axis:alt f="89906200" c="PER_CCIUOFIC" lit="89906200" />" />
														<axis:visible c="DSP_FIND" f="axisper047">
														<img id="findCiudadSol" border="0" src="images/find.gif"
														onclick="f_ciudad('PER_PAIS','PER_CDEPTOOFIC','PER_CCIUOFIC','PER_TCIUOFIC')"
														style="cursor: pointer" /></axis:visible>
														<input type="text"
														name="PER_TCIUOFIC" id="PER_TCIUOFIC"
														value="${__formdata.DET_SARLAFT.PERTCIUOFIC}"
														class="campowidthinput campo campotexto" style="width: 70px;"
														<axis:atr f="axisper047" c="PER_TCIUOFIC" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="PER_TCIUOFIC" lit="89906200" />"
														title="<axis:alt f="axisper047" c="PER_TCIUOFIC" lit="89906200" />" /></td>
												</axis:ocultar>
											</tr>
											<tr>
												<axis:ocultar dejarHueco="false" f="axisper047" c="CACTISEC">
													<td><span class="bold"><axis:alt f="axisper047"
																c="CACTISEC" lit="9909644"></axis:alt></span><br /> <select
														title="<axis:alt f='axisper047' c='CACTISEC' lit='9909644' />"
														alt="<axis:alt f='axisper047' c='CACTISEC' lit='9909644' />"
														name="CACTISEC" id="CACTISEC" size="1"
														onchange="cargar_pantalla_por_clase();"
														class="campowidthselect campo campotexto_ob"
														<axis:atr f="axisper047" c="CACTISEC" a="isInputText=false&modificable=true"/>>
															<option selected value>-
																<axis:alt f="axisper047" c="BLANCO" lit="1000348" /> -
															</option>
															<c:forEach var="clase"
																items="${sessionScope.lstActividadSecundaria}">
																<option value="${clase.CATRIBU}"
																	<c:if test="${clase.CATRIBU == __formdata.DET_SARLAFT.CACTISEC}">selected</c:if>>${clase.TATRIBU}</option>
															</c:forEach>
													</select></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047" c="NCIIUSEC">
													<td><span class="bold"><axis:alt f="axisper047"
																c="NCIIUSEC" lit="9909602"></axis:alt></span><br /> <input
														type="text" class="campowidthinput campo campotexto"
														size="15" value="${__formdata.DET_SARLAFT.NCIIUSEC}"
														name="NCIIUSEC" id="NCIIUSEC"
														onchange="f_onchange_NCIIUSEC()" style="width: 18%;"
														title="<axis:alt f="axisper047" c="NCIIUSEC" lit="9909091"/>"
														<axis:atr f="axisper047" c="NCIIUSEC" a="obligatorio=false"/> />
														&nbsp;<axis:visible c="DSP_FIND" f="axisper047"><img id="findCCIIUsec" border="0"
														src="images/find.gif"
														onclick="f_abrir_axisciiu001('NCIIUSEC', 'TCCIIUSEC', null, null)"
														style="cursor: pointer" /></axis:visible><input type="text"
														name="TCCIIUSEC" id="TCCIIUSEC"
														value="${__formdata.DET_SARLAFT.TCCIIUSEC}"
														class="campowidthinput campo campotexto"
														style="width: 200px;"
														<axis:atr f="axisper047" c="TCCIIUSEC" a="modificable=false&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TCCIIUSEC" lit="9908410" />"
														title="<axis:alt f="axisper047" c="TCCIIUSEC" lit="9908410" />" />
													</td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047" c="TDIRSEC">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TDIRSEC" lit="105889"></axis:alt></span><br /> <input
														type="text" name="TDIRSEC" id="TDIRSEC"
														value="${__formdata.DET_SARLAFT.TDIRSEC}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="TDIRSEC" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TDIRSEC" lit="105889" />"
														title="<axis:alt f="axisper047" c="TDIRSEC" lit="105889" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047" c="TTELSEC">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TTELSEC" lit="9000992"></axis:alt></span><br /> <input
														type="text" name="TTELSEC" id="TTELSEC"
														value="${__formdata.DET_SARLAFT.TTELSEC}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="TTELSEC" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TTELSEC" lit="9000992" />"
														title="<axis:alt f="axisper047" c="TTELSEC" lit="9000992" />" /></td>
												</axis:ocultar>
											</tr>
											<tr>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="TPRODSERVCOM">
													<td><span class="bold"><axis:alt f="axisper047"
																c="TPRODSERVCOM" lit="9909645"></axis:alt></span><br /> <input
														type="text" name="TPRODSERVCOM" id="TPRODSERVCOM"
														value="${__formdata.DET_SARLAFT.TPRODSERVCOM}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="TPRODSERVCOM" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TPRODSERVCOM" lit="9909645" />"
														title="<axis:alt f="axisper047" c="TPRODSERVCOM" lit="9909645" />" /></td>
												</axis:ocultar>
											</tr>
								<!-- CP0640M_SYS_PERS_Val  - ACL - 20/12/2018 -- Se modifica el literal  -->
											<tr>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="IINGRESOS">
													<td><span class="bold"><axis:alt f="axisper047"
																c="IINGRESOS" lit="89906207"></axis:alt></span><br /> <input
														type="text" name="IINGRESOS" id="IINGRESOS"
														onkeypress="return isNumberKey(event)"
														value="${__formdata.DET_SARLAFT.IINGRESOS}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="IINGRESOS" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="IINGRESOS" lit="89906207" />"
														title="<axis:alt f="axisper047" c="IINGRESOS" lit="89906207" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047" c="IACTIVOS">
													<td><span class="bold"><axis:alt f="axisper047"
																c="IACTIVOS" lit="108957"></axis:alt></span><br /> <input
														type="text" name="IACTIVOS" id="IACTIVOS"
														onkeypress="return isNumberKey(event)"
														value="${__formdata.DET_SARLAFT.IACTIVOS}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="IACTIVOS" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="IACTIVOS" lit="108957" />"
														title="<axis:alt f="axisper047" c="IACTIVOS" lit="108957" />" /></td>
												</axis:ocultar>
								<!-- CP0640M_SYS_PERS_Val  - ACL - 20/12/2018 -- Se modifica el literal  -->
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="IPATRIMONIO">
													<td><span class="bold"><axis:alt f="axisper047"
																c="IPATRIMONIO" lit="89906208"></axis:alt></span><br /> <input
														type="text" name="IPATRIMONIO" id="IPATRIMONIO"
														onkeypress="return isNumberKey(event)"
														value="${__formdata.DET_SARLAFT.IPATRIMONIO}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="IPATRIMONIO" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="IPATRIMONIO" lit="89906208" />"
														title="<axis:alt f="axisper047" c="IPATRIMONIO" lit="89906208" />" /></td>
												</axis:ocultar>
											</tr>
											<tr>
												<axis:ocultar dejarHueco="false" f="axisper047" c="IEGRESOS">
													<td><span class="bold"><axis:alt f="axisper047"
																c="IEGRESOS" lit="9909625"></axis:alt></span><br /> <input
														type="text" name="IEGRESOS" id="IEGRESOS"
														onkeypress="return isNumberKey(event)"
														value="${__formdata.DET_SARLAFT.IEGRESOS}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="IEGRESOS" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="IEGRESOS" lit="9909625" />"
														title="<axis:alt f="axisper047" c="IEGRESOS" lit="9909625" />" /></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047" c="IPASIVOS">
													<td><span class="bold"><axis:alt f="axisper047"
																c="IPASIVOS" lit="9909626"></axis:alt></span><br /> <input
														type="text" name="IPASIVOS" id="IPASIVOS"
														onkeypress="return isNumberKey(event)"
														value="${__formdata.DET_SARLAFT.IPASIVOS}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="IPASIVOS" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="IPASIVOS" lit="9909626" />"
														title="<axis:alt f="axisper047" c="IPASIVOS" lit="9909626" />" /></td>
												</axis:ocultar>
								<!-- CP0640M_SYS_PERS_Val  - ACL - 20/12/2018 -- Se modifica el literal  -->
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="IOTROINGRESO">
													<td><span class="bold"><axis:alt f="axisper047"
																c="IOTROINGRESO" lit="89906209"></axis:alt></span><br /> <input
														type="text" name="IOTROINGRESO" id="IOTROINGRESO"
														onkeypress="return isNumberKey(event)"
														value="${__formdata.DET_SARLAFT.IOTROINGRESO}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="IOTROINGRESO" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="IOTROINGRESO" lit="89906209" />"
														title="<axis:alt f="axisper047" c="IOTROINGRESO" lit="89906209" />" /></td>
												</axis:ocultar>
											</tr>
											<tr>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="TCONCOTRING">
													<td colspan="2"><span class="bold"><axis:alt f="axisper047"
																c="TCONCOTRING" lit="9909647"></axis:alt></span><br /> <input
														type="text" name="TCONCOTRING" id="TCONCOTRING"
														value="${__formdata.DET_SARLAFT.TCONCOTRING}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="TCONCOTRING" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TCONCOTRING" lit="9909647" />"
														title="<axis:alt f="axisper047" c="TCONCOTRING" lit="9909647" />" /></td>
												</axis:ocultar>
											</tr>
											<tr>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="CMANRECPUB">
													<td><span class="bold"><axis:alt f="axisper047"
																c="CMANRECPUB" lit="9909621"></axis:alt></span><br /> <select
														title="<axis:alt f='axisper047' c='CMANRECPUB' lit='9909621' />"
														alt="<axis:alt f='axisper047' c='CMANRECPUB' lit='9909621' />"
														name="CMANRECPUB" id="CMANRECPUB" size="1"
														onchange="cargar_pantalla_por_clase();"
														class="campowidthselect campo campotexto_ob"
														<axis:atr f="axisper047" c="CMANRECPUB" a="isInputText=false&modificable=true&obligatorio=true"/>>
															<option selected value>-
																<axis:alt f="axisper047" c="BLANCO" lit="1000348" /> -
															</option>
															<c:forEach var="clase" items="${sessionScope.LS_VALORES}">
																<option value="${clase.CATRIBU}"
																	<c:if test="${clase.CATRIBU == __formdata.DET_SARLAFT.CMANRECPUB}">selected</c:if>>${clase.TATRIBU}</option>
															</c:forEach>
													</select></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047" c="CPODPUB">
													<td><span class="bold"><axis:alt f="axisper047"
																c="CPODPUB" lit="89906139"></axis:alt></span><br /> <select
														title="<axis:alt f='axisper047' c='CPODPUB' lit='89906139' />"
														alt="<axis:alt f='axisper047' c='CPODPUB' lit='89906139' />"
														name="CPODPUB" id="CPODPUB" size="1"
														<%--  TCS_1560 - ACL - 11/02/2019   
														onchange="cargar_pantalla_por_clase();"  --%>
														onchange="f_onchange_CPODPUB(this.value)"
														class="campowidthselect campo campotexto_ob"
														<axis:atr f="axisper047" c="CPODPUB" a="isInputText=false&modificable=true&obligatorio=true"/>>
															<option selected value>-
																<axis:alt f="axisper047" c="BLANCO" lit="1000348" /> -
															</option>
															<c:forEach var="clase" items="${sessionScope.LS_VALORES}">
																<option value="${clase.CATRIBU}"
																	<c:if test="${clase.CATRIBU == __formdata.DET_SARLAFT.CPODPUB}">selected</c:if>>${clase.TATRIBU}</option>
															</c:forEach>
													</select></td>
												</axis:ocultar>
											</tr>
											
											<tr>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="CVINPERPUB">
													<td rowspan="3" colspan="2"><span class="bold"><axis:alt f="axisper047"
																c="CVINPERPUB" lit="9909616"></axis:alt></span><br /> <select
														title="<axis:alt f='axisper047' c='CVINPERPUB' lit='9909616' />"
														alt="<axis:alt f='axisper047' c='CVINPERPUB' lit='9909616' />"
														name="CVINPERPUB" id="CVINPERPUB" size="1"
														onchange="cargar_pantalla_por_clase();f_onchange_CVINPERPUB(this.value)"
														class="campowidthselect campo campotexto_ob"
														<axis:atr f="axisper047" c="CVINPERPUB" a="isInputText=false&modificable=true&obligatorio=true"/>>
															<option selected value>-
																<axis:alt f="axisper047" c="BLANCO" lit="1000348" /> -
															</option>
															<c:forEach var="clase" items="${sessionScope.LS_VALORES}">
																<option value="${clase.CATRIBU}"
																	<c:if test="${clase.CATRIBU == __formdata.DET_SARLAFT.CVINPERPUB}">selected</c:if>>${clase.TATRIBU}</option>
															</c:forEach>
													</select></td>
												</axis:ocultar>
											</tr>
											<tr>
											</tr>
											<tr>
											</tr>
											<tr>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="CSUJETOOBLIFACION">
													<td colspan="2"><span class="bold"><axis:alt f="axisper047"
																c="CSUJETOOBLIFACION" lit="9909650"></axis:alt></span><br /> <select
														title="<axis:alt f='axisper047' c='CSUJETOOBLIFACION' lit='9909650' />"
														alt="<axis:alt f='axisper047' c='CSUJETOOBLIFACION' lit='9909650' />"
														name="CSUJETOOBLIFACION" id="CSUJETOOBLIFACION" size="1"
														class="campowidthselect campo campotexto_ob"
														<axis:atr f="axisper047" c="CSUJETOOBLIFACION" a="isInputText=false&modificable=true&obligatorio=false"/>>
															<option selected value>-
																<axis:alt f="axisper047" c="BLANCO" lit="1000348" /> -
															</option>
															<c:forEach var="clase" items="${sessionScope.LS_VALORES}">
																<option value="${clase.CATRIBU}"
																	<c:if test="${clase.CATRIBU == __formdata.DET_SARLAFT.CSUJETOOBLIFACION}">selected</c:if>>${clase.TATRIBU}</option>
															</c:forEach>
													</select></td>
												</axis:ocultar>
												<axis:ocultar dejarHueco="false" f="axisper047"
													c="TINDIQUEOBLIG">
													<td><br /> <span class="bold"><axis:alt
																f="axisper047" c="TINDIQUEOBLIG" lit="89907044"></axis:alt></span><br />
														<input type="text" name="TINDIQUEOBLIG" id="TINDIQUEOBLIG"
														value="${__formdata.DET_SARLAFT.TINDIQUEOBLIG}"
														class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axisper047" c="TINDIQUEOBLIG" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axisper047" c="TINDIQUEOBLIG" lit="89907044" />"
														title="<axis:alt f="axisper047" c="TINDIQUEOBLIG" lit="89907044" />" /></td>
												</axis:ocultar>
											</tr>
											<tr>
											</tr>
										</table>
									</td>
									<td>


											<tr>
												
											</tr>

											<tr>
												<td id="td_LIT_89906137" class="campocaja" colspan="10"><img
													id="DS_89906137_parent" src="images/mes.gif"
													onclick="objEstilos.toggleDisplay('DS_89906137', this)"
													style="cursor: pointer" /> <b> <axis:alt
															f="axisper047" c="LIT_89906137" lit="89906137" />
												</b> 
													<div style="clear: both;">
														<hr class="titulo"></hr>
													</div></td>
											</tr>
                                            <!-- CP0637M_SYS_PERS - ACL - 19/11/2018 -- Se modifica para que muestre el vnculo de nuevo  -->
											<tr>
												<td colspan="10">
													<table id="DS_89906137_children" style="display: none">
														<tr>
															<td>
																	<c:if test="${__formdata.ACTIONMOD != 'CONSULTA'}"> <%-- TCS 1574 AP 29/01/2019 --%>
																	<%--<c:if test="${__formdata.DET_SARLAFT.SSARLAFT==null}">--%>
																		<div style="float: right">
																			<img id="new" border="0" src="images/new.gif"
																				title="<axis:alt f="axisper047" c="NEW" lit="104825"/>"
																				alt="<axis:alt f="axisper047" c="NEW" lit="104825"/>"
																				onclick="f_abrir_axisper051()" style="cursor: pointer" />
																		</div>
																	</c:if>
																<div class="titulo"></div>
																 <c:set var="title1">
																	<axis:alt f="axisper047" c="CTIPREL" lit="89906119" />
																</c:set> <c:set var="title2">
																	<axis:alt f="axisper047" c="TNOMBRE" lit="9907629" />
																</c:set> <c:set var="title3">
																	<axis:alt f="axisper047" c="CTIPIDEN" lit="9904433" />
																</c:set> <c:set var="title4">
																	<axis:alt f="axisper047" c="NNUMIDE" lit="9904434" />
																</c:set> <c:set var="title5">
																	<axis:alt f="axisper047" c="CPAIS" lit="9909611" />
																</c:set> <c:set var="title6">
																	<axis:alt f="axisper047" c="TENTIDAD" lit="9001624" />
																</c:set> <c:set var="title7">
																	<axis:alt f="axisper047" c="TCARGO" lit="9902638" />
																</c:set> <c:set var="title8">
																	<axis:alt f="axisper047" c="FDESVIN" lit="89906120" />
																</c:set> <%
 	int contador1 = 0;
 %>
																<div class="seccion displayspaceGrande"
																	style="width: 98%">
																	<display:table name="${__formdata.LISTAPEP}" id="LS"
																		export="false" class="dsptgtable" pagesize="-1"
																		defaultsort="2" defaultorder="ascending"
																		requestURI="axis_axisper047.do?paginar=true"
																		sort="list" cellpadding="0" cellspacing="0">
																		<%@ include file="../include/displaytag.jsp"%>
																		<display:column title="${title1}"
																			sortProperty="CTIPREL" headerClass="sortable"
																			media="html" sortable="true" autolink="false">
																			<div class="dspText">${LS.TTIPREL}</div>
																		</display:column>


																		<display:column title="${title2}"
																			sortProperty="TNOMBRE" headerClass="sortable"
																			media="html" sortable="true" autolink="false">
																			<div class="dspText">${LS.TNOMBRE}</div>
																		</display:column>
																		<display:column title="${title3}"
																			sortProperty="CTIPIDEN" headerClass="sortable"
																			media="html" sortable="true" autolink="false">
																			<div class="dspText">

																				<select class="selectdisabled" disabled>
																					<c:forEach var="element"
																						items="${sessionScope.ls_identificaciones}">
																						<option value="${element.CATRIBU}"
																							<c:if test="${element.CATRIBU == LS.CTIPIDEN}">selected</c:if>>
																							${element.TATRIBU}</option>
																					</c:forEach>
																				</select>

																			</div>
																		</display:column>
																		<display:column title="${title4}"
																			sortProperty="NNUMIDE" headerClass="sortable"
																			media="html" sortable="true" autolink="false">
																			<div class="dspText">${LS.NNUMIDE}</div>
																		</display:column>
																		<display:column title="${title5}" sortProperty="CPAIS"
																			headerClass="sortable" media="html" sortable="true"
																			autolink="false">
																			<div class="dspText">${LS.TPAIS}</div>
																		</display:column>
																		<display:column title="${title6}"
																			sortProperty="CGOZAREC" headerClass="sortable"
																			media="html" sortable="true" autolink="false">
																			<div class="dspText">${LS.TENTIDAD}</div>
																		</display:column>
																		<display:column title="${title7}"
																			sortProperty="CDECLARACI" headerClass="sortable"
																			media="html" sortable="true" autolink="false">
																			<div class="dspText">${LS.TCARGO}</div>
																		</display:column>
																		<display:column title="${title8}"
																			sortProperty="CDECLARACICUAL" headerClass="sortable"
																			media="html" sortable="true" autolink="false">
																			<div class="dspText">${LS.FDESVIN}</div>
																		</display:column>
																		<axis:visible c="DSP_ICONS" f="axisper047">
																		<display:column title=""
																			headerClass="headwidth5 sortable" style="width:5%"
																			media="html" autolink="false">
																			<div class="dspIcons">
																				<img id="find" border="0" src="images/delete.gif"
																					onclick="borrar_sarlaft_exp('${LS.SSARLAFT}','${LS.IDENTIFICACION}');"
																					style="cursor: pointer" />
																				<img border="0" alt="<axis:alt f='axisper009' c='LIT_EDITAR' lit='9901356'/>" title="<axis:alt f='axisper009' c='LIT_EDITAR' lit='9901356'/>" src="images/lapiz.gif"
			                      													onclick="f_open_axisper051('${LS.IDENTIFICACION}', '${LS.SSARLAFT}','${LS.CTIPREL}','${LS.TNOMBRE}','${LS.CTIPIDEN}','${LS.NNUMIDE}','${LS.CPAIS}','${LS.TPAIS}','${LS.TENTIDAD}','${LS.TCARGO}','${LS.FDESVIN}')"/>
																			</div>
																		</display:column>
																		</axis:visible>		
																		<%
																			contador1++;
																		%>
																	</display:table>
																</div>
															</td>
														</tr>
													</table> </c:if>




													
												</td>
											</tr>

											<tr>
												<td id="td_LIT_9909633" class="campocaja" colspan="10"><img
													id="DS_9909633_parent" src="images/mes.gif"
													onclick="objEstilos.toggleDisplay('DS_9909633', this)"
													style="cursor: pointer" /> <b> <axis:alt
															f="axisper047" c="LIT_9909633" lit="89906132" />
												</b>
													<div style="clear: both;">
														<hr class="titulo"></hr>
													</div></td>
											</tr>

											<tr>
												<td>
													<table id="DS_9909633_children" style="display: none">

														<tr>
													<!-- CP0727M_SYS_PERS_Val - ACL - 23/11/2018 -- Se modifica para agregar el campo origen de fondos  -->		
														<axis:ocultar dejarHueco="false" f="axisper047"
																c="CORIGENFON">
																<td><span class="bold"><axis:alt
																			f="axisper047" c="CORIGENFON" lit="89907032"></axis:alt></span><br />
																	<input type="text" name="CORIGENFON" id="CORIGENFON"
																	value="${__formdata.DET_SARLAFT.CORIGENFON}"
																	class="campowidthinput campo campotexto"
																	style="width: 90%;"
																	<axis:atr f="axisper047" c="CORIGENFON" a="modificable=true&obligatorio=false"/>
																	alt="<axis:alt f="axisper047" c="CORIGENFON" lit="89907032" />"
																	title="<axis:alt f="axisper047" c="CORIGENFON" lit="89907032" />" /></td>
														</axis:ocultar>
														</tr>
													</table>
													
												</td>
											</tr>

											<tr>
												<td id="td_LIT_106034" class="campocaja" colspan="10"><img
													id="DS_106034_parent" src="images/mes.gif"
													onclick="objEstilos.toggleDisplay('DS_106034', this)"
													style="cursor: pointer" /> <b> <axis:alt
															f="axisper047" c="LIT_9909292" lit="89906131" />
												</b>
													<div style="clear: both;">
														<hr class="titulo"></hr>
													</div></td>
											</tr>

											<tr>
												<td colspan="10">
													<table id="DS_106034_children" style="display: none">
														<tr>

															<axis:ocultar dejarHueco="false" f="axisper047"
																c="CTRAXMODEXT">
																<td><span class="bold"><axis:alt
																			f="axisper047" c="CTRAXMODEXT" lit="9909575"></axis:alt></span><br />
																	<select
																	title="<axis:alt f='axisper047' c='CTRAXMODEXT' lit='9909575' />"
																	alt="<axis:alt f='axisper047' c='CTRAXMODEXT' lit='9909575' />"
																	name="CTRAXMODEXT" id="CTRAXMODEXT" size="1"
																	onchange="cargar_pantalla_por_clase();f_onchange_CTRAXMODEXT(this.value)"
																	class="campowidthselect campo campotexto_ob"
																	<axis:atr f="axisper047" c="CTRAXMODEXT" a="isInputText=false&modificable=true&obligatorio=true"/>>
																		<option selected value>-
																			<axis:alt f="axisper047" c="BLANCO" lit="1000348" />-</option>
																		<c:forEach var="clase"
																			items="${sessionScope.LS_VALORES}">
																			<option value="${clase.CATRIBU}"
																				<c:if test="${clase.CATRIBU == __formdata.DET_SARLAFT.CTRAXMODEXT}">selected</c:if>>${clase.TATRIBU}</option>
																		</c:forEach>
																</select></td>
															</axis:ocultar>
															
															
															
															<axis:ocultar dejarHueco="false" f="axisper047"
																c="TTRAXMODEXT">
																<td><span class="bold" id= "label_TTRAXMODEXT"><axis:alt
																			f="axisper047" c="TTRAXMODEXT" lit="9909574"></axis:alt></span><br />
																	<select
																	title="<axis:alt f='axisper047' c='TTRAXMODEXT' lit='9909574' />"
																	alt="<axis:alt f='axisper047' c='TTRAXMODEXT' lit='9909574' />"
																	name="TTRAXMODEXT" id="TTRAXMODEXT" size="1"
																	onchange="cargar_pantalla_por_clase();"
																	class="campowidthselect campo campotexto_ob"
																	<axis:atr f="axisper047" c="TTRAXMODEXT" a="isInputText=false&modificable=true&obligatorio=true"/>>
																		<option selected value>-
																			<axis:alt f="axisper047" c="BLANCO" lit="1000348" />
																			-
																		</option>
																		<c:forEach var="clase"
																			items="${sessionScope.listaTransacciones}">
																			<option value="${clase.CATRIBU}"
																				<c:if test="${clase.CATRIBU == __formdata.DET_SARLAFT.TTRAXMODEXT}">selected</c:if>>${clase.TATRIBU}</option>
																		</c:forEach>
																	</select>
																</td>
															</axis:ocultar>
														</tr>
														<tr>
															<axis:ocultar dejarHueco="false" f="axisper047"
																c="CPRODFINEXT">
																<td><span class="bold"><axis:alt
																			f="axisper047" c="CPRODFINEXT" lit="9909573"></axis:alt></span><br />
																	<select
																	title="<axis:alt f='axisper047' c='CPRODFINEXT' lit='9909573' />"
																	alt="<axis:alt f='axisper047' c='CPRODFINEXT' lit='9909573' />"
																	name="CPRODFINEXT" id="CPRODFINEXT" size="1"
																	onchange="cargar_pantalla_por_clase();"
																	class="campowidthselect campo campotexto_ob"
																	<axis:atr f="axisper047" c="CPRODFINEXT" a="isInputText=false&modificable=true&obligatorio=true"/>>
																		<option selected value>-
																			<axis:alt f="axisper047" c="BLANCO" lit="1000348" />
																			-
																		</option>
																		<c:forEach var="clase"
																			items="${sessionScope.LS_VALORES}">
																			<option value="${clase.CATRIBU}"
																				<c:if test="${clase.CATRIBU == __formdata.DET_SARLAFT.CPRODFINEXT}">selected</c:if>>${clase.TATRIBU}</option>
																		</c:forEach>
																</select></td>
															</axis:ocultar>
															<axis:ocultar dejarHueco="false" f="axisper047"
																c="CCTAMODEXT">
																<td><span class="bold"><axis:alt
																			f="axisper047" c="CCTAMODEXT" lit="9909571"></axis:alt></span><br />
																	<select
																	title="<axis:alt f='axisper047' c='CCTAMODEXT' lit='9909571' />"
																	alt="<axis:alt f='axisper047' c='CCTAMODEXT' lit='9909571' />"
																	name="CCTAMODEXT" id="CCTAMODEXT" size="1"
																	onchange="cargar_pantalla_por_clase();"
																	class="campowidthselect campo campotexto_ob"
																	<axis:atr f="axisper047" c="CCTAMODEXT" a="isInputText=false&modificable=true&obligatorio=true"/>>
																		<option selected value>-
																			<axis:alt f="axisper047" c="BLANCO" lit="1000348" />
																			-
																		</option>
																		<c:forEach var="clase"
																			items="${sessionScope.LS_VALORES}">
																			<option value="${clase.CATRIBU}"
																				<c:if test="${clase.CATRIBU == __formdata.DET_SARLAFT.CCTAMODEXT}">selected</c:if>>${clase.TATRIBU}</option>
																		</c:forEach>
																</select></td>
															</axis:ocultar>
															<axis:ocultar dejarHueco="false" f="axisper047"
																c="TOTRASOPER">
																<td><span class="bold"><axis:alt
																			f="axisper047" c="TOTRASOPER" lit="9909570"></axis:alt></span><br />
																	<input type="text" name="TOTRASOPER" id="TOTRASOPER"
																	value="${__formdata.DET_SARLAFT.TOTRASOPER}"
																	class="campowidthinput campo campotexto"
																	style="width: 90%;"
																	<axis:atr f="axisper047" c="TOTRASOPER" a="modificable=true&obligatorio=false"/>
																	alt="<axis:alt f="axisper047" c="TOTRASOPER" lit="9909570" />"
																	title="<axis:alt f="axisper047" c="TOTRASOPER" lit="9909570" />" /></td>
															</axis:ocultar>
														</tr>
														<!-- CP0639M_SYS_PERS - ACL - 19/11/2018 -- Se modifica para que muestre el vnculo de nuevo  -->
														<tr>
															<td colspan="10">
																			<div class="titulo">
																				<div style="float: right">
																				<c:if test="${__formdata.ACTIONMOD != 'CONSULTA'}"> <%-- TCS 1574 AP 29/01/2019 --%>
																				<%-- <c:if test="${__formdata.DET_SARLAFT.SSARLAFT==null}">--%>
																						<img id="new" border="0" src="images/new.gif"
																							title="<axis:alt f="axisper047" c="NEW" lit="104825"/>"
																							alt="<axis:alt f="axisper047" c="NEW" lit="104825"/>"
																							onclick="javascript:f_abrir_axisper047_b();"
																							style="cursor: pointer" />
																					</c:if>
																				</div>
																			</div>
																			 <c:set
																				var="title1">
																				<axis:alt f="axisper047" c="CTIPOPROD" lit="9909569" />
																			</c:set> <c:set var="title2">
																				<axis:alt f="axisper047" c="CIDNUMPROD"
																					lit="9909634" />
																			</c:set> <c:set var="title3">
																				<axis:alt f="axisper047" c="TENTIDAD" lit="9001624" />
																			</c:set> <c:set var="title4">
																				<axis:alt f="axisper047" c="CMONTO" lit="9905096" />
																			</c:set> <c:set var="title5">
																				<axis:alt f="axisper047" c="CCIUDAD" lit="9908410" />
																			</c:set> <c:set var="title6">
																				<axis:alt f="axisper047" c="CPAIS" lit="100816" />
																			</c:set> <c:set var="title7">
																				<axis:alt f="axisper047" c="CMONEDA" lit="9907718" />
																			</c:set><%
 	int contador = 0;
 %>
																			<div class="seccion displayspaceGrande"
																				style="width: 98%">
																				<display:table name="${__formdata.LISTAARLAFTB}"
																					id="LS" export="false" class="dsptgtable"
																					pagesize="-1" defaultsort="2"
																					defaultorder="ascending"
																					requestURI="axis_axisper047.do?paginar=true"
																					sort="list" cellpadding="0" cellspacing="0">
																					<%@ include file="../include/displaytag.jsp"%>
																					<display:column title="${title1}"
																						sortProperty="CTIPOPROD" headerClass="sortable"
																						media="html" sortable="true" autolink="false">
																						<div class="dspText">${LS.CTIPOPROD}</div>
																					</display:column>
																					<display:column title="${title2}"
																						sortProperty="CIDNUMPROD" headerClass="sortable"
																						media="html" sortable="true" autolink="false">
																						<div class="dspText">${LS.CIDNUMPROD}</div>
																					</display:column>
																					<display:column title="${title3}"
																						sortProperty="TENTIDAD" headerClass="sortable"
																						media="html" sortable="true" autolink="false">
																						<div class="dspText">${LS.TENTIDAD}</div>
																					</display:column>
																					<display:column title="${title4}"
																						sortProperty="CMONTO" headerClass="sortable"
																						media="html" sortable="true" autolink="false">
																						<div class="dspText">${LS.CMONTO}</div>
																					</display:column>
																					<display:column title="${title5}"
																						sortProperty="CCIUDAD" headerClass="sortable"
																						media="html" sortable="true" autolink="false">
																						<div class="dspText">${LS.SCCIUDAD}</div>
																					</display:column>
																					<display:column title="${title6}"
																						sortProperty="CPAIS" headerClass="sortable"
																						media="html" sortable="true" autolink="false">
																						<div class="dspText">${LS.SCPAIS}</div>
																					</display:column>
																					<display:column title="${title7}"
																						sortProperty="CMONEDA" headerClass="sortable"
																						media="html" sortable="true" autolink="false">
																						<div class="dspText">
																							<select class="selectdisabled"
																								<c:if test="${__formdata.ACTIONMOD != 'CONSULTA'}">disabled</c:if>>
																								<c:forEach var="item"
																									items="${sessionScope.listaMonedas}">
																									<option value="${item.CMONEDA}"
																										<c:if test="${item.CMONEDA == LS.CMONEDA}">selected</c:if>>${item.TMONEDA}
																									</option>
																								</c:forEach>
																							</select>

																						</div>
																					</display:column>
																					<axis:visible c="DSP_ICONS" f="axisper047">
																					<display:column 
																						headerClass="headwidth5 sortable" style="width:5%"
																						media="html" autolink="false">
																						<div class="dspIcons">
																							<img id="find" border="0" src="images/delete.gif"
																								onclick="javascript:borrar_sarlaft_b('${LS.SPERSON}','${LS.SSARLAFT}','${LS.NACTIVI}');"
																								style="cursor: pointer" />
																							<img border="0" alt="<axis:alt f='axisper009' c='LIT_EDITAR' lit='9901356'/>" title="<axis:alt f='axisper009' c='LIT_EDITAR' lit='9901356'/>" src="images/lapiz.gif"
						                      													onclick="javascript:f_open_internacionales('${LS.NACTIVI}','${LS.SPERSON}','${LS.SSARLAFT}','${LS.CTIPOPROD}','${LS.CIDNUMPROD}','${LS.TENTIDAD}','${LS.CMONTO}','${LS.CCIUDAD}','${LS.SCCIUDAD}','${LS.CPAIS}','${LS.SCPAIS}','${LS.CMONEDA}','${LS.TDEPB}','${LS.STDEPB}');"/>
																						</div>
																					</display:column>
																					</axis:visible>
																					<%
																						contador++;
																					%>
																				</display:table>
																			</div>
															</td>
														</tr>
														</table>
													
												</td>
											</tr>

											<tr>
												<td id="td_LIT_89906135" class="campocaja" colspan="10"><img
													id="DS_89906135_parent" src="images/mes.gif"
													onclick="objEstilos.toggleDisplay('DS_89906135', this)"
													style="cursor: pointer" /> <b> <axis:alt
															f="axisper047" c="LIT_89906135" lit="89906135" />
												</b>
													<div style="clear: both;">
														<hr class="titulo"></hr>
													</div></td>
											</tr>

											<tr>
												<td colspan="10">
													<table id="DS_89906135_children" style="display: none">

														<tr>

															<axis:ocultar dejarHueco="false" f="axisper047"
																c="TPRESETRECLAMACI">
																<td colspan="5"><span class="bold"><axis:alt
																			f="axisper047" c="TPRESETRECLAMACI" lit="9909568"></axis:alt></span>
																	<select
																	title="<axis:alt f='axisper047' c='TPRESETRECLAMACI' lit='9909568' />"
																	alt="<axis:alt f='axisper047' c='TPRESETRECLAMACI' lit='9909568' />"
																	name="TPRESETRECLAMACI" id="TPRESETRECLAMACI" size="1"
																	onchange="cargar_pantalla_por_clase();"
																	class="campowidthselect campo campotexto_ob"
																	<axis:atr f="axisper047" c="TPRESETRECLAMACI" a="isInputText=false&modificable=true&obligatorio=true"/>>
																		<option selected value>-
																			<axis:alt f="axisper047" c="BLANCO" lit="1000348" />
																			-
																		</option>
																		<c:forEach var="clase"
																			items="${sessionScope.LS_VALORES}">
																			<option value="${clase.CATRIBU}"
																				<c:if test="${clase.CATRIBU == __formdata.DET_SARLAFT.TPRESETRECLAMACI}">selected</c:if>>${clase.TATRIBU}</option>
																		</c:forEach>
																</select></td>
															</axis:ocultar>
														</tr>
														<!-- CP0638M_SYS_PERS - ACL - 19/11/2018 -- Se modifica para que muestre el vnculo de nuevo  -->
														<tr>
															<td>
																<div class="titulo">
																	<div style="float: right">
																	<c:if test="${__formdata.ACTIONMOD != 'CONSULTA'}"> <%-- TCS 1574 AP 29/01/2019 --%>
																		<%--<c:if test="${__formdata.DET_SARLAFT.SSARLAFT==null}">--%>
																			<img id="new" border="0" src="images/new.gif"
																				title="<axis:alt f="axisper047" c="NEW" lit="104825"/>"
																				alt="<axis:alt f="axisper047" c="NEW" lit="104825"/>"
																				onclick="f_abrir_axisper047_c('','CREACION')"
																				style="cursor: pointer" />
																		</c:if>
																	</div>
																</div>
																 <c:set var="title1">
																	<axis:alt f="axisper047" c="CANIO" lit="101606" />
																</c:set> <c:set var="title2">
																	<axis:alt f="axisper047" c="CRAMO" lit="100784" />
																</c:set> <c:set var="title3">
																	<axis:alt f="axisper047" c="TCOMPANIA" lit="9901223" />
																</c:set> <c:set var="title4">
																	<axis:alt f="axisper047" c="CVALOR" lit="101159" />
																</c:set> <c:set var="title5">
																	<axis:alt f="axisper047" c="TRESULTADO" lit="111046" />
																</c:set><%
 	contador = 0;
 %>
																<div class="seccion displayspaceGrande"
																	style="width: 98%">
																	<display:table name="${__formdata.LISTAARLAFTC}"
																		id="LS" export="false" class="dsptgtable"
																		pagesize="-1" defaultsort="2" defaultorder="ascending"
																		requestURI="axis_axisper047.do?paginar=true"
																		sort="list" cellpadding="0" cellspacing="0">
																		<%@ include file="../include/displaytag.jsp"%>
																		<display:column title="${title1}" sortProperty="CANIO"
																			headerClass="sortable" media="html" sortable="true"
																			autolink="false">
																			<div class="dspText">${LS.CANIO}</div>
																		</display:column>
																		<display:column title="${title2}" sortProperty="CRAMO"
																			headerClass="sortable" media="html" sortable="true"
																			autolink="false">
																			<div class="dspText">${LS.CRAMO}</div>
																		</display:column>
																		<display:column title="${title3}"
																			sortProperty="TCOMPANIA" headerClass="sortable"
																			media="html" sortable="true" autolink="false">
																			<div class="dspText">${LS.TCOMPANIA}</div>
																		</display:column>
																		<display:column title="${title4}"
																			sortProperty="CVALOR" headerClass="sortable"
																			media="html" sortable="true" autolink="false">
																			<div class="dspText">${LS.CVALOR}</div>
																		</display:column>
																		<display:column title="${title5}"
																			sortProperty="TRESULTADO" headerClass="sortable"
																			media="html" sortable="true" autolink="false">
																			<div class="dspText">
																			  <select class="selectdisabled"
																				<c:if test="${__formdata.ACTIONMOD != 'CONSULTA'}">disabled</c:if>>
																								<c:forEach var="item"
																									items="${sessionScope.LS_VALORES_RESSINI}">
																									<option value="${item.CATRIBU}"
																										<c:if test="${item.CATRIBU == LS.TRESULTADO}">selected</c:if>>${item.TATRIBU}
																									</option>
																								</c:forEach>
																							</select>

																						</div>
																			
																		</display:column>
																		<axis:visible c="DSP_ICONS" f="axisper047">
																		<display:column
																			headerClass="headwidth5 sortable" style="width:5%"
																			media="html" autolink="false">
																			<div class="dspIcons">
																				<img id="find" border="0" src="images/delete.gif"
																					onclick="javascript:borrar_sarlaft_c('${LS.SPERSON}','${LS.SSARLAFT}','${LS.NRECLA}');"
																					style="cursor: pointer" />
																				<img border="0" alt="<axis:alt f='axisper009' c='LIT_EDITAR' lit='9901356'/>" title="<axis:alt f='axisper009' c='LIT_EDITAR' lit='9901356'/>" src="images/lapiz.gif"
			                      													onclick="f_abrir_axisper047_c('${LS.NRECLA}','CONSULTA')"/>
																			</div>
																		</display:column>
																		</axis:visible>
																		<%
																			contador++;
																		%>
																	</display:table>
																</div>
															</td>
														</tr>
													</table>
													
												</td>
											</tr>
											<tr>
												<td id="td_LIT_89906133" class="campocaja" colspan="10"><img
													id="DS_89906133_parent" src="images/mes.gif"
													onclick="objEstilos.toggleDisplay('DS_89906133', this)"
													style="cursor: pointer" /> <b> <axis:alt
															f="axisper047" c="LIT_89906133" lit="89906133" />
												</b>
													<div style="clear: both;">
														<hr class="titulo"></hr>
													</div></td>
											</tr>

											<tr>
												<td>
													<table id="DS_89906133_children" style="display: none">

														<tr>
															<axis:ocultar dejarHueco="false" f="axisper047"
																c="CDEPTOENTREV">
																<td><span class="bold"><axis:alt f="axisper047"
																			c="CDEPTOENTREV" lit="9902610"></axis:alt></span><br /> <input
																	type="text" name="CDEPTOENTREV" style="width: 40px;"
																	id="CDEPTOENTREV" readonly="readonly"
																	value="${__formdata.DET_SARLAFT.CDEPTOENTREV}"
																	class="campowidthinput campo campotexto"
																	<axis:atr f="axisper047" c="CDEPTOENTREV" a="modificable=true&obligatorio=false"/>
																	alt="<axis:alt f="axisper047" c="CDEPTOENTREV" lit="9902610" />"
																	title="<axis:alt f="axisper047" c="CDEPTOENTREV" lit="9902610" /> <axis:alt
																			f="axisper047" c="CCIUENTREV" lit="89906144"></axis:alt>" />
																	<axis:visible c="CDEPTOENTREV_FIND" f="axisper047">
																	<img id="findPais" border="0" src="images/find.gif"
																	onclick="f_dep('TPAIS','CDEPTOENTREV','CCIUENTREV','TDEPTOENTREV')"
																	style="cursor: pointer" /></axis:visible>
																	<input type="text"
																	name="TDEPTOENTREV" id="TDEPTOENTREV"
																	value="${__formdata.DET_SARLAFT.TDEPTOENTREV}"
																	class="campowidthinput campo campotexto"
																	style="width: 70px;" readonly="readonly"
																	<axis:atr f="axisper047" c="TDEPTOENTREV" a="modificable=true&obligatorio=false"/>
																	alt="<axis:alt f="axisper047" c="TDEPTOENTREV" lit="9902610" />"
																	title="<axis:alt f="axisper047" c="TDEPTOENTREV" lit="9902610" />" /></td>
															</axis:ocultar>	

															<axis:ocultar dejarHueco="false" f="axisper047"
																c="CCIUENTREV">
																<td><span class="bold"><axis:alt
																			f="axisper047" c="CCIUENTREV" lit="89906144"></axis:alt></span><br />
																	<input type="text" name="CCIUENTREV" id="CCIUENTREV"
																	readonly="readonly" style="width: 40px;"
																	value="${__formdata.DET_SARLAFT.CCIUENTREV}"
																	class="campowidthinput campo campotexto"
																	<axis:atr f="axisper047" c="CCIUENTREV" a="modificable=true&obligatorio=false"/>
																	alt="<axis:alt f="axisper047" c="CCIUENTREV" lit="89906144" />"
																	title="<axis:alt f="axisper047" c="CCIUENTREV" lit="89906144" />" />
																	 <axis:visible c="CCIUENTREV_FIND" f="axisper047">
																	<img id="findCiudadEntrev" border="0" src="images/find.gif"
																	onclick="f_ciudad('PER_PAIS','CDEPTOENTREV','CCIUENTREV','TCIUENTREV')"
																	style="cursor: pointer" /></axis:visible>
																	<input type="text"
																	name="TCIUENTREV" id="TCIUENTREV"
																	value="${__formdata.DET_SARLAFT.TCIUENTREV}"
																	class="campowidthinput campo campotexto"
																	style="width: 70px;"
																	<axis:atr f="axisper047" c="TCIUENTREV" a="modificable=false&obligatorio=false"/>
																	alt="<axis:alt f="axisper047" c="TCIUENTREV" lit="89906144" />"
																	title="<axis:alt f="axisper047" c="TCIUENTREV" lit="89906144" />" /></td>
															</axis:ocultar>
														</tr>
														<tr>

															<axis:ocultar dejarHueco="false" f="axisper047"
																c="FENTREVISTA">
																<td><span class="bold"><axis:alt
																			f="axisper047" c="FENTREVISTA" lit="89906145"></axis:alt></span><br />
																	<input type="text" name="FENTREVISTA" id="FENTREVISTA"
																	size="15" class="campo campotexto"
																	value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.DET_SARLAFT.FENTREVISTA}"/>"
																	title="<axis:alt f='axisper047' c='FENTREVISTA' lit='89906145'/>"
																	alt="<axis:alt f='axisper047' c='FENTREVISTA' lit='89906145'/>"
																	<axis:atr f="axisper047" c="FENTREVISTA" a="formato=fecha&modificable=true&obligatorio=true"/> />
																	<a style="vertical-align: middle;"> <c:if
																			test="${__formdata.ACTIONMOD != 'CONSULTA'}">
																			<img id="icon_FENTREVISTA"
																				alt="<axis:alt f="axisper047" c="FENTREVISTA" lit="89906145"/>"
																				title="<axis:alt f="axisper047" c="FENTREVISTA" lit="89906145" />"
																				src="images/calendar.gif" />
																		</c:if>
																</a></td>
															</axis:ocultar>
															<axis:ocultar dejarHueco="false" f="axisper047"
																c="THORAENTREV">
																<td><span class="bold"><axis:alt
																			f="axisper047" c="THORAENTREV" lit="89906146"></axis:alt></span><br />
																	<input 
																	type="text" pattern= ^(2[0-3]|[01]?[0-9]):([0-5]?[0-9])$ name="THORAENTREV" id="THORAENTREV"
																	value="${__formdata.DET_SARLAFT.THORAENTREV}"
																	class="campowidthinput campo campotexto"
																	style="width: 100%;"
																	<axis:atr f="axisper047" c="THORAENTREV" a="modificable=true&obligatorio=false"/>
																	alt="<axis:alt f="axisper047" c="THORAENTREV" lit="89906146" />"
																	title="<axis:alt f="axisper047" c="THORAENTREV" lit="89906146" />" /></td>
															</axis:ocultar>
														</tr>
														<tr>

															<axis:ocultar dejarHueco="false" f="axisper047"
																c="TAGENENTREV">
																<td><span class="bold"><axis:alt
																			f="axisper047" c="TAGENENTREV" lit="9910199"></axis:alt></span><br />
																	<input type="text" name="TAGENENTREV" id="TAGENENTREV"
																	value="${__formdata.DET_SARLAFT.TAGENENTREV}"
																	class="campowidthinput campo campotexto"
																	style="width: 90%;"
																	<axis:atr f="axisper047" c="TAGENENTREV" a="modificable=true&obligatorio=false"/>
																	alt="<axis:alt f="axisper047" c="TAGENENTREV" lit="9910199" />"
																	title="<axis:alt f="axisper047" c="TAGENENTREV" lit="9910199" />" /></td>
															</axis:ocultar>

															<axis:ocultar dejarHueco="false" f="axisper047"
																c="TASESENTREV">
																<td><span class="bold"><axis:alt
																			f="axisper047" c="TASESENTREV" lit="89906147"></axis:alt></span><br />
																	<input type="text" name="TASESENTREV" id="TASESENTREV"
																	value="${__formdata.DET_SARLAFT.TASESENTREV}"
																	class="campowidthinput campo campotexto"
																	style="width: 100%;"
																	<axis:atr f="axisper047" c="TASESENTREV" a="modificable=true&obligatorio=false"/>
																	alt="<axis:alt f="axisper047" c="TASESENTREV" lit="89906147" />"
																	title="<axis:alt f="axisper047" c="TASESENTREV" lit="89906147" />" /></td>
															</axis:ocultar>
														</tr>
														<tr>
															<axis:ocultar dejarHueco="false" f="axisper047"
																c="TOBSEENTREV">
																<td><span class="bold"><axis:alt
																			f="axisper047" c="TOBSEENTREV" lit="101162"></axis:alt></span><br />
																	<input type="text" name="TOBSEENTREV" id="TOBSEENTREV"
																	value="${__formdata.DET_SARLAFT.TOBSEENTREV}"
																	class="campowidthinput campo campotexto"
																	style="width: 90%;"
																	<axis:atr f="axisper047" c="TOBSEENTREV" a="modificable=true&obligatorio=false"/>
																	alt="<axis:alt f="axisper047" c="TOBSEENTREV" lit="101162" />"
																	title="<axis:alt f="axisper047" c="TOBSEENTREV" lit="101162" />" /></td>
															</axis:ocultar>
														</tr>
														<tr>
															<axis:ocultar dejarHueco="false" f="axisper047"
																c="CRESTENTREV">
																<td><span class="bold"><axis:alt
																			f="axisper047" c="CRESTENTREV" lit="111046"></axis:alt></span><br />
																	<select
																	title="<axis:alt f='axisper047' c='CRESTENTREV' lit='111046' />"
																	alt="<axis:alt f='axisper047' c='CRESTENTREV' lit='9909575' />"
																	name="CRESTENTREV" id="CRESTENTREV" size="1"
																	onchange="cargar_pantalla_por_clase();"
																	class="campowidthselect campo campotexto_ob"
																	<axis:atr f="axisper047" c="CRESTENTREV" a="isInputText=false&modificable=true&obligatorio=true"/>>
																		<option selected value>-
																			<axis:alt f="axisper047" c="BLANCO" lit="1000348" />
																			-
																		</option>
																		<c:forEach var="clase"
																			items="${sessionScope.LS_RESULTADO_ENTREVISTA}">
																			<option value="${clase.CATRIBU}"
																				<c:if test="${clase.CATRIBU == __formdata.DET_SARLAFT.CRESTENTREV}">selected</c:if>>${clase.TATRIBU}</option>
																		</c:forEach>
																</select></td>
															</axis:ocultar>

														</tr>
													</table>

													
												</td>
											</tr>
											<tr>
												<td id="td_LIT_89906148" class="campocaja" colspan="10"><img
													id="DS_89906148_parent" src="images/mes.gif"
													onclick="objEstilos.toggleDisplay('DS_89906148', this)"
													style="cursor: pointer" /> <b> <axis:alt
															f="axisper047" c="LIT_89906148" lit="89906148" />
												</b>
													<div style="clear: both;">
														<hr class="titulo"></hr>
													</div></td>
											</tr>

											<tr>
												<td>
													<table id="DS_89906148_children" style="display: none">

														<tr>
															<axis:ocultar dejarHueco="false" f="axisper047"
																c="FCONFIR">
																<td><span class="bold"><axis:alt
																			f="axisper047" c="FCONFIR" lit="9909583"></axis:alt></span><br />
																	<input type="text" name="FCONFIR" id="FCONFIR"
																	size="15" class="campo campotexto"
																	value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.DET_SARLAFT.FCONFIR}"/>"
																	title="<axis:alt f='axisper047' c='FCONFIR' lit='9909583'/>"
																	alt="<axis:alt f='axisper047' c='FCONFIR' lit='9909583'/>"
																	<axis:atr f="axisper047" c="FCONFIR" a="formato=fecha&modificable=true&obligatorio=false"/> />
																	<a style="vertical-align: middle;"> <c:if
																			test="${__formdata.ACTIONMOD != 'CONSULTA'}">
																			<img id="icon_FCONFIR"
																				alt="<axis:alt f="axisper047" c="FCONFIR" lit="9909583"/>"
																				title="<axis:alt f="axisper047" c="FCONFIR" lit="9909583" />"
																				src="images/calendar.gif" />
																		</c:if>
																</a></td>
															</axis:ocultar>

															<axis:ocultar dejarHueco="false" f="axisper047"
																c="THORACONFIR">
																<td><span class="bold"><axis:alt
																			f="axisper047" c="THORACONFIR" lit="9909800"></axis:alt></span><br />
																	<input type="text" name="THORACONFIR" id="THORACONFIR"
																	value="${__formdata.DET_SARLAFT.THORACONFIR}"
																	class="campowidthinput campo campotexto"
																	style="width: 90%;"
																	<axis:atr f="axisper047" c="THORACONFIR" a="modificable=true&obligatorio=false"/>
																	alt="<axis:alt f="axisper047" c="THORACONFIR" lit="9909800" />"
																	title="<axis:alt f="axisper047" c="THORACONFIR" lit="9909800" />" /></td>
															</axis:ocultar>
														</tr>
														<tr>

															<axis:ocultar dejarHueco="false" f="axisper047"
																c="TEMPLCONFIR">
																<td><span class="bold"><axis:alt
																			f="axisper047" c="TEMPLCONFIR" lit="89906149"></axis:alt></span><br />
																	<input type="text" name="TEMPLCONFIR" id="TEMPLCONFIR"
																	value="${__formdata.DET_SARLAFT.TEMPLCONFIR}"
																	class="campowidthinput campo campotexto"
																	style="width: 90%;"
																	<axis:atr f="axisper047" c="TEMPLCONFIR" a="modificable=true&obligatorio=false"/>
																	alt="<axis:alt f="axisper047" c="TEMPLCONFIR" lit="89906149" />"
																	title="<axis:alt f="axisper047" c="TEMPLCONFIR" lit="89906149" />" /></td>
															</axis:ocultar>

														</tr>
														<tr>
															<axis:ocultar dejarHueco="false" f="axisper047"
																c="TOBSECONFIR">
																<td><span class="bold"><axis:alt
																			f="axisper047" c="TOBSECONFIR" lit="101162"></axis:alt></span><br />
																	<input type="text" name="TOBSECONFIR" id="TOBSECONFIR"
																	value="${__formdata.DET_SARLAFT.TOBSECONFIR}"
																	class="campowidthinput campo campotexto"
																	style="width: 90%;"
																	<axis:atr f="axisper047" c="TOBSECONFIR" a="modificable=true&obligatorio=false"/>
																	alt="<axis:alt f="axisper047" c="TOBSECONFIR" lit="101162" />"
																	title="<axis:alt f="axisper047" c="TOBSECONFIR" lit="101162" />" /></td>
															</axis:ocultar>
														</tr>
														<tr>
															<axis:ocultar dejarHueco="false" f="axisper047"
																c="CESTCONF">
																<td><span class="bold"><axis:alt
																			f="axisper047" c="CESTCONF" lit="9909582"></axis:alt></span><br />
																	<select
																	title="<axis:alt f='axisper047' c='CESTCONF' lit='9909582' />"
																	alt="<axis:alt f='axisper047' c='CESTCONF' lit='9909582' />"
																	name="CESTCONF" id="CESTCONF" size="1"
																	onchange="cargar_pantalla_por_clase();"
																	class="campowidthselect campo campotexto_ob"
																	<axis:atr f="axisper047" c="CESTCONF" a="isInputText=false&modificable=true&obligatorio=false"/>>
																		<option selected value>-
																			<axis:alt f="axisper047" c="BLANCO" lit="1000348" />
																			-
																		</option>
																		<c:forEach var="clase"
																			items="${sessionScope.LS_ESTADO_CONFIRMACION}">
																			<option value="${clase.CATRIBU}"
																				<c:if test="${clase.CATRIBU == __formdata.DET_SARLAFT.CESTCONF}">selected</c:if>>${clase.TATRIBU}</option>
																		</c:forEach>
																</select></td>
															</axis:ocultar>
															<axis:ocultar dejarHueco="false" f="axisper047"
																c="CRUTFCC">
																<td><span class="bold"><axis:alt
																			f="axisper047" c="CRUTFCC" lit="9909581"></axis:alt></span><br />
																	<select
																	title="<axis:alt f='axisper047' c='CRUTFCC' lit='9909581' />"
																	alt="<axis:alt f='axisper047' c='CRUTFCC' lit='9909581' />"
																	name="CRUTFCC" id="CRUTFCC" size="1"
																	onchange="cargar_pantalla_por_clase();"
																	class="campowidthselect campo campotexto_ob"
																	<axis:atr f="axisper047" c="CRUTFCC" a="isInputText=false&modificable=true&obligatorio=false"/>>
																		<option selected value>-
																			<axis:alt f="axisper047" c="BLANCO" lit="1000348" />
																			-
																		</option>
																		<c:forEach var="clase"
																			items="${sessionScope.LS_RUTA_FCC}">
																			<option value="${clase.CATRIBU}"
																				<c:if test="${clase.CATRIBU == __formdata.DET_SARLAFT.CRUTFCC}">selected</c:if>>${clase.TATRIBU}</option>
																		</c:forEach>
																</select></td>
															</axis:ocultar>


														</tr>
													</table>

													
												</td>
											</tr>
											<%--INI TCS-9 AP 12/02/2019 --%>
												<tr>
												<td id="td_LIT_89906222" class="campocaja" colspan="10"><img
													id="DS_89906222_parent" src="images/mes.gif"
													onclick="objEstilos.toggleDisplay('DS_89906222', this)"
													style="cursor: pointer" /> <b> <axis:alt
															f="axisper047" c="LIT_89906222" lit="89906222" />
													</b>
													<div style="clear: both;">
														<hr class="titulo"></hr>
													</div></td>
												</tr>
												<tr>
												<td>
													<table id="DS_89906222_children" style="display: none">

														<tr>
													<axis:ocultar dejarHueco="false" f="axisper047"
														c="CCLAUSULA1">
														<td><span class="bold"><axis:alt f="axisper047"
																	c="CCLAUSULA1" lit="89906219"></axis:alt></span><br /> <select
															title="<axis:alt f='axisper047' c='CCLAUSULA1' lit='89906219' />"
															alt="<axis:alt f='axisper047' c='CCLAUSULA1' lit='89906219' />"
															name="CCLAUSULA1" id="CCLAUSULA1" size="1"
															onchange="cargar_pantalla_por_clase();"
															class="campowidthselect campo campotexto_ob"
															<axis:atr f="axisper047" c="CCLAUSULA1" a="isInputText=false&modificable=true&obligatorio=true"/>>
																<option selected value>-
																	<axis:alt f="axisper047" c="BLANCO" lit="1000348" /> -
																</option>
																<c:forEach var="clase" items="${sessionScope.LS_VALORES}">
																	<option value="${clase.CATRIBU}"
																		<c:if test="${clase.CATRIBU == __formdata.DET_SARLAFT.CCLAUSULA1}">selected</c:if>>${clase.TATRIBU}</option>
																</c:forEach>
														</select></td>
													</axis:ocultar>
													</tr>
													<tr>
														<axis:ocultar dejarHueco="false" f="axisper047" c="TCLAUSULA2">
															<td colspan="6"><span class="bold"><axis:alt f="axisper047" c="TCLAUSULA2"
																		lit="89906220"></axis:alt></span><br />
																<div class="titulo"></div></td>
														</axis:ocultar>
													</tr>
													<tr>		
													<axis:ocultar dejarHueco="false" f="axisper047"
														c="CCLAUSULA2">
														<td><span class="bold"><axis:alt f="axisper047"
																	c="CCLAUSULA2" lit="89906221"></axis:alt></span><br /> <select
															title="<axis:alt f='axisper047' c='CCLAUSULA2' lit='89906221' />"
															alt="<axis:alt f='axisper047' c='CCLAUSULA2' lit='89906221' />"
															name="CCLAUSULA2" id="CCLAUSULA2" size="1"
															onchange="cargar_pantalla_por_clase();"
															class="campowidthselect campo campotexto_ob"
															<axis:atr f="axisper047" c="CCLAUSULA2" a="isInputText=false&modificable=true&obligatorio=true"/>>
																<option selected value>-
																	<axis:alt f="axisper047" c="BLANCO" lit="1000348" /> -
																</option>
																<c:forEach var="clase" items="${sessionScope.LS_VALORES}">
																	<option value="${clase.CATRIBU}"
																		<c:if test="${clase.CATRIBU == __formdata.DET_SARLAFT.CCLAUSULA2}">selected</c:if>>${clase.TATRIBU}</option>
																</c:forEach>
														</select></td>
													</axis:ocultar>
													</tr>
												</table>
												</td>
												</tr>
												<%--FIN TCS-9 AP 12/02/2019--%>

											</tbody>
										</table>
										</form>
                                        <!-- Inicio IAXIS-3287 02/04/2019 -->
										 <c:if
											test="${__formdata.ACTIONMOD == 'NUEVO_SARLAFT'}">
											<c:import url="../include/botonera_nt.jsp">
												<c:param name="f">axisper047</c:param>
												<c:param name="f">axisper047</c:param>
												<c:param name="__botones">salir,guardar,confirmar</c:param> 
											</c:import>
										</c:if> <c:if
											test="${__formdata.ACTIONMOD == 'EDITA_DATOS_PERSONA' && __formdata.DET_SARLAFT.CCONFIR  eq 0}">
											<c:import url="../include/botonera_nt.jsp">
												<c:param name="f">axisper047</c:param>
												<c:param name="f">axisper047</c:param>
												<c:param name="__botones">salir,guardar,confirmar</c:param> 
											</c:import>
											</c:if>	<c:if
											test="${__formdata.ACTIONMOD == 'EDITA_DATOS_PERSONA' && __formdata.DET_SARLAFT.CCONFIR eq 1}">
											<c:import url="../include/botonera_nt.jsp">
												<c:param name="f">axisper047</c:param>
												<c:param name="f">axisper047</c:param>
												<c:param name="__botones">salir,confirmar</c:param> 
											</c:import>
										</c:if> 
										<!-- Fin IAXIS-3287 02/04/2019 -->
										<c:if 
										    test="${__formdata.ACTIONMOD == 'CONSULTA'}">
											<c:import url="../include/botonera_nt.jsp">
												<c:param name="f">axisper047</c:param>
												<c:param name="__botones">salir<c:if test="${__formdata.DET_SARLAFT.CCONFIR eq 1 && sessionScope.sarlaftDuplicable eq __formdata.DET_SARLAFT.SSARLAFT}">,duplicar</c:if></c:param>
											</c:import>
										</c:if> <c:import url="../include/mensajes.jsp" />
</body>
</html>
