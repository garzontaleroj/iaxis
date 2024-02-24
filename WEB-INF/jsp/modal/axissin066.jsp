<%/* Revision:# R6x4m96Kn3b2j2bfLWDBUg== # */%>

<%--
/**
*  Fichero: axissin066.jsp
*  
*  Titulo: Modal mantetenimniento personas relacionadas proceso judicial
*
*  Fecha: 03/03/2009
*/
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt c="titulo" f="axissin066" lit="9909365"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    
    <script type="text/javascript">
    
            
        function f_onload() { 
        	
         if (${requestScope.grabarOK == true}) {
        	// parent.f_aceptar_axissin066(); SE COMENTO ESTA LINEA YA QUE GUARDABA AUTOMATICAMENTE LA PANTALLA AXISSIN 068      
        	// INI AXIS-3597 EA 2019-05-15 SE AGREGARON FUNCIONES PARA REALIZAR EDICION MODIFICACION Y ELIMINACION DE Amparo(s) afectado(s) SIN AFECTAR EL RESTO DEL LA PANTALLA
        	 if(document.getElementById("TDVALPRETENSION2").innerHTML!=undefined){
            	 parent.document.getElementById("TDVALPRETENSION").innerHTML=document.getElementById("TDVALPRETENSION2").innerHTML;
            	 document.getElementById("TDVALPRETENSION2").innerHTML="";
             	}
        	 var ITOTPRET = "${requestScope.ITOTPRET}";              
             var ITOTASEG = "${requestScope.ITOTASEG}";
			 // BUG 4100 SOLUCION  FORMATO MONEDA
        	parent.objDom.setValorPorId("ITOTPRET",  (objNumero.formateaNumeroCero(ITOTPRET, true)).split(",")[0]);
         	parent.objDom.setValorPorId("ITOTASEG",  (objNumero.formateaNumeroCero(ITOTASEG, true)).split(",")[0]);
             parent.f_cerrar_modal("axissin066");
        	// FIN AXIS-3597 EA 2019-05-15 SE AGREGARON FUNCIONES PARA REALIZAR EDICION MODIFICACION Y ELIMINACION DE Amparo(s) afectado(s) SIN AFECTAR EL RESTO DEL LA PANTALLA
        }
        f_cargar_propiedades_pantalla(); 
    

        }
        
        function f_but_aceptar(){
        	/*INI IAXIS-14364 EAD 2020-09-24*/
        	f_calculopes(document.Axissin0066Form.IPRETEN.value);
        	if(validar_datos()){                
            }else{
         	   return false;
            }
        	/*FIN IAXIS-14364 EAD 2020-09-24*/
            if (objValidador.validaEntrada()) {
                      objUtiles.ejecutarFormulario ("modal_axissin066.do", "guardar", document.Axissin0066Form, "_self", objJsMessages.jslit_cargando);

            }
        }
        /*INI IAXIS-14364 EAD 2020-09-24*/
        function validar_datos(){    		
        	if(document.Axissin0066Form.IVARRES.value==''||document.Axissin0066Form.IVARRES.value.split(',')[0]*1<0||document.Axissin0066Form.IPRETEN.value.replaceAll('.','')*1<=0||document.Axissin0066Form.IPRETEN.value==''||document.Axissin0066Form.ICAPITAL.value==''){
        		alert("Los valores deben ser mayores a 0.");
        		return false;
        	}        	
        	if(document.Axissin0066Form.IVARRES.value.split(',')[0]*1>document.Axissin0066Form.ICAPITAL.value.replaceAll('.','')*1){
        		alert("El Valor Pretendido no debe superar el Valor Asegurado.");
        		return false;		
        	}        	
        	return true;
        }
        /*FIN IAXIS-14364 EAD 2020-09-24*/
        function f_but_cancelar(){
            parent.f_cerrar_modal("axissin066");
        }
        function f_actualiza_capital(INPUT){
            
            var valores = INPUT.value.split("/");
            objDom.setValorPorId("CGARANT", valores[0]);
            objDom.setValorPorId("CMONEDA", valores[1]);
            objDom.setValorPorId("ICAPITAL", (objNumero.formateaNumeroCero(valores[2], true)).split(",")[0]);
        }
		
		 function f_formatear(thiss){
			 f_calculopes(thiss.value);
            thiss.value = (objNumero.formateaNumeroCero(thiss.value, true)).split(",")[0];
        }
		 /*INI IAXIS-14364 EAD 2020-10-05*/
		 function f_calculopes(value){
		    	VALOR = value;
		        var CMONRESORI = 'COP';
		        param = '';
		        if (VALOR != null ) {
		            var CMONRES = objDom.getValorPorId("CMONEDA");
		            param = param +'&CMONRES='+CMONRES;   
		            param = param +'&CMONRESORI='+CMONRESORI;    
		            param = param +'&VALOR='+VALOR; 
		            
		            objAjax.invokeAsyncCGI("modal_axissin010.do", callbackAjax_Cal_Impor_Pes, "operation=ajax_cal_impor_pes"+param, this, objJsMessages.jslit_cargando);
		         }
		        
		    }
		 function f_formatearconNeg(thiss){
	            thiss.value = validarNumerosconNeg(thiss.value);
	        }
		 function validarNumerosconNeg(IMPORTE){
	            if (!objUtiles.estaVacio(IMPORTE)){
	                if(objNumero.validarNegativos(IMPORTE)){
	                    return objNumero.formateaNumeroMoneda(IMPORTE);
	                }
	                else{
	                    return   '';
	                }
	            }else return IMPORTE;
	        }
		    function callbackAjax_Cal_Impor_Pes (ajaxResponseText) {
		        try{
		              var doc = objAjax.domParse(ajaxResponseText);
		              
		               if (!objAppMensajes.existenErroresEnAplicacion(doc)) {   
		                  var VALORCONVERTIDO = objUtiles.hayValorElementoXml(doc.getElementsByTagName("PVALORCONVERTIDO")[0])  ?
		                                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("PVALORCONVERTIDO"), 0, 0) +" " : "";
		                    
		                   var str = VALORCONVERTIDO; 
		                    var VALORCONVRES = str.replace(".",",");
		                 } 
		                 f_formatearconNeg(VALORCONVRES);
		                 objDom.setValorPorId("IVARRES",VALORCONVRES);
		        } catch(e){
		             if (isDebugAjaxEnabled == "true")
		                 alert (e.name + " " + e.message);
		        }
		     }
		    /*FIN IAXIS-14364 EAD 2020-10-05*/

	
    </script>
</head>
<body onload="javascript:f_onload()">
<div style="display:none;">
											<c:set var="title0"><axis:alt f="axissin068" c="TGARANT" lit="9909013" /></c:set><!-- Amparo -->
                                            <c:set var="title1"><axis:alt f="axissin068" c="TMONEDA" lit="89907052" /></c:set><!--Moneda-->
                                            <c:set var="title2"><axis:alt f="axissin068" c="ICAPITAL" lit="9902924" /></c:set> <!-- Valor asegurado-->
                                            <c:set var="title3"><axis:alt f="axissin068" c="TMONEDA" lit="108645" /></c:set><!--Moneda-->
                                            <c:set var="title4"><axis:alt f="axissin068" c="IPRETEN" lit="9903367" /></c:set> <!-- Valor pretension-->
                                            <c:set var="title5"><axis:alt f="axissin068" c="CUSUALT" lit="9001265" /></c:set> <!-- Valor pretension-->
                                            <c:set var="title6"><axis:alt f="axissin068" c="FMODIFI" lit="9000564" /></c:set> <!-- Valor pretension-->
                                             
                                            <div class="displayspace" id="TDVALPRETENSION2">
                                              <display:table name="${__formdata.GARANTIAS}" id="VALPRETENSION" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title0}" sortable="true" sortProperty="TGARANT" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.TGARANT}</div>    
                                                </display:column>
                                                <display:column title="${title1}" sortable="true" sortProperty="CMONEDA" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.CMONEDA}</div>    
                                                </display:column>    

                                                <display:column title="${title2}" sortable="true" sortProperty="ICAPITAL" headerClass="sortable" media="html" autolink="false" >  
                                                   <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.ICAPITAL}"/></div>
                                                </display:column>
                                                
                                                 <display:column title="${title3}" sortable="true" sortProperty="CMONEDAFAUL" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${__formdata.CMONEDAFAUL}</div>    
                                                </display:column>    
                                                
                                                <display:column title="${title4}" sortable="true" sortProperty="IPRETEN" headerClass="sortable" media="html" autolink="false" >
                                                   <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.IPRETEN}"/></div>
                                                </display:column> 
                                                <!---AB 05/24/2019 BUG4100 VALIDACION PARA FISCAO O JUDICIAL--->
                                                 <c:if test="${__formdata.ORIGEN != 1}">
                                                 
                                                <display:column title="${title5}" sortable="true" sortProperty="CUSUALT" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.CUSUALT}</div>    
                                                </display:column>
                                                <display:column title="${title6}" sortable="true" sortProperty="FMODIFI" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.FMODIFI}</div>    
                                                </display:column>
                                                <!---IAXIS3595 AABC 06/05/2019 PROCESO JUDICIAL--->
                                                <axis:visible f="axissin068" c="BT_SIN_EDITAR_PRETENSION"> <!--boton editar persona asociada -->
                                                <display:column title="${title7}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                    <c:if test="${(!empty VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.CGARANT)}">
                                                        <div class="dspIcons" id="BT_SIN_EDITAR_PRETENSION"><img border="0" alt="<axis:alt f="axissin068" c="BT_SIN_EDITAR_PRETENSION" lit="100002"/>" title1="<axis:alt f="axissin068" c="BT_SIN_EDITAR_PRETENSION" lit="9901356"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                        style="cursor:pointer;" onclick="javascript:objUtiles.abrirModal('axissin066','src','modal_axissin066.do?operation=form&isNew=0&NSINIES='+${__formdata.NSINIES}+'&NTRAMIT='+${__formdata.NTRAMIT}+'&NORDEN='+${__formdata.NORDEN}+'&SSEGURO='+${__formdata.SSEGURO}+'&CGARANT='+${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.CGARANT}+'&CMONEDA='+'${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.CMONEDA}'+'&ICAPITAL='+${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.ICAPITAL}+'&IPRETEN='+${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.IPRETEN});"/></div>
                                                    </c:if>
                                                </display:column> 
                                                </axis:visible>
                                                 </c:if>
                                                
                                                <c:if test="${__formdata.ORIGEN== 1}">
                                                <axis:visible f="axissin065" c="BT_SIN_EDITAR_PRETENSION"> <!--boton editar persona asociada -->
                                                <display:column title="${title7}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                    <c:if test="${(!empty VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.CGARANT)}">
                                                        <div class="dspIcons" id="BT_SIN_EDITAR_PRETENSION"><img border="0" alt="<axis:alt f="axissin065" c="BT_SIN_EDITAR_PRETENSION" lit="100002"/>" title1="<axis:alt f="axissin065" c="BT_SIN_EDITAR_PRETENSION" lit="9901356"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                        style="cursor:pointer;" onclick="javascript:objUtiles.abrirModal('axissin066','src', 'modal_axissin066.do?operation=form&isNew=0&NSINIES='+${__formdata.NSINIES}+'&NTRAMIT='+${__formdata.NTRAMIT}+'&NORDEN='+${__formdata.NORDEN}+'&SSEGURO='+${__formdata.SSEGURO}+'&ORIGEN=1'+'&CGARANT=${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.CGARANT}'+'&CMONEDA=${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.CMONEDA}'+'&IPRETEN=${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.IPRETEN}'+'&ICAPITAL=${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.ICAPITAL}');"/></div>      
                                                    </c:if>
                                                </display:column> 
                                                </axis:visible>
                                                </c:if>
                                                
                                                
                                               
                                                <axis:visible f="axissin068" c="BT_SIN_ELIMINAR_PRETENSION"> <!--boton Eliminar beneficiario asociado -->
                                                <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                   <c:if test="${!empty VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.CGARANT}">
                                                    <div class="dspIcons"><img border="0"  src="images/delete.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="f_borrar_valpretension_axissin066('&NVALOR='+'${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.CGARANT}');this.parentElement.parentElement.parentElement.remove();"/>
                                                    </div>
                                                    </c:if>
                                                </display:column> 
                                                </axis:visible>
                                               
                                               
                                            </display:table>
                                            </div>
</div>
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
	
    
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
    
    
    <form name="Axissin0066Form" action="" method="POST">
    <input type="hidden" name="operation" value="guardar" />
    <input type="hidden" name="NSINIES" value="${__formdata.NSINIES}"/>
    <input type="hidden" name="NTRAMIT" id="NTRAMIT" value="${__formdata.NTRAMIT}"/>
    <input type="hidden" name="NORDEN" id="NORDEN" value="${__formdata.NORDEN}"/>
    <input type="hidden" name="CGARANT" id="CGARANT" value="${__formdata.CGARANT}"/>
    <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}"/>
    <input type="hidden" name="isNew" id="isNew" value="${__formdata.isNew}"/>
    <input type="hidden" name="ORIGEN" id="ORIGEN" value="${__formdata.ORIGEN}"/>
    <c:import url="../include/titulo_nt.jsp">
        
        <c:param name="titulo"><axis:alt c="titulo" f="axissin066" lit="9909365"/></c:param>
        <c:param name="formulario"><axis:alt c="form" f="axissin066" lit="9909365"/></c:param>
        <c:param name="form">axissin066</c:param>
        
    </c:import>

  

    <div class="separador">&nbsp;</div>
    <table  class="mainModalDimensions base"  align="center" cellpadding="0" cellspacing="0"><!--id="tabla1" -->
        <tr>
            <td>
                 <!-- Seccion -->
                <div class="titulo"> 
                    <img  src="images/flecha.gif"/>
                 
                    <!---AB 05/24/2019 BUG4100 VALIDACION TITULO FISCAL O JUDICIAL--->
			       <c:if test="${__formdata.ORIGEN != 1}">
			          <axis:alt c="flecha" f="axissin066" lit="9909218" /> 
			        </c:if>
			        
			         <c:if test="${__formdata.ORIGEN == 1}">
			         <axis:alt c="flecha" f="axissin066" lit="9909648" /> 
			        </c:if>
                </div>  
                <div class="separador">&nbsp;</div>
                <table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center"--> <!-- UNO -->
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>

                                
                            </tr>
                            <tr>
                              <axis:ocultar f="axissin066" c="CGARANT" dejarHueco="false"> 
                                  <td class="titulocaja" >
                                        <b><axis:alt f="axissin066" c="CGARANT" lit="9909013"></axis:alt></b>
                                  </td>
                              </axis:ocultar>
                               <axis:ocultar f="axissin066" c="CMONEDA" dejarHueco="false"> 
                                  <td class="titulocaja" >
                                        <b><axis:alt f="axissin066" c="CMONEDA" lit="89907052"></axis:alt></b>
                                  </td>
                              </axis:ocultar>
                              <axis:ocultar f="axissin066" c="ICAPITAL" dejarHueco="false"> 
                                  <td class="titulocaja">
                                        <b><axis:alt f="axissin066" c="ICAPITAL" lit="9902924"></axis:alt></b>
                                  </td>
                              </axis:ocultar>
                              
                              <axis:ocultar f="axissin066" c="CMONEDAFAUL" dejarHueco="false"> 
                                  <td class="titulocaja" >
                                        <b><axis:alt f="axissin066" c="CMONEDAFAUL" lit="108645"></axis:alt></b>
                                  </td>
                              </axis:ocultar>
                              <axis:ocultar f="axissin084" c="IVARRES" dejarHueco="false"><!--  IAXIS-14364 EAD 2020-10-05 -->                          
                        	<td id="td_IVARRES" class="titulocaja">
                                    <div id="literal_IVARRES" ><b id="label_IVARRES"><axis:alt f="axissin084" c="IVARRES_LIT" lit="9903367"/></b><!-- Variación en la reserva --></div>
                        	</td>
                        	</axis:ocultar>
                             

                              <axis:ocultar f="axissin066" c="IPRETEN" dejarHueco="false"> 
                                  <td class="titulocaja">
                                        <b><axis:alt f="axissin066" c="IPRETEN" lit="9903367"></axis:alt> COP</b>
                                  </td>
                              </axis:ocultar>
                            </tr>
                            <tr>  
                            
                               <axis:ocultar c="CGARANT" f="axissin066" dejarHueco="false">
                                 <!-- Clase Proceso -->
                                <td class="campocaja" >
                                    <select name = "listGaran" id="listGaran" style="width:100%" size="1"  class="campowidthselect campo campotexto" <axis:atr f="axissin066" c="CGARANT" a="modificable=true&obligatorio=true"/> 
                                     alt="<axis:alt c="CGARANT" f="axissin066" lit="9909013" />" title="<axis:alt c="CGARANT" f="axissin066" lit="9909013" />" onChange="javascript:f_actualiza_capital(this)"> 
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin066" lit="1000348"/> - </option>
                                                <c:forEach var="garantias" items="${__formdata.listaGarantias}">
                                                    <option value = "${garantias.CGARANT}/${garantias.CMONEDA}/${garantias.ICAPTOT}"
                                                        <c:if test="${garantias.CGARANT == __formdata.CGARANT}">selected</c:if>>
                                                        ${garantias.TGARANT}
                                                    </option>
                                                </c:forEach>
                                    </select>
                                </td>  
                                </axis:ocultar>
                                <td class="campocaja">
                                 <axis:visible f="axissin066" c="CMONEDA">
                                    <input type="text" class="campowidthinput campo campotexto" style="width:30%"   id="CMONEDA" name="CMONEDA" size="5"   
                                     <axis:atr f="axissin066" c="CMONEDA" a="modificable=false"/>  
                                     value="${__formdata.CMONEDA}" title="<axis:alt c="CMONEDA" f="axissin066" lit="89907052" />" 
                                     alt="<axis:alt c="CMONEDA" f="axissin066" lit="89907052" />" /> 
                                 </axis:visible>
                                </td>
                                <td class="campocaja">
                                <axis:visible f="axissin066" c="ICAPITAL">
                                    <input type="text" class="campowidthinput campo campotexto" style="width:100%"   id="ICAPITAL" name="ICAPITAL" size="20"   
                                     <axis:atr f="axissin066" c="ICAPITAL" a="modificable=false"/>  
               						value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.ICAPITAL}"/>" 
                                     title="<axis:alt c="ICAPITAL" f="axissin066" lit="9902924" />" 
                                     alt="<axis:alt c="ICAPITAL" f="axissin066" lit="9902924" />" /> 
                                 </axis:visible>
                                </td>
                                
                                <td class="campocaja">
                                 <axis:visible f="axissin066" c="CMONEDAFAUL">
                                    <input type="text" class="campowidthinput campo campotexto" style="width:30%"   id="CMONEDAFAUL" name="CMONEDAFAUL" size="5"   
                                     <axis:atr f="axissin066" c="CMONEDAFAUL" a="modificable=false"/>  
                                     value="${__formdata.CMONEDAFAUL}" title="<axis:alt c="CMONEDAFAUL" f="axissin066" lit="108645" />" 
                                     alt="<axis:alt c="CMONEDAFAUL" f="axissin066" lit="108645" />" /> 
                                 </axis:visible>
                                </td>
                                 <axis:ocultar f="axissin066" c="IVARRES" dejarHueco="false">                         
                                <td class="campocaja"><!--  IAXIS-14364 EAD 2020-10-05 --> 
                                    <input type="text" name="IVARRES" id="IVARRES" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value=""/>" 
                                    class="campowidthinput campo campotexto" style="width:90%"
                                    
                                    <axis:atr f="axissin066" c="IVARRES" a="modificable=false&obligatorio=false"/> 
                                    title="<axis:alt f="axissin084" c="IVARRES_ALT" lit="9909281"/>" />
                                     
                                </td>
                            </axis:ocultar>
                                
                                <td class="campocaja" >
                                <axis:visible f="axissin066" c="IPRETEN">
                                    <input type="text" class="campowidthinput campo campotexto" style="width:100%"   id="IPRETEN" name="IPRETEN" size="20"   
                                     <axis:atr f="axissin066" c="IPRETEN" a="modificable=true&obligatorio=true"/> onChange ="javascript:f_formatear(this);"
                                     value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IPRETEN}"/>" 
                                     title="<axis:alt c="IPRETEN" f="axissin066" lit="9903367" />" 
                                     alt="<axis:alt c="IPRETEN" f="axissin066" lit="9903367" />" /> 
                                     
 
                                 </axis:visible>
                                </td>
                               
                              </tr>


                            </table> <!-- UNO -->

            </td>
        </tr>
    </table>
  </td>
</tr>
</table>
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin066</c:param><c:param name="f">axissin066</c:param><c:param name="f">axissin066</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>
    </form>
    <script type="text/javascript">

</script>
  <c:import url="../include/mensajes.jsp" />
</body>
</html>
