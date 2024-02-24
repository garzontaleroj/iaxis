

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
        <title><axis:alt f="axisctr211" c="NOMFORM" lit=""/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">

        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">
        
            
            function f_but_salir() {
                //Esborrem les vars de session
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr211", "cancelar", document.miForm, "_self");
            }
            
            function f_but_buscar(CMATRIC,CODMOTOR,CCHASIS,NBASTID,CLASELISTA,TIPOLISTA,
                               FINCLUDESDE,FINCLUHASTA,FEXCLUDESDE,FEXCLUHASTA){
                                  
                document.miForm.CMATRIC.value = CMATRIC;
                document.miForm.CODMOTOR.value = CODMOTOR; 
                document.miForm.CCHASIS.value = CCHASIS; 
                document.miForm.NBASTID.value = NBASTID; 
                document.miForm.CCLALIS.value = CLASELISTA; 
                document.miForm.CTIPLIS.value = TIPOLISTA; 
                document.miForm.FINCLUSDESDE.value = FINCLUDESDE; 
                document.miForm.FINCLUSHASTA.value = FINCLUHASTA; 
                document.miForm.FEXCLUSDESDE.value = FEXCLUDESDE; 
                document.miForm.FEXCLUSHASTA.value = FEXCLUHASTA; 
                
                objUtiles.ejecutarFormulario ("axis_axisctr211.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_abrir_axisctr210(){
                document.miForm.CMATRIC.value = null;
                document.miForm.CODMOTOR.value = null; 
                document.miForm.CCHASIS.value = null; 
                document.miForm.NBASTID.value = null; 
                document.miForm.CCLALIS.value = null; 
                document.miForm.CTIPLIS.value = null; 
                document.miForm.FINCLUSDESDE.value = null; 
                document.miForm.FINCLUSHASTA.value = null; 
                document.miForm.FEXCLUSDESDE.value = null; 
                document.miForm.FEXCLUSHASTA.value = null; 
                objUtiles.abrirModal("axisctr210", "src", "modal_axisctr210.do?operation=form"); 
            }
            
            function f_cerrar_axisctr210(){
                objUtiles.cerrarModal("axisctr210");
            }
            
            function f_abrir_axisctr212(SMATRICLRE,MODO){
                objUtiles.abrirModal("axisctr212", "src", "modal_axisctr212.do?operation=form&SMATRICLRE="+SMATRICLRE+"&CMODO="+MODO); 
            }
            
            function f_cerrar_axisctr212(){
                objUtiles.cerrarModal("axisctr212");
                
            }
            
            function f_aceptar_axisctr212(PSMATRICLRE_OUT){
                objUtiles.cerrarModal("axisctr212");
                document.miForm.CMATRIC.value = null;
                document.miForm.CODMOTOR.value = null; 
                document.miForm.CCHASIS.value = null; 
                document.miForm.NBASTID.value = null; 
                document.miForm.CCLALIS.value = null; 
                document.miForm.CTIPLIS.value = null; 
                document.miForm.FINCLUSDESDE.value = null; 
                document.miForm.FINCLUSHASTA.value = null; 
                document.miForm.FEXCLUSDESDE.value = null; 
                document.miForm.FEXCLUSHASTA.value = null; 
                document.miForm.PSMATRICLRE_OUT.value = PSMATRICLRE_OUT
                objUtiles.ejecutarFormulario ("axis_axisctr211.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
           
            function f_onload(){
                f_cargar_propiedades_pantalla();
                <c:if test="${empty listasRes}">
                     f_abrir_axisctr210();
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
            <c:param name="titulo"><axis:alt f="axisctr210" c="TIT_002" lit="9905978" /></c:param>
            <c:param name="nid" value="axisctr210" />
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisctr212" c="TIT_003" lit="9905977" /></c:param>
            <c:param name="nid" value="axisctr212" />
        </c:import>
        
        <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">
        <input type="hidden" id="operation" name="operation" value="${__formdata.operation}"/>
        <input type="hidden" id="CMATRIC" name="CMATRIC" value="${__formdata.CMATRIC}"/>
        <input type="hidden" id="CODMOTOR" name="CODMOTOR" value="${__formdata.CODMOTOR}"/>
        <input type="hidden" id="CCHASIS" name="CCHASIS" value="${__formdata.CCHASIS}"/>
        <input type="hidden" id="NBASTID" name="TNOMAPE" value="${__formdata.NBASTID}"/>
        <input type="hidden" id="CCLALIS" name="CCLALIS" value="${__formdata.CCLALIS}"/>
        <input type="hidden" id="CTIPLIS" name="CTIPLIS" value="${__formdata.CTIPLIS}"/>
        <input type="hidden" id="FINCLUSDESDE" name="FINCLUSDESDE" value="${__formdata.FINCLUSDESDE}"/>
        <input type="hidden" id="FINCLUSHASTA" name="FINCLUSHASTA" value="${__formdata.FINCLUSHASTA}"/>
        <input type="hidden" id="FEXCLUSDESDE" name="FEXCLUSDESDE" value="${__formdata.FEXCLUSDESDE}"/>
        <input type="hidden" id="FEXCLUSHASTA" name="FEXCLUSHASTA" value="${__formdata.FEXCLUSHASTA}"/>
        <input type="hidden" id="PSMATRICLRE_OUT" name="PSMATRICLRE_OUT" value="${__formdata.PSMATRICLRE_OUT}"/>
        
  
    <c:set var="pantalla" value="axisctr211"/>
    <c:set var="literalPantalla" value="9905964"/>
    <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt c="TITULO" f="axisctr211" lit="9905964"/></c:param>
            <c:param name="formulario"><axis:alt f="axisctr210" c="TITPANT" lit="${literalPantalla}"/></c:param>
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
                                        <th style="width:10%;height:0%;"/>
                                    </tr>
                                    <tr>
                                        <td colspan="7">
                                            
                                            <div class="titulo" >
                                            	<div style="float:left">
                                                <img src="images/flecha.gif"/>
                                                <axis:alt f="axisctr211" c="FIND" lit="9905964"/>
                                                <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisctr210()" style="cursor:pointer"/>
                                              </div>
                                                <div style="float:right">
                                                <img id="new" border="0" src="images/new.gif" title="<axis:alt f="axisctr211" c="NEW" lit="1000428"/>" 
                                                    alt="<axis:alt f="axisctr211" c="NEW" lit="1000428"/>"  onclick="f_abrir_axisctr212(null,'NEW')" style="cursor:pointer"/>
                                            		</div>
                                            </div>
                                            
                                            <div class="separador">&nbsp;</div>
                                            <c:set var="title1"><axis:alt f="axisctr211" c="TCLALIS" lit="9904431"/></c:set>
                                            <c:set var="title2"><axis:alt f="axisctr211" c="TTIPLIS" lit="9904432"/></c:set>
                                            <c:set var="title3"><axis:alt f="axisctr211" c="CMATRIC" lit="9001057"/></c:set>
                                            <c:set var="title4"><axis:alt f="axisctr211" c="CODMOTOR" lit="9904654"/></c:set>
                                            <c:set var="title5"><axis:alt f="axisctr211" c="CCHASIS" lit="9904655"/></c:set>
                                            <c:set var="title6"><axis:alt f="axisctr211" c="NBASTID" lit="9001061"/></c:set>
                                            <c:set var="title7"><axis:alt f="axisctr211" c="FINCLUSION" lit="9902640"/></c:set>
                                            <c:set var="title8"><axis:alt f="axisctr211" c="FEXCLUSION" lit="9902639"/></c:set>
                                            <c:set var="title9"><axis:alt f="axisctr211" c="FMOVIMIENTO" lit="101006"/></c:set>
                                            <c:set var="title10"><axis:alt f="axisctr211" c="CUSUMOD" lit="100894"/></c:set>
                                            <c:set var="title11"><axis:alt f="axisctr202" c="LIT_ACCION" lit="9000844"/></c:set><!-- Acción -->
                                            <c:set var="title12"><axis:alt f="axisctr202" c="LIT_NPOLIZA" lit="100624"/></c:set><!-- Numero póliza -->
                                            <c:set var="title13"><axis:alt f="axisctr202" c="LIT_NSINIES" lit="800279"/></c:set><!-- Numero siniestro -->
                                            <c:set var="title14"><axis:alt f="axisctr202" c="LIT_NRECIBO" lit="111838"/></c:set><!-- Numero recibo -->
                                            
                                            <div class="displayspaceMaximo">
                                               
                                                 <display:table name="${listasRes}" id="miListaId" export="false" class="dsptgtable" pagesize="10"  requestURI="axis_axisctr211.do?paginar=true"  sort="list" cellpadding="0" cellspacing="0">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title1}" sortable="true" sortProperty="TCLALIS" headerClass="sortable"  media="html"  >
                                                        <div class="dspText">${miListaId.TCLALIS}</div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="TTIPLIS" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.TTIPLIS}</div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true" sortProperty="CMATRIC" headerClass="sortable"  media="html" autolink="false" >
                                                       <div class="dspText">${miListaId.CMATRIC}</div>
                                                    </display:column>
                                                    <display:column title="${title4}" sortable="true" sortProperty="CODMOTOR" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.CODMOTOR}</div>
                                                    </display:column>
                                                    <display:column title="${title5}" sortable="true" sortProperty="CCHASIS" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.CCHASIS}</div>
                                                    </display:column>
                                                    <display:column title="${title6}" sortable="true" sortProperty="NBASTID" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.NBASTID}</div>
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
                                                    <display:column title="${title10}" sortable="true" sortProperty="NNUMIDE" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.CUSUMOD}</div>
                                                    </display:column>
                                                     <display:column title="" sortable="false"  headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                       <c:if test="${miListaId.CCLALIS == 2}">
                                                        <div class="dspIcons"><img border="0" alt="<axis:alt f="axisctr211" c="NOVVIG2" lit="9000552"/>" title1="<axis:alt f="axisctr211" c="NOVVIG2" lit="9000552"/>" src="images/lapiz.gif" 
                                                        style="cursor:pointer;" onclick="javascript:f_abrir_axisctr212('${miListaId.SMATRICLRE}','MODIF')"/></div>
                                                       </c:if> 
                                                     </display:column>
                                                     
                                                     <axis:visible f="axisctr211" c="BT_MASDATOS">
                                                        <display:column title="" sortable="true" sortProperty="" headerClass="sortable" media="html" style="width:5%" autolink="false" >
                                                            <div class="dspIcons">
                                                                <img border="0" alt="<axis:alt c="BT_MASDATOS_AGENDA" f="axisctr202" lit="1000113"/>" title1="<axis:alt c="BT_MASDATOS_AGENDA" f="axisctr202" lit="1000113"/>" src="images/mes.gif" width="11px" height="11px"
                                                                    style="cursor:pointer;"  onmouseout="javascript:ocultar('SECCION_A${miListaId['SPERLRE']}')"  onmouseover="javascript:mostrar('SECCION_A${miListaId['SPERLRE']}')"  /></div>
                                                        </display:column>   
                                                    </axis:visible>
                                                    
                                                     <!-- *************************** SECCION MÁS DATOS ********************************* -->
                                
                                                    <display:column class="seccion_informacion">
                                                        <div id="SECCION_A${miListaId['SPERLRE']}" class="seccion_informacion">
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
                                                                <axis:visible f="axisctr211" c="CUSUARI_MD">
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
                                                                <axis:visible f="axisctr211" c="NPOLIZA">
                                                                <%-- Campo 1 --%>
                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                    <input type="text" class="campo campotexto" id="NPOLIZA__" name="NPOLIZA__" size="15" style="width:90%"
                                                                            value="${miListaId['NPOLIZA']}" readonly="readonly"/>
                                                                </td>
                                                                </axis:visible>
                                                                <axis:visible f="axisctr211" c="NSINIES">
                                                                <%-- Campo 1 --%>
                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                    <input type="text" class="campo campotexto" id="NSINIES__" name="NSINIES__" size="15" style="width:90%"
                                                                            value="${miListaId['NSINIES']}" readonly="readonly"/>
                                                                </td>
                                                                </axis:visible>
                                                                <axis:visible f="axisctr211" c="NRECIBO">
                                                                <%-- Campo 1 --%>
                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                    <input type="text" class="campo campotexto" id="NRECIBO__" name="NRECIBO__" size="15" style="width:90%"
                                                                            value="${miListaId['NRECIBO']}" readonly="readonly"/>
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
<c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr211</c:param>
    <c:param name="__botones">salir</c:param>
</c:import>

</form>

<c:import url="../include/mensajes.jsp" />
    
</body>
</html>

