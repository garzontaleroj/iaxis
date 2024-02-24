<%-- 
*  Fichero: axisrea052.jsp
*  @author <a href =  "mailto:erhernandez@csi-ti.com">Edgar Hernandez</a>
*
*  Fecha: 23/01/2017
*/
--%>
<%@ page contentType="text/html;charset=UTF-8" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes"%>
<%@ page import="java.util.*"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
     <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
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
    <!--*********************************** --> 

    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload_axisrea052() {
            
        	if (document.referrer.indexOf("main.do")>0) { objSeccion.seccionPorAbrirCookieBorrar("axisrea052");}
            if (document.referrer.indexOf("main.do")>0) { objSeccion.posicionPorColorcarCookieBorrar("axisrea052");}
           	f_cargar_propiedades_pantalla();
           	revisarEstilos();
           	
           	
           	
           	objSeccion.abrirSeccionesPorAbrir("axisrea052");
            objSeccion.colocarPosicionPorColocar("axisrea052");
        }
        
                
        function f_but_aceptar() {
        	revisarEstilos();
            parent.f_cerrar_axisrea052();
            formdataSPERSON = '${__formdata.SPERSON}';
            parent.f_aceptar_axisrea052(formdataSPERSON);
        }
        
        function f_but_cancelar() {        
            revisarEstilos();
            parent.f_cerrar_axisrea052();
            formdataSPERSON = '${__formdata.SPERSON}';
            parent.f_aceptar_axisrea052(formdataSPERSON);
        }             
        
        function f_but_salir() {
        	formdataCMODO = '${__formdata.CMODO}';
        	if(formdataCMODO=='ALTA_POLIZA'||formdataCMODO=='MANTTO_PER'){
        	 revisarEstilos();
        	 parent.f_cerrar_axisrea052();
        	}else{
        		objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisrea052", "cancelar", document.axisrea052Form, "_self");
        	} 
        }
        
        
        function f_but_9001312(){
        	if (objValidador.validaEntrada()) {
                  objUtiles.ejecutarFormulario("axis_axisrea052.do", "calcular",  document.axisrea052Form, "_self", objJsMessages.jslit_cargando);
          	}
        }
        
            
        /****************************************************************************************/
        /*********************************** CALLBACK AJAX **************************************/
        /****************************************************************************************/
        
        

        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        /****************************************************************************************/
        /************************************** AXISREA053***************************************/
        /****************************************************************************************/
        
          function f_abrir_axisrea053(CMODO, TIPCOMP, NNUMIDE, SPERSON) {   
        	   FCORTE = "<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FCORTE}'/>"   	   
             objUtiles.abrirModal("axisrea053", "src", "modal_axisrea053.do?operation=form&FCORTE="+FCORTE+"&NNUMIDE="+NNUMIDE+"&TIPCOMP="+TIPCOMP+"&CMODO="+CMODO+"&SPERSON="+SPERSON);
          }   
        
          function f_cerrar_axisrea053(){
             objUtiles.cerrarModal("axisrea053");
  
          } 
          
        /****************************************************************************************/
        /************************************** AXISREA054***************************************/
        /****************************************************************************************/
          function f_abrir_axisrea054(NNUMIDE) {    
        	 FCORTE = "<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FCORTE}'/>"  
             CESVALOR = "${__formdata.CESVALOR}";
             CMODO = "${__formdata.CMODO}";
             SPERSON = "${__formdata.SPERSON}";
             CAGENTE = "${__formdata.CAGENTE}";
             objUtiles.abrirModal("axisrea054", "src", "modal_axisrea054.do?operation=form&FCORTE="+FCORTE+"&NNUMIDE="+NNUMIDE+"&CESVALOR="+CESVALOR+"&CMODO="+CMODO+"&SPERSON="+SPERSON+"&CAGENTE="+CAGENTE);

          }     
        
          function f_cerrar_axisrea054(){
             objUtiles.cerrarModal("axisrea054");
             CMODO = "${__formdata.CMODO}";
             if(CMODO!="ALTA_POLIZA"&&CMODO!="MANTTO_PER"){	
             	f_but_9001312();
			 }	
          } 
        
        /****************************************************************************************/
        /************************************** AXISPER021***************************************/
        /****************************************************************************************/          
         
          function f_abrir_axisper021() {
			var SSEGURO = "${__formdata.SSEGURO}";
			var CAGENTE = "${__formdata.CAGENTE}";
			objUtiles.abrirModal("axisper021", "src","modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="+ CAGENTE + "&SSEGURO=" + SSEGURO);
		  }
        
      	  
      	  
      	  
      	function f_aceptar_persona(SPERSON, CAGENTE, SNIP, modal) {

    		f_cerrar_modalespersona(modal);

    		var porigen = 'INT';
    		if (modal == 'axisper022')
    			porigen = 'NUEVO';

    		document.axisrea052Form.SPERSON.value = SPERSON;
    		
    		document.axisrea052Form.ORIGEN.value = porigen;
    		document.axisrea052Form.SNIP.value = SNIP;
    		document.axisrea052Form.CAGENTE_VISIO.value = CAGENTE;

    		if (!objUtiles.estaVacio(SPERSON)) {
    			objAjax.invokeAsyncCGI("axis_axisrea052.do?SPERSON_REL=" + SPERSON
    					+ "&CAGENTE1=" + CAGENTE, callbackAjaxActualitzaPersona,
    					"operation=ajax_actualizar_persona", this,
    					objJsMessages.jslit_cargando);
    		}

    		
    	}
      	
      	function callbackAjaxActualitzaPersona(ajaxResponseText) {
    		try {
    			var doc = objAjax.domParse(ajaxResponseText);

    			if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
    				
    				objDom.setValorPorId("NNUMIDE", objDom
    						.getValorNodoDelComponente(doc
    								.getElementsByTagName("NNUMIDE"), 0, 0));
    				
    				var APELLIDO1 = ((objUtiles.hayValorElementoXml(doc
    						.getElementsByTagName("TAPELLI1")[0])) ? objDom
    						.getValorNodoDelComponente(doc
    								.getElementsByTagName("TAPELLI1"), 0, 0) : "");
    				
    				var APELLIDO2 = ((objUtiles.hayValorElementoXml(doc
    						.getElementsByTagName("TAPELLI2")[0])) ? objDom
    						.getValorNodoDelComponente(doc
    								.getElementsByTagName("TAPELLI2"), 0, 0) : "");
    				
    				var NOMBRE = ((objUtiles.hayValorElementoXml(doc
    						.getElementsByTagName("TNOMBRE")[0])) ? objDom
    						.getValorNodoDelComponente(doc
    								.getElementsByTagName("TNOMBRE"), 0, 0) : "");
    				
    				var SPERSON = ((objUtiles.hayValorElementoXml(doc
    						.getElementsByTagName("SPERSON")[0])) ? objDom
    						.getValorNodoDelComponente(doc
    								.getElementsByTagName("SPERSON"), 0, 0) : "");
    				
    				objDom.setValorPorId("NOMBRE",  APELLIDO1 + ' '
    						+ APELLIDO2 + " " + NOMBRE);
    				
    				objDom.setValorPorId("SPERSON", SPERSON);
    				
    				var CAGENTE = ((objUtiles.hayValorElementoXml(doc
    						.getElementsByTagName("CAGENTE")[0])) ? objDom
    						.getValorNodoDelComponente(doc
    								.getElementsByTagName("CAGENTE"), 0, 0) : "");
    				
    				objDom.setValorPorId("CAGENTE", CAGENTE);

    				
    				
    			}

    		} catch (e) {
    		}
    	}
      	
      	function f_nova_persona(){
            var CAGENTE = "${__formdata.CAGENTE}";
            objUtiles.cerrarModal("axisper021");
            objUtiles.abrirModal("axisper022","src","modal_axisper022.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBPRIV&CAGENTE="+CAGENTE);  
        }
         
        function f_abrir_axisper023() {        
            var CAGENTE = $("#CAGENTE").val()
            var SPERSON = $("#SPERSON").val()
            
            if (!objUtiles.estaVacio(SPERSON)){
                objUtiles.abrirModal("axisper023", "src", "modal_axisper023.do?operation=init&AXISMPRXXX=axisper023&SPERSON="+SPERSON+"&CAGENTE="+CAGENTE);            
            }
        }
        
        function f_aceptar_axisper023(){
            objUtiles.cerrarModal("axisper023");
        }    
        
        function f_aceptar_axisper023(){
            objUtiles.cerrarModal("axisper023");
        }  
        
        function f_cerrar_axisper022() {
    		f_cerrar_modalespersona("axisper022");
    	}

    	function f_cerrar_axisper021() {
    		f_cerrar_modalespersona("axisper021");
    	}
        
        function f_cerrar_modalespersona(modal) {
    		objUtiles.cerrarModal(modal);
    	}
        
        function cambiarDisplay(value) {
    		if (value == 1) {
    			celdaCompania1.style.display = "";
    			celdaOficina1.style.display = "";
    			celdaCompania2.style.display = "";
    			celdaOficina2.style.display = "";
    		} else {
    			celdaCompania1.style.display = "none";
    			celdaOficina1.style.display = "none";
    			celdaCompania2.style.display = "none";
    			celdaOficina2.style.display = "none";
    		}
    	}
                       
        /****************************************************************************************/
        /************************************** DOCUMENTACION *******************************************/
        /****************************************************************************************/
        
        function f_but_1000615() { // Aadir documentacin
            f_abrir_modal("axisper030", true, "&SPERSON=${dades_persona.SPERSON}&CAGENTE=${dades_persona.CAGENTE}");
            
        }
        
        function f_modifdocum(SPERSON,IDDOCGEDOX){
            f_abrir_modal("axisper030", true, "&SPERSON="+SPERSON+"&CAGENTE=${__formdata.CAGENTE}&IDDOCGEDOX="+IDDOCGEDOX);
    
        }
        
        function f_aceptar_axisper030(){
            objUtiles.cerrarModal("axisper030");
            SPERSON = "${__formdata.SPERSON}";
            objUtiles.ejecutarFormulario("axis_axisrea052.do?&SPERSON="+SPERSON, "form", document.miForm, "_self", objJsMessages.jslit_cargando); 
        }
        
        /****************************************************************************************/
        /************************************** UTILES *******************************************/
        /****************************************************************************************/
        function f_cerrar_modal(pantalla){
            objUtiles.cerrarModal(pantalla);
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
        
        function f_formatdate(entrada,title){
            var jDate = new JsFecha();
            if(entrada.value.length>0){
              entrada.value=jDate.formateaFecha(entrada.value);
                  
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    alert("<axis:alt f="axisfic002" c="ALER_ERR" lit="1000421"/>");
                }
            }
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
        
        
    </script>  

  </head>
  <body onload="f_onload_axisrea052()">
 
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>  
         
    <c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt c="TITULO_021" f="axisrea052" lit="1000178" />
		</c:param>
		<c:param name="nid" value="axisper021" />
	</c:import>
	
	<c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
             <axis:alt c="TITULO_022" f="axisrea052" lit="1000214"/>
        </c:param>
         <c:param name="nid" value="axisper022"/>
    </c:import>      
     
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
                <axis:alt c="MODPER023" f="axisrea052" lit="9001817"/>
        </c:param>
        <c:param name="nid" value="axisper023"/>
    </c:import> 
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
                <axis:alt c="CONREA053" f="axisrea052" lit=""/>
        </c:param>
        <c:param name="nid" value="axisrea053"/>
    </c:import>  
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
                <axis:alt c="CONREA054" f="axisrea052" lit=""/>
        </c:param>
        <c:param name="nid" value="axisrea054"/>
    </c:import>  
      
    <form name="axisrea052Form" action="" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="ORIGEN" id="ORIGEN" value="${__formdata.ORIGEN}" />
        <input type="hidden" name="CAGENTE_VISIO" value="${__formdata.CAGENTE_VISIO}" /> 
        <input type="hidden" name="SNIP" value="${__formdata.SNIP}" />
        <input type="hidden" name="CMODO" value="${__formdata.CMODO}"/>
        <input type="hidden" name="CAGENTE"  value="${__formdata.CAGENTE}"/>

        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisrea052" c="formulario" lit="9910285" /></c:param>
            <c:param name="producto"><axis:alt f="axisrea052" c="producto" lit="9910285" /></c:param>
            <c:param name="form">axisrea052</c:param>
        </c:import>


        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:300px">
            <div class="separador">&nbsp;</div>
            <tr>
                <td>
                    <table class="seccion">
                    	<tr>
			               <td align="left">
			                  <table class="area" align="center">
                       		  	<tr>
                       		  		<th style="width:25%;height:0px"></th>
                       		  		<th style="width:25%;height:0px"></th>
                       		  		<th style="width:25%;height:0px"></th>
                       		  		<th style="width:25%;height:0px"></th>
	                            </tr>
	                            <tr>
	                            	
	                            	<axis:visible f="axisrea052" c="FCORTE">
		                             <td class="titulocaja" id="LIT_FCORTE" colspan="1">
		                               <b><axis:alt f="axisrea052" c="FCORTE" lit="9910301"/></b>
		                             </td>
		                           </axis:visible>  
		                           
		                           <axis:visible f="axisrea052" c="CESVALOR">
		                             <td class="titulocaja" id="LIT_CESVALOR" colspan="1">
		                               <b><axis:alt f="axisrea052" c="CESVALOR" lit="9910302"/></b>
		                             </td>
		                           </axis:visible>  
		                           
		                           <axis:visible f="axisrea052" c="NNUMIDE">
		                             <td class="titulocaja" id="LIT_NNUMIDE" colspan="1">
		                               <b><axis:alt f="axisrea052" c="NNUMIDE" lit="9905397"/></b>
		                             </td>
		                           </axis:visible> 
		                           
		                           <axis:visible f="axisrea052" c="TNOMBRE">
		                             <td class="titulocaja" id="LIT_TNOMBRE" colspan="1">
		                               <b><axis:alt f="axisrea052" c="TNOMBRE" lit="105940"/></b>
		                             </td>
		                           </axis:visible>  
		                           
		                               
	                            </tr>
	                            <tr>
	                            	
	                            	<axis:visible f="axisrea052" c="FCORTE" >
		                               <td class="campocaja" colspan="1">
		                               	  <jsp:useBean id="todayFCORTE" class="java.util.Date" />	
		                                  <c:set var="FCORTE"><fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCORTE}"/></c:set> 
		                                  <input type="text" <c:if test="${__formdata.CMODO == 'ALTA_POLIZA'}"> readonly="readonly" </c:if> 
		                                  		 onblur="javascript:f_formatdate(this,'')" formato="fecha" <axis:atr f="axisrea052" c="FCORTE" a="modificable=true&isInputText=true&obligatorio=true"/>  alt="<axis:alt f="axisrea052" c="FCORTE" lit="9910301"/>" title="<axis:alt f="axisrea052" c="FCORTE" lit="9910301"/>"
		                                         name="FCORTE" id="FCORTE"  value="${FCORTE} <c:if test="${empty FCORTE}"><fmt:formatDate pattern="dd/MM/yyyy" value="${todayFCORTE}"/></c:if>"
		                                         style="width:90%;" class="campowidthinput campo campotexto_ob"/>
		                                           <axis:visible c="ICO_FCORTE" f="axisrea052">
		                                                <a id="icon_FCORTE" style="vertical-align:middle;">
		                                            <img alt="<axis:alt f="axisrea052" c="SELECT" lit="108341"/>" title="<axis:alt f="axisrea052" c="ICO_FCORTE" lit="9910301" />" src="images/calendar.gif"/></a>
		                                  </axis:visible>
		                               </td>
		                           </axis:visible> 
		                           
		                           <axis:visible f="axisrea052" c="CESVALOR" >
		                               <td class="campocaja" colspan="1">       
		                           		<select name="CESVALOR" id="CESVALOR" size="1" class="campowidthselect campo campotexto" style="width:90%;"
		                                        title="<axis:alt f="axisrea052" c="CESVALOR" lit="9910302"/>"
		                                        <axis:atr f="axisrea052" c="CESVALOR" a="obligatorio=true"/>
		                                        <c:if test="${__formdata.CMODO == 'ALTA_POLIZA'}"> disabled="disabled" </c:if>>&nbsp;
		                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea052" c="C_CESVALOR" lit="1000348"/> - </option>
		                                    <c:forEach var="element" items="${__formdata.listValores.lstTipoDeCumulo}">
		                                        <option value = "${element.CATRIBU}" 
		                                        <c:if test="${element.CATRIBU == __formdata.CESVALOR}"> selected </c:if> />
		                                            ${element.TATRIBU} 
		                                        </option>
		                                    </c:forEach>
		                                </select>            
		                               </td>
		                           </axis:visible> 
		                           
		                           <axis:visible  f="axisrea052" c="SPERSON" >
		                           		<td class="campocaja" colspan="2">
		                           		 	<input type="hidden" name="SPERSON"
												value="${__formdata.SPERSON}"
												class="campowidthinput campo campotexto" style="width: 99%"
												<axis:atr f="axisrea052" c="SPERSON" a="modificable=false&obligatorio=true"/> />
												<input type="text" id="NNUMIDE" name="NNUMIDE"
												value="${__formdata.NNUMIDE}" 
												class="campowidthinput campo campotexto" style="width: 20%"
												title="<axis:alt f="axisrea052" c="NNUMIDE" lit="9904434"/>"
												<axis:atr f="axisrea052" c="NNUMIDE" a="modificable=false&obligatorio=true"/> />
												<c:if test="${__formdata.CMODO!='ALTA_POLIZA' && __formdata.CMODO != 'MANTTO_PER'}">
													<img id="find" border="0" src="images/find.gif" 
													onclick="f_abrir_axisper021()" style="cursor: pointer" />
											    </c:if>
										
									   		<input type="text"
												id="NOMBRE" name="NOMBRE" value="${__formdata.NOMBRE}"
												class="campowidthinput campo campotexto" style="width: 70%"
												<axis:atr f="axisrea052" c="NOMBRE" a="modificable=false&obligatorio=true"/> />
									   </td>
	                            	</axis:visible>
	                            </tr>
	                </table>  
	           </td>
	         </tr>                  
	         <!-- Registro General -->
	         <axis:visible c="DSP_REGIGENERAL" f="axisrea052">									
										<tr>
											<td class="campocaja">
											<img src="images/mes.gif" id="DSP_REGIGENERAL_parent" onclick="objEstilos.toggleDisplay('DSP_REGIGENERAL', this)" style="cursor: pointer" /> 
												<b><axis:alt f="axisrea052" c="CREGIGENERAL" lit="9910288" /></b>
												<hr class="titulo">
											</td>
										</tr>
										<tr id="DSP_REGIGENERAL_children" style="display:yes">
											<td class="campocaja">
												<div class="displayspace" style="overflow:auto;width:97%">
														
													     <c:set var="title0"><axis:alt f="axisrea052" c="NCUMTOT_LIT" lit="9910289"/></c:set>
													     <c:set var="title21"><axis:alt f="axisrea052" c="NCUDEPU_LIT" lit="89907030"/></c:set>
							                             <c:set var="title1"><axis:alt f="axisrea052" c="NCUENRI_LIT" lit="9910290"/></c:set>
							                             <c:set var="title2"><axis:alt f="axisrea052" c="NCUNORI_LIT" lit="9910291"/></c:set>
							                             <c:set var="title3"><axis:alt f="axisrea052" c="NDEPMAN_LIT" lit="9910329"/></c:set>	         
							                             <c:set var="title4"><axis:alt f="axisrea052" c="NRETENC_LIT" lit="101714"/></c:set>
							                             <c:set var="title5"><axis:alt f="axisrea052" c="NCUOTA1_LIT" lit="9910293"/></c:set>
							                             <c:set var="title6"><axis:alt f="axisrea052" c="NCUOTA2_LIT" lit="9910294"/></c:set>
							                             <c:set var="title7"><axis:alt f="axisrea052" c="NCUOTA3_LIT" lit="9910295"/></c:set>	
							                             <c:set var="title8"><axis:alt f="axisrea052" c="NFACULT_LIT" lit="9910296"/></c:set>	         
							                             <c:set var="title9"><axis:alt f="axisrea052" c="NCOFUCO_LIT" lit="9910297"/></c:set>
							                            <c:set var="title10"><axis:alt f="axisrea052" c="NCOFUPO_LIT" lit="9910298"/></c:set>
							                            <c:set var="title11"><axis:alt f="axisrea052" c="NCUPAUT_LIT" lit="9910299"/></c:set>
							                            <c:set var="title12"><axis:alt f="axisrea052" c="NCUPMOD_LIT" lit="9910300"/></c:set>
							                            <c:set var="title13"><axis:alt f="axisrea052" c="NCUOTA4_LIT" lit="9910305"/></c:set>
							                            <c:set var="title14"><axis:alt f="axisrea052" c="NCUOTA5_LIT" lit="9910306"/></c:set>						                            
							                            <c:set var="title15"><axis:alt f="axisrea052" c="NCUOTA6_LIT" lit="9910308"/></c:set>
							                            <c:set var="title16"><axis:alt f="axisrea052" c="NCUOTA7_LIT" lit="9910309"/></c:set>
							                            <c:set var="title17"><axis:alt f="axisrea052" c="NCUOTA8_LIT" lit="9910310"/></c:set>
							                            <c:set var="title18"><axis:alt f="axisrea052" c="NCUOTA9_LIT" lit="9910311"/></c:set>
							                            <c:set var="title19"><axis:alt f="axisrea052" c="NCUOT10_LIT" lit="9910312"/></c:set>
							                            <c:set var="title20"><axis:alt f="axisrea054" c="NDEPAUT_LIT" lit="9910456"/></c:set>
							          							                            				                            
									                    <c:set var="axisrea052_lstAcumulacionesRG" value="${__formdata.T_IAX_ACUMULACIONESRG}" />    
									                    <div class="separador">&nbsp;</div>
									                       
									                    <display:table name="${__formdata.lstAcumulacionesRG}" id="idLstAcumulacionesRG" export="false" class="dsptgtable"
															pagesize="-1" defaultsort="2" defaultorder="ascending" style="overflow:auto;width:160%"
															requestURI="axis_axisrea052.do?paginar=true" sort="list"   
															cellpadding="0" cellspacing="1" >
															<%@ include file="../include/displaytag.jsp"%>
									                        										                            
									                            <display:column title="${title0}" sortProperty="NCUMTOT"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRG.CUM_TOT}"/></div>
									                            </display:column>
									                            <display:column title="${title21}" sortProperty="NCUDEPU"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRG.CUM_DEPU}"/></div>
									                            </display:column>
									                            <display:column title="${title1}" sortProperty="NCUENRI"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRG.CUM_RIES}"/></div>
									                            </display:column>
									                            <display:column title="${title2}" sortProperty="NCUNORI"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRG.CUM_NORIES}"/></div>
									                            </display:column>
									                            <display:column title="${title20}" sortProperty="NDEPAUT" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRG.DEPUAUT}"/></div>
									                            </display:column>
									                            <display:column title="${title3}" sortProperty="NDEPMAN"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRG.DEPURA}"/></div>
									                            </display:column>
									                            <display:column title="${title4}" sortProperty="NRETENC"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRG.RETE}"/></div>
									                            </display:column>
									                            
									                            <display:column title="${title5}" sortProperty="NCUOTA1"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRG.Q1}"/></div>
									                            </display:column>
									                            
									                            <display:column title="${title6}" sortProperty="NCUOTA2"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRG.Q2}"/></div>
									                            </display:column>
									                            <c:if test="${!empty idLstAcumulacionesRG.Q3}">
									                            <display:column title="${title7}" sortProperty="NCUOTA3"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRG.Q3}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty idLstAcumulacionesRG.Q4&&idLstAcumulacionesRG.Q4>0}"> 
									                            <display:column title="${title13}" sortProperty="NCUOTA4" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRG.Q4}"/></div>
									                            </display:column>
									                            </c:if><c:if test="${!empty idLstAcumulacionesRG.Q6&&idLstAcumulacionesRG.Q6>0}">
									                            <display:column title="${title15}" sortProperty="NCUOTA6" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRG.Q6}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty idLstAcumulacionesRG.Q7&&idLstAcumulacionesRG.Q7>0}">
									                            <display:column title="${title16}" sortProperty="NCUOTA7" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRG.Q7}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty idLstAcumulacionesRG.Q8&&idLstAcumulacionesRG.Q8>0}">
									                            <display:column title="${title17}" sortProperty="NCUOTA8" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRG.Q8}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty idLstAcumulacionesRG.Q9&&idLstAcumulacionesRG.Q9>0}"> 
									                            <display:column title="${title18}" sortProperty="NCUOTA9" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRG.Q9}"/></div>
									                            </display:column>
									                            </c:if><c:if test="${!empty idLstAcumulacionesRG.Q10&&idLstAcumulacionesRG.Q10>0}"> 
									                            <display:column title="${title19}" sortProperty="NCUOT10" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRG.Q10}"/></div>
									                            </display:column></c:if>
									                            <display:column title="${title8}" sortProperty="NFACULT"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRG.FACUL}"/></div>
									                            </display:column>
									                            <display:column title="${title9}" sortProperty="NCOFUCO"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRG.COMFU_CONT}"/></div>
									                            </display:column>
									                            <display:column title="" sortable="false"  sortProperty="" headerClass="sortable fixed"  media="html" autolink="false">
					                 								 <div class="dspIcons">
					                 								    <c:if test="${!empty idLstAcumulacionesRG.COMFU_CONT&&idLstAcumulacionesRG.COMFU_CONT>0}">
					                    			                      <img border="0" alt="<axis:alt f='axisrea052' c='LIT_COFUCO' lit='1000439'/> <axis:alt f='axisrea052' c='LIT_CFC' lit='9910297'/>"
													                           title="<axis:alt f='axisrea052' c='LIT_COFUCO' lit='1000439'/> <axis:alt f='axisrea052' c='LIT_CFC' lit='9910297'/>"
													                           src="images/informacion.gif"  onclick="f_abrir_axisrea053('1','1','${__formdata.NNUMIDE}','${__formdata.SPERSON}')" />
													                    </c:if>     
													                 </div>
													            </display:column>
									                            <display:column title="${title10}" sortProperty="NCOFUPO" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRG.COMFU_POS}"/></div>
									                            </display:column>
									                            <display:column title="" sortable="false"  sortProperty="" headerClass="sortable fixed"  media="html" autolink="false">
						                 							 <div class="dspIcons">
						                 							 	<c:if test="${!empty idLstAcumulacionesRG.COMFU_POS&&idLstAcumulacionesRG.COMFU_POS>0}"> 
						                    			                  <img border="0" alt="<axis:alt f='axisrea052' c='LIT_COFUPO' lit='1000439'/> <axis:alt f='axisrea052' c='LIT_CFP' lit='9910297'/>"
														                       title="<axis:alt f='axisrea052' c='LIT_COFUPO' lit='1000439'/> <axis:alt f='axisrea052' c='LIT_CFP' lit='9910298'/>"
														                       src="images/informacion.gif"  onclick="f_abrir_axisrea053('2','2','${__formdata.NNUMIDE}','${__formdata.SPERSON}')"  />
														                </c:if>       
														            </div>
														        </display:column>	                            
									                            <display:column title="${title11}" sortProperty="NCUPAUT" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRG.CUPO_AU}"/></div>
									                            </display:column>
									                            <display:column title="${title12}" sortProperty="NCUPMOD" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRG.CUPO_MOD}"/></div>
									                            </display:column>
									                            <display:column title="" sortable="false"  sortProperty=""  headerClass="sortable fixed"  media="html" autolink="false">
					                 								 <div class="dspIcons">
					                    			                      <img border="0" alt="<axis:alt f='axisrea052' c='LIT_CONDETACU' lit='1000439'/> <axis:alt f='axisrea052' c='LIT_DET' lit='9910321'/>"
													                           title="<axis:alt f='axisrea052' c='LIT_CONDETACU' lit='1000439'/> <axis:alt f='axisrea052' c='LIT_DET' lit='9910321'/>"
													                           src="images/mas.gif" onclick="f_abrir_axisrea054('${__formdata.NNUMIDE}')"/>
													                 </div>
													            </display:column>
									                            
									                            									                 
									                   </display:table>     
									         	</div>                
											</td>
											</tr>	
			</axis:visible>               
	        <!-- Registro Individual -->
			<!-- INICIO BUG 14042 26/08/2020 BJHB -->
			<c:if test="${!empty __formdata.lstAcumulacionesRI}">
			<!-- FIN BUG 14042 26/08/2020 BJHB -->
			
	        <axis:visible c="DSP_REGIINDIVIDUAL" f="axisrea052">									
										<tr>
											<td class="campocaja">
											<img src="images/mes.gif" id="DSP_REGIINDIVIDUAL_parent" onclick="objEstilos.toggleDisplay('DSP_REGIINDIVIDUAL', this)" style="cursor: pointer" /> 
												<b><axis:alt f="axisrea052" c="CREGIINDIVIDUAL" lit="9910303" /></b>
												<hr class="titulo">
											</td>
										</tr>
										<tr id="DSP_REGIINDIVIDUAL_children" style="display:yes">
											<td class="campocaja">
												<div class="displayspace" style="overflow:auto;width:97%;">
														
														 <c:set var="title0"><axis:alt f="axisrea052" c="NNUMDOC_LIT" lit="102999"/></c:set>
							                             <c:set var="title1"><axis:alt f="axisrea052" c="NNOMBRE_LIT" lit="105940"/></c:set>
							                             <c:set var="title2"><axis:alt f="axisrea052" c="NPORPAR_LIT" lit="9910304"/></c:set>
													     <c:set var="title3"><axis:alt f="axisrea052" c="NCUMTOT_LIT" lit="9910289"/></c:set>
													     <c:set var="title24"><axis:alt f="axisrea052" c="NCUDEPU_LIT" lit="89907030"/></c:set>
							                             <c:set var="title4"><axis:alt f="axisrea052" c="NCUENRI_LIT" lit="9910290"/></c:set>
							                             <c:set var="title5"><axis:alt f="axisrea052" c="NCUNORI_LIT" lit="9910291"/></c:set>
							                             <c:set var="title6"><axis:alt f="axisrea052" c="NDEPMAN_LIT" lit="9910329"/></c:set>	         
							                             <c:set var="title7"><axis:alt f="axisrea052" c="NRETENC_LIT" lit="101714"/></c:set>
							                             <c:set var="title8"><axis:alt f="axisrea052" c="NCUOTA1_LIT" lit="9910293"/></c:set>
							                             <c:set var="title9"><axis:alt f="axisrea052" c="NCUOTA2_LIT" lit="9910294"/></c:set>
							                            <c:set var="title10"><axis:alt f="axisrea052" c="NCUOTA3_LIT" lit="9910295"/></c:set>	
							                            <c:set var="title11"><axis:alt f="axisrea052" c="NFACULT_LIT" lit="9910296"/></c:set>	         
							                            <c:set var="title12"><axis:alt f="axisrea052" c="NCOFUCO_LIT" lit="9910297"/></c:set>
							                            <c:set var="title13"><axis:alt f="axisrea052" c="NCOFUPO_LIT" lit="9910298"/></c:set>
							                            <c:set var="title14"><axis:alt f="axisrea052" c="NCUPAUT_LIT" lit="9910299"/></c:set>
							                            <c:set var="title15"><axis:alt f="axisrea052" c="NCUPMOD_LIT" lit="9910300"/></c:set>
							                            <c:set var="title16"><axis:alt f="axisrea052" c="NCUOTA4_LIT" lit="9910305"/></c:set>
							                            <c:set var="title17"><axis:alt f="axisrea052" c="NCUOTA5_LIT" lit="9910306"/></c:set>
							                            <c:set var="title18"><axis:alt f="axisrea052" c="NCUOTA6_LIT" lit="9910308"/></c:set>
							                            <c:set var="title19"><axis:alt f="axisrea052" c="NCUOTA7_LIT" lit="9910309"/></c:set>
							                            <c:set var="title20"><axis:alt f="axisrea052" c="NCUOTA8_LIT" lit="9910310"/></c:set>
							                            <c:set var="title21"><axis:alt f="axisrea052" c="NCUOTA9_LIT" lit="9910311"/></c:set>
							                            <c:set var="title22"><axis:alt f="axisrea052" c="NCUOTA10_LIT" lit="9910312"/></c:set>
							                            <c:set var="title23"><axis:alt f="axisrea054" c="NDEPAUT_LIT" lit="9910456"/></c:set>
							                            				                            
									                    <c:set var="axisrea052_lstAcumulaciones" value="${__formdata.T_IAX_ACUMULACIONESRI}" />    
									                    <div class="separador">&nbsp;</div>
									                       
									                    <display:table name="${__formdata.lstAcumulacionesRI}" id="idLstAcumulacionesRI" export="false" class="dsptgtable"
															pagesize="-1" defaultsort="2" defaultorder="ascending" style="overflow:auto;width:180%" 
															requestURI="axis_axisrea052.do?paginar=true" sort="list" 
															cellpadding="0" cellspacing="1" >
															<%@ include file="../include/displaytag.jsp"%>
									                        	
									                        	<display:column title="${title0}" sortProperty="NNUMDOC"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRI.DOC_TOM}"/></div>
									                            </display:column>
									                            <display:column title="${title1}" sortProperty="NNOMBRE"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">																
									                                <div class="dspText">${idLstAcumulacionesRI.NOM_TOM}</div>
									                            </display:column>
									                            <display:column title="${title2}" sortProperty="NPORPAR"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRI.PORC_PARTIC}"/></div>
									                            </display:column>									                            
									                            <display:column title="${title3}" sortProperty="NCUMTOT"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRI.CUM_TOT}"/></div>
									                            </display:column>
									                            <display:column title="${title24}" sortProperty="NCUDEPU"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRI.CUM_DEPU}"/></div>
									                            </display:column>
									                            <display:column title="${title4}" sortProperty="NCUENRI"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRI.CUM_RIES}"/></div>
									                            </display:column>
									                            <display:column title="${title5}" sortProperty="NCUNORI"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRI.CUM_NORIES}"/></div>
									                            </display:column>
									                            <display:column title="${title23}" sortProperty="NDEPAUT" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRI.DEPUAUT}"/></div>
									                            </display:column>
									                            <display:column title="${title6}" sortProperty="NDEPMAN"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRI.DEPURA}"/></div>
									                            </display:column>
									                            <display:column title="${title7}" sortProperty="NRETENC"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRI.RETE}"/></div>
									                            </display:column>
									                            <c:if test="${!empty __formdata.Q1}">
									                            <display:column title="${title8}" sortProperty="NCUOTA1"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRI.Q1}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty __formdata.Q2}">
									                            <display:column title="${title9}" sortProperty="NCUOTA2"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRI.Q2}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty __formdata.Q3}">
									                            <display:column title="${title10}" sortProperty="NCUOTA3" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRI.Q3}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty __formdata.Q4&&__formdata.Q4>0}">
									                            <display:column title="${title16}" sortProperty="NCUOTA4" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRI.Q4}"/></div>
									                            </display:column></c:if>                        
									                            <c:if test="${!empty __formdata.Q6&&__formdata.Q6>0}">
									                            <display:column title="${title18}" sortProperty="NCUOTA6" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRI.Q6}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty __formdata.Q7&&__formdata.Q7>0}">
									                            <display:column title="${title19}" sortProperty="NCUOTA7" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRI.Q7}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty __formdata.Q8&&__formdata.Q8>0}">
									                            <display:column title="${title20}" sortProperty="NCUOTA8" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRI.Q8}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty __formdata.Q9&&__formdata.Q9>0}">
									                            <display:column title="${title21}" sortProperty="NCUOTA9" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRI.Q9}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty __formdata.Q10&&__formdata.Q10>0}">
									                            <display:column title="${title22}" sortProperty="NCUOT10" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRI.Q10}"/></div>
									                            </display:column></c:if>
									                            <display:column title="${title11}" sortProperty="NFACULT" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRI.FACUL}"/></div>
									                            </display:column>
									                            <display:column title="${title12}" sortProperty="NCOFUCO" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRI.COMFU_CONT}"/></div>
									                            </display:column>
									                            <display:column title="" sortable="false"  sortProperty="" headerClass="sortable fixed"  media="html" autolink="false">
					                 								 <div class="dspIcons">
					                 								    <c:if test="${!empty idLstAcumulacionesRI.COMFU_CONT&&idLstAcumulacionesRI.COMFU_CONT>0}">
					                    			                      <img border="0" alt="<axis:alt f='axisrea052' c='LIT_COFUCO' lit='1000439'/> <axis:alt f='axisrea052' c='LIT_CFC' lit='9910297'/>"
													                           title="<axis:alt f='axisrea052' c='LIT_COFUCO' lit='1000439'/> <axis:alt f='axisrea052' c='LIT_CFC' lit='9910297'/>"
													                           src="images/informacion.gif"  onclick="f_abrir_axisrea053('1','1','${idLstAcumulacionesRI.DOC_TOM}','${idLstAcumulacionesRI.SPERSON}')" />
													                    </c:if>     
													                 </div>
													            </display:column>
									                            <display:column title="${title13}" sortProperty="NCOFUPO"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRI.COMFU_POS}"/></div>
									                            </display:column>
									                            <display:column title="" sortable="false"  sortProperty="" headerClass="sortable fixed"  media="html" autolink="false">
						                 							 <div class="dspIcons">
						                 							 	<c:if test="${!empty idLstAcumulacionesRI.COMFU_POS&&idLstAcumulacionesRI.COMFU_POS>0}"> 
						                    			                  <img border="0" alt="<axis:alt f='axisrea052' c='LIT_COFUPO' lit='1000439'/> <axis:alt f='axisrea052' c='LIT_CFP' lit='9910297'/>"
														                       title="<axis:alt f='axisrea052' c='LIT_COFUPO' lit='1000439'/> <axis:alt f='axisrea052' c='LIT_CFP' lit='9910298'/>"
														                       src="images/informacion.gif"  onclick="f_abrir_axisrea053('2','2','${idLstAcumulacionesRI.DOC_TOM}','${idLstAcumulacionesRI.SPERSON}')" />
														                </c:if>       
														            </div>
														        </display:column>	 
									                            <display:column title="${title14}" sortProperty="NCUPAUT" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRI.CUPO_AU}"/></div>
									                            </display:column>
									                            <display:column title="${title15}" sortProperty="NCUPMOD" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstAcumulacionesRI.CUPO_MOD}"/></div>
									                            </display:column>
									                            <display:column title="" sortable="false"  sortProperty="" headerClass="sortable fixed"  media="html" autolink="false">
					                 								 <div class="dspIcons">
					                    
													                      <img border="0"
													                           alt="<axis:alt f='axisrea052' c='LIT_CONDETACU' lit='1000439'/> <axis:alt f='axisrea052' c='LIT_DETACU' lit='99910321'/>"
													                           title="<axis:alt f='axisrea052' c='LIT_CONDETACU' lit='1000439'/> <axis:alt f='axisrea052' c='LIT_DETACU' lit='9910321'/>"
													                           src="images/mas.gif"
													                           onclick="f_abrir_axisrea054('${idLstAcumulacionesRI.DOC_TOM}')"/>
					                    
													                  </div>
													            </display:column>
									                            
									                            									                 
									                   </display:table>     
									         	</div>                
											</td>
											</tr>	
					</axis:visible>
					
					<!-- INICIO BUG 14042 26/08/2020 BJHB -->
					</c:if>
					<!-- FIN BUG 14042 26/08/2020 BJHB -->
					
              </table>

               
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea052</c:param><c:param name="f">axisrea052</c:param>
            <c:param name="__botones">salir,<c:if test="${__formdata.CMODO !='ALTA_POLIZA'}">9001312</c:if></c:param> 
        </c:import>
    </form>
    
		<script type="text/javascript">
			Calendar.setup({
				inputField     :    "FCORTE",
				ifFormat       :    "%d/%m/%Y",
				button         :    "icon_FCORTE", 
				singleClick    :    true,
				firstDay       :    1
			});
			
		</script>
	
	    <c:import url="../include/mensajes.jsp" />

    </body>    
</html>
