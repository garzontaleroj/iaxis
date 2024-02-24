<%/* Revision:# Jp4YRI5/sww1owyKoQ/7sw== # */%>
<%/*
*  Fichero: axisctr069.jsp
*  x
*  Fecha: 14/05/2009
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<% String pantalla = "axisctr069"; %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axisctr069" c="TITULO" lit="9001570"/></title> <%-- Bloqueo/Pignoración de Pólizas --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
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

    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() { 
      
            /*if (${requestScope.guardarOK == true})
                f_abrir_imprimir();*/
          
           f_cargar_propiedades_pantalla();
		   /*CONF 783 Y 786 DOCUMENTACION REQUERIDA Y CARTULA INICIO*/
				 var NCAUSA = document.miForm.NCAUSA.value;  
           
           if (NCAUSA==7){
        	   objDom.setVisibilidadPorId("IMP", "hidden"); 
        	   
           }
		   /*CONF 783 Y 786 DOCUMENTACION REQUERIDA Y CARTULA FIN*/
        }
        
         function f_cerrar_axisimprimir(){                
                objUtiles.cerrarModal("axisimprimir");
                parent.f_cerrar_axisctr069();
        } 
        
        function f_abrir_imprimir(){            
             var SSEGURO = document.miForm.SSEGURO.value;
             var TMOTMOV = document.miForm.TMOTMOV.value;
             var TIPO = "";
             if (TMOTMOV=="BOT_PIGNORAR"){
                TIPO = "PIGNORAR";
             }
             if (TMOTMOV=="BOT_DESPIGNORAR"){
                TIPO = "DESPIGNORAR";
             }
             if (TMOTMOV=="BOT_BLOQUEAR"){
                TIPO = "BLOQUEAR";
             }
             if (TMOTMOV=="BOT_DESBLOQUEAR"){
                TIPO = "DESBLOQUEAR";
             }
             if (TMOTMOV=="BOT_SUSPENDER"){
                TIPO = "SUSPENDER";
             }
             if (TMOTMOV=="BOT_REINICIAR"){
                TIPO = "REINICIAR";
             }  
             //var mensaje = objDom.getValorPorId("MENSAJE_A_MOSRAR");
             var mensaje = '${requestScope.MENSAJE}';                                         
             objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_doc_tipo&TIPO="+ TIPO +"&MENSAJE="+ mensaje +"&SEGURO=" + SSEGURO);
        }
        /* Added for BACK (anterior) button (IAXIS-4321) PK-18/06/2019 Start */
        function f_but_anterior() {
            objUtiles.ejecutarFormulario("axis_axisctr024.do", "anterior", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        /* Added for BACK (anterior) button (IAXIS-4321) PK-18/06/2019 End */
        function f_but_salir() {
        	var params ="&pPRIMERA="+document.getElementById("pPRIMERA").value;
        	    params +="&SSEGURO_OUT="+document.getElementById("SSEGURO_OUT").value;
	/*CONF 783 Y 786 DOCUMENTACION REQUERIDA Y CARTULA INICIO*/
        	    params +="&SSEGURO_REI="+document.getElementById("SSEGURO_REI").value;//adicion cambio reinicio damian
        	    
        	
           var impOk =  "${__formdata.IMP}";
    	        
    	   if (impOk == "impOk"){
    	        	
    	        var PERMITEIMP = objDom.getValorPorId("PERMITEIMP");
        	    
        	    if(PERMITEIMP == 1){
        	    	objAjax.invokeAsyncCGI("modal_axisctr069.do", f_callbackSalir, "operation=ajax_deleteTemporales"+params, this, null);	
            			
        	    	
        	    }else {
        	    	
        	    	alert("debe imprimir el documento");
        	    	
        	    }
        		
        	}  else{
	
        	objAjax.invokeAsyncCGI("modal_axisctr069.do", f_callbackSalir, "operation=ajax_deleteTemporales"+params, this, null);        	
                	}
      /*CONF 783 Y 786 DOCUMENTACION REQUERIDA Y CARTULA FIN*/  		

		}
        
        function f_callbackSalir(){
        	  
            parent.f_cerrar_axisctr069();
        }

        function f_but_aceptar() {
               
               
            if (objValidador.validaEntrada() ){
                if(document.miForm.TMOTMOV.value == 'BOT_DESPIGNORAR'){
                        if (document.miForm.COPCIONAL.checked){
                            document.miForm.COPCIONAL.value=1;
                        }else{
                            document.miForm.COPCIONAL.value=0;
                        }
                }                 
                    document.miForm.FINICIO.disabled=false;
                    objUtiles.ejecutarFormulario("modal_axisctr069.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }   
		/*CONF 783 Y 786 DOCUMENTACION REQUERIDA Y CARTULA INICIO*/ 
		  	//EJECUCION DE LA IMPRESORA EN PANTALLA//
        	function f_but_docseguro(vtipo) {
               
                if (objUtiles.estaVacio(vtipo)) vtipo = "SUSPENSION";
                
                vtipo = "SUSPENSION";
    	           
    	        sseguro = '${__formdata.SSEGURO}';
    	        impOk =  '${__formdata.IMP}';
    	        
    	        if (impOk == "impOk"){
    	        	
    	        	objDom.setValorPorId("PERMITEIMP",1);
    	        	
	                if(version_tomcat <= 6){
	   	            	objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt="+<%=new java.util.Date().getTime()%>+"&operation=impresion_doc_tipo&MENSAJE="+"SUSPENSION"+"&SEGURO=" + sseguro +"&TIPO="+vtipo);  
	   	            }else{
	   	            	objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt="+<%=new java.util.Date().getTime()%>+"&operation=impresion_doc_tipo&MENSAJE="+encodeURI("SUSPENSION")+"&SEGURO=" + sseguro +"&TIPO="+vtipo);   
	   	            }
	                
                
    	        }else{
    	        	
    	        	
    	        	alert("errores en la suspension de la poliza");
    	        	
    	        } 
    	        	
    	        	
                
                
                
          }
		/*CONF 783 Y 786 DOCUMENTACION REQUERIDA Y CARTULA FIN*/ 
        
        function restrictTextAreaChars(obj) {
            var maxLength = obj.getAttribute? parseInt(obj.getAttribute("maxLength")) : ""
            if (obj.getAttribute && obj.value.length > maxLength)
                obj.value = obj.value.substring(0, maxLength);
        }

        function f_onclickCDOCUMCheck(input, CDOCUME, SEQDOCU,pCCLASE, pNORDEN, pNRIESGO, pSPERSON){

            document.miForm.modificado.value = 1;
            input.value = input.checked ? 1 : 0;
            params="&CDOCUME=" + CDOCUME+"&checked="+input.value;
            params +="&SEQDOCU="+SEQDOCU;
            params +="&CCLASE="+pCCLASE;
            params +="&NORDEN="+pNORDEN;
            params +="&NRIESGO="+pNRIESGO; 
            params +="&SPERSON="+pSPERSON;
           
            objAjax.invokeAsyncCGI("modal_axisctr069.do", f_callbackAjaxAdjuntar, 
                "operation=ajax_adjuntar"+params, this, null);
        }
    
        function f_callbackAjaxAdjuntar(ajaxResponse){
            //alert(ajaxResponse);
        }    
    
        function f_onclickbtnCDOCUMCheck(input, CDOCUME, SEQDOCU,pCCLASE, pNORDEN, pNRIESGO, pSPERSON){

            params="&CDOCUME=" + CDOCUME;
            params +="&SEQDOCU="+SEQDOCU;
            params +="&CCLASE="+pCCLASE;
            params +="&NORDEN="+pNORDEN;
            params +="&NRIESGO="+pNRIESGO; 
            params +="&SPERSON="+pSPERSON; 
            
            objUtiles.abrirModal("axisctr174", "src", "modal_axisctr174.do?operation=form"+params);
        }
        
        function f_but_salirAxisctr174(subido){
            if (subido == 1) {
                document.miForm.modificado.value = 1;
            }
            // Esto no lo tengo claro que sea necesario !!!!  (IGUAL SE PUEDE SUSTITUIR POR UN document.miForm.CDOCUME.checked = 1)
            objUtiles.ejecutarFormulario ("modal_axisctr069.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            objUtiles.cerrarModal("axisctr174");
        }
        // CONF-274 - 20161125 - JLTS - Ini
    function f_difEntreFechas() {
       //alert("Entro función diferenciaEntreFechas");
       if (document.miForm.pCMOTMOV.value == 141 ) {
         //alert("Es el "+document.miForm.pCMOTMOV.value);
         //alert("FINICIO="+"${__formdata.FINICIO}");
         //alert("FFINAL.value="+document.miForm.FFINAL.value);
         var fecha1Aux = "${__formdata.FINICIO}";
         var fecha1 = fecha1Aux.substring(0,11);
         var fecha2 = document.miForm.FFINAL.value;
         //alert("fecha1="+fecha1);
         //alert("fecha2="+fecha2);
         var mdy1 = fecha1.split('-');
         var mdy2 = fecha2.split('/');
         //alert("anio1="+mdy1[0]);
         //alert("mes1="+mdy1[1]);
         //alert("dia1="+mdy1[2]);
         //alert("fecha1="+mdy1[0]+"/"+mdy1[1]+"/"+mdy1[2]);
         //alert("anio2="+mdy2[2]);
         //alert("mes2="+mdy2[1]);
         //alert("dia2="+mdy2[0);
         //alert("fecha2="+mdy2[2]+"/"+mdy2[1]+"/"+mdy2[0]);
         var fecIni = new Date(mdy1[0], mdy1[1]-1, mdy1[2]);
         var fecFin = new Date(mdy2[2], mdy2[1]-1, mdy2[0]);
         //alert("fecIni="+fecIni);
         //alert("fecFin="+fecFin);
         //var fecFin = new Date(parts[2],parts[0]-1,parts[1]); 
        /*var dia1 = fecIni.getDay();
        var mes1 = fecIni.getMonth();
        var anio1= fecIni.getYear();
        var dia2 = fecFin.getDay();
        var mes2 = fecFin.getMonth();
        var anio2= fecFin.getYear();
        alert("dia1="+dia1);
        alert("mes1="+mes1);
        alert("anio1="+anio1);
        alert("dia2="+dia2);
        alert("mes2="+mes2);
        alert("anio2="+anio2);*/
        //var timeDiff = Math.abs(fecFin.getTime() - fecIni.getTime());
        if (fecFin<fecIni) {
        	objDom.setValorPorId("NDIAS_SUSP", 0);
        }
        else {
           var timeDiff = Math.abs(fecFin.getTime() - fecIni.getTime());
           var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24)); 
           //alert(diffDays);
           objDom.setValorPorId("NDIAS_SUSP", diffDays);
       }
     }
    }  
        function f_but_siguiente() {
        	if (objValidador.validaEntrada() ){
                if(document.miForm.TMOTMOV.value == 'BOT_DESPIGNORAR'){
                        if (document.miForm.COPCIONAL.checked){
                            document.miForm.COPCIONAL.value=1;
                        }else{
                            document.miForm.COPCIONAL.value=0;
                        }
                }                 
                    document.miForm.FINICIO.disabled=false;
                    objUtiles.ejecutarFormulario ("modal_axisctr069.do", "siguiente", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        function f_but_cancelar() {
        	objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr069", "cancelar", document.miForm, "_self");
        }  
        // CONF-274 - 20161125 - JLTS - Fin

    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisctr069" c="SUBTITULO" lit="1000205"/>|true</c:param>
    </c:import>  
   <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisctr069" c="DOCU_REQUERIDA" lit="9901998"/></c:param>
            <c:param name="nid" value="axisctr174" />
        </c:import> 

    <form name="miForm" id="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisctr069" c="ETIQ_MOV" lit="9904550"/></c:param>     <%-- Bloqueo/Desbloqueo/Pignoración/Despignoración de Pólizas --%>
                <c:param name="formulario"><axis:alt f="axisctr069" c="ETIQ_MOV" lit="9904550"/></c:param> <%-- Bloqueo/Desbloqueo/Pignoración/Despignoración de Pólizas --%>
                <c:param name="form">axisctr069</c:param>
        </c:import>
		
        <input type="hidden" name="isNew" id="isNew" value="${__formdata.isNew}"/>         
        <input type="hidden" id="TTEXTO_ANT" name="TTEXTO_ANT" value="${__formdata.TTEXTO_ANT}"/>
        <input type="hidden" id="NRANGO_ANT" name="NRANGO_ANT" value="${__formdata.NRANGO_ANT}"/>
        <input type="hidden" id="SPERSON_ANT" name="SPERSON_ANT" value="${__formdata.SPERSON_ANT}"/>
        <input type="hidden" id="CUSUMOV_ANT" name="CUSUMOV_ANT" value="${__formdata.CUSUMOV_ANT}"/>
        <input type="hidden" id="FINICIO_ANT" name="FINICIO_ANT" <axis:atr f="axisctr069" c="FINICIO_ANT" a="formato=fecha"/>
          value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINICIO_ANT}"/>"/>
        <input type="hidden" id="NCOLATER_ANT" name="NCOLATER_ANT" value="${__formdata.NCOLATER_ANT}"/>
        <input type="hidden" id="NMOVIMI_ANT" name="NMOVIMI_ANT" value="${__formdata.NMOVIMI_ANT}"/>
        <input type="hidden" id="SSEGURO_ANT" name="SSEGURO_ANT" value="${__formdata.SSEGURO_ANT}"/>  
		 <input type="hidden" id="SSEGURO_ANT" name="SSEGURO_ANT" value="${__formdata.PERMITEIMP}"/> 


        
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
        <input type="hidden" id="SSEGURO_OUT" name="SSEGURO_OUT" value="${__formdata.SSEGURO_OUT}"/>
        
        <input type="hidden" id="SSEGURO_REI" name="SSEGURO_REI" value="${__formdata.SSEGURO_REI}"/>
        
        <input type="hidden" id="TMOTMOV" name="TMOTMOV" value="${__formdata.TMOTMOV}"/>
         <input type="hidden" name="modificado" value="${modificado}"/> 
        <input type="hidden" name="NMOVIMI" value="${__formdata.NMOVIMI}"/> 
        <input type="hidden" name="LMODO" value="${__formdata.LMODO}"/> 
        <input type="hidden" name="SPERSON263" value="${__formdata.SPERSON}"/>
        <input type="hidden" name="pCMOTMOV" id="pCMOTMOV" value="${__formdata.pCMOTMOV}"/>
        <input type="hidden" name="pPRIMERA" id="pPRIMERA" value="${__formdata.pPRIMERA}"/>
        <!-- Área de campos  -->
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <axis:visible c="DSP_DOCREQUERIDA" f="axisctr069">
                    <div class="separador">&nbsp;</div>
                    <div class="titulo">
                    <img src="images/flecha.gif"/><axis:alt f="axisctr069" c="DOCREQUERIDA" lit="9902268"/>
                     </div>
                    <!-- Sección 1 -->
                    
                    <table class="seccion">
                        <tr>
                            <td >
                                <!-- Área 1 -->
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:100%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <div class="displayspaceGrande">
                                             <c:set var="title0"><axis:alt f="axisctr069" c="DESCRIPCION" lit="100588"/></c:set>
                                             <c:set var="title1"><axis:alt f="axisctr069" c="OBLIGATORIO" lit="112347"/></c:set>
                                             <c:set var="title2"><axis:alt f="axisctr069" c="ADJUNTADO" lit="9901999"/></c:set>
                                             <display:table name="${docu_requerida}" id="T_IAX_DOCREQUERIDA" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                              requestURI="axis_axisctr009.do?paginar=true&tabla=T_IAX_PREGUNTAS">
                                                   <%@ include file="../include/displaytag.jsp"%>
                                                   <axis:visible c="TDESCRIP" f="axisctr009">
                                                   <display:column title="${title0}" sortable="true" sortProperty="T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.TDESCRIP" headerClass="sortable"  media="html" autolink="false" >
                                                       <div class="dspText">${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.TDESCRIP}</div>
                                                   </display:column>
                                                  </axis:visible>
                                                   <display:column title="${title1}" sortable="true" sortProperty="T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CCLASE" headerClass="sortable"  media="html" autolink="false" >
                                                       <div class="dspText">
                                                                <input value="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.COBLIGA}" type="checkbox" 
                                                                id="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" name="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" 
                                                                <c:if test="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.COBLIGA == 1 }"> checked="checked" </c:if>
                                                                onclick="f_onclickCDOCUMCheck(this, '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.SEQDOCU}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CCLASE}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.NORDEN}')" disabled="disabled" />
                                                            </div> 
                                                   </display:column>
                                                   <display:column title="${title2}" headerClass="sortable" media="html" autolink="false">
                                                           <div class="dspText">
                                                                <input value="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.ADJUNTADO}" type="checkbox" 
                                                                id="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" name="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" 
                                                                <c:if test="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.ADJUNTADO == 1 }"> checked="checked" </c:if>
                                                                onclick="f_onclickCDOCUMCheck(this, '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.SEQDOCU}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CCLASE}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.NORDEN}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.NRIESGO}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.SPERSON}')" />
                                                            </div>
                                                   </display:column>
                                                   <display:column title="" headerClass="sortable" media="html" autolink="false">
                                                           <div class="dspText">
                                                                <input value="<axis:alt f="axisctr069" c="ANADIRDOC" lit="9902032"/>" type="button"  class="boton"
                                                                id="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" name="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" 
                                                                <c:if test="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.ADJUNTADO == 1 }"> checked="checked" </c:if>
                                                                onclick="f_onclickbtnCDOCUMCheck(this, '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.SEQDOCU}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CCLASE}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.NORDEN}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.NRIESGO}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.SPERSON}')" />
                                                            </div>
                                                   </display:column>  
                                              </display:table>
                                           </div>
                                        </td>
                                        
                                    </tr>
                                    <!-- Fin lista    -->
                                </table>
                            </td>
                        </tr>
                    </table>
                    
                    </axis:visible>
       
        
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo" ><img src="images/flecha.gif"/><axis:alt f="axisctr069" c="DETALLE_MOV" lit="140280"/><%-- Detalle movimiento --%></div>

                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                                <table class="area" align="center" border="0">
                                    <tr>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                    </tr>
                                    <axis:ocultar f="axisctr069" c="ETIQ_MOV" dejarHueco="false">
                                        <tr>
                                            <td class="titulocaja" colspan="2">
                                                <b id="label_ETIQ_MOV"><axis:alt f="axisctr069" c="CAUSA" lit="101040"/></b> <%-- Causa --%>
                                            </td>
                                        </tr>
                                        <tr>   
                                        <axis:ocultar f="axisctr069" c="NCAUSA" dejarHueco="false">      
                                            <td class="campocaja">
                                            <select name="NCAUSA" id="NCAUSA" size="1" class="campowidthselect campo campotexto"
                                              <axis:atr f="axisctr069" c="NCAUSA" a="obligatorio=true&isInputText=false"/>
					         <c:if test="${__formdata.isNew == 'false'}">readonly="true"</c:if> 
                                                 <c:if test="${__formdata.isNew == 'false'}">disabled="disabled"</c:if>>&nbsp;
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper008" c="SNV_COMBO" lit="1000348"/> - </option>
                                                  
                                                    <c:forEach var="element" items="${__formdata.listValores.tipoCausa}">
                                                        <option value = "${element.CATRIBU}" 
                                                             <c:if test="${__formdata.TMOTMOV == 'BOT_DESPIGNORAR' && __formdata.CTIPOCAUSA == 0 && element.CATRIBU == 2}"> selected </c:if>
                                                             <c:if test="${__formdata.TMOTMOV == 'BOT_DESPIGNORAR' && __formdata.CTIPOCAUSA == 1 && element.CATRIBU == 3}"> selected </c:if>
                                                            <c:if test="${element.CATRIBU == __formdata.CTIPOCAUSA}"> selected </c:if> />
                                                            ${element.TATRIBU} 
                                                        </option>
                                                    </c:forEach>
                                               </select>
                                            </td>
                                        </axis:ocultar>
                                            <td>&nbsp;</td>
										 <a href="javascript:f_but_docseguro('SUSPENSION')" id="IMP"> <img
													border="0"
													onclick="javascript:f_but_docseguro('SUSPENSION')"
													src="images/print.gif" /></a>   
                                        </tr>
                                    </axis:ocultar>
                                <c:if test="${__formdata.TMOTMOV != 'BOT_DESPIGNORAR'}">
                                      <axis:ocultar f="axisctr069" c="TDESCBLOQ" dejarHueco="false">
                                        <tr>
                                            <td class="titulocaja" colspan="2">
                                                <b id="label_TDESCBLOQ"><axis:alt f="axisctr069" c="TDESCBLOQ" lit="9904551"/></b> <%-- Descripción bloqueo/pignoración --%>
                                            </td>
                                        </tr>
                                        <tr>
					                
                                            <td class="campocaja" colspan="2" ><!-- overflow-y:hidden; -->
                                                <textarea class="campowidthinput campo campotexto" id="TTEXTO" name="TTEXTO"
                                                onkeyup="restrictTextAreaChars(this)" maxLength="1000" rows="8"
                                                <axis:atr f="axisctr069" c="TDESCBLOQ" a="modificable=true"/> 
                                                style="width:90%;"
                                                title="<axis:alt f="axisctr069" c="TDESCBLOQ" lit="9904551"/>"
                                                >${__formdata.TTEXTO}</textarea>
						
                                                <%--
                                                <input type="text" class="campowidthinput campo campotexto" id="TTEXTO" name="TTEXTO" size="15" 
                                                <axis:atr f="axisctr069" c="TDESCBLOQ" a="modificable=true"/>
                                                value="${__formdata.TTEXTO}" style="width:90%"
                                                title="<axis:alt f="axisctr069" c="TDESCBLOQ" lit="9904551"/>"/>
                                                --%>
                                            </td>                                             
                                        </tr>

                                    </axis:ocultar>
                                </c:if>
                                <c:if test="${__formdata.TMOTMOV != 'BOT_PIGNORAR'}">
                                      <axis:ocultar f="axisctr069" c="TDESCDESBLOQ" dejarHueco="false">
                                        <tr>
                                            <td class="titulocaja" colspan="4">
                                                <b id="label_TDESCDESBLOQ"><axis:alt f="axisctr069" c="TDESCDESBLOQ" lit="9904551"/></b> <%-- Descripción desbloqueo/despignoración --%>
                                            </td>
                                        </tr>
                                        <tr>

                                            <td class="campocaja" colspan="2"><!-- overflow-y:hidden -->
                                                <textarea  class="campowidthinput campo campotexto" id="TTEXTO2" name="TTEXTO2" s
                                                onkeyup="restrictTextAreaChars(this)" maxLength="1000" rows="8"
                                                <axis:atr f="axisctr069" c="TDESCDESBLOQ" a="modificable=true"/>
                                                style="width:90%;"
                                                title="<axis:alt f="axisctr069" c="TDESCDESBLOQ" lit="9904551"/>"
                                                >${__formdata.TTEXTO2}</textarea>
                                                <%--
                                                <input type="text" class="campowidthinput campo campotexto" id="TTEXTO2" name="TTEXTO2" size="15" 
                                                <axis:atr f="axisctr069" c="TDESCDESBLOQ" a="modificable=true"/>
                                                value="${__formdata.TTEXTO2}" style="width:90%"
                                                title="<axis:alt f="axisctr069" c="TDESCDESBLOQ" lit="9904551"/>"/>
                                                --%>
                                            </td>
                                        </tr>

                                    </axis:ocultar>
                                </c:if>
                                    <tr>
                                        <axis:ocultar f="axisctr069" c="FINICIO" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_FINICIO"><axis:alt f="axisctr069" c="FINICIO" lit="9000526"></axis:alt></b> <%-- Fecha inicio --%>
                                            </td>
                                        </axis:ocultar>
                                        <c:if test="${__formdata.TMOTMOV != 'BOT_PIGNORAR'}">
                                        <axis:ocultar f="axisctr069" c="FFIN" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_FFIN"><axis:alt f="axisctr069" c="FFIN" lit="9000527"></axis:alt></b> <%-- Fecha fin --%>
                                            </td>
                                        </axis:ocultar>
                                        </c:if>
                                         <c:if test="${__formdata.TMOTMOV != 'BOT_DESPIGNORAR'}">
                                         <axis:ocultar f="axisctr069" c="SPERSON" dejarHueco="false">   
                                            <td class="titulocaja">
                                               <b id="label_SPERSON"><axis:alt f="axisctr069" c="SPERSON" lit="9906366"></axis:alt></b> <%-- Beneficiario de la pignoración --%>
                                            </td>
                                        </axis:ocultar>
                                        </c:if>
                                       <!-- CONF-274 - 20161109 - JLTS -- Dias suspendida - Ini -->
                                        <axis:ocultar f="axisctr069" c="NDIAS_SUSP"  >
                                          <td class="titulocaja" style="white-space:nowrap">
                                            <b id="label_PEJECUCION"><axis:alt f="axisctr069" c="LIT_9906429" lit="9906429" /></b>
                                          </td>
                                        </axis:ocultar>
                                        <!-- CONF-274 - 20161109 - JLTS -- Dias suspendida - Fin -->
                                    </tr>
                                    <tr>
                                        <!-- CONF-274 - 20161109 - JLTS -- Ajuste FINICIO (View) - Ini -->
                                        <c:if test="${__formdata.TMOTMOV != 'BOT_PIGNORAR'}">
                                        <axis:ocultar f="axisctr069" c="FINICIO" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FINICIO" name="FINICIO" size="15" 
                                                <axis:atr f="axisctr069" c="FINICIO" a="obligatorio=true&formato=fecha"/>
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINICIO}"/>" style="width:35%"
                                                title="<axis:alt f="axisctr069" c="FINICIO" lit="9000526"></axis:alt>"/><c:if test="${__configform.axisctr069__FINICIO__modificable != 'false'}"><a style="vertical-align:middle;"><img
                                                id="icon_FINICIO" alt="<axis:alt f="axisctr069" c="SELECCIONAR" lit="108341"/>" title="<axis:alt f="axisctr069" c="SELECCIONAR" lit="108341"/>" src="images/calendar.gif"/></a></c:if>
                                            </td>                                            
                                        </axis:ocultar>
                                        </c:if>
                                        <!-- CONF-274 - 20161109 - JLTS -- Ajuste FINICIO (View) - Ini Se adiciona onchange-->
                                        <c:if test="${__formdata.TMOTMOV != 'BOT_PIGNORAR'}">
                                        <axis:ocultar f="axisctr069" c="FFIN" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FFINAL" name="FFINAL" size="15"  
                                                onchange="f_difEntreFechas()"  
                                                <axis:atr f="axisctr069" c="FFIN" a="obligatorio=true&modificable=true&formato=fecha"/>
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINAL}"/>" style="width:35%"
                                                title="<axis:alt f="axisctr069" c="FFIN" lit="9000527"></axis:alt>"/><c:if test="${__configform.axisctr069__FFIN__modificable != 'false'}"><a style="vertical-align:middle;"><img
                                                id="icon_FFINAL" alt="<axis:alt f="axisctr069" c="SELECCIONAR" lit="108341"/>" title="<axis:alt f="axisctr069" c="SELECCIONAR" lit="108341"/>" src="images/calendar.gif"/></a></c:if>
                                            </td>                                            
                                        </axis:ocultar>
                                        </c:if>
                                        <!-- CONF-274 - 20161109 - JLTS -- Dias suspendida - Ini -->
                                        <axis:ocultar f="axisctr069" c="NDIAS_SUSP" >
                                        <td class="campocaja">
                                            <input type="text" style="width:30%" class="campowidthinput campo campotexto" id="NDIAS_SUSP" name="NDIAS_SUSP"  onkeypress="return isNumberKey(event)" title="<axis:alt f="axisctr069" c="LIT_9906429" lit="9906429"/>"
                                            size="15"  value ="${__formdata.NDIAS_SUSP}" <axis:atr f="axisctr069" c="NDIAS_SUSP" a="modificable=true&obligatorio=false&formato=entero"/>
                                            />&nbsp;
                                        </td>
                                         </axis:ocultar>
                                        <!-- CONF-274 - 20161109 - JLTS -- Dias suspendida - Fin -->
                                    <c:if test="${__formdata.TMOTMOV != 'BOT_DESPIGNORAR'}">
                                    <axis:ocultar f="axisctr069" c="SPERSON" dejarHueco="false">                  
                                         <td class="campocaja"  id="td_SPERSON" >
                                        <select name="SPERSON" id="SPERSON" size="1" class="campowidthselect campo campotexto" 
                                        <axis:atr f="axisctr069" c="SPERSON" a="obligatorio=true&isInputText=false"/>
                                        title="<axis:alt f="axisctr069" c="SPERSON" lit="9906366"/>" alt="<axis:alt f="axisctr069" c="SPERSON" lit="9906366"/>">&nbsp;
                                             <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr069" c="SPERSON" lit="108341"/> - </option>
                                         
                                             <c:forEach var="element" items="${__formdata.LSTSPERSON}">
                                                <option  value="${element.SPERSON}" <c:if test="${element.SPERSON==__formdata.SPERSON}">selected</c:if>>
                                                 ${element.TNOMBRE}
                                                </option>
                                            </c:forEach>
                                        </select>
                                        </td>                                              
                                       
                                    </axis:ocultar>
                                    </c:if>
                                    </tr>
                                    <axis:ocultar f="axisctr069" c="IMPORTE" dejarHueco="false">
                                        <tr>
                                            <td class="titulocaja">
                                                <b id="label_IMPORTE"><axis:alt f="axisctr069" c="IMPORTE" lit="100563"></axis:alt></b> <%-- Importe --%>
                                            </td>
                                        </tr>
                                        <tr>                 
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="IIMPORTE" name="IIMPORTE" size="15" 
                                                <axis:atr f="axisctr069" c="IMPORTE" a="obligatorio=true&modificable=true&formato=decimal"/>
                                                value="<fmt:formatNumber value="${__formdata.IIMPORTE}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/>" style="width:35%"
                                                title="<axis:alt f="axisctr069" c="IMPORTE" lit="100563"></axis:alt>"/>
                                            </td>                                            
                                        </tr>
                                    </axis:ocultar>
                                   
                                 <c:if test="${__formdata.TMOTMOV != 'BOT_PIGNORAR'}">
                                    <axis:ocultar f="axisctr069" c="COPCIONAL">
                                    <tr> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr069" c="COPCIONAL" lit="9906367"/></b>
                                        <input type="checkbox" onClick="f_onclickCheckbox(this)" <c:if test="${COPCIONAL==1}">checked</c:if>  id="COPCIONAL" name="COPCIONAL"  />
                                    </td>
                                    </tr> 
                                  </axis:ocultar>
                                </c:if> 
                                    <tr>
                                    <axis:ocultar f="axisctr069" c="NCOLATER" dejarHueco="false">
                                        
                                            <td class="titulocaja">
                                                <b id="labxel_NCOLATER"><axis:alt f="axisctr069" c="NCOLATER" lit="9906364"></axis:alt></b> <%-- Número Colateral --%>
                                            </td>
                                       
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr069" c="NRANGO" dejarHueco="false">
                                        
                                            <td class="titulocaja">
                                                <b id="label_NRANGO"><axis:alt f="axisctr069" c="NRANGO" lit="9906365"></axis:alt></b> <%-- Número de Rango --%>
                                            </td>
                                        
                                    </axis:ocultar>
                                    </tr>
                                    <tr>                 
                                    <axis:ocultar f="axisctr069" c="NCOLATER" dejarHueco="false">
                                        
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="NCOLATER" name="NCOLATER" size="15" 
                                                <axis:atr f="axisctr069" c="NCOLATER" a="modificable=true&formato=entero"/>
                                                value="<fmt:formatNumber value="${__formdata.NCOLATER}" />" style="width:60%"
                                                title="<axis:alt f="axisctr069" c="NCOLATER" lit="9906364"></axis:alt>"/>
                                            </td>                                            
                                        
                                    </axis:ocultar>
                                    
                                    <!--
                                    <axis:ocultar f="axisctr069" c="NRANGO" dejarHueco="false">
                              
                                        <td class="campocaja">
                                        
                                            <select name="NRANGO" id="NRANGO" size="1" class="campowidthselect campo campotexto">&nbsp;
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper008" c="SNV_COMBO" lit="1000348"/> - </option>
                                                    <c:forEach var="element" items="${__formdata.listValores.rankPledge}">
                                                        <option value = "${element.CATRIBU}" 
                                                            <c:if test="${element.CATRIBU == __formdata.NRANGO}"> selected </c:if> />
                                                            ${element.TATRIBU} 
                                                        </option>
                                                    </c:forEach>
                                            </select>
                                            
                                        </td>                                           
                                        
                                    </axis:ocultar>
                                    -->
 
                                    <axis:ocultar f="axisctr069" c="NRANGO" dejarHueco="false">
                              
                                        <td class="campocaja">
                                        
                                            <select name="NRANGO" id="NRANGO" size="1" class="campowidthselect campo campotexto" <axis:atr f="axisctr069" c="NRANGO" a="obligatorio=true&isInputText=false"/>> 
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper008" c="SNV_COMBO" lit="1000348"/> - </option>
                                                    <c:forEach var="element" items="${__formdata.listValores.rankPledge}">
                                                        <option value = "${element.CATRIBU}" 
                                                            <c:if test="${element.CATRIBU == __formdata.NRANGO}"> selected </c:if> />
                                                            ${element.TATRIBU} 
                                                        </option>
                                                    </c:forEach>
                                            </select>
                                            
                                        </td> 
                                        
                                    </axis:ocultar>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>     
            </tr>            
        </table>
        
        </td>
        </tr>
        </table>
        <!-- CONF-274 - 20161125 - JLTS - Se adiciona BT_SALIR y BT_CANCELAR -->
        <!-- Added for BACK (anterior) button (IAXIS-4321) PK-18/06/2019 -->
        <c:import url="../include/botonera_nt.jsp">
        	<c:param name="f">axisctr069</c:param>
            <c:param name="__botones"><axis:visible c="BT_SALIR" f="axisctr069">salir</axis:visible><axis:visible c="BT_CANCELAR" f="axisctr069">,cancelar</axis:visible><c:if test="${requestScope.guardarOK != true}"><axis:visible c="BT_ACEPTAR" f="axisctr069">,aceptar</axis:visible></c:if><axis:visible f="axisctr024" c="BT_ANT">,anterior</axis:visible><axis:visible c="BT_SIGUIENTE" f="axisctr069">,siguiente</axis:visible></c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>

    <script type="text/javascript">
       <c:if test="${__configform.axisctr069__FINICIO__modificable != 'false'}">
        Calendar.setup({
            inputField     :    "FINICIO",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FINICIO", 
            singleClick    :    true,
            firstDay       :    1
        });
       </c:if>
       <c:if test="${__configform.axisctr069__FFIN__modificable != 'false'}">
        Calendar.setup({
            inputField     :    "FFINAL",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FFINAL", 
            singleClick    :    true,
            firstDay       :    1
        });
        </c:if>
    </script>


</body>
</html>
