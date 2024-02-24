
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

<link rel="stylesheet" href="styles/displaytag.css"></link>

<script language="Javascript" type="text/javascript">
        
        function f_onload2() {
               f_cargar_propiedades_pantalla();
            var guardat = "${__formdata.guardat}";
            if ((!objUtiles.estaVacio(guardat))&&(guardat=="0")){
               parent.f_aceptar_modal("axisper010");
            }
        }  
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisper010');                      
        }           
        
        /* Cambio para bug-14446 : start */
        function f_but_anadir()
        { 
        	if($("#CREGIMENFISCAL").val() < 0)
        	{
        		alert("Debe seleccionar el régimen fiscal");	
        	} else if($("#CCODIMP").val() < 0)
        	{
        		alert("Debe seleccionar el impuesto / retención");	
        	} else if($("#CTIPIND").val() < 0)
        	{
        		alert("Debe seleccionar el tipo de indicador");	
        	} else
        	{
        		var objImp = "${__formdata.OBPROFESIONAL}";                                               
                objAjax.invokeAsyncCGI("modal_axisper010.do", callbackajaxvalidateSolicitud, "operation=ajax_imptos&CCODIMP="+
                       $("#CCODIMP").val()+"&CCODAGEN="+$("#CCODAGEN").val()+"&CATRIBU="+$("#CATRIBU").val()
                        +"&CCODVIN="+$("#CCODVIN").val()+"&CTIPIND="+$("#CTIPIND").val()+"&TINDICA="+$("#TINDICA").val()+"&NNUMIDE="+$("#NNUMIDE").val(), 
                       this, objJsMessages.jslit_cargando);
        	}            
        }
        
        function callbackajaxvalidateSolicitud(ajaxResponseText)
        {
       	 try
       	 { 		
               var doc = objAjax.domParse(ajaxResponseText);   
               
               var isValid = objUtiles.hayValorElementoXml(doc.getElementsByTagName("VALUE")[0]) ? 
            		         objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALUE"), 0, 0) : "false";
            		                                  		                       
               if(isValid === "true")
               {
            	   alert("Añadido!");
               }
               else
               {
            	   alert("Indicador de retención ya incluido.");
               }	   
           }
           catch (e) 
	       {
	           if (isDebugAjaxEnabled == "true")
	           alert (e.name + " " + e.message);
	       }
       }
        /* Cambio para bug-14446 : end */
        
    //    function f_carga_tipos_indicadores(){
     //   	if (!objUtiles.estaVacio($("#CCODIMP").val())){
     //           objAjax.invokeAsyncCGI("modal_axisper010.do", callbackAjaxCargarTiposIndica, "operation=ajax_busqueda_tip_indica&CCODIMP="+
     //           $("#CCODIMP").val(), this, objJsMessages.jslit_cargando);
     //       }
      //  }

		//      inicio Bartolo Herrera
        function f_carga_tipos_indicadores(){
        	var codTipoVinculacion = $("#CCODVIN").val();
        	var codImpuesto = $("#CCODIMP").val();
        	
        	if (!objUtiles.estaVacio(codTipoVinculacion) && !objUtiles.estaVacio(codImpuesto)){
                objAjax.invokeAsyncCGI("modal_axisper010.do", callbackAjaxCargarTiposIndica, "operation=ajax_busqueda_tip_indica&CCODVIN="+codTipoVinculacion+"&CCODIMP="+codImpuesto, this, objJsMessages.jslit_cargando);
            }
        }
//         fin Bartolo Herrera


	  
        function callbackAjaxCargarTiposIndica(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);            
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("CTIPIND");                
                var CTIPINDCombo = document.miForm.CTIPIND;
                objDom.borrarOpcionesDeCombo(CTIPINDCombo);
                objDom.addOpcionACombo("<%=Integer.MIN_VALUE%>", '- <axis:alt f="axisper010" c="SELECCTIPIND" lit="108341"/> - ', CTIPINDCombo, 0);
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
       		 objAjax.invokeAsyncCGI("modal_axisper010.do", callbackAjaxCargarTiposAgente, "operation=ajax_busqueda_tip_agente&CCODVIN="+
       	     $("#CCODVIN").val(), this, objJsMessages.jslit_cargando);
       	 }else
       		 {
       		 var CCODAGENCombo = document.miForm.CCODAGEN;
                objDom.borrarOpcionesDeCombo(CCODAGENCombo);
                objDom.addOpcionACombo("<%=Integer.MIN_VALUE%>", '- <axis:alt f="axisper010" c="SELECCTIPIND" lit="108341"/> - ', CCODAGENCombo, 0);
       		 }
       }
       
       function callbackAjaxCargarTiposAgente(ajaxResponseText){
           var doc=objAjax.domParse(ajaxResponseText);    
           if(!objAppMensajes.existenErroresEnAplicacion(doc)){
               var elementos = doc.getElementsByTagName("CATRIBU");                
               var CCODAGENCombo = document.miForm.CCODAGEN;
               objDom.borrarOpcionesDeCombo(CCODAGENCombo);
               objDom.addOpcionACombo("<%=Integer.MIN_VALUE%>",'- <axis:alt f="axisper010" c="SELECCCODAGEN" lit="108341"/> - ',CCODAGENCombo, 0);
			if (elementos.length > 0) {
				for (i = 0; i < elementos.length; i++) {
					var CCODAGEN = objDom.getValorNodoDelComponente(doc
							.getElementsByTagName("CATRIBU"), i, 0);
					var CATRIBU = objDom.getValorNodoDelComponente(doc
							.getElementsByTagName("TATRIBU"), i, 0);
					objDom.addOpcionACombo(CCODAGEN, CATRIBU, CCODAGENCombo,
							i + 1);
				}
			}
		}
	}
</script>


</head>
<body>




	<!-- Area de campos  -->
	<div class="seccion">
		<div class="separador">&nbsp;</div>
		<table class="mainModalDimensions base" align="center" cellpadding="0"
			cellspacing="0" style="height: 10px;">
			<tr>
				<th style="width: 34%; height: 0px"></th>
				<th style="width: 33%; height: 0px"></th>
				<th style="width: 33%; height: 0px"></th>
			</tr>

			<tr>
				<axis:ocultar f="axisper010" c="CCODVIN" dejarHueco="false">
					<td class="titulocaja"><b><axis:alt f="axisper010"
								c="LIT_CCODVIN" lit="3" /></b></td>
				</axis:ocultar>

				<axis:visible f="axisper010" c="CCODAGEN">
					<td class="titulocaja"><b><axis:alt f="axisper010"
								c="LIT_CCODAGEN" lit="4" /></b></td>
					<!-- Regimen fiscal -->
				</axis:visible>

			</tr>

			<tr>
				<axis:ocultar f="axisper010" c="CCODVIN" dejarHueco="false">
					<td class="campocaja"><select name="CCODVIN" id="CCODVIN"
						size="1" class="campowidthselect campo campotexto_ob"
						<axis:atr f="axisper010" c="CCODVIN" a="obligatorio=true"/>
						title="<axis:alt f="axisper010" c="CCODVIN" lit="101159"/>"
						onchange="f_carga_tipos_agentes(); f_cargar_propiedades_pantalla();">
							<option value="<%=Integer.MIN_VALUE%>">
								<axis:alt f="axisper010" c="SELECCIONAR" lit="108341" />
							</option>
							<c:forEach var="element" items="${__formdata.LSTTIPOVINCULO}">
								<option value="${element.CATRIBU}"
									<c:if test="${__formdata.TIPAGENTE == element.CATRIBU}"> selected = "selected"</c:if>>
									${element.TATRIBU}</option>
							</c:forEach>
					</select></td>


					<td class="campocaja"><select name="CCODAGEN" id="CCODAGEN"
						size="1" class="campowidthselect campo campotexto_ob">
							<axis:atr f="axisper010" c="CCODAGEN" a="obligatorio=true" />title="
							<axis:alt f="axisper010" c="CCODAGEN" lit="101159" />
							<option value="<%=Integer.MIN_VALUE%>">
								<axis:alt f="axisper010" c="SELECCIONAR" lit="108341" />
							</option>
							<c:forEach var="element" items="${__formdata.LSTTIPOAGENTE}">
								<option value="${element.CATRIBU}"
									<c:if test="${__formdata.TIPAGENTE == element.CATRIBU}"> selected = "selected"</c:if>>
									${element.TATRIBU}</option>

							</c:forEach>
					</select></td>

				</axis:ocultar>
			</tr>

			<tr>

				<axis:visible f="axisper010" c="CREGIMENFISCAL">
					<td class="titulocaja"><b><axis:alt f="axisper010"
								c="LIT_CREGFISCAL" lit="9902257" /></b></td>
					<!-- Regimen fiscal -->
				</axis:visible>

				<axis:visible f="axisper010" c="FEFECTO">
					<td class="titulocaja" id="LIT_FEFECTO"><b><axis:alt
								f="axisper010" c="FEFECTO" lit="100883" /></b></td>
				</axis:visible>

				<!-- INI CP0025M_SYS_PERS - JLTS - 21/11/2018 -- Se agrega el campo CTIPIVA -->
				<axis:ocultar f="axisper010" c="CTIPIVA" dejarHueco="false">
					<td class="titulocaja" colspan="2" id="tit_CTIPIVA"><b><axis:alt
								f="axisper010" c="CTIPIVA" lit="101340" /></b></td>
				</axis:ocultar>
				<!-- FIN CP0025M_SYS_PERS - JLTS - 21/11/2018 -->

			</tr>

			<tr>
				<axis:ocultar f="axisper010" c="CREGIMENFISCAL">
					<td class="campocaja"><select
						title="<axis:alt f="axisper010" c="CREGIMENFISCAL" lit="9902257" />"
						name="CREGFISCAL" id="CREGIMENFISCAL"
						<axis:atr f="axisper010" c="CREGIMENFISCAL" a="isInputText=false"/>
						size="1" class="campowidthselect campo campotexto"
						style="width: 90%;">&nbsp;
							<option value="<%=Integer.MIN_VALUE%>">-
								<axis:alt f="axisper010" c="SNV_COMBO" lit="1000348" /> -
							</option>
							<c:forEach var="element"
								items="${__formdata.listValores.regFisc}">
								<option value="${element.CREGFISCAL}"
									<c:if test="${element.CREGFISCAL == __formdata.CREGFISCAL}"> selected </c:if> />
                                                    ${element.TREGFISCAL} 
                                                </option>
							</c:forEach>
					</select></td>
				</axis:ocultar>

				<axis:visible f="axisper010" c="FEFECTO">
					<td class="campocaja"><jsp:useBean id="today" class="java.util.Date" /> <input type="text"
						onblur="javascript:f_formatdate(this,'')" formato="fecha"
						<axis:atr f="axisper010" c="FEFECTO" a="formato=fecha&modificable=true&isInputText=true"/>
						alt="<axis:alt f="axisper010" c="FEFECTO" lit="100883"/>"
						title="<axis:alt f="axisper010" c="FEFECTO" lit="100883"/>"
						name="FEFECTO" id="FEFECTO"
						value="<c:choose><c:when test="${empty __formdata.FEFECTO}"><fmt:formatDate pattern="dd/MM/yyyy" value="${today}"/></c:when><c:otherwise><fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEFECTO}"/></c:otherwise></c:choose>"
						style="width: 100px;" class="campowidthinput campo campotexto" />
						<axis:visible c="ICO_FEFECTO" f="axisper010">
							<a id="icon_FEFECTO" style="vertical-align: middle;"> <img
								alt="<axis:alt f="axisper010" c="SELECT" lit="108341"/>"
								title="<axis:alt f="axisper010" c="ICO_FEFECTO" lit="100883" />"
								src="images/calendar.gif" />
							</a>
						</axis:visible></td>
				</axis:visible>

				<!-- INI CP0025M_SYS_PERS - JLTS - 21/11/2018 -- Se agrega el campo CTIPIVA -->
				<axis:ocultar f="axisper010" c="CTIPIVA" dejarHueco="false">
					<td class="campocaja" colspan="2" id="td_CTIPIVA"><select
						name="CTIPIVA" id="CTIPIVA" size="1"
						class="campowidthselect campo campotexto" style="width: 79%;"
						<axis:atr f="axisper010" c="CTIPIVA" a="isInputText=false"/>
						title="<axis:alt f="axisper010" c="CTIPIVA" lit="101340"/>"
						alt="<axis:alt f="axisper010" c="CTIPIVA" lit="101340"/>">&nbsp;
							<c:if test="${modoModificable}">
								<option value="<%=Integer.MIN_VALUE%>">-
									<axis:alt f="axisper010" c="SELEC" lit="1000348" /> -
								</option>
							</c:if>
							<c:forEach var="element"
								items="${__formdata.listValores.LSTTIPOIVA}">
								<option value="${element.CTIPIVA}"
									<c:if test="${__formdata.CTIPIVA == element.CTIPIVA}"> selected = "selected"</c:if>
									<c:if test="${__formdata.CTIPIVA == element.CTIPIVA}"> selected = "selected"</c:if>>
									${element.TTIPIVA}</option>
							</c:forEach>
					</select></td>
				</axis:ocultar>
				<!-- FIN CP0025M_SYS_PERS - JLTS - 21/11/2018 -->

			</tr>




		</table>



	</div>


</body>
