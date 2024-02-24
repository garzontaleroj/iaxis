<%/**
*  Fichero: axisjob001.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a>
*  
*  Pantalla de CONSULTA DE PROCESOS BATCH
*
*  Fecha: 12/05/2009
*/
%>

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
        <title><fmt:message key="1000231"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        
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
        
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">
        
            
            function f_but_salir() {
            //Esborrem les vars de session
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisjob001", "cancelar", document.axisjob001, "_self");
            }
            
            function f_but_buscar(){
                objUtiles.ejecutarFormulario ("axis_axisjob001.do", "buscarprocesos", document.axisjob001, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_abrir_axisjob002(pnumjob,modo){
                var phora = document.getElementById("PHORA").value;
                objUtiles.abrirModal("axisjob002", "src", "modal_axisjob002.do?operation=form&pnumjob="+pnumjob+"&modo="+modo+"&PHORA="+phora); 
            }
            
            function f_cerrar_axisjob002(){
                objUtiles.cerrarModal("axisjob002");
                 f_but_buscar();
            }
            
            function f_eliminarjob(pnumjob){
                var answer = confirm(objJsMessages.jslit_confirma_borrar);
        
                if (answer){
                    objUtiles.ejecutarFormulario ("axis_axisjob001.do?PNUMJOB="+pnumjob, "eliminarjob", document.axisjob001, "_self", objJsMessages.jslit_cargando);
                }
            }
            
            function f_but_109006(){
                var hayChecked = objUtiles.f_GuardaCasillasChecked("seleccionajob");
                if(typeof hayChecked == 'boolean') {
                    alert('<fmt:message key="9001620"/>');
                }else{
                    objUtiles.ejecutarFormulario ("axis_axisjob001.do?PNUMJOB="+hayChecked, "ejecutajob", document.axisjob001, "_self", objJsMessages.jslit_cargando);
                     f_but_buscar();
                }
            }
            
            function f_onload(){
                document.axisjob001.NUMJOB.focus();
                if( "${__formdata.ERROR}" == "0" )
                        f_but_buscar();
            }
            
            
            
        </script>
        
    </head>
    
    <body onload="f_onload()">
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><fmt:message key="1000113" /></c:param>
        <c:param name="nid" value="axisjob002" />
        </c:import>
        <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <c:set var="pantalla" value="axisjob001"/>
    <form name="axisjob001" action="" method="POST">
        <input type="hidden" id="operation" name="operation" value="" />
        <input type="hidden" id="HAYERROR" name="HAYERROR" value="${__formdata.ERROR}" />
        <input type="hidden" id="PHORA" name="PHORA" value="00:00" />
        
    <c:set var="pantalla" value="axisjob001"/>
    <c:set var="literalPantalla" value="9001568"/>
    <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt c="TITULO" f="axisjob001" lit="9001568"/></c:param>
            <c:param name="formulario"><fmt:message key="${literalPantalla}"/></c:param>
            <c:param name="form">${pantalla}</c:param>
    </c:import>
        
    <table class="mainTableDimensions base"  align="center" cellpadding="0" cellspacing="0"> 
        <tr>
            <td>
                
                <table class="seccion">
                    <div  class="" style="float:left;"><img src="images/flecha.gif"/><b><fmt:message key="1000178"/></b></div>
                    <div style="clear:both;"><hr class="titulo"></div>
                    <tr>
                        <td align="left" >
                            <table class="area" align="center">
                                <tr>
                                    <th style="width:15%;height:0px"></th>
                                    <th style="width:15%;height:0px"></th>
                                    <th style="width:15%;height:0px"></th>
                                    <th style="width:10%;height:0px"></th>
                                    <th style="width:45%;height:0px"></th>
                                </tr>
                                <tr>
                                    <!-- Codigo -->
                                    <td class="titulocaja" >
                                        <b><fmt:message key="1000109" /></b>
                                    </td>
                                    
                                    <!-- Desde -->
                                    <td class="titulocaja" >
                                        <b><fmt:message key="9000526" /></b>
                                    </td> 
                                    <!-- Hasta -->
                                    <td class="titulocaja" >
                                        <b><fmt:message key="9000527" /></b>
                                    </td> 
                                </tr>
                                <tr>
                                    <td class="campocaja" >
                                        <input type="text" name="NUMJOB" id="NUMJOB" style="width:50%;" <axis:atr f="axisjob001" c="NUMJOB" a="modificable=true"/>
                                               value=""  class="campowidthinput campo campotexto"/>
                                    </td>
                                   
                                    <td class="campocaja" >
                                        <input type="text" formato="fecha" <axis:atr f="axisjob001" c="FDESDE" a="modificable=true&isInputText=false"/>
                                                   name="FDESDE" id="FDESDE"  style="width:50%;"  value=""  class="campowidthinput campo campotexto"/>
                                        <a id="icon_FDESDE" style="vertical-align:middle;">
                                        <img alt="<fmt:message key="108341"/>" title="<fmt:message key="100883" />" src="images/calendar.gif"/></a>
                                    </td>
                                    <td class="campocaja">
                                        <input type="text" formato="fecha" <axis:atr f="axisjob001" c="FHASTA" a="modificable=true&isInputText=false"/>
                                                   name="FHASTA" id="FHASTA" style="width:50%;"   value=""  class="campowidthinput campo campotexto"/>
                                        <a id="icon_FHASTA" style="vertical-align:middle;">
                                        <img alt="<fmt:message key="108341"/>" title="<fmt:message key="100883" />" src="images/calendar.gif"/></a>
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <!-- Nombre -->
                                    <td class="titulocaja" colspan = "2">
                                        <b><fmt:message key="105940" /></b>
                                    </td>
                                    <!-- Retenido -->
                                    <td class="titulocaja" >
                                        <b><fmt:message key="9001569" /></b>
                                    </td>
                                </tr>
                                <tr>
                                     <td class="campocaja" colspan = "2">
                                        <input type="text" name="FUNCION" id="FUNCION"  <axis:atr f="axisjob001" c="FUNCION" a="modificable=true"/>
                                               value=""  class="campowidthinput campo campotexto"/>
                                    </td>
                                    <td class="campocaja" >
                                      <!--BUG 35980/209807 - AQM - 10/07/2013-->
                                        <select name = "CRETENIDO" id="CRETENIDO" 
                                         value="" size="1" onchange="" class="campowidthselect campo campotexto">
                                                <option value=""> - <fmt:message key="108341"/> - </option>
                                                <c:forEach var="retenido" items="${RETENIDO}">
                                                    <option value = "${retenido.CATRIBU}">
                                                     ${retenido.TATRIBU}</option>  
                                                </c:forEach>
                                        </select>	
                                         <!--BUG 35980/209807 - AQM - 10/07/2013-->
                                    </td>
                                    <td></td>
                                    <td>
                                        <input type="button" name="buscar" id="buscar" onclick="javascript:f_but_buscar()" value="<fmt:message key="9000508"/>"  class="boton"/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <div  class="" style="float:left;"><img src="images/flecha.gif"/><b><fmt:message key="103256"/></b></div>
                <div  style="float:right;"> <a href="javascript:f_abrir_axisjob002(null,'NUEVO')">  <img border="0" alt="<fmt:message key="9001670"/>"   title="<fmt:message key="9001670"/>" src="images/new.gif"/></a></div>    
                 <div style="clear:both;"><hr class="titulo"></div>
                    <table class="seccion">
                        <tr>
                            <td align="left" >
                                <table class="area" align="center">
                                    <tr>
                                        <td>
                                            <div class="separador">&nbsp;</div>
                                            <!-- DisplayTag ListaPersonas -->
                                            <c:set var="title1"><fmt:message key="108341"/></c:set>
                                            <c:set var="title2"><fmt:message key="9001571"/></c:set>
                                            <c:set var="title3"><fmt:message key="105940"/></c:set>
                                            <c:set var="title4"><fmt:message key="9001569"/></c:set>
                                            <c:set var="title5"><fmt:message key="9001572"/></c:set>
                                            <c:set var="title6"><fmt:message key="9001583"/></c:set>  <!--BUG 35980/209807 - AQM - 10/07/2013 - Adicionar una columna "INTERVAL"-->
                                            <c:set var="title7"><fmt:message key="9001573"/></c:set>
                                            <c:set var="title8"><fmt:message key="9001574"/></c:set>
                                            
                                            
                                            <div class="seccion displayspacePersonas">
                                                <display:table name="${listaProcesos}" id="miListaId" export="false" class="dsptgtable" pagesize="15"  requestURI="axis_axisjob001.do?operation=form&paginar=true" excludedParams="*" sort="list" cellpadding="0" cellspacing="0">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                                        <div class="dspIcons"><input <c:if test="${miListaId['listaProcesos']}">checked</c:if> type="radio" id="seleccionajob" name="seleccionajob" value="${miListaId['JOB']}"/></div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="JOB" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId['JOB']}</div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true" sortProperty="WHAT" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                        <input type="text" name="TVERSION" id="TVERSION"  value="${miListaId['WHAT']}" style="background-color:transparent;border:0px" class="campowidthinput campo campotexto"/> 
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title4}" sortable="true" sortProperty="BROKEN" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId['BROKEN']}</div>
                                                    </display:column>
                                                    <display:column title="${title5}" sortable="true" sortProperty="LAST_DATE" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId['LAST_DATE']}</div>
                                                    </display:column>
                                                    <!--BUG 35980/209807 - AQM - 10/07/2013 - Adicionar una columna "INTERVAL"-->
                                                    <display:column title="${title6}" sortable="true" sortProperty="INTERVAL" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId['INTERVAL']}</div>
                                                    </display:column>
                                                    <!--BUG 35980/209807 - AQM - 10/07/2013-->
                                                    <display:column title="${title7}" sortable="true" sortProperty="FAILURES" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId['FAILURES']}</div>
                                                    </display:column>                                             
                                                    <display:column title="${title8}" sortable="true" sortProperty="NEXT_DATE" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId['NEXT_DATE']}</div>
                                                    </display:column>
                                                    <display:column title="" sortable="true" sortProperty="EDITAR" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            <a href="javascript:f_abrir_axisjob002('${miListaId['JOB']}','EDITAR')">
                                                            <img border="0" alt="<fmt:message key="9001671"/>" title="<fmt:message key="9001671"/>" src="images/lapiz.gif"/>
                                                            </a>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="" sortable="true" sortProperty="NUEVO" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            <a href="javascript:f_eliminarjob('${miListaId['JOB']}')">
                                                            <img border="0" alt="<fmt:message key="9001672"/>" title="<fmt:message key="9001672"/>" src="images/delete.gif"/>
                                                            </a>
                                                        </div>
                                                    </display:column>
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
            
        
<div class="separador">&nbsp;</div>
<!-- Botonera -->
<c:import url="../include/botonera_nt.jsp">
    <c:param name="__botones">salir,109006 </c:param>
</c:import>

<script type="text/javascript">
    Calendar.setup({
        inputField     :    "FDESDE",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FDESDE", 
        singleClick    :    true,
        firstDay       :    1
    });
</script>
<script type="text/javascript">
    Calendar.setup({
        inputField     :    "FHASTA",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FHASTA", 
        singleClick    :    true,
        firstDay       :    1
    });
</script>
</form>

<c:import url="../include/mensajes.jsp" />
    
</body>
</html>

