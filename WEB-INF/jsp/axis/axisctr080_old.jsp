<%/**
*  Fichero: axisctr080.jsp
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavier Pastor</a>
*  
*  Manteniment de comptes tècniques 
*
*
*  Fecha: 09/07/2009
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
 
<html>
    <head>
        <title><fmt:message key="9001844"/></title> <!--Gestió Transferències-->
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          


        <c:import url="../include/carga_framework_js.jsp" />
    
        <!--********** CALENDARIO ************************* -->
        <!-- Hoja de estilo del Calendario -->
        <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
        <!-- Script principal del calendario -->
        <script type="text/javascript" src="scripts/calendar.js"></script>
        <!-- Idioma del calendario, en función del Locale -->
        <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <!-- Setup del calendario -->
        <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        <!--*********************************** -->  

     <script type="text/javascript">        
        
            function f_onload() {
            
            revisarEstilos();
            CAGENTE = "${__formdata.CAGENTE}";
              if (objUtiles.estaVacio(CAGENTE) ){
                f_abrir_axisage006();
              }
              
            }
              
            function f_aceptar_axisage006(CAGENTE, TAGENTE){
                objUtiles.cerrarModal("axisage006");
                document.miForm.CAGENTE.value = CAGENTE;
                document.miForm.TAGENTE.value = TAGENTE;
                objUtiles.ejecutarFormulario ("axis_axisctr080.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);    
                
            }
            function f_abrir_axisage006(){
                objUtiles.abrirModal("axisage006","src","modal_axisage006.do?operation=form");
            }
            
            function f_borrar_cta(CEMPRES, CAGENTE, NNUMLIN){
             var answer = confirm(objJsMessages.jslit_confirma_borrar);
            if (answer){
               document.miForm.CAGENTE.value = CAGENTE;
               document.miForm.CEMPRES.value = CEMPRES;
               document.miForm.NNUMLIN.value = NNUMLIN;
               objUtiles.ejecutarFormulario ("axis_axisctr080.do", "delete", document.miForm, "_self", objJsMessages.jslit_cargando);    
               }
            }
            
            function f_gestion_linea(PMODO,NNUMLIN){
                params = "&NNUMLIN="+NNUMLIN+"&CEMPRES="+document.miForm.CEMPRES.value+"&CAGENTE="+document.miForm.CAGENTE.value;
                objUtiles.abrirModal("axisctr081","src","modal_axisctr081.do?operation=init&PMODO="+PMODO+params);
            }
            
            function f_cerrar_axisctr081(){
                objUtiles.cerrarModal("axisctr081");
                objUtiles.ejecutarFormulario ("axis_axisctr080.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);    
            }
            
            function f_aceptar_axisctr081(){
                f_cerrar_axisctr081();
            }
            
      
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr080", "cancelar", document.miForm, "_self");
            } 
            
            function f_cerrar_axisage006(){
                objUtiles.cerrarModal("axisage006");
            }
            

     
         
        </script>
    </head>

    
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="CEMPRES" value="${__formdata.CEMPRES}"/>
        <input type="hidden" name="NNUMLIN" value="${__formdata.NNUMLIN}"/>
        
        
             <c:import url="../include/titulo_nt.jsp">
                    <c:param name="titulo"><fmt:message key="9001941" /></c:param>
                    <c:param name="form">axisctr080</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><fmt:message key="9000713" /></c:param>
                <c:param name="nid" value="axisage006" />
           </c:import>
           <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><fmt:message key="9001947" /></c:param>
                <c:param name="nid" value="axisctr081" />
           </c:import>
           
           
  
           
           
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                  <table class="seccion">
                      <tr>
                        <td>
                        
                        
                          <table class="area" align="center">
                             <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                
                            </tr>
                                    <tr>
                                        <td class = "campocaja" colspan="4" >
                                            <div class="separador">&nbsp;</div>     
                                            <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="9000521"/>
                                            <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisage006()" style="cursor:pointer"/> </div>
                                        </td>
                                     </tr>
                                     <tr>
                                         <td  class = "titulocaja">
                                           <b><fmt:message key="101619" /></b>
                                         </td>
                                         <td  class = "titulocaja">
                                           <b><fmt:message key="100584" /></b>
                                         </td>                                         
                                         <td  class = "titulocaja">
                                           <b><fmt:message key="105940" /></b>
                                         </td>
                                         <td  class = "titulocaja">
                                           <b><fmt:message key="9001942" /></b>
                                         </td>                                         
                                     </tr>
                                      <tr>
                                      <td class = "campocaja" >
                                            <input type="text" class="campo campotexto" size="15" value="${__formdata.TEMPRES}" name="TEMPRES" id="TEMPRES"
                                             <axis:atr f="axisctr080" c="TEMPRES" a="modificable=false"/> />
                                        </td>
                                         <td class = "campocaja" >
                                            <input type="text" class="campo campotexto" size="15" value="${__formdata.CAGENTE}" name="CAGENTE" id="CAGENTE"
                                             <axis:atr f="axisctr080" c="CAGENTE" a="modificable=false"/> />
                                        </td>
                                        <td class = "campocaja" >
                                            <input type="text" class="campo campotexto" size="15" value="${__formdata.TAGENTE}" name="TAGENTE" id="TAGENTE"
                                             <axis:atr f="axisctr080" c="TAGENTE" a="modificable=false"/> />
                                        </td>
                                        <td class = "campocaja" >
                                            <input type="text" class="campo campotexto" style="width:90%" size="15" value="<fmt:formatNumber pattern="###,##0.00" value="${__formdata.SALDO}"/>" name="SALDO" id="SALDO"
                                             title="<fmt:message key="1000529"/>" <axis:atr f="axisctr080" c="SALDO" a="modificable=false"/> />
                                        </td>
                                      </tr>
                                      <tr>
                                      <tr>
                                        <td class = "campocaja" colspan="4" >
                                            <div class="separador">&nbsp;</div>  
                                             <div style="float:left;">
                                                   <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="9001943"/></div>
                                             </div>
                                             <div style="float:right;">
                                                    <a href="javascript:f_gestion_linea('1')">  <img border="0" src="images/new.gif"/></a>
                                              </div>

                                        </td>
                                     </tr>
                                        <td class = "campocaja" colspan="4">
                                        
                                        <c:set var="title0"><fmt:message key="9001727"/></c:set>
                                        <c:set var="title1"><fmt:message key="100565"/></c:set>
                                        <c:set var="title2"><fmt:message key="100562"/></c:set>
                                        <c:set var="title3"><fmt:message key="100587"/></c:set>
                                        <c:set var="title4"><fmt:message key="9000715"/></c:set>
                                        <c:set var="title5"><fmt:message key="9000499"/></c:set>
                                        <c:set var="title6"><fmt:message key="9000500"/></c:set>
                                        <c:set var="title7"><fmt:message key="100588"/></c:set>
                                        <c:set var="title8"><fmt:message key="9001942"/></c:set>

                                        <div class="displayspaceGrande">
                                            <display:table name="${__formdata.cuentas}" id="miListaId" export="false" style="width:98%;" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                             requestURI="axis_axisctr080.do?paginar=true">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title0}" sortable="true" style="width:5%;" sortProperty="NNUMLIN" headerClass="sortable fixed"  media="html" autolink="false" >
                                                     <div class="dspText">${miListaId['NNUMLIN']}</div>
                                                </display:column>
                                                <display:column title="${title1}" sortable="true" style="width:7%;" sortProperty="TIPOLIN" headerClass="sortable fixed"  media="html" autolink="false" >
                                                      <div class="dspText">${miListaId['TIPOLIN']}</div>
                                                </display:column>
                                                <display:column title="${title2}" sortable="true" style="width:7%;" sortProperty="FFECMOV" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FFECMOV}"/></div>    
                                                </display:column>
                                                <display:column title="${title3}" sortable="true" style="width:9%;" sortProperty="TIPOLIN" headerClass="sortable fixed"  media="html" autolink="false" >
                                                      <div class="dspText">${miListaId['TESTADO']}</div>
                                                </display:column>
                                                <display:column title="${title4}" sortable="true" style="width:20%;" sortProperty="CONCEPTO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                      <div class="dspText">${miListaId['CONCEPTO']}</div>
                                                </display:column>                                                
                                                <display:column title="${title5}" sortable="true" style="width:7%;" sortProperty="IDEBE" headerClass="sortable fixed"  media="html" autolink="false" >
                                                       <div class="dspText">
                                                      <c:choose>
                                                      <c:when test="${miListaId['CCONCTA']==0}">
                                                        <fmt:formatNumber pattern="###,##0.00" value="0"/>
                                                      </c:when>	
                                                      <c:otherwise>
                                           							  <fmt:formatNumber pattern="###,##0.00" value="${miListaId['IDEBE']}"/>
                                                      </c:otherwise>	
                                                      </c:choose>
                                                      </div>
                                                      
                                                </display:column>
                                                <display:column title="${title6}" sortable="true" style="width:7%;" sortProperty="IHABER" headerClass="sortable fixed"  media="html" autolink="false" >
                                                      <div class="dspText">
                                                      <c:choose>
                                                      <c:when test="${miListaId['CCONCTA']==0}">
                                                        <fmt:formatNumber pattern="###,##0.00" value="0"/>
                                                      </c:when>	
                                                      <c:otherwise>
                                                      	<fmt:formatNumber pattern="###,##0.00" value="${miListaId['IHABER']}"/>
                                                      </c:otherwise>	
                                                      </c:choose>
                                                      </div>
                                                      
                                                </display:column>
                                                <display:column title="${title7}" sortable="true" style="width:20%;" sortProperty="TDESCRIP" headerClass="sortable fixed"  media="html" autolink="false" >
                                                      <div class="dspText">${miListaId['TDESCRIP']}</div>
                                                </display:column>  
                                                <display:column title="${title8}" sortable="true" style="width:12%;" sortProperty="ISALDO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                   <c:if test="${miListaId['CCONCTA']==0}">
                                                      <div class="dspText">
                                                        <c:if test="${miListaId['IHABER']>0}">
                                                            -&nbsp;<fmt:formatNumber pattern="###,##0.00" value="${miListaId['IHABER']}"/>
                                                        </c:if>
                                                        <c:if test="${miListaId['IDEBE']>0}">
                                                            <fmt:formatNumber pattern="###,##0.00" value="${miListaId['IDEBE']}"/>
                                                        </c:if>
                                                      </div>
                                                    </c:if>
                                                </display:column>
                                                <axis:visible f="axisctr080" c="BT_SIN_EDITAR"> 
                                                <display:column title="" headerClass="sortable fixed" media="html" style="width:3%;"  autolink="false" >
                                                  <c:if test="${miListaId['CESTADO'] !=0 && miListaId['CMANUAL'] == 0}">
                                                     <div class="dspIcons"><img border="0" alt="<fmt:message key="100002"/>" title1="<fmt:message key="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="f_gestion_linea('0','${miListaId['NNUMLIN']}')"/></div>
                                                  </c:if>
                                                  <c:if test="${miListaId['CESTADO'] !=0 && miListaId['CMANUAL'] == 1 }">
                                                     <div class="dspIcons"><img border="0" alt="<fmt:message key="1000439"/>" title1="<fmt:message key="1000439"/>" src="images/mas.gif" width="11px" height="11px"
                                                    style="cursor:pointer;" onclick="f_gestion_linea('2','${miListaId['NNUMLIN']}')"/></div>
                                                  </c:if>                                                  
                                                 </display:column>
                                                 </axis:visible>
                                                 <axis:visible f="axisctr080" c="BT_SIN_DELETE"> 
                                                <display:column title="" headerClass="sortable fixed" media="html" style="width:3%;" autolink="false" >
                                                <c:if test="${miListaId['CESTADO'] !=0 && miListaId['CMANUAL'] == 0}">
                                                    <div class="dspIcons"><img border="0" alt="<fmt:message key="1000127"/>" title1="<fmt:message key="1000127"/>" src="images/delete.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="javascript:f_borrar_cta('${miListaId['CEMPRES']}','${miListaId['CAGENTE']}','${miListaId['NNUMLIN']}');"/></div>
                                                </c:if>
                                                </display:column>
                                                </axis:visible>
                                                
                                            </display:table>
                                        </div>
                                        
                                        </td>
                                       </tr>
                                   </table>
                                </td>
                            </tr>
                        </table>
                   </td>
                </tr>
            </table>
            
            <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axisctr080</c:param>
            <c:param name="__botones">salir</c:param>
            </c:import>
                
       </form>
     <c:import url="../include/mensajes.jsp"/>
    
    </body>

</html>
