<%-- 
*  Fichero: axisadm103.jsp
*  @author <a href = "mailto:erhernandez@csi-ti.com">Edgar Hernandez</a>
*
*  Fecha: 16/03/2017
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

        function f_onload_axisadm103() {
            
        	if (document.referrer.indexOf("main.do")>0) { objSeccion.seccionPorAbrirCookieBorrar("axisadm103");}
            if (document.referrer.indexOf("main.do")>0) { objSeccion.posicionPorColorcarCookieBorrar("axisadm103");}
           	f_cargar_propiedades_pantalla();
           	revisarEstilos();
           	
           	
           	
           	objSeccion.abrirSeccionesPorAbrir("axisadm103");
            objSeccion.colocarPosicionPorColocar("axisadm103");
        }
        
                
        function f_but_aceptar() {
        	revisarEstilos();
            parent.f_cerrar_axisadm103();
            formdataSPERSON = '${__formdata.SPERSON}';
            parent.f_aceptar_axisadm103(formdataSPERSON);
        }
        
        function f_but_cancelar() {        
            revisarEstilos();
            parent.f_cerrar_axisadm103();
            formdataSPERSON = '${__formdata.SPERSON}';
            parent.f_aceptar_axisadm103(formdataSPERSON);
        }             
        
        function f_but_salir() {
        	formdataCMODO = '${__formdata.CMODO}';
        	if(formdataCMODO=='ALTA_POLIZA'||formdataCMODO=='MANTTO_PER'){
        	 revisarEstilos();
        	 parent.f_cerrar_axisadm103();
        	}else{
        		objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm103", "cancelar", document.axisadm103Form, "_self");
        	} 
        }
        
        function f_but_nuevo() {   	 
        	INDICAD = 'N';
            objUtiles.abrirModal("axisadm104", "src", "modal_axisadm104.do?operation=form&INDICAD="+INDICAD);
         }   
       
        
                   
        /****************************************************************************************/
        /*********************************** CALLBACK AJAX **************************************/
        /****************************************************************************************/
        
        

        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        /****************************************************************************************/
        /************************************** AXISADM104***************************************/
        /****************************************************************************************/
        
          function f_abrir_axisadm104(CESCRIE,NDESDE,NHASTA) {  
        	  INDICAD = "E";;
             objUtiles.abrirModal("axisadm104", "src", "modal_axisadm104.do?operation=form&CESCRIE="+CESCRIE+"&NDESDE="+NDESDE+"&NHASTA="+NHASTA+"&INDICAD="+INDICAD);
          }   
        
          function f_aceptar_axisadm104(){
        	  f_cerrar_axisadm104();
        	  
              objUtiles.ejecutarFormulario("axis_axisadm103.do", "form", document.axisadm103Form, "_self", objJsMessages.jslit_cargando);
          }   	
        
          function f_cerrar_axisadm104(){
             objUtiles.cerrarModal("axisadm104");
             
          } 
                                 
        /****************************************************************************************/
        /************************************** DOCUMENTACION *******************************************/
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
  <body onload="f_onload_axisadm103()">
 
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>  
         
    <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisrea103" c="MODADM104" lit=""/>
      </c:param>
      <c:param name="nid" value="axisadm104"/>
    </c:import>   
	
	
      
    <form name="axisadm103Form" action="" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="ORIGEN" id="ORIGEN" value="${__formdata.ORIGEN}" />
        <input type="hidden" name="CAGENTE_VISIO" value="${__formdata.CAGENTE_VISIO}" /> 
        <input type="hidden" name="SNIP" value="${__formdata.SNIP}" />
        <input type="hidden" name="CMODO" value="${__formdata.CMODO}"/>
        <input type="hidden" name="CAGENTE"  value="${__formdata.CAGENTE}"/>

        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisadm103" c="formulario" lit="9910608" /></c:param>
            <c:param name="producto"><axis:alt f="axisadm103" c="producto" lit="9910608" /></c:param>
            <c:param name="form">axisadm103</c:param>
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
	                                <th style="height:0px"></th>
	                            </tr>
	                            <!-- Escala de riesgo -->
	                            <axis:visible c="DSP_ESCALADERIESGO" f="axisadm103">
									<c:if test="${__formdata.T_IAX_ESCALARIESGO==null}">
										<tr>
											<td class="campocaja">
											<img src="images/mes.gif" id="DSP_ESCALADERIESGO_parent" onclick="objEstilos.toggleDisplay('DSP_ESCALADERIESGO', this)" style="cursor: pointer" /> 
												<b><axis:alt f="axisadm103" c="CESCALADERIESGO" lit="9910608" /></b>
												<hr class="titulo">
											</td>
										</tr>
										<tr id="DSP_ESCALADERIESGO_children" style="display:yes">
											<td class="campocaja">
											<div class="displayspace">
														                                               
														<c:set var="title0"><axis:alt f="axisadm103" c="TESCRIE_LIT" lit="9910608"/></c:set>
							                            <c:set var="title1"><axis:alt f="axisadm103" c="NDESDE_LIT" lit="104095"/></c:set>
							                            <c:set var="title2"><axis:alt f="axisadm103" c="NHASTA_LIT" lit="103051"/></c:set>				                            
									                    <c:set var="axisadm103_lstEscalaDeRiesgo" value="${__formdata.T_IAX_ESCALADERIESGO}" />    
									                       <div class="separador">&nbsp;</div>
									                       
									                       <display:table name="${__formdata.lstEscalaDeRiesgo}" id="idLstEscalaDeRiesgo" export="false" class="dsptgtable"
																pagesize="-1" defaultsort="2" defaultorder="ascending"
																requestURI="axis_axisadm103.do?paginar=true" sort="list"
																cellpadding="0" cellspacing="0" >
																<%@ include file="../include/displaytag.jsp"%>
									                        	
									                        	<display:column title="${title0}" sortProperty="TESCRIE" headerClass="sortable" media="html" sortable="FALSE" autolink="false">
									                                <div class="dspText">${idLstEscalaDeRiesgo.TESCRIE}</div>
									                            </display:column>
									                            <display:column title="${title1}" sortProperty="NDESDE" headerClass="sortable" media="html" sortable="FALSE" autolink="false">																
									                                <div class="dspNumber">${idLstEscalaDeRiesgo.NDESDE}</div>
									                            </display:column>
									                            <display:column title="${title2}" sortProperty="FCONSTI" headerClass="sortable" media="html" sortable="FALSE" autolink="false">
									                                <div class="dspNumber">${idLstEscalaDeRiesgo.NHASTA}</div>
									                            </display:column>
									                            <display:column title="" sortable="false"  sortProperty=""  headerClass="headwidth5 sortable fixed"  media="html"  autolink="false" >
	                                              					 	<div class="dspIcons">
	                                                
						                                                  <img border="0"
						                                                       alt="<axis:alt f='axisadm103' c='LIT_EDIESCRIE' lit='100002'/> <axis:alt f='axisadm103' c='LIT_ESCRIE' lit='9910608'/>"
						                                                       title="<axis:alt f='axisadm103' c='LIT_EDIESCRIE' lit='100002'/> <axis:alt f='axisadm103' c='LIT_ESCRIE' lit='9910608'/>"
						                                                       src="images/lapiz.gif"
						                                                       onclick="f_abrir_axisadm104('${idLstEscalaDeRiesgo.CESCRIE}', '${idLstEscalaDeRiesgo.NDESDE}', '${idLstEscalaDeRiesgo.NHASTA}')"/>
	                                                
	                                              						</div>
	                                            				</display:column>        
									                        </display:table>     
									                        </div>
									                         
											</td>
											</tr>
									</c:if>		
								</axis:visible>
						</table>
					</td>					
              </tr>
             </table>
            </td>
            </tr>  
         </table>

               
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm103</c:param><c:param name="f">axisadm103</c:param>
            <c:param name="__botones">salir,nuevo</c:param> 
        </c:import>
    </form>
    
	
	    <c:import url="../include/mensajes.jsp" />

    </body>    
</html>