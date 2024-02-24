<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%/*
*  Fichero: axisctr033.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a> 
*
*  Fecha: 14/10/2008
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="axis.util.Constantes" %>
<%@ page import="java.util.ArrayList" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axisctr033" c="EDITDATA" lit="9000494"/></title> <%-- EDICIÓN DATOS DE CIERRES --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
     <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
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
         		 <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisctr033');
					</c:if>
            revisarEstilos();
            f_cargar_propiedades_pantalla(); 
            f_carga_dependencias();
            if (${requestScope.buscarOK == true}) 
                parent.f_aceptar_modal('axisctr033');
            
            else if (${empty __configform.axisctr033__CAGENTE__visible || __configform.axisctr033__CAGENTE__visible})
                 document.getElementById("CAGENTE").focus();
                    
            else if (${empty __configform.axisctr033__CRAMO__visible || __configform.axisctr033__CRAMO__visible})
                document.getElementById("ramoProducto").focus();
                
            else
                document.getElementById("SPRODUC").focus();
         }       
     
        
        function f_but_cancelar() {
           parent.f_cerrar_modal('axisctr033');                      
        }
        
        function f_but_buscar() {
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario ("modal_axisctr033.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);                
            }
        }
        
    /*    function callbackAjaxCambiarAgente(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);

            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                objDom.setValorPorId("CAGENTE", CAGENTEformateado);
                objDom.setValorPorId("TAGENTE", NOMBREformateado);
            }// recarrega scroll pane
                $.reinitialiseScroll(); 
        }*/
        
        function callbackAjaxCambiarAgente(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);

                var ctipage_busc = document.getElementById("CTIPAGE_BUSC").value; 
                var donde = document.miForm.DONDE.value;
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                
                    if (donde == 1){
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                        objDom.setValorPorId("CAGENTE", CAGENTEformateado);
                        objDom.setValorPorId("TAGENTE", NOMBREformateado);
                        }
                    else{
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                        objDom.setValorPorId("CAGENTE_"+document.getElementById("CTIPAGE_BUSC").value, CAGENTEformateado);
                        objDom.setValorPorId("NOMBRE_"+document.getElementById("CTIPAGE_BUSC").value, NOMBREformateado);
                    }
                }
                 $.reinitialiseScroll(); 
            }
        
        function callbackAjaxCargarAgente(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            var elementos = doc.getElementsByTagName("element");

            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                    var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                    var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                    objDom.setValorPorId("CAGENTE", CAGENTEformateado);
                    objDom.setValorPorId("TAGENTE", NOMBREformateado);
                }
            }// recarrega scroll pane
                $.reinitialiseScroll(); 
             
        }
        
        
        function f_actualizar_agente(){
             objAjax.invokeAsyncCGI("modal_axisctr033.do", callbackAjaxCargarAgente,
                                    "operation=ajax_actualizar_agente&CAGENTE_COD=" + objDom.getValorComponente(document.miForm.CAGENTE),
                                    this, objJsMessages.jslit_cargando);
            
        }
        
       /* function f_abrir_axisctr014() {
            objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
        }*/
        
        function f_abrir_axisctr014(tipage) {        
                document.miForm.CTIPAGE_BUSC.value = tipage;
                
                if (!objUtiles.estaVacio(tipage)){
                    document.miForm.DONDE.value = 2;
                     oobjUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=CTIPAGECON_"+tipage);
                }else{
                 document.miForm.DONDE.value = 1;
                 objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
                } 
            }
        
        function f_cerrar_axisctr014() {
            objUtiles.cerrarModal("axisctr014");
        }    
       /* function f_aceptar_axisctr014 (CAGENTE){
            objAjax.invokeAsyncCGI("modal_axisctr033.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            f_cerrar_axisctr014();
            
        }*/
        
        function f_aceptar_axisctr014 (CAGENTE){
                //objDom.setValorPorId("CAGENTE", CAGENTE);            
                f_cerrar_axisctr014();
                if (!objUtiles.estaVacio(document.miForm.CTIPAGE_BUSC.value))
                    objAjax.invokeAsyncCGI("modal_axisctr033.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
                else
                {
                    objAjax.invokeAsyncCGI("modal_axisctr033.do", callbackAjaxCambiarAgente2, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
                }
            }
            
            function callbackAjaxCambiarAgente2(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
       
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                    var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                    objDom.setValorPorId("CAGENTE", CAGENTEformateado);
                  //  objDom.setValorPorId("TAGENTE", NOMBREformateado);
                }
            }
        
        function f_cargar_productos(){                
                CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
                 if (!objUtiles.estaVacio (CRAMO) ){
                objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                }else
                objDom.setValorComponente(document.miForm.CRAMO, null);
                objAjax.invokeAsyncCGI("modal_axisctr033.do", callbackAjaxCargarProductos, "operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO) + 
                    "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value, this, objJsMessages.jslit_cargando);
        }      
        
        
         /* *************************************  ACTUALIZAR COBJASE ***********************************        */  
        function f_cargar_cobjase(){
            f_carga_dependencias();
            SPRODUC = document.miForm.SPRODUC.value;
                if (!objUtiles.estaVacio(SPRODUC)){
                    objAjax.invokeAsyncCGI("modal_axisctr033.do", callbackAjaxCargarCobjase, "operation=ajax_busqueda_cobjase&SPRODUC=" + SPRODUC , this, objJsMessages.jslit_cargando); 
                } 
           }
           
        function callbackAjaxCargarCobjase (ajaxResponseText){
            //alert(ajaxResponseText);
            var doc=objAjax.domParse(ajaxResponseText);
            //alert("Entrada");
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var COBJASE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("COBJASE"), 0, 0);
                //antes de marcar, desmarcamos todos posibles, recorriendo todos los radios con id de "CTIPRIESGO_*"
                var radios=document.getElementsByTagName("input");
                for (var iradios=0;iradios<radios.length;iradios++) {
                    if (radios[iradios].id!=undefined&&radios[iradios].id.indexOf("CTIPRIESGO_")==0) {
                        radios[iradios].checked=false;
                    }
                }
                document.miForm.COBJASE.value = COBJASE;  
                try {
                    document.getElementById("CTIPRIESGO_"+COBJASE).checked = true;
                }
                catch(eee) {
                }
                f_carga_dependencias();
            }// recarrega scroll pane
                $.reinitialiseScroll(); 
        }
        /* *************************************  ACTUALIZAR COBJASE ***********************************        */   

        function callbackAjaxCargarProductos (ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("SPRODUC");
                
                var SPRODUCCombo = document.miForm.SPRODUC;     
                objDom.borrarOpcionesDeCombo(SPRODUCCombo);
               objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr033" c="SELECC" lit="108341"/> - ', SPRODUCCombo, 0);
                   for (i = 0; i < elementos.length; i++) {
                        var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                        var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                        objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                    }
            }// recarrega scroll pane
                $.reinitialiseScroll(); 
        } 
        
        function f_refrescarDependencias(valor){
           document.miForm.COBJASE.value = valor;  
           f_cargar_propiedades_pantalla();                  
        } 
        
            function f_formatdate(entrada,title){
                 var jDate = new JsFecha();
                    if(entrada.value.length>0){
                    calcula_ultimodia();
                        entrada.value=jDate.formateaFecha(entrada.value);
                    
                        if(jDate.validaFecha(entrada.value)){
                            entrada.value=jDate.formateaFecha(entrada.value);
                        }else{
                            alert("<axis:alt f="axislist002" c="VAL_FECHA" lit="1000421"/>");
                            entrada.value = '';
                        }
                    }else{entrada.value = '';}
            }
             
               function f_dias(mes,anno) {
                        switch (mes) {
                                case '01' : case '03' : case '05' : case '07' : case '08' : case '10' : case '12' : return 31;
                                    case '02' : return (anno % 4 == 0) ? 29 : 28;
                          }
                            return 30;  
                 }
   
                function calcula_ultimodia() {
                         /* cogemos valores */
                     var fechaini=document.miForm.FDESDE.value;
                         if ( fechaini.length == 10)
                           {
                             mes = fechaini.substring(3,5);
                            anno = fechaini.substring(6,fechaini.length);
                         if(document.miForm.CPREVIO.value=='1'&& document.miForm.CLISTADO.value=='505' && document.miForm.CEMPRES.value==12){
                                dia = f_dias(mes,anno);
                                document.miForm.FHASTA.value = (dia+"/"+mes+"/"+anno);
                                document.miForm.FHASTA.disabled=true;
                          
                              }else if(document.miForm.CPREVIO.value!='1')
                              {
                                    document.miForm.FHASTA.disabled=false;
                              }
                           
                         }
              
                }

			//INI Prodcuto - Actividad
            function f_cargar_actividad(){
				objAjax.invokeAsyncCGI("modal_axisctr033.do", callbackAjaxCargarActividades, "operation=ajax_busqueda_actividades&SPRODUC=" + objDom.getValorComponente(document.miForm.SPRODUC), this, objJsMessages.jslit_cargando);
			}
               
			function callbackAjaxCargarActividades (ajaxResponseText){
				var doc=objAjax.domParse(ajaxResponseText);
				if(!objAppMensajes.existenErroresEnAplicacion(doc)){
					var elementos = doc.getElementsByTagName("CACTIVI");
					var CACTIVICombo = document.miForm.CACTIVI;
					objDom.borrarOpcionesDeCombo(CACTIVICombo);
					objDom.addOpcionACombo("", '- <axis:alt f="axisctr017" c="SELECC" lit="108341"/> - ', CACTIVICombo, 0);
					
					for (i = 0; i < elementos.length; i++) {
						var CACTIVI = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CACTIVI"), i, 0);
						var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);
						objDom.addOpcionACombo(CACTIVI, TITULO, CACTIVICombo, i+1);
					}
				}
			}       
			//FIN Prodcuto - Actividad
                
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    <div id="wrapper" class="wrapper">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisctr033" c="BUSQRET" lit="9000538"/></c:param>     <%-- Buscador de propuestas retenidas --%>
                <c:param name="formulario"><axis:alt f="axisctr033" c="BUSQRET" lit="9000538"/></c:param> <%-- Buscador de propuestas retenidas --%>
                <c:param name="form">axisctr033</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisctr033" c="BUSAGE" lit="1000234" /></c:param>
            <c:param name="nid" value="axisctr014" />
        </c:import>
        
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
        <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
        <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
        <input type="hidden" id="COBJASE" name="COBJASE" value="${__formdata.COBJASE}"/> 
       
        <input type="hidden" name="DONDE" id="DONDE" value="${__formdata.DONDE}"/>  
        <input type="hidden" name="CTIPAGE_BUSC" id="CTIPAGE_BUSC" value="${__formdata.CTIPAGE_BUSC}"/>
        
        <%-- Bug 0027262/0027262 - 14/08/2013 - RCL - Autorzación masiva propuestas retenidas --%>
        <input type="hidden" name="PMODO" id="PMODO" value="${__formdata.PMODO}"/>
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>                    
                    <div class="titulo">
                    </div>                
                                <table class="seccion" align="center">
                                    <axis:visible c="DSP_TITULO_POL" f="axisctr033">
                                    <tr>
                                        <td class="titulo" colspan="10">          
                                            <img src="images/flecha.gif"/><b><axis:alt f="axisctr033" c="titulo" lit="103593" /> </b>
                                        </td> 
                                    </tr>
                                    </axis:visible>
                                    
                                    <tr>                                      
                                        <th style="width:25%;height:0%;"/>
                                        <th style="width:25%;height:0%;"/>
                                        <th style="width:25%;height:0%;"/>
                                        <th style="width:25%;height:0%;"/>
                                    </tr>
                                    
                                    <tr>
                                        <axis:ocultar f="axisctr033" c="CAGENTE" dejarHueco="false"> <!-- TODO C -->
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr033" c="CAGENTE" lit="100584"></axis:alt></b>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisctr033" c="CAGENTE" dejarHueco="false"> <!-- TODO C -->
                                            <td class="campocaja" colspan="2">
                                                <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CAGENTE}" name="CAGENTE" id="CAGENTE" title="<axis:alt f="axisctr033" c="CAGENTE" lit="100584"/>"  style="width:15%"
                                                title="<axis:alt f="axisctr033" c="CAGENTE" lit="100584"/>" onchange="f_actualizar_agente()" />
                                                <axis:visible f="axisctr033" c="BT_BUSCAR_AGENTE">
                                                	<img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                                </axis:visible>
                                                <input type="text" class="campo campotexto" value="${__formdata.TAGENTE}" name="TAGENTE" id="TAGENTE" title="<axis:alt f="axisctr033" c="CAGENTE" lit="100584"/>" size="15" style="width:76%" readonly="true"
                                                title="<axis:alt f="axisctr033" c="CAGENTE" lit="100584"/>"/>
                                            </td>
                                        </axis:ocultar>                            
                                    </tr>
                                    <tr>
                                <td colspan="6">
                                <axis:ocultar f="axisctr033" c="DSP_NIVELES">
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:16%;height:0%;"/>
                                            <th style="width:16%;height:0%;"/>
                                            <th style="width:16%;height:0%;"/>
                                            <th style="width:16%;height:0%;"/>
                                            <th style="width:16%;height:0%;"/>
                                            <th style="width:16%;height:0%;"/>
                                        </tr>
                                       <%  HashMap formdata = (HashMap)request.getAttribute(Constantes.FORMDATA);  %>
                                                             
                                        <tr>
                                            <%  // Recuperamos parámetros de búsqueda si se ha efectuado alguna
                                                ArrayList niveles_age = null;
                                                if (request.getSession().getAttribute("AGENIVELES") != null){
                                                    niveles_age= (ArrayList)request.getSession().getAttribute("AGENIVELES");
                                                }
                                            %>
                                            <%if(niveles_age!=null){
                                                  for (int j=0;j<niveles_age.size();j=j+3){ 
                                                    if(j< niveles_age.size() &&((HashMap)niveles_age.get(j)).get("DESCRIP")!=null ) { %>
                                                        <c:set var="CTIPAGE_DESC"><%=((HashMap)niveles_age.get(j)).get("DESCRIP")%></c:set>
                                                        <c:set var="CTIPAGE"><%=((HashMap)niveles_age.get(j)).get("CTIPAGE")%></c:set>
                                                        <%if(j+1< niveles_age.size()) { %>
                                                            <c:set var="CTIPAGE_DESC1"><%=((HashMap)niveles_age.get(j+1)).get("DESCRIP")%></c:set>
                                                            <c:set var="CTIPAGE1"><%=((HashMap)niveles_age.get(j+1)).get("CTIPAGE")%></c:set>
                                                        <%}%>
                                                        <%if(j+2< niveles_age.size()) { %>
                                                            <c:set var="CTIPAGE_DESC2"><%=((HashMap)niveles_age.get(j+2)).get("DESCRIP")%></c:set>
                                                            <c:set var="CTIPAGE2"><%=((HashMap)niveles_age.get(j+2)).get("CTIPAGE")%></c:set>
                                                        <%}%>
                                                        <tr>
                                                            <td class="titulocaja" colspan="2">
                                                                <b><axis:alt f="axisctr033" c="TIPDESC_<%=j%>" lit="${CTIPAGE_DESC}"></axis:alt></b>
                                                            </td>
                                                            <%if(j+1< niveles_age.size()) { %>
                                                                <td class="titulocaja" colspan="2">
                                                                    <b><axis:alt f="axisctr033" c="TIPDESC_<%=j+1%>" lit="${CTIPAGE_DESC1}"></axis:alt></b>
                                                                </td>
                                                            <%}%>
                                                            <%if(j+2< niveles_age.size()) { %>
                                                                <td class="titulocaja" colspan="2">
                                                                    <b><axis:alt f="axisctr033" c="TIPDESC_<%=j+2%>" lit="${CTIPAGE_DESC2}"></axis:alt></b>
                                                                </td>
                                                            <%}%>
                                                        <tr>
                                                            <td class="campocaja" colspan="2">
                                                                <% if(formdata.get("CAGENTE_"+ ((HashMap)niveles_age.get(j)).get("CTIPAGE")) != null){ %>
                                                                        <c:set var= "b"><%=formdata.get("CAGENTE_"+ ((HashMap)niveles_age.get(j)).get("CTIPAGE"))%></c:set>
                                                                <% } %>
                                                                <% if(formdata.get("NOMBRE_"+ ((HashMap)niveles_age.get(j)).get("CTIPAGE")) != null){ %>
                                                                        <c:set var= "c"><%=formdata.get("NOMBRE_"+ ((HashMap)niveles_age.get(j)).get("CTIPAGE"))%></c:set>
                                                                <% } %>
                                                                <input readonly="true" type="text" name="CAGENTE_<%=((HashMap)niveles_age.get(j)).get("CTIPAGE")%>" title="${CTIPAGE_DESC}" id="CAGENTE_<%=((HashMap)niveles_age.get(j)).get("CTIPAGE")%>"
                                                                value="${b}" class="campowidthinput campo campotexto" style="width:20%" formato="entero" onchange="f_actualizar_agente()" />
                                                                <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014(${CTIPAGE})" style="cursor:pointer"/>
                                                                <input readonly="true" type="text" name="NOMBRE_<%=((HashMap)niveles_age.get(j)).get("CTIPAGE")%>" id="NOMBRE_<%=((HashMap)niveles_age.get(j)).get("CTIPAGE")%>" value="${c}" class="campowidthinput campo campotexto" style="width:70%" />
                                                            </td>
                                                            <%if(j+1< niveles_age.size()) { %>
                                                                <td class="campocaja" colspan="2">
                                                                    <% if(formdata.get("CAGENTE_"+ ((HashMap)niveles_age.get(j+1)).get("CTIPAGE")) != null){ %>
                                                                        <c:set var= "d"><%=formdata.get("CAGENTE_"+ ((HashMap)niveles_age.get(j+1)).get("CTIPAGE"))%></c:set>
                                                                    <% } %>
                                                                    <% if(formdata.get("NOMBRE_"+ ((HashMap)niveles_age.get(j+1)).get("CTIPAGE")) != null){ %>
                                                                        <c:set var= "e"><%=formdata.get("NOMBRE_"+ ((HashMap)niveles_age.get(j+1)).get("CTIPAGE"))%></c:set>
                                                                    <% } %>
                                                                    <input readonly="true" type="text" name="CAGENTE_<%=((HashMap)niveles_age.get(j+1)).get("CTIPAGE")%>" title="${CTIPAGE_DESC1}" id="CAGENTE_<%=((HashMap)niveles_age.get(j+1)).get("CTIPAGE")%>"
                                                                    value="${d}" class="campowidthinput campo campotexto" style="width:20%" formato="entero" onchange="f_actualizar_agente()" />
                                                                    <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014(${CTIPAGE1})" style="cursor:pointer"/> 
                                                                    <input readonly="true" type="text" name="NOMBRE_<%=((HashMap)niveles_age.get(j+1)).get("CTIPAGE")%>" id="NOMBRE_<%=((HashMap)niveles_age.get(j+1)).get("CTIPAGE")%>" value="${e}" class="campowidthinput campo campotexto" style="width:70%" />
                                                                </td>
                                                            <%}%>
                                                            <%if(j+2< niveles_age.size()) { %>
                                                                <td class="campocaja" colspan="2">
                                                                    <% if(formdata.get("CAGENTE_"+ ((HashMap)niveles_age.get(j+2)).get("CTIPAGE")) != null){ %>
                                                                        <c:set var= "f"><%=formdata.get("CAGENTE_"+ ((HashMap)niveles_age.get(j+2)).get("CTIPAGE"))%></c:set>
                                                                    <% } %>
                                                                    <% if(formdata.get("NOMBRE_"+ ((HashMap)niveles_age.get(j+2)).get("CTIPAGE")) != null){ %>
                                                                        <c:set var= "g"><%=formdata.get("NOMBRE_"+ ((HashMap)niveles_age.get(j+2)).get("CTIPAGE"))%></c:set>
                                                                    <% } %>
                                                                    <input readonly="true" type="text" name="CAGENTE_<%=((HashMap)niveles_age.get(j+2)).get("CTIPAGE")%>" title="${CTIPAGE_DESC2}" id="CAGENTE_<%=((HashMap)niveles_age.get(j+2)).get("CTIPAGE")%>"
                                                                    value="${f}" class="campowidthinput campo campotexto" style="width:20%" formato="entero" onchange="f_actualizar_agente()" />
                                                                    <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014(${CTIPAGE2})" style="cursor:pointer"/>  
                                                                    <input readonly="true" type="text" name="NOMBRE_<%=((HashMap)niveles_age.get(j+2)).get("CTIPAGE")%>" id="NOMBRE_<%=((HashMap)niveles_age.get(j+2)).get("CTIPAGE")%>" value="${g}" class="campowidthinput campo campotexto" style="width:70%"/>
                                                                </td>
                                                            <%}%>
                                                        </tr>
                                                    <%}%>
                                                <%}%>
                                            <%}%>
                                        </tr>
                                    </table>
                                </axis:ocultar>
                                </td>
                            </tr>
                                    <tr>
                                        <axis:ocultar f="axisctr033" c="CRAMO" dejarHueco="false"> <!-- TODO C -->
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr033" c="CRAMO" lit="100784"></axis:alt></b>
                                            </td>
                                        </axis:ocultar>
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisctr033" c="PROD" lit="100829"/></b>  
                                        </td>                                       
                                		<td class="titulocaja" colspan="2">
                                    		<b><axis:alt c="CACTIVI" f="axisctr033" lit="89906247"/></b> <%-- Actividad --%>
                                		</td>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisctr033" c="CRAMO" dejarHueco="false"> <!-- TODO C -->
                                           <td class="campocaja">
                                                <select name = "ramoProducto" id="ramoProducto" style="width:200px;" id ="ramoProducto" size="1" onchange="f_cargar_productos()" class="campowidthselect campo campotexto">
                                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr033" c="SELECC" lit="108341"/> - </option>
                                                    <c:forEach var="ramos" items="${__formdata.LISTVALORES.listaRamos}">
                                                        <option value = "${ramos.CRAMO}/${ramos.TRAMO}"
                                                            <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>
                                                            ${ramos.TRAMO}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </axis:ocultar> 
                                        <td class="campocaja" colspan="2">                                
                                            <select name="SPRODUC" id="SPRODUC" size="1" class="campowidthselect campo campotexto" style="width:75%;" onchange="f_cargar_cobjase(); f_cargar_actividad();">&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr033" c="SELEC" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.LISTVALORES.PRODUCTOS}">
                                                    <option value = "${element.SPRODUC}"
                                                    <c:if test="${__formdata.SPRODUC == element.SPRODUC}"> selected = "selected"</c:if>>
                                                        ${element.TTITULO} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>                                       
		                                <td class="campocaja" colspan="2">
		                                    <select name="CACTIVI" title="<axis:alt f="axisctr017" c="CACTIVI" lit="89906247"/>" id="CACTIVI" size="1" class="campowidthselect campo campotexto" style="width:25%;"
		                                       <axis:atr f="axisctr017" c="CACTIVI" a="isInputText=false"/> >&nbsp;
		                                            <option value=""> - <axis:alt f="axisctr017" c="SELECC" lit="108341"/> - </option> 
		                                           <c:forEach var="element" items="${__formdata.LISTVALORES.listaActividades}">
		                                               <option value="${element.CACTIVI}"
		                                               <c:if test="${__formdata.CACTIVI == element.CACTIVI}" >  selected="selected"</c:if>>
		                                                   ${element.TTITULO}   
		                                               </option>
		                                           </c:forEach>
		                                    </select>
		                                </td>            
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr033" c="NPOLIZA" lit="100836"/></b> <%-- Póliza --%>
                                        </td>
                                        
                                        <td class="titulocaja">
                                            <c:if test="${requestScope.NPOLIZAENEMISION == 0}">
                                                <b><axis:alt f="axisctr033" c="NSOLICI" lit="109528"/></b> <%-- Solicitud --%>
                                            </c:if>
                                        </td>
                                        <axis:ocultar f="axisctr033" c="FCANCEL" dejarHueco="false"> 
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr033" c="FCANCEL" lit="9000539"/></b> <%-- F. Cancelación --%>
                                        </td>
                                    	  </axis:ocultar>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td class="campocaja">                             
                                            <input type="text" class="campowidthinput campo campotexto" size="15" 
                                            value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA" 
                                            style="width:67%;" title="<axis:alt f="axisctr033" c="NPOLIZA" lit="100836"/>"
                                            <axis:atr f="axisctr033" c="NPOLIZA" a="formato=entero"/> />
                                        </td>
                                        <td class="campocaja">                             
                                            <c:if test="${requestScope.NPOLIZAENEMISION == 0}">
                                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                value="${__formdata.NSOLICI}" name="NSOLICI" id="NSOLICI" 
                                                style="width:67%;" title="<axis:alt f="axisctr033" c="NSOLICI" lit="109528"/>"
                                                <axis:atr f="axisctr033" c="NSOLICI" a="formato=entero"/> />
                                            </c:if>
                                        </td>
                                        <axis:ocultar f="axisctr033" c="FCANCEL" dejarHueco="false"> 
                                        <td class="campocaja">                             
                                            <input type="text" class="campowidthinput campo campotexto" size="15" 
                                            value="<fmt:formatDate value='${__formdata.FCANCEL}' pattern='dd/MM/yyyy'/>" name="FCANCEL" id="FCANCEL"
                                            style="width:60%;" <axis:atr f="axisctr033" c="FCANCEL" a="formato=fecha"/>
                                            title="<axis:alt f="axisctr033" c="FCANCEL" lit="9000539"/>"/><a id="icon_FCANCEL" style="vertical-align:middle;"><img 
                                            alt="<axis:alt f="axisctr033" c="SELECC" lit="108341"/>" title="<axis:alt f="axisctr033" c="FCANCEL" lit="9000539" />" src="images/calendar.gif"/></a>
                                        </td>
                                      </axis:ocultar>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                    </tr>                                    
                                    </table>
                                    
                                    <%--Segunda Sección--%>
                                    <div class="separador">&nbsp;</div>
                                    <table class="seccion" align="center">
                                    <tr>                                      
                                        <th style="width:25%;height:0%;"/>
                                        <th style="width:25%;height:0%;"/>
                                        <th style="width:25%;height:0%;"/>
                                        <th style="width:25%;height:0%;"/>
                                    </tr>                                   
                                    
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr033" c="NIF" lit="9000760"/></b> <%-- NIF --%>
                                        </td>         
                                        <axis:ocultar f="axisctr033" c="SNIP" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr033" c="IDEXT" lit="1000088"/></b>  <%-- Identificador externo --%>
                                            </td>
                                        </axis:ocultar>
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisctr033" c="TOMADOR" lit="101027"/></b>  <%-- Tomador --%>
                                        </td>
                                                                           
                                    </tr>
                                    <tr>                              
                                        <td class="campocaja">                                
                                            <input type="text" class="campowidthinput campo campotexto" size="15" 
                                            value="${__formdata.NUMIDE}" name="NUMIDE" id="NUMIDE" 
                                            style="width:67%;" title="<axis:alt f="axisctr033" c="NUMIDE" lit="105904"/>"/>
                                        </td>                     
                                        <axis:ocultar f="axisctr033" c="SNIP" dejarHueco="false">
                                            <td class="campocaja">                                
                                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                value="${__formdata.SNIP}" name="SNIP" id="SNIP" 
                                                style="width:67%;" title="<axis:alt f="axisctr033" c="SNIP" lit="1000245"/>"/>
                                            </td>  
                                        </axis:ocultar>
                                        <td class="campocaja" colspan="2">                                
                                            <input type="text" class="campowidthinput campo campotexto" size="15" 
                                            value="${__formdata.NOMBRE}" name="NOMBRE" id="NOMBRE" 
                                            style="width:67%;" title="<axis:alt f="axisctr033" c="TOMADOR" lit="101027"/>"/>
                                        </td>                     
                                    </tr>   
		                            <!-- Asegurado -->
		                            <tr>
		                                <td class="titulocaja" >
		                                    <b><axis:alt f="axisctr017" c="NIF" lit="9000760" /></b>
		                                </td>
		                                <td class="titulocaja" colspan="2">
		                                    <b><axis:alt f="axisctr017" c="ASEGURADO" lit="101028" /></b>
		                                </td>
		                            </tr>
		                            <tr>
		                            <td class="campocaja" >
		                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:67%;" value="${__formdata['NUMIDEASE']}" name="NUMIDEASE" id="NUMIDEASE"/>
		                                </td>
		                                <td class="campocaja" colspan="2">
		                                    <input type="text" class="campowidthinput campo campotexto" style="width:67%;" value="${__formdata['NOMBREASE']}" name="NOMBREASE" id="NOMBREASE" size="15"/>
		                                </td>
		                            </tr>
                                   </table>   
                                    <div class="separador">&nbsp;</div>   
                        <!-- Bug 25177/133016 - 09/01/2013 - AMC   -->
                        <c:if test="${!empty LST_TIPRIESGO}">
                        <table>
                            <tr>       
                                <td class="titulo">
                                   <img src="images/flecha.gif"/> <b><axis:alt f="axisctr033" c="DATOSRIESGO" lit="151604" /> </b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table class="seccion">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        
                                        <tr>
                                        
                                             <c:forEach items="${LST_TIPRIESGO}" var="item" varStatus="status" >
                                                 <td class="titulocaja">
                                                    <b>${item.TATRIBU}?</b>
                                                    <input type="radio" id="CTIPRIESGO_${item.CATRIBU}" name="CTIPRIESGO" value="${item.CATRIBU}" onclick="f_refrescarDependencias('${item.CATRIBU}');" <c:if test="${__formdata['COBJASE'] == item.CATRIBU}">checked</c:if>/>
                                                </td>
                                             </c:forEach>
                                        </tr> 
                                       <!--   **********************   SECCION DEPENDENCIAS ************************  -->
                                        <tr>
                                            <axis:ocultar f="axisctr033" c="CMATRICULA" dejarHueco="false"> 
                                                <td id="tit_CMATRICULA" class="titulocaja">
                                                    <b id="label_CMATRICULA"><axis:alt c="CMATRICULA" f="axisctr033" lit="9001057"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr033" c="CMOTOR" dejarHueco="false"> 
                                                <td id="tit_CMOTOR" class="titulocaja">
                                                    <b id="label_CMOTOR"><axis:alt c="CMOTOR" f="axisctr033" lit="9904654"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr033" c="CCHASIS" dejarHueco="false"> 
                                                <td id="tit_CCHASIS" class="titulocaja">
                                                    <b id="label_CCHASIS"><axis:alt c="CCHASIS" f="axisctr033" lit="9904655"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr033" c="NBASTID" dejarHueco="false"> 
                                                <td id="tit_NBASTID" class="titulocaja">
                                                    <b id="label_NBASTID"><axis:alt c="NBASTID" f="axisctr033" lit="9001061"/></b>
                                                </td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axisctr033" c="CPOSTAL" dejarHueco="false"> 
                                                <td id="tit_CPOSTAL" class="titulocaja">
                                                    <b id="label_CPOSTAL"><axis:alt c="CPOSTAL" f="axisctr033" lit="100823"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr033" c="TDOMICI" dejarHueco="false"> 
                                                <td id="tit_TDOMICI" class="titulocaja" colspan="2">
                                                    <b id="label_TDOMICI"><axis:alt c="TDOMICI" f="axisctr033" lit="9000914"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr033" c="DESCRIPCION" dejarHueco="false"> 
                                                <td id="tit_DESCRIPCION" class="titulocaja" colspan="2">
                                                    <b id="label_DESCRIPCION"><axis:alt c="DESCRIPCION" f="axisctr033" lit="100588"/></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisctr033" c="CMATRICULA" dejarHueco="false">
                                                <td id="td_CMATRICULA" class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="axisctr033" c="CMATRICULA" a="modificable=true"/> size="15" value="${__formdata.CMATRICULA}" name="CMATRICULA" id="CMATRICULA"
                                                     title="<axis:alt f="axisctr033" c="CMATRICULA" lit="9001057"/>"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr033" c="CMOTOR" dejarHueco="false">
                                                <td id="td_CMOTOR" class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="axisctr033" c="CMOTOR" a="modificable=true"/> size="15" value="${__formdata.CMOTOR}" name="CMOTOR" id="CMOTOR"
                                                     title="<axis:alt f="axisctr033" c="CMOTOR" lit="9904654"/>"
                                                     onchange="objValidador.f_validarCaracters(this,'%?*.;,:_-&$()!+°!?#$%&/()=¡Ñ\ ¡?#$%&/()=?¡*?][_:;?¿+?}{-.,|°¬\~')"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr033" c="CCHASIS" dejarHueco="false">
                                                <td id="td_CCHASIS" class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="axisctr033" c="CCHASIS" a="modificable=true"/> size="15" value="${__formdata.CCHASIS}" name="CCHASIS" id="CCHASIS"
                                                     title="<axis:alt f="axisctr033" c="CCHASIS" lit="9904655"/>"
                                                     onchange="objValidador.f_validarCaracters(this,'%?*.;,:_-&$()!+°!?#$%&/()=¡Ñ\ ¡?#$%&/()=?¡*?][_:;?¿+?}{-.,|°¬\~ÑOIQ')"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr033" c="NBASTID" dejarHueco="false">
                                                <td id="td_NBASTID" class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="axisctr033" c="NBASTID" a="modificable=true"/> size="15" value="${__formdata.NBASTID}" name="NBASTID" id="NBASTID"
                                                     title="<axis:alt f="axisctr033" c="NBASTID" lit="9001061"/>" onchange="objValidador.f_validarCaracters(this,'IOQÑ')"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr033" c="CPOSTAL" dejarHueco="false">
                                                <td id="td_CPOSTAL" class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="axisctr033" c="CPOSTAL" a="modificable=true"/> size="15" value="${__formdata.CPOSTAL}" name="CPOSTAL" id="CPOSTAL"
                                                     title="<axis:alt f="axisctr033" c="CPOSTAL" lit="100823"/>"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr033" c="TDOMICI" dejarHueco="false">
                                                <td id="td_TDOMICI" class="campocaja" colspan="2">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="axisctr033" c="TDOMICI" a="modificable=true"/> size="15" value="${__formdata.TDOMICI}" name="TDOMICI" id="TDOMICI"
                                                     title="<axis:alt f="axisctr033" c="TDOMICI" lit="9000914"/>"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr033" c="DESCRIPCION" dejarHueco="false">
                                                <td id="td_DESCRIPCION" class="campocaja" colspan="2">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="axisctr033" c="DESCRIPCION" a="modificable=true"/> size="15" value="${__formdata.DESCRPCION}" name="DESCRIPCION" id="DESCRIPCION"
                                                     title="<axis:alt f="axisctr033" c="DESCRIPCION" lit="100588"/>"/>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        </c:if>
                        <!-- Fin Bug 25177/133016 - 09/01/2013 - AMC   -->
                                   
                                    <%--Tercera Sección--%>
                                    <div class="separador">&nbsp;</div>
                                    <table class="seccion" align="center">
                                    <tr>                                      
                                        <th style="width:25%;height:0%;"/>
                                        <th style="width:25%;height:0%;"/>
                                        <th style="width:25%;height:0%;"/>
                                        <th style="width:25%;height:0%;"/>
                                    </tr>
                                    <tr>  
                                    
                                     <axis:ocultar f="axisctr033" c="CNIVELBPM" dejarHueco="false">
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr033" c="CNIVELBPM" lit="9902764"/></b>  <%-- Motivos retención --%>
                                        </td>
                                    </axis:ocultar>
                                     <axis:ocultar f="axisctr033" c="CMOTRET" dejarHueco="false">
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisctr033" c="MOTRETEN" lit="1000297"/></b>  <%-- Motivos retención --%>
                                        </td>
                                          </axis:ocultar>
                                     <axis:ocultar f="axisctr033" c="CESTGEST" dejarHueco="false">
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisctr033" c="ESTGEST" lit="9002157"/></b>  <%-- Estado gestión --%>
                                        </td>  
                                         </axis:ocultar>
                                      
				  <axis:ocultar f="axisctr033" c="PCPOLCIA" dejarHueco="false">
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr033" c="PCPOLCIA" lit="9906579"/></b>  <%-- Poliza partner --%>
                                        </td>
                                    </axis:ocultar>
                                          <axis:ocultar f="axisctr033" c="PFRETTEND" dejarHueco="false">
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr033" c="PFRETTEND" lit="9906577"/></b>  <%-- Motivos retención --%>
                                        </td>
                                    </axis:ocultar>
                                     <axis:ocultar f="axisctr033" c="PFRETTENH" dejarHueco="false">
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr033" c="PFRETTENDH" lit="9906578"/></b>  <%-- Motivos retención --%>
                                        </td>
                                    </axis:ocultar>
									
									     
                                    </tr>
                                    <tr>
                                     <axis:ocultar f="axisctr033" c="CNIVELBPM" dejarHueco="false">
                                        <td class="campocaja" >                                
                                            <select name="CNIVELBPM" id="CNIVELBPM" size="1" class="campowidthselect campo campotexto" style="width:65%;">&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr033" c="SELEC" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.LISTVALORES.listaniveles}">
                                                    <option value = "${element.CNIVEL}"
                                                    <c:if test="${__formdata.CNIVELBPM == element.CNIVEL}"> selected = "selected"</c:if>>
                                                        ${element.TNIVEL} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        </axis:ocultar>
                                     <axis:ocultar f="axisctr033" c="CMOTRET" dejarHueco="false">
                                        <td class="campocaja" colspan="2">                                
                                            <select name="CMOTRET" id="CMOTRET" size="1" class="campowidthselect campo campotexto" style="width:65%;">&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr033" c="SELEC" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.LISTVALORES.GSTPOLRETMOT}">
                                                    <option value = "${element.CATRIBU}"
                                                    <c:if test="${__formdata.CMOTRET == element.CATRIBU}"> selected = "selected"</c:if>>
                                                        ${element.TATRIBU} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        </axis:ocultar>
                                         <axis:ocultar f="axisctr033" c="CESTGEST" dejarHueco="false">
                                        <td class="campocaja" colspan="2">                                
                                            <select name="CESTGEST" id="CESTGEST" size="1" class="campowidthselect campo campotexto" style="width:65%;">&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr033" c="SELEC" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.LISTVALORES.GSTCESTGEST}">
                                                    <option value = "${element.CATRIBU}"
                                                    <c:if test="${__formdata.CESTGEST == element.CATRIBU}"> selected = "selected"</c:if>>
                                                        ${element.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>  
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr033" c="PCPOLCIA" dejarHueco="false">
                                  <td class="campocaja">                             
                                            <input type="text" class="campowidthinput campo campotexto" size="15" 
                                            value="${__formdata.PCPOLCIA}" name="PCPOLCIA" id="PCPOLCIA" 
                                            style="width:67%;" title="<axis:alt f="axisctr033" c="PCPOLCIA" lit="9906579"/>"
                                           />
                                        </td>
                                </axis:ocultar>
                                                                  
                                   <axis:ocultar f="axisctr033" c="PFRETTEND" dejarHueco="false">
                                        <td class="campocaja">
                                        
                                            <input type="text"  formato="fecha" 
                                            title="<axis:alt f="axisctr033"  c="PFRETTEND" lit="9906577"/>"
                                            onchange="f_formatdate(this);" <axis:atr f="axisctr033" c="PFRETTEND" a="modificable=true&isInputText=false"/>
                                                   name="PFRETTEND" id="PFRETTEND"  style="width:70%;"  value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.PFRETTEND}"/>"  class="campowidthinput campo campotexto"/>
                                            <a style="vertical-align:middle;">
                                            <img id="popup_calendario_PFRETTEND"  alt="<axis:alt f="axisctr033" c="IMG_PFRETTEND" lit="9906577"/>" title="<axis:alt f="axisctr033" c="IMG_PFRETTEND" lit="9906577" />" src="images/calendar.gif"/></a>
                                   
                                        </td>
                                         </axis:ocultar>        
                                        
                                         <axis:ocultar f="axisctr033" c="PFRETTENH" dejarHueco="false">
                                        <td class="campocaja">
                                        
                                            <input type="text"  formato="fecha" 
                                            title="<axis:alt f="axisctr033"  c="PFRETTENH" lit="9906578"/>"
                                            onchange="f_formatdate(this);" <axis:atr f="axisctr033" c="PFRETTEND" a="modificable=true&isInputText=false"/>
                                                   name="PFRETTENH" id="PFRETTENH"  style="width:70%;"  value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.PFRETTENH}"/>"  class="campowidthinput campo campotexto"/>
                                            <a id="icon_PFRETTENH" style="vertical-align:middle;">
                                            <img id="popup_calendario_PFRETTENH" alt="<axis:alt f="axisctr033" c="IMG_PFRETTENH" lit="9906578"/>" title="<axis:alt f="axislist002" c="IMG_PFRETTENH" lit="9906578" />" src="images/calendar.gif"/></a>
                                        </td>
                                         </axis:ocultar>                                         
                                  
                                  
               
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr033</c:param>
               <c:param name="f">axisctr033</c:param>
              <c:param name="__botones">cancelar,buscar</c:param>
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>

   

    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FCANCEL",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FCANCEL", 
            singleClick    :    true,
            firstDay       :    1
        });
          Calendar.setup({
                inputField     :    "PFRETTEND",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_PFRETTEND", 
                singleClick    :    true,
                firstDay       :    1
            });
            Calendar.setup({
                inputField     :    "PFRETTENH",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_PFRETTENH", 
                singleClick    :    true,
                firstDay       :    1
            });
     </script>
</div>
</body>
</html>
