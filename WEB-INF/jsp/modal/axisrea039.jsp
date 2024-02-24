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
    <title><axis:alt f="axisrea039" c="TITULO" lit="9001162"/></title> <%-- Tratamiento de recibos --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
  <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
  <script type="text/javascript" src="scripts/calendar.js"></script>
  <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
  <script type="text/javascript" src="scripts/calendar-setup.js"></script>
<!--*********************************** -->

    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() { 
            //reformatearImportes();
            // INI - AXIS 4624 - 11/07/2019 - AABG - SE QUITA FORMATO A VALOR PARA EVITAR ERROR DE DECIMALES POSTERIORMENTE
        	var dataMonto = objDom.getValorPorId('IIMPORT');
	              if(dataMonto!=null && dataMonto!=""){
	                     while(dataMonto.includes('.')){
	                           dataMonto=dataMonto.replace('.','');
	                     }
	                     objDom.setValorPorId('IIMPORT',dataMonto);
	              } 
			// FIN - AXIS 4624 - 11/07/2019 - AABG - SE QUITA FORMATO A VALOR PARA EVITAR ERROR DE DECIMALES POSTERIORMENTE 	

            ok = "${__formdata.OK}";
             if (!objUtiles.estaVacio(ok) && ok=='OK' ){
                parent.f_aceptar_axisrea039();
             }
            f_cargar_propiedades_pantalla();
          }
          
          function f_recargar(){
                 reformatearImportes();
                 objUtiles.ejecutarFormulario ("modal_axisrea039.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);    
          }

          function f_validaImport(){
              if (!objUtiles.estaVacio(document.miForm.IIMPORT.value) ){
                    //ecg problemas con importes decimales con signos. El valida numero no se tragaba signos de "-".
                    //solucion: todas las validaciones numericas se hacen con un valor copiado, sin un posible signo, y al final se reune todo
                    var IIMPORToriginal=document.miForm.IIMPORT.value
                    var IIMPORTsigno="";
                    if (IIMPORToriginal.indexOf("-")==0) {
                        IIMPORTsigno="-";
                    }
                    if (IIMPORToriginal.indexOf("+")==0) {
                        IIMPORTsigno="+";
                    }
                    var IIMPORTsinsigno=(IIMPORTsigno.length>0)?IIMPORToriginal.substring(1):IIMPORToriginal;
    
                        
                    if (!objValidador.esCampoNumerico(IIMPORTsinsigno, true,  <%= Integer.MIN_VALUE %>, "<axis:alt f="axisrea039" c="VAL_IMPORT" lit="100563"/>") ){
                              document.miForm.IIMPORT.focus();
                              return 1;
                    }else{  
                              //document.miForm.IIMPORT.value = objValidador.valorFormateadoCampoNumerico(objDom.getValorComponente(document.miForm.IIMPORT) , true, true);
                              document.miForm.IIMPORT.value = objNumero.formateaNumeroMoneda(IIMPORTsinsigno ,null);
                              if (IIMPORTsigno=="-") {
                                document.miForm.IIMPORT.value="-"+document.miForm.IIMPORT.value;
                              }
                          }    
                }
                return 0;
            }

            function f_but_cancelar() {
                reformatearImportes();
                objAjax.invokeAsyncCGI("modal_axisrea039.do", callbackSalir, "operation=salir", this);
            }
        
            function callbackSalir() {
               parent.f_cerrar_axisrea039();
            }
        
            function f_but_aceptar(){
                if (objValidador.validaEntrada()) {
                    reformatearImportes();
                    objUtiles.ejecutarFormulario ("modal_axisrea039.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);    
                }
            }
            function f_but_guardar(){
                 if (objValidador.validaEntrada()) {
                   var error =  f_validaImport();
                      if (error == 0){
                     objUtiles.ejecutarFormulario ("modal_axisrea039.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);    
                     }
                }
            }
        
            function f_abrir_sinistres(){
                objUtiles.abrirModal("axissin002","src","modal_axissin002.do?operation=form");
            }
            
        
            function f_aceptar_axissin002(NSINIES,SSEGURO){
                objUtiles.cerrarModal("axissin002");
                document.miForm.NSINIES.value = NSINIES;
            }
            
            
            function f_cerrar_axissin002(){
                objUtiles.cerrarModal("axissin002");
            }
        
            function f_cerrar_axisctr019(){
                objUtiles.cerrarModal("axisctr019");
            }
            
            function f_aceptar_axisctr019(SSEGURO){
                objUtiles.cerrarModal("axisctr019");
                document.miForm.SSEGURO.value = SSEGURO;
                f_recargar();
            }
            
            function f_abrir_axisctr019(){
                objUtiles.abrirModal("axisctr019","src","modal_axisctr019.do?operation=form");
            }
            
            function f_actSSEGURO(){
               document.miForm.SSEGURO.value = '';
            }
            
            function f_llenarsidepag()
            {
            	// INI - AXIS 4624 - 11/07/2019 - AABG - SE QUITA OBLIGATORIEDAD DE SIDEPAG PARA QUE CONSULTE LOS IDENTIFICADORES DE PAGO
                if(!objUtiles.estaVacio($("#NSINIES").val()) && 
                    objUtiles.esNumero($("#NSINIES").val()))
                {
                	
                    objAjax.invokeAsyncCGI("modal_axisrea039.do", callbackAjaxSidepag, "operation=ajax_sidepag&NSINIES="+$("#NSINIES").val(), this, objJsMessages.jslit_cargando);
                }
                // FIN - AXIS 4624 - 11/07/2019 - AABG - SE QUITA OBLIGATORIEDAD DE SIDEPAG PARA QUE CONSULTE LOS IDENTIFICADORES DE PAGO
            }
            
            function callbackAjaxSidepag(ajaxResponseText){
                var sidepagCombo =  document.miForm.SIDEPAG;
                objDom.borrarOpcionesDeCombo(sidepagCombo);
                objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", sidepagCombo, null);
                try {
                    var doc=objAjax.domParse(ajaxResponseText);

                    if(!objAppMensajes.existenErroresEnAplicacion(doc))
                    {
                        if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0]))
                        {
                            objDom.borrarOpcionesDeCombo(sidepagCombo);
                            objDom.addOpcionACombo("-2147483648", " - " + objJsMessages.jslit_seleccionar + " - ", sidepagCombo, 0);

                            for(var i = 0;i < doc.getElementsByTagName("element").length;i++)
                            {
                                var SIDEPAG = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("SIDEPAG")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("SIDEPAG")[0].childNodes[0].nodeValue : "");
                              
                                objDom.addOpcionACombo(SIDEPAG, SIDEPAG, sidepagCombo, i+1);
                            }
                        }
                    }else{
                            objDom.borrarOpcionesDeCombo (sidepagCombo);
                            objDom.addOpcionACombo("-2147483648", " - " + objJsMessages.jslit_seleccionar + " - ", sidepagCombo, null);
                    }
                } catch (e) {
                    objDom.addOpcionACombo("-2147483648", " - " + objJsMessages.jslit_seleccionar + " - ", sidepagCombo, null);
                    alert(objJsMessages.jslit_sin_motivos);
                }
            }
        
                  /**
        * Método que valida y formatea un campo numérico con el patrón ##.##,##. Si no se valida correctamente, devuelve un ''.
        * @param {Object} valor a validar
        * @param {Boolean} isDecimal: true->es decimal, false->no es decimal
        * @param {Boolean} tienePuntoMiles: true->formatea puntos a los miles, false->no lo hace
        * @return {String} Valor obtenido de la validación y formateo
        */
        function valorFormateadoCampoNumerico (entrada, isDecimal, tienePuntoMiles){
            if (objNumero.validaNumero(entrada, isDecimal)){
                // Validación correcta, formatear valor 
                entrada = objNumero.formateaNumero(entrada, isDecimal);  
                if(!tienePuntoMiles) entrada = objNumero.quitarSeparadorMiles(entrada);
                
            }else{
                return '';
            }
            
            return entrada;
        }
        
        function reformatearImportes(){
             objDom.setValorPorId("IIMPORT",objNumero.formateaNumeroMoneda(objDom.getValorPorId("IIMPORT"),null));
        }      
    </script>    
</head>

<body  onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         

        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="PMODO"   value="${__formdata.PMODO}"/>
        <input type="hidden" name="CEMPRES" id="CEMPRES"  value="${__formdata.CEMPRES}"/>
        <input type="hidden" name="CTIPMOV" id="CTIPMOV"  value="${__formdata.CTIPMOV}"/>
        <input type="hidden" name="NVERSIO" id="NVERSIO"  value="${__formdata.NVERSIO}"/>
        <input type="hidden" name="SPRODUC" id="SPRODUC"  value="${__formdata.SPRODUC}"/>
        <input type="hidden" name="SCONTRA" id="SCONTRA"  value="${__formdata.SCONTRA}"/>
        <input type="hidden" name="CTRAMO" id="CTRAMO"  value="${__formdata.CTRAMO}"/>
        <input type="hidden" name="FCIERRE" id="FCIERRE"  value="${__formdata.FCIERRE}"/>
        <input type="hidden" name="CMODO" id="CMODO"  value="${__formdata.CMODO}"/> <!-- 0:MOD - 1:ALTA - 2:CONSULTA -->
        <input type="hidden" name="NNUMLIN" id="NNUMLIN"  value="${__formdata.NNUMLIN}"/><!-- Si se trata de una edición -->
        <input type="hidden" name="BROKER" id="BROKER"  value="${__formdata.BROKER}"/>     
        <input type="hidden" name="COMPANIA" id="COMPANIA" value="${__formdata.COMPANIA}" />

        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisrea039" c="TIT_REA039" lit="9001947"/></c:param>     <%-- Detall compta tècnica --%>
                <c:param name="form">axisrea039</c:param>
        </c:import>        
           
           
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                  <table class="seccion">
                      <tr>
                        <td>
                        	<!-- ${__formdata} -->
                          <table class="area" align="center">
                             <tr>
                                <th style="width:33%;height:0px"></th>
                                <th style="width:33%;height:0px"></th>
                                <th style="width:33%;height:0px"></th>
                            
                            </tr>
                            <tr>
                                <td class = "campocaja" colspan="5" >
                                    <div class="separador">&nbsp;</div>     
                                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisrea039" c="TIT_REA" lit="9001947"/>
                                </td>
                            </tr>
                            <tr>
                            
                             <axis:ocultar c="CCOMPANI" f="axisrea039" dejarHueco="false">
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisrea039" c="CCOMPANI" lit="9903030" /></b> <!-- Reaseguradora -->
                                </td>
                            </axis:ocultar>
                             <axis:ocultar c="BROKER" f="axisrea039" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisrea039" c="BROKER" lit="9000752" /></b> <!-- Broker -->
                                </td>
                            </axis:ocultar>
                            </tr>
                            <tr>
                               <axis:ocultar c="CCOMPANI" f="axisrea039" dejarHueco="false">
                                 <td class = "campocaja" colspan="2">
                                        <input type="text" class="campo campotexto" style="width:12%;" size="9" value="${__formdata.CCOMPANI}" name="CCOMPANI" id="CCOMPANI"
                                         <axis:atr f="axisrea039" c="CCOMPANI" a="modificable=false"/> title="<axis:alt f="axisrea039" c="CCOMPANI" lit="9902937" />"/>
                                        <input type="text" class="campo campotexto" style="width:70%;" size="15" value="${__formdata.TCOMPANI}" name="TCOMPANI" id="TCOMPANI"
                                         <axis:atr f="axisrea039" c="TCOMPANI" a="modificable=false"/> title="<axis:alt f="axisrea039" c="TCOMPANI" lit="9903030" />"/>
                                 </td>
                                 </axis:ocultar>
                                 <axis:ocultar c="TCCORRED" f="axisrea039" dejarHueco="false">
                                 <td class = "campocaja" >
                                        <input type="text" class="campo campotexto" style="width:80%;" size="15" value="${__formdata.TCCORRED}" name="TCCORRED" id="TCCORRED"
                                         <axis:atr f="axisrea039" c="TCCORRED" a="modificable=false"/> title="<axis:alt f="axisrea039" c="TCCORRED" lit="9000752" />"/>
                                 </td>
                                 </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar c="TTRAMO" f="axisrea039" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisrea039" c="TTRAMO" lit="9000609" /></b> <!-- Tramo -->
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar c="SPRODUC" f="axisrea039" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisrea039" c="SPRODUC" lit="100829" /></b> <!-- Producto -->
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar c="CESTADO" f="axisrea039" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisrea039" c="CESTADO" lit="100587" /></b> <!-- Estado -->
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar c="TTRAMO" f="axisrea039" dejarHueco="false">
                                 <td class = "campocaja" >
                                        <input type="text" class="campo campotexto" style="width:80%;" size="15" value="${__formdata.TTRAMO}" name="TTRAMO" id="TTRAMO"
                                         <axis:atr f="axisrea039" c="TTRAMO" a="modificable=false"/> title="<axis:alt f="axisrea039" c="TTRAMO" lit="9000609" />"/>
                                 </td>
                                 </axis:ocultar>
                                 <axis:ocultar c="TPRODUC" f="axisrea039" dejarHueco="false">
                                 <td class = "campocaja" >
                                        <input type="text" class="campo campotexto" style="width:80%;" size="15" value="${__formdata.TPRODUC}" name="TPRODUC" id="TPRODUC"
                                         <axis:atr f="axisrea039" c="TPRODUC" a="modificable=false"/> title="<axis:alt f="axisrea039" c="SPRODUC" lit="100829" />"/>
                                 </td>
                                 </axis:ocultar>
                                 <axis:ocultar c="CESTADO" f="axisrea039" dejarHueco="false">
                                 <td class = "campocaja" >  
                                        <select name = "CESTADO" id ="CESTADO" size="1" class="campowidthselect campo"  title="<axis:alt f="axisrea039" c="CESTADO" lit="100587" />"
                                        <axis:atr f="axisrea039" c="CESTADO" a="isInputText=false&obligatorio=true"/> >
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea039" c="SNV_COMBO" lit="100587" /> - </option>
                                        <c:forEach items="${__formdata.listvalores.lstestados}" var="item">
                                            <option value = "${item.CATRIBU}" <c:if test="${__formdata['CESTADO']==item.CATRIBU}">selected</c:if> >${item.TATRIBU}</option>
                                        </c:forEach>
                                    </select>
                                 </td>
                                 </axis:ocultar>
                            </tr>
                            
                            <tr>
                                 <axis:ocultar c="TMONEDA" f="axisrea039" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisrea039" c="TMONEDA" lit="108645" /></b> <!-- Moneda -->
                                    </td>
                                </axis:ocultar>
                                 <axis:ocultar c="TCONTRA" f="axisrea039" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisrea039" c="TCONTRA" lit="9001894" />/<axis:alt f="axisrea039" c="TCONTRA_2" lit="9001146" /></b> <!-- Contrato/Version -->
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                               
                                 <axis:ocultar c="TMONEDA" f="axisrea039" dejarHueco="false">
                                 <td class = "campocaja" >
                                        <input type="text" class="campo campotexto" style="width:80%;" size="15" value="${__formdata.TMONEDA}" name="TMONEDA" id="TMONEDA"
                                         <axis:atr f="axisrea039" c="TMONEDA" a="modificable=false"/> title="<axis:alt f="axisrea039" c="TMONEDA" lit="108645" />"/>
                                 </td>
                                 </axis:ocultar>
                                 <axis:ocultar c="TCONTRA" f="axisrea039" dejarHueco="false">
                                 <td class = "campocaja" >
                                        <input type="text" class="campo campotexto" style="width:80%;" size="15" value="${__formdata.TCONTRA}/${__formdata.NVERSIO}" name="TCONTRA" id="TCONTRA"
                                         <axis:atr f="axisrea039" c="TCONTRA" a="modificable=false"/> title="<axis:alt f="axisrea039" c="TCONTRA" lit="9001894" />/<axis:alt f="axisrea039" c="TCONTRA_2" lit="9001146" />"/>
                                 </td>
                                 </axis:ocultar>
                            </tr>
                            
                            
                            <tr>
                              
                                <axis:ocultar c="FMOVIMI" f="axisrea039" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisrea039" c="FMOVIMI" lit="1000590" /></b>
                                </td>
                                </axis:ocultar>
                                 <axis:ocultar c="TDESCRIP" f="axisrea039" dejarHueco="false">
                                  <td class="titulocaja">
                                    <b><axis:alt f="axisrea039" c="TDESCRIP" lit="100588" /></b>
                                  </td>
                                 </axis:ocultar>
                                 <axis:ocultar c="NDOCUME" f="axisrea039" dejarHueco="false">
                                  <td class="titulocaja">
                                    <b><axis:alt f="axisrea039" c="NDOCUME" lit="9903661" /></b>
                                  </td>
                                 </axis:ocultar>
                            </tr>
                            <tr>
                              
                                 <axis:visible c="FMOVIMI" f="axisrea039">
                                 <td class = "campocaja" >
                                        <input type="text" style="width:50%;" class="campo campotexto" size="15" 
                                         value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FMOVIMI}"/>" name="FMOVIMI" id="FMOVIMI"
                                         <axis:atr f="axisrea039" c="FMOVIMI" a="modificable=false&formato=fecha"/> title="<axis:alt f="axisrea039" c="FMOVIMI" lit="1000590" />"/>                                                            
                                 </td>
                                 </axis:visible>
                                
                                 
                                 <axis:ocultar c="TDESCRIP" f="axisrea039" dejarHueco="false">
                                 <td class = "campocaja" >
                                        <input type="text" class="campo campotexto" size="15" value="${fn:escapeXml(__formdata.TDESCRIP)}" name="TDESCRIP" id="TDESCRIP"
                                         <axis:atr f="axisrea039" c="TDESCRIP" a="modificable=true"/> title="<axis:alt f="axisrea039" c="TDESCRIP" lit="100588" />"/>
                                 </td>                            
                                 </axis:ocultar>
                                 <axis:ocultar c="NDOCUME" f="axisrea039" dejarHueco="false">
                                 <td class = "campocaja" >
                                 	<c:set var="miNDOCUME" value="${__formdata.NDOCUME}" />
                                 	<c:if test="${empty miNDOCUME}">
	                                 	<c:if test="${!empty __formdata.TDOCUME}">
	                                 		<c:set var="miNDOCUME" value="${fn:escapeXml(__formdata.TDOCUME)}" />
	                                 	</c:if>
                                 	</c:if>
                                        <input type="text" class="campo campotexto" size="15" value="${miNDOCUME}" name="NDOCUME" id="NDOCUME"
                                         <axis:atr f="axisrea039" c="NDOCUME" a="modificable=true"/> title="<axis:alt f="axisrea039" c="NDOCUME" lit="9903661" />"/>
                                 </td>
                                 </axis:ocultar>
                                 
                              
                                 </tr>   
                            
                           
                            
                            <tr>
                            <axis:ocultar c="CCONCEPTO" f="axisrea039" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisrea039" c="CCONCEPTO" lit="9000715" /></b>
                                </td>
                            </axis:ocultar>
                              <axis:ocultar c="CDEBHAB" f="axisrea039" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisrea039" c="CDEBHAB" lit="9001948" /></b>
                                </td>
                                </axis:ocultar>
                               
                                <axis:ocultar c="IMPORTE" f="axisrea039" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisrea039" c="IMPORTE" lit="100563" /></b>
                                </td>
                                </axis:ocultar>
                              
                            </tr>
                            <tr>
                            <axis:ocultar c="CCONCEPTO" f="axisrea039" dejarHueco="false">
                             <td class="campocaja">
                                    <select name = "CCONCEPTO" id ="CCONCEPTO" size="1" class="campowidthselect campo" onchange="f_recargar()" 
                                    <axis:atr f="axisrea039" c="CCONCEPTO" a="isInputText=false&obligatorio=true"/> title="<axis:alt f="axisrea039" c="CCONCEPTO" lit="9000715" />">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea039" c="SNV_COMBO" lit="108341" /> - </option>
                                        <c:forEach items="${__formdata.listvalores.lstconcep}" var="item">
                                           <%-- <option value = "${item.CCONCTA}" <c:if test="${__formdata['CCONCEPTO']==item.CCONCTA}">selected</c:if> >${item.TCCONCTA}</option> --%>
                                           <option value = "${item.CATRIBU}" <c:if test="${__formdata['CCONCEPTO']==item.CATRIBU}">selected</c:if> >${item.TATRIBU}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                            
                                <axis:ocultar c="CDEBHAB" f="axisrea039" dejarHueco="false">
                                <td class="campocaja">
                                    <select name = "CDEBHAB" id ="CDEBHAB" size="1" class="campowidthselect campo" 
                                    <axis:atr f="axisrea039" c="CDEBHAB" a="isInputText=false&obligatorio=true"/> title="<axis:alt f="axisrea039" c="CDEBHAB" lit="9001948" />">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea039" c="SNV_COMBO" lit="108341" /> - </option>
                                        <c:forEach items="${__formdata.listvalores.lsttipocta}" var="item">
                                            <option value = "${item.CATRIBU}" <c:if test="${__formdata['CDEBHAB']==item.CATRIBU}">selected</c:if> >${item.TATRIBU}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                               
                                 <axis:ocultar c="IIMPORT" f="axisrea039" dejarHueco="false">
                                 <td class = "campocaja" >
                                
                                        <input type="text" style="width:50%;" class="campo campotexto" size="15" value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IIMPORT}'/>" name="IIMPORT" id="IIMPORT"
                                         title="<axis:alt f="axisrea039" c="IMPORTE" lit="100563" />" <axis:atr f="axisrea039" c="IIMPORT" a="modificable=true&obligatorio=true"/> />
                                 </td>
                                 </axis:ocultar>
                                 
                                 
                            </tr>
                            
                            <tr>
                            <axis:ocultar c="NSINIES" f="axisrea039" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisrea039" c="NSINIES" lit="800279" /></b>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar c="SIDEPAG" f="axisrea039" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisrea039" c="SIDEPAG" lit="9906015" /></b>
                                </td>
                            </axis:ocultar>
                              <axis:ocultar c="NPOLIZA" f="axisrea039" dejarHueco="false">
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisrea039" c="NPOLIZA" lit="800242" /></b>
                                </td>
                                </axis:ocultar>
                                                              
                              
                            </tr>
                            <tr>
                            <axis:ocultar c="NSINIES" f="axisrea039" dejarHueco="false">
                                <td class = "campocaja" >
                                    <input type="text" class="campo campotexto" size="15" value="${__formdata.NSINIES}" name="NSINIES" id="NSINIES"
                                        onchange="f_llenarsidepag();"
                                         <axis:atr f="axisrea039" c="NSINIES" a="modificable=true&obligatorio=false&formato=entero"/> title="<axis:alt f="axisrea039" c="NSINIES" lit="800279" />"/>
                                </td>                            
                            </axis:ocultar>
                            
                            <axis:ocultar c="SIDEPAG" f="axisrea039" dejarHueco="false">
                                <td class="titulocaja"> 
                                    <select name="SIDEPAG" id="SIDEPAG" size="1" class="campowidthselect campo"
                                        <axis:atr f="axisrea039" c="SIDEPAG" a="isInputText=false&modificable=true&obligatorio=false"/> title="<axis:alt f="axisrea039" c="SIDEPAG" lit="9906015" />">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea039" c="SNV_COMBO" lit="108341" /> - </option>
                                        <c:forEach items="${__formdata.listvalores.lstsidepag}" var="item">
                                            <option value = "${item.SIDEPAG}" <c:if test="${__formdata['SIDEPAG']==item.SIDEPAG}">selected</c:if> >${item.SIDEPAG}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>
                            
                                <axis:ocultar c="NPOLIZA" f="axisrea039" dejarHueco="false">
                                           <td class="titulocaja"> 
                                                <input type="text" class="campo campotexto" name="NPOLIZA" id="NPOLIZA" value="${__formdata.NPOLIZA}" style="width:50%;"
                                                <axis:atr f="axisrea039" c="NPOLIZA" a="modificable=true&obligatorio=false&formato=entero"/> title="<axis:alt f="axisrea039" c="NPOLIZA" lit="800242" />"/>
                                                                                      
                                                <input type="text" class="campo campotexto" name="NCERTIF" id="NCERTIF" value="${__formdata.NCERTIF}" style="width:12%"
                                                <axis:atr f="axisrea039" c="NCERTIF" a="modificable=true&obligatorio=false"/> title="<axis:alt f="axisrea039" c="NCERTIF" lit="101168" />"/>
                                            </td>
                                        </axis:ocultar>
                                 
                                 
                            </tr>
                            
                    </table>
                </td>
            </tr>
        </table>
        </tr>
    </td>
    </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea039</c:param><c:param name="f">axisrea039</c:param>
		<c:param name="__botones">cancelar<axis:visible c="BT_GUARDAR" f="axisrea039">,guardar</axis:visible></c:param> 
        </c:import>
    </form>

    <c:import url="../include/mensajes.jsp"/>

</body>
</html>