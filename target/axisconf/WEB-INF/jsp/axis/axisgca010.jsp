<%/* Revision:# aX1r+9q6/60CUP9G2S5rLQ== # */%>

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
		
		f_cargar_propiedades_pantalla();
                
	}
        

      
     
  

	function isNumberKey(evt){
	       var charCode = (evt.which) ? evt.which : event.keyCode
	       if (charCode > 31 && (charCode < 48 || charCode > 57))
	           return false;
	        return true;
	   }

	
	//**********************************************//
	//***************SUCURSAL********************//
	function f_abrir_axisctr014() {  
		objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
      }
            
      function f_cerrar_axisctr014() {
          objUtiles.cerrarModal("axisctr014");
      }
      
      function f_aceptar_axisctr014 (CAGENTE){                      
          f_cerrar_axisctr014();
          objAjax.invokeAsyncCGI("modal_axisctr019.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
      }
      
      function callbackAjaxCambiarAgente(ajaxResponseText){
          var doc=objAjax.domParse(ajaxResponseText); 
          if(!objAppMensajes.existenErroresEnAplicacion(doc)){
              $("#CSUCURSAL").val(objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0));
              $("#TSUCURSAL").val(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0)); 
          }
      }
	//**********************************************//
	//Nuevo
	function f_but_cancelar(){		
		parent.f_cerrar_axisgca010();
	} 
	
	//Finaliza Acta
	function f_but_9910395(){
		objUtiles.ejecutarFormulario("axis_axisgca010.do?action=FINALIZAR","form", document.miForm, "_self",objJsMessages.jslit_cargando);

	}
	//Exportar Acta
	function f_but_9910396(){
		var sidcon = "${__formdata.SIDCON}";
		f_imprimir_fitxer(sidcon);
		
		
	}
	
	function f_abrir_axisgca012(NCONCIACT, OCULTAC) {
		objUtiles.abrirModal("axisgca012","src","axis_axisgca012.do?operation=form&action=FORM&NCONCIACT="+NCONCIACT+"&OCULTAC="+OCULTAC);
    }
	function f_cerrar_axisgca012(){
		objUtiles.cerrarModal("axisgca012");
	}
	
	function guardar_axisgca012(SIDCON,NCONCIACT,CCONACTA,CRESPAGE,CRESPCIA,FSOLUCION,TOBS){
		f_cerrar_axisgca012();
		
		objAjax.invokeAsyncCGI("axis_axisgca010.do", callbackAjaxForm, "operation=form&action=GUARDAREVIADOS&SIDCON="+SIDCON+"&NCONCIACT="+NCONCIACT
				+"&CCONACTA="+CCONACTA
				+"&CRESPAGE="+CRESPAGE
				+"&CRESPCIA="+CRESPCIA
				+"&FSOLUCION="+FSOLUCION
				+"&TOBS="+TOBS, this, objJsMessages.jslit_actualizando_registro);			
	}
	
	function callbackAjaxForm(ajaxResponseText){
		objUtiles.ejecutarFormulario("axis_axisgca010.do?action=FORM","form", document.miForm, "_self",objJsMessages.jslit_cargando);
    }
	
	function guardarcantidad(id,NCONCIACT){
		objAjax.invokeAsyncCGI("axis_axisgca010.do", callbackAjax, "operation=form&action=GUARDARCANTIDADN&NCONCIACT="+NCONCIACT
				+"&NCANTIDAD="+$("#NCANTIDAD"+id).val()+"&NVALOR="+$("#NVALOR"+id).val(), this, objJsMessages.jslit_actualizando_registro);	
	}   
	function guardarvalor(id,NCONCIACT){
		objAjax.invokeAsyncCGI("axis_axisgca010.do", callbackAjax, "operation=form&action=GUARDARVALOR&NCONCIACT="+NCONCIACT
				+"&NCANTIDAD="+$("#NCANTIDAD"+id).val()+"&NVALOR="+$("#NVALOR"+id).val(), this, objJsMessages.jslit_actualizando_registro);		
	} 
	
	function callbackAjax(){}
	
	function f_imprimir_fitxer(SIDCON){
		if(SIDCON!=null){
			objAjax.invokeAsyncCGI_JSON("axis_axisgca010.do?operation=descargar_reporte&SIDCON="+SIDCON, callBack_miajaxjson, "<axis:alt f='axiscga002' c='MSG_CARGAR' lit='9905686'/>")
		}
	} 

	function callBack_miajaxjson(p) {
        
        objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");

        //hay que actualizar la lista de resulotados xxx
        var odiv_OBFICHERO=document.getElementById("div_OBFICHERO");
        odiv_OBFICHERO.innerHTML="";
        var div_OBFICHEROcontenido="";
        div_OBFICHEROcontenido=div_OBFICHEROcontenido+"<table align=\"center\" class=\"dsptgtable\">";

        if (p.JSON2.LIST_FICHEROS!=null) {
        	div_OBFICHEROcontenido=div_OBFICHEROcontenido+"<tr><td><a href=\"javascript:f_imprimir_fitxerv()\">"+p.JSON2.LIST_FICHEROS.ONOMFICHERO+"</a><input type=\"hidden\"   name=\"fileAbsolutePath"+"\" id=\"fileAbsolutePath"+"\" value=\""+p.JSON2.LIST_FICHEROS.OFICHERO+"\"/> </td></tr> ";
            div_OBFICHEROcontenido=div_OBFICHEROcontenido+"</table>";
            odiv_OBFICHERO.innerHTML=div_OBFICHEROcontenido;
            f_imprimir_fitxerv();
            
        }
    }       
	

	function f_imprimir_fitxerv(){		
		var pfitxer = document.getElementById('fileAbsolutePath').value;
	      var str2 = pfitxer.replace(/barrainvertida/gi, "\\");    
	      
	    objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+str2+"&origen=axislist003.jsp",600,200);
	}       
    function f_cerrar_axisimprimir() {
            objUtiles.cerrarModal("axisimprimir");
    }

      
</script>
</head>
<body onload="f_onload()">
<div class="seccion displayspace" id="div_OBFICHERO" style="display:none"></div>
	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>


	<c:import url="../include/titulo_nt.jsp">
		<c:param name="producto">
			<axis:alt f="axisadm001" c="TITULO" lit="9910387" />
		</c:param>
		<c:param name="formulario">
			<axis:alt f="axisadm001" c="TITULO" lit="9910387" />
		</c:param>
		<c:param name="form">axisgca010</c:param>
	</c:import>

	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axisctr019" c="TITULO" lit="1000234" />
		</c:param>
		<c:param name="nid" value="axisctr014" />
	</c:import>

	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axisadm001" c="TITULO" lit="9910398" />
		</c:param>
		<c:param name="nid" value="axisgca012" />
	</c:import>
	<c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisimprimir|<fmt:message key="1000205" />|true</c:param>
    </c:import>

	<form name="miForm" action="" method="POST">
		<input type="hidden" name="operation" value="" /> <input type="hidden" name="SIDCON" id="SIDCON"
			value="${__formdata.SIDCON}" />
<input type="hidden" name="CESTADO" id="CESTADO"
			value="${__formdata.CESTADO}" />

		<table class="seccion"  style="width: 90%;" align="center">
		<tr>
		 <th style="width:15%;height:0%;"/>
		 <th style="width:15%;height:0%;"/>
		 <th style="width:70%;height:0%;"/>
		</tr>
			<tr>
				<axis:ocultar dejarHueco="false" f="axisgca010" c="ACON">
					<td><span class="bold"><axis:alt f="axisgca010" c="ACON" lit="101606"></axis:alt></span><br />
						<input onkeypress="return isNumberKey(event)" type="text" name="ACON" id="ACON"
						value="${__formdata.ITMGCA_CONCILIACIONCAB.ACON}" class="campowidthinput campo campotexto" 
						<axis:atr f="axisgca010" c="ACON" 
			a="formato=entero&modificable=false&obligatorio=false"/>
						alt="<axis:alt f="axisgca010" c="ACON" lit="101606" />"
						title="<axis:alt f="axisgca010" c="ACON" lit="101606" />" /></td>
				</axis:ocultar>

				<axis:ocultar dejarHueco="false" f="axisgca010" c="MCON">
					<td><span class="bold"><axis:alt f="axisgca010" c="MCON" lit="9000495"></axis:alt></span><br />
						<select title="<axis:alt f='axisgca010' c='MCON' lit='9000495' />"
						alt="<axis:alt f='axisgca010' c='MCON' lit='9000495' />" name="MCON" id="MCON" size="1"
						onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
						<axis:atr f="axisgca010" c="MCON" a="isInputText=false&modificable=false"/>>
							<option selected value>-
								<axis:alt f="axisgca010" c="BLANCO" lit="1000348" /> -
							</option>
							<c:forEach var="clase" items="${requestScope.LS_MESES}">
								<option value="${clase.CATRIBU}"
									<c:if test="${clase.CATRIBU == __formdata.ITMGCA_CONCILIACIONCAB.MCON}">selected</c:if>>${clase.TATRIBU}</option>
							</c:forEach>
					</select></td>
				</axis:ocultar>

				<axis:ocultar dejarHueco="false" f="axisgca010" c="TDESC">
					<td><span class="bold"><axis:alt f="axisgca010" c="TDESC" lit="100588"></axis:alt></span><br />
						<input onkeypress="return isNumberKey(event)" type="text" name="TDESC" id="TDESC"
						value="${__formdata.ITMGCA_CONCILIACIONCAB.TDESC}" class="campowidthinput campo campotexto" 
						<axis:atr f="axisgca010" c="TDESC" 
			a="formato=entero&modificable=false&obligatorio=false"/>
						alt="<axis:alt f="axisgca010" c="TDESC" lit="100588" />"
						title="<axis:alt f="axisgca010" c="TDESC" lit="100588" />" /></td>
				</axis:ocultar>
</tr>
			<tr>



				<axis:ocultar dejarHueco="false" f="axisgca010" c="CESTADO">
					<td><span class="bold"><axis:alt f="axisgca010" c="CESTADO" lit="100587"></axis:alt></span><br />
						<select title="<axis:alt f='axisgca010' c='CESTADO' lit='100587' />"
						alt="<axis:alt f='axisgca010' c='CESTADO' lit='100587' />" name="CESTADO" id="CESTADO"
						size="1" onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
						<axis:atr f="axisgca010" c="CESTADO" a="isInputText=false&modificable=false"/>>
							<option selected value>-
								<axis:alt f="axisgca010" c="BLANCO" lit="1000348" /> -
							</option>
							<c:forEach var="clase" items="${requestScope.LS_ESTADOS}">
								<option value="${clase.CATRIBU}"
									<c:if test="${clase.CATRIBU == __formdata.ITMGCA_CONCILIACIONCAB.CESTADO}">selected</c:if>>${clase.TATRIBU}</option>
							</c:forEach>
					</select></td>
				</axis:ocultar>


				<td></td>
				<td></td>
			</tr>
		</table>
		<br /> <br />
		
		<table class="seccion" style="width: 90%;" align="center">
			<tr>
				<td><span class="bold"><axis:alt f="axisgca010" c="NNUMIDEAGE" lit="9902363"></axis:alt></span></td>
				<td colspan="5"><input type="text" name="NNUMIDEAGE" id="NNUMIDEAGE"
					value="${__formdata.ITMGCA_CONCILIACIONCAB.NNUMIDEAGE}" class="campowidthinput campo campotexto" style="width: 90%;"
					<axis:atr f="axisgca010" c="NNUMIDEAGE" a="modificable=false&obligatorio=false"/>
					alt="<axis:alt f="axisgca010" c="NNUMIDEAGE" lit="9902363" />"
					title="<axis:alt f="axisgca010" c="NNUMIDEAGE" lit="9902363" />" /></td>
			</tr>
			<tr>
				<td></td>
				<td><span class="bold"><axis:alt f="axisgca010" c="TITCAN" lit="9904949"></axis:alt></span></td>
				<td><span class="bold"><axis:alt f="axisgca010" c="TITVAl" lit="101159"></axis:alt></span></td>
				<td colspan="3"></td>
			</tr>

			<c:forEach items="${__formdata.LISTA_SEC_1}" var="ITEM" varStatus="tindex">
				<%-- 			${tindex.index%2==0} --%> 
				<tr>
					<td><span style="font-size: 11px;">${ITEM.PREGUNTA}</span></td>
					<td><input type="text" name="NCANTIDAD${ITEM.NCODPARCON}" id="NCANTIDAD${ITEM.NCODPARCON}" value="${__formdata.LISTGCA_CONCILIACION_ACTA[ITEM.NCODPARCON-1].NCANTIDAD}"
						class="campowidthinput campo campotexto" style="width: 90%;" onkeypress="return isNumberKey(event)" onchange="guardarcantidad(${ITEM.NCODPARCON},${__formdata.LISTGCA_CONCILIACION_ACTA[ITEM.NCODPARCON-1].NCONCIACT})"
						<axis:atr f="axisgca010" c="NNUMIDEAGE" a="modificable=false&obligatorio=false"/>
						alt="<axis:alt f="axisgca010" c="NCANTIDAD${ITEM.NCODPARCON}" lit="9902363" />"
						title="<axis:alt f="axisgca010" c="NCANTIDAD${ITEM.NCODPARCON}" lit="9902363" />" /></td>
					<td><input type="text" name="NVALOR${ITEM.NCODPARCON}" id="NVALOR${ITEM.NCODPARCON}" value=" <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${fn:replace(__formdata.LISTGCA_CONCILIACION_ACTA[ITEM.NCODPARCON-1].NVALOR, ',', '.')}"/>"
						class="campowidthinput campo campotexto" style="width: 90%;" onkeypress="return isNumberKey(event)" onchange="guardarvalor(${ITEM.NCODPARCON},${__formdata.LISTGCA_CONCILIACION_ACTA[ITEM.NCODPARCON-1].NCONCIACT})"
						<axis:atr f="axisgca010" c="NNUMIDEAGE" a="modificable=false&obligatorio=false"/>
						alt="<axis:alt f="axisgca010" c="NVALOR${ITEM.NCODPARCON}" lit="9902363" />"
						title="<axis:alt f="axisgca010" c="NVALOR${ITEM.NCODPARCON}" lit="9902363" />" /></td>
				
				</tr>
			</c:forEach>
			<tr>
				<td colspan="3"></td>
				<td colspan="2"><div align="center"><span class="bold"><axis:alt f="axisgca010" c="TITRES" lit="9910388"></axis:alt></span></div></td>
				<td><span class="bold"><axis:alt f="axisgca010" c="TITFECHA" lit="9910389"></axis:alt></span></td>
			</tr>
			<tr>
				<td colspan="3"></td>
				<td><div align="center"><span class="bold"><axis:alt f="axisgca010" c="TITRES" lit="9910390"></axis:alt></span></div></td>
				<td><div align="center"><span class="bold"><axis:alt f="axisgca010" c="TITFECHA" lit="9910391"></axis:alt></span></div></td>
				<td></td>
			</tr>


			<c:forEach items="${__formdata.LISTA_SEC_2}" var="ITEM" varStatus="tindex">
				<%-- 			${tindex.index%2==0} --%>
				<tr>
					<td><span style="font-size: 11px;">${ITEM.PREGUNTA}</span></td>
					<td><input type="text" name="NCANTIDAD${ITEM.NCODPARCON}" id="NCANTIDAD${ITEM.NCODPARCON}" value="${__formdata.LISTGCA_CONCILIACION_ACTA[ITEM.NCODPARCON-1].NCANTIDAD}"
						class="campowidthinput campo campotexto" style="width: 90%;" onkeypress="return isNumberKey(event)" onchange="guardarcantidad(${ITEM.NCODPARCON},${__formdata.LISTGCA_CONCILIACION_ACTA[ITEM.NCODPARCON-1].NCONCIACT})"
						<axis:atr f="axisgca010" c="NNUMIDEAGE" a="modificable=false&obligatorio=false"/>
						alt="<axis:alt f="axisgca010" c="NCANTIDAD${ITEM.NCODPARCON}" lit="9902363" />"
						title="<axis:alt f="axisgca010" c="NCANTIDAD${ITEM.NCODPARCON}" lit="9902363" />" /></td>
					<td><input type="text" name="NVALOR${ITEM.NCODPARCON}" id="NVALOR${ITEM.NCODPARCON}" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${fn:replace(__formdata.LISTGCA_CONCILIACION_ACTA[ITEM.NCODPARCON-1].NVALOR, ',', '.')}"/>"
						class="campowidthinput campo campotexto" style="width: 90%;" onkeypress="return isNumberKey(event)" onchange="guardarvalor(${ITEM.NCODPARCON},${__formdata.LISTGCA_CONCILIACION_ACTA[ITEM.NCODPARCON-1].NCONCIACT})"
						<axis:atr f="axisgca010" c="NNUMIDEAGE" a="modificable=false&obligatorio=false"/>
						alt="<axis:alt f="axisgca010" c="NVALOR${ITEM.NCODPARCON}" lit="9902363" />"
						title="<axis:alt f="axisgca010" c="NVALOR${ITEM.NCODPARCON}" lit="9902363" />" /></td>

					<td><input type="checkbox" name="CRESPAGE${ITEM.NCODPARCON}" <c:if test="${__formdata.LISTGCA_CONCILIACION_ACTA[ITEM.NCODPARCON-1].CRESPAGE==1}">checked</c:if>
						id="CRESPAGE${ITEM.NCODPARCON}" class="campowidthinput campo campotexto"
						<axis:atr f="axisgca010" c="CRESPAGE${ITEM.NCODPARCON}" a="formato=entero&modificable=false&obligatorio=false"/>
						disabled readonly
						alt="<axis:alt f="axisgca010" c="CRESPAGE${ITEM.NCODPARCON}" lit="9910390" />"
						title="<axis:alt f="axisgca010" c="CRESPAGE${ITEM.NCODPARCON}" lit="9910390" />" /></td>
					<td><input type="checkbox" name="CRESPCIA${ITEM.NCODPARCON}" <c:if test="${__formdata.LISTGCA_CONCILIACION_ACTA[ITEM.NCODPARCON-1].CRESPCIA==1}">checked</c:if>
						id="CRESPCIA${ITEM.NCODPARCON}" class="campowidthinput campo campotexto"
						<axis:atr f="axisgca010" c="CRESPCIA${ITEM.NCODPARCON}" a="formato=entero&modificable=false&obligatorio=false"/>
						disabled readonly
						alt="<axis:alt f="axisgca010" c="CRESPCIA${ITEM.NCODPARCON}" lit="9910391" />"
						title="<axis:alt f="axisgca010" c="CRESPCIA${ITEM.NCODPARCON}" lit="9910391" />" /></td>
					<td><input type="text" name="FSOLUCION${ITEM.NCODPARCON}" id="FSOLUCION${ITEM.NCODPARCON}" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.LISTGCA_CONCILIACION_ACTA[ITEM.NCODPARCON-1].FSOLUCION}" />"
						size="15" class="campo campotexto" style="width: 70%;"
						disabled readonly
						title="<axis:alt f='axisgca010' c='FSOLUCION${ITEM.NCODPARCON}' lit='9910389'/>"
						alt="<axis:alt f='axisgca010' c='FSOLUCION${ITEM.NCODPARCON}' lit='9910389'/>"
						<axis:atr f="axisgca010" c="FSOLUCION${ITEM.NCODPARCON}" a="formato=fecha&modificable=false&obligatorio=true"/> />
						<c:if test="${__formdata.CESTADO != 4}"><a style="vertical-align: middle;"><img border="0" alt="" src="images/lapiz.gif"
							onclick='javascript:f_abrir_axisgca012(${__formdata.LISTGCA_CONCILIACION_ACTA[ITEM.NCODPARCON-1].NCONCIACT}, 0)' />
					</a></c:if></td>

				</tr>

			</c:forEach>
			<tr>
				<td><span class="bold"><axis:alt f="axisgca010" c="TITESANU" lit="9910394"></axis:alt></span></td>
				<td colspan="5"></td>
			</tr>

			<c:forEach items="${__formdata.LISTA_SEC_3}" var="ITEM" varStatus="tindex">
				<%-- 			${tindex.index%2==0} --%>
				<tr>
					<td><span style="font-size: 11px;">${ITEM.PREGUNTA}</span></td>
					<td><input type="text" name="NCANTIDAD${ITEM.NCODPARCON}" id="NCANTIDAD${ITEM.NCODPARCON}" value="${__formdata.LISTGCA_CONCILIACION_ACTA[ITEM.NCODPARCON-1].NCANTIDAD}"
						class="campowidthinput campo campotexto" style="width: 90%;" onkeypress="return isNumberKey(event)" onchange="guardarcantidad(${ITEM.NCODPARCON},${__formdata.LISTGCA_CONCILIACION_ACTA[ITEM.NCODPARCON-1].NCONCIACT})"
						<axis:atr f="axisgca010" c="NNUMIDEAGE" a="modificable=false&obligatorio=false"/>
						alt="<axis:alt f="axisgca010" c="NCANTIDAD${ITEM.NCODPARCON}" lit="9902363" />"
						title="<axis:alt f="axisgca010" c="NCANTIDAD${ITEM.NCODPARCON}" lit="9902363" />" /></td>
					<td><input type="text" name="NVALOR${ITEM.NCODPARCON}" id="NVALOR${ITEM.NCODPARCON}" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${fn:replace(__formdata.LISTGCA_CONCILIACION_ACTA[ITEM.NCODPARCON-1].NVALOR, ',', '.')}"/>"
						class="campowidthinput campo campotexto" style="width: 90%;" onkeypress="return isNumberKey(event)" onchange="guardarvalor(${ITEM.NCODPARCON},${__formdata.LISTGCA_CONCILIACION_ACTA[ITEM.NCODPARCON-1].NCONCIACT})"
						<axis:atr f="axisgca010" c="NNUMIDEAGE" a="modificable=false&obligatorio=false"/>
						alt="<axis:alt f="axisgca010" c="NVALOR${ITEM.NCODPARCON}" lit="9902363" />"
						title="<axis:alt f="axisgca010" c="NVALOR${ITEM.NCODPARCON}" lit="9902363" />" /></td>

					<td><input type="checkbox" name="CRESPAGE${ITEM.NCODPARCON}" <c:if test="${__formdata.LISTGCA_CONCILIACION_ACTA[ITEM.NCODPARCON-1].CRESPAGE==1}">checked</c:if>
						id="CRESPAGE${ITEM.NCODPARCON}" class="campowidthinput campo campotexto"
						<axis:atr f="axisgca010" c="CRESPAGE${ITEM.NCODPARCON}" a="formato=entero&modificable=false&obligatorio=false"/>
						alt="<axis:alt f="axisgca010" c="CRESPAGE${ITEM.NCODPARCON}" lit="9910390" />"
						disabled readonly
						title="<axis:alt f="axisgca010" c="CRESPAGE${ITEM.NCODPARCON}" lit="9910390" />" /></td>
					<td><input type="checkbox" name="CRESPCIA${ITEM.NCODPARCON}" <c:if test="${__formdata.LISTGCA_CONCILIACION_ACTA[ITEM.NCODPARCON-1].CRESPCIA==1}">checked</c:if>
						id="CRESPCIA${ITEM.NCODPARCON}" class="campowidthinput campo campotexto"
						<axis:atr f="axisgca010" c="CRESPCIA${ITEM.NCODPARCON}" a="formato=entero&modificable=false&obligatorio=false"/>
						alt="<axis:alt f="axisgca010" c="CRESPCIA${ITEM.NCODPARCON}" lit="9910391" />"
						disabled readonly
						title="<axis:alt f="axisgca010" c="CRESPCIA${ITEM.NCODPARCON}" lit="9910391" />" /></td>
					<td><input type="text" name="FSOLUCION${ITEM.NCODPARCON}" id="FSOLUCION${ITEM.NCODPARCON}" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.LISTGCA_CONCILIACION_ACTA[ITEM.NCODPARCON-1].FSOLUCION}" />"
						size="15" class="campo campotexto" style="width: 70%;"
						title="<axis:alt f='axisgca010' c='FSOLUCION${ITEM.NCODPARCON}' lit='9910389'/>"
						disabled readonly
						alt="<axis:alt f='axisgca010' c='FSOLUCION${ITEM.NCODPARCON}' lit='9910389'/>"
						<axis:atr f="axisgca010" c="FSOLUCION${ITEM.NCODPARCON}" a="formato=fecha&modificable=false&obligatorio=true"/> />
						<c:if test="${__formdata.CESTADO != 4}"><a style="vertical-align: middle;"><img border="0" alt="" src="images/lapiz.gif"
							onclick='javascript:f_abrir_axisgca012(${__formdata.LISTGCA_CONCILIACION_ACTA[ITEM.NCODPARCON-1].NCONCIACT}, 0)' />
					</a></c:if></td>

				</tr>
			</c:forEach>
			<tr>
				<td colspan="5"></td>
				<td><span class="bold"><axis:alt f="axisgca010" c="TITOBSER" lit="101162"></axis:alt></span></td>
			</tr>
			<c:forEach items="${__formdata.LISTA_SEC_4}" var="ITEM" varStatus="tindex">
				<%-- 			${tindex.index%2==0} --%>
				<tr>
					<td><span style="font-size: 11px;">${ITEM.PREGUNTA}</span></td>
					<td><input type="text" name="NCANTIDAD${ITEM.NCODPARCON}" id="NCANTIDAD${ITEM.NCODPARCON}" value="${__formdata.LISTGCA_CONCILIACION_ACTA[ITEM.NCODPARCON-1].NCANTIDAD}"
						class="campowidthinput campo campotexto" style="width: 90%;" onkeypress="return isNumberKey(event)" onchange="guardarcantidad(${ITEM.NCODPARCON},${__formdata.LISTGCA_CONCILIACION_ACTA[ITEM.NCODPARCON-1].NCONCIACT})"
						<axis:atr f="axisgca010" c="NNUMIDEAGE" a="modificable=false&obligatorio=false"/>
						alt="<axis:alt f="axisgca010" c="NCANTIDAD${ITEM.NCODPARCON}" lit="9902363" />"
						title="<axis:alt f="axisgca010" c="NCANTIDAD${ITEM.NCODPARCON}" lit="9902363" />" /></td>
					<td><input type="text" name="NVALOR${ITEM.NCODPARCON}" id="NVALOR${ITEM.NCODPARCON}" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${fn:replace(__formdata.LISTGCA_CONCILIACION_ACTA[ITEM.NCODPARCON-1].NVALOR, ',', '.')}"/>"
						class="campowidthinput campo campotexto" style="width: 90%;" onkeypress="return isNumberKey(event)" onchange="guardarvalor(${ITEM.NCODPARCON},${__formdata.LISTGCA_CONCILIACION_ACTA[ITEM.NCODPARCON-1].NCONCIACT})"
						<axis:atr f="axisgca010" c="NNUMIDEAGE" a="modificable=false&obligatorio=false"/>
						alt="<axis:alt f="axisgca010" c="NVALOR${ITEM.NCODPARCON}" lit="9902363" />"
						title="<axis:alt f="axisgca010" c="NVALOR${ITEM.NCODPARCON}" lit="9902363" />" /></td>

					<td></td>
					<td colspan="2"><input type="text" name="OBSERVACIONES${ITEM.NCODPARCON}" value="${__formdata.LISTGCA_CONCILIACION_ACTA[ITEM.NCODPARCON-1].TOBS}"
						id="OBSERVACIONES${ITEM.NCODPARCON}" class="campowidthinput campo campotexto" 
						style="width: 90%;"
						<axis:atr f="axisgca010" c="OBSERVACIONES${ITEM.NCODPARCON}" a="modificable=false&obligatorio=false"/>
						alt="<axis:alt f="axisgca010" c="OBSERVACIONES${ITEM.NCODPARCON}" lit="101162" />"
						title="<axis:alt f="axisgca010" c="OBSERVACIONES${ITEM.NCODPARCON}" lit="101162" />" /><c:if test="${__formdata.CESTADO != 4}"><a
						style="vertical-align: middle;"><img border="0" alt="" src="images/lapiz.gif"
							onclick='javascript:f_abrir_axisgca012(${__formdata.LISTGCA_CONCILIACION_ACTA[ITEM.NCODPARCON-1].NCONCIACT}, 1)' />
					</a></c:if></td>

				</tr>
			</c:forEach>
		</table>
		<div align="center">
			<span class="bold">* <axis:alt f="axisgca010" c="TIT9910392" lit="9910392"></axis:alt></span>
		</div>

		<div class="separador">&nbsp;</div>

		<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axisgca010</c:param>
			<c:param name="f">axisgca010</c:param>
			<c:param name="__botones">cancelar<c:if test="${__formdata.CESTADO != 4}">,9910395</c:if>,9910396</c:param>
		</c:import>


	</form>
	<c:import url="../include/mensajes.jsp" />
</body>
</html>