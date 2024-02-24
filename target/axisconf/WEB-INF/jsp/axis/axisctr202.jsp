<%/* Revision:# 0urqFsY0t929IkcyJ/02FA== # */%>


<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axisctr202" c="NOMFORM" lit=""/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">

        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">
        
            
            function f_but_salir() {
                //Esborrem les vars de session
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr202", "cancelar", document.miForm, "_self");
            }
            
            function f_but_buscar(TPERSONA,TIDENTIFICACION,NIDENTIFICACION,NOMBREPER,CLASELISTA,TIPOLISTA,
                                  FINCLUDESDE,FINCLUHASTA,FEXCLUDESDE,FEXCLUHASTA,FNACIMI){
                                  
                document.miForm.CTIPPER.value = TPERSONA;
                document.miForm.CTIPIDE.value = TIDENTIFICACION; 
                document.miForm.NNUMIDE.value = NIDENTIFICACION; 
                document.miForm.TNOMAPE.value = NOMBREPER; 
                document.miForm.CCLALIS.value = CLASELISTA; 
                document.miForm.CTIPLIS.value = TIPOLISTA; 
                document.miForm.FINCLUSDESDE.value = FINCLUDESDE; 
                document.miForm.FINCLUSHASTA.value = FINCLUHASTA; 
                document.miForm.FEXCLUSDESDE.value = FEXCLUDESDE; 
                document.miForm.FEXCLUSHASTA.value = FEXCLUHASTA; 
                document.miForm.FNACIMI.value = FNACIMI;
                
                objUtiles.ejecutarFormulario ("axis_axisctr202.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_abrir_axisctr201(){
                document.miForm.CTIPPER.value = null;
                document.miForm.CTIPIDE.value = null; 
                document.miForm.NNUMIDE.value = null; 
                document.miForm.TNOMAPE.value = null; 
                document.miForm.CCLALIS.value = null; 
                document.miForm.CTIPLIS.value = null; 
                document.miForm.FINCLUSDESDE.value = null; 
                document.miForm.FINCLUSHASTA.value = null; 
                document.miForm.FEXCLUSDESDE.value = null; 
                document.miForm.FEXCLUSHASTA.value = null; 
                document.miForm.PSPERLRE_OUT.value = null;
                objUtiles.abrirModal("axisctr201", "src", "modal_axisctr201.do?operation=form"); 
            }
            
            function f_cerrar_axisctr201(){
                objUtiles.cerrarModal("axisctr201");
            }
            
            function f_abrir_axisctr203(SPERLRE,MODO){
                objUtiles.abrirModal("axisctr203", "src", "modal_axisctr203.do?operation=form&SPERLRE="+SPERLRE+"&CMODO="+MODO); 
            }
            
            function f_cerrar_axisctr203(){
                objUtiles.cerrarModal("axisctr203");
                
            }
            
            function f_aceptar_axisctr203(){
                objUtiles.cerrarModal("axisctr203");
                objUtiles.ejecutarFormulario ("axis_axisctr202.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_consultar_persona(SPERSON){
                objUtiles.ejecutarFormulario("axis_axisctr202.do?SPERSON_CON="+SPERSON, "consulta_persona", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            function f_onload(){
                f_cargar_propiedades_pantalla();
                <c:if test="${empty listasRes}">
                     f_abrir_axisctr201();
                </c:if>
            }
            
            function mostrar(nombreCapa){ 
            //alert(nombreCapa);
            document.getElementById(nombreCapa).style.visibility="visible"; 
            } 
            
            function ocultar(nombreCapa){ 
            //alert(nombreCapa);
            document.getElementById(nombreCapa).style.visibility="hidden"; 
            } 
            
        </script>
        
    </head>
    
    <body onload="f_onload()">
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisctr201" c="TIT_002" lit="9904437" /></c:param>
            <c:param name="nid" value="axisctr201" />
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisctr203" c="TIT_003" lit="9904438" /></c:param>
            <c:param name="nid" value="axisctr203" />
        </c:import>
        
        <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">
    
        <input type="hidden" id="operation" name="operation" value="${__formdata.operation}"/>
        <input type="hidden" id="CTIPPER" name="CTIPPER" value="${__formdata.CTIPPER}"/>
        <input type="hidden" id="CTIPIDE" name="CTIPIDE" value="${__formdata.CTIPIDE}"/>
        <input type="hidden" id="NNUMIDE" name="NNUMIDE" value="${__formdata.NNUMIDE}"/>
        <input type="hidden" id="TNOMAPE" name="TNOMAPE" value="${__formdata.TNOMAPE}"/>
        <input type="hidden" id="CCLALIS" name="CCLALIS" value="${__formdata.CCLALIS}"/>
        <input type="hidden" id="CTIPLIS" name="CTIPLIS" value="${__formdata.CTIPLIS}"/>
        <input type="hidden" id="FINCLUSDESDE" name="FINCLUSDESDE" value="${__formdata.FINCLUSDESDE}"/>
        <input type="hidden" id="FINCLUSHASTA" name="FINCLUSHASTA" value="${__formdata.FINCLUSHASTA}"/>
        <input type="hidden" id="FEXCLUSDESDE" name="FEXCLUSDESDE" value="${__formdata.FEXCLUSDESDE}"/>
        <input type="hidden" id="FEXCLUSHASTA" name="FEXCLUSHASTA" value="${__formdata.FEXCLUSHASTA}"/>
        <input type="hidden" id="PSPERLRE_OUT" name="PSPERLRE_OUT" value="${__formdata.PSPERLRE_OUT}"/>
        <input type="hidden" id="FNACIMI" name="FNACIMI" value="${__formdata.FNACIMI}"/>
  
    <c:set var="pantalla" value="axisctr202"/>
    <c:set var="literalPantalla" value="9904429"/>
    <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt c="TITULO" f="axisctr202" lit="9904429"/></c:param>
            <c:param name="formulario"><axis:alt f="axisctr202" c="TITPANT" lit="${literalPantalla}"/></c:param>
            <c:param name="form">${pantalla}</c:param>
    </c:import>
   
        
    <table class="mainTableDimensions base"  align="center" cellpadding="0" cellspacing="0"> 
       <tr>
            <td>
                    <table class="seccion">
                        <tr>
                            <td align="left" >
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:15%;height:0%;"/>
                                        <th style="width:15%;height:0%;"/>
                                        <th style="width:15%;height:0%;"/>
                                        <th style="width:15%;height:0%;"/>
                                        <th style="width:15%;height:0%;"/>
                                        <th style="width:15%;height:0%;"/>
                                        <th style="width:15%;height:0%;"/>
                                        <th style="width:10%;height:0%;"/>
                                    </tr>
                                    <tr>
                                        <td colspan="7">
                                            
                                            <div class="titulo" >
											  <axis:visible f="axisctr202" c="BT_FIND">
                                            	<div style="float:left">
                                                <img src="images/flecha.gif"/>
                                                <axis:alt f="axisctr202" c="FIND" lit="9904429"/>
                                                <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisctr201()" style="cursor:pointer"/>
                                              </div>
											  </axis:visible>
											  <axis:visible f="axisctr202" c="BT_NEW">
                                                <div style="float:right">
                                                <img id="new" border="0" src="images/new.gif" title="<axis:alt f="axisctr202" c="NEW" lit="1000428"/>" 
                                                    alt="<axis:alt f="axisctr202" c="NEW" lit="1000428"/>"  onclick="f_abrir_axisctr203(null,'NEW')" style="cursor:pointer"/>
                                            		</div>
                                              </axis:visible>
                                            </div>
                                            <div class="separador">&nbsp;</div>
                                            <c:set var="title1"><axis:alt f="axisctr202" c="TCLALIS" lit="9904431"/></c:set>
                                            <c:set var="title2"><axis:alt f="axisctr202" c="TTIPLIS" lit="9904432"/></c:set>
                                            <c:set var="title3"><axis:alt f="axisctr202" c="TTIPPER" lit="102844"/></c:set>
                                            <c:set var="title4"><axis:alt f="axisctr202" c="TTIPIDE" lit="9904433"/></c:set>
                                            <c:set var="title5"><axis:alt f="axisctr202" c="NNUMIDE" lit="9904434"/></c:set>
                                            <c:set var="title6"><axis:alt f="axisctr202" c="NOMBREPER" lit="105940"/></c:set>
                                            <c:set var="title7"><axis:alt f="axisctr202" c="FINCLUSION" lit="9902640"/></c:set>
                                            <c:set var="title8"><axis:alt f="axisctr202" c="FEXCLUSION" lit="9902639"/></c:set>
                                            <c:set var="title9"><axis:alt f="axisctr202" c="FMOVIMIENTO" lit="101006"/></c:set>
                                            <c:set var="title11"><axis:alt f="axisctr202" c="CUSUMOD" lit="100894"/></c:set>
                                            <c:set var="title12"><axis:alt f="axisctr202" c="LIT_NPOLIZA" lit="100624"/></c:set><!-- Numero póliza -->
                                            <c:set var="title13"><axis:alt f="axisctr202" c="LIT_NSINIES" lit="800279"/></c:set><!-- Numero siniestro -->
                                            <c:set var="title14"><axis:alt f="axisctr202" c="LIT_NRECIBO" lit="111838"/></c:set><!-- Numero recibo -->
                                            <c:set var="title15"><axis:alt f="axisctr202" c="LIT_TDESCRIP" lit="100588"/></c:set><!-- Numero recibo -->
                                            <axis:visible c="FNACIMI" f="axisctr202">     
                                               <c:set var="title10"><axis:alt f="axisctr202" c="FNACIMI" lit="1000064"/></c:set>
                                            </axis:visible>
                                            <div class="displayspaceMaximo">
                                               
                                                 <display:table name="${listasRes}" id="miListaId" export="false" class="dsptgtable" pagesize="10"  requestURI="axis_axisctr202.do?paginar=true"  sort="list" cellpadding="0" cellspacing="0">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title1}" sortable="true" sortProperty="TCLALIS" headerClass="sortable"  media="html"  >
                                                        <div class="dspText">${miListaId.TCLALIS}</div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="TTIPLIS" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.TTIPLIS}</div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true" sortProperty="TTIPPER" headerClass="sortable"  media="html" autolink="false" >
                                                       <div class="dspText">${miListaId.TTIPPER}</div>
                                                    </display:column>
                                                    <display:column title="${title4}" sortable="true" sortProperty="TTIPIDE" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.TTIPIDE}</div>
                                                    </display:column>
                                                    <display:column title="${title5}" sortable="true" sortProperty="NNUMIDE" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.NNUMIDE}</div>
                                                    </display:column>
                                                    <display:column title="${title6}" sortable="true" sortProperty="TNOMBRE" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.TNOMAPE}</div><!-- Bug 34406/211949 ACL -->
                                                    </display:column>
                                                    <display:column title="${title7}" sortable="true" sortProperty="FINCLUS" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FINCLUS}"/></div>
                                                    </display:column>
                                                    <display:column title="${title8}" sortable="true" sortProperty="FEXCLUS" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FEXCLUS}"/></div>
                                                    </display:column>
                                                    <display:column title="${title9}" sortable="true" sortProperty="FMODIFI" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FMODIFI}"/></div>
                                                    </display:column>
                                                    <axis:visible c="FNACIMI" f="axisctr202">              
                                                        <display:column title="${title10}" sortable="true" sortProperty="FNACIMI" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FNACIMI}"/></div>
                                                        </display:column>
                                                    </axis:visible>             
                                                    <display:column title="${title11}" sortable="true" sortProperty="CUSUMOD" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.CUSUMOD}</div>
                                                    </display:column>
													 <axis:visible f="axisctr202" c="BT_CONSULPER">
                                                    <display:column title="" sortable="false"  headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                        <c:if test="${!empty miListaId.SPERSON}">
                                                        <div class="dspIcons"><img border="0" alt="<axis:alt f="axisctr202" c="NOVVIG2" lit="9901307"/>" title1="<axis:alt f="axisctr202" c="NOVVIG2" lit="9901307"/>" src="images/find.gif" 
                                                        style="cursor:pointer;" onclick="javascript:f_consultar_persona('${miListaId.SPERSON}');"/></div>
                                                        </c:if>
                                                     </display:column>
													 </axis:visible>
													 <axis:visible f="axisctr202" c="BT_MODIF">
                                                     <display:column title="" sortable="false"  headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                       <c:if test="${miListaId.CCLALIS == 2}">
                                                        <div class="dspIcons"><img border="0" alt="<axis:alt f="axisctr202" c="NOVVIG2" lit="9901307"/>" title1="<axis:alt f="axisctr202" c="NOVVIG2" lit="9901307"/>" src="images/lapiz.gif" 
                                                        style="cursor:pointer;" onclick="javascript:f_abrir_axisctr203('${miListaId.SPERLRE}','MODIF')"/></div>
                                                       </c:if> 
                                                     </display:column>
													 </axis:visible>
                                                     <axis:visible f="axisctr202" c="BT_MASDATOS">
                                                        <display:column title="" sortable="true" sortProperty="" headerClass="sortable" media="html" style="width:5%" autolink="false" >
                                                            <div class="dspIcons">
                                                                <img border="0" alt="<axis:alt c="BT_MASDATOS_AGENDA" f="axisctr202" lit="1000113"/>" title1="<axis:alt c="BT_MASDATOS_AGENDA" f="axisctr202" lit="1000113"/>" src="images/mes.gif" width="11px" height="11px"
                                                                    style="cursor:pointer;"  onmouseout="javascript:ocultar('SECCION_A${miListaId['SPERLRE']}')"  onmouseover="javascript:mostrar('SECCION_A${miListaId['SPERLRE']}')"  /></div>
                                                        </display:column>   
                                                    </axis:visible>
                                                    
                                                     <!-- *************************** SECCION MÁS DATOS ********************************* -->
                                
                                				
													<c:set var="seccionInfoClass" value="seccion_informacion"/>
													 <axis:visible f="axisctr202" c="TDESCRIP">
                                                    	<c:set var="seccionInfoClass" value="seccion_informacion2"/>
                                                    </axis:visible>	
                                                    
                                               		<display:column class="${seccionInfoClass}">
                                               		
                                                        <div id="SECCION_A${miListaId['SPERLRE']}" class="${seccionInfoClass}" >
                                                        <!-- INICIO SECCION -->
                                                        <table class="area" align="center">
                                                            <tr>
                                                                <th style="width:33%;height:0px"></th>
                                                                <th style="width:33%;height:0px"></th>
                                                                <th style="width:34%;height:0px"></th>
                                                            </tr>
                                                            <tr>
                                                                <%-- Campo 1 --%>
                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                    <b>${title11}</b>
                                                                </td>
                                                                
                                                            </tr>
                                                            <tr>
                                                                <axis:visible f="axisctr202" c="ACCION">
                                                                <%-- Campo 1 --%>
                                                                  <td class="campocaja" colspan="2" style="background-color:white;border-right-width: 0px;">
                                                                    <input type="text" class="campo campotexto" id="CUSUARI_MD" name="CUSUARI_MD" size="15" style="width:90%"
                                                                    value="${miListaId['TTIPOCACCION']}" readonly="readonly"/>
                                                                  
                                                                  </td>
                                                                </axis:visible>
                                                            </tr>
                                                            <tr>
                                                                <%-- Campo 1 --%>
                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                    <b>${title12}</b>
                                                                </td>
                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                    <b>${title13}</b>
                                                                </td>
                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                    <b>${title14}</b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <axis:visible f="axisctr202" c="NPOLIZA">
                                                                <%-- Campo 1 --%>
                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                    <input type="text" class="campo campotexto" id="NPOLIZA__" name="NPOLIZA__" size="15" style="width:90%"
                                                                            value="${miListaId['NPOLIZA']}" readonly="readonly"/>
                                                                </td>
                                                                </axis:visible>
                                                                <axis:visible f="axisctr202" c="NSINIES">
                                                                <%-- Campo 1 --%>
                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                    <input type="text" class="campo campotexto" id="NSINIES__" name="NSINIES__" size="15" style="width:90%"
                                                                            value="${miListaId['NSINIES']}" readonly="readonly"/>
                                                                </td>
                                                                </axis:visible>
                                                                <axis:visible f="axisctr202" c="NRECIBO">
                                                                <%-- Campo 1 --%>
                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                    <input type="text" class="campo campotexto" id="NRECIBO__" name="NRECIBO__" size="15" style="width:90%"
                                                                            value="${miListaId['NRECIBO']}" readonly="readonly"/>
                                                                </td>
                                                                </axis:visible>                                                             
                                                            </tr>
                                                            
                                                            
                                                            <tr>
																<axis:visible f="axisctr202" c="TDESCRIP">
                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                    <b>${title15}</b>
                                                                </td>   
																</axis:visible>   																
                                                            </tr>
                                                            <tr>
																<axis:visible f="axisctr202" c="TDESCRIP">
                                                                <td class="campocaja" colspan="3" style="background-color:white;border-right-width: 0px;">
                                                                  <textarea id="TDESCRIP" name="TDESCRIP"  rows="25" cols="50" class="campo campotexto" readonly>${miListaId['TDESCRIP']}</textarea>    
                                                                </td>  
																</axis:visible>																
                                                            </tr>   
                                                                                                                 
                                                        </table>
                                                    </div>
                                                </display:column>
                                            </display:table>
                                        </div>	
                                        </td>
                                    </tr>    
                                    <tr>
                                        <td>
                                            <div class="separador">&nbsp;</div>
                                            <div class="separador">&nbsp;</div>
                                        </td>
                                    </tr>
                                    
                                </table>
                            </td>
                        </tr>
                    </table>
            </td>
        </tr>    
    </table>
         
<div class="separador">&nbsp;</div>
<!-- Botonera -->
<c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr202</c:param>
    <c:param name="__botones">salir</c:param>
</c:import>

</form>

<c:import url="../include/mensajes.jsp" />
    
</body>
</html>

