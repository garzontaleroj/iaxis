<%/* Revision:# lI1jl+rGlcixvNsCeOd39g== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="nombrePantalla" value="tramitaciones"/>
<c:set var="nombreSeccion" value="pagosofi"/>

<script type="text/javascript">

 function f_aceptar_axissin012(NSINIES, PANTALLA, SECCION,valor,sidepagout,isnew) {
            objUtiles.cerrarModal('axissin012');
            objDom.setValorPorId("NSINIES", NSINIES);
            document.miForm.subpantalla.value="tramitaciones";
            document.miForm.seccion.value="tramitaciones_"+SECCION;            
            if(!objUtiles.estaVacio(valor) && valor != 'null')
                document.miForm.OK.value=valor;
            if(!objUtiles.estaVacio(sidepagout) && sidepagout != 'null' && SECCION == 'pagos')
                document.miForm.SIDEPAG.value=sidepagout;
            if(!objUtiles.estaVacio(sidepagout) && sidepagout != 'null' && SECCION == 'recobros')
                document.miForm.SIDEPAGRECOB.value=sidepagout;            
            document.miForm.isNew.value=isnew;        
            objUtiles.ejecutarFormulario("axis_axissin006.do?", "cargarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);
 }
 function f_aceptar_axissin013(NSINIES, PANTALLA, SECCION) {
            objDom.setValorPorId("NSINIES", NSINIES);
            document.miForm.subpantalla.value="tramitaciones";
            document.miForm.seccion.value="tramitaciones_pagos";
            objUtiles.ejecutarFormulario ("axis_axissin006.do?NSINIESselected="+document.miForm.NSINIES.value, "inicializarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);
 }
 function f_aceptar_axissin014(NSINIES,PANTALLA,SECCION) {
            objDom.setValorPorId(NSINIES);       
            document.miForm.subpantalla.value="tramitaciones";
            document.miForm.seccion.value="tramitaciones_"+SECCION;
            document.miForm.OK.value="";
            objUtiles.ejecutarFormulario("axis_axissin006.do?", "cargarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);
 }  

function f_getPago(indexNou, sidepag){
           if (document.miForm.indexPago.value != indexNou){
              document.miForm.indexPago.value = indexNou;
              document.miForm.SIDEPAG.value = sidepag               
              document.miForm.subpantalla.value="tramitaciones";
              document.miForm.seccion.value="tramitaciones_pagos";
              objUtiles.ejecutarFormulario("axis_axissin006.do", "recargarPagos", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
}
        
function f_getPago_ofi(indexNou, sidepag){
           if (document.miForm.indexPago_ofi.value != indexNou){
              document.miForm.indexPago_ofi.value = indexNou;
               document.miForm.SIDEPAG_ofi.value = sidepag               
              document.miForm.subpantalla.value="tramitaciones";
              document.miForm.seccion.value="tramitaciones_pagos";
              objUtiles.ejecutarFormulario("axis_axissin006.do", "recargarPagos", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        
      

function f_imprimir_pago(SIDEPAG){        
        document.miForm.subpantalla.value="tramitaciones";
        document.miForm.seccion.value="tramitaciones_pagos";
        objDom.setValorPorId("IMP_SIDEPAG", 1);
        //objUtiles.ejecutarFormulario("axis_axissin006.do", "imprimirPago", document.miForm, "_self");        
        objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_pagosini&SSEGURO="+'${__formdata.OB_IAX_SINIESTRO.SSEGURO}'+"&SIDEPAG="+SIDEPAG+"&TIPO=SINIES_PAGO"+"&CCAUSIN="+'${__formdata.OB_IAX_SINIESTRO.CCAUSIN}'+"&CMOTSIN="+'${__formdata.OB_IAX_SINIESTRO.CMOTSIN}');
    }        
 
 
</script>
<form name="${nombrePantalla}${nombreSeccion}" action="axis_axissin006.do" method="POST">
        <input type="hidden" id="operation" name="operation" value="" />
        <axis:visible f="axissin006" c="DSP_PAGOS_GEN">
            <div ID="DSP_PAGOS_GEN">
                        <c:set var="title0"><axis:alt f="axissin006" c="SIDEPAG" lit="800440" /></c:set><!--Numero -->
                        <c:set var="title1"><axis:alt f="axissin006" c="TTIPPAG" lit="100565" /></c:set><!--Tipo-->
                        <c:set var="title2"><axis:alt f="axissin006" c="TCONPAG" lit="9000715" /></c:set><!--Concepto-->
                        <c:set var="title3"><axis:alt f="axissin006" c="TNOMBRE1" lit="9000909" /></c:set><!--Destinatario -->
                        <c:set var="title4"><axis:alt f="axissin006" c="TFORPAG" lit="100712" /></c:set><!-- Forma Pago -->
                        <c:set var="title5"><axis:alt f="axissin006" c="FORDPAG" lit="9000910" /></c:set><!-- Fecha orden -->
                        
                       <c:set var="title6"><axis:alt f="axissin006" c="NFACREF" lit="9000445" /></c:set><!-- num. factura -->
                       <c:set var="title7"><axis:alt f="axissin006" c="FFACREF" lit="9000451" /></c:set><!-- fecha factura -->
                        <c:set var="title8"><axis:alt f="axissin006" c="ISINRET1" lit="9000938" /></c:set><!--Importe Bruto-->
                        <c:set var="title9"><axis:alt f="axissin006" c="DSP_MAS_INFO" lit="1000113" /></c:set><!--  más informacion-->
                        <c:set var="title10"><axis:alt f="axissin006" c="BT_SIN_EDITAR_CAB_PAGO" lit="100002" /></c:set><!--  Editar-->
                        <c:set var="title11"><axis:alt f="axissin006" c="BT_IMPR_SIN_TRAMITA_PAGO" lit="100001" /></c:set><!--  Imprimir-->
                        <c:set var="title12"><axis:alt f="axissin006" c="CULTPAG" lit="9902312" /></c:set><!--  Ultimo pago-->
                        <c:set var="title13"><axis:alt f="axissin006" c="CMONRES" lit="9907718" /></c:set><!--  Moneda-->
                        <c:set var="numeroRegistros" value="${fn:length(__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.PAGOS[__formdata.indexPago].OB_IAX_SIN_TRAMI_PAGO.MOVPAGOS)}" />
                        <c:set var="estadopago" value="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.PAGOS[__formdata.indexPago].OB_IAX_SIN_TRAMI_PAGO.MOVPAGOS[numeroRegistros-1].OB_IAX_SIN_TRAMI_MOVPAGO.CESTPAG}" />
                        <c:set var="num_tramitacion">0</c:set>                        
                        <div class="displayspace">
                       <%int i = 0;%>
                           <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.PAGOS}" id="T_IAX_TRAM_PAGOS" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                           requestURI="">                                          
                           <c:set var="i"><%=i%></c:set>
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                               <div class="dspIcons"><input  onClick="javascript:f_getPago('${i}','${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.SIDEPAG}')" 
                               <c:if test="${__formdata.SIDEPAG == T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.SIDEPAG }"> checked </c:if>
                               value="" type="radio" id="radioNTRAM" name="radioNTRAM"/>
                               <input type="hidden" id="NCHEQUEH" name="NCHEQUEH" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.NCHEQUE}"/></div>
                            </display:column>
                            <display:column title="${title0}" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspNumber">${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.SIDEPAG}</div>
                            </display:column>
                            <display:column title="${title1}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText">${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.TTIPPAG}</div>    
                            </display:column>
                            <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText">${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.TCONPAG}</div>    
                            </display:column>
                            <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText"> ${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.DESTINATARI.PERSONA.TNOMBRE}
                                 ${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.DESTINATARI.PERSONA.TAPELLI1}
                                 ${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.DESTINATARI.PERSONA.TAPELLI2}
                                 </div>    
                            </display:column>
                            <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText">${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.TFORPAG}</div>    
                            </display:column>
                            <display:column title="${title5}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.FORDPAG}"/></div>    
                            </display:column>                            
                            <display:column title="${title6}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText">${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.NFACREF}</div>    
                            </display:column>
                            <display:column title="${title7}" sortable="false" sortProperty="OB_IAX_SIN_TRAMI_PAGO.FFACREF" headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.FFACREF}"/></div>    
                            </display:column>
                            <axis:visible f="axissin006" c="CULTPAG">
                            <display:column title="${title12}" sortable="false" sortProperty="CULTPAG" headerClass="sortable" media="html" autolink="false" >
                               <div class="dspIcons">  <input type="checkbox" disabled id="CULTPAG" name="CULTPAG" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.CULTPAG}" 
                                                    <c:if test="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.CULTPAG == '1'}">checked</c:if> ></div>    
                            </display:column>
                            
                            <display:column title="${title13}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText">${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.CMONRES}</div>    
                            </display:column>                            
                            
                            </axis:visible>
							<axis:visible f="axissin006" c="ISINRET_PAGO">
								<display:column title="${title8}" sortable="false" sortProperty="OB_IAX_SIN_TRAMI_PAGO.ISINRET" headerClass="sortable" media="html" autolink="false" >
									 <div class="dspText"><fmt:formatNumber  value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.ISINRET}"/>
									 </div>    
								</display:column>   
							</axis:visible>
							<axis:visible f="axissin006" c="ISINRETPAG_PAGO">	
								<display:column title="${title8}" sortable="false" sortProperty="OB_IAX_SIN_TRAMI_PAGO.ISINRET" headerClass="sortable" media="html" autolink="false" >
									 <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.CMONRES]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.ISINRET}"/></div>
									 </div>    
								</display:column>   
							</axis:visible>							
                             <axis:visible c="BT_IMPR_SIN_TRAMITA_PAGO" f="axissin006">
                                    <display:column title="${title11}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                        <div class="dspIcons" id="BT_IMPR_SIN_TRAMITA_PAGO"><img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_TRAMITA_PAGO" lit="100001"/>" title1="<axis:alt f="axissin006" c="BT_SIN_TRAMITA_PAGO" lit="100001"/>" src="images/print.gif" width="16px" height="16px"
                                        style="cursor:pointer;" onClick="javascript:f_imprimir_pago('${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.SIDEPAG}');" /></div>                                                                     
                                   </display:column>
                            </axis:visible>
                            <axis:visible f="axissin006" c="BT_SIN_EDITAR_CAB_PAGO">
                                <display:column title="${title10}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                    <c:if test="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.MOVPAGOS[fn:length(T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.MOVPAGOS)-1].OB_IAX_SIN_TRAMI_MOVPAGO.CESTPAG==0}">
                                        <div class="dspIcons" id="BT_SIN_EDITAR_CAB_PAGO"><img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_EDITAR_CAB_PAGO" lit="100002"/>" title1="<axis:alt f="axissin006" c="BT_SIN_EDITAR_CAB_PAGO" lit="100002"/>" src="images/lapiz.gif" width="16px" height="16px"
                                        style="cursor:pointer;" onClick="javascript:f_abrir_modal('axissin012',null,'&SPRODUC='+document.miForm.SPRODUC.value+
                                                                                                                    '&CACTIVI='+document.miForm.CACTIVI.value+
                                                                                                                    '&indexTramitacio='+document.miForm.indexTramitacio.value+
                                                                                                                    '&SSEGURO='+document.miForm.SSEGURO.value+
                                                                                                                    '&CAGENTE='+document.miForm.CAGENTE.value+
                                                                                                                    '&NSINIES='+document.miForm.NSINIES.value+
                                                                                                                    '&NTRAMIT='+document.miForm.NTRAMIT.value+
                                                                                                                    '&CTIPPAG=2&isNew=no&SIDEPAG='+'${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.SIDEPAG}'+
                                                                                                                    '&CTRAMIT='+document.miForm.CTRAMIT.value+
                                                                                                                    '&CCAUSIN='+document.miForm.CCAUSIN.value+
                                                                                                                    '&CMOTSIN='+document.miForm.CMOTSIN.value+
                                                                                                                    '&CAGENTESINI='+document.miForm.CAGENTESINI.value+
                                                                                                                    '&TAGENTESINI='+document.miForm.TAGENTESINI.value+
                                                                                                                    '&NTRAMIT9999='+document.miForm.NTRAMIT9999.value);" /></div>                                                                     
                                    </c:if>
                                </display:column>
                            </axis:visible>
                            <display:column title="${title9}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                <div class="dspIcons"><img border="0" alt="<axis:alt f="axissin006" c="DSP_MAS_INFO" lit="1000113"/>" title1="<axis:alt f="axissin006" c="DSP_MAS_INFO" lit="1000113"/>" src="images/mas.gif" width="13px" height="11px"
                                style="cursor:pointer;" onclick="javascript:f_abrir_modal('axissin074',null,'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&SIDEPAG='+'${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.SIDEPAG}');" /></div>
                            </display:column>                            
                             <!-- *************************** SECCION MÁS DATOS ********************************* -->     
                            <display:column class="seccion_informacion">
                                            <div id="SECCION_D${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.SIDEPAG}"  style="height:400px" class="seccion_informacion">
                                                                            <table class="area" align="center">
                                                                             <tr>
                                                                                <th style="width:25%;height:0px"></th>
                                                                                <th style="width:25%;height:0px"></th>
                                                                                <th style="width:25%;height:0px"></th>
                                                                                <th style="width:25%;height:0px"></th>
                                                                             </tr>
                                                                            <tr>
                                                                                <axis:visible f="axissin006" c="TTIPDES"> 
                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axissin006" c="TTIPDES" lit="9001213"/></b>
                                                                                </td>
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="TNOMBRE">
                                                                                 <td class="titulocaja" colspan="2" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >
                                                                                    <b><axis:alt f="axissin006" c="TNOMBRE" lit="9001214"/></b>
                                                                                </td>
                                                                                </axis:visible> 
                                                                                <axis:visible f="axissin006" c="TCAUIND">
                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border:1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axissin006" c="TCAUIND" lit="9001199"/></b>
                                                                                </td>
                                                                                </axis:visible>
                                                                            </tr>
                                                                            <tr>
                                                                            
                                                                                <axis:visible f="axissin006" c="TTIPDES"> 
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="CAMPO1" name="CAMPO1" size="15" style="width:90%"
                                                                                    value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.DESTINATARI.TTIPDES}"   
                                                                                    readonly="readonly"/>
                                                                                </td>
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="TNOMBRE"> 
                                                                                <td colspan="2" class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:100%"
                                                                                    value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.DESTINATARI.PERSONA.TNOMBRE}&nbsp;${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.DESTINATARI.PERSONA.TAPELLI1}&nbsp;
                                 ${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.DESTINATARI.PERSONA.TAPELLI2}"
                                                                                    readonly="readonly"/>
                                                                                </td>
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="TCAUIND"> 
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="CAMPO3" name="CAMPO3" size="15" style="width:90%"
                                                                                    value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.TCAUIND}" readonly="readonly"/>
                                                                                </td>
                                                                                </axis:visible>
                                                                            </tr>
                                                                            <tr>
                                                                                <axis:visible f="axissin006" c="TTIPBAN"> 
                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axissin006" c="TTIPBAN" lit="9001200"/></b>
                                                                                </td>
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="CBANCAR">
                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axissin006" c="CBANCAR" lit="100878"/></b>
                                                                                </td>
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="PRETENC"> 
                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >
                                                                                    <b><axis:alt f="axissin006" c="PRETENC" lit="101714"/></b>
                                                                                </td>
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="IRETENC"> 
                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axissin006" c="IRETENC" lit="9001030"/></b>
                                                                                </td>
                                                                                </axis:visible>
                                                                            </tr>
                                                                            <tr>
                                                                                <axis:visible f="axissin006" c="TTIPBAN"> 
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="CAMPO4" name="CAMPO4" size="15" style="width:90%"
                                                                                    value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.TTIPBAN}" readonly="readonly"/>
                                                                                </td>
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="CBANCAR"> 
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="CAMPO1" name="CAMPO1" size="15" style="width:90%" 
                                                                                    value="<axis:masc f="axissin006" c="CBANCAR" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.CBANCAR}" />" readonly="readonly"/>
                                                                                </td>
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="PRETENC"> 
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"
                                                                                    value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.PRETENC}" readonly="readonly"/>
                                                                                </td>
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="IRETENC"> 
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="CAMPO3" name="CAMPO3" size="15" style="width:90%"
                                                                                    value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.IRETENC}"/>" readonly="readonly"/>
                                                                                </td>
                                                                                </axis:visible>
                                                                            </tr>
                                                                             <tr>    
                                                                                <axis:visible f="axissin006" c="IIVA"> 
                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axissin006" c="IIVA" lit="101340"/></b>
                                                                                </td>
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="IICA"> 
                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axissin006" c="IICA" lit="9902715"/></b>
                                                                                </td>
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="ISUPLID"> 
                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axissin006" c="ISUPLID" lit="9001201"/></b>
                                                                                </td>
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="IFRANQ">
                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >
                                                                                    <b><axis:alt f="axissin006" c="IFRANQ" lit="9001215"/></b>
                                                                                </td>
                                                                                </axis:visible>
                                                                            </tr>
                                                                            <tr> 
                                                                                <axis:visible f="axissin006" c="IIVA"> 
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="CAMPO4" name="CAMPO4" size="15" style="width:90%"
                                                                                    value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.IIVA}"/>" readonly="readonly"/>
                                                                                </td> 
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="IICA"> 
                                                                                 <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="CAMPO3" name="CAMPO3" size="15" style="width:90%"
                                                                                    value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.IICA}"/>" readonly="readonly"/>
                                                                                </td> 
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="ISUPLID"> 
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="CAMPO1" name="CAMPO1" size="15" style="width:90%"
                                                                                    value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.ISUPLID}"/>" readonly="readonly"/>
                                                                                </td>
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="IFRANQ"> 
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"
                                                                                    value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.IFRANQ}"/>" readonly="readonly"/>
                                                                                </td>
                                                                                </axis:visible>
                                                                            </tr>
                                                                            <tr>                                                                              
                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axissin006" c="IRESRCM" lit="9001202"/></b>
                                                                                </td>                                                                               
                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axissin006" c="IRESRED" lit="9001203"/></b>
                                                                                </td>
                                                                                <axis:visible f="axissin006" c="NCHEQUE"> 
                                                                                  <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axissin006" c="NCHEQUE" lit="9907717"/></b>
                                                                                </td>
                                                                                  </axis:visible>
                                                                                
                                                                                <axis:visible f="axissin006" c="PRETEIVA"> 
                                                                                    <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                        <b><axis:alt f="axissin006" c="PRETEIVA" lit="9902695"/></b>
                                                                                    </td>   
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="IRETEIVA"> 
                                                                                    <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                        <b><axis:alt f="axissin006" c="IRETEIVA" lit="9902698"/></b>
                                                                                    </td>
                                                                                </axis:visible>
                                                                            </tr>
                                                                            <tr>    
                                                                                <axis:visible f="axissin006" c="IRESRCM"> 
                                                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                        <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"
                                                                                        value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.IRESRCM}"/>" readonly="readonly"/>
                                                                                    </td>
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="IRESRED"> 
                                                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                        <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"
                                                                                        value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.IRESRED}"/>" readonly="readonly"/>
                                                                                    </td>   
                                                                                </axis:visible>
                                                                                
                                                                                <axis:visible f="axissin006" c="NCHEQUE"> 
                                                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                        <input type="text" class="campo campotexto" id="NCHEQUE" name="NCHEQUE" size="15" style="width:90%"
                                                                                         value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.NCHEQUE}" readonly="readonly"/>
                                                                                    </td>   
                                                                                </axis:visible>
                                                                                
                                                                                
                                                                                <axis:visible f="axissin006" c="PRETEIVA"> 
                                                                                     <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                        <input type="text" class="campo campotexto" id="PRETEIVA" name="PRETEIVA" size="15" style="width:90%"
                                                                                        value="<fmt:formatNumber pattern="###,##0.00" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.PRETEIVA}"/>" readonly="readonly"/>
                                                                                    </td>
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="IRETEIVA"> 
                                                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                        <input type="text" class="campo campotexto" id="IRETEIVA" name="IRETEIVA" size="15" style="width:90%"
                                                                                        value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.IRETEIVA}"/>" readonly="readonly"/>
                                                                                    </td>
                                                                                </axis:visible>
                                                                            </tr>          
                                                                            
                                                                           
                                                                            
                                                                            
                                                                             <tr>   
                                                                                <axis:visible f="axissin006" c="PRETEICA"> 
                                                                                    <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                        <b><axis:alt f="axissin006" c="PRETEICA" lit="9902696"/></b>
                                                                                    </td>
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="IRETEICA"> 
                                                                                    <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                        <b><axis:alt f="axissin006" c="IRETEICA" lit="9902697"/></b>
                                                                                    </td>
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="IRETEIVAPAG"> 
                                                                                    <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                        <b><axis:alt f="axissin006" c="IRETEIVAPAG" lit="9902700"/></b>
                                                                                    </td>
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="IRETEICAPAG"> 
                                                                                    <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                        <b><axis:alt f="axissin006" c="IRETEICAPAG" lit="9902701"/></b>
                                                                                    </td>
                                                                                </axis:visible>
                                                                            </tr>
                                                                            <tr>       
                                                                                <axis:visible f="axissin006" c="PRETEICA"> 
                                                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                        <input type="text" class="campo campotexto" id="PRETEICA" name="PRETEICA" size="15" style="width:90%"
                                                                                        value="<fmt:formatNumber pattern="###,##0.00" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.PRETEICA}"/>" readonly="readonly"/>
                                                                                    </td>  
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="IRETEICA"> 
                                                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                        <input type="text" class="campo campotexto" id="IRETEICA" name="IRETEICA" size="15" style="width:90%"
                                                                                        value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.IRETEICA}"/>" readonly="readonly"/>
                                                                                    </td>   
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="IRETEIVAPAG"> 
                                                                                     <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                        <input type="text" class="campo campotexto" id="IRETEIVAPAG" name="IRETEIVAPAG" size="15" style="width:90%"
                                                                                        value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.IRETEIVAPAG}"/>" readonly="readonly"/>
                                                                                    </td> 
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="IRETEICAPAG"> 
                                                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                        <input type="text" class="campo campotexto" id="IRETEICAPAG" name="IRETEICAPAG" size="15" style="width:90%"
                                                                                        value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.IRETEICAPAG}"/>" readonly="readonly"/>
                                                                                    </td>   
                                                                                </axis:visible>
                                                                            </tr>    
                                                                          <tr>
                                                                          
                                                                           <axis:visible f="axissin006" c="COFICI"> 
                                                                                    <c:if test="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.CFORPAG==34 }">
                                                                                    <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                        <b><axis:alt f="axissin006" c="COFICI" lit="9908482"/></b>
                                                                                    </td></c:if> 
                                                                           </axis:visible> 
                                                                           <axis:visible f="axissin006" c="CBANCO"> 
                                                                                    <c:if test="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.CFORPAG==34 }">
                                                                                    <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                        <b><axis:alt f="axissin006" c="CBANCO" lit="9908409"/></b>
                                                                                    </td></c:if> 
                                                                           </axis:visible> 
                                                                           <axis:visible f="axissin006" c="DCIUDAD">
                                                                                    <c:if test="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.CFORPAG==34 }">
                                                                                    <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                        <b><axis:alt f="axissin006" c="DCIUDAD" lit="9908410"/></b>
                                                                                    </td></c:if>
                                                                           </axis:visible> 
                                                                                
                                                                           </tr>
                                                                           
                                                                           <tr> 
                                                                           
                                                                            <axis:visible f="axissin006" c="COFICI"> 
                                                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                        <input type="text" class="campo campotexto" id="COFICI" name="COFICI" size="15" 
                                                                                        <c:if test="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.CFORPAG !=34 }">style="visibility:hidden; width:90%" </c:if>                                                                                       
                                                                                         value="<fmt:formatNumber pattern="###,##0" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.COFICI}"/>" readonly="readonly"/>
                                                                                    </td>  
                                                                                </axis:visible> 
                                                                                <axis:visible f="axissin006" c="CBANCO"> 
                                                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                        <input type="text" class="campo campotexto" id="CBANCO" name="CBANCO" size="15" 
                                                                                        <c:if test="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.CFORPAG !=34 }">style="visibility:hidden; width:90%" </c:if>                                                                                       
                                                                                         value="<fmt:formatNumber pattern="###,##0" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.CBANCO}"/>" readonly="readonly"/>
                                                                                    </td>  
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="DCIUDAD"> 
                                                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                        <input type="text" class="campo campotexto" id="DCIUDAD" name="DCIUDAD" size="15" 
                                                                                        <c:if test="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.CFORPAG !=34 }">style="visibility:hidden; width:90%" </c:if>                                                                                       
                                                                                          value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.DCIUDAD}" readonly="readonly"/>
                                                                                    </td>  
                                                                                </axis:visible>
                                                                               
                                                                                                                                                                                                                                              
                                                                           </tr>   
                                                                           
                                                                           <tr>
                                                                          <axis:visible f="axissin006" c="EFINAN"> 
                                                                                    <c:if test="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.CFORPAG == 31 }">
                                                                                    <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                        <b><axis:alt f="axissin006" c="EFINAN" lit="9908408"/></b>
                                                                                    </td></c:if> 
                                                                          </axis:visible>                                                                    
                                                                          </tr>
                                                                          <tr> 
                                                                           <axis:visible f="axissin006" c="EFINAN"> 
                                                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                        <input type="text" class="campo campotexto" id="EFINAN" name="EFINAN" size="4" 
                                                                                        <c:if test="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.CFORPAG != 31}">style="visibility:hidden; width:90%" </c:if>                                                                                       
                                                                                       value= "${fn:substring(T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.CBANCAR, 0, 4)}" readonly="readonly"/>
                                                                                        </td>  
                                                                                </axis:visible>
                                                                           </tr>
                                                                           
                                                                            </table>
                                                                    </div>
                                        </display:column>
                                    <%i++;%>
                        </display:table>
                        </div>
                        <table>
                        <tr>
                            <td>
                                <table class="area" align="center">
                                <tr>
                                    <th style="height:0px"></th>
                                </tr>             
                                <tr>
                                    <td class="campocaja">
                                    <div style="float:left;">
                                        <b><axis:alt f="axissin006" c="DSP_SECCION" lit="100913"/></b>
                                    </div>
                                    <div style="float:right;" id="BT_SIN_NUEVO_TRAM_PAG_MOV">
                                        <c:if test="${!empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.PAGOS}">
                                            <axis:visible f="axissin006" c="BT_SIN_NUEVO_TRAM_PAG_MOV"> 
                                            <!--ETM NUEVOS PARAMETROS CCAUSIN, CMOTSIN-->
                                            
                                            <a href="javascript:f_abrir_modal('axissin013',null,'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&NCHEQUE='+document.${nombrePantalla}${nombreSeccion}.NCHEQUEH.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&CTIPPAG=2&SIDEPAG='+document.miForm.SIDEPAG.value+'&indexPago='+'${__formdata.indexPago}'+'&CCAUSIN=${__formdata.OB_IAX_SINIESTRO.CCAUSIN}'+'&CMOTSIN=${__formdata.OB_IAX_SINIESTRO.CMOTSIN}'+'&NRIESGO='+document.miForm.NRIESGO.value);">
                                            <img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_NUEVO_TRAM_PAG_MOV" lit="9000984"/>" title="<axis:alt f="axissin006" c="BT_SIN_NUEVO_TRAM_PAG_MOV" lit="9000984"/>" src="images/new.gif"/></a>
                                            </axis:visible>
                                        </c:if>
                                    </div>
                                    </td>
                                </tr>  
                               <tr>
                                    <td>
                                            <c:set var="title1"><axis:alt f="axissin006" c="NMOVPAG" lit="100899" /></c:set><!--Numero-->
                                            <c:set var="title2"><axis:alt f="axissin006" c="TESTPAG" lit="100587" /></c:set><!--Estado-->
                                            <c:set var="title9"><axis:alt f="axissin006" c="TDOCPAG" lit="89907093" /></c:set><!--Nº Documento de pago IAXIS-7731 19/12/2019-->
                                            <c:set var="title3"><axis:alt f="axissin006" c="FEFEPAG" lit="9906065" /></c:set><!--F Efecto -->
                                            <c:set var="title4"><axis:alt f="axissin006" c="TESTVAL" lit="9000948" /></c:set><!-- Estado Validacion -->
                                            <c:set var="title5"><axis:alt f="axissin006" c="FCONTAB" lit="1000575" /></c:set><!-- F Contabilidad -->
                                            <c:set var="title6"><axis:alt f="axissin006" c="TSUBPAG" lit="9000852" /></c:set><!-- Subestado -->
                                            <c:set var="title7"><axis:alt f="axissin006" c="FALTA_PAGO" lit="101006" /></c:set><!-- F Movimiento -->
                                            <c:set var="title8"><axis:alt f="axissin006" c="CUSUALT" lit="100894" /></c:set><!-- Usuario -->
                                            <c:set var="num_tramitacion">0</c:set>
                                            <c:set var="num_tram_pago">0</c:set>
                                            <div class="displayspace">
                                              <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.PAGOS[__formdata.indexPago].OB_IAX_SIN_TRAMI_PAGO.MOVPAGOS}" id="T_IAX_TRAM_MOVPAGOS" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title1}" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspNumber">${T_IAX_TRAM_MOVPAGOS.OB_IAX_SIN_TRAMI_MOVPAGO.NMOVPAG}</div>
                                                </display:column>
                                                <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_MOVPAGOS.OB_IAX_SIN_TRAMI_MOVPAGO.TESTPAG}</div>    
                                                </display:column>
                                                <!--Inicio IAXIS-7731 19/12/2019 -->
                                                <display:column title="${title9}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_MOVPAGOS.OB_IAX_SIN_TRAMI_MOVPAGO.NDOCPAG}</div>    
                                                </display:column>
                                                <!-- Fin IAXIS-7731 19/12/2019-->
                                                <axis:visible c="TSUBPAG" f="axissin006">
                                                <display:column title="${title6}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_MOVPAGOS.OB_IAX_SIN_TRAMI_MOVPAGO.TSUBPAG}</div>    
                                                </display:column>
                                                </axis:visible>
                                                <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_MOVPAGOS.OB_IAX_SIN_TRAMI_MOVPAGO.FEFEPAG}"/></div>    
                                                </display:column>
                                                <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_MOVPAGOS.OB_IAX_SIN_TRAMI_MOVPAGO.TESTVAL}</div>    
                                                </display:column>
                                                <display:column title="${title5}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_MOVPAGOS.OB_IAX_SIN_TRAMI_MOVPAGO.FCONTAB}"/></div>    
                                                </display:column>
                                                <axis:visible f="axissin006" c="FALTA_PAGO">
                                                    <display:column title="${title7}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                         <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_MOVPAGOS.OB_IAX_SIN_TRAMI_MOVPAGO.FALTA}"/></div>    
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axissin006" c="CUSUALT_MOVPAGO">
                                                    <display:column title="${title8}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                         <div class="dspText">${T_IAX_TRAM_MOVPAGOS.OB_IAX_SIN_TRAMI_MOVPAGO.CUSUALT}</div>   
                                                    </display:column>
                                                </axis:visible>
                                            </display:table>
                                            </div>
                                    </td>
                                </tr>  
                                 <axis:visible f="axissin006" c="DSP_PAGOS_GAR_GEN">
                                <tr>
                                    <td class="campocaja">
                                    <div style="float:left;">
                                        <b><axis:alt f="axissin006" c="DSP_PAGOS_GAR_GEN" lit="9000937"/></b>
                                    </div>
                                    <div style="float:right;" id="BT_SIN_NUEVO_TRAM_PAG_DET">
                                    <c:if test="${!empty  __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.PAGOS}">
                                    <c:if test="${estadopago==0}">
                                    <axis:visible f="axissin006" c="BT_SIN_NUEVO_TRAM_PAG_DET"> 
                                            <a href="javascript:f_abrir_modal('axissin014',null,'&isNew=yes&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&CTIPPAG=2&SIDEPAG='+document.miForm.SIDEPAG.value+'&indexPago='+'${__formdata.indexPago}'+'&SECCION=pagos');">
                                            <img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_NUEVO_TRAM_PAG_DET" lit="9000985"/>" title="<axis:alt f="axissin006" c="BT_SIN_NUEVO_TRAM_PAG_DET" lit="9000985"/>" src="images/new.gif"/></a>
                                    </axis:visible>
                                    </c:if>
                                    </c:if>
                                    </div>
                                    </td>
                                </tr>
                               <tr>
                                     <td>
                                            <c:set var="title0"><axis:alt f="axissin006" c="TTIPRES" lit="100565" /></c:set><!--Tipo -->
                                            <c:set var="title1"><axis:alt f="axissin006" c="TGARANT" lit="110994" /></c:set><!--Garantia-->
                                            <c:set var="title2"><axis:alt f="axissin006" c="NORDEN" lit="9000526" /></c:set><!--Finicio-->
                                            <c:set var="title3"><axis:alt f="axissin006" c="FPERINI" lit="9000527" /></c:set><!--FFin -->
                                            <c:set var="title4"><axis:alt f="axissin006" c="FPERFIN" lit="9000939" /></c:set><!-- Importe Bruto -->
                                            <c:set var="title5"><axis:alt f="axissin006" c="ISINRET" lit="101340" /></c:set><!-- Importe IVA -->
                                            <c:set var="title6"><axis:alt f="axissin006" c="IIVA2" lit="9001030" /></c:set><!-- Retencion -->
                                            <c:set var="title7"><axis:alt f="axissin006" c="IRETENC2" lit="9000940" /></c:set><!-- Franquicia -->                                            
                                            <c:set var="title8"><axis:alt f="axissin006" c="BT_SIN_EDITAR_TRAM_PAG_DET" lit="100002" /></c:set><!--Editar-->
                                            <c:set var="title9"><axis:alt f="axissin006" c="BT_SIN_DELETE_TRAM_PAG_DET" lit="1000127"/></c:set><!--Eliminar-->
                                            <c:set var="title11"><axis:alt f="axissin006" c="CCONPAG" lit="100896"/></c:set><!--Concepto-->
                                            <c:set var="title12"><axis:alt f="axissin006" c="NORDEN2" lit="500102"/></c:set><!--Orden-->
                                            <c:set var="title13"><axis:alt f="axissin006" c="CMONRES" lit="9907718" /></c:set><!--  Moneda-->
                                            <c:set var="title14"><axis:alt f="axissin006" c="IRETEIVA" lit="9902698" /></c:set><!--  Importe ReteIVA-->
                                            <c:set var="title15"><axis:alt f="axissin006" c="IRETEICA" lit="9902697" /></c:set><!--  Importe ReteICA-->
                                            <c:set var="title16"><axis:alt f="axissin006" c="IRETEICA" lit="9906458" /></c:set><!--  Detalle-->
                                            
                                            <c:set var="num_tramitacion">0</c:set>
                                            <c:set var="num_tram_pago">0</c:set>
                                            <input type="hidden" id="DETALLE_PAGO" name="DETALLE_PAGO" value="${fn:length(__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.PAGOS[__formdata.indexPago].OB_IAX_SIN_TRAMI_PAGO.PAGOGAR)}" />
                                            <div class="displayspace">
                                            <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.PAGOS[__formdata.indexPago].OB_IAX_SIN_TRAMI_PAGO.PAGOGAR}" id="T_IAX_TRAM_PAGOGAR" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                                <%@ include file="../include/displaytag.jsp"%>                                                                                                
                                                <display:column title="${title0}" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspNumber">${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.TTIPRES}</div>
                                                </display:column>
                                                <display:column title="${title1}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.TGARANT}</div>    
                                                </display:column>
                                                <axis:visible f="axissin006" c="NORDEN">
                                                <display:column title="${title12}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.NORDEN}</div>    
                                                </display:column>
                                                </axis:visible>
                                                
                                                 <axis:visible f="axissin006" c="CMONRES">
                                                <display:column title="${title13}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.CMONRES}</div>    
                                                </display:column>
                                                </axis:visible>
                                                
                                                <axis:visible f="axissin006" c="FPERINI">
                                                <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.FPERINI}"/></div>    
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible f="axissin006" c="FPERFIN">
                                                <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.FPERFIN}"/></div>    
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible f="axissin006" c="ISINRET_PAGO">
                                                        <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                                <div class="dspNumber"><fmt:formatNumber value="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.ISINRET}"/></div> 
                                                        </display:column>  
                                                </axis:visible>
                                                <axis:visible f="axissin006" c="ISINRETPAG_PAGO">	
                                                        <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.CMONPAG]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.ISINRETPAG}"/></div>
                                                        </display:column>  
                                                </axis:visible>	
                                               
                                                <axis:visible f="axissin006" c="IRETENC">
                                                <display:column title="${title6}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.IRETENC+T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.IRETEIVA+T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.IRETEICA}"/></div> 
                                                </display:column>
                                              </axis:visible>
                                              <axis:visible f="axissin006" c="IRETENC2">
                                                <display:column title="${title6}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.CMONRES]}" value="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.IRETENC}"/></div> 
                                                </display:column>
                                              </axis:visible>  
                                              <axis:visible f="axissin006" c="IIVA">
                                              <display:column title="${title5}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.CMONRES]}" value="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.IIVA}"/></div> 
                                                </display:column>
                                              </axis:visible>
                                              
                                              <axis:visible f="axissin006" c="IRETEIVA">
                                              <display:column title="${title14}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.CMONRES]}" value="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.IRETEIVA}"/></div> 
                                                </display:column>
                                              </axis:visible>
                                              
                                              <axis:visible f="axissin006" c="IRETEICA">
                                              <display:column title="${title15}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.CMONRES]}" value="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.IRETEICA}"/></div> 
                                              </display:column>
                                              </axis:visible>
                                              
                                                <axis:visible f="axissin006" c="IFRANQ">
                                                <display:column title="${title7}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.CMONRES]}" value="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.IFRANQ}"/></div> 
                                                </display:column>
                                              </axis:visible>
                                                <axis:visible f="axissin006" c="CCONPAG">
                                                    <display:column title="${title11}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                         <div class="dspText">${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.TCONPAG}</div>    
                                                    </display:column>
                                                </axis:visible>
                                                 <axis:visible f="axissin006" c="BT_SIN_EDITAR_TRAM_PAG_DET">
                                                    <display:column title="${title10}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                       <c:if test="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.ESMODIF==1}">
                                                       <c:if test="${estadopago==0}"> 
                                                        <div class="dspIcons" id="BT_SIN_EDITAR_TRAM_PAG_DET"><img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_EDITAR_TRAM_PAG_DET" lit="100002"/>" title1="<axis:alt f="axissin006" c="BT_SIN_EDITAR_TRAM_PAG_DET" lit="100002"/>" src="images/lapiz.gif" width="16px" height="16px"
                                                        style="cursor:pointer;" onclick="javascript:f_abrir_modal('axissin014',null,'&isNew=no&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&CTIPPAG=2&SIDEPAG='+document.miForm.SIDEPAG.value+'&indexPago='+'${__formdata.indexPago}'+'&NMOVRES='+'${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.NMOVRES}'+'&CTIPRES='+'${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.CTIPRES}'+'&NORDEN='+'${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.NORDEN}'+'&CTIPGAS='+'${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.CTIPGAS}');">
                                                        </div>
                                                       </c:if>
                                                       </c:if>
                                                    </display:column>
                                                </axis:visible>
                                               <axis:visible f="axissin006" c="BT_SIN_DELETE_TRAM_PAG_DET"> 
                                                <display:column title="${title9}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                    <c:if test="${estadopago==0}">
                                                    <div class="dspIcons" id="BT_SIN_DELETE_TRAM_PAG_DET"><img border="0" alt="<axis:alt f="axissin006" c="CTIPRES" lit="1000127"/>" title1="<axis:alt f="axissin006" c="CTIPRES" lit="1000127"/>" src="images/delete.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="f_borrar_detallepago('2','${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.CTIPRES}','${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.CGARANT}','${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.NMOVRES}','${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.SIDEPAG}','${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.NORDEN}');"/></div> 
                                                    </c:if>
                                                </display:column> 
                                                </axis:visible>
                                                
                                                <axis:visible f="axissin006" c="BT_SIN_VER_TRAM_PAG_DET"> 
                                                <display:column title="${title16}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                    <div class="dspIcons" id="BT_SIN_VER_TRAM_PAG_DET">
                                                    <img border="0" alt="<axis:alt f="axissin006" c="DSP_MAS_INFO" lit="1000113"/>" title1="<axis:alt f="axissin006" c="DSP_MAS_INFO" lit="1000113"/>" src="images/mas.gif" width="13px" height="11px"
                                                    style="cursor:pointer;" onclick="javascript:f_abrir_modal('axissin075',null,'&CTIPPAG=2&SSEGURO='+document.miForm.SSEGURO.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&SIDEPAG='+'${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.SIDEPAG}');"/>
                                                    </div>
                                                </display:column> 
                                                </axis:visible>
                                                                                 
                                            </display:table>
                                            </div>
                                        <!-- FIN  -->
                                    </td>
                                </tr>             
                                         </axis:visible>   
                                <!-- Fin seccion -->
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </axis:visible>
            
            <c:import url="axissin006_datossiniestros_tramitaciones_pagofi.jsp"/>
           
             
</form>
