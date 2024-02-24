<%/* Revision:# 4foKIqPS3tNySGWGhFLg1w== # */%>

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

	$(document).ready(function() {

	});

	//Nuevo
	function f_but_cancelar() {
		parent.f_cerrar_axisgca009();
	}
	//Exportar
	function f_but_9910386() {
		var sidcon = "${__formdata.SIDCON}";
		f_imprimir_fitxer(sidcon);
	}

	function f_but_filtrar() {
		objUtiles.ejecutarFormulario("axis_axisgca009.do?action=BUSCAR","form", document.miForm, "_self",objJsMessages.jslit_cargando);
	}

	function f_cerrar_axisgca011() {
		objUtiles.cerrarModal("axisgca011");
		f_but_filtrar();
	}

	function f_but_editar(NLINEA,SIDCON) {
		objUtiles.abrirModal("axisgca011", "src","axis_axisgca011.do?operation=form&action=FORM&NLINEA="+NLINEA+"&SIDCON="+SIDCON);
	}
	
	function cargar_datos(){
		objUtiles.ejecutarFormulario("axis_axisgca009.do?action=FORM","form", document.miForm, "_self",objJsMessages.jslit_cargando);
	}
	function f_imprimir_fitxer(SIDCON){
		if(SIDCON!=null){
			objAjax.invokeAsyncCGI_JSON("axis_axisgca009.do?operation=descargar_reporte&SIDCON="+SIDCON, callBack_miajaxjson, "<axis:alt f='axiscga002' c='MSG_CARGAR' lit='9905686'/>")
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
    
  //INI -  4060 SGM  12/06/2019  se agregan ficheros a cruces cartera
    function cargarArchivos (nlinea) {
    	objUtiles.abrirModal("axisgedox", "src","modal_axisgedox.do?operation=form&IDOBS="+nlinea);
    	//alert (nlinea);
    }
    function f_cerrar_axisgedox() {
        objUtiles.cerrarModal("axisgedox");
    }
    //FIN - 4060 SGM  12/06/2019  se agregan ficheros a cruces cartera    
</script>
</head>
<body onload="f_onload()">
<div class="seccion displayspace" id="div_OBFICHERO" style="display:none"></div>
	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>


	<c:import url="../include/titulo_nt.jsp">
		<c:param name="producto">
			<axis:alt f="axisadm001" c="TITULO" lit="9910385" />
		</c:param>
		<c:param name="formulario">
			<axis:alt f="axisadm001" c="TITULO" lit="9910385" />
		</c:param>
		<c:param name="form">axisgca009</c:param>
	</c:import>

	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axisadm001" c="TITULO" lit="9910399" />
		</c:param>
		<c:param name="nid" value="axisgca011" />
	</c:import>
	<c:import url="../include/modal_estandar.jsp">
         <c:param name="nid_y_titulo">axisimprimir|<fmt:message key="1000205" />|true</c:param>
        </c:import>
	<form name="miForm" action="" method="POST">
		<input type="hidden" name="operation" value="" /> <input type="hidden" name="SIDCON" id="SIDCON"
			value="${__formdata.SIDCON}" />

         <!-- INI IAXIS 4060 SGM  12/06/2019  se agregan ficheros a cruces cartera -->
        	<c:import url="../include/modal_estandar.jsp">
    	<c:param name="nid_y_titulo">axisctr019|<axis:alt f="axisctr020" c="MOD_PANT_AXICTR019" lit="1000188"/>#axisimprimir|<axis:alt f="axisctr020" c="MOD_PANT_IMPRIMIR" lit="1000205"/>|true#axisgedox|<axis:alt f="${pantalla}" c="LIT_GEDOX" lit="1000201"></axis:alt>#axisctr023|<axis:alt f="axisctr020" c="MOD_PANT_AXISCTR023" lit="1000191"/>#axisctr025|<axis:alt f="axisctr020" c="MOD_PANT_AXISCTR025" lit="140360"/>#axisctr029|<axis:alt f="${pantalla}" c="LIT_PANTALLA_DETASE" lit="1000195"/>#axisctr148|<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISCTR148" lit="1000199"/>#axisctr030|<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISCTR030" lit="1000196"/>#axisctr039|Suplementos#axisadm028|<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISADM028" lit="1000568"/>#axisopenurl||<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISOPENURL" lit="1000568"/></c:param>
    </c:import>
       <!-- FIN IAXIS 4060 SGM  12/06/2019  se agregan ficheros a cruces cartera--> 

		<table class="seccion" style="width: 95%;" align="center">
			<tr>
				<axis:ocultar dejarHueco="false" f="axisgca009" c="CESTADOI">
					<td><span class="bold"><axis:alt f="axisgca009" c="CESTADOI" lit="9910352"></axis:alt></span><br />
						<select title="<axis:alt f='axisgca009' c='CESTADOI' lit='9910352' />"
						alt="<axis:alt f='axisgca009' c='CESTADOI' lit='9910352' />" name="CESTADOI" id="CESTADOI"
						size="1" onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
						<axis:atr f="axisgca009" c="CESTADOI" a="isInputText=false&modificable=true"/>>
							<option selected value>-
								<axis:alt f="axisgca009" c="BLANCO" lit="1000348" /> -
							</option>
							<c:forEach var="clase" items="${requestScope.LS_CESTADOI}">
								<option value="${clase.CATRIBU}"
									<c:if test="${clase.CATRIBU == __formdata.CESTADOI}">selected</c:if>>${clase.TATRIBU}</option>
							</c:forEach>
					</select></td>
				</axis:ocultar>

				<axis:ocultar dejarHueco="false" f="axisgca009" c="CESTADO">
					<td><span class="bold"><axis:alt f="axisgca009" c="CESTADO" lit="101510"></axis:alt></span><br />
						<select title="<axis:alt f='axisgca009' c='CESTADO' lit='101510' />"
						alt="<axis:alt f='axisgca009' c='CESTADO' lit='101510' />" name="CESTADO" id="CESTADO"
						size="1" onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
						<axis:atr f="axisgca009" c="CESTADO" a="isInputText=false&modificable=true"/>>
							<option selected value>-
								<axis:alt f="axisgca009" c="BLANCO" lit="1000348" /> -
							</option>
							<c:forEach var="clase" items="${requestScope.LS_CESTADO}">
								<option value="${clase.CATRIBU}"
									<c:if test="${clase.CATRIBU == __formdata.CESTADO}">selected</c:if>>${clase.TATRIBU}</option>
							</c:forEach>
					</select></td>
				</axis:ocultar>
			</tr>
			<tr>
				<axis:ocultar dejarHueco="false" f="axisgca009" c="CCRUCE">
					<td><span class="bold"><axis:alt f="axisgca009" c="CCRUCE" lit="9910377"></axis:alt></span><br />
						<select title="<axis:alt f='axisgca009' c='CCRUCE' lit='9910377' />"
						alt="<axis:alt f='axisgca009' c='CCRUCE' lit='9910377' />" name="CCRUCE" id="CCRUCE" size="1"
						onchange="cargar_datos();" class="campowidthselect campo campotexto_ob"
						<axis:atr f="axisgca009" c="CCRUCE" a="isInputText=false&modificable=true"/>>
							<option selected value>-
								<axis:alt f="axisgca009" c="BLANCO" lit="1000348" /> -
							</option>
							<c:forEach var="clase" items="${requestScope.LS_CCRUCE}">
								<option value="${clase.CATRIBU}"
									<c:if test="${clase.CATRIBU == __formdata.CCRUCE}">selected</c:if>>${clase.TATRIBU}</option>
							</c:forEach>
					</select></td>
				</axis:ocultar>

				<axis:ocultar dejarHueco="false" f="axisgca009" c="CCRUCEDET">
					<td><span class="bold"><axis:alt f="axisgca009" c="CCRUCEDET" lit="9910378"></axis:alt></span><br />
						<select title="<axis:alt f='axisgca009' c='CCRUCEDET' lit='9910378' />"
						alt="<axis:alt f='axisgca009' c='CCRUCEDET' lit='9910378' />" name="CCRUCEDET" id="CCRUCEDET"
						size="1" onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
						<axis:atr f="axisgca009" c="CCRUCEDET" a="isInputText=false&modificable=true"/>>
							<option selected value>-
								<axis:alt f="axisgca009" c="BLANCO" lit="1000348" /> -
							</option>
							<c:if test="${__formdata.CCRUCE == 6}">
								<c:forEach var="clase" items="${requestScope.LS_CCRUCEDET_6}">
									<option value="${clase.CATRIBU}"
										<c:if test="${clase.CATRIBU == __formdata.CCRUCEDET}">selected</c:if>>${clase.TATRIBU}</option>
								</c:forEach>
							</c:if>
							<c:if test="${__formdata.CCRUCE == 7}">
								<c:forEach var="clase" items="${requestScope.LS_CCRUCEDET_7}">
									<option value="${clase.CATRIBU}"
										<c:if test="${clase.CATRIBU == __formdata.CCRUCEDET}">selected</c:if>>${clase.TATRIBU}</option>
								</c:forEach>
							</c:if>

							<c:if test="${__formdata.CCRUCE < 6}">
								<c:forEach var="clase" items="${requestScope.LS_CCRUCEDET_NO6NO7}">
									<option value="${clase.CATRIBU}"
										<c:if test="${clase.CATRIBU == __formdata.CCRUCEDET}">selected</c:if>>${clase.TATRIBU}</option>
								</c:forEach>
							</c:if>

					</select></td>
				</axis:ocultar>
			</tr>
			<tr>
				<td></td>
				<td><input type="button" class="boton" id="BT_FILTRO" name="BT_FILTRO"
					value="<axis:alt f="axisgca009" c="BT_FILTRO" lit="9910384" />" onclick="f_but_filtrar()" /></td>
			</tr>
		</table>

		<center>


<!-- 			SGM 4511 Detalles de conciliacion-->
				<div class="seccion displayspaceMaximo " style="overflow: auto; width: 95%">

				<c:set var="title0">
					<axis:alt f="axisgca009" c="NLINEA" lit="9910336" />
				</c:set>
				<c:set var="title1">
					<axis:alt f="axisgca009" c="NNUMIDEAGE" lit="9910330" />
				</c:set>
				<c:set var="title2">
					<axis:alt f="axisgca009" c="TNOMAGE" lit="9910332" />
				</c:set>
				<c:set var="title3">
					<axis:alt f="axisgca009" c="CAGENTE" lit="100584" />
				</c:set>
				<c:set var="title4">
					<axis:alt f="axisgca009" c="NNUMIDECLI" lit="9910337" />
				</c:set>
				<c:set var="title5">
					<axis:alt f="axisgca009" c="TNOMCLI" lit="9910338" />
				</c:set>
				<c:set var="title6">
					<axis:alt f="axisgca009" c="NPOLIZA" lit="9905622" />
				</c:set>
				<c:set var="title7">
					<axis:alt f="axisgca009" c="NCERTIF" lit="101236" />
				</c:set>
				<c:set var="title8">
					<axis:alt f="axisgca009" c="NRECIBO" lit="100895" />
				</c:set>
				<c:set var="title9">
					<axis:alt f="axisgca009" c="NMADUREZ" lit="9910339" />
				</c:set>
				<c:set var="title10">
					<axis:alt f="axisgca009" c="ITOTALR" lit="1000563" />
				</c:set>
				<c:set var="title11">
					<axis:alt f="axisgca009" c="ICOMISION" lit="101509" />
				</c:set>
				<c:set var="title12">
					<axis:alt f="axisgca009" c="CMONEDA" lit="108645" />
				</c:set>
				<c:set var="title13">
					<axis:alt f="axisgca009" c="COUTSOURCING" lit="9910340" />
				</c:set>
				<c:set var="title14">
					<axis:alt f="axisgca009" c="TNOMCLI_FIC" lit="9910341" />
				</c:set>
				<c:set var="title15">
					<axis:alt f="axisgca009" c="NPOLIZA_FIC" lit="9910342" />
				</c:set>
				<c:set var="title16">
					<axis:alt f="axisgca009" c="NRECIBO_FIC" lit="9910343" />
				</c:set>
				<c:set var="title17">
					<axis:alt f="axisgca009" c="NMADUREZ_FIC" lit="9910344" />
				</c:set>
				<c:set var="title18">
					<axis:alt f="axisgca009" c="ITOTALR_FIC" lit="9910345" />
				</c:set>
				<c:set var="title19">
					<axis:alt f="axisgca009" c="ICOMISION_FIC" lit="9910346" />
				</c:set>
				<c:set var="title20">
					<axis:alt f="axisgca009" c="CMONEDA_FIC" lit="9910347" />
				</c:set>
				<c:set var="title21">
					<axis:alt f="axisgca009" c="COUTSOURCING_FIC" lit="9910348" />
				</c:set>
				<c:set var="title22">
					<axis:alt f="axisgca009" c="CREPETIDO" lit="9910349" />
				</c:set>
				<c:set var="title23">
					<axis:alt f="axisgca009" c="TCRUCE" lit="9910350" />
				</c:set>
				<c:set var="title24">
					<axis:alt f="axisgca009" c="TCRUCEDET" lit="9910351" />
				</c:set>
				<c:set var="title25">
					<axis:alt f="axisgca009" c="TESTADOI" lit="9910352" />
				</c:set>
				<c:set var="title26">
					<axis:alt f="axisgca009" c="TESTADO" lit="100587" />
				</c:set>
				<c:set var="title27">
					<axis:alt f="axisgca009" c="TOBSERVA" lit="101162" />
				</c:set>
				<c:set var="title28">
					<axis:alt f="axisgca001" c="TSUCURSAL" lit="9909330" />
				</c:set>
<%--IAXIS 4060 SGM  12/06/2019  se agregan ficheros a cruces cartera--%>				
				<c:set var="title29">
					<axis:alt f="axisgca001" c="FICHERO" lit="9905642" />
				</c:set>
				<%
					int contador = 0;
				%>
				 
				<display:table name="${__formdata.GCA_CONCILIACIONDETS}" id="ROW" export="false"
					style="overflow: auto; width: 180%;" class="dsptgtable" pagesize="-1" defaultsort="2"
					defaultorder="ascending" requestURI="axis_axisgca009.do?paginar=true" sort="list"
					cellpadding="0" cellspacing="0">
					<%@ include file="../include/displaytag.jsp"%>

					<display:column title="${title0}" sortProperty="NLINEA" sortable="true" headerClass="sortable"
						media="html" autolink="false">
						<div class="dspText">${ROW.NLINEA}</div>
					</display:column>
					<display:column title="${title1}" sortProperty="NNUMIDEAGE" sortable="true"
						headerClass="sortable" media="html" autolink="false">
						<div class="dspText">${ROW.NNUMIDEAGE}</div>
					</display:column>
					<display:column title="${title2}" sortProperty="TNOMAGE" sortable="true"
						headerClass="sortable" media="html" autolink="false">
						<div class="dspText">${ROW.TNOMAGE}</div>
					</display:column>
					<display:column title="${title3}" sortProperty="CAGENTE" sortable="true" headerClass="sortable"
						media="html" autolink="false">
						<div class="dspText">${ROW.CAGENTE}</div>
					</display:column>
					<display:column title="${title28}" sortProperty="TSUCURSAL" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">
								${ROW.SUCURSAL}
								</div>
					</display:column>
					<display:column title="${title4}" sortProperty="NNUMIDECLI" sortable="true"
						headerClass="sortable" media="html" autolink="false">
						<div class="dspText">${ROW.NNUMIDECLI}</div>
					</display:column>
					
					<display:column title="${title5}" sortProperty="TNOMCLI" sortable="true" headerClass="sortable"
						media="html" autolink="false">
						<div class="dspText">${ROW.TNOMCLI}</div>
					</display:column>
					<display:column title="${title6}" sortProperty="NPOLIZA" sortable="true" headerClass="sortable"
						media="html" autolink="false">
						<div class="dspText">${ROW.NPOLIZA}</div>
					</display:column>
					<display:column title="${title7}" sortProperty="NCERTIF" sortable="true" headerClass="sortable"
						media="html" autolink="false">
						<div class="dspText">${ROW.NCERTIF}</div>
					</display:column>
					<display:column title="${title8}" sortProperty="NRECIBO" sortable="true" headerClass="sortable"
						media="html" autolink="false">
						<div class="dspText">${ROW.NRECIBO}</div>
					</display:column>
					<display:column title="${title9}" sortProperty="NMADUREZ" sortable="true"
						headerClass="sortable" media="html" autolink="false">
						<div class="dspText">${ROW.NMADUREZ}</div>
					</display:column>
					<display:column title="${title10}" sortProperty="ITOTALR" sortable="true" headerClass="sortable"
						media="html" autolink="false">
						<div class="dspNumber">
                                <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${fn:replace(ROW.ITOTALR, ',', '.')}"/>
                        </div>
					</display:column>
					<display:column title="${title11}" sortProperty="ICOMISION" sortable="true"
						headerClass="sortable" media="html" autolink="false">
						<div class="dspNumber">
                                <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${fn:replace(ROW.ICOMISION, ',', '.')}"/>
                        </div>
					</display:column>
					<display:column title="${title12}" sortProperty="CMONEDA" sortable="true"
						headerClass="sortable" media="html" autolink="false">
						<div class="dspText">${ROW.CMONEDA}</div>
					</display:column>
					<display:column title="${title13}" sortProperty="COUTSOURCING" sortable="true"
						headerClass="sortable" media="html" autolink="false">
						<div class="dspText">${ROW.COUTSOURCING}</div>
					</display:column>
					<display:column title="${title14}" sortProperty="TNOMCLI_FIC" sortable="true"
						headerClass="sortable" media="html" autolink="false">
						<div class="dspText">${ROW.TNOMCLI_FIC}</div>
					</display:column>
					<display:column title="${title15}" sortProperty="NPOLIZA_FIC" sortable="true"
						headerClass="sortable" media="html" autolink="false">
						<div class="dspText">${ROW.NPOLIZA_FIC}</div>
					</display:column>
					<display:column title="${title16}" sortProperty="NRECIBO_FIC" sortable="true"
						headerClass="sortable" media="html" autolink="false">
						<div class="dspText">${ROW.NRECIBO_FIC}</div>
					</display:column>
					<display:column title="${title17}" sortProperty="NMADUREZ_FIC" sortable="true"
						headerClass="sortable" media="html" autolink="false">
						<div class="dspText">${ROW.NMADUREZ_FIC}</div>
					</display:column>
					<display:column title="${title18}" sortProperty="ITOTALR_FIC" sortable="true"
						headerClass="sortable" media="html" autolink="false">
						
						 <div class="dspText">${ROW.ITOTALR_FIC}</div>
                                 
					</display:column>
					<display:column title="${title19}" sortProperty="ICOMISION_FIC" sortable="true"
						headerClass="sortable" media="html" autolink="false">
						<div class="dspNumber">
							 <div class="dspText">${ROW.ICOMISION_FIC}</div>
                             
                        </div>
					</display:column>
					<display:column title="${title20}" sortProperty="CMONEDA_FIC" sortable="true"
						headerClass="sortable" media="html" autolink="false">
						<div class="dspText">${ROW.CMONEDA_FIC}</div>
					</display:column>
					<display:column title="${title21}" sortProperty="COUTSOURCING_FIC" sortable="true"
						headerClass="sortable" media="html" autolink="false">
						<div class="dspText">${ROW.COUTSOURCING_FIC}</div>
					</display:column>
					<display:column title="${title22}" sortProperty="CREPETIDO" sortable="true"
						headerClass="sortable" media="html" autolink="false">
						<div class="dspText">${ROW.CREPETIDO}</div>
					</display:column>
					<display:column title="${title23}" sortProperty="TCRUCE" sortable="true" headerClass="sortable"
						media="html" autolink="false">
						<div class="dspText">
							<c:forEach var="clase" items="${requestScope.LS_CCRUCE}">
								<c:if test="${clase.CATRIBU == ROW.CCRUCE}">${clase.TATRIBU}</c:if>
							</c:forEach>
						</div>
					</display:column>
					<display:column title="${title24}" sortProperty="TCRUCEDET" sortable="true"
						headerClass="sortable" media="html" autolink="false">
						<div class="dspText">
							<c:if test="${ROW.CCRUCE == 6}">
								<c:forEach var="clase" items="${requestScope.LS_CCRUCEDET_6}">
									<c:if test="${clase.CATRIBU == ROW.CCRUCEDET}">${clase.TATRIBU}</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${ROW.CCRUCE == 7}">
								<c:forEach var="clase" items="${requestScope.LS_CCRUCEDET_7}">
									<c:if test="${clase.CATRIBU == ROW.CCRUCEDET}">${clase.TATRIBU}</c:if>
								</c:forEach>
							</c:if>

							<c:if test="${ROW.CCRUCE < 6}">
								<c:forEach var="clase" items="${requestScope.LS_CCRUCEDET_NO6NO7}">
									<c:if test="${clase.CATRIBU == ROW.CCRUCEDET}">${clase.TATRIBU}</c:if>
								</c:forEach>
							</c:if>
						</div>
					</display:column>
					<display:column title="${title25}" sortProperty="TESTADOI" sortable="true"
						headerClass="sortable" media="html" autolink="false">
						<div class="dspText">
							<c:forEach var="clase" items="${requestScope.LS_CESTADOI}">
								<c:if test="${clase.CATRIBU == ROW.CESTADOI}">${clase.TATRIBU}</c:if>
							</c:forEach>
						</div>
					</display:column>
					<display:column title="${title26}" sortProperty="TESTADO" sortable="true"
						headerClass="sortable" media="html" autolink="false">
						<div class="dspText">
							<c:forEach var="clase" items="${requestScope.LS_CESTADO}">
								<c:if test="${clase.CATRIBU == ROW.CESTADO}">${clase.TATRIBU}</c:if>
							</c:forEach>
						</div>
					</display:column>
					<display:column title="${title27}" sortProperty="TOBSERVA" sortable="true"
						headerClass="sortable" media="html" autolink="false">
						<div class="dspText">${ROW.TOBSERVA}</div>
					</display:column>
<%--IAXIS 4060 SGM  12/06/2019  se agregan ficheros a cruces cartera--%>					
					<display:column title="${title29}" sortProperty="FICHERO" sortable="true"
						headerClass="sortable" media="html" autolink="false">
						<div class="dspText"></div>
						<a type="button" style="color:blue;" href="#" onclick="cargarArchivos(${__formdata.SIDCON}${ROW.NLINEA})">Archivos Adjuntos</a>
					</display:column>					

					<display:column title="" sortProperty="TOBSERVA" sortable="true" headerClass="sortable"
						media="html" autolink="false">
						<img border="0" alt="" src="images/lapiz.gif"
							onclick='javascript:f_but_editar(${ROW.NLINEA},${ROW.SIDCON})' />
					</display:column>

				</display:table>

			</div>
		</center>

		<div class="separador">&nbsp;</div>

		<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axisgca009</c:param>
			<c:param name="f">axisgca009</c:param>
			<c:param name="__botones">cancelar,9910386</c:param>
		</c:import>
	</form>
	<c:import url="../include/mensajes.jsp" />
</body>
</html>