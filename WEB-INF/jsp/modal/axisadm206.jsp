 <%/* Revision:# TR9eWyUbwL6g54/ceGymaw== # */%>
<%-- 
*  Fichero: axisadm206.jsp
*  Alta/MOd. reaseguro cláusulas / tramos escalonados
*  Fecha: 11/08/2011
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
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

        function f_onload() {
         	var mensaje = '${__formdata.errorMensaje}';
         	var grabarOK = '${__formdata.grabarOK}';

        	
            if (grabarOK == '1' ) {
              alert(mensaje);
            }
            else {
            	if (grabarOK == '0' ) {
            	  alert("Transacción Exitosa");
		  // INI - IAXIS-5100 - JLTS - 23/08/2019
            	  parent.f_but_cerrar_axisadm206();
		  // FIN - IAXIS-5100 - JLTS - 23/08/2019
            	}
            }
            f_cargar_propiedades_pantalla();
            
        }
                
        function f_but_aceptar() {
	
		   if(objValidador.validaEntrada()){
	        	objUtiles.ejecutarFormulario("modal_axisadm206.do","aceptar", document.miForm, "_self");
			    //objAjax.invokeAsyncCGI("modal_axisadm206.do", callbackAjaxSalir, "operation=aceptar", objJsMessages.jslit_actualizando_registro);
		    }

        }
        
        function f_but_salir() {
            parent.f_but_cerrar_axisadm206();
        }    
        
        
        function f_but_cancelar() { 
               parent.f_but_cerrar_axisadm206();                
        }    
        
        function restrictTextAreaChars(obj) {
            var maxLength = 500;
            if (obj.getAttribute && obj.value.length > maxLength)
                obj.value = obj.value.substring(0, maxLength);
        }
        
        function callbackAjaxSalir (ajaxResponseText) {
        	parent.f_cerrar_axisadm206();
        }
        
        function f_cambia_ramo(obj) {
	    // INI - IAXIS-3288 - JLTS - 20/06/2019. Se ajusta RAMOS por CRAMO
            objAjax.invokeAsyncCGI("modal_axisadm206.do", callbackAjaxSelectedRamos, "operation=ajax_selected_ramos&CRAMO=" + document.miForm.CRAMO.value, obj, objJsMessages.jslit_actualizando_registro);
	    // FIN - IAXIS-3288 - JLTS - 20/06/2019. Se ajusta RAMOS por CRAMO
        }
        
        function callbackAjaxSelectedRamos (ajaxResponseText) {
      	  var actividadesCombo = document.miForm.CACTIVI;
      	  
            try {
                var doc = objAjax.domParse(ajaxResponseText);
                
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {

                    if (objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])) {
                  	  
                        objDom.borrarOpcionesDeCombo(actividadesCombo);
                        objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", actividadesCombo, 0);
                        for (var i = 0;i < doc.getElementsByTagName("element").length;i++) {

                            var TTITULO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TTITULO")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TTITULO")[0].childNodes[0].nodeValue : "");
                            var CACTIVI = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CACTIVI")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CACTIVI")[0].childNodes[0].nodeValue : "");
                            
                            objDom.addOpcionACombo(CACTIVI, TTITULO, actividadesCombo, i + 1);
                        }
                    }
                    else {
                        objDom.borrarOpcionesDeCombo(actividadesCombo);
                        objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", actividadesCombo, null);
                    }
                }
                //$("#CUSU, #MAIL").attr('disabled','disabled').removeClass("campodisabled");
            }
            catch (e) {
                objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", actividadesCombo, null);
                alert('catch:' + e);
            }
        }
        

        function f_cambia_grupo(obj) {
            objAjax.invokeAsyncCGI("modal_axisadm206.do", callbackAjaxSelectedGrupo, "operation=ajax_selected_grupo", obj, objJsMessages.jslit_actualizando_registro);
        }
        
        function callbackAjaxSelectedGrupo(ajaxResponseText) {
            var sucursalCombo = document.miForm.SUCURSAL;
            
            try {
                var doc = objAjax.domParse(ajaxResponseText);

                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    if (objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])) {
                        objDom.borrarOpcionesDeCombo(sucursalCombo);
                        objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", sucursalCombo, 0);
                        for (var i = 0;i < doc.getElementsByTagName("element").length;i++) {
							
                            var NOMBRE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("NOMBRE")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("NOMBRE")[0].childNodes[0].nodeValue : "");
                            var CODI = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CODI")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CODI")[0].childNodes[0].nodeValue : "");
                            objDom.addOpcionACombo(CODI, NOMBRE, sucursalCombo, i + 1);
                        }
                    }
                    else {
                        objDom.borrarOpcionesDeCombo(sucursalCombo);
                        objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", sucursalCombo, null);
                    }
                }
                //$("#CUSU, #MAIL").removeAttr('disabled').removeClass("campodisabled");
            }
            catch (e) {
                objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", sucursalCombo, null);
                alert('catch:' + e);
            }
        }
        
      function f_cambia_productos(obj) {
          // INI - IAXIS-3288 - JLTS - 20/06/2019. Se ajusta RAMOS por CRAMO
          objAjax.invokeAsyncCGI("modal_axisadm206.do", callbackAjaxSelectedActivi, "operation=ajax_selected_activi&CRAMO=" + document.miForm.CRAMO.value+"&CACTIVI="+ document.miForm.CACTIVI.value, obj, objJsMessages.jslit_actualizando_registro);
	  // FIN - IAXIS-3288 - JLTS - 20/06/2019. Se ajusta RAMOS por CRAMO
      }
      
      function callbackAjaxSelectedActivi (ajaxResponseText) {
    	  var actividadesCombo = document.miForm.CGRUPO;
          try {
              var doc = objAjax.domParse(ajaxResponseText);

              if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                  if (objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])) {
                      objDom.borrarOpcionesDeCombo(actividadesCombo);
                      objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", actividadesCombo, 0);
                      for (var i = 0;i < doc.getElementsByTagName("element").length;i++) {

                          var PRE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("PRE")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("PRE")[0].childNodes[0].nodeValue : "");
                          var CGRUPO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CGRUPO")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CGRUPO")[0].childNodes[0].nodeValue : "");
                          objDom.addOpcionACombo(CGRUPO, PRE, actividadesCombo, i + 1);
                      }
                  }
                  else {
                      objDom.borrarOpcionesDeCombo(actividadesCombo);
                      objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", actividadesCombo, null);
                  }
              }
              //$("#CUSU, #MAIL").attr('disabled','disabled').removeClass("campodisabled");
          }
          catch (e) {
              objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", actividadesCombo, null);
              alert('catch:' + e);
          }
      }
      
    </script>
  
  
  </head>
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
  
  
 
    <!--form name="axisrea026Form" action="" method="POST"-->
    <form name="miForm" action="modal_axisadm206.do" method="POST">
        <input type="hidden" name="SRDIAN" id="SRDIAN" value="${__formdata.SRDIAN}"/>
        <input type="hidden" name="H_MODIF" id="H_MODIF" value="${__formdata.H_MODIF}"/>
        <input type="hidden" name="CTRAMO_MOD" id="CTRAMO_MOD" value="${__formdata.CTRAMO_MOD}"/>
        <input type="hidden" name="NVERSIO" id="NVERSIO" value="${__formdata.NVERSIO}"/>
        <input type="hidden" name="SCONTRA" id="SCONTRA" value="${__formdata.SCONTRA}"/>
        <input type="hidden" name="SCTRXL" id="SCTRXL"  value="${__formdata.SCTRXL}"/>
        <input type="hidden" name="NVERXL" id="NVERXL"  value="${__formdata.NVERXL}"/>
        <input type="hidden" name="CMODOS" id="CMODOS" value="${__formdata.CMODOS}"/>
		<input type="hidden" name="operation" id="operation" value=""/>
        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisadm206" c="LIT_NOMBRE_PANTALLA" lit="9909389" /></c:param>
            <c:param name="form">axisadm206</c:param>
        </c:import>


        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:130px">
          
            <tr>
                <td>
                
                    <!-- TRAMOS -->
                    <table class="area">

                                <tr>
                                    <th style="width:25%;height:0px"></th>                                            
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                       
                                </tr>
                                <tr>
                                     <axis:ocultar f="axisadm206" c="NRESOL" dejarHueco="false"> 
                                        <td class="titulocaja" colspan="1"><b id="label_NRESOL"><axis:alt f="axisadm206" c="LIT_NRESOL" lit="9903489"/></b></td>
                                     </axis:ocultar>
                                      <axis:ocultar f="axisadm206" c="DESCRIPCION" dejarHueco="false"><!-- DESCRIPCION -->
                                        <td class="titulocaja" ><b id="label_DESCRIPCION"><axis:alt f="axisadm206" c="LIT_DESCRIPCION" lit="100588"/></b></td>
                                     </axis:ocultar>
				  <%-- INI - IAXIS-3288 - JLTS - 20/06/2019. Se ajusta RAMOS por CRAMO--%>
                                  <axis:visible f="axisadm206" c="CRAMO" ><!-- CRAMO -->
                                        <td class="titulocaja" >
                                            <b id="label_CRAMO"><axis:alt f="axisadm206" c="LIT_CRAMO" lit="100784"/></b>
                                        </td>
                                </axis:visible>  
				<%-- FIN - IAXIS-3288 - JLTS - 20/06/2019. Se ajusta RAMOS por CRAMO--%>
                                <axis:visible f="axisadm206" c="CACTIVI"><!-- ACTIVIDAD -->
                                        <td class="titulocaja" >
                                            <b id="label_ACTIVIDAD"><axis:alt f="axisadm206" c="LIT_ACTIVIDAD" lit="103481"/></b>
                                        </td>
                                </axis:visible> 
                                               
                                </tr>
                         
                                <tr>
                                  <axis:ocultar f="axisadm206" c="NRESOL" dejarHueco="false">
                                       <td class="campocaja" colspan="1">  
                                            <input type="text" class="campo campotexto"  id="NRESOL" name="NRESOL" style="width:80%" 
                                            title="<axis:alt f="NRESOL" c="NRESOL" lit="9903489" />"
                                            value="${__formdata.NRESOL}" <axis:atr f="axisadm206" c="NRESOL" a="modificable=true&obligatorio=true"/>/>
                                       </td>
                                  </axis:ocultar>
                                   <axis:ocultar f="axisadm206" c="DESCRIPCION" dejarHueco="false">
                                       <td class="campocaja" colspan="1"> 
                                            <input type="text" class="campo campotexto"  id="DESCRIPCION" name="DESCRIPCION" style="width:90%" onkeyup="restrictTextAreaChars(this)"
                                            title="<axis:alt f="DESCRIPCION" c="DESCRIPCION" lit="100588" />"
                                            value="${__formdata.TDESCRIP}" <axis:atr f="axisadm206" c="DESCRIPCION" a="modificable=true&obligatorio=true"/>/>
                                       </td>
                                  </axis:ocultar>
		             <%-- INI - IAXIS-3288 - JLTS - 20/06/2019. Se ajusta RAMOS por CRAMO--%>
                             <!-- CRAMO -->
                              <axis:ocultar f="axisadm206" c="CRAMO" dejarHueco="false">
                                    <td class="campocaja" >
                                        <select  name = "CRAMO"  id ="CRAMO" style="width:95%;" size="1"  class="campowidthselect campo campotexto" onchange="f_cambia_ramo(this);"
                                         <axis:atr f="axisadm206" c="CRAMO" />
                                         <c:if test="${__formdata.CMODOS == 'MODIFICACION' || __formdata.CMODOS == 'CONSULTA'}">disabled</c:if>>
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm206" c="LIT_CRAMO" lit="108341"/> - </option>
                                            <c:forEach var="cramos" items="${sessionScope.cramos}">
                                                <option value = "${cramos.CRAMO}"
                                                  <c:if test="${cramos.CRAMO == __formdata.CRAMO}"> selected </c:if>>
                                                    ${cramos.TRAMO}                            
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar> 
                            <%-- FIN - IAXIS-3288 - JLTS - 20/06/2019. Se ajusta RAMOS por CRAMO--%>                                  
                              <axis:visible f="axisadm206" c="CACTIVI">
                                     <td class="campocaja" >
                                        <%-- INI - IAXIS-3288 - JLTS - 20/06/2019. Se ajustan las condiciones de CACTIVI y MODOS--%>
                                        <select  name = "CACTIVI"  id ="CACTIVI" style="width:95%;" size="1"  class="campowidthselect campo campotexto" onchange="f_cambia_productos(this);" 
                                            <axis:atr f="axisadm206" c="CACTIVI" />
                                            <c:if test="${__formdata.CMODOS == 'MODIFICACION' || __formdata.CMODOS == 'CONSULTA'}">disabled</c:if>>
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm206" c="LIT_ACTIVIDAD" lit="103155"/> - </option>
                                            <c:forEach var="actividades" items="${sessionScope.actividadesramos}">
                                                <option value = "${actividades.CACTIVI}" <c:if test="${actividades.CACTIVI == __formdata.CACTIVI}">selected</c:if>>
                                                    ${actividades.TTITULO}
                                                </option>
                                            </c:forEach>
                                        </select>
					<%-- FIN - IAXIS-3288 - JLTS - 20/06/2019. Se ajustan las condiciones de CACTIVI y MODOS--%>
                                    </td>
                              </axis:visible>
                               </tr>
                               <tr> 
                            	<axis:visible f="axisadm206" c="CGRUPO"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisadm206" c="CGRUPO" lit="100829" /></b>                                        
                                    </td>
                                </axis:visible>
                                <%-- <axis:ocultar f="axisadm206" c="SUCURSAL" dejarHueco="false"> --%> 
                                <axis:visible f="axisadm206" c="SUCURSAL" >
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisadm206" c="SUCURSAL" lit="9909330"></axis:alt></b>
                                    </td>
                                </axis:visible>
                                <%-- </axis:ocultar> --%>
                                     <axis:ocultar f="axisadm206" c="CUSU" dejarHueco="false">
                                        <td class="titulocaja" ><b id="label_CUSU"><axis:alt f="axisadm206" c="LIT_CUSU" lit="9905522"/></b></td>
                                     </axis:ocultar>
                               </tr>      
                               <tr>
                            	<axis:visible f="axisadm206" c="CGRUPO"> <!-- TODO C -->
                                    <td class="campocaja" >
				        <%-- INI - IAXIS-3288 - JLTS - 20/06/2019. Se ajustan las condiciones de CGRUPO y MODOS--%>
                                        <select  name = "CGRUPO"  id ="CGRUPO" style="width:95%;" size="1"  class="campowidthselect campo campotexto" onchange="f_cambia_grupo(this);" 
                                        <axis:atr f="axisadm206" c="CGRUPO" />
                                        <c:if test="${__formdata.CMODOS == 'MODIFICACION' || __formdata.CMODOS == 'CONSULTA'}">disabled</c:if>>
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm206" c="LIT_SELEC_PRD" lit="103155"/> - </option>
                                            <c:forEach var="gruposdian" items="${sessionScope.actividadesproducto}">
                                                <option value = "${gruposdian.CGRUPO}"
                                                   <c:if test="${gruposdian.CGRUPO == __formdata.CGRUPO}"> selected </c:if>>
                                                    ${gruposdian.PRE}                         
                                                </option>
                                            </c:forEach>
                                        </select>
					<%-- FIN - IAXIS-3288 - JLTS - 20/06/2019. Se ajustan las condiciones de CGRUPO y MODOS--%>
                                    </td>
                                </axis:visible>
                               <%-- <axis:ocultar f="axisadm206" c="SUCURSAL" dejarHueco="false"> <!-- TODO C --> --%>
                               <axis:visible f="axisadm206" c="SUCURSAL" >
                                    <td class="campocaja">
				        <%-- INI - IAXIS-3288 - JLTS - 20/06/2019. Se ajustan las condiciones de SUCURSAL y MODOS--%>
                                        <select name = "SUCURSAL" id="SUCURSAL" style="width:95%;" size="1" class="campowidthselect campo campotexto"
                                            <axis:atr f="axisadm206" c="SUCURSAL" />
                                            <c:if test="${__formdata.CMODOS == 'MODIFICACION' || __formdata.CMODOS == 'CONSULTA'}">disabled</c:if>>
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm206" c="LIT_SELEC" lit="108341"/> - </option>
                                            <c:forEach var="ramos" items="${sessionScope.listaSucursales}">
                                                <option value = "${ramos.CODI}"
                                                <c:if test="${ramos.CODI == __formdata.CAGENTE}"> selected </c:if>>
                                                    ${ramos.NOMBRE}
                                                </option>
                                            </c:forEach>
                                        </select>
					<%-- FIN - IAXIS-3288 - JLTS - 20/06/2019. Se ajustan las condiciones de SUCURSAL y MODOS--%>
                                    </td>
                                </axis:visible>

                                
                            <axis:ocultar f="axisadm206" c="CUSU" dejarHueco="false">
                                   <td class="campocaja" colspan="1"> 
				        <%-- INI - IAXIS-3288 - JLTS - 20/06/2019. Se ajustan las condiciones de CUSU y MODOS--%>
                                        <select title="<axis:alt f="axisadm206" c="CUSU" lit="100829" />" name = "CUSU" style="width:80%;" id ="CUSU" size="1"  class="campowidthselect campo campotexto" 
                                             <axis:atr f="axisadm206" c="CUSU" />
                                             <c:if test="${__formdata.CMODOS == 'CONSULTA'}">disabled</c:if>>
                                             <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm206" c="LIT_CUSU" lit="103155"/> - </option>
                                             <c:forEach var="usuarios" items="${sessionScope.LSTUSUARIOS}">
                                                 <option value = "${usuarios.CUSUARI}"
                                                 <c:if test="${usuarios.CUSUARI == __formdata.NUSU}"> selected </c:if>>
                                                     ${usuarios.TUSUNOM}
                                                 </option>
                                             </c:forEach>
                                         </select>
					 <%-- FIN - IAXIS-3288 - JLTS - 20/06/2019. Se ajustan las condiciones de CUSU y MODOS--%>
                                   </td>
                            </axis:ocultar>
                               </tr>    
                               
                               <tr> 
                                     <axis:ocultar f="axisadm206" c="FINIVIG" dejarHueco="false"><!-- TIPO-->
                                        <td class="titulocaja" ><b id="label_FINIVIG"><axis:alt f="axisadm206" c="LIT_FINIVIG" lit="9906570"/></b></td>
                                     </axis:ocultar>
                                     <axis:ocultar f="axisadm206" c="FFINVIG" dejarHueco="false"><!-- TIPO-->
                                        <td class="titulocaja" ><b id="label_FFINVIG"><axis:alt f="axisadm206" c="LIT_FFINVIG" lit="9909543"/></b></td>
                                     </axis:ocultar>
                                     <axis:ocultar f="axisadm206" c="NAVISO" dejarHueco="false"><!-- TIPO-->
                                        <td class="titulocaja" ><b id="label_NAVISO"><axis:alt f="axisadm206" c="NAVISO" lit="9909552"/></b></td>
                                     </axis:ocultar>
                                     <axis:ocultar f="axisadm206" c="MAIL" dejarHueco="false">
                                        <td class="titulocaja" ><b id="label_MAIL"><axis:alt f="axisadm206" c="LIT_MAIL" lit="109792"/></b></td>
                                     </axis:ocultar> 
                               </tr>
                               
                               <tr>  
                                <%-- INI - IAXIS-3288 - JLTS - 20/06/2019. Se ajustan las condiciones de MODOS--%>
                                <axis:ocultar f="axisadm206" c="FINIVIG" dejarHueco="false"> 
                                   <td class="campocaja" colspan="1"> <%-- FECHA VENCIMIENTO --%>
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="<fmt:formatDate value='${__formdata.FINIVIG}' pattern='dd/MM/yyyy'/>" name="FINIVIG" id="FINIVIG" 
                                            title="<axis:alt f="axisadm206" c="FINIVIG" lit="9906570" />"
                                            style="width:55%;" <axis:atr f="axisadm206" c="FINIVIG" a="formato=fecha&obligatorio=true"/> 
                                            <c:if test="${__formdata.CMODOS == 'MODIFICACION' || __formdata.CMODOS == 'CONSULTA'}">disabled</c:if>/>
                                            <a style="vertical-align:middle;"><img
                                            id="icon_FINIVIG" border=0 alt="<axis:alt f="axisadm206" c="LIT_FINIVIG" lit="100885"/>" title="<axis:alt f="axisadm206" c="LIT_FINIVIG_TIT" lit="100885"/>" src="images/calendar.gif"/></a>
                                   </td>                                                          
                                </axis:ocultar>
                                <%-- FIN - IAXIS-3288 - JLTS - 20/06/2019. Se ajustan las condiciones de CUSU y MODOS--%>
                                <axis:ocultar f="axisadm206" c="FFINVIG" dejarHueco="false"> 
                                   <td class="campocaja" colspan="1"> <%-- FECHA VENCIMIENTO --%>
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="<fmt:formatDate value='${__formdata.FFINVIG}' pattern='dd/MM/yyyy'/>" name="FFINVIG" id="FFINVIG" 
                                            title="<axis:alt f="axisadm206" c="FFINVIG" lit="9909543" />"
                                            style="width:55%;" <axis:atr f="axisadm206" c="FFINVIG" a="modificable=true&formato=fecha&obligatorio=true"/> /> 
                                            <a style="vertical-align:middle;"><img
                                            id="icon_FFINVIG" border=0 alt="<axis:alt f="axisadm206" c="LIT_FFINVIG" lit="100885"/>" title="<axis:alt f="axisadm206" c="LIT_FFINVIG_TIT" lit="100885"/>" src="images/calendar.gif"/></a>
                                   </td>                                                          
                                </axis:ocultar>
                                <%-- INI - IAXIS-3288 - JLTS - 20/06/2019. Se ajustan la obligatoriedad--%>
                                <axis:ocultar f="axisadm206" c="NAVISO" dejarHueco="false">
                                       <td class="campocaja" colspan="1">  
                                            <input type="text" class="campo campotexto"  id="NAVISO" name="NAVISO" style="width:80%"
                                            title="<axis:alt f="axisadm206" c="NAVISO" lit="9909552" />"
                                            value="${__formdata.NAVISO}" <axis:atr f="axisadm206" c="NAVISO" a="modificable=true&obligatorio=true"/>/>
                                       </td>
                                </axis:ocultar>
				<%-- FIN - IAXIS-3288 - JLTS - 20/06/2019. Se ajustan la obligatoriedad--%>
                                <axis:ocultar f="axisadm206" c="MAIL" dejarHueco="false">
                                       <td class="campocaja" colspan="1">
				       <%-- INI - IAXIS-3288 - JLTS - 20/06/2019. Se ajustan las condiciones de MODOS--%>   
                                       <select name = "MAIL" id="MAIL"  style="width:80%"
                                       title="<axis:alt f="axisadm206" c="CUSU" lit="109792"/>"
                                       <axis:atr f="axisadm206" c="MAIL" />
                                         <c:if test="${__formdata.CMODOS == 'CONSULTA'}">disabled</c:if>
                                         value="" size="1" onchange="" class="campowidthselect campo campotexto">
                                                <option value=""> - <fmt:message key="108341"/> - </option>
                                                <c:forEach var="MAILS" items="${MAILS}">
                                                    <option value = "${MAILS.CATRIBU}"
                                                    <c:if test="${MAILS.CATRIBU == __formdata.CENVCORR}"> selected </c:if>>
                                                     ${MAILS.TATRIBU}</option>  
                                                </c:forEach>
                                        </select>
					<%-- FIN - IAXIS-3288 - JLTS - 20/06/2019. Se ajustan las condiciones de MODOS--%>   
                                        </td>
                                </axis:ocultar>
                               </tr>
                               
                               <tr> 
                                     <axis:ocultar f="axisadm206" c="NINICIAL" dejarHueco="false"><!-- TIPO-->
                                        <td class="titulocaja" ><b id="label_NINICIAL"><axis:alt f="axisadm206" c="LIT_NINICIAL" lit="9909553"/></b></td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisadm206" c="NFINAL" dejarHueco="false"><!-- TIPO-->
                                        <td class="titulocaja" ><b id="label_NFINAL"><axis:alt f="axisadm206" c="LIT_NFINAL" lit="9909554"/></b></td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisadm206" c="NCERTAVI" dejarHueco="false"><!-- TIPO-->
                                        <td class="titulocaja" ><b id="label_NCERTAVI"><axis:alt f="axisadm206" c="LIT_NCERTAVI" lit="9909555"/></b></td>
                                    </axis:ocultar>
                                 <axis:ocultar f="axisadm206" c="TESTADO" dejarHueco="false">
                                    <td class="titulocaja" ><b id="label_TESTADO"><axis:alt f="axisadm206" c="LIT_TESTADO" lit="100587"/></b></td>
                                 </axis:ocultar>
                               </tr>
                               
                               <tr> 
                               
                                <axis:ocultar f="axisadm206" c="NINICIAL" dejarHueco="false">
                                       <td class="campocaja" colspan="1">  
                                            <input type="text" class="campo campotexto"   id="NINICIAL" name="NINICIAL" style="width:80%"
                                            title="<axis:alt f="axisadm206" c="NINICIAL" lit="9909553" />"
                                            value="${__formdata.NINICIAL}" <axis:atr f="axisadm206" c="NINICIAL" a="modificable=true&obligatorio=true"/>/>
                                       </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisadm206" c="NFINAL" dejarHueco="false">
                                       <td class="campocaja" colspan="1">  
                                            <input type="text" class="campo campotexto"   id="NFINAL" name="NFINAL" style="width:80%"
                                            title="<axis:alt f="axisadm206" c="NFINAL" lit="9909554" />"
                                            value="${__formdata.NFINAL}" <axis:atr f="axisadm206" c="NFINAL" a="modificable=true&obligatorio=true"/>/>
                                       </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisadm206" c="NCERTAVI" dejarHueco="false">
                                       <td class="campocaja" colspan="1">  
                                            <input type="text" class="campo campotexto"  id="NCERTAVI" name="NCERTAVI" style="width:80%"
                                            title="<axis:alt f="axisadm206" c="NCERTAVI" lit="9909555" />"
                                            value="${__formdata.NCERTAVI}" <axis:atr f="axisadm206" c="NCERTAVI" a="modificable=true&obligatorio=true"/>/>
                                       </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisadm206" c="TESTADO" dejarHueco="false">
                                       <td class="campocaja" colspan="1">
				       <%-- INI - IAXIS-3288 - JLTS - 20/06/2019. Se ajustan las condiciones de MODOS--%>      
                                       <select name = "TESTADO" id="TESTADO"  style="width:80%"
                                       title="<axis:alt f="axisadm206" c="CUSU" lit="109792" />"
                                       <axis:atr f="axisadm206" c="TESTADO"/>
                                       <c:if test="${__formdata.CMODOS == 'CONSULTA'}">disabled</c:if>
                                         value="" size="1" onchange="" class="campowidthselect campo campotexto">
                                                <option value=""> - <fmt:message key="108341"/> - </option>
                                                <c:forEach var="TESTADOS" items="${TESTADOS}">
                                                    <option value = "${TESTADOS.CATRIBU}"
                                                    <c:if test="${TESTADOS.CATRIBU == __formdata.TESTADO}"> selected </c:if>>
                                                     ${TESTADOS.TATRIBU}</option>  
                                                </c:forEach>
                                        </select>
					<%-- FIN - IAXIS-3288 - JLTS - 20/06/2019. Se ajustan las condiciones de MODOS--%>      
                                        </td>
                                </axis:ocultar>
                                  
                                </tr>
                                
                      
                                                   
                                                                                                 
                            </table>
                        </td>
                    </tr>
                </table>
                                                          
                                                                        
                                     <!-- ************************* FIN DATOS TRAMOS  ********************* -->     			
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm206</c:param><c:param name="f">axisadm206</c:param>
            <c:param name="__botones"><axis:ocultar f="axisadm206" c="BUT_ACEPTAR" dejarHueco="false">aceptar</axis:ocultar>,cancelar<axis:ocultar f="axisadm206" c="BUT_SALIR" dejarHueco="false">,salir</axis:ocultar></c:param>
        </c:import>
<%--         <c:import url="../include/botonera_nt.jsp"> --%>
<%-- 			<c:param name="f">axisctr300</c:param> --%>
<%--             <c:param name="f">axisctr300</c:param> --%>
<%--             <c:param name="__botones">cancelar,aceptar</c:param>  --%>
<%-- 	    </c:import>         --%>
    </form> 
    
    <c:import url="../include/mensajes.jsp" />
     <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FALTA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FALTA", 
            singleClick    :    true,
            firstDay       :    1
        });
     </script>
     <script type="text/javascript">
           Calendar.setup({
               inputField     :    "FINIVIG",     
               ifFormat       :    "%d/%m/%Y",      
               button         :    "icon_FINIVIG", 
               singleClick    :    true,
              firstDay       :    1
        });
        </script>
        <script type="text/javascript">
           Calendar.setup({
               inputField     :    "FFINVIG",     
               ifFormat       :    "%d/%m/%Y",      
               button         :    "icon_FFINVIG", 
               singleClick    :    true,
              firstDay       :    1
        });
        </script>
   </body>
</html>
