<%/*
*  Fichero: axismnt014.jsp : Mantenimiento productos. Datos internos
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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title>Traspaso de cartera de agente</title> <%-- Traspaso de cartera de agente --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>

   
     <%--Inicio Sólo si vamos a tener un campo fecha --%>
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
        <%-- fin Sólo si vamos a tener un campo fecha --%>
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
                
                
                 f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
                
            }
 	    			
            
            function f_abrir_modal(cual, optionalQueryString) {
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
            }
            
          
            function f_cerrar_modal(cual){
                 objUtiles.cerrarModal(cual);
            }
            
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axismnt014", "cancelar", document.miForm, "_self");
            }
           
           
             function f_but_aceptar() {
                if (objValidador.validaEntrada()){
           //       var params = f_get_params();
                 objUtiles.ejecutarFormulario("axis_axismnt014.do", "aceptar", document.miForm, "_self", '<axis:alt f="axismnt014" c="MSG_CARGAR" lit="1000166"/>');   
                }
               
               }
            /****************************************************************************************/
            /*********************************** UTILS *****************************************/
            /****************************************************************************************/            
            function f_actualizar_check(thiss){
                thiss.value = thiss.checked ? 1 : 0;
            }
            
            function f_formatdate(entrada,title){
                 var jDate = new JsFecha();
                    if(entrada.value.length>0){
                        entrada.value=jDate.formateaFecha(entrada.value);
                    
                        if(jDate.validaFecha(entrada.value)){
                            entrada.value=jDate.formateaFecha(entrada.value);
                        }else{
                            alert("<axis:alt f="axismnt014" c="VAL_FECHA" lit="1000421"/>");
                            entrada.value = '';
                        }
                    }else{entrada.value = '';}
            }
            /*******************************************
                  Formateo Numeros
             ********************************************/
             function validarNumeros(IMPORTE){
                   if (!objUtiles.estaVacio(IMPORTE)){
                     IMPORT = objValidador.valorFormateadoCampoNumerico(IMPORTE, true, true);
                         if(objNumero.validaNumero(IMPORT, true)) {
                              return this.formateaNumeroCero(IMPORT, true);
                         }else{ return   '';}
                    }else return IMPORTE;
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
             
              
               
         function f_get_params(){
            var inputs = document.getElementsByTagName("input");
            
            var params = "";
            for(var i=0;i<inputs.length;i++){
                if(inputs[i].attributes.length>0) {
                    var inputId = inputs[i].getAttribute("id");
                    
                   if(inputs[i].getAttribute("type") != "button" 
                     && (!objUtiles.estaVacio(inputs[i].getAttribute("paramCod")) && inputs[i].getAttribute("paramCod") == "true")){
                      if (objDom.esVisible(inputId)){
                         if (objUtiles.estaVacio(objDom.getValorPorId(inputId))
                        || (!objUtiles.estaVacio(objDom.getValorPorId(inputId)) &&
                            objDom.getValorPorId(inputId) < 0 ) ){
                                params = params+"#"+inputId+";";
                        }else{
                            valor = objDom.getValorPorId(inputId);
                                if (inputs[i].getAttribute('formato') == 'fecha')
                                    valor = formateaFechaToString(valor);
                            
                                if (inputs[i].getAttribute('type') == 'radio'){
                                    if (objDom.getComponenteMarcado(inputs[i])){
                                         params = params+"#"+inputId+";"+valor;                        
                                    }
                                 }else
                                    params = params+"#"+inputId+";"+valor;                        
                        }
                      }
                    }         
                }
            }
                    
            var selects = document.getElementsByTagName("select");
            for(var i=0;i<selects.length;i++){
                if(selects[i].attributes.length>0) {
                    var selectId = selects[i].getAttribute("id");
                     if (objDom.esVisible(selectId) ){
                     if(selects[i].getAttribute("type") != "button"
                     && (!objUtiles.estaVacio(selects[i].getAttribute("paramCod")) && selects[i].getAttribute("paramCod") == "true")){
                        if ( objUtiles.estaVacio(objDom.getValorPorId(selectId))
                        || (!objUtiles.estaVacio(objDom.getValorPorId(selectId)) &&
                            objDom.getValorPorId(selectId) < 0 ) ){
                           params = params+"#"+selectId+";";
                        }else{
                             params = params+"#"+selectId+";"+objDom.getValorPorId(selectId);
                        }
                        
                    }    
                 }
                }
            }
            
            return params+"#";
        }
        
        function formateaFechaToString (entrada){
		var enValue = entrada;
		var utiles = new JsUtiles();
		// Convertimos separadores a / , si tiene
		var splitValue = utiles.replaceAll(utiles.replaceAll(enValue,'-','/'),'.','/').split('/');//enValue.replace('-','/').replace('.','/').split('/');
		var dia, mes, any;
		if (splitValue.length == 3) {
		    // dd/mm/yyyy o dd/mm/yy
			dia = splitValue[0];
		 	mes = splitValue[1];
			any = splitValue[2];		
		}
		else{
			// ddmmyyyy o dd/mm/yy
			dia = enValue.substring(0,2);
			mes = enValue.substring(2,4);
			any = enValue.substring(4,enValue.length);
		}
		
		if (dia < 10 && dia.length == 1)
			// Ex. Dia = 5
			dia = "0" + dia;
			
		if (mes < 10 && mes.length == 1)
			// Ex. Mes = 5
			mes = "0" + mes;
                	
		if (any.length != 4)
			// Ex. Any = 02
			// Ex. Any = 98
			if (any > 50) 
				// Ex. Any = 98 --> 1998
				any = parseInt(any,10) + 1900;
			else
				// Ex. Any = 02 --> 2002
				any = parseInt(any,10) + 2000;
		return (dia + "" + mes + "" + any);
	}
        
         function f_cerrar_axisimprimir() {
                objUtiles.cerrarModal("axisimprimir");
            }
                    
         
            
            
        
        function f_cargar(){
                    f_cargar_propiedades_pantalla();
                    ocultarFila();
        }
        
      

        
        function f_cargar_combos(thiss){
        
        
             objAjax.invokeAsyncCGI("axis_axismnt014.do", callbackAjaxCargarRamos, "operation=ajax_cargarRamos&CCOMPANI=" + thiss, this, objJsMessages.jslit_cargando,thiss);
         
           
        }
        
        
        function f_cargar_ramos(thiss){
         
             objAjax.invokeAsyncCGI("axis_axismnt014.do", callbackAjaxCargarRamos, "operation=ajax_cargarRamos&CAGRPRO=" + thiss, this, objJsMessages.jslit_cargando,CCOMPANI);
        }
        
        function f_cargar_productos(thiss){
           objAjax.invokeAsyncCGI("axis_axismnt014.do", callbackAjaxCargarCombosProductos, "operation=ajax_cargarProductos&CRAMO="+thiss, this, objJsMessages.jslit_cargando);  
        }
        
         function callbackAjaxCargarCombos(ajaxResponseText,CCOMPANI){
        
           var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("CAGRPRO");
                    
                    var CAGRPROcombo = document.miForm.CAGRPRO;     
                    objDom.borrarOpcionesDeCombo(CAGRPROcombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axismnt014" c="SNV_COMBO" lit="108341"/> - ', CAGRPROcombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var CAGRPRO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CAGRPRO"), i, 0);
                            var TAGRPRO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAGRPRO"), i, 0);                                     
                            objDom.addOpcionACombo(CAGRPRO, TAGRPRO, CAGRPROcombo, i+1);
                        }
                        
                 objAjax.invokeAsyncCGI("axis_axismnt014.do", callbackAjaxCargarRamos, "operation=ajax_cargarRamos&CCOMPANI=" + CCOMPANI, this, objJsMessages.jslit_cargando,CCOMPANI);
                }
        }  
        
         function callbackAjaxCargarRamos(ajaxResponseText,CCOMPANI){
        
             var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("CRAMO");
                    
                    var CRAMOcombo = document.miForm.CRAMO;     
                    objDom.borrarOpcionesDeCombo(CRAMOcombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axismnt014" c="SNV_COMBO" lit="108341"/> - ', CRAMOcombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var CRAMO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CRAMO"), i, 0);
                            var TRAMO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TRAMO"), i, 0);                                     
                            objDom.addOpcionACombo(CRAMO, TRAMO, CRAMOcombo, i+1);
                        }
                        
                     objAjax.invokeAsyncCGI("axis_axismnt014.do", callbackAjaxCargarCombosProductos, "operation=ajax_cargarProductos&CCOMPANI=" + CCOMPANI, this, objJsMessages.jslit_cargando);  
                }
        }
        
        function callbackAjaxCargarCombosProductos(ajaxResponseText){
        
             var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    
                    var SPRODUCcombo = document.miForm.SPRODUC;     
                    objDom.borrarOpcionesDeCombo(SPRODUCcombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axismnt014" c="SNV_COMBO" lit="108341"/> - ', SPRODUCcombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var TTITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TTITULO, SPRODUCcombo, i+1);
                        }
                        
                    
                }
        }
        
   
            function ocultarFila() {
              tab=document.getElementById('DSP_FILTRO');
              var ele= tab.getElementsByTagName('tr');
              var cont = 0;
              var haytd = 0;
                  for (i=0; i<ele.length;  i++) {
                      cont = 0;
                      haytd =0;
                      var eletd = ele[i].getElementsByTagName('td');
                         for (j=0; j<eletd.length; j++) {
                            haytd = 1;
                             try{
                                if (!objUtiles.estaHidden(eletd[j].id)){
                                    cont++;
                                }
                            }catch(e){}
                         }
                     
                      if (cont == 0 && haytd == 1){
                        ele[i].style.display = 'none';
                      }else{
                          if (cont > 0 && haytd == 1){
                               ele[i].style.display = '';
                          }
                      }
                  }
            }
        
        </script>
        
        
        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST" >         
    
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axismnt014" c="TITULO" lit="9903194"/></c:param>     <%-- Códigos internos --%>
            <c:param name="formulario"><axis:alt f="axismnt014" c="TITULO" lit="9903194"/></c:param> <%-- Códigos internos --%>
            <c:param name="form">axismnt014</c:param>
        </c:import>
        
       
        
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="MODO"  id="MODO" value="${__formdata.MODO}"/>
    
    
    
    
   <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:20px">
            <tr> 
                <td> 
                    <table class="seccion" align="center">
                        <tr>
                            <td >
                                <%-- Área 1 --%>
                                <table class="area"  align="center">
                                    <tr>
                                        <th style="width:30%;height:0px"></th>
                                        <th style="width:10%;height:0px"></th>
                                        <th style="width:10%;height:0px"></th>
                                        <th style="width:70%;height:0px"></th>
                                    </tr>
                                    <tr>
                                          <td class="titulocaja"> 
                                            <b id="label_idRequest"><axis:alt f="axismnt014" c="idRequest" lit="9002038"/></b> <%-- Operacion --%>
                                        </td>
                                    </tr>
                                    <tr>
                                         <td class="campocaja">                                
                                           <select name="idRequest" id="idRequest" size="1" class="campowidthselect campo campotexto" style="width:65%" onchange="f_cargar(this)"
                                           title="<axis:alt f="axismnt014" c="idRequest" lit="9002038"/>"
                                           <axis:atr f="axismnt014" c="idRequest" a="modificable=true&obligatorio=true&isInputText=false"/> >
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt014" c="SNV_COMBO" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.lstCodigos}">
                                                    <option value = "${element.CTIPCOD}" <c:if test="${__formdata.idRequest == element.CTIPCOD}">selected</c:if> >
                                                        ${element.TTIPCOD}
                                                    </option>
                                                </c:forEach>
                                            </select>
                           
                                        
                                        </td>
                                    </tr>
                                </table>
                                    
                              
                                
                                <table class="area" id="DSP_FILTRO" align="center">
                                    <tr>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        
                                        
                                    </tr>
                                    <tr>
                                        <td colspan="6" id="TITULO_FILTRO">
                                            <div class="separador">&nbsp;</div>
                                            <div class="titulo">
                                                <img src="images/flecha.gif"/><b><axis:alt f="axismnt014" c="TIT_PARAMS" lit="1000178"/> </b>
                                            </div>
                                            <div class="separador">&nbsp;</div>
                                         </td>
                                    </tr>
                                  
                            <tr>
                                  </tr>
                                     <tr style="height:0px">
                                       
                                        <axis:visible f="axismnt014" c="CRAMO">
                                        <td class="titulocaja" id="tit_CRAMO">
                                            <b id="label_CRAMO"><axis:alt f="axismnt014" c="CRAMO" lit="100784"/></b>
                                        </td>
                                     </axis:visible>
                                        <axis:visible f="axismnt014" c="SPRODUC">
                                        <td class="titulocaja" colspan="2" id="tit_SPRODUC">
                                            <b id="label_SPRODUC"><axis:alt f="axismnt014" c="SPRODUC" lit="100829" /></b>
                                        </td>
                                        </axis:visible>
                                        
                                        </tr>
                                        
                                          <tr style="height:0px">
                                       
                                        <axis:visible f="axismnt014" c="CRAMO">
                                        <td class="campocaja" id="td_CRAMO">
                                            <select name = "CRAMO" id ="CRAMO" paramCod="true" title="<axis:alt f="axismnt014" c="CRAMO" lit="100784"/>" size="1" onchange="f_cargar_productos(this.value)" class="campowidthselect campo campotexto">
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt014" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="ramos" items="${__formdata.listValores.ramos}">
                                                    <option value = "${ramos.CRAMO}"
                                                        <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>
                                                        ${ramos.TRAMO}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        </axis:visible>
                                        
                                         <axis:ocultar f="axismnt014" c="SPRODUC">            
                                        <td class="campocaja" colspan="2" id ="td_SPRODUC" >
                                            <select name = "SPRODUC" id ="SPRODUC" size="1" paramCod="true" style="width:90%;" onchange="" class="campowidthselect campo campotexto">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt014" c="SNV_COMBO" lit="108341" /> - </option>
                                                <c:forEach items="${__formdata.listValores.productos}" var="item">
                                                    <option value = "${item.SPRODUC}" <c:if test="${__formdata['SPRODUC']==item.SPRODUC}">selected</c:if> >${item.TTITULO}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        </axis:ocultar>
                                        </tr>
                                        
                                        <tr style="height:0px">
                                             <axis:visible f="axismnt014" c="CMODALI">   
                                                <td class="titulocaja" id="tit_CMODALI">
                                                    <b id="label_CMODALI"><axis:alt f="axismnt014" c="CMODALI" lit="100943"/></b> <%-- cmodali --%>
                                                </td>      
                                            </axis:visible>
                                            <axis:visible f="axismnt014" c="CCOLECT">   
                                                <td class="titulocaja" id="tit_CCOLECT"> 
                                                    <b id="label_CCOLECT"><axis:alt f="axismnt014" c="CCOLECT" lit="180571"/></b> <%-- ccolect --%>
                                                </td>
                                                </axis:visible>
                                            <axis:visible f="axismnt014" c="CTIPSEG">   
                                            <td class="titulocaja" id="tit_CTIPSEG">
                                                <b id="label_CTIPSEG"><axis:alt f="axismnt014" c="CTIPSEG" lit="102098"/></b> <%-- ctipseg --%>
                                            </td>
                                            </axis:visible>
                                            
                                    </tr>
                                    <tr style="height:0px">
                                       
                                        
                                            <axis:visible f="axismnt014" c="CMODALI">   
                                             <td class="campocaja" id ="td_CMODALI">
                                                <input type="text" class="campowidthinput campo campotexto" paramCod="true"  size="15" 
                                                    value="${__formdata.CMODALI}" name="CMODALI" id="CMODALI"
                                                    style="width:75%;" title="<axis:alt f="axismnt014" c="CMODALI" lit="100943"/>"
                                                    <axis:atr f="axismnt014" c="CMODALI"/> />  
                                            </td>  
                                           </axis:visible>
                                          <axis:visible f="axismnt014" c="CCOLECT">  
                                           <td class="campocaja"  id ="td_CCOLECT">
                                            <input type="text" class="campowidthinput campo campotexto" paramCod="true"  size="15" 
                                                value="${__formdata.CCOLECT}" name="CCOLECT" id="CCOLECT"
                                                style="width:75%;" title="<axis:alt f="axismnt014" c="CCOLECT" lit="180571"/>"
                                                <axis:atr f="axismnt014" c="CCOLECT"/> />  
                                           </td>  
                                           </axis:visible>
                                          <axis:visible f="axismnt014" c="CTIPSEG">   
                                           <td class="campocaja"  id ="td_CTIPSEG">
                                            <input type="text" class="campowidthinput campo campotexto" paramCod="true"  size="15" 
                                                value="${__formdata.CTIPSEG}" name="CTIPSEG" id="CTIPSEG"
                                                style="width:75%;" title="<axis:alt f="axismnt014" c="CTIPSEG" lit="102098"/>"
                                                <axis:atr f="axismnt014" c="CTIPSEG"/> />  
                                           </td>  
                                           </axis:visible>
                                          
                                      
                                    </tr>
                                   
                                   
                                    
                                </table>
                               
                              
                            </td>
                        </tr>                              
                    </table>
                </td>
            </tr>                                
        </table>
  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
       


        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axismnt014</c:param>
            <c:param name="__botones">salir,aceptar</c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>

   

</body>
</html>
