<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%/*
*  Fichero: axisadm003.jsp
*  Detalle recibo
*
*  Fecha: 07/07/2008
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="axis.mvc.control.AbstractDispatchAction"%>
<%@ page import="axis.service.axis.AxisBaseService"%>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axisadm003" c="TITULO" lit="1000564"/></title> <%-- CONSULTA DE DATOS DE UN RECIBO --%>
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
    <% 
    String saltarPila = String.valueOf(request.getSession().getAttribute("saltarRebuts"));

    String saltar = "0";
    if (axis.service.axis.AxisBaseService.isEmpty(saltarPila) || saltarPila.equals("null"))
        saltar ="1";    
    %>
    
   <c:set var="saltar"><%=saltar%></c:set>
   <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {     
            // Desplegar datos recibo
            /*objEstilos.toggleDisplay("datos_recibo", document.getElementById("datos_recibo_parent"));
            objEstilos.toggleDisplay("movimientos_recibo", document.getElementById("movimientos_recibo_parent"));
            objEstilos.toggleDisplay("importes_recibo", document.getElementById("importes_recibo_parent"));
            */
	    // INI - IAXIS-3590 - HB - 24/04/2019
        	 f_cargar_propiedades_pantalla('axisadm003');
				// Inicio IAXIS-3591 17/07/2019
				// Comentado por error en servicio
               /*try{
               f_actualiza_evoluprov("${__formdata.OB_IAX_GENPOLIZA.SSEGURO}","${__formdata.NESCENA}",null);
				}
				catch(ErrorVisibilidad){
				  null;
				}*/
				// Fin IAXIS-3591 17/07/2019
            // FIN - IAXIS-3590 - HB - 24/04/2019
            // Desplegar la subsección contenida en el request parameter "subseccion"
            <% 
            if (request.getAttribute("subseccion") != null && !"null".equals(request.getAttribute("subseccion")) && !"".equals(request.getAttribute("subseccion"))) { 
            %>       
                var subseccion = '<%=request.getAttribute("subseccion")%>';                        

                
                if (objUtiles.utilStartsWith(subseccion, "importes_detallados") && subseccion != "importes_detallados_recibo") {
                    objEstilos.toggleDisplay("importes_detallados_recibo", document.getElementById("importes_detallados_recibo_parent"));
                    objEstilos.toggleDisplay(subseccion, document.getElementById(subseccion + "_parent"));
                }else{
                   objEstilos.toggleDisplay(subseccion, document.getElementById(subseccion + "_parent"));
                }
                
                
            <% } %>
            
            f_cargar_propiedades_pantalla();
	  // INI - IAXIS-3590 - HB - 24/04/2019  
        }
        function f_actualiza_evoluprov(PSSEGURO,PNESCENA,PTABLAS){
            try{
            	/*  objAjax.invokeAsyncCGI("axis_axisadm205.do", callbackAjaxSelectedGrupo,
            			 "operation=ajax_selected_grupo", obj, objJsMessages.jslit_actualizando_registro); */
              objAjax.invokeAsyncCGI("axis_axisadm003.do", 
              callbackAjaxActualizaEvoluProv, "operation=actualiza_evoluprov&PSSEGURO=" + PSSEGURO 
              + "&TABLAS=" + PTABLAS + "&PNESCENA=" +  PNESCENA,  this,objJsMessages.jslit_actualizando_registro);
              
            } catch (e) {
              if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }              
           }
        function callbackAjaxActualizaEvoluProv(ajaxResponseText){
            try {
               var doc = objAjax.domParse(ajaxResponseText);
               if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {
                  var table = document.getElementById("evoluprovmatseg");
                  var tbody = table.getElementsByTagName("tbody")[0];
                  var tr = tbody.getElementsByTagName("tr");
					var vacio = 0;
                  objLista.borrarFilasDeLista ("evoluprovmatseg", "7",  '<axis:alt f="axisadm003" c="MENSA2" lit="1000254"/>');
                  for (var i = 0; i < objDom.numeroDeTags(doc, "NANYO") ; i++) {
                     var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                     var newtr = objLista.crearNuevaFila(rowstyle);
                     var newtd = new Array(7);

			 var valdat = 0;
           <axis:visible f="${pantalla}" c="NANYO">			 
                       newtd[0] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NANYO"), i, 0));
                       valdat = 1;
			 </axis:visible>
           <axis:visible f="${pantalla}" c="FPROVMAT">						 
                       newtd[1] = objLista.addTextoEnLista(objUtiles.formateaTimeStamp2(objDom.getValorNodoDelComponente(doc.getElementsByTagName("FPROVMAT"), i, 0)));
			 valdat = 1;
			 </axis:visible>
			 <axis:visible f="${pantalla}" c="IPROVMAT">
                       newtd[2] = objLista.addNumeroEnLista(objNumero.formateaNumeroCero(objDom.getValorNodoDelComponente(doc.getElementsByTagName("IPROVMAT"), i, 0), true));
			 valdat = 1;
			 </axis:visible>
           <axis:visible f="${pantalla}" c="PRESCATE">			 
                       newtd[3] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("PRESCATE"), i, 0));
			 valdat = 1;
			 </axis:visible>
			 <axis:visible f="${pantalla}" c="PINTTEC">
                       newtd[4] = objLista.addTextoEnLista(objNumero.formateaNumeroCero(objDom.getValorNodoDelComponente(doc.getElementsByTagName("PINTTEC"), i, 0), true));
			 valdat = 1;
			 </axis:visible>
			 <axis:visible f="${pantalla}" c="IVALRES">
                       newtd[5] = objLista.addTextoEnLista(objNumero.formateaNumeroCero(objDom.getValorNodoDelComponente(doc.getElementsByTagName("IVALRES"), i, 0), true));
			 valdat = 1;
			 </axis:visible>
			 <axis:visible f="${pantalla}" c="IPRIMA">
                       newtd[6] = objLista.addTextoEnLista(objNumero.formateaNumeroCero(objDom.getValorNodoDelComponente(doc.getElementsByTagName("IPRIMA"), i, 0), true));                        
			 valdat = 1;
			 </axis:visible>
					   
			 if ( valdat == 1 ) {
			    objLista.borrarFilaVacia(tbody, tr);
                          objLista.addNuevaFila(newtd, newtr, tbody);
		            vacio = 1;
			 }	 
                  }
					
		    if ( vacio == 0 ) 
		       objLista.borrarFilasDeLista ("evoluprovmatseg", "7", '<axis:alt f="axisadm003" c="MENSA2" lit="1000254"/>');
                  }
            
              } catch (e) {
                 if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
              } 
	      // FIN - IAXIS-3590 - HB - 24/04/2019               
        }
        
        function f_dep_validado()
        {
              document.miForm.CVALIDADO.value = document.getElementById("CVALIDADO").checked ? "1" : "0";
              f_carga_dependencias();
              revisarEstilos();
             
        }
        
        function  f_but_1000081(){  
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario ("axis_axisadm003.do", "guardar", document.miForm, "_self");            
            }
        }
        function  f_but_9904580(){  
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario ("axis_axisadm003.do", "sincronizar", document.miForm, "_self");            
            }
        }
        
        
         function f_formatdate(entrada,title){        
             var jDate = new JsFecha();
                if(entrada.value.length>0){
                    entrada.value=jDate.formateaFecha(entrada.value);
                
                    if(jDate.validaFecha(entrada.value)){
                        entrada.value=jDate.formateaFecha(entrada.value);
                    }else{
                        alert("<axis:alt f="axisadm003" c="ALERT_FORMDATE" lit="1000421"/>");
                    }
                }
            }          

        
        function f_but_salir() {
            var ori = document.miForm.origen.value;

            if (!objUtiles.estaVacio(ori)){
                parent.f_cerrar_modal('axisadm003');
            }else{
                <c:choose>
                  <c:when test="${empty saltar || saltar == 1}">
                    var params;
                    
                    if (!objUtiles.estaVacio(objDom.getValorPorId("BUSCA"))){
                          params = "buscar=true&NRECIBO=";
                    }else{
                          params = "buscar=false";
                    }
                    objUtiles.ejecutarFormulario ("axis_axisadm002.do?"+params, "form", document.miForm, "_self");
                  </c:when>
                  <c:otherwise>
                    objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm003", "cancelar", document.miForm, "_self");
                  </c:otherwise>
                </c:choose>
          }
       }
       
function mostrar(nombreCapa,nombreDIV){ 
  objUtiles.scrollPoll(nombreCapa,nombreDIV);
} 
function ocultar(nombreCapa){ 
    document.getElementById(nombreCapa).style.visibility="hidden"; 
} 
 
//INI -  3482 SGM  17/04/2019  se agrega columna a apartado gestion agenda
function cargarArchivos (idObservacion,nmovobs) {
	objUtiles.abrirModal("axisgedox", "src","modal_axisgedox.do?operation=form&IDOBS="+idObservacion);
}
function f_cerrar_axisgedox() {
    objUtiles.cerrarModal("axisgedox");
}
//FIN - 3482 SGM  17/04/2019  se agrega columna a apartado gestion agenda


        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
     if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);    
        }
        
        function f_abrir_axisadm001(){
            objUtiles.ejecutarFormulario ("axis_axisadm002.do?REC_miOffsetRecibos"+document.miForm.REC_miOffsetRecibos.value, "form", document.miForm, "_self", objJsMessages.jslit_cargando);    
        }
        
        
      
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_aceptar_modal(cual, params) {
            f_cerrar_modal(cual);
        }
        
        
        function mostrar_ocultar(nombreCapa){ 
            <c:if test="${empty __configform.axisadm003__NOIMPDUP__visible || __configform.axisadm003__NOIMPDUP__visible == 'false'}">
                if(document.getElementById(nombreCapa).style.visibility=="visible"){
                    document.getElementById(nombreCapa).style.visibility="hidden"; 
                }else{
                    document.getElementById(nombreCapa).style.visibility="visible"; 
                }
            </c:if>
            <c:if test="${__configform.axisadm003__NOIMPDUP__visible == 'true'}">
                f_imprimir_rec('RECIBO');
            </c:if>
        }
        
        function f_imprimir_rec(TTIPO){
            var NRECIBO = objDom.getValorPorId("NRECIBO");
            var SSEGURO = objDom.getValorPorId("SSEGURO");
            objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_recibo&CSSEGURO="+SSEGURO+"&CNRECIBO="+NRECIBO+"&CTIPO="+TTIPO);
        }
        
        function f_cerrar_axisimprimir() {
            objUtiles.cerrarModal("axisimprimir");
            //Recarreguem per a mostrar el nou document generat
            objUtiles.ejecutarFormulario ("axis_axisadm003.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);  
            
        }
        
        function f_imprimir_recdup(NRECIBO,NDOCUME){
            var SSEGURO = objDom.getValorPorId("SSEGURO");
            objAjax.invokeAsyncCGI("axis_axisadm003.do", callbackAjaxActNimp, 
                "operation=act_imp&PNRECIBO=" + NRECIBO+"&PNDOCUME=" + NDOCUME, this, objJsMessages.jslit_cargando,NDOCUME);
        }
    
        function callbackAjaxActNimp(ajaxResponseText, NDOCUME) {
            var doc = objAjax.domParse(ajaxResponseText);
            var NRECIBO = objDom.getValorPorId("NRECIBO");
            var SSEGURO = objDom.getValorPorId("SSEGURO");
            if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_recibo&CSSEGURO="+SSEGURO+"&CNRECIBO="+NRECIBO+"&CNDOCUME="+NDOCUME+"&CTIPO=RECIBO_DUPLICA");
            } 
        }
        
        /************************** GESTION DE RECIBOS *****************************/
           /* Realiza una llamada a F_GET_ACCIONES para saber si el recibo seleccionado tiene acciones.
            * Si tiene exactamente 1 accin a realizar, devuelve va Ajax su CFORM (pantalla destino de la accin)
            * para que la pantalla AXISCTR020 pueda navegar a esa pantalla. Si no, no devolver CFORM, y la pantalla
            * AXISCTR020 sabr que tiene que abrir el modal AXISADM028 para escoger accin.
            */
            function f_gestionar_recibos(NRECIBO, TESTREC) {
                objAjax.invokeAsyncCGI("modal_axisadm028.do", callbackAjaxGestionarRecibos, 
                    "operation=gestionar_recibos&NRECIBO=" + NRECIBO, this, null, TESTREC);
            }
            
            // Modal gestin de cobro
            function f_abrir_axisadm028 (NRECIBO, TESTREC) {
                objUtiles.abrirModal("axisadm028", "src", "modal_axisadm028.do?operation=init&NRECIBO=" + NRECIBO + "&TESTREC=" + TESTREC, 800, 420);
            }
            function f_cerrar_axisadm028() {
                objUtiles.cerrarModal("axisadm028");
            } 
            
            function f_aceptar_axisadm028(NRECIBO, CFORM) {
                try {
                    objUtiles.cerrarModal("axisadm028");
                } catch (e) {}
                objDom.setValorPorId("NRECIBO", NRECIBO);
                objUtiles.ejecutarFormulario ("axis_axisadm003.do?CFORM=" + CFORM, "gestion_cobros", document.miForm, "_self", objJsMessages.jslit_cargando);  
            }
            /* INI IAXIS-3590 - JLTS - 26/04/2019 Consulta Tomadores*/
            function f_consultar_per(SPERSON,CAGENTE,NRECIBO){
              SPERSON = "${__formdata.SPERSON}";
              miNRECIBO = "${__formdata.NRECIBO}";
              CAGENTE = "${__formdata.CAGENTE}";
              //alert("SPERSON="+SPERSON+" CAGENTE="+CAGENTE+" miNRECIBO="+miNRECIBO);
              objUtiles.ejecutarFormulario("axis_axisadm003.do?SPERSON_AUX="+SPERSON+"&SPERSON="+SPERSON+"&CAGENTE=19000"+"&miNRECIBO="+miNRECIBO, "consultarPer", document.miForm, "_self", objJsMessages.jslit_cargando);
 	        }
            /* INI IAXIS-3590 - JLTS - 26/04/2019 Consulta Tomadores*/

            
            /* Callback de la llamada a F_GET_ACCIONES para saber si el recibo seleccionado tiene acciones.
            * Si tiene exactamente 1 accin a realizar, devuelve va Ajax su CFORM (pantalla destino de la accin)
            * para que la pantalla AXISCTR020 pueda navegar a esa pantalla. Si no, no devolver CFORM, y la pantalla
            * AXISCTR020 sabr que tiene que abrir el modal AXISADM028 para escoger accin.
            */
            function callbackAjaxGestionarRecibos(ajaxResponseText, TESTREC) {
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NRECIBO")[0])) {
                        var NRECIBO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NRECIBO"), 0, 0);                                                
                        
                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("PSALTAR")[0])) {
                            var PSALTAR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PSALTAR"), 0, 0);
                            if (PSALTAR == 0) {
                                alert("<axis:alt f='axisadm003' c='ALERTSALTAR' lit='9000790'/>");    
                            } else if (PSALTAR == 1) {
                                if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CFORM")[0])) {
                                    var CFORM = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CFORM"), 0, 0);
                                    f_aceptar_axisadm028(NRECIBO, CFORM);                    
                                }
                            } else {    
                                f_abrir_axisadm028(NRECIBO, TESTREC);
                            }
                        }
                    }
                } 
            }
            
            
            
            /*******************************************
                  Formateo Numeros
             ********************************************/
             function validarNumeros(IMPORTE){
                 if (!objUtiles.estaVacio(IMPORTE)){
                     IMPORT = objValidador.valorFormateadoCampoNumerico(IMPORTE, true, true);
                     if(objNumero.validaNumero(IMPORT, true)){
                         return this.formateaNumeroCero(IMPORT, true);
                     }
                     else{
                         return   '';
                     }
                 }
                 else return IMPORTE;
             }
             
            function formateaNumeroCero(entrada, isDecimal){
                // es crida al reformateixador  ###.###,00
                var fnum=objNumero.formateaNumero(entrada,isDecimal);
                if(entrada.indexOf(objNumero.getSeparadorDecimales())<0){
                    fnum += objNumero.getSeparadorDecimales() + '00';
                }
                // si es tracta d'un 0 el converteix a 0,00
                if(fnum=='0') fnum += objNumero.getSeparadorDecimales() + '00';
                return fnum;
    
            }
             
            function f_formatear(thiss){
                thiss.value = validarNumeros(thiss.value);
            }
            
            function f_calculoma(thiss){               
                f_formatear(thiss);
            }
               
           <%--INI  IAXIS 3482 SGM  17/04/2019  se agrega columna a apartado gestion agenda --%>
           function f_gestioagenda(IDOBS, modificacion, nmovobs){
            NRECIBO = document.miForm.NRECIBO.value;
             //int nmovobs = document.miForm.NMOVOBS.value;//SGM
            //console.log(nmovobs);
             objUtiles.abrirModal("axisagd002", "src", "modal_axisagd002.do?operation=init&IDOBS="+IDOBS+"&CTIPAGD=2&NRECIBO="+NRECIBO+"&MODIFICACION="+modificacion+"&NMOVOBS="+nmovobs);
	     <%--FIN  IAXIS 3482 SGM  17/04/2019  se agrega columna a apartado gestion agenda--%>
           }
           
           function f_but_aceptar_axisagd002(){
           f_cerrar_modal('axisagd002');
       	 objUtiles.ejecutarFormulario ("axis_axisadm003.do?subseccion=DSP_AGENDA", "form", document.miForm, "_self");
           }
            
            
         //18176 
           function f_agd_gestioagenda(IDAPUNTE,IDAGENDA,CMODO) {    
               param = "&IDAPUNTE="+IDAPUNTE+"&IDAGENDA="+IDAGENDA+"&CMODO="+CMODO;    
               objUtiles.abrirModal('axisagd004', "src", "modal_axisagd004.do?operation=init" + param); 
            }
            
           function f_agd_gestioagenda_alta(IDAPUNTE,IDAGENDA,CMODO) {    
               var NRECIBO = objDom.getValorPorId("NRECIBO");
               param = "&IDAPUNTE="+IDAPUNTE+"&IDAGENDA="+IDAGENDA+"&CMODO="+CMODO+"&CCLAGD=2&TCLAGD="+NRECIBO+"&TCLAGD_OUT="+NRECIBO;   
               objUtiles.abrirModal('axisagd004', "src", "modal_axisagd004.do?operation=init" + param); 
            }
            
           function f_cerrar_modal_004(PANTALLA) {
              objUtiles.cerrarModal(PANTALLA);   
              objUtiles.ejecutarFormulario ("axis_axisadm003.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);  
            }
            //18176
	    
           function f_borrar_agenda(IDOBS){
            // Antes de proceder a borrar el registro, pedimos confirmacion
             var confirma=confirm(objJsMessages.jslit_confirma_borrar);
                if (confirma) {
                       objDom.setValorPorId("IDOBS", IDOBS);
                       objUtiles.ejecutarFormulario ("axis_axisadm003.do?subseccion=DSP_AGENDA", "borrar_agenda", document.miForm, "_self", objJsMessages.jslit_cargando);     
      
                }
            
            
            }
        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">

    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisadm001|<axis:alt f="axisadm003" c="TITULOAXISADM001" lit="1000552"/>#axisagd002|<axis:alt f="axisadm003" c="TITULOAXISAGD002" lit="9001247"/></c:param>
        </c:import>    
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisadm003" c="TITULOAXISADM003" lit="1000564"/></c:param>     <%-- CONSULTA DE DATOS DE UN RECIBO --%>
                <c:param name="formulario"><axis:alt f="axisadm003" c="FORMAXISADM001" lit="1000564"/></c:param> <%-- CONSULTA DE DATOS DE UN RECIBO --%>
                <c:param name="form">axisadm003</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisadm003" c="TITULOIMPRIMIR" lit="1000205" /></c:param>
            <c:param name="nid" value="axisimprimir"></c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisadm003" c="TITULOAXISADM028" lit="1000568" /></c:param>
            <c:param name="nid" value="axisadm028"></c:param>
        </c:import>    
          <!-- 18176 -->
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisagd004|<axis:alt f="axisadm003" c="MOD_PANT_AXISAGD004" lit="9001769"/></c:param>
        </c:import>
         <!-- INI IAXIS 3482 SGM  17/04/2019  se agrega columna a apartado gestion agenda -->
        	<c:import url="../include/modal_estandar.jsp">
    	<c:param name="nid_y_titulo">axisctr019|<axis:alt f="axisctr020" c="MOD_PANT_AXICTR019" lit="1000188"/>#axisimprimir|<axis:alt f="axisctr020" c="MOD_PANT_IMPRIMIR" lit="1000205"/>|true#axisgedox|<axis:alt f="${pantalla}" c="LIT_GEDOX" lit="1000201"></axis:alt>#axisctr023|<axis:alt f="axisctr020" c="MOD_PANT_AXISCTR023" lit="1000191"/>#axisctr025|<axis:alt f="axisctr020" c="MOD_PANT_AXISCTR025" lit="140360"/>#axisctr029|<axis:alt f="${pantalla}" c="LIT_PANTALLA_DETASE" lit="1000195"/>#axisctr148|<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISCTR148" lit="1000199"/>#axisctr030|<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISCTR030" lit="1000196"/>#axisctr039|Suplementos#axisadm028|<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISADM028" lit="1000568"/>#axisopenurl||<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISOPENURL" lit="1000568"/></c:param>
        </c:import>
       <!-- FIN IAXIS 3482 SGM  17/04/2019  se agrega columna a apartado gestion agenda --> 
     

        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="origen" value="${__formdata.origen}"/>
        <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.OB_IAX_GENPOLIZA.SSEGURO}"/>
        <input type="hidden" name="NRECIBO" id="NRECIBO" value="${__formdata.NRECIBO}"/>
        <input type="hidden" name="PSALTAR" id="PSALTAR" value="${__formdata.PSALTAR}"/>
        <input type="hidden" name="IDOBS" id="IDOBS" value="${__formdata.IDOBS}"/>
	<%--IAXIS 3482 SGM  17/04/2019  se agrega columna a apartado gestion agenda --%>
        <input type="hidden" name="NMOVOBS" id="NMOVOBS" value="${__formdata.NMOVOBS}"/>
        <input type="hidden" name="FICHERO" id="FICHERO" value="${__formdata.FICHERO}"/>
        <%-- INI -IAXIS-4153 - JLTS 07/06/2019 Se adiciona el literal 2000095 --%>
        <input type="hidden" name="CESTABONO" id="CESTABONO" value="${__formdata.CESTABONO}"/>
        <%-- FIN -IAXIS-4153 - JLTS 07/06/2019 Se adiciona el literal 2000095 --%>
        <input type="hidden" name="BUSCA" id="BUSCA" value="${__formdata.BUSCA}"/>
        <input type="hidden" name="CESTREC" id="CESTREC" value="${__formdata.OB_IAX_RECIBOS.CESTREC}"/>
        <input type="hidden" name="REC_miOffsetRecibos" id="REC_miOffsetRecibos" value="${requestScope.REC_miOffsetRecibos}"/>
     
        <!--SPROCES DE LA PANTALLA AXISCTR079 -->
        <input type="hidden" name="SPROLIQ_SEL" id="SPROLIQ_SEL" value="${__formdata.SPROLIQ_SEL}"/>
        
        <input type="hidden" name="CTIPREC" id="CTIPREC" value="${__formdata.OB_IAX_RECIBOS.CTIPREC}"/>
        <input type="hidden" name="CSUBTIPREC" id="CSUBTIPREC" value="${__formdata.OB_IAX_RECIBOS.CSUBTIPREC}"/>
        
        <input type="hidden" name="CTIPNEGOC" id="CTIPNEGOC" value="${__formdata.OB_IAX_RECIBODET.CTIPNEGOC}"/>
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                     <div class="separador">&nbsp;</div>
                    <div class="titulo">
                        <img src="images/flecha.gif"/><b>&nbsp;<axis:alt f="axisadm003" c="DAT_RECIBO" lit="1000565"/> </b>
                    <% if (session.getAttribute("OCULTAR_LUPA_RECIBOS") == null) { %>
                        <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisadm003" c="BUSCAR" lit="100797" />" onclick="f_abrir_axisadm001();" style="cursor:pointer"/>                
                    <% } %>
                    </div>
                    
                    
                    
                    <table class="seccion" align="center">
                        <tr>
                            <td align="left">
                                <table class="area" align="center">
                                    <%-- DATOS RECIBO --%>
                                    <tr>
                                        <th style="width:100%;height:0px"></th>
                                    </tr>
                                    <tr>
                                    
                                        <td class="campocaja">
                                            <axis:visible c="IMP_RECIBO" f="axisadm003">
                                            
                                            <div style="float:right;" id="BT_IMPRIMIR" name="BT_IMPRIMIR">
                                                <img border="0" alt="<axis:alt f="axisadm003" c="BT_IMPRIMIR" lit="100001"/>"  
                                                onclick="javascript:mostrar_ocultar('SECCION_GESTION');" 
                                                title="<axis:alt f="axisadm003" c="BT_IMPRIMIR" lit="100001"/>" 
                                                src="images/print.gif"/>
                                            </div>
                                            
                                            <div style="float:right;" id="BT_ACCION" name="BT_ACCION">
                                              <c:if test="${!empty __formdata.PSALTAR && __formdata.PSALTAR != '0'}">
                                                <div class="dspIcons"><img border="0" alt="${title9}" title="${title9}" src="images/find.gif" width="11px" height="11px"
                                                style="cursor:pointer;" onclick="f_gestionar_recibos('${__formdata.NRECIBO}', '${__formdata.OB_IAX_RECIBOS.TESTREC}')"/></div>
                                              </c:if>
                                            </div>
                                            
                                            <div id="SECCION_GESTION"
                                             style="border: 1px solid #006000;background-color:#ffffff;border-top-width:2px;border-right-width:2px;border-bottom-width:2px;border-left-width:2px;position:absolute;width:140px;height:45px;top:85px;right:60px;visibility:hidden;">
                                                    <%-- INICIO SECCION --%>
                                                    <table class="area" align="center">
                                                       <tr>
                                                          <th style="width:100%;height:0px"></th>
                                                          
                                                       </tr>
                                                       <axis:visible c="SECCION_IMP_RECIBO" f="axisadm003">
                                                       <tr>
                                                       <td class="titulocaja">
                                                       <a href="javascript:ocultar('SECCION_GESTION');f_imprimir_rec('RECIBO')">  
                                                        <axis:alt f="axisadm003" c="SECCION_GESTION" lit="9901037"/>
                                                        </a>
                                                        </td>
                                                          
                                                       </tr>
                                                       </axis:visible>
                                                       <axis:visible c="SECCION_IMP_ORIGINAL" f="axisadm003">
                                                        <tr>
                                                        <td class="titulocaja">
                                                        <a href="javascript:ocultar('SECCION_GESTION');f_imprimir_rec('RECIBO_DUPLICA')">
                                                        <axis:alt f="axisadm003" c="RECIBO_DUPLICA" lit="9901038"/>
                                                        </a>
                                                        </td>
                                                         
                                                       </tr>
                                                       </axis:visible>
                                                  
                                                    </table>
                                            </div>
                                            </axis:visible>
                                            
                                            <img id="datos_recibo_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('datos_recibo', this)" style="cursor:pointer"/> 
                                          <b><axis:alt f="axisadm003" c="DAT_RECIBO" lit="1000565"/></b>&nbsp;&nbsp;<axis:alt f="axisadm003" c="NRECIBO" lit="800636"/> ${__formdata.NRECIBO}&nbsp;-&nbsp;<axis:alt f="axisadm003" c="FEFECTO" lit="100883"/> <fmt:formatDate value="${__formdata.OB_IAX_RECIBOS.FEFECTO}" pattern="dd/MM/yyyy"/>&nbsp;-&nbsp;<axis:alt f="axisadm003" c="FVENCIM" lit="100885"/> <fmt:formatDate value="${__formdata.OB_IAX_RECIBOS.FVENCIM}" pattern="dd/MM/yyyy"/>&nbsp;-&nbsp;<axis:alt f="axisadm003" c="datos_recibo_parent" lit="100563"/> <fmt:formatNumber pattern="${__formatNumberPatterns[CMONEDAPROD]}" value="${__formdata.OB_IAX_RECIBOS.IMPORTE}"/><axis:visible c="TESTREC_RES" f="axisadm003"> -&nbsp;<axis:alt f="axisadm003" c="TESTREC_RES" lit="1000553"/> : ${__formdata.OB_IAX_RECIBOS.TESTREC}</axis:visible>
                                            <hr class="titulo"/>
                                            
                                        </td>
                                            
                                    </tr>   
                                    
                                    <tr id="datos_recibo_children" style="display:none">
                                        <td align="left">
                                             <table class="area" align="center">
                                                 <tr>
                                                    <th style="width:20%;height:0px"></th>
                                                    <th style="width:20%;height:0px"></th>
                                                    <th style="width:20%;height:0px"></th>
                                                    <th style="width:20%;height:0px"></th>                                                    
                                                    <th style="width:20%;height:0px"></th>                                                    
                                                </tr>
                                                <tr>
                                                    <%-- Empresa --%>
                                                    <axis:ocultar c="TEMPRES" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" id="LIT_TEMPRES">
                                                        <b><axis:alt f="axisadm003" c="TEMPRES" lit="101619"/></b>
                                                    </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar c="TCOMPANI" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" id="LIT_TCOMPANI">
                                                        <b><axis:alt f="axisadm003" c="TCOMPANI" lit="9000600"/></b>
                                                    </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar c="TACTIVI" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" id="LIT_TACTIVI">
                                                        <b><axis:alt f="axisadm003" c="TACTIVI" lit="103481"/></b>
                                                    </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar c="TRAMO" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" id="LIT_TRAMO">
                                                        <b><axis:alt f="axisadm003" c="TRAMO" lit="100784"/></b>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Producto --%>
                                                    <axis:ocultar c="TROTULO" f="axisadm003" dejarHueco="false">
                                                     <td class="titulocaja" id="LIT_TROTULO">
                                                        <b><axis:alt f="axisadm003" c="TROTULO" lit="100829"/></b>
                                                    </td>    
                                                    </axis:ocultar>
                                                </tr>
                                                <tr>
                                                    <%-- Empresa --%>
                                                    <axis:ocultar c="TEMPRES" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="TD_TEMPRES">
                                                        <input type="text" class="campo campotexto campodisabled" id="TEMPRES" name="TEMPRES" <axis:atr f="axisadm003" c="TEMPRES" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_GENPOLIZA.TEMPRES}" readonly="readonly"/>
                                                        
                                                    </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar c="TCOMPANI" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="TD_TCOMPANI">
                                                        <input type="text" class="campo campotexto campodisabled" id="TCOMPANI" name="TCOMPANI" <axis:atr f="axisadm003" c="TCOMPANI" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_GENPOLIZA.TCOMPANI}" readonly="readonly"/>
                                                        
                                                    </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar c="TACTIVI" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="TD_TACTIVI">
                                                        <input type="text" class="campo campotexto campodisabled" id="TACTIVI" name="TACTIVI" <axis:atr f="axisadm003" c="TACTIVI" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_GENPOLIZA.TACTIVI}" readonly="readonly"/>
                                                        
                                                    </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar c="TRAMO" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="TD_TRAMO">
                                                        <input type="text" class="campo campotexto campodisabled" id="TRAMO" name="TRAMO" <axis:atr f="axisadm003" c="TRAMO" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_GENPOLIZA.TRAMO}" readonly="readonly"/>
                                                        
                                                    </td>
                                                    </axis:ocultar>
                                                    
                                                    <%-- Producto --%>
                                                    <axis:ocultar c="TROTULO" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" colspan="2" id="TD_TROTULO">
                                                        <input type="text" class="campo campotexto campodisabled" id="TROTULO" name="TROTULO" <axis:atr f="axisadm003" c="TROTULO" a="modificable=false&obligatorio=false"/> size="15" style="width:95%"
                                                        value="${__formdata.OB_IAX_GENPOLIZA.TPRODUC}" readonly="readonly"/>
                                                    </td>
                                                    </axis:ocultar>
                                                </tr>
                                                 <tr>

                                                    <%-- Número de póliza --%>
                                                    <axis:ocultar c="NPOLIZA" f="axisadm003" dejarHueco="false">
                                                     <td class="titulocaja" id="LIT_NPOLIZA">
                                                        <b><axis:alt f="axisadm003" c="NPOLIZA" lit="100624"/></b>
                                                    </td>    
                                                    </axis:ocultar>
                                                    <%-- Número certificado --%>
                                                    <axis:ocultar c="NCERTIF" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" id="LIT_NCERTIF">
                                                        <b><axis:alt f="axisadm003" c="NCERTIF" lit="100899"/><axis:alt f="axisadm003" c="NCERTIF" lit="101300"/></b>
                                                    </td> 
                                                    </axis:ocultar>
                                                    <%-- Efectod de la póliza --%>
  													<%-- INI SGM --%>
                                                    <axis:visible c="NCERTDIAN" f="axisadm003">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisadm003" c="NCERTDIAN" lit="89907051"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    <%-- FIN SGM --%>
                                                    <%-- Nombre tomador --%>
                                                    <axis:ocultar c="TNOMTOM" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" id="LIT_TNOMTOM">
                                                        <b><axis:alt f="axisadm003" c="TNOMTOM" lit="101027"/></b>
                                                    </td>  
                                                    </axis:ocultar>
                                                </tr>
                                                <tr>

                                                    <%-- Número de póliza --%>
                                                    <axis:ocultar c="NPOLIZA" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="TD_NPOLIZA">
                                                        <input type="text" class="campo campotexto campodisabled" id="NPOLIZA" name="NPOLIZA" <axis:atr f="axisadm003" c="NPOLIZA" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_GENPOLIZA.NPOLIZA}" readonly="readonly"/>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Número certificado --%>
                                                    <axis:ocultar c="NCERTIF" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="TD_NCERTIF">
                                                        <input type="text" class="campo campotexto campodisabled" id="NCERTIF" name="NCERTIF" <axis:atr f="axisadm003" c="NCERTIF" a="modificable=false&obligatorio=false"/> size="15" style="width:20%"
                                                        value="${__formdata.OB_IAX_GENPOLIZA.NCERTIF}" readonly="readonly"/>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Certificado DIAN --%>
                                                    <%-- INI SGM --%>
                                                    <axis:ocultar c="TNOMTOM" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" colspan="1" id="TD_TNOMTOM">
                                                        <input type="text" class="campo campotexto campodisabled" id="TNOMTOM" name="TNOMTOM" <axis:atr f="axisadm003" c="TNOMTOM" a="modificable=false&obligatorio=false"/> size="15" style="width:95%"
                                                        value="${__formdata.NCERTDIAN}" readonly="readonly"/>
                                                        <%--${__formdata.OB_IAX_GENPOLIZA.NNUMIDETOM}--%>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- FIN SGM --%>
                                                    <%-- Nombre tomador --%>
                                                    <axis:ocultar c="TNOMTOM" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" colspan="2" id="TD_TNOMTOM">
                                                        <%-- INI - IAXIS-3590 - JRVG - 17/06/2020 - Se cambia el origen de TD_NOMBRE --%>  
                                                        <input type="text" class="campo campotexto campodisabled" id="TNOMTOM" name="TNOMTOM" <axis:atr f="axisadm003" c="TNOMTOM" a="modificable=false&obligatorio=false"/> size="15" style="width:95%"
                                                        value="${__formdata.TD_NOMBRE}" readonly="readonly"/>
                                                        <%-- FIN - IAXIS-3590 - JRVG - 17/06/2020 - Se cambia el origen de TD_NOMBRE --%>
                                                        <%--${__formdata.OB_IAX_GENPOLIZA.NNUMIDETOM}--%>
                                                    </axis:ocultar>
                                                    <%-- INI - IAXIS-3590 - JLTS - 26/04/2019 - Se incluye la opción de consulta de la persona  --%>
                                                    <c:if test="${!empty __formdata.CAGRUPA && __formdata.CAGRUPA != 0 }">
                                                    <axis:ocultar f="axisadm003" c="BT_CON_FIND_TOM">
															<axis:ocultar f="axisadm003" c="CONSULTAR_PERSONA">
																<img c="CONSULTAR_PERSONA" id="find" border="0"
																	src="images/find.gif"
																	onclick="javascript:f_consultar_per('${__formdata.SPERSON}','${__formdata.CAGENTE}','${__formdata.NRECIBO}');"
																	style="cursor: pointer" />
															</axis:ocultar>
												    </axis:ocultar>
												    </c:if>
                                                    </td>
                                                    <%-- FIN - IAXIS-3590 - JLTS - 26/04/2019 - Se incluye la opción de consulta de la persona  --%>
                                                </tr>
                        
                                                <tr>
                                                     <%-- Delegación --%>
                                                     <axis:ocultar c="TDELEGA" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" id="LIT_TDELEGA">
                                                        <b><axis:alt f="axisadm003" c="TDELEGA" lit="1000561"/></b>
                                                    </td>      
                                                    </axis:ocultar>
                                                   
                                                    <%-- Agente --%>
                                                    <axis:ocultar c="CAGENTE" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" colspan="2" id="LIT_CAGENTE">
                                                        <b><axis:alt f="axisadm003" c="CAGENTE" lit="100584"/></b>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Gestor --%>
                                                    <axis:ocultar c="TGESTOR" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" id="LIT_TGESTOR">
                                                        <b><axis:alt f="axisadm003" c="TGESTOR" lit="1000566"/></b>
                                                    </td>   
                                                    </axis:ocultar>
                                                    <%-- Sucursal --%>
                                                    <axis:ocultar c="TSUCURSAL" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" id="LIT_TSUCURSAL">
                                                        <b><axis:alt f="axisadm003" c="TSUCURSAL" lit="9002202"/></b>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- INI IAXIS-3590 - JLTS - 01/02/2019 Cargar las comisiones del agente--%>
                                                    <%-- INI IAXIS-12960 - JRVG - 05/03/2020 bug en comisiones por cambios de emision--%>
                                                    <c:if test="${__formdata.HAYCORRETAJE==0}" >
                                                    <axis:ocultar c="PORC_COMIS" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" colspan="2" id="LIT_PORC_COMIS">
                                                        <b><axis:alt f="axisadm003" c="PORC_COMIS" lit="9907487"/></b>
                                                    </td>
                                                    </axis:ocultar>
                                                    </c:if>
                                                    <%-- FIN IAXIS-12960 - JRVG - 05/03/2020 bug en comisiones por cambios de emision--%>
                                                    <%-- FIN IAXIS-3590 - JLTS - 01/02/2019 Cargar las comisiones del agente--%>
                                                    <axis:ocultar c="TINSPECTOR" f="axisadm003" dejarHueco="false">
                                                        <td class="titulocaja" id="LIT_TINSPECTOR" >
                                                            <b><axis:alt f="axisadm003" c="TINSPECTOR" lit="9904023"/></b>
                                                        </td>
                                                    </axis:ocultar>
                                                </tr>
                                                <tr>
                                                    <%-- Delegación --%>
                                                    <axis:ocultar c="TDELEGA" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="TD_TDELEGA">
                                                        <input type="text" class="campo campotexto campodisabled" id="TDELEGA" name="TDELEGA" <axis:atr f="axisadm003" c="TDELEGA" a="modificable=false&obligatorio=false"/> size="15"  style="width:90%"
                                                        value="${__formdata.OB_IAX_RECIBOS.TDELEGA}" readonly="readonly"/>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Agente --%>
                                                    <axis:ocultar c="CAGENTE" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" colspan="2" id="TD_CAGENTE">
                                                        <input type="text" class="campo campotexto campodisabled" id="CAGENTE" name="TAGENTE" <axis:atr f="axisadm003" c="CAGENTE" a="modificable=false&obligatorio=false"/> size="15" style="width:15%"
                                                        value="${__formdata.OB_IAX_RECIBOS.CAGENTE}" readonly="readonly"/>
                                                        &nbsp;
                                                        <input type="text" class="campo campotexto campodisabled" id="TAGENTE" name="TAGENTE" size="15" <axis:atr f="axisadm003" c="TAGENTE" a="modificable=false&obligatorio=false"/> style="width:77%"
                                                        value="${__formdata.OB_IAX_RECIBOS.TAGENTE}" readonly="readonly"/>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Gestor --%>
                                                    <axis:ocultar c="TGESTOR" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="TD_TGESTOR">
                                                        <input type="text" class="campo campotexto campodisabled" id="TGESTOR" name="TGESTOR" <axis:atr f="axisadm003" c="TGESTOR" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_RECIBOS.TGESTOR}" readonly="readonly"/>
                                                    </td>    
                                                    </axis:ocultar>
                                                    <%-- Sucursal --%>
                                                    <axis:ocultar c="TSUCURSAL" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="TD_TSUCURSAL">
                                                        <input type="text" class="campo campotexto campodisabled" id="TSUCURSAL" name="TSUCURSAL" <axis:atr f="axisadm003" c="TSUCURSAL" a="modificable=false&obligatorio=false"/> size="15"  style="width:90%"
                                                        value="${__formdata.OB_IAX_RECIBOS.TSUCURSAL}" readonly="readonly"/>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- INI IAXIS-3590 - JLTS - 01/02/2019 Cargar las comisiones del agente--%>
                                                    <%-- INI IAXIS-12960 - JRVG - 05/03/2020 bug en comisiones por cambios de emision--%>
                                                    <c:if test="${ __formdata.HAYCORRETAJE==0}" >
                                                    <axis:visible c="PORC_COMIS" f="axisadm003">
                                                    <%-- Valor comisión --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto campodisabled" id="PORC_COMIS" name="PORC_COMIS" <axis:atr f="axisadm003" c="PORC_COMIS" a="modificable=false&obligatorio=false"/> size="50" style="width:90%"
                                                     <%-- Inicio Bug IAXIS- 11902 - JRVG - 24/02/2020 --%>
                                                     value="${__formdata.PORC_COMIS}" readonly="readonly"/>
                                                     <%-- Fin bug  IAXIS- 11902 - JRVG - 24/02/2020 --%>
                                                     <%-- value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.PORC_COMIS}'/>" readonly="readonly"/> --%>
                                                    </td>
                                                    </axis:visible>
                                                    </c:if>
                                                    <%-- FIN IAXIS-12960 - JRVG - 05/03/2020 bug en comisiones por cambios de emision--%>
                                                    <%-- FIN IAXIS-3590 - JLTS - 01/02/2019 Cargar las comisiones del agente--%>
                                                    <axis:ocultar c="TINSPECTOR" f="axisadm003" dejarHueco="false">
                                                        <td class="campocaja" id="TD_TINSPECTOR">
                                                            <input type="text" class="campo campotexto campodisabled" id="TINSPECTOR" name="TINSPECTOR" <axis:atr f="axisadm003" c="TINSPECTOR" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                            value="${__formdata.OB_IAX_RECIBODET.TINSPECTOR}" readonly="readonly"/>
                                                        </td>
                                                    </axis:ocultar>
                                                <tr>
                                                    <%-- Cobrador recibo --%>
                                                    <axis:ocultar c="CCOBBAN" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" id="LIT_CCOBBAN">
                                                        <b><axis:alt f="axisadm003" c="CCOBBAN" lit="1000567"/></b>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- bug 20272 - JLTS - 20121008 --%>
                                                    <%-- Descripción cobrador recibo --%>
                                                    <axis:ocultar c="TDESCRIP" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" id="LIT_TDESCRIP">
                                                        <b><axis:alt f="axisadm003" c="TDESCRIP" lit="9904301"/></b>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Gestión de cobro --%>
                                                    <axis:ocultar c="TGESCOB" f="axisadm003" dejarHueco="false">
                                                     <td class="titulocaja" id="LIT_TGESCOB">
                                                        <b><axis:alt f="axisadm003" c="TGESCOB" lit="1000568"/></b>
                                                    </td>  
                                                    </axis:ocultar>
                                                    <axis:ocultar c="TTIPCOB" f="axisadm003" dejarHueco="false">
                                                     <td class="titulocaja" id="LIT_TTIPCOB">
                                                        <b><axis:alt f="axisadm003" c="TTIPCOB" lit="151348"/></b>
                                                    </td>  
                                                    </axis:ocultar>
                                                    <%-- Tipo coaseguro --%>
                                                    <axis:ocultar c="TTIPCOA" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" id="LIT_TTIPCOA">
                                                        <b><axis:alt f="axisadm003" c="TTIPCOA" lit="100565"/><axis:alt f="axisadm003" c="TTIPCOA" lit="105387"/></b>
                                                    </td>     
                                                    </axis:ocultar>
                                                    <%-- Nº Recibo Compania --%>
                                                    <axis:ocultar c="CRECCIA" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" id="LIT_CRECCIA">
                                                         <b><axis:alt f="axisadm003" c="CRECCIA" lit="9001763"/></b><%-- Nº Recibo Compania --%>      
                                                    </td>     
                                                    </axis:ocultar>
                                                    <%-- Nº Recibo Compania --%>
                                                    <axis:ocultar c="CPOLCIA" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" id="LIT_CPOLCIA">
                                                         <b><axis:alt f="axisadm003" c="CPOLCIA" lit="9001766"/></b><%-- Nº poliza Compania --%>      
                                                    </td>     
                                                    </axis:ocultar>
                                                </tr>
                                                <tr>
                                                    <%-- Cobrador recibo --%>
                                                    <axis:ocultar c="CCOBBAN" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="TD_CCOBBAN">
                                                        <input type="text" class="campo campotexto campodisabled" id="CCOBBAN" name="CCOBBAN" <axis:atr f="axisadm003" c="CCOBBAN" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_RECIBOS.TCOBBAN}" readonly="readonly"/>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- bug 20272 - JLTS - 20121008 --%>
                                                    <%-- Descripción cobrador recibo --%>
                                                    <axis:ocultar c="TDESCRIP" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="TD_TDESCRIP">
                                                        <input type="text" class="campo campotexto campodisabled" id="TDESCRIP" name="TDESCRIP" <axis:atr f="axisadm003" c="TDESCRIP" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_RECIBOS.TDESCRIP}" readonly="readonly"/>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Gestión de cobro --%>
                                                    <axis:ocultar c="TGESCOB" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="TD_TGESCOB">
                                                        <input type="text" class="campo campotexto campodisabled" id="TGESCOB" name="TGESCOB" <axis:atr f="axisadm003" c="TGESCOB" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_RECIBOS.TGESCOB}" readonly="readonly"/>
                                                    </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar c="TTIPCOB" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="TD_TTIPCOB">
                                                        <input type="text" class="campo campotexto campodisabled" id="TTIPCOB" name="TTIPCOB" <axis:atr f="axisadm003" c="TTIPCOB" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_RECIBOS.TTIPCOB}" readonly="readonly"/>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Tipo coaseguro --%>
                                                    <axis:ocultar c="TTIPCOA" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="TD_TTIPCOA">
                                                        <input type="text" class="campo campotexto campodisabled" id="TTIPCOA" name="TTIPCOA" <axis:atr f="axisadm003" c="TTIPCOA" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_RECIBOS.TTIPCOA}" readonly="readonly"/>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Nº Recibo Compania --%>
                                                    <axis:ocultar c="CRECCIA" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="TD_CRECCIA">
                                                        <input type="text" class="campo campotexto campodisabled" id="CRECCIA" name="CRECCIA" <axis:atr f="axisadm003" c="CRECCIA" a="modificable=false&obligatorio=false"/>  style="width:90%"
                                                        value="${__formdata.OB_IAX_RECIBOS.CRECCIA}" readonly="readonly"/>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Poliza compañia --%>
                                                    <axis:ocultar c="CPOLCIA" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="TD_CPOLCIA">
                                                        <input type="text" class="campo campotexto campodisabled" id="CPOLCIA" name="CPOLCIA" <axis:atr f="axisadm003" c="CPOLCIA" a="modificable=false&obligatorio=false"/>  style="width:90%"
                                                        value="${__formdata.OB_IAX_GENPOLIZA.CPOLCIA}" readonly="readonly"/>
                                                    </td>
                                                    </axis:ocultar>
                                                </tr>
                                                <tr>
                                                   
                                                    <axis:ocultar c="TTIPBAN" f="axisadm003" dejarHueco="false">
                                                     <td class="titulocaja" id="LIT_TTIPBAN">
                                                        <b><axis:alt f="axisadm003" c="TTIPBAN" lit="1000374"/></b>
                                                    </td>     
                                                    </axis:ocultar>
                                                    <%-- Cuenta bancaria --%>
                                                    <axis:ocultar c="CBANCAR" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" id="LIT_CBANCAR">
                                                        <b><axis:alt f="axisadm003" c="CBANCAR" lit="100965"/></b>
                                                    </td>   
                                                    </axis:ocultar>
                                                    <%-- bug 20761 --%>
                                                    <%-- cuotas tarjeta --%>
                                                    <axis:ocultar c="NCUOTAR" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" id="LIT_NCUOTAR">
                                                        <b><axis:alt f="axisadm003" c="NCUOTAR" lit="9901245"/></b>
                                                    </td>   
                                                    </axis:ocultar>
                                                    
                                                     <axis:ocultar c="FVENCIM_CCC" f="axisadm003" dejarHueco="false">
                                                     <td class="titulocaja" id="LIT_FVENCIM_CCC">
                                                        <b><axis:alt f="axisadm003" c="FVENCIM_CCC" lit="9902236"/></b>
                                                    </td>     
                                                    </axis:ocultar>
                                                    
                                                </tr>
                                                <tr>
                                                  
                                                    <%-- Tipo de cuenta --%>
                                                    <axis:ocultar c="TTIPBAN" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="TD_TTIPBAN">
                                                        <input type="text" class="campo campotexto campodisabled" id="TTIPBAN" name="TTIPBAN" <axis:atr f="axisadm003" c="TTIPBAN" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_RECIBOS.TTIPBAN}" readonly="readonly"/>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Cuenta bancaria --%>
                                                    <axis:ocultar c="CBANCAR" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" colspan="1" id="TD_CBANCAR">
                                                        <input type="text" class="campo campotexto campodisabled" id="CBANCAR" name="CBANCAR" <axis:atr f="axisadm003" c="CABANCAR" a="modificable=false&obligatorio=false"/> size="15" style="width:95%"
                                                        value="<axis:masc f="axisadm003" c="CBANCAR" value="${__formdata.OB_IAX_RECIBOS.CBANCAR}" />" readonly="readonly"/>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- bug 20761 --%>
                                                    <%-- cuotas tarjeta --%>
                                                    <axis:ocultar c="NCUOTAR" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" colspan="1" id="TD_NCUOTAR">
                                                        <input type="text" class="campo campotexto campodisabled" id="NCUOTAR" name="NCUOTAR" <axis:atr f="axisadm003" c="NCUOTAR" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_RECIBOS.NCUOTAR}" readonly="readonly"/>
                                                    </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar c="FVENCIM_CCC" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="TD_FVENCIM_CCC">
                                                        <input type="text" class="campo campotexto campodisabled" id="FVENCIM_CCC" name="FVENCIM_CCC" <axis:atr f="axisadm003" c="FVENCIM_CCC" a="modificable=false&obligatorio=false"/>  size="15" style="width:90%"
                                                        value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OB_IAX_RECIBOS.FVENCIM_CCC}"/>" readonly="readonly"/>
                                                    </td>
                                                    </axis:ocultar>
                                                </tr>
                                                <tr>
                                                    <%-- Nº anualidad/fracción --%>
                                                    <axis:ocultar c="NANUALI" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" id="LIT_NANUALI">
                                                        <b><axis:alt f="axisadm003" c="NANUALI" lit="1000570"/></b>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Forma pago --%>
                                                    <axis:ocultar c="TFORPAG" f="axisadm003" dejarHueco="false">
                                                     <td class="titulocaja" id="LIT_TFORPAG">
                                                        <b><axis:alt f="axisadm003" c="TFORPAG" lit="100712"/></b>
                                                    </td>  
                                                    </axis:ocultar>
                                                    <%-- Tipo de recibo --%>
                                                    <axis:ocultar c="TTIPREC" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" id="LIT_TTIPREC">
                                                        <b><axis:alt f="axisadm003" c="TTIPREC" lit="102302"/></b>
                                                    </td>  
                                                    </axis:ocultar>
                                                    <%-- subTipo de recibo --%>
                                                    <axis:ocultar c="TSUBTIPREC" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" id="LIT_TSUBTIPREC">
                                                        <b><axis:alt f="axisadm003" c="TSUBTIPREC" lit="9907142"/></b>
                                                    </td>  
                                                    </axis:ocultar>
                                                    <%-- Fecha emisión --%>
                                                    <axis:ocultar c="FEMISIO" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" id="LIT_FEMISIO">
                                                        <b><axis:alt f="axisadm003" c="FEMISIO" lit="1000562"/></b>
                                                    </td>  
                                                    </axis:ocultar>
                                                </tr>
                                                <tr>
                                                    <%-- Nº anualidad/fracción --%>
                                                    <axis:ocultar c="NANUALI" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="TD_NANUALI">
                                                        <input type="text" class="campo campotexto campodisabled" id="NANUALI" name="NANUALI" <axis:atr f="axisadm003" c="NANUALI" a="modificable=false&obligatorio=false"/> size="15" style="width:20%"
                                                        value="${__formdata.OB_IAX_RECIBOS.NANUALI}" readonly="readonly"/>
                                                        &nbsp;
                                                        <input type="text" class="campo campotexto campodisabled" id="NFRACCI" name="NFRACCI" <axis:atr f="axisadm003" c="NFRACCI" a="modificable=false&obligatorio=false"/> size="15" style="width:20%"
                                                        value="${__formdata.OB_IAX_RECIBOS.NFRACCI}" readonly="readonly"/>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Forma pago --%>
                                                    <axis:ocultar c="TFORPAG" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="TD_TFORPAG">
                                                        <input type="text" class="campo campotexto campodisabled" id="TFORPAG" name="TFORPAG" <axis:atr f="axisadm003" c="TFORPAG" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_RECIBOS.TFORPAG}" readonly="readonly"/>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Tipo de recibo --%>
                                                    <axis:ocultar c="TTIPREC" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="TD_TTIPREC">
                                                        <input type="text" class="campo campotexto campodisabled" id="TTIPREC" name="TTIPREC" <axis:atr f="axisadm003" c="TTIPREC" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_RECIBOS.TTIPREC}" readonly="readonly"/>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- SUBTipo de recibo --%>
                                                    <axis:ocultar c="TSUBTIPREC" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="TD_TSUBTIPREC">
                                                        <input type="text" class="campo campotexto campodisabled" id="TSUBTIPREC" name="TSUBTIPREC" <axis:atr f="axisadm003" c="TSUBTIPREC" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_RECIBOS.TSUBTIPREC}" readonly="readonly"/>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Tipo de recibo --%>
                                                    <axis:ocultar c="FEMISIO" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="TD_FEMISIO">
                                                        <input type="text" class="campo campotexto campodisabled" id="FEMISIO" name="FEMISIO" <axis:atr f="axisadm003" c="FEMISIO" a="modificable=false&obligatorio=false"/>  size="15" style="width:90%"
                                                        value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OB_IAX_RECIBOS.FEMISIO}"/>" readonly="readonly"/>
                                                    </td>
                                                    </axis:ocultar>
                                                </tr>
                                                <tr>
                                                    <%-- Estado recibo --%>
                                                    <axis:ocultar c="TESTREC" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" id="LIT_TESTREC">
                                                        <b><axis:alt f="axisadm003" c="TESTREC" lit="1000553"/></b>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Estado impresión recibo --%>
                                                    <axis:ocultar c="TESTIMP" f="axisadm003" dejarHueco="false">
                                                     <td class="titulocaja" id="LIT_TESTIMP">
                                                        <b><axis:alt f="axisadm003" c="TESTIMP" lit="1000571"/></b>
                                                    </td>  
                                                    </axis:ocultar>                                                    
                                                    <axis:ocultar c="CVALIDADO" f="axisadm003" dejarHueco="false">
                                                     <td class="titulocaja" id="LIT_CVALIDADO">
                                                        <b><axis:alt f="axisadm003" c="CVALIDADO" lit="9901620"/></b>
                                                    </td> 
                                                     </axis:ocultar>
                                                     <axis:ocultar c="CMODIFI" f="axisadm003" dejarHueco="false">
                                                     <td class="titulocaja" id="LIT_CMODIFI">
                                                        <b><axis:alt f="axisadm003" c="CMODIFI" lit="9902141"/></b>
                                                    </td> 
                                                     </axis:ocultar>
                                                    <c:if test="${!empty __formdata.OB_IAX_RECIBOS.CMANUAL && __formdata.OB_IAX_RECIBOS.CMANUAL != 1 }">
                                                    test="${!empty __formdata.CCLAGD && modelos.CATRIBU == __formdata.CCLAGD}"
                                                     <axis:ocultar c="TMANUAL" f="axisadm003" dejarHueco="false">
                                                    <%-- Recibo manual --%>
                                                    <td class="titulocaja" id="LIT_TMANUAL">
                                                        <b><axis:alt f="axisadm003" c="TMANUAL" lit="1000572"/></b>
                                                    </td> 
                                                    </axis:ocultar>
                                                    </c:if>
                                                     <axis:visible c="IMPPENDIENTE" f="axisadm003">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisadm003" c="IMPPENDIENTE" lit="9002152"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    
                                                </tr>
                                                <tr>
                                                    <%-- Estado recibo --%>
                                                    <axis:ocultar c="TESTREC" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="TD_TESTREC">
                                                        <input type="text" class="campo campotexto campodisabled" id="TESTREC" name="TESTREC" <axis:atr f="axisadm003" c="TESTREC" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_RECIBOS.TESTREC}" readonly="readonly"/>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Forma pago --%>
                                                    <axis:ocultar c="TESTIMP" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="TD_TESTIMP">
                                                        <input type="text" class="campo campotexto campodisabled" id="TESTIMP" name="TESTIMP" <axis:atr f="axisadm003" c="TESTIMP" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_RECIBOS.TESTIMP}" readonly="readonly"/>
                                                    </td>
                                                    </axis:ocultar>
                                                    
                                                    <axis:ocultar c="CVALIDADO" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja"> 
                                                        <input type="checkbox" id="CVALIDADO" name="CVALIDADO" <c:if test="${__formdata.OB_IAX_RECIBOS.CVALIDADO == 1}">checked</c:if> value="${__formdata.OB_IAX_RECIBOS.CVALIDADO}" onclick="f_dep_validado();"
                                                        <axis:atr f="axisadm003" c="CVALIDADO" a="modificable=false&obligatorio=false&isInputText=false"/> />
                                                    </td>
                                                    </axis:ocultar>
                                       
                                                    <axis:ocultar c="CMODIFI" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja"> 
                                                        <input type="checkbox" id="CMODIFI" name="CMODIFI"  <c:if test="${__formdata.OB_IAX_RECIBOS.CMODIFI != 1}">checked</c:if> value="${__formdata.OB_IAX_RECIBOS.CMODIFI}"
                                                          <axis:atr f="axisadm003" c="CMODIFI" a="modificable=false&obligatorio=false&isInputText=false"/>/>
                                                      </td>
                                                    </axis:ocultar>
                                                    
                                                    <c:if test="${__formdata.OB_IAX_RECIBOS.CMANUAL == 1}">
                                                    <%-- Recibo manual --%>
                                                    <axis:ocultar c="TMANUAL" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="TD_TMANUAL">
                                                        <input type="text" class="campo campotexto campodisabled" id="TMANUAL" name="TMANUAL" <axis:atr f="axisadm003" c="TMANUAL" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_RECIBOS.TMANUAL}" readonly="readonly"/>
                                                    </td>
                                                    </axis:ocultar>
                                                    </c:if>
                                                    <axis:visible c="IMPPENDIENTE" f="axisadm003">
                                                    <%-- Import pendent rebut --%>
						    <%-- INI -IAXIS-4995 - JLTS - 08/08/2019 --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto campodisabled" id="IMPPENDIENTE" name="IMPPENDIENTE" <axis:atr f="axisadm003" c="IMPPENDIENTE" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                        value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.ITOTALR}'/>" readonly="readonly"/>
                                                    </td>
						    <%-- FIN -IAXIS-4995 - JLTS - 08/08/2019 --%>
                                                    </axis:visible>
                                                    
                                                    
                                                    
                                                </tr>
                                                 <tr>
                                                    <%-- Efectod de la póliza --%>
                                                    <axis:visible c="FEFECTO" f="axisadm003">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisadm003" c="FEFECTO" lit="100883"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible c="FVENCIM" f="axisadm003">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisadm003" c="FVENCIM" lit="100885"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    <%-- Período de venta --%>
                                                    <axis:ocultar c="NPERVEN" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" id="LIT_NPERVEN">
                                                        <b><axis:alt f="axisadm003" c="NPERVEN" lit="1000569"/></b>
                                                    </td>
                                                    </axis:ocultar>
                                                    <!-- INI - IAXIS-3264 - JLTS - 19/01/2020  -->
                                                    <axis:ocultar c="TRM" f="axisadm003" dejarHueco="false">
                                                      <c:if test="${__formdata.CMOTMOV_BAJA == 0}">
                                                        <td class="titulocaja" id="TRM">
                                                          <b><axis:alt f="axisadm003" c="TRM" lit="9909323"/></b>
                                                        </td>
                                                      </c:if>
                                                    </axis:ocultar>
						    <!-- FIN - IAXIS-3264 - JLTS - 19/01/2020  -->
                                                    
                                                </tr>
                                                <tr>
                                                  <axis:ocultar f="axisadm003" c="FEFECTO" dejarHueco="false">
                                                         <td class="campocaja">
                                                           <input style="width:75%"  type="text" class="campowidthinput campo campotexto" id="FEFECTO" name="FEFECTO" size="15"
                                                            value ="<fmt:formatDate value="${__formdata.OB_IAX_RECIBOS.FEFECTO}" pattern="dd/MM/yyyy"/>" onblur="javascript:f_formatdate(this,'')" title="<axis:alt f="axisadm003" c="FEFECTO" lit="100883"/>" <axis:atr f="axisadm003" c="FEFECTO" a="modificable=false&obligatorio=true&formato=fecha"/>/><a id="icon_FEFECTO" style="vertical-align:middle;" href="#"><img border="0" alt="<axis:alt f="axisadm003" c="ICO_FEFECTO" lit="108341" />"  title="<axis:alt f="axisadm003" c="ICO_FEFECTO" lit="108341" />" src="images/calendar.gif"/></a>
                                                        </td>
                                                    </axis:ocultar>
                                                     <axis:ocultar f="axisadm003" c="FVENCIM" dejarHueco="false">
                                                         <td class="campocaja">
                                                           <input style="width:75%"  type="text" class="campowidthinput campo campotexto" id="FVENCIM" name="FVENCIM" size="15"
                                                            value ="<fmt:formatDate value="${__formdata.OB_IAX_RECIBOS.FVENCIM}" pattern="dd/MM/yyyy"/>" onblur="javascript:f_formatdate(this,'')" title="<axis:alt f="axisadm003" c="FVENCIM" lit="100885"/>" <axis:atr f="axisadm003" c="FVENCIM" a="modificable=false&obligatorio=true&formato=fecha"/>/><a id="icon_FVENCIM" style="vertical-align:middle;" href="#"><img border="0" alt="<axis:alt f="axisadm003" c="ICO_FVENCIM" lit="108341" />"  title="<axis:alt f="axisadm003" c="ICO_FVENCIM" lit="108341" />" src="images/calendar.gif"/></a>
                                                        </td>
                                                    </axis:ocultar>
                                                      <%-- Período de venta --%>
                                                    <axis:ocultar c="NPERVEN" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="TD_NPERVEN">
                                                        <input type="text" class="campo campotexto campodisabled" id="NPERVEN" name="NPERVEN" <axis:atr f="axisadm003" c="NPERVEN" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_RECIBOS.NPERVEN}" readonly="readonly"/>
                                                    </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar c="TRM" f="axisadm003" dejarHueco="false">
                                                    <!-- INI - IAXIS-3264 - JLTS - 19/01/2020  -->
                                                    <c:if test="${__formdata.CMOTMOV_BAJA == 0}">
                                                     <td class="campocaja" id="TD_TRM">
                                                        <input type="text" class="campo campotexto campodisabled" id="TTRM" name="TTRM" <axis:atr f="axisadm003" c="NPERVEN" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                        value="${TASACAMB}" readonly="readonly"/>
                                                    </td>
                                                    </c:if>
                                                    </axis:ocultar>
						    <!-- FIN - IAXIS-3264 - JLTS - 19/01/2020  -->
                                                    
                                                    </tr>
                                                <tr>                                                 
                                                    <%-- Pagadora --%>
                                                    <axis:ocultar c="TPAGADOR" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" id="LIT_TPAGADOR" colspan="2">
                                                        <b><axis:alt f="axisadm003" c="TPAGADOR" lit="9903157"/></b>
                                                    </td>
                                                    </axis:ocultar>
						     <!-- INI - IAXIS-3590 - HB - 24/04/2019  -->
                                                    <axis:visible f="axisadm003" c="CMONPOL">
													<!--	InterÃ©s prÃ³ximo -->
													<td class="titulocaja"><b><axis:alt f="axisadm003"
																c="CMONPOL" lit="108645" /></b></td>
												</axis:visible>
							<!-- FIN - IAXIS-3590 - HB - 24/04/2019  -->
                                                </tr>
                                                <tr>
                                                     <axis:ocultar c="TPAGADOR" f="axisadm003" dejarHueco="false">
                                                        <td class="campocaja" id="TD_PAGADOR" colspan="2">
                                                            <input type="text" class="campo campotexto campodisabled" id="TPAGADOR" name="TPAGADOR" <axis:atr f="axisadm003" c="TPAGADOR" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                            value="${__formdata.OB_IAX_RECIBOS.TPAGADOR}" readonly="readonly"/>
                                                        </td>
                                                    </axis:ocultar>
						     <!-- INI - IAXIS-3590 - HB - 24/04/2019  -->
                                                    <axis:visible f="axisadm003" c="CMONPOL">
													<!--	Moneda -->
													<td class="campocaja"><input type="text"
														class="campowidthinput campo campotexto" id="CMONPOL"
														name="CMONPOL" size="15" value="${datos_poliza.TMONPOL}"
														readonly="true" /></td>
												</axis:visible>
                                                </tr>
                                                <tr>
                                                 <td class="campocaja" colspan="5">
                                           <img src="images/mes.gif" id="DSP_COASEGURO_parent"
												onclick="objEstilos.toggleDisplay('DSP_COASEGURO', this)"
												style="cursor: pointer" /> <b><axis:alt f="axisadm003"
													c="COASEGURO" lit="105387" /></b>
                                         
										
											<hr class="titulo">
										
                                        </td>
                                                </tr>
                                                <tr id="DSP_COASEGURO_children" style="display: none" >
									<td align="left" colspan="4">
										<table class="area" align="center">
											<tr>
												<th style="width: 25%; height: 0px"></th>
												<th style="width: 25%; height: 0px"></th>
												<th style="width: 25%; height: 0px"></th>
												<th style="width: 25%; height: 0px"></th>
											</tr>
											<tr>
												<axis:ocultar f="axisadm003" c="CTIPCOA" dejarHueco="false">
													<td class="titulocaja"><b id="label_CTIPCOA"><axis:alt
																f="axisadm003" c="label_CTIPCOA" lit="105387" /></b></td>
												</axis:ocultar>
												<axis:ocultar f="axisadm003" c="label_PLOCCOA"
													dejarHueco="false">
													<c:if test="${datos_poliza.CTIPCOA != 0}">
														<td class="titulocaja"><b id="label_PLOCCOA"><axis:alt
																	f="axisadm003" c="label_PLOCCOA" lit="9904141" /></b></td>
													</c:if>
												</axis:ocultar>
												<axis:ocultar f="axisadm003" c="SCIACOA" dejarHueco="false">
													<c:if test="${datos_poliza.CTIPCOA == 8}">
														<td class="titulocaja"><b id="label_SCIACOA"><axis:alt
																	f="axisadm003" c="label_SCIACOA" lit="9904142" /></b></td>
													</c:if>
												</axis:ocultar>
												<axis:ocultar f="axisadm003" c="NPOLCIA" dejarHueco="false">
													<c:if test="${datos_poliza.CTIPCOA == 8}">
														<td class="titulocaja"><b id="label_NPOLCIA"><axis:alt
																	f="axisadm003" c="label_NPOLCIA" lit="9904143" /></b></td>
													</c:if>
												</axis:ocultar>
											</tr>
											<tr>
												<axis:ocultar f="axisadm003" c="CTIPCOA" dejarHueco="false">
													<td class="campocaja"><input type="text"
														style="width: 80%"
														class="campowidthinput campo campotexto" id="TTIPCOA"
														name="TTIPCOA"
														title="<axis:alt f="axisadm003" c="label_TTIPCOA" lit="105387"/>"
														size="15" value="${datos_poliza.TTIPCOA}"
														<axis:atr f="axisadm003" c="TTIPCOA" a="modificable=false&obligatorio=false"/> />
													</td>
												</axis:ocultar>
												<axis:ocultar f="axisadm003" c="PLOCCOA" dejarHueco="false">
													<%-- <c:if test="${datos_poliza.CTIPCOA != 0}"> --%>
													<%-- Ini IAXIS-14222 JRVG 25/08/2020 --%>
													<c:set var="val" value="${datos_poliza.CTIPCOA}"/>
													<c:choose> 
													  <c:when test="${val == 8}">
													  <td class="campocaja"><input type="text"
															style="width: 40%"
															class="campowidthinput campo campotexto" id="PLOCCOA"
															name="PLOCCOA"
															title="<axis:alt f="axisadm003" c="label_PLOCCOA" lit="9904141"/>"
															size="15" value="${DATCOASEGURO.PLOCCOA}"  
															<axis:atr f="axisadm003" c="PLOCCOA" a="modificable=false&obligatorio=false&formato=entero"/> />
														</td>
													  </c:when>
													  <c:otherwise>
													    <td class="campocaja"><input type="text"
															style="width: 40%"
															class="campowidthinput campo campotexto" id="PLOCCOA"
															name="PLOCCOA"
															title="<axis:alt f="axisadm003" c="label_PLOCCOA" lit="9904141"/>"
															size="15" value="${__formdata.PARTICIPACION - __formdata.PCESCOA}"  
															<axis:atr f="axisadm003" c="PLOCCOA" a="modificable=false&obligatorio=false&formato=entero"/> />
														</td>
													  </c:otherwise>
													</c:choose>
													<%-- Fin IAXIS-14222 JRVG 25/08/2020 --%>
												</axis:ocultar>
												<axis:ocultar f="axisadm003" c="SCIACOA" dejarHueco="false">
													<c:if test="${datos_poliza.CTIPCOA == 8}">
														<td class="campocaja"><input type="text"
															style="width: 80%"
															class="campowidthinput campo campotexto" id="SCIACOA"
															name="SCIACOA"
															title="<axis:alt f="axisadm003" c="label_SCIACOA" lit="9904142"/>"
															size="15" value="${DATCOASEGURO.TCOMPAN}"
															<axis:atr f="axisadm003" c="SCIACOA" a="modificable=false&obligatorio=false"/> />
														</td>
													</c:if>
												</axis:ocultar>
												<axis:ocultar f="axisadm003" c="NPOLCIA2" dejarHueco="false">
													<c:if test="${datos_poliza.CTIPCOA == 8}">
														<td class="campocaja"><input type="text"
															style="width: 60%"
															class="campowidthinput campo campotexto" id="NPOLCIA2"
															name="NPOLCIA2"
															title="<axis:alt f="axisadm003" c="label_NPOLCIA" lit="9904143"/>"
															alt="<axis:alt f="axisadm003" c="label_NPOLCIA" lit="9904143"/>"
															size="15" value="${DATCOASEGURO.NPOLIZA}"
															<axis:atr f="axisadm003" c="NPOLCIA2" a="obligatorio=false&modificable=false"/> />&nbsp;
														</td>
													</c:if>
												</axis:ocultar>
											</tr>
											<tr>
											<axis:visible f="axisadm003" c="ENDOSO">
											<c:if test="${datos_poliza.CTIPCOA == 8}">
												<td class="titulocaja"><b id="label_ENDOSO"><axis:alt
															f="axisctr004" c="label_ENDOSO" lit="9905423" /></b>
												
												</td>
											</c:if>					
											</axis:visible>
											
											</tr>
											
											<tr>
											
											<axis:visible f="axisadm003" c="ENDOSO">
											<c:if test="${datos_poliza.CTIPCOA == 8}">
												<td class="campocaja"><input type="text"
													style="width: 100%"
													title="<axis:alt f="axisctr004" c="ENDOSO" lit="9904143"/>"
													alt="<axis:alt f="axisctr004" c="ENDOSO" lit="9904143"/>"
													class="campowidthinput campo campotexto" id="ENDOSO"
													name="ENDOSO" size="15"
													value="${DATCOASEGURO.ENDOSO}"
													<axis:atr f="axisadm003" c="NPOLCIA2" a="obligatorio=false&modificable=false"/> />&nbsp;
												</td>
											</c:if>	
											</axis:visible>
											</tr>
											<c:if test="${datos_poliza.CTIPCOA == 1}">
												<tr>
													<td class="titulocaja">
														<div class="separador">&nbsp;</div> <b id="label_TABLACOA"><axis:alt
																f="axisctr004" c="label_TABLACOA" lit="9002270" /></b>
													</td>
												</tr>
												<tr>
													<td align="left" colspan="3">
														<div class="displayspace">
															<c:set var="title1">
																<b><axis:alt f="axisctr004" c="label_TCOMPANI"
																		lit="9000600" /></b>
															</c:set>
															<c:set var="title2">
																<b><axis:alt f="axisctr004" c="label_PCESCOA"
																		lit="104818" /></b>
															</c:set>
															<c:set var="title3">
																<b><axis:alt f="axisctr004" c="label_PCOMCON"
																		lit="9001923" /></b>
															</c:set>
															<c:set var="title4">
																<b><axis:alt f="axisctr004" c="label_PCOMGAS"
																		lit="9902215" />
															</c:set>
															<c:set var="title5">
																<b><axis:alt f="axisctr004" c="label_PCOMCOA"
																		lit="9904150" />
															</c:set>
															<!-- INI - BUG IAXIS-13960 - JRVG - 09/06/2020  -->
															<display:table name="${detalleCompaniasCoa}" id="companias"
																export="false" class="dsptgtable" pagesize="-1"
																defaultsort="1" defaultorder="ascending" sort="list"
																cellpadding="0" cellspacing="0"
																requestURI="axis_axisadm003.do?paginar=true&tabla=tomador">
																<%@ include file="../include/displaytag.jsp"%>
																<axis:visible f="axisadm003" c="TCOMPAN">
																	<display:column title="${title1}" sortable="false"
																		sortProperty="OB_IAX_TOMADORES.TTIPIDE"
																		headerClass="sortable" style="width:45%" media="html"
																		autolink="false">
																		<div class="dspText">${companias.TDESCOMP}</div>
																	</display:column>
																</axis:visible>
																<axis:visible f="axisadm003" c="PCESCOA">
																	<display:column title="${title2}" sortable="false"
																		sortProperty="PCESCOA"
																		headerClass="headwidth5 sortable" style="width:12%"
																		media="html" autolink="false">
																		<div class="dspNumber">
																			<fmt:formatNumber pattern="###,##0.00"
																				value="${companias.PCESCOA}" />
																		</div>
																	</display:column>
																</axis:visible>
																<axis:visible f="axisadm003" c="PCOMCON">
																	<display:column title="${title3}" sortable="false"
																		sortProperty="PCOMCON"
																		headerClass="headwidth5 sortable" style="width:12%"
																		media="html" autolink="false">
																		<div class="dspNumber">
																			<fmt:formatNumber pattern="###,##0.00"
																				value="${companias.PCOMCON}" />
																		</div>
																	</display:column>
																</axis:visible>
																<axis:visible f="axisadm003" c="PCOMGAS">
																	<display:column title="${title4}" sortable="false"
																		sortProperty="PCOMGAS"
																		headerClass="headwidth5 sortable" style="width:12%"
																		media="html" autolink="false">
																		<div class="dspNumber">
																			<fmt:formatNumber pattern="###,##0.00"
																				value="${companias.PCOMGAS}" />
																		</div>
																	</display:column>
																</axis:visible>
																<axis:visible f="axisadm003" c="PCOMCOA">
																	<display:column title="${title5}" sortable="false"
																		sortProperty="PCOMCOA"
																		headerClass="headwidth5 sortable" style="width:19%"
																		media="html" autolink="false">
																		<div class="dspNumber">
																			<fmt:formatNumber pattern="###,##0.00"
																				value="${companias.PCOMCOA}" />
																		</div>
																	</display:column>
																</axis:visible>
															</display:table>
															<!-- FIN - BUG IAXIS-13960 - JRVG - 09/06/2020  -->
														</div>
														<div class="separador">&nbsp;</div>
													</td>
												</tr>
											</c:if>
											</table>
											
											</td>
											</tr>
											<tr>
                                                 <td class="campocaja" colspan="12">
                                           <img src="images/mes.gif" id="DSP_CORRETAJE_parent"
												onclick="objEstilos.toggleDisplay('DSP_CORRETAJE', this)"
												style="cursor: pointer" /> <b><axis:alt f="axisadm003"
													c="CORRETAJE_TIT" lit="9902530" /></b>
                                         
										
											<hr class="titulo">
										
                                        </td>
                                                </tr>
                                                 <tr id="DSP_CORRETAJE_children" style="display:none" >
                    <td class="campocaja"   colspan="50">
                          <c:set var="title0"><axis:alt f="${pantalla}" c="TAGENTE" lit="9902363"/></c:set>
                          <c:set var="title4"><axis:alt f="${pantalla}" c="TSUCURSAL" lit="9002202"/></c:set>
                          <c:set var="title1"><axis:alt f="${pantalla}" c="PCOMISI" lit="9001923"/></c:set>
                          <c:set var="title2"><axis:alt f="${pantalla}" c="PPARTICI" lit="104818"/></c:set>
                          <c:set var="title3"><axis:alt f="${pantalla}" c="ISLIDER" lit="9902425"/></c:set>                         
                          
                         <%-- INI IAXIS-12960 - JRVG - 05/03/2020 bug en comisiones por cambios de emision--%>
                          <div class="displayspace" colspan="50">
                            <display:table name="${listaCorretaje}" id="corretaje" export="false" class="dsptgtable" pagesize="-1" defaultsort="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" >
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_CORRETAJE.TAGENTE" headerClass="headwidth15 sortable"  media="html" autolink="false" >
                                      <div class="dspText">${corretaje.AGENTE} - ${corretaje.TDESAGE}</div>
                                </display:column>
                                <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_CORRETAJE.TSUCURSAL" headerClass="headwidth15 sortable"  media="html" autolink="false">
                                      <div class="dspText">${corretaje.SUCUR} - ${corretaje.NOMSUCUR}</div>
                                </display:column>
                                <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_CORRETAJE.PCOMISI" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                     <div class="dspNumber"><fmt:formatNumber pattern="###,##0.00" value="${__formdata.PORC_COMIS}" /></div>
                                </display:column>
                                <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_CORRETAJE.PPARTICI" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                     <div class="dspNumber"><fmt:formatNumber pattern="###,##0.00" value="${corretaje.PARTICI}" /></div>
                                </display:column>
                                <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_CORRETAJE.NORDEN" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                   <div class="dspIcons">
                                  <input disabled type="checkbox" id="checked_ISLIDER" name="checked_ISLIDER" <c:if test="${corretaje.LIDER == 1}">checked</c:if>                                        
                                        value=""/>
                                   </div>
                                </display:column>                                                            
                            </display:table>
                        </div>
                        <%-- FIN IAXIS-12960 - JRVG - 05/03/2020 bug en comisiones por cambios de emision--%>
                    </td>
		    <!-- FIN - IAXIS-3590 - HB - 24/04/2019  -->
                                                </tr>
                                            </table>        
                                        </td> 
                                    </tr>       
                                </table>
                            </td>
                        </tr>
                        <!--  ******************************************  AXISADM003_B.jsp ************************************ -->
                        
                      
                        <c:import url="axisadm003_b.jsp"/>
                        
                        
                        <!--  ******************************************  AXISADM003_A.jsp ************************************ -->
                        
                      
                        <c:import url="axisadm003_a.jsp"/>
                          
                            
                        <!-- *************************** SECCION MÁS DATOS ********************************* -->  
                        <%--IAXIS3589 SGM  22/04/2019 SE AGREGAN ABONOS Y SALDO TOTAL DEL RECIBO--%>              
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <table class="area" align="center">
                                    <%-- IMPORTES RECIBO --%>
                                    <tr>
                                        <th style="width:100%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <img id="importes_recibo_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('importes_recibo', this)" style="cursor:pointer"/>
                                            <%-- INI -IAXIS-4995 - JLTS - 08/08/2019 --%>
                                            <%-- INI -IAXIS-14223 - JRVG - 19/08/2020 --%>
                                            <b><axis:alt f="axisadm003" c="importes_recibo_parent" lit="1000582"/>&nbsp;${CMONEDAPROD}</b>&nbsp;&nbsp;
                                            <axis:alt f="axisadm003" c="LIT_ITOTAL" lit="1000584"/>&nbsp;&nbsp;
                                            <axis:alt f="axisadm003" c="LIT_INETA" lit="102995"/>  
                                              <fmt:formatNumber pattern="${__formatNumberPatterns[CMONEDAPROD]}" value="${__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.ITOTPRI}"/> 
                                            <axis:ocultar f="axisadm003" c="IMPUESTOS" dejarHueco="false">&nbsp;-&nbsp; 
                                              <axis:alt f="axisadm003" c="LIT_IMPUESTOS" lit="89906206"/>  
                                              <%-- INI - JRVG - IAXIS-12983 - 16/03/2020' --%> 
                                                <fmt:formatNumber pattern="${__formatNumberPatterns[CMONEDAPROD]}" value="${__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.ITOTIMP + __formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.ITOTREC}"/>
                                              <%-- FIN - JRVG - IAXIS-12983 - 16/03/2020' --%>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm003" c="ICOMBRUT" dejarHueco="false">&nbsp;-&nbsp;
                                              <axis:alt f="axisadm003" c="ICOMBRUT" lit="108482"/> 
                                                <fmt:formatNumber pattern="${__formatNumberPatterns[CMONEDAPROD]}" value="${__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.ICOMBRU}"/>
                                            </axis:ocultar>&nbsp;-&nbsp;
                                              <axis:alt f="axisadm003" c="INETA" lit="1000563"/> 
                                                <fmt:formatNumber pattern="${__formatNumberPatterns[CMONEDAPROD]}" value="${__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.ITOTPRI +__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.ITOTIMP +__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.ITOTREC}"/>&nbsp;-&nbsp;
                                              <axis:alt f="axisadm003" c="TOTALIIMPORTE" lit="89906272"/> 
                                                <fmt:formatNumber pattern="${__formatNumberPatterns[CMONEDAPROD]}" value="${__formdata.TOTAL_ABONO}"/>&nbsp;-&nbsp;  <%-- IAXIS-14408 JRVG  05/10/2020 --%>
                                              <axis:alt f="axisadm003" c="SALDORECIBO" lit="89906273"/> 
                                                <fmt:formatNumber pattern="${__formatNumberPatterns[CMONEDAPROD]}" value="${__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.ITOTPRI +__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.ITOTIMP +__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.ITOTREC -__formdata.TOTALIIMPORTE}"/>
                                            <hr class="titulo"/>
                                            <%-- FIN -IAXIS-14223 - JRVG - 19/08/2020 --%>
					                        <%-- FIN -IAXIS-4995 - JLTS - 08/08/2019 --%>
                                        </td>
                                    </tr>                                                
                                    <tr id="importes_recibo_children" style="display:none">
                                        <td align="left">
                                             <table class="area" align="center">
                                                 <tr>
                                                    <th style="width:20%;height:0px"></th>
                                                    <th style="width:20%;height:0px"></th>
                                                    <th style="width:20%;height:0px"></th>
                                                    <th style="width:20%;height:0px"></th>
                                                    <th style="width:20%;height:0px"></th>                                                    
                                                </tr>
                                                <tr>
                                                    <%-- Prima neta --%>
                                                    <axis:ocultar c="IPRINET" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" id="tit_IPRINET">
                                                        <b><axis:alt f="axisadm003" c="IPRINET" lit="102995"/></b>
                                                    </td>  
                                                    </axis:ocultar>
                                                    <%-- Total descuentos --%>
                                                    <axis:ocultar c="IT1DTO" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" id="tit_IT1DTO">
                                                        <b><axis:alt f="axisadm003" c="IT1DTO" lit="1000578"/></b>
                                                    </td>  
                                                    </axis:ocultar>
                                                    <%-- Total recargos --%>
                                                    <axis:ocultar c="IRECFRA" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" id="tit_IRECFRA">
                                                        <b><axis:alt f="axisadm003" c="IRECFRA" lit="1000579"/></b>
                                                    </td>  
                                                    </axis:ocultar>
                                                                                                      
                                                    <%-- Consorcio --%>
                                                    <axis:ocultar f="axisadm003" c="IT1CON" dejarHueco="false">
                                                        <td class="titulocaja" id="tit_IT1CON">
                                                            <b><axis:alt f="axisadm003" c="IT1CON" lit="1000587"/></b>
                                                        </td>
                                                    </axis:ocultar>
                                                    
                                                     <%-- Comisiones --%>
                                                    <axis:ocultar f="axisadm003" c="ICOMBRU" dejarHueco="false">
                                                        <td class="titulocaja" id="tit_ICOMBRU">
                                                            <b><axis:alt f="axisadm003" c="ICOMBRU" lit="108482"/></b>
                                                        </td>
                                                    </axis:ocultar>
                                                </tr>
                                                <tr>
                                                    <%-- Prima neta --%>
                                                    <axis:ocultar c="IPRINET" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="td_IPRINET">
                                                        <input type="text" class="campo campotexto" id="IPRINET" name="IPRINET" size="15" style="width:75%" <axis:atr f="axisadm003" c="IPRINET" a="modificable=false&obligatorio=false&formato=decimal"/>                                                        
                                                        onChange = "javascript:f_calculoma(this);"
                                                        <%-- INI - JLTS - IAXIS-4160 - 16072019 Ajuste del pattern='${__formatNumberPatterns[CMONEDAPROD]}' --%>
                                                         value="<fmt:formatNumber pattern='###,##0.00' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.IPRINET}'/>" />
                                                        <%-- FIN - JLTS - IAXIS-4160 - 16072019 Ajuste del pattern='${__formatNumberPatterns[CMONEDAPROD]}' --%>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Total descuentos --%>
						    <%-- INI -IAXIS-4995 - JLTS - 08/08/2019 --%>
                                                    <axis:ocultar c="IT1DTO" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="td_IT1DTO">
                                                        <input type="text" class="campo campotexto " id="IT1DTO" name="IT1DTO" size="15" style="width:75%" <axis:atr f="axisadm003" c="IT1DTO" a="modificable=false&obligatorio=false&formato=decimal"/>
                                                        onChange = "javascript:f_calculoma(this);"
                                                        value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.IIPS}'/>" />
                                                    </td>
						    <%-- FIN -IAXIS-4995 - JLTS - 08/08/2019 --%>
                                                    </axis:ocultar>
                                                    <%-- Total recargos --%>
                                                    <axis:ocultar c="IRECFRA" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="td_IRECFRA">
                                                        <input type="text" class="campo campotexto " id="IRECFRA" name="IRECFRA" size="15" style="width:75%" <axis:atr f="axisadm003" c="IRECFRA" a="modificable=false&obligatorio=false&formato=decimal"/>
                                                        onChange = "javascript:f_calculoma(this);"
                                                        value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.IRECFRA + __formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.ICEDRFR}'/>" />
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Consorcio --%>
                                                    <axis:ocultar f="axisadm003" c="IT1CON" dejarHueco="false">
                                                        <td class="campocaja" id="td_IT1CON">
                                                            <input type="text" class="campo campotexto " id="IT1CON" name="IT1CON" size="15" style="width:75%" <axis:atr f="axisadm003" c="IT1CON" a="modificable=false&obligatorio=false&formato=decimal"/>
                                                            onChange = "javascript:f_calculoma(this);"
                                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.IT1CON}'/>" />
                                                        </td>
                                                    </axis:ocultar>
                                                    
                                                    <%-- Comisiones --%>
                                                    <axis:ocultar f="axisadm003" c="ICOMBRU" dejarHueco="false">
                                                        <td class="campocaja" id="td_ICOMBRU">
                                                            <input type="text" class="campo campotexto " id="ICOMBRU" name="ICOMBRU" size="15" style="width:75%" <axis:atr f="axisadm003" c="ICOMBRU" a="modificable=false&obligatorio=false&formato=decimal"/>
                                                            onChange = "javascript:f_calculoma(this);"
                                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.ICOMBRU}'/>" />
                                                        </td>
                                                    </axis:ocultar>
                                                </tr>                                         
                                                <tr>
                                                    <axis:ocultar f="axisadm003" c="IIPS" dejarHueco="false"> 
                                                        <td class="titulocaja" id="tit_IIPS">                                                        
                                                            <b>${__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.TIIPS}</b>                                                        
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisadm003" c="IDGS" dejarHueco="false">
                                                        <td class="titulocaja" id="tit_IDGS">                                                        
                                                            <b>${__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.TIDGS}</b>                                                        
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisadm003" c="IARBITR" dejarHueco="false">
                                                        <td class="titulocaja" id="tit_IARBITR">                                                        
                                                            <b>${__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.TIARBITR}</b>                                                        
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisadm003" c="IFNG" dejarHueco="false">
                                                        <td class="titulocaja" id="tit_IFNG">                                                        
                                                            <b>${__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.TIFNG}</b>                                                        
                                                        </td>
                                                    </axis:ocultar>
                                                    <%-- Total impuestos --%>
                                                    <axis:ocultar f="axisadm003" c="IT1IMP" dejarHueco="false">
                                                    <td class="titulocaja" id="tit_IT1IMP">
                                                        <b><axis:alt f="axisadm003" c="IT1IMP" lit="1000580"/></b>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Total recargos --%>
                                                    <axis:ocultar c="IT1REC" f="axisadm003" dejarHueco="false">
                                                    <td class="titulocaja" id="tit_IT1REC">
                                                        <b><axis:alt f="axisadm003" c="IT1REC" lit="1000579"/></b>
                                                    </td>  
                                                    </axis:ocultar>
                                                </tr>
                                               
                                                <tr>
                                                    <%-- IIPS --%>
                                                    <axis:ocultar f="axisadm003" c="IIPS" dejarHueco="false">
                                                        <td class="campocaja">                                   
                                                            <input type="text" class="campo campotexto " id="IIPS" name="IIPS" size="15" style="width:75%" <axis:atr f="axisadm003" c="IIPS" a="modificable=false&obligatorio=false&formato=decimal"/>
                                                            onChange = "javascript:f_calculoma(this);"
                                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.IIPS}'/>" />                                                        
                                                        </td>
                                                    </axis:ocultar>    
                                                    <%-- IDGS --%>
                                                    <axis:ocultar f="axisadm003" c="IDGS" dejarHueco="false">
                                                        <td class="campocaja">
                                                            <input type="text" class="campo campotexto " id="IDGS" name="IDGS" size="15" style="width:75%" <axis:atr f="axisadm003" c="IDGS" a="modificable=false&obligatorio=false&formato=decimal"/>
                                                                onChange = "javascript:f_calculoma(this);"
                                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.IDGS}'/>" />                                                        
                                                        </td>
                                                    </axis:ocultar>
                                                    <%-- IARBITR --%>
                                                    <axis:ocultar f="axisadm003" c="IARBITR" dejarHueco="false">
                                                        <td class="campocaja">                                                           
                                                            <input type="text" class="campo campotexto " id="IARBITR" name="IARBITR" size="15" style="width:75%" <axis:atr f="axisadm003" c="IARBITR" a="modificable=false&obligatorio=false&formato=decimal"/>
                                                            onChange = "javascript:f_calculoma(this);"
                                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.IARBITR}'/>" />                                                        
                                                        </td>
                                                    </axis:ocultar>
                                                    <%-- IFNG --%>
                                                    <axis:ocultar f="axisadm003" c="IFNG" dejarHueco="false">
                                                        <td class="campocaja">                                                        
                                                            <input type="text" class="campo campotexto " id="IFNG" name="IFNG" size="15" style="width:75%" <axis:atr f="axisadm003" c="IFNG" a="modificable=false&obligatorio=false&formato=decimal"/>
                                                            onChange = "javascript:f_calculoma(this);"
                                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.IFNG}'/>" />
                                                        </td>                                                   
                                                    </axis:ocultar>
                                                    <%-- Total impuestos --%>
                                                    <axis:ocultar f="axisadm003" c="IT1IMP" dejarHueco="false">
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto " id="IT1IMP" name="IT1IMP" size="15" style="width:75%" <axis:atr f="axisadm003" c="IT1IMP" a="modificable=false&obligatorio=false&formato=decimal"/>
                                                        onChange = "javascript:f_calculoma(this);"
                                                        <%-- INI - JLTS - IAXIS-4160 - 16072019 Ajuste del pattern='${__formatNumberPatterns[CMONEDAPROD]}' --%>
							<%-- INI -IAXIS-4995 - JLTS - 08/08/2019 --%>
                                                        value="<fmt:formatNumber pattern='###,##0.00' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.IIPS}'/>" />
							<%-- FIN -IAXIS-4995 - JLTS - 08/08/2019 --%>
                                                        <%-- FIN - JLTS - IAXIS-4160 - 16072019 Ajuste del pattern='${__formatNumberPatterns[CMONEDAPROD]}' --%>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Total recargos --%>
                                                    <axis:ocultar c="IT1REC" f="axisadm003" dejarHueco="false">
                                                    <td class="campocaja" id="td_IT1REC">
                                                        <input type="text" class="campo campotexto " id="IT1REC" name="IT1REC" size="15" style="width:75%" <axis:atr f="axisadm003" c="IT1REC" a="modificable=false&obligatorio=false&formato=decimal"/>
                                                        onChange = "javascript:f_calculoma(this);"
                                                        value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.IT1REC}'/>" />
                                                    </td>
                                                    </axis:ocultar>
                                                </tr>
                                                   
                                                <tr>
                                                    <axis:ocultar f="axisadm003" c="ILIQUIDO" dejarHueco="false">
                                                        <td class="titulocaja" id="tit_ILIQUIDO">                                                        
                                                            <b><axis:alt f="axisadm003" c="ILIQUIDO" lit="9904375"/></b>
                                                        </td>
                                                    </axis:ocultar>
                                                </tr>
                                                <tr>
                                                    <axis:ocultar f="axisadm003" c="ILIQUIDO" dejarHueco="false">
                                                        <td class="campocaja">
                                                            <input type="text" class="campo campotexto " id="ILIQUIDO" name="ILIQUIDO" size="15" style="width:75%" <axis:atr f="axisadm003" c="ILIQUIDO" a="modificable=false&obligatorio=false&formato=decimal"/>
                                                            onChange = "javascript:f_calculoma(this);"
                                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.ITOTALR +(__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.ICOMBRU - __formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.ICOMRET)}'/>" />
                                                        </td>
                                                    </axis:ocultar>
                                                </tr>
                                                
                                                
                                                <axis:ocultar f="axisadm003" c="TRILINEAREC" dejarHueco="false">
                                                <tr>
                                                    <%-- Bug 0019791 - 25/10/2011 - JMF --%>
                                                    <%-- Derechos de registro --%>
                                                    <axis:ocultar f="axisadm003" c="TIDERREG" dejarHueco="false">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisadm003" c="TIDERREG" lit="1000106"/></b>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Consorcio especial --%>
                                                    <axis:ocultar f="axisadm003" c="TIRECCON" dejarHueco="false">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisadm003" c="TIRECCON" lit="9902595"/></b>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Prima bruta--%>
                                                    <axis:ocultar f="axisadm003" c="TIPBRUTA" dejarHueco="false">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisadm003" c="TIPBRUTA" lit="9902594"/></b>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Total recibo --%>
                                                    <axis:ocultar f="axisadm003" c="TITOTALR" dejarHueco="false">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisadm003" c="TITOTALR" lit="1000563"/></b>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Total recibo --%>
                                                    <axis:ocultar f="axisadm003" c="ITOTLIQ" dejarHueco="false">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisadm003" c="ITOTLIQ" lit="9903053"/></b>
                                                    </td>
                                                    </axis:ocultar>
                                                </tr>                                          

                                                <tr>
                                                    <%-- Derechos de registro --%>
                                                    <axis:ocultar f="axisadm003" c="IDERREG" dejarHueco="false">
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto " id="IDERREG" name="IDERREG" size="15" style="width:75%" <axis:atr f="axisadm003" c="IDERREG" a="modificable=false&obligatorio=false&formato=decimal"/>
                                                        onChange = "javascript:f_calculoma(this);"
                                                        <%-- INI - JLTS - IAXIS-4160 - 16072019 Ajuste del pattern='${__formatNumberPatterns[CMONEDAPROD]}' --%>
                                                        <%-- INI - JRVG - IAXIS-12983 - 16/03/2020 VLR GASTO' --%>
                                                         value="<fmt:formatNumber pattern='###,##0.00' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.IDERREG}'/>" />  
                                                        <%-- FIN - JRVG - IAXIS-12983 - 16/03/2020 VLR GASTO' --%>
                                                        <%-- FIN - JLTS - IAXIS-4160 - 16072019 Ajuste del pattern='${__formatNumberPatterns[CMONEDAPROD]}' --%>
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Consorcio especial --%>
                                                    <axis:ocultar f="axisadm003" c="IRECCON" dejarHueco="false">
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto " id="IRECCON" name="IRECCON" size="15" style="width:75%" <axis:atr f="axisadm003" c="IRECCON" a="modificable=false&obligatorio=false&formato=decimal"/>
                                                        onChange = "javascript:f_calculoma(this);"
                                                        value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.IRECCON}'/>" />
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Prima bruta--%>
                                                    <axis:ocultar f="axisadm003" c="IPBRUTA" dejarHueco="false">
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto " id="IPBRUTA" name="IPBRUTA" size="15" style="width:75%" <axis:atr f="axisadm003" c="IPBRUTA" a="modificable=false&obligatorio=false&formato=decimal"/>
                                                        onChange = "javascript:f_calculoma(this);"
                                                        value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.IPBRUTA}'/>" />
                                                    </td>
                                                    </axis:ocultar>
                                                    <%-- Total recibo --%>
                                                    <axis:ocultar f="axisadm003" c="ITOTALR" dejarHueco="false">
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto " id="ITOTALR" name="ITOTALR" size="15" style="width:75%" <axis:atr f="axisadm003" c="ITOTALR" a="modificable=false&obligatorio=false&formato=decimal"/>
                                                        onChange = "javascript:f_calculoma(this);"
                                                        <%-- INI - JLTS - IAXIS-4160 - 16072019 Ajuste del pattern='${__formatNumberPatterns[CMONEDAPROD]}' --%>
                                                        value="<fmt:formatNumber pattern='###,##0.00' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.ITOTALR}'/>" />
                                                        <%-- FIN - JLTS - IAXIS-4160 - 16072019 Ajuste del pattern='${__formatNumberPatterns[CMONEDAPROD]}' --%>
                                                    </td>
                                                    </axis:ocultar>
                                                    
                                                    <%-- Total liquido --%>
                                                    <axis:ocultar f="axisadm003" c="ITOTLIQ" dejarHueco="false">
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto " id="ITOTLIQ" name="ITOTLIQ" size="15" style="width:75%" <axis:atr f="axisadm003" c="ITOTLIQ" a="modificable=false&obligatorio=false&formato=decimal"/>
                                                        onChange = "javascript:f_calculoma(this);"
                                                        value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.ITOTALR - (__formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.ICOMBRU - __formdata.OB_IAX_RECIBOS.VDETRECIBO[0].OB_IAX_VDETRECIBO.ICOMRET)}'/>" />
                                                    </td>
                                                    </axis:ocultar>
                                                </tr>                                                   
                                                </axis:ocultar>                                                
										 <%-- Harshitaaaa 25 april--%>
										 <%-- INI IAXIS-3591 - HB -  25/04/2019--%>
                                    <!-- Harshita end -->
                                      </table>        
                                        </td> 
                                    </tr>  
                                    
                                </table>
                            </td>
                        </tr>
                                     <axis:visible f="axisadm003" c="DSP_DETIMPREC" >
                                                <tr>
                                                    <table class="area" align="center">
                                                        <%-- IMPORTES RECIBO --%>
                                                        <tr>
                                                            <th style="width:100%;height:0px"></th>
                                                        </tr>
                                                        <tr>
                                                            <td class="campocaja">
                                                                <img id="importes_detallados_recibo_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('importes_detallados_recibo', this)" style="cursor:pointer"/> 
                                                                <b><axis:alt f="axisadm003" c="IRECIBO" lit="1000586"/></b>
                                                                <hr class="titulo"/>
                                                            </td>
                                                        </tr>                                                
                                                        <tr id="importes_detallados_recibo_children" style="display:none">
                                                            <td align="left">
                                                                <table class="area" align="center">
                                                                     <tr>
                                                                        <th style="width:100%;height:0px"></th>
                                                                    </tr>
                                                                    <tr> 
                                                                        <c:forEach items="${__formdata.OB_IAX_RECIBOS.DETRECIBO}" var="DETRECIBO" varStatus="status">                                                                        
                                                                        <table class="area" align="center">
                                                                            <%-- 1 Subsección por cada DETRECIBO --%>
                                                                            <tr>
                                                                                <th style="width:100%;height:0px"></th>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="campocaja">
                                                                                    <img id="importes_detallados_${status.count}_recibo_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('importes_detallados_${status.count}_recibo', this)" style="cursor:pointer"/> 
                                                                                    <b>${DETRECIBO.OB_IAX_DETRECIBO.TCONCEP} </b> <fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${DETRECIBO.OB_IAX_DETRECIBO.ICONCEP}'/>
                                                                                    <hr class="titulo"/>
                                                                                </td>
                                                                            </tr>                                                
                                                                            <tr id="importes_detallados_${status.count}_recibo_children" style="display:none">
                                                                                <td align="left">
                                                                                    <table class="area" align="center">
                                                                                         <tr>
                                                                                            <th style="width:100%;height:0px"></th>
                                                                                        </tr>
                                                                                        <tr>                                    
                                                                                            <td class="titulocaja">
                                                                                                <%-- DisplayTag para DETRECIBO_DET de cada DETRECIBO! --%>                                                                                                
                                                                                                <c:set var="title0"><axis:alt f="axisadm003" c="LIT_NRIESGO0" lit="800440"/> <axis:alt f="axisadm003" c="LIT_NRIESGO" lit="100649"/>  </c:set>  <%-- Nº Riesgo --%>
                                                                                                <c:set var="title1"><axis:alt f="axisadm003" c="LIT_TRIESGO" lit="100649"/></c:set>  <%-- Riesgo --%>
                                                                                                <c:set var="title2"><axis:alt f="axisadm003" c="LIT_NGARANT" lit="110994"/></c:set>  <%-- Garantía --%>
                                                                                                <c:set var="title3"><axis:alt f="axisadm003" c="LIT_TGARANT" lit="9901338"/></c:set>  <%-- Desc.garantía --%> 
                                                                                                <c:set var="title4"><axis:alt f="axisadm003" c="LIT_ICONCEP" lit="100563"/> </c:set> <%-- Importe --%>                                                                                                
                                                                                                
                                                                                                <div class="seccion displayspace">                                                                                                
                                                                                                    <display:table name="${DETRECIBO.OB_IAX_DETRECIBO.DETRECIBO_DET}" id="DETRECIBO_DET" export="false" class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                                                         requestURI="axis_axisadm003.do?paginar=true&subseccion=importes_detallados_${status.count}_recibo">
                                                                                                        <%@ include file="../include/displaytag.jsp"%>
                                                                                                        <axis:visible f="axisadm003" c="NRIESGO">
                                                                                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_DETRECIBO.NRIESGO" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                                                                            <div class="dspText">${DETRECIBO_DET.OB_IAX_DETRECIBO_DET.NRIESGO}</div> 
                                                                                                        </display:column>
                                                                                                        </axis:visible>
                                                                                                        <axis:visible f="axisadm003" c="TRIESGO" >
                                                                                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_DETRECIBO_DET.TRIESGO" headerClass="sortable"  media="html" autolink="false">
                                                                                                            <div class="dspText">${DETRECIBO_DET.OB_IAX_DETRECIBO_DET.TRIESGO}</div> 
                                                                                                        </display:column>
                                                                                                        </axis:visible>
                                                                                                        <axis:visible f="axisadm003" c="CGARANT" >
                                                                                                        <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_DETRECIBO_DET.CGARANT" headerClass="headwidth10 sortable"  media="html" autolink="false">                                                                    
                                                                                                            <div class="dspText">${DETRECIBO_DET.OB_IAX_DETRECIBO_DET.CGARANT}</div> 
                                                                                                        </display:column>
                                                                                                        </axis:visible>
                                                                                                        <axis:visible f="axisadm003" c="TGARANT" >
                                                                                                        <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_DETRECIBO_DET.TGARANT" headerClass="sortable"  media="html" autolink="false">
                                                                                                            <div class="dspText">${DETRECIBO_DET.OB_IAX_DETRECIBO_DET.TGARANT}</div> 
                                                                                                        </display:column>
                                                                                                        </axis:visible>
                                                                                                        <axis:visible f="axisadm003" c="ICONCEP" >
                                                                                                        <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_DETRECIBO_DET.ICONCEP" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                                                                            <div class="dspText"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${DETRECIBO_DET.OB_IAX_DETRECIBO_DET.ICONCEP}'/></div> 
                                                                                                        </display:column>
                                                                                                        </axis:visible>
                                                                                                    </display:table>
                                                                                                </div>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        </c:forEach>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </tr>
										 <%-- INI IAXIS-3591 - HB -  25/04/2019--%>
											 </axis:visible>
										<tr><td align="left">
                                    <table class="area" align="center">
	                                    <tr>
	                                        <th style="width:100%;height:0px"></th>
	                                    </tr>
	                                    <tr>
	                                        <td class="campocaja">
	                                            <img id="importes_detallados_parent" src="images/mes.gif" 
	                                            onclick="objEstilos.toggleDisplay('importes_detallados', this)" style="cursor:pointer"/> 
	                                            <b><axis:alt f="axisadm003" c="IRECIBO1" lit="1000586"/></b>
	                                            <hr class="titulo"/>
	                                        </td>
	                                    </tr>
	                                    <tr id="importes_detallados_children" style="display: none;">
											<td align="left">
												<table class="area" align="center">
													<tr>
														<th style="width: 100%; height: 0px"></th>
													</tr>
													<tr>
														<td class="campocaja">
	                                                       <img id="importes_detallados_1_parent" src="images/mes.gif" 
	                                                       onclick="objEstilos.toggleDisplay('importes_detallados_1', this)" 
	                                                       style="cursor:pointer"/> 
	                                                       <b><axis:alt f="axisadm003" c="IRECIBO" lit="1000582"/></b>
	                                                       <hr class="titulo"/>
	                                                    </td>
													</tr>
													<tr id="importes_detallados_1_children"
														style="display: none">
														<td align="left">
															<table class="area" align="center">
															   <tr>
																   <th style="width:20%;height:0px"></th>
				                                                   <th style="width:20%;height:0px"></th>
				                                                   <th style="width:20%;height:0px"></th>
				                                                   <th style="width:20%;height:0px"></th>
				                                                   <th style="width:20%;height:0px"></th>                                                    
                                                			   </tr>
															   <tr>
																  <axis:ocultar c="IPRINET" f="axisadm003" dejarHueco="false">
																    <td class="titulocaja" id="tit_IPRINET"><b>
																    <axis:alt f="axisadm003" c="IPRINET" lit="102995" /></b>
											                        </td>
											                      </axis:ocultar>
											                   </tr>    
											                   <tr>
											                    <axis:ocultar c="IPRINET" f="axisadm003" dejarHueco="false">
											                        <td class="campocaja" id="td_IPRINET">
											                          <input type="text" class="campo campotexto" id="IPRINET" name="IPRINET" size="15" style="width: 75%"
												                      <axis:atr f="axisadm003" c="IPRINET" a="modificable=false&obligatorio=false&formato=decimal"/>
												                       onChange="javascript:f_calculoma(this);"
												                       <%-- INI -IAXIS-5119 - JLTS - 28/08/2019 Se ajusta el valor para que lo tome de la moneda COP--%>
												                      value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.ITOTPRI}'/>" />
												                       <%-- FIN -IAXIS-5119 - JLTS - 28/08/2019 --%>
												                    </td>
												                  </axis:ocultar>
											                   </tr>
											                   <tr>
											                      <axis:ocultar c="IIVA" f="axisadm003" dejarHueco="false">
																    <td class="titulocaja"><b id="label_IVA">
																      <axis:alt f="axisctr020" c="label_IVA" lit="1000253" /></b>
											                        </td>
											                      </axis:ocultar>
											                    </tr>
											                    <tr>
											                      <axis:ocultar c="IIVA" f="axisadm003" dejarHueco="false">
											                         <td class="campocaja" id="td_IIVA">
											                           <input type="text" class="campo campotexto" id="IIVA" name="IIVA"
												                         size="15" style="width: 75%"
												                         <axis:atr f="axisadm003" c="IIVA" a="modificable=false&obligatorio=false&formato=decimal"/>
												                         onChange="javascript:f_calculoma(this);"
																		 <%-- INI -IAXIS-5119 - JLTS - 28/08/2019 Se ajusta el valor para que lo tome de la moneda COP--%>
																		 value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.ITOTIMP}'/>" />
																		 <%-- FIN -IAXIS-5119 - JLTS - 28/08/2019 --%>
											                         </td>
											                      </axis:ocultar>
											                    </tr>
															   <tr>
																  <axis:ocultar c="IGASTOS" f="axisadm003" dejarHueco="false">
																    <td class="titulocaja"><b id="label_GASTOS">
																      <axis:alt f="axisctr020" c="label_GASTOS" lit="108480" /></b> 
											                        </td>
											                      </axis:ocultar>
											                   </tr> 
											                   <tr>
											                     <axis:ocultar c="IGASTOS" f="axisadm003" dejarHueco="false">
											                       <td class="campocaja" id="td_IGASTOS">
											                         <input type="text" class="campo campotexto" id="IGASTOS" name="IGASTOS"
												                      size="15" style="width: 75%" <axis:atr f="axisadm003" c="IGASTOS" a="modificable=false&obligatorio=false&formato=decimal"/>
												                      onChange="javascript:f_calculoma(this);"
												                      <%-- INI -IAXIS-5119 - JLTS - 28/08/2019 Se ajusta el valor para que lo tome de la moneda COP--%>
												                      value="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONEDAPROD]}"
										                                      value="${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.ITOTREC}" />" />
										                                      <%-- FIN -IAXIS-5119 - JLTS - 28/08/2019 --%>
											                       </td>
											                     </axis:ocultar>	
											                   </tr>  
															</table>
														</td>
													</tr>
													<tr>
														<td class="campocaja">
	                                                        <img id="importes_detallados_2_parent" src="images/mes.gif" 
	                                                        onclick="objEstilos.toggleDisplay('importes_detallados_2', this)"
	                                                        style="cursor:pointer"/> 
	                                                        <b><axis:alt f="axisadm003" c="ICOMISIONES" lit="105048"/></b>
	                                                        <hr class="titulo"/>
	                                                   </td>
	                                                </tr>
	                                                <tr id="importes_detallados_2_children" style="display: none">
														<td align="left">
															<table class="area" align="center">
																<tr>
																	<th style="width: 100%; height: 0px"></th>
																</tr>
																<tr>
																  <td class="campocaja"   colspan="50">
																    <c:set var="title0"><axis:alt f="${pantalla}" c="TAGENTE" lit="9902363"/></c:set>
                                                                    <c:set var="title1"><axis:alt f="${pantalla}" c="ICOMISI" lit="9903058"/></c:set>
                                                                    <c:set var="title2"><axis:alt f="${pantalla}" c="IVACOMISI" lit="1000253"/></c:set>
										                            <div class="displayspace" colspan="50">
										                              <display:table name="${listaValoresCorretaje}" id="corretaje" export="false" class="dsptgtable" pagesize="-1" defaultsort="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" >
										                                  <%@ include file="../include/displaytag.jsp"%>
										                                <display:column title="${title0}" sortable="false" sortProperty="TAGENTE" headerClass="headwidth15 sortable"  media="html" autolink="false" >
										                                  <div class="dspText">${corretaje.CAGENTE} - ${corretaje.TDESAGE}</div>
										                                </display:column>
										                                <display:column title="${title1}" sortable="false" sortProperty="ICOMISI" headerClass="headwidth10 sortable"  media="html" autolink="false" >
										                                  <div class="dspNumber"><fmt:formatNumber value="${corretaje.ICOMBRU}" /></div>
										                                </display:column>
										                                <%-- INI -IAXIS-4156 - SGM - comision iva --%>
										                                <display:column title="${title2}" sortable="false" sortProperty="IVACOMISI" headerClass="headwidth10 sortable"  media="html" autolink="false" >
										                                  <div class="dspNumber"><fmt:formatNumber value="${corretaje.IVACOMIS}" /></div>
										                                </display:column>
										                                <%-- FIN -IAXIS-4156 - SGM - comision iva --%>										                                
										                              </display:table>
										                            </div>
                                                                  </td>
						                                        </tr>								
															</table>
								                    	</td>
													</tr>
													<tr>
	                                                    <td class="campocaja">
	                                                        <img id="importes_detallados_3_parent" src="images/mes.gif" 
	                                                        onclick="objEstilos.toggleDisplay('importes_detallados_3', this)" 
	                                                        style="cursor:pointer"/> 
	                                                        <b><axis:alt f="axisadm003" c="IRECIBO" lit="105387"/></b>
	                                                        <hr class="titulo"/>
	                                                    </td>
													</tr>
													<tr id="importes_detallados_3_children" style="display: none">
														<td align="left">
															<table class="area" align="center">
																<tr>
																	<th style="width: 100%; height: 0px"></th>
																</tr>
																<tr>
																<td class="campocaja">
	                                                        <img id="importes_detallados_31_parent" src="images/mes.gif" 
	                                                        onclick="objEstilos.toggleDisplay('importes_detallados_31', this)" 
	                                                        style="cursor:pointer"/> 
	                                                        <b><axis:alt f="axisadm003" c="ICOACED" lit="103227"/></b>
	                                                        <hr class="titulo"/>
	                                                    </td>
																</tr>
																<tr id="importes_detallados_31_children" style="display: none">
																  <td class="campocaja"   colspan="50">
																    <c:set var="title0"><axis:alt f="${pantalla}" c="TDESCOM" lit="9000600"/></c:set>
                                                                    <c:set var="title1"><axis:alt f="${pantalla}" c="IIMPCOM" lit="9904351"/></c:set>
										                            <div class="displayspace" colspan="50">
										                              <display:table name="${detalleCompaniasCoa}" id="companias" export="false" class="dsptgtable" pagesize="-1" defaultsort="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" >
										                                  <%@ include file="../include/displaytag.jsp"%>
										                                <display:column title="${title0}" sortable="false" sortProperty="TDESCOM" headerClass="headwidth15 sortable"  media="html" autolink="false" >
										                                  <div class="dspText">${companias.TDESCOMP}</div>
										                                </display:column>
										                                <display:column title="${title1}" sortable="false" sortProperty="IIMPCOM" headerClass="headwidth10 sortable"  media="html" autolink="false" >
										                                  <div class="dspNumber"><fmt:formatNumber pattern="###,##0.00" value="${companias.IIMPCOM}" /></div>
										                                </display:column>
										                              </display:table>
										                            </div>
                                                                  </td>
																
																</tr>
																<tr>
																<td class="campocaja">
	                                                        <img id="importes_detallados_32_parent" src="images/mes.gif" 
	                                                        onclick="objEstilos.toggleDisplay('importes_detallados_32', this)" 
	                                                        style="cursor:pointer"/> 
	                                                        <b><axis:alt f="axisadm003" c="ICAACEP" lit="103228"/></b>
	                                                        <hr class="titulo"/>
	                                                    </td>
																</tr>
																<tr id="importes_detallados_32_children"
														style="display: none">
														<td align="left">
															<table class="area" align="center">
																<tr>
																	<th style="width: 100%; height: 0px"></th>
																</tr>
																<tr>	
																<c:if test="${DATCOASEGURO.TCOMPAN != null}">
																  <tr>
																    <td class="titulocaja"><b id="label_TCOMPAN"><axis:alt f="axisctr020" c="label_TCOMPAN" lit="9904142" /></b>
																    </td>
																  </tr>
																  <tr>
																    <td>
																      <input type="text"
																		style="width: 20%"
																		class="campowidthinput campo campotexto" id="TCOMPAN"
																		name="TCOMPAN"
																		title="<axis:alt f="axisadm003" c="label_TCOMPAN" lit="9904142"/>"
																		size="10" value="${DATCOASEGURO.TCOMPAN}"
																		<axis:atr f="axisadm003" c="TCOMPAN" a="modificable=false&obligatorio=false&formato=entero"/> />
																    </td>
																  </tr>
																  <tr>
																     <td class="titulocaja"><b id="label_IPRINET"><axis:alt f="axisctr020" c="label_IPRINET" lit="102995" /></b>
																     </td>
																  </tr>
																  <tr>
																    <td>
																      <%-- INI -IAXIS-4995 - JLTS - 08/08/2019 --%>

																    <input type="text" style="width: 10%" class="campowidthinput campo campotexto" id="IPRINET"
																	name="IPRINET" title="<axis:alt f="axisadm003" c="label_PLOCCOA" lit="9904141"/>"
																																		size="10"
																	value=<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value="${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.IPRINET}" /> 
																	<axis:atr f="axisadm003" c="IPRINET" a="modificable=false&obligatorio=false&formato=entero"/> />
																	 <%-- FIN -IAXIS-4995 - JLTS - 08/08/2019 --%>

																	</td>
																  </tr>
															    </c:if>
															  </tr>
													        </table></td></tr>
												          </table></td></tr>
												</table>
											</td>
										</tr>
	                                </table>
                                    </td></tr>	
                                    <%-- FIN IAXIS-3591 - HB -  25/04/2019--%>
                               <axis:visible f="axisadm003" c="SECMONINST" >
                                   <c:if test="${__defaultCMONINT != CMONEDAPROD}" >
                                       <c:import url="axisadm003_c.jsp"/>
                                   </c:if>
                               </axis:visible  >
                    </table>
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm003</c:param><c:param name="f">axisadm003</c:param><c:param name="f">axisadm003</c:param>
            <c:param name="f">axisadm003</c:param>
            <c:param name="__botones">salir<axis:visible f="axisadm003" c="BT_SAP" >,9904580</axis:visible><axis:visible f="axisadm003" c="BT_GUARDAR" >,1000081</axis:visible></c:param> 
        </c:import>
    
    </form>
    <script type="text/javascript">
    Calendar.setup({
        inputField     :    "FEFECTO",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FEFECTO", 
        singleClick    :    true,
        firstDay       :    1
    });
    

    Calendar.setup({
        inputField     :    "FVENCIM",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FVENCIM",  
        singleClick    :    true,
        firstDay       :    1
    });
</script>
    <c:import url="../include/mensajes.jsp"/>
</body>
</html>