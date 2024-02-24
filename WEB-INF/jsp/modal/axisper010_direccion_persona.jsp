
<head>
<%@ page contentType="text/html;charset=windows-1252"
	errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="axis.util.Constantes"%>
<%@ page import="java.util.*"%>
<fmt:setLocale value="${sessionScope.__locale}" />
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes" />

<script type="text/javascript">

function f_aceptar_axiscom001(CODIGO, TEXTO, CODIGO_CONSULTA,CPROVIN){
    f_cerrar_axiscom001();
    
    if (!objUtiles.estaVacio(TEXTO))
        TEXTO = objUtiles.replaceAll(TEXTO, "-quote-", "\'");
  
    if (CODIGO_CONSULTA == "LISTA_PAIS_RESIDENCIA") {
    
        objDom.setValorPorId("CPAIS", CODIGO);
        objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "<b>" + TEXTO + "</b>");
        
        if (document.miForm.isNew.value == "true"){
        objDom.setValorPorId("CNACIONALIDAD", CODIGO);
        objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "<b>" + TEXTO + "</b>");
        }
        
        
    }
    
    if (CODIGO_CONSULTA == "LISTA_PAIS_NACIONALIDAD") {
        objDom.setValorPorId("CNACIONALIDAD", CODIGO);
        objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "<b>" + TEXTO + "</b>");
    }
    
    if (CODIGO_CONSULTA == "LISTA_PAIS") {
          if(document.miForm.sinProvincias.value == 1)
                     objDom.setVisibilidadPorId("findPoblacion2","visible");
        objDom.setValorPorId("CPAIS_DIRECCION", CODIGO);
        objDom.setVisibilidadPorId("findProvincia", "visible");                
        objDom.setValorHTMLPorId("TPAIS_span", "<b>" + TEXTO + "</b>");
        limpiaCampos("CPAIS_DIRECCION");
    }
    else if (CODIGO_CONSULTA == "LISTA_PROVINCIA") {
        objDom.setValorPorId("CPROVIN", CODIGO);
        if(document.miForm.sinProvincias.value != 1)
            objDom.setVisibilidadPorId("findPoblacion", "visible");
            
        objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + TEXTO + "</b>");
        limpiaCampos("CPROVIN");
    }
    else if (CODIGO_CONSULTA == "LISTA_POBLACION") {
        objDom.setValorPorId("CPOBLAC", CODIGO);
        objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + TEXTO + "</b>");
    
    }  else if (CODIGO_CONSULTA == "LISTA_POBLACION_NOPROV") {
         objDom.setValorPorId("CPROVIN", CPROVIN);
        objDom.setValorPorId("CPOBLAC", CODIGO);
        objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + TEXTO + "</b>"); 
    }
}

function limpiaCampos (CAMPO){
    if(objUtiles.utilEquals(CAMPO, "CPAIS_DIRECCION")){
        //Limpio província
        objDom.setValorPorId("CPROVIN", "");
        objDom.setValorHTMLPorId("TPROVIN_span", "");
        
        objDom.setVisibilidadPorId("findPoblacion", "hidden");
       
    }
    
    if(objUtiles.utilEquals(CAMPO, "CPAIS_DIRECCION") ||
        objUtiles.utilEquals(CAMPO, "CPROVIN")){
            //Limpio población
            objDom.setValorPorId("CPOBLAC", "");
            objDom.setValorHTMLPorId("TPOBLAC_span", "");
    }
}

function f_onchange_CPAIS_DIRECCION() {
    var CPAIS_DIRECCION=objDom.getValorPorId("CPAIS_DIRECCION");
    
    if (!objUtiles.estaVacio(CPAIS_DIRECCION)){
        var qs="operation=ajax_direccion";
        qs=qs+"&op="+"CPAIS_DIRECCION";
        qs=qs+"&CPAIS_DIRECCION="+CPAIS_DIRECCION
        qs=qs+"&dt="+(new Date().getTime())
        objAjax.invokeAsyncCGI("modal_axisper005.do", callbackajaxdireccion, qs, this)
        if(document.miForm.sinProvincias.value == 1)
        objDom.setVisibilidadPorId("findPoblacion2", "visible"); 
    } else {
        objDom.setValorPorId("CPAIS_DIRECCION", "");
        objDom.setValorHTMLPorId("TPAIS_span", "");
        objDom.setVisibilidadPorId("findProvincia", "hidden");
        limpiaCampos("CPAIS_DIRECCION");
        if(document.miForm.sinProvincias.value == 1)
        objDom.setVisibilidadPorId("findPoblacion2", "hidden"); 
    }
}
function f_onchange_CPOBLAC() {
   
    var CPAIS_DIRECCION=objDom.getValorPorId("CPAIS_DIRECCION");
    var CPOBLAC=objDom.getValorPorId("CPOBLAC");
    var CPROVIN=objDom.getValorPorId("CPROVIN");
    
    if (!objUtiles.estaVacio(CPOBLAC)){
        var qs="operation=ajax_direccion";
       if(document.miForm.sinProvincias.value != 1){
         qs=qs+"&op="+"CPOBLAC";
       }else{
         qs=qs+"&op="+"CPOBLACSINPROV";
       }
        qs=qs+"&CPAIS_DIRECCION="+CPAIS_DIRECCION
        qs=qs+"&CPOBLAC="+CPOBLAC
        qs=qs+"&CPROVIN="+CPROVIN
        qs=qs+"&dt="+(new Date().getTime())
        objAjax.invokeAsyncCGI("modal_axisper005.do", callbackajaxdireccion, qs, this)
    } else {
     /*   objDom.setValorPorId("CPROVIN", "");
        objDom.setValorHTMLPorId("TPROVIN_span", "");
        objDom.setVisibilidadPorId("findPoblacion", "hidden");*/
        limpiaCampos("CPROVIN");
    }
}
function f_onchange_CPROVIN() {
    var CPAIS_DIRECCION=objDom.getValorPorId("CPAIS_DIRECCION");
    var CPROVIN=objDom.getValorPorId("CPROVIN");
    if (!objUtiles.estaVacio(CPROVIN)){
        var qs="operation=ajax_direccion";
        qs=qs+"&op="+"CPROVIN";
        qs=qs+"&CPAIS_DIRECCION="+CPAIS_DIRECCION;
        qs=qs+"&CPROVIN="+CPROVIN;
        qs=qs+"&dt="+(new Date().getTime());
        qs=qs+"&sin_provincias"+document.miForm.sinProvincias.value;
        objAjax.invokeAsyncCGI("modal_axisper005.do", callbackajaxdireccion, qs, this)
    }else{
        objDom.setValorPorId("CPROVIN", "");
        objDom.setValorHTMLPorId("TPROVIN_span", "");
        objDom.setVisibilidadPorId("findPoblacion", "hidden");
        limpiaCampos("CPROVIN");
    }
}

function callbackajaxdireccion (ajaxResponseText){
    try{ 
    
   // alert(ajaxResponseText);
        var doc = objAjax.domParse(ajaxResponseText);
        if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS")[0])) {
                if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                    objDom.setValorPorId("CPAIS_DIRECCION", "");
                    limpiaCampos("CPAIS_DIRECCION");
                }else{
                    objDom.setValorPorId("CPAIS_DIRECCION", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS"), 0, 0));
                    objDom.setVisibilidadPorId("findProvincia", "visible");
                      
                   if(document.miForm.sinProvincias.value == 1)
                     objDom.setVisibilidadPorId("findPoblacion2","visible");
                   
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAIS")[0])){
                        objDom.setValorHTMLPorId("TPAIS_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAIS"), 0, 0) + "</b>");
                        
                        limpiaCampos("CPAIS_DIRECCION");
                    }
                }
            }
         
            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS_RESIDENCIA")[0])) {
               if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                    objDom.setValorPorId("CPAIS", "");
                    limpiaCampos("CPAIS");
                }else{
                    objDom.setValorPorId("CPAIS", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS_RESIDENCIA"), 0, 0));
                    if (document.miForm.isNew.value == "true"){
                        objDom.setValorPorId("CNACIONALIDAD", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS_RESIDENCIA"), 0, 0));
                    }
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAISRESIDENCIA")[0])){
                        objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAISRESIDENCIA"), 0, 0) + "</b>");
                          
                            if (document.miForm.isNew.value == "true"){
                             objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAISRESIDENCIA"), 0, 0) + "</b>");
                             }
                        
                        limpiaCampos("CPAIS_RESIDENCIA");
                    }
                }
            }
            
              if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CNACIONALIDAD")[0])) {
               if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                    objDom.setValorPorId("CNACIONALIDAD", "");
                    limpiaCampos("CNACIONALIDAD");
                }else{
                    objDom.setValorPorId("CNACIONALIDAD", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CNACIONALIDAD"), 0, 0));
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAISNACIONALIDAD")[0])){
                         objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAISNACIONALIDAD"), 0, 0) + "</b>");
                        limpiaCampos("CNACIONALIDAD");
                    }
                }
            }
            
 
            
            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPROVIN")[0])) {
                if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                    objDom.setValorPorId("CPROVIN", "");
                    limpiaCampos("CPROVIN");
                }else{
                    objDom.setValorPorId("CPROVIN", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPROVIN"), 0, 0));
                    if(document.miForm.sinProvincias.value != 1)
                        objDom.setVisibilidadPorId("findPoblacion", "visible");
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPROVIN")[0])){
                        objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPROVIN"), 0, 0) + "</b>");
                        
                        limpiaCampos("CPROVIN");
                    }
                }
            }
            
            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPOBLAC")[0])) {
                if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                    objDom.setValorPorId("CPOBLAC", "");
                }else{
                    objDom.setValorPorId("CPOBLAC", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPOBLAC"), 0, 0));
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPOBLAC")[0]))
                        objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOBLAC"), 0, 0) + "</b>");
                }
            }
        }
    } catch (e) {
       if (isDebugAjaxEnabled == "true")
        alert (e.name + " " + e.message);
    }
    
        <%-- Especial per controlar els scroll amb iPad --%>
        // recarrega scroll pane
        //$.reinitialiseScroll();
        <%-- Especial per controlar els scroll amb iPad --%>
    
}

</script>
</head>
<body>

	<table class="seccion">
		<tr>
			<th style="width: 4%; height: 0px"></th>
			<th style="width: 21%; height: 0px"></th>
			<th style="width: 21%; height: 0px"></th>
			<th style="width: 21%; height: 0px"></th>
			<th style="width: 21%; height: 0px"></th>
		</tr>
		<tr>
			<td>&nbsp;</td>

			<axis:ocultar c="CTIPDIR" f="axisper010" dejarHueco="false">
				<td class="titulocaja"><b><axis:alt f="axisper010"
							c="CTIPDIR" lit="100565" /></b></td>
			</axis:ocultar>

			<axis:ocultar c="TALIAS" f="axisper010" dejarHueco="false">
				<td class="titulocaja"><b id="label_TALIAS"><axis:alt
							f="axisper010" c="TALIAS" lit="9910234" /></b></td>
			</axis:ocultar>


		</tr>
		<tr>
			<td>&nbsp;</td>
			<axis:ocultar c="CTIPDIR" f="axisper010" dejarHueco="false">
				<td class="campocaja"><select name="CTIPDIR" id="CTIPDIR"
					size="1" class="campowidthselect campo campotexto"
					title="<axis:alt f="axisper010" c="CTIPDIR" lit="9906012"/>"
					<axis:atr f="axisper010" c="CTIPDIR" a="obligatorio=true"/>
					style="width: 80%;">&nbsp;
						<option value="<%=Integer.MIN_VALUE%>">-
							<axis:alt f="axisper010" c="SNV_COMBO" lit="1000348" /> -
						</option>
						<c:forEach var="element"
							items="${__formdata.listValores.lstTipoDireccion}">
							<option value="${element.CATRIBU}"
								<c:if test="${element.CATRIBU == __formdata.CTIPDIR}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
						</c:forEach>
				</select></td>
			</axis:ocultar>

			<axis:ocultar c="TALIAS" f="axisper010" dejarHueco="false">
				<td class="campocaja"><input type="text"
					class="campowidthinput campo campotexto" size="15"
					value="${__formdata.TALIAS}" name="TALIAS" id="TALIAS"
					maxlength="200" onkeypress="return soloLetrasNumeros(event);">
				</td>
			</axis:ocultar>

			<axis:ocultar c="FDEFECTO" f="axisper010" dejarHueco="false">
				<td class="campocaja"><b><axis:alt f="axisper010"
							c="FDEFECTO" lit="9903470" /></b> <input
					onClick="javascript:actualitzarCheckbox(this)" type="checkbox"
					id="FDEFECTO" name="FDEFECTO" value="${__formdata.FDEFECTO}" /></td>
			</axis:ocultar>
		</tr>
		<axis:visible f="axisper010" c="DSP_DIRECCIONCOL">
			<tr>
				<td></td>
				<td colspan="4">
					<table>
						<tr>
							<th style="width: 19%; height: 0px"></th>
							<th style="width: 15%; height: 0px"></th>
							<th style="width: 17%; height: 0px"></th>
							<th style="width: 17%; height: 0px"></th>
							<th style="width: 17%; height: 0px"></th>
							<th style="width: 15%; height: 0px"></th>
						</tr>
						<tr>
							<axis:visible f="axisper010" c="CVIAVP">

								<td class="titulocaja"><b><axis:alt f="axisper010"
											c="CVIAVP" lit="9902408" /></b></td>
							</axis:visible>
							<axis:visible f="axisper010" c="TNOMVIA">
								<td class="titulocaja" colspan="2"><b><axis:alt
											f="axisper010" c="TNOMVIA" lit="9903010" /></b></td>
							</axis:visible>
							<axis:visible f="axisper010" c="CLITVP">
								<td class="titulocaja"><b id="label_CLITVP"><axis:alt f="axisper010"
											c="CLITVP" lit="9902409" /></b></td>
							</axis:visible>
							<axis:visible f="axisper010" c="CBISVP">
								<td class="titulocaja"><b id="label_CBISVP"><axis:alt f="axisper010"
											c="CBISVP" lit="9902410" /></b></td>
							</axis:visible>
							<axis:visible f="axisper010" c="CORVP">
								<td class="titulocaja"><b id="label_CORVP"><axis:alt f="axisper010"
											c="CORVP" lit="9902411" /></b></td>
							</axis:visible>

						</tr>
						<tr>
							<axis:visible f="axisper010" c="CVIAVP">

								<td class="campocaja"><select name="CVIAVP" id="CVIAVP"
									size="1" class="campowidthselect campo campotexto"
									style="width: 80%;" onchange="f_cargar_propiedades_pantalla()"
									<axis:atr f="axisper010" c="CVIAVP" a="obligatorio=false"/>
									title="<axis:alt f="axisper010" c="CVIAVP" lit="9902408"/>">&nbsp;
										<option value="<%=Integer.MIN_VALUE%>">-
											<axis:alt f="axisper010" c="BLANCO" lit="1000348" /> -
										</option>
										<c:forEach var="element"
											items="${__formdata.listValores.lstTipoVia}">
											<option value="${element.CSIGLAS}"
												<c:if test="${element.CSIGLAS == __formdata.CVIAVP}"> selected </c:if> />
                                                ${element.TDENOM} 
                                            </option>
										</c:forEach>
								</select></td>
							</axis:visible>
							<axis:visible f="axisper010" c="TNOMVIA">
								<td class="campocaja" colspan="2"><input type="text"
									class="campowidthinput campo campotexto" size="15"
									value="${__formdata.TNOMVIA}" name="TNOMVIA" id="TNOMVIA"
									onkeypress="return soloLetrasNumeros(event);" maxlength="200"
									title="<axis:alt f="axisper010" c="TNOMVIA" lit="9903010"/>"
									<axis:atr f="axisper010" c="TNOMVIA" a="obligatorio=false"/> />
								</td>
							</axis:visible>
							<axis:visible f="axisper010" c="CLITVP">
								<td class="campocaja"><select name="CLITVP" id="CLITVP"
									size="1" class="campowidthselect campo campotexto"
									style="width: 70%;"
									<axis:atr f="axisper010" c="CLITVP" a="obligatorio=false"/>
									title="<axis:alt f="axisper010" c="CLITVP" lit="9902409"/>">
										<option value="<%=Integer.MIN_VALUE%>">-
											<axis:alt f="axisper010" c="BLANCO" lit="1000348" /> -
										</option>
										<c:forEach var="element"
											items="${__formdata.listValores.lstCLITVP}">
											<option value="${element.CATRIBU}"
												<c:if test="${element.CATRIBU == __formdata.CLITVP}"> selected </c:if>>
												${element.TATRIBU}</option>
										</c:forEach>
								</select></td>
							</axis:visible>
							<axis:visible f="axisper010" c="CBISVP">
								<td class="campocaja"><select name="CBISVP" id="CBISVP"
									size="1"
									title="<axis:alt f="axisper010" c="CBISVP" lit="9902410"/>"
									class="campowidthselect campo campotexto" style="width: 70%;">
										<option value="<%=Integer.MIN_VALUE%>">-
											<axis:alt f="axisper010" c="BLANCO" lit="1000348" /> -
										</option>
										<c:forEach var="element"
											items="${__formdata.listValores.lstCBISVP}">
											<option value="${element.CATRIBU}"
												<c:if test="${element.CATRIBU == __formdata.CBISVP}"> selected </c:if>>
												${element.TATRIBU}</option>
										</c:forEach>
								</select></td>
							</axis:visible>
							<axis:visible f="axisper010" c="CORVP">
								<td class="campocaja"><select name="CORVP" id="CORVP"
									size="1"
									title="<axis:alt f="axisper010" c="CORVP" lit="9902411"/>"
									class="campowidthselect campo campotexto" style="width: 70%;">&nbsp;
										<option value="<%=Integer.MIN_VALUE%>">-
											<axis:alt f="axisper010" c="BLANCO" lit="1000348" /> -
										</option>
										<c:forEach var="element"
											items="${__formdata.listValores.lstCORVP}">
											<option value="${element.CATRIBU}"
												<c:if test="${element.CATRIBU == __formdata.CORVP}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
										</c:forEach>
								</select></td>
							</axis:visible>

						</tr>
						<tr>
							<axis:visible f="axisper010" c="NVIAADCO">
								<td class="titulocaja"><b id="label_NVIAADCO"><axis:alt f="axisper010"
											c="NVIAADCO" lit="9902414" /></b></td>
							</axis:visible>
							<axis:visible f="axisper010" c="CLITCO">
								<td class="titulocaja"><b id="label_CLITCO"><axis:alt f="axisper010"
											c="CLITCO" lit="9902409" /></b></td>
							</axis:visible>
							<axis:visible f="axisper010" c="CORCO">
								<td class="titulocaja"><b id="label_CORCO"><axis:alt f="axisper010"
											c="CORCO" lit="9902411" /></b></td>
							</axis:visible>
							<axis:visible f="axisper010" c="NPLACACO">
								<td class="titulocaja"><b id="label_NPLACACO"><axis:alt f="axisper010"
											c="NPLACACO" lit="9902415" /></b></td>
							</axis:visible>
							<axis:visible f="axisper010" c="COR2CO">

								<td class="titulocaja"><b id="label_COR2CO"><axis:alt f="axisper010"
											c="COR2CO" lit="9902411" /></b></td>
							</axis:visible>
						</tr>
						<tr>
							<axis:visible f="axisper010" c="NVIAADCO">
								<td class="campocaja"><input type="text"
									class="campowidthinput campo campotexto" size="15"
									value="${__formdata.NVIAADCO}" name="NVIAADCO" id="NVIAADCO"
									onkeypress="return ValidNum(event);" style="width: 70%;"
									formato="entero"
									<axis:atr f="axisper010" c="NVIAADCO" a="obligatorio=false"/>
									title="<axis:alt f="axisper010" c="NVIAADCO" lit="9902414"/>" />
								</td>
							</axis:visible>
							<axis:visible f="axisper010" c="CLITCO">
								<td class="campocaja"><select
									title="<axis:alt f="axisper010" c="CLITCO" lit="9902409"/>"
									name="CLITCO" id="CLITCO" size="1"
									class="campowidthselect campo campotexto" style="width: 70%;">&nbsp;
										<option value="<%=Integer.MIN_VALUE%>">-
											<axis:alt f="axisper010" c="BLANCO" lit="1000348" /> -
										</option>
										<c:forEach var="element"
											items="${__formdata.listValores.lstCLITCO}">
											<option value="${element.CATRIBU}"
												<c:if test="${element.CATRIBU == __formdata.CLITCO}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
										</c:forEach>
								</select></td>
							</axis:visible>
							<axis:visible f="axisper010" c="CORCO">
								<td class="campocaja"><select
									title="<axis:alt f="axisper010" c="CORCO" lit="9902411"/>"
									name="CORCO" id="CORCO" size="1"
									class="campowidthselect campo campotexto" style="width: 70%;">&nbsp;
										<option value="<%=Integer.MIN_VALUE%>">-
											<axis:alt f="axisper010" c="BLANCO" lit="1000348" /> -
										</option>
										<c:forEach var="element"
											items="${__formdata.listValores.lstCORCO}">
											<option value="${element.CATRIBU}"
												<c:if test="${element.CATRIBU == __formdata.CORCO}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
										</c:forEach>
								</select></td>
							</axis:visible>
							<axis:visible f="axisper010" c="NPLACACO">
								<td class="campocaja"><input type="text"
									class="campowidthinput campo campotexto" size="15"
									value="${__formdata.NPLACACO}" name="NPLACACO" id="NPLACACO"
									onkeypress="return ValidNum(event);" style="width: 70%;"
									formato="entero"
									<axis:atr f="axisper010" c="NPLACACO" a="obligatorio=false"/>
									title="<axis:alt f="axisper010" c="NPLACACO" lit="9902415"/>" />
								</td>
							</axis:visible>
							<axis:visible f="axisper010" c="COR2CO">
								<td class="campocaja"><select
									title="<axis:alt f="axisper010" c="COR2CO" lit="9902411"/>"
									name="COR2CO" id="COR2CO" size="1"
									class="campowidthselect campo campotexto" style="width: 70%;">&nbsp;
										<option value="<%=Integer.MIN_VALUE%>">-
											<axis:alt f="axisper010" c="BLANCO" lit="1000348" /> -
										</option>
										<c:forEach var="element"
											items="${__formdata.listValores.lstCOR2CO}">
											<option value="${element.CATRIBU}"
												<c:if test="${element.CATRIBU == __formdata.COR2CO}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
										</c:forEach>
								</select></td>
							</axis:visible>

						</tr>
						<tr>
							<axis:visible f="axisper010" c="CDET1IA">
								<td class="titulocaja"><b id="label_CDET1IA"><axis:alt f="axisper010"
											c="CDET1IA" lit="9902417" /></b></td>
							</axis:visible>
							<axis:visible f="axisper010" c="TNUM1IA">
								<td class="titulocaja" colspan="2"><b id="label_TNUM1IA"><axis:alt
											f="axisper010" c="TNUM1IA" lit="9902418" /></b></td>
							</axis:visible>
							<axis:visible f="axisper010" c="CDET2IA">
								<td class="titulocaja"><b id="label_CDET2IA"><axis:alt f="axisper010"
											c="CDET2IA" lit="9902419" /></b></td>
							</axis:visible>
							<axis:visible f="axisper010" c="TNUM2IA">
								<td class="titulocaja" colspan="2"><b id="label_TNUM2IA"><axis:alt
											f="axisper010" c="TNUM2IA" lit="9902420" /></b></td>
							</axis:visible>

						</tr>
						<tr>
							<axis:visible f="axisper010" c="CDET1IA">
								<td class="campocaja"><select
									title="<axis:alt f="axisper010" c="CDET1IA" lit="9902417"/>"
									name="CDET1IA" id="CDET1IA" size="1"
									class="campowidthselect campo campotexto" style="width: 60%;"
									<axis:atr f="axisper010" c="CDET1IA" a="obligatorio=false"/>>&nbsp;
										<option value="<%=Integer.MIN_VALUE%>">-
											<axis:alt f="axisper010" c="BLANCO" lit="1000348" /> -
										</option>
										<c:forEach var="element"
											items="${__formdata.listValores.lstCDET}">
											<option value="${element.CATRIBU}"
												<c:if test="${element.CATRIBU == __formdata.CDET1IA}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
										</c:forEach>
								</select></td>
							</axis:visible>
							<axis:visible f="axisper010" c="TNUM1IA">
								<td class="campocaja" colspan="2"><input type="text"
									class="campowidthinput campo campotexto" size="100"
									value="${__formdata.TNUM1IA}" name="TNUM1IA" id="TNUM1IA"
									onkeypress="return soloLetrasNumeros(event);"
									style="width: 90%;"
									title="<axis:alt f="axisper010" c="TNUM1IA" lit="9902418"/>"
									maxlength="100"
									<axis:atr f="axisper010" c="TNUM1IA" a="obligatorio=false"/> />
								</td>
							</axis:visible>
							<axis:visible f="axisper010" c="CDET2IA">
								<td class="campocaja"><select
									title="<axis:alt f="axisper010" c="CDET2IA" lit="9902419"/>"
									name="CDET2IA" id="CDET2IA" size="1"
									class="campowidthselect campo campotexto" style="width: 70%;">&nbsp;
										<option value="<%=Integer.MIN_VALUE%>">-
											<axis:alt f="axisper010" c="BLANCO" lit="1000348" /> -
										</option>
										<c:forEach var="element"
											items="${__formdata.listValores.lstCDET}">
											<option value="${element.CATRIBU}"
												<c:if test="${element.CATRIBU == __formdata.CDET2IA}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
										</c:forEach>
								</select></td>
							</axis:visible>
							<axis:visible f="axisper010" c="TNUM2IA">
								<td class="campocaja" colspan="2"><input type="text"
									class="campowidthinput campo campotexto" size="100"
									value="${__formdata.TNUM2IA}" name="TNUM2IA" id="TNUM2IA"
									onkeypress="return soloLetrasNumeros(event);"
									style="width: 90%;"
									title="<axis:alt f="axisper010" c="TNUM2IA" lit="9902420"/>"
									maxlength="100"
									<axis:atr f="axisper010" c="TNUM2IA" a="obligatorio=false"/> />
								</td>
							</axis:visible>
						</tr>
						<tr>
							<axis:visible f="axisper010" c="CDET3IA">
								<td class="titulocaja"><b id="label_CDET3IA"><axis:alt f="axisper010"
											c="CDET3IA" lit="9902421" /></b></td>
							</axis:visible>
							<axis:visible f="axisper010" c="TNUM3IA">
								<td class="titulocaja" colspan="2"><b id="label_TNUM3IA"><axis:alt
											f="axisper010" c="TNUM3IA" lit="9902422" /></b></td>
							</axis:visible>

						</tr>
						<tr>
							<axis:visible f="axisper010" c="CDET3IA">
								<td class="campocaja"><select
									title="<axis:alt f="axisper010" c="CDET3IA" lit="9902421"/>"
									name="CDET3IA" id="CDET3IA" size="1"
									class="campowidthselect campo campotexto" style="width: 70%;">&nbsp;
										<option value="<%=Integer.MIN_VALUE%>">-
											<axis:alt f="axisper010" c="BLANCO" lit="1000348" /> -
										</option>
										<c:forEach var="element"
											items="${__formdata.listValores.lstCDET}">
											<option value="${element.CATRIBU}"
												<c:if test="${element.CATRIBU == __formdata.CDET3IA}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
										</c:forEach>
								</select></td>
							</axis:visible>
							<axis:visible f="axisper010" c="TNUM3IA">
								<td class="campocaja" colspan="2"><input type="text"
									class="campowidthinput campo campotexto" size="100"
									value="${__formdata.TNUM3IA}" name="TNUM3IA" id="TNUM3IA"
									onkeypress="return soloLetrasNumeros(event);"
									style="width: 90%;"
									title="<axis:alt f="axisper010" c="TNUM3IA" lit="9902422"/>"
									maxlength="100"
									<axis:atr f="axisper010" c="TNUM3IA" a="obligatorio=false"/> />
								</td>
							</axis:visible>
						</tr>
					</table>
				</td>
			</tr>
		</axis:visible>
		<axis:visible f="axisper010" c="DSP_DIRECCIONCHI" >
			<tr>
				<td>&nbsp;</td>
				<axis:ocultar c="CSIGLAS" f="axisper010" dejarHueco="false">
					<td class="titulocaja"><b><axis:alt f="axisper010"
								c="CSIGLAS" lit="110028" /></b></td>
				</axis:ocultar>
				<td class="titulocaja"><b><axis:alt f="axisper010"
							c="TNOMVIA" lit="9905723" /></b></td>
				<td class="titulocaja"><b><axis:alt f="axisper010"
							c="NNUMVIA" lit="9904598" /></b></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<axis:ocultar c="CSIGLAS" f="axisper010" dejarHueco="false">
					<td class="campocaja"><select name="CSIGLAS" id="CSIGLAS"
						size="1" class="campowidthselect campo campotexto"
						style="width: 80%;">&nbsp;
							<option value="<%=Integer.MIN_VALUE%>">-
								<axis:alt f="axisper010" c="SNV_COMBO" lit="1000348" /> -
							</option>
							<c:forEach var="element"
								items="${__formdata.listValores.lstTipoVia}">
								<option value="${element.CSIGLAS}"
									<c:if test="${element.CSIGLAS == __formdata.CSIGLAS}"> selected </c:if> />
                                                ${element.TDENOM} 
                                            </option>
							</c:forEach>
					</select></td>
				</axis:ocultar>
				<td class="campocaja"><input type="text"
					class="campowidthinput campo campotexto" size="15"
					value="${__formdata.TNOMVIA}" name="TNOMVIA" id="TNOMVIA"
					style="width: 95%;"
					title="<axis:alt f="axisper010" c="TNOMVIA" lit="9905723"/>"
					<axis:atr f="axisper010" c="TNOMVIA" a="obligatorio=false"/> /></td>

				<td class="campocaja" colspan="3"><input type="text"
					class="campowidthinput campo campotexto" size="100"
					value="${__formdata.TNUM1IA}" name="TNUM1IA" id="TNUM1IA"
					onkeypress="return soloLetrasNumeros(event);" style="width: 15%;"
					maxlength="100" /> &nbsp;&nbsp;&nbsp; <axis:ocultar c="NNUMVIA"
						f="axisper010" dejarHueco="false">
						<input type="text" class="campowidthinput campo campotexto"
							size="15" value="${__formdata.NNUMVIA}" name="NNUMVIA"
							id="NNUMVIA" style="width: 15%;" />
                                    &nbsp;&nbsp;&nbsp;
                                    </axis:ocultar> <axis:ocultar c="TCOMPLE"
						f="axisper010" dejarHueco="false">
						<input type="text" class="campowidthinput campo campotexto"
							size="15" value="${__formdata.TCOMPLE}" name="TCOMPLE"
							id="TCOMPLE" style="width: 15%;" />
					</axis:ocultar></td>
			</tr>
			<tr>
				<td></td>
				<td class="titulocaja" colspan="2"><b><axis:alt
							f="axisper010" c="TNUM2IA" lit="9904595" /></b></td>
				<td class="titulocaja" colspan="2"><b><axis:alt
							f="axisper010" c="TNUM3IA" lit="9904596" /></b></td>
			</tr>
			<tr>
				<td></td>
				<td class="campocaja" colspan="2"><input type="text"
					class="campowidthinput campo campotexto" size="100"
					value="${__formdata.TNUM2IA}" name="TNUM2IA" id="TNUM2IA"
					onkeypress="return soloLetrasNumeros(event);" style="width: 90%;"
					title="<axis:alt f="axisper010" c="TNUM2IA" lit="9904595"/>"
					maxlength="100" /></td>
				<td class="campocaja" colspan="2"><input type="text"
					class="campowidthinput campo campotexto" size="100"
					value="${__formdata.TNUM3IA}" name="TNUM3IA" id="TNUM3IA"
					onkeypress="return soloLetrasNumeros(event);" style="width: 90%;"
					title="<axis:alt f="axisper010" c="TNUM3IA" lit="9904596"/>"
					maxlength="100" /></td>
			</tr>
			<tr>
				<td></td>
				<td class="titulocaja" colspan="2"><b><axis:alt
							f="axisper010" c="LOCALIDAD" lit="9903353" /></b></td>
			</tr>
			<tr>
				<td></td>
				<td class="campocaja" colspan="2"><input type="text"
					class="campowidthinput campo campotexto" size="100"
					value="${__formdata.LOCALIDAD}" name="LOCALIDAD" id="LOCALIDAD"
					style="width: 90%;"
					title="<axis:alt f="axisper010" c="LOCALIDAD" lit="9903353"/>" />
				</td>
			</tr>
		</axis:visible>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<axis:ocultar c="CPOSTAL" f="axisper010" dejarHueco="false">
				<td class="titulocaja"><b id="label_CPOSTAL"><axis:alt f="axisper010"
							c="CPOSTAL" lit="101081" /></b></td>
			</axis:ocultar>
			<axis:ocultar c="CPAIS_DIRECCION" f="axisper010" dejarHueco="false">
				<td class="titulocaja"><b><axis:alt f="axisper010"
							c="TPAIS" lit="100816" /></b></td>
			</axis:ocultar>
			<axis:visible c="CPROVIN" f="axisper010">
				<td class="titulocaja"><b><axis:alt f="axisper010"
							c="TPROVIN" lit="100756" /></b></td>
			</axis:visible>
			<td class="titulocaja"><b><axis:alt f="axisper010"
						c="TPOBLAC" lit="100817" /></b></td>

		</tr>
		<tr>
			<td>&nbsp;</td>
			<axis:ocultar c="CPOSTAL" f="axisper010" dejarHueco="false">
				<td class="campocaja"><input type="text"
					class="campowidthinput campo campotexto" size="15"
					value="${__formdata.CPOSTAL}" name="CPOSTAL" id="CPOSTAL"
					onkeypress="return ValidNum(event);"
					style="text-transform: uppercase; width: 60%;"
					onblur="f_onblur_CPOSTAL(this.value)"
					title="<axis:alt f="axisper010" c="CPOSTAL" lit="101081"/>"
					<axis:atr f="axisper010" c="CPOSTAL" a="obligatorio=true"/> />
					&nbsp; <axis:ocultar c="CPOSTALFIND" f="axisper010"
						dejarHueco="false">
						<img id="findCpostal" border="0" src="images/find.gif"
							onclick="f_abrir_axisper042();" style="cursor: pointer" alt="" />
					</axis:ocultar></td>
			</axis:ocultar>
			<axis:ocultar c="CPAIS_DIRECCION" f="axisper010" dejarHueco="false">
				<td class="campocaja"><input type="text"
					class="campowidthinput campo campotexto" size="3" maxlength="3"
					value="${__formdata.CPAIS_DIRECCION}<c:if test="${empty __formdata.CPAIS_DIRECCION}">${__configform.axisper005__CPAIS_DIRECCION__valordefecto}</c:if>"
					name="CPAIS_DIRECCION" id="CPAIS_DIRECCION"
					onchange="f_onchange_CPAIS_DIRECCION()" style="width: 18%;"
					title="<axis:alt f="axisper010" c="CPAIS_DIRECCION" lit="100816"/>"
					<axis:atr f="axisper010" c="CPAIS_DIRECCION" a="obligatorio=true"/> />&nbsp;
					<img
					title="<axis:alt f="axisper010" c="CPAIS_DIRECCION" lit="9000508"/>"
					id="findPais" border="0" src="images/find.gif"
					onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS', null)"
					style="cursor: pointer" /> &nbsp;<span id="TPAIS_span"><b>${__formdata.TPAIS}</b></span>
				</td>
			</axis:ocultar>
			<axis:ocultar c="CPROVIN" f="axisper010">
				<td class="campocaja"><input type="text"
					class="campowidthinput campo campotexto" size="15" maxlength="3"
					value="${__formdata.CPROVIN}" name="CPROVIN" id="CPROVIN"
					onchange="f_onchange_CPROVIN()" style="width: 18%;"
					title="<axis:alt f="axisper010" c="TPROVIN" lit="100756"/>"
					<axis:atr f="axisper010" c="CPROVIN" a="obligatorio=true"/> />
					&nbsp;<img id="findProvincia"
					title="<axis:alt f="axisper010" c="CPROVIN" lit="9000508"/>"
					<c:if test="${V_PROV!=1}">  
                                     style="visibility:${empty __formdata.CPAIS_DIRECCION ? 'hidden' : 'visible'};cursor:pointer"
                                    </c:if>
					<c:if test="${V_PROV==1}">  
                                     style="cursor:pointer"
                                    </c:if>
					border="0" src="images/find.gif"
					onclick="f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', document.miForm.CPAIS_DIRECCION.value)" />
					&nbsp;<span id="TPROVIN_span"><b>${__formdata.TPROVIN}</b></span></td>
			</axis:ocultar>

			<td class="campocaja">
				<%-- BUG: 24997 2012-12-13 AEG Se hace el campo obligatorio --%> <input
				type="text" class="campowidthinput campo campotexto" size="15"
				maxlength="5" value="${__formdata.CPOBLAC}" name="CPOBLAC"
				id="CPOBLAC" onchange="f_onchange_CPOBLAC()" style="width: 18%;"
				title="<axis:alt f="axisper010" c="TPOBLAC" lit="100817"/>"
				<axis:atr f="axisper010" c="CPOBLAC" a="obligatorio=true"/> />
				&nbsp;<img id="findPoblacion"
				title="<axis:alt f="axisper010" c="CPOBLAC" lit="9000508"/>"
				style="visibility:${empty __formdata.CPROVIN ? 'hidden' : 'visible'};cursor:pointer"
				border="0" src="images/find.gif"
				onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION', document.miForm.CPROVIN.value, document.miForm.CPOSTAL.value)" />
				&nbsp;<img id="findPoblacion2"
				style="visibility:${ ( __formdata.sin_provincias == 1 && !empty __formdata.CPAIS_DIRECCION ) ? 'visible' : 'hidden'};cursor:pointer"
				border="0" src="images/find.gif"
				onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION_NOPROV', document.miForm.CPAIS_DIRECCION.value, document.miForm.CPAIS_DIRECCION.value)" />
				&nbsp;<span id="TPOBLAC_span"><b>${__formdata.TPOBLAC}</b></span>
			</td>

		</tr>
	</table>
</body>