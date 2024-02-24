<%/* Revision:# ddDotI/r9XdZqvkUCcHfLA== # */%>
<%--
      NOMBRE:    axismnt017.jsp
      @author <a href = "mailto:autor@csi-ti.com">Javi del Rio</a>
      Fecha: 10/07/2012
      PROPÓSITO (descripción pantalla): 
      Ejemplo : Pantalla de Busqueda de pólizas
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        DD/MM/YYYY   XXX(iniciales)     1. Creación de la pantalla. Bug.9296
      2.0        DD/MM/YYYY   XXX(iniciales)     2. Ejemplo : Añadir funcionalidad Ramo - Producto . Bug.: XXXX
--%>

<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*" %>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        
        <!--Inicio Sólo si vamos a tener un campo fecha !-->
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
        <!-- fin Sólo si vamos a tener un campo fecha !-->
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
    function f_onload(){
            f_cargar_propiedades_pantalla();
           <axis:visible f="axismnt017"  c="CPAIS" >
                f_onchange_CPAIS();
           </axis:visible> 
		   
           
           /*******BArtoloINI
           if(objUtiles.estaVacio($('#CTIPCOM option:selected').val()))
           {
               $('#CTIPCOM option[value="0"]').attr("selected","selected");
           }
            BArtoloFIN*/
		   
            var addIndicadores = '${__formdata.addIndicadores}';
            if(addIndicadores == 'ok'){
                $('#addIndicadores').val('');
                var CCOMPANI = $('#CCOMPANI').val();
                objUtiles.abrirModal("axismnt022","src","modal_axismnt022.do?operation=form&CCOMPANI="+CCOMPANI);
            }
    }
      
           
             
    function f_but_cancelar() {
                parent.f_cerrar_modal('axismnt017');
    }
           
    function f_consultar_persona(SPERSON){
                if (!objUtiles.estaVacio(SPERSON))
                {
                    objUtiles.ejecutarFormulario("modal_axismnt017.do?SPERSON_CON="+SPERSON, "consulta_persona", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
    }         

    function f_abrir_axisper021 () {            
                 //objUtiles.abrirModal("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBPRIV");
                 objUtiles.abrirModal("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBLICAS");
    }
             
    function f_cerrar_axisper021(){
                f_cerrar_modalespersona("axisper021");
    }
    function f_cerrar_modalespersona(modal){
              objUtiles.cerrarModal(modal);
    } 
    function f_aceptar_persona(SPERSON,CAGENTE, SNIP, modal){
                f_cerrar_modalespersona(modal);
                var porigen = 'INT';
                if (modal =='axisper022')
                 porigen = 'NUEVO';
            
                var CCOMPANI = document.miForm.CCOMPANI.value;
            
                //document.miForm.ORIGEN.value = porigen;
                //document.miForm.SNIP.value = SNIP;
                
                //document.miForm.CAGENTE_VISIO.value = CAGENTE;
                if (!objUtiles.estaVacio(SPERSON)){
                    document.miForm.SPERSON.value = SPERSON;
                    objUtiles.ejecutarFormulario ("modal_axismnt017.do?CCOMPANI=null"+"&PAR_SPERSON="+SPERSON+"&CAGENTE="+CAGENTE, "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
                    //objAjax.invokeAsyncCGI("modal_axismnt017.do?SPERSON="+SPERSON, callbackAjaxActualitzaPersona, "operation=ajax_actualiza_persona", this, objJsMessages.jslit_cargando);
                }                
    }
        
    function f_nova_persona(){
          f_cerrar_modalespersona("axisper021");
          objUtiles.abrirModal("axisper022","src","modal_axisper022.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBLICAS");  
    }  
      
    function f_cerrar_axisper022() {
            f_cerrar_modalespersona("axisper022");
    }
        
    function f_onclickCheckbox(thiss) {
                thiss.value =  (thiss.checked)?1:0;
    }
    
    //CONFCC-5 Inicio
    function f_onclickcertifret(thiss) {
            if (thiss.value == 0) {
                document.getElementById("FRESFINI").value='';
                document.getElementById("FRESFFIN").value='';
                document.getElementById("FRESFINI").disabled = true;
                document.getElementById("FRESFFIN").disabled = true;                
                document.getElementById("icon_FRESFINI").style.display="none";
	        document.getElementById("icon_FRESFINI").style.visibility="hidden";
                document.getElementById("icon_FRESFFIN").style.display="none";
	        document.getElementById("icon_FRESFFIN").style.visibility="hidden";
            }  else {
                document.getElementById("FRESFINI").disabled = false;
                document.getElementById("FRESFFIN").disabled = false;
                document.getElementById("icon_FRESFINI").style.display="";
	        document.getElementById("icon_FRESFINI").style.visibility="visible";
                document.getElementById("icon_FRESFFIN").style.display="";
	        document.getElementById("icon_FRESFFIN").style.visibility="visible";
            }   
    }
    //CONFCC-5 Fin
        
 function f_but_aceptar(){    
    	// INI - ML - BUG - 4576 - OBLIGATORIEDAD DE FECHAS SI SELECCIONA RESIDENCIA FISCAL
    	let CRESIDFISC = document.getElementById('CRESIDFISC'),
    		FRESFINI = document.getElementById('FRESFINI'),
    		FRESFFIN = document.getElementById('FRESFFIN'),
    		correcto = true;
    	if (CRESIDFISC && CRESIDFISC.checked) {    		
    		correcto = validarFormatoFecha(FRESFINI.value) && 
    			validarFormatoFecha(FRESFFIN.value) &&
    			existeFecha(FRESFINI.value) &&
    			existeFecha(FRESFFIN.value);
    	}
    	//Si selecciona Certificado Residencia Fiscal, debe ingresar una fecha valida de inicio y fin
    	if (!correcto) return alert("<axis:alt f='axismnt017' c='VALOR' lit='89907031'/>");
    	if (objValidador.validaEntrada()) {                
            objUtiles.ejecutarFormulario ("modal_axismnt017.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);   
        }
    	// FIN - ML - BUG - 4576 - OBLIGATORIEDAD DE FECHAS SI SELECCIONA RESIDENCIA FISCAL
    }   
    // INI - ML - BUG - 4576 - VALIDACIONES DE FECHAS
    function validarFormatoFecha(campo) {
        var RegExPattern = /^\d{1,2}\/\d{1,2}\/\d{2,4}$/;
        if ((campo.match(RegExPattern)) && (campo!='')) {
              return true;
        } else {
              return false;
        }
  	}    
    function existeFecha(fecha){
    	  var fechaf = fecha.split("/");
          var d = fechaf[0];
          var m = fechaf[1];
          var y = fechaf[2];
          return m > 0 && m < 13 && y > 0 && y < 32768 && d > 0 && d <= (new Date(y, m, 0)).getDate();
  	}
    // FIN - ML - BUG - 4576 - VALIDACIONES DE FECHAS     
        
    function isAlfaNum(campo) {            
            var patron=/^[\w\ñ\Ñ\-]+$/; 
            if(!patron.test(campo.value)) {                
                return false;
            }
            return true;
    }     
        
    function f_formatear(thiss, longitud){
            //thiss.value = objValidador.valorFormateadoCampoNumerico(thiss.value, false, false);            
            if (thiss.value.length > longitud)
            {
                alert("<axis:alt f='axismnt017' c='VALOR' lit='9904024'/>");
                thiss.value = '';
            }else if (!isAlfaNum(thiss)){
                thiss.value = '';
                alert("<axis:alt f='axismnt017' c='VALOR' lit='9904854'/>");
            }
    }
        
    function f_formatear2(thiss){            
        if( objValidador.esCampoNumerico(thiss.value, true,<%= Integer.MIN_VALUE %>, "<axis:alt f="axismnt017" c="PIMPINT" lit="101467"/>")){
            
            if (objNumero.cambiarSeparadorDecimalesPorMiles(thiss.value)>100){                    
                alert("<axis:alt f='axismnt017' c='PIMPINT' lit='9904850'/>");
                thiss.value = '';
            }
        }else{thiss.value = '';}
    }
        
    function f_validaAnio(thiss){
        var fecha = new Date();
        if (thiss.value>fecha.getFullYear()){                    
            alert("<axis:alt f='axismnt017' c='PIMPINT' lit='9904852'/>");
            thiss.value = '';
        }
    }
      
    function f_cerrar_modal(modal){
        objUtiles.cerrarModal(modal);
    } 
	
	  //IAXIS-4823
    function  f_activar_tiporea($I){
    	
    	if($I==0){
    		 document.getElementById("CTIPREA").disabled=false;
    	}else{
    		document.getElementById("CTIPREA").disabled=true;
    	}
    	
    	
    }
     
    function f_cerrar_calificaciones(SPERSON,CCOMPANI){
        objUtiles.cerrarModal("axismnt021");
        objUtiles.ejecutarFormulario ("modal_axismnt017.do?PAR_CCOMPANI=" + CCOMPANI +"&PAR_SPERSON="+SPERSON, "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
    } 
    function  f_nuevaCalificacion (SPERSON){
    
            var CCOMPANI = document.getElementById("CCOMPANI").value;
            if (objUtiles.estaVacio(CCOMPANI)){
                var TCOMPANI = document.getElementById("TNOMBRE").value;
                var CTIPIVA = document.getElementById("CTIPIVA").value;
                var FBAJA = document.getElementById("FBAJA").value;
                var CAFILI = document.getElementById("CAFILI").value;
                var CENTICALIFI = document.getElementById("CENTICALIFI").value;
                var CCALIFI = document.getElementById("CCALIFI").value;
                var NANYCALIF = document.getElementById("NANYCALIF").value;
                var CDIAN = document.getElementById("CDIAN").value;
                var CCASAMAT = document.getElementById("CCASAMAT").value;
                var CSUPERFINAN = document.getElementById("CSUPERFINAN").value;
                var CTIPCOM = document.getElementById("CTIPCOM").value;
                var NPATRIMONIO = document.getElementById("NPATRIMONIO").value;
                var PIMPINT = document.getElementById("PIMPINT").value;
                var FFALTA = document.getElementById("FFALTA").value;
                var CPAIS = document.getElementById("CPAIS").value;
                var CTRAMTAX = document.getElementById("CTRAMTAX").value;
                var CRESIDFISC = document.getElementById("CRESIDFISC").value; //CONFCC-5
                var FRESFINI = document.getElementById("FRESFINI").value; //CONFCC-5
                var FRESFFIN = document.getElementById("FRESFFIN").value; //CONFCC-5
                
                objUtiles.abrirModal("axismnt021","src","modal_axismnt021.do?operation=form&PROCESO=nuevo&SPERSON="+SPERSON+"&CTIPIVA="+CTIPIVA+"&FBAJA="+FBAJA+"&CAFILI="+CAFILI+"&CENTICALIFI="+CENTICALIFI+"&CCALIFI="+CCALIFI+"&NANYCALIF="+NANYCALIF+"&CDIAN="+CDIAN+"&CCASAMAT="+CCASAMAT+"&CSUPERFINAN="+CSUPERFINAN+"&CTIPCOM="+CTIPCOM+"&NPATRIMONIO="+NPATRIMONIO+"&PIMPINT="+PIMPINT+"&FFALTA="+FFALTA+"&CPAIS="+CPAIS+"&CTRAMTAX="+CTRAMTAX+"&TCOMPANI="+TCOMPANI+"&CRESIDFISC="+CRESIDFISC+"&FRESFINI="+FRESFINI+"&FRESFFIN="+FRESFFIN); 
            }else{
                objUtiles.abrirModal("axismnt021","src","modal_axismnt021.do?operation=form&PROCESO=nuevo&SPERSON="+SPERSON); 
            }
    }
    function  f_editarCalificacion (SPERSON, CENTICALIFI){
      objUtiles.abrirModal("axismnt021","src","modal_axismnt021.do?operation=form&PROCESO=editar&SPERSON="+SPERSON+"&CENTICALIFI="+CENTICALIFI);  
    }
     function  f_eliminarCalificacion (SPERSON, CENTICALIFI,FEFECTO){
      objUtiles.abrirModal("axismnt021","src","modal_axismnt021.do?operation=form&PROCESO=eliminar&SPERSON="+SPERSON+"&CENTICALIFI="+CENTICALIFI+"&FEFECTO="+FEFECTO);
    }
    /****************************************************************************************/
    /*********************************** CALLBACK AJAX **************************************/
    /****************************************************************************************/
    function f_onchange_CPAIS() {
        var CPAIS_RESIDENCIA=objDom.getValorPorId("CPAIS");
        if (!objUtiles.estaVacio(CPAIS_RESIDENCIA)){
            var qs="operation=ajax_direccion";
            qs=qs+"&op="+"CPAIS_RESIDENCIA";
            qs=qs+"&CPAIS_RESIDENCIA="+CPAIS_RESIDENCIA;
            qs=qs+"&dt="+(new Date().getTime());
            objAjax.invokeAsyncCGI("modal_axismnt017.do", callbackajaxdireccion, qs, this);
        } else {
            objDom.setValorPorId("CPAIS", "");
            objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "");
        }
    }        

    function callbackajaxdireccion (ajaxResponseText){
        try{ 
        
       // alert(ajaxResponseText);
            var doc = objAjax.domParse(ajaxResponseText);
            if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS_RESIDENCIA")[0])) {
                   if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                        objDom.setValorPorId("CPAIS", "");
                       // limpiaCampos("CPAIS");
                    }else{
                        objDom.setValorPorId("CPAIS", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS_RESIDENCIA"), 0, 0));
                       
                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAISRESIDENCIA")[0])){
                            objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAISRESIDENCIA"), 0, 0) + "</b>");
                            limpiaCampos("CPAIS_RESIDENCIA");
                            }
                    }
                }
            }
        } catch (e) {
           if (isDebugAjaxEnabled == "true")
            alert (e.name + " " + e.message);
        }
    }
    /****************************************************************************************/
    /************************************** MODAL *******************************************/
    /****************************************************************************************/
            
    function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION){
         objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
          "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION);
    }
    
    function f_aceptar_axiscom001(CODIGO, TEXTO, CODIGO_CONSULTA){
        f_cerrar_axiscom001();
        
        if (!objUtiles.estaVacio(TEXTO))
            TEXTO = objUtiles.replaceAll(TEXTO, "-quote-", "\'");
      
        if (CODIGO_CONSULTA == "LISTA_PAIS_RESIDENCIA") {
        
            objDom.setValorPorId("CPAIS", CODIGO);
            objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "<b>" + TEXTO + "</b>");
         }
    }
    
    function f_cerrar_axiscom001() {
        objUtiles.cerrarModal("axiscom001");
    }
    
    function f_cerrar_axismnt022() {
        objUtiles.cerrarModal("axismnt022");
    }
    
    function f_abrir_axismnt022(){
        //Le pasaremos el CCOMPANI
        var CCOMPANI = $('#CCOMPANI').val();
        
        //Si CCOMPANI null guardaremos antes de ir a la modal
        if(objUtiles.estaVacio(CCOMPANI)){
            //Alert de que vamos a guardar antes de añadir indicadores
            //Validación y llamada a la función de guardar
            alert("<axis:alt f='axismnt017' c='INDICADORES' lit='9906477'/>");
            if (objValidador.validaEntrada())
            {                
                $('#addIndicadores').val('ok');
                objUtiles.ejecutarFormulario ("modal_axismnt017.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }else{            
            objUtiles.abrirModal("axismnt022","src","modal_axismnt022.do?operation=form&CCOMPANI="+CCOMPANI); 
        }
        
        
    }
     </script>
    </head>
 <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt c="TITULO_022" f="axismnt017" lit="1000214"/></c:param>
            <c:param name="nid" value="axisper022"/>
        </c:import> 
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt c="TITULO_021" f="axismnt017" lit="1000235"/></c:param>
            <c:param name="nid" value="axisper021"/>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axismnt017" c="CALIFICACION" lit="9903963"/></c:param>
            <c:param name="nid" value="axismnt021"/>
        </c:import>
         <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
        </c:import>
        
         <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axismnt022|<axis:alt c="LIT_MODAL_AXISMNT022" f="axismnt022" lit="9000570"/> <axis:alt c="LIT_MODAL_AXISMNT022" f="axismnt022" lit="9906474"/></c:param>
        </c:import>
        
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
             <input type="hidden" id="addIndicadores" name="addIndicadores" value="${__formdata.addIndicadores}"/>
            <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}"/>
            <axis:visible f="axismnt017" c="APLICAVALIDACION" >
                <input type="hidden" name="APLICAVALIDACION" id="APLICAVALIDACION" value="1"/>
            </axis:visible>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="lit_form" f="axismnt017" lit="9903958"/></c:param>
                <c:param name="producto"><axis:alt c="lit_form" f="axismnt017" lit="9903958"/></c:param>
                <c:param name="form">axismnt017</c:param>
            </c:import>
            <!-- Area de campos  -->
            
           <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <!-- Seccion de datos de persona  -->
            <div class="titulo">
              <img src="images/flecha.gif"/>
              <axis:alt f="axismnt017" c="DATOS_COMPANIA" lit="9905525"/>
            </div>
            <table class="seccion" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                                <axis:ocultar f="axismnt017" c="CCOMPANI" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismnt017" c="CCOMPANI" lit="9900885" /></b>
                                    </td>
                                </axis:ocultar>                              
                                <axis:ocultar f="axismnt017" c="TCOMPANI">
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axismnt017" c="TCOMPANI" lit="9903960"/></b>
                                    </td>
                                </axis:ocultar>                                                                                          
                            </tr>                             
                            <tr>
                               
                            <axis:ocultar f="axismnt017" c="CCOMPANI" dejarHueco="false">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto"
                                    <axis:atr f="axismnt017" c="CCOMPANI" a="modificable=false"/> 
                                    style="width:80%;" value="${__formdata.CCOMPANI}" 
                                    name="CCOMPANI" id="CCOMPANI" size="15" 
                                    title="<axis:alt f="axismnt017" c="CCOMPANI" lit="9900885"/>"/>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axismnt017" c="TCOMPANI" dejarHueco="false">
                                    <td class="campocaja" colspan="2">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                        <axis:atr f="axismnt017" c="TCOMPANI" a="modificable=true&obligatorio=true"/>
                                        style="width:55%;" size="15" value="${__formdata.TCOMPANI}" name="TCOMPANI" id="TCOMPANI"
                                         title="<axis:alt f="axismnt017" c="TCOMPANI" lit="9903960"/>"/>
                                    </td>
                            </axis:ocultar>                                                                                      
                            </tr>
                            <tr>
                                <axis:ocultar f="axismnt017" c="NNUMIDE" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismnt017" c="NNUMIDE" lit="9903959" /></b>
                                    </td>
                                </axis:ocultar>                              
                                <axis:ocultar f="axismnt017" c="TNOMBRE">
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axismnt017" c="TNOMBRE" lit="9900886"/></b>
                                    </td>
                                </axis:ocultar>
                                 <axis:ocultar f="axismnt017"  c="CPAIS" dejarHueco="false">
                                <td class="titulocaja" id="tit_CPAIS" >
                                    <b id="label_CPAIS"><axis:alt f="axismnt017" c="CPAIS" lit="9000789"/></b>
                                </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                               
                                 <axis:ocultar f="axismnt017" c="NNUMIDE" dejarHueco="false">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto"
                                    <axis:atr f="axismnt017" c="NNUMIDE" a="modificable=false"/> 
                                    style="width:80%;" value="${__formdata.NNUMIDE}" 
                                    name="NNUMIDE" id="NNUMIDE" size="15" 
                                    title="<axis:alt f="axismnt017" c="NNUMIDE" lit="9903959"/>"/>
                                    <img border="0" alt="<axis:alt f="axismnt017" c="CAMBIO_PERSONA" lit="9001141"/>" title="<axis:alt f="axismnt017" c="CAMBIO_PERSONA" lit="9001141"/>" src="images/find.gif"
                                         style="vertical-align:middle;cursor:pointer;" 
                                         onclick="javascript:f_abrir_axisper021()"/>
                                </td>
                                </axis:ocultar>                                
                                 <axis:ocultar f="axismnt017" c="TNOMBRE" dejarHueco="false">
                                    <td class="campocaja" colspan="2" style="white-space:nowrap;"  >
                                        <input type="text" class="campowidthinput campo campotexto" 
                                        <axis:atr f="axismnt017" c="TNOMBRE" a="modificable=false"/>
                                        style="width:95%;" size="15" value="${__formdata.TNOMBRE}" name="TNOMBRE" id="TNOMBRE"
                                         title="<axis:alt f="axismnt017" c="TNOMBRE" lit="9900886"/>"/>
                                         <img border="0" alt="<axis:alt f="axismnt017" c="MODIFICAR_PERSONA" lit="9000552"/>" title="<axis:alt f="axismnt017" c="MODIFICAR_PERSONA" lit="9000552"/>" src="images/lapiz.gif"
                                         style="vertical-align:middle;cursor:pointer;" 
                                         onclick="javascript:f_consultar_persona('${__formdata.SPERSON}')"/>
                                    </td>
                                </axis:ocultar>           
                               <axis:ocultar c="CPAIS" f="axismnt017" dejarHueco="false">
                                        <td class="campocaja" id="td_CPAIS">
                                          <input type="text"  class="campowidthinput campo campotexto" size="3"  maxlength="3" value="${__formdata.CPAIS}" name="CPAIS" id="CPAIS" 
                                          onchange="f_onchange_CPAIS()" <axis:atr f="axismnt017" c="CPAIS" a="modificable=true"/> style="width:18%;"
                                          title="<axis:alt f="axismnt017" c="CPAIS" lit="9000789"/>"/>
                                           <axis:visible c="findPaisResidencia" f="axismnt017">
                                             <c:if test="${__formdata.isNew }">
                                                <img id="findPaisResidencia" border="0" <axis:atr f="axisper010" c="findPaisResidencia" a="modificable=true"/> src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS_RESIDENCIA', null)" style="cursor:pointer"/> 
                                             </c:if>
                                           </axis:visible>                                     
                                          <span id="TPAISRESIDENCIA_span"><b>${__formdata.TPAISRESIDENCIA} </b></span>                                           
                                        </td>  
                                </axis:ocultar>  
                            </tr>
                            
                             <tr>
                                <axis:ocultar f="axismnt017" c="CTIPIVA" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismnt017" c="CTIPIVA" lit="9903961" /></b>
                                    </td>
                                </axis:ocultar>                              
                                <axis:ocultar f="axismnt017" c="FBAJA">
                                    <td class="titulocaja" >
                                        <b><axis:alt f="axismnt017" c="FBAJA" lit="9001510"/></b>
                                    </td>
                                </axis:ocultar>
								
                                <axis:ocultar f="axismnt017" c="CAFILI" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismnt017" c="CAFILI" lit="9903957" /></b>
                                    </td>
                                </axis:ocultar>   
								
								  <!-- IAXIS-4823 -->
                                <axis:ocultar f="axismnt017" c="TIPREA" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismnt017" c="TIPREA" lit="89908010" /></b>
                                    </td>
                                </axis:ocultar> 
								
                                <axis:ocultar f="axismnt017" c="CINVERFAS">
                                    <td class="titulocaja">
                                      <b><axis:alt f="axismnt017" c="CINVERFAS" lit="9906951"/></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                               
                                 <axis:ocultar f="axismnt017" c="CTIPIVA" dejarHueco="false">
                                <td class="campocaja">
                                    <select name = "CTIPIVA" id ="CTIPIVA" size="1"  class="campowidthselect campo campotexto"
                                     <axis:atr f="axismnt017" c="CTIPIVA" a="modificable=true&isInputText=false"/>>&nbsp;
                                     <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt017" c="SELECC" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.LSTTIPOIVA}">
                                            <option value = "${element.CTIPIVA}"
                                            <c:if test="${__formdata.CTIPIVA == element.CTIPIVA}"> selected = "selected"</c:if>>
                                            ${element.TTIPIVA} 
                                            </option>
                                         </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>                                
                                 <axis:ocultar f="axismnt017" c="FBAJA" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text"  style="width:80%" class="campowidthinput campo campotexto" id="FBAJA" name="FBAJA" size="15"
                                    value="<fmt:formatDate value='${__formdata.FBAJA}' pattern='dd/MM/yyyy'/>" 
                                    <axis:atr f="axismnt017" c="FBAJA" a="modificable=true&formato=fecha"/>/>
                                    	<a style="vertical-align:middle;"><img
                                    id="icon_FBAJA" alt="<axis:alt f="axismnt017" c="FBAJA" lit="9001510"/>" title="<axis:alt f="axismnt017" c="FBAJA" lit="9001510" />" src="images/calendar.gif"/></a>                                 
                                    </td>
                                </axis:ocultar>   
                                <axis:ocultar f="axismnt017" c="CAFILI" dejarHueco="false">
                                <td class="titulocaja">                                
                                    <input type="checkbox" onClick="f_onclickCheckbox(this)" id="CAFILI" name="CAFILI" <c:if test="${__formdata.CAFILI == 1}">checked</c:if> 
                                    value="${__formdata.CAFILI}"  <axis:atr f="axismnt017" c="CAFILI" a="modificable=true"/>/>    
                                </td>     
                                </axis:ocultar>  

                             <!-- IAXIS-4823 -->
                                <axis:ocultar f="axismnt017" c="CTIPREA" dejarHueco="false">
                                    <td class="campocaja">
                                         <select name="CTIPREA" id="CTIPREA" size="1" style="width:79%;"  class="campowidthselect campo campotexto" 
                                        >&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt017" c="SELECC" lit="1000348"/> - </option>
                                                   <c:forEach var="element" items="${__formdata.LSTCTIPREA}">
                                                        <option value = "${element.CATRIBU}"
                                                        <c:if test="${__formdata.CTIPREA == element.CATRIBU}"> selected = "selected"</c:if>>
                                                            ${element.TATRIBU} 
                                                        </option>
                                                    </c:forEach>
                                        </select> 
                                    </td>
                                </axis:ocultar>
								
                                <axis:ocultar f="axismnt017" c="CINVERFAS">
                                    <td class="campocaja">                            
                                        <select name = "CINVERFAS" id="CINVERFAS" style="width:90%" value="${__formdata.CINVERFAS}" size="1"  class="campowidthselect campo campotexto"
                                                    title="<axis:alt c="CINVERFAS" f="axismnt017" lit="9906951" />"
                                                    <axis:atr f="axismnt017" c="CINVERFAS" a="modificable=true&isInputText=false"/>>
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt017" c="SELECCIONAR" lit="108341"/> - </option>    
                                                        <c:forEach var="combustible" items="${LSTINVERFAS}">
                                                            <option value = "${combustible.CATRIBU}"
                                                                <c:if test="${(!empty __formdata.CINVERFAS) && combustible.CATRIBU == __formdata.CINVERFAS}"> selected </c:if>>
                                                                            ${combustible.TATRIBU}
                                                            </option>  
                                                        </c:forEach>
                                       </select>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            
                            <tr>
                                <axis:ocultar f="axismnt017" c="CENTICALIFI" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismnt017" c="CENTICALIFI" lit="9903962" /></b>
                                    </td>
                                </axis:ocultar>                              
                                <axis:ocultar f="axismnt017" c="CCALIFI">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismnt017" c="CCALIFI" lit="9903963"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axismnt017" c="NANYCALIF">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismnt017" c="NANYCALIF" lit="9903964"/></b>
                                    </td>
                                </axis:ocultar>
                                
                            </tr>
                            <tr>
                               
                                 <axis:ocultar f="axismnt017" c="CENTICALIFI" dejarHueco="false">
                                <td class="campocaja">
                                     <select name="CENTICALIFI" id="CENTICALIFI" size="1" class="campowidthselect campo campotexto" style="width:79%;">&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt017" c="SELECC" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.LSTCENTICALIFI}">
                                                    <option value = "${element.CATRIBU}"
                                                    <c:if test="${__formdata.CENTICALIFI == element.CATRIBU}"> selected = "selected"</c:if>>
                                                        ${element.TATRIBU} 
                                                    </option>
                                                </c:forEach>
                                            </select> 
                                </td>
                                </axis:ocultar>                                
                                 <axis:ocultar f="axismnt017" c="CCALIFI" dejarHueco="false">
                                    <td class="campocaja">
                                        <select name="CCALIFI" id="CCALIFI" size="1" class="campowidthselect campo campotexto" style="width:79%;">&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt017" c="SELECC" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.LSTCCALIFI}">
                                                    <option value = "${element.CATRIBU}"
                                                    <c:if test="${__formdata.CCALIFI == element.CATRIBU}"> selected = "selected"</c:if>>
                                                        ${element.TATRIBU} 
                                                    </option>
                                                </c:forEach>
                                            </select> 
                                    </td>
                                </axis:ocultar>    
                                <axis:ocultar f="axismnt017" c="NANYCALIF" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                        <axis:atr f="axismnt017" c="NANYCALIF" a="modificable=true&formato=entero"/>
                                        style="width:55%;" size="15" value="${__formdata.NANYCALIF}" name="NANYCALIF" id="NANYCALIF"
                                        title="<axis:alt f="axismnt017" c="NANYCALIF" lit="9903964"/>" onChange = "javascript:f_validaAnio(this);"/>
                                    </td>
                                </axis:ocultar>                    
                               
                            </tr>
                            <tr>
                                <axis:ocultar f="axismnt017" c="CDIAN">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismnt017" c="CDIAN" lit="9903965"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axismnt017" c="CCASAMAT">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismnt017" c="CCASAMAT" lit="9903966"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axismnt017" c="CSUPERFINAN">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismnt017" c="CSUPERFINAN" lit="9903967"/></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axismnt017" c="CDIAN" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                        <axis:atr f="axismnt017" c="CDIAN" a="modificable=true"/>
                                        style="width:55%;" size="15" value="${__formdata.CDIAN}" name="CDIAN" id="CDIAN"
                                        onChange = "javascript:f_formatear(this,15);"
                                        title="<axis:alt f="axismnt017" c="CDIAN" lit="9903965"/>"/>
                                    </td>
                                </axis:ocultar>        
                                <axis:ocultar f="axismnt017" c="CCASAMAT" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                        <axis:atr f="axismnt017" c="CCASAMAT" a="modificable=true"/>
                                        style="width:55%;" size="15" value="${__formdata.CCASAMAT}" name="CCASAMAT" id="CCASAMAT"
                                        onChange = "javascript:f_formatear(this,15);"
                                        title="<axis:alt f="axismnt017" c="CCASAMAT" lit="9903966"/>"/>
                                    </td>
                                </axis:ocultar>          
                                <axis:ocultar f="axismnt017" c="CSUPERFINAN" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                        <axis:atr f="axismnt017" c="CSUPERFINAN" a="modificable=true"/>
                                        style="width:55%;" size="15" value="${__formdata.CSUPERFINAN}" name="CSUPERFINAN" id="CSUPERFINAN"
                                        onChange = "javascript:f_formatear(this,15);"
                                        title="<axis:alt f="axismnt017" c="CSUPERFINAN" lit="9903967"/>"/>
                                    </td>
                                </axis:ocultar>          
                               
                            </tr>                            
                            <tr>
                                <axis:ocultar f="axismnt017" c="CTIPCOM" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismnt017" c="CTIPCOM" lit="9903956" /></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axismnt017" c="DSP_PIMPINT" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismnt017" c="PIMPINT" lit="9904851" /></b>
                                    </td>
                                </axis:ocultar>  
                                 <axis:ocultar f="axismnt017" c="CTRAMTAX" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismnt017" c="CTRAMTAX" lit="9905493" /></b>
                                    </td>
                                </axis:ocultar>
                                <!-- INI CONFCC-5 -->
                                <axis:ocultar f="axismnt017" c="CRESIDFISC" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismnt017" c="CRESIDFISC" lit="89906112" /></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axismnt017" c="FRESFINI">
                                    <td class="titulocaja" >
                                        <b><axis:alt f="axismnt017" c="FRESFINI" lit="9000526"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axismnt017" c="FRESFFIN">
                                    <td class="titulocaja" >
                                        <b><axis:alt f="axismnt017" c="FRESFFIN" lit="9000527"/></b>
                                    </td>
                                </axis:ocultar>
                                <!-- FIN CONFCC-5 -->
                            </tr>
                            <tr>                               
                                <axis:ocultar f="axismnt017" c="CTIPCOM" dejarHueco="false">
                                    <td class="campocaja">
                                         <select name="CTIPCOM" id="CTIPCOM" size="1" class="campowidthselect campo campotexto" style="width:79%;" onchange="f_carga_dependencias();revisarEstilos();">&nbsp;
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt017" c="SELECC" lit="1000348"/> - </option>
                                                    <c:forEach var="element" items="${__formdata.LSTCTIPCOM}">
                                                        <option value = "${element.CATRIBU}"
                                                        <c:if test="${__formdata.CTIPCOM == element.CATRIBU}"> selected = "selected"</c:if>>
                                                            ${element.TATRIBU} 
                                                        </option>
                                                    </c:forEach>
                                        </select> 
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axismnt017" c="DSP_PIMPINT" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                        <axis:atr f="axismnt017" c="PIMPINT" a="modificable=true"/>
                                        style="width:15%;" maxlength="5" value="${__formdata.PIMPINT}" name="PIMPINT" id="PIMPINT"
                                        title="<axis:alt f="axismnt017" c="PIMPINT" lit="9904851"/>"  onChange = "javascript:f_formatear2(this);"/>
                                    </td>
                                </axis:ocultar> 
                                <axis:visible  f="axismnt017" c="CTRAMTAX" >
                                    <td class="campocaja">
                                       <select name="CTRAMTAX" id="CTRAMTAX" size="1" class="campowidthselect campo campotexto" style="width:79%;">&nbsp;
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt017" c="SELECC" lit="9905493"/> - </option>
                                                    <c:forEach var="element" items="${__formdata.LSTCTRAMTAX}">
                                                        <option value = "${element.CTRAMO}"
                                                        <c:if test="${__formdata.CTRAMTAX == element.CTRAMO}"> selected = "selected"</c:if>>
                                                            ${element.TDESCRIPCION} - ${element.PCTPART} 
                                                        </option>
                                                    </c:forEach>
                                        </select> 
                                    </td>
                                </axis:visible>
                                <!-- INI CONFCC-5 -->
                                <axis:ocultar f="axismnt017" c="CRESIDFISC" dejarHueco="false">
                                <td class="titulocaja">                                
                                    <input type="checkbox" onClick="f_onclickCheckbox(this); f_onclickcertifret(this);" id="CRESIDFISC" name="CRESIDFISC" <c:if test="${__formdata.CRESIDFISC == 1}">checked</c:if> 
                                    value="${__formdata.CRESIDFISC}"  <axis:atr f="axismnt017" c="CRESIDFISC" a="modificable=true"/>/>    
                                </td>     
                                </axis:ocultar>
                                <axis:ocultar f="axismnt017" c="FRESFINI" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text"  style="width:80%" class="campowidthinput campo campotexto" id="FRESFINI" name="FRESFINI" size="15"
                                    value="<fmt:formatDate value='${__formdata.FRESFINI}' pattern='dd/MM/yyyy'/>" 
                                    <axis:atr f="axismnt017" c="FRESFINI" a="modificable=true&formato=fecha"/>/>
                                    	<a style="vertical-align:middle;"><img
                                    id="icon_FRESFINI" alt="<axis:alt f="axismnt017" c="FRESFINI" lit="9001510"/>" title="<axis:alt f="axismnt017" c="FRESFINI" lit="9001510" />" src="images/calendar.gif"/></a>                                 
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axismnt017" c="FRESFFIN" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text"  style="width:80%" class="campowidthinput campo campotexto" id="FRESFFIN" name="FRESFFIN" size="15"
                                    value="<fmt:formatDate value='${__formdata.FRESFFIN}' pattern='dd/MM/yyyy'/>" 
                                    <axis:atr f="axismnt017" c="FRESFFIN" a="modificable=true&formato=fecha"/>/>
                                    	<a style="vertical-align:middle;"><img
                                    id="icon_FRESFFIN" alt="<axis:alt f="axismnt017" c="FRESFFIN" lit="9001510"/>" title="<axis:alt f="axismnt017" c="FRESFFIN" lit="9001510" />" src="images/calendar.gif"/></a>                                 
                                    </td>
                                </axis:ocultar>
                                <!-- FIN CONFCC-5 -->
                            </tr>
                            <tr>
                                <axis:ocultar f="axismnt017" c="NPATRIMONIO" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismnt017" c="NPATRIMONIO" lit="9001295" /></b>
                                    </td>
                                </axis:ocultar>    
                                <axis:ocultar f="axismnt017" c="FFALTA" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismnt017" c="FFALTA" lit="9903968" /></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axismnt017" c="CCONTABLE" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismnt017" c="CCONTABLE" lit="9905956" /></b>
                                    </td>
                                </axis:ocultar>       
                            </tr>
                            <tr>
                                <axis:ocultar f="axismnt017" c="NPATRIMONIO" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                        <axis:atr f="axismnt017" c="NPATRIMONIO" a="modificable=true"/>
                                        style="width:55%;" size="15" value="${__formdata.NPATRIMONIO}" name="NPATRIMONIO" id="NPATRIMONIO"
                                         title="<axis:alt f="axismnt017" c="NPATRIMONIO" lit="9001295"/>"/>
                                    </td>
                                </axis:ocultar>  
                                <axis:ocultar f="axismnt017" c="FFALTA" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text"  style="width:80%" class="campowidthinput campo campotexto" id="FFALTA" name="FFALTA" size="15"
                                    value="<fmt:formatDate value='${__formdata.FFALTA}' pattern='dd/MM/yyyy'/>" 
                                    <axis:atr f="axismnt017" c="FFALTA" a="modificable=true&formato=fecha"/>/>
                                    	<a style="vertical-align:middle;"><img
                                    id="icon_FFALTA" alt="<axis:alt f="axismnt017" c="FFALTA" lit="9903825"/>" title="<axis:alt f="axismnt017" c="FFALTA" lit="9903968" />" src="images/calendar.gif"/></a>                                 
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axismnt017" c="CCONTABLE" dejarHueco="false">
                                     <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                        <axis:atr f="axismnt017" c="CCONTABLE" a="modificable=true"/>
                                        style="width:55%;" size="15" value="${__formdata.CCONTABLE}" name="CCONTABLE" id="CCONTABLE"                                        
                                        title="<axis:alt f="axismnt017" c="CCONTABLE" lit="9905956"/>"/> 
                                    </td>
                                </axis:ocultar>   
                                
                                <td >
                                    <axis:ocultar f="axismnt017" c = "BT_INDICADORES" dejarHueco="false">
                                        <div style="float:right;">                        
                                            <input type="button" class="boton" value="<axis:alt f="axismnt017" c="INDICADORES" lit="9906744"/>"
                                            onclick="f_abrir_axismnt022()"/>
                                        </div>
                                    </axis:ocultar>
                                </td>
                                
                            </tr>
                        </table>
                                             
                    </td>
                    
                    
                </tr>
                

                
            </table>
    </td>
    </tr>
   <axis:visible c="CALIFICACION" f="axismnt017" >
     <tr>
          <td>
             
            <div class="titulo" style="float:left;">
              <img src="images/flecha.gif"/><axis:alt f="axismnt017" c="CALIFICACION" lit="9903963"/>
              <div class="dspIcons" style="float:right;">
                <axis:visible f="axismnt017" c="BT_NV_CALIF">
                <img border="0" alt="<axis:alt f="axismnt017" c="NUEVO" lit="1000428"/>" title="<axis:alt f="axismnt017" c="NUEVO" lit="1000428"/>" src="images/new.gif"
                                                 style="cursor:pointer;" onclick="f_nuevaCalificacion('${__formdata.SPERSON}')"/>
                </axis:visible>
            </div>
            </div>
              <div class="separador"  style="float:both;" >&nbsp;</div>
            <!-- Sección 1 -->
            <table class="seccion">
              <td align="left">
                <table class="area" align="center">
                  <tr>
                    <th style="width:100%;height:0px">&nbsp;</th>
                  </tr>
                  <!-- LISTA -->
                  <tr>
                    <td class="titulocaja">
                      <%-- DisplayTag Facturas--%>
                      <c:set var="title0">
                        <axis:alt f="axismnt017" c="NNUMLIN" lit="100899"/><!-- 100899 Número -->
                      </c:set>
                      <c:set var="title1">
                        <axis:alt f="axismnt017" c="CENTICALIFI" lit="9903962"/><!-- 9903962 Empresa calificadora -->
                      </c:set>
                      <c:set var="title2">
                        <axis:alt f="axismnt017" c="CCALIFI" lit="9903963"/><!-- 9903963 Calificación -->
                      </c:set>
                       <c:set var="title3">
                        <axis:alt f="axismnt017" c="FEFECTO" lit="100883"/><!--100883 Fecha efecto -->
                      </c:set>
                      <c:set var="title4">
                        <axis:alt f="axismnt017" c="CESTADO_CALIFI" lit="9909142"/><!--9909142 Estado de la Calificación -->
                      </c:set>
                      <c:set var="title5">
                        <axis:alt f="axismnt017" c="FVENCI" lit="100885"/><!--100885 Fecha vencimiento-->
                      </c:set>
                      <c:set var="title6">
                        <axis:alt f="axismnt017" c="PRECARGO" lit="101566"/><!-- 101566 % recargo -->
                      </c:set>
                        <c:set var="title7">
                        <axis:alt f="axismnt017" c="EDITAR" lit="9901356"/><!--9901356 Editar -->
                      </c:set>
                        <c:set var="title8">
                        <axis:alt f="axismnt017" c="ELIMINAR" lit="1000127"/><!-- 1000127 Eliminar -->
                      </c:set>
                    
                      <div id="dt_recibos" class="seccion displayspaceGrande">
                        <display:table name="${__formdata.LSTCALIFICA}" id="LSTCALIFICA" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list"
                                       cellpadding="0" cellspacing="0" requestURI="axis_axismnt017.do?paginar=true" style="width:100%" >
                          <%@ include file="../include/displaytag.jsp"%>
                             <display:column title="${title1}" sortable="true" sortProperty="CENTICALIFI" headerClass="sortable" media="html" autolink="false">
                              <div class="dspText">
                                ${LSTCALIFICA.ENTIDADCALIFI}
                              </div>
                            </display:column>
                             <display:column title="${title2}" sortable="true" sortProperty="CCALIFI" headerClass="sortable" media="html" autolink="false">
                             <div class="dspText">
                               ${LSTCALIFICA.CALIFI} 
                              </div>
                            </display:column>
                             <display:column title="${title3}" sortable="true" sortProperty="FEFECTO" headerClass="sortable" media="html" autolink="false">
                              <div class="dspDate">
                                <fmt:formatDate pattern='dd/MM/yyyy' value='${LSTCALIFICA.FEFECTO}'/>  
                              </div>
                            </display:column>
                              <display:column title="${title4}" sortable="true" sortProperty="CESTADO_CALIFI" headerClass="sortable" media="html" autolink="false">
                              <div class="dspText">
                                ${LSTCALIFICA.CESTADO_CALIFI} <fmt:formatDate pattern='dd/MM/yyyy' value='${LSTCALIFICA.FINSCRIP}'/> <fmt:formatDate pattern='yyyy' value='${LSTCALIFICA.ANYOACTUALIZ}'/>

                              </div>
                            </display:column>
                           <display:column title="${title5}" sortable="true" sortProperty="FVENCI" headerClass="sortable" media="html" autolink="false">
                              <div class="dspDate">
                                <fmt:formatDate pattern='dd/MM/yyyy' value='${LSTCALIFICA.FVENCI}'/>  
                              </div>
                            </display:column>
                            
                             <display:column title="${title6}" sortable="true" sortProperty="PRECARGO" headerClass="sortable" media="html" autolink="false" style="white-space:nowrap; " >
                              <div class="dspNumber">
                                <fmt:formatNumber pattern="${__formatNumberPorcentajeDefault}" value="${LSTCALIFICA.PRECARGO}"/>${(!empty LSTCALIFICA.PRECARGO)?'%':''}
                              </div>
                            </display:column>
                            <display:column title="${title7}" sortable="" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" style="width:5%" >
                                <div class="dspIcons">
                                <axis:visible f="axismnt017" c="BT_EDIT_CALIF">
                                    <img border="0" alt="<axis:alt f="axismnt017" c="EDIT" lit="9901356"/>" title="<axis:alt f="axismnt017" c="edit" lit="9901356"/>" src="images/lapiz.gif"
                                    style="vertical-align:middle;cursor:pointer;" 
                                    onclick="javascript:f_editarCalificacion('${LSTCALIFICA.SPERSON}', '${LSTCALIFICA.CENTICALIFI}')"/>
                                </axis:visible>
                                </div>
                            </display:column> 
                            <display:column title="${title8}" sortable="" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" style="width:5%" >
                                <div class="dspIcons">
                               	<axis:visible f="axismnt017" c="BT_ELIM_CALIF">
                                    <img border="0" alt="<axis:alt f="axismnt017" c="EDIT" lit="1000127"/>" title="<axis:alt f="axismnt017" c="edit" lit="1000127"/>" src="images/delete.gif"
                                    style="vertical-align:middle;cursor:pointer;" 
                                    onclick="javascript:f_eliminarCalificacion('${LSTCALIFICA.SPERSON}', '${LSTCALIFICA.CENTICALIFI}', '<fmt:formatDate pattern='dd/MM/yyyy' value='${LSTCALIFICA.FEFECTO}'/>')"/>
                              	</axis:visible>
                                </div>
                            </display:column> 
                         
                            
                        </display:table>
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </table>
          </td>
        </tr>
    </axis:visible>    
    </table>
     </form>
    
    

<c:import url="../include/botonera_nt.jsp">
           <c:param name="f">axismnt017</c:param>
            <c:param name="__botones"><axis:ocultar f="axismnt017" c = "BT_CANCELAR" dejarHueco="false">cancelar</axis:ocultar><axis:ocultar f="axismnt017" c = "BT_ACEPTAR" dejarHueco="false">,aceptar</axis:ocultar> </c:param>

</c:import>
<c:import url="../include/mensajes.jsp" />
    
<axis:visible f="axismnt017" c="FBAJA">
<script type="text/javascript">
        Calendar.setup({
            inputField     :    "FBAJA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FBAJA", 
            singleClick    :    true,
            firstDay       :    1
        });
        
 </script>    
 
 <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FFALTA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FFALTA", 
            singleClick    :    true,
            firstDay       :    1
        });
        
 </script>  
 
 <!-- INI CONFCC-5 -->
 <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FRESFINI",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FRESFINI", 
            singleClick    :    true,
            firstDay       :    1
        });
        
 </script> 
 
 <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FRESFFIN",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FRESFFIN", 
            singleClick    :    true,
            firstDay       :    1
        });
        
 </script> 
 <!-- FIN CONFCC-5 -->
 
 </axis:visible>     
    
    
</body>
</html>


