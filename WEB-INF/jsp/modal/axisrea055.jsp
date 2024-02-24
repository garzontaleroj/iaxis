<%-- 
*  Fichero: axisrea055.jsp
*  @author <a href = "mailto:erhernandez@csi-ti.com">Edgar Hernandez</a>
*
*  Fecha: 13/02/2017
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

        function f_onload_axisrea055() {
            
        	if (document.referrer.indexOf("main.do")>0) { objSeccion.seccionPorAbrirCookieBorrar("axisrea055");}
            if (document.referrer.indexOf("main.do")>0) { objSeccion.posicionPorColorcarCookieBorrar("axisrea055");}
           	f_cargar_propiedades_pantalla();
           	revisarEstilos();
           	
           	
           	
           	objSeccion.abrirSeccionesPorAbrir("axisrea055");
            objSeccion.colocarPosicionPorColocar("axisrea055");
        }
        
                
        function f_but_aceptar() {
        	revisarEstilos();
            parent.f_cerrar_axisrea055();
            formdataSPERSON = '${__formdata.SPERSON}';
            parent.f_aceptar_axisrea055(formdataSPERSON);
        }
        
        function f_but_cancelar() {        
            revisarEstilos();
            parent.f_cerrar_axisrea055();
            formdataSPERSON = '${__formdata.SPERSON}';
            parent.f_aceptar_axisrea055(formdataSPERSON);
        }             
        
        function f_but_salir() {
        	revisarEstilos();
        	parent.f_cerrar_axisrea055();
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
  <body onload="f_onload_axisrea055()">
 
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>  
         
    <form name="axisrea055Form" action="modal_axisrea055.do" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="CMODO" value="${__formdata.CMODO}"/>

      	<c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f='axisrea055' c='LIT_DET' lit='9910427'/></c:param>
            <c:param name="producto"><axis:alt f='axisrea055' c='LIT_DET' lit='9910427'/></c:param>
        	<c:param name="form">axisrea055</c:param>    
        </c:import>    
        
        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:300%">
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
	                            <!-- Total cumulo -->
	                            <axis:visible c="DSP_POLIZAS" f="axisrea055">									
										<tr>
											<td class="campocaja">
											
											</td>
										</tr>
										<tr id="DSP_POLIZAS_children" style="display:yes">
											<td class="campocaja">
												<div class="displayspace" style="overflow:auto;width:100%">
														
													     <c:set var="title0"><axis:alt f="axisrea055" c="NANISER_LIT" lit="9910323"/></c:set>
													     <c:set var="title1"><axis:alt f="axisrea055" c="NPOLIZA_LIT" lit="9903659"/></c:set>
							                             <c:set var="title2"><axis:alt f="axisrea055" c="TAMPARO_LIT" lit="9909013"/></c:set>
							                             <c:set var="title3"><axis:alt f="axisrea055" c="NVALDEP_LIT" lit="9910428"/></c:set>         
							                             <c:set var="title4"><axis:alt f="axisrea055" c="NRETENC_LIT" lit="101714"/></c:set>
							                             <c:set var="title5"><axis:alt f="axisrea055" c="NCUOTA1_LIT" lit="9910293"/></c:set>
							                             <c:set var="title6"><axis:alt f="axisrea055" c="NCUOTA2_LIT" lit="9910294"/></c:set>
							                             <c:set var="title7"><axis:alt f="axisrea055" c="NCUOTA3_LIT" lit="9910295"/></c:set>	
							                             <c:set var="title8"><axis:alt f="axisrea055" c="NFACULT_LIT" lit="9910296"/></c:set>	         
							                            <c:set var="title13"><axis:alt f="axisrea055" c="NCUOTA4_LIT" lit="9910305"/></c:set>					                            
							                            <c:set var="title15"><axis:alt f="axisrea055" c="NCUOTA6_LIT" lit="9910308"/></c:set>
							                            <c:set var="title16"><axis:alt f="axisrea055" c="NCUOTA7_LIT" lit="9910309"/></c:set>
							                            <c:set var="title17"><axis:alt f="axisrea055" c="NCUOTA8_LIT" lit="9910310"/></c:set>
							                            <c:set var="title18"><axis:alt f="axisrea055" c="NCUOTA9_LIT" lit="9910311"/></c:set>
							                            <c:set var="title19"><axis:alt f="axisrea055" c="NCUOT10_LIT" lit="9910312"/></c:set>
							                            <c:set var="title20"><axis:alt f="axisrea055" c="NVALDEP_LIT" lit="9910428"/></c:set>
							                            <c:set var="title21"><axis:alt f="axisrea055" c="FEFECTO_LIT" lit="9909982"/></c:set>
         							                             						          							                            				                            
									                    <c:set var="axisrea055_lstPolizas" value="${__formdata.T_IAX_POLIZAS}" />    
									                    <div class="separador">&nbsp;</div>
									                       
									                    <display:table name="${__formdata.lstPolizas}" id="idLstPolizas" export="false" class="dsptgtable"
															pagesize="-1" defaultsort="2" defaultorder="ascending" style="overflow:auto;width:106%"
															cellpadding="0" cellspacing="1"  requestURI="axis_axisrea055.do?paginar=true" sort="list">
															<%@ include file="../include/displaytag.jsp"%>
															
															    <display:column title="${title0}" sortProperty="NANISER" style="width:7%" headerClass="headwidth7 sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber">${idLstPolizas.SERIE}</div>
									                            </display:column>
									                            <display:column title="${title1}" sortProperty="NPOLIZA" style="width:7%" headerClass="headwidth7 sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstPolizas.NPOLIZA}"/></div>
									                            </display:column>
									                            <display:column title="${title2}" sortProperty="TAMPARO" style="width:7%" headerClass="headwidth7 sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspText">${idLstPolizas.TGARANT}</div>
									                            </display:column>
									                            <display:column title="${title20}" sortProperty="NVALDEP" style="width:7%" headerClass="headwidth7 sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstPolizas.TOTDEPU}"/></div>
									                            </display:column>
									                            <display:column title="${title21}" sortProperty="FEFECTO" style="width:7%" headerClass="headwidth7 sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspDate"><fmt:formatDate value='${idLstPolizas.FEFECDEMA}' pattern='yyyy/MM/dd'/></div>
									                            </display:column>
									                            <display:column title="${title4}" sortProperty="NRETENC" style="width:7%" headerClass="headwidth7 sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstPolizas.RETE}"/></div>
									                            </display:column>
									                            <c:if test="${!empty __formdata.Q1&&__formdata.Q1>0}">
									                            <display:column title="${title5}" sortProperty="NCUOTA1" style="width:7%" headerClass="headwidth7 sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstPolizas.Q1}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty __formdata.Q2&&__formdata.Q2>0}">
									                            <display:column title="${title6}" sortProperty="NCUOTA2" style="width:7%" headerClass="headwidth7 sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstPolizas.Q2}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty __formdata.Q3&&__formdata.Q3>0}">
									                            <display:column title="${title7}" sortProperty="NCUOTA3" style="width:7%" headerClass="headwidth7 sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstPolizas.Q3}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty __formdata.Q4&&__formdata.Q4>0}"> 
									                            <display:column title="${title13}" sortProperty="NCUOTA4" style="width:7%" headerClass="headwidth7 sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstPolizas.Q4}"/></div>
									                            </display:column>
									                            </c:if><c:if test="${!empty __formdata.Q6&&__formdata.Q6>0}">
									                            <display:column title="${title15}" sortProperty="NCUOTA1" style="width:7%" headerClass="headwidth7 sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstPolizas.Q6}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty __formdata.Q7&&__formdata.Q7>0}">
									                            <display:column title="${title16}" sortProperty="NCUOTA2" style="width:7%" headerClass="headwidth7 sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstPolizas.Q7}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty __formdata.Q8&&__formdata.Q8>0}">
									                            <display:column title="${title17}" sortProperty="NCUOTA8" style="width:7%" headerClass="headwidth7 sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstPolizas.Q8}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty __formdata.Q9&&__formdata.Q9>0}"> 
									                            <display:column title="${title18}" sortProperty="NCUOTA9" style="width:7%" headerClass="headwidth7 sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstPolizas.Q9}"/></div>
									                            </display:column>
									                            </c:if><c:if test="${!empty __formdata.Q10&&__formdata.Q10>0}"> 
									                            <display:column title="${title19}" sortProperty="NCUOT10" style="width:7%" headerClass="headwidth7 sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstPolizas.Q10}"/></div>
									                            </display:column></c:if>
									                            <display:column title="${title8}" sortProperty="NFACULT" style="width:7%" headerClass="headwidth7 sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstPolizas.FACUL}"/></div>
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
	             
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea055</c:param><c:param name="f">axisrea055</c:param>
            <c:param name="__botones">salir</c:param> 
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