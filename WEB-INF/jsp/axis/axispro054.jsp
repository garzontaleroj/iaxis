<%/* Revision:# zJRQGwx8fxOe+3Vi9NIgHA== # */%>
<%-- 
*  Fichero: axispro054.jsp
*  @author <a href = "mailto:erhernandez@csi-ti.com">Edgar Hernandez</a>
*
*  Fecha: 14/06/2016
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="axis.util.Constantes" %>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>


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
      <!-- Idioma del calendario, en función del Locale -->
      <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
      <!-- Setup del calendario -->
      <script type="text/javascript" src="scripts/calendar-setup.js"></script>
    <!--*********************************** --> 


    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload_axispro054() {            

            // Retocar tabla en IE
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
             
             f_cargar_propiedades_pantalla();
        }
        
        function f_but_salir() {
        	objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axispro054", "cancelar", document.axispro054Form, "_self");   
        }
               
        
        function f_but_buscar() {
            if (objValidador.validaEntrada())
                objUtiles.ejecutarFormulario ("axis_axispro054.do", "buscar", document.axispro054Form, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_formatdate(entrada,title){
            var jDate = new JsFecha();
            if(entrada.value.length>0){
              entrada.value=jDate.formateaFecha(entrada.value);
                  
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    alert("<axis:alt f="axispro054" c="ALER_ERR" lit="1000421"/>");
                }
            }
        } 
        
        function f_borrar_exclusion(selectedNPOLIZA, selectedNRECIBO) {
            var answer = confirm(objJsMessages.jslit_confirma_borrar);
            if (answer)
            	objUtiles.ejecutarFormulario("axis_axispro054.do?&NPOLIZAE="+selectedNPOLIZA+"&NRECIBO="+selectedNRECIBO, "eliminarexclusion", document.axispro054Form, "_self", objJsMessages.jslit_borrando_registro);	
          }  
        
        /****************************************************************************************/
        /*********************************** CALLBACK AJAX **************************************/
        /****************************************************************************************/
        
        

        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        /****************************************************************************************/
        /************************************** AXISCTR014 **************************************/
        /****************************************************************************************/ 
        	
          function f_actualizar_agente_intermediario(){
             if (objValidador.validaEntrada()) {
                 objAjax.invokeAsyncCGI("axis_axispro054.do", callbackAjaxCargarAgenteIntermediario, "operation=ajax_actualizar_agente_intermediario&CAGENTE=" + objDom.getValorComponente(document.axispro054Form.CAGENTE), this, objJsMessages.jslit_cargando);
              }  
          }   
        
          function f_abrir_axisctr014() {
              objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
          }        
         
            
          function f_cerrar_axisctr014() {
                objUtiles.cerrarModal("axisctr014");
          }  
          
          function f_aceptar_axisctr014 (CAGENTE){
              objDom.setValorPorId("CAGENTE", CAGENTE);
              f_cerrar_axisctr014();
              objAjax.invokeAsyncCGI("axis_axispro054.do", callbackAjaxCambiarAgenteIntermediario, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
          }
          
          function callbackAjaxCambiarAgenteIntermediario(ajaxResponseText){
              var doc=objAjax.domParse(ajaxResponseText);
              if(!objAppMensajes.existenErroresEnAplicacion(doc)){
              var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
              var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
              objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado);
              objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);
                  }
          }
                
          function mostrar(nombreCapa){             
              document.getElementById(nombreCapa).style.visibility="visible"; 
          } 
            
          function ocultar(nombreCapa){             
             document.getElementById(nombreCapa).style.visibility="hidden"; 
          } 
          
          
        /****************************************************************************************/
        /************************************** AXISPER021 **************************************/
        /****************************************************************************************/       
        
        function f_abrir_axisper021() {
    		var SSEGURO = "${__formdata.SSEGURO}";
    		var CAGENTE = "${__formdata.CAGENTE}";
    		objUtiles.abrirModal("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE=" + CAGENTE + "&SSEGURO=" + SSEGURO);
    	}
        
        
        function f_aceptar_persona(SPERSON, CAGENTE, SNIP, modal) {
    		//alert("Em cerrar persona "+SPERSON+" CAGENTE : "+CAGENTE+" SNIP :"+SNIP);

    		f_cerrar_modalespersona(modal);

    		// alert("Em cerrar persona2 "+CAGENTE);
    		var porigen = 'INT';
    		if (modal == 'axisper022')
    			porigen = 'NUEVO';

    		document.axispro054Form.SPERSON.value = SPERSON;
    		
    		document.axispro054Form.ORIGEN.value = porigen;
    		document.axispro054Form.SNIP.value = SNIP;
    		document.axispro054Form.CAGENTE_VISIO.value = CAGENTE;

    		if (!objUtiles.estaVacio(SPERSON)) {
    			objAjax.invokeAsyncCGI("axis_axispro054.do?SPERSON_REL=" + SPERSON  + "&CAGENTE1=" + CAGENTE, callbackAjaxActualitzaPersona, "operation=ajax_actualizar_persona", this, objJsMessages.jslit_cargando);
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
    				
    				objDom.setValorPorId("NOMBRE", NOMBRE + ' ' + APELLIDO1 + ' '
    						+ APELLIDO2);
    				
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
        
        
        function f_cerrar_axisper021() {
	     	f_cerrar_modalespersona("axisper021");
	    }
        
        /****************************************************************************************/
        /************************************** AXISPER022 **************************************/
        /****************************************************************************************/   
        
        function f_nova_persona() {
    		//alert("al entrar en el parent***");
    		f_cerrar_modalespersona("axisper021");
    		var CAGENTE = "${__formdata.CAGENTE_PERSN}";
    		//alert(CAGENTE);
    		objUtiles.abrirModal("axisper022", "src", "modal_axisper022.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE=" + CAGENTE);
    	}
        
        function f_cerrar_axisper022() {
    		f_cerrar_modalespersona("axisper022");
    	}
        
        /****************************************************************************************/
        /************************************** AXISPRO055 **************************************/
        /****************************************************************************************/         
          function f_aceptar_axispro055(){
              f_cerrar_axispro055();
              objUtiles.ejecutarFormulario("modal_axispro055.do", "form", document.axispro055Form, "_self", objJsMessages.jslit_cargando);
          }
          //INI - IAXIS - 3951 - ML - 07/05/2019 - Ajuste modo de envio	
          function f_abrir_axispro055(selectedNPOLIZA, selectedNRECIBO, modo) {
              objUtiles.abrirModal("axispro055", "src", "modal_axispro055.do?operation=form&CMODO="+modo+"&NPOLIZA="+selectedNPOLIZA+"&NRECIBO="+selectedNRECIBO);
          }
          //INI - IAXIS - 3951 - ML - 07/05/2019 - Ajuste modo de envio
 
          function f_cerrar_axispro055(){
               objUtiles.cerrarModal("axispro055");
          }           
        
        /****************************************************************************************/
        /************************************** UTILES *******************************************/
        /****************************************************************************************/
        function f_cerrar_modalespersona(modal) {
			objUtiles.cerrarModal(modal);
		}
        
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

    	function f_editar(SCONTGAR) {
    		objUtiles.ejecutarFormulario("axis_axispro054.do?SCONTGAR=" + SCONTGAR,
    				"editar", document.miForm, "_self",
    				objJsMessages.jslit_cargando);
    	}
    	function f_detalle(SCONTGAR) {
    		objUtiles.ejecutarFormulario("axis_axispro054.do?SCONTGAR=" + SCONTGAR,
    				"buscar", document.miForm, "_self",
    				objJsMessages.jslit_cargando);
    	}

    </script>  

  </head>
  <body onload="f_onload_axispro054()">
    <div id="wrapper" class="wrapper">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>  
    
    <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axispro054" c="MODPRO055" lit=""/>
      </c:param>
      <c:param name="nid" value="axispro055"/>
    </c:import> 
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
           <axis:alt f="axispro054" c="TITULO" lit="1000234" />
        </c:param>
        <c:param name="nid" value="axisctr014" />
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axispro054" c="TITULO_021"  lit="1000178" />
		</c:param>
		<c:param name="nid" value="axisper021" />
	</c:import>
	
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axispro054" c="TITULO_022"  lit="1000178" />
		</c:param>
		<c:param name="nid" value="axisper022" />
	</c:import>
      
    <form name="axispro054Form" action="" method="POST">
        <input type="hidden" name="operation" value=""/>
        <!--INI - IAXIS - 3951 - ML - 07/05/2019 - el modo no debe estar hidden-->
        <%-- <input type="hidden" name="NRECIBO" value="${__formdata.NRECIBO}"> --%>
        <!--INI - IAXIS - 3951 - ML - 07/05/2019 - el modo no debe estar hidden-->
        <input type="hidden" name="CMODO" value="">
        
        <input type="hidden" id="ORIGEN" name="ORIGEN"  value="${__formdata.ORIGEN}" />
        <input type="hidden" id="CAGENTE_VISIO" name="CAGENTE_VISIO"  value="${__formdata.CAGENTE_VISIO}" /> 
        <input type="hidden" id="SNIP" name="SNIP" value="${__formdata.SNIP}" /> 
        <input type="hidden" id="SPEREAL" name="SPEREAL" value="${__formdata.SPEREAL}" /> 
        <input type="hidden" id="SPERSON" name="SPERSON_REL" value="${__formdata.SPERSON_REL}" /> 
        <input type="hidden" id="CAGENTE" name="CAGENTE" value="${__formdata.CAGENTE}" /> 
        <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}" /> 
                        
        <input type="hidden" name="CTIPAGE_BUSC" id="CTIPAGE_BUSC" value="${__formdata.CTIPAGE_BUSC}"/>
        <input type="hidden" name="DONDE" id="DONDE" value="${__formdata.DONDE}"/>   
        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axispro054" c="formulario" lit="9909978" /></c:param>
            <c:param name="producto"><axis:alt f="axispro054" c="producto" lit="9909978" /></c:param>
            <c:param name="form">axispro054</c:param>
        </c:import>


        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="width:95%;height:35%">
            <div class="separador">&nbsp;</div>
            <tr>
                <td>
                    <table class="seccion">	
                       <tr>
			               <th style="width:12.5%;height:0px"></th>
			               <th style="width:12.5%;height:0px"></th>
			               <th style="width:12.5%;height:0px"></th>
			               <th style="width:12.5%;height:0px"></th>
			               <th style="width:12.5%;height:0px"></th>
			               <th style="width:12.5%;height:0px"></th>
			               <th style="width:12.5%;height:0px"></th>
			               <th style="width:12.5%;height:0px"></th>
                       </tr>
                       <tr>
                       		
                       		<axis:ocultar f="axispro054" c="LSAGENTESTIPO" dejarHueco="false">                            
                                <td class="titulocaja" colspan="3">
                                    <b><axis:alt f="axispro054" c="LSAGENTESTIPO" lit="9000436"/></b>                             
                                </td>
                            </axis:ocultar>
                            <!--INI - IAXIS - 3951 - ML - 07/05/2019 - Se agrega etiqueta para filtro por N de recibo-->
                            <axis:visible f="axispro054" c="NRECIBO">
                             <td class="titulocaja" id="LIT_NRECIBO" colspan="2">
                               <b><axis:alt f="axispro054" c="NRECIBO" lit="100895"/></b>
                             </td>
                           </axis:visible>
                           <!--INI - IAXIS - 3951 - ML - 07/05/2019 - Se agrega etiqueta para filtro por N de recibo-->
                            <axis:visible f="axispro054" c="FDESDE">
                             <td class="titulocaja" id="LIT_FDESDE" colspan="2">
                               <b><axis:alt f="axispro054" c="FDESDE" lit="9902360"/></b>
                             </td>
                           </axis:visible>  
                           
                            <axis:visible f="axispro054" c="FHASTA">
                             <td class="titulocaja" id="LIT_FHASTA" colspan="2">
                               <b><axis:alt f="axispro054" c="FHASTA" lit="9902361"/></b>
                             </td>
                           </axis:visible> 
                       
                       </tr>
                       <tr>
                       		
                       		<axis:ocultar f="axispro054" c="LSAGENTESTIPO" dejarHueco="false">                            
                             <td class="campocaja" colspan="3"> 
                                <select name="LSAGENTESTIPO" id ="LSAGENTESTIPO" <axis:atr f="axispro054" c="LSAGENTESTIPO" a="obligatorio=false&modificable=true&isInputText=false"/> size="1" class="campowidthselect campo campotexto" style="width:94%;">
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro054" c="BLANCO" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.listValores.lstAgentesTipo}">
                                            <option value = "${element.CAGENTE}"
                                            <c:if test="${__formdata.LSAGENTESTIPO == element.CAGENTE}">selected</c:if>>
                                                ${element.TAGENTE} 
                                            </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>	
                           
                           
                           <!--INI - IAXIS - 3951 - ML - 07/05/2019 - Se agrega campo para filtro por N de recibo-->                           
                              <axis:visible f="axispro054" c="NRECIBO" >
                           		<td class="campocaja" colspan="2">
                                 <input type="text" class="campowidthinput campo campotexto"
                                 		name="NRECIBO" id="	NRECIBO" value="${__formdata.NRECIBO}" style="width:90%;"
                                        title="<axis:alt f="axispro054" c="lit_100895" lit="100895"/>"/>        
                               </td>
                           </axis:visible>
                           <!--INI - IAXIS - 3951 - ML - 07/05/2019 - Se agrega campo para filtro por N de recibo-->
                            
                            <!--INI - IAXIS - 3951 - ML - 07/05/2019 - Se quita el requerido para poder buscar filtros individuales-->
                            <axis:visible f="axispro054" c="FDESDE" >
                               <td class="campocaja" colspan="2">
                                  <input type="text" 
                                  		 onblur="javascript:f_formatdate(this,'')" formato="fecha"
                                  		 <axis:atr f="axispro054" c="FDESDE" a="modificable=true&isInputText=true&obligatorio=false"/>   
                                  		 alt="<axis:alt f="axispro054" c="FDESDE" lit="9902360"/>" title="<axis:alt f="axispro054" c="FDESDE" lit="9902360"/>"
                                         name="FDESDE" id="FDESDE"  value="<fmt:formatDate value="${__formdata.FDESDE}" pattern="dd/MM/yyyy" />" style="width:35%;" class="campowidthinput campo campotexto_ob"/>
                                           <axis:visible c="ICO_FDESDE" f="axispro054">
                                                <a id="icon_FDESDE" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axispro054" c="SELECT" lit="108341"/>" title="<axis:alt f="axispro054" c="ICO_FDESDE" lit="9902360" />" src="images/calendar.gif"/></a>
                                  </axis:visible>
                               </td>
                           </axis:visible> 
                           
                           <axis:visible f="axispro054" c="FHASTA" >
                               <td class="campocaja" colspan="2">
                                  <input type="text" 
                                  		 onblur="javascript:f_formatdate(this,'')" formato="fecha"
                                  		 <axis:atr f="axispro054" c="FHASTA" a="modificable=true&isInputText=true&obligatorio=false"/>     
                                  		 alt="<axis:alt f="axispro054" c="FHASTA" lit="9902361"/>" title="<axis:alt f="axispro054" c="FHASTA" lit="9902361"/>"
                                         name="FHASTA" id="FHASTA"  value="<fmt:formatDate value="${__formdata.FHASTA}" pattern="dd/MM/yyyy" />" style="width:35%;" class="campowidthinput campo campotexto_ob"/>
                                           <axis:visible c="ICO_FHASTA" f="axispro054">
                                                <a id="icon_FHASTA" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axispro054" c="SELECT" lit="108341"/>" title="<axis:alt f="axispro054" c="ICO_FHASTA" lit="9902361" />" src="images/calendar.gif"/></a>
                                  </axis:visible>
                               </td>
                           </axis:visible> 
                       <!--INI - IAXIS - 3951 - ML - 07/05/2019 - Se quita el requerido para poder buscar filtros individuales-->
                       </tr>
                       <tr>
                       
                       
                       <tr> 
                       
                           <axis:visible f="axispro054" c="NPOLIZA">
                             <td class="titulocaja" id="LIT_NPOLIZA" colspan="2">
                               <b><axis:alt f="axispro054" c="NPOLIZA" lit="9903659"/></b>
                             </td>
                           </axis:visible>   
                           
                           <axis:visible f="axispro054" c="CCLIENTE">
                             <td class="titulocaja" id="LIT_CCLIENTE" colspan="3">
                               <b><axis:alt f="axispro054" c="CCLIENTE" lit="9909667"/></b>
                             </td>
                           </axis:visible>
                           
                             
                            <axis:ocultar f="axispro054" c="CAGENTE" dejarHueco="false"> 
                                <td class="titulocaja" colspan="3">
                                    <b><axis:alt  c="CAGENTE" f="axispro054" lit="9902363"/></b>
                                </td>
                            </axis:ocultar>
                                 
                       </tr> 
                       <tr> 
                           <axis:visible f="axispro054" c="NPOLIZA" >
                           		<td class="campocaja" colspan="2">
                                 <input type="text" class="campowidthinput campo campotexto"
                                 		name="NPOLIZA" id="NPOLIZA" value="${__formdata.NPOLIZA}" style="width:90%;"
                                        title="<axis:alt f="axispro054" c="lit_9903659" lit="9903659"/>"/>        
                               </td>
                           </axis:visible> 
                           
                           <axis:ocultar f="axispro054" c="CCLIENTE">                     
                             <td class="campocaja" colspan="3">
                                     <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}" class="campowidthinput campo campotexto" style="width: 70%" />
		                             <input type="text"  name="NNUMIDE" id="NNUMIDE" value="${__formdata.NNUMIDE}"  class="campowidthinput campo campotexto" style="width: 20%"
										title="<axis:alt f="axispro054" c="NNUMIDE" lit="9904434"/>" />
									  <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisper021()" style="cursor: pointer" />
								      <input readonly="true" type="text" name="NOMBRE" id="NOMBRE"  value="${__formdata.NOMBRE}"  class="campowidthinput campo campotexto" style="width: 70%" />
						     </td>
                           </axis:ocultar>
                           
                           <axis:ocultar f="axispro054" c="CAGENTE" dejarHueco="false">
                                <td class="campocaja" colspan="3">
                                    <input type="text" name="CAGENTE_TEXT" id="CAGENTE_TEXT" value="${__formdata.CAGENTE_TEXT}" class="campowidthinput campo campotexto" style="width:20%"
                                     title="<axis:alt  c="CAGENTE" f="axispro054" lit="9902363"/>" 
                                    onchange="f_actualizar_agente_intermediario()" />
                                    <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                    <input readonly="true" type="text" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${__formdata.NOMBRE_TEXT}"  style="width:70%" class="campowidthinput campo campotexto"/>
                                </td> 
                            </axis:ocultar>
                           
                           
                                               
                       </tr>                    
                       <div class="separador">&nbsp;</div> 
                       <axis:visible c="DSP_EXCLUPROVICARTERA" f="axispro054">
                       <br/>
                       <tr>
							<!-- *************************  Exclusion de provisiones de cartera  ********************* -->
						
							<tr>
								<td class="campocaja" colspan="8">
								  <img src="images/mes.gif" id="DSP_EXCLUPROVICARTERA_parent" onclick="objEstilos.toggleDisplay('DSP_EXCLUPROVICARTERA', this)" style="cursor: pointer" /> 
												<b><axis:alt f="axispro054" c="CEXCLUPROVI" lit="9909978" /></b>
												<hr class="titulo">
								</td>
							</tr>
							<tr id="DSP_EXCLUPROVICARTERA_children" style="display:yes">
	                        	
	                        	<td class="campocaja" colspan="8">
	                        	
	                                <table class="seccion">
	                                    <br/>
	                                    <!--INI - IAXIS - 3951 - ML - 07/05/2019 - Se envia modo ALTA-->
	                                    <axis:visible f="axispro054" c="BT_NVEXCPROCAR">
	                                        
	                                            <div style="float:right;">
	                                                <img border="0"
	                                                     alt='<axis:alt f="axispro054" c="LIT11" lit="9910200"/>'
	                                                     title='<axis:alt f="axispro054" c="LIT12" lit="9910200"/>'
	                                                     src="images/new.gif"
	                                                     onclick="f_abrir_axispro055('','', 'ALTA')"/>                       
	                                            </div>
	                                        
	                                    </axis:visible>
	                                    <!--INI - IAXIS - 3951 - ML - 07/05/2019 - Se envia modo ALTA--> 
										<br/>
	                                    <tr>
	                                        <td>
	                                            <c:set var="title1"><axis:alt f="axispro054" c="LIT13" lit="9903659"/></c:set>
	                                            <c:set var="title2"><axis:alt f="axispro054" c="LIT14" lit="100895"/></c:set>
	                                            <c:set var="title3"><axis:alt f="axispro054" c="LIT15" lit="9909972"/></c:set>
	                                            <c:set var="title4"><axis:alt f="axispro054" c="LIT16" lit="9909973"/></c:set>
	                                            <c:set var="title5"><axis:alt f="axispro054" c="LIT17" lit="9909975"/></c:set>
	                                            <c:set var="title6"><axis:alt f="axispro054" c="LIT18" lit="9909974"/></c:set>
	                                            <c:set var="title7"><axis:alt f="axispro054" c="LIT19" lit="101162"/></c:set>
	                                            <c:set var="title8"><axis:alt f="axispro054" c="LIT20" lit="9001192"/></c:set>
	                                            <c:set var="title9"><axis:alt f="axispro054" c="LIT21" lit="9001510"/></c:set>
	                                            
	                                            
	                                            <c:set var="title10"><axis:alt f="axispro054" c="LIT22" lit="9000436"/></c:set>
	                                            <c:set var="title11"><axis:alt f="axispro054" c="LIT23" lit="9902363"/></c:set>
	                                            <c:set var="title12"><axis:alt f="axispro054" c="LIT24" lit="9909667"/></c:set>
	                                            
	                                            <div class="seccion"> <!--INI - IAXIS -14449 - JRVG - 22/10/2020 se remplaza <div class="displayspace"> --> 
	                                                <display:table name="${__formdata.lstExclusiones}"
	                                                               id="idLstExclusiones"
	                                                               export="false"
	                                                               class="dsptgtable"
	                                                               pagesize="-1"
	                                                               defaultsort="1"
	                                                               defaultorder="ascending"
	                                                               sort="list"
	                                                               cellpadding="0"
	                                                               cellspacing="0"
	                                                               requestURI="axis_axispro054.do?paginar=true&subpantalla=datosgenerales">
	                                                               <%@ include file="../include/displaytag.jsp"%>
	                                                       
	                                                        <display:column title="${title1}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable fixed" media="html" autolink="false">
		                                                            <div class="dspText">
		                                                              ${idLstExclusiones.NPOLIZA}
		                                                            </div>
	                                                         </display:column>
	                                                         <display:column title="${title2}" sortable="true" sortProperty="NRECIBO" headerClass="sortable fixed" media="html" autolink="false">
	                                                                <div class="dspText">
	                                                                  ${idLstExclusiones.NRECIBO}
	                                                                </div>
	                                                         </display:column>
	                                                         <display:column title="${title10}" sortable="true" sortProperty="TDELEGA" headerClass="sortable fixed" media="html" autolink="false">
	                                                                <div class="dspText">
	                                                                  ${idLstExclusiones.TDELEGA}
	                                                                </div>
	                                                         </display:column>                                 
	                                                         <display:column title="${title11}" sortable="true" sortProperty="TAGENTE" headerClass="sortable fixed" media="html" autolink="false">
	                                                                <div class="dspText">
	                                                                  ${idLstExclusiones.TAGENTE}
	                                                                </div>
	                                                         </display:column>              
	                                                         <display:column title="${title12}" sortable="true" sortProperty="NTOMADOR" headerClass="sortable fixed" media="html" autolink="false">
	                                                                <div class="dspText">
	                                                                  ${idLstExclusiones.NTOMADOR}
	                                                                </div>
	                                                         </display:column>
	                                                         <display:column title="${title3}" sortable="true" sortProperty="COBSERVEXC" headerClass="sortable fixed" media="html" autolink="false">
	                                                                <div class="dspText">
	                                                                  ${idLstExclusiones.COBSERVEXC}
	                                                                </div>
	                                                         </display:column>
	                                                         <!--INI - IAXIS - 3951 - ML - 07/05/2019 - Se ocultan columnas-->
	                                                         <%-- <display:column title="${title4}" sortable="true" sortProperty="CPROVISI" headerClass="sortable fixed" media="html" autolink="false">
	                                                            <div class="dspText">
	                                                              ${idLstExclusiones.CPROVISI}
	                                                            </div>
	                                                         </display:column>
	                                                         <display:column title="${title5}" sortable="true" sortProperty="COBSERVP" headerClass="sortable fixed" media="html" autolink="false">
	                                                                <div class="dspText">
	                                                                  ${idLstExclusiones.COBSERVP}
	                                                                </div>
	                                                         </display:column> --%>
	                                                         <!--INI - IAXIS - 3951 - ML - 07/05/2019 - Se ocultan columnas-->
	                                                         <display:column title="${title6}" sortable="true" sortProperty="CNPROVISI" headerClass="sortable fixed" media="html" autolink="false">
	                                                                <div class="dspText">
	                                                                  ${idLstExclusiones.CNPROVISI}
	                                                                </div>
	                                                         </display:column>
	                                                         <display:column title="${title7}" sortable="true"  sortProperty="COBSERVNP" headerClass="sortable fixed" media="html" autolink="false">
	                                                            <div class="dspText">
	                                                              ${idLstExclusiones.COBSERVNP}
	                                                            </div>
	                                                         </display:column>
	                                                         <display:column title="${title8}" sortable="true" sortProperty="FALTA" headerClass="sortable fixed" media="html" autolink="false">
	                                                                <div class="dspText">
	                                                                  ${idLstExclusiones.FALTA}
	                                                                </div>
	                                                         </display:column>
	                                                         <display:column title="${title9}"  sortable="true" sortProperty="FBAJA" headerClass="sortable fixed" media="html" autolink="false">
	                                                                <div class="dspText">
	                                                                  ${idLstExclusiones.FBAJA}
	                                                                </div>
	                                                         </display:column>
	                                                         <display:column title="" sortable="false"  sortProperty=""  headerClass="headwidth5 sortable fixed"  media="html"  autolink="false" >
	                                              					 	<div class="dspIcons">
	                                                					<!--INI - IAXIS - 3951 - ML - 07/05/2019 - Se enviar mod ALTA-->
						                                                  <img border="0"
						                                                       alt="<axis:alt f='axispro054' c='LIT_EDIEXCLU' lit='100002'/> <axis:alt f='axispro054' c='LIT_EXCLU' lit='9909978'/>"
						                                                       title="<axis:alt f='axispro054' c='LIT_EDIEXCLU' lit='100002'/> <axis:alt f='axispro054' c='LIT_EXCLU' lit='9909978'/>"
						                                                       src="images/lapiz.gif"
						                                                       onclick="f_abrir_axispro055('${idLstExclusiones.NPOLIZA}', '${idLstExclusiones.NRECIBO}', 'ALTA')"/>
	                                                					<!--INI - IAXIS - 3951 - ML - 07/05/2019 - Se enviar mod ALTA-->
	                                              						</div>
	                                            			 </display:column>
													          <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable fixed" media="html" autolink="false">
						                                              <div class="dspIcons">
						                                                
						                                                  <img border="0"
						                                                       alt="<axis:alt f='axispro054' c='LIT_DELEXCLU' lit='1000127'/> <axis:alt f='axispro054' c='LIT_EXCLU' lit='9909978'/>"
						                                                       title="<axis:alt f='axispro054' c='LIT_DELEXCLU' lit='1000127'/> <axis:alt f='axispro054' c='LIT_EXCLU' lit='9909978'/>"
						                                                       src="images/delete.gif"
						                                                       onclick="f_borrar_exclusion('${idLstExclusiones.NPOLIZA}', '${idLstExclusiones.NRECIBO}')"/>
						                                                
						                                              </div>
						                                            </display:column>             
	                                                </display:table>
	                                            </div>  
	                                        </td>
	                                    </tr>  
	                                </table>
       						
                       </tr>
                       </axis:visible>
                    </table>
                </td>
            </tr>
        </table>			

        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axispro054</c:param><c:param name="f">axispro054</c:param>
            <c:param name="__botones">salir,buscar</c:param>
        </c:import>
    </form>
	
	<script type="text/javascript">
			Calendar.setup({
				inputField     :    "FDESDE",
				ifFormat       :    "%d/%m/%Y",
				button         :    "icon_FDESDE", 
				singleClick    :    true,
				firstDay       :    1
			});
	</script>
	
	<script type="text/javascript">
			Calendar.setup({
				inputField     :    "FHASTA",
				ifFormat       :    "%d/%m/%Y",
				button         :    "icon_FHASTA", 
				singleClick    :    true,
				firstDay       :    1
			});
	</script>
	
    <c:import url="../include/mensajes.jsp" />
</div>
    </body>    

</html>