<%/* Revision:# sMuZixlLGqgscxIm87ExdQ== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<c:set var="nombrePantalla" value="tramitaciones"/>
<c:set var="nombreSeccion" value="reservas"/>
<c:set var="formulari" value="axissin006"/>
<c:if test="${!empty param.f}">
    <c:set var="formulari">${param.f}</c:set>
</c:if>
<script type="text/javascript">
	//function f_aceptar_axissin010(NSINIES) {
		//objDom.setValorPorId("NSINIES", NSINIES);
		//document.miForm.subpantalla.value="tramitaciones";
		//document.miForm.seccion.value="reservas";
		//objUtiles.ejecutarFormulario("axis_axissin006.do?", "cargarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);
    //}
    var compensado = 0;
    var glo_parametros;
    var idres;
    
	function f_aceptar_axissin010(NSINIES, PANTALLA, SECCION) {
		//alert("Aceptando la reserva");
		objDom.setValorPorId("NSINIES", NSINIES);
		document.miForm.subpantalla.value="tramitaciones";
		document.miForm.seccion.value="tramitaciones_reservas";
		objUtiles.ejecutarFormulario("axis_axissin006.do?", "cargarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);
	}
         
    function f_aceptar_axissin050(NSINIES, PANTALLA, SECCION) {  
		//alert("Aceptando la reserva");
		objDom.setValorPorId("NSINIES", NSINIES);
		document.miForm.subpantalla.value="tramitaciones";
		document.miForm.seccion.value="tramitaciones_reservas";
		objUtiles.ejecutarFormulario("axis_axissin006.do?", "cargarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);
	}

	function f_getReserva(indexNou){
		if (document.miForm.indexReserva.value != indexNou){
			document.miForm.indexReserva.value = indexNou;
			document.miForm.subpantalla.value="tramitaciones";
			document.miForm.seccion.value="tramitaciones_reservas";
			objUtiles.ejecutarFormulario("axis_axissin006.do", "recargarPagos", document.miForm, "_self", objJsMessages.jslit_cargando);
		}
	}
        
	function f_but_historico(nsinies,ntramit,ctipres,ctipgas,cgarant,nmovres,CMONRES){
	
		var sproduc = document.miForm.SPRODUC.value;
		var cactivi = document.miForm.CACTIVI.value;
		objUtiles.abrirModal("axissin037", "src", "modal_axissin037.do?operation=form&NSINIES="+nsinies+"&NTRAMIT="+ntramit+"&CTIPRES="+ctipres+"&CTIPGAS="+ctipgas+"&CGARANT="+cgarant+"&NMOVRES="+nmovres+"&SPRODUC="+sproduc+"&CACTIVI="+cactivi+"&CMONRES="+CMONRES);
	}
        
	function f_cerrar_axissin037(){
		objUtiles.cerrarModal("axissin037");
	}
        
	function f_generar_pago(ctipres,ctipgas,cgarant,fperini,fperfin,idres){
	    var pnsinies = document.miForm.NSINIES.value;
		var pnriesgo = document.miForm.NRIESGO.value;
		var pntramit = document.miForm.NTRAMIT.value;
		var pidreserva = idres;
		var pctipres = ctipres;
		var pcgarant = cgarant;
		var pfsinies = document.miForm.FSINIES.value;
		var pfperini = fperini;
		var pfperfin = fperfin;
                //AAC_INI:0033798: POSPT500-POSADM/POSSIN: Incidencia cruce de siniestros VS cartera (bug hermano interno)
		glo_parametros = "PNSINIES="+pnsinies+"&PNRIESGO="+pnriesgo+"&PNTRAMIT="+pntramit+"&PCTIPRES="+pctipres+"&PCTIPGAS="+ctipgas+
		 "&PCGARANT="+pcgarant+"&IDRES="+pidreserva+"&PFSINIES="+pfsinies+"&PFPERINI="+pfperini+"&PFPERFIN="+pfperfin;
		compensado = 0;
	        var qs="operation=ajax_valida_compensacion";
	        qs=qs+"&SSEGURO="+$("#SSEGURO").val();
	        qs=qs+"&NSINIES="+$("#NSINIES").val();
	        qs=qs+"&NRIESGO="+$("#NRIESGO").val();
	        qs=qs+"&SIDEPAG="+$("#SIDEPAG").val();
	        qs=qs+"&IDRES="+pidreserva;
	        qs=qs+"&NTRAMIT="+pntramit;
	        objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", objJsMessages.jslit_cargando, "inline");
	        objAjax.invokeAsyncCGI("axis_axissin006.do", callbackajaxValidaCompensacion_sis, qs, this);
		//AAC_FI
		}
        
	function f_borrar_res(pnsinies,pntramit,pctipres,pctipgas,pcgarant,pnmovres){
	   var answer = confirm(objJsMessages.jslit_confirma_borrar);
	
	    if (answer){
			var psproduc = document.miForm.SPRODUC.value;
			var pcactivi = document.miForm.CACTIVI.value;
	   
			objUtiles.ejecutarFormulario("axis_axissin006.do?PNSINIES="+pnsinies+"&PNTRAMIT="+pntramit+"&PCTIPRES="+pctipres+"&PCTIPGAS="+pctipgas+
										"&PCGARANT="+pcgarant+"&PNMOVRES="+pnmovres+"&PSPRODUC="+psproduc+"&PCACTIVI="+pcactivi, 
										"delReserva", document.miForm, "_self", objJsMessages.jslit_cargando);
	    }
	}
        
	function f_editar_res(pnsinies,pntramit,pctipres,pnmovres,pcgarant,ireserva){
		if (ireserva >= 0) {
			var indexTramitacio = document.miForm.indexTramitacio.value;
			var sseguro = document.miForm.SSEGURO.value;
			var fsinies = document.miForm.FSINIES.value;
			var ccausin = document.miForm.CCAUSIN.value;
			var cmotsin = document.miForm.CMOTSIN.value;
			var nriesgo = document.miForm.NRIESGO.value;
			var sproduc = document.miForm.SPRODUC.value;
			var cactivi = document.miForm.CACTIVI.value;
			
			f_abrir_modal('axissin010',null,'&indexTramitacio='+indexTramitacio+'&SSEGURO='+sseguro+
											'&FSINIES='+fsinies+'&CCAUSIN='+ccausin+'&CMOTSIN='+cmotsin+'&NRIESGO='+nriesgo+
											'&SPRODUC='+sproduc+'&CACTIVI='+cactivi+'&NSINIES='+pnsinies.toString()+'&NTRAMIT='+pntramit+
											'&CTIPRES='+pctipres+'&NMOVRES='+pnmovres+'&CGARANT='+pcgarant+'&MODO=EDITAR');
		}
		else{
			alert('<axis:alt f='axissin006' c='RESERVA_NOMODIF' lit='9900999'/>');
		}
	
	}
        //AAC_INI:0033798: POSPT500-POSADM/POSSIN: Incidencia cruce de siniestros VS cartera (bug hermano interno)
	function callbackajaxValidaCompensacion_sis(ajaxResponseText){
		var pnsinies = document.miForm.NSINIES.value;
		var pnriesgo = document.miForm.NRIESGO.value;
		var pntramit = document.miForm.NTRAMIT.value;
        var doc=objAjax.domParse(ajaxResponseText);
            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
            try{
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
					var PTLITERA = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("PTLITERA")[0]))? 
					objDom.getValorNodoDelComponente(doc.getElementsByTagName("PTLITERA"), 0, 0) : "");                    
					if (!objUtiles.estaVacio(PTLITERA)){
                        idres=objDom.getValorNodoDelComponente(doc.getElementsByTagName("IDRES"), 0, 0);
                        toogle('block','modal','ventana',PTLITERA);                        
					}else{
						/* Se procede normal, como hasta ahora. */
						objUtiles.ejecutarFormulario("axis_axissin006.do?"+glo_parametros, "generarPago", document.miForm, "_self", objJsMessages.jslit_cargando);
					}
				}
            }
            catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
            f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
        }
	//AAC_FI
    function toogle(a,b,c,texto){
          document.getElementById(b).style.display=a;
          document.getElementById(c).style.display=a;          
          document.getElementById("modal_texto").innerHTML=texto;
        }
    function f_si(){
        toogle('none','modal','ventana');
        objUtiles.ejecutarFormulario ("axis_axissin006.do?IDRES="+idres, "compensacion_pagos", document.miForm, "_self", objJsMessages.jslit_cargando);
        compensado = 1;
    }
    function f_no(){
        toogle('none','modal','ventana');
        objUtiles.ejecutarFormulario("axis_axissin006.do?"+glo_parametros, "generarPago", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
    
    function f_variar_res(pnsinies,pntramit,pctipres,pnmovres,pcgarant,ireserva){
            if (ireserva >= 0) {
                    var indexTramitacio = document.miForm.indexTramitacio.value;
                    var sseguro = document.miForm.SSEGURO.value;
                    var fsinies = document.miForm.FSINIES.value;
                    var ccausin = document.miForm.CCAUSIN.value;
                    var cmotsin = document.miForm.CMOTSIN.value;
                    var nriesgo = document.miForm.NRIESGO.value;
                    var sproduc = document.miForm.SPRODUC.value;
                    var cactivi = document.miForm.CACTIVI.value;
                    
                    f_abrir_modal('axissin010',null,'&indexTramitacio='+indexTramitacio+'&SSEGURO='+sseguro+
                                                                                    '&FSINIES='+fsinies+'&CCAUSIN='+ccausin+'&CMOTSIN='+cmotsin+'&NRIESGO='+nriesgo+
                                                                                    '&SPRODUC='+sproduc+'&CACTIVI='+cactivi+'&NSINIES='+pnsinies.toString()+'&NTRAMIT='+pntramit+
                                                                                    '&CTIPRES='+pctipres+'&NMOVRES='+pnmovres+'&CGARANT='+pcgarant+'&MODO=VARIARRES');
            }
            else{
                    alert('<axis:alt f='axissin006' c='RESERVA_NOMODIF' lit='9900999'/>');
            }
    
    }
</script>

<form name="${nombrePantalla}${nombreSeccion}" action="" method="POST"> 
	<!--  RESERVAS -->
	<c:set var="title1"><axis:alt f="axissin006" c="NUMERO" lit="800440" /></c:set><!--Nº-->
	<c:set var="title2"><axis:alt f="axissin006" c="TIPO" lit="100565" /></c:set><!--Tipo-->
	<c:set var="title3"><axis:alt f="axissin006" c="GARANTIA" lit="110994" /></c:set><!--Garantia -->
	<c:set var="title4"><axis:alt f="axissin006" c="DATA" lit="9906065" /></c:set><!--data-->
	<c:set var="title5"><axis:alt f="axissin006" c="CALCUL" lit="9001023" /></c:set><!--Calcul -->
	<c:set var="title6"><axis:alt f="axissin006" c="ICOST" lit="9001024" /></c:set><!-- ICost -->
	<c:set var="title7"><axis:alt f="axissin006" c="IRESERVA" lit="9900790" /></c:set><!-- IRESERVA PDTE. -->             
	<c:set var="title8"><axis:alt f="axissin006" c="IPAGOS" lit="9900791" /></c:set><!-- IPagos -->
	<c:set var="title9"><axis:alt f="axissin006" c="IRECOBROS" lit="9900792" /></c:set><!-- IRecobros -->
	<c:set var="title0"><axis:alt f="axissin006" c="FINI" lit="9000526" /></c:set><!-- F_ini-->
	<c:set var="title10"><axis:alt f="axissin006" c="FFIN" lit="9000527" /></c:set><!-- F_fin-->
	<c:set var="title11"><axis:alt f="axissin006" c="ICAPRISC" lit="9902924" /></c:set><!-- Import capital risc-->
	<c:set var="title12"><axis:alt f="axissin006" c="IPENALI" lit="9900794" /></c:set><!-- Import penalització-->
	<c:set var="title13"><axis:alt f="axissin006" c="IPREVISION" lit="9900853"/></c:set><!-- Import prevision recobro -->
	<c:set var="title14"><axis:alt f="axissin006" c="FULTPAGO" lit="9901035"/></c:set><!-- F.Ult.Pag. -->
	<c:set var="title15"><axis:alt f="axissin006" c="DIAS" lit="9900972"/></c:set><!-- Dias -->
	<c:set var="title16"><axis:alt f="axissin006" c="CTIPGAS" lit="9902296"/></c:set><!-- Tipo de Gasto -->
	<c:set var="title99"><axis:alt f="axissin006" c="TMONRES" lit="108645"/></c:set><!-- Moneda -->
	<c:set var="title17"><axis:alt f="axissin006" c="IFRANQ" lit="9000940"/></c:set><!-- Franquicia -->
	<c:set var="title18"><axis:alt f="axissin006" c="ITOTIMP" lit="9906301"/></c:set><!-- Importe impuestos -->
	<c:set var="title19"><axis:alt f="axissin006" c="NDIAS" lit="9900972"/></c:set><!-- Dias -->
        <c:set var="title20"><axis:alt f="axissin006" c="ITOTRET" lit="9906813"/></c:set><!-- Dias -->
        <c:set var="title21"><axis:alt f="axissin037" c="FCAMBIO" lit="9900897"/></c:set><!-- Fecha cambio -->
        <c:set var="title22"><axis:alt f="axissin037" c="ITASACAMBIO" lit="9909298"/></c:set><!-- Tasa cambio -->
        
        <c:set var="title23"><axis:alt f="axissin037" c="IRESERVA_MONCIA" lit="9909304"/></c:set><!-- Imp. Reserva pte. en pesos -->
        <c:set var="title24"><axis:alt f="axissin037" c="IPAGO_MONCIA" lit="9909305"/></c:set><!-- Imp. Pago en pesos -->
        <c:set var="title25"><axis:alt f="axissin037" c="IRECOBRO_MONCIA" lit="9909306"/></c:set><!-- Imp. Recobro en pesos -->
        <c:set var="title26"><axis:alt f="axissin037" c="ICAPRIE_MONCIA" lit="9909307"/></c:set><!-- Imp. Capital Riesgo en pesos -->
        <c:set var="title27"><axis:alt f="axissin037" c="IPENALI_MONCIA" lit="9909308"/></c:set><!-- Imp. Penalización en pesos -->
        <c:set var="title28"><axis:alt f="axissin037" c="IPREREC_MONCIA" lit="9909309"/></c:set><!-- Imp. previsión recobro en pesos -->
        <c:set var="title29"><axis:alt f="axissin037" c="ICOSTE_MONCIA" lit="9909310"/></c:set><!-- Importe Coste en pesos -->
	<c:set var="title30"><axis:alt f="axissin006" c="CSOLIDARIDAD" lit="9910049"/></c:set><!-- Solidaridad -->
	
        <c:set var="num_tramitacion">0</c:set>
    
    <div id="modal" style="position:relative;display:none" >
        <div id="ventana" class="seccion" style="border-width:15px; border:solid; position:absolute; display:none; left: 25%; z-index: 1; width:500px; height:120px; padding-left:10%; padding-right:10%; opacity: 0.9; filter: alpha(opacity=90)">        
            <br><br>
            <b><div id="modal_texto"></div></b>
            <br><br>
            <div class="baseboton">
                <input type="button" class="boton" style="float:left;" onclick="toogle('none','modal','ventana')" value="<axis:alt f="axissin006" c="lit_108211" lit="108211"/>"/> 
                <input type="button" class="boton" style="float:right; margin-left:10px;" onclick="f_no()" value="<axis:alt f="axissin006" c="lit_101779" lit="101779"/>"/>
                <input type="button" class="boton" style="float:right;" onclick="f_si()" value="<axis:alt f="axissin006" c="lit_101778" lit="101778"/>"/>
            </div>
        </div>
    </div>
                        
	<div id="divDatSinTramRes" class="displayspaceGrande" style="overflow-x:auto;">
	<%int i = 0;%>
        <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.RESERVAS}" id="T_IAX_TRAM_RESERVAS" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
        requestURI="">
            <c:set var="i"><%=i%></c:set>
            <%@ include file="../include/displaytag.jsp"%>
            <axis:visible f="axissin006" c="RADIO_RESERVA">
                <display:column title="" sortable="false" sortProperty="" headerClass="sortable"  media="html" autolink="false">
                    <div class="dspIcons">
                        <input  onClick="javascript:f_getReserva('${i}')" 
                        <c:if test="${__formdata.indexReserva == i }"> checked </c:if>
                        value="" type="radio" id="radioNTRAM" name="radioNTRAM"/>
                    </div>
                </display:column>
            </axis:visible>
            <axis:visible f="axissin006" c="NMOVRES">
                <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_SIN_TRAMI_RESERVA.NTRAMIT" headerClass="sortable" media="html" autolink="false">
                    <div class="dspNumber">${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.NMOVRES}</div>
                </display:column>
            </axis:visible>
            <axis:visible f="axissin006" c="TTIPRES">
                <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false">
                    <div class="dspText">${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.TTIPRES}</div>    
                </display:column>
            </axis:visible>
            
            <axis:visible c="CSOLIDARIDAD" f="axissin006">
                <display:column title="${title30}" sortable="false" headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >
                    <div class="dspIcons"><a name="check_solidaridad_${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.NMOVRES}_${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.TTIPRES}"/>
                      <input type="checkbox" id="check_solidaridad_${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.NMOVRES}_${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.TTIPRES}"  <c:if test="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CSOLIDARIDAD == 1}"> checked </c:if>  value=""  disabled="disabled"  />
                    </div>
                </display:column>
            </axis:visible>
            <axis:visible f="axissin006" c="TGARANT">
                <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText">${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.TGARANT}</div>    
                </display:column>
            </axis:visible>
            <axis:visible f="axissin006" c="FMOVRES">
                <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.FMOVRES}"/></div>    
                </display:column>
            </axis:visible>
            <axis:visible f="axissin006" c="TCALRES">
                <display:column title="${title5}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText">${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.TCALRES}</div>    
                </display:column>
            </axis:visible>
            <axis:visible f="axissin006" c="TMONRES">
                <display:column title="${title99}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText" title="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.TMONRES}" >${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CMONRESINT}</div>    
                </display:column>
            </axis:visible>
            <axis:visible f="axissin006" c="ICOSTE">
                <display:column title="${title6}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${(T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IRESERVA + T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IPAGO + T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.ITOTIMP) - (T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IINGRESO + T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IRECOBRO + T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.ITOTRET)}"/></div>   
                </display:column>
            </axis:visible>
            <axis:visible f="axissin006" c="ITOTIMP">
                <display:column title="${title18}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.ITOTIMP}"/></div>   
                </display:column>
            </axis:visible>
            <axis:visible f="axissin006" c="ITOTRET">
                <display:column title="${title20}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.ITOTRET}"/></div>   
                </display:column>
            </axis:visible>
            <axis:visible f="axissin006" c="IFRANQ_RESERVA">
                <display:column title="${title17}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IFRANQ}"/></div>   
                </display:column>
            </axis:visible>
            <axis:visible f="axissin006" c="IRESERVA">
                <display:column title="${title7}" sortable="false" sortProperty="OB_IAX_SIN_TRAMI_RESERVA.IRESERVA" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatNumber  value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IRESERVA}"/></div>    
                </display:column>                             
            </axis:visible>
            <axis:visible f="axissin006" c="IPAGO">
                <display:column title="${title8}" sortable="false" sortProperty="OB_IAX_SIN_TRAMI_RESERVA.IPAGO" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatNumber  value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IPAGO}"/></div>    
                </display:column>
            </axis:visible>
            <axis:visible f="axissin006" c="IRECOBRO">
                <display:column title="${title9}" sortable="false" sortProperty="OB_IAX_SIN_TRAMI_RESERVA.IRECOBRO" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IRECOBRO}"/></div>    
                </display:column>
            </axis:visible>
            <axis:visible f="axissin006" c="ICAPRIE">
                <display:column title="${title11}" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.ICAPRIE}"/></div>
                </display:column>
            </axis:visible>
            <axis:visible f="axissin006" c="IPENALI">
                <display:column title="${title12}" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IPENALI}"/></div>
                </display:column>
            </axis:visible>
            <axis:visible f="axissin006" c="IPREREC">
                <display:column title="${title13}" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IPREREC}"/></div>
                </display:column>
            </axis:visible> 			
			<axis:visible f="axissin006" c="ICOSTE_MONCIA">
				<display:column title="${title29}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${(T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IRESERVA_MONCIA + T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IPAGO_MONCIA + T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.ITOTIMP_MONCIA ) - (T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IINGRESO_MONCIA + T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IRECOBRO_MONCIA + T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.ITOTRET_MONCIA)}"/></div>   
                </display:column>
			</axis:visible>
			<axis:visible f="axissin006" c="ICOSTE_RES">	
				<display:column title="${title6}" sortable="false" sortProperty="OB_IAX_SIN_TRAMI_RESERVA.IPAGO" headerClass="sortable" media="html" autolink="false" >
					 <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CMONRES]}" value="${(T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IRESERVA + T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IPAGO + T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.ITOTIMP ) - (T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IINGRESO + T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IRECOBRO + T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.ITOTRET)}"/></div>   
					 </div>    
				</display:column>   
			</axis:visible>	
            <axis:visible f="axissin006" c="ITOTIMP_MONCIA">
                <display:column title="${title18}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.ITOTIMP_MONCIA}"/></div>   
                </display:column>
            </axis:visible>
            <axis:visible f="axissin006" c="ITOTRET_MONCIA">
                <display:column title="${title20}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.ITOTRET_MONCIA}"/></div>   
                </display:column>
            </axis:visible>
			<axis:visible f="axissin006" c="IRESERVA_MONCIA">
				<display:column title="${title23}" sortable="false" sortProperty="OB_IAX_SIN_TRAMI_RESERVA.IRESERVA" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IRESERVA_MONCIA}"/></div>    
                </display:column>  
			</axis:visible>
			<axis:visible f="axissin006" c="IRESERVA_RES">	
				<display:column title="${title7}" sortable="false" sortProperty="OB_IAX_SIN_TRAMI_RESERVA.IRESERVA" headerClass="sortable" media="html" autolink="false" >
					 <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CMONRES]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IRESERVA}"/></div>    
					 </div>    
				</display:column>   
			</axis:visible>	
			<axis:visible f="axissin006" c="IPAGO_MONCIA">
				<display:column title="${title24}" sortable="false" sortProperty="OB_IAX_SIN_TRAMI_RESERVA.IPAGO" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IPAGO_MONCIA}"/></div>    
                </display:column> 
			</axis:visible>
			<axis:visible f="axissin006" c="IPAGO_RES">	
				<display:column title="${title8}" sortable="false" sortProperty="OB_IAX_SIN_TRAMI_RESERVA.IPAGO" headerClass="sortable" media="html" autolink="false" >
					 <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CMONRES]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IPAGO}"/></div>
					 </div>    
				</display:column>   
			</axis:visible>	
			<axis:visible f="axissin006" c="IRECOBRO_MONCIA">
                <display:column title="${title25}" sortable="false" sortProperty="OB_IAX_SIN_TRAMI_RESERVA.IRECOBRO" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IRECOBRO_MONCIA}"/></div>    
                </display:column>
            </axis:visible>
			<axis:visible f="axissin006" c="IRECOBRO_RES">	
				<display:column title="${title9}" sortable="false" sortProperty="OB_IAX_SIN_TRAMI_RESERVA.IRECOBRO" headerClass="sortable" media="html" autolink="false" >
					 <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CMONRES]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IRECOBRO}"/></div>    
					 </div>    
				</display:column>   
			</axis:visible>	
            <axis:visible f="axissin006" c="ICAPRIE_MONCIA">
                <display:column title="${title26}" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.ICAPRIE_MONCIA}"/></div>
                </display:column>
            </axis:visible>
			<axis:visible f="axissin006" c="ICAPRIE_RES">
                <display:column title="${title11}" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CMONRES]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.ICAPRIE}"/></div>
                </display:column>
            </axis:visible>
            <axis:visible f="axissin006" c="IPENALI_MONCIA">
                <display:column title="${title27}" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IPENALI_MONCIA}"/></div>
                </display:column>
            </axis:visible>
			<axis:visible f="axissin006" c="IPENALI_RES">
                <display:column title="${title12}" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CMONRES]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IPENALI}"/></div>
                </display:column>
            </axis:visible>
            <axis:visible f="axissin006" c="IPREREC_MONCIA">
                <display:column title="${title28}" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IPREREC_MONCIA}"/></div>
                </display:column>
            </axis:visible> 
			<axis:visible f="axissin006" c="IPREREC_RES">
                <display:column title="${title13}" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CMONRES]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IPREREC}"/></div>
                </display:column>
            </axis:visible> 
            
            <axis:visible f="axissin006" c="FCAMBIO">
                <display:column title="${title21}" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.FCAMBIO}"/></div>
                </display:column>
            </axis:visible>
            
            <axis:visible f="axissin006" c="ITASACAMBIO">
                <display:column title="${title22}" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatNumber  pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.ITASACAMBIO}"/></div>
                </display:column>
            </axis:visible>    
            
            <axis:visible f="axissin006" c="FRESINI">
                <display:column title="${title0}" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.FRESINI}"/></div>
                </display:column>
            </axis:visible>
            <axis:visible f="axissin006" c="FRESFIN">
                <display:column title="${title10}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.FRESFIN}"/></div>
                </display:column>
            </axis:visible>
            <axis:visible f="axissin006" c="NDIAS">
                <display:column title="${title19}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                    <div class="dspText">${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.NDIAS}</div>
                </display:column>
            </axis:visible>
            <axis:visible f="axissin006" c="FULTPAG">
                <display:column title="${title14}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.FULTPAG}"/></div>
                </display:column>
            </axis:visible>
            <axis:visible f="axissin006" c="DIAS">
                <display:column title="${title15}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatNumber pattern="###,##0" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.NDIAS}"/></div>
                </display:column>
            </axis:visible>
            <axis:visible f="axissin006" c="CTIPGAS">
                <display:column title="${title16}" headerClass="headwidth5 sortable" media="html" autolink="false" >                                    
                    <div class="dspText">${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.TTIPGAS}</div>  
                </display:column>
            </axis:visible>
            <axis:visible f="axissin006" c="GPAGO">
                <display:column title="" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspIcon">
                        <c:if test="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CTIPRES == 1}">
                        <a href="javascript:f_generar_pago('${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CTIPRES}','${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CTIPGAS}','${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CGARANT}',
                        '<fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.FRESINI}"/>',
                        '<fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.FRESFIN}"/>','${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IDRES}')">
                            <img border="0" alt="<axis:alt f="axissin006" c="GENPAGS_AUTO" lit="9900968" />" title="<axis:alt f="axissin006" c="BILLETE_AUTO" lit="9900968" />" src="images/billete.jpg"/>
                        </a>
                        </c:if>
                    </div>
                </display:column>
            </axis:visible>
            <axis:visible f="axissin006" c="EDITAR">
                <display:column title="" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspIcon" id="EDITAR">
                        <c:if test="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.MODIFICABLE == 1}">
                        <a href="javascript:f_editar_res('${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.NSINIES}','${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.NTRAMIT}','${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CTIPRES}','${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.NMOVRES}','${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CGARANT}','${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IRESERVA}')">
                            <img border="0" alt="<axis:alt f="axissin006" c="EDITAR_AUTO" lit="100002" />" title="<axis:alt f="axissin006" c="EDITAR2_AUTO" lit="100002" />" src="images/lapiz.gif"/>
                        </a>
                        </c:if>
                    </div>
                </display:column>
            </axis:visible>
            
            <axis:visible f="axissin006" c="VARIARRES">
                <display:column title="" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspIcon"  id="VARIARRES" >
                        <a href="javascript:f_variar_res('${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.NSINIES}','${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.NTRAMIT}','${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CTIPRES}','${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.NMOVRES}','${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CGARANT}','${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IRESERVA}')">
                            <img border="0" alt="<axis:alt f="axissin006" c="VARIAR_AUTO" lit="100002" />" title="<axis:alt f="axissin006" c="VARIAR_AUTO" lit="100002" />" src="images/lapiz.gif"/>
                        </a>
                    </div>
                </display:column>
            </axis:visible>
            
            <axis:visible f="axissin006" c="BORRAR">
                <display:column title="" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspIcon" id="BORRAR">
                        <c:if test="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.BORRAR == 1}">
                        <a href="javascript:f_borrar_res('${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.NSINIES}','${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.NTRAMIT}','${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CTIPRES}','${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CTIPGAS}','${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CGARANT}','${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.NMOVRES}')">
                            <img border="0" alt="<axis:alt f="axissin006" c="BORRAR_AUTO" lit="9001333" />" title="<axis:alt f="axissin006" c="BORRAR_AUTO2" lit="9001333" />" src="images/delete.gif"/>
                        </a>
                        </c:if>
                    </div>
                </display:column>
            </axis:visible> 
            <axis:visible f="axissin006" c="HISTORICO">
                <display:column title="" headerClass="sortable" media="html" autolink="false" >
                <div class="dspIcon">
                    <a href="javascript:f_but_historico('${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.NSINIES}','${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.NTRAMIT}','${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CTIPRES}','${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CTIPGAS}','${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CGARANT}','${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.NMOVRES}','${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CMONRES}')">
                        <img border="0" alt="<axis:alt f="axissin006" c="HISTORICO_RESERVAS" lit="9900943" />" title="<axis:alt f="axissin006" c="HISTORICO2_RESERVAS" lit="9900943" />" src="images/mes.gif"/>
                    </a>
                </div>
                </display:column>
            </axis:visible> 
        <%i++;%>
        </display:table>
	</div> 

	<script type="text/javascript">
		document.getElementById("divDatSinTramRes").style.width= (objUtiles.miInnerWidth()*0.88) + 'px'; 
		document.getElementById("divDatSinTramRes").style.maxHeight= "162px";
	</script>
	<table>
		<tr>
			<td>
				<table class="area" align="center">
					<tr>
						<th style="height:0px"></th>
					</tr>
					<axis:visible f="axissin006" c="DSP_DETRESERVASPAGOS">
						<c:if test="${sessionScope.CMODO eq 'CONSULTA_SINIESTROS' && 
						!empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.RESERVAS[__formdata.indexReserva].OB_IAX_SIN_TRAMI_RESERVA.PAGOSRESERVA}">
						<!-- Inicio Seccion -->
						<tr>
							<td>
								<div style="float:left;">
									<b><axis:alt f="axissin006" c="DETALLE_PAGO" lit="9000937"/></b><!-- DETALLE PAGO RESERVA -->
								</div>
							</td>
						</tr>
						<tr>
							<td>
							<!-- TABLA SECCION  RESERVAS DETALLE PAGO RESERVA -->
								<c:set var="title1"><axis:alt f="axissin006" c="NUM_PAGO" lit="800440" /></c:set><!--Numero-->
								<c:set var="title2"><axis:alt f="axissin006" c="ESTADO_PAGO" lit="100587" /></c:set><!--Estado-->
								<c:set var="title3"><axis:alt f="axissin006" c="CONCEPTO_PAGO" lit="9000715" /></c:set><!--Concepto -->
								<c:set var="title4"><axis:alt f="axissin006" c="DESTINATARIO_PAGO" lit="9000909" /></c:set><!-- Destinatario -->
								<c:set var="title5"><axis:alt f="axissin006" c="FPAGO_PAGO" lit="100712" /></c:set><!-- Forma Pago -->
								<c:set var="title6"><axis:alt f="axissin006" c="FORDEN_PAGO" lit="9000910" /></c:set><!-- Fecha orden -->
								<c:set var="title7"><axis:alt f="axissin006" c="NFACTURA_PAGO" lit="9000469" /></c:set><!-- N Factura -->
								<c:set var="title8"><axis:alt f="axissin006" c="FFACTURA_PAGO" lit="9000956" /></c:set><!-- Fecha factura -->
								<c:set var="title9"><axis:alt f="axissin006" c="IBRUTO_PAGO" lit="9000938" /></c:set><!-- Importe Bruto -->
								<c:set var="title10"><axis:alt f="axissin006" c="DETALLE_PAGO2" lit="1000113" /></c:set><!-- Detalle -->
								<c:set var="num_reserva">0</c:set>
								<div class="displayspace"> 
									<display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.RESERVAS[__formdata.indexReserva].OB_IAX_SIN_TRAMI_RESERVA.PAGOSRESERVA}" id="T_IAX_TRAMRESPAGOS" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
									requestURI="">
									<%@ include file="../include/displaytag.jsp"%>
										<display:column title="${title1}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
											<div class="dspText">${T_IAX_TRAMRESPAGOS.SIDEPAG}</div>    
										</display:column>
										<display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
											<div class="dspText">${T_IAX_TRAMRESPAGOS.TESTPAG}</div>    
										</display:column>
										<display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
											<div class="dspText">${T_IAX_TRAMRESPAGOS.TCONPAG}</div>    
										</display:column>
										<display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
											<div class="dspText">${T_IAX_TRAMRESPAGOS.TNOMBRE}</div>    
										</display:column>
										<display:column title="${title5}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
											<div class="dspText">${T_IAX_TRAMRESPAGOS.TFORPAG}</div>    
										</display:column>
										<display:column title="${title6}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
											<div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAMRESPAGOS.FORDPAG}"/></div>    
										</display:column>
										<display:column title="${title7}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
											<div class="dspText">${T_IAX_TRAMRESPAGOS.NFACREF}</div>    
										</display:column>
										<display:column title="${title8}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
											<div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAMRESPAGOS.FFACREF}"/></div>    
										</display:column>
										<display:column title="${title9}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
											<div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAMRESPAGOS.ISINRET}"/></div>    
										</display:column>
										<display:column title="${title10}" headerClass="headwidth5 sortable" media="html" autolink="false" >
											<div class="dspIcons">
											<img border="0" alt="<axis:alt f="axissin006" c="EDITAR_PAGO" lit="100002"/>" title1="<axis:alt f="axissin006" c="EDITAR2_PAGO" lit="100002"/>" src="images/mes.gif" width="11px" height="11px"
											style="cursor:pointer;"   onmouseout="javascript:ocultar('SECCION_B${T_IAX_TRAMRESPAGOS.SIDEPAG}')" onmouseover="javascript:mostrar('SECCION_B${T_IAX_TRAMRESPAGOS.SIDEPAG}')"    /></div>
										</display:column>
										<!-- *************************** SECCION MÁS DATOS ********************************* -->
										<display:column class="seccion_informacion">
											<div id="SECCION_B${T_IAX_TRAMRESPAGOS.SIDEPAG}" class="seccion_informacion">
												<!-- INICIO SECCION -->
												<table class="area" align="center">
													<tr>
														<th style="width:25%;height:0px"></th>
														<th style="width:25%;height:0px"></th>
														<th style="width:25%;height:0px"></th>
														<th style="width:25%;height:0px"></th>
													</tr>
													<tr>
														<%-- Causa indemnizacion --%>
														<td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
															<b><axis:alt f="axissin006" c="CAUSA_MASDATOS" lit="9001199"/></b>
														</td>
														<%-- Tipo Cuenta --%>
														 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >
															<b><axis:alt f="axissin006" c="TCUENTA_MASDATOS" lit="9001200"/></b>
														</td>                                                  
														 <%--Nº Cuenta --%>
														<td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
															<b><axis:alt f="axissin006" c="NCUENTA_MASDATOS" lit="9000533"/></b>
														</td> 
														<%-- Importe Retencion --%>
														<td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
															<b><axis:alt f="axissin006" c="IRETENC_MASDATOS" lit="9001030"/></b>
														</td>
													</tr>
													<tr>
														 <%-- Causa indeminzacion --%>
														<td class="campocaja" style="background-color:white;border-right-width: 0px;">
															<input type="text" class="campo campotexto" id="CAMPO1" name="CAMPO1" size="15" style="width:90%"
															value="${T_IAX_TRAMRESPAGOS.TCAUIND}" readonly="readonly"/>
														</td>
														 <%-- tipo cuenta --%>
														<td class="campocaja" style="background-color:white;border-right-width: 0px;">
															<input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"
															value="${T_IAX_TRAMRESPAGOS.TTIPBAN}" readonly="readonly"/>
														</td>
														<%-- N0 Cuenta --%>
														<td class="campocaja" style="background-color:white;border-right-width: 0px;">
															<input type="text" class="campo campotexto" id="CAMPO3" name="CAMPO3" size="15" style="width:90%"
															value="${T_IAX_TRAMRESPAGOS.CBANCAR}" readonly="readonly"/>
														</td>
														 <%-- Importe Retencion --%>
														<td class="campocaja" style="background-color:white;border-right-width: 0px;">
															<input type="text" class="campo campotexto" id="CAMPO4" name="CAMPO4" size="15" style="width:90%"
															value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAMRESPAGOS.IRETENC}"/>" readonly="readonly"/>
														</td>                                  
													</tr>
													<tr>
														<%-- Import IVA --%>
														<td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
															<b><axis:alt f="axissin006" c="IIVA_MASDATOS" lit="101340"/></b>
														</td>
														<%-- I Supliment --%>
														<td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >
															<b><axis:alt f="axissin006" c="ISUPLIMENT_MASDATOS" lit="9001201"/></b>
														</td>                                                  
														 <%--I Franquicia--%>
														<td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
															<b><axis:alt f="axissin006" c="IFRANQ_MASDATOS" lit="9000940"/></b>
														</td> 
														<%-- I. rendimiento capital mobiliario --%>
														<td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
															<b><axis:alt f="axissin006" c="IRCM_MASDATOS" lit="9001202"/></b>
														</td>
													</tr>
													<tr>
														<%-- Import IVA --%>
														<td class="campocaja" style="background-color:white;border-right-width: 0px;">
															<input type="text" class="campo campotexto" id="CAMPO1" name="CAMPO1" size="15" style="width:90%"
															value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAMRESPAGOS.IIVA}"/>" readonly="readonly"/>
														</td>
														<%-- I Supliment --%>
														<td class="campocaja" style="background-color:white;border-right-width: 0px;">
															<input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"
															value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAMRESPAGOS.ISUPLID}"/>" readonly="readonly"/>
														</td>
														<%-- I Franquicia --%>
														<td class="campocaja" style="background-color:white;border-right-width: 0px;">
															<input type="text" class="campo campotexto" id="CAMPO3" name="CAMPO3" size="15" style="width:90%"
															value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAMRESPAGOS.IFRANQ}"/>" readonly="readonly"/>
														</td>
														<%-- I. rendimiento capital mobiliario --%>
														<td class="campocaja" style="background-color:white;border-right-width: 0px;">
															<input type="text" class="campo campotexto" id="CAMPO4" name="CAMPO4" size="15" style="width:90%"
															value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAMRESPAGOS.IRESRCM}"/>" readonly="readonly"/>
														</td>                                  
													</tr>
													 <tr>
														<%-- I rendimento reduit --%>
														<td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
															<b><axis:alt f="axissin006" c="IRESRED_MASDATOS" lit="9001203"/></b>
														</td>
														<%-- Data Inici periode --%>
														<td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >
															<b><axis:alt f="axissin006" c="FINICI_MASDATOS" lit="9000526"/></b>
														</td>                                                  
														<%-- Data final periode --%>
														<td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
															<b><axis:alt f="axissin006" c="FFINAL_MASDATOS" lit="9000527"/></b>
														</td> 
														<%--  --%>
														<td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
															
														</td>
													</tr>
													<tr>
														<%-- I rendimento reduit --%>
														<td class="campocaja" style="background-color:white;border-right-width: 0px;">
															<input type="text" class="campo campotexto" id="CAMPO1" name="CAMPO1" size="15" style="width:90%"
															value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAMRESPAGOS.IRESRED}"/>" readonly="readonly"/>
														</td>
														 <%-- Data Inici periode --%>
														<td class="campocaja" style="background-color:white;border-right-width: 0px;">
															<input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"
															value="<fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAMRESPAGOS.FPERINI}"/>" readonly="readonly"/>
														</td>
														<%-- Data final periode --%>
														<td class="campocaja" style="background-color:white;border-right-width: 0px;">
															<input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"
															value="<fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAMRESPAGOS.FPERFIN}"/>" readonly="readonly"/>
														</td>
													</tr>
												</table>
											</div>
										</display:column>
										<!-- *************************** SECCION MÁS DATOS ********************************* -->                       
									</display:table>
								</div>
								<!-- FIN  -->
							</td>
						</tr> 
						</c:if> 
					</axis:visible>
					<axis:visible f="axissin006" c="DSP_DETRESERVASRECOBROS">
						<c:if test="${sessionScope.CMODO eq 'CONSULTA_SINIESTROS' && 
						!empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.RESERVAS[__formdata.indexReserva].OB_IAX_SIN_TRAMI_RESERVA.RECOBROSRESERVA}">
						<tr>
							<td>
								<div style="float:left;">
									<b><axis:alt f="axissin006" c="DETALLE_RECOBRO" lit="9000949"/></b> <!-- DETALLE RECOBRO RESERVA -->
								</div>
							</td>
						</tr>
						<tr>
							<td>
							<!-- TABLA SECCION  DETALLE RECOBRO RESERVA -->
								<c:set var="title1"><axis:alt f="axissin006" c="NUM_RECOBRO" lit="800440" /></c:set><!--Numero-->
							    <c:set var="title2"><axis:alt f="axissin006" c="ESTADO_RECOBRO" lit="100587" /></c:set><!--Estado-->
								<c:set var="title3"><axis:alt f="axissin006" c="CONCEPTO_RECOBRO" lit="9000715" /></c:set><!--Concepto -->
								<c:set var="title4"><axis:alt f="axissin006" c="DESTINA_RECOBRO" lit="9000909" /></c:set><!-- Destinatario -->
								<c:set var="title5"><axis:alt f="axissin006" c="FPAGO_RECOBRO" lit="100712" /></c:set><!-- Forma Pago -->
								<c:set var="title6"><axis:alt f="axissin006" c="FORDEN_RECOBRO" lit="9000910" /></c:set><!-- Fecha orden -->
								<c:set var="title7"><axis:alt f="axissin006" c="NFACTURA_RECOBRO" lit="9000469" /></c:set><!-- N Factura -->
								<c:set var="title8"><axis:alt f="axissin006" c="FFACTURA_RECOBRO" lit="9000956" /></c:set><!-- Fecha factura -->
								<c:set var="title9"><axis:alt f="axissin006" c="IBRUTO_RECOBRO" lit="9000938" /></c:set><!-- Importe Bruto -->
								<c:set var="title10"><axis:alt f="axissin006" c="DETALLE_RECOBRO2" lit="1000113" /></c:set><!-- Detalle -->
								<div class="displayspace">
									<display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.RESERVAS[__formdata.indexReserva].OB_IAX_SIN_TRAMI_RESERVA.RECOBROSRESERVA}" id="T_IAX_TRAMRESPAGOS" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
									requestURI="">
									<%@ include file="../include/displaytag.jsp"%>
										<display:column title="${title1}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
											<div class="dspText">${T_IAX_TRAMRESPAGOS.SIDEPAG}</div>    
										</display:column>
										<display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
											<div class="dspText">${T_IAX_TRAMRESPAGOS.TESTPAG}</div>    
										</display:column>
										<display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
											<div class="dspText">${T_IAX_TRAMRESPAGOS.TCONPAG}</div>    
										</display:column>
										<display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
											<div class="dspText">${T_IAX_TRAMRESPAGOS.TNOMBRE}</div>    
										</display:column>
										<display:column title="${title5}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
											<div class="dspText">${T_IAX_TRAMRESPAGOS.TFORPAG}</div>    
										</display:column>
										<display:column title="${title6}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
											<div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAMRESPAGOS.FORDPAG}"/></div>    
										</display:column>
										<display:column title="${title7}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
											<div class="dspText">${T_IAX_TRAMRESPAGOS.NFACREF}</div>    
										</display:column>
										<display:column title="${title8}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
											<div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAMRESPAGOS.FFACREF}"/></div>    
										</display:column>
										<display:column title="${title9}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
											<div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAMRESPAGOS.ISINRET}"/></div>    
										</display:column>
										<display:column title="${title10}" headerClass="headwidth5 sortable" media="html" autolink="false" >
											<div class="dspIcons"><img border="0" alt="<axis:alt f="axissin006" c="EDITAR_RECOBRO" lit="100002"/>" title1="<axis:alt f="axissin006" c="EDITAR2_RECOBRO" lit="100002"/>" src="images/mes.gif" width="11px" height="11px"
											style="cursor:pointer;"   onmouseout="javascript:ocultar('SECCION_B${T_IAX_TRAMRESPAGOS.SIDEPAG}')" onmouseover="javascript:mostrar('SECCION_B${T_IAX_TRAMRESPAGOS.SIDEPAG}')"    /></div>
										</display:column>
										<!-- *************************** SECCION MÁS DATOS ********************************* -->
										<display:column class="seccion_informacion">
											<div id="SECCION_B${T_IAX_TRAMRESPAGOS.SIDEPAG}" class="seccion_informacion">
												<!-- INICIO SECCION -->
												<table class="area" align="center">
													<tr>
														<th style="width:25%;height:0px"></th>
														<th style="width:25%;height:0px"></th>
														<th style="width:25%;height:0px"></th>
														<th style="width:25%;height:0px"></th>
													</tr>
													<tr>
														<%-- Causa indemnizacion --%>
														<td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
															<b><axis:alt f="axissin006" c="CAUSA_MASDATOS2" lit="9001199"/></b>
														</td>
														<%-- Tipo Cuenta --%>
														<td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >
															<b><axis:alt f="axissin006" c="TCUENTA_MASDATOS2" lit="9001200"/></b>
														</td>                                                  
														<%--Nº Cuenta --%>
														<td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
															<b><axis:alt f="axissin006" c="NCUENTA_MASDATOS2" lit="9000533"/></b>
														</td> 
														<%-- Importe Retencion --%>
														<td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
															<b><axis:alt f="axissin006" c="IRETENC_MASDATOS2" lit="9001030"/></b>
														</td>
													</tr>
													<tr>
														<%-- Causa indeminzacion --%>
														<td class="campocaja" style="background-color:white;border-right-width: 0px;">
															<input type="text" class="campo campotexto" id="CAMPO1" name="CAMPO1" size="15" style="width:90%"
															value="${T_IAX_TRAMRESPAGOS.TCAUIND}" readonly="readonly"/>
														</td>
														<%-- tipo cuenta --%>
														<td class="campocaja" style="background-color:white;border-right-width: 0px;">
															<input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"
															value="${T_IAX_TRAMRESPAGOS.TTIPBAN}" readonly="readonly"/>
														</td>
														<%-- N0 Cuenta --%>
														<td class="campocaja" style="background-color:white;border-right-width: 0px;">
															<input type="text" class="campo campotexto" id="CAMPO3" name="CAMPO3" size="15" style="width:90%"
															value="${T_IAX_TRAMRESPAGOS.CBANCAR}" readonly="readonly"/>
														</td>
														<%-- Importe Retencion --%>
														<td class="campocaja" style="background-color:white;border-right-width: 0px;">
															<input type="text" class="campo campotexto" id="CAMPO4" name="CAMPO4" size="15" style="width:90%"
															value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAMRESPAGOS.IRETENC}"/>" readonly="readonly"/>
														</td>                                  
													</tr>
													<tr>
														<%-- Import IVA --%>
														<td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
															<b><axis:alt f="axissin006" c="IIVA_MASDATOS2" lit="101340"/></b>
														</td>
														<%-- I Supliment --%>
														<td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >
															<b><axis:alt f="axissin006" c="ISUPLIMENT_MASDATOS2" lit="9001201"/></b>
														</td>                                                  
														<%--I Franquicia--%>
														<td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
															<b><axis:alt f="axissin006" c="IFRANQ_MASDATOS2" lit="9000940"/></b>
														</td> 
														<%-- I. rendimiento capital mobiliario --%>
														<td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
															<b><axis:alt f="axissin006" c="IRCM_MASDATOS2" lit="9001202"/></b>
														</td>
													</tr>
													<tr>
														<%-- Import IVA --%>
														<td class="campocaja" style="background-color:white;border-right-width: 0px;">
															<input type="text" class="campo campotexto" id="CAMPO1" name="CAMPO1" size="15" style="width:90%"
															value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAMRESPAGOS.IIVA}"/>" readonly="readonly"/>
														</td>
														<%-- I Supliment --%>
														<td class="campocaja" style="background-color:white;border-right-width: 0px;">
															<input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"
															value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAMRESPAGOS.ISUPLID}"/>" readonly="readonly"/>
														</td>
														<%-- I Franquicia --%>
														<td class="campocaja" style="background-color:white;border-right-width: 0px;">
															<input type="text" class="campo campotexto" id="CAMPO3" name="CAMPO3" size="15" style="width:90%"
															value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAMRESPAGOS.IFRANQ}"/>" readonly="readonly"/>
														</td>
														<%-- I. rendimiento capital mobiliario --%>
														<td class="campocaja" style="background-color:white;border-right-width: 0px;">
															<input type="text" class="campo campotexto" id="CAMPO4" name="CAMPO4" size="15" style="width:90%"
															value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAMRESPAGOS.IRESRCM}"/>" readonly="readonly"/>
														</td>                                  
													</tr>
													 <tr>
														<%-- I rendimento reduit --%>
														<td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
															<b><axis:alt f="axissin006" c="IRESRED_MASDATOS2" lit="9001203"/></b>
														</td>
														<%-- Data Inici periode --%>
														 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >
															<b><axis:alt f="axissin006" c="FINICI_MASDATOS2" lit="9000526"/></b>
														</td>                                                  
														<%-- Data final periode --%>
														<td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
															<b><axis:alt f="axissin006" c="FFIN_MASDATOS2" lit="9000527"/></b>
														</td> 
														<%--  --%>
														<td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
															
														</td>
													</tr>
													<tr>
														<%-- I rendimento reduit --%>
														<td class="campocaja" style="background-color:white;border-right-width: 0px;">
															<input type="text" class="campo campotexto" id="CAMPO1" name="CAMPO1" size="15" style="width:90%"
															value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAMRESPAGOS.IRESRED}"/>" readonly="readonly"/>
														</td>
														<%-- Data Inici periode --%>
														<td class="campocaja" style="background-color:white;border-right-width: 0px;">
															<input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"
															value="<fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAMRESPAGOS.FPERINI}"/>" readonly="readonly"/>
														</td>
														<%-- Data final periode --%>
														<td class="campocaja" style="background-color:white;border-right-width: 0px;">
															<input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"
															value="<fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAMRESPAGOS.FPERFIN}"/>" readonly="readonly"/>
														</td>
													</tr>
												</table>
											</div>
										</display:column>
										<!-- *************************** SECCION MÁS DATOS ********************************* -->                       
									</display:table>
								</div>
                                <!-- FIN  -->
                            </td>
                        </tr>                
                        </c:if>   
					</axis:visible>
                    <!-- Fin seccion -->
				</table>
			</td>
		</tr>
	</table>
</form>
