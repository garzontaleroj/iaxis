<%/* Revision:# 1mAeZy/vn2ko6DNKcRzLWA== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
    
<c:set var="nombrePantalla" value="datospoliza" />

<c:set var="screenName" value="axissin006" />
<c:if test="${!empty param.screenName}">
    <c:set var="screenName" value="${param.screenName}" />
</c:if>

<script type="text/javascript">
     function f_consultar_persona(SPERSON,NSINIES){
            objUtiles.ejecutarFormulario("axis_axissin006.do?SPERSON_CON="+SPERSON+"&NSINIES_CON="+NSINIES, "consulta_persona", document.miForm, "_self", objJsMessages.jslit_cargando);
    }   
    
     function f_but_polissa() {
             objUtiles.ejecutarFormulario("axis_${screenName}.do", "consultar", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
</script>
 
 
<form name="${nombrePantalla}" action="" method="POST">  
<table class="seccion">
                <tr>
                    <td align="left" >
                         <table class="area" align="center">
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
								<th style="width:15%;height:0px"></th>
                            </tr>
                            <tr>
                                <td class="titulocaja" >
                                    <b><axis:alt c="SPRODUC" f="${screenName}" lit="100829"/></b>
                                </td>
                                <!-- Actividad -->
                                <axis:ocultar f="${screenName}" c="TACTIVI" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="${screenName}" c="TACTIVI" lit="103481"></axis:alt></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="${screenName}" c="NPOLIZA" dejarHueco="false">
                                <!-- Numero de poliza -->
                                <td class="titulocaja">
                                    <b><axis:alt c="NPOLIZA" f="${screenName}" lit="9001514" /></b>
                                 
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="${screenName}" c="NCERTIF" dejarHueco="false">
                                <!-- Certificado -->
                                <td class="titulocaja">
                                    <b><axis:alt c="NCERTIF" f="${screenName}" lit="101300" /></b>
                                </td>
                                </axis:ocultar>
                                <!-- Póliza Compañía -->
                                <axis:ocultar f="${screenName}" c="CPOLCIA" dejarHueco="false">   
                                    <td class="titulocaja" >
                                        <b><axis:alt c="CPOLCIA" f="${screenName}" lit="9001766"/></b>
                                    </td>
                                </axis:ocultar>
                                <!-- Situación -->
                                <td class="titulocaja">
                                    <b><axis:alt c="CSITUAC" f="${screenName}" lit="100874" /></b>
                                </td>
                                  <!-- Producto -->
                                
                             </tr>
                             <tr>
                                  <!-- Producto -->
                                <td class="campocaja">
                                    <input readonly="true" type="text" class="campodisabled campo campotexto" id="TPRODUC" name="TPRODUC"
                                    value="${__formdata.OB_IAX_DATPOLIZA.TPRODUC}"/>
                                </td>
                                 <!-- Actividad -->
                                 <axis:ocultar f="${screenName}" c="TACTIVI" dejarHueco="false">
                                <td class="campocaja">
                                    <input readonly="true" type="text" class="campodisabled campo campotexto" id="TACTIVI" name="TACTIVI"
                                    value="${__formdata.TACTIVI}"/>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="${screenName}" c="NPOLIZA" dejarHueco="false">
                                <!-- Numero de poliza -->
                                <td class="campocaja">
                                    <input readonly="true" type="text" class="campodisabled campo campotexto" id="NPOLIZA" name="NPOLIZA" size="15"
                                    value="${__formdata.OB_IAX_DATPOLIZA.NPOLIZA}"/>
                                </td>
                              </axis:ocultar>
                              <axis:ocultar f="${screenName}" c="NCERTIF" dejarHueco="false">
                                <!-- Certificado -->
                                <td class="campocaja" >
                                    <input readonly="true" type="text" class="campodisabled campo campotexto" id="NCERTIF" name="NCERTIF" size="15" style="width:35%;"
                                    value="${__formdata.OB_IAX_DATPOLIZA.NCERTIF}"/>&nbsp;
                                    <%-- BUG 29952/167449 - RCL - 24/02/2014 - Mostramos la linterna --%>
                                    <axis:ocultar f="${screenName}" c="BT_CONS_POLIZA" dejarHueco="false">   
                                        <img border="0" onclick="f_but_polissa();"
                                           alt='<axis:alt c="MENSA" f="${screenName}" lit="102316"/>'
                                           title='<axis:alt c="MENSA" f="${screenName}" lit="102316"/>'
                                           src="images/find.gif"/>
                                    </axis:ocultar>
                                </td>
                                </axis:ocultar>
                                 <!-- Póliza Compañía-->
                                <axis:ocultar f="${screenName}" c="CPOLCIA" dejarHueco="false">      
                                <td class="campocaja">
                                    <input readonly="true" type="text" class="campodisabled campo campotexto" id="NPOLIZA" name="NPOLIZA" size="15"
                                    value="${__formdata.OB_IAX_DATPOLIZA.CPOLCIA}"/>
                                </td>
                                </axis:ocultar>
                                 <!-- Situación -->
                                <td class="campocaja">
                                    <input readonly="true" type="text" class="campodisabled campo campotexto" id="TSITUAC" name="TSITUAC" size="15"
                                    value="${__formdata.OB_IAX_DATPOLIZA.TSITUAC}"/>&nbsp;
                                    
                                </td>
                               
                            </tr>
                            <tr>
                             <!-- fecha efecto-->
                                <td class="titulocaja">
                                    <b><axis:alt c="FEMISIO" f="${screenName}" lit="9903739" /></b>
                                </td>
                                <!-- fecha vencimiento -->
                                 <axis:visible f="${screenName}" c="FVENCIM" >
                                <td class="titulocaja" >
                                    <b><axis:alt c="FVENCIM" f="${screenName}" lit="100885" /></b>
                                </td>
                                 </axis:visible >
                                <!-- Fecha Anulación -->
                                <td class="titulocaja" >
                                    <b><axis:alt c="FANULAC" f="${screenName}" lit="140214"/></b>
                                </td>    
                                <axis:visible f="${screenName}" c="FCARANU">
                                    <td class="titulocaja">
                                        <b><axis:alt f="${screenName}" c="FCARANU" lit="102626"/></b>
                                    </td>
                                </axis:visible>
                                   <axis:visible f="${screenName}" c="CAGENTE">
                                    <td class="titulocaja">
                                        <b><axis:alt f="${screenName}" c="CAGENTE" lit="9000531"/></b>
                                    </td>
                                </axis:visible>
                                
                                 <axis:visible f="${screenName}" c="SUCURSAL">
                                    <td class="titulocaja">
                                        <b><axis:alt f="${screenName}" c="SUCURSAL" lit="9002202"/></b>
                                    </td>
                                </axis:visible>
								
                            </tr>

                            <tr>
                                <!-- fecha efecto-->
                                <td class="campocaja">
                                    <input readonly="true" type="text" class="campodisabled campo campotexto" id="FEMISIO" name="FEMISIO" size="15" style="width:60%;"
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OB_IAX_DATPOLIZA.FEMISIO}"/>"/>
                                </td>
                                <!-- fecha vencimiento -->
                                <axis:visible f="${screenName}" c="FVENCIM" >
                                <td class="campocaja">
                                    <input readonly="true" type="text" class="campodisabled campo campotexto" id="FVENCIM" name="FEVENCIM" size="15" style="width:60%;"
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OB_IAX_DATPOLIZA.FVENCIM}"/>"/>
                                </td>
                                </axis:visible>
                                <!-- Fecha Anulación -->
                                <td class="campocaja">
                                    <input readonly="true" type="text" class="campodisabled campo campotexto" id="FVENCIM" name="FEVENCIM" size="15" style="width:60%;"
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OB_IAX_DATPOLIZA.FANULAC}"/>"/>
                                </td>
                                <!-- Fecha renovacion anual -->
                                <axis:visible f="${screenName}" c="FCARANU">
                                    <td class="campocaja">
                                        <input type="text" tabindex="7" class="campodisabled campo campotexto" id="FCARANU" name="FCARANU" onfocus="pasarAlSiguiente(this)" size="15" style="width:60%"
                                        value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.OB_IAX_DATPOLIZA.FCARANU}'/>" <axis:atr f="${screenName}" c="FCARANU" a="modificable=false"/> />
                                    </td>
                                </axis:visible>
                                
                                  <!-- AGENTE  BUG 7413 AB-->
                                <td class="campocaja">
                                    <input readonly="true" type="text" class="campodisabled campo campotexto" id="CAGENTE" name="CAGENTE" size="15"
                                    value="${__formdata.OB_IAX_DATPOLIZA.CAGENTE}"/>&nbsp;
                                </td>
                                
                                  <td class="campocaja">
                                    <input readonly="true" type="text" class="campodisabled campo campotexto" id="SUCURSAL" name="SUCURSAL" size="15"
                                    value="${__formdata.OB_IAX_DATPOLIZA.SUCURSAL}"/>&nbsp;
                                </td>
                                
                               	</tr>	
                               	<tr>
                                
                                <axis:visible f="${screenName}" c="SUCURFAC">
                                    <td class="titulocaja">
                                        <b><axis:alt f="${screenName}" c="SUCURFAC" lit="89908083"/></b>
                                    </td>
                                </axis:visible>
								
                                </tr>						
								<tr> 
								 <td class="campocaja">
                                    <input readonly="true" type="text" class="campodisabled campo campotexto" id="SUCURFAC" name="SUCURFAC" size="15"
                                    value="${__formdata.OB_IAX_DATPOLIZA.SUCURFAC}"/>&nbsp;
                                </td>
								</tr>
								 
													
                                <tr><td><div class="separador">&nbsp;</div></td></tr>
                                
                                <tr tabindex="9" onfocus="pasarAlSiguiente(this)">
                                <td class="campocaja" colspan="8">
                                    <!-- DisplayTag Tomadores -->
									<b id="label_DSP_TOMADORES"><axis:alt c="DSP_TOMADORES" f="${pantalla}" lit="1000275"/></b>
	                                <div class="displayspace">
                                    <c:set var="title1"><axis:alt c="TNOMBRE" f="${screenName}" lit="1000181" /></c:set>
                                    <c:set var="title2"><axis:alt  f="${screenName}" c="ASSEGURADOS" lit="100899" /></c:set>
                                	<c:set var="title3"><axis:alt f="${screenName}" c="TTIPIDE" lit="109774"></axis:alt></c:set>
                                	<c:set var="title4"><axis:alt f="${screenName}" c="NNUMIDE" lit="105330"></axis:alt></c:set>
                                
                                      <display:table name="${__formdata.T_IAX_TOMADORES}" id="miListaId" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                       requestURI="axis_axissin006.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        
                                        <display:column title="${title2}" sortable="true" style="width:10%;" sortProperty="OB_IAX_TOMADORES.TNOMBRE" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspText">${miListaId.OB_IAX_TOMADORES.NORDTOM}</div>
                                        </display:column>
                                        
                                        <display:column title="${title3}" sortable="true" style="width:15%;" sortProperty="OB_IAX_TOMADORES.TTIPIDE" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspText">${miListaId.OB_IAX_TOMADORES.TTIPIDE}</div>
                                        </display:column>
                                        
                                        <display:column title="${title4}" sortable="true" style="width:15%;" sortProperty="OB_IAX_TOMADORES.NNUMIDE" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspText">${miListaId.OB_IAX_TOMADORES.NNUMIDE}</div>
                                        </display:column>
                                        
                                        
                                        <display:column title="${title1}" sortable="true" style="width:35%;" sortProperty="OB_IAX_TOMADORES.TNOMBRE" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspText">${miListaId.OB_IAX_TOMADORES.TNOMBRE} ${miListaId.OB_IAX_TOMADORES.TAPELLI1} ${miListaId.OB_IAX_TOMADORES.TAPELLI2}</div>
                                        </display:column>
                                        
                                        
		                                <axis:visible f="${screenName}" c="BT_CONSUL_TOM"> 
		                                    <display:column title="Consultar" headerClass="headwidth5 sortable" media="html" autolink="false" >
		                                    <div class="dspIcons">
		                                        <img id="find" border="0" src="images/find.gif" onclick="javascript:f_consultar_persona('${miListaId.OB_IAX_TOMADORES.SPERSON}',document.miForm.NSINIES.value);" style="cursor:pointer"/>
		                                                                                                                     
		                                    </div>
		                                     </display:column>  
		                                </axis:visible>
                           
                                    </display:table>
                                    </div>
                                </td>
                            </tr>
                            
                                    
                            <tr tabindex="9" onfocus="pasarAlSiguiente(this)">
                            <td class="campocaja" colspan="8">
                            
                            <axis:visible f="axissin032" c="DSP_ASEGURADOS">
								<b id="label_DSP_ASEGURADOS"><axis:alt c="DSP_ASEGURADOS" f="${pantalla}" lit="1000274"/></b>
                                <div class="displayspace">
                                <c:set var="title0"><axis:alt f="axissin032" c="TTIPIDE" lit="109774"></axis:alt></c:set>
                                <c:set var="title1"><axis:alt f="axissin032" c="NNUMIDE" lit="105330"></axis:alt></c:set>
                                <c:set var="title2"><axis:alt f="axissin032" c="TNOMBRE" lit="105940"></axis:alt></c:set> 
                                <c:set var="title8"><axis:alt  f="axissin032" c="ASSEGURADOS" lit="100899" /></c:set>
                                
                                <display:table name="${__formdata.RIESGOASE}"
                                               id="PROPIETARIO"
                                               export="false"
                                               class="dsptgtable"
                                               pagesize="-1" sort="list"
                                               cellpadding="0"
                                               cellspacing="0"
                                               requestURI="axis_axissin006.do?paginar=true">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    
                                     <display:column title="${title8}" 
                                                    style="width:10%"
                                                    sortable="true"
                                                    sortProperty="OB_IAX_ASEGURADOS.TTIPIDE"
                                                    headerClass="headwidth5 sortable"
                                                    media="html" 
                                                    autolink="false">
                                         <div class="dspText">
                                            ${PROPIETARIO.OB_IAX_ASEGURADOS.NORDEN}
                                        </div>
                                    </display:column>
                                    
                                    
                                    <display:column title="${title0}" 
                                                    style="width:15%"
                                                    sortable="true"
                                                    sortProperty="OB_IAX_ASEGURADOS.TTIPIDE"
                                                    headerClass="headwidth5 sortable"
                                                    media="html" 
                                                    autolink="false">
                                         <div class="dspText">
                                            ${PROPIETARIO.OB_IAX_ASEGURADOS.TTIPIDE}
                                        </div>
                                    </display:column>
                                    
                                    <display:column title="${title1}" 
                                                    style="width:15%"
                                                    sortable="true"
                                                    sortProperty="OB_IAX_ASEGURADOS.NNUMIDE"
                                                    headerClass="headwidth5 sortable"
                                                    media="html"
                                                    autolink="false">                                            
                                        <div class="dspText">
                                            ${PROPIETARIO.OB_IAX_ASEGURADOS.NNUMIDE}
                                        </div>
                                    </display:column>
                                    
                                    <display:column title="${title2}" 
                                                    style="width:35%"
                                                    sortable="true"
                                                    sortProperty="OB_IAX_ASEGURADOS.TNOMBRE"
                                                    headerClass="headwidth5 sortable"
                                                    media="html"
                                                    autolink="false">                                            
                                        <div class="dspText">
                                            ${PROPIETARIO.OB_IAX_ASEGURADOS.TNOMBRE} 
                                            ${PROPIETARIO.OB_IAX_ASEGURADOS.TAPELLI1} 
                                            ${PROPIETARIO.OB_IAX_ASEGURADOS.TAPELLI2} 
                                        </div>
                                    </display:column>
                                </display:table>
                                </div>
                            </axis:visible>
                            </td>                                    
                            </tr>
                            <!-- *************************************   ASEGURADOS ***************************************** -->
                             <tr>
                              <axis:visible f="${screenName}" c="ASSEGURADOS" >
                               <td colspan="8" class="titulocaja">
                                <c:set var="title0"><axis:alt  f="${screenName}" c="ASSEGURADOS" lit="100645" /></c:set>
                                <c:set var="title1"><axis:alt  f="${screenName}" c="ASSEGURADOS" lit="100899" /></c:set>
                                <div class="separador">&nbsp;</div>
                                <div class="displayspace">
                                <display:table name="${axisctr_asegurados}" id="lista" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                requestURI="axis_axissin006.do?paginar=true">
                                <%@ include file="../include/displaytag.jsp"%>
                                    
                                    <display:column title="${title1}" sortable="true" sortProperty="NOMBRE" headerClass="sortable" media="html" autolink="false" >
                                    <div class="dspText">${lista.OB_IAX_ASEGURADOS.NORDEN} </div>
                                    </display:column>
                                    
                                    
                                    <display:column title="${title0}" sortable="true" sortProperty="NOMBRE" headerClass="sortable" media="html" autolink="false" >
                                    <div class="dspText">${lista.OB_IAX_ASEGURADOS.TNOMBRE} ${lista.OB_IAX_ASEGURADOS.TAPELLI1} ${lista.OB_IAX_ASEGURADOS.TAPELLI2}</div>
                                    </display:column>
                                 
                                
                                    </div>
                                     <axis:visible f="${screenName}" c="BT_CONSUL_ASE"> 
                                    <display:column title="Consultar" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                    <div class="dspIcons">
                                        <img id="find" border="0" src="images/find.gif" onclick="javascript:f_consultar_persona('${lista.OB_IAX_ASEGURADOS.SPERSON}',document.miForm.NSINIES.value);" style="cursor:pointer"/>
                                                                                                                     
                                    </div>
                                   </display:column>  
                                </axis:visible>
                             
                               </display:table>
                                    </td>
                                    </axis:visible>
                             </tr>
                             
                              <!-- ************************************** FIN  ASEGURADOS ************************************** -->
                            </table>
            </table>
                         <axis:visible f="axissin006" c="DSP_AVISOS">
                         <c:if test="${!empty __formdata.PLSTAVISOS}">
           <div class="separador">&nbsp;</div>
            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin006" c="TIT_AVISOS" lit="700145" /></div>
                <c:import url="axissin006_avisos.jsp"/>
                	 </c:if>
               </axis:visible>
             
</form>
