<%/* Revision:# KNN6618F0S1namtTO8/FqQ== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="nombrePantalla" value="tramitaciones"/>
<c:set var="nombreSeccion" value="citaciones"/>

<script type="text/javascript">

		function f_aceptar_citacion(NCITACION, FCITACION, HCITACION, CPAIS, CPROVIN, CPOBLAC, TLUGAR, NNUMIDE, NOMBRE, SPERSONCIT, TAUDIEN, CORAL, CESTADO, CRESOLU, FNUEVA, TRESULT, CMEDIO){
			objUtiles.ejecutarFormulario("axis_axissin006.do?PFCITACION="+FCITACION+"&NCITACION="+NCITACION+"&PHCITACION="+HCITACION+"&PCPAIS="+CPAIS+"&PCPROVIN="+CPROVIN+"&PCPOBLAC="+CPOBLAC+
					                     "&PTLUGAR="+encodeURIComponent(TLUGAR)+"&SPERSONCIT="+SPERSONCIT+"&TAUDIEN="+TAUDIEN+"&CORAL="+CORAL+"&CESTADO="+CESTADO+"&CRESOLU="+CRESOLU+"&FNUEVA="+FNUEVA+"&TRESULT="+encodeURIComponent(TRESULT)+"&CMEDIO="+CMEDIO
					                     , "grabar_citacion", document.miForm, "_self", objJsMessages.jslit_cargando);
		}
   
        function f_alta_citacion(nsinies, ntramit, sseguro, cagente){
			
        	f_abrir_modal('axissin071',null,'&isNew=yes&NSINIES=' + nsinies + '&NTRAMIT=' + ntramit + '&SSEGURO=' + sseguro + '&CAGENTE=' + cagente);                    

        }
        
        function f_edit_citacion(nsinies, ntramit, numero, asiste, fecha, hora, ciudad){
  
        	f_abrir_modal('axissin071',null,'&isNew=no&NSINIES=' + nsinies + '&NTRAMIT=' + ntramit + '&NCITACION=' + numero);                    
        }
        
        function f_consul_citacion(nsinies, ntramit, numero, asiste, fecha, hora, ciudad){
        	  
        	f_abrir_modal('axissin071',null,'&isNew=no&NSINIES=' + nsinies + '&NTRAMIT=' + ntramit + '&NCITACION=' + numero  + '&MODO=2');                    
        }
        
		function f_del_citacion(nsinies, ntramit, numero){  
			var confirma=confirm(objJsMessages.jslit_confirma_borrar);
            if (confirma) {
        	objUtiles.ejecutarFormulario("axis_axissin006.do?PNSINIES="+nsinies+"&PNTRAMIT="+ntramit + '&NCITACION=' + numero, "del_citacion", document.miForm, "_self", objJsMessages.jslit_cargando); 
            }
        }

</script>

<form name="${nombrePantalla}${nombreSeccion}" action="" method="POST"> 

    <axis:visible f="axissin006" c="DSP_CIT_TRAM">
        
        <table>           
             <tr id="DSP_CIT_TRAM_TIT">
                 <td class="campocaja">
                 
	                 <div style="float:left;">
	                     <b><axis:alt f="${formulari}" c="BT_CIT_TRAM_LOC" lit="9909802"/></b>
	                 </div>
	                 <!-- INI IAXIS-4887 -->
	                 <div style="float:right;">
	                 	<axis:visible f="axissin006" c="BT_SIN_NUEVO_TRAM_CIT">
	                         <div id="BT_SIN_NUEVO_TRAM_CIT">
		                         <a href="javascript:f_alta_citacion(document.miForm.NSINIES.value, ${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT},${__formdata.OB_IAX_SINIESTRO.SSEGURO}, ${__formdata.OB_IAX_SINIESTRO.CAGENTE});">
		                         	<img border="0" 
		                         		 alt="<axis:alt f="${formulari}" c="BT_SIN_NUEVO_TRAM_CIT" lit="9909802"/>" 
		                         		 title="<axis:alt f="${formulari}" c="BT_SIN_NUEVO_TRAM_CIT" lit="9909802"/>" 
		                         		 src="images/new.gif"/>
		                         </a>
	                         </div>
	                 	</axis:visible>
	                 </div>
	                 <!-- FIN IAXIS-4887 -->
	                 
                 </td>
             </tr>
            
             <tr id="DSP_CIT_TRAM_BOD">
             	<td>
                	<div>

                        <c:set var="title0"><axis:alt f="axissin006" c="NCITACION" lit="800440"  /> </c:set>  <!-- Numero -->
                        <c:set var="title1"><axis:alt f="axissin006" c="TASISTE"   lit="9903527" /> </c:set>  <!-- Asiste -->
                        <c:set var="title2"><axis:alt f="axissin006" c="FCITACION" lit="100562"  /> </c:set>  <!-- Fecha  -->
                        <c:set var="title3"><axis:alt f="axissin006" c="HCITACION" lit="9909800"  /> </c:set>  <!-- Hora   -->
                        <c:set var="title4"><axis:alt f="axissin006" c="TPOBLAC"   lit="9903660" /> </c:set>  <!-- Ciudad -->
                        
                        <c:set var="title5"><axis:alt f="axissin006" c="EDITAR"    lit="100002"  /> </c:set>  <!-- Editar -->

                        <div class="displayspace">
                        
                          <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CITACIONES}" id="lista" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0" requestURI="">
                            
                            <%@ include file="../include/displaytag.jsp"%>

                            <display:column title="${title0}" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspNumber">${lista.OB_IAX_SIN_TRAMI_CITACION.NCITACION}</div>
                            </display:column>
                            <display:column title="${title1}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText">${lista.OB_IAX_SIN_TRAMI_CITACION.PERSONA.TNOMBRE} ${lista.OB_IAX_SIN_TRAMI_CITACION.PERSONA.TAPELLI1} ${lista.OB_IAX_SIN_TRAMI_CITACION.PERSONA.TAPELLI2}</div>    
                            </display:column>
                            <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${lista.OB_IAX_SIN_TRAMI_CITACION.FCITACION}"/></div>    
                            </display:column>
                            <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText">${lista.OB_IAX_SIN_TRAMI_CITACION.HCITACION}</div>    
                            </display:column>
                            <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText">${lista.OB_IAX_SIN_TRAMI_CITACION.TPOBLAC}</div>    
                            </display:column>

							<axis:visible f="axissin006" c="BT_CIT_TRAM_EDIT">
 							<display:column title="${title5}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                 <div class="dspIcons" id="BT_CIT_TRAM_EDIT"><img border="0" alt="<axis:alt f="axissin006" c="BT_CIT_TRAM_EDIT" lit="1000113"/>" title1="<axis:alt f="axissin006" c="BT_CIT_TRAM_EDIT" lit="1000113"/>" src="images/lapiz.gif" width="16px" height="16px"
                                 style="cursor:pointer;" onClick="javascript:f_edit_citacion(document.miForm.NSINIES.value, '${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}','${lista.OB_IAX_SIN_TRAMI_CITACION.NCITACION}','${lista.OB_IAX_SIN_TRAMI_CITACION.PERSONA.SPERSON}','${lista.OB_IAX_SIN_TRAMI_CITACION.FCITACION}','${lista.OB_IAX_SIN_TRAMI_CITACION.HCITACION}','${lista.OB_IAX_SIN_TRAMI_CITACION.TPOBLAC}');" /></div>
                            </display:column>
                             </axis:visible>
                            
                            
                            <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                            <axis:visible f="axissin006" c="BT_CIT_TRAM_DEL"> 
                                 <div class="dspIcons" id="BT_CIT_TRAM_DEL" name="BT_CIT_TRAM_DEL"><img border="0" alt="<axis:alt f="axissin006" c="BT_CIT_TRAM_DEL" lit="9001333"/>" title1="<axis:alt f="axissin006" c="BT_CIT_TRAM_DEL" lit="9001333"/>" src="images/delete.gif" width="16px" height="16px"
                                 style="cursor:pointer;" onClick="javascript:f_del_citacion(document.miForm.NSINIES.value, '${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}','${lista.OB_IAX_SIN_TRAMI_CITACION.NCITACION}');" /></div>          
                             </axis:visible>
                            </display:column>
                            
                          
                            <!--boton CONSULTA AGENDA CITACIONES AB -->
                            
                           <display:column title="${title6}" headerClass="headwidth5 sortable" media="html" autolink="false" > 
                          	 <axis:visible f="axissin006" c="BT_CIT_TRAM_CONS">
                                 <div class="dspIcons" id="BT_CIT_TRAM_CONS" name="BT_CIT_TRAM_CONS"><img border="0" alt="<axis:alt f="axissin006" c="BT_CIT_TRAM_CONS" lit="109142"/>" title1="<axis:alt f="axissin006" c="BT_CIT_TRAM_CONS" lit="109142"/>" src="images/find.gif" width="16px" height="16px"
                                 style="cursor:pointer;" onClick="javascript:f_consul_citacion(document.miForm.NSINIES.value, '${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}','${lista.OB_IAX_SIN_TRAMI_CITACION.NCITACION}','${lista.OB_IAX_SIN_TRAMI_CITACION.PERSONA.SPERSON}','${lista.OB_IAX_SIN_TRAMI_CITACION.FCITACION}','${lista.OB_IAX_SIN_TRAMI_CITACION.HCITACION}','${lista.OB_IAX_SIN_TRAMI_CITACION.TPOBLAC}');" /></div>
                          </axis:visible>
                          </display:column>
                         
    
                          </display:table>
                           
                       </div>
                        
                    </div>
                </td>
            </tr>
        </table>
    </axis:visible>
                         
</form>