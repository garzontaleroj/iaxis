<%/* Revision:# 6Dsvob7byO0RJFFnmrFyNA== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% request.setAttribute("__miDS", axis.jdbc.ConexionFactoria.getDataSource("db01")); %>
<sql:setDataSource  dataSource="${__miDS}" />

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<c:set var="nombrePantalla" value="tramitaciones"/>
<c:set var="nombreSeccion" value="general"/>

<script type="text/javascript">

	function borrar_apoyo(SINTAPOY,NSINIES,NTRAMIT) {
		var confirma=confirm(objJsMessages.jslit_confirma_borrar);
        if (confirma) {
	   objAjax.invokeAsyncCGI("axis_axissin070.do", callBackResponse, "operation=borrar_apoyo&SINTAPOY="+SINTAPOY+"&NSINIES="+NSINIES+"&NTRAMIT=" + NTRAMIT, this, objJsMessages.jslit_actualizando_registro);	
        }
	}
	
	function callBackResponse(response){
	  	document.miForm.action="axis_axissin006.do?operation=form";
		document.miForm.target="_self";       
	   	document.miForm.submit();  		   
	}    
	   function f_but_cerrar_axissin070(){
	    	objUtiles.cerrarModal("axissin070");
	    	document.miForm.action="axis_axissin006.do?operation=form";
			document.miForm.target="_self";       
           document.miForm.submit();  
	   }  
	   
	   
	   function f_but_cerrar_axissin083(){
	    	objUtiles.cerrarModal("axissin083");
	    	document.miForm.action="axis_axissin006.do?operation=form";
			document.miForm.target="_self";       
          document.miForm.submit();  
	   }  
    
</script>
                            
                           
                                <c:if test="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CTRAMIT == 11 || __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CTRAMIT == 15 }">
                            
                                <axis:ocultar f="axissin006" c="DSP_JUZGADOS">
                                <tr>
                                    <td class="campocaja">
                                    <div style="float:left;">
                                        <b><axis:alt f="axissin006" c="JUDICIS" lit="9902664"/></b>
                                    </div>
                                    <div style="float:right;">
                                            <axis:visible f="axissin006" c="BT_NEWJUICIO">  
                                            <div id="BT_NEWJUICIO">
                                           <a href="javascript:f_abrir_modal('axissin049',null,'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}');">
                                           <img border="0" alt="<axis:alt f="axissin006" c="BT_NEWJUICIO" lit="9902664"/>" title="<axis:alt f="axissin006" c="BT_NEWJUICIO" lit="9902664"/>" src="images/new.gif"/></a>
                                            </div>
                                            </axis:visible>
                                    </div>
                                    </td>
                                </tr>
                                <tr>
                                <td>
                                        <!-- TABLA SECCION  JUICIOS -->
                                            <c:set var="num_tramitacion">0</c:set>
                                            <c:set var="title0"><axis:alt f="axissin006" c="NLINJUZ" lit="500102"/></c:set>
                                            <c:set var="title1"><axis:alt f="axissin006" c="TORGJUD" lit="9902795"/></c:set>
                                            <c:set var="title2"><axis:alt f="axissin006" c="NORGJUD" lit="9902758"/></c:set> 
                                            <c:set var="title3"><axis:alt f="axissin006" c="TPROVIN" lit="100756"/></c:set> 
                                            <c:set var="title4"><axis:alt f="axissin006" c="TCLASEDE" lit="9902761"/></c:set> 
                                            <c:set var="title5"><axis:alt f="axissin006" c="TTIPOPRO" lit="9902762"/></c:set>
                                            <c:set var="title6"><axis:alt f="axissin006" c="NPROCEDI" lit="9902763"/></c:set>
                                            <c:set var="title7"><axis:alt f="axissin006" c="FNOTIASE" lit="9900795"/></c:set>
                                            <c:set var="title99"><axis:alt f="axissin006" c="EDITAR_049" lit="100002"/></c:set>
                                            <c:set var="title98"><axis:alt f="axissin006" c="CONSULTAR_049" lit="1000439"/></c:set>
                                            <div class="displayspace">
                                              <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.JUZGADOS}" id="T_IAX_TRAM_JUICIOS" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <axis:visible f="axissin006" c="NLINJUZ">
                                                <display:column title="${title0}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_JUICIOS.OB_IAX_SIN_TRAMITA_JUZGADO.NLINJUZ}</div>    
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible f="axissin006" c="TORGJUD">
                                                <display:column title="${title1}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">
                                                        ${T_IAX_TRAM_JUICIOS.OB_IAX_SIN_TRAMITA_JUZGADO.TORGJUD}
                                                     </div>
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible f="axissin006" c="NORGJUD">
                                                <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">
                                                        ${T_IAX_TRAM_JUICIOS.OB_IAX_SIN_TRAMITA_JUZGADO.NORGJUD}
                                                     </div>
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible f="axissin006" c="CPROVIN">
                                                <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">
                                                        ${T_IAX_TRAM_JUICIOS.OB_IAX_SIN_TRAMITA_JUZGADO.TPROVIN}
                                                     </div>
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible f="axissin006" c="TCLASEDE">
                                                <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">
                                                        ${T_IAX_TRAM_JUICIOS.OB_IAX_SIN_TRAMITA_JUZGADO.TCLASEDE}
                                                     </div>
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible f="axissin006" c="TTIPOPRO">
                                                <display:column title="${title5}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">
                                                        ${T_IAX_TRAM_JUICIOS.OB_IAX_SIN_TRAMITA_JUZGADO.TTIPOPRO}
                                                     </div>
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible f="axissin006" c="NPROCEDI">
                                                <display:column title="${title6}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">
                                                        ${T_IAX_TRAM_JUICIOS.OB_IAX_SIN_TRAMITA_JUZGADO.NPROCEDI}
                                                     </div>
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible f="axissin006" c="FNOTIASE">
                                                <display:column title="${title7}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_JUICIOS.OB_IAX_SIN_TRAMITA_JUZGADO.FNOTIASE}"/></div>
                                                </display:column>                                                
                                                </axis:visible>
                                                <axis:visible f="axissin006" c="BT_JUZ_EDITAR"> 
                                                <display:column title="" headerClass="headwidth5 sortable" style="width:5%" media="html" autolink="false" >
                                                    <div class="dspIcons"><img border="0" alt="${title99}" title1="${title99}" src="images/lapiz.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="javascript:f_abrir_modal('axissin049',null,'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}'+'&NLINJUZ='+'${T_IAX_TRAM_JUICIOS.OB_IAX_SIN_TRAMITA_JUZGADO.NLINJUZ}'+'&MODO=1');"/>
                                                    </div>
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible f="axissin006" c="BT_JUZ_CONSULTA"> 
                                                <display:column title="" headerClass="headwidth5 sortable" style="width:5%" media="html" autolink="false" >
                                                    <div class="dspIcons"><img border="0" alt="${title98}" title1="${title98}" src="images/find.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="javascript:f_abrir_modal('axissin049',null,'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}'+'&NLINJUZ='+'${T_IAX_TRAM_JUICIOS.OB_IAX_SIN_TRAMITA_JUZGADO.NLINJUZ}'+'&MODO=2');"/>
                                                    </div>
                                                </display:column>
                                                </axis:visible>

                                            </display:table>
                                            </div>
                                        <!-- FIN TRAMITACION JUCIO  -->
                                    </td>
                                    </tr>
                                    </axis:ocultar>
                                  </c:if>
                                  
                                 <c:if test="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CTRAMIT == 13 || __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CTRAMIT == 15 }"> 
                                    <!-- Sección Demandante -->
                                    <axis:ocultar f="axissin006" c="DSP_DEMANDANTES">
                                    <tr>
                                        <td class="campocaja">
                                            <div style="float:left;">
                                                <b><axis:alt f="axissin006" c="DSP_DEMANDANTES" lit="9903411"/></b>
                                            </div>
                                            <div style="float:right;">
                                                <axis:visible f="axissin006" c="BT_NEWDEMANDANTE">  
                                                    <div id="BT_NEWDEMANDANTE">
                                                        <a href="javascript:f_abrir_modal('axissin051',null,'&NTIPODEM=1&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}'+'&TTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.TTRAMIT}'+'&MODO=1');">
                                                        <img border="0" alt="<axis:alt f="axissin006" c="BT_NEWJUICIO" lit="9902664"/>" title="<axis:alt f="axissin006" c="BT_NEWJUICIO" lit="9902664"/>" src="images/new.gif"/></a>
                                                    </div>
                                                </axis:visible>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <c:set var="num_tramitacion">0</c:set>
                                            <c:set var="title0"><axis:alt f="axissin006" c="DEMANDANTE" lit="9903462"/></c:set>
                                            <c:set var="title1"><axis:alt f="axissin006" c="DEMANDANTE_NPRO" lit="9902763"/></c:set>
                                            <div class="displayspace">
                                              <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.DEMANDANTES}" id="T_IAX_DEMANDANTES" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <axis:visible f="axissin006" c="DEMANDANTE">
                                                    <display:column title="${title0}" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_DEMANDANTES.OB_IAX_SIN_TRAMITA_DEMAND.PERSONA.TNOMBRE} 
                                                                          ${T_IAX_DEMANDANTES.OB_IAX_SIN_TRAMITA_DEMAND.PERSONA.TAPELLI1}
                                                                          ${T_IAX_DEMANDANTES.OB_IAX_SIN_TRAMITA_DEMAND.PERSONA.TAPELLI2}
                                                                          </div>    
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axissin006" c="DEMANDANTE_NPRO">
                                                    <display:column title="${title1}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">
                                                        ${T_IAX_DEMANDANTES.OB_IAX_SIN_TRAMITA_DEMAND.NPROCEDI}
                                                     </div>
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible f="axissin006" c="BT_EDITAR_DEMANDANTE"> 
                                                <display:column title="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                    <div class="dspIcons"><img border="0" alt="${title99}" title1="${title99}" src="images/lapiz.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="javascript:f_abrir_modal('axissin051',null,'&NLINDEM='+${T_IAX_DEMANDANTES.OB_IAX_SIN_TRAMITA_DEMAND.NLINDEM}+'&NTIPODEM=1&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}'+'&TTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.TTRAMIT}'+'&MODO=1');"/>
                                                    </div>
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible f="axissin006" c="BT_DEMANDANTE_CONSULTA"> 
                                                <display:column title="" headerClass="headwidth5 sortable" style="width:5%" media="html" autolink="false" >
                                                    <div class="dspIcons"><img border="0" alt="${title98}" title1="${title98}" src="images/find.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="javascript:f_abrir_modal('axissin051',null,'&NLINDEM='+${T_IAX_DEMANDANTES.OB_IAX_SIN_TRAMITA_DEMAND.NLINDEM}+'&NTIPODEM=1&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}'+'&TTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.TTRAMIT}'+'&MODO=2');"/>
                                                    </div>
                                                </display:column>
                                                </axis:visible>
                                            </display:table>
                                            </div>
                                        </td>
                                    </tr>
                                    </axis:ocultar>
                                  </c:if> 
                                  
                                  <c:if test="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CTRAMIT == 14  
                                  || __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CTRAMIT == 15 }">
                                    <!-- Sección Demandado -->
                                    <axis:ocultar f="axissin006" c="DSP_DEMANDADOS">
                                    <tr>
                                        <td class="campocaja">
                                            <div style="float:left;">
                                                <b><axis:alt f="axissin006" c="DSP_DEMANDADOS" lit="9903412"/></b>
                                            </div>
                                            <div style="float:right;">
                                                <axis:visible f="axissin006" c="BT_NEWDEMANDADO">  
                                                    <div id="BT_NEWDEMANDADO">
                                                        <a href="javascript:f_abrir_modal('axissin051',null,'&NTIPODEM=2&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}'+'&TTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.TTRAMIT}'+'&MODO=1');">
                                                        <img border="0" alt="<axis:alt f="axissin006" c="BT_NEWDEMANDADO" lit="9902664"/>" title="<axis:alt f="axissin006" c="BT_NEWDEMANDADO" lit="9902664"/>" src="images/new.gif"/></a>
                                                    </div>
                                                </axis:visible>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <c:set var="num_tramitacion">0</c:set>
                                            <c:set var="title0"><axis:alt f="axissin006" c="DEMANDADO" lit="9903463"/></c:set>
                                            <c:set var="title1"><axis:alt f="axissin006" c="DEMANDADO_NPRO" lit="9902763"/></c:set>
                                            <div class="displayspace">
                                              <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.DEMANDADOS}" id="T_IAX_DEMANDADOS" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <axis:visible f="axissin006" c="DEMANDADO">
                                                    <display:column title="${title0}" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_DEMANDADOS.OB_IAX_SIN_TRAMITA_DEMAND.PERSONA.TNOMBRE} 
                                                                          ${T_IAX_DEMANDADOS.OB_IAX_SIN_TRAMITA_DEMAND.PERSONA.TAPELLI1}
                                                                          ${T_IAX_DEMANDADOS.OB_IAX_SIN_TRAMITA_DEMAND.PERSONA.TAPELLI2}
                                                                          </div>    
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axissin006" c="DEMANDADO_NPRO">
                                                    <display:column title="${title1}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">
                                                        ${T_IAX_DEMANDADOS.OB_IAX_SIN_TRAMITA_DEMAND.NPROCEDI}
                                                     </div>
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible f="axissin006" c="BT_EDITAR_DEMANDADO"> 
                                                <display:column title="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                    <div class="dspIcons"><img border="0" alt="${title99}" title1="${title99}" src="images/lapiz.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="javascript:f_abrir_modal('axissin051',null,'&NLINDEM='+${T_IAX_DEMANDADOS.OB_IAX_SIN_TRAMITA_DEMAND.NLINDEM}+'&NTIPODEM=2&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}'+'&TTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.TTRAMIT}'+'&MODO=1');"/>
                                                    </div>
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible f="axissin006" c="BT_DEMANDADO_CONSULTA"> 
                                                <display:column title="" headerClass="headwidth5 sortable" style="width:5%" media="html" autolink="false" >
                                                    <div class="dspIcons"><img border="0" alt="${title98}" title1="${title98}" src="images/find.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="javascript:f_abrir_modal('axissin051',null,'&NLINDEM='+${T_IAX_DEMANDADOS.OB_IAX_SIN_TRAMITA_DEMAND.NLINDEM}+'&NTIPODEM=2&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}'+'&TTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.TTRAMIT}'+'&MODO=2');"/>
                                                    </div>
                                                </display:column>
                                                </axis:visible>
                                            </display:table>
                                            </div>
                                        </td>
                                    </tr>
                                    </axis:ocultar>
                                  </c:if>
                      <axis:ocultar f="axissin006" c="DSP_PROCESO_JUDICIAL" dejarHueco="false">
                        <c:if test="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CTRAMIT == 20 }">                                 	
                                <tr>
                                    <td class="campocaja">
                                    <div style="float:left;">
                                        <b><axis:alt f="axissin006" c="BT_SIN_NUEVO_TRAM_PJ" lit="9909203"/></b>
                                    </div>
                                    <div style="float:right;" id="BT_SIN_NUEVO_TRAM_PJ">
                                            <axis:visible f="axissin006" c="BT_SIN_NUEVO_TRAM_PJ"> <!-- tramitaciones JUDICIAL -->
                                                <div id="BT_SIN_NUEVO_TRAM_PJ">
                                                    <a href="javascript:f_abrir_modal('axissin068',null,'&NORDEN='+'${T_IAX_TRAM_JUDICIAL.NORDEN}'+'&NRADICA='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NRADICA}'+'&isNew=1&NSINIES='+${__formdata.OB_IAX_SINIESTRO.NSINIES}+'&NTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}'+'&SSEGURO='+document.miForm.SSEGURO.value+'&NPOLIZA='+${__formdata.OB_IAX_DATPOLIZA.NPOLIZA}+'&NCERTIF='+document.datospoliza.NCERTIF.value+'&TTRAMITAD=${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[fn:length(__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS)-1].OB_IAX_SIN_TRAMI_MOVIMIENTO.TTRAMITAD}'+'&CTRAMITAD=${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[fn:length(__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS)-1].OB_IAX_SIN_TRAMI_MOVIMIENTO.CTRAMITAD}');">
                                                    <img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_NUEVO_TRAM_PJ" lit="1000428"/>" title="<axis:alt f="axissin006" c="BT_SIN_NUEVO_TRAM_PJ" lit="1000428"/>" src="images/new.gif"/></a>
                                                </div>
                                            </axis:visible>
                                    </div>
                                    </td>
                                </tr>
                                <tr>
                                <td>
                                        <!-- TABLA SECCION  JUDICIAL -->
                                            <c:set var="title0"><axis:alt f="axissin006" c="NORDEN" lit="500102" /></c:set><!-- Orden -->
                                            <c:set var="title1"><axis:alt f="axissin006" c="NRADICADO" lit="9909199" /></c:set><!--Numero radicado-->
                                            <c:set var="title2"><axis:alt f="axissin006" c="FNOTIFI" lit="9900795" /></c:set> <!-- Fecha Notificacion-->
                                            <c:set var="title3"><axis:alt f="axissin006" c="TTRAMITAD" lit="9909220" /></c:set> <!-- Abogado asignado -->
                                            <c:set var="title4"><axis:alt f="axissin006" c="CPROCESO" lit="9909222" /></c:set> <!-- Clase de proceso -->
                                            
                                             
                                            <div class="displayspace">
                                              <display:table name="${__formdata.T_IAX_JUDICIAL}" id="T_IAX_TRAM_JUDICIAL" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title0}" sortable="true" sortProperty="NORDEN" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_JUDICIAL.NORDEN}</div>    
                                                </display:column>
                                                <display:column title="${title1}" sortable="true" sortProperty="NRADICA" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_JUDICIAL.NRADICA}</div>    
                                                </display:column>

                                                <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_JUDICIAL.FNOTIFI}"/></div>
                                                </display:column>                                                
                                                
                                                <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[fn:length(__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS)-1].OB_IAX_SIN_TRAMI_MOVIMIENTO.TTRAMITAD}</div>
                                                </display:column>                                                   

                                                <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                        <c:forEach var="clases" items="${__formdata.listaClases}">
                                                            <c:if test="${clases.CATRIBU == T_IAX_TRAM_JUDICIAL.CPROCESO}">
                                                                <div class="dspText">${clases.TATRIBU}</div>
                                                            </c:if>
                                                        </c:forEach>
                                                </display:column>
                                                
                                                <axis:visible f="axissin006" c="BT_SIN_EDITAR_TRAM_PJ"> <!--boton editar tram JUDICIAL -->
                                                <display:column title="${title7}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                    <c:if test="${(!empty T_IAX_TRAM_JUDICIAL.NORDEN)}">
                                                        <div class="dspIcons" id="BT_SIN_EDITAR_TRAM_PJ"><img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_EDITAR_TRAM_PJ" lit="100002"/>" title1="<axis:alt f="axissin006" c="BT_SIN_EDITAR_TRAM_PJ" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                        style="cursor:pointer;" onclick="javascript:f_abrir_modal('axissin068',null,'&NORDEN='+'${T_IAX_TRAM_JUDICIAL.NORDEN}'+'&NRADICA='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NRADICA}'+'&isNew=0&NSINIES='+'${__formdata.OB_IAX_SINIESTRO.NSINIES}'+'&NTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}'+'&SSEGURO='+document.miForm.SSEGURO.value+'&NPOLIZA='+'${__formdata.OB_IAX_DATPOLIZA.NPOLIZA}'+'&NCERTIF='+document.datospoliza.NCERTIF.value+'&TTRAMITAD=${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[fn:length(__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS)-1].OB_IAX_SIN_TRAMI_MOVIMIENTO.TTRAMITAD}'+'&CTRAMITAD=${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[fn:length(__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS)-1].OB_IAX_SIN_TRAMI_MOVIMIENTO.CTRAMITAD}');"/></div>
                                                    </c:if>
                                                </display:column> 
                                                </axis:visible>
                                               
                                                <axis:visible f="axissin006" c="BT_SIN_ELIMINAR_TRAM_PJ"> <!--boton Eliminar tram JUDICIAL -->
                                                <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                   <c:if test="${!empty T_IAX_TRAM_JUDICIAL.NORDEN}">
                                                    <div class="dspIcons" id="BT_SIN_ELIMINAR_TRAM_PJ"><img border="0"  src="images/delete.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="if(confirm(objJsMessages.jslit_confirma_borrar)) {objUtiles.ejecutarFormulario('axis_axissin006.do?NSINIES_RES='+'${__formdata.OB_IAX_SINIESTRO.NSINIES}'+'&NTRAMIT_RES='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}'+'&TIPO_DEL=1&NORDEN_RES='+'${T_IAX_TRAM_JUDICIAL.NORDEN}', 'borrarProceso', document.miForm, 'ftrabajo', objJsMessages.jslit_cargando);}"/>
                                                    </div>
                                                    </c:if>
                                                </display:column> 
                                                </axis:visible>
                                                
                                                
 												<axis:visible f="axissin006" c="BT_SIN_CONSUL_TRAM_PJ"> <!--boton consultar tram JUDICIAL  AB-->
                                                <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                    <c:if test="${(!empty T_IAX_TRAM_JUDICIAL.NORDEN)}">
                                                        <div class="dspIcons" id="BT_SIN_CONSUL_TRAM_PJ"><img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_CONSUL_TRAM_PJ" lit="100002"/>" title1="<axis:alt f="axissin006" c="BT_SIN_CONSUL_TRAM_PJ" lit="100002"/>" src="images/find.gif" width="15px" height="15px"
                                                        style="cursor:pointer;" onclick="javascript:f_abrir_modal('axissin068',null,'&NORDEN='+'${T_IAX_TRAM_JUDICIAL.NORDEN}'+'&NRADICA='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NRADICA}'+'&isNew=0&NSINIES='+'${__formdata.OB_IAX_SINIESTRO.NSINIES}'+'&NTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}'+'&SSEGURO='+document.miForm.SSEGURO.value+'&NPOLIZA='+'${__formdata.OB_IAX_DATPOLIZA.NPOLIZA}'+'&NCERTIF='+document.datospoliza.NCERTIF.value+'&TTRAMITAD=${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[fn:length(__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS)-1].OB_IAX_SIN_TRAMI_MOVIMIENTO.TTRAMITAD}'+'&CTRAMITAD=${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[fn:length(__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS)-1].OB_IAX_SIN_TRAMI_MOVIMIENTO.CTRAMITAD}'+'&MODO=2');"/></div>
                                                    </c:if>
                                                </display:column> 
                                                </axis:visible>
                                               
                                               
                                            </display:table>
                                            </div>
                                        <!-- FIN TRAMITACION JUDICIAL  -->
                                    </td>
                                    </tr> 
                                  </c:if>                               
                            </axis:ocultar>

                      <axis:ocultar f="axissin006" c="DSP_PROCESO_FISCAL" dejarHueco="false">
                        <c:if test="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CTRAMIT == 21 }">                                 	
                                <tr>
                                    <td class="campocaja">
                                    <div style="float:left;">
                                        <b><axis:alt f="axissin006" c="BT_SIN_NUEVO_TRAM_PJ" lit="9909394"/></b>
                                    </div>
                                    <div style="float:right;" id="BT_SIN_NUEVO_TRAM_RF">
                                            <axis:visible f="axissin006" c="BT_SIN_NUEVO_TRAM_PJ"> <!-- tramitaciones FISCAL -->
                                                <div id="BT_SIN_NUEVO_TRAM_RF">
                                                    <a href="javascript:f_abrir_modal('axissin065',null,'&NORDEN='+'${T_IAX_TRAM_FISCAL.NORDEN}'+'&NRADICA='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NRADICA}'+'&isNew=1&NSINIES='+${__formdata.OB_IAX_SINIESTRO.NSINIES}+'&NTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}'+'&SSEGURO='+document.miForm.SSEGURO.value+'&NPOLIZA='+${__formdata.OB_IAX_DATPOLIZA.NPOLIZA}+'&NCERTIF='+document.datospoliza.NCERTIF.value+'&TTRAMITAD=${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[fn:length(__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS)-1].OB_IAX_SIN_TRAMI_MOVIMIENTO.TTRAMITAD}'+'&TSUBTRA=${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[fn:length(__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS)-1].OB_IAX_SIN_TRAMI_MOVIMIENTO.TSUBTRA}'+'&CTRAMITAD=${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[fn:length(__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS)-1].OB_IAX_SIN_TRAMI_MOVIMIENTO.CTRAMITAD}');">
                                                    <img border="0" alt="<axis:alt f="axissin065" c="BT_SIN_NUEVO_TRAM_RF" lit="1000428"/>" title="<axis:alt f="axissin006" c="BT_SIN_NUEVO_TRAM_RF" lit="1000428"/>" src="images/new.gif"/></a>
                                                </div>
                                            </axis:visible>
                                    </div>
                                    </td>
                                </tr>
                                <tr>
                                <td>
                                        <!-- TABLA SECCION  RESPONSABILIDAD FISCAL -->
                                            <c:set var="title0"><axis:alt f="axissin006" c="NORDEN" lit="500102" /></c:set><!-- Orden -->
                                            <c:set var="title1"><axis:alt f="axissin006" c="NRADICADO" lit="9909395" /></c:set><!--Numero PRF-->
                                            <c:set var="title2"><axis:alt f="axissin006" c="FAPERTU" lit="9909396" /></c:set> <!-- Fecha de Apertura-->
                                            <c:set var="title3"><axis:alt f="axissin006" c="TTRAMITAD" lit="9910018" /></c:set> <!-- Abogado Tramitador -->                                            
                                             
                                            <div class="displayspace">
                                              <display:table name="${__formdata.T_IAX_FISCAL}" id="T_IAX_TRAM_FISCAL" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title0}" sortable="true" sortProperty="NORDEN" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_FISCAL.NORDEN}</div>    
                                                </display:column>
                                                <display:column title="${title1}" sortable="true" sortProperty="NRADICA" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_FISCAL.NRADICA}</div>    
                                                </display:column>

                                                <display:column title="${title2}" sortable="false" sortProperty="FAPERTU"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_FISCAL.FAPERTU}"/></div>
                                                </display:column>                                                
                                                
                                                <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[fn:length(__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS)-1].OB_IAX_SIN_TRAMI_MOVIMIENTO.TTRAMITAD}</div>
                                                </display:column>                                                   											
                                                
                                                <axis:visible f="axissin006" c="BT_SIN_EDITAR_TRAM_RF"> <!--boton editar tram FISCAL -->
                                                <display:column title="${title7}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                    <c:if test="${(!empty T_IAX_TRAM_FISCAL.NORDEN)}">
                                                        <div class="dspIcons" id="BT_SIN_EDITAR_TRAM_RF"><img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_EDITAR_TRAM_RF" lit="100002"/>" title1="<axis:alt f="axissin006" c="BT_SIN_EDITAR_TRAM_RF" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                        style="cursor:pointer;" onclick="javascript:f_abrir_modal('axissin065',null,'&NORDEN='+'${T_IAX_TRAM_FISCAL.NORDEN}'+'&NRADICA='+'${T_IAX_TRAM_FISCAL.NRADICA}'+'&isNew=0&NSINIES='+'${__formdata.OB_IAX_SINIESTRO.NSINIES}'+'&NTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}'+'&SSEGURO='+document.miForm.SSEGURO.value+'&NPOLIZA='+'${__formdata.OB_IAX_DATPOLIZA.NPOLIZA}'+'&NCERTIF='+document.datospoliza.NCERTIF.value+'&TTRAMITAD=${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[fn:length(__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS)-1].OB_IAX_SIN_TRAMI_MOVIMIENTO.TTRAMITAD}'+'&TSUBTRA=${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[fn:length(__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS)-1].OB_IAX_SIN_TRAMI_MOVIMIENTO.TSUBTRA}'+'&CTRAMITAD=${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[fn:length(__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS)-1].OB_IAX_SIN_TRAMI_MOVIMIENTO.CTRAMITAD}');"/></div>
                                                    </c:if>
                                                </display:column> 
                                                </axis:visible>
                                               
                                                <axis:visible f="axissin006" c="BT_SIN_ELIMINAR_TRAM_RF"> <!--boton Eliminar tram FISCAL -->
                                                <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                   <c:if test="${!empty T_IAX_TRAM_FISCAL.NORDEN}">
                                                    <div class="dspIcons" id="BT_SIN_ELIMINAR_TRAM_RF"><img border="0"  src="images/delete.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="if(confirm(objJsMessages.jslit_confirma_borrar)) {objUtiles.ejecutarFormulario('axis_axissin006.do?NSINIES_RES='+'${__formdata.OB_IAX_SINIESTRO.NSINIES}'+'&NTRAMIT_RES='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}'+'&TIPO_DEL=1&NORDEN_RES='+'${T_IAX_TRAM_FISCAL.NORDEN}', 'borrarProcesoFiscal', document.miForm, 'ftrabajo', objJsMessages.jslit_cargando);}"/>
                                                    </div>
                                                    </c:if>
                                                </display:column> 
                                                </axis:visible>
											<axis:visible f="axissin006" c="BT_SIN_CONSUL_TRAM_RF"> <!--boton CONSULTAR tram FISCAL -->
                                                <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                    <c:if test="${(!empty T_IAX_TRAM_FISCAL.NORDEN)}">
                                                        <div class="dspIcons" id="BT_SIN_CONSUL_TRAM_RF"><img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_CONSUL_TRAM_RF" lit="100002"/>" title1="<axis:alt f="axissin006" c="BT_SIN_CONSUL_TRAM_RF" lit="100002"/>" src="images/find.gif" width="15px" height="15px"
                                                        style="cursor:pointer;" onclick="javascript:f_abrir_modal('axissin065',null,'&NORDEN='+'${T_IAX_TRAM_FISCAL.NORDEN}'+'&NRADICA='+'${T_IAX_TRAM_FISCAL.NRADICA}'+'&isNew=0&NSINIES='+'${__formdata.OB_IAX_SINIESTRO.NSINIES}'+'&NTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}'+'&SSEGURO='+document.miForm.SSEGURO.value+'&NPOLIZA='+'${__formdata.OB_IAX_DATPOLIZA.NPOLIZA}'+'&NCERTIF='+document.datospoliza.NCERTIF.value+'&TTRAMITAD=${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[fn:length(__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS)-1].OB_IAX_SIN_TRAMI_MOVIMIENTO.TTRAMITAD}'+'&TSUBTRA=${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[fn:length(__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS)-1].OB_IAX_SIN_TRAMI_MOVIMIENTO.TSUBTRA}'+'&CTRAMITAD=${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[fn:length(__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS)-1].OB_IAX_SIN_TRAMI_MOVIMIENTO.CTRAMITAD}'+'&MODO=2');"/></div>
                                                    </c:if>
                                                </display:column> 
                                                </axis:visible>
                                               
                                               
                                            </display:table>
                                            </div>
                                        <!-- FIN TRAMITACION FISCAL  -->
                                    </td>
                                    </tr> 
                                  </c:if>                               
                            </axis:ocultar>

                                  
                                <axis:ocultar f="axissin006" c="DSP_DOCUTRAMIT" dejarHueco="false">
                        <c:if test="${!empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.DOCUMENTOS || 
                            		(empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.DOCUMENTOS  )}">                                 	
                                <tr>
                                    <td class="campocaja">
                                    <div style="float:left;">
                                        <b><axis:alt f="axissin006" c="BT_SIN_NUEVO_TRAM_DOC" lit="9001358"/></b>
                                    </div>
                                    <div style="float:right;" id="BT_SIN_NUEVO_TRAM_DOC">
                                            <axis:visible f="axissin006" c="BT_SIN_NUEVO_TRAM_DOC"> <!-- tramitaciones documentos -->
                                            <a href="javascript:f_abrir_modal('axissin026',null,'&isNew=yes&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}');"><img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_NUEVO_TRAM_DOC" lit="9001358"/>" title="<axis:alt f="axissin006" c="BT_SIN_NUEVO_TRAM_DOC" lit="9001358"/>" src="images/document.gif"/></a>
                                            </axis:visible>
                                    </div>
                                    </td>
                                </tr>
                                <tr>
                                <td>
                                        <!-- TABLA SECCION  DOCUMENTOS -->
                                            <c:set var="num_tramitacion">0</c:set>
                                            <c:set var="title0"><axis:alt f="axissin006" c="NDOCUME" lit="100899" /></c:set><!-- Num -->
                                            <c:set var="title1"><axis:alt f="axissin006" c="TDANO" lit="100588" /></c:set><!--Descripcion-->
                                            <c:set var="title2"><axis:alt f="axissin006" c="FRECLAMA" lit="9910120" /></c:set> <!-- D. Reclamació-->
                                            <c:set var="title3"><axis:alt f="axissin006" c="FRECIBE" lit="9000452" /></c:set> <!-- D. Recepció -->
                                            <c:set var="title4"><axis:alt f="axissin006" c="FCADUCA" lit="9001356" /></c:set> <!-- D. Caducitat -->
                                            <c:set var="title5"><axis:alt f="axissin006" c="COBLIGA" lit="112347" /></c:set>  <!-- Obligatori -->
                                            <c:set var="title6"><axis:alt f="axissin006" c="IDDOC" lit="9001357" /></c:set>  <!-- Doc. Gedox -->
                                            <c:set var="title7"><axis:alt f="axissin006" c="EDITAR" lit="100002" /></c:set><!--Editar-->
                                            <c:set var="title8"><axis:alt f="axissin006" c="ELIMINAR" lit="1000127" /></c:set><!--Eliminar-->
                                            <c:set var="title9"><axis:alt f="axissin006" c="ELIMINAR" lit="1000127" /></c:set><!--Eliminar-->
                                            <c:set var="title10"><axis:alt f="axissin006" c="TTITDOC_SECDOC" lit="105330" /></c:set><!--Eliminar-->
                                            <c:set var="title11"><axis:alt f="axissin006" c="TUSUALTDOC" lit="9905522" /></c:set><!--Usuario-->
                                            
                                             
                                            <div class="displayspace">
                                              <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.DOCUMENTOS}" id="T_IAX_TRAM_DOCUMENTOS" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_SIN_TRAMI_DOCUMENTO.NDOCUME" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.NDOCUME}</div>    
                                                </display:column>
                                                <display:column title="${title10}" sortable="true" sortProperty="OB_IAX_SIN_TRAMI_DOCUMENTO.CDOCUME" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.TTITDOC}</div>    
                                                </display:column>
                                                <display:column title="${title1}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.DESCDOC}</div>    
                                                </display:column> 

                                                <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.FRECLAMA}"/></div>
                                                </display:column>                                                
                                                
                                                <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.FRECIBE}"/></div>
                                                </display:column>                                                   

                                                <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.FCADUCA}"/></div>
                                                </display:column>
                                                
                                                
                                                <axis:visible f="axissin006" c="TUSUALT">
                                                <display:column title="${title11}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.TUSUALTDOC}</div>    
                                                </display:column>
                                                </axis:visible>

                                                <axis:visible f="axissin006" c="COBLIGA">
                                                <display:column title="${title5}" sortable="false" sortProperty="COBLIGA" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspIcons">  <input type="checkbox" disabled id="COBLIGA" name="COBLIGA" value="${T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.COBLIGA}" 
                                                    <c:if test="${T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.COBLIGA == '1'}">checked</c:if> ></div>    
                                                </display:column>                                                 
                                                </axis:visible>
                                                
                                                <axis:visible f="axissin006" c="IDDOC">
                                                <display:column title="${title6}" sortable="false" sortProperty="IDDOC" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspIcons">  <input type="checkbox" disabled id="IDDOC" name="IDDOC" value="${T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.IDDOC}" 
                                                    <c:if test="${!empty T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.IDDOC}">checked</c:if> ></div>    
                                                </display:column>
                                                </axis:visible>
                                                
                                                <axis:visible f="axissin006" c="BT_SIN_EDITAR_TRAM_DOC"> <!--boton editar tram documentos -->
                                                <display:column title="${title7}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                    <c:if test="${(T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.CACCION ne '1' || empty T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.FRECIBE)
                                                                    && T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.CORIGEN ne '1'}">
                                                        <div class="dspIcons" id="BT_SIN_EDITAR_TRAM_DOC"><img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_EDITAR_TRAM_DOC" lit="100002"/>" title1="<axis:alt f="axissin006" c="BT_SIN_EDITAR_TRAM_DOC" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                        style="cursor:pointer;" onclick="javascript:f_abrir_modal('axissin026',null,'&isNew=no&NDANO='+'${T_IAX_TRAM_DANYOS.OB_IAX_SIN_TRAMI_DANO.NDANO}'+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}'+'&NDOCUME='+${T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.NDOCUME}+'&MODO=1');"/></div>
                                                    </c:if>
                                                </display:column> 
                                                </axis:visible>
                                               
                                                <axis:visible f="axissin006" c="BT_SIN_PRINT_TRAM_DOC"> <!--boton editar tram documentos -->
                                                <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                   <c:if test="${!empty T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.IDDOC}">
                                                    <div class="dspIcons"><img border="0"  src="images/file.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="f_ver_doc('${T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.IDDOC}');"/>
                                                    </div>
                                                    </c:if>
                                                </display:column> 
                                                </axis:visible>
                                                
                                                <axis:visible f="axissin006" c="BT_ELIMINAR_DOC">                                                
                                                <display:column title="${title8}" sortable="false" sortProperty="" headerClass="sortable"  media="html" autolink="false" >
                                                <c:if test="${!empty T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.IDDOC}">
                                                <div class="dspIcons" id="BT_ELIMINAR_DOC">
                                                    <img border="0" alt="<axis:alt f="axissin006" c="ELIMINAR" lit="1000127"/>" title="<axis:alt f="axissin006" c="ELIMINAR" lit="1000127"/>" src="images/delete.gif" width="15px" height="15px"
                                                                style="cursor:pointer;vertical-align:middle;" onclick="javascript:f_borrar_doc('${T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.NSINIES}', '${T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.NTRAMIT}', '${T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.NDOCUME}');"/>
                                                </div>
                                                </c:if>
                                                </display:column>                                               
                                                </axis:visible>
                                                
											    <axis:visible f="axissin006" c="BT_SIN_CONSUL_TRAM_DOC"> <!--boton CONSULTAR tram documentos -->
                                                <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                    <c:if test="${(T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.CACCION ne '1' || empty T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.FRECIBE)
                                                                    && T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.CORIGEN ne '1'}">
                                                        <div class="dspIcons" id="BT_SIN_CONSUL_TRAM_DOC"><img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_CONSUL_TRAM_DOC" lit="100002"/>" title1="<axis:alt f="axissin006" c="BT_SIN_CONSUL_TRAM_DOC" lit="100002"/>" src="images/find.gif" width="15px" height="15px"
                                                        style="cursor:pointer;" onclick="javascript:f_abrir_modal('axissin026',null,'&isNew=no&NDANO='+'${T_IAX_TRAM_DANYOS.OB_IAX_SIN_TRAMI_DANO.NDANO}'+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.NTRAMIT}'+'&NDOCUME='+${T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.NDOCUME}+'&MODO=2');"/></div>
                                                    </c:if>
                                                </display:column> 
                                                </axis:visible>
                                                                                           
                                            </display:table>
                                            </div>
                                        <!-- FIN TRAMITACION DOCUMENTOS  -->
                                    </td>
                                    </tr> 
                                  </c:if>                               
                            </axis:ocultar>
                            
                            
                            

                                                              	
                                <tr>
                                    <td class="campocaja">
                                    <div style="float:left;">
                                        <b><axis:alt f="axissin006" c="BT_SIN_NUEVO_TRAM_APOYO" lit="9909838"/></b>
                                    </div>
                                    <div style="float:right;" id="BT_SIN_NUEVO_TRAM_APOYO">
					                    <axis:visible f="axissin006" c="BT_SIN_NUEVO_TRAM_APOYO">
					                    	<a href="javascript:objUtiles.abrirModal('axissin070', 'src', 'axis_axissin070.do?operation=form&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&ACTIONMOD=EDITA_DATOS_SINIESTROS'+'&isNew=Yes');">
					                    		<img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_NUEVO_TRAM_APOYO" lit="9909838"/>" title="<axis:alt f="axissin006" c="BT_SIN_NUEVO_TRAM_APOYO" lit="9909838"/>" src="images/document.gif"/>
					                    	</a>
					                    </axis:visible>
					                </div>
                                    </td>
                                </tr>
                                <tr>
                                <td>
                                        <!-- TABLA APOYO TECNICO -->
                                            <c:set var="title1"><axis:alt f="axissin006_datossiniestros_tramitaciones_apoyotec" c="NUMERO" lit="9909843" /></c:set> 
					                        <c:set var="title2"><axis:alt f="axissin006_datossiniestros_tramitaciones_apoyotec" c="INGENIERO" lit="9909844" /></c:set> 
					                        <c:set var="title3"><axis:alt f="axissin006_datossiniestros_tramitaciones_apoyotec" c="FINGRESO" lit="9909845" /></c:set> 
					                        <c:set var="title4"><axis:alt f="axissin006_datossiniestros_tramitaciones_apoyotec" c="FTERMINO" lit="9909846" /></c:set> 
					                        <c:set var="title5"><axis:alt f="axissin006_datossiniestros_tramitaciones_apoyotec" c="FSALIDA" lit="9909847" /></c:set>
                                            
                                             
                                            <div class="displayspace">
                                              <display:table name="${__formdata.LISTSIN_TRAMITA_APOYOS}" id="T_IAX_LISTSIN_TRAMITA_APOYOS"
												export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending"
												sort="list" cellpadding="0" cellspacing="0"
												requestURI="axis_axissin006.do?paginar=true&subpantalla=datosgenerales">
												<%@ include file="../include/displaytag.jsp"%>
			
												<display:column title="${title1}" sortable="false" headerClass="sortable fixed"
													media="html" autolink="false">
													<div class="dspText">${T_IAX_LISTSIN_TRAMITA_APOYOS.SINTAPOY}</div>
												</display:column>
			
												<display:column title="${title2}" sortable="false" headerClass="sortable fixed"
													media="html" autolink="false">
													<div class="dspText">${T_IAX_LISTSIN_TRAMITA_APOYOS.NOMBRE}</div>
												</display:column>
			
												<display:column title="${title3}" sortable="false" headerClass="sortable fixed"
													media="html" autolink="false">
													<div class="dspText">
														<fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_LISTSIN_TRAMITA_APOYOS.FINGRESO}" />
													</div>
												</display:column>
			
												<display:column title="${title4}" sortable="false" headerClass="sortable fixed"
													media="html" autolink="false">
													<div class="dspText">
														<fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_LISTSIN_TRAMITA_APOYOS.FTERMINO}" />
													</div>
												</display:column>
			
												<display:column title="${title5}" sortable="false" headerClass="sortable fixed"
													media="html" autolink="false">
													<div class="dspText">
														<fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_LISTSIN_TRAMITA_APOYOS.FSALIDA}" />
													</div>
												</display:column>
			
												<axis:visible f="axissin006" c="BT_DEL_REGSARLAFT">
													<c:if
														test="${! ocultarIconosEdicion && __configform.axissin006__BT_BORRAR_REGFISC__visible != 'false'}">
														<display:column title="" sortable="false" headerClass="headwidth5 sortable fixed"
															media="html" autolink="false">
															<div class="dspIcons">
			
																<axis:visible f="axissin006" c="LIT_ELIMINAR">
																<img border="0" id="LIT_ELIMINAR" alt="<axis:alt f='axissin070' c='LIT_ELIMINAR' lit='9001333'/>" title="<axis:alt f='axissin070' c='LIT_ELIMINAR' lit='9001333'/>" src="images/delete.gif"
										                      	onclick="borrar_apoyo('${T_IAX_LISTSIN_TRAMITA_APOYOS.SINTAPOY}', '${T_IAX_LISTSIN_TRAMITA_APOYOS.NSINIES}', '${T_IAX_LISTSIN_TRAMITA_APOYOS.NTRAMIT}')"/>
										                      	  </axis:visible>
										                      	   <axis:visible f="axissin006" c="LIT_EDITAR">
										                      	<img border="0" id="LIT_EDITAR"  alt="<axis:alt f='axissin070' c='LIT_EDITAR' lit='9901356'/>" title="<axis:alt f='axissin070' c='LIT_EDITAR' lit='9901356'/>" src="images/lapiz.gif"
										                      	onclick="javascript:objUtiles.abrirModal('axissin070', 'src', 'axis_axissin070.do?operation=form&NSINIES='+'${T_IAX_LISTSIN_TRAMITA_APOYOS.NSINIES}'+'&NTRAMIT='+'${T_IAX_LISTSIN_TRAMITA_APOYOS.NTRAMIT}'+'&SINTAPOY='+'${T_IAX_LISTSIN_TRAMITA_APOYOS.SINTAPOY}'+'&ACTIONMOD=EDITA_DATOS_SINIESTROS'+'&isNew=No');"/>
										                      	 </axis:visible>
										                      	 <axis:visible f="axissin006" c="LIT_CONSULTAR">
										                      	<img border="0"  id="LIT_CONSULTAR"  alt="<axis:alt f='axissin070' c='LIT_CONSULTAR' lit='109142'/>" title="<axis:alt f='axissin070' c='LIT_CONSULTAR' lit='109142'/>" src="images/find.gif"
										                      	onclick="javascript:objUtiles.abrirModal('axissin070', 'src', 'axis_axissin070.do?operation=form&NSINIES='+'${T_IAX_LISTSIN_TRAMITA_APOYOS.NSINIES}'+'&NTRAMIT='+'${T_IAX_LISTSIN_TRAMITA_APOYOS.NTRAMIT}'+'&SINTAPOY='+'${T_IAX_LISTSIN_TRAMITA_APOYOS.SINTAPOY}'+'&ACTIONMOD=CONSULTA'+'&isNew=No');"/>
																 </axis:visible>
			
															</div>
														</display:column>
													</c:if>
												</axis:visible>
											</display:table>
                                            </div>
                                        <!-- FIN APOYO TECNICO  -->
                                    </td>
                                    </tr>   
                                    
                                  
                               <c:if test="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CTRAMIT == 0}">
                                     
                              
                             <tr>
                                    <td class="campocaja">
                                    <div style="float:left;">
                                        <b><axis:alt f="axissin006" c="BT_SIN_MAXPP" lit="89906303"/></b>
                                    </div>
                                    <div style="float:right;" id="BT_SIN_MAXPP">
					                    <axis:visible f="axissin006" c="BT_SIN_MAXPP">
					                       <a href="javascript:objUtiles.abrirModal('axissin083', 'src', 'modal_axissin083.do?operation=form&NSINIES=201780630001&NTRAMIT=0');">
					                    	
					                       <a href="javascript:objUtiles.abrirModal('axissin083', 'src', 'modal_axissin083.do?operation=form&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+document.miForm.NTRAMIT.value);">
					                    		<img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_MAXPP" lit="89906303"/>" title="<axis:alt f="axissin006" c="BT_SIN_MAXPP" lit="89906303"/>" src="images/document.gif"/>
					                    	</a>
					                    </axis:visible>
					                </div>
					                
					                <div style="float:right;" id="BT_SIN_MAXPP_CONS">
                   <axis:visible f="axissin006" c="BT_SIN_MAXPP_CONS">
                       <a href="javascript:objUtiles.abrirModal('axissin083', 'src', 'modal_axissin083.do?operation=form&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&MODIFICACION=1');">
                       <img border="0" alt="<axis:alt f="axissin006" c="SIN_MAXPP_CONS" lit="9909675"/>" title="<axis:alt f="axissin006" c="SIN_MAXPP_CONS" lit="9909675"/>" src="images/nolines_plus.gif"/></a>
                   </axis:visible>
                </div>
                                    </td>
                                </tr>
                            
                                 <tr>
                                <td>
                                        <!-- TABLA MAXIMA PERDIDA PROBABLE -->
                                            <c:set var="title1"><axis:alt f="axissin006_datossiniestros_tramitaciones_apoyotec" c="NMOVIMI" lit="9001868" /></c:set> 
					                        <c:set var="title2"><axis:alt f="axissin006_datossiniestros_tramitaciones_apoyotec" c="NMAXPP" lit="89906302" /></c:set> 
					                        <c:set var="title3"><axis:alt f="axissin006_datossiniestros_tramitaciones_apoyotec" c="NCONTIN" lit="9909237" /></c:set> 					                       
					                        <c:set var="title4"><axis:alt f="axissin006_datossiniestros_tramitaciones_apoyotec" c="NCAUSA" lit="180580" /></c:set> 
					                        <c:set var="title5"><axis:alt f="axissin006_datossiniestros_tramitaciones_apoyotec" c="COBSERV" lit="101162" /></c:set> 
					                        <c:set var="title6"><axis:alt f="axissin006_datossiniestros_tramitaciones_apoyotec" c="CUSUMOD" lit="9001265" /></c:set>
                                            <c:set var="title7"><axis:alt f="axissin006_datossiniestros_tramitaciones_apoyotec" c="FMODIF" lit="9000564" /></c:set>
                                            
                                             
                                            <div class="displayspace">
                                              <display:table name="${__formdata.LISTSIN_MXPP_RC}" id="T_IAX_MXPP_RC"
												export="false" class="dsptgtable" pagesize="-1"
												sort="list" cellpadding="0" cellspacing="0"
												requestURI="axis_axissin006.do?paginar=true&subpantalla=datosgenerales">
												<%@ include file="../include/displaytag.jsp"%>
			
												<display:column title="${title1}" sortable="false" headerClass="sortable fixed"
													media="html" autolink="false">
													<div class="dspText">${T_IAX_MXPP_RC.NMOVIMI}</div>
												</display:column>
			
												<display:column title="${title2}" sortable="false" headerClass="sortable fixed"
													media="html" autolink="false">
													<div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_MXPP_RC.NMAXPP}"/></div>
												</display:column>
												
												<display:column title="${title3}" sortable="false" headerClass="sortable fixed"
													media="html" autolink="false">
													<div class="dspText">${T_IAX_MXPP_RC.NCONTIN}</div>
												</display:column>
												
												<display:column title="${title4}" sortable="false" headerClass="sortable fixed"
													media="html" autolink="false">
													<div class="dspText">${T_IAX_MXPP_RC.NRIESGO}</div>
												</display:column>
												
												<display:column title="${title5}" sortable="false" headerClass="sortable fixed"
													media="html" autolink="false">
													<div class="dspText">${T_IAX_MXPP_RC.COBSERV}</div>
												</display:column>
												
												<display:column title="${title6}" sortable="false" headerClass="sortable fixed"
													media="html" autolink="false">
													<div class="dspText">${T_IAX_MXPP_RC.CUSUMOD}</div>
												</display:column>
														
												<display:column title="${title7}" sortable="false" headerClass="sortable fixed"
													media="html" autolink="false">
													<div class="dspText">
														<fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_MXPP_RC.FMODIF}" />
													</div>
												</display:column>
			
											  </display:table>
                                            </div>
                                        <!-- FIN APOYO TECNICO  -->
                                    </td>
                                    </tr>      
                            
                             </c:if>
                                       
                           
                            
                                </table>
                            </td>
                        </tr>
                    </table>
                    
</form>
                        
                        
                        
                        
