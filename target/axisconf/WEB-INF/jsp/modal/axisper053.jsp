<%/* Revision:# v+EhxztxPgVDFiZy9n1gPQ== # */%>
<%-- 
*  Fichero: axisper053.jsp
*
*  Fecha: 06/05/2020
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="axis.util.Constantes" %>
<%@ page import="java.util.*" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <c:import url="../include/carga_framework_js.jsp" />
    
    <script language="Javascript" type="text/javascript">
        
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() 
        {               
        	var grabarOK = '${requestScope.grabarOK}';
            if (!objUtiles.estaVacio(grabarOK) && grabarOK == "0")
            {
            	parent.f_aceptar_axisper053_FE("${__formdata.SPERSON}");  
            }	
            f_cargar_propiedades_pantalla();               
        }
        
        function f_abrir_axisfiscales_adquiriente001(CODIGO, LITERAL){        	        	
            objUtiles.abrirModal("axisfiscales_adquiriente001", "src", "modal_axisfiscales_adquiriente001.do?operation=form&CODIGO=" + CODIGO +"&LITERAL=" + LITERAL);
        }

        function f_aceptar_axisfiscales_adquiriente001(CODIGO, TEXTO){
            	f_cerrar_axisfiscales_adquiriente001();                   	
                objDom.setValorPorId("FISCALES_ADQUIRIENTE", CODIGO);                                
                objDom.setValorHTMLPorId("TFISCALES_ADQUIRIENTE_span", "<b>" + TEXTO + "</b>");            
         } 

        function f_cerrar_axisfiscales_adquiriente001() {
            objUtiles.cerrarModal("axisfiscales_adquiriente001");
        }  

        function f_onblur_email_FS(CORREO_FACT_ELECT){
        	objDom.setValorPorId("CORREO_FACT_ELECT",CORREO_FACT_ELECT.replace(/\s/g,''));
        }

        function correoValido(email) 
        {
            var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            return regex.test(email);
        }
               
        function f_but_aceptar() 
        {	
        	if (objValidador.validaEntrada()) 
            {
	        	if(!correoValido($("#CORREO_FACT_ELECT").val()))
	        	{
	        		alert("Ingrese un correo valido.");
	        	}
	        	else
	        	{	        	
		            objUtiles.ejecutarFormulario("modal_axisper053.do", "grabarFactElec", document.miForm, "_self", objJsMessages.jslit_cargando); 
		        }
        	}
        }
       
		function f_but_cancelar() 
		{            
            parent.f_cerrar_modal('axisper053');  
        }      
                	
		function f_onlynumber_FE(t) 
		{
			if (t.value.match(/[^A-Za-z0-9]/g)) 
			{
				alert("<axis:alt f='axisper053' c='ERRORNUM' lit='9907933'/>");
				t.value = t.value.replace(/[^A-Za-z0-9]/g, '');
			}	
			else
			{		
				if (!objUtiles.estaVacio(t.value)){		
					var qs="operation=ajax_validate_nit_proveedor";
				    qs=qs+"&NIT_PROVEEDOR="+t.value;
				    objAjax.invokeAsyncCGI("modal_axisper010.do", callbackajaxvalidate_nit_proveedor, qs, this, objJsMessages.jslit_cargando);
				}	 			
			}	
		}

		function callbackajaxvalidate_nit_proveedor(ajaxResponseText){
			 try
			 { 		
		        var doc = objAjax.domParse(ajaxResponseText);                
		        if (objAppMensajes.existenErroresEnAplicacion(doc)) 
		        {        	        
		        	alert("<axis:alt f='axisper053' c='ERRORNUM' lit='9902749'/>");          	
		        	objDom.setValorPorId("NIT_PROVEEDOR", "");
		        	objDom.setVisibilidadPorId("mensajes_div", "hidden");   
		        	objDom.setVisibilidadPorId("mensajes_table", "hidden"); 
		    		document.miForm.NIT_PROVEEDOR.focus();          
		        }  	        	
		    }
			catch (e) 
			{
		       if (isDebugAjaxEnabled == "true")
		        alert (e.name + " " + e.message);
		    }
		}	
		
        function f_onchange_FISCALES_ADQUIRIENTE() 
        {
            var FISCALES_ADQUIRIENTE=objDom.getValorPorId("FISCALES_ADQUIRIENTE");
            if (!objUtiles.estaVacio(FISCALES_ADQUIRIENTE)){
                var qs="operation=ajax_fiscales_adquiriente";
                qs=qs+"&FISCALES_ADQUIRIENTE="+FISCALES_ADQUIRIENTE;
                var origen = 'FISCALES_ADQUIRIENTE';
                objAjax.invokeAsyncCGI("modal_axisper010.do", callbackajaxfiscales_adquiriente, qs, this, null, origen);
            } 
        }
        
        function callbackajaxfiscales_adquiriente (ajaxResponseText,origen){
            try{ 
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {

                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("FISCALES_ADQUIRIENTE")[0])) {                    	
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("FISCALES_ADQUIRIENTE", "");
                            objDom.setValorHTMLPorId("TFISCALES_ADQUIRIENTE_span", "<b></b>");                           
                        }else{
                            objDom.setValorPorId("FISCALES_ADQUIRIENTE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("FISCALES_ADQUIRIENTE"), 0, 0));                          
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TFISCALES_ADQUIRIENTE")[0])){
                                objDom.setValorHTMLPorId("TFISCALES_ADQUIRIENTE_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TFISCALES_ADQUIRIENTE"), 0, 0) + "</b>");
                            }
                        }
                    }else{
                    	objDom.setValorPorId("FISCALES_ADQUIRIENTE", "");
                        objDom.setValorHTMLPorId("TFISCALES_ADQUIRIENTE_span", "<b></b>");
                    }
                    }else{
                    	objDom.setValorPorId("FISCALES_ADQUIRIENTE", "");
                        objDom.setValorHTMLPorId("TFISCALES_ADQUIRIENTE_span", "<b></b>");
                    }
            }catch (e) {
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
			<c:param name="nid_y_titulo">axisfiscales_adquiriente001|<axis:alt
					c="axisfiscales_adquiriente001_TITULO" f="axisfiscales_adquiriente001" lit="89908051" />
			</c:param>
		</c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="faceptar" name="faceptar" value="${__formdata.faceptar}"/>
            <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>
            <input type="hidden" id="CAGENTE" name="CAGENTE" value="${__formdata.CAGENTE}"/>

            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisper053" c="TIT053" lit="89908046" /></c:param>
                <c:param name="producto"><axis:alt f="axisper053" c="TIT053" lit="89908046" /></c:param>
                <c:param name="form">axisper053</c:param>
            </c:import>

            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">
            
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <table class="seccion">
							<tr>
								<th style="width: 4%; height: 0px"></th>
								<th style="width: 48%; height: 0px"></th>
								<th style="width: 48%; height: 0px"></th>
							</tr>
					
							<tr>
							<td>&nbsp;</td>
								<axis:ocultar f="axisper053" c="NIT_PROVEEDOR" dejarHueco="false">
									<td class="titulocaja">
									<b>
										<axis:alt f="axisper053" c="NIT_PROVEEDOR" lit="89908047" />
								    </b>
								    </td>
								</axis:ocultar>
								<axis:ocultar f="axisper053" c="RESPONSABLE_IVA" dejarHueco="false">
									<td class="titulocaja">
									<b>
										<axis:alt f="axisper053" c="RESPONSABLE_IVA" lit="89908048" />
									</b>
									</td>
								</axis:ocultar>
							</tr>
							<tr>
							<td>&nbsp;</td>
							<td class="campocaja">
							<input type="text" maxlength="15"
								class="campowidthinput campo campotexto" size="15"
								value="${__formdata.NIT_PROVEEDOR}" name="NIT_PROVEEDOR" id="NIT_PROVEEDOR"
								style="width: 40%;"
								onchange="f_onlynumber_FE(this)"
								title="<axis:alt f="axisper053" c="NIT_PROVEEDOR" lit="89908047"/>"
								<axis:atr f="axisper053" c="NIT_PROVEEDOR" a="obligatorio=false"/> />
							</td>
							
							<td class="campocaja">			
								<select name="RESPONSABLE_IVA"
										id="RESPONSABLE_IVA" size="1"
										class="campowidthselect campo campotexto"
										style="width: 40%;"
										title="<axis:alt f="axisper053" c="RESPONSABLE_IVA" lit="89908048"/>"
											   <axis:atr f="axisper053" c="RESPONSABLE_IVA" a="isInputText=false&obligatorio=true"/>>&nbsp;
													 <option value="<%=Integer.MIN_VALUE%>">-
														<axis:alt f="axisper053" c="SNV_COMBO" lit="1000348" /> -
															</option>
																<c:forEach var="element" items="${__formdata.listValores.tipResponsable_IVA}">
																	<option value="${element.CATRIBU}"
																		<c:if test="${element.CATRIBU == __formdata.RESPONSABLE_IVA}"> selected </c:if> />
					                                                	${element.TATRIBU} 
					                                            	</option>
																</c:forEach>
								</select>			
							</td>
							<tr>
							<td>&nbsp;</td>
								<axis:ocultar f="axisper053" c="FISCALES_ADQUIRIENTE" dejarHueco="false">
									<td class="titulocaja">
									<b>
										<axis:alt f="axisper053" c="FISCALES_ADQUIRIENTE" lit="89908049" />
								    </b>
								    </td>
								</axis:ocultar>
								<axis:ocultar f="axisper053" c="CORREO_FACT_ELECT" dejarHueco="false">
									<td class="titulocaja">
									<b>
										<axis:alt f="axisper053" c="CORREO_FACT_ELECT" lit="89908050" />
									</b>
									</td>
								</axis:ocultar>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td class="campocaja">
							
										<input type="text"
											class="campowidthinput campo campotexto"						
											onchange="f_onchange_FISCALES_ADQUIRIENTE()"
											size="15"
											value="${__formdata.FISCALES_ADQUIRIENTE}" name="FISCALES_ADQUIRIENTE" id="FISCALES_ADQUIRIENTE"
											style="width: 20%;"
											title="<axis:alt f="axisper053" c="FISCALES_ADQUIRIENTE" lit="89908049"/>"
											<axis:atr f="axisper053" c="FISCALES_ADQUIRIENTE" a="obligatorio=true"/> />
											&nbsp;<img id="findFISCALES_ADQUIRIENTE" border="0" src="images/find.gif"
											onclick="f_abrir_axisfiscales_adquiriente001(null, null)" style="cursor: pointer" />
											&nbsp;<span id="TFISCALES_ADQUIRIENTE_span" ><b>${__formdata.TFISCALES_ADQUIRIENTE}</b></span>
								</td>
									
								<td class="campocaja">
								<input type="text"
									class="campowidthinput campo campotexto" size="15"
									value="${__formdata.CORREO_FACT_ELECT}" name="CORREO_FACT_ELECT" id="CORREO_FACT_ELECT"
									style="width: 40%;"
									title="<axis:alt f="axisper053" c="CORREO_FACT_ELECT" lit="89908050"/>"
									<axis:atr f="axisper053" c="CORREO_FACT_ELECT" a="obligatorio=true"/> onblur="f_onblur_email_FS(this.value)" />
								</td>	
							<tr>		
						</table>
                                   
                    </td>
                </tr>
            </table>			
            
            <div class="separador">&nbsp;</div>                      
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisper053</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form>
        
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>

