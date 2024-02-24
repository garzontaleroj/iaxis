
<%
	/*
	 *  Fichero: axisper054.jsp
	 *  Fecha: 09/04/2021
	 */
%>
<%@ page contentType="text/html;charset=iso-8859-15"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}" />
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes" />

<html>
<head>
<link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
<link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
<link rel="stylesheet" href="styles/displaytag.css">
<c:import url="../include/carga_framework_js.jsp" />


<script language="Javascript" type="text/javascript">
	/****************************************************************************************/
	/*********************************** NAVEGACION *****************************************/
	/****************************************************************************************/

	function f_onload() {
		f_cargar_propiedades_pantalla();		
	}
			
	function f_onlynumber(t) {
		if (t.value.match(/[^A-Za-z0-9]/g)) {
			alert("<axis:alt f='axisper054' c='ERRORNUM' lit='9907933'/>");
			t.value = t.value.replace(/[^A-Za-z0-9]/g, '');
		}
	}
	
	function isNumberKey(event) {
		var charCode = (evt.which) ? evt.which : evt.keyCode;
		if (!(charCode > 31 && ((charCode >= 48 && charCode <= 57) || (charCode >= 96 && charCode <= 105))))
			event.preventDefault();
	}
		
	   
    function f_onchange_CTIPPER(TIDENTI) {
        formdataTIDENTI = '${__formdata.CTIPPER}';        
        if ( TIDENTI != formdataTIDENTI ) 
        {            
        	objDom.setValorPorId("NNUMIDE", "");
            objUtiles.ejecutarFormulario("modal_axisper054.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
              
            //objUtiles.abrirModal("axisper054","src","modal_axisper054.do?operation=form&TIDENTI="+TIDENTI+");
        }
    }
    

	function f_but_9904040() {
		objUtiles.ejecutarFormulario("modal_axisper054.do", "limpiar",document.miForm, "_self", objJsMessages.jslit_cargando);
	}       
    
	function f_but_cancelar() {		
		parent.f_cerrar_modalCIFIN("axisper054");		
	}

	function f_but_9000508() {		
		if (objValidador.validaEntrada()) 
		{
			objUtiles.ejecutarFormulario("modal_axisper054.do", "buscarDatos",document.miForm, "_self",
				objJsMessages.jslit_buscando_personas);			
		}
	}	
	
	function f_buscar_cifin(CTIPIDE, NNUMIDE, OPTION, ISACTIVE, SPERSON, CAGENTE) 
	{			
		if (objValidador.validaEntrada()) 
		{			
			objUtiles.ejecutarFormulario("modal_axisper054.do?OPTION="+OPTION+"&ISACTIVE="+ISACTIVE,"buscarDatosCIFIN",document.miForm, "_self",objJsMessages.jslit_buscando_personas);									
		}
	}		
		
	
	function f_actualizar_con_cifin(CTIPIDE, NNUMIDE, SPERSON, CAGENTE) 
	{							
		var qs="operation=ajax_actualizarPersonCIFIN";
	    qs=qs+"&CTIPIDE="+CTIPIDE+"&NNUMIDE="+NNUMIDE+"&SPERSON="+SPERSON+"&CAGENTE="+CAGENTE;
	    objAjax.invokeAsyncCGI("modal_axisper054.do", callbackajaxactualizar_con_cifin, qs, this, objJsMessages.jslit_cargando, SPERSON, CAGENTE);	    	    
	}	
	
	function callbackajaxactualizar_con_cifin(ajaxResponseText, SPERSON, CAGENTE)
	{
		 try
		 { 							 
	        var doc = objAjax.domParse(ajaxResponseText);      	
	        
	        if (objAppMensajes.existenErroresEnAplicacion(doc)) {	       	     	
		        //if(objUtiles.existeObjetoXml(doc.getElementsByTagName("resultado")[0]))		        		        
		        if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0]))		        	
		        {		        	
		        	var elementos = doc.getElementsByTagName("element");  
		        	for (i = 0; i < elementos.length; i++) {
		        	//var codigo = objDom.getValorNodoDelComponente(doc.getElementsByTagName("resultado"),0,0);
		        	var CERROR = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CERROR")[0]) ?
                            objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CERROR"), 0, 0) : "";
		        	
		        	var TIPERROR = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("TIPERROR")[0]) ?
                            objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TIPERROR"), 0, 0) : "";
                            
                    var MES = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("TERROR")[0]) ?
                                    objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TERROR"), 0, 0) : "";        
		        	}
		        	console.log("CERROR : "+CERROR);
		        	console.log("TIPERROR : "+TIPERROR);
		        	if( CERROR === "0" && TIPERROR === "1001")
		        	{
		        		
		        		alert(MES);
		        		parent.f_cerrar_modalCIFIN("axisper054");
			    		parent.seleccionarLista (SPERSON,CAGENTE);	
		        	}
		        }	               	        	        		  
	        }  	        	
	    }
		catch (e) 
		{
	       if (isDebugAjaxEnabled == "true")
	        alert (e.name + " " + e.message);
	    }
	}
	
</script>
</head>
<body onload="f_onload()">
	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>
	 <c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper054|<axis:alt
				c="axisper054" f="axisper054" lit="89908118" />
		</c:param>
	</c:import>

	<form name="miForm" action="" method="POST">
		<input type="hidden" name="operation" value="" />
        <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>
        <input type="hidden" id="CAGENTE" name="CAGENTE" value="${__formdata.CAGENTE}"/>
        			
		<c:import url="../include/titulo_nt.jsp">
			<c:param name="titulo">
				<axis:alt f="${fname}" c="TITULO" lit="89908118" />
			</c:param>
			<c:param name="formulario">
				<axis:alt f="${fname}" c="TITULO" lit="89908118" />
			</c:param>
			<c:param name="form">axisper054</c:param>
		</c:import>
		

		<table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<div class="separador">&nbsp;</div>
					<div class="titulo">
						<img src="images/flecha.gif" /> <b>
						<axis:alt f="axisper054" c="TIT_BUSCADOR" lit="1000235" /></b>
					</div>
				<table class="seccion">		
					<tr>
						<th style="width: 5%; height: 0px"></th>
						<th style="width: 18%; height: 0px"></th>
						<th style="width: 18%; height: 0px"></th>
						<th style="width: 18%; height: 0px"></th>
						<th style="width: 18%; height: 0px"></th>
						<th style="width: 18%; height: 0px"></th>
						<th style="width: 5%; height: 0px"></th>
					</tr>						
					<tr>
						<td>&nbsp;</td>
						<axis:ocultar c="CTIPPER" f="axisper054" dejarHueco="false">
							<td class="titulocaja">
								<b><axis:alt f="axisper054" c="CTIPPER" lit="102844" /></b>
							</td>
						</axis:ocultar>
						<axis:ocultar c="CTIPIDE" f="axisper054" dejarHueco="false">
							<td class="titulocaja">
								<b><axis:alt f="axisper054" c="CTIPIDE" lit="109774" /></b>
							</td>
						</axis:ocultar>
						<axis:ocultar c="NNUMIDE" f="axisper054" dejarHueco="false">
							<td class="titulocaja">
								<b><axis:alt f="axisper054" c="NNUMIDE" lit="105330" /></b>
							</td>
						</axis:ocultar>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<axis:ocultar c="CTIPPERcerca" f="axisper054" dejarHueco="false">
						<td class="campocaja">
							<select name="CTIPPER" id="CTIPPER" size="1"
									class="campowidthselect campo campotexto" style="width: 90%;"
									title="<axis:alt f="axisper054" c="CTIPPER" lit="102844"/>"
									onchange="f_onchange_CTIPPER(this.value)"
									<axis:atr f="axisper054" c="CTIPPER" a="modificable=true&obligatorio=true&isInputText=false"/>									
							>&nbsp;
									<option value="<%=Integer.MIN_VALUE%>">-
										<axis:alt f="axisper054" c="SNV_COMBO" lit="1000348" /> -
									</option>
									<c:forEach var="element" items="${__formdata.listValores.tipPerson}">
										<option value="${element.CATRIBU}"
											<c:if test="${element.CATRIBU == __formdata.CTIPPER}"> selected </c:if> />
                                               ${element.TATRIBU} 
                                        </option>
									</c:forEach>
							</select>
						</td>
						</axis:ocultar>
						<axis:ocultar c="CTIPIDE" f="axisper054" dejarHueco="false">
						<td class="campocaja">
							<select name="CTIPIDE" id="CTIPIDE" size="1"									
									<axis:atr f="axisper054" c="CTIPIDE" a="isInputText=false&obligatorio=true&isInputText=false"/>																		
									title="<axis:alt f="axisper054" c="CTIPIDE" lit="109774"/>"
									class="campowidthselect campo campotexto"
									<axis:atr f="axisper054" c="CTIPIDE" a="modificable=true&obligatorio=true"/>
									style="width: 100%;"
							>&nbsp;
									<option value="<%=Integer.MIN_VALUE%>">-
										<axis:alt f="axisper054" c="SNV_COMBO" lit="1000348" /> -
									</option>
									<c:forEach var="element" items="${__formdata.listValores.tipDocum}">
										<option value="${element.CATRIBU}"
											<c:if test="${element.CATRIBU == __formdata.CTIPIDE}"> selected </c:if> />
                                                   ${element.TATRIBU} 
                                        </option>
									</c:forEach>
							</select>
						</td>
						</axis:ocultar>
						<td class="campocaja">
							<input type="text" maxlength="15"				
								class="campowidthinput campo campotexto" size="15"
								value="${__formdata.NNUMIDE}"
								<axis:atr f="axisper054" c="NNUMIDE" a="modificable=true&obligatorio=true"/>
								title="<axis:alt f="axisper054" c="NNUMIDE" lit="105330"/>"
								name="NNUMIDE" id="NNUMIDE"
								onkeypress="javascript:isNumberKey(event)"
								style="width: 70%; text-transform: uppercase;"
							/>
						</td>
						<td class="campocaja">
						<c:import url="../include/botonera_nt.jsp">
							<c:param name="f">axisper054</c:param>
							<c:param name="__botones"><axis:visible f="axisper054" c="BT_BUSCAR">,9000508</axis:visible><axis:visible f="axisper054" c="BT_Limpiar">,9904040</axis:visible>
							</c:param>
							
						</c:import>
						</td>
					</tr>								
				</table>
				
					<div class="separador">&nbsp;</div>	
					<div class="separador">&nbsp;</div>			
					<c:if test="${__formdata.TABEL_INFO eq 'SHOW'}">			
			               <!-- DisplayTag ListaPersonas -->
			               <c:set var="title1"><axis:alt f="axisper054" c="NNUMIDE"  lit="105330"/></c:set>
			               <c:set var="title2"><axis:alt f="axisper054" c="NOMBRE"   lit="105940"/></c:set>
			               <c:set var="title3"><axis:alt f="axisper054" c="FNACIMI"  lit="9001983"/></c:set>
								<div class="seccion displayspacePersonas">								
			                    	<display:table name="${sessionScope.resultadoBusqueda}" 
			                    				   id="miListaId"
			                    				   class="dsptgtable" 
			                    	 	 		   cellpadding="0" cellspacing="0">                                    
			                             <display:column title="${title1}" headerClass="headwidth5 sortable" style="width:5%;"  media="html"  >    
			                                  <div class="dspText">${miListaId['NNUMIDE']}</div>
			                              </display:column>   
			                              <display:column title="${title2}" headerClass="headwidth5 sortable" style="width:10%;" media="html"  >
			                                  <div class="dspText">${miListaId['NOMBRECOMPLETO']}</div>
			                              </display:column>
										  <display:column title="${title3}" headerClass="headwidth5 sortable" style="width:8%;"  media="html" >
			                                  <div class="dspText">
			                                  	<fmt:formatDate pattern="dd/MM/yyyy HH:mm:ss"
                                                      value="${miListaId['FECHADEACTUALIZACION']}"/>
			                                  </div>
			                              </display:column> 
			                              <display:column headerClass="headwidth5 sortable" style="width:8%;"  media="html" >
			                              		<c:if test="${! empty miListaId['PERMITE_CONSULTA'] and miListaId['PERMITE_CONSULTA'] eq 'SI'}">	
													<input type="button" class="boton" id="BUSCAR_CIFIN"  style="width:140px"
														value="Buscar con Proveedor" 
										                onclick="javascript:f_buscar_cifin('${miListaId['CTIPIDE']}','${miListaId['NNUMIDE']}','${__formdata.OPTION}',
										                								   '${__formdata.ISACTIVE}','${__formdata.SPERSON}','${__formdata.CAGENTE}');">			                              			                                 
			                      				</c:if>
			                                  	<c:if test="${__formdata.OPTION eq 'UPDATE' and __formdata.ISACTIVE eq 'TRUE'}">			                                  
									                <input type="button" class="boton" id="UPDATE_CIFIN"  style="width:150px"
									                value="Actualizar con Proveedor" 
									                onclick="javascript:f_actualizar_con_cifin('${miListaId['CTIPIDE']}',
									                										   '${miListaId['NNUMIDE']}',
									                										   '${__formdata.SPERSON}',
									                										   '${__formdata.CAGENTE}')">								                									               
			                                  	</c:if>	        												                                  	                  
			                              </display:column>   
			                        </display:table>    			                      
			                    </div>	
					</c:if>  			                    	
			</td>
		</tr>					
		</table>
		<div class="separador">&nbsp;</div> 
		<c:import url="../include/botonera_nt.jsp">
				<c:param name="f">axisper054</c:param>
				<c:param name="__botones">cancelar</c:param>
			</c:import>
		<br/><br/>
		<div class="separador">&nbsp;</div>                      
          
	</form>

	<c:import url="../include/mensajes.jsp" />

</body>
</html>
