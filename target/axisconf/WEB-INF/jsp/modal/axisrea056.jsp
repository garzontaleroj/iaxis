<%/* Revision:# lqMzsv+OOaWQ+VdqZqtB2Q== # */%>
<%-- 
*  Fichero: axisrea056.jsp
*  @author <a href = "mailto:erhernandez@csi-ti.com">Edgar Hernandez</a>
*
*  Fecha: 16/02/2017
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes"%>
<%@ page import="java.util.*"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
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

        function f_onload_axisrea056() {
        	<c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
			retocarPAGE_CSS('axisrea056');
			</c:if>
			revisarEstilos();
			var resultado = '${requestScope.resultado}';
			if (!objUtiles.estaVacio(resultado) && resultado == "0"){
			    parent.f_aceptar_axisrea056();  
			}                 

        }
        
                
        function f_but_aceptar() {
        	if(objUtiles.estaVacio($("#NPORDEP").val())&&objUtiles.estaVacio($("#NVALDEP").val())){
        		alert("<axis:alt f="axisrea056" c="AVISO" lit="9910450" />");	
        	}else{ 
        		if(!objUtiles.estaVacio($("#NPORDEP").val())&&objUtiles.estaVacio($("#NVALDEP").val())){	        		
	        		INDICAD = "P";
	        		VALOR = document.axisrea056Form.NPORDEP.value; 	
        		}else if (objUtiles.estaVacio($("#NPORDEP").val())&&!objUtiles.estaVacio($("#NVALDEP").val())){
        			INDICAD = "V";
	        		VALOR = document.axisrea056Form.NVALDEP.value;
        		}
        		
        		NPOLIZA = "${__formdata.NPOLIZA}";
        		TSUPLEM = "${__formdata.TSUPLEM}";
        		TAMPARO = "${__formdata.TAMPARO}";
        		NVALAMP = "${__formdata.NVALAMP}";
        		SSEGURO = "${__formdata.SSEGURO}";
        		CGENERA = "${__formdata.CGENERA}";
        		CGARANT = "${__formdata.CGARANT}";
        		objUtiles.ejecutarFormulario("modal_axisrea056.do?operation=aceptar&SSEGURO="+SSEGURO+"&CGENERA="+CGENERA+"&CGARANT="+CGARANT+"&INDICAD="+INDICAD+"&VALOR="+VALOR+"&NPOLIZA="+NPOLIZA+"&TSUPLEM="+TSUPLEM+"&TAMPARO="+TAMPARO+"&NVALAMP="+NVALAMP, "aceptar", document.axisrea056Form, "_self", objJsMessages.jslit_cargando);
        		revisarEstilos();
                //parent.f_aceptar_axisrea056();	
        	}
        }
        
        function f_but_cancelar() {        
            revisarEstilos();
            parent.f_cerrar_axisrea056();
            formdataSPERSON = '${__formdata.SPERSON}';
            parent.f_aceptar_axisrea056(formdataSPERSON);
        }             
        
        function f_but_salir() {
        	revisarEstilos();
        	parent.f_cerrar_axisrea056();
        }
        
            
        /****************************************************************************************/
        /*********************************** CALLBACK AJAX **************************************/
        /****************************************************************************************/
        
        
        
		
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        
        
        
        /****************************************************************************************/
        /************************************** DOCUMENTACION *******************************************/
        /****************************************************************************************/
          
          function f_but_1000615() { // Aadir documentacin
        	  SPERSON = "${__formdata.SPERSON}";  
        	  CAGENTE = "${__formdata.CAGENTE}";   
              f_abrir_modal("axisper030", true, "&SPERSON="+SPERSON+"&CAGENTE="+CAGENTE);              
              
          }
          
          function f_modifdocum(SPERSON,IDDOCGEDOX){
              f_abrir_modal("axisper030", true, "&SPERSON="+SPERSON+"&CAGENTE=${__formdata.CAGENTE}&IDDOCGEDOX="+IDDOCGEDOX);
      
          }
          
          function f_aceptar_axisper030(){
              objUtiles.cerrarModal("axisper030");
              SPERSON = "${__formdata.SPERSON}";
              objUtiles.ejecutarFormulario("axis_axisfic001.do?&SPERSON="+SPERSON, "form", document.miForm, "_self", objJsMessages.jslit_cargando); 
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
        
    	    	
    	function f_valida_NPORDEP_NVALDEP(){
    		NVALAMP = new Number("${__formdata.NVALAMP}");
    		if(objUtiles.estaVacio($("#NPORDEP").val())&&objUtiles.estaVacio($("#NVALDEP").val())){
    			document.axisrea056Form.NVALDEP.readOnly = false;
				document.axisrea056Form.NPORDEP.readOnly = false;
    		}else if(!objUtiles.estaVacio($("#NPORDEP").val())){    				
    			if($("#NPORDEP").val() <= 0 || $("#NPORDEP").val() > 100){
	    			alert("<axis:alt f="axisrea056" c="AVISO1" lit="9904621" />");
					document.axisrea056Form.NPORDEP.value = "";
					document.axisrea056Form.NVALDEP.readOnly = false;
					document.axisrea056Form.NPORDEP.readOnly = false;
    			}else{
    				document.axisrea056Form.NVALDEP.readOnly = true;
    			} 	
			}else if(!objUtiles.estaVacio($("#NVALDEP").val())){
				if($("#NVALDEP").val() <= 0 || $("#NVALDEP").val() > NVALAMP){
					alert("<axis:alt f="axisrea056" c="AVISO2" lit="9910449" />"+": "+NVALAMP);
					document.axisrea056Form.NVALDEP.value = "";
					document.axisrea056Form.NVALDEP.readOnly = false;
					document.axisrea056Form.NPORDEP.readOnly = false;
				}else{
					document.axisrea056Form.NPORDEP.readOnly = true;
				}	
			}
		}
    	        
    </script>  

  </head>
  <body onload="f_onload_axisrea056()">
 
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>  
    
     <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisper030" c="MOD_DOCUM" lit="1000431"/></c:param>
                <c:param name="nid" value="axisper030" />
    </c:import> 
         
    <form name="axisrea056Form" action="modal_axisrea056.do" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="CMODO" value="${__formdata.CMODO}"/>

      	<c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f='axisrea056' c='LIT_DET' lit='9910436'/></c:param>
            <c:param name="producto"><axis:alt f='axisrea056' c='LIT_DET' lit='9910436'/></c:param>
        	<c:param name="form">axisrea056</c:param>    
        </c:import>    
        
        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:130px">
            <div class="separador">&nbsp;</div>
            <tr>
                <td>
                    <table class="seccion">
                    	<tr>
			               <td align="left">
			                  <table class="area" align="center">
                       		  	<tr>
	                                <th style="height:0px"></th>
	                            </tr>
	                            <!-- Consulta Poliza -->
	                            <axis:visible c="DSP_CONSULTAPOLIZA" f="axisrea056">									
										<tr>
											<td class="campocaja">

											</td>
										</tr>
										<tr id="DSP_CONSULTAPOLIZA_children" style="display:yes">
											<td class="campocaja">
												<div class="displayspace">
														
													    <c:set var="title1"><axis:alt f="axisrea056" c="NPOLIZA_LIT" lit="9903659"/></c:set>
													    <c:set var="title2"><axis:alt f="axisrea056" c="TSUPLEM_LIT" lit="9001641"/></c:set>
													    <c:set var="title3"><axis:alt f="axisrea056" c="TAMPARO_LIT" lit="9909013"/></c:set>
													    <c:set var="title4"><axis:alt f="axisrea056" c="TVALAMP_LIT" lit="9910435"/></c:set>
         							                             						          							                            				                            
									                    <c:set var="axisrea056_lstPoliza" value="${__formdata.T_IAX_POLIZA}" />    
									                    <div class="separador">&nbsp;</div>
									                       
									                    <display:table name="${__formdata.lstPoliza}" id="idLstPoliza" export="false" class="dsptgtable"
															pagesize="-1" defaultsort="2" defaultorder="ascending"
															cellpadding="0" cellspacing="1"  requestURI="axis_axisrea056.do?paginar=true" sort="list">
															<%@ include file="../include/displaytag.jsp"%>
															
															    <display:column title="${title1}" sortProperty="NPOLIZA" style="width:25%" headerClass="headwidth7 sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstPoliza.NPOLIZA}"/></div>
									                            </display:column>
									                            <display:column title="${title2}" sortProperty="TSUPLEM" style="width:25%" headerClass="headwidth7 sortable fixed" media="html" sortable="false" autolink="false">																
									                                <div class="dspText">${idLstPoliza.TSUPLEM}</div>
									                            </display:column>
									                            <display:column title="${title3}" sortProperty="TAMPARO" style="width:25%" headerClass="headwidth7 sortable fixed" media="html" sortable="false" autolink="false">																
									                                <div class="dspText">${idLstPoliza.TAMPARO}</div>
									                            </display:column>
									                            <display:column title="${title4}" sortProperty="NVALAMP" style="width:25%" headerClass="headwidth7 sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstPoliza.NVALAMP}"/></div>
									                            </display:column>
									                        										                            								                            									                            									                 
									                   </display:table>     
							   					</div>
							   				</td>
							   			</tr>
							    </axis:visible>
							    <!-- Depurar -->
	                            <axis:visible c="DSP_DEPURAR" f="axisrea056">									
										<tr>
											<td class="campocaja">
												<img src="images/mes.gif" id="DSP_DEPURAR_parent" onclick="objEstilos.toggleDisplay('DSP_DEPURAR', this)" style="cursor: pointer" /> 
													<b><axis:alt f="axisrea054" c="CDEPURAR" lit="9910437" /></b>
													<hr class="titulo">
											</td>
										</tr>
										<tr id="DSP_DEPURAR_children" style="display:yes">
											<td class="campocaja">
												 <table class="seccion">	
							                       <tr>
										               <th style="width:10%;height:0px"></th>
										               <th style="width:30%;height:0px"></th>
										               <th style="width:60%;height:0px"></th>
							                       </tr>
							                       <tr>  												 												 
													 
														 <axis:visible f="axisrea056" c="NPORDEP">
								                             <td class="titulocaja" id="LIT_NPORDEP" colspan="1">
								                               <b><axis:alt f="axisrea056" c="NPORDEP" lit="9910438"/></b>
								                             </td>
								                         </axis:visible>  
							                         
								                         <axis:visible f="axisrea056" c="NPORDEP" >
							                            	  <td class="campocaja" colspan="1">
							                             	   <input type="numeric" class="campowidthinput campo camponumerico" id="NPORDEP" name="NPORDEP"  
							                              		   title="<axis:alt f="axisrea056" c="NPORDEP" lit="9910438"/>" style="width:90%" 
							                              		   value="${__formdata.NPORDEP}" onblur="f_valida_NPORDEP_NVALDEP()"
							                                 	 <axis:atr f="axisrea056" c="NPORDEP" a="obligatorio=false"/>/>
							                             	 </td>                                                 
							                          	 </axis:visible>
							                          	 
							                          
												    </tr>
												    <tr>  												 												 
														 <axis:visible f="axisrea056" c="NVALDEP">
								                             <td class="titulocaja" id="LIT_NVALDEP" colspan="1">
								                               <b><axis:alt f="axisrea056" c="NVALDEP" lit="9910439"/></b>
								                             </td>
								                         </axis:visible>   
								                         
								                         <axis:visible f="axisrea056" c="NVALDEP" >
							                            	  <td class="campocaja" colspan="1">
							                             	   <input type="numeric" class="campowidthinput campo camponumerico" id="NVALDEP" name="NVALDEP"  
							                              		   title="<axis:alt f="axisrea056" c="NVALDEP" lit="9910438"/>" style="width:90%" onblur="f_valida_NPORDEP_NVALDEP()"
							                              		   value="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${__formdata.NVALDEP}"/>"							                              		     
							                                 	 <axis:atr f="axisrea056" c="NVALDEP" a="obligatorio=false"/>/>
							                             	 </td>                                                 
							                          	 </axis:visible>
							                          	 
							                          	 
							                          	 <axis:visible f="axispro056" c="CANIADIRDOC"> 
															<td class="campocaja" colspan="1">
											                    <input type="button" class="boton" id="CANIADIRDOC" 
											                         value="<axis:alt f="axispro055" c="BT_ANIADIRDOC" 
											                         lit="9902032"></axis:alt>" onclick="f_but_1000615()" />
											                <td>
											            </axis:visible>
							                          	 
												    </tr>
							   					</table>
							   				</td>
							   			</tr>
							    </axis:visible>
	                </table>  
	           </td>
	         </tr>  
	    </table>         
	             
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea056</c:param><c:param name="f">axisrea056</c:param>
            <c:param name="__botones">salir,aceptar</c:param> 
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
