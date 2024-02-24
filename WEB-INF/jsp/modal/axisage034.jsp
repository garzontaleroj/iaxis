<%/* Revision:# 8PaLNMloiIDLVMeTGzgf4w== # */%>
<%/*
*  Fichero: axisage034.jsp
*
*  @author <a href = "mailto:rfonollet@csi-ti.com">Ramon Fonollet</a>
*
*
*  Fecha: 09/04/2015
*/
%>

<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>

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
        
        	 <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
				retocarPAGE_CSS('axisage034');
			 </c:if>
             
            f_cargar_propiedades_pantalla(); 
            
            // Retocar tabla en IE
            if (document.all){ // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
            }
            var cmodo="${requestScope.CMODO}";
            if(cmodo=='ALTA'){
            var checkboxes = document.getElementsByName('dif_input'); //obtenemos todos los controles del tipo Input
            for(i=0;i<checkboxes.length;i++) //recoremos todos los controles
            {
                if(checkboxes[i].type == "text") //solo si es un checkbox entramos
                {
                    checkboxes[i].disabled=true; //si es un checkbox le damos el valor del checkbox que lo llamó (Marcar/Desmarcar Todos)
                }
            }
            }
        }

        function f_but_cancelar() {
            parent.f_cerrar_axisage034();
        }
        
		function f_actualizar_check(CAGENTE,NLIQMEN,CESTAUTOLIQ,IIMPORTE,CUSUARI,SPROLIQ,CEMPRES,FCOBRO,FLIQUIDA,CAGECLAVE,IDIFGLOBAL,CMARCADO){
            		
			SPROLIQ=document.getElementById("SPROLIQ").value;
			objAjax.invokeAsyncCGI("modal_axisage034.do", callbackAjaxActualizarCheck, "operation=actualizar_check&CAGENTE=" + CAGENTE + "&NLIQMEN=" + NLIQMEN + "&CESTAUTOLIQ=" + CESTAUTOLIQ + "&IIMPORTE=" + IIMPORTE + "&CUSUARI=" + CUSUARI + "&SPROLIQ=" + SPROLIQ + "&CEMPRES=" + CEMPRES + "&FCOBRO=" + FCOBRO + "&FLIQUIDA=" + FLIQUIDA + "&CAGECLAVE=" + CAGECLAVE + "&IDIFGLOBAL=" + IDIFGLOBAL + "&CMARCADO=" +  ((CMARCADO)?1:0) , this, objJsMessages.jslit_actualizando_registro);
        }
        
		function callbackAjaxActualizarCheck (ajaxResponseText) {
            
			 var doc=objAjax.domParse(ajaxResponseText);
	            	      
			 objDom.setValorPorId("SPROLIQ", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPROLIQ"), 0, 0)));			 
        }
		

        function f_but_aceptar() {
     
           
            var SPROLIQ=document.getElementById("SPROLIQ").value;
            var CAGECLAVE=document.getElementById("CAGECLAVE").value;
            var CEMPRES=document.getElementById("CEMPRES").value;
            var checkboxes = document.getElementsByName('seleccionaagentesclave');
            var flag=0;
            for(i=0;i<checkboxes.length;i++) //recoremos todos los controles
            {
                if(checkboxes[i].type == "checkbox") //solo si es un checkbox entramos
                {
                 if (checkboxes[i].checked) {
                    flag=flag+1;
                 }
                    
                }
            }
            
            if(flag>0){
                if (objValidador.validaEntrada()) {
                    parent.f_aceptar_axisage034(SPROLIQ,CAGECLAVE,CEMPRES);   
                 } 
            }else{
                alert("<axis:alt f="axisage031" c="CAGENTETOMADOR" lit="9908945"/>");
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
        
        
        /*******************************************
                 Actualizar/Buscar Banco
         ********************************************/
        
        function f_abrir_axisadm062() {
            objUtiles.abrirModal("axisadm062","src","modal_axisadm062.do?operation=form");
        }
            
        function f_cerrar_axisadm062() {
            objUtiles.cerrarModal("axisadm062")
        }    
        function f_aceptar_axisadm062 (CBANCO){
            objDom.setValorPorId("CBANCO", CBANCO);
            f_cerrar_axisadm062();                
            objAjax.invokeAsyncCGI("modal_axisage034.do", callbackAjaxCambiarBanco, "operation=ver_banco&CBANCO=" + CBANCO, this, objJsMessages.jslit_actualizando_registro);
        }
        
        function callbackAjaxCambiarBanco(ajaxResponseText){            
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){   
                var TBANCOformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PTBANCO"), 0, 0);                
                objDom.setValorPorId("TBANCO", TBANCOformateado);
             }
        }               
        
        function f_actualizar_banco(){    
            var CBANCO =  objDom.getValorPorId("CBANCO");
            objDom.setValorPorId("TBANCO","");         
            objAjax.invokeAsyncCGI("modal_axisage034.do", callbackAjaxCargarBanco, "operation=ajax_actualizar_banco&CBANCO=" + CBANCO, this, objJsMessages.jslit_cargando);                
        }
        
        function callbackAjaxCargarBanco(ajaxResponseText){ 
        
            var doc=objAjax.domParse(ajaxResponseText);
            var elementos = doc.getElementsByTagName("element");
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CBANCO")[0]) && elementos[0]){
                    var CBANCOformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CBANCO"), 0, 0);
                    var TBANCOformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TBANCO"), 0, 0);
                    objDom.setValorPorId("CBANCO", CBANCOformateado); 
                    objDom.setValorPorId("TBANCO", TBANCOformateado);                         
                }else{                        
                    objDom.setValorPorId("CBANCO",""); 
                    objDom.setValorPorId("TBANCO","");                        
                }
            }
        }
        

        function f_fecha_FDOC() {

 
                var lista = document.getElementById("CESTADO").value;
                var today = new Date();
                var dd = today.getDate();
                var mm = today.getMonth()+1; //January is 0!
        
                var yyyy = today.getFullYear();
                if(dd<10){
                    dd='0'+dd
                } 
                if(mm<10){
                    mm='0'+mm
                } 
                var today = dd+'/'+mm+'/'+yyyy;
                if(lista == 2){
                    document.getElementById("FDOC").value = today;
                }else {
                    document.getElementById("FDOC").value = "";
                }
         
        }
         function marcarTodos() 
        {
            var checkboxes = document.getElementsByName("seleccionaagentesclave"); //obtenemos todos los controles del tipo Input
            for(i=0;i<checkboxes.length;i++) //recoremos todos los controles
            {
                if(checkboxes[i].type == "checkbox") //solo si es un checkbox entramos
                {
                    checkboxes[i].checked=true; //si es un checkbox le damos el valor del checkbox que lo llamó (Marcar/Desmarcar Todos)
                }
            }
            var CAGECLAVE=document.getElementById("CAGECLAVE").value;
            var FCOBRO=document.getElementById("FCOBRO").value;
            var FLIQUIDA=document.getElementById("FLIQUIDA").value;
             var SPROLIQ=document.getElementById("SPROLIQ").value;
             //operation=actualizar_check&CAGENTE=" + CAGENTE + "&NLIQMEN=" + NLIQMEN + "&CESTAUTOLIQ=" + CESTAUTOLIQ + "&IIMPORTE=" + IIMPORTE + "&CUSUARI=" + CUSUARI + "&SPROLIQ=" + SPROLIQ + "&CEMPRES=" + CEMPRES + "&FCOBRO=" + FCOBRO + "&FLIQUIDA=" + FLIQUIDA + "&CAGECLAVE=" + CAGECLAVE + "&IDIFGLOBAL=" + IDIFGLOBAL + "&CMARCADO=" +  ((CMARCADO)?1:0)
            objAjax.invokeAsyncCGI("modal_axisage034.do", callbackAjaxMarcarTodos, "operation=marcar_todos&CAGECLAVE="+CAGECLAVE+"&FCOBRO="+FCOBRO+"&FLIQUIDA="+FLIQUIDA+"&SPROLIQ="+SPROLIQ+"&CMARCADO=1" , this, objJsMessages.jslit_actualizando_registro);
            //objUtiles.ejecutarFormulario("modal_axisage034.do", "marcar_todos", document.miForm, "_self", objJsMessages.jslit_cargando);
           
        }
        function callbackAjaxMarcarTodos(ajaxResponseText){
             var doc=objAjax.domParse(ajaxResponseText);  
             if(!objAppMensajes.existenErroresEnAplicacion(doc)){
               
                objDom.setValorPorId("SPROLIQ", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPROLIQ"), 0, 0)));	
             }
          
        }
        function desmarcarTodos() 
        {
            
            var checkboxes = document.getElementsByName('seleccionaagentesclave'); //obtenemos todos los controles del tipo Input
            for(i=0;i<checkboxes.length;i++) //recoremos todos los controles
            {
                if(checkboxes[i].type == "checkbox") //solo si es un checkbox entramos
                {
                    checkboxes[i].checked=false; //si es un checkbox le damos el valor del checkbox que lo llamó (Marcar/Desmarcar Todos)
                }
            }
               var CAGECLAVE=document.getElementById("CAGECLAVE").value;
            var FCOBRO=document.getElementById("FCOBRO").value;
            var FLIQUIDA=document.getElementById("FLIQUIDA").value;
             var SPROLIQ=document.getElementById("SPROLIQ").value;
            objAjax.invokeAsyncCGI("modal_axisage034.do", callbackAjaxMarcarTodos, "operation=marcar_todos&CAGECLAVE="+CAGECLAVE+"&FCOBRO="+FCOBRO+"&FLIQUIDA="+FLIQUIDA+"&SPROLIQ="+SPROLIQ+"&CMARCADO=0" , this, objJsMessages.jslit_actualizando_registro);
        }
        
     
    </script>
  </head>
  
    <body onload="f_onload()" onkeypress="">
    	<div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="formulario" f="axisage034" lit="9908188" /></c:param>
                <c:param name="producto"><axis:alt c="producto" f="axisage034" lit="9908188" /></c:param>
                <c:param name="form">axisage034</c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisage034" c="TIT_AXISCTR014" lit="9908188" /></c:param>
                <c:param name="nid" value="axisctr014" />
            </c:import>   
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt c="TIT_AXISADM0062" f="axisage034" lit="9901537" /></c:param>
                <c:param name="nid" value="axisadm062" />
            </c:import>
 
            <input type="hidden" name="operation"/>
            <input type="hidden" id="CESTAUTOLIQ" name="CESTAUTOLIQ" value="${requestScope.CESTAUTOLIQ}"/> 
            <input type="hidden" id="IIMPORTE" name="IIMPORTE" value="${requestScope.IIMPORTE}"/> 
            <input type="hidden" id="CUSUARI" name="CUSUARI" value="${requestScope.CUSUARI}"/> 
            <input type="hidden" id="SPROLIQ" name="SPROLIQ" value="${__formdata.SPROLIQ}"/>
            <input type="hidden" id="CEMPRES" name="CEMPRES" value="${requestScope.CEMPRES}"/>
            <input type="hidden" id="FCOBRO" name="FCOBRO" value="${requestScope.FCOBRO}"/>
            <input type="hidden" id="CMODO" name="CMODO" value="${requestScope.CMODO}"/>
            <input type="hidden" id="FLIQUIDA" name="FLIQUIDA" value="${requestScope.FLIQUIDA}"/>
            <input type="hidden" id="CAGECLAVE" name="CAGECLAVE" value="${requestScope.CAGECLAVE}"/>
            
            <!-- Area de campos  -->
            <table id="tabla1" class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <tr id="DSP_LIQUIDAAGE_children">
                      <td align="center">

                        <!-- Nombre columnas tablas -->
                        <c:set var="title1"><axis:alt c="CAGENTE" f="axisage034" lit="9000531"/></c:set> 
                        <c:set var="title2"><axis:alt c="TAGENTE" f="axisage034" lit="9908109"/></c:set> 
                        <c:set var="title3"><axis:alt c="IDIFGLOBAL" f="axisage034" lit="9906899"/></c:set>                         
                        
                        <div class="seccion displayspaceGrande" style="width:98%">
                            <display:table name="${T_IAX_AUTOLIQUIDAAGE}" id="miListaId_documentos" export="false" class="dsptgtable" pagesize="50" defaultsort="2" defaultorder="ascending" requestURI="axis_axisage034.do?paginar=true&operation=form" sort="list" cellpadding="0" cellspacing="0">
                             
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                    <div class="dspIcons"><input type="checkbox" id="seleccionaagentesclave" name="seleccionaagentesclave" onclick="f_actualizar_check('${miListaId_documentos.OB_IAX_AUTOLIQUIDAAGE.CAGENTE}','${miListaId_documentos.OB_IAX_AUTOLIQUIDAAGE.NLIQMEN}','${miListaId_documentos.OB_IAX_AUTOLIQUIDAAGE.CESTAUTOLIQ}','${miListaId_documentos.OB_IAX_AUTOLIQUIDAAGE.IIMPORTE}','${requestScope.CUSUARI}','${requestScope.SPROLIQ}','${requestScope.CEMPRES}','${requestScope.FCOBRO}','${requestScope.FLIQUIDA}','${requestScope.CAGECLAVE}','${miListaId_documentos.OB_IAX_AUTOLIQUIDAAGE.IDIFGLOBAL}',this.checked)" <axis:atr f="axisage034" c="seleccionaagentesclave" a="modificable=true&isInputText=false"/> <c:if test="${miListaId_documentos.OB_IAX_AUTOLIQUIDAAGE.CMARCADO == '1'}">checked</c:if> /></div>
                                </display:column> 
                                <display:column title="${title1}" sortable="true" sortProperty="CAGENTE" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId_documentos.OB_IAX_AUTOLIQUIDAAGE.CAGENTE}</div>
                                </display:column>
                                <display:column title="${title2}" sortable="true" sortProperty="TAGENTE" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId_documentos.OB_IAX_AUTOLIQUIDAAGE.TAGENTE}</div>
                                </display:column>
                                <display:column title="${title3}" sortable="true" sortProperty="IDIFGLOBAL" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText" align="center"><input type="text" style="text-align:right"
                                    class="campowidthinput campo campotexto" 
                                    onchange="f_actualizar_check('${miListaId_documentos.OB_IAX_AUTOLIQUIDAAGE.CAGENTE}','${miListaId_documentos.OB_IAX_AUTOLIQUIDAAGE.NLIQMEN}','${miListaId_documentos.OB_IAX_AUTOLIQUIDAAGE.CESTAUTOLIQ}','${miListaId_documentos.OB_IAX_AUTOLIQUIDAAGE.IIMPORTE}','${requestScope.CUSUARI}','${requestScope.SPROLIQ}','${requestScope.CEMPRES}','${requestScope.FCOBRO}','${requestScope.FLIQUIDA}','${requestScope.CAGECLAVE}',this.value,'${miListaId_documentos.OB_IAX_AUTOLIQUIDAAGE.CMARCADO}')" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" 
                                    value="${miListaId_documentos.OB_IAX_AUTOLIQUIDAAGE.IDIFGLOBAL}"/>" 
                                    name="dif_input" 
                                    id="dif_input_${miListaId_documentos.OB_IAX_AUTOLIQUIDAAGE.CAGENTE}"
                                    size="1" style="width:50px" 
                                    <axis:atr f="axisage034" c="dif_input" a="modificable=true"/>/></div>
                                </display:column>                                
                            </display:table>
                            <c:choose>
                            <c:when test="${!empty lista_liquida_documentos &&  !(fn:containsIgnoreCase(header['User-Agent'],'ipad') )}">
                                <script language="javascript">objUtiles.retocarDsptagtable("miListaId_documentos");</script>
                            </c:when>
                            </c:choose>
                        </div>   
                      
                                        
                                   
                        <div class="separador">&nbsp;</div>
                        <div class="separador">&nbsp;</div>
                      </td>
                      </tr>
                      <tr>
                      <td>
                            <input type="button" onclick="marcarTodos()" class="boton" value="<axis:alt f="axisage034" c="MARCAR" lit="9904510"/>" style="cursor:pointer"/>
                            <input type="button" onclick="desmarcarTodos()" class="boton" value="<axis:alt f="axisage034" c="DESMARCAR" lit="9904511"/>" style="cursor:pointer"/>
                                        </td>
                    </tr>
                

                    </td>
                </tr>
            </table>
            <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisage034</c:param>        
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form>
        
        <script type="text/javascript">

            Calendar.setup({
                inputField     :    "FDOC",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FDOC", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>
        
        <c:import url="../include/mensajes.jsp" />
        </div>
    </body>
</html>	