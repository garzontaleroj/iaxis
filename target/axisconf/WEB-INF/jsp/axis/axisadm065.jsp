<%/*
*  Fichero: axisadm065.jsp
*
*  Fecha: 30/08/2011
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axisadm065" c="TIT065" lit="9902304"/></title> 
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
   
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
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {            
            f_cargar_propiedades_pantalla();               
        }
        
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm065", "cancelar", document.miForm, "_self");
        }
        
        function f_but_buscar() {          
                objDom.setValorPorId ("INDICE",null);     
                objDom.setValorPorId ("SSEQDWL",null);   
                objUtiles.ejecutarFormulario ("axis_axisadm065.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_seleccionar_detalle(posicion,sseqdwl)           
        {    
                objDom.setValorPorId ("INDICE",posicion);     
                objDom.setValorPorId ("SSEQDWL",sseqdwl);         
                objUtiles.ejecutarFormulario("axis_axisadm065.do", "buscar_detalle", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_descargar(nnumfil)           
        {    
                objDom.setValorPorId ("NNUMFIL",nnumfil);                     
                objUtiles.ejecutarFormulario("axis_axisadm065.do", "descargar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        
        function f_but_9902314()           
        {    
                if (objValidador.validaEntrada()) 
                {
                    var mensaje = "<axis:alt f='axisadm065' c='LIT_CONFIRM' lit='9902315'/>";
                    if (confirm(mensaje))
                        objUtiles.ejecutarFormulario("axis_axisadm065.do", "nueva", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
        }
               
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisadm065" c="TIT065" lit="9902304"/></c:param>   
            <c:param name="formulario"><axis:alt f="axisadm065" c="TIT065" lit="9902304"/></c:param> 
            <c:param name="form">axisadm065</c:param>
        </c:import>
        

    
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="INDICE" id="INDICE"  value="${__formdata.INDICE}"/>
        <input type="hidden" name="SSEQDWL" id="SSEQDWL"  value="${__formdata.SSEQDWL}"/>
        <input type="hidden" name="NNUMFIL" id="NNUMFIL"  value="${__formdata.NNUMFIL}"/>
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo">
                    </div>

                    <table class="seccion" align="center">
                        <tr>
                            <td >
                                <!-- Área 1 -->
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>                                        
                                    </tr>   
                                    
                                    <tr>
                                        <%-- Empresa --%>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisadm065" c="CCOMPANI" lit="9000600"/></b>   <%-- Empresa --%>
                                        </td>                                      
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisadm065" c="CTIPPET" lit="9902305"/> </b> <%-- Tipo Petición --%>
                                        </td>     
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisadm065" c="busquedaSSEQDWL" lit="9902306"/> </b> <%-- Sec. Descarga --%>
                                        </td>                                   
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisadm065" c="CTIPFICH" lit="9001148"/> </b> <%-- Sec. Descarga --%>
                                        </td>       
                                    </tr>
                                    <tr>
                                        <%-- Compañía --%>
                                        <axis:visible f="axisadm065" c="CCOMPANI" >
                                            <td class="campocaja">
                                                <select name = "CCOMPANI" id ="CCOMPANI" size="1" class="campo campotexto" style="width:90%"                                             
                                                <axis:atr f="axisadm065" c="CCOMPANI" a="modificable=true&obligatorio=true"/>
                                                title="<axis:alt f="axisadm065" c="CCOMPANI" lit="9000600"/>">                                              
                                                        <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisadm065" c="SELEC" lit="1000348"/> - </option>                                                
                                                        <c:forEach items="${__formdata.lstValores.lstCompani}" var="item">
                                                            <option value = "${item.CCOMPANI}" <c:if test="${__formdata.CCOMPANI == item.CCOMPANI}"> selected </c:if>>${item.TCOMPANI}</option>
                                                        </c:forEach>                                              
                                                </select>                                      
                                            </td>
                                        </axis:visible>      
                                        <%-- Tipo Petición --%>
                                        <axis:visible f="axisadm065" c="CTIPPET" >
                                            <td class="campocaja">
                                                <select name = "CTIPPET" id ="CTIPPET" size="1"  class="campo campotexto" style="width:90%" 
                                                    <axis:atr f="axisadm065" c="CTIPPET" a="modificable=true&obligatorio=false"/> 
                                                    title="<axis:alt f="axisadm065" c="CTIPPET" lit="9902305"/>">                                                      
                                                    <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisadm065" c="SELEC" lit="1000348"/> - </option>
                                                    <c:forEach items="${__formdata.lstValores.lstTipPet}" var="item">
                                                        <option value = "${item.CATRIBU}" <c:if test="${__formdata.CTIPPET == item.CATRIBU}"> selected </c:if>>${item.TATRIBU}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                       </axis:visible>
                                       <%-- Sec. Descarga --%>
                                       <axis:visible f="axisadm065" c="busquedaSSEQDWL" >
                                            <td class="campocaja">                                            
                                                <input type="text" name="busquedaSSEQDWL" id="busquedaSSEQDWL" value="${__formdata.busquedaSSEQDWL}" class="campowidthinput campo campotexto" style="width:90%"
                                                title='<axis:alt f="axisadm065" c="busquedaSSEQDWL" lit="9902306"/>'
                                                <axis:atr f="axisper025" c="busquedaSSEQDWL" a="modificable=true&obligatorio=false"/>  />   
                                            </td>
                                        </axis:visible>                                    
                                   
                                        <%-- Tipo Fichero --%>
                                        <axis:visible f="axisadm065" c="CTIPFICH" >
                                            <td class="campocaja">
                                                <select name = "CTIPFICH" id ="CTIPFICH" size="1"  class="campo campotexto" style="width:90%" 
                                                    <axis:atr f="axisadm065" c="CTIPFICH" a="modificable=true&obligatorio=true"/> 
                                                    title="<axis:alt f="axisadm065" c="CTIPFICH" lit="9001148"/>">                                                      
                                                    <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisadm065" c="SELEC" lit="1000348"/> - </option>
                                                    <c:forEach items="${__formdata.lstValores.lstTipFic}" var="item">
                                                        <option value = "${item.CATRIBU}" <c:if test="${__formdata.CTIPFICH == item.CATRIBU}"> selected </c:if>>${item.TATRIBU}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                       </axis:visible>
                                      <td class="campocaja">
                                            <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisadm065" c="BT_BUSC" lit="100797"/>" title="<axis:alt f="axisadm065" c="BT_BUSC" lit="100797"/>"
                                            onclick="f_but_buscar()" style="cursor:pointer"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja" colspan = "6">
                                            <div class="separador">&nbsp; </div>                                        
                                            <div class="separador">&nbsp; </div>                                        
                                            <%-- DisplayTag Descargas --%>
                                            <c:set var="title0"><axis:alt f="axisadm065" c="CCODDES" lit="103465"/></c:set>  <%-- Codigo. --%>
                                            <c:set var="title1"><axis:alt f="axisadm065" c="SSEQDWL" lit="9902307"/></c:set>  <%-- Sec. Des. --%>
                                            <c:set var="title2"><axis:alt f="axisadm065" c="TCOMPANI" lit="9000600"/></c:set>  <%-- Compñía --%>
                                            <c:set var="title3"><axis:alt f="axisadm065" c="CTIPPET" lit="9902305"/></c:set>  <%-- Tipo Petición --%>
                                            <c:set var="title4"><axis:alt f="axisadm065" c="FDESCAR" lit="100562"/></c:set>  <%-- Fecha --%>
                                            <c:set var="title5"><axis:alt f="axisadm065" c="CESTDES" lit="100587"/></c:set>   <%-- Estado --%>
                                            <% int i=0; %>
                                            <c:set var="pos"><%=i%></c:set>

                                            <div class="seccion displayspaceMaximo">
                                                <display:table name="${__formdata.lstDescargas}" id="lstDescarga" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0"
                                                     requestURI="axis_axisadm065.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    
                                                     <!-- Check  -->
                                                      <display:column headerClass="headwidth5 sortable fixed" title="" media="html" autolink="false" >
                                                        <div class="dspIcons">                                                
                                                          <input value="${pos}"  
                                                          <c:if test="${pos== __formdata.INDICE}">checked</c:if> 
                                                          onclick="javascript:f_seleccionar_detalle('${pos}','${lstDescarga.SSEQDWL}')" 
                                                          type="radio" id="radioNDETALLE" 
                                                          name="radioNDETALLE" 
                                                          selected="true"/>
                                                        </div>
                                                      </display:column>       
                                                    
                                                    <axis:visible f="axisadm065" c="CCODDES" >
                                                        <display:column title="${title0}" sortable="true" sortProperty="CCODDES" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${lstDescarga.CCODDES}
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    
                                                    <axis:visible f="axisadm065" c="SSEQDWL" >
                                                        <display:column title="${title1}" style="width:15%"  sortable="true" sortProperty="SSEQDWL" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${lstDescarga.SSEQDWL}                                                                
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    
                                                    <axis:visible f="axisadm065" c="TCOMPANI" >
                                                        <display:column title="${title2}" sortable="true" sortProperty="TCOMPANI" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${lstDescarga.TCOMPANI}                                                                
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    
                                                    <axis:visible f="axisadm065" c="CTIPPET" >
                                                        <display:column title="${title3}" sortable="true" sortProperty="CTIPPET" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${lstDescarga.CTIPPET}                                                                
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    
                                                    <axis:visible f="axisadm065" c="FDESCAR" >
                                                        <display:column title="${title4}" sortable="true" sortProperty="FDESCAR" headerClass="sortable"  media="html" autolink="false" >                                                          
                                                            <div class="dspDate"><fmt:formatDate value="${lstDescarga.FDESCAR}" pattern="dd/MM/yyyy"/></div>  
                                                        </display:column>
                                                    </axis:visible>
                                                    
                                                     <axis:visible f="axisadm065" c="CESTDES" >
                                                        <display:column title="${title5}" sortable="true" sortProperty="CESTDES" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${lstDescarga.CESTDES}                                                                
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>  
                                                    <%i++;%>
                                                    <c:set var="pos"><%=i%></c:set>
                                                </display:table>                                                        
                                            </div>
                                            <div class="separador">&nbsp; </div>                                        
                                        </td>                                                
                                    </tr>
                                    
                                    
                                    <!-- ****************************** detalle *************************** -->
                                                                                            
                                    <tr>
                                            <td colspan="6">
                                                 
                                               <table class="area" align="center">
                                                    <tr>
                                                    <td>
                                                        <table class="area" align="center">
                                                                                                                      
                                                            <tr>
                                                                <td>
                                                                 <div class="titulo"><img src="images/flecha.gif"/>
                                                                    <b><axis:alt c="LIT_DETALLE" f="axisadm065" lit="102239"/></b>
                                                                 </div>
                                                                   <table class="seccion">
                                                                <tr>
                                                                <td>
                                                                <c:set var="title1"><axis:alt c="SSEQDWL_DET" f="axisadm065" lit="9902307"/></c:set> <%-- Sec. Des. --%>
                                                                <c:set var="title2"><axis:alt c="NNUMFIL" f="axisadm065" lit="9902308"/></c:set> <%-- Nº Fichero. --%>
                                                                <c:set var="title3"><axis:alt c="TREFORG" f="axisadm065" lit="9902309"/></c:set>  <%-- Referencia Origen --%>
                                                                <c:set var="title4"><axis:alt c="TREFDES" f="axisadm065" lit="9902310"/></c:set>  <%-- Referencia Destino --%>
                                                                <c:set var="title5"><axis:alt c="CESTADO" f="axisadm065" lit="100587"/></c:set>  <%-- Estado --%>
                                                                <c:set var="title6"><axis:alt c="TOBSERV" f="axisadm065" lit="101162"/></c:set>  <%-- Estado --%>
                                                                <div class="separador">&nbsp;</div>
                                                                <div class="displayspace">
                                                                  <display:table name="${__formdata.listDetalle}" id="listDetalle" export="false" class="dsptgtable" style="width:100%" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                                                   requestURI="axis_axisadm065.do?paginar=true&SSEQDWL=${__formdata.SSEQDWL}">                                                                   
                                                                    <%@ include file="../include/displaytag.jsp"%>
                                                                     
                                                                    <display:column title="${title1}" sortable="false" sortProperty="SSEQDWL" headerClass="sortable fixed" media="html" autolink="false" >
                                                                        <div class="dspText">${listDetalle.SSEQDWL}</div>
                                                                    </display:column>
                                                                    <display:column title="${title2}" sortable="false" sortProperty="NNUMFIL" headerClass="sortable fixed" media="html" autolink="false" >
                                                                        <div class="dspText">${listDetalle.NNUMFIL}</div>
                                                                    </display:column>
                                                                    <display:column title="${title3}" sortable="false" sortProperty="TREFORG" headerClass="sortable fixed" media="html" autolink="false" >
                                                                        <div class="dspText">${listDetalle.TREFORG}</div>
                                                                    </display:column>
                                                                    <display:column title="${title4}" sortable="false" sortProperty="TREFDES" headerClass="sortable fixed" media="html" autolink="false" >
                                                                        <div class="dspText">${listDetalle.TREFDES}</div>
                                                                    </display:column>
                                                                    <display:column title="${title5}" sortable="false" sortProperty="CESTADO" headerClass="sortable fixed" media="html" autolink="false" >
                                                                        <div class="dspText">${listDetalle.CESTADO}</div>
                                                                    </display:column>
                                                                    <display:column title="${title6}" sortable="false" sortProperty="TOBSERV" headerClass="sortable fixed" media="html" autolink="false" >
                                                                        <div class="dspText">${listDetalle.TOBSERV}</div>
                                                                    </display:column>
                                                                    
                                                                    <display:column title="" sortable="false" style="width:5%" sortProperty="DESCARGA" headerClass="sortable fixed" media="html" autolink="false" >
                                                                        <div class="dspIcons">
                                                                            <c:if test="${listDetalle.DESCARG == 1}">
                                                                                <img id="find" border="0" src="images/file.gif" alt="<axis:alt f="axisadm065" c="DESCARGA" lit="9902311" />" 
                                                                                onclick="f_descargar('${listDetalle.NNUMFIL}');" 
                                                                                style="cursor:pointer"/>                
                                                                            </c:if>
                                                                        </div>
                                                                    </display:column>
                                                                    
                                                                  
                                                                </display:table>
                                                                  
                                                                </div>
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
                                                        
                                            </td>
                                      </tr>
                                      <!-- ****************************** detalle *************************** -->
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axisadm065</c:param>
            <c:param name="__botones">salir,9902314</c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>

   

</body>
</html>