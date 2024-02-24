<%--
/**
*  Fichero: axissin050.jsp
*  
*  T?tulo: Alta masiva RESERVAS - Siniestros
*
*  Fecha: 01/03/2012
*/
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axissin050" c="TIT1" lit="9000615"/> <axis:alt f="axissin050" c="TIT2" lit="109479"/>/<axis:alt f="axissin050" c="TIT3" lit="9000897"/> </title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    
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
    
    <script type="text/javascript">

        function f_onload() { 
    
            var val1 = "<%=request.getAttribute("OK")%>"; 
            if (val1=="OK"){
                 //alert("ha ido ok");
                 parent.f_aceptar_axissin050(document.miForm.NSINIES,'','');
            }
        
            
            
            revisarEstilos();
        }
        
        function f_cargarDep(){
        		f_cargar_propiedades_pantalla();
        }
        
        function f_but_aceptar(){
           //f_guardar();          
           //f_guardar_old();
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario ("modal_axissin050.do?", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
             }
          // parent.f_cerrar_modal("axissin050");
        }
        
       

        function f_but_cancelar(){
            parent.f_cerrar_modal("axissin050");
        }
        
          
       
        
        
        function f_guardar_fila(CESTTRA,fila,NMOVRES){   //CESTTRA, NMOVRES?
        	 if (objValidador.validaEntrada()) {
                    var qs="operation=ajax_fila";                                                            
                    qs=qs+"&CESTTRA="+CESTTRA;
                    	
                    qs=qs+"&NMOVRES="+NMOVRES;
                    qs=qs+"&NSINIES="+document.miForm.NSINIES.value;
                    qs=qs+"&NTRAMIT="+document.miForm.NTRAMIT.value;
                    qs=qs+"&CALCULO=1";
                    qs=qs+"&SPRODUC="+document.miForm.SPRODUC.value;
                    qs=qs+"&ORIGEN=AXISSIN050";
                    qs=qs+"&CGARANT="+eval("document.miForm.CGARANT_"+CESTTRA+"_"+fila+".value");
                    qs=qs+"&IRESERVA="+eval("document.miForm.IRESERVA_"+CESTTRA+"_"+fila+".value");
                    qs=qs+"&CTRAMIT="+document.miForm.CTRAMIT.value;
                       <axis:visible c="IPENALI" f="axissin050">
                     qs=qs+"&IPENALI="+eval("document.miForm.IPENALI_"+CESTTRA+"_"+fila+".value");
                     </axis:visible>
                      <axis:visible c="ICAPRIE" f="axissin050">
                    qs=qs+"&ICAPRIE="+eval("document.miForm.ICAPRIE_"+CESTTRA+"_"+fila+".value");
                      </axis:visible>
                       <axis:visible c="IPREREC" f="axissin050">
                    qs=qs+"&IPREREC="+eval("document.miForm.IPREREC_"+CESTTRA+"_"+fila+".value");
                    </axis:visible>
                    <axis:visible c="CMONRES" f="axissin050">
                        qs=qs+"&CMONRES="+eval("document.miForm.CMONRES_"+CESTTRA+"_"+fila+".value");
                    </axis:visible>
                    objAjax.invokeAsyncCGI("modal_axissin050.do", callbackajaxGuardar, qs, this);
             }
        }
        
        function callbackajaxGuardar(ajaxResponseText){
            //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                objAppMensajes.existenErroresEnAplicacion(doc)
        }
        
    
        
     
       
       /*******************************************
              Formateo Numeros
        ********************************************/
         function validarNumeros(IMPORTE){
             if (!objUtiles.estaVacio(IMPORTE)){
                 IMPORT = objValidador.valorFormateadoCampoNumerico(IMPORTE, true, true);
                 if(objNumero.validaNumero(IMPORT, true)){
                     return this.formateaNumeroCero(IMPORT, true);
                 }
                 else{
                     return   '';
                 }
             }
             else return IMPORTE;
         }
         
        function formateaNumeroCero(entrada, isDecimal){
            // es crida al reformateixador  ###.###,00
            var fnum=objNumero.formateaNumero(entrada,isDecimal);
            if(entrada.indexOf(objNumero.getSeparadorDecimales())<0){
                fnum += objNumero.getSeparadorDecimales() + '00';
            }
            // si es tracta d'un 0 el converteix a 0,00
            if(fnum=='0') fnum += objNumero.getSeparadorDecimales() + '00';
            return fnum;

        }
         
        function f_formatear(thiss){
           thiss.value = objNumero.formateaNumeroMoneda(thiss.value, null);
        }
        
        function f_calculoma(thiss){
            document.miForm.CALCULO.value = 0;
            f_formatear(thiss);
        }
        
        /* Actualizar formateo fechas */
        /* Actualizar formato fechas */
        function f_actData(thiss){
            //alert("Aquí");
            thiss.value = f_formatdate(thiss);
        }     

        function f_formatdate(entrada){
            var jDate = new JsFecha();
    
            if (!jDate.validaFecha(entrada.value)|| entrada.value.indexOf("/") == -1){
                if(entrada.value.length>0){
                    entrada.value=jDate.formateaFecha(entrada.value);            
                    if(jDate.validaFecha(entrada.value)){
                        entrada.value=jDate.formateaFecha(entrada.value);
                    }else{
                        entrada.value = '';//alert('Formato fecha incorrecto para el campo '+ title);
                    }
                }
            }
            return entrada.value;
        }
            
     
            
    </script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="modal_axissin050.do" method="POST">
    <input type="hidden" id="operation" name="operation" value="guardar" />
    <input type="hidden" id="NSINIES" name="NSINIES" value="${__formdata.NSINIES}"/>
    <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
    <input type="hidden" id="SPRODUC" name="SPRODUC" value="${__formdata.SPRODUC}"/>
    <input type="hidden" id="NTRAMIT" name="NTRAMIT" value="${__formdata.NTRAMIT}"/>
     <input type="hidden" id="subpantalla" name="subpantalla" value="tramitaciones"/>
    <input type="hidden" id="seccion" name="seccion" value="tramitaciones_reservas"/>
    <input type="hidden" id="indexTramitacio" name="indexTramitacio" value="${__formdata.indexTramitacio}"/>    
    <input type="hidden" id="CCAUSIN" name="CCAUSIN" value="${__formdata.CCAUSIN}"/>
    <input type="hidden" id="CMOTSIN" name="CMOTSIN" value="${__formdata.CMOTSIN}"/>
    <input type="hidden" id="FSINIES" name="FSINIES" value="<fmt:formatDate value='${__formdata.FSINIES}' pattern='dd/MM/yyyy' />"/>    
    <input type="hidden" id="NRIESGO" name="NRIESGO" value="${__formdata.NRIESGO}"/>
    <input type="hidden" id="FNOTIFI" name="FNOTIFI" value="<fmt:formatDate value='${__formdata.FNOTIFI}' pattern='dd/MM/yyyy' />"/>    
    <input type="hidden" id="CACTIVI" name="CACTIVI" value="${__formdata.CACTIVI}"/>    
    <input type="hidden" id="CTRAMIT" name="CTRAMIT" value="${__formdata.CTRAMIT}"/> 
    <input type="hidden" id="FMOVRES" name="FMOVRES" value="<fmt:formatDate value='${__formdata.FMOVRES}' pattern='dd/MM/yyyy' />"/> 
    <input type="hidden" id="VFRESINI" name="VFRESINI" value="<fmt:formatDate value='${__formdata.VFRESINI}' pattern='dd/MM/yyyy' />"/> 
    <input type="hidden" id="ESBAJA" name="ESBAJA" value="${__formdata.ESBAJA}"/>
    <input type="hidden" id="VCALCULO" name="VCALCULO" value="${__formdata.CALCULO}"/>
    <input type="hidden" id="MODO" name="MODO" value="${__formdata.MODO}"/>
    <input type="hidden" id="NMOVRES" name="NMOVRES" value="${__formdata.NMOVRES}"/>
    <input type="hidden" id="VCESTTRA" name="VCESTTRA" value="${__formdata.CESTTRA}"/>
    <input type="hidden" id="VGARANTIA" name="VGARANTIA" value="${__formdata.GARANTIA}"/>
    <input type="hidden" id="VIRESERVA" name="VIRESERVA" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IRESERVA}"/>"/>
    <input type="hidden" id="IPAGO" name="IPAGO" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IPAGO}"/>"/>
    <input type="hidden" id="IRECOBRO" name="IRECOBRO" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IRECOBRO}"/>"/>
    <input type="hidden" id="CTIPRES" name="CTIPRES" value="${__formdata.CTIPRES}"/>
    <input type="hidden" id="FULTPAG" name="FULTPAG" value="<fmt:formatDate value='${__formdata.FULTPAG}' pattern='dd/MM/yyyy' />"/> 
    <input type="hidden" id="SIDEPAG" name="SIDEPAG" value="${__formdata.SIDEPAG}"/>
    <input type="hidden" id="FRESINI" name="FRESINI" value="<fmt:formatDate value='${__formdata.FRESINI}' pattern='dd/MM/yyyy' />"/> 
    <input type="hidden" id="FRESFIN" name="FRESFIN" value="<fmt:formatDate value='${__formdata.FRESFIN}' pattern='dd/MM/yyyy' />"/> 
    <input type="hidden" id="FCONTAB" name="FCONTAB" value="<fmt:formatDate value='${__formdata.FCONTAB}' pattern='dd/MM/yyyy' />"/> 
       
    <c:set var="linea_trami">
        ${__formdata.indexTramitacio}
    </c:set>
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt f="axissin050" c="TIT_PANTALLA" lit="9000982"/></c:param>
        <c:param name="formulario"><axis:alt f="axissin050" c="TIT_PANTALLA" lit="9000982"/></c:param>
        <c:param name="form">axissin050</c:param>
    </c:import>
    <div class="separador">&nbsp;</div>
    <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table class="seccion">
                    <tr>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                    </tr>
                    <tr>
                       <axis:ocultar f="axissin050" c="TTIPTRA" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin050" c="TTIPTRA_LIT" lit="9001028"/></b><!-- Tipus tramitacio -->
                            </td>
                       </axis:ocultar>    
                       <axis:ocultar f="axissin050" c="TTRAMIT" dejarHueco="false"> 
                           <td class="titulocaja">
                                <b><axis:alt f="axissin050" c="TTRAMIT_LIT" lit="100588"/></b><!-- Tipus dany  -->
                            </td>         
                        </axis:ocultar>    
                        <axis:ocultar f="axissin050" c="TTCAUSIN" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin050" c="TTCAUSIN_LIT" lit="9000901"/></b><!-- Tipus dany  -->
                            </td>
                        </axis:ocultar>    
                        <axis:ocultar f="axissin050" c="CINFORM" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin050" c="CINFORM_LIT" lit="9000905"/></b><!-- Tramitación informativa -->                            
                            </td>          
                        </axis:ocultar>    
                    </tr>
                    <tr>
                        <axis:ocultar f="axissin050" c="TTIPTRA" dejarHueco="false"> 
                            <td class="campocaja">
                             <input type="text" name="TTIPTRA" id="TTIPTRA" value="${sessionScope.tramitaciones_min[linea_trami].TTIPTRA}" class="campodisabled campo campotexto" style="width:90%" title="<axis:alt f="axissin050" c="TTIPTRA_ALT" lit="9001028"/>"
                                <axis:atr f="axissin050" c="TTIPTRA" a="modificable=false"/> />                                
                            </td>
                        </axis:ocultar>    
                        <axis:ocultar f="axissin050" c="TTRAMIT" dejarHueco="false"> 
                            <td class="campocaja">
                             <input type="text" id="TTRAMIT" name="TTRAMIT" value="${sessionScope.tramitaciones_min[linea_trami].TTRAMIT}" class="campodisabled campo campotexto" style="width:90%" title="<axis:alt f="axissin050" c="TTRAMIT_ALT" lit="100588"/>"
                                <axis:atr f="axissin050" c="TTRAMIT" a="modificable=false"/> />                                
                            </td>                        
                        </axis:ocultar>    
                        <axis:ocultar f="axissin050" c="TTCAUSIN" dejarHueco="false"> 
                            <td class="campocaja">
                                <input type="text" id="TTCAUSIN" name="TTCAUSIN" value="${sessionScope.tramitaciones_min[linea_trami].TTCAUSIN}" class="campodisabled campo campotexto" style="width:90%" title="<axis:alt f="axissin050" c="TTCAUSIN_ALT" lit="9000901"/>"
                                <axis:atr f="axissin050" c="TTCAUSIN" a="modificable=false"/> />
                            </td>
                        </axis:ocultar>    
                        <axis:ocultar f="axissin050" c="CINFORM" dejarHueco="false"> 
                            <td class="campocaja" align="left">
                                <input type="checkbox" disabled  id="CINFORM" name="CINFORM" <axis:atr f="axissin050" c="CINFORM" a="modificable=false"/> value="${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.CINFORM}" title="<axis:alt f="axissin050" c="CINFORM_ALT" lit="9000905"/>"
                                <c:if test="${sessionScope.tramitaciones_min[linea_trami].CINFORM == '1'}">checked</c:if> >
                            </td>                        
                        </axis:ocultar>    
                    </tr>
                    <tr>
                        <axis:ocultar f="axissin050" c="TESTTRA" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin050" c="TESTTRA_LIT" lit="100587"/></b><!-- Estado -->
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin050" c="TSUBTRA" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin050" c="TSUBTRA_LIT" lit="9000852"/></b><!--Subestado -->
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin050" c="TUNITRA" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin050" c="TUNITRA_LIT" lit="9000900"/></b><!-- Unidad tramitacion -->
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin050" c="TTRAMITAD" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin050" c="TTRAMITAD_LIT" lit="140769"/></b><!-- Tramitador -->
                            </td>
                         </axis:ocultar>   
                        <td class="titulocaja">
                            
                        </td>
                    </tr>
                    <tr>
                        <axis:ocultar f="axissin050" c="TESTTRA" dejarHueco="false"> 
                            <td class="campocaja">
                                <input type="text" name="TESTTRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TESTTRA}" class="campodisabled campo campotexto" style="width:90%" title="<axis:alt f="axissin050" c="TESTTRA_ALT" lit="100587"/>"
                                <axis:atr f="axissin050" c="TESTTRA" a="modificable=false"/> />
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin050" c="TSUBTRA" dejarHueco="false"> 
                            <td class="campocaja">
                                <input type="text" name="TSUBTRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TSUBTRA}" class="campodisabled campo campotexto" style="width:90%" title="<axis:alt f="axissin050" c="TSUBTRA_ALT" lit="9000852"/>"
                                <axis:atr f="axissin050" c="TSUBTRA" a="modificable=false"/> />                        
                            </td>                          
                        </axis:ocultar>
                        <axis:ocultar f="axissin050" c="TUNITRA" dejarHueco="false"> 
                            <td class="campocaja">
                                <input type="text" name="TUNITRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TUNITRA}" class="campodisabled campo campotexto" style="width:90%" title="<axis:alt f="axissin050" c="TUNITRA_ALT" lit="9000900"/>"
                                <axis:atr f="axissin050" c="TUNITRA" a="modificable=false"/> />
                            </td>
                        </axis:ocultar>    
                        <axis:ocultar f="axissin050" c="TTRAMITAD" dejarHueco="false"> 
                            <td class="campocaja">
                               <input type="text" name="TTRAMITAD" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TTRAMITAD}" class="campodisabled campo campotexto" style="width:90%" title="<axis:alt f="axissin050" c="TTRAMITAD_ALT" lit="140769"/>"
                                <axis:atr f="axissin050" c="TTRAMITAD" a="modificable=false"/> />
                            </td>
                        </axis:ocultar>
                        
                        <td class="campocaja">
                            
                        </td>
                    </tr>
                </table>

                <div class="separador">&nbsp;</div>                
                
                <table class="seccion">
                    <tr>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                    </tr>
                    <!-- ************************************************************************************* -->
                    <!-- ******************************** mult. reservas************************************** -->
                    <!-- ************************************************************************************* -->
                    <% int contador = 0; %>  
                    <c:forEach var="lstReserva" items="${listaRes}">
                    
                     
                    <!--campos-->
                    <tr>
                                                         
                                <td align="left" colspan=4>
                                <div class="titulo"><img src="images/flecha.gif"/><b>${lstReserva.OB_IAX_SIN_TRAMI_RESERVA_MULT.CTIPRES} - ${lstReserva.OB_IAX_SIN_TRAMI_RESERVA_MULT.TTIPRES}</b></div>     
                                <%int i = 0;%>
                                 <table border="0" class="area" align="left" style="width:100%;">
                                    <tr>
                                        <td>
                                            <c:set var="title0"><axis:alt f="axissin050" c="CTIPRES" lit="9001155"/></c:set>
                                            <c:set var="title1"><axis:alt f="axissin050" c="CGARANT" lit="100561"/></c:set>
                                            <c:set var="title2"><axis:alt f="axissin050" c="ICAPGAR" lit="1000073"/></c:set>
                                            <c:set var="title22"><axis:alt f="axissin050" c="ICAPRIE" lit="9900793"/></c:set>
                                            <c:set var="title3"><axis:alt f="axissin050" c="IRESERVA" lit="9001156"/></c:set>
                                            <c:set var="title4"><axis:alt f="axissin050" c="IPREVISION" lit="9900853"/></c:set>
                                            <c:set var="title5"><axis:alt f="axissin050" c="DEDUC" lit="9900794"/></c:set>
                                            <c:set var="title6"><axis:alt f="axissin050" c="CMONRES" lit="108645"/></c:set>
                                         
                                            <div class="displayspace">
                                                <display:table name="${lstReserva.OB_IAX_SIN_TRAMI_RESERVA_MULT.RESERVAS}" id="miListaId" export="false" class="dsptgtable" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                requestURI="">
                                                <c:set var="fila"><%=i%></c:set>
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    
                                                    <!-- bug 0024774 -->
                                                    <axis:visible c="CESTTRA" f="axissin050">
                                                    <display:column title="${title0}" headerClass="sortable" sortProperty="CESTTRA" style="width:14%"  media="html" autolink="false" >
                                                        <div class="dspNumber">
                                                                    <select id="CESTTRA" name="CESTTRA" title="<axis:alt f="axissin010" c="CESTTRA_ALT" lit="9001155"/>" style="width:90%" onchange="" <axis:atr f="axissin010" c="CESTTRA" a="isInputText=false&obligatorio=true&modificable=false"/> size="1" class="campowidthselect campo campotexto" >
                                                                            <option value="null"> - <axis:alt f="axissin010" c="LITNULL" lit="1000348"/> - </option>
                                                                            <c:forEach var="lstestado" items="${listValores.tipo_reserva}">
                                                                                <option value="${lstestado.CATRIBU}"
                                                                                <c:if test="${lstestado.CATRIBU == lstReserva.OB_IAX_SIN_TRAMI_RESERVA_MULT.CTIPRES}"> selected </c:if>>
                                                                                     ${lstestado.TATRIBU}
                                                                                </option>
                                                                            </c:forEach>
                                                                        </select>
                                                                        
                                                                        
                                                        </div>
                                                    </display:column>
                                                    </axis:visible>
                                                    
                                                    <display:column title="${title1}" headerClass="sortable" sortProperty="CGARANT" style="width:20%" media="html" autolink="false" >
                                                        <div class="dspText">
                                                                   
                                                                    ${miListaId.OB_IAX_SIN_TRAMI_RESERVA.TGARANT}
                                                                    <input type="hidden" name="CGARANT_${lstReserva.OB_IAX_SIN_TRAMI_RESERVA_MULT.CTIPRES}_${fila}" id="CGARANT_${lstReserva.OB_IAX_SIN_TRAMI_RESERVA_MULT.CTIPRES}_${fila}" value="${miListaId.OB_IAX_SIN_TRAMI_RESERVA.CGARANT}" />
                                                                    
                                                        </div>
                                                    </display:column>
                                                    
                                                     <axis:visible c="ICAPGAR" f="axissin050">
                                                     <display:column title="${title2}" sortable="false" sortProperty="ICAPGAR" headerClass="sortable" style="width:12%"  media="html" autolink="false">
                                                        <div class="dspNumber">
                                                                    <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.OB_IAX_SIN_TRAMI_RESERVA.ICAPGAR}"/>
                                                        </div>
                                                    </display:column>
                                                    </axis:visible>
                                                   
                                                    <display:column title="${title3}" sortable="false" sortProperty="IRESERVA" headerClass="sortable"  style="width:16%" media="html" autolink="false">

                                                        <!-- bug 0024774 -->
                                                        <c:if test="${miListaId.OB_IAX_SIN_TRAMI_RESERVA.CSELECC == 1}">
                                                        <div class="dspNumber">
                                                                    <input type="text" class="campowidthinput campo campotexto" 
                                                                    title="${lstReserva.OB_IAX_SIN_TRAMI_RESERVA_MULT.TTIPRES} - ${miListaId.OB_IAX_SIN_TRAMI_RESERVA.TGARANT} - ${title3}"
                                                                     onchange="javascript:f_guardar_fila('${lstReserva.OB_IAX_SIN_TRAMI_RESERVA_MULT.CTIPRES}','${fila}','${miListaId.OB_IAX_SIN_TRAMI_RESERVA.NMOVRES}');"  <axis:atr f="axissin050" c="IRESERVA" a="formato=decimal&modificable=true"/>    style="width:95%" id="IRESERVA_${lstReserva.OB_IAX_SIN_TRAMI_RESERVA_MULT.CTIPRES}_${fila}" name="IRESERVA_${lstReserva.OB_IAX_SIN_TRAMI_RESERVA_MULT.CTIPRES}_${fila}" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.OB_IAX_SIN_TRAMI_RESERVA.IRESERVA}"/>" />
                                                        </div>
                                                        </c:if>
                                                        
                                                    </display:column>
                                                    
                                                    <display:column title="${title4}" sortable="false" sortProperty="IPREREC" headerClass="sortable" style="width:16%"  media="html" autolink="false">

                                                        <!-- bug 0024774 -->
                                                        <c:if test="${miListaId.OB_IAX_SIN_TRAMI_RESERVA.CSELECC == 1}">
                                                        <div class="dspNumber">
                                                                <input type="text" class="campowidthinput campo campotexto"
                                                                title="${lstReserva.OB_IAX_SIN_TRAMI_RESERVA_MULT.TTIPRES} - ${miListaId.OB_IAX_SIN_TRAMI_RESERVA.TGARANT} - ${title4}"
                                                                 onchange="javascript:f_guardar_fila('${lstReserva.OB_IAX_SIN_TRAMI_RESERVA_MULT.CTIPRES}','${fila}','${miListaId.OB_IAX_SIN_TRAMI_RESERVA.NMOVRES}');"  <axis:atr f="axissin050" c="IPREREC" a="formato=decimal&modificable=true"/>    style="width:95%" id="IPREREC_${lstReserva.OB_IAX_SIN_TRAMI_RESERVA_MULT.CTIPRES}_${fila}" name="IPREREC_${lstReserva.OB_IAX_SIN_TRAMI_RESERVA_MULT.CTIPRES}_${fila}" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.OB_IAX_SIN_TRAMI_RESERVA.IPREREC}"/>" />
                                                        </div>
                                                        </c:if>

                                                    </display:column>
                                                    
                                                    <axis:visible c="ICAPRIE" f="axissin050">
                                                     <display:column title="${title22}" sortable="false" sortProperty="ICAPRIE" headerClass="sortable" style="width:12%"  media="html" autolink="false">
                                                        <div class="dspNumber">
                                                                    <input type="text" title="${lstReserva.OB_IAX_SIN_TRAMI_RESERVA_MULT.TTIPRES} - ${miListaId.OB_IAX_SIN_TRAMI_RESERVA.TGARANT} - ${title22}"
                                                                    class="campowidthinput campo campotexto" onchange="javascript:f_guardar_fila('${lstReserva.OB_IAX_SIN_TRAMI_RESERVA_MULT.CTIPRES}','${fila}','${miListaId.OB_IAX_SIN_TRAMI_RESERVA.NMOVRES}');" <axis:atr f="axissin050" c="ICAPRIE" a="formato=decimal&modificable=true"/>    style="width:95%" id="ICAPRIE_${lstReserva.OB_IAX_SIN_TRAMI_RESERVA_MULT.CTIPRES}_${fila}" name="ICAPRIE_${lstReserva.OB_IAX_SIN_TRAMI_RESERVA_MULT.CTIPRES}_${fila}" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.OB_IAX_SIN_TRAMI_RESERVA.ICAPRIE}"/>" />
                                                        </div>
                                                    </display:column>
                                                    </axis:visible>
                                                    
                                                     <axis:visible c="IPENALI" f="axissin050">
                                                    <display:column title="${title5}" sortable="false" sortProperty="IPENALI" headerClass="sortable" style="width:16%"  media="html" autolink="false">
                                                        <div class="dspNumber">
                                                                <input type="text" class="campowidthinput campo campotexto" 
                                                                title="${lstReserva.OB_IAX_SIN_TRAMI_RESERVA_MULT.TTIPRES} - ${miListaId.OB_IAX_SIN_TRAMI_RESERVA.TGARANT} - ${title5}"
                                                                onchange="javascript:f_guardar_fila('${lstReserva.OB_IAX_SIN_TRAMI_RESERVA_MULT.CTIPRES}','${fila}','${miListaId.OB_IAX_SIN_TRAMI_RESERVA.NMOVRES}');"  <axis:atr f="axissin050" c="IPENALI" a="formato=decimal&modificable=true"/>    style="width:95%" id="IPENALI_${lstReserva.OB_IAX_SIN_TRAMI_RESERVA_MULT.CTIPRES}_${fila}" name="IPENALI_${lstReserva.OB_IAX_SIN_TRAMI_RESERVA_MULT.CTIPRES}_${fila}" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.OB_IAX_SIN_TRAMI_RESERVA.IPENALI}"/>" />
                                                        </div>
                                                    </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axissin050" c="CMONRES">
                                                        <display:column title="${title6}" sortable="false" sortProperty="ICAPGAR" headerClass="sortable" style="width:12%" media="html" autolink="false">
                                                            <div class="dspNumber">
                                                            <select id="CMONRES_${lstReserva.OB_IAX_SIN_TRAMI_RESERVA_MULT.CTIPRES}_${fila}" name="CMONRES_${lstReserva.OB_IAX_SIN_TRAMI_RESERVA_MULT.CTIPRES}_${fila}" size="1"
                                                                onchange="javascript:f_guardar_fila('${lstReserva.OB_IAX_SIN_TRAMI_RESERVA_MULT.CTIPRES}','${fila}','${miListaId.OB_IAX_SIN_TRAMI_RESERVA.NMOVRES}');"
                                                                class="campowidthselect campo campotexto" <axis:atr f="axissin050" c="CMONRES" a="isInputText=false"/>> 
                                                                <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axissin050" c="SELEC" lit="1000348"/> - </option>
                                                                <c:forEach items="${listValores.lista_monedas}" var="monedaRes">
                                                                    <option value = "${monedaRes.CMONINT}" <c:if test="${monedaRes.CMONINT == miListaId.OB_IAX_SIN_TRAMI_RESERVA.CMONRES}">selected</c:if>>${monedaRes.TMONEDA}</option>
                                                                </c:forEach>
                                                            </select>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                       <%i++;%>
                                                </display:table>
                                            </div>
                                        </td>
                                     </tr>   
                                  </table>
                                 </td>
                    
                    </tr>  
                    </c:forEach>
                    <!-- *********************ob_iax_sin_trami_reserva_mult**************************************************************** -->
                <!--/table-->               
            </td>
        </tr>
    </table>

    <c:import url="../include/botonera_nt.jsp">
    	  <c:param name="f">axissin050</c:param>
        <c:param name="__botones">cancelar,aceptar</c:param>
    </c:import>
    </form>
    
    <c:import url="../include/mensajes.jsp" />
    
   
</body>
</html>