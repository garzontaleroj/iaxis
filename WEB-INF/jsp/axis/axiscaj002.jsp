<%/*
*  Fichero: axiscaj002.jsp
*
*  Fecha: 29/08/2013
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title></title>
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
        <script type="text/javascript">
        
           function f_onload() {
                f_cargar_propiedades_pantalla();
                <% if (request.getAttribute("__formdata") != null )
                {  %>
                    var SPERSON = "${__formdata.SPERSON}";
                    if (objUtiles.estaVacio(SPERSON)) {
                        f_abrir_axisper008(); 
                    }else{
                        $("#SPERSON").val(SPERSON);
                    }
             <% }  %>
            }
           
            
            function f_aceptar_modal(pantalla){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axiscaj001.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
            
            function f_aceptar_modal(pantalla, param){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axiscaj001.do?"+param, "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
    
            function f_abrir_modal(cual, noXButton, optionalQueryString) {
              
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                
                if (noXButton) 
                    objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    

                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
            }
            
            function f_cerrar_modal(pantalla){
                objUtiles.cerrarModal(pantalla);
            }      
            
            function f_but_salir(){
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axiscaj002", "cancelar", document.miForm, "_self");            
            }
            
            function f_aceptar_axisper001 (selectedPerson, selectedAgent){
                $("#SPERSON").val(selectedPerson);
				$("#CAGENTE").val(selectedAgent);
                obtenerPersona(selectedPerson, selectedAgent);
				                f_cerrar_modal("axisper008");

                document.miForm.SPERSON.value = selectedPerson;
				document.miForm.CAGENTE.value = selectedAgent;
                
                //objUtiles.ejecutarFormulario("axis_axiscaj002.do?SPERSON="+selectedPerson+"&CAGENTE="+selectedAgent, "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
			
			function f_aceptar_axisper010(selectedPerson,selectedagent){
				f_cerrar_axisper010(null);
				//ADS
				objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=datosgenerales&faceptar=f_aceptar_mtn_axisper001&SPERSON="+selectedPerson+"&CAGENTEselected="+selectedagent, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
            
            function f_cerrar_axisimprimir() {
                f_limpiarForm();                        
                objUtiles.cerrarModal("axisimprimir");              
            }
            
            
            function f_limpiarForm(){
                    objDom.setValorPorId("SPERSON","");
                    objDom.setValorPorId("SPRODUC","");
                   // $('#CMEDMOV option').eq(0).prop('selected',true);
                    objDom.setValorPorId("CMEDMOV","null");
                    objDom.setValorPorId("NCHEQUE","");
                    objDom.setValorPorId("CBANTRANS","null");
                    objDom.setValorPorId("CCC","");
                    objDom.setValorPorId("IMOVIMI","");
                    objDom.setValorPorId("CMONEOP","null");
                    objDom.setValorPorId("NNUMIDE","");
                    objDom.setValorPorId("TNOMBRE","");
                    objDom.setValorPorId("CPRODUCTTEXT","");
                    objDom.setValorPorId("FCAMBIO","");
                    // Bug 0032660/0190245 - 12/11/2014 - JMF
                    objDom.setValorPorId("CAUTORIZA","");
                    objDom.setValorPorId("NULTDIGTAR","");
                    objDom.setValorPorId("NCUOTAS","");
                    objDom.setValorPorId("CCOMERCIO","");
            }
            
            function  f_abrir_axisper008() {
                objUtiles.abrirModal("axisper008", "src", "modal_axisper008.do?operation=form&ORIGEN=AXISCAJ002" );
            } 
			
			function f_cerrar_axisper008(){
				objUtiles.cerrarModal("axisper008");
			}
			
			function  f_abrir_axispro002() {
                objUtiles.abrirModal("axispro002", "src", "modal_axispro002.do?operation=form&ORIGEN=AXISCAJ002" );
            } 
			
			function f_cerrar_axispro002(){
				objUtiles.cerrarModal("axispro002");
			}
            
            function f_aceptar_axispro002(selectedProduc){
                $("#SPRODUC").val(selectedProduc);
                obtenerProducto(selectedProduc);
                f_cerrar_modal("axispro002");
                document.miForm.SPRODUC.value = selectedProduc;
            }
            
            
            function f_abrir_axisctr014(){
                 f_abrir_modal('axisctr014',null,"&CONDICION=INTERMEDIARIOS");
                 f_limpiarForm();
            }  
                     
            
            function f_cerrar_axisctr014(){
                objUtiles.cerrarModal("axisctr014");
            }   
            function f_aceptar_axisctr014(CODI){
                if (!objUtiles.estaVacio(CODI)) {
                    $("#CAGENTE").val(CODI);
                    objUtiles.cerrarModal("axisctr014");
                    objUtiles.ejecutarFormulario("axis_axiscaj001.do?&CAGENTE="+CODI, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            } 
            
            function f_but_nueva_persona() {
                f_abrir_axisper005();
            }
            
            function  f_abrir_axisper005() {
                objUtiles.cerrarModal("axisper001");
                objUtiles.abrirModal("axisper005", "src", "modal_axisper005.do?operation=form&faceptar=f_aceptar_axisper005"+"&ORIGEN=AXISPRF001" );
            }
            
            function f_abrir_axisper010NOU(isNew){
                f_cerrar_axisctr014();
                objDom.setVisibilidadPorId('but_cerrar_modal_axisper010', 'hidden');
                objUtiles.abrirModal("axisper010","src","modal_axisper010.do?operation=form&isNew="+isNew);
            }  
            
            function f_but_9905992(){
              alert("MANDATO");
            }
            
          function  f_cerrar_axisper010(isNew){
            objUtiles.cerrarModal('axisper010');
            //objUtiles.cerrarModal('axisper008');
          }
            
            function f_but_aceptar(){
				if ( objUtiles.estaVacio(objDom.getValorPorId("SPERSON"))){
                    alert("<axis:alt f="axiscaj002" c="AVISO" lit="9906131" />");
                    return false;
                }
                if ( objUtiles.estaVacio(objDom.getValorPorId("SPRODUC"))){
                    alert("<axis:alt f="axiscaj002" c="AVISO" lit="9000817" />");
                    return false;
                }
                
                if (!objValidador.validaEntrada()) {
                    return false;
                }
                
                     $.ajax({ //Comunicación jQuery hacia Strut
                        type: "POST",
                        url: "axis_axiscaj002.do",
                        data: {
                            operation:"ajax_ins_pago_inicial",
                            SPERSON:$("#SPERSON").val(),
							SPRODUC:$("#SPRODUC").val(),
                            CMEDMOV:$("#CMEDMOV").val(),
                            NCHEQUE:$("#NCHEQUE").val(),
                            CBANTRANS:$("#CBANTRANS").val(),
                            CCC:$("#CCC").val(),
                            IMOVIMI:$("#IMOVIMI").val(),
                            CMONEOP:$("#CMONEOP").val(),
                            CTIPCOB:$("#CTIPCOB").val(),
                            FCAMBIO:$("#FCAMBIO").val(),
                            // Bug 0032660/0190245 - 12/11/2014 - JMF
                            CAUTORIZA:$("#CAUTORIZA").val(),                            
                            NULTDIGTAR:$("#NULTDIGTAR").val(),                            
                            NCUOTAS:$("#NCUOTAS").val(),                            
                            CCOMERCIO:$("#CCOMERCIO").val()                           
                        },
                        dataType: "html",
                        success: function(ajaxResponseText){
                            callbackAjaxInsPagoInicial(ajaxResponseText);
                        },
                        error: function(xml,msg){
                            alert("error: "+ xml +"\n\n msg:" +msg );
                        }
                    });
            }
            
            function callbackAjaxInsPagoInicial(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText); 
                var elementos = doc.getElementsByTagName("PSEQCAJA");
              
                if ((elementos!=null) && (elementos.length > 0)){
                    var SEQCAJA = objDom.getValorNodoDelComponente(elementos, 0, 0);
                    objDom.setValorPorId("SEQCAJA",SEQCAJA);
                    
                    if (!objUtiles.estaVacio(objDom.getValorPorId("SEQCAJA"))){
                        objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_proceso&SPROCES=" + SEQCAJA + "&CTIPO=COMP_CAJA", 0, 0);
                        //objUtiles.ejecutarFormulario("axis_axiscaj002.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
                        
                    } else {
                        alert ("Error ");
                    }
										
                }else{
                    var error = doc.getElementsByTagName("TERROR");
                    var dserror = objDom.getValorNodoDelComponente(error, 0, 0).split(":")
                    // Bug 0032660/0190245 - 12/11/2014 - JMF
                    alert(dserror);
                }
            }
            
            function obtenerPersona(selectedPerson, selectedAgent){
                objAjax.invokeAsyncCGI("axis_axiscaj002.do?", callbackAjaxObtenerPersona, "operation=ajax_obtener_persona&SPERSON="+selectedPerson+"&CAGENTE="+selectedAgent,
                                   this, objJsMessages.jslit_cargando);
            }
            
            
            
            function callbackAjaxObtenerPersona(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(objAppMensajes.existenErroresEnAplicacion(doc)){
                    return;
                }
                var NNUMIDE = "";
                var NOMBRE ="";
                var TDIGITOIDE="";                 
                try{
                    NNUMIDE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0);
                }catch(e){}
                try{
                    TDIGITOIDE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TDIGITOIDE"), 0, 0);
                    if (!objUtiles.estaVacio(TDIGITOIDE)){
                        TDIGITOIDE = "-" + TDIGITOIDE;
                    }
                }catch(e){}
                try{
                    NOMBRE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0);
                }catch(e){}
                try{
                    NOMBRE +=" " + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0);
                }catch(e){}
                try{
                    NOMBRE +=" " + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0);
                }catch(e){}
                
                            
                //objDom.setValorPorId ("TTIPIDE", TTIPIDE);
                 if (!objUtiles.estaVacio(NNUMIDE)){
               if( NNUMIDE.indexOf("-")==-1)
                objDom.setValorPorId ("NNUMIDE", objNumero.formateaNumeroPattern(  "#.###,#", NNUMIDE) + TDIGITOIDE);
               else
                objDom.setValorPorId ("NNUMIDE", objNumero.formateaNumeroPattern(  "#.###,#", NNUMIDE));
                } 
                objDom.setValorPorId ("TNOMBRE", NOMBRE);
                //objDom.setValorPorId ("SNIP", SNIP);
                //objAjax.invokeAsyncCGI("axis_axiscob001.do", callbackajaxBuscarPolizas, "operation=ajax_buscar_polizas&SPERSON="+SPERSON, this)
                
            }
            
            
            function obtenerProducto(selectedProduct){
                objAjax.invokeAsyncCGI("axis_axiscaj002.do?", callbackAjaxObtenerProducto, "operation=ajax_obtener_producto&SPRODUC="+selectedProduct,
                                   this, objJsMessages.jslit_cargando);
            }
            
            
            function callbackAjaxObtenerProducto(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(objAppMensajes.existenErroresEnAplicacion(doc)){
                    return;
                }
                var CPRODUCTTEXT = "";
                try{
                    CPRODUCTTEXT = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), 0, 0);
                }catch(e){}
                        
                objDom.setValorPorId ("CPRODUCTTEXT", CPRODUCTTEXT);
                
            }
            
            function f_cambiar(){
               f_cargar_propiedades_pantalla();
            }
            
               function f_stripInvalidChars( str ){
                str =str.toUpperCase() + '';
                var rgx = /^[\060-\071]|[\101-\132]|[\141-\172]|[\055]$/i;
                var out = '';
                for( var i = 0; i < str.length; i++ ){
                    if( rgx.test( str.charAt(i) ) ){
                        out += str.charAt(i);
                    }
                }
                return out;
            }
            
            function f_cleanInvalidChars(idobject){
                var value="";
                value=f_stripInvalidChars(objDom.getValorPorId(idobject));
                objDom.setValorPorId(idobject,value);
            }
            
            function f_OnChange(){
                f_cargar_propiedades_pantalla();
            }
			
			function f_valida_CAUTORIZA(){
				if(!objUtiles.estaVacio($("#CAUTORIZA").val()) && $("#CAUTORIZA").val().length != 7){
					alert("<axis:alt f="axiscaj002" c="AVISO" lit="9907238" />");
					$("#CAUTORIZA").focus();
				}
			}
			
			function f_valida_NULTDIGTAR(){
				if(!objUtiles.estaVacio($("#NULTDIGTAR").val()) && $("#NULTDIGTAR").val().length != 4){
					alert("<axis:alt f="axiscaj002" c="AVISO" lit="180156" />");
					$("#NULTDIGTAR").focus();
				}
			}
			
			function f_valida_NCUOTAS(){
				if(!objUtiles.estaVacio($("#NCUOTAS").val()) && $("#NCUOTAS").val() < 1 || $("#NCUOTAS").val() > 24){
					alert("<axis:alt f="axiscaj002" c="AVISO" lit="9907237" />");
					$("#NCUOTAS").focus();
				}
			}
			
        </script>
    </head>
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>

    <form name="miForm" action="axis_axiscaj002.do" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>
            <input type="hidden" id="SPRODUC" name="SPRODUC" value="${__formdata.SPRODUC}"/>
            <input type="hidden" id="CAGENTE" name="CAGENTE" value="${__formdata.CAGENTE}"/>
            <input type="hidden" id="SEQCAJA" name="SEQCAJA" value="${__formdata.SEQCAJA}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="form" f="axiscaj002" lit="9905062"/></c:param>
                <c:param name="producto"><axis:alt c="form" f="axiscaj002" lit="9905062"/></c:param>
                <c:param name="form">axiscaj002</c:param>
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisper008|<axis:alt f="axiscaj002" c="MODAL_AXISper008" lit="1000065" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisctr014|<axis:alt f="axiscaj002" c="MODAL_AXISctr014" lit="9905629" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisper010|<axis:alt f="axiscaj002" c="MODAL_AXISPER010" lit="110275" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axispro002|<axis:alt f="axiscaj002" c="MODAL_AXISPRO002" lit="1000218" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axiscaj002" c="TITULOIMPRIMIR" lit="1000205" /></c:param>
            <c:param name="nid" value="axisimprimir"></c:param>
        </c:import>
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
					<td>                 
						<table class="seccion" cellpadding="0" cellspacing="0">
							<tr>
								<td align="left" >
									<table class="area" align="center">
										<tr>
											<th style="width:10%;"></th>
											<th style="width:25%;"></th>
											<th style="width:25%;"></th>                                
											<th ></th>   
										</tr>
										<tr>
											<td class="titulocaja">
												<b><axis:alt f="axiscaj002" c="NNUMIDE" lit="9903661"/>&nbsp;<img border="0" src="images/find.gif" onclick="f_abrir_axisper008()" style="cursor:pointer"/></b>
											</td>
											<td class="titulocaja">
												<b><axis:alt f="axiscaj002" c="TNOMBRE" lit="111523"/></b>
											</td>									
											<td class="titulocaja">
												<b><axis:alt f="axiscaj002" c="SPRODUCT" lit="9902909"/>&nbsp;<img border="0" src="images/find.gif" onclick="f_abrir_axispro002()" style="cursor:pointer"/></b>
											</td>
										</tr>
										<tr>
											<td class="campocaja">
												<input type="text" class="campodisabled campo campotexto" value="${__formdata.NNUMIDE}" 
													name="NNUMIDE" id="NNUMIDE" style="width:100%" size="15"   
													<axis:atr f="axiscaj002" c="NNUMIDE" a="obligatorio=true&isInputText=true&modificable=false"/>
                                                    title="<axis:alt f="axiscaj002" c="NNUMIDE" lit="9903661"/>"
												/>
													
											</td>                                
											<td class="campocaja">
												<input type="text" class="campodisabled campo campotexto" value="${__formdata.TNOMBRECOMPL}" 
													name="TNOMBRE" id="TNOMBRE" readonly="true" style="width:100%" size="15" 
													<axis:atr f="axiscaj002" c="TNOMBRE" a="obligatorio=true&isInputText=true"/>
													/>
											</td>                                
											<td class="campocaja">
												<input type="text" class="campodisabled campo campotexto" value="${__formdata.CPRODUCTTEXT}" name="CPRODUCTTEXT" id="CPRODUCTTEXT" 
													readonly="true" style="width:90%" size="15" 
													<axis:atr f="axiscaj002" c="CPRODUCTTEXT" a="obligatorio=true&isInputText=true"/>
													/>
											</td>                                
										</tr>                          
									</table>
								</td>
							</tr>
							<tr>
								<td>                 
									<table class="seccion" cellpadding="0" cellspacing="0">
										<tr>
											<td align="left" >
												<table class="area" align="center">
													<tr>
														<th style="width:25%;height:0px"></th>
														<th style="width:25%;height:0px"></th>
														<th style="width:25%;height:0px"></th>                                
														<th style="width:25%;height:0px"></th>   
													</tr> 


													
													<tr>                                
														<td class="titulocaja"  id="tit_CMEDMOV">
														   <b id="label_CMEDMOV" ><axis:alt f="axiscaj002" c="CMEDMOV" lit="9902938"/></b>
														</td>
														<td class="titulocaja"  id="tit_NCHEQUE">
														   <b id="label_NCHEQUE" ><axis:alt f="axiscaj002" c="NCHEQUE" lit="9905071"/></b>
														</td>
														<td class="titulocaja"  id="tit_CBANTRANS">
														   <b id="label_CBANTRANS"><axis:alt f="axiscaj002" c="CBANTRANS" lit="9000964"/></b>
														</td>	                                               
                                                         <td class="titulocaja"  id="tit_CCC"> 
                                                           <b id="label_CCC"><axis:alt f="axiscaj002" c="CCC" lit="9903154"/></b>
                                                         </td>
													</tr>
													<tr>                                
														<td class="campocaja"  id = "td_CMEDMOV">
															<select name="CMEDMOV" id="CMEDMOV" size="1" class="campowidthselect campo campotexto_ob" style="width:84%;" 
																title="<axis:alt f="axiscaj002" c="CMEDMOV" lit="9902938"/>" onchange="f_cambiar();"
																<axis:atr f="axiscaj002" c="CMEDMOV" a="obligatorio=true&isInputText=false"/>>
																<option value="null">
																	<axis:alt f="axiscaj002" c="SELECCIONAR" lit="108341"/>                                
																</option>
																<c:forEach var="medio_mov" items="${__formdata.FORMAPAGO}">
																	<option value="${medio_mov.CATRIBU}"
																		<c:if test="${__formdata.CMEDMOV == medio_mov.CATRIBU}">selected</c:if>>
																		${medio_mov.TATRIBU}
																	</option>
																</c:forEach>
															</select>
														</td>
														<td class="campocaja" id = "td_NCHEQUE">
															<input type="text" class="campowidthinput campo campotexto" value="${__formdata.NCHEQUE}" name="NCHEQUE" id="NCHEQUE" 
																<axis:atr f="axiscaj002" c="NCHEQUE" a="obligatorio=true&isInputText=false"/> 
																title="<axis:alt f="axiscaj002" c="NCHEQUE" lit="9905071"/>" size="15" />
														</td>
														<td class="campocaja" id = "td_CBANTRANS">
															<select name="CBANTRANS" id="CBANTRANS" size="1" class="campowidthselect campo campotexto" style="width:84%;;" 
																title="<axis:alt f="axiscaj002" c="CBANTRANS" lit="9000964"/>"
																<axis:atr f="axiscaj002" c="CBANTRANS" a="obligatorio=true&isInputText=false"/>>
																<option value="null">
																	<axis:alt f="axiscaj002" c="SELECCIONAR" lit="108341"/>                                
																</option>
																<c:forEach var="bancos" items="${__formdata.BANCOS}">
																	<option value="${bancos.CBANCO}"
																	<c:if test="${__formdata.CBANTRANS == bancos.CBANCO}">selected</c:if>>
																	${bancos.TBANCO}
																	</option>
																</c:forEach>
															</select>
														</td>
                                                             <td class="campocaja" id = "td_CCC">
                                                               <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CCC}" name="CCC" id="CCC" 
                                                                    <axis:atr f="axiscaj001" c="CCC" a="obligatorio=true"/> 
                                                                  onchange="f_cleanInvalidChars(this.id)"  onkeyup="f_cleanInvalidChars(this.id)"
                                                        title="<axis:alt f="axiscaj001" c="CCC" lit="9903154"/>"  size="15" />
                                                             </td>
													</tr>
                                                   
                                                    <!-- *************************** ini Bug 0032660/0190245 - 12/11/2014 - JMF ********************************* -->
													<tr>                                
														<td class="titulocaja"  id="tit_CAUTORIZA">
														   <b id="label_CAUTORIZA" ><axis:alt f="axiscaj002" c="CAUTORIZA" lit="9907244"/></b>
														</td>
														<td class="titulocaja"  id="tit_NULTDIGTAR">
														   <b id="label_NULTDIGTAR" ><axis:alt f="axiscaj002" c="NULTDIGTAR" lit="9907241"/></b>
														</td>
														<td class="titulocaja"  id="tit_NCUOTAS">
														   <b id="label_NCUOTAS" ><axis:alt f="axiscaj002" c="NCUOTAS" lit="9907242"/></b>
														</td>
														<td class="titulocaja"  id="tit_CCOMERCIO">
														   <b id="label_CCOMERCIO" ><axis:alt f="axiscaj002" c="CCOMERCIO" lit="9907243"/></b>
														</td>
													</tr>
													<tr>                                
														<td class="campocaja">
															<input type="text" class="campowidthinput campo campotexto" value="${__formdata.CAUTORIZA}" name="CAUTORIZA" id="CAUTORIZA" onblur="f_valida_CAUTORIZA()"
																<axis:atr f="axiscaj002" c="CAUTORIZA" a="obligatorio=true&formato=decimal"/> 
																title="<axis:alt f="axiscaj002" c="CAUTORIZA" lit="9907244"/>" size="15" />
														</td>
														<td class="campocaja">
															<input type="text" class="campowidthinput campo campotexto" value="${__formdata.NULTDIGTAR}" name="NULTDIGTAR" id="NULTDIGTAR"  onblur="f_valida_NULTDIGTAR()"
																<axis:atr f="axiscaj002" c="NULTDIGTAR" a="obligatorio=true&formato=decimal"/> 
																title="<axis:alt f="axiscaj002" c="NULTDIGTAR" lit="9907241"/>" size="15" />
														</td>
														<td class="campocaja">
															<input type="text" class="campowidthinput campo campotexto" value="${__formdata.NCUOTAS}" name="NCUOTAS" id="NCUOTAS" onblur="f_valida_NCUOTAS()"
																<axis:atr f="axiscaj002" c="NCUOTAS" a="obligatorio=true&formato=decimal"/> 
																title="<axis:alt f="axiscaj002" c="NCUOTAS" lit="9907242"/>" size="15" />
														</td>
														<td class="campocaja">
															<input type="text" class="campowidthinput campo campotexto" value="${__formdata.CCOMERCIO}" name="CCOMERCIO" id="CCOMERCIO" 
																<axis:atr f="axiscaj002" c="CCOMERCIO" a="obligatorio=true&formato=decimal"/> 
																title="<axis:alt f="axiscaj002" c="CCOMERCIO" lit="9907243"/>" size="15" />
														</td>
													</tr>
                                                    <!-- *************************** fin Bug 0032660/0190245 - 12/11/2014 - JMF ********************************* -->

													<tr>                                
														<td class="titulocaja">
														   <b><axis:alt f="axiscaj002" c="IMOVIMI" lit="108645"/></b>
														</td>
														<td class="titulocaja">
															<b><axis:alt f="axiscaj002" c="CMONEOP" lit="9000475"/></b>
														</td>
                                                        <axis:ocultar c="FCAMBIO" f="axiscaj002" dejarHueco="false">
                                                        <td class="titulocaja">
															<b><axis:alt f="axiscaj002" c="FCAMBIO" lit="9906996"/></b>
														</td>
                                                        </axis:ocultar>
													</tr>
													<tr>                                
														<td class="campocaja">
															<select name="CMONEOP" id="CMONEOP" size="1" class="campowidthselect campo campotexto_ob" style="width:84%;" 
																title="<axis:alt f="axiscaj002" c="CMONEOP" lit="108645"/>"
																<axis:atr f="axiscaj002" c="CMONEOP" a="obligatorio=true&isInputText=false"/> ">
																<option value="null">
																	<axis:alt f="axiscaj002" c="SELECCIONAR" lit="108341"/>                                
																</option>
																<c:forEach var="lstmoneda" items="${__formdata.MONEDAS}">
																	<option value="${lstmoneda.CMONEDA}"
																	<c:if test="${__formdata.CMONEOP == lstmoneda.CMONEDA}">selected</c:if>>
																	${lstmoneda.TMONEDA}
																	</option>
																</c:forEach>
															</select>
														</td>
														<td class="campocaja">
															<input type="text" class="campowidthinput campo campotexto" name="IMOVIMI" id="IMOVIMI" 
																title="<axis:alt f="axiscaj002" c="IMOVIMI" lit="9000475"/>"
																<axis:atr f="axiscaj002" c="IMOVIMI" a="obligatorio=true"/> 
																formato="decimalNegativo" size="15" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IMOVIMI}"/>"/>
														</td>
                                                        <axis:ocultar c="FCAMBIO" f="axiscaj002" dejarHueco="false">
                                                        <td class="campocaja">
															<input type="text" class="campowidthinput campo campotexto" size="15" style="width:75%;"                                
                                                            value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCAMBIO}"/>"                                 
                                                            name="FCAMBIO" id="FCAMBIO" alt="<axis:alt f="axiscaj002" c="FCAMBIO" lit="9906996"/> "
                                                            title="<axis:alt f="axiscaj002" c="FCAMBIO" lit="9906996"/>" obligatorio="true" formato="fecha"/>
                                                            <a style="vertical-align:middle;"><img
                                                            id="icon_FCAMBIO" alt="<axis:alt f="axiscaj002" c="FCAMBIO" lit="9906996"/>  title="<axis:alt f="axiscaj002" c="FCAMBIO" lit="9906996"/>" src="images/calendar.gif"/></a>
														</td>
                                                        </axis:ocultar>
													</tr>												
													
												</table>
											</td>
										</tr>
									</table>                
								</td>
							</tr>
						</table>
					</tr>
				</td>
			</table>
    </form>    
    <c:import url="../include/botonera_nt.jsp">
       <c:param name="f">axiscaj002</c:param>
       <c:param name="__botones"><axis:ocultar f="axiscaj002" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar><axis:ocultar f="axiscaj002" c="BT_ACEPTAR">,aceptar</axis:ocultar></c:param>
    </c:import>
      
    <c:import url="../include/mensajes.jsp" />
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FCAMBIO",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FCAMBIO", 
            singleClick    :    true,
            firstDay       :    1
        });

   </script>
</body>
</html>


