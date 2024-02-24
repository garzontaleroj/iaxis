<%/* Revision:# 3v/+eNaFCoKp8EXwtIL1Cw== # */%>
<%/**
*  
*  Pantalla principal de 'Alta Siniestro'
*
*  Fecha: 26/10/2007
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<script type="text/javascript">

  function f_onclickCheckbox(thiss) {
        objDom.setValorPorId("IDSOLIDARIDAD", $('input:radio[name=SOLIDARIDAD]:checked').val());
    }
    function f_actualizar_agente(){
       CAGENTE_SINI = document.miForm.CAGENTE_SIN.value;    
        if (objUtiles.estaVacio(CAGENTE_SINI)){
         <c:if test="${!empty __formdata.CAGENTE_SESSION}">
         CAGENTE_SINI = "${__formdata.CAGENTE_SESSION}";   
         </c:if>
        }
       SSEGURO = objDom.getValorPorId("SSEGURO");
       if (!objUtiles.estaVacio(CAGENTE_SINI)){
                //objAjax.invokeAsyncCGI("axis_axisadm047.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + CAGENTE_SINI, this);
                /****BUG 25365: El agente que ha de apareceer por defecto es el de la póliza, no el de la sesión****/
                objAjax.invokeAsyncCGI("axis_axissin032.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&SSEGURO=" + SSEGURO, this);
                /****FI BUG 25365*****/
      }
    }
    function callbackAjaxCargarAgente(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            var elementos = doc.getElementsByTagName("element");
            //if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                    var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                    var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                     objDom.setValorPorId("CAGENTE_SIN", CAGENTEformateado); 
                    objDom.setValorPorId("TAGENTE_SIN", NOMBREformateado); 
                      CAGENTE_SEL = objDom.getValorPorId("CAGENTE_SEL");
                       if (objUtiles.estaVacio(CAGENTE_SEL) && !objUtiles.estaVacio(CAGENTEformateado)){
                            f_actualizar_agente_sel(CAGENTEformateado);
                       }else{
                            if (!objUtiles.estaVacio(CAGENTE_SEL)){
                                      f_actualizar_agente_sel(CAGENTE_SEL);
                               }
                       
                       }
                    
                    
                }
            //}
        }
        
function f_actualizar_agente_sel(thiss){
      
       if (!objUtiles.estaVacio(thiss)){
                objAjax.invokeAsyncCGI("axis_axisadm047.do", callbackAjaxCargarAgenteSel, "operation=ajax_actualizar_agente&CAGENTE=" + thiss, this);
      }
    }
    
    	function f_abrir_axissin067(){

            var CEMPRES =objDom.getValorPorId("CEMPRES");
	        var SPRODUC =objDom.getValorPorId("SPRODUC");
	        var SSEGURO =objDom.getValorPorId("SSEGURO");
	        var CACTIVI =objDom.getValorPorId("CACTIVI");
	        /*var CTRAMTE =objDom.getValorPorId("CTRAMTE");
	        var CESTSIN =objDom.getValorPorId("CESTSIN");*/

            objUtiles.abrirModal("axissin067", "src", "modal_axissin067.do?operation=form&CEMPRES="+CEMPRES+"&SPRODUC="+SPRODUC+"&SSEGURO="+SSEGURO+"&CACTIVI="+CACTIVI);

        }

 

        function callbackAjaxCargarAgenteSel(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            var elementos = doc.getElementsByTagName("element");
           // if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                    var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                    var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                    objDom.setValorPorId("CAGENTE_SEL", CAGENTEformateado); 
                    objDom.setValorPorId("TAGENTE_SEL", NOMBREformateado); 
                }else{
                    objDom.setValorPorId("TAGENTE_SEL",""); 
                    objDom.setValorPorId("CAGENTE_SEL","");
                }
           // }
           
        }

             function f_cerrar_axisctr014() {
                objUtiles.cerrarModal("axisctr014")
            }    
            
       
            
            function f_aceptar_axisctr014 (CAGENTE){
                objDom.setValorPorId("CAGENTE", CAGENTE);
                f_cerrar_axisctr014();
                objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            }  
            
            
            function callbackAjaxCambiarAgente(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);

                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                    var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                    objDom.setValorPorId("CAGENTE_SEL", CAGENTEformateado);
                    objDom.setValorPorId("TAGENTE_SEL", NOMBREformateado);
                }
               
                
            }

            /****************************************************************************************/
            /*******************************MODAL  GENERICO *****************************************/
            /****************************************************************************************/
            
            // bug 0022153
            function f_abrir_modal(cual, noXButton, optionalQueryString) {
                // alert("f_abrir_modal "+optionalQueryString);
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                    
                if (noXButton) 
                    objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                    
                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
            }        

            // bug 0022153
            function f_cerrar_modal(cual) {
                objUtiles.cerrarModal(cual);
            }

            // bug 0022153
            function f_aceptar_modal(cual, params) {
                f_cerrar_modal(cual);
            }

            // bug 0022153
            /****************************************************************************************/
            /******************************* ACEPTAR MODALES*****************************************/
            /****************************************************************************************/
            function f_aceptar_axissin026(NSINIES) {
                objDom.setValorPorId("NSINIES", NSINIES);
                //alert("f_aceptar_axissin026 NSINIES: " + NSINIES);
                objUtiles.ejecutarFormulario("axis_axissin032.do?NSINIESselected="+NSINIES, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }        
            
            

     function f_consultar_persona(SPERSON,NSINIES){
            objUtiles.ejecutarFormulario("axis_axissin032.do?SPERSON_CON="+SPERSON+"&NSINIES_CON="+NSINIES, "consulta_persona_b", document.miForm, "_self", objJsMessages.jslit_cargando);
    }   
    
	function f_aceptar_axisper042(CPOSTAL){
		f_cerrar_modal("axisper042");
		objDom.setValorPorId("CPOSTAL", CPOSTAL);
		document.miForm.CPAIS.focus();     
		objAjax.invokeAsyncCGI('modal_axissin017.do', callbackAjaxOnblurCPOSTAL, 'operation=getProvinPobla&CPOSTAL=' + CPOSTAL, this);             
	}
			
	function f_abrir_axisper042 () {
		objUtiles.abrirModal("axisper042", "src", "modal_axisper042.do?operation=form");
	}
    

</script>    


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axissin032" c="title" lit="109808"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
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
        
        <c:import url="../../../scripts/axis/axissin032.jsp">        
            <c:param name="multiPantalla" value="false"/>
        </c:import>
    </head>
    <body onload="f_onload();f_actualizar_agente();" onblur="f_ponerFocus('TBODY')">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
		
		<c:import url="../include/modal_estandar.jsp">
			<c:param name="nid_y_titulo">axisper041|<axis:alt c="axisper041_TITULO" f="axisper041" lit="9002274"/></c:param>
		</c:import>
		
		<c:import url="../include/modal_estandar.jsp">
			<c:param name="nid_y_titulo">axisper042|<axis:alt c="axisper042_TITULO" f="axisper042" lit="9002274"/></c:param>
		</c:import>

		<c:import url="../include/modal_estandar.jsp">
			<c:param name="nid_y_titulo">axissin067|<axis:alt c="axissin067_TITULO" f="axissin067" lit="9909363"/></c:param>
		</c:import>
		
        <form name="miForm" action="" method="POST">
        <input type="hidden" id="operation" name="operation" value=""/>
        <input type="hidden" name="PRODUCTO" id="PRODUCTO" value="" />
        <input type="hidden" name="FORM_ACT" id="FORM_ACT" value="" />
       <!--<input type="hidden" name="MODO" id="MODO" value="" />-->
        <input type="hidden" name="LIMPIAR_DATOS" id="LIMPIAR_DATOS" value="" />
        <input type="hidden" name="SSEGURO" id="SSEGURO" value="${sessionScope.SSEGURO}" />
        <input type="hidden" name="SRIESGO" id="SRIESGO" value="${__formdata['NRIESGO']}" />
        <input type="hidden" name="HTRIESGO" id="HTRIESGO" value="${__formdata['TRIESGO']}" />
        <input type="hidden" name="PCTRAMI" id="PCTRAMI" value="${__formdata['PCTRAMI']}" />
        <input type="hidden" name="CRAMO" id="CRAMO" value="${__formdata['CRAMO']}" />
        <input type="hidden" name="selectedGarantias" id="selectedGarantias" value="" />
        <input type="hidden" name="selectedRiesgosss" id="selectedRiesgosss" value="" /> 
        <input type="hidden" name="selectedDocumentacion" id="selectedDocumentacion" value="" />
        <input type="hidden" name="NSINIESINI" id="NSINIESINI" value="${sessionScope.NSINIESINI}" />
        <input type="hidden" name="CACTIVI" id="CACTIVI" value="${__formdata.CACTIVI}" />
        <input type="hidden" name="SPRODUC" id="SPRODUC" value="${__formdata.SPRODUC}" />
        <input type="hidden" name="NRIESGO_OUT" id="NRIESGO_OUT" value="${__formdata.NRIESGO_OUT}" />
        <input type="hidden" name="NSINIES" id="NSINIES" value="${__formdata.NSINIES}" />
        <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}" />
        <input type="hidden" name="CAGENTE_SESSION" id="CAGENTE_SESSION" value="${__formdata.CAGENTE_SESSION}" />
        <input type="hidden" name="HAY_ASISTENCIA" id="HAY_ASISTENCIA" value="${__formdata.HAY_ASISTENCIA}" />
        <input type="hidden" name="TPAIS" value="${__formdata.TPAIS}"/>
        <input type="hidden" name="TPROVIN" value="${__formdata.TPROVIN}"/>
        <input type="hidden" name="TPOBLAC" value="${__formdata.TPOBLAC}"/>
        <input type="hidden" name="HFFINBAJA" value="${FFINBAJA}"/>
        <input type="hidden" name="HVALINNOMIDADOS" id="HVALINNOMIDADOS" value="${__formdata.VALINNOMIDADOS}"/>
        <input type="hidden" name="preg_resp" id="preg_resp" value=""/>
    	<input type="hidden" name="CEMPRES" id="CEMPRES" value="${__formdata.CEMPRES}"/>
		<input type="hidden" name="CAGENTE_SIN" id="CAGENTE_SIN" value="${__formdata.CAGENTE_SIN}"/>

        <input type="hidden" name="OK" id="OK" value="${__formdata.OK}" />
        <!-- bug 0022153 -->
        <input type="hidden" name="OK_IMPRESO" id="OK_IMPRESO" value="${__formdata.OK_IMPRESO}" />
             <input type="hidden" name="CTIPIDE_AUX" id="CTIPIDE_AUX" value="${__formdata.CTIPIDE_AUX}" />
			 
			 <input type="hidden" name="IDSOLIDARIDAD" id="IDSOLIDARIDAD" value="${__formdata.IDSOLIDARIDAD}" /> 
     
            <c:import url="../include/modal_estandar.jsp">
                    <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axissin032" c="IMPRIMIR" lit="1000205" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                    <c:param name="titulo"><axis:alt f="axissin032" c="titul_axisper021" lit="1000065"/></c:param>
                    <c:param name="nid">axisper021</c:param>
        </c:import>  
         <c:import url="../include/modal_estandar.jsp">
                    <c:param name="titulo"><axis:alt f="axissin032" c="titul_axisper063" lit="9906698"/></c:param>
                    <c:param name="nid">axissin063</c:param>
        </c:import>  
           <c:import url="../include/modal_estandar.jsp">
                    <c:param name="titulo"><axis:alt f="axissin032" c="TITULO_EDIT" lit="1000573" /></c:param>
                    <c:param name="nid" value="axisediciontexto" />
            </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt c="TITULO_022" f="axissin032" lit="1000214"/></c:param>
            <c:param name="nid" value="axisper022"/>
        </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axissin032" c="titulo_axissin002" lit="1000230" /></c:param>
                <c:param name="nid" value="axissin002" />
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axissin032" c="titulo_axissin004" lit="1000232" /></c:param>
                <c:param name="nid" value="axissin004" />
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axissin032" c="titulo_axisctr019" lit="1000188" /></c:param>
                <c:param name="nid" value="axisctr019"></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axissin032" c="titulo_axissin044" lit="9902468" /></c:param>
                <c:param name="nid" value="axissin044"></c:param>
            </c:import>
             <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axissin032" c="titulo_axissin052" lit="9903634" /></c:param>
                <c:param name="nid" value="axissin052"></c:param>
            </c:import>
             <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axissin032" c="titulo_axissin053" lit="9903632" /></c:param>
                <c:param name="nid" value="axissin053"></c:param>
            </c:import>
           
             <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axissin032" c="CAGENTE" lit="100584"/></c:param>
                <c:param name="nid" value="axisctr014"></c:param>
            </c:import>

            <!-- bug 0022153 -->
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axissin026" c="titulo_axissin026" lit="9900735" /></c:param>
                <c:param name="nid" value="axissin026" />
            </c:import> 
            
             <!-- MODAL events-->
        
            <c:import url="../include/modal_estandar.jsp">
                    <c:param name="nid_y_titulo">axissin035</c:param>
            </c:import>    
            
            <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
        </c:import> 
            
            <c:import url="../include/modal_estandar.jsp">
                    <c:param name="nid_y_titulo">axissinMessage</c:param>
            </c:import>  
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"><axis:alt f="axissin032" c="modalidad" lit="100592" /></c:param>
                <c:param name="titulo"><axis:alt f="axissin032" c="TITULO_PANT" lit="109808" /></c:param>
                <c:param name="formulario"><axis:alt f="axissin032" c="FORMULARIO" lit="109808" /></c:param>
                <c:param name="producto"></c:param>
                <c:param name="form">axissin032</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin032" c="titulo" lit="1000098" /></div>
                        <!--campos-->
                        <table class="seccion">                        	
                            <tr>
                                <td align="left">
                                    <table class="area" align="center">	                                   
                                        <tr>
                                            <th style="width:18%;height:0px"></th>
                                            <th style="width:18%;height:0px"></th>
                                            <th style="width:18%;height:0px"></th>
                                            <th style="width:18%;height:0px"></th>
                                            <th style="width:18%;height:0px"></th>
                                            <th style="width:10%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <!-- Numero de poliza -->
                                            <axis:visible f="axissin032" c="NPOLIZA"> 
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin032" c="NPOLIZA" lit="9001514"/></b>
                                                    <img border="0" src="images/find.gif" onclick="f_abrir_axisctr019()" style="cursor:pointer"/>
                                                </td>
                                            </axis:visible>
                                            <!-- Certificado -->
                                            <axis:visible f="axissin032" c="NCERTIF">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin032" c="NCERTIF" lit="101300"/></b>
                                                </td>
                                            </axis:visible>
                                            <!-- Situacion -->
                                            <axis:visible f="axissin032" c="TSITUAC">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin032" c="TSITUAC" lit="100874"/></b>
                                                </td>
                                            </axis:visible>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axissin032" c="TPRODUC" lit="100829" /></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <!-- Numero de poliza -->
                                            <axis:visible f="axissin032" c="NPOLIZA"> 
                                                <td class="campocaja">
                                                    <input tabindex="1" type="text" class="campodisabled campo campotexto" onfocus="pasarAlSiguiente(this)" id="NPOLIZA" name="NPOLIZA" size="15"  
                                                    value="${__formdata.NPOLIZA}" <axis:atr f="axissin032" c="NPOLIZA" a="modificable=false"/> />
                                                </td>
                                            </axis:visible>
                                            <!-- Certificado -->
                                            <axis:visible f="axissin032" c="NCERTIF">
                                                <td class="campocaja">
                                                          <input tabindex="2" type="text" class="campodisabled campo campotexto" onfocus="pasarAlSiguiente(this)" id="NCERTIF" name="NCERTIF" size="15" style="width:35%;"
                                                          value="${__formdata.NCERTIF}" <axis:atr f="axissin032" c="NCERTIF" a="modificable=false"/> />
                                                </td>
                                            </axis:visible>
                                             <!-- Situacion -->
                                            <axis:visible f="axissin032" c="TSITUAC">
                                                <td class="campocaja">
                                                    <input type="text"  tabindex="3" class="campodisabled campo campotexto" onfocus="pasarAlSiguiente(this)" id="TSITUAC" name="TSITUAC" size="15" 
                                                    value="${__formdata.TSITUAC}" <axis:atr f="axissin032" c="TSITUAC" a="modificable=false"/> />
                                                </td>
                                            </axis:visible>
                                            <td colspan="2" class="campocaja">
                                            <axis:visible f="axissin032" c="TPRODUC">
                                                    <input type="text" tabindex="4" class="campodisabled campo campotexto" onfocus="pasarAlSiguiente(this)" id="TPRODUC"  name="TPRODUC" readonly="true"
                                                     value="${__formdata.TPRODUC}"/>
                                            </axis:visible>
                                            </td>
                                        </tr>
                                        <tr>
                                         <!-- Fecha efecto -->
                                            <axis:visible f="axissin032" c="FEFECTO">
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axissin032" c="FEFECTO" lit="100883"/></b>
                                                </td>
                                            </axis:visible>
                                            <!-- Fecha vencimiento -->
                                            <axis:visible f="axissin032" c="FVENCIM">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin032" c="FVENCIM" lit="100885"/></b>
                                                </td>
                                            </axis:visible>
                                            <!-- Fecha anulación -->
                                            <axis:visible f="axissin032" c="FANULAC">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin032" c="FANULAC" lit="140214"/></b>
                                                </td>
                                            </axis:visible>
                                            <axis:visible f="axissin032" c="FCARANU">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin032" c="FCARANU" lit="102626"/></b>
                                                </td>
                                            </axis:visible>
                                             <%-- Agente  bug 4713 AB--%>
                                           <axis:visible c="TAGENTE" f="axissin032">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axissin032" c="TAGENTE" lit="100584"/></b>
                                            </td>
                                            </axis:visible>
                                            
                                            <%-- Sucursal --%>
                                           <axis:visible c="SUCURSAL" f="axissin032">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axissin032" c="SUCURSAL" lit="9909330"/></b>
                                            </td>
                                            </axis:visible>
                                        </tr>
                                        <tr>
                                          <!-- Fecha efecto -->
                                            <axis:visible f="axissin032" c="FEFECTO">
                                                <td class="campocaja">
                                                    <input type="text" tabindex="5" class="campodisabled campo campotexto" id="FEFECTO" name="FEFECTO" onfocus="pasarAlSiguiente(this)" size="15" style="width:60%"
                                                    value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FEFECTO}'/>" <axis:atr f="axissin032" c="FEFECTO" a="modificable=false"/> />
                                                </td>
                                            </axis:visible>
                                            <!-- Fecha vencimiento -->
                                            <axis:visible f="axissin032" c="FVENCIM">
                                                <td class="campocaja">
                                                         <input type="text" tabindex="6" class="campodisabled campo campotexto" id="FVENCIM" name="FVENCIM" onfocus="pasarAlSiguiente(this)" size="15" style="width:60%"
                                                          value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FVENCIM}'/>" <axis:atr f="axissin032" c="FVENCIM" a="modificable=false"/> />
                                                </td>
                                            </axis:visible>
                                           <!-- Fecha anulación -->
                                            <axis:visible f="axissin032" c="FANULAC">
                                                <td class="campocaja">
                                                    <input type="text" tabindex="7" class="campodisabled campo campotexto" id="FANULAC" name="FANULAC" onfocus="pasarAlSiguiente(this)" size="15" style="width:60%"
                                                    value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FANULAC}'/>" <axis:atr f="axissin032" c="FANULAC" a="modificable=false"/> />
                                                </td>
                                            </axis:visible>
                                             <!-- Fecha renovacion anual -->
                                            <axis:visible f="axissin032" c="FCARANU">
                                                <td class="campocaja">
                                                    <input type="text" tabindex="7" class="campodisabled campo campotexto" id="FCARANU" name="FCARANU" onfocus="pasarAlSiguiente(this)" size="15" style="width:60%"
                                                    value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FCARANU}'/>" <axis:atr f="axissin032" c="FCARANU" a="modificable=false"/> />
                                                </td>
                                            </axis:visible>
                                          <axis:visible c="TAGENTE" f="axissin032">
                                            <td class="campocaja" id="TD_TAGENTE">
                                                <input type="text" class="campo campotexto campodisabled" id="TAGENTE" name="TAGENTE" <axis:atr f="axissin032" c="TAGENTE" a="modificable=false&obligatorio=false"/> size="15" style="width:99%"
                                                value="${__formdata.NOMBRE}" readonly="readonly" /> 
                                            </td>
                                          </axis:visible>
                                            
                                             <axis:visible c="SUCURSAL" f="axissin032">
                                            <td class="campocaja" id="TD_SUCURSAL">
                                                <input type="text" class="campo campotexto campodisabled" id="SUCURSAL" name="SUCURSAL" size="15" <axis:atr f="axissin032" c="TSUCURSAL" a="modificable=false&obligatorio=false"/> style="width:99%"
                                                value="${__formdata.TSUCURSAL}" readonly="readonly"/>
                                            </td>
                                          </axis:visible>
                                            
                                        </tr>
                                    <tr><td><div class="separador">&nbsp;</div></td></tr>
                                
                                    <tr tabindex="8" onfocus="pasarAlSiguiente(this)">
                                        <td class="campocaja" colspan="6">
                                        <axis:visible f="axissin032" c="DSP_TOMADORES">
                                        <!-- Seccion Tabla tomadores -->
                                            <!-- DisplayTag preguntas -->
                                            <!-- c : if test="${!empty sessionScope.axisctr_preguntasPoliza}"-->
                                                <c:set var="title0"><axis:alt f="axissin032" c="DSP_TOMADORES" lit="1000181"/></c:set>
                                                <c:set var="title00"><axis:alt f="axissin032" c="DSP_TOMADORES" lit="800440"/></c:set>
                                                <c:set var="title222"><axis:alt f="axissin032" c="BT_CONSULTA" lit="1000439"/></c:set>
                                        
                                                    <div class="displayspace">                         
                                                    <display:table name="${__formdata.T_IAX_TOMADORES}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                     requestURI="axis_axissin032.do?paginar=true">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column title="${title00}" sortable="true" style="width:10%" sortProperty="OB_IAX_TOMADORES.TNOMBRE" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                            <div class="dspText">${miListaId.OB_IAX_TOMADORES.NORDTOM}</div>
                                                        </display:column>
                                                        
                                                        <display:column title="${title0}" sortable="true" style="width:80%" sortProperty="OB_IAX_TOMADORES.TNOMBRE" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                            <div class="dspText">${miListaId.OB_IAX_TOMADORES.TNOMBRE} ${miListaId.OB_IAX_TOMADORES.TAPELLI1} ${miListaId.OB_IAX_TOMADORES.TAPELLI2}</div>
                                                        </display:column>
                                                         <axis:visible f="axissin032" c="BT_CONSUL_TOM"> 
                                                            <display:column title="${title222}" style="width:20%" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                            <div class="dspIcons">
                                                                <img id="find" border="0" src="images/find.gif" onclick="javascript:f_consultar_persona('${miListaId.OB_IAX_TOMADORES.SPERSON}',document.miForm.NSINIES.value);" style="cursor:pointer"/>
                                                                                                                                             
                                                            </div>
                                                             </display:column>  
                                                        </axis:visible>
                                                    </display:table>
                                                </div>
                                                <div class="separador">&nbsp;</div>
                                                <div class="separador">&nbsp;</div>
                                            <!--/c : if-->
                                        </axis:visible>
                                        </td>
                                        <td/>
                                        <td/>
                                        <td/>
                                    
                                    </tr>
                                    
                                    
                            <tr tabindex="9" onfocus="pasarAlSiguiente(this)">
                            <td class="campocaja" colspan="6">
                            
                            <axis:visible f="axissin032" c="DSP_ASEGURADOS">
								<b id="label_DSP_ASEGURADOS"><axis:alt c="DSP_ASEGURADOS" f="${pantalla}" lit="108228"/></b>
                                <div class="displayspace">
                                <c:set var="title0"><axis:alt f="axissin032" c="TTIPIDE" lit="109774"></axis:alt></c:set>
                                <c:set var="title1"><axis:alt f="axissin032" c="NNUMIDE" lit="105330"></axis:alt></c:set>
                                <c:set var="title2"><axis:alt f="axissin032" c="TNOMBRE" lit="105940"></axis:alt></c:set>
                                <c:set var="title3"><axis:alt f="axissin032" c="FNACIMI" lit="1000064"></axis:alt></c:set>
                                <c:set var="title4"><axis:alt f="axissin032" c="TSEXPER" lit="100962"></axis:alt></c:set>                                       
                                <c:set var="title5"><axis:alt f="axissin032" c="FFECFIN" lit="9001510"></axis:alt></c:set> 
                                <c:set var="title6"><axis:alt f="axissin032" c="FNACIMI" lit="1000064"></axis:alt></c:set> 
                                <c:set var="title7"><axis:alt f="axissin032" c="FECRETROACT" lit="9903825"></axis:alt></c:set> 
                                <c:set var="title8"><axis:alt  f="axissin032" c="ASSEGURADOS" lit="100899" /></c:set>
                                
                                <display:table name="${__formdata.RIESGOASE}"
                                               id="PROPIETARIO"
                                               export="false"
                                               class="dsptgtable"
                                               pagesize="-1" sort="list"
                                               cellpadding="0"
                                               cellspacing="0"
                                               requestURI="axis_axissin032.do?paginar=true">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    
                                     <display:column title="${title8}" 
                                                    style="width:15%"
                                                    sortable="true"
                                                    sortProperty="OB_IAX_ASEGURADOS.TTIPIDE"
                                                    headerClass="headwidth5 sortable"
                                                    media="html" 
                                                    autolink="false">
                                         <div class="dspText">
                                            ${PROPIETARIO.OB_IAX_ASEGURADOS.NORDEN}
                                        </div>
                                    </display:column>
                                    
                                    
                                    <display:column title="${title0}" 
                                                    style="width:15%"
                                                    sortable="true"
                                                    sortProperty="OB_IAX_ASEGURADOS.TTIPIDE"
                                                    headerClass="headwidth5 sortable"
                                                    media="html" 
                                                    autolink="false">
                                         <div class="dspText">
                                            ${PROPIETARIO.OB_IAX_ASEGURADOS.TTIPIDE}
                                        </div>
                                    </display:column>
                                    
                                    <display:column title="${title1}" 
                                                    style="width:10%"
                                                    sortable="true"
                                                    sortProperty="OB_IAX_ASEGURADOS.NNUMIDE"
                                                    headerClass="headwidth5 sortable"
                                                    media="html"
                                                    autolink="false">                                            
                                        <div class="dspText">
                                            ${PROPIETARIO.OB_IAX_ASEGURADOS.NNUMIDE}
                                        </div>
                                    </display:column>
                                    
                                    <display:column title="${title2}" 
                                                    style="width:35%"
                                                    sortable="true"
                                                    sortProperty="OB_IAX_ASEGURADOS.TNOMBRE"
                                                    headerClass="headwidth5 sortable"
                                                    media="html"
                                                    autolink="false">                                            
                                        <div class="dspText">
                                            ${PROPIETARIO.OB_IAX_ASEGURADOS.TNOMBRE} 
                                            ${PROPIETARIO.OB_IAX_ASEGURADOS.TAPELLI1} 
                                            ${PROPIETARIO.OB_IAX_ASEGURADOS.TAPELLI2} 
                                        </div>
                                    </display:column>   
                                    
                                    <display:column title="${title6}" 
                                        style="width:10%"
                                        sortable="true"
                                        sortProperty="OB_IAX_ASEGURADOS.FNACIMI"
                                        headerClass="headwidth5 sortable"
                                        media="html"
                                        autolink="false">
                                        <div class="dspText">
                                        <fmt:formatDate pattern="dd/MM/yyyy" 
                                        value="${PROPIETARIO.OB_IAX_ASEGURADOS.FNACIMI}"/>
                                        </div>
                                    </display:column> 
                                    
                                   <display:column title="${title4}" 
                                                    style="width:15%"
                                                    sortable="true"
                                                    sortProperty="OB_IAX_ASEGURADOS.TSEXPER"
                                                    headerClass="headwidth5 sortable"
                                                    media="html"
                                                    autolink="false">                                            
                                        <div class="dspText">
                                            ${PROPIETARIO.OB_IAX_ASEGURADOS.TSEXPER} 
                                        </div>
                                    </display:column>
                                    
                                 <display:column title="${title5}" 
                                                    style="width:10%"
                                                    sortable="true"
                                                    sortProperty="OB_IAX_ASEGURADOS.FFECFIN"
                                                    headerClass="headwidth5 sortable"
                                                    media="html"
                                                    autolink="false">                                            
                                        <div class="dspText">
                                        <fmt:formatDate pattern="dd/MM/yyyy" 
                                        value="${PROPIETARIO.OB_IAX_ASEGURADOS.FFECFIN}"/>
                                        </div>
                                </display:column>
                                    
                                <display:column title="${title7}" 
                                        style="width:10%"
                                        sortable="true"
                                        sortProperty="OB_IAX_ASEGURADOS.FECRETROACT"
                                        headerClass="headwidth5 sortable"
                                        media="html"
                                        autolink="false">
                                        <div class="dspText">
                                        <fmt:formatDate pattern="dd/MM/yyyy" 
                                        value="${PROPIETARIO.OB_IAX_ASEGURADOS.FECRETROACT}"/>
                                        </div>
                                </display:column>
                                </display:table>
                                </div>
                            </axis:visible>
                            </td>                                    
                            </tr> 
                                    
                                    
                            <!-- Seccion tabla Riesgos -->    	
                            <tr >
                                <td colspan="6"  class="campocaja" >
                                <axis:visible f="axissin032" c="DSP_RIESGOS">
                                    <!-- DisplayTag preguntas -->
                                    <!-- c : if test="${!empty sessionScope.axisctr_preguntasPoliza}"-->
                                        <c:set var="title0">&nbsp;</c:set>
                                        <c:set var="title1"><axis:alt f="axissin032" c="DSP_RIESGOS" lit="102500"/></c:set>
                                        <c:set var="title11"><axis:alt f="axissin032" c="DSP_RIESGOS" lit="800440"/></c:set>
                                        <c:set var="title222"><axis:alt f="axissin032" c="BT_CONSULTA" lit="1000439"/></c:set>
                                        <div class="displayspace" >         
                                        
                                            <display:table name="${__formdata.T_IAX_RIESGOS}" id="miListaId2" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                             requestURI="axis_axissin032.do?paginar=true">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                
                                                <display:column title="${title11}" sortable="true" style="width:10%" sortProperty="OB_IAX_RIESGOS.NRIESGO" headerClass="sortable"  media="html" autolink="false">
                                                    <div class="dspText" id="selectedTRiesgo" name="selectedTRiesgo">${miListaId2.OB_IAX_RIESGOS.NRIESGO}</div>
                                                </display:column>
                                                
                                                <display:column title="${title0}" style="width:10%" sortable="false" sortProperty="selectedRiesgo" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                    <div class="dspIcons" tabindex="9" onfocus="pasarAlSiguiente(this)"><input <c:if test="${__formdata.NRIESGO == miListaId2.OB_IAX_RIESGOS.NRIESGO || __formdata.SIZE_RIESGOS == 1}">checked</c:if> onClick="javascript:f_seleccionar_riesgo(this, this.value);" value="${miListaId2.OB_IAX_RIESGOS.NRIESGO},${miListaId2.OB_IAX_RIESGOS.TRIESGO}" type="radio" id="selectedRiesgo" name="selectedRiesgo"/></div>
                                                </display:column>
                                                <display:column title="${title1}" sortable="true" style="width:70%" sortProperty="OB_IAX_RIESGOS.TRIESGO" headerClass="sortable"  media="html" autolink="false">
                                                    <div class="dspText" id="selectedTRiesgo" name="selectedTRiesgo">${miListaId2.OB_IAX_RIESGOS.TRIESGO}</div>
                                                </display:column>
                                                
                                                 <axis:visible f="axissin032" c="BT_CONSUL_ASE"> 
                                                    <display:column title="${title222}"  style="width:20%" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                    <div class="dspIcons">

                                                    <c:if test="${!empty miListaId2.OB_IAX_RIESGOS.RIESGOASE}">
                                                        <c:if test="${!empty miListaId2.OB_IAX_RIESGOS.RIESGOASE[0].OB_IAX_ASEGURADOS.SPERSON}">
                                                            <img id="find" border="0" src="images/find.gif" onclick="javascript:f_consultar_persona('${miListaId2.OB_IAX_RIESGOS.RIESGOASE[0].OB_IAX_ASEGURADOS.SPERSON}',document.miForm.NSINIES.value);" style="cursor:pointer"/>
                                                         </c:if>  
                                                    </c:if>                                                                   
                                                    </div>
                                                   </display:column>  
                                                </axis:visible>
                                            </display:table>
                                        </div>
                                    <!--/c : if-->
                                </axis:visible>
                                </td>
                                <td/>
                                <td/>
                                <td/>
                            </tr>
                        </table>
                        
                        <!-- Seccion datos ultimo recibo -->
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin032" c="ULTRECIBO" lit="111635" /></div>
                        <!--campos-->
                        <table class="seccion">
                               <tr>
                                    <td align="left" >
                                      <table class="area" align="center"  tabindex="10" onfocus="pasarAlSiguiente(this)">
                                        <tr>
                                            <td align="left" class="campocaja">
                                             <axis:visible f="axissin032" c="DSP_ULT_RECIBO">
                                                <!-- DisplayTag último recibo -->
                                                <c:set var="title0"><axis:alt f="axissin032" c="TRIESGO" lit="100895"/></c:set>
                                                <c:set var="title1"><axis:alt f="axissin032" c="FEFECTO_ULTREC" lit="100883"/></c:set>
                                                <c:set var="title2"><axis:alt f="axissin032" c="DSP_ULT_RECIBO_FVENCIM" lit="100885"/></c:set>
                                                <c:set var="title3"><axis:alt f="axissin032" c="ICONCEP" lit="100563"/></c:set>
                                                <c:set var="title4"><axis:alt f="axissin032" c="TTIPREC" lit="102302"/></c:set>
                                                <c:set var="title5"><axis:alt f="axissin032" c="TESTREC" lit="100874"/></c:set>
                                                 <axis:visible c="TCESTIMP" f="axissin032"> 
                                                 <c:set var="title6"><axis:alt f="axissin032" c="TCESTIMP" lit="9902593"/></c:set>
                                                  </axis:visible>
                                                <div class="displayspace">
                                          
                                                    <display:table name="${__formdata.T_IAX_LASTRECIBO}" id="miListaIdRecibo" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                    requestURI="axis_axissin032.do?paginar=true"> 
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column title="${title0}" sortable="true" sortProperty="NRECIBO" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                                            <div class="dspNumber">${miListaIdRecibo.NRECIBO}</div>
                                                        </display:column>
                                                        <display:column title="${title1}" sortable="true" sortProperty="FEFECTO" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaIdRecibo.FEFECTO}"/></div>
                                                        </display:column>
                                                        <display:column title="${title2}" sortable="true" sortProperty="FVENCIM" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaIdRecibo.FVENCIM}"/></div>
                                                        </display:column>                                            
                                                        <display:column title="${title3}" sortable="true" sortProperty="ICONCEP" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                                            <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONEDAPROD]}" value="${miListaIdRecibo.ICONCEP}"/></div>
                                                        </display:column>                                                                                        
                                                        <display:column title="${title4}" sortable="true" sortProperty="TTIPREC" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                                            <div class="dspText">${miListaIdRecibo.TTIPREC}</div>
                                                        </display:column>                                                                                                                                    
                                                        <display:column title="${title5}" sortable="true" sortProperty="TESTREC" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                                            <div <c:if test="${miListaIdRecibo['CESTREC']==0}">class="dspTextAviso"</c:if> <c:if test="${miListaIdRecibo['CESTREC']!=0}">class="dspText"</c:if>>${miListaIdRecibo['TESTREC']}</div>
                                                        </display:column>
                                                          <axis:visible c="TCESTIMP" f="axissin032"> 
                                                        <display:column title="${title6}" sortable="true" sortProperty="TCESTIMP" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                                            <div class="dspText">${miListaIdRecibo['TCESTIMP']}</div>
                                                        </display:column> 
                                                        </axis:visible>
                                                    </display:table>
                                                </div>
                                                </axis:visible>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align:right">
                                                 <div class="separador">&nbsp;</div>
                                                 <input type="button" tabindex="11" onfocus="pasarAlSiguiente(this)" class="boton" id="but_mas_recibos" value="<axis:alt f="axissin032" c="but_mas_recibos" lit="1000232" />" onclick="f_abrir_axissin004()" />
                                            </td>
                                        </tr>  
                                      </td>
                                     </tr>
                                   </table>
                                   </table>
                              <axis:visible f="axissin032" c="DSP_AVISOS"> 
                <c:if test="${!empty requestScope.PLSTAVISOS}">
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin032" c="DSP_AVISOS" lit="700145" /></div>       
                                   <table class="seccion">
            <!--campos-->
                 <tr>
                    <td align="left" >
                      <table class="area" align="center">
                        <tr>
                            <td align="left" class="campocaja">
                                <!-- DisplayTag avisos -->
                                <c:set var="title0"><axis:alt f="axissin032" c="CAVISO" lit="103465" /></c:set>
                                <c:set var="title1"><axis:alt f="axissin032" c="TAVISO" lit="9000642" /></c:set>
                                <c:set var="title2"><axis:alt f="axissin032" c="TTIPAVISO" lit="9902103" /></c:set>
                                <c:set var="title3"><axis:alt f="axissin032" c="TMENSAJE" lit="9902104" /></c:set>
                                
                                <div class="displayspace">
                                
                                    <display:table name="${requestScope.PLSTAVISOS}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                    requestURI="axis_axissin032.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <axis:visible f="axissin032" c="CAVISO"> 
                                        <display:column title="${title0}" sortable="true" sortProperty="CAVISO" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                            <div class="dspNumber">${miListaId.OB_IAX_AVISO.CAVISO}</div>
                                        </display:column>
                                          </axis:visible>
                                          <axis:visible f="axissin032" c="TAVISO"> 
                                         <display:column title="${title1}" sortable="true" sortProperty="TAVISO" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                            <div class="dspText">${miListaId.OB_IAX_AVISO.TAVISO}</div>
                                        </display:column>
                                        </axis:visible>
                                          <axis:visible f="axissin032" c="TTIPAVISO"> 
                                        <display:column title="${title2}" sortable="true" sortProperty="TTIPAVISO" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                            <div class="dspText">${miListaId.OB_IAX_AVISO.TTIPAVISO}</div>
                                        </display:column> 
                                        </axis:visible>
                                          <axis:visible f="axissin032" c="TMENSAJE"> 
                                        <display:column title="${title3}" sortable="true" sortProperty="TMENSAJE" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                            <div class="dspText"   <c:if test="${miListaId.OB_IAX_AVISO.CBLOQUEO == 1}"> style="color:red" </c:if> >${miListaId.OB_IAX_AVISO.TMENSAJE}</div>
                                        </display:column>  
                                        </axis:visible>
                                          <axis:visible f="axissin032" c="CBLOQUEO"> 
                                        <display:column title="" sortable="true" sortProperty="CBLOQUEO" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                          <div class="dspIcons">
                                              <c:choose>
                                                  <c:when test="${miListaId.OB_IAX_AVISO.CBLOQUEO == 1}">
                                                    <img border="0" src="images/mensaje_error.gif"   width="16px" height="16px"/>
                                                  </c:when>
                                                  <c:when test="${miListaId.OB_IAX_AVISO.CBLOQUEO == 2}">
                                                    <img border="0" src="images/mensaje_info.gif"  width="16px" height="16px"/>
                                                  </c:when>
                                                  <c:otherwise>
                                                     <img border="0" src="images/formulap.gif"  width="16px" height="16px"/>
                                                  </c:otherwise>
                                              </c:choose>
                                          </div>
                                        </display:column>  
                                        </axis:visible>
                                                                                                                                                                             
                                    </display:table>
                                </div>
                             </td>
                        </tr>
                       
                       </td>
                    </tr>
                </table>
             </table>
             </c:if>
</axis:visible>   

<axis:visible f="axissin032" c="DSP_SOLIDARIDAD">

<div class="titulo">
	<img src="images/flecha.gif" />
	<axis:alt f="axissin032" c="SOLIDARIDAD" lit="105387" />
</div>
<table class="seccion" align="center" id="TABCOASEGURO" name="TABCOASEGURO"vercellpadding="0" cellspacing="0">
	<tr>
		<td>

			<table class="seccion">
				<table class="area" align="center">
					<tr>
						<th style="width: 20%; height: 0px"></th>
						<th style="width: 20%; height: 0px"></th>
						<th style="width: 20%; height: 0px"></th>
						<th style="width: 20%; height: 0px"></th>
						<th style="width: 20%; height: 0px"></th>
					</tr>

					<tr>
						<td class="titulocaja"><b id="label_SINSOLIDARIDAD"><axis:alt
									c="SINSOLIDARIDAD" f="axissin032" lit="9909562" /></b></td>
						<td class="titulocaja"><b id="label_CONSOLIDARIDAD"><axis:alt
									c="CONSOLIDARIDAD" f="axissin032" lit="9909561" /></b></td>

					</tr>
					<tr>
						<td class="campocaja"><input type="radio"
							id="SINSOLIDARIDAD" size="15" name="SOLIDARIDAD"
							value="0" onclick="f_onclickCheckbox()" /></td>

						<td class="campocaja"><input type="radio"
							id="CONSOLIDARIDAD" size="15" name="SOLIDARIDAD"
							value="1" onclick="f_onclickCheckbox()" /></td>
					</tr>
				</table>
				</td>
				</tr>
			</table>
</table> 
</axis:visible>                     
                       
 <c:import url="axissin032_body.jsp"/>
 
