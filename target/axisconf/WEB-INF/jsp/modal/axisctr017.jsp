<%/* Revision:# E10DfnWLriM7tN6NyaeV4Q== # */%>
<%
/**
*  Fichero: axisctr017.jsp
*  @author <a href = "mailto:echristen@csi-ti.com">Elmar Christen</a>
*  Fecha: 19/12/2007
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="axis.util.Constantes" %>
<%@ page import="java.util.ArrayList" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
     <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"></style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    
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
    
    
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">
        function f_onload() {
        	 <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
							retocarPAGE_CSS('axisctr017');
					</c:if>
        f_cargar_propiedades_pantalla();
        document.miForm.NPOLIZA.focus();
        <c:if test="${! empty sessionScope.axisctr017_lista && empty param.mantenerabierto}">
            parent.f_aceptar_axisctr017();
        </c:if>
               
        f_cargar_cobjase()
        
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axisctr017();
        }        
        
        function f_but_buscar() {
            if (objValidador.validaEntrada())
                objUtiles.ejecutarFormulario("modal_axisctr017.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }

        function f_actualizar_agente(){               
                 objAjax.invokeAsyncCGI("modal_axisctr017.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE_TEXT), this, objJsMessages.jslit_cargando);
         }
            
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/    
        
            function callbackAjaxCambiarAgente(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);

                var ctipage_busc = document.getElementById("CTIPAGE_BUSC").value; 
                var donde = document.miForm.DONDE.value;
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                
                    if (donde == 1){
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                        objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado);
                        objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);
                        }
                    else{
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                        objDom.setValorPorId("CAGENTE_"+document.getElementById("CTIPAGE_BUSC").value, CAGENTEformateado);
                        objDom.setValorPorId("NOMBRE_"+document.getElementById("CTIPAGE_BUSC").value, NOMBREformateado);
                    }
                }
            }
            
            
                 
            function callbackAjaxCargarAgente(ajaxResponseText){           
                var doc=objAjax.domParse(ajaxResponseText);
                
                var elementos = doc.getElementsByTagName("element");
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                        objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado); 
                        objDom.setValorPorId("CAGENTE", CAGENTEformateado); 
                        objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado); 
                    }else{
                        
                        objDom.setValorPorId("NOMBRE_TEXT",""); 
                        objDom.setValorPorId("CAGENTE_TEXT","");
                        objDom.setValorPorId("CAGENTE","");
                    }
            
                
                }
             
            }
            
            
            function f_abrir_axisctr014(tipage) {    
            	
                document.miForm.CTIPAGE_BUSC.value = tipage;
                
                if (!objUtiles.estaVacio(document.miForm.CTIPAGE_BUSC.value)){
                    document.miForm.DONDE.value = 2;
                    
                     objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=CTIPAGECON_"+tipage+"&CTIPAGE="+tipage);
                }else{
                	
                 document.miForm.DONDE.value = 1;
                 objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
                } 
            }
            
            function f_cerrar_axisctr014() {
                objUtiles.cerrarModal("axisctr014")
            }   
            
           
            
            function f_aceptar_axisctr014 (CAGENTE){
                //objDom.setValorPorId("CAGENTE", CAGENTE);            
                f_cerrar_axisctr014();
                if (!objUtiles.estaVacio(document.miForm.CTIPAGE_BUSC.value)){
                	objAjax.invokeAsyncCGI("modal_axisctr017.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
                }
                else
                {
                    objAjax.invokeAsyncCGI("modal_axisctr017.do", callbackAjaxCambiarAgente2, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
                }
            }
            
            function callbackAjaxCambiarAgente2(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
       
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                    var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                    objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado);
                    objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);
                }
            }
            
            function f_cargar_productos(){
                    CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
                     if (!objUtiles.estaVacio (CRAMO) ){
                    objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                    objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                    }else
                    objDom.setValorComponente(document.miForm.CRAMO, null);
                    objAjax.invokeAsyncCGI("modal_axisctr017.do", callbackAjaxCargarProductos, "operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO) + 
                        "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value, this, objJsMessages.jslit_cargando);
            }      

            function callbackAjaxCargarProductos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    
                    var SPRODUCCombo = document.miForm.SPRODUC;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr017" c="SELECC" lit="108341"/> - ', SPRODUCCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                        }
             

                }
            }       
            
            
        /*     *************************************  ACTUALIZAR COBJASE ***********************************        */  
        function f_cargar_cobjase(){
            f_carga_dependencias();
            SPRODUC = document.miForm.SPRODUC.value;
                if (!objUtiles.estaVacio(SPRODUC)){
                    objAjax.invokeAsyncCGI("modal_axisctr071.do", callbackAjaxCargarCobjase, "operation=ajax_busqueda_cobjase&SPRODUC=" + SPRODUC , this, objJsMessages.jslit_cargando); 
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
            }
        }
        /*     *************************************  ACTUALIZAR COBJASE ***********************************        */   
            

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
                function f_cargar_actividad(){
                     objAjax.invokeAsyncCGI("modal_axisctr017.do", callbackAjaxCargarActividades, "operation=ajax_busqueda_actividades&SPRODUC=" + objDom.getValorComponente(document.miForm.SPRODUC), this, objJsMessages.jslit_cargando);
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
    </script>
  </head>
    <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    	<div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
            <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
            <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
            <input type="hidden" id="COBJASE" name="COBJASE" value="${__formdata.COBJASE}"/> 
            <input type="hidden" name="DONDE" id="DONDE" value="${__formdata.DONDE}"/>  
            <input type="hidden" name="CTIPAGE_BUSC" id="CTIPAGE_BUSC" value="${__formdata.CTIPAGE_BUSC}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisctr017" c="BUSPOL" lit="1000187" /></c:param>
                <c:param name="form">axisctr017</c:param>
                <c:param name="titulo"><axis:alt f="axisctr017" c="TIT_SECUND" lit="151234" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr017" c="BUSQAGE" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
        </c:import>
            <!-- Area de campos  -->
            <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <axis:visible c="DSP_TITULO_POL" f="axisctr017">
                            <tr>
                                <td class="titulo" colspan="10">          
                                    <img src="images/flecha.gif"/><b><axis:alt f="axisctr017" c="titulo" lit="103593" /> </b>
                                </td> 
                            </tr>
                            </axis:visible>
                            <tr>                            
                            <td align="left" >
                                 <table class="area" align="center">
                                    <tr>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:5%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                            </tr>
                            <tr>
                            <axis:visible f="axisctr017" c="CAGENTE"> 
                                    <td class="titulocaja" colspan="4">
                                        <b><axis:alt f="axisctr017" c="CAGENTE" lit="100584" /></b>
                                    </td>
                                </axis:visible>
                            </tr>
                            <tr>
                            <axis:visible f="axisctr017" c="CAGENTE"> 
                                    <td class="campocaja" colspan="4">
                                    
                                        <input type="text" name="CAGENTE_TEXT" id="CAGENTE_TEXT" value="${__formdata.CAGENTE_TEXT}" class="campowidthinput campo campotexto" style="width:15%"
                                        <axis:atr f="axisctr017" c="CAGENTE" a="modificable=true"/> onchange="f_actualizar_agente()" />
                                        <axis:visible f="axisctr017" c="BT_BUSCAR_AGENTE">
                                        	<img border="0" src="images/find.gif" onclick="f_abrir_axisctr014('')" style="cursor:pointer"/>
                                        </axis:visible>
                                        <input  style="width:75%" type="text" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${__formdata.NOMBRE_TEXT}" <axis:atr f="axisctr017" c="CAGENTE" a="modificable=false"/> class="campowidthinput campo campotexto"/>
                                    </td>
                               </axis:visible>
                             </tr>
                             <tr>
                                <td colspan="6">
                                <axis:ocultar f="axisctr017" c="DSP_NIVELES">
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
                                                                <b><axis:alt f="axisctr017" c="TIPDESC_<%=j%>" lit="${CTIPAGE_DESC}"></axis:alt></b>
                                                            </td>
                                                            <%if(j+1< niveles_age.size()) { %>
                                                                <td class="titulocaja" colspan="2">
                                                                    <b><axis:alt f="axisctr017" c="TIPDESC_<%=j+1%>" lit="${CTIPAGE_DESC1}"></axis:alt></b>
                                                                </td>
                                                            <%}%>
                                                            <%if(j+2< niveles_age.size()) { %>
                                                                <td class="titulocaja" colspan="2">
                                                                    <b><axis:alt f="axisctr017" c="TIPDESC_<%=j+2%>" lit="${CTIPAGE_DESC2}"></axis:alt></b>
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
                                 <axis:ocultar f="axisctr017" c="CRAMO" dejarHueco="false"> <!-- TODO C -->
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axisctr017" c="CRAMO" lit="100784"></axis:alt></b>
                                    </td>
                                </axis:ocultar>
                               
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisctr017" c="PRODUC" lit="100829" /></b>
                                </td>
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt c="CACTIVI" f="axisctr004" lit="89906247"/></b> <%-- Actividad --%>
                                </td>
                            </tr>
                            <tr>
                            <axis:ocultar f="axisctr017" c="CRAMO" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja" colspan="2">
                                        <select name = "ramoProducto" id="ramoProducto" <axis:atr f="axisctr017" c="CRAMO" a="isInputText=false"/>  style="width:200px;" id ="ramoProducto" size="1" onchange="f_cargar_productos()" class="campowidthselect campo campotexto">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr017" c="SELECC" lit="108341"/> - </option>
                                            <c:forEach var="ramos" items="${axisctr_listaRamos}">
                                                <option value = "${ramos.CRAMO}/${ramos.TRAMO}"
                                                    <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>
                                                    ${ramos.TRAMO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                
                                <td class="campocaja" <c:if test="${__configform.axisctr017__CRAMO__visible == 'false'}"> colspan="3" </c:if>
                                	<c:if test="${__configform.axisctr017__CRAMO__visible != 'false'}"> colspan="2" </c:if>>
                                    <select name = "SPRODUC" id ="SPRODUC" size="1" <axis:atr f="axisctr017" c="SPRODUC" a="isInputText=false"/>
                                    	<c:if test="${__configform.axisctr017__CRAMO__visible == 'false'}"> style="width:90%"  </c:if>
                                    	<c:if test="${__configform.axisctr017__CRAMO__visible != 'false'}"> style="width:83%"  </c:if>
                                    	onchange="f_cargar_cobjase(); f_cargar_actividad();" class="campowidthselectbig campo campotexto">
                                        <option value="">- <axis:alt f="axisctr017" c="SELECC" lit="108341"/> -</option>
                                        <c:forEach items="${productos}" var="item">
                                            <option value = "${item.SPRODUC}" <c:if test="${__formdata['SPRODUC']==item.SPRODUC}">selected</c:if> >${item.TTITULO}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td class="campocaja" colspan="2">
                                    <select name="CACTIVI" title="<axis:alt f="axisctr017" c="CACTIVI" lit="89906247"/>" id="CACTIVI" size="1" class="campowidthselect campo campotexto" style="width:18%;"
                                       <axis:atr f="axisctr017" c="CACTIVI" a="isInputText=false"/> >&nbsp;
                                            <option value=""> - <axis:alt f="axisctr017" c="SELECC" lit="108341"/> - </option> 
                                           <c:forEach var="element" items="${actividades}">
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
                                    <b><axis:alt f="axisctr017" c="NPOL" lit="100836" /></b>
                                </td>
                                <axis:ocultar f="axisctr017" c="NCERTIF">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr017" c="NCERTIF" lit="101236" /></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr017" c="NSOLICI" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr017" c="NSOLICI" lit="109528" /></b>
                                </td>
                                </axis:ocultar>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr017" c="ESTPRO" lit="1000471" /></b>
                                </td>
                            </tr>
                            <tr>
                            <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA" title="<axis:alt f="axisctr017" c="NPOL" lit="100836"/>" size="15" 
                                     title="<axis:alt f="axisctr017" c="NPOL" lit="100836" />"/>
                                </td>
                                <axis:ocultar f="axisctr017" c="NCERTIF">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NCERTIF}" name="NCERTIF" id="NCERTIF"
                                    formato="entero" title="<axis:alt f="axisctr017" c="CERTIF" lit="101096"/>"/>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr017" c="NSOLICI" dejarHueco="false">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                value="${__formdata.NSOLICI}" name="NSOLICI" id="NSOLICI" 
                                                style="width:80%;" title="<axis:alt f="axisctr017" c="NSOLICI" lit="109528"/>"
                                                <axis:atr f="axisctr017" c="NSOLICI"/> />
                                </td>
                                </axis:ocultar>
                                <td class="campocaja">
                                    <select name = "CRETENI" id ="CRETENI" size="1" onchange="" class="campowidthselect campo campotexto">
                                        <option value="">- <axis:alt f="axisctr017" c="SELECC" lit="108341"/> -</option>
                                        <c:forEach items="${estproposta}" var="item">
                                            <option value = "${item.CATRIBU}" <c:if test="${! empty __formdata['CRETENI'] && __formdata['CRETENI']==item.CATRIBU}">selected</c:if> >${item.TATRIBU}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisctr017" c="NIF" lit="9000760" /></b>
                                </td>
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisctr017" c="TOMADOR" lit="101027" /></b>
                                </td>
                                <axis:ocultar c="SNIP" f="axisctr017" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr017" c="SNIP" lit="1000088" /></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                            <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata['NUMIDE']}" name="NUMIDE" id="NUMIDE"/>
                                </td>
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata['NOMBRE']}" name="NOMBRE" id="NOMBRE" size="15"/>
                                </td>
                                <axis:ocultar c="SNIP" f="axisctr017" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata['SNIP']}" name="SNIP" id="SNIP" size="15"
                                        title="<axis:alt f="axisctr017" c="IDEXT" lit="1000245"/>"/>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <!-- Asegurado -->
                            <tr>
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisctr017" c="NIF" lit="9000760" /></b>
                                </td>
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisctr017" c="ASEGURADO" lit="101028" /></b>
                                </td>
                            </tr>
                            <tr>
                            <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata['NUMIDEASE']}" name="NUMIDEASE" id="NUMIDEASE"/>
                                </td>
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata['NOMBREASE']}" name="NOMBREASE" id="NOMBREASE" size="15"/>
                                </td>
                            </tr>
                              <tr>
                            <axis:ocultar f="axisctr017" c="PCPOLCIA" dejarHueco="false">
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisctr017" c="PCPOLCIA" lit="9906579"/></b>  <%-- Poliza partner --%>
                                        </td>
                                    </axis:ocultar>
                                          <axis:ocultar f="axisctr017" c="PFRETTEND" dejarHueco="false">
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr017" c="PFRETTEND" lit="9906577"/></b>  <%-- Motivos retención --%>
                                        </td>
                                    </axis:ocultar>
                                     <axis:ocultar f="axisctr017" c="PFRETTENH" dejarHueco="false">
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr017" c="PFRETTENDH" lit="9906578"/></b>  <%-- Motivos retención --%>
                                        </td>
                                    </axis:ocultar>
                            </tr>
                            <tr>
                            
                             <axis:ocultar f="axisctr017" c="PCPOLCIA" dejarHueco="false">
                                  <td class="campocaja" colspan="2">                             
                                            <input type="text" class="campowidthinput campo campotexto" size="15" 
                                            value="${__formdata.PCPOLCIA}" name="PCPOLCIA" id="PCPOLCIA" 
                                            style="width:67%;" title="<axis:alt f="axisctr017" c="PCPOLCIA" lit="9906579"/>"
                                           />
                                        </td>
                                </axis:ocultar>
                                                                  
                                   <axis:ocultar f="axisctr017" c="PFRETTEND" dejarHueco="false">
                                        <td class="campocaja">
                                        
                                            <input type="text"  formato="fecha" 
                                            title="<axis:alt f="axisctr017"  c="PFRETTEND" lit="9906577"/>"
                                            onchange="f_formatdate(this);" <axis:atr f="axisctr017" c="PFRETTEND" a="modificable=true&isInputText=false"/>
                                                   name="PFRETTEND" id="PFRETTEND"  style="width:70%;"  value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.PFRETTEND}"/>"  class="campowidthinput campo campotexto"/>
                                            <a style="vertical-align:middle;">
                                            <img id="popup_calendario_PFRETTEND"  alt="<axis:alt f="axisctr017" c="IMG_PFRETTEND" lit="9906577"/>" title="<axis:alt f="axisctr017" c="IMG_PFRETTEND" lit="9906577" />" src="images/calendar.gif"/></a>
                                   
                                        </td>
                                         </axis:ocultar>        
                                        
                                         <axis:ocultar f="axisctr017" c="PFRETTENH" dejarHueco="false">
                                        <td class="campocaja">
                                        
                                            <input type="text"  formato="fecha" 
                                            title="<axis:alt f="axisctr017"  c="PFRETTENH" lit="9906578"/>"
                                            onchange="f_formatdate(this);" <axis:atr f="axisctr017" c="PFRETTEND" a="modificable=true&isInputText=false"/>
                                                   name="PFRETTENH" id="PFRETTENH"  style="width:70%;"  value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.PFRETTENH}"/>"  class="campowidthinput campo campotexto"/>
                                            <a id="icon_PFRETTENH" style="vertical-align:middle;">
                                            <img id="popup_calendario_PFRETTENH" alt="<axis:alt f="axisctr017" c="IMG_PFRETTENH" lit="9906578"/>" title="<axis:alt f="axisctr017" c="IMG_PFRETTENH" lit="9906578" />" src="images/calendar.gif"/></a>
                                        </td>
                                         </axis:ocultar>  
                            
                            
                            </tr>
                        </table>
                        </td>
                    </tr>
                    <div class="separador">&nbsp;</div>   
                        <!-- Bug 25177/133016 - 09/01/2013 - AMC   -->
                        <c:if test="${!empty LST_TIPRIESGO}">
                        <table>
                            <tr>
                                <td class="titulo">
                                    <img src="images/flecha.gif"/><b><axis:alt f="axisctr017" c="DATOSRIESGO" lit="151604" /> </b>
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
                                            <axis:ocultar f="axisctr017" c="CMATRICULA" dejarHueco="false"> 
                                                <td id="tit_CMATRICULA" class="titulocaja">
                                                    <b id="label_CMATRICULA"><axis:alt c="CMATRICULA" f="axisctr017" lit="9001057"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr017" c="CMOTOR" dejarHueco="false"> 
                                                <td id="tit_CMOTOR" class="titulocaja">
                                                    <b id="label_CMOTOR"><axis:alt c="CMOTOR" f="axisctr017" lit="9904654"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr017" c="CCHASIS" dejarHueco="false"> 
                                                <td id="tit_CCHASIS" class="titulocaja">
                                                    <b id="label_CCHASIS"><axis:alt c="CCHASIS" f="axisctr017" lit="9904655"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr017" c="NBASTID" dejarHueco="false"> 
                                                <td id="tit_NBASTID" class="titulocaja">
                                                    <b id="label_NBASTID"><axis:alt c="NBASTID" f="axisctr017" lit="9001061"/></b>
                                                </td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axisctr017" c="CPOSTAL" dejarHueco="false"> 
                                                <td id="tit_CPOSTAL" class="titulocaja">
                                                    <b id="label_CPOSTAL"><axis:alt c="CPOSTAL" f="axisctr017" lit="100823"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr017" c="TDOMICI" dejarHueco="false"> 
                                                <td id="tit_TDOMICI" class="titulocaja" colspan="2">
                                                    <b id="label_TDOMICI"><axis:alt c="TDOMICI" f="axisctr017" lit="9000914"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr017" c="DESCRIPCION" dejarHueco="false"> 
                                                <td id="tit_DESCRIPCION" class="titulocaja" colspan="2">
                                                    <b id="label_DESCRIPCION"><axis:alt c="DESCRIPCION" f="axisctr017" lit="100588"/></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisctr017" c="CMATRICULA" dejarHueco="false">
                                                <td id="td_CMATRICULA" class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="axisctr017" c="CMATRICULA" a="modificable=true"/> size="15" value="${__formdata.CMATRICULA}" name="CMATRICULA" id="CMATRICULA"
                                                     title="<axis:alt f="axisctr017" c="CMATRICULA" lit="9001057"/>"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr017" c="CMOTOR" dejarHueco="false">
                                                <td id="td_CMOTOR" class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="axisctr017" c="CMOTOR" a="modificable=true"/> size="15" value="${__formdata.CMOTOR}" name="CMOTOR" id="CMOTOR"
                                                     title="<axis:alt f="axisctr017" c="CMOTOR" lit="9904654"/>"
                                                     onchange="objValidador.f_validarCaracters(this,'%?*.;,:_-&$()!+!#$%&/()=\ #$%&/()=?*][_:;+}{-.,|\~')"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr017" c="CCHASIS" dejarHueco="false">
                                                <td id="td_CCHASIS" class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="axisctr017" c="CCHASIS" a="modificable=true"/> size="15" value="${__formdata.CCHASIS}" name="CCHASIS" id="CCHASIS"
                                                     title="<axis:alt f="axisctr017" c="CCHASIS" lit="9904655"/>"
                                                     onchange="objValidador.f_validarCaracters(this,'%?*.;,:_-&$()!+!#$%&/()=\ #$%&/()=?*][_:;+}{-.,|\~OIQ')"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr017" c="NBASTID" dejarHueco="false">
                                                <td id="td_NBASTID" class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="axisctr017" c="NBASTID" a="modificable=true"/> size="15" value="${__formdata.NBASTID}" name="NBASTID" id="NBASTID"
                                                     title="<axis:alt f="axisctr017" c="NBASTID" lit="9001061"/>" onchange="objValidador.f_validarCaracters(this,'IOQ')"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr017" c="CPOSTAL" dejarHueco="false">
                                                <td id="td_CPOSTAL" class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="axisctr017" c="CPOSTAL" a="modificable=true"/> size="15" value="${__formdata.CPOSTAL}" name="CPOSTAL" id="CPOSTAL"
                                                     title="<axis:alt f="axisctr017" c="CPOSTAL" lit="100823"/>"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr017" c="TDOMICI" dejarHueco="false">
                                                <td id="td_TDOMICI" class="campocaja" colspan="2">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="axisctr017" c="TDOMICI" a="modificable=true"/> size="15" value="${__formdata.TDOMICI}" name="TDOMICI" id="TDOMICI"
                                                     title="<axis:alt f="axisctr017" c="TDOMICI" lit="9000914"/>"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr017" c="DESCRIPCION" dejarHueco="false">
                                                <td id="td_DESCRIPCION" class="campocaja" colspan="2">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="axisctr017" c="DESCRIPCION" a="modificable=true"/> size="15" value="${__formdata.DESCRPCION}" name="DESCRIPCION" id="DESCRIPCION"
                                                     title="<axis:alt f="axisctr017" c="DESCRIPCION" lit="100588"/>"/>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        </c:if>
                        <!-- Fin Bug 25177/133016 - 09/01/2013 - AMC   -->
                </table>
                      <%--  <div class="separador">&nbsp;</div>
                    
                        <!-- Lo siguiente es un DisplayTag "dummy" para mostrar al usuario que no ha habido resultados, en vez de dejar la pantalla en blanco --> 
                        <c:set var="title1"><axis:alt f="axisctr017" c="LIT_1000345" lit="1000345"/></c:set>
                        <div class="seccion displayspaceGrande">
                            <display:table name="${polizas}" id="miListaId" export="false" class="dsptgtable" pagesize="8" defaultsort="1" defaultorder="ascending" requestURI="modal_axisctr017.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="${title1}" sortable="false" headerClass="sortable" media="html" autolink="false">    
                                    <div class="dspText"></div>
                                </display:column>
                            </display:table>
                            <script language="javascript">
                               objLista.esconderListaSpans();
                               objLista.esconderListaLinks();     
                            </script>
                        </div>	--%>	

                    </td>
                </tr>
            </table>
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr017</c:param>  
            <c:param name="f">axisctr017</c:param>
            <c:param name="__botones">cancelar,buscar</c:param></c:import>
     </form>
     
     
    <script type="text/javascript">
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
    <c:import url="../include/mensajes.jsp" />
</div>
    </body>
</html>

