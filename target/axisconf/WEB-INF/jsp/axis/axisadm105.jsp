
<%
	/* Revision:# taFHfb2FxxkbF9bHiNMuhA== # */
%>

<%
	/*
	*  Fichero: axiscga002.jsp
	*  Fecha: 03/02/2009
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
<style>
.bold {
	font-weight: bold;
	font-size: 10px;
}

.campo {
	width: 200px;
}
</style>
<script language="Javascript" type="text/javascript">
	/****************************************************************************************/
	/*********************************** NAVEGACION *****************************************/
	/****************************************************************************************/

	function f_onload() {
		
		Calendar.setup({
			inputField : "FDOCINI",
			ifFormat : "%d/%m/%Y",
			button : "icon_FDOCINI",
			singleClick : true,
			firstDay : 1
		});
		Calendar.setup({
			inputField : "FDOCFIN",
			ifFormat : "%d/%m/%Y",
			button : "icon_FDOCFIN",
			singleClick : true,
			firstDay : 1
		});
		Calendar.setup({
			inputField : "FCONTINI",
			ifFormat : "%d/%m/%Y",
			button : "icon_FCONTINI",
			singleClick : true,
			firstDay : 1
		});
		Calendar.setup({
			inputField : "FCONTFIN",
			ifFormat : "%d/%m/%Y",
			button : "icon_FCONTFIN",
			singleClick : true,
			firstDay : 1
		});
		
		Calendar.setup({
			inputField : "PERCORTE",
			ifFormat : "%d/%m/%Y",
			button : "icon_PERCORTE",
			singleClick : true,
			firstDay : 1
		});
		
		f_cargar_propiedades_pantalla();
                
	}
        
	
  

	function isNumberKey(evt){
	       var charCode = (evt.which) ? evt.which : event.keyCode
	       if (charCode > 31 && (charCode < 48 || charCode > 57))
	           return false;
	        return true;
	   }

	function f_but_cancelar(){
		objUtiles.ejecutarFormulario("flujodetrabajo.do?forigen=axis_axisadm105", "cancelar", document.miForm, "_self");
	}     
	

	//**********************************************//
	
	//Buscar
	function f_but_buscar(){	
		
		var CINTERMEDIARIO = document.getElementById("CINTERMEDIARIO").value;
       	var CTOMADOR = document.getElementById("CTOMADOR_TEXT").value;
  
       	
		objUtiles.ejecutarFormulario("axis_axisadm105.do?","form", document.miForm, "_self",objJsMessages.jslit_cargando);
		
	}
	
	function f_but_imprimir() {
		     
	        var table = document.getElementById("ROW");
	        var val = "";
	        for (var i = 1, row; row = table.rows[i]; i++) {
	        		        	
	           	var nrecibo = row.cells[3].innerText;
	           	var sseguro = row.cells[12].innerText;
	           	var obs = row.cells[11].children[0].value;	           	 
	           	val = val+"NRECIBO="+nrecibo+">>SSEGURO="+sseguro+">>OBS="+obs+"\n";	           	          
	        }	        	    
		   objAjax.invokeAsyncCGI("axis_axisadm105.do", callbackAjaxBuscarGrabarImprimir, "operation=ajax_ins_obs&val="+val , this, objJsMessages.jslit_cargando);	
	
    }  
	
	 function callbackAjaxBuscarGrabarImprimir(ajaxResponseText){

        var doc=objAjax.domParse(ajaxResponseText);
        
        
        var url="axis_axisadm105.do?operation=descargar&CTOMADOR="+document.getElementById("SPERSON").value+"&CINTERMEDIARIO="+document.getElementById("CINTERMEDIARIO").value;             
        
        objAjax.invokeAsyncCGI_JSON(url, callbackReporte, "<axis:alt f='axisadm105' c='MSG_CARGAR' lit='9905686'/>")
			
      
     }
	 
	 function callbackReporte (p) {	  
	
	        objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
	        var odiv_OBFICHERO=document.getElementById("div_OBFICHERO");
	        var div_OBFICHEROcontenido="";
	        div_OBFICHEROcontenido=div_OBFICHEROcontenido+"<table align=\"center\" class=\"dsptgtable\">";
	        
	        if (p.JSON2.LISTAPOLIZA.OFICHERO!=null) {   
	        	
	        	var polizalist = p.JSON2.LISTAPOLIZA.OFICHERO;                       
	            var str2 = polizalist.replace(/barrainvertida/gi, "\\");    
	   
	            objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+str2); 
	        } 
	    }

	 
	 
	
	
	function f_abrir_axisctr014() {
        objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=SIMULACION");
    }
    function f_cerrar_axisctr014() {
        objUtiles.cerrarModal("axisctr014")
    }    
    function f_aceptar_axisctr014 (CINTERMEDIARIO){
    	
        objDom.setValorPorId("CINTERMEDIARIO", CINTERMEDIARIO);
    	
        f_cerrar_axisctr014();                
    }
    	
	
	function f_abrir_axisper021() {
		objUtiles.abrirModal("axisper021", "src",
				"modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS");		
	}
    
    function f_cerrar_axisper021() {
        objUtiles.cerrarModal("axisper021")
    }
    
	function f_aceptar_persona(SPERSON, CINTERMEDIARIO, SNIP, modal) {
		try {
			objUtiles.cerrarModal("axisper021");
			objDom.setValorPorId("SPERSON", SPERSON);
            
            
			//alert(SPERSON);
			if (!objUtiles.estaVacio(SPERSON)){
            	//objAjax.invokeAsyncCGI("axis_axisadm105.do", callbackAjaxActualizarPersona, "operation=actualizar_persona&SPERSON="+SPERSON+"&CAGENTE="+CINTERMEDIARIO, this, objJsMessages.jslit_actualizando_registro);
				objUtiles.ejecutarFormulario("axis_axisadm105.do?","actualizar_persona", document.miForm, "_self",objJsMessages.jslit_cargando);
            }

		} catch (e) {
			if (isDebugAjaxEnabled == "true")
				alert(e.name + " " + e.message);
		}
	}

	function callbackAjaxActualizarPersona(ajaxResponseText){
		
        var doc=objAjax.domParse(ajaxResponseText);
        console.log(doc);
        if(!objAppMensajes.existenErroresEnAplicacion(doc)){
            var NNUMIDE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0);
            var NOMBRECompleto = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
            var SPERSON = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0);
            
            objDom.setValorPorId("CTOMADOR_TEXT", NOMBRECompleto);   
            objDom.setValorPorId("SPERSON", SPERSON);
        }
    }
	
	
	
</script>
</head>
<body onload="f_onload()">
	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>
	
	<c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axissin064" c="TITULO_IMPR" lit="1000205" />|true</c:param>
    </c:import>
    
	<c:import url="../include/titulo_nt.jsp">
		<c:param name="producto">			
			<axis:alt f="axis_axisadm105" c="TITULO" lit="9903449" /> 
		</c:param>
		<c:param name="formulario">						
			 <axis:alt f="axis_axisadm105" c="TITULO" lit="9903449" /> 
		</c:param>
		<c:param name="form">axis_axisadm105</c:param>
	</c:import>

	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axis_axisadm105" c="TITULO" lit="89905796" />
		</c:param>
		<c:param name="nid" value="axisgca014" />
	</c:import>
	 <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr001" c="TIT_AXISCTR014" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
                 <c:param name="titulo"><axis:alt f="axisctr001" c="TITULO_021" lit="1000178" /></c:param>
                <c:param name="nid" value="axisper021" />
        </c:import>
        
     <c:import url="../include/modal_estandar.jsp">
			<c:param name="titulo">
				<axis:alt c="TITULO_021" f="axis_axisadm105" lit="1000178" />
			</c:param>
			<c:param name="nid" value="axisper021" />
		</c:import>

	
	
	
	<form name="miForm" id="miForm" action="" method="POST">
		<input type="hidden" name="operation" value="" />
		<input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}" />
	
	

		<table class="seccion" style="width: 90%;" align="center">
			
			
			 <axis:visible f="axis_axisadm105" c="CTOMADOR"> 
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axis_axisadm105" c="CTOMADOR" lit="109360" /></b>
                                    </td>
                            </axis:visible>                                                                                                        						
                            
							<axis:visible f="axis_axisadm105" c="CINTERMEDIARIO"> 
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axis_axisadm105" c="CINTERMEDIARIO" lit="9902363" /></b>
                                    </td>
                            </axis:visible>               
                                 
							</tr>                 
                            <tr>
                          
                               <axis:ocultar f="axis_axisadm105" c="CTOMADOR" dejarHueco="false"> 
                               <td class="campocaja" colspan="2">   
                                    <input type="text" style="display : none !important" name="NNUMIDE" id="NNUMIDE" title="<axis:alt f="axis_axisadm105" c="NNUMIDE" lit="9902363" />" value="${__formdata.NNUMIDE}" class="campowidthinput campo campotexto" style="width:70%" formato="entero"
                                        <axis:atr f="axis_axisadm105" c="NNUMIDE" a="modificable=true"/> />
                                 	
                                        <input type="text" name="CTOMADOR_TEXT" id="CTOMADOR_TEXT" title="<axis:alt f="axis_axisadm105" c="CTOMADOR" lit="109360" />" value="${__formdata.TOMADOR}" class="campowidthinput campo campotexto" style="width:70%" formato="entero"
                                        <axis:atr f="axis_axisadm105" c="CTOMADOR_TEXT" a="modificable=true&obligatorio=true"/>/>
                                        <img border="0" id="CTOMADOR_TEXTT_IMG" src="images/find.gif" onclick="f_abrir_axisper021()" style="cursor: pointer">
                                       
                                                                           
                                    </td>                                    
                                    <td class="campocaja" colspan="2">   
                                    <input type="text" name="CINTERMEDIARIO" id="CINTERMEDIARIO" title="<axis:alt f="axis_axisadm105" c="CINTERMEDIARIO" lit="9902363" />" value="${__formdata.INTERMEDIARIO}" class="campowidthinput campo campotexto" style="width:70%" formato="entero"
                                        <axis:atr f="axis_axisadm105" c="CINTERMEDIARIO" a="modificable=true"/> onchange="f_actualizar_agente()" />
                                 		<img border="0" id="CINTERMEDIARIO_IMG" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                        
                                    </td>
                                    
                                     
                            	<axis:visible f="axis_axisadm105" c="BT_BUSCAR">
                                    <td align="right">
                                        <input type="button" class="boton" id="but_buscarPolizas" value="<axis:alt f="axis_axisadm105" c="BT_BUSCAR" lit="100797" />" onclick="f_but_buscar()" />
                                    </td>
                                </axis:visible>
                       
                                    
                                     
                               </axis:ocultar>
                           
                             </tr>
                             
		
		</table>

		<br /> <br />

		<table class="seccion" style="width: 90%;" align="center">
			<tr>
				<td><span class="bold"><axis:alt f="axisgca003" c="TITRES" lit="111046"></axis:alt></span>
					<div style="clear: both;">
						<hr class="titulo">
						</hr>
					</div></td>
			</tr>
			<tr>
				<td><c:set var="title0"><axis:alt f="axis_axisadm105" c="SUCURSAL" lit="9909330" /> </c:set> 
					<c:set var="title1"><axis:alt f="axis_axisadm105" c="C_NPOLIZA" lit="9903659" /></c:set> 
					<c:set var="title2"><axis:alt f="axis_axisadm105" c="C_DIAN" lit="101300" /></c:set>
					<c:set var="title3"><axis:alt f="axis_axisadm105" c="C_RECIBO" lit="100895" /></c:set>
					<c:set var="title4"><axis:alt f="axis_axisadm105" c="C_PRIMA" lit="9907732" /></c:set>
                    <c:set var="title5"><axis:alt f="axis_axisadm105" c="PRIMAME" lit="89906325" /></c:set>
                    <c:set var="title6"><axis:alt f="axis_axisadm105" c="TRM" lit="9909323" /></c:set>                       
                    <c:set var="title7"><axis:alt f="axis_axisadm105" c="IVA" lit="101515" /></c:set>
                    <c:set var="title8"><axis:alt f="axis_axisadm105" c="GASTOS" lit="108480" /></c:set>
                    <c:set var="title9"><axis:alt f="axis_axisadm105" c="TOTAL" lit="111475" /></c:set>                        
                    <c:set var="title10"><axis:alt f="axis_axisadm105" c="MAD" lit="89906326" /></c:set>
                    <c:set var="title11"><axis:alt f="axis_axisadm105" c="C_OBS" lit="101162" /></c:set>
                    <c:set var="title12"><axis:alt f="axis_axisadm105" c="C_SEGU" lit="9002215" /></c:set>
                    
				
					<div class="displayspaceGrande">
						<display:table name="${__formdata.LISTAPOLIZA}" id="ROW" export="false"						
							class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending"
							requestURI="axis_axisadm105.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
							<%@ include file="../include/displaytag.jsp"%>

							<display:column title="${title0}" sortProperty="SUCURSAL" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.SUCURSAL}</div>
							</display:column>

							<display:column title="${title1}" sortProperty="C_NPOLIZA" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.C_NPOLIZA}</div>
							</display:column>

							<display:column title="${title2}" sortProperty="C_DIAN" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.C_DIAN}</div>
							</display:column>

							<display:column title="${title3}" sortProperty="C_RECIBO" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.C_RECIBO}</div>
							</display:column>
							<display:column title="${title4}" sortProperty="C_PRIMA" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.C_PRIMA}</div>
							</display:column>
							<display:column title="${title5}" sortProperty="PRIMAME" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.PRIMAME}</div>
							</display:column>
							<display:column title="${title6}" sortProperty="TRM" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.TRM}</div>
							</display:column>
							<display:column title="${title7}" sortProperty="IVA" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.IVA}</div>
							</display:column>
							<display:column title="${title8}" sortProperty="GASTOS" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.GASTOS}</div>
							</display:column>
							<display:column title="${title9}" sortProperty="TOTAL" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.TOTAL}</div>
							</display:column>
							<display:column title="${title10}" sortProperty="MAD" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.MAD}</div>
							</display:column>
							<display:column title="${title11}" sortProperty="C_OBS" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								
								  <input  value="${ROW.C_OBS}" type="text" id="OBSERVACIONES_TXT" name="OBSERVACIONES_TXT"/>
							</display:column>
							<display:column title="${title12}" headerClass="sortable"  media="html"  autolink="false">
								<div class="dspText">${ROW.C_SEGU}</div>
							</display:column>
											
						</display:table>
					</div></td>
			</tr>
		</table>

	


		<div class="separador">&nbsp;</div>

		<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axis_axisadm105</c:param>
			<c:param name="f">axis_axisadm105</c:param>
			<c:param name="f">axis_axisadm105</c:param>
			<c:param name="__botones">cancelar,imprimir</c:param>
		</c:import>

	</form>
	<c:import url="../include/mensajes.jsp" />
</body>
</html>