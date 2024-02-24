<%/* Revision:# CAcyK0Sd1R7C6mhzaai+Pw== # */%>
<%-- 
  Fichero: axisper009.jsp
  Fecha: 23/07/2008
--%>
<%@ page contentType="text/html;charset=UTF-8" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page import="axis.util.Constantes" %>
<%@ page import="java.util.*" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>


<c:if test="${!empty dades_persona.POLTOM ||!empty dades_persona.POLASE||!empty dades_persona.PERPRO||!empty dades_persona.PERCIA||
            !empty dades_persona.PERAGE||!empty dades_persona.POLSIN||!empty dades_persona.RECTOM||!empty dades_persona.REPRESENTANTES
            ||!empty dades_persona.COORDINADORES||!empty dades_persona.LISTASOFIEXT||!empty dades_persona.LISTASOFIINT || !empty dades_persona.PINQUIL 
            || !empty dades_persona.PAVALIST || !empty dades_persona.PGESCOBRO || !empty dades_persona.ANTIGUEDAD || !empty dades_persona.CONDUCTORES || !empty __formdata.T_IAX_CONTRAGARAN}">
        
  <%--datos polizas tomador--%>
    <tr>
        <td class="campocaja" >
      
            <div style="float:left;">
                <img id="datospoltom_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('datospoltom', this);objSeccion.actualizarSeccionPorAbrirCookie('axisper009','datospoltom');" style="cursor:pointer"/>
                <b><axis:alt f="axisper009" c="POLTOM" lit="9001609" /></b>
            </div>
            <div style="float:right;">
            </div>
            <div style="clear:both;">
                <hr class="titulo">
            </div>
        </td>
    </tr> 
    <axis:visible c="DSP_CONTRAGARAN" f="axis_axisper009">

	<c:if test="${__formdata.T_IAX_CONTRAGARAN!=null}">
	<tr>
		<td class="titulo">		 
			<b><axis:alt f="axis_axisper009" c="CGAR" lit="9908805" /></b>
		</td>
	</tr>
	<tr id="DSP_CONTRAGARAN_children" >
		<td class="campocaja">
			<c:import url="../include/modal_estandar.jsp">
				<c:param name="titulo">
					<axis:alt f="axiscga001" c="DOCU_REQUERIDA" lit="9908805" />
				</c:param>
				<c:param name="nid" value="axiscga002" />
			</c:import>
			<script type="text/javascript">
			function f_abrir_axiscga002(SCONTGAR,NMOVIMI,SPERSON) {
				document.miForm.CMODO.value = 'CONSULTA';
				objUtiles.abrirModal("axiscga002", "src","modal_axiscga002.do?operation=detalle_consulta&SCONTGAR=" + SCONTGAR+ "&SPERSON=" + SPERSON+"&CMODOPAN=CONSULTA"+"&NMOVIMI="+NMOVIMI+"&SSEGUROPRODUCCION=${sessionScope.SSEGURO}");			
			}
			function f_but_cerrar_axiscga002(){
		    	objUtiles.cerrarModal("axiscga002");		    	
		   }
			</script>
	
		<div class="displayspace">
		
		
						<c:set var="title0"><axis:alt f="axis_axisper009" c="NCTRGARANT" lit="9908801"/></c:set>
                       <c:set var="title1"><axis:alt f="axis_axisper009" c="TCTRGARANT" lit="100588"/></c:set>
                       <c:set var="title2"><axis:alt f="axis_axisper009" c="TTIPO" lit="9907700"/></c:set>
                       <c:set var="title3"><axis:alt f="axis_axisper009" c="TCLASE" lit="9904874"/></c:set>
                       <c:set var="title4"><axis:alt f="axis_axisper009" c="TMODENA" lit="108645"/></c:set>
                       <c:set var="title5"><axis:alt f="axis_axisper009" c="TESTADO" lit="101510"/></c:set>
                       <c:set var="title6"><axis:alt f="axis_axisper009" c="NVALOR" lit="101159"/></c:set> 
                       <c:set var="title7"><axis:alt f="axis_axisper009" c="TROL" lit="9901939"/></c:set>
                       <c:set var="title8"><axis:alt f="axis_axisper009" c="CONSULTAR" lit="1000439"/></c:set>
                       <c:set var="axisctr306_lista_contragaran" value="${__formdata.T_IAX_CONTRAGARAN}" />    
                       
                       
                       <display:table name="${axisctr306_lista_contragaran}" id="miLCC" export="false" class="dsptgtable"
							pagesize="-1" defaultsort="2" defaultorder="ascending"
							requestURI="axis_axisper009.do?paginar=true" sort="list"
							cellpadding="0" cellspacing="0">
							<%@ include file="../include/displaytag.jsp"%>
                        	
                        	<display:column title="${title0}" sortProperty="NCTRGARANT" headerClass="sortable" media="html" sortable="true"
								autolink="false">
                                <div class="dspText">${miLCC.NCTRGARANT}</div>
                            </display:column>
                            <display:column title="${title1}" sortProperty="TCTRGARANT" headerClass="sortable" media="html" sortable="true"
								autolink="false">
                                <div class="dspText">${miLCC.TCTRGARANT}</div>
                            </display:column>
                            <display:column title="${title2}" sortProperty="TTIPO" headerClass="sortable" media="html" sortable="true"
								autolink="false">
                                <div class="dspText">${miLCC.TTIPO}</div>
                            </display:column>
                            <display:column title="${title3}" sortProperty="TCLASE" headerClass="sortable" media="html" sortable="true"
								autolink="false">
                                <div class="dspText">${miLCC.TCLASE}</div>
                            </display:column>
                            <display:column title="${title4}" sortProperty="TMODENA" headerClass="sortable" media="html" sortable="true"
								autolink="false">
                                <div class="dspText">${miLCC.TMODENA}</div>
                            </display:column>
                            <display:column title="${title5}" sortProperty="TESTADO" headerClass="sortable" media="html" sortable="true"
								autolink="false">
                                <div class="dspText">${miLCC.TESTADO}</div>
                            </display:column>
                            <display:column title="${title6}" sortProperty="NVALOR" headerClass="sortable" media="html" sortable="true"
								autolink="false">
                                <div class="dspText">${miLCC.NVALOR}</div>
                            </display:column>
                            <display:column title="${title7}" sortProperty="TROL" headerClass="sortable" media="html" sortable="true"
								autolink="false">
                                <div class="dspText">
								 <%-- TCS_309 - ACL - 13/02/2019 Se ajusta de null a cero --%>
                                <c:if test="${miLCC.CROL!=0}">Codeudor</c:if>
                                <c:if test="${miLCC.CROL==0}">Tomador</c:if>
                                </div>
                            </display:column>
                            
                            <display:column title="${title8}" headerClass="sortable" media="html" sortable="false"
								autolink="false">
								<div class="dspIcons">
									<img id="find" border="0" src="images/find.gif"
										onclick="javascript:f_abrir_axiscga002('${miLCC.NCTRGARANT}','${miLCC.SPERSON}','${miLCC.NMOVIMI}');"
										style="cursor: pointer" />
								</div>
							</display:column>
                            
		                                    
                        </display:table>     
                        </div>
                         
		</td>
		</tr>
</c:if>		
</axis:visible>        
    <tr id="datospoltom_children" style="display:none">

       <td align="left" >

    <!--INICIO javendano CONF 239-->
        <axis:visible c="DSP_HISTORICO_LRE" f="axisper009">  
            <div class="titulo"><a name="posicionPorColorcar__T_IAX_LRE" id="posicionPorColorcar__T_IAX_LRE"></a>
             <b><axis:alt f="axisper009" c="LRE" lit="9909653" /></b>
            </div>
            
            <table class="seccion" onClick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','T_IAX_LRE');return true;">
                <tr>
                    <td>
                        <!-- DisplayTag datos polizas assegurats -->
                        <c:set var="title1"><axis:alt f="axisper009" c="NNUMIDE" lit="9904434"/></c:set>
                        <c:set var="title2"><axis:alt f="axisper009" c="TIPO" lit="100565"/></c:set>
                        <c:set var="title3"><axis:alt f="axisper009" c="FINCLUS" lit="9902640"/></c:set>
                        <c:set var="title4"><axis:alt f="axisper009" c="MOTINCL" lit="9902641"/></c:set>
                        <c:set var="title5"><axis:alt f="axisper009" c="ACCION" lit="9000844"/></c:set>
                        <c:set var="title6"><axis:alt f="axisper009" c="NPOLIZA" lit="9903659"/></c:set>
                        <c:set var="title7"><axis:alt f="axisper009" c="NSINIES" lit="103688"/></c:set>
                        <c:set var="title8"><axis:alt f="axisper009" c="NRECIBO" lit="100895"/></c:set>
                        
                        <div class="displayspace">
                          <display:table name="${T_IAX_LRE}" id="T_IAX_LRE" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                            requestURI="axis_axisper009.do?operation=form&paginar=true&subpantalla=datospoltom">
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="${title1}" sortable="true" sortProperty="NNUMIDE"  headerClass="headwidth5 sortable" media="html" style="width:5%" autolink="false" >
                                <div class="dspText"> ${T_IAX_LRE.NNUMIDE}  </div>
                            </display:column>
                            <display:column title="${title2}" sortable="true" sortProperty="NNUMIDE"  headerClass="headwidth5 sortable" media="html" style="width:5%" autolink="false" >
                                <div class="dspText"> ${T_IAX_LRE.TIPLIS}  </div>
                            </display:column>
                            <display:column title="${title3}" sortable="true" sortProperty="NNUMIDE"  headerClass="headwidth5 sortable" media="html" style="width:5%" autolink="false" >
                                <div class="dspText"> ${T_IAX_LRE.FINCLUS}  </div>
                            </display:column>                            
                            <display:column title="${title4}" sortable="true" sortProperty="NNUMIDE"  headerClass="headwidth5 sortable" media="html" style="width:5%" autolink="false" >
                                <div class="dspText"> ${T_IAX_LRE.CINCLUS}  </div>
                            </display:column>                             
                            <display:column title="${title5}" sortable="true" sortProperty="NNUMIDE"  headerClass="headwidth5 sortable" media="html" style="width:5%" autolink="false" >
                                <div class="dspText"> ${T_IAX_LRE.ACCION}  </div>
                            </display:column> 
                            <display:column title="${title6}" sortable="true" sortProperty="NNUMIDE"  headerClass="headwidth5 sortable" media="html" style="width:5%" autolink="false" >
                                <div class="dspText"> ${T_IAX_LRE.NPOLIZA}  </div>
                            </display:column> 
                            <display:column title="${title7}" sortable="true" sortProperty="NNUMIDE"  headerClass="headwidth5 sortable" media="html" style="width:5%" autolink="false" >
                                <div class="dspText"> ${T_IAX_LRE.NSINIES}  </div>
                            </display:column> 
                            <display:column title="${title8}" sortable="true" sortProperty="NNUMIDE"  headerClass="headwidth5 sortable" media="html" style="width:5%" autolink="false" >
                                <div class="dspText"> ${T_IAX_LRE.NRECIBO}  </div>
                            </display:column>                             
                        </display:table>
                        </div>
                    </td>
                <tr>
            </table> 
        </axis:visible>
    <!--FIN javendano CONF 239-->	   
	   
        <axis:visible c="DSP_POLTOMA" f="axisper009">  
        <c:if test="${!empty dades_persona.POLTOM}">    
        
            <div class="titulo"><a name="posicionPorColorcar__T_IAX_POLTOM" id="posicionPorColorcar__T_IAX_POLTOM"></a>
             <b><axis:alt f="axisper009" c="POLTOM" lit="1000181" /></b>
            </div>
            
            <table class="seccion"  onClick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','T_IAX_POLTOM');return true;" >
                <tr>
                    <td>
                        <!-- DisplayTag datos polizas tomador -->
                        <c:set var="title1"><axis:alt f="axisper009" c="NORDTOM" lit="500102"/></c:set>
                        <c:set var="title2"><axis:alt f="axisper009" c="POLIZA" lit="100836"/></c:set>
                        <c:set var="title3"><axis:alt f="axisper009" c="TPRODUCTO" lit="100829"/></c:set>
                        <c:set var="title4"><axis:alt f="axisper009" c="FANULAC" lit="140214"/></c:set>
                        <c:set var="title5"><axis:alt f="axisper009" c="CAGENTE" lit="100584"/></c:set>
                        <div class="displayspace">
                        
                          <display:table name="${dades_persona.POLTOM}" id="T_IAX_POLTOM" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                           requestURI="axis_axisper009.do?operation=form&paginar=true&subpantalla=datospoltom">
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="${title1}" sortable="true" sortProperty="NORDTOM" headerClass="headwidth5 sortable" media="html" style="width:5%" autolink="false" >
                                <div class="dspText">${T_IAX_POLTOM.NORDTOM}</div>
                            </display:column>
                            <display:column title="${title2}" sortable="true" sortProperty="POLIZA" headerClass="sortable" media="html" style="width:10%" autolink="false" >
                                <div class="dspText">${T_IAX_POLTOM.POLIZA}</div>
                            </display:column>
                            <display:column title="${title3}" sortable="true" sortProperty="TPRODUCTO" headerClass="sortable" media="html" style="width:40%" autolink="false" >
                                <div class="dspText">${T_IAX_POLTOM.TPRODUCTO}</div>
                            </display:column>
                            <display:column title="${title4}" sortable="true" sortProperty="FANULAC" headerClass="sortable" media="html" style="width:10%" autolink="false" >
                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_POLTOM.FANULAC}"/></div>
                            </display:column>    
                            <display:column title="${title5}" sortable="true" sortProperty="CAGENTE" headerClass="sortable" media="html" style="width:30%" autolink="false" >
                                <div class="dspText">${T_IAX_POLTOM.CAGENTE} - ${T_IAX_POLTOM.TAGENTE}</div>
                            </display:column> 
                              <axis:visible f="axisper009" c="BT_TOMBUSPOL">
                            <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                <div class="dspIcons"><a href="javascript:f_but_polissa('${T_IAX_POLTOM.SSEGURO}')"><img border="0" alt="<axis:alt f="axisper009" c="LIT_CONS_POL" lit="151477"/>" title="<axis:alt f="axisper009" c="LIT_CONS_POL" lit="151477"/>" src="images/find.gif"/></a></div>
                            </display:column>                                    
                            </axis:visible>
                        </display:table>
                        </div>
                    </td>
                <tr>
            </table>   
  
           </c:if>
           </axis:visible>
            <!-- tabla seccion polizas aseg -->                                           
           <c:if test="${!empty dades_persona.POLASE}"> 
            <axis:visible c="DSP_POLASE" f="axisper009">  
            <div class="titulo"><a name="posicionPorColorcar__T_IAX_POLASE" id="posicionPorColorcar__T_IAX_POLASE"></a>
             <b><axis:alt f="axisper009" c="POLASE" lit="100645" /></b>
            </div>
            
            <table class="seccion" onClick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','T_IAX_POLASE');return true;">
                <tr>
                    <td>
                        <!-- DisplayTag datos polizas assegurats -->
                        <c:set var="title1"><axis:alt f="axisper009" c="NRIESGO" lit="500102"/></c:set>
                        <c:set var="title2"><axis:alt f="axisper009" c="POLIZA" lit="100836"/></c:set>
                        <c:set var="title3"><axis:alt f="axisper009" c="TPRODUCTO" lit="100829"/></c:set>
                        <c:set var="title4"><axis:alt f="axisper009" c="FANULAC" lit="140214"/></c:set>
                        <c:set var="title5"><axis:alt f="axisper009" c="CAGENTE" lit="100584"/></c:set>
						<c:set var="title6"><axis:alt f="axisper009" c="FEFECTO" lit="9908678"/></c:set>
                        <div class="displayspace">
                          <display:table name="${dades_persona.POLASE}" id="T_IAX_POLASE" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                          requestURI="axis_axisper009.do?operation=form&paginar=true&subpantalla=datospoltom">
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="${title1}" sortable="true" sortProperty="NRIESGO" headerClass="headwidth5 sortable" media="html" style="width:5%" autolink="false" >
                                <div class="dspText">${T_IAX_POLASE.NRIESGO}</div>
                            </display:column>
                            <display:column title="${title2}" sortable="true" sortProperty="POLIZA" headerClass="sortable" media="html" style="width:10%" autolink="false" >
                                <div class="dspText">${T_IAX_POLASE.POLIZA}</div>
                            </display:column>
                            <display:column title="${title3}" sortable="true" sortProperty="TPRODUCTO" headerClass="sortable" media="html" style="width:40%" autolink="false" >
                                <div class="dspText">${T_IAX_POLASE.TPRODUCTO}</div>
                            </display:column>
							<axis:visible f="axisper009" c="FEFECTO_ASSEGU">
								<display:column title="${title6}" sortable="true" sortProperty="POLIZA" headerClass="sortable" media="html" style="width:10%" autolink="false" >
									<div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_POLASE.FEFECTO}"/></div>
								</display:column>  
							</axis:visible>
                            <display:column title="${title4}" sortable="true" sortProperty="FANULAC" headerClass="sortable" media="html" style="width:10%" autolink="false" >
                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_POLASE.FANULAC}"/></div>
                            </display:column>    
                            <display:column title="${title5}" sortable="true" sortProperty="CAGENTE" headerClass="sortable" media="html" style="width:30%" autolink="false" >
                                <div class="dspText">${T_IAX_POLASE.CAGENTE} - ${T_IAX_POLASE.TAGENTE}</div>
                            </display:column>                                                                 
                             <axis:visible f="axisper009" c="BT_ASEGBUSPOL">
                            <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                 <div class="dspIcons"><a href="javascript:f_but_polissa('${T_IAX_POLASE.SSEGURO}')"><img border="0" alt="<axis:alt f="axisper009" c="LIT_CONS_POL" lit="151477"/>" title="<axis:alt f="axisper009" c="LIT_CONS_POL" lit="151477"/>" src="images/find.gif"/></a></div>
                            </display:column>                                    
                            </axis:visible>
                        </display:table>
                        </div>
                    </td>
                <tr>
            </table> 
            </axis:visible>
           </c:if> 
           
           <!-- tabla seccion profesionales -->                                           
           <c:if test="${!empty dades_persona.PERPRO}"> 
            <div class="titulo"><a name="posicionPorColorcar__T_IAX_PREPRO" id="posicionPorColorcar__T_IAX_PERPRO"></a>
             <b><axis:alt f="axisper009" c="PERPRO" lit="102075" /></b>
            </div>
            
            <table class="seccion" onClick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','T_IAX_PERPRO');return true;">
                <tr>
                    <td>
                        <!-- DisplayTag  -->
                        <c:set var="title1"><axis:alt f="axisper009" c="TACTPRO" lit="103481"/></c:set>
                        <c:set var="title2"><axis:alt f="axisper009" c="NCOLEGI" lit="9902570"/></c:set>
                        <c:set var="title3"><axis:alt f="axisper009" c="TTIPRET" lit="101714"/></c:set>
                        <c:set var="title4"><axis:alt f="axisper009" c="TIPIVA" lit="101340"/></c:set>                        
                        <div class="displayspace">
                          <display:table name="${dades_persona.PERPRO}" id="T_IAX_PERPRO" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                          requestURI="axis_axisper009.do?operation=form&paginar=true&subpantalla=datospoltom">
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="${title1}" sortable="true" sortProperty="TACTPRO" headerClass="headwidth5 sortable" media="html" style="width:25%" autolink="false" >
                                <div class="dspText">${T_IAX_PERPRO.TACTPRO}</div>
                            </display:column>
                             <display:column title="${title2}" sortable="true" sortProperty="TSUBPRO" headerClass="sortable" media="html" style="width:15%" autolink="false" >
                                <div class="dspText">${T_IAX_PERPRO.TSUBPRO}</div>
                            </display:column> 
                             <axis:visible f="axisper009" c="TTIPRET">
                            <display:column title="${title3}" sortable="true" sortProperty="TTIPRET" headerClass="sortable" media="html" style="width:25%" autolink="false" >
                                <div class="dspText">${T_IAX_PERPRO.TTIPRET}</div>
                            </display:column>
                            </axis:visible>
                            <axis:visible f="axisper009" c="TIPIVA">
                            <display:column title="${title4}" sortable="true" sortProperty="TIPIVA" headerClass="sortable" media="html" style="width:15%" autolink="false" >
                                <div class="dspText">${T_IAX_PERPRO.TIPIVA}</div>
                            </display:column>   
                            </axis:visible>
                            <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                 <div class="dspIcons"><a href="javascript:f_seleccionar_profesional('${T_IAX_PERPRO.SPROFES}')"><img border="0" alt="<axis:alt f="axisper009" c="LIT_CONS_PRF" lit="9904113"/>" title="<axis:alt f="axisper009" c="LIT_CONS_PRF" lit="9904113"/>" src="images/find.gif"/></a></div>
                            </display:column>
                        </display:table>
                        </div>
                    </td>
                <tr>
            </table>  
           </c:if>   
           <!-- NUEVOS MULTIREGISTROS: Inquilinos, Avalistas y Gesti?n de Cobros -->                                               
           <c:import url="axisper009_a0.jsp"/>
           <!-- NUEVOS MULTIREGISTROS POSICION GLOBAL -->                                               
            <c:import url="axisper009_a1.jsp"/>
           <!-- ************** FIN ****************** -->
           <!-- tabla seccion compa?ias -->                                           
           <c:if test="${!empty dades_persona.PERCIA}"> 
            <div class="titulo"><a name="posicionPorColorcar__T_IAX_PERCIA" id="posicionPorColorcar__T_IAX_PERCIA"></a>
             <b><axis:alt f="axisper009" c="PERCIA" lit="101023" /></b>
            </div>
            
            <table class="seccion" onClick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','T_IAX_PERCIA');return true;">
                <tr>
                    <td>
                        <!-- DisplayTag -->
                        <c:set var="title1"><axis:alt f="axisper009" c="TCOMPANI" lit="9000600"/></c:set>
                        <c:set var="title2"><axis:alt f="axisper009" c="TTIPIVA" lit="101340"/></c:set>
                        <c:set var="title3"><axis:alt f="axisper009" c="TCOMISI" lit="101509"/></c:set>
                        <div class="displayspace">
                          <display:table name="${dades_persona.PERCIA}" id="T_IAX_PERCIA" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                          requestURI="axis_axisper009.do?operation=form&paginar=true&subpantalla=datospoltom" >
                            <%@ include file="../include/displaytag.jsp"%>
                            <axis:visible f="axisper009" c="TCOMPANI">
                            <display:column title="${title1}" sortable="true" sortProperty="TCOMPANI" headerClass="headwidth5 sortable" media="html" style="width:35%" autolink="false" >
                                <div class="dspText">${T_IAX_PERCIA.TCOMPANI}</div>
                            </display:column>
                            </axis:visible>
                            <axis:visible f="axisper009" c="TTIPIVA">
                            <display:column title="${title2}" sortable="true" sortProperty="TTIPIVA" headerClass="sortable" media="html" style="width:25%" autolink="false" >
                                <div class="dspText">${T_IAX_PERCIA.TTIPIVA}</div>
                            </display:column>
                            </axis:visible>
                            <axis:visible f="axisper009" c="TCOMISI">
                            <display:column title="${title3}" sortable="true" sortProperty="TCOMISI" headerClass="sortable" media="html" style="width:15%" autolink="false" >
                                <div class="dspText">${T_IAX_PERCIA.TCOMISI}</div>
                            </display:column>                                                                  
                            </axis:visible>
                            <%--
                            <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                 <div class="dspIcons"><a href="javascript:f_but_polissa('${T_IAX_POLASE.SSEGURO}')"><img border="0" alt="<axis:alt f="axisper009" c="LIT_CONS_POL" lit="151477"/>" title="<axis:alt f="axisper009" c="LIT_CONS_POL" lit="151477"/>" src="images/find.gif"/></a></div>
                            </display:column>  --%>                                   
                            
                        </display:table>
                        </div>
                    </td>
                <tr>
            </table>  
           </c:if> 
           
           <!-- tabla seccion agentes -->                                           
           <c:if test="${!empty dades_persona.PERAGE}"> 
            <div class="titulo"><a name="posicionPorColorcar__T_IAX_PERAGE" id="posicionPorColorcar__T_IAX_PERAGE"></a>
             <b><axis:alt f="axisper009" c="PERAGE" lit="101024" /></b>
            </div>
            
            <table class="seccion" onClick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','T_IAX_PERAGE');return true;">
                <tr>
                    <td>
                        <!-- DisplayTag  -->
                        <c:set var="title1"><axis:alt f="axisper009" c="CODAGENTE" lit="9000531"/></c:set>
                        <c:set var="title2"><axis:alt f="axisper009" c="TIPAGENTE" lit="9000519"/></c:set>
                        <c:set var="title3"><axis:alt f="axisper009" c="AGACTIVO" lit="100786"/></c:set>
                        <c:set var="title4"><axis:alt f="axisper009" c="TEMPRES" lit="101619"/></c:set>
                        <div class="displayspace">
                          <display:table name="${dades_persona.PERAGE}" id="T_IAX_PERAGE" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                           requestURI="axis_axisper009.do?operation=form&paginar=true&subpantalla=datospoltom">
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="${title1}" sortable="true" sortProperty="CODAGENTE" headerClass="headwidth5 sortable" media="html" style="width:15%" autolink="false" >
                                <div class="dspText">${T_IAX_PERAGE.CAGENTE}</div>
                            </display:column>
                            <display:column title="${title2}" sortable="true" sortProperty="TIPAGENTE" headerClass="sortable" media="html" style="width:25%" autolink="false" >
                                <div class="dspText">${T_IAX_PERAGE.TIPAGENTE}</div>
                            </display:column>
                            <display:column title="${title3}" sortable="true" sortProperty="AGACTIVO" headerClass="sortable" media="html" style="width:25%" autolink="false" >
                                <div class="dspText">${T_IAX_PERAGE.AGACTIVO}</div>
                            </display:column>  
                            <display:column title="${title4}" sortable="true" sortProperty="TEMPRES" headerClass="sortable" media="html" style="width:25%" autolink="false" >
                                <div class="dspText">${T_IAX_PERAGE.TEMPRES}</div>
                            </display:column> 
                            
                            
                            <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                 <div class="dspIcons"><a href="javascript:f_cons_agente('${T_IAX_PERAGE.CAGENTE}')"><img border="0" alt="<axis:alt f="axisper009" c="LIT_CONS_AGENTE" lit="9000714"/>" title="<axis:alt f="axisper009" c="LIT_CONS_AGENTE" lit="9000714"/>" src="images/find.gif"/></a></div>
                            </display:column>                                
                            
                        </display:table>
                        </div>
                    </td>
                <tr>
            </table>  
           </c:if> 
           
           <!-- tabla seccion siniestros -->                                           
           <c:if test="${!empty dades_persona.POLSIN}"> 
            <div class="titulo"><a name="posicionPorColorcar__T_IAX_POLSIN" id="posicionPorColorcar__T_IAX_POLSIN"></a>
             <b><axis:alt f="axisper009" c="POLSIN" lit="100592" /></b>
            </div>
            
            <table class="seccion" onClick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','T_IAX_POLSIN');return true;">
                <tr>
                    <td> 
                        <!-- DisplayTag  -->
                        <c:set var="title1"><axis:alt f="axisper009" c="CRAMO" lit="100784"/></c:set>
                        <c:set var="title2"><axis:alt f="axisper009" c="CMODALI" lit="100943"/></c:set>
                        <c:set var="title3"><axis:alt f="axisper009" c="TTITPRO" lit="100829"/></c:set>
                        <c:set var="title4"><axis:alt f="axisper009" c="POLIZA" lit="100836"/></c:set>
                        <c:set var="title5"><axis:alt f="axisper009" c="NSINIES" lit="800279"/></c:set>
                        <c:set var="title6"><axis:alt f="axisper009" c="FSINIES" lit="110521"/></c:set>
                        <c:set var="title10"><axis:alt f="axisper009" c="NSINREC" lit="9000974"/></c:set>
                        <c:set var="title7"><axis:alt f="axisper009" c="TESTSIN" lit="112259"/></c:set>
                        <c:set var="title8"><axis:alt f="axisper009" c="TSINIES" lit="100588"/></c:set>
                        <c:set var="title9"><axis:alt f="axisper009" c="RELACION" lit="9001604"/></c:set>
                        <div class="displayspace">
                          <display:table name="${dades_persona.POLSIN}" id="T_IAX_POLSIN" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                           requestURI="axis_axisper009.do?operation=form&paginar=true&subpantalla=datospoltom">
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="${title3}" sortable="true" sortProperty="TTITPRO" headerClass="sortable" media="html" style="width:20%" autolink="false" >
                                <div class="dspText">${T_IAX_POLSIN.TTITPRO}</div>
                            </display:column>  
                            <display:column title="${title4}" sortable="true" sortProperty="POLIZA" headerClass="sortable" media="html" style="width:6%" autolink="false" >
                                <div class="dspText">${T_IAX_POLSIN.POLIZA}</div>
                            </display:column> 
                            <display:column title="${title5}" sortable="true" sortProperty="NSINIES" headerClass="sortable" media="html" style="width:7%" autolink="false" >
                                <div class="dspText">${T_IAX_POLSIN.NSINIES}</div>
                            </display:column> 
                            <display:column title="${title6}" sortable="true" sortProperty="FSINIES" headerClass="sortable" media="html" style="width:8%" autolink="false" >
                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_POLSIN.FSINIES}"/></div>
                            </display:column>
                            <display:column title="${title10}" sortable="true" sortProperty="NSINREC" headerClass="sortable" media="html" style="width:8%" autolink="false" >
                                <div class="dspText">${T_IAX_POLSIN.NSINRECL}</div>
                            </display:column>   
                            <display:column title="${title7}" sortable="true" sortProperty="TESTSIN" headerClass="sortable" media="html" style="width:8%" autolink="false" >
                                <div class="dspText">${T_IAX_POLSIN.TESTSIN}</div>
                            </display:column> 
                            <axis:visible f="axisper009" c="TSINIES">
                                <display:column title="${title8}" sortable="true" sortProperty="TSINIES" headerClass="sortable" media="html" style="width:20%" autolink="false" >
                                    <div class="dspText">${T_IAX_POLSIN.TSINIES}</div>
                                </display:column> 
                            </axis:visible>
                            <display:column title="${title9}" sortable="true" sortProperty="RELACION" headerClass="sortable" media="html" style="width:20%" autolink="false" >
                                <div class="dspText">${T_IAX_POLSIN.RELACION}</div>
                            </display:column>  
                            <axis:visible f="axisper009" c="BT_CONSULSINI">
                            <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                 <div class="dspIcons"><a href="javascript:f_but_siniestro('${T_IAX_POLSIN.NSINIES}','${T_IAX_POLSIN.SSEGURO}')"><img border="0" alt="<axis:alt f="axisper009" c="LIT_CONS_SIN_ALT" lit="1000432"/>" title="<axis:alt f="axisper009" c="LIT_CONS_SIN" lit="1000432"/>" src="images/find.gif"/></a></div>
                            </display:column>     
                            </axis:visible>                   
                            
                            
                        </display:table>
                        </div>
                    </td>
                <tr>
            </table>  
           </c:if> 
     <!-- tabla seccion recibos -->                                           
           <c:if test="${!empty dades_persona.RECTOM}"> 
           <axis:visible c="DSP_RECIBOS_TOM" f="axisper009">
            <div class="titulo"><a name="posicionPorColorcar__T_IAX_RECTOM" id="posicionPorColorcar__T_IAX_RECTOM"></a>
            <b><axis:alt f="axisper009" c="RECTOM" lit="9000410" /></b><axis:visible f="axisper009" c="TIT_TOTALES"> - [<axis:alt f="axisper009" c="TIT_TOTALES" lit="1000584" />] -  </axis:visible><axis:visible f="axisper009" c="IPAGADO"><c:if test="${!empty __formdata.IPAGADO}"> <axis:alt f="axisper009" c="IPAGADO" lit="9900730" /> : <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IPAGADO}"/> - </c:if></axis:visible><axis:visible f="axisper009" c="IPENDIENTE"><c:if test="${!empty __formdata.IPENDIENTE}"> <axis:alt f="axisper009" c="IPENDIENTE" lit="9900731" /> : <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IPENDIENTE}"/> - </c:if></axis:visible><axis:visible f="axisper009" c="IMPAGADO"><c:if test="${!empty __formdata.IMPAGADO}"> <axis:alt f="axisper009" c="IMPAGADO" lit="9900961" /> : <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IMPAGADO}"/> - </c:if></axis:visible><axis:visible f="axisper009" c="IGIRADO"><axis:alt f="axisper009" c="IGIRADO" lit="9901119" /> : <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IMPAGADO + __formdata.IPENDIENTE + __formdata.IPAGADO }"/></axis:visible><axis:visible f="axisper009" c="ISALDO_RESUMEN"> - <axis:alt f="axisper009" c="ISALDO_RESUMEN" lit="9001942" /> : <fmt:formatNumber pattern="###,##0.00" value="${__formdata.PISALDO}"/></axis:visible>
            </div>                                                
            <table class="seccion" onClick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','T_IAX_RECTOM');return true;">
                <tr>
                    <td>
                        <!-- DisplayTag  -->
                        <c:set var="title1"><axis:alt f="axisper009" c="TAGENTE" lit="100584"/></c:set>
                        <c:set var="title2"><axis:alt f="axisper009" c="LIT_RECIBOS" lit="9000410"/></c:set>
                        <c:set var="title3"><axis:alt f="axisper009" c="DESPRODUCTO" lit="100829"/></c:set>
                        <c:set var="title4"><axis:alt f="axisper009" c="NPOLIZA" lit="111324"/></c:set>
                        <c:set var="title5"><axis:alt f="axisper009" c="NRECIBO" lit="100895"/></c:set>
                        <c:set var="title55"><axis:alt f="axisper009" c="FEFECTO" lit="101332"/></c:set>
                        <c:set var="title6"><axis:alt f="axisper009" c="TTIPREC" lit="102302"/></c:set>
                        <c:set var="title7"><axis:alt f="axisper009" c="TESTREC" lit="1000553"/></c:set>
                        <c:set var="title8"><axis:alt f="axisper009" c="ITOTALR" lit="100563"/></c:set>
                        <c:set var="title9"><axis:alt f="axisper009" c="ISALDO" lit="9001942"/></c:set>
                        <div class="displayspace">
                          <display:table name="${dades_persona.RECTOM}" id="T_IAX_RECTOM" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0" 
                           requestURI="axis_axisper009.do?operation=form&paginar=true&subpantalla=datospoltom">
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="${title4}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable" media="html" style="width:6%" autolink="false" >
                                <div class="dspText">${T_IAX_RECTOM.NPOLIZA}</div>
                            </display:column>  
                            <display:column title="${title3}" sortable="true" sortProperty="DESPRODUCTO" headerClass="sortable" media="html" style="width:15%" autolink="false" >
                                <div class="dspText">${T_IAX_RECTOM.DESPRODUCTO}</div>
                            </display:column> 
                            <display:column title="${title1}" sortable="true" sortProperty="TAGENTE" headerClass="sortable" media="html" style="width:24%" autolink="false" >
                                <div class="dspText">${T_IAX_RECTOM.CAGENTE}- ${T_IAX_RECTOM.TAGENTE}</div>
                            </display:column>
                            <display:column title="${title5}" sortable="true" sortProperty="NRECIBO" headerClass="sortable" media="html" style="width:8%" autolink="false" >
                                <div class="dspText">${T_IAX_RECTOM.NRECIBO}</div>
                            </display:column>
                            <display:column title="${title55}" sortable="true" sortProperty="FEFECTO" headerClass="sortable" media="html" style="width:8%" autolink="false" >
                                 <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_RECTOM.FEFECTO}"/></div>
                            </display:column>
                             <display:column title="${title6}" sortable="true" sortProperty="TTIPREC" headerClass="sortable" media="html" style="width:12%" autolink="false" >
                                <div class="dspText">${T_IAX_RECTOM.TTIPREC}</div>
                            </display:column>
                            <display:column title="${title7}" sortable="true" sortProperty="TESTREC" headerClass="sortable" media="html" style="width:8%" autolink="false" >
                                <div class="dspText">${T_IAX_RECTOM.TESTREC}</div>
                            </display:column>
                            <display:column title="${title8}" sortable="true" sortProperty="ITOTALR" headerClass="sortable" media="html" style="width:7%" autolink="false" >
                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[T_IAX_RECTOM.CMONEDAREC]}" value="${T_IAX_RECTOM.ITOTALR}"/></div>
                            </display:column> 
                            <axis:visible f="axisper009" c="ISALDO">
                                <display:column title="${title9}" sortable="true" sortProperty="ISALDO" headerClass="sortable" media="html" style="width:7%" autolink="false" >
                                    <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[T_IAX_RECTOM.CMONEDAREC]}" value="${T_IAX_RECTOM.ISALDO}"/></div>
                                </display:column> 
                            </axis:visible>
                              <axis:visible f="axisper009" c="BT_RECBUSPOL">
                            <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" style="width:5%" autolink="false" >
                                 <div class="dspIcons"><a href="javascript:f_but_recibo('${T_IAX_RECTOM.NRECIBO}')"><img border="0" alt="<axis:alt f="axisper009" c="LIT_CONS_RECIBO" lit="9901120"/>" title="<axis:alt f="axisper009" c="LIT_CONS_RECIBO" lit="9901120"/>" src="images/find.gif"/></a></div>
                            </display:column> 
                            </axis:visible>
                        </display:table>
                        </div>
                    </td>
                <tr>
            </table> 
            </axis:visible>
           </c:if>
           <c:import url="axisper009_a2.jsp"/>
       </td>
  </tr>
</c:if>
