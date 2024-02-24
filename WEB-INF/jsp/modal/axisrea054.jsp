<%-- 
*  Fichero: axisrea054.jsp
*  @author <a href = "mailto:erhernandez@csi-ti.com">Edgar Hernandez</a>
*
*  Fecha: 08/02/2017
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

        function f_onload_axisrea054() {
            
        	if (document.referrer.indexOf("main.do")>0) { objSeccion.seccionPorAbrirCookieBorrar("axisrea054");}
            if (document.referrer.indexOf("main.do")>0) { objSeccion.posicionPorColorcarCookieBorrar("axisrea054");}
           	f_cargar_propiedades_pantalla();
           	revisarEstilos();
           	
           	
           	
           	objSeccion.abrirSeccionesPorAbrir("axisrea054");
            objSeccion.colocarPosicionPorColocar("axisrea054");
        }
        
                
        function f_but_aceptar() {
        	revisarEstilos();
            parent.f_cerrar_axisrea054();
            formdataSPERSON = '${__formdata.SPERSON}';
            parent.f_aceptar_axisrea054(formdataSPERSON);
        }
        
        function f_but_cancelar() {        
            revisarEstilos();
            parent.f_cerrar_axisrea054();
            formdataSPERSON = '${__formdata.SPERSON}';
            parent.f_aceptar_axisrea054(formdataSPERSON);
        }             
        
        function f_but_salir() {
        	revisarEstilos();
        	parent.f_cerrar_axisrea054();
        }
        
            
        /****************************************************************************************/
        /*********************************** CALLBACK AJAX **************************************/
        /****************************************************************************************/
        
        

        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        /****************************************************************************************/
        /************************************** AXISREA055***************************************/
        /****************************************************************************************/
                  
          function f_abrir_axisrea055(SERIE) {    
         	 FCORTE = "<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FCORTE}'/>"
         	 CESVALOR = "${__formdata.CESVALOR}";
              NNUMIDE = "${__formdata.NNUMIDE}";
              SPERSON = "${__formdata.SPERSON}";
              objUtiles.abrirModal("axisrea055", "src", "modal_axisrea055.do?operation=form&FCORTE="+FCORTE+"&NNUMIDE="+NNUMIDE+"&CESVALOR="+CESVALOR+"&SERIE="+SERIE+"&SPERSON="+SPERSON);
           }
          
          function f_cerrar_axisrea055(){
             objUtiles.cerrarModal("axisrea055");
          } 
       
        /****************************************************************************************/
        /************************************** AXISREA056***************************************/
        /****************************************************************************************/
          function f_aceptar_axisrea056(){
        	  FCORTE = "<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FCORTE}'/>"  
              CESVALOR = "${__formdata.CESVALOR}";
              NNUMIDE = "${__formdata.NNUMIDE}";    
              f_cerrar_axisrea056();
              objUtiles.ejecutarFormulario("modal_axisrea054.do?operation=form&NNUMIDE="+NNUMIDE+"&CESVALOR="+CESVALOR+"&FCORTE="+FCORTE+"&SPERSON="+SPERSON+"&CAGENTE="+CAGENTE, "form", document.axisrea054Form, "_self", objJsMessages.jslit_cargando);
          }  
          
          function f_abrir_axisrea056(NPOLIZA, TSUPLEM, TAMPARO, NVALAMP, SSEGURO, CGARANT, CGENERA, SPERSON, CAGENTE) {
              objUtiles.abrirModal("axisrea056", "src", "modal_axisrea056.do?operation=form&NPOLIZA="+NPOLIZA+"&TSUPLEM="+TSUPLEM+"&TAMPARO="+TAMPARO+"&NVALAMP="+NVALAMP+"&SSEGURO="+SSEGURO+"&CGARANT="+CGARANT+"&CGENERA="+CGENERA+"&SPERSON="+SPERSON+"&CAGENTE="+CAGENTE);
          }   
            
          function f_cerrar_axisrea056(){
               objUtiles.cerrarModal("axisrea056");
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
  <body onload="f_onload_axisrea054()">
 
 	<c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
                <axis:alt c="CONREA055" f="axisrea054" lit=""/>
        </c:param>
        <c:param name="nid" value="axisrea055"/>
    </c:import>  
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
                <axis:alt c="CONREA056" f="axisrea054" lit=""/>
        </c:param>
        <c:param name="nid" value="axisrea056"/>
    </c:import>  
 
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>  
         
    <form name="axisrea054Form" action="modal_axisrea054.do" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="CMODO" value="${__formdata.CMODO}"/>

      	<c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f='axisrea054' c='LIT_DET' lit='9910321'/></c:param>
            <c:param name="producto"><axis:alt f='axisrea054' c='LIT_DET' lit='9910321'/></c:param>
        	<c:param name="form">axisrea054</c:param>    
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
	                            <!-- Total cumulo -->
	                            <axis:visible c="DSP_TOTALCUMULO" f="axisrea054">									
										<tr>
											<td class="campocaja">
											<img src="images/mes.gif" id="DSP_TOTALCUMULO_parent" onclick="objEstilos.toggleDisplay('DSP_TOTALCUMULO', this)" style="cursor: pointer" /> 
												<b><axis:alt f="axisrea054" c="CTOTALCUMULO" lit="9910322" /></b>
												<hr class="titulo">
											</td>
										</tr>
										
										<tr id="DSP_TOTALCUMULO_children" style="display:yes">
											<td class="campocaja">
												<div class="displayspace" style="overflow:auto;width:98%">
														
													     <c:set var="title0"><axis:alt f="axisrea054" c="NCUMTOT_LIT" lit="9910289"/></c:set>
													     <c:set var="title1"><axis:alt f="axisrea052" c="NCUDEPU_LIT" lit="89907030"/></c:set>
													     <c:set var="title2"><axis:alt f="axisrea054" c="NCUENRI_LIT" lit="9910290"/></c:set>
							                             <c:set var="title3"><axis:alt f="axisrea054" c="NCUNORI_LIT" lit="9910291"/></c:set>
							                             <c:set var="title4"><axis:alt f="axisrea054" c="NDEPMAN_LIT" lit="9910329"/></c:set>	         
							                             <c:set var="title5"><axis:alt f="axisrea054" c="NRETENC_LIT" lit="101714"/></c:set>
							                             <c:set var="title6"><axis:alt f="axisrea054" c="NCUOTA1_LIT" lit="9910293"/></c:set>
							                             <c:set var="title7"><axis:alt f="axisrea054" c="NCUOTA2_LIT" lit="9910294"/></c:set>
							                             <c:set var="title8"><axis:alt f="axisrea054" c="NCUOTA3_LIT" lit="9910295"/></c:set>	
							                             <c:set var="title9"><axis:alt f="axisrea054" c="NFACULT_LIT" lit="9910296"/></c:set>	         
							                            <c:set var="title13"><axis:alt f="axisrea054" c="NCUOTA4_LIT" lit="9910305"/></c:set>					                            
							                            <c:set var="title15"><axis:alt f="axisrea054" c="NCUOTA6_LIT" lit="9910308"/></c:set>
							                            <c:set var="title16"><axis:alt f="axisrea054" c="NCUOTA7_LIT" lit="9910309"/></c:set>
							                            <c:set var="title17"><axis:alt f="axisrea054" c="NCUOTA8_LIT" lit="9910310"/></c:set>
							                            <c:set var="title18"><axis:alt f="axisrea054" c="NCUOTA9_LIT" lit="9910311"/></c:set>
							                            <c:set var="title19"><axis:alt f="axisrea054" c="NCUOT10_LIT" lit="9910312"/></c:set>
							                            <c:set var="title20"><axis:alt f="axisrea054" c="NDEPAUT_LIT" lit="9910456"/></c:set>
         							                             						          							                            				                            
									                    <c:set var="axisrea054_lstAcumulacionesRG" value="${__formdata.T_IAX_TOTALCUMULO}" />    
									                    <div class="separador">&nbsp;</div>
									                       
									                    <display:table name="${__formdata.lstTotalCumulo}" id="idLstTotalCumulo" export="false" class="dsptgtable"
															pagesize="-1" defaultsort="2" defaultorder="ascending" style="overflow:auto;width:120%"
															cellpadding="0" cellspacing="1"  requestURI="axis_axisrea054.do?paginar=true" sort="list">
															<%@ include file="../include/displaytag.jsp"%>
															
															    <display:column title="${title0}" sortProperty="NCUMTOT"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumulo.CUM_TOT}"/></div>
									                            </display:column>
									                             <display:column title="${title1}" sortProperty="NCUDEPU"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumulo.CUM_DEPU}"/></div>
									                            </display:column>
									                            <display:column title="${title2}" sortProperty="NCUENRI"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumulo.CUM_RIES}"/></div>
									                            </display:column>
									                            <display:column title="${title3}" sortProperty="NCUNORI"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumulo.CUM_NORIES}"/></div>
									                            </display:column>
									                            <display:column title="${title20}" sortProperty="NDEPAUT" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumulo.DEPUAUT}"/></div>
									                            </display:column>
									                            <display:column title="${title4}" sortProperty="NDEPMAN"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumulo.DEPURA}"/></div>
									                            </display:column>
									                            <display:column title="" sortable="false"  sortProperty="" headerClass="sortable fixed"  media="html" autolink="false">
					                 								 <div class="dspIcons">
					                 								    <c:if test="${!empty idLstTotalCumulo.DEPURA&&idLstTotalCumulo.DEPURA>0}">
					                    			                      <img border="0" alt="<axis:alt f='axisrea054' c='LIT_CODECUMA' lit='1000439'/> <axis:alt f='axisrea054' c='LIT_CDCM' lit='9910426'/>"
													                           title="<axis:alt f='axisrea054' c='LIT_CODECOMA' lit='1000439'/> <axis:alt f='axisrea054' c='LIT_CDCM' lit='9910426'/>"
													                           src="images/informacion.gif"  onclick="f_abrir_axisrea055('')" />
													                    </c:if>     
													                 </div>
													            </display:column>
									                            <display:column title="${title5}" sortProperty="NRETENC" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumulo.RETE}"/></div>
									                            </display:column>
									                            
									                            <display:column title="${title6}" sortProperty="NCUOTA1" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumulo.Q1}"/></div>
									                            </display:column>
									                            
									                            <display:column title="${title7}" sortProperty="NCUOTA2"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumulo.Q2}"/></div>
									                            </display:column>
									                            <c:if test="${!empty idLstTotalCumulo.Q3}">
									                            <display:column title="${title8}" sortProperty="NCUOTA3"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumulo.Q3}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty idLstTotalCumulo.Q4&&idLstTotalCumulo.Q4>0}"> 
									                            <display:column title="${title13}" sortProperty="NCUOTA4" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumulo.Q4}"/></div>
									                            </display:column>
									                            </c:if><c:if test="${!empty idLstTotalCumulo.Q6&&idLstTotalCumulo.Q6>0}">
									                            <display:column title="${title15}" sortProperty="NCUOTA1" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumulo.Q6}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty idLstTotalCumulo.Q7&&idLstTotalCumulo.Q7>0}">
									                            <display:column title="${title16}" sortProperty="NCUOTA2" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumulo.Q7}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty idLstTotalCumulo.Q8&&idLstTotalCumulo.Q8>0}">
									                            <display:column title="${title17}" sortProperty="NCUOTA8" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumulo.Q8}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty idLstTotalCumulo.Q9&&idLstTotalCumulo.Q9>0}"> 
									                            <display:column title="${title18}" sortProperty="NCUOTA9" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumulo.Q9}"/></div>
									                            </display:column>
									                            </c:if><c:if test="${!empty idLstTotalCumulo.Q10&&idLstTotalCumulo.Q10>0}"> 
									                            <display:column title="${title19}" sortProperty="NCUOT10" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumulo.Q10}"/></div>
									                            </display:column></c:if>
									                            <display:column title="${title9}" sortProperty="NFACULT"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumulo.FACUL}"/></div>
									                            </display:column>
									                        										                            								                            									                            									                 
									                   </display:table>     
							   					</div>
							   				</td>
							   			</tr>
							    </axis:visible>
							     <!-- Total cumulo anio serie -->
	                            <axis:visible c="DSP_TOTALCUMULOANIOSERIE" f="axisrea054">									
										<tr>
											<td class="campocaja">
											<img src="images/mes.gif" id="DSP_TOTALCUMULOANIOSERIE_parent" onclick="objEstilos.toggleDisplay('DSP_TOTALCUMULOANIOSERIE', this)" style="cursor: pointer" /> 
												<b><axis:alt f="axisrea054" c="CTOTALCUMULOANIOSERIE" lit="9910322" /> <axis:alt f="axisrea054" c="CTOTALCUMULOANIOSERIE" lit="9910323" /></b>
												<hr class="titulo">
											</td>
										</tr>
										<tr id="DSP_TOTALCUMULOANIOSERIE_children" style="display:yes">
											<td class="campocaja">
												<div class="displayspace" style="overflow:auto;width:98%">
														
														 <c:set var="title0"><axis:alt f="axisrea054" c="NCUMTOT_LIT" lit="9910289"/></c:set>
														 <c:set var="title1"><axis:alt f="axisrea052" c="NCUDEPU_LIT" lit="89907030"/></c:set>
													     <c:set var="title2"><axis:alt f="axisrea054" c="NCUENRI_LIT" lit="9910290"/></c:set>
							                             <c:set var="title3"><axis:alt f="axisrea054" c="NCUNORI_LIT" lit="9910291"/></c:set>
							                             <c:set var="title4"><axis:alt f="axisrea054" c="NDEPMAN_LIT" lit="9910329"/></c:set>	         
							                             <c:set var="title5"><axis:alt f="axisrea054" c="NRETENC_LIT" lit="101714"/></c:set>
							                             <c:set var="title6"><axis:alt f="axisrea054" c="NCUOTA1_LIT" lit="9910293"/></c:set>
							                             <c:set var="title7"><axis:alt f="axisrea054" c="NCUOTA2_LIT" lit="9910294"/></c:set>
							                             <c:set var="title8"><axis:alt f="axisrea054" c="NCUOTA3_LIT" lit="9910295"/></c:set>	
							                             <c:set var="title9"><axis:alt f="axisrea054" c="NFACULT_LIT" lit="9910296"/></c:set>	         
							                            <c:set var="title13"><axis:alt f="axisrea054" c="NCUOTA4_LIT" lit="9910305"/></c:set>					                            
							                            <c:set var="title15"><axis:alt f="axisrea054" c="NCUOTA6_LIT" lit="9910308"/></c:set>
							                            <c:set var="title16"><axis:alt f="axisrea054" c="NCUOTA7_LIT" lit="9910309"/></c:set>
							                            <c:set var="title17"><axis:alt f="axisrea054" c="NCUOTA8_LIT" lit="9910310"/></c:set>
							                            <c:set var="title18"><axis:alt f="axisrea054" c="NCUOTA9_LIT" lit="9910311"/></c:set>
							                            <c:set var="title19"><axis:alt f="axisrea054" c="NCUOT10_LIT" lit="9910312"/></c:set>
							                            <c:set var="title20"><axis:alt f="axisrea054" c="NANISER_LIT" lit="9910323"/></c:set>
							                            <c:set var="title21"><axis:alt f="axisrea054" c="NDEPAUT_LIT" lit="9910456"/></c:set>
							                          				                            
									                    <c:set var="axisrea054_lstAcumulaciones" value="${__formdata.T_IAX_TOTALCUMULOANIOSERIE}" />    
									                    <div class="separador">&nbsp;</div>
									                       
									                    <display:table name="${__formdata.lstTotalCumuloAnioSerie}" id="idLstTotalCumuloAnioSerie" export="false" class="dsptgtable"
															pagesize="-1" defaultsort="2" defaultorder="ascending"  style="overflow:auto;width:130%" cellpadding="0" cellspacing="1"
															requestURI="axis_axisrea054.do?paginar=true" sort="list"  >
															<%@ include file="../include/displaytag.jsp"%>
									                        	
									                        	<display:column title="${title20}" sortProperty="FANIOSER"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspDate">${idLstTotalCumuloAnioSerie.SERIE}</div>
									                            </display:column>
									                        	<display:column title="${title0}" sortProperty="NCUMTOT"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumuloAnioSerie.CUM_TOT}"/></div>
									                            </display:column>
									                            <display:column title="${title1}" sortProperty="NCUDEPU"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumuloAnioSerie.CUM_DEPU}"/></div>
									                            </display:column>
									                            <display:column title="${title2}" sortProperty="NCUENRI"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumuloAnioSerie.CUM_RIES}"/></div>
									                            </display:column>
									                            <display:column title="${title3}" sortProperty="NCUNORI"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumuloAnioSerie.CUM_NORIES}"/></div>
									                            </display:column>
									                            <display:column title="${title21}" sortProperty="NDEPAUT" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumuloAnioSerie.DEPUAUT}"/></div>
									                            </display:column>
									                            <display:column title="${title4}" sortProperty="NDEPMAN"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumuloAnioSerie.DEPURA}"/></div>
									                            </display:column>
									                            
									                            <display:column title="" sortable="false"  sortProperty="" headerClass="sortable fixed"  media="html" autolink="false">
					                 								 <div class="dspIcons">
					                 								    <c:if test="${!empty idLstTotalCumuloAnioSerie.DEPURA&&idLstTotalCumuloAnioSerie.DEPURA>0}">
					                    			                      <img border="0" alt="<axis:alt f='axisrea054' c='LIT_CODECUMA' lit='1000439'/> <axis:alt f='axisrea054' c='LIT_CDCM' lit='9910426'/>"
													                           title="<axis:alt f='axisrea054' c='LIT_CODECOMA' lit='1000439'/> <axis:alt f='axisrea054' c='LIT_CDCM' lit='9910426'/>"
													                           src="images/informacion.gif"  onclick="f_abrir_axisrea055('${idLstTotalCumuloAnioSerie.SERIE}')" />
													                    </c:if>     
													                 </div>
													            </display:column>
									                            
									                            <display:column title="${title5}" sortProperty="NRETENC" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumuloAnioSerie.RETE}"/></div>
									                            </display:column>
									                            <c:if test="${!empty __formdata.Q1}">
									                            <display:column title="${title6}" sortProperty="NCUOTA1" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumuloAnioSerie.Q1}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty __formdata.Q2}">
									                            <display:column title="${title7}" sortProperty="NCUOTA2" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumuloAnioSerie.Q2}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty __formdata.Q3}">
									                            <display:column title="${title8}" sortProperty="NCUOTA3" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumuloAnioSerie.Q3}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty __formdata.Q4&&__formdata.Q4>0}"> 
									                            <display:column title="${title13}" sortProperty="NCUOTA4" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumuloAnioSerie.Q4}"/></div>
									                            </display:column>
									                            </c:if><c:if test="${!empty __formdata.Q6&&__formdata.Q6>0}">
									                            <display:column title="${title15}" sortProperty="NCUOTA6" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumuloAnioSerie.Q6}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty __formdata.Q7&&__formdata.Q7>0}">
									                            <display:column title="${title16}" sortProperty="NCUOTA7" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumuloAnioSerie.Q7}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty __formdata.Q8&&__formdata.Q8>0}">
									                            <display:column title="${title17}" sortProperty="NCUOTA8" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumuloAnioSerie.Q8}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty __formdata.Q9&&__formdata.Q9>0}"> 
									                            <display:column title="${title18}" sortProperty="NCUOTA9" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumuloAnioSerie.Q9}"/></div>
									                            </display:column>
									                            </c:if><c:if test="${!empty __formdata.Q10&&__formdata.Q10>0}"> 
									                            <display:column title="${title19}" sortProperty="NCUOT10" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumuloAnioSerie.Q10}"/></div>
									                            </display:column></c:if>
									                            <display:column title="${title9}" sortProperty="NFACULT"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumuloAnioSerie.FACUL}"/></div>
									                            </display:column>
									                        	
									                            									                 
									                   </display:table>     
									         	</div>                
											</td>
										</tr>	
								</axis:visible>
								 <!-- Cumulo Detallado -->
	                            <axis:visible c="DSP_CUMULODETALLADO" f="axisrea054" >									
										<tr>
											<td class="campocaja">
												<img src="images/mes.gif" id="DSP_CUMULODETALLADO_parent" onclick="objEstilos.toggleDisplay('DSP_CUMULODETALLADO', this)" style="cursor: pointer" /> 
													<b><axis:alt f="axisrea054" c="CCUMULODETALLADO" lit="9910324" /></b>
													<hr class="titulo">
											</td>
										</tr>
										<tr id="DSP_CUMULODETALLADO_children" style="display:yes">
											<td class="campocaja">
												
														
														 <c:set var="title4"><axis:alt f="axisrea054" c="NRETENC_LIT" lit="101714"/></c:set>
							                             <c:set var="title5"><axis:alt f="axisrea054" c="NCUOTA1_LIT" lit="9910293"/></c:set>
							                             <c:set var="title6"><axis:alt f="axisrea054" c="NCUOTA2_LIT" lit="9910294"/></c:set>
							                             <c:set var="title7"><axis:alt f="axisrea054" c="NCUOTA3_LIT" lit="9910295"/></c:set>	
							                             <c:set var="title8"><axis:alt f="axisrea054" c="NFACULT_LIT" lit="9910296"/></c:set>	         
							                            <c:set var="title13"><axis:alt f="axisrea054" c="NCUOTA4_LIT" lit="9910305"/></c:set>					                            
							                            <c:set var="title15"><axis:alt f="axisrea054" c="NCUOTA6_LIT" lit="9910308"/></c:set>
							                            <c:set var="title16"><axis:alt f="axisrea054" c="NCUOTA7_LIT" lit="9910309"/></c:set>
							                            <c:set var="title17"><axis:alt f="axisrea054" c="NCUOTA8_LIT" lit="9910310"/></c:set>
							                            <c:set var="title18"><axis:alt f="axisrea054" c="NCUOTA9_LIT" lit="9910311"/></c:set>
							                            <c:set var="title19"><axis:alt f="axisrea054" c="NCUOT10_LIT" lit="9910312"/></c:set>
							                            <c:set var="title21"><axis:alt f="axisrea054" c="NPOLIZA_LIT" lit="9903659"/></c:set>
							                            <c:set var="title22"><axis:alt f="axisrea054" c="TSUPLEM_LIT" lit="9001641"/></c:set>
							                            <c:set var="title23"><axis:alt f="axisrea054" c="TAMPARO_LIT" lit="9909013"/></c:set>
							                            <c:set var="title24"><axis:alt f="axisrea054" c="FSERIEE_LIT" lit="9910325"/></c:set>
							                            <c:set var="title25"><axis:alt f="axisrea054" c="FVIGDES_LIT" lit="9910326"/></c:set>
							                            <c:set var="title26"><axis:alt f="axisrea054" c="FVIGHAS_LIT" lit="9910327"/></c:set>
							                          	<c:set var="title27"><axis:alt f="axisrea054" c="TCUDEMA_LIT" lit="9910328"/></c:set>
							                          	<c:set var="title28"><axis:alt f="axisrea054" c="TVALAMP_LIT" lit="9910435"/></c:set>
							                          				                            
									                    <c:set var="axisrea054_lstAcumulaciones" value="${__formdata.T_IAX_CUMULODETALLADO}" />    
									                    <div class="separador">&nbsp;</div>
									                     
									              <div class="displayspace" style="overflow:auto;width:98%">         
									                    <display:table name="${__formdata.lstCumuloDetallado}" id="idLstCumuloDetallado" export="false" class="dsptgtable"
															pagesize="-1" defaultsort="2" defaultorder="ascending"  style="overflow:auto;width:150%" cellpadding="0" cellspacing="1" 
															requestURI="axis_axisrea054.do?paginar=true" sort="list"  >
															<%@ include file="../include/displaytag.jsp"%>
									               
									                      	
									                        	<display:column title="${title21}" sortProperty="NPOLIZA" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstCumuloDetallado.POLIZA}"/></div>
									                            </display:column>
									                            <display:column title="${title22}" sortProperty="TSUPLEM" headerClass="sortable fixed" media="html" sortable="false" autolink="false">																
									                                <div class="dspText">${idLstCumuloDetallado.MOV}</div>
									                            </display:column>
									                            <display:column title="${title23}" sortProperty="TAMPARO" headerClass="sortable fixed" media="html" sortable="false" autolink="false">																
									                                <div class="dspText">${idLstCumuloDetallado.GARANTIA}</div>
									                            </display:column>
									                            <display:column title="${title24}" sortProperty="FSERIEE" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspDate">${idLstCumuloDetallado.SERIE}</div>
									                            </display:column>
									                            <display:column title="${title25}" sortProperty="FVIGDES" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspDate"><fmt:formatDate value='${idLstCumuloDetallado.VIG_INI}' pattern='yyyy/MM/dd'/></div>
									                            </display:column>
									                            <display:column title="${title26}" sortProperty="FVIGHAS" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspDate"><fmt:formatDate value='${idLstCumuloDetallado.VIG_FIN}' pattern='yyyy/MM/dd'/></div>
									                            </display:column>									                            
									                            <display:column title="${title28}" sortProperty="NVALAMP" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstCumuloDetallado.CAPITAL}"/></div>
									                            </display:column>
									                        	<display:column title="${title4}" sortProperty="NRETENC" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstCumuloDetallado.RETE}"/></div>
									                            </display:column>
									                            <c:if test="${!empty __formdata.Q1}">
									                            <display:column title="${title5}" sortProperty="NCUOTA1" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstCumuloDetallado.Q1}"/></div>
									                            </display:column></c:if>
									                           <c:if test="${!empty __formdata.Q2}">
									                            <display:column title="${title6}" sortProperty="NCUOTA2" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstCumuloDetallado.Q2}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty __formdata.Q3}">
									                            <display:column title="${title7}" sortProperty="NCUOTA3" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstCumuloDetallado.Q3}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty __formdata.Q4&&__formdata.Q4>0}"> 
									                            <display:column title="${title13}" sortProperty="NCUOTA4" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstTotalCumuloAnioSerie.Q4}"/></div>
									                            </display:column>
									                            </c:if><c:if test="${!empty __formdata.Q6&&__formdata.Q6>0}">
									                            <display:column title="${title15}" sortProperty="NCUOTA6" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstCumuloDetallado.Q6}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty __formdata.Q7&&__formdata.Q7>0}">
									                            <display:column title="${title16}" sortProperty="NCUOTA7" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstCumuloDetallado.Q7}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty __formdata.Q8&&__formdata.Q8>0}">
									                            <display:column title="${title17}" sortProperty="NCUOTA8" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstCumuloDetallado.Q8}"/></div>
									                            </display:column></c:if>
									                            <c:if test="${!empty __formdata.Q9&&__formdata.Q9>0}"> 
									                            <display:column title="${title18}" sortProperty="NCUOTA9" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstCumuloDetallado.Q9}"/></div>
									                            </display:column>
									                            </c:if><c:if test="${!empty __formdata.Q10&&__formdata.Q10>0}"> 
									                            <display:column title="${title19}" sortProperty="NCUOT10" headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstCumuloDetallado.Q10}"/></div>
									                            </display:column></c:if>
									                            <display:column title="${title8}" sortProperty="NFACULT"  headerClass="sortable fixed" media="html" sortable="false" autolink="false">
									                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstCumuloDetallado.FACUL}"/></div>
									                            </display:column>
									                            <axis:visible f="axisrea054" c="IMADEPMAN">
										                             <display:column title="${title27}" sortable="false"  sortProperty=""  headerClass="sortable fixed"  media="html" autolink="false" >
						                 								 <div class="dspIcons">
						                    								<c:if test="${!empty idLstCumuloDetallado.CGARANT&&(idLstCumuloDetallado.CGARANT==7000||idLstCumuloDetallado.CGARANT==7002)}">
														                      <img border="0" 
							                                                       alt="<axis:alt f='axisrea054' c='LIT_EDIDEPMAN' lit='9910434'/> <axis:alt f='axisrea054' c='LIT_DEPMAN' lit='9910426'/>"
							                                                       title="<axis:alt f='axisrea054' c='LIT_EDIDEPMAN' lit='9910434'/> <axis:alt f='axisrea054' c='LIT_DEPMAN' lit='9910426'/>"
							                                                       src="images/lapiz.gif"
														                           onclick="f_abrir_axisrea056('${idLstCumuloDetallado.POLIZA}','${idLstCumuloDetallado.MOV}','${idLstCumuloDetallado.GARANTIA}','${idLstCumuloDetallado.CAPITAL}','${idLstCumuloDetallado.SSEGURO}','${idLstCumuloDetallado.CGARANT}','${idLstCumuloDetallado.CGENERA}','${idLstTotalCumulo.SPERSON}','${idLstTotalCumulo.CAGENTE}')"/>
						                    								</c:if>
														                  </div>													                  
														            </display:column>
														        </axis:visible>            									                 
									                   </display:table>     
									         	  </div>              
											</td>
										</tr>	
								</axis:visible>
	                          </table>  
	           				</td>
	         			</tr>  
	    		    </table>         
	           </td>
	           </tr>
	    </table>  
	    
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea054</c:param><c:param name="f">axisrea054</c:param>
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