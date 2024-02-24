<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<c:set var="nombrePantalla" value="tramitaciones"/>
<c:set var="nombreSeccion" value="reservas"/>

<script type="text/javascript">
         function f_aceptar_axissin045(SGESTIO) {
            //alert("Aceptando la gestion");
            f_cerrar_modal("axissin045");
            document.miForm.SGESTIO.value = SGESTIO;
            document.miForm.subpantalla.value="tramitaciones";
            document.miForm.seccion.value="tramitaciones_gestion";
            objUtiles.ejecutarFormulario ("axis_axissin006.do?NSINIESselected="+objDom.getValorPorId("NSINIES"), "inicializarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);     
         }
         function f_getGestio(indexNou, SGESTION){
            document.miForm.indexGestio.value = indexNou;
            document.miForm.SGESTIO.value = SGESTION;
            document.miForm.subpantalla.value="tramitaciones";
            document.miForm.seccion.value="tramitaciones_gestion";
            objUtiles.ejecutarFormulario("axis_axissin006.do?SGESTION="+SGESTION, "recargarPagos", document.miForm, "_self", objJsMessages.jslit_cargando);
         }
        function f_aceptar_axissin047(){
            f_cerrar_modal("axissin047");
            objUtiles.ejecutarFormulario ("axis_axissin006.do?NSINIESselected="+objDom.getValorPorId("NSINIES"), "inicializarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);     
        }
</script>

<form name="${nombrePantalla}${nombreSeccion}" action="" method="POST"> 
            
                        <c:set var="title1"><axis:alt f="axissin006" c="TGESTION" lit="9902564" /></c:set>
                        <c:set var="title2"><axis:alt f="axissin006" c="PROVEEDOR" lit="9902565" /></c:set><!--Tipo-->
                        <c:set var="title3"><axis:alt f="axissin006" c="TPROVEEDOR" lit="9902566" /></c:set><!--Garantia -->
                        <c:set var="title4"><axis:alt f="axissin006" c="SGESTIO" lit="101109" /></c:set><!--Gestión -->
                        <c:set var="title5"><axis:alt f="axissin006" c="TPERSED" lit="9902589" /></c:set><!--SEDE -->
                        <script language="Javascript">
                        //alert(objUtiles.miInnerWidth()*0.9)
                        //poniendo scroll a nivel de body o div, no lo presenta, o presenta el scroll horizontal protegido
                        document.write('<div class="displayspaceGrande" style="overflow-x:auto;width:'+(objUtiles.miInnerWidth()*0.89)+'px">')
                        </script>
                        <%int i = 0;%>
                        
                          <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.GESTIONES}" id="T_GESTIONES" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                           requestURI="">
                           <c:set var="i"><%=i%></c:set>
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="" sortable="false" sortProperty="" headerClass="sortable"  media="html" autolink="false">
                               <div class="dspIcons"><input  onClick="javascript:f_getGestio('${i}', '${T_GESTIONES.OB_IAX_SIN_TRAMITA_GESTION.SGESTIO}')" 
                               <c:if test="${__formdata.indexGestio == i }"> checked </c:if>
                                value="" type="radio" id="radioNTRAM" name="radioNTRAM"/></div>
                            </display:column>
                            <axis:visible f="axissin006" c="SGESTIO">
                                <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_SIN_TRAMITA_GESTION.SGESTIO" headerClass="sortable" media="html" autolink="false">
                                    <div class="dspNumber">${T_GESTIONES.OB_IAX_SIN_TRAMITA_GESTION.SGESTIO}</div>
                                </display:column>
                            </axis:visible>
                            <axis:visible f="axissin006" c="NMOVRES">
                                <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_SIN_TRAMI_RESERVA.NTRAMIT" headerClass="sortable" media="html" autolink="false">
                                    <div class="dspNumber">${T_GESTIONES.OB_IAX_SIN_TRAMITA_GESTION.TTIPGES}</div>
                                </display:column>
                            </axis:visible>
                            <c:if test="${T_GESTIONES.OB_IAX_SIN_TRAMITA_GESTION.SPERSED == null}">
                                <axis:visible f="axissin006" c="TTIPRES">
                                    <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false">
                                         <div class="dspText">${T_GESTIONES.OB_IAX_SIN_TRAMITA_GESTION.TNOMPRO}</div>    
                                    </display:column>
                                </axis:visible>
                            </c:if>
                            <c:if test="${T_GESTIONES.OB_IAX_SIN_TRAMITA_GESTION.SPERSED != null}">
                                <c:if test="${T_GESTIONES.OB_IAX_SIN_TRAMITA_GESTION.SPERSED != T_GESTIONES.OB_IAX_SIN_TRAMITA_GESTION.SPROFES}">
                                    <axis:visible f="axissin006" c="TTIPRES">
                                        <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false">
                                             <div class="dspText">${T_GESTIONES.OB_IAX_SIN_TRAMITA_GESTION.TNOMPRO}</div>    
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible f="axissin006" c="TNOMSED">
                                        <display:column title="${title5}" sortable="false"  headerClass="sortable" media="html" autolink="false">
                                             <div class="dspText">${T_GESTIONES.OB_IAX_SIN_TRAMITA_GESTION.TNOMSED}</div>    
                                        </display:column>
                                    </axis:visible>
                                </c:if>
                            </c:if>
                            <axis:visible f="axissin006" c="TGARANT">
                                <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                     <div class="dspText">${T_GESTIONES.OB_IAX_SIN_TRAMITA_GESTION.TSUBPRO}</div>    
                                </display:column>
                            </axis:visible>
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
                                <axis:visible f="axissin006" c="DSP_DETGESTIONDET">
                                <!-- Inicio Seccion -->
                                <tr>
                                    <td>
                                    <div style="float:left;">
                                        <b><axis:alt f="axissin006" c="DETALLE" lit="1000113"/></b>
                                    </div>
                                    </td>
                                    <c:if test="${__formdata.MODIFICABLE == 0}">
                                    <td>
                                       <axis:visible f="axissin006" c="BT_EDITAR_GESTION"> <!-- boton editar gestion -->
                                            <div class="dspIcons" id="BT_EDITAR_GESTION" style="text-align:right">
                                                <img border="0" alt="<axis:alt f="axisprf001" c="BT_EDITAR_GESTION" lit="100002"/>"
                                                     title1="<axis:alt f="axissin006" c="BT_EDITAR_GESTION" lit="100002"/>" 
                                                     src="images/lapiz.gif" width="15px" height="15px"
                                                     style="cursor:pointer;" 
                                                     onclick="javascript:f_abrir_modal('axissin045',null,'&SGESTIO='+'${__formdata.SGESTIO}'+
                                                                                                         '&indexTramitacio='+${__formdata.indexTramitacio}+
                                                                                                         '&MODO=modificar');"  />
                                            </div>
                                        </axis:visible>
                                    </td>
                                    </c:if>
                                </tr>
                                <tr>
                                    <c:if test="${__formdata.MODIFICABLE == 0}">
                                    <td colspan="2">
                                    </c:if>    
                                    <c:if test="${__formdata.MODIFICABLE != 0}">
                                    <td>
                                    </c:if>
                                            <c:set var="title1"><axis:alt f="axissin006" c="CODIGO" lit="1000109" /></c:set>
                                            <c:set var="title2"><axis:alt f="axissin006" c="DESCRIPCION" lit="100588" /></c:set>
                                            <c:set var="title3"><axis:alt f="axissin006" c="IMPORTE" lit="Importe" /></c:set>
                                            <c:set var="num_gestio">0</c:set>
                                            <div class="displayspace"> 
                                            <c:set var="totalimp" value="0"/>
                                            <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.GESTIONES[__formdata.indexGestio].OB_IAX_SIN_TRAMITA_GESTION.SERVICIOS}" id="T_SERVICIOS" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="" style="width: 100%">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title1}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_SERVICIOS.OB_IAX_SIN_TRAMITA_DETGESTION.SSERVIC}</div>
                                                </display:column>
                                                <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_SERVICIOS.OB_IAX_SIN_TRAMITA_DETGESTION.TSERVIC}</div>
                                                </display:column>
                                                <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspNumber">
                                                        <fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${T_SERVICIOS.OB_IAX_SIN_TRAMITA_DETGESTION.ITOTAL}'/>
                                                     </div>
                                                </display:column>
                                                <c:set var="totalimp">${totalimp + T_SERVICIOS.OB_IAX_SIN_TRAMITA_DETGESTION.ITOTAL}</c:set>
                                                <display:footer>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td class="sortable">
                                                            <b><axis:alt c="TOTAL" f="axissin006" lit="101093"/></b>
                                                        </td>
                                                        <td class="sortable dspNumber">
                                                            <b><fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${totalimp}'/></b>
                                                        </td>
                                                    <tr>
                                                </display:footer>
                                               </display:table>
                                            </div>
                                    </td>
                                </tr> 
                               
                                </axis:visible>
                                <axis:visible f="axissin006" c="DSP_DETGESTIONMOVIMI">
                                <!-- Inicio Seccion -->
                                <tr>
                                    <c:if test="${__formdata.MODIFICABLE == 0}">
                                    <td colspan="2">
                                    </c:if>    
                                    <c:if test="${__formdata.MODIFICABLE != 0}">
                                    <td>
                                    </c:if>
                                    <div style="float:left;">
                                        <b><axis:alt f="axissin006" c="MOVIMIENTOS" lit="100913"/></b><!-- DETALLE PAGO RESERVA -->
                                    </div>
                                    <div style="float:right;" id="BT_NUEVA_MOV">
                                        <axis:visible f="axissin006" c="BT_NUEVA_MOV">
                                                <img border="0" alt='<axis:alt f="axissin006" c="BT_NUEVA_GESTION" lit="100913"/>'
                                                     title='<axis:alt f="axissin006" c="NUEVA_GESTION" lit="9902550"/>'
                                                     src="images/new.gif" onClick="javascript:f_abrir_modal('axissin047',null,'&NTRAMIT='+document.miForm.NTRAMIT.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&SPRODUC='+document.miForm.SPRODUC.value+'&NSINIES='+document.miForm.NSINIES.value+'&indexGestio='+document.miForm.indexGestio.value+'&CTIPGES='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.GESTIONES[__formdata.indexGestio].OB_IAX_SIN_TRAMITA_GESTION.CTIPGES}'+'&CESTGES='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.GESTIONES[__formdata.indexGestio].OB_IAX_SIN_TRAMITA_GESTION.CESTGES}'+'&CSUBGES='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.GESTIONES[__formdata.indexGestio].OB_IAX_SIN_TRAMITA_GESTION.CSUBGES}'+'&SGESTIO='+'${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.GESTIONES[__formdata.indexGestio].OB_IAX_SIN_TRAMITA_GESTION.SGESTIO}');"
                                                     />
                                        </axis:visible>
                                    </div>
                                    </td>
                                </tr>
                                <tr>
                                    <c:if test="${__formdata.MODIFICABLE == 0}">
                                    <td colspan="2">
                                    </c:if>    
                                    <c:if test="${__formdata.MODIFICABLE != 0}">
                                    <td>
                                    </c:if>
                                        <!-- TABLA SECCION  RESERVAS DETALLE PAGO RESERVA -->
                                            <c:set var="title1"><axis:alt f="axissin006" c="FECHA" lit="100562" /></c:set>
                                            <c:set var="title2"><axis:alt f="axissin006" c="ESTADO" lit="100587" /></c:set>
                                            <c:set var="title3"><axis:alt f="axissin006" c="SUBESTADO" lit="9902593" /></c:set>
                                            <c:set var="title4"><axis:alt f="axissin006" c="USUARIO" lit="100894" /></c:set>
                                            <c:set var="title5"><axis:alt f="axissin006" c="COMENTARIO" lit="9902597" /></c:set>
                                            <c:set var="title6"><axis:alt f="axissin006" c="TIPOMOV" lit="1000591" /></c:set>
                                            <c:set var="num_gestio">0</c:set>
                                            <div class="displayspace"> 
                                              <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.GESTIONES[__formdata.indexGestio].OB_IAX_SIN_TRAMITA_GESTION.MOVIMIENTOS}" id="T_MOVIMIENTOS" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title1}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">
                                                     <fmt:formatDate pattern="dd/MM/yyyy" value="${T_MOVIMIENTOS.OB_IAX_SIN_TRAMITA_MOVGESTION.FMOVINI}"/></div>    
                                                </display:column>
                                                <display:column title="${title6}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_MOVIMIENTOS.OB_IAX_SIN_TRAMITA_MOVGESTION.TDESCRI}</div>
                                                </display:column>
                                                <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_MOVIMIENTOS.OB_IAX_SIN_TRAMITA_MOVGESTION.TESTGES}</div>
                                                </display:column>
                                                <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_MOVIMIENTOS.OB_IAX_SIN_TRAMITA_MOVGESTION.TSUBGES}</div>
                                                </display:column>
                                                <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_MOVIMIENTOS.OB_IAX_SIN_TRAMITA_MOVGESTION.CUSUALT}</div>
                                                </display:column>
                                                <display:column title="${title5}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_MOVIMIENTOS.OB_IAX_SIN_TRAMITA_MOVGESTION.TCOMENT}</div>
                                                </display:column>
                                               </display:table>
                                            </div>
                                    </td>
                                </tr> 
                               
                                </axis:visible>
                                                            
                                
                                </table>
                            </td>
                        </tr>
                    </table>
</form>