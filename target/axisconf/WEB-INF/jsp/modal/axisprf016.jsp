<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
    <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
    <script type="text/javascript" src="scripts/calendar.js"></script>    
    <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
    <script type="text/javascript" src="scripts/calendar-setup.js"></script>           
    <style type="text/css" id="page-css"> </style>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">
        
        function f_onload() {
        	f_cargar_propiedades_pantalla();
            var guardat = "${__formdata.guardat}";
            if ((!objUtiles.estaVacio(guardat))&&(guardat=="0")){
               	//  INI--WAJ
            	//parent.f_aceptar_modal("axisprf016");   
            	var SPERSON = "${__formdata.SPERSON}";
                parent.f_aceptar_impuestos("axisprf016", SPERSON);
            	//  FIN--WAJ
            }
        }  
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisprf016');                      
        }           
        
        function f_but_aceptar(){          
          if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisprf016.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando); 
          }
        }
        
        //  INI--WAJ
        function f_but_anadir() {
        	if (objValidador.validaEntrada()) {
        		var SPERSON = "${__formdata.SPERSON}";
               
        		objUtiles.ejecutarFormulario("modal_axisprf016.do?SPERSON="+SPERSON, "guardarindica", document.miForm, "_self", objJsMessages.jslit_cargando);
        		
        	}                 
        }    
    
        /*     function f_carga_tipos_indicadores(){
            if (!objUtiles.estaVacio($("#CCODIMP").val())){
                objAjax.invokeAsyncCGI("modal_axisprf016.do", callbackAjaxCargarTiposIndica, "operation=ajax_busqueda_tip_indica&CCODIMP="+
                $("#CCODIMP").val(), this, objJsMessages.jslit_cargando);
            }
        }
        
        */
        function f_carga_tipos_indicadores(){
        	var codTipoVinculacion = $("#CCODVIN").val();
        	var codImpuesto = $("#CCODIMP").val();
        	
        	if (!objUtiles.estaVacio(codTipoVinculacion) && !objUtiles.estaVacio(codImpuesto)){
                objAjax.invokeAsyncCGI("modal_axisprf016.do", callbackAjaxCargarTiposIndica, "operation=ajax_busqueda_tip_indica&CCODVIN="+codTipoVinculacion+"&CCODIMP="+codImpuesto, this, objJsMessages.jslit_cargando);
            }
        }
        
        function callbackAjaxCargarTiposIndica(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);            
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("CTIPIND");                
                var CTIPINDCombo = document.miForm.CTIPIND;
                objDom.borrarOpcionesDeCombo(CTIPINDCombo);
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisprf016" c="SELECCTIPIND" lit="108341"/> - ', CTIPINDCombo, 0);
                if(elementos.length>0){
                    for (i = 0; i < elementos.length; i++) {
                        var CTIPIND = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPIND"), i, 0);
                        var TINDICA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINDICA"), i, 0);
                        objDom.addOpcionACombo(CTIPIND, TINDICA, CTIPINDCombo, i+1);
                    }                
                }
            }
        }
        
        function f_carga_tipos_agentes(){
        	 var elemento = $("#CCODVIN").val();
        	 if (elemento == 3 || elemento == 4){
        		 objAjax.invokeAsyncCGI("modal_axisprf016.do", callbackAjaxCargarTiposAgente, "operation=ajax_busqueda_tip_agente&CCODVIN="+
        	     $("#CCODVIN").val(), this, objJsMessages.jslit_cargando);
        	 }else
        		 {
        		 var CCODAGENCombo = document.miForm.CCODAGEN;
                 objDom.borrarOpcionesDeCombo(CCODAGENCombo);
                 objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisprf016" c="SELECCTIPIND" lit="108341"/> - ', CCODAGENCombo, 0);
        		 }
        }
        
        function callbackAjaxCargarTiposAgente(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);    
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("CATRIBU");                
                var CCODAGENCombo = document.miForm.CCODAGEN;
                objDom.borrarOpcionesDeCombo(CCODAGENCombo);
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisprf016" c="SELECCCODAGEN" lit="108341"/> - ', CCODAGENCombo, 0);
                if(elementos.length>0){
                    for (i = 0; i < elementos.length; i++) {
                        var CCODAGEN = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CATRIBU"), i, 0);
                        var CATRIBU = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TATRIBU"), i, 0);
                        objDom.addOpcionACombo(CCODAGEN, CATRIBU, CCODAGENCombo, i+1);
                    }                
                }
            }
        }
    //  FIN--WAJ
        
    </script>
    
  </head>
  <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisprf016" c="TITULO" lit="9906563" /></c:param>
                <c:param name="nid" value="axisprf016" />
        </c:import>
        <input type="hidden" name="operation" value=""/>  
        <input type="hidden" id="SPROFES" name="SPROFES" value="${__formdata.SPROFES}"/>
        <c:import url="../include/titulo_nt.jsp">
           <c:param name="formulario"><axis:alt c="formulario" f="axisprf016" lit="9906563" /></c:param>
           <c:param name="producto"><axis:alt c="formulario" f="axisprf016" lit="9906563" /></c:param>
           <c:param name="form">axisprf016</c:param>
        </c:import>             
        <div class="separador">&nbsp;</div>        
        <!-- Area de campos  -->
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:10px;">
            <tr>
                <th style="width:34%;height:0px"></th>
                <th style="width:33%;height:0px"></th>
                <th style="width:33%;height:0px"></th>                                
            </tr>        

  <!--  INI--WAJ  -->
            <tr>
               
                <axis:ocultar f="axisprf016" c="CCODVIN" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf016" c="CCODVIN" lit="3"/></b>
                    </td>
                </axis:ocultar>
                
                
                <axis:ocultar f="axisprf016" c="CCODVIN" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf016" c="CCODVIN" lit="4"/></b>
                    </td>
                </axis:ocultar>
                
            </tr>      
             
             <tr>
               <axis:ocultar f="axisprf016" c="CCODVIN" dejarHueco="false"> 
               <td class="campocaja"> 
               	<!--Start IAXIS-4729 By HB on 05/07/2019 -->
                  <select name="CCODVIN" id="CCODVIN" size="1" class="campowidthselect campo campotexto_ob"                      
                      <axis:atr f="axisprf016" c="CCODVIN" a="obligatorio=true"/>
                      title="<axis:alt f="axisprf016" c="CCODVIN" lit="101159"/>"
                      onchange="f_carga_tipos_agentes();f_cargar_propiedades_pantalla();">
                        <option value="<%= Integer.MIN_VALUE %>">
                           <axis:alt f="axisprf016" c="SELECCIONAR" lit="108341"/>
                        </option>
                        <c:forEach var="element" items="${__formdata.LSTTIPOVINCULO}">
                           <option value = "${element.CATRIBU}"
                              <c:if test="${__formdata.TIPAGENTE == element.CATRIBU}"> selected = "selected"</c:if>>
                                         ${element.TATRIBU} 
                           </option>
                        </c:forEach>
                  </select>
                  <!--End IAXIS-4729 By HB on 05/07/2019 -->
               </td>
               


                 <td class="campocaja"> 
                  <select name="CCODAGEN" id="CCODAGEN" size="1" class="campowidthselect campo campotexto_ob">                      
                      <axis:atr f="axisprf016" c="CCODAGEN" a="obligatorio=true"/>title="<axis:alt f="axisprf016" c="CCODAGEN" lit="101159"/>                 
                        <option value="<%= Integer.MIN_VALUE %>">
                           <axis:alt f="axisprf016" c="SELECCIONAR" lit="108341"/>
                        </option>
                        <c:forEach var="element" items="${__formdata.LSTTIPOAGENTE}">
                         <option value = "${element.CATRIBU}"
                              <c:if test="${__formdata.TIPAGENTE == element.CATRIBU}"> selected = "selected"</c:if>>
                                         ${element.TATRIBU} 
                           </option>

                        </c:forEach>
                  </select>
               </td>
               
               </axis:ocultar> 
             </tr>      
            <!--  FIN--WAJ  -->

            <tr>
                <axis:ocultar f="axisprf016" c="CCODIMP" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf016" c="CCODIMP" lit="9906564"/></b>
                    </td>
                </axis:ocultar>
            </tr>        
            <tr>
            <axis:ocultar f="axisprf016" c="CCODIMP" dejarHueco="false"> 
            <td class="campocaja">
                <select name="CCODIMP" id="CCODIMP" size="1" class="campowidthselect campo campotexto_ob"
                        <axis:atr f="axisprf016" c="CCODIMP" a="obligatorio=true"/> 
                        title="<axis:alt f="axisprf016" c="CCODIMP" lit="101159"/>"
                        onchange="f_carga_tipos_indicadores()">
                    <option value="<%= Integer.MIN_VALUE %>">
                      <axis:alt f="axisprf016" c="SELECCIONAR" lit="108341"/>                                
                    </option>
                    <c:forEach var="impuesto" items="${__formdata.LSTIMPUESTOS}">
                        <option value="${impuesto.CCODIMP}">
                            ${impuesto.TDESIMP}
                        </option>
                    </c:forEach>
                </select>
            </td>
            </axis:ocultar>   
            </tr>        
             <tr>
                <axis:ocultar f="axisprf016" c="CTIPIND" dejarHueco="false">                 
                    <td class="titulocaja">
                              <b><axis:alt f="axisprf016" c="CTIPIND" lit="9906486"/></b>
                    </td> 
                </axis:ocultar>
            </tr> 
            <tr>
            <axis:ocultar f="axisprf016" c="CTIPIND" dejarHueco="false"> 
            <td class="campocaja">
                <select name="CTIPIND" id="CTIPIND" size="1" class="campowidthselect campo campotexto_ob"
                        <axis:atr f="axisprf016" c="CTIPIND" a="obligatorio=true"/> 
                        title="<axis:alt f="axisprf016" c="CTIPIND" lit="9901195"/>">
                    <option value="<%= Integer.MIN_VALUE %>">
                      <axis:alt f="axisprf016" c="SELECCIONAR" lit="108341"/>                                
                    </option>
                    <c:forEach var="tipo_ind" items="${__formdata.LSTTIPIND}">
                        <option value="${tipo_ind.CTIPIND}">
                            ${tipo_ind.TINDICA}
                        </option>
                    </c:forEach>
                </select>
            </td>
            </axis:ocultar>
            </tr>
        </table>	
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisprf016</c:param><c:param name="f">axisprf016</c:param>
            <c:param name="__botones">cancelar,anadir</c:param>
        </c:import>
    </form>
        
    <c:import url="../include/mensajes.jsp" />
   </body>
</html>
