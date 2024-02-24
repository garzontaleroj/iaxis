<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>      

<c:set var="nombrePantalla" value="tramitaciones"/>
<c:set var="nombreSeccion" value="destinatarios"/>

<script type="text/javascript">
    function f_aceptar_axissin011(NSINIES, SPROFES) {
            objDom.setValorPorId("NSINIES", NSINIES);
            document.miForm.subpantalla.value="tramitaciones";
            document.miForm.seccion.value="tramitaciones_destinatarios";
            objUtiles.ejecutarFormulario("axis_axissin006.do?", "cargarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);
    }

    function f_borrar_destinatario(CTIPDES, SPERSON) {
            objDom.setValorPorId("CTIPDES", CTIPDES);
            objDom.setValorPorId("SPERSON", SPERSON);
            document.miForm.subpantalla.value="tramitaciones";
            document.miForm.seccion.value="tramitaciones_destinatarios";
            var answer = confirm(objJsMessages.jslit_confirma_borrar);
            if (answer)            
            objUtiles.ejecutarFormulario("axis_axissin006.do?", "del_destinatario", document.miForm, "_self", objJsMessages.jslit_cargando);
    }    

    
    function f_consultar_persona(SPERSON,NSINIES){
            objUtiles.ejecutarFormulario("axis_axissin006.do?SPERSON_CON="+SPERSON+"&NSINIES_CON="+NSINIES, "consulta_persona", document.miForm, "_self", objJsMessages.jslit_cargando);
    }  
    
     function f_getDestinatario(index, CTIPDES){
     //alert("cambio destinatario: "+index);
        document.miForm.CTIPDES.value = CTIPDES;
        document.miForm.indexDestinatario.value = index;
        document.miForm.subpantalla.value="tramitaciones";
        document.miForm.seccion.value="tramitaciones_destinatarios";
        objUtiles.ejecutarFormulario("axis_axissin006.do?", "cargarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);
   }   
    
    
</script>

<form name="${nombrePantalla}" action="" method="POST">                  
                        
                        <c:set var="title0"><axis:alt f="axissin006" c="DOCUMENTO" lit="105330" /></c:set><!--Documento-->
                        <c:set var="title1"><axis:alt f="axissin006" c="NOMBRE" lit="105940" /></c:set><!--nombre-->
                        <c:set var="title2"><axis:alt f="axissin006" c="TDESTINA" lit="100565" /></c:set><!--Tipo destinatario -->
                        <c:set var="title3"><axis:alt f="axissin006" c="ACTPROFESIO" lit="9000977" /></c:set><!-- actividad profesional -->
                        <c:set var="title4"><axis:alt f="axissin006" c="ACEPTAPAGOS" lit="9000978" /></c:set><!-- accepta pagos-->
                        <c:set var="title8"><axis:alt f="axissin006" c="EDITAR" lit="100002" /></c:set><!--Editar-->
                        <c:set var="title9"><axis:alt f="axissin006" c="ELIMINAR" lit="1000127" /></c:set><!--Eliminar-->
                        <c:set var="title10"><axis:alt f="axissin006" c="PASIRESI" lit="9000789" /></c:set><!--Pais residencia-->                        
                        <c:set var="title11"><axis:alt f="axissin006" c="100ASSIG" lit="9001222" /></c:set><!--Percentat assignacio-->                        
                        <c:set var="title12"><axis:alt f="axissin006" c="ALTAPRESTA" lit="9901549" /></c:set><!--Alta prestacio-->
                        <% int i = 0;%>
                        
                        <c:if test="${empty __formdata.indexDestinatario}">
                           <c:set var="num_dest">0</c:set>
                        </c:if>   
                        <c:if test="${!empty __formdata.indexDestinatario}">
                           <c:set var="num_dest">${__formdata.indexDestinatario}</c:set>
                        </c:if>
                        
                        <div class="displayspace">
                        <c:set var="num_tramitacion">0</c:set>    
                          <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.DESTINATARIOS}" id="T_IAX_DESTINATARIOS" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                           requestURI="">
                          <c:set var="i"><%= i%></c:set>
                            <%@ include file="../include/displaytag.jsp"%>
                             	<display:column title="&nbsp;" sortable="true" sortProperty="OB_IAX_SIN_TRAMI_DESTINATARIO.NNUMIDE" headerClass="sortable" media="html" autolink="false" >
                            	<div class="dspIcons"><input onClick="javascript:f_getDestinatario('${i}','${T_IAX_DESTINATARIOS.OB_IAX_SIN_TRAMI_DESTINATARIO.CTIPDES}')" 
                            	<c:if test="${num_dest == i }">checked</c:if>
                            	value="" type="radio" id="radioDEST" name="radioDEST"/></div>
                            	</display:column>
                            
                            <axis:visible f="axissin006" c="NNUMIDE"> 
                            <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_SIN_TRAMI_DESTINATARIO.NNUMIDE" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspNumber">${T_IAX_DESTINATARIOS.OB_IAX_SIN_TRAMI_DESTINATARIO.PERSONA.NNUMIDE}</div>
                            </display:column>
                            </axis:visible>
                            <axis:visible f="axissin006" c="TNOMBRE"> 
                            <display:column title="${title1}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText">   ${T_IAX_DESTINATARIOS.OB_IAX_SIN_TRAMI_DESTINATARIO.PERSONA.TNOMBRE}
                                                         ${T_IAX_DESTINATARIOS.OB_IAX_SIN_TRAMI_DESTINATARIO.PERSONA.TAPELLI1}
                                                         ${T_IAX_DESTINATARIOS.OB_IAX_SIN_TRAMI_DESTINATARIO.PERSONA.TAPELLI2}</div>    
                            </display:column>
                            </axis:visible>
                            <axis:visible f="axissin006" c="TTIPDES"> 
                            <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText">${T_IAX_DESTINATARIOS.OB_IAX_SIN_TRAMI_DESTINATARIO.TTIPDES}</div>    
                            </display:column>
                            </axis:visible>
                            <axis:visible f="axissin006" c="TACTPRO"> 
                            <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText">${T_IAX_DESTINATARIOS.OB_IAX_SIN_TRAMI_DESTINATARIO.TACTPRO}</div>    
                            </display:column>
                            </axis:visible>
                            <axis:visible f="axissin006" c="PASIGNA"> 
                            <display:column title="${title11}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText"><fmt:formatNumber pattern="###,##0.00" value="${T_IAX_DESTINATARIOS.OB_IAX_SIN_TRAMI_DESTINATARIO.PASIGNA}"/></div>    
                            </display:column>
                            </axis:visible>
                            <axis:visible f="axissin006" c="TPAISRE"> 
                            <display:column title="${title10}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText">${T_IAX_DESTINATARIOS.OB_IAX_SIN_TRAMI_DESTINATARIO.TPAISRE}</div>    
                            </display:column>                            
                            </axis:visible>
                            <axis:visible f="axissin006" c="CPAGDES"> 
                            <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                <div class="dspIcons">  <input type="checkbox" disabled id="CPAGDES" name="CPAGDES" value="${T_IAX_DESTINATARIOS.OB_IAX_SIN_TRAMI_DESTINATARIO.CPAGDES}" 
                                                    <c:if test="${T_IAX_DESTINATARIOS.OB_IAX_SIN_TRAMI_DESTINATARIO.CPAGDES == '1'}">checked</c:if> ></div>    
                            </display:column>
                            </axis:visible> 
                            <axis:visible f="axissin006" c="BT_SIN_EDITAR_TRAM_DEST"> 
                                <display:column title="${title8}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                    <div class="dspIcons" id="BT_SIN_EDITAR_TRAM_DEST"><img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_EDITAR_TRAM_DEST" lit="100002"/>" title1="<axis:alt f="axissin006" c="BT_SIN_EDITAR_TRAM_DEST" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                    style="cursor:pointer;" onclick="javascript:f_abrir_modal('axissin011',null,'&isNew=no&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&CTRAMIT='+document.miForm.CTRAMIT.value+'&CCAUSIN='+document.miForm.CCAUSIN.value+'&CMOTSIN='+document.miForm.CMOTSIN.value+'&CTIPDES='+'${T_IAX_DESTINATARIOS.OB_IAX_SIN_TRAMI_DESTINATARIO.CTIPDES}'+'&PCTIPCAP='+'${T_IAX_DESTINATARIOS.OB_IAX_SIN_TRAMI_DESTINATARIO.CTIPCAP}'+'&PCRELASE='+'${T_IAX_DESTINATARIOS.OB_IAX_SIN_TRAMI_DESTINATARIO.CRELASE}'+'&SPERSON='+'${T_IAX_DESTINATARIOS.OB_IAX_SIN_TRAMI_DESTINATARIO.PERSONA.SPERSON}'+'&NTRAMIT9999='+document.miForm.NTRAMIT9999.value);"/></div>
                                                                     
                                </display:column>
                            </axis:visible> 
                            <axis:visible f="axissin006" c="BT_SIN_DELETE_TRAM_DEST"> 
                                <display:column title="${title9}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                    <div class="dspIcons" id="BT_SIN_DELETE_TRAM_DEST"><img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_DELETE_TRAM_DEST" lit="1000127"/>" title1="<axis:alt f="axissin006" c="BT_SIN_DELETE_TRAM_DEST" lit="1000127"/>" src="images/delete.gif" width="15px" height="15px"
                                    style="cursor:pointer;" onclick="javascript:f_borrar_destinatario('${T_IAX_DESTINATARIOS.OB_IAX_SIN_TRAMI_DESTINATARIO.CTIPDES}','${T_IAX_DESTINATARIOS.OB_IAX_SIN_TRAMI_DESTINATARIO.PERSONA.SPERSON}');"/></div>
                                </display:column>
                            </axis:visible>
                            <axis:visible f="axissin006" c="BT_SIN_FIND_TRAM_DEST"> 
                                <display:column title="Consultar" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                    <div class="dspIcons">
                                        <img id="find" border="0" src="images/find.gif" onclick="javascript:f_consultar_persona('${T_IAX_DESTINATARIOS.OB_IAX_SIN_TRAMI_DESTINATARIO.PERSONA.SPERSON}',document.miForm.NSINIES.value);" style="cursor:pointer"/>
                                    </div>
                                </display:column>  
                             </axis:visible>   
                              <axis:visible f="axissin006" c="BT_ALTA_PRESTACION"> 
                                <display:column title="${title12}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                        <c:if test="${ empty __formdata.indexDestinatario }">
                                            <c:set var="numDesti">0</c:set>
                                        </c:if>
                                        <c:if test="${ !empty __formdata.indexDestinatario }">
                                            <c:set var="numDesti">${__formdata.indexDestinatario}</c:set>
                                        </c:if>
                                    <div class="dspIcons">
                                    <%--    <c:if test="${empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.DESTINATARIOS[i].OB_IAX_SIN_TRAMI_DESTINATARIO.OB_PRESTAREN.NSINIES}">  --%>
                                            <img id="find" border="0" title="<axis:alt f="axissin006" c="indexTramitacio" lit="9901549" />" alt="<axis:alt f="axissin006" c="indexTramitacio" lit="9901549" />" src="images/new.gif" onclick="javascript:f_abrir_modal('axissin040',null,'&isNew=yes&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+'${__formdata.indexTramitacio}'+'&CTRAMIT='+document.miForm.CTRAMIT.value+'&CCAUSIN='+document.miForm.CCAUSIN.value+'&CMOTSIN='+document.miForm.CMOTSIN.value+'&CTIPDES='+'${T_IAX_DESTINATARIOS.OB_IAX_SIN_TRAMI_DESTINATARIO.CTIPDES}'+'&SPERSON='+'${T_IAX_DESTINATARIOS.OB_IAX_SIN_TRAMI_DESTINATARIO.PERSONA.SPERSON}');" style="cursor:pointer"/>
                                   <%--     </c:if>   --%>
                                    </div>
                                </display:column>
                             </axis:visible>
                            <%  i = i+1;%>
                        </display:table>
                        </div>
                        
                        <table>
                        <tr>
                        <td align="left">
                        <axis:visible f="axissin006" c="SEC_PRESTACION"> 
                             <jsp:include page="axissin006_datossiniestros_tramitaciones_prestaciones.jsp"/>
                        </axis:visible>    
                        </td>
                        </tr>
                        </table>
   
                        

                       
</form>