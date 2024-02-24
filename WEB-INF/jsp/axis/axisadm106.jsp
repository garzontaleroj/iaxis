
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
		objUtiles.ejecutarFormulario("flujodetrabajo.do?forigen=axis_axisadm106", "cancelar", document.miForm, "_self");
	}     
	

	//**********************************************//
	
	//Buscar
	function f_but_buscar(){	
		
		//var CINTERMEDIARIO = document.getElementById("CINTERMEDIARIO").value;
       	var CTOMADOR = document.getElementById("CTOMADOR_TEXT").value;
  	
		objUtiles.ejecutarFormulario("axis_axisadm106.do?","form", document.miForm, "_self",objJsMessages.jslit_cargando);
		
	}
	
	function f_but_imprimir() {
		     
		//INI IAXIS BUG 5215 AABG - SE  BLOQUEA BOTON PARA SOLO HACER 1 CLICK
		document.getElementById('but_imprimir').setAttribute("disabled","disabled");
		//FIN IAXIS BUG 5215 AABG - SE  BLOQUEA BOTON PARA SOLO HACER 1 CLICK
	        var table = document.getElementById("ROW");
	        var val = "";
	        for (var i = 1, row; row = table.rows[i]; i++) {
	        // INI IAXIS-4136 JRVG  23/04/2020 
	            var n = document.getElementById("C_RECIBO_"+i).innerText;
	            var s = document.getElementById("C_SEGU_"+i).innerText;
	            var o = $("#C_OBS_"+i).val();
	           	var c = document.getElementById("selectedClausula_"+i).value;
		
	            //INI IAXIS BUG 5215 AABG - SE INSERTA UNICAMENTE LOS QUE TIENEN OBSERVACION
	            //INI IAXIS-10514 JRVG  02/04/2020 SE INSERTAN TODAS LAS OBSERVACIONES
	            // if(obs != null && obs != ""){	
	        	 val = val+"N="+n+">O="+o+">C="+c+"\n";
	            // INI IAXIS-4136 JRVG  23/04/2020
	            //}
	            // FIN IAXIS-10514 JRVG  02/04/2020 SE INSERTAN TODAS LAS OBSERVACIONES
	            // INI IAXIS BUG 5215 AABG - SE INSERTA UNICAMENTE LOS QUE TIENEN OBSERVACION 	
	        }	       
		   objAjax.invokeAsyncCGI("axis_axisadm106.do", callbackAjaxBuscarGrabarImprimir, "operation=ajax_ins_obs&val="+val , this, objJsMessages.jslit_cargando);
		   //console.log("Observaciones : "+val);
    }   
	
	 function callbackAjaxBuscarGrabarImprimir(ajaxResponseText){

        var doc=objAjax.domParse(ajaxResponseText);     
        // INI IAXIS-4136 JRVG  23/04/2020
        // var url="axis_axisadm106.do?operation=descargar&CTOMADOR="+document.getElementById("SPERSON").value+"&CINTERMEDIARIO="+document.getElementById("CINTERMEDIARIO").value;  
        var url="axis_axisadm106.do?operation=descargar&CTOMADOR="+document.getElementById("SPERSON").value; 
        // FIN IAXIS-4136 JRVG  23/04/2020
        //INI IAXIS 5215 AABG: Esperar 1 segundos para garantizar que se cierre el primer loader
        setTimeout(function(){         	
        	objAjax.invokeAsyncCGI_JSON(url, callbackReporte, "<axis:alt f='axisadm106' c='MSG_CARGAR' lit='9905686'/>")
        	}, 1000
        );
      //FIN IAXIS 5215 AABG: Esperar 1 segundos para garantizar que se cierre el primer loader
			
     }
	 
	 function callbackReporte (p) {	  
	
	        objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
	        var odiv_OBFICHERO=document.getElementById("div_OBFICHERO");
	        var div_OBFICHEROcontenido="";
	        div_OBFICHEROcontenido=div_OBFICHEROcontenido+"<table align=\"center\" class=\"dsptgtable\">";
	        
	        if (p.JSON2.LIST_FICHEROS.OFICHERO!=null) {   
	        	
	        	var ficherolist  = p.JSON2.LIST_FICHEROS.OFICHERO;                       
	            var str2 = ficherolist.replace(/barrainvertida/gi, "\\");   
	   				//var str2 = document.getElementById("SPERSON").value;	   				
	            objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+str2); 
	          //INI IAXIS BUG 5215 AABG - SE  DESBLOQUEA BOTON PARA SOLO HACER 1 CLICK
	            document.getElementById('but_imprimir').removeAttribute("disabled");
	          //FIN IAXIS BUG 5215 AABG - SE  DESBLOQUEA BOTON PARA SOLO HACER 1 CLICK
	           // objUtiles.abrirModal("axislist003", "src", "axis_axislist003.do?operation=form&CMODO=GENERAL&CEMPRES=24&SPRODUC=0&PTOMADOR="+str2+"&REPORTE=Cuenta cobro");
	        } 
	    }

	 
	 function f_cerrar_axislist003() {
         objUtiles.cerrarModal("axislist003");
         f_but_salir();
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
            
            
			if (!objUtiles.estaVacio(SPERSON)){
            	
				objUtiles.ejecutarFormulario("axis_axisadm106.do?","actualizar_persona", document.miForm, "_self",objJsMessages.jslit_cargando);
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
	
	// INI IAXIS-4136 JRVG  23/04/2020
	 function f_mod_tipimp(id, check) {
			
			objDom.setValorPorId("selectedClausula_" + id, ((check.checked) ? 1 : 0));
			var check = document.getElementById("selectedClausula_"+id).value;
		 }
	
	 function ChequearTodosBut() {

			for (var i = 0; i < document.forms["miForm"].elements.length; i++) {

				var elemento = document.forms[0].elements[i];				
				if (elemento.type == "checkbox") {
					elemento.checked = true;
				}

				var x = elemento.id;
				if (x.match(/selectedClausula_.*/))
					objDom.setValorPorId(elemento.id, 1);		
			}	
		      }
	 
	 function DesChequearTodosBut() {
			for (var i = 0; i < document.forms["miForm"].elements.length; i++) {
				var elemento = document.forms[0].elements[i];
				if (elemento.type == "checkbox") {
					elemento.checked = false;
				}

				var x = elemento.id;
				if (x.match(/selectedClausula_.*/))
					objDom.setValorPorId(elemento.id, 0);			
			}
	         	}
		
	// FIN IAXIS-4136 JRVG  23/04/2020
	
</script>
</head>
<body onload="f_onload()">
	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>
	
	<c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axissin064" c="TITULO_IMPR" lit="1000205" />|true</c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo">
               <axis:alt f="axislist012" c="TIT_AXISLIST003" lit="9000745" />
            </c:param>
            <c:param name="nid" value="axislist003" />
         </c:import>       
    
	<c:import url="../include/titulo_nt.jsp">
		<c:param name="producto">			
			<axis:alt f="axis_axisadm106" c="TITULO" lit="9903449" /> 
		</c:param>
		<c:param name="formulario">						
			 <axis:alt f="axis_axisadm106" c="TITULO" lit="9903449" /> 
		</c:param>
		<c:param name="form">axis_axisadm106</c:param>
	</c:import>

	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axis_axisadm106" c="TITULO" lit="89905796" />
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
				<axis:alt c="TITULO_021" f="axis_axisadm106" lit="1000178" />
			</c:param>
			<c:param name="nid" value="axisper021" />
		</c:import>

	
	
	
	<form name="miForm" id="miForm" action="" method="POST">
		<input type="hidden" name="operation" value="" />
		<input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}" />
	
	

		<table class="seccion" style="width: 90%;" align="center">
			
			
			 <axis:visible f="axis_axisadm106" c="CTOMADOR"> 
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axis_axisadm106" c="CTOMADOR" lit="109360" /></b>
                                    </td>
                            </axis:visible>                                                                                                        						
                            
                             <!--INI IAXIS-4136 JRVG  23/04/2020-->
							 <!-- <axis:visible f="axis_axisadm106" c="CINTERMEDIARIO"> 
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axis_axisadm106" c="CINTERMEDIARIO" lit="9902363" /></b>
                                    </td>
                            </axis:visible>  -->             
                            <!--FIN IAXIS-4136 JRVG  23/04/2020-->   
                             
							</tr>                 
                            <tr>
                          
                               <axis:ocultar f="axis_axisadm106" c="CTOMADOR" dejarHueco="false"> 
                               <td class="campocaja" colspan="2">   
                                    <input type="text" style="display : none !important" name="NNUMIDE" id="NNUMIDE" title="<axis:alt f="axis_axisadm106" c="NNUMIDE" lit="9902363" />" value="${__formdata.NNUMIDE}" class="campowidthinput campo campotexto" style="width:70%" formato="entero"
                                        <axis:atr f="axis_axisadm106" c="NNUMIDE" a="modificable=true"/> />
                                 	
                                        <input type="text" name="CTOMADOR_TEXT" id="CTOMADOR_TEXT" title="<axis:alt f="axis_axisadm106" c="CTOMADOR" lit="109360" />" value="${__formdata.TOMADOR}" class="campowidthinput campo campotexto" style="width:70%" formato="entero"
                                        <axis:atr f="axis_axisadm106" c="CTOMADOR_TEXT" a="modificable=true&obligatorio=true"/>/>
                                        <img border="0" id="CTOMADOR_TEXTT_IMG" src="images/find.gif" onclick="f_abrir_axisper021()" style="cursor: pointer">
                                       
                                                                           
                                    </td> 
                                 <!--INI IAXIS-4136 JRVG  23/04/2020-->                                   
                                 <!--   <td class="campocaja" colspan="2">   
                                    <input type="text" name="CINTERMEDIARIO" id="CINTERMEDIARIO" title="<axis:alt f="axis_axisadm106" c="CINTERMEDIARIO" lit="9902363" />" value="${__formdata.INTERMEDIARIO}" class="campowidthinput campo campotexto" style="width:70%" formato="entero"
                                        <axis:atr f="axis_axisadm106" c="CINTERMEDIARIO" a="modificable=true"/> onchange="f_actualizar_agente()" />
                                 		<img border="0" id="CINTERMEDIARIO_IMG" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                        
                                    </td> --> 
                                  <!--FIN IAXIS-4136 JRVG  23/04/2020--> 
                                     
                            	<axis:visible f="axis_axisadm106" c="BT_BUSCAR">
                                    <td align="right">
                                        <input type="button" class="boton" id="but_buscarPolizas" value="<axis:alt f="axis_axisadm106" c="BT_BUSCAR" lit="100797" />" onclick="f_but_buscar()" />
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
				<td>
				    <!--INI IAXIS-4136 JRVG  23/04/2020--> 
				    <c:set var="title0"><axis:alt f="axis_axisadm106" c="LIT_NUM" lit="800440" /></c:set> 
				    <c:set var="title1"><axis:alt f="axis_axisadm106" c="SUCURSAL" lit="9909330" /> </c:set> 
					<c:set var="title2"><axis:alt f="axis_axisadm106" c="C_NPOLIZA" lit="9903659" /></c:set> 
					<c:set var="title3"><axis:alt f="axis_axisadm106" c="C_DIAN" lit="101300" /></c:set>
					<c:set var="title4"><axis:alt f="axis_axisadm106" c="C_RECIBO" lit="100895" /></c:set>
					<c:set var="title5"><axis:alt f="axis_axisadm106" c="C_PRIMA" lit="9907732" /></c:set>
                    <c:set var="title6"><axis:alt f="axis_axisadm106" c="PRIMAME" lit="89906325" /></c:set>
                    <c:set var="title7"><axis:alt f="axis_axisadm106" c="TRM" lit="9909323" /></c:set>                       
                    <c:set var="title8"><axis:alt f="axis_axisadm106" c="IVA" lit="101515" /></c:set>
                    <c:set var="title9"><axis:alt f="axis_axisadm106" c="GASTOS" lit="108480" /></c:set>
                    <c:set var="title10"><axis:alt f="axis_axisadm106" c="TOTAL" lit="111475" /></c:set>                        
                    <c:set var="title11"><axis:alt f="axis_axisadm106" c="MAD" lit="89906326" /></c:set>
                    <c:set var="title12"><axis:alt f="axis_axisadm106" c="C_OBS" lit="101162" /></c:set>
                    <c:set var="title13"><axis:alt f="axis_axisadm106" c="C_SEGU" lit="9002215" /></c:set>
                    
                    
				     <%int contador = 1; %>
								
					<div class="displayspaceGrande">
						<display:table name="${__formdata.LISTAPOLIZA}" id="ROW" export="false"						
							class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="descending"
							requestURI="axis_axisadm106.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
							<%@ include file="../include/displaytag.jsp"%>
						
							<display:column title="${title0}" sortProperty="LIT_NUM" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspIcons">
												<input
													onclick="javascript:f_mod_tipimp('<%= contador %>',this)"
													type="checkbox" name="selectedClausula_<%= contador %>" 
													id="selectedClausula_<%= contador %>"  value="0"												
													<c:if test="${ROW.C_SEGU}==1}">checked</c:if>  
													      type="checkbox" name="selectedClausula_<%= contador %>"  
													      id="selectedClausula_<%= contador %>" value="" /> 												
											</div>
							</display:column>

							<display:column title="${title1}" sortProperty="SUCURSAL" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.SUCURSAL}</div>
							</display:column>

							<display:column title="${title2}" sortProperty="C_NPOLIZA" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.C_NPOLIZA}</div>
							</display:column>

							<display:column title="${title3}" sortProperty="C_DIAN" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.C_DIAN}</div>
							</display:column>

							<display:column title="${title4}" sortProperty="C_RECIBO" sortable="true"
								headerClass="sortable" media="html" autolink="false"> 
								<div class="dspText"  name="C_RECIBO_<%= contador %>"  
								 id="C_RECIBO_<%= contador %>" >${ROW.C_RECIBO}</div>
							</display:column>
							<display:column title="${title5}" sortProperty="C_PRIMA" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.C_PRIMA}</div>
							</display:column>
							<display:column title="${title6}" sortProperty="PRIMAME" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.PRIMAME}</div>
							</display:column>
							<display:column title="${title7}" sortProperty="TRM" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.TRM}</div>
							</display:column>
							<display:column title="${title8}" sortProperty="IVA" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.IVA}</div>
							</display:column>
							<display:column title="${title9}" sortProperty="GASTOS" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.GASTOS}</div>
							</display:column>
							<display:column title="${title10}" sortProperty="TOTAL" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.TOTAL}</div>
							</display:column>
							<display:column title="${title11}" sortProperty="MAD" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.MAD}</div>
							</display:column>
							<display:column title="${title12}" sortProperty="C_OBS" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								  <input  value="${ROW.C_OBS}" type="text" name="C_OBS_<%= contador %>"  id="C_OBS_<%= contador %>"/>
							</display:column>
							<display:column title="${title13}" headerClass="sortable"  media="html"  autolink="false">
								<div class="dspText" name="C_SEGU_<%= contador %>"  id="C_SEGU_<%= contador %>" >${ROW.C_SEGU}</div>
							</display:column>
							
							<%contador++;%>
											
						</display:table>
					</div>
					
					</td>
			  </tr>
			  <tr> <td >
			           <input type="button" onclick="ChequearTodosBut()" class="boton"
								value="<axis:alt f="axiadm102" c="LIT_BUT_SELTODOS" lit="9000756"/>" />
						<input type="button" onclick="DesChequearTodosBut()" class="boton"
								value="<axis:alt f="axiadm102" c="LIT_BUT_DESELTODOS" lit="9000757"/>" />
				  </td>

	         </tr>
	       
	       <!--FIN IAXIS-4136 JRVG  23/04/2020--> 
	       	
		</table>


		<div class="separador">&nbsp;</div>

		<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axis_axisadm106</c:param>
			<c:param name="f">axis_axisadm106</c:param>
			<c:param name="f">axis_axisadm106</c:param>
			<c:param name="__botones">cancelar,imprimir</c:param>
		</c:import>

	</form>
	<c:import url="../include/mensajes.jsp" />
</body>
</html>