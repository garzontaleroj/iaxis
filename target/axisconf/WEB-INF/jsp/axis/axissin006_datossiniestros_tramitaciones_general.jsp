<%/* Revision:# In027Zf2X8WXKwvR8MHMhw== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="nombrePantalla" value="tramitaciones"/>
<c:set var="nombreSeccion" value="general"/>
<c:set var="formulari" value="axissin006"/>
<c:if test="${!empty param.f}">
    <c:set var="formulari">${param.f}</c:set>
</c:if>
<script type="text/javascript">

    
            
    /****************************************************************************************/
    /******************************* ACEPTAR MODALES*****************************************/
    /****************************************************************************************/

    function f_aceptar_axissin007(NSINIES,NTRAMIT) {
            objDom.setValorPorId("NSINIES", NSINIES);
            $("#indexTramitacio").val(NTRAMIT);
            document.miForm.subpantalla.value="tramitaciones";
            document.miForm.seccion.value="";
            objUtiles.ejecutarFormulario("axis_axissin006.do?", "cargarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
    function f_aceptar_axissin008(NSINIES) {
            objDom.setValorPorId("NSINIES", NSINIES);
            document.miForm.subpantalla.value="tramitaciones";
            document.miForm.seccion.value="";
            objUtiles.ejecutarFormulario("axis_axissin006.do?", "cargarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
    function f_aceptar_axissin009(NSINIES) {
            objDom.setValorPorId("NSINIES", NSINIES);
            document.miForm.subpantalla.value="tramitaciones";
            document.miForm.seccion.value="";
            objUtiles.ejecutarFormulario("axis_axissin006.do?", "cargarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
    function f_aceptar_axissin026(NSINIES) {
            objDom.setValorPorId("NSINIES", NSINIES);
            document.miForm.subpantalla.value="tramitaciones";
            document.miForm.seccion.value="";
            objUtiles.ejecutarFormulario("axis_axissin006.do?NSINIESselected="+NSINIES, "inicializarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
    function f_aceptar_axissin018(NSINIES) {
            objDom.setValorPorId("NSINIES", NSINIES);
            document.miForm.subpantalla.value="tramitaciones";
            document.miForm.seccion.value="";
            objUtiles.ejecutarFormulario("axis_axissin006.do?", "cargarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
    function f_aceptar_axissin016(NSINIES) {
            objDom.setValorPorId("NSINIES", NSINIES);
            document.miForm.subpantalla.value="tramitaciones";
            document.miForm.seccion.value="";
            objUtiles.ejecutarFormulario("axis_axissin006.do?", "cargarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
    function f_borrar_danyo(NDANO) {
            document.miForm.subpantalla.value="tramitaciones";
            document.miForm.seccion.value="";
        var answer = confirm(objJsMessages.jslit_confirma_borrar);
        if (answer)
            objUtiles.ejecutarFormulario("axis_axissin006.do?NDANO="+NDANO, "del_danyo", document.miForm, "_self", objJsMessages.jslit_cargando);
    }

    function f_borrar_localizacion(NLOCALI) {
            document.miForm.subpantalla.value="tramitaciones";
            document.miForm.seccion.value="";
        var answer = confirm(objJsMessages.jslit_confirma_borrar);
        if (answer)
            objUtiles.ejecutarFormulario("axis_axissin006.do?NLOCALI="+NLOCALI, "del_localizacion", document.miForm, "_self", objJsMessages.jslit_cargando);
    }        

    function f_borrar_documentacion(NDOCUM) {
            document.miForm.subpantalla.value="tramitaciones";
            document.miForm.seccion.value="";
        var answer = confirm(objJsMessages.jslit_confirma_borrar);
        if (answer)
            objUtiles.ejecutarFormulario("axis_axissin006.do?NDOCUM="+NDOCUM, "del_documentacion", document.miForm, "_self", objJsMessages.jslit_cargando);
    }  
    function f_cerrar_axisgedox() {
        objUtiles.cerrarModal("axisgedox");
        document.miForm.subpantalla.value="tramitaciones";
        document.miForm.seccion.value="";
        objUtiles.ejecutarFormulario("axis_axissin006.do", "cargarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);
    } 
    
      var nuevaVentana      = null;
        var idVentanas        = new Array();
        var contadorVentanas  = 0;

      	/*this.f_ver_doc = function(IDDOC){
            //document.miForm.IDDOC.value = IDDOC;
            nuevaVentana = window.open("modal_axisgedox.do?operation=tunnel&IDDOC=" + IDDOC);    
               
            // Abrir un proceso con setInterval para cerrar la ventana recién abierta
            
            if (document.all) {
            
                idVentanas[contadorVentanas] = setInterval("f_cerrar_nuevaVentana()", 100);
              
                contadorVentanas++;
           
            }  
                 
           
        }  
         this.f_cerrar_nuevaVentana = function(){
                try {
              
                    if (nuevaVentana != null && nuevaVentana.document.readyState != 'loading') {
                        nuevaVentana.window.close();
                    }
                } catch (e) {}
            } */
     
</script>
<c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisgedox|<axis:alt f="${formulari}" c="LIT_GEDOX" lit="1000201"/></c:param>
</c:import>
<form name="${nombrePantalla}${nombreSeccion}" action="" method="POST"> 

                        <!-- TRAMITACIONES CABECERA -->
                        <axis:ocultar f="${formulari}" c="DSP_TRAMIT_GENERAL" dejarHueco="false">
                        <c:set var="title0"></c:set><!--Num -->
                        <c:set var="title1"><axis:alt f="${formulari}" c="TTIPTRA" lit="100565" /></c:set><!--Tipo-->
                        <c:set var="title2"><axis:alt f="${formulari}" c="TTRAMIT" lit="100588" /></c:set><!--Descripcion-->
                        <c:set var="title3"><axis:alt f="${formulari}" c="TTCAUSIN" lit="9000901" /></c:set><!--Tipo Daño -->
                        <c:set var="title6"><axis:alt f="${formulari}" c="IPERIT" lit="9000904" /></c:set><!-- Importe peritaje -->
                        <c:set var="title7"><axis:alt f="${formulari}" c="CINFORM" lit="9000905" /></c:set><!--Informativa -->
                        <c:set var="title8"><axis:alt f="${formulari}" c="EDITAR" lit="100002" /></c:set><!--Editar-->
                        <c:set var="title9"><axis:alt f="${formulari}" c="ELIMINAR" lit="1000127" /></c:set><!--Eliminar-->
                        <c:set var="title10"><axis:alt f="${formulari}" c="CCULPAB_TRAMI" lit="1000511"/></c:set><!--Eliminar-->
                        <c:set var="title11"><axis:alt f="${formulari}" c="TTRAMITAD" lit="9910018" /></c:set><!-- Tramitador -->
                        <c:set var="title12"><axis:alt f="${formulari}" c="FESTTRA" lit="9910210" /></c:set><!-- Fecha de apertura -->
                        
                       
                        <%int i = 0;%>
                        
                          <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES}" id="T_IAX_TRAMITACIONES" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                           requestURI="">
                            <c:set var="i"><%=i%></c:set>
                        	<c:set var="indexMov" value="${fn:length(__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[i].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS)-1}"></c:set>
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                               <div class="dspIcons"><input  onClick="javascript:f_getTramitacion('${i}','${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.NTRAMIT}','${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.CTRAMIT}')"  
                               <c:if test="${__formdata.indexTramitacio == T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.NTRAMIT }"> checked </c:if>
                               value="" type="radio"  id="radioNTRAM" name="radioNTRAM"/></div> 
                             </display:column>
                            <display:column title="" sortable="true" sortProperty="NTRAMIT" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspNumber">${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.NTRAMIT}</div>
                            </display:column>
                            <display:column title="${title1}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText">${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.TTIPTRA}</div>    
                            </display:column>
                         <axis:visible f="${formulari}" c="FESTTRA">
                            <display:column title="${title12}" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[i].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[0].OB_IAX_SIN_TRAMI_MOVIMIENTO.FESTTRA}"/></div>    
                            </display:column>
                         </axis:visible>
                            <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText">${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.NRADICA}</div>    
                            </display:column>
                         <axis:visible f="${formulari}" c="TTRAMITAD">
                            <display:column title="${title11}" sortable="false" sortProperty="OB_IAX_SIN_TRAMI_MOVIMIENTO.TTRAMITAD" headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText">${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[i].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[indexMov].OB_IAX_SIN_TRAMI_MOVIMIENTO.TTRAMITAD}</div>    
                            </display:column>
                         </axis:visible>
                         <axis:visible f="${formulari}" c="TTCAUSIN">
                            <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText">${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.TTCAUSIN}</div>    
                            </display:column>
                         </axis:visible>
                         <axis:visible f="${formulari}" c="CCULPAB_TRAMI">
                            <display:column title="${title10}" sortable="false" sortProperty="OB_IAX_SIN_TRAMITACION.TCULPAB" headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText">${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.TCULPAB}</div>    
                            </display:column>
                         </axis:visible>
                         <axis:visible f="${formulari}" c="IPERIT">                            
                            <display:column title="${title6}" sortable="false" sortProperty="OB_IAX_PARAMETROS.VALOR" headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.DETALLE.IPERIT}"/></div>    
                            </display:column>
                         </axis:visible>
                         <axis:visible f="${formulari}" c="CINFORM">   
                            <display:column title="${title7}" sortable="false" sortProperty="CINFORM" headerClass="sortable" media="html" autolink="false" >
                               <div class="dspIcons">  <input type="checkbox" disabled id="CINFORM" name="CINFORM" value="${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.CINFORM}" 
                                                    <c:if test="${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.CINFORM == '1'}">checked</c:if> ></div>    
                            </display:column> 
                         </axis:visible>
                            <axis:visible f="${formulari}" c="BT_SIN_EDITAR_TRAM_GEN"> <!-- boton editar tramitaciones general -->
                            <display:column title="${title8}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                <div class="dspIcons" id="BT_SIN_EDITAR_TRAM_GEN"><img border="0" alt="<axis:alt f="${formulari}" c="BT_SIN_EDITAR_TRAM_GEN" lit="100002"/>" title1="<axis:alt f="${formulari}" c="BT_SIN_EDITAR_TRAM_GEN" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                style="cursor:pointer;" onclick="javascript:f_abrir_modal('axissin007',null,'&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&NSINIES='+document.miForm.NSINIES.value+'&CCAUSIN='+document.miForm.CCAUSIN.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&CMOTSIN='+document.miForm.CMOTSIN.value+'&NTRAM='+${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.NTRAMIT}+'&MOD_TRAM=MOD&NRIESGO='+document.miForm.NRIESGO.value+'&NTRAMTE='+'${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.NTRAMTE}');"  /></div>
                            </display:column> 
                            </axis:visible>
                            <axis:visible f="${formulari}" c="BT_SIN_DELETE_TRAM_GEN"> <!-- boton delete tramitaciones general -->
                            <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                <div class="dspIcons" id="BT_SIN_DELETE_TRAM_GEN">
                                <c:if test="${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.CBORRAB!=1}"><!-- No se podran borrar determinadas tramitaciones p.ej. la 0 -->
                                <img border="0" alt="<axis:alt f="${formulari}" c="BT_SIN_DELETE_TRAM_GEN" lit="1000127"/>" title1="<axis:alt f="${formulari}" c="BT_SIN_DELETE_TRAM_GEN" lit="1000127"/>" src="images/delete.gif" width="15px" height="15px"
                                style="cursor:pointer;" onclick="f_borrar_tramitacion(${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.NTRAMIT},${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.CTIPTRA})"/>
                                </c:if>
                                </div>
                            </display:column>
                            </axis:visible>
                            <axis:visible f="${formulari}" c="BT_SIN_MAS_TRAM_GEN"> <!-- boton mas tramitaciones general -->
                            <display:column title="" headerClass="headwidth5 sortable" style="width:5%" media="html" autolink="false" >
                                <div class="dspIcons" id="BT_SIN_MAS_TRAM_GEN"><img border="0" alt="<axis:alt f="${formulari}" c="BT_SIN_MAS_TRAM_GEN" lit="1000439"/>" title1="<axis:alt f="${formulari}" c="BT_SIN_MAS_TRAM_GEN" lit="1000439"/>" src="images/mas.gif" width="11px" height="11px"
                                style="cursor:pointer;" onclick="javascript:f_abrir_modal('axissin007',null,'&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&NSINIES='+document.miForm.NSINIES.value+'&CCAUSIN='+document.miForm.CCAUSIN.value+'&CMOTSIN='+document.miForm.CMOTSIN.value+'&NTRAM='+${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.NTRAMIT}+'&MOD_TRAM=CONS'+'&NTRAMTE='+'${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.NTRAMTE}');"/></div>
                            </display:column>
                            </axis:visible>         
                                                        
                           <%i++;%>
                        </display:table>
                        </div>
                        <!-- FIN TRAMITACIONES -->
                        </axis:ocultar>
                        <table>
                        
                        <tr>
                            <td>
                                <!-- bug 0021196 indexmov -->
                                <c:set var="indexMov" value="${fn:length(__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS)-1}"></c:set>
                                <table class="area" align="center">
                                <tr>
                                    <th style="height:0px"></th>
                                </tr>
                                <!-- Inicio Seccion -->
                                <axis:ocultar f="${formulari}" c="DSP_MOVTRAMIT" dejarHueco="false">
                                <c:if test="${!empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS || 
                            		(empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS )}">
                                <tr>
                                    <td class="campocaja">  
                                    <div style="float:left;">
                                        <b><axis:alt f="${formulari}" c="BT_SIN_NUEVO_TRAM_MOV" lit="9001474"/></b>
                                    </div>
                                    <div style="float:right;">
                                            <axis:visible f="${formulari}" c="BT_SIN_NUEVO_TRAM_MOV">  <!-- bot nuevo mov tramitaciones -->
                                            <div id="BT_SIN_NUEVO_TRAM_MOV">
                                            <!-- bug 0021196  afegir params -->
                                           <a href="javascript:f_abrir_modal('axissin016',null,'&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&isNew=yes&CEMPRES='+document.miForm.CEMPRES.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}'+'&NESTADO='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[0].OB_IAX_SIN_TRAMI_MOVIMIENTO.CESTTRA}'+'&CESTTRA='+ '${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[indexMov].OB_IAX_SIN_TRAMI_MOVIMIENTO.CESTTRA}'+'&CSUBTRA='+ '${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[indexMov].OB_IAX_SIN_TRAMI_MOVIMIENTO.CSUBTRA}'+'&CUNITRA='+ '${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[indexMov].OB_IAX_SIN_TRAMI_MOVIMIENTO.CUNITRA}'+'&CTRAMIT='+ '${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[indexMov].OB_IAX_SIN_TRAMI_MOVIMIENTO.CTRAMITAD}'   );">
                                           <img border="0" alt="<axis:alt f="${formulari}" c="BT_SIN_NUEVO_TRAM_MOV" lit="9001474"/>" title="<axis:alt f="${formulari}" c="BT_SIN_NUEVO_TRAM_MOV" lit="9001474"/>" src="images/new.gif"/></a>
                                            </div>
                                            </axis:visible>
                                    </div>
                                    </td>

                                </tr>
                                <tr>
                                    <td>
                                        <!-- TABLA SECCION  MOVIMIENTOS TRAMITACION -->
                                                                             
                                            <c:set var="title0"></c:set><!--Num -->
                                            <c:set var="title1"><axis:alt f="${formulari}" c="NMOVTRA" lit="100899" /></c:set><!--Numero-->
                                            <c:set var="title2"><axis:alt f="${formulari}" c="TESTTRA" lit="100587" /></c:set><!--Estado-->
                                            <c:set var="title3"><axis:alt f="${formulari}" c="TSUBTRA" lit="9902790" /></c:set><!--Subestado -->
                                            <c:set var="title4"><axis:alt f="${formulari}" c="FESTTRA" lit="9906065" /></c:set><!-- Fecha -->
                                            <c:set var="title5"><axis:alt f="${formulari}" c="TUNITRA" lit="9000900" /></c:set><!-- Unidad tramitación -->
                                            <c:set var="title6"><axis:alt f="${formulari}" c="TTRAMITAD" lit="9910018" /></c:set><!-- Tramitador -->
                                            
                                            <!-- ini bug 0021196 -->
                                            <axis:visible f="${formulari}" c="TCAUEST">
                                            <c:set var="title7"><axis:alt f="${formulari}" c="TCAUEST" lit="9002029" /></c:set><!-- Causa estado -->
                                            </axis:visible>
                                            <!-- fin bug 0021196 -->
                                            
                                            <c:set var="num_tramitacion">0</c:set>
                                            <!--Movimientos : ${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[0].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS}-->
                                            <div class="displayspace">
                                              <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS}" id="T_IAX_TRAM_MOV" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0" defaultsort="1" defaultorder="descending"
                                               requestURI="">
                                                <%@ include file="../include/displaytag.jsp"%> 
                                                <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_SIN_TRAMI_MOVIMIENTO.NMOVTRA" headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspNumber">${T_IAX_TRAM_MOV.OB_IAX_SIN_TRAMI_MOVIMIENTO.NMOVTRA}</div>
                                                </display:column>
                                                <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_MOV.OB_IAX_SIN_TRAMI_MOVIMIENTO.TESTTRA}</div>    
                                                </display:column>
                                                <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_MOV.OB_IAX_SIN_TRAMI_MOVIMIENTO.TSUBTRA}</div>    
                                                </display:column>
                                                <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_MOV.OB_IAX_SIN_TRAMI_MOVIMIENTO.FESTTRA}"/></div>
                                                </display:column>
                                                <display:column title="${title5}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_MOV.OB_IAX_SIN_TRAMI_MOVIMIENTO.TUNITRA}</div>    
                                                </display:column>
                                                <display:column title="${title6}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_MOV.OB_IAX_SIN_TRAMI_MOVIMIENTO.TTRAMITAD}</div>    
                                                </display:column>
                                                <!-- ini bug 0021196 -->
                                                <axis:visible f="${formulari}" c="TCAUEST">
                                                <display:column title="${title7}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_MOV.OB_IAX_SIN_TRAMI_MOVIMIENTO.TCAUEST}</div>    
                                                </display:column>
                                                </axis:visible>
                                                <!-- fin bug 0021196 -->
                                                                                                                   
                                            </display:table>
                                            </div>
                                        <!-- FIN MOVIMIENTOS TRAMITACION -->
                                    </td>
                                </tr>  
                              </c:if>
                                </axis:ocultar>
                                <axis:ocultar f="${formulari}" c="DSP_LOCALITRAMI" dejarHueco="false">
                                                               	
                        <tr id="tramitaciones_citaciones">
			                <td align="left">
			                   <jsp:include page="axissin006_datossiniestros_tramitaciones_citaciones.jsp"/>
			                </td>
			            </tr>
               
                          <tr id="DSP_LOCALIZACIONES_SINIES">
                           <td>
                             <table>
                             
                             
                                <tr id="DSP_LOCALIZACIONES_SINIES_TIT">
                                    <td class="campocaja">
                                    <div style="float:left;">
                                        <b><axis:alt f="${formulari}" c="BT_SIN_NUEVO_TRAM_LOC" lit="9000906"/></b>
                                    </div>
                                    <div style="float:right;">
                                            <axis:visible f="${formulari}" c="BT_SIN_NUEVO_TRAM_LOC">  <!-- bot nuevo tram localizaciones -->
                                            <div id="BT_SIN_NUEVO_TRAM_LOC">
                                            <a href="javascript:f_abrir_modal('axissin008',null,'&isNew=yes&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}');">
                                            <img border="0" alt="<axis:alt f="${formulari}" c="BT_SIN_NUEVO_TRAM_LOC" lit="9000906"/>" title="<axis:alt f="${formulari}" c="BT_SIN_NUEVO_TRAM_LOC" lit="9000906"/>" src="images/new.gif"/></a>
                                            </div>
                                            </axis:visible>
                                    </div>
                                    </td>
                                </tr>
                               
                                <tr id="DSP_LOCALIZACIONES_SINIES_BOD">
                                    <td>
                                        <!-- TABLA SECCION  LOCALIZACIONES TRAMITACION -->
                                                                             
                                            <c:set var="title0"><axis:alt f="${formulari}" c="NLOCALI" lit="100899" /></c:set><!--Num -->
                                            <c:set var="title1"><axis:alt f="${formulari}" c="TPAIS" lit="100816" /></c:set><!--Pais-->
                                            <c:set var="title2"><axis:alt f="${formulari}" c="TPROVIN" lit="100756" /></c:set><!--Provincia-->
                                            <c:set var="title3"><axis:alt f="${formulari}" c="TPOBLAC" lit="100817" /></c:set><!--Poblacion -->
                                            <c:set var="title4"><axis:alt f="${formulari}" c="CPOSTAL" lit="100823" /></c:set><!-- CP -->
                                            <c:set var="title5"><axis:alt f="${formulari}" c="DIRECCION" lit="105889" /></c:set><!-- Direccion -->
                                            <c:set var="title6"><axis:alt f="${formulari}" c="FBAJA" lit="102853" /></c:set><!-- FBAJA -->
                                            <c:set var="title7"><axis:alt f="${formulari}" c="EDITAR" lit="100002" /></c:set><!--Editar-->
                                            <c:set var="title8"><axis:alt f="${formulari}" c="ELIMINAR" lit="1000127" /></c:set><!--Eliminar-->
                                            <c:set var="title9"><axis:alt f="${formulari}" c="TLOCALI" lit="100588" /></c:set><!--Desc-->
                                            <c:set var="title10"><axis:alt f="${formulari}" c="CCONTABLE" lit="89908070"/></c:set><!-- Localizacion Contable IAXIS-4961 EAD:13/08/2020 -->
                                            <c:set var="num_tramitacion">0</c:set>
                                            <div class="displayspace">
                                              <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.LOCALIZACIONES}" id="T_IAX_TRAM_LOCALIZA" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title0}" sortable="true" style="width:3%" sortProperty="OB_IAX_SIN_TRAMI_LOCALIZA.NLOCALI" headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspNumber">${T_IAX_TRAM_LOCALIZA.OB_IAX_SIN_TRAMI_LOCALIZA.NLOCALI}</div>
                                                </display:column>
                                                
                                                <display:column title="${title1}" sortable="false" style="width:15%"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_LOCALIZA.OB_IAX_SIN_TRAMI_LOCALIZA.TPAIS}</div>    
                                                </display:column>
                                                <display:column title="${title2}" sortable="false" style="width:15%"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_LOCALIZA.OB_IAX_SIN_TRAMI_LOCALIZA.TPROVIN}</div>    
                                                </display:column>
                                                <display:column title="${title3}" sortable="false" style="width:15%"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_LOCALIZA.OB_IAX_SIN_TRAMI_LOCALIZA.TPOBLAC}</div>    
                                                </display:column>
                                                 <display:column title="${title4}" sortable="false" style="width:6%"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_LOCALIZA.OB_IAX_SIN_TRAMI_LOCALIZA.CPOSTAL}</div>    
                                                </display:column>
                                                <display:column title="${title5}/${title9}" sortable="false" style="width:40%"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">
                                                     <c:choose>
                                                     <c:when test="${empty T_IAX_TRAM_LOCALIZA.OB_IAX_SIN_TRAMI_LOCALIZA.TLOCALI}">
                                                     	${T_IAX_TRAM_LOCALIZA.OB_IAX_SIN_TRAMI_LOCALIZA.TNOMVIA} , ${T_IAX_TRAM_LOCALIZA.OB_IAX_SIN_TRAMI_LOCALIZA.NNUMVIA}     
                                                     </c:when>
                                                     <c:otherwise>
                                                    		${T_IAX_TRAM_LOCALIZA.OB_IAX_SIN_TRAMI_LOCALIZA.TLOCALI}
                                                     </c:otherwise>
                                                      </c:choose> 
                                                   <%--   ${T_IAX_TRAM_LOCALIZA.OB_IAX_SIN_TRAMI_LOCALIZA.TDOMICI}--%>
                                                      </div> 
                                                </display:column>
                                                <!--INI IAXIS-4961 EAD:13/08/2020  -->
                                                <display:column title="${title10}" sortable="false" headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspIcons"><a name="check_ccontable_${T_IAX_TRAM_LOCALIZA.OB_IAX_SIN_TRAMI_LOCALIZA.CCONTABLE}"/>
                                                        <input type="checkbox" id="check_ccontable_${T_IAX_TRAM_LOCALIZA.OB_IAX_SIN_TRAMI_LOCALIZA.CCONTABLE}"  <c:if test="${T_IAX_TRAM_LOCALIZA.OB_IAX_SIN_TRAMI_LOCALIZA.CCONTABLE == 1}"> checked </c:if>  value="" disabled="disabled" />
                                                    </div>
                                                </display:column>
                                                <!--FIN IAXIS-4961 EAD:13/08/2020  -->
                                        <%--
                                                    <display:column title="${title9}" style="width:40%" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                         <div class="dspText">${T_IAX_TRAM_LOCALIZA.OB_IAX_SIN_TRAMI_LOCALIZA.TLOCALI}</div>    
                                                    </display:column>--%>
                                                <display:column title="${title6}" sortable="false" style="width:15%"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_LOCALIZA.OB_IAX_SIN_TRAMI_LOCALIZA.FBAJA}"/></div>    
                                                </display:column>
                                            
                                                <axis:visible f="${formulari}" c="BT_SIN_EDITAR_TRAM_LOC"> <!--boton nuevo tram localizaciones --> 
                                                <display:column title="${title7}" headerClass="headwidth5 sortable" style="width:5%" media="html" autolink="false" >
                                                    <div class="dspIcons" id="BT_SIN_EDITAR_TRAM_LOC"><img border="0" alt="<axis:alt f="${formulari}" c="BT_SIN_EDITAR_TRAM_LOC" lit="100002"/>" title1="<axis:alt f="${formulari}" c="BT_SIN_EDITAR_TRAM_LOC" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="f_abrir_modal('axissin008',null,'&isNew=no&NLOCALI='+'${T_IAX_TRAM_LOCALIZA.OB_IAX_SIN_TRAMI_LOCALIZA.NLOCALI}'+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}');"/>
                                                    </div>
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible f="${formulari}" c="BT_SIN_DELETE_TRAM_LOC">  <!-- boton delete tram localizaciones -->
                                                <display:column title="" headerClass="headwidth5 sortable" style="width:5%" media="html" autolink="false" >
                                                    <div class="dspIcons" id="BT_SIN_DELETE_TRAM_LOC"><img border="0" alt="<axis:alt f="${formulari}" c="BT_SIN_DELETE_TRAM_LOC" lit="1000127"/>" title1="<axis:alt f="${formulari}" c="BT_SIN_DELETE_TRAM_LOC" lit="1000127"/>" src="images/delete.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="f_borrar_localizacion('${T_IAX_TRAM_LOCALIZA.OB_IAX_SIN_TRAMI_LOCALIZA.NLOCALI}')"/>
                                                    </div>
                                                </display:column>
                                                </axis:visible>
												
												  <axis:visible f="${formulari}" c="BT_SIN_CONSUL_TRAM_LOC">
					                           <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" > 
					                                 <div class="dspIcons" id="BT_SIN_CONSUL_TRAM_LOC"><img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_CONSUL_TRAM_LOC" lit="109142"/>" title1="<axis:alt f="axissin006" c="BT_SIN_CONSUL_TRAM_LOC" lit="109142"/>" src="images/find.gif" width="16px" height="16px"
					                                 style="cursor:pointer;" onclick="f_abrir_modal('axissin008',null,'&isNew=no&NLOCALI='+'${T_IAX_TRAM_LOCALIZA.OB_IAX_SIN_TRAMI_LOCALIZA.NLOCALI}'+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}'+'&MODO=2');"/>
                                                  </div>
					                          </display:column>
					                         	</axis:visible>
                                               
                                            </display:table>
                                            </div>
                                        <!-- FIN TRAMITACION LOCALIZACIONES  -->
                                    </td>
                                </tr>  
                            
                                <%--/axis:visible--%>
                              <%-- /c:if --%>
                           </table>
                           </td>
                           </tr>
                           
                                
                                </axis:ocultar>
                                <axis:ocultar f="${formulari}" c="DSP_DANYOTRAMIT" dejarHueco="false">
                                	<c:if test="${!empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.DANYOS || 
                            		(empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.DANYOS )}"> 
                                <tr>
                                    <td class="campocaja">
                                    <div style="float:left;">
                                        <b><axis:alt f="${formulari}" c="BT_SIN_NUEVO_TRAM_DANYO" lit="9000907"/></b>
                                    </div>
                                    <div style="float:right;" id="BT_SIN_NUEVO_TRAM_DANYO">
                                            <axis:visible f="${formulari}" c="BT_SIN_NUEVO_TRAM_DANYO"> <!-- bot nuevo tramitaciones danyo --> 
                                            <c:if test="${  __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CTIPTRA != 2 && __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CTIPTRA != 1  }">
                                            <a href="javascript:f_abrir_modal('axissin009',null,'&isNew=yes&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}');">
                                            <img border="0" alt="<axis:alt f="${formulari}" c="BT_SIN_NUEVO_TRAM_DANYO" lit="9000907"/>" title="<axis:alt f="${formulari}" c="BT_SIN_NUEVO_TRAM_DANYO" lit="9000907"/>" src="images/new.gif"/></a>
                                            </c:if>
                                            
                                            <c:if test="${  __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CTIPTRA==2 || __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CTIPTRA==1  }">
                                            <a href="javascript:f_abrir_modal('axissin018',null,'&isNew=yes&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}');">
                                            <img border="0" alt="<axis:alt f="${formulari}" c="BT_SIN_NUEVO_TRAM_DANYO" lit="9000907"/>" title="<axis:alt f="${formulari}" c="BT_SIN_NUEVO_TRAM_DANYO" lit="9000907"/>" src="images/new.gif"/></a>
                                            </c:if>
                                            </axis:visible>
                                    </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <!-- TABLA SECCION  DANYOS TRAMITACION -->
                                            <c:set var="num_tramitacion">0</c:set>                                  
                                            <c:set var="title0"><axis:alt f="${formulari}" c="NDANO" lit="1000109" /></c:set><!--Tipo-->
                                            <c:set var="title1"><axis:alt f="${formulari}" c="TDANO" lit="100588" /></c:set><!--Descripcion-->
                                            <c:set var="title2"><axis:alt f="${formulari}" c="EDITAR" lit="100002" /></c:set><!--Editar-->
                                            <c:set var="title3"><axis:alt f="${formulari}" c="ELIMINAR" lit="1000127" /></c:set><!--Eliminar-->
                                            <c:set var="title4"><axis:alt f="${formulari}" c="TTIPINF" lit="9001733" /></c:set><!--Tipus-->
                                            <c:set var="num_tramitacion">0</c:set>
                                            <div class="displayspace">
                                              <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.DANYOS}" id="T_IAX_TRAM_DANYOS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_SIN_TRAMI_DANO.TTIPDANO" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_DANYOS.OB_IAX_SIN_TRAMI_DANO.NDANO}</div>    
                                                </display:column>
                                                <display:column title="${title1}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_DANYOS.OB_IAX_SIN_TRAMI_DANO.TDANO}</div>    
                                                </display:column> 
                                                 <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_DANYOS.OB_IAX_SIN_TRAMI_DANO.TTIPINF}</div>    
                                                </display:column> 
                                                <axis:visible f="${formulari}" c="BT_SIN_EDITAR_TRAM_DANYO"> <!-- boton editar tramitaciones danyo --> 
                                                <display:column title="${title2}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                    <div class="dspIcons" id="BT_SIN_EDITAR_TRAM_DANYO"><img border="0" alt="<axis:alt f="${formulari}" c="BT_SIN_EDITAR_TRAM_DANYO" lit="100002"/>" title1="<axis:alt f="${formulari}" c="BT_SIN_EDITAR_TRAM_DANYO" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" 
                                                    
                                                    <c:if test="${  __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CTIPTRA != 2 && __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CTIPTRA != 1  }">
                                                    onclick="f_abrir_modal('axissin009',null,'&isNew=no&NDANO='+'${T_IAX_TRAM_DANYOS.OB_IAX_SIN_TRAMI_DANO.NDANO}'+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}');"
                                                    </c:if>
                                                    <c:if test="${  __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CTIPTRA==2 || __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CTIPTRA==1  }">
                                                    onclick="f_abrir_modal('axissin018',null,'&isNew=no&NDANO='+'${T_IAX_TRAM_DANYOS.OB_IAX_SIN_TRAMI_DANO.NDANO}'+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}');"
                                                    </c:if>
                                                
                                                    />
                                                    </div>
                                                </display:column> 
                                                </axis:visible>
                                                <axis:visible f="${formulari}" c="BT_SIN_DELETE_TRAM_DANYO"> <!-- boton delete tramitaciones danyo --> 
                                                <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                    <div class="dspIcons" id="BT_SIN_DELETE_TRAM_DANYO"><img border="0" alt="<axis:alt f="${formulari}" c="BT_SIN_DELETE_TRAM_DANYO" lit="1000127"/>" title1="<axis:alt f="${formulari}" c="BT_SIN_DELETE_TRAM_DANYO" lit="1000127"/>" src="images/delete.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="f_borrar_danyo('${T_IAX_TRAM_DANYOS.OB_IAX_SIN_TRAMI_DANO.NDANO}')"/></div>
                                                </display:column>
                                                </axis:visible>
<c:if test="${  __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CTIPTRA==2 || __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CTIPTRA==1  }">
                            										<axis:visible f="${formulari}" c="BT_SIN_MAS_TRAM_DANYO"> <!-- boton mas tramitaciones danyo --> 
                                                <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
																								<div class="dspIcons" id="BT_SIN_MAS_TRAM_DANYO"><img border="0" alt="<axis:alt f="${formulari}" c="BT_SIN_MAS_TRAM_DANYO" lit="100002"/>" title1="<axis:alt f="${formulari}" c="BT_SIN_MAS_TRAM_DANYO" lit="100002"/>" src="images/mas.gif" width="11px" height="11px"
								                                style="cursor:pointer;"  onclick="f_abrir_modal('axissin018',null,'&isNew=no&NDANO='+'${T_IAX_TRAM_DANYOS.OB_IAX_SIN_TRAMI_DANO.NDANO}'+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NRAMIT='+'${__formdata.indexTramitacio}');"/>
								                								</div>
                                                </display:column> 
										                            </axis:visible>                                                  
                                                </c:if>
												
												<!-- consulta de lozalizacion AB  -->
												 <axis:visible f="${formulari}" c="BT_SIN_CONSUL_TRAM_LOC">
					                           <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" > 
					                                 <div class="dspIcons" id="BT_SIN_CONSUL_TRAM_LOC"><img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_CONSUL_TRAM_LOC" lit="109142"/>" title1="<axis:alt f="axissin006" c="BT_SIN_CONSUL_TRAM_LOC" lit="109142"/>" src="images/find.gif" width="16px" height="16px"
					                                 style="cursor:pointer;" onclick="f_abrir_modal('axissin008',null,'&isNew=no&NLOCALI='+'${T_IAX_TRAM_LOCALIZA.OB_IAX_SIN_TRAMI_LOCALIZA.NLOCALI}'+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}'+'&MODO=2');"/>
                                                  </div>
					                          </display:column>
					                         	</axis:visible>
                                               
                                            </display:table>
                                            </div>
                                        <!-- FIN TRAMITACION DANYOS  -->
                                    </td>
                                </tr>    
                              </c:if>
                                </axis:ocultar>
                                <axis:visible c="GENERAL2" f="${formulari}">
<jsp:include page="axissin006_datossiniestros_tramitaciones_general_02.jsp"/>
                        </axis:visible>
                        
                        
