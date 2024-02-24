<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ page import="axis.mvc.model.*" %><% //ecg20131002 %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axisadm205" c="LIT_BUSC_SIMUL" lit="1000200"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
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
        <script type="text/javascript">
            
        	var ramosSelected;
	        var actividadSelected;
	        var productoSelected;
	        var sucursalSelected;
	        var usuarioSelected;
	        var mailSelected = -1;
	        var testadoSelected;
	        var resolucionEntered = "";
	        var descripcionEntered = "";
	        //$("#CUSU, #MAIL").attr('disabled','disabled').removeClass("campodisabled");
	        
			function f_onload_axisadm205() {
				 //$("#CUSU, #MAIL").attr('disabled','disabled').removeClass("campodisabled");
				 
			     f_cargar_propiedades_pantalla();
			     
			     ramosSelected = window.sessionStorage.getItem("ramosSelected");
			     actividadSelected = window.sessionStorage.getItem("actividadSelected");
			     productoSelected = window.sessionStorage.getItem("productoSelected");
			     sucursalSelected = window.sessionStorage.getItem("sucursalSelected");
			     usuarioSelected = window.sessionStorage.getItem("usuarioSelected");
			     mailSelected = window.sessionStorage.getItem("mailSelected");
			     testadoSelected = window.sessionStorage.getItem("testadoSelected");
			     resolucionEntered = window.sessionStorage.getItem("resolucionEntered") == null ? "" : window.sessionStorage.getItem("resolucionEntered");
			     descripcionEntered = window.sessionStorage.getItem("descripcionEntered") == null ? "" : window.sessionStorage.getItem("descripcionEntered");
			     
			     $("#RAMOS").val('' + ramosSelected + '');
				 $("#CACTIVI").val('' + actividadSelected + '');
				 $("#CGRUPO").val('' + productoSelected + '');
				 $("#SUCURSAL").val('' + sucursalSelected + '');
				 $("#CUSU").val('' + usuarioSelected + '');
				 $("#MAIL").val('' + mailSelected + '').change();
				 console.log("mailSelected -> " + mailSelected);
				 $("#TESTADO").val('' + testadoSelected + '').change();
				 console.log("testadoSelected -> " + testadoSelected);
				 //$("#MAIL>option:eq(" + (mailSelected + 1) + ")").prop("selected", true);
				 
				 $("#RESOLUCION").val('' + resolucionEntered + '');
				 $("#DESCRIPCION").val('' + descripcionEntered + '');
				 
				 window.sessionStorage.clear();
			}
            
            function f_but_buscar() {
            	//$("#CUSU, #MAIL").attr('disabled','disabled').removeClass("campodisabled");
            	
				ramosSelected = $("#RAMOS").find("option:selected").val();
				actividadSelected = $("#CACTIVI").find("option:selected").val();
            	productoSelected = $("#CGRUPO").find("option:selected").val();
            	sucursalSelected = $("#SUCURSAL").find("option:selected").val();
            	usuarioSelected = $("#CUSU").find("option:selected").val();
            	mailSelected = $("#MAIL").find("option:selected").val();
            	testadoSelected = $("#TESTADO").find("option:selected").val();
            	resolucionEntered = $("#RESOLUCION").val();
            	descripcionEntered = $("#DESCRIPCION").val();
            	
            	window.sessionStorage.setItem("ramosSelected", ramosSelected);
            	window.sessionStorage.setItem("actividadSelected", actividadSelected);
            	window.sessionStorage.setItem("productoSelected", productoSelected);
            	window.sessionStorage.setItem("sucursalSelected", sucursalSelected);
            	window.sessionStorage.setItem("usuarioSelected", usuarioSelected);
            	window.sessionStorage.setItem("mailSelected", mailSelected);
            	window.sessionStorage.setItem("testadoSelected", testadoSelected);
            	window.sessionStorage.setItem("resolucionEntered", resolucionEntered);
            	window.sessionStorage.setItem("descripcionEntered", descripcionEntered);
            	
            	f_cargar_listaVersionesDian();
            }
            
             function f_but_salir() {
                objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
            } 
            
            function f_but_aceptar() {
            	if(objUtiles.f_GuardaCasillasChecked ("radioSelect")){
            		var datos = objUtiles.f_GuardaCasillasChecked ("radioSelect").split(',');
                    var SRDIAN = datos[0];
                    var NRESOL = datos[1];
                    var CAGENTE = datos[2];
                    var CGRUPO = datos[3];
                    var CACTIVI = datos[4];
                    f_abrir_axisadm206("CONSULTA", SRDIAN,NRESOL,CAGENTE,CGRUPO,CACTIVI);
            	}else{
            		alert("Debe seleccionar un registro");
            	}
                
            }
            
            function f_but_nuevo() {
                f_abrir_axisadm206("ALTA","","","","","");
            }
            
            function f_but_editar(SRDIAN,NRESOL,CAGENTE,CGRUPO,CACTIVI) {
                f_abrir_axisadm206("MODIFICACION", SRDIAN,NRESOL,CAGENTE,CGRUPO,CACTIVI);
            }
            
            
            function f_cargar_listaVersionesDian() {   
             	 objUtiles.ejecutarFormulario ("axis_axisadm205.do", "f_cargar_listaVersionesDian", document.miForm, "_self");
            }
            
            function f_abrir_axisadm206(CMODO, SRDIAN, NRESOL,CAGENTE,CGRUPO,CACTIVI) {
                objUtiles.abrirModal("axisadm206", "src", "modal_axisadm206.do?operation=form&CMODO="+CMODO+"&SRDIAN="+SRDIAN+"&NRESOL="+NRESOL+"&CAGENTE="+CAGENTE+"&CGRUPO="+CGRUPO+"&CACTIVI="+CACTIVI);
            }
            
            function f_aceptar_axisadm206() {
               f_cerrar_axisadm206();     
            }
            
            function f_but_cerrar_axisadm206(){
                objUtiles.cerrarModal("axisadm206");
            } 
            
            function f_cambia_ramo(obj) {
                objAjax.invokeAsyncCGI("axis_axisadm205.do", callbackAjaxSelectedRamos205, "operation=ajax_selected_ramos_205&CRAMO=" + document.miForm.RAMOS.value, obj, objJsMessages.jslit_actualizando_registro);
            }
            
            function callbackAjaxSelectedRamos205 (ajaxResponseText) {
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
            

            function f_cambia_grupo_205(obj) {
                objAjax.invokeAsyncCGI("axis_axisadm205.do", callbackAjaxSelectedGrupo_205, "operation=ajax_selected_grupo_205", obj, objJsMessages.jslit_actualizando_registro);
            }
            
            function callbackAjaxSelectedGrupo_205(ajaxResponseText) {
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
            
          function f_cambia_productos_205(obj) {
              objAjax.invokeAsyncCGI("axis_axisadm205.do", callbackAjaxSelectedActivi_205, "operation=ajax_selected_activi_205&CRAMO=" + document.miForm.RAMOS.value+"&CACTIVI="+ document.miForm.CACTIVI.value, obj, objJsMessages.jslit_actualizando_registro);
          }
          
          function callbackAjaxSelectedActivi_205 (ajaxResponseText) {
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
    <body onload="f_onload_axisadm205()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>

    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation"/>
        <input type="hidden" name="TTITULO" id="TTITULO" value=""/>
        <input type="hidden" name="CMODO" id="CMODO" value=""/>
        <input type="hidden" name="SRDIAN" id="SRDIAN" value="${__formdata.SRDIAN}"/>
       
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"><axis:alt f="axisadm205" c="TITULO" lit="9909541" /></c:param>
                <c:param name="formulario"><axis:alt f="axisadm205" c="TITULO" lit="9909541" /></c:param>
                <c:param name="form">axisadm205</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisadm206|<axis:alt f="axisadm206" c="LIT_MODAL_axisadm206" lit="9909541" /></c:param>
        </c:import>
  
  
        
        
    <!-- Area de campos  -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>          
            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm205" c="LIT_FILTRO" lit="1000178" /></div>

            <!--campos-->
             <table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center">
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:80%;height:0px"></th>
                              
                            </tr>
                            <tr>
                                <axis:visible f="axisadm205" c="RESOLUCION"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisadm205" c="RESOLUCION" lit="9903489" /></b>
                                    </td>
                                </axis:visible>
                                <axis:ocultar f="axisadm205" c="DESCRIPCION" dejarHueco="false"><!-- DESCRIPCION -->
                                        <td class="titulocaja" >
                                            <b id="label_DESCRIPCION"><axis:alt f="axisadm205" c="LIT_DESCRIPCION" lit="100588"/></b>
                                        </td>
                                </axis:ocultar> 
                                 <axis:visible f="axisadm205" c="RAMOS" ><!-- RAMOS -->
                                        <td class="titulocaja" >
                                            <b id="label_RAMOS"><axis:alt f="axisadm205" c="LIT_RAMOS" lit="100784"/></b>
                                        </td>
                                </axis:visible>  
                                <axis:visible f="axisadm205" c="CACTIVI"><!-- ACTIVIDAD -->
                                        <td class="titulocaja" >
                                            <b id="label_ACTIVIDAD"><axis:alt f="axisadm205" c="LIT_ACTIVIDAD" lit="103481"/></b>
                                        </td>
                                </axis:visible> 
                            </tr>                                    
                            <tr>
                           
                               <axis:ocultar f="axisadm205" c="RESOLUCION" dejarHueco="false"> 
                                     <td class="campocaja">    
                                        <input type="text" name="RESOLUCION" id="RESOLUCION" value="" class="campowidthinput campo campotexto"/>
                                    </td>
                               </axis:ocultar>
                               
                               <axis:ocultar f="axisadm205" c="DESCRIPCION" dejarHueco="false">
                                   <td class="campocaja" colspan="1"> <!-- CODIGO -->
                                        <input type="text" class="campo campotexto"  obligatorio="true" id="DESCRIPCION" name="DESCRIPCION" style="width:90%"
                                        value="" <axis:atr f="axisadm205" c="DESCRIPCION" a="modificable=true"/>/>
                                   </td>
                              </axis:ocultar>
                              <!-- RAMOS -->
                              <axis:visible f="axisadm205" c="RAMOS">
                                    <td class="campocaja" >
                                        <select  name = "RAMOS"  id ="RAMOS" style="width:95%;" size="1"  class="campowidthselect campo campotexto" onchange="f_cambia_ramo(this);">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm205" c="LIT_RAMOS" lit="108341"/> - </option>
                                            <c:forEach var="cramos" items="${sessionScope.cramos}">
                                                <option value = "${cramos.CRAMO}">
                                                    ${cramos.TRAMO}                            
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:visible>
                                                              
                              <axis:visible f="axisadm205" c="CACTIVI">
                                     <td class="campocaja" >
                                        <select  name = "CACTIVI"  id ="CACTIVI" style="width:95%;" size="1"  class="campowidthselect campo campotexto" onchange="f_cambia_productos_205(this);" > 
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm205" c="LIT_ACTIVIDAD" lit="103155"/> - </option>
                                            <c:forEach var="actividades" items="${sessionScope.actividadesramos}">
                                                <option value = "${actividades.CACTIVI}" <c:if test="${actividades.CACTIVI == axisadm206_actividadesramos[0].CACTIVI}">selected</c:if>>
                                                    ${actividades.TTITULO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                              </axis:visible>
                               
                            </tr>
                            
                            <tr>
                            	<axis:visible f="axisadm205" c="CGRUPO"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisadm205" c="CGRUPO" lit="100829" /></b>                                        
                                    </td>
                                </axis:visible>
                                <%-- <axis:ocultar f="axisadm205" c="SUCURSAL" dejarHueco="false"> --%> 
                                <axis:visible f="axisadm205" c="SUCURSAL" >
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisadm205" c="SUCURSAL" lit="9909330"></axis:alt></b>
                                    </td>
                                </axis:visible>
                                <%-- </axis:ocultar> --%>
                            </tr>
                            
                            <tr>
                            	<axis:visible f="axisadm205" c="CGRUPO"> <!-- TODO C -->
                                    <td class="campocaja" >
                                        <select  name = "CGRUPO"  id ="CGRUPO" style="width:95%;" size="1"  class="campowidthselect campo campotexto" onchange="f_cambia_grupo_205(this);" >
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm205" c="LIT_SELEC_PRD" lit="103155"/> - </option>
                                            <c:forEach var="gruposdian" items="${sessionScope.actividadesproducto}">
                                                <option value = "${gruposdian.CGRUPO}">
                                                    ${gruposdian.PRE}                         
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:visible>
                               <%-- <axis:ocultar f="axisadm205" c="SUCURSAL" dejarHueco="false"> <!-- TODO C --> --%>
                               <axis:visible f="axisadm205" c="SUCURSAL" >
                                    <td class="campocaja">
                                        <select name = "SUCURSAL" id="SUCURSAL" style="width:95%;" size="1" class="campowidthselect campo campotexto">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm205" c="LIT_SELEC" lit="108341"/> - </option>
                                            <c:forEach var="ramos" items="${sessionScope.listaSucursales}">
                                                <option value = "${ramos.CODI}">
                                                    ${ramos.NOMBRE}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:visible>
                                <%-- </axis:ocultar>     --%>  

                                
                             </tr>
                             
                             <tr>
                                <axis:ocultar f="axisadm205" c="CUSU" dejarHueco="false">
                                    <td class="titulocaja" ><b id="label_CUSU"><axis:alt f="axisadm205" c="LIT_CUSU" lit="9905522"/></b></td>
                                 </axis:ocultar>
                                 <axis:ocultar f="axisadm205" c="MAIL" dejarHueco="false">
                                    <td class="titulocaja" ><b id="label_MAIL"><axis:alt f="axisadm205" c="LIT_MAIL" lit="9909542"/></b></td>
                                 </axis:ocultar>
                                 <axis:ocultar f="axisadm205" c="TESTADO" dejarHueco="false">
                                    <td class="titulocaja" ><b id="label_TESTADO"><axis:alt f="axisadm205" c="LIT_TESTADO" lit="100587"/></b></td>
                                 </axis:ocultar>  
                            </tr>
                            
                            <tr>   
                                
                            <axis:ocultar f="axisadm205" c="CUSU" dejarHueco="false">
                                   <td class="campocaja" colspan="1"> 
                                        <select title="<axis:alt f="axisadm206" c="CUSU" lit="100829" />" name = "CUSU" style="width:80%;" id ="CUSU" size="1"  class="campowidthselect campo campotexto" >
                                             <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm206" c="LIT_CUSU" lit="103155"/> - </option>
                                             <c:forEach var="usuarios" items="${sessionScope.LSTUSUARIOS}">
                                                 <option value = "${usuarios.CUSUARI}">
                                                     ${usuarios.TUSUNOM}
                                                 </option>
                                             </c:forEach>
                                         </select>
                                   </td>
                            </axis:ocultar>
                            
                            <axis:ocultar f="axisadm205" c="MAIL" dejarHueco="false">
                                   <td class="campocaja" colspan="1"> 
                                        <select name = "MAIL" id="MAIL" 
                                         value="" size="1" onchange="" class="campowidthselect campo campotexto">
                                                <option value=""> - <fmt:message key="108341"/> - </option>
                                                <c:forEach var="MAILS" items="${MAILS}">
                                                    <option value = "${MAILS.CATRIBU}">
                                                     ${MAILS.TATRIBU}</option>
                                                </c:forEach>
                                        </select>
                                   </td>
                            </axis:ocultar>
                            
                            <axis:ocultar f="axisadm205" c="TESTADO" dejarHueco="false">
                                   <td class="campocaja" colspan="1"> 
                                        <select name = "TESTADO" id="TESTADO" 
                                         value="" size="1" onchange="" class="campowidthselect campo campotexto">
                                                <option value=""> - <fmt:message key="108341"/> - </option>
                                                <c:forEach var="TESTADOS" items="${TESTADOS}">
                                                    <option value = "${TESTADOS.CATRIBU}">
                                                     ${TESTADOS.TATRIBU}</option>
                                                </c:forEach>
                                        </select>
                                   </td>
                            </axis:ocultar>
                            
                            <axis:visible f="axisadm205" c="BT_BUSCAR">
                                    <td align="right">
                                        <input type="button" class="boton" id="but_buscar" value="<axis:alt f="axisadm205" c="BT_BUSCAR" lit="100797" />" onclick="f_but_buscar()" />
                                    </td>
                            </axis:visible>
                            
                           </tr>
                             
                              
                        </table>
                        <div class="separador">&nbsp;</div>   
                        </tr>
                    </table>
                    
            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm205" c="LIT_RESULTAT" lit="1000345" /></div>
           <!-- IAX -->
           
            <table class="seccion">
                 <tr>
                    <td>
                        <c:set var="title0"><axis:alt f="axisadm205" c="NRESOL" lit="9903489"/></c:set>
                        <c:set var="title1"><axis:alt f="axisadm205" c="CAGENTE" lit="9909330"/></c:set>
			            <%-- INI - IAXIS-3288 - JLTS - 20/06/2019 Se adiciona el TTESTADO y se ajustan los números de title--%>
                        <c:set var="title2"><axis:alt f="axisadm205" c="TTESTADO" lit="100587"/></c:set>
                        <c:set var="title3"><axis:alt f="axisadm205" c="MAIL" lit="9909542"/></c:set>
                        <c:set var="title4"><axis:alt f="axisadm205" c="IVIGEN" lit="9906570"/></c:set>
                        <c:set var="title5"><axis:alt f="axisadm205" c="FVIGEN" lit="9909543"/></c:set>
                        <c:set var="title6"><axis:alt f="axisadm205" c="MESES" lit="9900846"/></c:set>
                        <c:set var="title7"><axis:alt f="axisadm205" c="DIASAVIS" lit="9909544"/></c:set>
                        <c:set var="title8"><axis:alt f="axisadm205" c="ICERT" lit="9909545"/></c:set>
                        <c:set var="title9"><axis:alt f="axisadm205" c="FCERT" lit="9909546"/></c:set>
                        <c:set var="title10"><axis:alt f="axisadm205" c="AVISOSCERT" lit="9909547"/></c:set>
                        <c:set var="title11"><axis:alt f="axisadm205" c="MOD" lit="9000724"/></c:set>

                        <div class="displayspace">
                            <display:table name="${axisadm205_plListaVersionesDian}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" requestURI="axis_axisadm205.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column headerClass="headwidth5 sortable" title=" " media="html" autolink="false" >
                                    <div class="dspIcons">
                                     <input value="${miListaId['SRDIAN']},${miListaId['NRESOL']},${miListaId['CAGENTE']},${miListaId['CGRUPO']},${miListaId['CACTIVI']}" type="radio" id="radioSelect" name="radioSelect"/></div>
                                </display:column>
                                
                                <display:column title="${title0}" sortable="true" sortProperty="NRESOL" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId['NRESOL']}</a></div>
                                </display:column>
                                
                                <display:column title="${title1}" sortable="true" sortProperty="CAGENTE" headerClass="sortable"  media="html" autolink="false" > 
                                    <div class="dspText">${miListaId['TSUCURSAL']}</div>
                                </display:column>
                                <display:column title="${title2}" sortable="true" sortProperty="TTESTADO" headerClass="sortable"  media="html" autolink="false" > 
                                    <div class="dspText">${miListaId['TTESTADO']}</div>
                                </display:column>
                                <display:column title="${title3}" sortable="true" sortProperty="MAIL" headerClass="sortable"  media="html" autolink="false" > 
                                    <div class="dspText">${miListaId['TCENVCORR']}</div>
                                </display:column>
                                
                                <display:column title="${title4}" sortable="true" sortProperty="IVIGEN" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">
                                        <fmt:formatDate value="${miListaId['FINIVIG']}" pattern='dd/MM/yyyy'/>
                                    </div>
                                </display:column>
                                
                                <display:column title="${title5}" sortable="true" sortProperty="FVIGEN" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">
                                        <fmt:formatDate value="${miListaId['FFINVIG']}" pattern='dd/MM/yyyy'/>
                                    </div>
                                </display:column>
                                
                                <display:column title="${title6}" sortable="true" sortProperty="MESES" headerClass="sortable"  media="html" autolink="false" > 
                                    <div class="dspText">${miListaId['NAVISO']}</div>
                                </display:column>
                                
                                <display:column title="${title7}" sortable="true" sortProperty="DIASAVIS" headerClass="sortable"  media="html" autolink="false" > 
                                    <div class="dspText">${miListaId['NAVISO']}</div>
                                </display:column>
                                
                                <display:column title="${title8}" sortable="true" sortProperty="ICERT" headerClass="sortable"  media="html" autolink="false" > 
                                    <div class="dspText">${miListaId['NINICIAL']}</div>
                                </display:column>
                                
                                 <display:column title="${title9}" sortable="true" sortProperty="FCERT" headerClass="sortable"  media="html" autolink="false" > 
                                    <div class="dspText">${miListaId['NFINAL']}</div>
                                </display:column>
                                
                                 <display:column title="${title10}" sortable="true" sortProperty="NCERTAVI" headerClass="sortable"  media="html" autolink="false" > 
                                    <div class="dspText">${miListaId['NCERTAVI']}</div>
                                </display:column>
                                <display:column title="${title11}" sortable="false" headerClass="sortable" media="html" autolink="false">
			                    <%-- FIN - IAXIS-3288 - JLTS - 20/06/2019 Se adiciona el TTESTADO y se ajustan los números de title--%>
                                    <div class="dspIcon">
                                         <a href="javascript:f_but_editar('${miListaId['SRDIAN']}','${miListaId['NRESOL']}','${miListaId['CAGENTE']}','${miListaId['CGRUPO']}','${miListaId['CACTIVI']}')">
                                         <img border="0" alt="<axis:alt f="axisadm205" c="EDITAR" lit="100002" />" 
                                              title="<axis:alt f="axisadm205" c="EDITAR" lit="100002" />" src="images/lapiz.gif"/>
                                         </a>
                                    </div>
                                </display:column>
                            </display:table>
                        </div>
                    </td>
                </tr>
            </table>        
                       
                    </td>
                </tr>
                <tr>                    
                </tr>  
            </table>
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm205</c:param>
                <c:param name="f">axisadm205</c:param>
                <c:param name="__botones">salir<axis:visible f="axisadm205" c="BT_NUEVO">,nuevo</axis:visible><axis:visible f="axisadm205" c="BT_ACEPTAR">,aceptar</axis:visible></c:param>
            </c:import>
    </form>
<c:import url="../include/mensajes.jsp" />
</body>
</html>

