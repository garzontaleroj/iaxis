<%/*
*  Fichero: axiscaj019.jsp
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
           }
            
           function f_aceptar_modal(pantalla){
            f_cerrar_modal(pantalla);
            objUtiles.ejecutarFormulario("axis_axiscaj019.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
           }
            
            function f_aceptar_modal(pantalla, param){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axiscaj019.do?"+param, "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
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
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axiscaj019", "cancelar", document.miForm, "_self");            
            }
            
            function f_cerrar_axisimprimir() {
                f_limpiarForm();                        
                objUtiles.cerrarModal("axisimprimir");              
            }
            
            function f_but_aceptar(){
                if (!objValidador.validaEntrada()) {
                    return false;
                }
				
				if (parseFloat($("#IMOVIMI").val())<=0){
					alert("<axis:alt f="axiscaj015" c="RECIBO" lit="9907254"/>");
					return false;
				}
				
                if ($("#CMEDMOV").val()==0){//efectivo
                    var qs="operation=ajax_valida_vingresado";
                    qs=qs+"&NREFDEPOSITO="+$("#NREFDEPOSITO").val();
                    qs=qs+"&CMONEOP="+$("#CMONEOP").val();
                    qs=qs+"&CMEDMOV="+$("#CMEDMOV").val();
                    qs=qs+"&IMOVIMI="+$("#IMOVIMI").val();
                    objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", objJsMessages.jslit_cargando, "inline");
                    objAjax.invokeAsyncCGI("axis_axiscaj019.do", callbackAjaxValidaVIngresado, qs, this);
                }else if ($("#CMEDMOV").val()==1){
				    if (!($('input[name="lst_cheques"]:checked').length>0)){
						alert("<axis:alt f="axiscaj015" c="RECIBO" lit="9907252"/>");
						return false;
					}
                    $("#CHEQUES").val(f_monta_cheques());
					var itotal = objNumero.quitarSeparadorMiles($("#ICHEQUES").val());
                    var imetid = objNumero.quitarSeparadorMiles($("#IMOVIMI").val());
                    
					if (itotal!=imetid){
						alert("<axis:alt f="axiscaj015" c="RECIBO" lit="9907251"/>");
						return false;
					}else{
						objUtiles.ejecutarFormulario("axis_axiscaj019.do?", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
					}
                }
            }
            
            function callbackAjaxValidaVIngresado(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
                try{
                    if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                        var PCONFIRM = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("PCONFIRM")[0]))? 
                        objDom.getValorNodoDelComponente(doc.getElementsByTagName("PCONFIRM"), 0, 0) : "");                    
                        if (!objUtiles.estaVacio(PCONFIRM)){
                            if (confirm(PCONFIRM)){
                                /* Se puede continuar. */
                                objUtiles.ejecutarFormulario("axis_axiscaj019.do", "aceptar", document.miForm, "_self",objJsMessages.jslit_cargando);
                            }
                        }else{
                            /* Se puede continuar. */
                            objUtiles.ejecutarFormulario("axis_axiscaj019.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
                        }
                    }
                }
                catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
                f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
            }
			
			function f_onclickCheckCheque(input){
			    var actual = 0;
			    
				if (!objUtiles.estaVacio($("#ICHEQUES").val()))
					actual = parseFloat($("#ICHEQUES").val());
					
				var cambio = parseFloat(objNumero.quitarSeparadorMiles(input.value.split("-")[2]));
                if (input.checked){
					actual += cambio;
                }else {
				    actual -= cambio;
                }
				
				$("#ICHEQUES").val(actual);
            }
			
			function replaceAll( text, busca, reemplaza ){
				while (text.toString().indexOf(busca) != -1)
				    text = text.toString().replace(busca,reemplaza);
				
				return text;
			}
            
            function f_cambiar(){
				$("#ICHEQUES").val('');
                objUtiles.ejecutarFormulario("axis_axiscaj019.do?", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
            
            function f_monta_cheques(){
                var cheques = '';
                $('input[name="lst_cheques"]').each(function (){
                    cheques += this.value.split("-")[0]+'-'+this.value.split("-")[1]+'-';
                    if (this.checked){
                        cheques += 1+'#';
                    }else{
                        cheques += 0+'#';
                    }
                });
                return cheques;
            }
        </script>
    </head>
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>

    <form name="miForm" action="axis_axiscaj019.do" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>
            <input type="hidden" id="SPRODUC" name="SPRODUC" value="${__formdata.SPRODUC}"/>
            <input type="hidden" id="CAGENTE" name="CAGENTE" value="${__formdata.CAGENTE}"/>
            <input type="hidden" id="SEQCAJA" name="SEQCAJA" value="${__formdata.SEQCAJA}"/>
            <input type="hidden" id="CMONEDA" name="CMONEDA" value="${__formdata.CMONEDA}"/>
			<input type="hidden" id="CHEQUES" name="CHEQUES" value="${__formdata.CHEQUES}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="form" f="axiscaj019" lit="9907224"/></c:param>
                <c:param name="producto"><axis:alt c="form" f="axiscaj019" lit="9907224"/></c:param>
                <c:param name="form">axiscaj019</c:param>
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axiscaj019" c="TITULOIMPRIMIR" lit="9907224" /></c:param>
            <c:param name="nid" value="axisimprimir"></c:param>
        </c:import>
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
					<td >                 
						<table class="seccion" cellpadding="0" cellspacing="0">
							<tr>
								<td align="left" >
									<table class="area" align="center">
										<tr>
											<th style="width:25%;"></th>
											<th style="width:25%;"></th>
											<th style="width:25%;"></th>                                
											<th ></th>   
										</tr>
										<tr>
											<td><div class="separador">&nbsp;</div></td>
										</tr>
										<tr>
											<td><div class="separador">&nbsp;</div></td>
										</tr>
										<tr>
											<td class="titulocaja">
												<b><axis:alt f="axiscaj019" c="NREFDEPOSITO" lit="9907216"/>&nbsp;</b>
											</td>
											<td class="campocaja">
												<input type="text" class="campowidthinput campo campotexto_ob" value="${__formdata.NREFDEPOSITO}" 
													name="NREFDEPOSITO" id="NREFDEPOSITO" style="width:100%" size="15"   
													<axis:atr f="axiscaj019" c="NREFDEPOSITO" a="obligatorio=true&isInputText=true"/>
                                                    title="<axis:alt f="axiscaj019" c="NREFDEPOSITO" lit="9907216"/>"
												/>
											</td> 
										</tr>
										<tr>
                                            <td class="titulocaja">
												<b><axis:alt f="axiscaj019" c="CMONEOP" lit="108645"/></b>
											</td>	
                                            <td class="campocaja" id = "td_CMONEOP">
                                                <select name="CMONEOP" id="CMONEOP" size="1" class="campowidthselect campo campotexto_ob" style="width:84%;"  onchange="f_cambiar()"
														title="<axis:alt f="axiscaj019" c="CMONEOP" lit="108645"/>"
														<axis:atr f="axiscaj019" c="CMONEOP" a="obligatorio=true&isInputText=false"/> ">
														<option value="null">
															<axis:alt f="axiscaj019" c="SELECCIONAR" lit="108341"/>                                
														</option>
														<c:forEach var="lstmoneda" items="${__formdata.MONEDAS}">
															<option value="${lstmoneda.CMONEDA}"
															<c:if test="${__formdata.CMONEOP == lstmoneda.CMONEDA}">selected</c:if>>
															${lstmoneda.TMONEDA}
															</option>
														</c:forEach>
													</select>
                                            </td> 
										</tr>
										<tr>
                                            <td class="titulocaja">
												<b><axis:alt f="axiscaj019" c="CMEDMOV" lit="9907245"/>&nbsp;</b>
											</td>
											<td class="campocaja" id = "td_CMEDMOV">
                                                <select name="CMEDMOV" id="CMEDMOV" size="1" class="campowidthselect campo campotexto_ob" style="width:84%;" 
														title="<axis:alt f="axiscaj019" c="CMEDMOV" lit="9907245"/>" onchange="f_cambiar()"
														<axis:atr f="axiscaj019" c="CMEDMOV" a="obligatorio=true&isInputText=false"/>>
														<option value="null">
															<axis:alt f="axiscaj019" c="SELECCIONAR" lit="108341"/>                                
														</option>
														<c:forEach var="medio_mov" items="${__formdata.FORMAPAGO}">
															<option value="${medio_mov.CATRIBU}"
																<c:if test="${__formdata.CMEDMOV == medio_mov.CATRIBU}">selected</c:if>>
																${medio_mov.TATRIBU}
															</option>
														</c:forEach>
													</select>
                                            </td> 
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
												<b><axis:alt f="axiscaj019" c="IMOVIMI" lit="100563"/>&nbsp;</b>
											</td>
											<td class="campocaja" id = "td_IMOVIMI">
                                                <input type="text" class="campowidthinput campo campotexto" name="IMOVIMI" id="IMOVIMI" 
                                                    title="<axis:alt f="axiscaj019" c="IMOVIMI" lit="100563"/>"
                                                    <axis:atr f="axiscaj019" c="IMOVIMI" a="obligatorio=true&formato=decimal"/> 
                                                     formato="decimal" size="15" 
                                                   value="<fmt:formatNumber pattern="${__formatNumberPatterns[__formdata.CMONEDA]}" value="${__formdata.IMOVIMI}"/>" 
                                               />
                                            </td>
                                        </tr>
                                        <axis:visible c="DSP_CHEQUES" f="axiscaj019">
                                            <tr>
                                               <td colspan="4" id="td_DSP_CHEQUES">
                                                <div class="separador">&nbsp;</div>
                                                  <table class="seccion" align="center" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            <div class="separador">&nbsp;</div>
                                                            <div class="titulo">
                                                                <img src="images/flecha.gif"/><b><axis:alt f="axiscaj019" c="TIT_CHEQUES" lit="9907247"/>&nbsp; </b>                            
                                                            </div>
                                                            <div class="separador">&nbsp;</div>
                                                            
                                                            <c:set var="title0"><axis:alt f="axiscaj019" c="CMEDMOV" lit="100565"/></c:set>   <%-- Tipo cheque o vale vista --%>
                                                            <c:set var="title1"><axis:alt f="axiscaj019" c="NCHEQUE" lit="9906374"/></c:set>  <%-- Numero cheque --%>
                                                            <c:set var="title2"><axis:alt f="axiscaj019" c="CBANCO" lit="9000443"/></c:set>   <%-- Origen --%>
                                                            <c:set var="title3"><axis:alt f="axiscaj019" c="IMOVIMI" lit="100563"/> </c:set>   <%-- Importe --%>
                                                            <c:set var="title4"><axis:alt f="axiscaj019" c="FESTCHQ" lit="100562"/></c:set>  <%-- Fecha --%>
                                                            <c:set var="title5"><axis:alt f="axiscaj019" c="CESTCHQ" lit="101510"/></c:set>   <%-- Estado --%>
                                                            
                                                            <div id="DSP_CHEQUES" class="seccion displayspace">
                                                                <display:table name="${__formdata.LSTCHEQUES}" id="LSTCHEQUES" export="false" class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                                     requestURI="axis_axiscaj019.do?paginar=true">
                                                                    <%@ include file="../include/displaytag.jsp"%>
                                                                    <display:column  sortable="false" headerClass="sortable headwidth5 fixed"  media="html" autolink="false">
                                                                        <div class="dspNumber">
                                                                            <input type="checkbox" name="lst_cheques" id="${LSTCHEQUES.NCHEQUE}" value="${LSTCHEQUES.SEQCAJA}-${LSTCHEQUES.NNUMLIN}-<fmt:formatNumber pattern="${__formatNumberPatterns[__formdata.CMONEDA]}" value="${LSTCHEQUES.IMOVIMI}"/>" onclick="f_onclickCheckCheque(this)" class="LISTADOCHEQUES"/>
                                                                        </div>
                                                                    </display:column>
                                                                    <display:column title="${title0}" sortable="true" sortProperty="CMEDMOV" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                        <div class="dspNumber">                                        
                                                                            ${LSTCHEQUES.TMEDMOV}
                                                                       </div>
                                                                    </display:column>
                                                                    <display:column title="${title1}" sortable="true" sortProperty="NCHEQUE" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                        <div class="dspText">                                             
                                                                            ${LSTCHEQUES.NCHEQUE}
                                                                        </div>                                
                                                                    </display:column>                            
                                                                    <display:column title="${title2}" sortable="true" sortProperty="CBANCO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                        <div class="dspText">
                                                                            ${LSTCHEQUES.TBANCO}
                                                                      </div>
                                                                    </display:column>
                                                                    
                                                                    <display:column title="${title3}" sortable="true" sortProperty="IMOVIMI" style="width:10%" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                        <div class="dspText">                                       
                                                                               <fmt:formatNumber pattern="${__formatNumberPatterns[__formdata.CMONEDA]}" value="${LSTCHEQUES.IMOVIMI}"/>                                     
                                                                        </div>
                                                                    </display:column>
                                                                    <display:column title="${title4}" sortable="true" sortProperty="FESTCHQ" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                        <div class="dspText">
                                                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTCHEQUES.FESTCHQ}"/>
                                                                       </div>
                                                                    </display:column>
                                                                    <display:column title="${title5}" sortable="true" sortProperty="CESTCHQ" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                        <div class="dspText">                                       
                                                                                ${LSTCHEQUES.TESTCHQ}                                       
                                                                        </div>
                                                                    </display:column>                                                                        
                                                                </display:table>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>              
                                            </td>
                                          </tr>
                                      </axis:visible>
									  <tr><td><div class="separador">&nbsp;</div></td></tr>
									  <axis:visible c="ICHEQUES" f="axiscaj019">
										<td></td>
										<td class="titulocaja" id="tit_ICHEQUES">
											<b id="label_ICHEQUES"><axis:alt f="axiscaj019" c="ICHEQUES" lit="9907250"/>&nbsp;</b>
										</td>
										<td class="campocaja" id = "td_ICHEQUES">
											<input type="text" class="campowidthinput campo campotexto campodisabled" name="ICHEQUES" id="ICHEQUES" 
												title="<axis:alt f="axiscaj019" c="ICHEQUES" lit="9907250"/>"
												<axis:atr f="axiscaj019" c="ICHEQUES" a="formato=decimal&modificable=false"/> 
												 formato="decimal" size="15" 
											   value="<fmt:formatNumber pattern="${__formatNumberPatterns[__formdata.CMONEDA]}" value="${__formdata.ICHEQUES}"/>" 
										   />
										</td>
									  </axis:visible>
									  
									</table>
								</td>
							</tr>
						</table>
					</tr>
				</td>
			</table>
    </form>    
    <c:import url="../include/botonera_nt.jsp">
       <c:param name="f">axiscaj019</c:param>
       <c:param name="__botones"><axis:ocultar f="axiscaj019" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar><axis:ocultar f="axiscaj019" c="BT_ACEPTAR">,aceptar</axis:ocultar></c:param>
    </c:import>
      
    <c:import url="../include/mensajes.jsp" />
</body>
</html>


