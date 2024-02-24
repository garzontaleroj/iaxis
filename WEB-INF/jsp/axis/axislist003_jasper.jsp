
<%
	/* Revision:# eYMqlfNlrNUoE6rAXtaQbA== # */
%>
<%--
      NOMBRE:    axislist003_jasper.jsp
      Fecha: 10/11/2020
      PROPÓSITO (descripción pantalla): 
      Ejemplo : Listados que se lanzan directamente contra un generador de reports JasperServer
  
      REVISIONES:
      Ver        Fecha       Autor            Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0                    SQAD QA              Version inical
      
--%>

<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*"%>



<fmt:setLocale value="${sessionScope.__locale}" />
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title></title>
<link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
<link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
<%-- Especial per controlar els scroll amb iPad --%>
<link type="text/css" href="styles/jquery.jscrollpane.css"
	rel="stylesheet"
	media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
<style type="text/css" id="page-css">
</style>
<link rel="stylesheet" href="styles/displaytag.css">
<c:import url="../include/carga_framework_js.jsp" />
<link rel="stylesheet" type="text/css" media="all"
	href="styles/calendar-green.css" title="green" />
<script type="text/javascript" src="scripts/calendar.js"></script>
<script type="text/javascript"
	src="scripts/calendar-${sessionScope.__locale}.js"></script>
<script type="text/javascript" src="scripts/calendar-setup.js"></script>
<script type="text/javascript" src="scripts/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="scripts/jquery.tokenize.js"></script>
<link rel="stylesheet" type="text/css" href="styles/jquery.tokenize.css" />
<script type="text/javascript">

        (function($) {  
            $.get = function(key)   {  
                key = key.replace(/[\[]/, '\\[');  
                key = key.replace(/[\]]/, '\\]');  
                var pattern = "[\\?&]" + key + "=([^&#]*)";  
                var regex = new RegExp(pattern);  
                var url = unescape(window.location.href);  
                var results = regex.exec(url);  
                if (results === null) {  
                    return null;  
                } else {  
                    return results[1];  
                }  
            }  
        })(jQuery);  
        
        var nav4 = window.Event ? true : false;
		function ValidNum(evt) {
		    // NOTE: Backspace = 8, Enter = 13, '0' = 48, '9' = 57
		    	var key = nav4 ? evt.which : evt.keyCode;
			    return (key <= 13 || (key >= 48 && key <= 57));
		}
		
		function OnRadio(evt){
			if(evt==0)
			{
				document.getElementById('PARAMETRO__P_AGENTE').style.display = "block";
				document.getElementById('label_P_AGENTE').style.display = "block";
				document.getElementById('PARAMETRO__P_NIT').style.display = "none";
				document.getElementById('label_P_NIT').style.display="none";
			}
			else
			{
				document.getElementById('PARAMETRO__P_NIT').style.display = "block";
				document.getElementById('label_P_NIT').style.display="block";
				document.getElementById('PARAMETRO__P_AGENTE').style.display = "none";
				document.getElementById('label_P_AGENTE').style.display = "none";
			}				
		}
		
		function f_set_initial_none()
		{			
			document.getElementById('PARAMETRO__P_NIT').style.display = "none";
			document.getElementById('label_P_NIT').style.display="none";
			document.getElementById('PARAMETRO__P_AGENTE').style.display = "none";
			document.getElementById('label_P_AGENTE').style.display = "none";
		}
        
        function f_but_ejecutar() {
    if (objValidador.validaEntrada()){
        //Si el correo electronico esta informado se procede a su validacion
        if (direccionEmail()){
            //Debe ser iguales la direccion de correo y la confirmacion
            if (emailCoinciden()){
                f_onchange(document.getElementById("but_ejecutar"));
            }    
        }     
    }
}
        
        
        function f_llamarReporteJasper() {
    if (objValidador.validaEntrada()){
        //Si el correo electronico esta informado se procede a su validacion
        if (direccionEmail()){
            //Debe ser iguales la direccion de correo y la confirmacion
            if (emailCoinciden()){
                f_onchange(document.getElementById("but_llamarReporteJasper"));
            }    
        }     
    }
}

function emailCoinciden(){
    var elemento = document.getElementById("CEMAIL");
    var evaluarMail = elemento.value;
    var elementoCC = document.getElementById("CCONFIRMACION");
    var confirmacion = elementoCC.value;    
    if (confirmacion.length>0){
        if (evaluarMail == confirmacion){
            return true;
        }else{
            alert('<axis:alt f="axislist006" c="CCONFIRACION" lit="9905727"/>');    
            elementoCC.focus();
            return false;
        }
    
    }else{
        if (evaluarMail.length>0){
            alert('<axis:alt f="axislist006" c="CCONFIRACION" lit="9905727"/>');    
            elementoCC.focus();
            return false;
        }else{
            return true;
        }    
    }

}
function f_but_ejecuar_batch(){
    if (objValidador.validaEntrada()){
        //Si el correo electronico esta informado se procede a su validacion
        if (direccionEmail()){
            //Debe ser iguales la direccion de correo y la confirmacion
            if (emailCoinciden()){
                f_onchange(document.getElementById("but_ejecutar_batch"));
            }    
        }     
    }    

}
function f_but_ejecuar_ulea(){
    if (objValidador.validaEntrada()){
        //Si el correo electronico esta informado se procede a su validacion
        if (direccionEmail()){
            //Debe ser iguales la direccion de correo y la confirmacion
            if (emailCoinciden()){
                f_onchange(document.getElementById("but_ejecutar_ulea"));
            }    
        }     
    }    

}
function f_but_CierreDeSiniestros(){
    if (objValidador.validaEntrada()){
        //Si el correo electronico esta informado se procede a su validacion
        if (direccionEmail()){
            //Debe ser iguales la direccion de correo y la confirmacion
            if (emailCoinciden()){
                f_onchange(document.getElementById("but_CierreDeSiniestros"));
            }    
        }     
    }    

}

function f_cerrar_axisimprimir() {
    objUtiles.cerrarModal("axisimprimir");
}

function f_imprimir_fitxer(){                    
    pfitxer = document.getElementById('SORTIDA').value;
      var str2 = pfitxer.replace(/barrainvertida/gi, "\\");    
      
    objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+str2+"&origen=axislist003.jsp",600,200);
}  

function f_onload(){
    f_onchange(document.getElementById("CEMPRES")); //cargamos por defecto los listados del CEMPRES actual
    
    f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla   
    
    
    
}

function f_but_salir() {
	var REPORTE = $.get("REPORTE");
	if(REPORTE != null && REPORTE != "undefined"){
		parent.f_cerrar_axislist003();
	}else{
    objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axislist003", "cancelar", document.miForm, "_self");
	}
}


function f_but_9905618() {
    if (objValidador.validaEntrada()){
        var params = f_get_params();
        objUtiles.ejecutarFormulario("axis_axislist003.do?PPARAMS="+params, "ejecutar", document.miForm, "_self", '<axis:alt f="axislist003" c="MSG_CARGAR" lit="9901019"/>');   
    }
}

function direccionEmail(){
    var elemento = document.getElementById("CEMAIL");
    var evaluar = elemento.value;
    var filter=/^[A-Za-z][A-Za-z0-9_]*@[A-Za-z0-9_]+\.[A-Za-z0-9_.]+[A-za-z]$/;
    if (evaluar.length>0){
        var expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if ( !expr.test(evaluar) ){
            alert('<axis:alt f="axislist006" c="CEMAIL" lit="9905726"/>');    
            document.getElementById("CEMAIL").focus();
             document.getElementById("CCONFIRMACION").value="";
            return false;
        }else{
            return true;
        }   
    }else{
        return true;
    }
        
}

function hideLoader() {
	  setTimeout(function(){objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");}, 500);
	}

function ShowLoader() {
	objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", 'Cargando', "inline"); 
	}

/*function sendMail(mail,reportName){
$.ajax({	
	url: 'http://preiaxis.confianza.com.co:8287/email/send',
	crossDomain:true,
	headers:{
		"Content-Type" : "application/json; charset=utf-8",
		"Accept" : "application/json",
		"Access-Control-Allow-Origin":"*",
		"Access-Control-Allow-Headers":"Origin, X-Requested-With, Content-Type, Accept",
		"Access-Control-Allow-Methods":"POST",
		},
	type : 'POST',
	datatype: 'json',
	data: JSON.stringify({ 	
		"from": "iaxis@confianza.com.co",
		 "to": mail,
		 "subject": reportName,
		 "content": reportName,
		 "attachments": "/app/iaxis12c/tabext/Test-8-nov-2020-csv.csv",
		 "contentType": "text/html" })
	})
	.done(function( msg ) {
	alert( "Data Sended: " + msg );
	});	

}*/
	
	
	//Función que trae el codigo de status de una url y esconde el loader cargando
	
/*function loadDoc(urlx) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4) {
        	alert("aqui");
        	 document.getElementById("demo").innerHTML =
                 this.responseText;
        	 console.log(this.responseText);
        	if(this.Status == 200){
        		alert("status 200")
        	hideLoader();
        	
           
        	}
       }
    };
    xhttp.open("GET", urlx, true);
    xhttp.send();
}*/


/*var http_request = false;
function loadDoc(urlx) {
	
        http_request = false;

        if (window.XMLHttpRequest) { // Mozilla, Safari,...
            http_request = new XMLHttpRequest();
            if (http_request.overrideMimeType) {
                http_request.overrideMimeType('text/xml');
                // Ver nota sobre esta linea al final
            }
        } else if (window.ActiveXObject) { // IE
            try {
                http_request = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {
                try {
                    http_request = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (e) {}
            }
        }

        if (!http_request) {
            alert('Falla :( No es posible crear una instancia XMLHTTP');
            return false;
        }
        http_request.onreadystatechange = alertContents;
        http_request.open('GET', urlx, true);
        http_request.send();

    }

    function alertContents() {

        if (http_request.readyState == 4) {
        	  alert(http_request.responseText);
        	  alert("Aqui");
            if (http_request.status == 200) {
                alert(http_request.responseText);
                hideLoader();
                alert(http_request.status);
            } else {
            	alert(http_request.status);
                alert('Hubo problemas con la petición.');
            }
        }
    }*/

    function loadDoc_2(urlx){
    	var req = new XMLHttpRequest();
    	req.open('GET', urlx, true);
    	req.onreadystatechange = function (aEvt) {
    	  if (req.readyState == 4) {
    		  alert("4");
    		  alert(req.status);
    	     if(req.status == 0){
    	    	 alert("0");
        	     alert(req.status);
    	      dump(req.responseText);
    	    
    	     } else{
    	    	 alert(req.status);
    	      dump("Error loading page\n");
    	     }
    	  }
    	};
    	req.send(null); 
    }
    
    
    
    function loadDoc(urlx, callback){
    	
    	window.location.replace(urlx)
 	
    	  var xhr = new XMLHttpRequest();

    	  xhr.onreadystatechange = function() {
    	    if (xhr.readyState === 4) {
    	    	
    	    	alert(xhr.status)
    	    	alert("aqui");
    	    	if (xhr.status === 200){
    	    		alert("200");
    	    	}
    	      callback(xhr.response);
    	      console.log(xhr.response);
    	    }
    	  }

    	  xhr.open('GET', urlx, true);
    	  xhr.send('');
    	}
    

function getStatus(urlx) {
	//window.location.replace(urlx)
	  conexion1=new XMLHttpRequest();
	  
	  conexion1.onreadystatechange = procesarEventos;
	//  var num=document.getElementById('nro').value;
	  //alert('Valor de la propiedad readyState:'+conexion1.readyState);
	  conexion1.open('GET',  urlx, true);
	  conexion1.send();
	}
	
	function procesarEventos()
	{
	 // alert('Valor de la propiedad readyState:'+conexion1.readyState);
	  var resultados = document.getElementById("");
	  alert(this.Type)
	  
	  if(this.readyState == 4 )
	  {	 alert("estado");
		  alert(this.status );
		  if(this.status == 200 || this.status == 0 || this.status == 404){			
			  hideLoader();
		  }		  		  
	    resultados.innerHTML = conexion1.responseText;
	   //console.log(resultados);
	   //console.log("4");
	  } 
	  else
	    if (conexion1.readyState==1 || conexion1.readyState==2 || conexion1.readyState==3)
	    {
	    	objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", 'Cargando', "inline");   	
	      //resultados.innerHTML = 'Procesando...';
	      //console.log(resultados);
	      //console.log("1");
	    }
	}
function f_onchange(ths) {
    var ACCION="";
    var urlAnnex="";
    var urlJasper="http://192.168.119.5:8287/services/ReportServiceProxy/";
    if (ths.id=='but_ejecutar') {
        //queremos generacion
        ACCION=ACCION+",EJECUTAR";
     
        //inputs...
        var inputs=document.getElementsByTagName("input");
        var k=0;
        for (k=0;k<inputs.length;k++) {
            if (inputs[k].name.indexOf("PARAMETRO__")==0) {
                var nombre = inputs[k].name;
                var tipoParam = "T" + nombre;
                var elemento = document.getElementById(tipoParam);
                if (elemento!=null){
                    var param = elemento.value;
                    urlAnnex=urlAnnex+"&"+inputs[k].name+"="+escape(inputs[k].value) + "&" + tipoParam+ "=" + escape(param);
                }else{
                    urlAnnex=urlAnnex+"&"+inputs[k].name+"="+escape(inputs[k].value);
                }
            }
        }
        //selects
        var selects=document.getElementsByTagName("select");
        var s=0;
        for (s=0;s<selects.length;s++) {
            if (selects[s].name.indexOf("PARAMETRO__")==0) {
              var nombre=selects[s].name;
              var valor = $('select#'+nombre).val();
              var tipoParam = "T" + nombre;
              var elemento = document.getElementById(tipoParam);
              if (elemento!=null){
                    var param = elemento.value;
                    urlAnnex=urlAnnex+"&"+nombre+"="+escape(valor) + "&" + tipoParam+ "=" + escape(param);
               }else{
                    urlAnnex=urlAnnex+"&"+nombre+"="+escape(valor);
               }
            }
        }
        var url="axis_axislist003.do?ACCION="+escape(ACCION)+"&operation=miajaxjson&CEMPRES="+document.miForm.CEMPRES.value+"&CMODO="+document.miForm.CMODO.value+"&SPRODUC="+document.miForm.SPRODUC.value + "&CMAP="+document.miForm.CLISTADO.value +"&CEXPORT="+document.miForm.CEXPORT.value + "&CIDIOMA=" + document.miForm.CIDIOMA.value + "&CEMAIL=" + document.miForm.CEMAIL.value + "&CHECKREC=" + document.miForm.CHECKREC.value;
        url=url+urlAnnex;
       /* jQuery.ajax({
            url: url,
            dataType: 'json',
            success: callBack_miajaxjson
        });*/
        objAjax.invokeAsyncCGI_JSON(url, callBack_miajaxjson, "<axis:alt f="axislist004" c="MSG_CARGAR" lit="9905686"/>")
           
                    
    }
    if (ths.id=='but_llamarReporteJasper') {
    	var reporte=document.miForm.CLISTADO.value ;
    //	urlJasper=urlJasper+reporte+".xlsx?";
     	var reporteExisteJasper= false; 
     	var nameReport = '';
    	if(reporte=='DetEmisRecibos'){
    		urlJasper=urlJasper+"DetEmisRecibos"+"."+document.miForm.CEXPORT.value+"?";
    		reporteExisteJasper =true;
    		nameReport="DetEmisRecibos"+"."+document.miForm.CEXPORT.value;	
    		
    		//Obtener la web del complemento y las URL de la web del host.
    		
    		//var spHostUrl = GetUrlKeyValue('urlJasper');
    		
    		//var appWebUrl, hostWebUrl;
			 //hostWebUrl = decodeURIComponent(getQueryStringParameter("urlJasper"));
			//console.log(spHostUrl)
    		//sendMail(document.miForm.CEMAIL.value,nameReport);
    	}
		if(reporte=='CancelSinCancel'){
			urlJasper=urlJasper+"CancelSinCancel"+"."+document.miForm.CEXPORT.value+"?";
			reporteExisteJasper =true;
			nameReport="CancelSinCancel"+"."+document.miForm.CEXPORT.value;			
			//sendMail(document.miForm.CEMAIL.value,nameReport);
			
			//Obtener la web del complemento y las URL de la web del host.
			// hostWebUrl = decodeURIComponent(getQueryStringParameter("urlJasper"));
			//console.log(hostWebUrl)
			
			//sendMail(document.miForm.CEMAIL.value,nameReport);
		}	
		if(reporte=='Reporte_Pre-Cierres_Siniestros_Recobros'){
			urlJasper=urlJasper+"Reporte_Pre_Cierres_Siniestros_Recobros"+"."+document.miForm.CEXPORT.value+"?";
			reporteExisteJasper =true;
			nameReport="Reporte_Pre-Cierres_Siniestros_Recobros"+"."+document.miForm.CEXPORT.value;
    	}
		if(reporte=='PrimasEmitidasCoaseguro'){
			urlJasper=urlJasper+"PrimasEmitidasCoaseguro"+"."+document.miForm.CEXPORT.value+"?";
			reporteExisteJasper =true;
			nameReport="PrimasEmitidasCoaseguro"+"."+document.miForm.CEXPORT.value;
    	}		
		
		if(reporte=='Sin_Pag_Reco_Reser_Rea'){
			urlJasper=urlJasper+"Sin_Pag_Reco_Reser_Rea"+"."+document.miForm.CEXPORT.value+"?IAXCON_HOMEDIR=/themes&";
			reporteExisteJasper =true;
			nameReport="Sin_Pag_Reco_Reser_Rea"+"."+document.miForm.CEXPORT.value;
		}
		if(reporte=='Reporte_Pre-Cierres_Produccion_Cancelaciones'){
			urlJasper=urlJasper+"Reporte_Pre_Cierres_Produccion_Cancelaciones"+"."+document.miForm.CEXPORT.value+"?&IAXCON_HOMEDIR=/themes&";
			reporteExisteJasper =true;
			nameReport="Reporte_Pre-Cierres_Produccion_Cancelaciones"+"."+document.miForm.CEXPORT.value;
		}	
		if(reporte=='Resumen_Apli_1'){
			urlJasper=urlJasper+"Resumen_Apli_1"+"."+document.miForm.CEXPORT.value+"?";
			reporteExisteJasper =true;
			nameReport="Resumen_Apli_1"+"."+document.miForm.CEXPORT.value;
		}
		if(reporte=='Resumen_Apli_1H'){
			urlJasper=urlJasper+"Resumen_Apli_1H"+"."+document.miForm.CEXPORT.value+"?";
			reporteExisteJasper =true;
			nameReport="Resumen_Apli_1H"+"."+document.miForm.CEXPORT.value;
		}
		if(reporte=='ListaOfacApp'){
			urlJasper=urlJasper+"ListaOfacApp"+"."+document.miForm.CEXPORT.value+"?IAXCON_HOMEDIR=/themes&";
			reporteExisteJasper =true;
			nameReport="ListaOfacApp"+"."+document.miForm.CEXPORT.value;
		}
		if(reporte=='DetalleComisionesGeneradasIntermediarios'){
			urlJasper=urlJasper+"DetalleComisionesGeneradasIntermediarios"+"."+document.miForm.CEXPORT.value+"?IAXCON_HOMEDIR=/themes&";
			reporteExisteJasper =true;
			nameReport="DetalleComisionesGeneradasIntermediarios"+"."+document.miForm.CEXPORT.value;
		}
		if(reporte=='Det_suscripcion_diaria'){
			urlJasper=urlJasper+"Det_suscripcion_diaria"+"."+document.miForm.CEXPORT.value+"?IAXCON_HOMEDIR=/themes&";
			reporteExisteJasper =true;
			nameReport="Det_suscripcion_diaria"+"."+document.miForm.CEXPORT.value;
		}
		if(reporte=='RColFacultativos'){
			urlJasper=urlJasper+"RColFacultativos"+"."+document.miForm.CEXPORT.value+"?";
			reporteExisteJasper =true;
			nameReport="RColFacultativos"+"."+document.miForm.CEXPORT.value;
		}
		if(reporte=='SinLiqPag'){
			urlJasper=urlJasper+"SinLiqPag"+"."+document.miForm.CEXPORT.value+"?IAXCON_HOMEDIR=/themes&";
			reporteExisteJasper =true;
			nameReport="SinLiqPag"+"."+document.miForm.CEXPORT.value;
		}
		if(reporte=='Validador_Reserv_Bruta_Sinies'){
			urlJasper=urlJasper+"Validador_Reserv_Bruta_Sinies"+"."+document.miForm.CEXPORT.value+"?IAXCON_HOMEDIR=/themes&";
			reporteExisteJasper =true;
			nameReport="SValidador_Reserv_Bruta_Sinies"+"."+document.miForm.CEXPORT.value;
		}
		if(reporte=='CarteraAcuerdo'){
			urlJasper=urlJasper+"CarteraAcuerdo"+"."+document.miForm.CEXPORT.value+"?IAXCON_HOMEDIR=/themes&";
			reporteExisteJasper =true;
			nameReport="CarteraAcuerdo"+"."+document.miForm.CEXPORT.value;
		}
		if(reporte=='CarteraDelima'){
			urlJasper=urlJasper+"Delima"+"."+document.miForm.CEXPORT.value+"?IAXCON_HOMEDIR=/themes&";
			reporteExisteJasper =true;
			nameReport="Delima"+"."+document.miForm.CEXPORT.value;
		}
		if(reporte=='repCarteraRecaudada'){
			urlJasper=urlJasper+"carteraRecaudadaCliente"+"."+document.miForm.CEXPORT.value+"?";
			reporteExisteJasper =true;
			nameReport="carteraRecaudadaCliente"+"."+document.miForm.CEXPORT.value;
		}
		if(reporte=='Reporte_Produccion_Primas'){
			urlJasper=urlJasper+"Reporte_Produccion_Primas"+"."+document.miForm.CEXPORT.value+"?IAXCON_HOMEDIR=/themes&";
			reporteExisteJasper =true;
			nameReport="Reporte_Produccion_Primas"+"."+document.miForm.CEXPORT.value;
		}
		if(reporte=='ListadoLiquidacionReaseguro'){
			urlJasper=urlJasper+"liquidacionesReaseguro"+"."+document.miForm.CEXPORT.value+"?IAXCON_HOMEDIR=/themes&";
			reporteExisteJasper =true;
			nameReport="liquidacionesReaseguro"+"."+document.miForm.CEXPORT.value;
		}		
		if(reporte=='PreValPrimasCedidas'){
			urlJasper=urlJasper+"prevalidador_primas_cedidas_reaseguro"+"."+document.miForm.CEXPORT.value+"?";
			reporteExisteJasper =true;
			nameReport="prevalidador_primas_cedidas_reaseguro"+"."+document.miForm.CEXPORT.value;
		}
		if(reporte=='DetSaldosPartEsp'){
			urlJasper=urlJasper+"DetSaldosPartEsp"+"."+document.miForm.CEXPORT.value+"?IAXCON_HOMEDIR=/themes&";
			reporteExisteJasper =true;
			nameReport="DetSaldosPartEsp"+"."+document.miForm.CEXPORT.value;
		}
		if(reporte=='PreValMovSiniCesion'){
			urlJasper=urlJasper+"PreValMovSiniCesion"+"."+document.miForm.CEXPORT.value+"?IAXCON_HOMEDIR=/themes&";
			reporteExisteJasper =true;
			nameReport="PreValMovSiniCesion"+"."+document.miForm.CEXPORT.value;
		}
		if(reporte=='Reporte_Pre-Cierres_Siniestros_Pagos'){
			urlJasper=urlJasper+"Reporte_Pre_Cierres_Siniestros_Pagos"+"."+document.miForm.CEXPORT.value+"?IAXCON_HOMEDIR=/themes&";
			reporteExisteJasper =true;
			nameReport="Reporte_Pre_Cierres_Siniestros_Pagos"+"."+document.miForm.CEXPORT.value;
		}
		if(reporte=='ListaOfacTodos'){
			urlJasper=urlJasper+"ListaOfacTodos"+"."+document.miForm.CEXPORT.value+"?IAXCON_HOMEDIR=/themes&";
			reporteExisteJasper =true;
			nameReport="ListaOfacTodos"+"."+document.miForm.CEXPORT.value;
		}
		if(reporte=='DiferidoDeComisiones'){
			urlJasper=urlJasper+"ReporteDiferidoComisiones"+"."+document.miForm.CEXPORT.value+"?IAXCON_HOMEDIR=/themes&";
			reporteExisteJasper =true;
			nameReport="ReporteDiferidoComisiones"+"."+document.miForm.CEXPORT.value;
		}
		if(reporte=='MarcasRiesgosApp'){
			urlJasper=urlJasper+"MarcasRiesgosApp"+"."+document.miForm.CEXPORT.value+"?IAXCON_HOMEDIR=/themes&";
			reporteExisteJasper =true;
			nameReport="MarcasRiesgosApp"+"."+document.miForm.CEXPORT.value;
		}
		if(reporte=='PreValPagoSiniestros'){
			urlJasper=urlJasper+"PreValPagoSiniestros"+"."+document.miForm.CEXPORT.value+"?IAXCON_HOMEDIR=/themes&";
			reporteExisteJasper =true;
			nameReport="PreValPagoSiniestros"+"."+document.miForm.CEXPORT.value;
		}
		if(reporte=='WACOLDA'){
			urlJasper=urlJasper+"Wacolda/CONFIANZA_WACOLDA"+"."+document.miForm.CEXPORT.value+"?IAXCON_HOMEDIR=/themes&";
			reporteExisteJasper =true;
		}if(reporte=='WILLIS'){
			urlJasper=urlJasper+"Willis/CONFIANZA_WILLIS"+"."+document.miForm.CEXPORT.value+"?IAXCON_HOMEDIR=/themes&";
			reporteExisteJasper =true;
		}
		if(reporte=='AON_OTROS'){
			urlJasper=urlJasper+"aonOtros/CONFIANZA_AON_OTROS"+"."+document.miForm.CEXPORT.value+"?IAXCON_HOMEDIR=/themes&";
			reporteExisteJasper =true;
		}if(reporte=='AON_CU_RCdrvCU'){
			urlJasper=urlJasper+"Aon/CONFIANZA_AON_CU_RCdrvCU"+"."+document.miForm.CEXPORT.value+"?IAXCON_HOMEDIR=/themes&";
			reporteExisteJasper =true;
		}
		if(reporte=='EstacartApp')
		{
			urlJasper=urlJasper+"EstacartAppli/EstacartApp"+"."+document.miForm.CEXPORT.value.trim()+"?IAXCON_HOMEDIR=/themes&";
			reporteExisteJasper = true;
		}
		if(reporte=='CORRECOL')
		{
			urlJasper=urlJasper+"Correcol/CONFIANZA_CORRECOL"+"."+document.miForm.CEXPORT.value+"?IAXCON_HOMEDIR=/themes&";
			reporteExisteJasper =true;
		}
		
    	  //inputs...
        var inputs=document.getElementsByTagName("input");
        var k=0;
        for (k=0;k<inputs.length;k++) {
            if (inputs[k].name.indexOf("PARAMETRO__")==0) {
                var nombre = inputs[k].name;
                var nombre2=nombre.replace("PARAMETRO__", "");
                //PFINICIO_MODIFVISIBLE
                var valor=escape(inputs[k].value);
                var tipoParam = nombre;
                
                if(tipoParam.includes("MODIFVISIBLE")==false){
                	
                	 var elemento = document.getElementById(tipoParam);
                     if (elemento!=null&& valor!=''){
                         var param = elemento.value;
                      //   urlJasper=urlJasper+inputs[k].name+"="+escape(inputs[k].value) + "&" + tipoParam+ "=" + escape(param);
                         urlJasper=urlJasper+nombre2+"="+valor+"&";
                      //   console.log("urlJaspermod="+urlJasper+nombre2+"="+valor+"&");
                     /*    console.log("nombre="+nombre.replace("PARAMETRO__", ""));
                            */
                         
                       
                  
                     }else{
                         urlAnnex=urlAnnex+"&"+inputs[k].name+"="+escape(inputs[k].value);
                         /*console.log("inputs[k].name="+inputs[k].name);
                         console.log("escape(inputs[k].value="+escape(inputs[k].value));
                         */
                     }
                }  
            }
        }
        
        
        //selects
        var selects=document.getElementsByTagName("select");
        var s=0;
        for (s=0;s<selects.length;s++) {
            if (selects[s].name.indexOf("PARAMETRO__")==0) {
              var nombre=selects[s].name;
              var valor = selects[s].value;
              var tipoParam = "T" + nombre;
              
              var nombre2=nombre.replace("PARAMETRO__", "");  
              var valor=selects[s].value;
              
              var elemento = document.getElementById(tipoParam);
              if (elemento!=null ){
                    var param = elemento.value;
                    console.log("nombre2="+nombre2);
                    console.log("valor="+valor);
                    urlJasper=urlJasper+nombre2+"="+valor+"&";
                   // urlAnnex=urlAnnex+"&"+nombre+"="+escape(valor) + "&" + tipoParam+ "=" + escape(param);
               }else{
                    urlAnnex=urlAnnex+"&"+nombre+"="+escape(valor);
               }
            }
        }
        
               
        urlJasper=urlJasper.slice(0,-1);
       
    	//console.log("LLamar reporte Jasper="+document.miForm.CLISTADO.value );
    	//console.log("urlJasper="+urlJasper);
    	if (reporteExisteJasper ==true){
    		    	
    		//objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", 'Cargando', "inline");   		
    		  	
    	console.log(urlJasper)
    		window.location.replace(urlJasper);
    		
    		//loadDoc_2(urlJasper);
    		
    	//window.location.replace(urlJasper);	

    		//loadDoc(urlJasper);
    		
    		
    	    
    		
    	//var url =window.location.replace(urlJasper);
    	    /* $.ajax(url,
    	      {
    	    	 Status: {
    	        400: function() {
    	        	hideLoader();
    	        }
    	      }
    	   });*/
    	      
    	   
    	 /*function getStatus(urlJasper) {
    	    	    var request = new XMLHttpRequest();
    	    	request.onreadystatechange = function() {
    	    	    if (request.readyState === 4){
    	    	       // request.status;//this contains the status code
    	    	       //if(request.status === 200)
    	    	    	   hideLoader();
    	    	       alert(request.status)
    	    	    }
    	    	};
    	    	request.open("GET", urlJasper , true);
    	    	request.send(null);
    	    	}
    	   
    	   /*$.ajax({        
    		    url: urlJasper , crossDomain: true,
    		   type:"GET",
    		   		headers: {
    	              "Access-Control-Allow-Origin":"*"
    	          },
    		    success: function (resp) {
    		    	hideLoader();
    		    }
    		});*/
    		
    	      
    	      
    		//objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", 'Se inicio la descarga de su reporte...', "inline");
    		//window.location.replace(urlJasper);	
    		//hideLoader();
    	}else {
    		alert("Este reporte no se encuentra disponible en Jasper Server");
    	}    	
    }
    if (ths.id=='but_ejecutar_batch') {
        //queremos generacion
        ACCION=ACCION+",BATCH";
     
        //inputs...
        var inputs=document.getElementsByTagName("input");
        var k=0;
        for (k=0;k<inputs.length;k++) {
            if (inputs[k].name.indexOf("PARAMETRO__")==0) {
                var nombre = inputs[k].name;
                var tipoParam = "T" + nombre;
                var elemento = document.getElementById(tipoParam);
                if (elemento!=null){
                    var param = elemento.value;
                    urlAnnex=urlAnnex+"&"+inputs[k].name+"="+escape(inputs[k].value) + "&" + tipoParam+ "=" + escape(param);
                }else{
                    urlAnnex=urlAnnex+"&"+inputs[k].name+"="+escape(inputs[k].value);
                }
            }
        }
        //selects
        var selects=document.getElementsByTagName("select");
        var s=0;
        for (s=0;s<selects.length;s++) {
            if (selects[s].name.indexOf("PARAMETRO__")==0) {
              var nombre=selects[s].name;
              var valor = selects[s].value;
              var tipoParam = "T" + nombre;
              var elemento = document.getElementById(tipoParam);
              if (elemento!=null){
                    var param = elemento.value;
                    urlAnnex=urlAnnex+"&"+nombre+"="+escape(valor) + "&" + tipoParam+ "=" + escape(param);
               }else{
                    urlAnnex=urlAnnex+"&"+nombre+"="+escape(valor);
               }
            }
        }
        var url="axis_axislist003.do?ACCION="+escape(ACCION)+"&operation=miajaxjson&CEMPRES="+document.miForm.CEMPRES.value+"&CMODO="+document.miForm.CMODO.value+"&SPRODUC="+document.miForm.SPRODUC.value + "&CMAP="+document.miForm.CLISTADO.value +"&CEXPORT="+document.miForm.CEXPORT.value + "&CIDIOMA=" + document.miForm.CIDIOMA.value+ "&CEMAIL=" + document.miForm.CEMAIL.value + "&CHECKREC=" + document.miForm.CHECKREC.value;
        url=url+urlAnnex;
       /* jQuery.ajax({
            url: url,
            dataType: 'json',
            success: callBack_miajaxjson
                
        });*/
         objAjax.invokeAsyncCGI_JSON(url, callBack_miajaxjson, "<axis:alt f="axislist004" c="MSG_CARGAR" lit="9905686"/>")   
    } 
    if (ths.id=='but_ejecutar_ulea') {
        //queremos generacion
        ACCION=ACCION+",ULEA";
     
        //inputs...
        var inputs=document.getElementsByTagName("input");
        var k=0;
        for (k=0;k<inputs.length;k++) {
            if (inputs[k].name.indexOf("PARAMETRO__")==0) {
                var nombre = inputs[k].name;
                var tipoParam = "T" + nombre;
                var elemento = document.getElementById(tipoParam);
                if (elemento!=null){
                    var param = elemento.value;
                    urlAnnex=urlAnnex+"&"+inputs[k].name+"="+escape(inputs[k].value) + "&" + tipoParam+ "=" + escape(param);
                }else{
                    urlAnnex=urlAnnex+"&"+inputs[k].name+"="+escape(inputs[k].value);
                }
            }
        }
        //selects
        var selects=document.getElementsByTagName("select");
        var s=0;
        for (s=0;s<selects.length;s++) {
            if (selects[s].name.indexOf("PARAMETRO__")==0) {
              var nombre=selects[s].name;
              var valor = selects[s].value;
              var tipoParam = "T" + nombre;
              var elemento = document.getElementById(tipoParam);
              if (elemento!=null){
                    var param = elemento.value;
                    urlAnnex=urlAnnex+"&"+nombre+"="+escape(valor) + "&" + tipoParam+ "=" + escape(param);
               }else{
                    urlAnnex=urlAnnex+"&"+nombre+"="+escape(valor);
               }
            }
        }
        var url="axis_axislist003.do?ACCION="+escape(ACCION)+"&operation=ejecutarulea&CEMPRES="+document.miForm.CEMPRES.value+"&CMODO="+document.miForm.CMODO.value+"&SPRODUC="+document.miForm.SPRODUC.value + "&CMAP="+document.miForm.CLISTADO.value +"&CEXPORT="+document.miForm.CEXPORT.value + "&CIDIOMA=" + document.miForm.CIDIOMA.value+ "&CEMAIL=" + document.miForm.CEMAIL.value + "&CHECKREC=" + document.miForm.CHECKREC.value;
        url=url+urlAnnex;
       /* jQuery.ajax({
            url: url,
            dataType: 'json',
            success: callBack_miajaxjson
                
        });*/
           
        
      objUtiles.abrirModal("axisimprimir", "src", url,700,50);
         //objAjax.invokeAsyncCGI_JSON(url, callBack_miajaxjson, "<axis:alt f="axislist004" c="MSG_CARGAR" lit="9905686"/>")   
    }
    if (ths.id=='but_CierreDeSiniestros') {
        //queremos generacion
        ACCION=ACCION+",CIERRESIN";
     
        //inputs...
        var inputs=document.getElementsByTagName("input");
        var k=0;
        for (k=0;k<inputs.length;k++) {
            if (inputs[k].name.indexOf("PARAMETRO__")==0) {
                var nombre = inputs[k].name;
                var tipoParam = "T" + nombre;
                var elemento = document.getElementById(tipoParam);
                if (elemento!=null){
                    var param = elemento.value;
                    urlAnnex=urlAnnex+"&"+inputs[k].name+"="+escape(inputs[k].value) + "&" + tipoParam+ "=" + escape(param);
                }else{
                    urlAnnex=urlAnnex+"&"+inputs[k].name+"="+escape(inputs[k].value);
                }
            }
        }
        //selects
        var selects=document.getElementsByTagName("select");
        var s=0;
        for (s=0;s<selects.length;s++) {
            if (selects[s].name.indexOf("PARAMETRO__")==0) {
              var nombre=selects[s].name;
              var valor = selects[s].value;
              var tipoParam = "T" + nombre;
              var elemento = document.getElementById(tipoParam);
              if (elemento!=null){
                    var param = elemento.value;
                    urlAnnex=urlAnnex+"&"+nombre+"="+escape(valor) + "&" + tipoParam+ "=" + escape(param);
               }else{
                    urlAnnex=urlAnnex+"&"+nombre+"="+escape(valor);
               }
            }
        }
        var url="axis_axislist003.do?ACCION="+escape(ACCION)+"&operation=ejetcutarcierresin&CEMPRES="+document.miForm.CEMPRES.value+"&CMODO="+document.miForm.CMODO.value+"&SPRODUC="+document.miForm.SPRODUC.value + "&CMAP="+document.miForm.CLISTADO.value +"&CEXPORT="+document.miForm.CEXPORT.value + "&CIDIOMA=" + document.miForm.CIDIOMA.value+ "&CEMAIL=" + document.miForm.CEMAIL.value + "&CHECKREC=" + document.miForm.CHECKREC.value;
        url=url+urlAnnex;
       /* jQuery.ajax({
            url: url,
            dataType: 'json',
            success: callBack_miajaxjson
                
        });*/
           
        
      objUtiles.abrirModal("axisimprimir", "src", url,700,50);
         //objAjax.invokeAsyncCGI_JSON(url, callBack_miajaxjson, "<axis:alt f="axislist004" c="MSG_CARGAR" lit="9905686"/>")   
    }
    if (ths.id=='CEMPRES') {
        //queremos listados
        ACCION=ACCION+",AREAS";
        var url="axis_axislist003.do?ACCION="+escape(ACCION)+"&operation=miajaxjson&CEMPRES="+document.miForm.CEMPRES.value+"&CMODO="+document.miForm.CMODO.value+"&SPRODUC="+document.miForm.SPRODUC.value
        jQuery.ajax({
            url: url,
            dataType: 'json',
            success: callBack_miajaxjson
        });
    }
     if (ths.id=='CAREA') {
        //queremos listados        
        ACCION=ACCION+",LISTADOS"; //LISTADOS
        var indice = document.miForm.CAREA.value;        
        var url="axis_axislist003.do?ACCION="+escape(ACCION)+"&operation=miajaxjson&CAREA="+document.miForm.CAREA.value+"&CEMPRES="+document.miForm.CEMPRES.value+"&CMODO="+document.miForm.CMODO.value+"&SPRODUC="+document.miForm.SPRODUC.value
        jQuery.ajax({
            url: url,
            dataType: 'json',
            success: callBack_miajaxjson
        });
    }
     if (ths.id=='CLISTADO') {
        //queremos lista de parametros y tiposde 
        ACCION=ACCION+",DETALLE_LISTADO";
        var REPORTE = $.get("REPORTE");
        if(REPORTE != null && REPORTE != "undefined"){
        	document.miForm.CLISTADO.value = REPORTE;
        	$("CLISTADO").prop('disabled', true);
        } 

        var indice = document.miForm.CLISTADO.selectedIndex;
        
        document.getElementById('CHECKREC').value = 0;
        document.getElementById('CHECKREC').checked=false;
        if ( document.miForm.CGENREC.options[indice].value == "0" || document.miForm.CGENREC.options[indice].value == null) {
          document.getElementById('CHECKREC').style.display = "none";
          document.getElementById('CHECKREC_LIT').style.display = "none";
        }
        else {
          document.getElementById('CHECKREC').style.display = "initial";
          document.getElementById('CHECKREC_LIT').style.display = "initial";
        }
        var url="axis_axislist003.do?ACCION="+escape(ACCION)+"&operation=miajaxjson&CLISTADO="+document.miForm.CLISTADO.value+"&CEMPRES="+document.miForm.CEMPRES.value+"&SPRODUC="+document.miForm.SPRODUC.value +"&CMODO="+document.miForm.CMODO.value + "&CMAP=" + document.miForm.CLISTADO.value + "&CGENREC=" + document.miForm.CGENREC.options[indice].value;
        jQuery.ajax({
            url: url,
            dataType: 'json',
            success: callBack_miajaxjson

        });
    }
     setTimeout(function(){ 
    	  	     f_set_initial_none();
     }, 1000);
    
} 


function callBack_miajaxjson(p) {
   var campoMultiple;
   objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
   
  if (p.JSON2.ACCION.indexOf("EJECUTAR")>=0) {
    //hay que actualizar la lista de resulotados xxx
    var odiv_OBFICHERO=document.getElementById("div_OBFICHERO");
    odiv_OBFICHERO.innerHTML="";
    var div_OBFICHEROcontenido="";
    div_OBFICHEROcontenido=div_OBFICHEROcontenido+"<table align=\"center\" class=\"dsptgtable\">";
	
	//Kaio tarea-4113
    if (p.JSON2.warning!=null) {
    	if (p.JSON2.warning.RETURN != null) {
    		//
    		alert('<axis:alt f="axislist003" c="EJECUTAR_VALIDACION" lit="89906317"/>' + '\n'+ p.JSON2.warning.RETURN);
    	}
    }//Fin Kaio tarea-4113

    if (p.JSON2.LIST_FICHEROS!=null) {
       if (p.JSON2.LIST_FICHEROS.MENSAJES!=null && p.JSON2.LIST_FICHEROS.MENSAJES.length>0) {
          var errmsg="<axis:alt c="EJECUTAR_ERROR" f="axislist003" lit="108953" />";
          for (var i=0;i<p.JSON2.LIST_FICHEROS.MENSAJES.length;i++) {
            var miMENSAJESitem=p.JSON2.LIST_FICHEROS.MENSAJES[i];
            errmsg=errmsg+"\n- "+miMENSAJESitem.OB_IAX_MENSAJES.TERROR;
          }
             alert(errmsg);
        }else{
           div_OBFICHEROcontenido=div_OBFICHEROcontenido+"<tr><td><a href=\"javascript:f_imprimir_fitxer()\">"+p.JSON2.LIST_FICHEROS.ONOMFICHERO+"</a><input type=\"hidden\"   name=\"SORTIDA"+"\" id=\"SORTIDA"+"\" value=\""+p.JSON2.LIST_FICHEROS.OFICHERO+"\"/> </td></tr> ";
           div_OBFICHEROcontenido=div_OBFICHEROcontenido+"</table>";
           odiv_OBFICHERO.innerHTML=div_OBFICHEROcontenido;
        }
    }
  }
  
if (p.JSON2.ACCION.indexOf("BATCH")>=0) {
    //hay que actualizar la lista de resulotados xxx
    var odiv_OBFICHERO=document.getElementById("div_OBFICHERO");
    odiv_OBFICHERO.innerHTML="";
    var div_OBFICHEROcontenido="";
    div_OBFICHEROcontenido=div_OBFICHEROcontenido+"<table align=\"center\" class=\"dsptgtable\">";

    if (p.JSON2.LIST_FICHEROS!=null) {
       if (p.JSON2.LIST_FICHEROS.MENSAJES!=null && p.JSON2.LIST_FICHEROS.MENSAJES.length>0) {
          var errmsg="<axis:alt c="EJECUTAR_ERROR" f="axislist003" lit="9905673" />";
          for (var i=0;i<p.JSON2.LIST_FICHEROS.MENSAJES.length;i++) {
            var miMENSAJESitem=p.JSON2.LIST_FICHEROS.MENSAJES[i];
            errmsg=errmsg+"\n- "+miMENSAJESitem.OB_IAX_MENSAJES.TERROR;
          }
             alert(errmsg);
        }else{
           div_OBFICHEROcontenido=div_OBFICHEROcontenido+"<tr><td><a href=\"javascript:f_imprimir_fitxer()\">"+p.JSON2.LIST_FICHEROS.ONOMFICHERO+"</a><input type=\"hidden\"   name=\"SORTIDA"+"\" id=\"SORTIDA"+"\" value=\""+p.JSON2.LIST_FICHEROS.OFICHERO+"\"/> </td></tr> ";
           div_OBFICHEROcontenido=div_OBFICHEROcontenido+"</table>";
           odiv_OBFICHERO.innerHTML=div_OBFICHEROcontenido;
        }
    }
  }  
document.getElementById("but_ejecutar_ulea").style.display ="none";
if(document.miForm.CLISTADO.value=="Cargue_masivo_ULEA"){
	document.getElementById("but_ejecutar_ulea").style.display ="";
}
document.getElementById("but_CierreDeSiniestros").style.display ="none";
if(document.miForm.CLISTADO.value=="CierreDeSiniestros"){
	document.getElementById("but_CierreDeSiniestros").style.display ="";
}

  if (p.JSON2.ACCION.indexOf("LISTADOS")>=0) {
    //hay que actualizar LISTADOS, limpiar EXPORT, y parametros
    var odiv_OBFICHERO=document.getElementById("div_OBFICHERO");
    odiv_OBFICHERO.innerHTML="";
    var oCLISTADO=document.getElementById("CLISTADO");
    oCLISTADO.length=0;
    var oCGENREC=document.getElementById("CGENREC");
    oCGENREC.length=0;
    var oCEXPORT=document.getElementById("CEXPORT");
    oCEXPORT.length=0;
    var oCIDIOMA=document.getElementById("CIDIOMA");
    oCIDIOMA.length=0;
    var oDSP_PARAMS_WRAPPER=document.getElementById("DSP_PARAMS_WRAPPER");
    oDSP_PARAMS_WRAPPER.innerHTML="";
   
    //cargar LISTADOS
    var LISTADOS=p.JSON2.LISTADOS;
    if (LISTADOS!=null) {
            var j=0;
            if (p.JSON2.LISTADOS.PCURCONFIGSINF!=null){
                 for (j=0;j<p.JSON2.LISTADOS.PCURCONFIGSINF.length;j++) {
                    oCLISTADO.options[oCLISTADO.options.length]=new Option( LISTADOS.PCURCONFIGSINF[j].TLITERA, LISTADOS.PCURCONFIGSINF[j].CMAP );
                    oCGENREC.options[oCGENREC.options.length]=new Option(LISTADOS.PCURCONFIGSINF[j].CMAP, LISTADOS.PCURCONFIGSINF[j].CGENREC );
                 }
            }     
     }    
    
    //al final, llamar al 1er de CLISTADO, para cargar la lista de params , export exports, e idiomas
    f_onchange(oCLISTADO);
  }
  if (p.JSON2.ACCION.indexOf("AREAS")>=0) {
    //hay que actualizar LISTADOS, limpiar EXPORT, y parametros    
    var oCAREA=document.getElementById("CAREA");
    oCAREA.length=0;    
    //cargar LISTADOS
    var AREAS=p.JSON2.AREAS;
    if (AREAS!=null) {    		
            var j=0;
            if (p.JSON2.AREAS.RETURN !=null){            
                 for (j=0;j<p.JSON2.AREAS.RETURN.length;j++) {                   
                    oCAREA.options[oCAREA.options.length]=new Option( AREAS.RETURN[j].TATRIBU, AREAS.RETURN[j].CATRIBU );
                   //oCGENREC.options[oCGENREC.options.length]=new Option(LISTADOS.PCURCONFIGSINF[j].CMAP, LISTADOS.PCURCONFIGSINF[j].CGENREC );
                 }
            }     
     }    
    
    //al final, llamar al 1er de CLISTADO, para cargar la lista de params , export exports, e idiomas
    f_onchange(oCAREA);
  }
  if (p.JSON2.ACCION.indexOf("DETALLE_LISTADO")>=0) {
    //limpiar EXPORT, y actualizarlo, y parametros
    var odiv_OBFICHERO=document.getElementById("div_OBFICHERO");
    odiv_OBFICHERO.innerHTML="";
    var oCEXPORT=document.getElementById("CEXPORT");
    oCEXPORT.length=0;
    var oCIDIOMA=document.getElementById("CIDIOMA");
    oCIDIOMA.length=0;    
    var oDSP_PARAMS_WRAPPER=document.getElementById("DSP_PARAMS_WRAPPER");
    oDSP_PARAMS_WRAPPER.innerHTML="";
    var EXPORTOPTIONS=p.JSON2.EXPORTOPTIONS;
    if (EXPORTOPTIONS!=null && EXPORTOPTIONS.length>0){
        var exportacions = EXPORTOPTIONS[0].LEXPORT;
        if (exportacions!=null){
            var EXPORTOPTIONSs=exportacions.split("|");
            var j=0;
            for (j=0;j<EXPORTOPTIONSs.length;j++) {
                oCEXPORT.options[oCEXPORT.options.length]=new Option( EXPORTOPTIONSs[j], EXPORTOPTIONSs[j] );
            }
        }    
    }    
    //Cargo los idiomas definidos para el report
    var IDOMASOPTIONS=p.JSON2.IDIOMAS;
    if (IDOMASOPTIONS!=null && IDOMASOPTIONS.length>0){
        var j=0;
        for (j=0;j<IDOMASOPTIONS.length;j++) {
            oCIDIOMA.options[oCIDIOMA.options.length]=new Option( IDOMASOPTIONS[j].TIDIOMA, IDOMASOPTIONS[j].CIDIOMA );
        }
    }       
    
//crear DSP_PARAMS_WRAPPER contenido
    var DSP_PARAMS_WRAPPERcontenido="";
    DSP_PARAMS_WRAPPERcontenido=DSP_PARAMS_WRAPPERcontenido+"<table class=\"area\" id=\"DSP_PARAMS_PARAMS\" align=\"center\"><tr><th style=\"width:30%;height:0px\"></th><th style=\"width:70%;height:0px\"></th></tr>\n";
    var PARAMETROS=p.JSON2.PARAMETROS;
    var fechas="";
    if (PARAMETROS!=null) {
        var j=0;
        var campotexto_ob="";
        var styleav="";
        var formatoav="";
        var formatoentero ="";
        var obligatoriotrue="";//obligatorio="true"
        for (j=0;j<PARAMETROS.length;j++) {
            if (PARAMETROS[j].LVALOR!=null){
                if (PARAMETROS[j].LVALOR.indexOf("SELECT:")==0){
                    if (PARAMETROS[j].CONSULTA!=null){
                        if (PARAMETROS[j].CONSULTA.MENSAJES!=null){
                            var errmsg="<axis:alt c="EJECUTAR_ERROR" f="axislist003" lit="108953" />";
                            for (var p=0;p<PARAMETROS[j].CONSULTA.MENSAJES.length;p++) {
                                var miMENSAJESitem=PARAMETROS[j].CONSULTA.MENSAJES[p];
                                errmsg=errmsg+"\n- "+miMENSAJESitem.OB_IAX_MENSAJES.TERROR;
                            }
                            alert(errmsg);
                        
                        }
                     }   
                  }   
            }
            
            DSP_PARAMS_WRAPPERcontenido=DSP_PARAMS_WRAPPERcontenido+"<tr><td class=\"titulocaja\" style=\"text-align:right\">";
            DSP_PARAMS_WRAPPERcontenido=DSP_PARAMS_WRAPPERcontenido+"<b label=\"label_"+PARAMETROS[j].TPARAM+"\" id=\"label_"+PARAMETROS[j].TPARAM+"\">"+PARAMETROS[j].TLITERA+" </b>";
            DSP_PARAMS_WRAPPERcontenido=DSP_PARAMS_WRAPPERcontenido+"</td><td class=\"campocaja\">";
            campotexto_ob="";
            styleav="";
            obligatoriotrue="";
             formatoentero ="";
            formatoav="";//formato="fecha"
            if (PARAMETROS[j].NOTNULL!=null && PARAMETROS[j].NOTNULL=="1") {
                campotexto_ob="campotexto_ob";
                obligatoriotrue="obligatorio=\"true\"";
            }
            if (PARAMETROS[j].CTIPO=="3") { //fecha!
                styleav="style=\"width:60px\"";
                formatoav="formato=\"fecha\"";
            } 
            if (PARAMETROS[j].CTIPO=="2") { //Numerio!
                styleav="style=\"width:150px\"";
                formatoav="formato=\"decimal\"";
            } 
            if(PARAMETROS[j].CTIPO=="4"){
            	styleav="style=\"width:150px\"";
            }
            if(PARAMETROS[j].TPARAM=="P_AGENTE"||PARAMETROS[j].TPARAM=="P_NIT"){
            	formatoav="";
            }
            if (PARAMETROS[j].CTIPO=="9") { //Seleccion Multiple
                   DSP_PARAMS_WRAPPERcontenido=DSP_PARAMS_WRAPPERcontenido+"<select "+obligatoriotrue+"  multiple='multiple' title=\""+PARAMETROS[j].TPARAM+"\" alt=\""+PARAMETROS[j].TPARAM+"\" name=\"PARAMETRO__"+PARAMETROS[j].TPARAM+"\" id=\"PARAMETRO__"+PARAMETROS[j].TPARAM+"\"  class=\"campowidthselect\"><option value=\"\"></option>\n";
                if (PARAMETROS[j].LVALOR.indexOf("SELECT:")==0) {
                       
                            var listaSelects1 =  PARAMETROS[j].CONSULTA.OLIST; 
                            var l1=0;
                            for (l1=0;l1<listaSelects1.length;l1++) {
                                var descripcion1 =  listaSelects1[l1].D;
                                var valor1 = listaSelects1[l1].V;
                                DSP_PARAMS_WRAPPERcontenido=DSP_PARAMS_WRAPPERcontenido+"<option value=\""+valor1+"\">"+descripcion1+"</option>\n";
                                
                            }
                            campoMultiple= "PARAMETRO__"+PARAMETROS[j].TPARAM;
                            DSP_PARAMS_WRAPPERcontenido=DSP_PARAMS_WRAPPERcontenido+"</select>\n"; 
                   
                    }
            
            }else{
            if (PARAMETROS[j].LVALOR!=null && PARAMETROS[j].LVALOR.length>0) {
                //lista!
                DSP_PARAMS_WRAPPERcontenido=DSP_PARAMS_WRAPPERcontenido+"<select "+obligatoriotrue+" title=\""+PARAMETROS[j].TPARAM+"\" alt=\""+PARAMETROS[j].TPARAM+"\" name=\"PARAMETRO__"+PARAMETROS[j].TPARAM+"\" id=\"PARAMETRO__"+PARAMETROS[j].TPARAM+"\"  class=\"campo "+campotexto_ob+"\"><option value=\"\"></option>\n";
                if (PARAMETROS[j].LVALOR.indexOf("LISTA:")==0) {
                    var parejas=PARAMETROS[j].LVALOR.substring(6).split("|");
                    var V="";
                    var D="";
                    var k=0;
                    var tempP="";
                    
                    for (k=0;k<parejas.length;k++) {
                        tempP=parejas[k];
                        tempP=tempP.substring("V:".length); //quitarmos la marca "V:"
                        
                        if (tempP.indexOf(",D:")>0) { //miramos si hay un "D:"
                            //hay una D:, asi hay que parsear por Valor y Descrpcion
                            V=tempP.substring(0, tempP.indexOf(",D:"));
                            D=tempP.substring(tempP.indexOf(",D:")+3);
                            if (D==null||D.length==0) {
                                D=V;
                            }
                        }
                        else {
                            //no hay D:, asi que solo hay Valor, y como Descrpcion informamos el Valor
                            V=tempP;
                            D=V;
                        }
                        DSP_PARAMS_WRAPPERcontenido=DSP_PARAMS_WRAPPERcontenido+"<option value=\""+V+"\">"+D+"</option>\n";
                    }
                } else{
                    
                    
                    if (PARAMETROS[j].LVALOR.indexOf("SELECT:")==0) {
                            var listaSelects =  PARAMETROS[j].CONSULTA.OLIST;
                            var l;
                            for (l=0;l<listaSelects.length;l++){
                                var descripcion =  listaSelects[l].D;
                                var valor = listaSelects[l].V;
                                DSP_PARAMS_WRAPPERcontenido=DSP_PARAMS_WRAPPERcontenido+"<option value=\""+valor+"\">"+descripcion+"</option>\n";
                            }
                
                   }
                }
                DSP_PARAMS_WRAPPERcontenido=DSP_PARAMS_WRAPPERcontenido+"</select>\n";
            } 
            else {
                if (PARAMETROS[j].CTIPO=="2") { 
                   DSP_PARAMS_WRAPPERcontenido=DSP_PARAMS_WRAPPERcontenido+"<input "+formatoav+" "+obligatoriotrue+" "+styleav+" title=\""+PARAMETROS[j].TPARAM+"\" alt=\""+PARAMETROS[j].TPARAM+"\" type=\"text\" name=\"PARAMETRO__"+PARAMETROS[j].TPARAM+"\" id=\"PARAMETRO__"+PARAMETROS[j].TPARAM+"\" value=\"\" class=\"campo "+campotexto_ob+"\"" + "onkeypress=\"return ValidNum(event);\" />";
                     
                }else if (PARAMETROS[j].CTIPO=="4"){
                	DSP_PARAMS_WRAPPERcontenido=DSP_PARAMS_WRAPPERcontenido+"<input "+formatoav+" "+obligatoriotrue+" "+styleav+" title=\""+PARAMETROS[j].TPARAM+"\" alt=\""+PARAMETROS[j].TPARAM+"\" type=\"radio\" id=\"PARAMETRO_0\"  name=\"PARAMETRO__"+PARAMETROS[j].TPARAM+"\"value=\"0\" class=\"campo "+campotexto_ob+"\"" + "onchange=\"OnRadio('0');\" /><b label=\"label_"+PARAMETROS[j].TPARAM+"\">Intermediario</b>";
                	DSP_PARAMS_WRAPPERcontenido=DSP_PARAMS_WRAPPERcontenido+"<input "+formatoav+" "+obligatoriotrue+" "+styleav+" title=\""+PARAMETROS[j].TPARAM+"\" alt=\""+PARAMETROS[j].TPARAM+"\" type=\"radio\" id=\"PARAMETRO_1\" name=\"PARAMETRO__"+PARAMETROS[j].TPARAM+"\"value=\"1\" class=\"campo "+campotexto_ob+"\"" + "onchange=\"OnRadio('1');\" />";
                }
                else
                {
                    DSP_PARAMS_WRAPPERcontenido=DSP_PARAMS_WRAPPERcontenido+"<input "+formatoav+" "+formatoentero+" "+obligatoriotrue+" "+styleav+" title=\""+PARAMETROS[j].TPARAM+"\" alt=\""+PARAMETROS[j].TPARAM+"\" type=\"text\" name=\"PARAMETRO__"+PARAMETROS[j].TPARAM+"\" id=\"PARAMETRO__"+PARAMETROS[j].TPARAM+"\" value=\"\" class=\"campo "+campotexto_ob+"\" />";
                }
               
                 
            }
            }
            //TODO: pendiente controlar fechas bien
            if (PARAMETROS[j].CTIPO=="3" && PARAMETROS[j].LVALOR==null) { //fecha!
                DSP_PARAMS_WRAPPERcontenido=DSP_PARAMS_WRAPPERcontenido+"<a id=\"icon_PARAMETRO__"+PARAMETROS[j].TPARAM+"\" style=\"vertical-align:middle;\"><img src=\"images/calendar.gif\"/></a> (dd/MM/yyyy) \n";            
                if (fechas.length>0) fechas=fechas+",";
                fechas=fechas+PARAMETROS[j].TPARAM;
            }            
            


            DSP_PARAMS_WRAPPERcontenido=DSP_PARAMS_WRAPPERcontenido+"</td>"
            //Ahora faltan los hiddens de los parametros con el tipo del parametro
            if (PARAMETROS[j].LVALOR!=null && PARAMETROS[j].LVALOR.length>0) {  
                DSP_PARAMS_WRAPPERcontenido=DSP_PARAMS_WRAPPERcontenido+"<input type=\"hidden\"   name=\"TPARAMETRO__"+PARAMETROS[j].TPARAM+"\" id=\"TPARAMETRO__"+PARAMETROS[j].TPARAM+"\" value=\"1\" /> </td>"             
             }else{
                DSP_PARAMS_WRAPPERcontenido=DSP_PARAMS_WRAPPERcontenido+"<input type=\"hidden\"   name=\"TPARAMETRO__"+PARAMETROS[j].TPARAM+"\" id=\"TPARAMETRO__"+PARAMETROS[j].TPARAM+"\" value=\""+PARAMETROS[j].CTIPO + "\" /> </td>"             
             }
             DSP_PARAMS_WRAPPERcontenido=DSP_PARAMS_WRAPPERcontenido+"</tr>";
        }
    }
    
    DSP_PARAMS_WRAPPERcontenido=DSP_PARAMS_WRAPPERcontenido+"</table>\n";
    oDSP_PARAMS_WRAPPER.innerHTML=DSP_PARAMS_WRAPPERcontenido;
    //despues de crear posibles Calendars, hay q inicializarlas
    //TODO: pendiente controlar fechas bien
    var fechasItems=fechas.split(",");
    var m=0;
    var jsonS="";
    for (m=0;m<fechasItems.length;m++) {
        jsonS="{ \"inputField\"  : \"PARAMETRO__"+fechasItems[m]+"\",     \"ifFormat\"    : \"%d/%m/%Y\",      \"button\"      : \"icon_PARAMETRO__"+fechasItems[m]+"\",   \"singleClick\" : true, \"firstDay\"    : 1 }";
        Calendar.setup(JSON.parse(jsonS));
    }
    
    f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
    
             $(document).ready(function(){  
            $('#'+campoMultiple).tokenize({displayDropdownOnFocus : true,
                                       nbDropdownElements: 3000});
            $('.TokensContainer').css("width", "450px");
        });   
    
  }
  
  var REPORTE = $.get("REPORTE");
  if(REPORTE != null && REPORTE != "undefined"){
  	var id = $.get("ID_ACUERDO_PAGO");
      $("#PARAMETRO__ID_ACUERDO_PRIMA").val(id);
      $("#PARAMETRO__ID_ACUERDO_PRIMA").prop('disabled', true);
 } 
}    


        </script>
</head>
<body onload="f_onload()">

	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisimprimir|<axis:alt
				f="axislist003" c="TIT_AXISIMPRIMIR" lit="1000205" />|true</c:param>
	</c:import>

	<form name="miForm" action="" method="POST"
		<%if (",ULEA".equals(request.getParameter("ACCION"))) {%>
		style="display: none;" <%}%>>

		<c:import url="../include/titulo_nt.jsp">
			<c:param name="titulo">
				<b><axis:alt f="axislist003" c="TITULO_FORM" lit="9000745" /></b>
			</c:param>
			<c:param name="formulario">
				<b><axis:alt f="axislist003" c="TITULO_FORM" lit="9000745" /></b>
			</c:param>
			<c:param name="form">axislist003</c:param>
		</c:import>

		<input type="hidden" name="operation" value="" />
		<!-- <input type="hidden" id="CIDIOMA" name="CIDIOMA"  value="${__formdata.CIDIOMA}"/>-->
		<input type="hidden" id="SPRODUC" name="SPRODUC"
			value="${__formdata.SPRODUC}" /> <input type="hidden" id="CMODO"
			name="CMODO" value="${__formdata.CMODO}" />


		<table class="mainTableDimensions base" align="center" cellpadding="0"
			cellspacing="0" style="height: 30px">
			<tr>
				<td>
					<table class="seccion" align="center">
						<tr>
							<td>


								<table class="area" align="center">
									<tr>
										<th style="width: 20%; height: 0px"></th>
										<th style="width: 25%; height: 0px"></th>
										<th style="width: 35%; height: 0px"></th>
										<th style="width: 0%; height: 0px"></th>
										<th style="width: 10%; height: 0px"></th>
										<th style="width: 20%; height: 0px"></th>
									</tr>
									<tr>
										<td colspan="4">
											<div class="titulo">
												<img src="images/flecha.gif" /><b><axis:alt
														f="axislist003" c="TIT_LISTADOS" lit="1000178" /> </b>
											</div>
											<div class="separador">&nbsp;</div>
										</td>
									</tr>
									<tr>
										<td class="titulocaja" id="tit_CEMPRES"><b
											label="label_CEMPRES"><axis:alt f="axislist003"
													c="CEMPRES" lit="101619" /></b> <!--empresa--></td>
										<td class="titulocaja" id="tit_CAREA"><b
											label="label_CAREA"><axis:alt f="axislist003" c="CAREA"
													lit="9909317" /></b> <!--empresa--></td>
										<td class="titulocaja"><b id="label_CLISTADO"><axis:alt
													f="axislist003" c="CLISTADO" lit="9000745" /></b> <!-- listado -->
										</td>
										<td class="titulocaja"><b id="label_CGENREC"><axis:alt
													f="axislist003" c="CGENREC" lit="" /></b> <!-- listado --></td>
										<td class="titulocaja"><b id="label_CIDIOMA"><axis:alt
													f="axislist003" c="CIDIOMA" lit="100654" /></b> <!-- idioma report JR-->
										</td>
										<td class="titulocaja" id="tit_CEXPORT" colspan="2"><b
											label="label_CEXPORT"><axis:alt f="axislist003"
													c="CEXPORT" lit="9901613" /></b> <!--exportar como --></td>
									</tr>
									<tr>
										<td class="campocaja"><select name="CEMPRES" id="CEMPRES"
											paramMap="true" size="1" onchange="f_onchange(this)"
											class="campowidthinput campo campotexto"
											title="<axis:alt f="axislist003" c="CEMPRES" lit="101619"/>"
											<axis:atr f="axislist003" c="CEMPRES" a="modificable=true&isInputText=true&obligatorio=true"/>>
												<option value="<%=Integer.MIN_VALUE%>">-
													<axis:alt f="axislist003" c="SNV_COMBO" lit="108341" /> -
												</option>
												<c:forEach var="empresas" items="${EMPRESAS}">
													<option value="${empresas.CEMPRES}"
														<c:if test="${(!empty __formdata.CEMPRES)&& empresas.CEMPRES == __formdata.CEMPRES}"> selected </c:if>>
														${empresas.TEMPRES}</option>
												</c:forEach>
										</select></td>
										<td class="campocaja"><select name="CAREA" id="CAREA"
											size="1" onchange="f_onchange(this)"
											class="campowidthselect campo campotexto"
											title="<axis:alt f="axislist003" c="CAREA" lit="9000745"/>"
											<axis:atr f="axislist003" c="CAREA" a="modificable=true&obligatorio=true&isInputText=false"/>>
										</select></td>
										<td class="campocaja"><select name="CLISTADO"
											id="CLISTADO" size="1" onchange="f_onchange(this)"
											class="campowidthselect campo campotexto"
											title="<axis:alt f="axislist003" c="CLISTADO" lit="9000745"/>"
											<axis:atr f="axislist003" c="CLISTADO" a="modificable=true&obligatorio=true&isInputText=false"/>>
										</select></td>
										<td class="campocaja"><select name="CGENREC" id="CGENREC"
											size="1" onchange="" style="display: none" class="campotexto"
											title="<axis:alt f="axislist003" c="CGENREC" lit=""/>"
											<axis:atr f="axislist003" c="CGENREC" a="modificable=false&obligatorio=true&isInputText=false"/>>
										</select></td>
										<td class="campocaja"><select name="CIDIOMA" id="CIDIOMA"
											size="1" onchange=""
											class="campowidthselect campo campotexto"
											title="<axis:alt f="axislist003" c="CIDIOMA" lit="100622"/>"
											<axis:atr f="axislist003" c="CIDIOMA" a="modificable=true&obligatorio=true&isInputText=false"/>>
										</select></td>
										<td class="campocaja"><select name="CEXPORT" id="CEXPORT"
											size="1" onchange="f_onchange(this)"
											class="campowidthselect campo campotexto"
											title="<axis:alt f="axislist003" c="CEXPORT" lit="9901613"/>"
											<axis:atr f="axislist003" c="CEXPORT" a="modificable=true&isInputText=false&obligatorio=true"/>>
										</select></td>
									</tr>
									<tr>
										<axis:ocultar f="axislist006" c="CEMAIL">
											<td class="titulocaja"><b id="label_CEMAIL"><axis:alt
														f="axislist006" c="CEMAIL" lit="9905728" /></b></td>
										</axis:ocultar>
										<axis:ocultar f="axislist006" c="CCONFIRACION">
											<td class="titulocaja"><b id="label_CCONFIRMACION"><axis:alt
														f="axislist006" c="CCONFIRACION" lit="9905729" /></b></td>
										</axis:ocultar>
									</tr>
									<tr>
										<axis:ocultar f="axislist006" c="CEMAIL">
											<td class="campocaja"><input type="text" maxlength="100"
												class="campo campotexto" value="${__formdata.CEMAIL}"
												name="CEMAIL" id="CEMAIL"
												<axis:atr f="axislist006" c="CEMAIL"  a="modificable=true&isInputText=true"/> />
											</td>
										</axis:ocultar>
										<axis:ocultar f="axislist006" c="CCONFIRMACION">
											<td class="campocaja"><input type="text" maxlength="100"
												class="campo campotexto" value="${__formdata.CCONFIRMACION}"
												name="CCONFIRMACION" id="CCONFIRMACION"
												<axis:atr f="axislist006" c="CCONFIRMACION"  a="modificable=true&isInputText=true"/> />
											</td>
										</axis:ocultar>
									</tr>
									<tr>
										<td class="campocaja" style="text-align: left"><input
											type="button" class="boton" name="but_salir"
											value="<axis:alt f="axislist003" c="BUT_SALIR" lit="100000" />"
											onclick="f_but_salir()" /></td>
										<td class="campocaja" style="text-align: right" colspan="3">
											<input type="hidden" class="boton" name="but_ejecutar"
											id="but_ejecutar"
											value="<axis:alt f="axislist003" c="BUT_EJECUTAR" lit="9905618" />"
											onclick="f_but_ejecutar()" /> <input type="hidden"
											class="boton" name="but_ejecutar_batch"
											id="but_ejecutar_batch"
											value="<axis:alt f="axislist003" c="BUT_BATCH" lit="9905619" />"
											onclick="f_but_ejecuar_batch()" /> <input type="hidden"
											class="boton" name="but_ejecutar_ulea" id="but_ejecutar_ulea"
											value="<axis:alt f="axislist003" c="BUT_ULEA" lit="89907028" />"
											onclick="f_but_ejecuar_ulea()" /> <input type="hidden"
											class="boton" name="but_CierreDeSiniestros"
											id="but_CierreDeSiniestros"
											value="<axis:alt f="axislist003" c="BUT_CIERRE_SIN" lit="109006" />"
											onclick="f_but_CierreDeSiniestros()" />

											<button type="button" class="boton"
												id="but_llamarReporteJasper" name="but_llamarReporteJasper"
												onclick="f_llamarReporteJasper()">Generar</button>
										</td>
									</tr>
									<tr>
										<td class="campocaja" id="fichero" colspan="4">
											<div class="seccion displayspace" id="div_OBFICHERO"></div>
										</td>
									</tr>
								</table>

								<table class="area" id="DSP_PARAMS" align="center">
									<tr>
										<th style="width: 30%; height: 0px"></th>
										<th style="width: 70%; height: 0px"></th>
									</tr>
									<tr>
										<td colspan="2" id="TITULO_PARAMS">
											<div class="separador">&nbsp;</div>
											<div class="titulo">
												<img src="images/flecha.gif" /><b><axis:alt
														f="axislist003" c="TIT_PARAMS" lit="103694" /> </b>
											</div>
										</td>
									</tr>
									<!-- aqui se van a crear diamicamente los -->
								</table> <span id="DSP_PARAMS_WRAPPER"></span>
								<table class="area" align="center" style="width: 54%">
									<tr>
										<th style="width: 14%; height: 0px"></th>
									</tr>
									<tr>
										<axis:visible f="axislist003" c="CHK_CGENREC">
											<td class="titulocaja" style="text-align: left"
												id="CHECKREC_LIT"><b><axis:alt f="axislist003"
														c="CHECKREC" lit="9908521" /></b></td>
										</axis:visible>
										<axis:visible f="axislist003" c="CHK_CGENREC">
											<td><input type="checkbox" name="CHECKREC" id="CHECKREC"
												onclick="this.value = this.checked ? 1 : 0" /></td>
										</axis:visible>
									</tr>
								</table>

							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>


	</form>

	<c:import url="../include/mensajes.jsp" />

</body>
</html>