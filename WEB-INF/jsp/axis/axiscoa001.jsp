<%/* Revision:# 5j25hAyzpXATcyISip1hDg== # */%>
<%-- CONSULTA CUENTAS COASEGURO--%>
<%@ page contentType="text/html;charset=iso-8859-15"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/tree.css" type="text/css"></link>
    <link rel="stylesheet" type="text/css" media="all"
          href="styles/calendar-green.css" title="green"/>
    <script type="text/javascript" src="scripts/calendar.js"></script>
    <script type="text/javascript"
            src="scripts/calendar-${sessionScope.__locale}.js"></script>
    <script type="text/javascript" src="scripts/calendar-setup.js"></script>
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript">
        function f_cerrar_axiscoa005(){
            objUtiles.cerrarModal("axiscoa005");
        }
        
        
        function f_but_buscar() {
            var CESTADO = $('#CESTADO').val();
            var NUMPROCES  = $('#NUMPROCES').val();
            if(objUtiles.estaVacio(CESTADO) && objUtiles.estaVacio(NUMPROCES)){
                alert("<axis:alt f="axisrea037" c="NUMPROCES" lit="9906576"/>");
            }else{
                if (objValidador.validaEntrada()) {
                    objUtiles.ejecutarFormulario("axis_axiscoa001.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
        }

        function f_recuperar(identificador,filtros,identificadorFila001) {
            parent.f_recuperar(identificador,filtros,identificadorFila001);
        }

        //Ir a la modal coa005
        function f_seleccionar(identificador) {
           var filtros = $('#filtros').val();
           objUtiles.abrirModal("axiscoa005","src","modal_axiscoa005.do?operation=form&identificador="+identificador+"&filtros="+filtros); 
           
        }

        function f_but_aceptar() {
            var identificador=null;
            try {
            var total=document.miForm.totalx.value;
            
            for(var j=0;j<total;j++){
                    var valor = eval("document.miForm.selCta_"+j+".checked");
                    var obtenido = valor?"1":"0";
                    if(obtenido=='1'){
                       identificador=eval("document.miForm.selCta_"+j+".value");
                    }
            }
            
            }catch(Exception){}           
            if (identificador!=undefined&&identificador!=null) {
                f_seleccionar(identificador) ;
            } 
            else {
                alert("<axis:alt f="axiscoa001" c="ERRORSINMARCAR" lit="9000505"/>");
            }
        }
        
        function f_setFiltros(){
            //CEMPRES|CRAMO|SPRODUC|NPOLIZA|NCERTIF|CESTADO|COMPANIA|CCOMPANI|TIPOCOASEGURO|FCIERRE|INVERFAS|NUMPROCES|FCIERREDESDE|FCIERREHASTA
            var CEMPRES = $('#CEMPRES').val();
            var CRAMO = $('#CRAMO').val();
            var SPRODUC = $('#SPRODUC').val();
            var NPOLIZA = $('#NPOLIZA').val();
            var NCERTIF = $('#NCERTIF').val();
            var CESTADO = $('#CESTADO').val();            
            var COMPANIA = $('#COMPANIA').val();
            var CCOMPANI = $('#CCOMPANI').val();
            var TIPOCOASEGURO = $('#TIPOCOASEGURO').val();
            var FCIERRE = $('#FCIERRE').val();
            var INVERFAS = $('#INVERFAS').val();
            var NUMPROCES = $('#NUMPROCES').val();
            var FCIERREDESDE = $('#FCIERREDESDE').val();
            var FCIERREHASTA = $('#FCIERREHASTA').val();
            
            var filtros = "";
            
            filtros = filtros + ((objUtiles.estaVacio(CEMPRES)) ? "" : CEMPRES);
            filtros = filtros + "|" + ((objUtiles.estaVacio(CRAMO)) ? "" : CRAMO);
            filtros = filtros + "|" + ((objUtiles.estaVacio(SPRODUC)) ? "" : SPRODUC);
            filtros = filtros + "|" + ((objUtiles.estaVacio(NPOLIZA)) ? "" : NPOLIZA);
            filtros = filtros + "|" + ((objUtiles.estaVacio(NCERTIF)) ? "" : NCERTIF);
            filtros = filtros + "|" + ((objUtiles.estaVacio(CESTADO)) ? "" : CESTADO);            
            filtros = filtros + "|" + ((objUtiles.estaVacio(COMPANIA)) ? "" : COMPANIA);
            filtros = filtros + "|" + ((objUtiles.estaVacio(CCOMPANI)) ? "" : CCOMPANI);
            filtros = filtros + "|" + ((objUtiles.estaVacio(TIPOCOASEGURO)) ? "" : TIPOCOASEGURO);
            filtros = filtros + "|" + ((objUtiles.estaVacio(FCIERRE)) ? "" : FCIERRE);
            filtros = filtros + "|" + ((objUtiles.estaVacio(INVERFAS)) ? "" : INVERFAS);
            filtros = filtros + "|" + ((objUtiles.estaVacio(NUMPROCES)) ? "" : NUMPROCES);
            filtros = filtros + "|" + ((objUtiles.estaVacio(FCIERREDESDE)) ? "" : FCIERREDESDE);
            filtros = filtros + "|" + ((objUtiles.estaVacio(FCIERREHASTA)) ? "" : FCIERREHASTA);
            
            $('#filtros').val(filtros);
        }
        
        function f_onload() {
            f_cargar_propiedades_pantalla(); 
            document.getElementById("CEMPRES").focus();
            
            var identificador =  $('#identificadorFila001').val();
            if(!objUtiles.estaVacio(identificador)){
                $('#identificadorFila001').val('');
                f_seleccionar(identificador);
            }            
            
            var setFiltros = '${requestScope.setFiltros}';
            if(!objUtiles.estaVacio(setFiltros) && setFiltros == 1){
                f_setFiltros();
            }
                        
            var SPROCES = document.miForm.SPROCES.value;
            if (!objUtiles.estaVacio(SPROCES) ) {
                f_but_imprimir();
            }
        }

        function f_itemchanges(itemid, itemvalue, asynchronous) {
             if(objUtiles.estaVacio(asynchronous)){
                asynchronous = true;
             }
        
              var url="axis_axiscoa001.do?operation=itemchangesjaxjson&itemid="+itemid+"&itemvalue="+itemvalue;
              objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", objJsMessages.jslit_cargando, "inline");
              jQuery.ajax({
                url: url,
                async: asynchronous,
                dataType: 'json',
                success: callBack_itemchangesjaxjson,
                error: callBack_itemchangesjaxjson_error
              });
        }
        function callBack_itemchangesjaxjson(r) {
            //alert(JSON.stringify(r))
            var recargarCombo=r.JSON2.recargarCombo;
            if (recargarCombo=='CRAMO') {
                var RAMOS=r.JSON2.RAMOS;
                var oCRAMO=document.getElementById("CRAMO");
                oCRAMO.options.length=0;
                var objOption=null;
                objOption=document.createElement("option");
                objOption.text="- <axis:alt f="axiscoa001" c="SELECC" lit="1000348"/> -";
                objOption.value="<%= Integer.MIN_VALUE %>";
                oCRAMO.options[oCRAMO.options.length]=objOption;
                if (RAMOS!=null) {
                    for (var iRAMOS=0;iRAMOS<RAMOS.length;iRAMOS++){
                        objOption=document.createElement("option");
                        objOption.text=RAMOS[iRAMOS].TRAMO;
                        objOption.value=RAMOS[iRAMOS].CRAMO;
                        oCRAMO.options[oCRAMO.options.length]=objOption;
                    }
                }
            }
            if (recargarCombo=='SPRODUC') {
                var PRODUCTOS=r.JSON2.PRODUCTOS;
                var oSPRODUC=document.getElementById("SPRODUC");
                oSPRODUC.options.length=0;
                var objOption=null;
                objOption=document.createElement("option");
                objOption.text="- <axis:alt f="axiscoa001" c="SELECC" lit="1000348"/> -";
                objOption.value="<%= Integer.MIN_VALUE %>";
                oSPRODUC.options[oSPRODUC.options.length]=objOption;
    
                if (PRODUCTOS!=null) {
                    for (var iPRODUCTOS=0;iPRODUCTOS<PRODUCTOS.length;iPRODUCTOS++){
                        objOption=document.createElement("option");
                        objOption.text=PRODUCTOS[iPRODUCTOS].TTITULO;
                        objOption.value=PRODUCTOS[iPRODUCTOS].SPRODUC;
                        oSPRODUC.options[oSPRODUC.options.length]=objOption;
                    }
                }
            }
            if (recargarCombo=='COMPANIA') {
                var COMPANIAS=r.JSON2.COMPANIAS;
                var oCOMPANIA=document.getElementById("COMPANIA");
                oCOMPANIA.options.length=0;
                var objOption=null;
                objOption=document.createElement("option");
                objOption.text="- <axis:alt f="axiscoa001" c="SELECC" lit="1000348"/> -";
                objOption.value="<%= Integer.MIN_VALUE %>";
                oCOMPANIA.options[oCOMPANIA.options.length]=objOption;
    
                if (COMPANIAS!=null) {
                    for (var iCOMPANIAS=0;iCOMPANIAS<COMPANIAS.length;iCOMPANIAS++){
                        objOption=document.createElement("option");
                        objOption.text=COMPANIAS[iCOMPANIAS].TCOMPANI;
                        objOption.value=COMPANIAS[iCOMPANIAS].CCOMPANI;
                        oCOMPANIA.options[oCOMPANIA.options.length]=objOption;
                    }
                }
            }
            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
        }
        function callBack_itemchangesjaxjson_error(r) {
            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
            alert("ERROR JSON "+JSON.stringify(r))
        }
        //BRSP
        function f_but_9001771() {
        	         
            var CODPROCES=document.miForm.SPROCES.value;
            var CODCOMPANI=document.miForm.CCOMPANI_COA.value;
            var CODLIQUIDCOA=100;
            
        	
        	if (objValidador.validaEntrada()) {
                //Solo permitimos liquidar si estado de cierre es PENDIENTE
                if($('#CESTADO option:selected').val() == 1){
                
                    var CEMPRES = $('#CEMPRES option:selected').val();
                    var COMPANIA = $('#COMPANIA option:selected').val();    
                    var FCIERRE = $('#FCIERRE').val();
                    var FCIERREDESDE = $('#FCIERREDESDE').val();
                    var FCIERREHASTA = $('#FCIERREHASTA').val();
                    var TIPOCOASEGURO = $('#TIPOCOASEGURO option:selected').val();  
                                        
                    <axis:visible c="VAL_LIQUIDAR" f="axiscoa001">
                        if(!objUtiles.estaVacio(CEMPRES) && !objUtiles.estaVacio(FCIERREDESDE) && !objUtiles.estaVacio(FCIERREHASTA) && !objUtiles.estaVacio(TIPOCOASEGURO)) { 
                    </axis:visible>
                        //pasar como valor a datos_num_lineas una concadenacion de todos los datos_num_linea_, donde num_linea_ esta checked
                        var odatos_selCta=document.getElementById("datos_selCta");
                        odatos_selCta.value="";
                        var inputs=document.getElementsByTagName("input");
                        var x="-1";
                        for (var iinputs=0;iinputs<inputs.length;iinputs++) {
                            if (inputs[iinputs].id!=null&&inputs[iinputs].id.indexOf("selCta_")==0&&inputs[iinputs].checked) {
                                x=inputs[iinputs].id.substring("selCta_".length);
                                odatos_selCta.value=odatos_selCta.value+document.getElementById("datos_selCta_"+x).value+"@";
                            }
                        }
                        
                        if (odatos_selCta.value.length>0) {
                            //Para el SPROCES, necesitamos el CEMPRES. Nos vale el CEMPRES del 1er de los posibles registros a tratar
                            var odatos_selCta_value=document.getElementById("datos_selCta").value;
                            var primeraLinea=odatos_selCta_value.split("@")[0];
                            var url="axis_axiscoa001.do?operation=recuperarsprocesajaxjson&CEMPRES="+escape(CEMPRES);
                            //recuperacion del SPROCES por JSON-AJAX
                            jQuery.ajax({
                                url: url,
                                dataType: 'json',
                                success: callMeBack_recuperarsprocesajaxjson, 
                                error: callMeBack_recuperarsprocesajaxjson_error 
                            });
                            f_descargar_reporte(CODPROCES,CODCOMPANI,CODLIQUIDCOA);
                        }
                        else {
                            odatos_selCta.value="";
                            alert("<axis:alt f="axiscoa001" c="ERRORSINMARCAR" lit="9000505"/>");
                        }
                    <axis:visible c="VAL_LIQUIDAR" f="axiscoa001">
                        }else{
                            alert("<axis:alt f="axiscoa001" c="ERRORSINMARCAR" lit="9906956"/>");
                        }
                    </axis:visible>
                }else{
                    alert("<axis:alt f="axiscoa001" c="ERRORSINMARCAR" lit="9905982"/>");
                }
             }//Fin validaEntrada
        }
        
        function callMeBack_recuperarsprocesajaxjson(q) {
            //Recuperacion del SPROCES y, si ha ido bien, lanzamos la peticion de liquidar
            if (q.JSON2.MENSAJES!=null && q.JSON2.MENSAJES.length>0) {
                var errmsg="<axis:alt c="EJECUTAR_ERROR" f="axiscoa002" lit="108953" />";
                for (var i=0;i<q.JSON2.MENSAJES.length;i++) {
                    var miMENSAJESitem=q.JSON2.MENSAJES[i];
                    errmsg=errmsg+"\n- "+miMENSAJESitem.OB_IAX_MENSAJES.TERROR;
                }
                alert(errmsg);
            }
            else {
                var NPROCESO=q.JSON2.PNPROCESO;
                if (confirm ("<axis:alt c="CONFIRM_NPROCESO" f="axiscoa002" lit="9000493" />: "+NPROCESO+"\n<axis:alt c="EJECUTAR_NPROCESO" f="axiscoa002" lit="9000711" />")){
                    document.miForm.SPROCES.value=NPROCESO;
                    //Buscamos el nombre del primer registro liquidable (solo los liquidables tendran un input con name del tipo "selCta_*")
                    var nameLiquidable = $('input[name*="selCta_"]')[0].name;                    
                    //Obtenemos el identificador de dicho registro y de él obtenemos el SPROCES
                    if(!objUtiles.estaVacio(nameLiquidable)){
                        var identificador = $('#datos_' + nameLiquidable).val();
                        var res = identificador.split("|");
                        var SPROCES_ANT = res[4];
                        document.miForm.SPROCES_ANT.value=SPROCES_ANT;
                        objUtiles.ejecutarFormulario("axis_axiscoa001.do?identificador="+identificador, "liquidar", document.miForm, "_self", objJsMessages.jslit_cargando);
                    }
                }
            }
        }

        function callMeBack_recuperarsprocesajaxjson_error() {
                var errmsg="<axis:alt c="EJECUTAR_ERROR" f="axiscoa001" lit="108953" />";
                alert(errmsg);
         }
         
         function f_but_imprimir(){
                var vSPROCES = document.miForm.SPROCES.value;
                var vCCOMPANI = document.miForm.CCOMPANI_COA.value;
                document.miForm.SPROCES.value = '';
               
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_proceso_compania&SPROCES=" + vSPROCES + "&CTIPO=LIQUIDACOA" + "&CCOMPANI=" + vCCOMPANI, 0, 0);
         }
         
         function f_but_100001() {
                var vSPROCES = document.miForm.NUMPROCES.value;
                var vCCOMPANI = document.miForm.CCOMPANI.value;
                document.miForm.SPROCES.value = '';
               objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_proceso_compania&SPROCES=" + vSPROCES  + "&CTIPO=LIQUIDACOA" + "&CCOMPANI=" + vCCOMPANI, 0, 0);
        }

        function actualizar_importes(total_filas, i, thiss){
                var CESTADO = $('#CESTADO').val();
                var NUMPROCES  = $('#NUMPROCES').val();
                
                var identificador = $('#datos_selCta_' + i).val();
                
                var CESTADO_NEW;
                var CESTADO_OLD;
                if(thiss.checked == false){
                    CESTADO_NEW = 4;
                    CESTADO_OLD = CESTADO
                }else{
                    CESTADO_NEW = CESTADO;
                    CESTADO_OLD = 4;
                }
                
                if(objUtiles.estaVacio(CESTADO) && objUtiles.estaVacio(NUMPROCES)){
                    alert("<axis:alt f="axisrea037" c="NUMPROCES" lit="9906576"/>");
                }else{        
                       var elementos = "";        
                       for(var j=0;j<total_filas;j++){
                            //alert("document.miForm.num_linea_"+j+".checked");
                            if(eval("document.miForm.selCta_"+j) != undefined){                            
                                var valor = eval("document.miForm.selCta_"+j+".checked");
                                //alert("VALOR TRUE OR FALSE"+valor);
                                var obtenido = valor?"1":"0";
                                //alert("valor: "+obtenido+" de fila: "+j);
                                if(obtenido=='1'){
                                   elementos = elementos+j+"x";
                                }
                            }
                       }
                      //alert("Suma: total: ************************************* :"+elementos);
                      objUtiles.ejecutarFormulario ("axis_axiscoa001.do?CADENA_VALORES="+elementos+"&CESTADO_NEW="+CESTADO_NEW+"&CESTADO_OLD="+CESTADO_OLD+"&identificador="+identificador, "recargar_pantalla", document.miForm, "_self", objJsMessages.jslit_cargando);    
                }
       
        
        }
        
        function f_buscar(){
                var CESTADO = $('#CESTADO').val();
                
                if(!objUtiles.estaVacio(CESTADO)){
                    f_but_buscar();
                }else{
                    //Si seleccionamos la opcion --Seleccionar-- de CESTADO, mostraremos la lista vacía
                    objUtiles.ejecutarFormulario("axis_axiscoa001.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }

        function f_but_cancelar() {
            
           var CEMPRES = $('#CEMPRES').val();
           
            objAjax.invokeAsyncCGI("axis_axiscoa001.do?CEMPRES="+CEMPRES, callbackCancelar, 
                        "operation=cancelar", this);
        }
        
        function callbackCancelar(ajaxResponseText) {
             objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axiscoa001", "cancelar", document.miForm, "_self");
        }
        
        

        function f_cerrar_axisimprimir() {
            // bug 0023830
            objUtiles.cerrarModal("axisimprimir");
        }
        
        
        //----------------------------------------------
        //BRSP
        function f_descargar_reporte(CODPROCES,CODCOMPANI,CODLIQUIDCOA){
	      	$("#CODPROCES").val(CODPROCES);
	      	$("#CODCOMPANI").val(CODCOMPANI);
	      	$("#CODLIQUIDCOA").val(CODLIQUIDCOA);
			objAjax.invokeAsyncCGI_JSON("axis_axiscoa001.do?operation=descargar_reporte&"+$("#miForm").serialize(), callBack_miajaxjson, "<axis:alt f='axiscoa001' c='MSG_CARGAR' lit='9905686'/>")
		} 

    	function callBack_miajaxjson(p) {
            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
             //hay que actualizar la lista de resulotados xxx
             var odiv_OBFICHERO=document.getElementById("div_OBFICHERO");
             odiv_OBFICHERO.innerHTML="";
             var div_OBFICHEROcontenido="";
             div_OBFICHEROcontenido=div_OBFICHEROcontenido+"<table align=\"center\" class=\"dsptgtable\">";
             
             if (p.JSON2.LIST_FICHEROS!=null) {           	 
            	 
            	 div_OBFICHEROcontenido=div_OBFICHEROcontenido+"<tr><td><a href=\"javascript:f_imprimir_fitxer()\">"+p.JSON2.LIST_FICHEROS.ONOMFICHERO+"</a><input type=\"hidden\"   name=\"fileAbsolutePath"+"\" id=\"fileAbsolutePath"+"\" value=\""+p.JSON2.LIST_FICHEROS.OFICHERO+"\"/> </td></tr> ";
                 div_OBFICHEROcontenido=div_OBFICHEROcontenido+"</table>";
                 odiv_OBFICHERO.innerHTML=div_OBFICHEROcontenido;
                 f_imprimir_fitxer();
       		}
    	}
    	
    	
	
	function f_imprimir_fitxer(){
        		
        pfitxer = document.getElementById('fileAbsolutePath').value;
        var doc = pfitxer.replace(/barrainvertida/gi, "\\");
        nuevaVentana = window.open("axis_axiscoa001.do?operation=tunnel_doc&fileAbsolutePath=" + doc, "_new");    
        // Abrir un proceso con setInterval para cerrar la ventana recién abierta
        if (document.all) {
             idVentanas[contadorVentanas] = setInterval("f_cerrar_nuevaVentana()", 100);
             contadorVentanas++;
         }
     } 
    function f_cerrar_axisimprimir() {
            objUtiles.cerrarModal("axisimprimir");
    }

    </script>
  </head>
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}"
        onload="f_onload()"
        onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <div class="seccion displayspace" id="div_OBFICHERO" style="display:none"></div>
        <c:import url="../include/precargador_ajax.jsp">
      <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import><form name="miForm" action="axis_axiscoa001.do" method="POST">
    
      <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo">
          <axis:alt f="axiscoa001" c="TITULO" lit="CONSULTA CUENTAS COASEGURO"/>
        </c:param>
        <c:param name="formulario">
          <axis:alt f="axiscoa001" c="TITULO" lit="CONSULTA CUENTAS COASEGURO"/>
        </c:param>
        <c:param name="form">axiscoa001</c:param>
      </c:import>
      
       <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axiscoa001" c="TIT_005" lit="104907" /></c:param>
                <c:param name="nid" value="axiscoa005" />
       </c:import>
       
       <%-- bug 0023830 --%>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axiscoa001" c="cam_impressio_doc" lit="1000205" />|true</c:param>
        </c:import> 
           
      <input type="hidden" name="SPROCES" value="${__formdata.SPROCES}"/>
      <input type="hidden" name="SPROCES_ANT" value="${__formdata.SPROCES_ANT}"/>
      <input type="hidden" name="CCOMPANI_COA" value="${__formdata.CCOMPANI}"/>
      <input type="hidden" id="operation" name="operation" value=""/>
      <input type="hidden" id="filtros" name="filtros" value="${__formdata.filtros}"/>
      <input type="hidden" id="identificador" name="identificador" value="${__formdata.identificador}"/>
      <input type="hidden" id="identificadorFila001" name="identificadorFila001" value="${__formdata.identificadorFila001}"/>
	  <input type="hidden" name="CODPROCES" id="CODPROCES" value="${__formdata.CODPROCES}"/>
	  <input type="hidden" name="CODCOMPANI" id="CODCOMPANI" value="${__formdata.CODCOMPANI}"/>
	  <input type="hidden" name="CODLIQUIDCOA" id="CODLIQUIDCOA" value="${__formdata.CODLIQUIDCOA}"/>	 
	  <input type="hidden" id="fileAbsolutePath" name="fileAbsolutePath" value="" /> 	
	      	
	      	
      <table class="mainTableDimensions base" align="center" cellpadding="0"
             cellspacing="3">
        <tr>
          <td>
            <div class="separador">&nbsp;</div>
            <table class="seccion">
              <tr>
                <td>
                  <table class="area" align="center">
                    <tr>
                      <th style="width:25%;height:0%;"></th>
                      <th style="width:25%;height:0%;"></th>
                      <th style="width:25%;height:0%;"></th>
                      <th style="width:25%;height:0%;"></th>
                    </tr>
                    <tr>
                      <axis:ocultar f="axiscoa001" c="CEMPRES">
                        <td class="titulocaja" colspan="2">
                          <b><axis:alt f="axiscoa001" c="CEMPRES" lit="101619"/></b>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar f="axiscoa001" c="COMPANIA">
                        <td class="titulocaja">
                          <b><axis:alt f="axiscoa001" c="COMPANIA"
                                       lit="9901223"/></b>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar f="axiscoa001" c="INVERFAS">
                        <td class="titulocaja">
                          <b><axis:alt f="axiscoa001" c="INVERFAS" lit="9906951"/></b>
                        </td>
                      </axis:ocultar>
                    </tr>
                    <tr>
                      <axis:ocultar f="axiscoa001" c="CEMPRES">
                        <td class="campocaja" colspan="2">
                          <select name="CEMPRES" id="CEMPRES" size="1" onchange="f_itemchanges('CEMPRES', this.value)" class="campowidthselect campo campotexto" title="<axis:alt f="axiscoa001" c="CEMPRES" lit="101619"/>" alt="<axis:alt f="axiscoa001" c="CEMPRES" lit="101619"/>">
                            <option value="<%= Integer.MIN_VALUE %>">- <axis:alt f="axiscoa001" c="SELECC" lit="1000348"/> -</option>
                            <c:forEach var="item" items="${LSTEMPRESAS}">
                              <option value="${item.CEMPRES}" <c:if test="${__formdata.CEMPRES == item.CEMPRES || fn:length(LSTEMPRESAS) == 1}">selected</c:if>>${item.TEMPRES}</option>
                            </c:forEach>
                          </select>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar f="axiscoa001" c="COMPANIA">
                        <td class="campocaja">
                          <select name="COMPANIA" id="COMPANIA" class="campowidthselect campo campotexto" title="<axis:alt f="axiscoa001" c="COMPANIA" lit="9901223"/>" alt="<axis:alt f="axiscoa001" c="COMPANIA" lit="9901223"/>"  onchange="f_but_buscar()" >
                            <option value="<%= Integer.MIN_VALUE %>">- <axis:alt f="axiscoa001" c="SELECC" lit="1000348"/> -</option>
                            <c:forEach var="item" items="${LSTCOMPANIAS}">
                              <option value="${item.CCOMPANI}" <c:if test="${__formdata.COMPANIA == item.CCOMPANI || fn:length(LSTCOMPANIAS) == 1}">selected</c:if>>${item.TCOMPANI}</option>
                            </c:forEach>
                          </select>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar f="axiscoa001" c="INVERFAS">
                        <td class="campocaja">                            
                            <select name = "INVERFAS" id="INVERFAS" style="width:90%" value="${__formdata.INVERFAS}" size="1"  class="campowidthselect campo campotexto"
                                        title="<axis:alt c="INVERFAS" f="axiscoa001" lit="9906951" />"
                                        <axis:atr f="axiscoa001" c="INVERFAS" a="modificable=true&isInputText=false"/>>
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axiscoa001" c="SELECCIONAR" lit="108341"/> - </option>    
                                            <c:forEach var="combustible" items="${LSTINVERFAS}">
                                                <option value = "${combustible.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.INVERFAS) && combustible.CATRIBU == __formdata.INVERFAS}"> selected </c:if>>
                                                                ${combustible.TATRIBU}
                                                </option>  
                                            </c:forEach>
                           </select>
                        </td>
                      </axis:ocultar>
                    </tr>
                    <tr>
                      <axis:ocultar f="axiscoa001" c="FCIERRE">
                        <td class="titulocaja">
                          <b><axis:alt f="axiscoa002" c="FCIERRE"
                                       lit="9000490"/></b>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar f="axiscoa001" c="FCIERREDESDE">
                        <td class="titulocaja">
                          <b><axis:alt f="axiscoa002" c="FCIERREDESDE"
                                       lit="9908690"/></b>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar f="axiscoa001" c="FCIERREHASTA">
                        <td class="titulocaja">
                          <b><axis:alt f="axiscoa002" c="FCIERREHASTA"
                                       lit="9908691"/></b>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar f="axiscoa001" c="TIPOCOASEGURO">
                        <td class="titulocaja">
                          <b><axis:alt f="axiscoa002" c="TIPOCOASEGURO"
                                       lit="9902935"/></b>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar f="axiscoa001" c="CCOMPANI">
                        <td class="titulocaja">
                          <b><axis:alt f="axiscoa002" c="CCOMPANI"
                                       lit="9904160"/></b>
                        </td>
                      </axis:ocultar> 
                    </tr>
                    <tr>
                      <axis:ocultar f="axiscoa001" c="FCIERRE">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" size="15" style="width:35%;"
                                            value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCIERRE}"/>" name="FCIERRE" id="FCIERRE"
                                            title="<axis:alt f=' axiscoa001' c='FCIERRE' lit='9000490'/>" alt="<axis:alt f=' axiscoa001' c='FCIERRE' lit='9000490'/>"
                                            <axis:atr f=" axiscoa001" c="FCIERRE" a="formato=fecha"/> /><a style="vertical-align:middle;"><img id="icon_FCIERRE" 
                                            alt="<axis:alt f=" axiscoa001" c="FCIERRE" lit="9000490"/>" title="<axis:alt f=" axiscoa001" c="FCIERRE" lit="9000490" />" src="images/calendar.gif"/></a>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar f="axiscoa001" c="FCIERREDESDE">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" size="15" style="width:35%;"
                                            value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCIERREDESDE}"/>" name="FCIERREDESDE" id="FCIERREDESDE"
                                            title="<axis:alt f=' axiscoa001' c='FCIERREDESDE' lit='9908690'/>" alt="<axis:alt f=' axiscoa001' c='FCIERREDESDE' lit='9908690'/>"
                                            <axis:atr f=" axiscoa001" c="FCIERRE" a="formato=fecha"/> /><a style="vertical-align:middle;"><img id="icon_FCIERREDESDE" 
                                            alt="<axis:alt f=" axiscoa001" c="FCIERREDESDE" lit="9908690"/>" title="<axis:alt f=" axiscoa001" c="FCIERREDESDE" lit="9908690" />" src="images/calendar.gif"/></a>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar f="axiscoa001" c="FCIERREHASTA">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" size="15" style="width:35%;"
                                            value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCIERREHASTA}"/>" name="FCIERREHASTA" id="FCIERREHASTA"
                                            title="<axis:alt f=' axiscoa001' c='FCIERREHASTA' lit='9908691'/>" alt="<axis:alt f=' axiscoa001' c='FCIERREHASTA' lit='9908691'/>"
                                            <axis:atr f=" axiscoa001" c="FCIERREHASTA" a="formato=fecha"/> /><a style="vertical-align:middle;"><img id="icon_FCIERREHASTA" 
                                            alt="<axis:alt f=" axiscoa001" c="FCIERREHASTA" lit="9908691"/>" title="<axis:alt f=" axiscoa001" c="FCIERREHASTA" lit="9908691" />" src="images/calendar.gif"/></a>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar f="axiscoa001" c="TIPOCOASEGURO">
                        <td class="campocaja">
                          <select name="TIPOCOASEGURO" id="TIPOCOASEGURO" class="campowidthselect campo campotexto" title="<axis:alt f="axiscoa001" c="TIPOCOASEGURO" lit="9902935"/>" alt="<axis:alt f="axiscoa001" c="TIPOCOASEGURO" lit="9902935"/>">
                            <option value="<%= Integer.MIN_VALUE %>">- <axis:alt f="axiscoa001" c="SELECC" lit="1000348"/> -</option>
                            <c:forEach var="item" items="${TIPCOASEGURO}">
                              <option value="${item.CATRIBU}" <c:if test="${__formdata.TIPOCOASEGURO == item.CATRIBU || fn:length(TIPCOASEGURO) == 1}">selected</c:if>>${item.TATRIBU}</option>
                            </c:forEach>
                          </select>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar f="axiscoa001" c="CCOMPANI">
                        <td class="campocaja">
                          <select name="CCOMPANI" id="CCOMPANI" class="campowidthselect campo campotexto" title="<axis:alt f="axiscoa001" c="CCOMPANI" lit="9904160"/>" alt="<axis:alt f="axiscoa001" c="CCOMPANI" lit="9904160"/>">
                            <option value="<%= Integer.MIN_VALUE %>">- <axis:alt f="axiscoa001" c="SELECC" lit="1000348"/> -</option>
                            <c:forEach var="item" items="${LSTCIA_REA}">
                              <option value="${item.CCOMPANI}" <c:if test="${__formdata.CCOMPANI == item.CCOMPANI || fn:length(LSTCIA_REA) == 1}">selected</c:if>>${item.TCOMPANI}</option>
                            </c:forEach>
                          </select>
                        </td>
                      </axis:ocultar> 
                    </tr>
                    
                    <tr>
                      <axis:ocultar f="axiscoa001" c="CRAMO">
                        <td class="titulocaja">
                          <b><axis:alt f="axiscoa001" c="CRAMO" lit="100784"/></b>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar f="axiscoa001" c="SPRODUC">
                        <td class="titulocaja">
                          <b><axis:alt f="axiscoa001" c="SPRODUC" lit="100829"/></b>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar f="axiscoa001" c="NPOLIZA">
                        <td class="titulocaja">
                          <b><axis:alt f="axiscoa001" c="NPOLIZA" lit="109546"/></b>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar f="axiscoa001" c="NUMPROCES">
                        <td class="titulocaja" >                                <%--Nº Liquidación --%>
                            <b><axis:alt f="axiscoa001" c="LIT_NUMPROCES" lit="9904002"/></b>
                        </td>
                        </axis:ocultar>
	                    <axis:visible f="axisrea037" c="CESTADO">
	                          <td class="titulocaja">
	                              <b><axis:alt f="axiscoa001" c="CESTADO" lit="9000489"/></b> 
	                          </td>
	                    </axis:visible>   
                    </tr>
                    
                    
                    <tr>
                      <axis:ocultar f="axiscoa001" c="CRAMO">
                        <td class="campocaja">
                          <select id="CRAMO" name="CRAMO" onchange="f_itemchanges('CEMPRES_CRAMO', document.getElementById('CEMPRES').value+'_'+this.value)" class="campowidthselect campo campotexto" title="<axis:alt f="axiscoa001" c="CRAMO" lit="100784"/>" alt="<axis:alt f="axiscoa001" c="CRAMO" lit="100784"/>" >
                            <option value="<%= Integer.MIN_VALUE %>">- <axis:alt f="axiscoa001" c="SELECC" lit="1000348"/> -</option>
                            <c:forEach var="item" items="${RAMOS}">
                              <option value="${item.CRAMO}" <c:if test="${__formdata.CRAMO == item.CRAMO || fn:length(RAMOS) == 1}">selected</c:if>>${item.TRAMO}</option>
                            </c:forEach>
                          </select>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar f="axiscoa001" c="SPRODUC">
                        <td class="campocaja">
                          <select id="SPRODUC" size="1" name="SPRODUC" onchange="f_itemchanges('SPRODUC', this.value)" class="campowidthselect campo campotexto" title="<axis:alt f="axiscoa001" c="SPRODUC" lit="100829"/>" alt="<axis:alt f="axiscoa001" c="SPRODUC" lit="100829"/>">
                            <option value="<%= Integer.MIN_VALUE %>">- <axis:alt f="axiscoa001" c="SELECC" lit="1000348"/> -</option>
                            <c:forEach var="item" items="${PRODUCTOS}">
                              <option value="${item.SPRODUC}" <c:if test="${__formdata.SPRODUC == item.SPRODUC || fn:length(PRODUCTOS) == 1}">selected</c:if>>${item.TTITULO}</option>
                            </c:forEach>
                          </select>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar f="axiscoa001" c="NPOLIZA">
                        <td class="campocaja">
                          <input type="text" name="NPOLIZA" id="NPOLIZA" class="campo campotexto" style="width:70%" value="${__formdata.NPOLIZA}" title="<axis:alt f="axiscoa001" c="NPOLIZA" lit="109546"/>" alt="<axis:alt f="axiscoa001" c="NPOLIZA" lit="NPOLIZA"/>" <axis:atr f="axiscoa001" c="NPOLIZA" a="formato=entero"/> />
                          <input type="text" name="NCERTIF" id="NCERTIF" class="campo campotexto" style="width:20%" value="${__formdata.NCERTIF}" title="<axis:alt f="axiscoa001" c="NCERTIF" lit="101168"/>" alt="<axis:alt f="axiscoa001" c="NCERTIF" lit="NCERTIF"/>" <axis:atr f="axiscoa001" c="NCERTIF" a="formato=entero"/> />
                        </td>
                      </axis:ocultar>
                      
                      <axis:ocultar f="axiscoa001" c="NUMPROCES">
                      <td class="campocaja">
                        <input type="text" class="campo campotexto" size="15" style="width:90%"
                               value="${__formdata.NUMPROCES}" name="NUMPROCES" id="NUMPROCES"
                               title="<axis:alt f='axiscoa001' c='NUMPROCES' lit='9904002'/>" 
                               alt="<axis:alt f='axiscoa001' c='NUMPROCES' lit='9904002'/>"
                               <axis:atr f="axiscoa001" c="NUMPROCES" a="modificable=true&formato=entero"/> 
                        />
                        </td> 
                       </axis:ocultar> 
                     <axis:ocultar f="axiscoa001" c="CESTADO"> 
                      <td class="campocaja">          
                        <select name = "CESTADO" id ="CESTADO" size="1" onchange="f_buscar()" class="campo campotexto" style="width:90%" title="<axis:alt f="axiscoa001" c="CESTADO" lit="9000489"/>" alt="<axis:alt f="axiscoa001" c="CESTADO" lit="9000489"/>">
                            <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axiscoa001" c="SNV_COMBO" lit="1000348"/> - </option>
                            <c:forEach items="${LSTESTADOS}" var="item">
                                <option value = "${item.CATRIBU}" <c:if test="${__formdata.CESTADO == item.CATRIBU}"> selected </c:if>>${item.TATRIBU}</option>
                            </c:forEach>
                        </select>           
                       </td> 
                      </axis:ocultar>
                    </tr>
                    
                   
                  </table>
                </td>
              </tr>
              <tr>
                <td class="titulocaja" colspan="5">
                  <div class="separador">&nbsp;</div>
                  <div class="displayspaceGrande">
                    <c:set var="title0">
                      <axis:alt f="axiscoa001" c="COMPANIA" lit="9901223"/>
                    </c:set>
                     
                    <c:set var="title1">
                      <axis:alt f="axiscoa001" c="COASEGURADORA"
                                lit="9904160"/>
                    </c:set>
                     
                    <c:set var="title2">
                      <axis:alt f="axiscoa001" c="FECHACIERRE" lit="9000490"/>
                    </c:set>
                    
                    <c:set var="title3">
                      <axis:alt f="axiscoa001" c="TIPOCOASEGURO" lit="9902935"/>
                    </c:set>
                                         
                     
                    <c:set var="title4">
                      <axis:alt f="axiscoa001" c="MONEDA" lit="108645"/>
                    </c:set>
                    
                    <c:set var="title5">
                      <axis:alt f="axiscoa001" c="ISALDO" lit="104910"/>
                    </c:set>
                      <% int x = 0; %>   
                      <% int sumatorio = 1; %>   
                      <c:set var="total1A">0</c:set>
                      <c:set var="total2A">0</c:set>
					  <c:set var="total3A">0</c:set>
					  <c:set var="total4A">0</c:set>
                      <%--<c:set var="total_filas">0</c:set>--%>
                      <c:set var="total_filas">${fn:length(CTACOASEGURO)}</c:set>  <%-- Total filas multirregistro --%>
                      <input type="hidden" name="datos_selCta" id="datos_selCta" value="" />
                     <%--${CTACOASEGURO}--%>
                    <display:table name="${CTACOASEGURO}"
                                   id="CTACOASEGURO" export="false"
                                   class="dsptgtable" pagesize="-1"
                                   defaultsort="3" defaultorder="ascending"
                                   sort="list" cellpadding="0" cellspacing="0"
                                   requestURI="axis_axiscoa001.do?paginar=true">
                      <%@ include file="../include/displaytag.jsp"%>
                      <c:set var="IDENTIFICADOR">${CTACOASEGURO.CCOMPAPR}|${CTACOASEGURO.CCOMPANI}|${CTACOASEGURO.CTIPCOA}|<fmt:formatDate pattern="dd/MM/yyyy" value="${CTACOASEGURO.FCIERRE}"/>|${CTACOASEGURO.SPROCES}|${CTACOASEGURO.ES_LIQUIDABLE}</c:set><%-- CCOMPAPR|CCOMPANI|CTIPCOA|FCIERRE|SPROCES --%>
                      

                                                           
                      <display:column title="" sortable="false"
                                      headerClass="sortable headwidth5 fixed"
                                      media="html" autolink="false">
                        <div class="dspIcons">
                            <c:if test="${CTACOASEGURO.ES_LIQUIDABLE == 1 && ((__formdata.CESTADO == 1) || (__formdata.CESTADO != 1 && CTACOASEGURO.ESTADO == 1))}">
                                  <input type="checkbox" name="selCta_<%=x%>" <c:if test="${CTACOASEGURO.NUM_LINEA == 1 && CTACOASEGURO.CESTADO ==1}" >checked</c:if> id="selCta_<%=x%>"  value="" onclick="actualizar_importes('${total_filas}','<%=x%>', this);"/>
                                  <%--<c:set var="total_filas">${total_filas + 1}</c:set>
                                  <% x=x+sumatorio; %>--%>
                            </c:if> 
                            <input type="hidden" id="datos_selCta_<%=x%>"  value="${IDENTIFICADOR}" />                           
                        </div>
                      </display:column>
                      <display:column title="${title0}" sortable="true"
                                      sortProperty="TCOMPAPR"
                                      headerClass="sortable fixed" media="html"
                                      autolink="false">
                        <div class="dspText">
                          <span style="text-decoration:underline;cursor:pointer"
                                onclick="f_seleccionar('${IDENTIFICADOR}')">
                            ${CTACOASEGURO.TCOMPAPR}
                          </span>
                        </div>
                      </display:column>
                      <display:column title="${title1}" sortable="true"
                                      sortProperty="TCOMPANI"
                                      headerClass="sortable fixed" media="html"
                                      autolink="false">
                        <div class="dspText">
                          <span style="text-decoration:underline;cursor:pointer"
                                onclick="f_seleccionar('${IDENTIFICADOR}')">
                            ${CTACOASEGURO.TCOMPANI}
                          </span>
                        </div>
                      </display:column>
                      <display:column title="${title2}" sortable="true"
                                      sortProperty="FCIERRE"
                                      headerClass="sortable fixed" media="html"
                                      autolink="false">
                        <div class="dspText">
                          <fmt:formatDate value="${CTACOASEGURO.FCIERRE}"
                                          pattern="dd/MM/yyyy"/>
                        </div>
                      </display:column>
                      <display:column title="${title3}" sortable="true"
                                      sortProperty="TTIPCOA"
                                      headerClass="sortable fixed" media="html"
                                      autolink="false">
                        <div class="dspText">
                          <span style="text-decoration:underline;cursor:pointer"
                                onclick="f_seleccionar('${IDENTIFICADOR}')">
                            ${CTACOASEGURO.TTIPCOA}
                          </span>
                        </div>
                      </display:column>
                      <display:column title="${title4}" sortable="true"
                                      sortProperty="TMONEDA"
                                      headerClass="sortable fixed" media="html"
                                      autolink="false">
                        <div class="dspText">
                          ${CTACOASEGURO.TMONEDA}
                        </div>
                        </display:column>
                        <display:column title="${title5}" sortable="true"
                                      sortProperty="ISALDO"
                                      headerClass="sortable fixed" media="html"
                                      autolink="false">
                        <div class="dspNumber">
							<c:choose>
								<c:when test="${CTACOASEGURO.TMONEDA == 'CLP' || CTACOASEGURO.TMONEDA == 'UF'}">
									<fmt:formatNumber pattern="#,##0.000000" value="${CTACOASEGURO.ISALDO}" />
								</c:when>    
								<c:otherwise>
									<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${CTACOASEGURO.ISALDO}"/>
								</c:otherwise>
							</c:choose>
                        </div>
                      </display:column>
                        <% x=x+sumatorio; %>
                        <c:set var="total"><%=x%></c:set>
                        <c:if test="${CTACOASEGURO.TMONEDA == 'USD' && CTACOASEGURO.NUM_LINEA == 1 && CTACOASEGURO.ES_LIQUIDABLE == 1}">
                            <c:set var="total1A">${total1A + CTACOASEGURO.ISALDO}</c:set>
                         </c:if>                                                     
                         <c:if test="${CTACOASEGURO.TMONEDA == 'COP' && CTACOASEGURO.NUM_LINEA == 1 && CTACOASEGURO.ES_LIQUIDABLE == 1}">
                            <c:set var="total2A">${total2A + CTACOASEGURO.ISALDO}</c:set>
                         </c:if>
						  <c:if test="${CTACOASEGURO.TMONEDA == 'CLP' && CTACOASEGURO.NUM_LINEA == 1 && CTACOASEGURO.ES_LIQUIDABLE == 1}">
                            <c:set var="total3A">${total3A + CTACOASEGURO.ISALDO}</c:set>
                         </c:if>
						  <c:if test="${CTACOASEGURO.TMONEDA == 'UF' && CTACOASEGURO.NUM_LINEA == 1 && CTACOASEGURO.ES_LIQUIDABLE == 1}">
                            <c:set var="total4A">${total4A + CTACOASEGURO.ISALDO}</c:set>
                         </c:if>
                    </display:table>
                    <input type="hidden" name="totalx" id="totalx"  value="${total}" />
                  </div>
                  
                  <table cellpadding="0" class="dsptgtable grid" style="width:98%" cellspacing="0"><tbody>
                     <axis:ocultar f="axiscoa001" c="SALDOUSD">
					 <tr class="gridEven">
                    <td style="width:5%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"></td>
                    <td style="width:5%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"> <b><axis:alt f="axiscoa001" c="SALDO_USD" lit="9905029"/></b></td>
                    <td style="width:10%"><div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${total1A}"/></td>
                    </td></tr>
					</axis:ocultar>
					 <axis:ocultar f="axiscoa001" c="SALDOCOP">
                    <tr class="gridEven">
                    <td style="width:5%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"></td>
                    <td style="width:5%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"> <b><axis:alt f="axiscoa001" c="SALDO_COP" lit="9905030"/></b>  </td>
                    <td style="width:10%"><div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${total2A}"/></td>
                    </td></tr>
					</axis:ocultar>
					 <axis:ocultar f="axiscoa001" c="SALDOCLP">
					 <tr class="gridEven">
                    <td style="width:5%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"></td>
                    <td style="width:5%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"> <b><axis:alt f="axiscoa001" c="SALDO_CLP" lit="9908248"/></b>  </td>
                    <td style="width:10%"><div class="dspNumber"><fmt:formatNumber pattern="#,##0.000000" value="${total3A}"/></td>
                    </td></tr>
					</axis:ocultar>
					 <axis:ocultar f="axiscoa001" c="SALDOUF">
						 <tr class="gridEven">
                    <td style="width:5%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"></td>
                    <td style="width:5%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"> <b><axis:alt f="axiscoa001" c="SALDO_UF" lit="9908249"/></b>  </td>
                    <td style="width:10%"><div class="dspNumber"><fmt:formatNumber pattern="#,##0.000000" value="${total4A}"/></td>
                    </td></tr>
					</axis:ocultar>
                    </tbody></table> 
                  
                  <div class="separador">&nbsp;</div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axiscoa001</c:param>
        <c:param name="__botones">cancelar,<axis:visible f="axiscoa001" c="BT_IMPRIMIR"><c:if test="${fn:length(CTACOASEGURO) > 0 && !empty CTACOASEGURO && !empty __formdata.NUMPROCES}">100001,</c:if></axis:visible><axis:visible f="axiscoa001" c = "BT_LIQUIDAR">9001771,</axis:visible>buscar</c:param>
      </c:import>
      <div class="separador">&nbsp;</div>
    </form><c:import url="../include/mensajes.jsp"/><script type="text/javascript">
        Calendar.setup({
            inputField     :    "FCIERRE",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FCIERRE", 
            singleClick    :    true,
            firstDay       :    1
        });

        Calendar.setup({
            inputField     :    "FCIERREDESDE",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FCIERREDESDE", 
            singleClick    :    true,
            firstDay       :    1
        });

        Calendar.setup({
            inputField     :    "FCIERREHASTA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FCIERREHASTA", 
            singleClick    :    true,
            firstDay       :    1
        });
   </script></body>
</html>