<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>                        

<c:set var="nombrePantalla" value="tramitaciones"/>
<c:set var="nombreSeccion" value="tramitaciones_personas"/>

<script type="text/javascript">

/*function f_aceptar_axissin039(NSINIES) {
alert("antes");
            objDom.setValorPorId("NSINIES", NSINIES);
            document.miForm.subpantalla.value="tramitaciones";
            document.miForm.seccion.value="tramitaciones_agenda";
            objUtiles.ejecutarFormulario("axis_axissin006.do?", "cargarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);
}*/


function f_aceptar_axissin039(NSINIES,subpantalla) {
            //alert("En personas tramitaciones: "+subpantalla);
            objDom.setValorPorId("NSINIES", NSINIES);
            if(subpantalla=='personasrel'){
                document.miForm.subpantalla.value="personasrel";
            }else{
                document.miForm.subpantalla.value="tramitaciones";
                document.miForm.seccion.value="tramitaciones_personasrel";
            }
            f_cerrar_modal("axissin039");
            objDom.setValorPorId("isNew", "false");
            objUtiles.ejecutarFormulario("axis_axissin006.do", "cargarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);
}

function f_borrar_personarel(NPERSREL){
          //alert(NPERSREL);
          var confirma=confirm(objJsMessages.jslit_confirma_borrar);
                if (confirma) {
                    objDom.setValorPorId("CPERSREL", NPERSREL);
                    //alert("..."+document.miForm.CPERSREL.value);
                    document.miForm.subpantalla.value="tramitaciones";
                    document.miForm.seccion.value="tramitaciones_personarel";
                    objUtiles.ejecutarFormulario("axis_axissin006.do?", "borrar_personarel", document.miForm, "_self", objJsMessages.jslit_cargando);
          }
  
}
    
    
</script>

<form name="${nombrePantalla}" action="" method="POST">                      
                        <!-- bug 0024690 cambio literal title2 -->
                        <c:set var="title1"><axis:alt f="axissin006_datossiniestros_tramitaciones_personas" c="tNPERSREL" lit="9000455" /></c:set><!-- Núm.línea -->
                        <c:set var="title2"><axis:alt f="axissin006_datossiniestros_tramitaciones_personas" c="tTTIPREL" lit="9001604" /></c:set><!-- Tipo persona  abans 102844 -->
                        <c:set var="title3"><axis:alt f="axissin006_datossiniestros_tramitaciones_personas" c="tNNUMIDE" lit="102999" /></c:set><!--Núm. Document-->
                        <c:set var="title4"><axis:alt f="axissin006_datossiniestros_tramitaciones_personas" c="tTNOMBRE" lit="105940" /></c:set><!--Nombre-->
                        <c:set var="title5"><axis:alt f="axissin006_datossiniestros_tramitaciones_personas" c="tTAPELLI1" lit="108243" /></c:set><!--Apellido 1--> 
                        <c:set var="title6"><axis:alt f="axissin006_datossiniestros_tramitaciones_personas" c="tTAPELLI2" lit="108246" /></c:set><!--Apellido 2-->
                        <c:set var="title7"><axis:alt f="axissin006_datossiniestros_tramitaciones_personas" c="tTTELEFON" lit="9000992" /></c:set><!--Teléfono-->
                        <c:set var="title8"><axis:alt f="axissin006_datossiniestros_tramitaciones_personas" c="tTDESC" lit="100588" /></c:set><!--Descripción-->
                        <c:set var="title9"><axis:alt f="axissin006_datossiniestros_tramitaciones_personas" c="tEDITAR" lit="100002" /></c:set><!--Editar-->
                        <c:set var="title10"><axis:alt f="axissin006_datossiniestros_tramitaciones_personas" c="tDELETE" lit="1000127"/></c:set><!--Eliminar-->
                        <c:set var="title11"><axis:alt f="axissin006_datossiniestros_tramitaciones_personas" c="tTNOMBRE2" lit="9902260"/></c:set><!--Eliminar-->
                        <c:set var="num_tramitacion">0</c:set>  
                        <div class="displayspace">
                          <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.PERSONASREL}" id="T_IAX_PERSONAS" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                           requestURI="">
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="${title1}" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspNumber">${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.NPERSREL}</div>
                            </display:column>
                            <!-- bug 0024690 cambio antes CTIPIDE -->
                            <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                <div class="dspNumber">${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.TTIPREL}</div>
                            </display:column>
                            <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                <div class="dspNumber">${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.NNUMIDE}</div>
                            </display:column>
                            <axis:visible c="TNOMBRE" f="axissin006">
                            <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                <div class="dspNumber">${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.TNOMBRE}</div>
                            </display:column>
                            </axis:visible>
                            <axis:visible c="TNOMBRE2" f="axissin006">
                                <display:column title="${title11}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                    <div class="dspNumber">${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.TNOMBRE2}</div>
                                </display:column>
                            </axis:visible>
                            <display:column title="${title5}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                <div class="dspNumber">${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.TAPELLI1}</div>
                            </display:column>
                            <display:column title="${title6}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                <div class="dspNumber">${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.TAPELLI2}</div>
                            </display:column>
                            <display:column title="${title7}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                <div class="dspNumber">${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.TTELEFON}</div>
                            </display:column>
                            <display:column title="${title8}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                <div class="dspNumber">${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.TDESC}</div>
                            </display:column>
                            
                            <axis:visible f="axissin006" c="BT_SIN_EDITAR_PER_REL"> <!-- IAXIS-4887 -->
                            <display:column title="${title9}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                 <div class="dspIcons" id="BT_SIN_EDITAR"><img border="0" alt="<axis:alt f="axissin006_datossiniestros_tramitaciones_personas" c="BT_SIN_EDITAR" lit="100002"/>" title1="<axis:alt f="axissin006_datossiniestros_tramitaciones_personas" c="BT_SIN_EDITAR" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                style="cursor:pointer;" onclick="f_abrir_modal('axissin039',null,'&NTRAMIT='+document.miForm.NTRAMIT.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&NPERSREL='+${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.NPERSREL}+'&MODO=MOD'+'&NSINIES='+document.miForm.NSINIES.value+'&subpantalla=tramitaciones&seccion=tramitaciones_personarel');"/></div>
                                
                            </display:column>
                             </axis:visible>
                             <axis:visible f="axissin006" c="BT_SIN_DELETE_PER_REL"> <!-- IAXIS-4887 -->
                            <display:column title="${title10}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                <div class="dspIcons" id="BT_SIN_DELETE"><img border="0" alt="<axis:alt f="axissin006_datossiniestros_tramitaciones_personas" c="BT_SIN_DELETE" lit="1000127"/>" title1="<axis:alt f="axissin006_datossiniestros_tramitaciones_personas" c="BT_SIN_DELETE" lit="1000127"/>" src="images/delete.gif" width="15px" height="15px"
                                style="cursor:pointer;" onclick="javascript:f_borrar_personarel(${T_IAX_PERSONAS.OB_IAX_SIN_TRAMI_PERSONAREL.NPERSREL});"/></div>
                            </display:column>
                            </axis:visible>
                           
                        </display:table>
                        </div>
</form>