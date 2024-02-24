<%-- 
*  Fichero: axisrea053.jsp
*  @author <a href = "mailto:erhernandez@csi-ti.com">Edgar Hernandez</a>
*
*  Fecha: 23/01/2017
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
      <!-- Idioma del calendario, en función del Locale -->
      <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
      <!-- Setup del calendario -->
      <script type="text/javascript" src="scripts/calendar-setup.js"></script>
    <!--*********************************** --> 

    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload_axisrea053() {
            
        	if (document.referrer.indexOf("main.do")>0) { objSeccion.seccionPorAbrirCookieBorrar("axisrea053");}
            if (document.referrer.indexOf("main.do")>0) { objSeccion.posicionPorColorcarCookieBorrar("axisrea053");}
           	f_cargar_propiedades_pantalla();
           	revisarEstilos();
           	
           	
           	
           	objSeccion.abrirSeccionesPorAbrir("axisrea053");
            objSeccion.colocarPosicionPorColocar("axisrea053");
        }
        
                
        function f_but_aceptar() {
        	revisarEstilos();
            parent.f_cerrar_axisrea053();
            formdataSPERSON = '${__formdata.SPERSON}';
            parent.f_aceptar_axisrea053(formdataSPERSON);
        }
        
        function f_but_cancelar() {        
            revisarEstilos();
            parent.f_cerrar_axisrea053();
            formdataSPERSON = '${__formdata.SPERSON}';
            parent.f_aceptar_axisrea053(formdataSPERSON);
        }             
        
        function f_but_salir() {
        	revisarEstilos();
        	parent.f_cerrar_axisrea053();
        }
        
            
        
        function f_cargar_detalle(SSEGURO){
            
        	objDom.setValorPorId("SSEGURO", SSEGURO);
        	
        	FCORTE = "<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FCORTE}'/>" 
            SPERSON = '${__formdata.SPERSON}'; 
        	NNUMIDE = '${__formdata.NNUMIDE}';            
            TIPCOMP = '${__formdata.TIPCOMP}';
            objUtiles.ejecutarFormulario ("modal_axisrea053.do?&TIPCOMP="+TIPCOMP+"&SSEGURO="+SSEGURO+"&FCORTE="+FCORTE+"&SPERSON="+SPERSON+"&NNUMIDE="+NNUMIDE, "cargar_detalle", document.axisrea053Form, "_self", objJsMessages.jslit_cargando);  
            
        }
        
        
        /****************************************************************************************/
        /*********************************** CALLBACK AJAX **************************************/
        /****************************************************************************************/
        
        

        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
       
           
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
  <body onload="f_onload_axisrea053()">
 
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>  
         
    <form name="axisrea053Form" action="modal_axisrea053.do" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="CMODO" value="${__formdata.CMODO}"/>
        
        <c:if test="${__formdata.CMODO == 1}">
        	<c:import url="../include/titulo_nt.jsp">
	            <c:param name="formulario"><axis:alt f="axisrea053" c="formulario" lit="9910297" /></c:param>
	            <c:param name="producto"><axis:alt f="axisrea053" c="producto" lit="9910297" /></c:param>
	        	<c:param name="form">axisrea053</c:param>    
	        </c:import>    
	    </c:if>
	    <c:if test="${__formdata.CMODO == 2}">   
	       <c:import url="../include/titulo_nt.jsp">
	            <c:param name="formulario"><axis:alt f="axisrea053" c="formulario" lit="9910298" /></c:param>
	            <c:param name="producto"><axis:alt f="axisrea053" c="producto" lit="9910298" /></c:param>
	            <c:param name="form">axisrea053</c:param>    
	        </c:import>    
        </c:if>
        
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
	                            <!-- Registro General -->
	                            <axis:visible c="DSP_REGIGENERAL" f="axisrea053">									
										<tr>
											<td class="campocaja">
											<img src="images/mes.gif" id="DSP_REGIGENERAL_parent" onclick="objEstilos.toggleDisplay('DSP_REGIGENERAL', this)" style="cursor: pointer" /> 
												<b><axis:alt f="axisrea053" c="CREGIGENERAL" lit="9910288" /></b>
												<hr class="titulo">
											</td>
										</tr>
										<tr id="DSP_REGIGENERAL_children" style="display:yes">
											<td class="campocaja">
												<div class="displayspace">
														
														<c:set var="title3"><axis:alt f="axisrea053" c="TCOBER_LIT" lit="9908743"/></c:set>
													    <c:set var="title0"><axis:alt f="axisrea053" c="TPRODUC_LIT" lit="100829"/></c:set>
							                            <c:set var="title1"><axis:alt f="axisrea053" c="NPOLIZA_LIT" lit="9903659"/></c:set>
							                            <c:set var="title2"><axis:alt f="axisrea053" c="NCVALOR_LIT" lit="101159"/></c:set>
         							                             						          							                            				                            
									                    <c:set var="axisrea053_lstAcumulacionesRG" value="${__formdata.T_IAX_REGISTROGENERAL}" />    
									                    <div class="separador">&nbsp;</div>
									                       
									                    <display:table name="${__formdata.lstRegistroGeneral}" id="idLstRegistroGeneral" export="false" class="dsptgtable"
															pagesize="-1" defaultsort="2" defaultorder="ascending" cellpadding="0" cellspacing="1"
															requestURI="axis_axisrea053.do?paginar=true" sort="list">
															<%@ include file="../include/displaytag.jsp"%>
									                        										                            
									                            <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
							                                        <div class="dspIcons">
								                                        <input <c:if test="${!empty idLstRegistroGeneral.SEGURO && !empty __formdata.SEGURO
								                                                  && idLstRegistroGeneral.SEGURO != null && __formdata.SEGURO != null
								                                                  && idLstRegistroGeneral.SEGURO == __formdata.SEGURO}">checked</c:if>
								                                               type="radio" id="checked_cursor" name="checked_cursor" 
								                                               onclick="f_cargar_detalle('${idLstRegistroGeneral.SEGURO}');"
								                                               value="${idLstRegistroGeneral['SEGURO']}"/>
							                                        </div>
						                                         </display:column>            
									                            <display:column title="${title3} ${title0}" sortProperty="TPRODUC" style="width:32%" headerClass="headwidth32 sortable fixed" media="html" sortable="false" autolink="false">																
									                                <div class="dspText">${idLstRegistroGeneral.GARANTIA}</div>
									                            </display:column>
									                            <display:column title="${title1}" sortProperty="NPOLIZA" style="width:32%" headerClass="headwidth32 sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstRegistroGeneral.POLIZA}"/></div>
									                            </display:column>
									                            <display:column title="${title2}" sortProperty="NCVALOR" style="width:32%" headerClass="headwidth32 sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstRegistroGeneral.VALOR}"/></div>
									                            </display:column>
									                            									                            									                 
									                   </display:table>     
							   					</div>
							   				</td>
							   			</tr>
							    </axis:visible>
							     <!-- Registro Individual -->
	                            <axis:visible c="DSP_REGIINDIVIDUAL" f="axisrea053">									
										<tr>
											<td class="campocaja">
											<img src="images/mes.gif" id="DSP_REGIINDIVIDUAL_parent" onclick="objEstilos.toggleDisplay('DSP_REGIINDIVIDUAL', this)" style="cursor: pointer" /> 
												<b><axis:alt f="axisrea053" c="CREGIINDIVIDUAL" lit="9910303" /></b>
												<hr class="titulo">
											</td>
										</tr>
										<tr id="DSP_REGIINDIVIDUAL_children" style="display:yes">
											<td class="campocaja">
												<div class="displayspace">
														
														<c:set var="title0"><axis:alt f="axisrea053" c="TGARFUT_LIT" lit="9910317"/></c:set>
							                            <c:set var="title1"><axis:alt f="axisrea053" c="NCVALOR_LIT" lit="101159"/></c:set>
							                          				                            
									                    <c:set var="axisrea053_lstAcumulaciones" value="${__formdata.T_IAX_REGISTROINDIVIDUAL}" />    
									                    <div class="separador">&nbsp;</div>
									                       
									                    <display:table name="${__formdata.lstRegistroIndividual}" id="idLstRegistroIndividual" export="false" class="dsptgtable"
															pagesize="-1" defaultsort="2" defaultorder="ascending"  cellpadding="0" cellspacing="1"
															requestURI="axis_axisrea053.do?paginar=true" sort="list"  >
															<%@ include file="../include/displaytag.jsp"%>
									                        	
									                        	<display:column title="${title0}" sortProperty="TGARFUT" style="width:50%" headerClass="headwidth50 sortable fixed" media="html" sortable="false" autolink="false">																
									                                <div class="dspText">${idLstRegistroIndividual.TGARANT}</div>
									                            </display:column>
									                            
									                        	<display:column title="${title1}" sortProperty="NVALOR" style="width:50%" headerClass="headwidth50 sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstRegistroIndividual.VALOR}"/></div>
									                            </display:column>
									                            									                 
									                   </display:table>     
									         	</div>                
											</td>
											</tr>	
								</axis:visible>
	                </table>  
	           </td>
	         </tr>  
	    </table>         
	             
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea053</c:param><c:param name="f">axisrea053</c:param>
            <c:param name="__botones">salir</c:param> 
        </c:import>
    </form>
    
	    <c:import url="../include/mensajes.jsp" />

    </body>    
</html>