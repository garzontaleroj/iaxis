<%/**
*  Fichero: axispen003.jsp
* 
*  Consulta de Fondos de pensiones
*	
*
*
*  Fecha: 18/12/2009
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt c="title" f="axispen003" lit="151501"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        <script language="Javascript" type="text/javascript">
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
             function f_onload(){
                f_cargar_propiedades_pantalla();              
                //Si la selecció es buida, obrim cercador automàticament
                var hayErrores = ${!empty requestScope.__mensajes.m__clave};
                
                if (${empty __formdata.CCODFON} && !hayErrores){
                    f_but_buscar_fondo();
                }
             }         
           
             function f_cerrar_modal(cual) {
                objUtiles.cerrarModal(cual);
               }
            
             function f_but_buscar_fondo() {
                f_abrir_modal("axispen008");                
             }       
             
            function f_nuevo_fondo(){
                f_abrir_modal("axispen013",null,"&MODO=ALTA");            
            }
            
            function f_modificar_fondo(codigo) {
            
                f_abrir_modal("axispen013",null,"&parametro=mod&CCODFON="+codigo);
                
            }
             
             function f_aceptarAxispen013(codigo) {
                
                f_cerrar_modal("axispen013");
                objDom.setValorPorId("CCODFON", codigo); 
                //objDom.setValorPorId("TNOM", TNOM);
                f_buscar_fondos(); 
                
            }
             
             function f_modificar_pensio (CCODPLA){
                f_abrir_modal("axispen014",null,"&parametro=mod&CCODPLA="+CCODPLA);
             }
             
             function f_alta_plan() {
                f_abrir_modal("axispen014",null,"&parametro=ALTA");
                
            } 
            
            function f_aceptarAxispen014(CCODPLA){
                objUtiles.cerrarModal("axispen014");
                objUtiles.ejecutarFormulario("axis_axispen003.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                
            }
             
             function f_abrir_modal(cual, noXButton, optionalQueryString) {         
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";                    
                if (noXButton) 
                    objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");             
                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
                }
            
             
             function f_buscar_fondos(){            
                objUtiles.ejecutarFormulario("axis_axispen003.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
             }
                    
             function f_seleccionar_fondo(CCODFON){
                objDom.setValorPorId("CCODFON", CCODFON);
                objUtiles.ejecutarFormulario("axis_axispen003.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);         
            }
           
        
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
            }
                    
            function f_but_salir() {
                    objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
            }
          
            function f_aceptar_axispen008(CCODFON){
                objUtiles.cerrarModal("axispen008"); 
                objDom.setValorPorId("CCODFON", CCODFON);  
                objUtiles.ejecutarFormulario("axis_axispen003.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);  
                //f_buscar_fondos(); 
            }
            
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation"/>
        <input type="hidden" name="radioFondos" value=""/>                
        
        
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"><axis:alt c="MODALIDAD" f="axispen003" lit="9900721"/></c:param>
                <c:param name="formulario"><axis:alt c="FORMULARIO" f="axispen003" lit="9900721"/></c:param>
                <c:param name="form">axispen003</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">
                axispen008|<axis:alt c="TITULO_008" f="axispen003" lit="9900865"/><%-- Cercador de fons de pensions --%>
            </c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axispen013|<axis:alt c="TITULO_013" f="axispen003" lit="9900865"/><%-- alta/mod Fondos --%>
                </c:param>
            </c:import> 
           <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axispen013|<axis:alt c="TITULO_013" f="axispen003" lit="9900865"/><%-- alta/mod Fondos --%>
                </c:param>
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axispen014|<axis:alt c="TITLE_AXISPEN014" f="axispen003" lit="9900722"/><%-- Cercador de plans de pensions --%>
                </c:param>
         </c:import> 
        <input type="hidden" id="CCODFON" name="CCODFON" value="${__formdata.CCODFON}"/>        
        <input type="hidden" id="TNOM" name="TNOM" value="${__formdata.TNOM}"/>        
        
        <!-- Area de campos  -->
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">       
                    <tr>
                        <td> 
                          <table class="seccion">  
                           <tr>
                            <td>
                             <div class="separador">&nbsp;</div>
                             <div class="separador">&nbsp;</div>  
                          
                             <div class="titulo">
                                 <img src="images/flecha.gif"/><axis:alt c="FLECHA" f="axispen003" lit="108263"/>    <img border="0" src="images/find.gif" onclick="f_but_buscar_fondo()" style="cursor:pointer" alt="<axis:alt c='BUSCAR' f='axispen003' lit='9000508'/>" title="<axis:alt c='BUSCAR' f='axispen003' lit='9000508'/>"/>
                             </div>
                             <!-- Lista de Fondos -->                           
                              <table class="area" align="center">     
                                <tr>
                                    <td>
                                        <c:set var="title0">&nbsp;</c:set>
                                        <c:set var="title1">
                                            <axis:alt c="CFONDO" f="axispen003" lit="1000109"/><!-- Código fondo -->
                                        </c:set>
                                        <c:set var="title2">
                                            <axis:alt c="NOMBRE" f="axispen003" lit="105940"/>
                                        </c:set>
                                        <c:set var="title3">
                                            <axis:alt c="COMERCIAL" f="axispen003" lit="9900822"/><!-- Comercial -->
                                        </c:set>                                    
                                        <c:set var="title4">
                                            <axis:alt c="FALATA" f="axispen003" lit="9001192"/><!-- Fecha alta -->
                                        </c:set>
                                        <c:set var="title5">
                                            <axis:alt c="FBAJA" f="axispen003" lit="9001510"/><!-- Fecha baja -->
                                        </c:set>                                        
                                          <!--Imatge nou registre-->
                                         <div style="float:right;">
                                            <a href="javascript:f_nuevo_fondo()"><img border="0" alt="<axis:alt c='AFEGIR' f='axispen003' lit='104825'/>" title="<axis:alt c='AFEGIR' f='axispen003' lit='104825'/>" src="images/new.gif"/></a>
                                        </div>                                    
                                        <!--Fi imatge nou registre--> 
                                        <% int contador = 0;%>                                     
                                        <div class="seccion  displayspace">
                                            <display:table name="${__formdata.AXIS_FONDOS}"
                                                           id="miListaFondos"
                                                           export="false"
                                                           class="dsptgtable"
                                                           pagesize="-1"
                                                           requestURI="axis_axispen003.do?paginar=true"
                                                           sort="list"
                                                           cellpadding="0"
                                                           cellspacing="0">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <c:set var="contador"><%=contador%></c:set>                                            
                                              <display:column headerClass="sortable fixed"
                                                                title=""
                                                                media="html"
                                                                autolink="false" style="width:3%">
                                                    <div class="dspIcons">
                                                        <input value="${miListaFondos.OB_IAX_FONPENSIONES['CCODFON']}"
                                                               type="radio"
                                                               onclick="f_seleccionar_fondo('${miListaFondos.OB_IAX_FONPENSIONES.CCODFON}');"
                                                               <c:if test="${__formdata.CCODFON == miListaFondos.OB_IAX_FONPENSIONES.CCODFON}"> checked </c:if>
                                                               id="radioFondos"
                                                               name="radioFondos"/>
                                                    </div>
                                                </display:column>                                            
                                                <display:column title="${title1}"
                                                                sortable="true"
                                                                sortProperty="CCODFON"
                                                                headerClass="sortable fixed"
                                                                media="html"
                                                                autolink="false"  style="width:5%">
                                                   <div class="dspText">
                                                            ${miListaFondos.OB_IAX_FONPENSIONES.CODDGS} 
                                                            
                                                    </div>                                                            
                                                </display:column>
                                                <display:column title="${title2}"
                                                                sortable="true"
                                                                sortProperty="TNOMBRE"
                                                                headerClass="sortable fixed"
                                                                media="html"
                                                                autolink="false"   style="width:40%">
                                                   <div class="dspText">
                                                            ${miListaFondos.OB_IAX_FONPENSIONES.PERSONA['TNOMBRE']}
                                                            ${miListaFondos.OB_IAX_FONPENSIONES.PERSONA['TAPELLI1']}&nbsp;
                                                            ${miListaFondos.OB_IAX_FONPENSIONES.PERSONA['TAPELLI2']}
                                                    </div>                                               
                                                </display:column>                                      
                                                <display:column title="${title4}"
                                                                sortable="true"
                                                                sortProperty="FALTARE"
                                                                headerClass="sortable fixed"
                                                                media="html"
                                                                autolink="false"  style="width:7%">
                                                   <div class="dspText"><fmt:formatDate value="${miListaFondos.OB_IAX_FONPENSIONES['FALTARE']}" pattern="dd/MM/yy" />
                                                   </div>                                                 
                                                </display:column>
                                                <display:column title="${title5}"
                                                                sortable="true"
                                                                sortProperty="FBAJARE"
                                                                headerClass="sortable fixed"
                                                                media="html"
                                                                autolink="false"  style="width:7%">
                                                   <div class="dspText"><fmt:formatDate value="${miListaFondos.OB_IAX_FONPENSIONES['FBAJARE']}" pattern="dd/MM/yy" />
                                                    </div>             
                                                </display:column>
                                                
                                                <display:column title="" sortable="false" sortProperty=""  style="width:5%" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                   <div class="dspIcons"><a href="javascript:f_modificar_fondo('${miListaFondos.OB_IAX_FONPENSIONES['CCODFON']}');"><img border="0" alt="<axis:alt c='CCODFON' f='axispen003' lit='9900815'/>" title="<axis:alt c='CCODFON' f='axispen003' lit='9900815'/>" src="images/lapiz.gif"/></a></div>
                                                </display:column>                                    
                                                <%--<display:column title="" sortable="false" sortProperty=""  style="width:5%" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                   <div class="dspIcons"><a href="javascript:f_borrar_pensio_dipositaria('${miListaDepositarias['CCODDEP']}',this)"><img border="0" alt="<axis:alt c='CCODDEP' f='axispen003' lit='9900817'/>" title="<axis:alt c='CCODDEP' f='axispen003' lit='9900817'/>" src="images/delete.gif"/></a></div>
                                                </display:column>
                                                --%>
                                            <%contador++;%>                                         
                                            </display:table>
                                            <c:choose>
                                                <c:when test="${!empty  __formdata.AXIS_FONDOS}">
                                                    <script language="javascript">//objUtiles.retocarDsptagtable("miListaFondos");</script>
                                                </c:when>
                                                <c:otherwise>
                                                    <script language="javascript">
                                                    </script>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>     
                    <tr>
                        <td>
                         <div class="separador">&nbsp;</div>
                          <div class="separador">&nbsp;</div>                    
                            <!-- Lista de Gestoras -->
                             <table class="area" align="center">
                                     <tr>
                                         <td class="campocaja" >
                                               <div style="float:left;">
                                                   <img id="DSP_DATOS_FONDO_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_DATOS_FONDO', this)" style="cursor:pointer"/> 
                                                    <b><axis:alt c="DSP_DATOS_FONDO_LIT" f="axispen003" lit="9900833"/> </b>&nbsp;&nbsp;
                                               </div>
                                               <div style="clear:both;">
                                                  <hr class="titulo">
                                               </div>
                                         </td>
                                     </tr>         
                                     <tr id="DSP_DATOS_FONDO_children" style="display:none">
                                        <td align="left" >
                                           <table class="area" align="center">
                                              <tr>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                              </tr>
                                                        <!-- Datos Gestion -->
                                     <tr>
                                       <axis:ocultar f="axispen003" c="CCODGESA"> 
                                            <td class="titulocaja" colspan="2">
                                                <b><axis:alt c="CCODGESA" f="axispen003" lit="9001778"/></b>                                         
                                            </td>                                    
                                       </axis:ocultar>                                                        
                                       <axis:ocultar f="axispen003" c="CCODDEPA"> 
                                            <td class="titulocaja">                                    
                                                <b><axis:alt c="CCODDEPA" f="axispen003" lit="9900832"/></b>                                        
                                            </td>                                    
                                       </axis:ocultar>
                                     </tr>  
                                     <tr>
                                        <axis:ocultar f="axispen003" c="CCODGESA"> 
                                             <td class="campocaja" colspan="2">
                                                <input  type="text" name="CCODGESA" id="CCODGESA" value="${__formdata.AXIS_FONDOS[0].OB_IAX_FONPENSIONES.CGESDGS}"  class="campowidthinput campo" readonly="true" style="width:10%"/>
                                                <input  type="text" name="TCODGES" id="TCODGES" value="${__formdata.AXIS_FONDOS[0].OB_IAX_FONPENSIONES.TNOMGES}" class="campowidthinput campo" readonly="true" style="width:80%"/>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axispen003" c="CCODDEPA"> 
                                            <td class="campocaja" colspan="2">
                                                <input  type="text" name="CCODDEPA" id="CCODDEPA" value="${__formdata.AXIS_FONDOS[0].OB_IAX_FONPENSIONES.CCODDEP}" class="campowidthinput campo" readonly="true" style="width:10%"/>
                                            
                                                <input  type="text" name="TCODDEP" id="TCODDEP" value="${__formdata.AXIS_FONDOS[0].OB_IAX_FONPENSIONES.TNOMDEP}" class="campowidthinput campo" readonly="true" style="width:80%"/>
                                            </td>
                                        </axis:ocultar>                                    
                                     </tr>     
                                     <tr>
                                        <axis:ocultar f="axispen003" c="CBANCAR"> 
                                            <td class="titulocaja">
                                                <b><axis:alt c="CBANCAR" f="axispen003" lit="9000533"/></b>                                    
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axispen003" c="CBANCARNOMBRE"> 
                                            <td class="titulocaja">
                                                <b><axis:alt c="CBANCARNOMBRE" f="axispen003" lit="9000964"/></b>                                    
                                            </td>
                                        </axis:ocultar>                                        
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axispen003" c="CBANCAR"> 
                                            <td class="campocaja">
                                                <input  type="text" name="CBANCAR" id="CBANCAR" value="${__formdata.AXIS_FONDOS[0].OB_IAX_FONPENSIONES.CBANCAR}" class="campowidthinput campo" readonly="true"/>
                                            </td>
                                        </axis:ocultar>                        
                                        <axis:ocultar f="axispen003" c="CBANCARNOMBRE"> 
                                            <td class="campocaja">
                                                <input  type="text" name="CBANCARNOMBRE" id="CBANCARNOMBRE" value="${__formdata.AXIS_FONDOS[0].OB_IAX_FONPENSIONES.TBANCO}" class="campowidthinput campo" readonly="true"/>
                                            </td>
                                        </axis:ocultar>                        
                                    </tr>                           
                                                
                                  <td>  
                                    <tr>
                                        <axis:ocultar f="axispen003" c="CTOMO">
                                            <td class="titulocaja">
                                                <b><axis:alt c="CTOMO" f="axispen003" lit="9900826"/></b>
                                            </td>
                                        </axis:ocultar>                                
                                        <axis:ocultar f="axispen003" c="CFOLIO"> 
                                            <td class="titulocaja">
                                                <b><axis:alt c="CFOLIO" f="axispen003" lit="9900827"/></b>
                                            </td>
                                        </axis:ocultar>
                                    
                                        <axis:ocultar f="axispen003" c="CHOJA"> 
                                            <td class="titulocaja">
                                                <b><axis:alt c="CHOJA" f="axispen003" lit="9900828"/></b>
                                            </td>
                                        </axis:ocultar>
                                    </tr>  
                                    <tr>
                                        <axis:ocultar f="axispen003" c="CTOMO"> 
                                            <td class="campocaja">
                                                <input  type="text" name="CTOMO" id="CTOMO" value="${__formdata.AXIS_FONDOS[0].OB_IAX_FONPENSIONES.NTOMO}" class="campowidthinput campo" readonly="true"
                                                style="width:25%" <axis:atr f="axispen003" c="CTOMO" a="modificable=false"/>/>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axispen003" c="CFOLIO"> 
                                            <td class="campocaja">
                                                <input  type="text" name="CFOLIO" id="CFOLIO" value="${__formdata.AXIS_FONDOS[0].OB_IAX_FONPENSIONES.NFOLIO}" class="campowidthinput campo" readonly="true"
                                                style="width:25%" <axis:atr f="axispen003" c="CFOLIO" a="modificable=false"/>/>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axispen003" c="CHOJA"> 
                                            <td class="campocaja">
                                                <input  type="text" name="CHOJA" id="CHOJA" value="${__formdata.AXIS_FONDOS[0].OB_IAX_FONPENSIONES.NHOJA}" class="campowidthinput campo" readonly="true"
                                                style="width:25%" <axis:atr f="axispen003" c="CHOJA" a="modificable=false"/>/>
                                            </td>
                                        </axis:ocultar>                                
                                    </tr>
                                 </td>                            
                              </table>
                             </td> 
                            </tr>  
                            <div class="separador">&nbsp;</div>                   
                        <!--Tercera part Planes Pensiones -->                    
                            <tr>
                              <td>
                            <!-- Lista de Fons -->
                              <div class="separador">&nbsp;</div>
                              <div class="separador">&nbsp;</div>   
                              <table class="area" align="center" id="tablaPla">                       
                                <tr>
                                  <th style="width:100%;height:0px"></th>                                                     
                                </tr>
                                <tr>
                                  <td>
                                      <div class="titulo">
                                        <img src="images/flecha.gif"/> <axis:alt c="PLANES_PEN" f="axispen003" lit="9900820"/><!-- Planes de pensiones -->
                                      </div>                                
                                        <c:set var="title0">&nbsp;</c:set>
                                        <c:set var="title1">
                                            <axis:alt c="COD_PLAN" f="axispen003" lit="1000109"/><!-- Código plan pensión -->
                                        </c:set>
                                        <c:set var="title2">
                                            <axis:alt c="NOMBRE" f="axispen003" lit="105940"/><!-- Nombre -->
                                        </c:set>
                                        <c:set var="title3">
                                            <axis:alt c="MODALIDAD" f="axispen003" lit="100943"/><!-- Modalidad -->
                                        </c:set>
                                        <c:set var="title4">
                                            <axis:alt c="SISTEMA" f="axispen003" lit="9900821"/><!-- Sistema -->
                                        </c:set>     
                                        <c:set var="title4">
                                            <axis:alt c="FALTA" f="axispen003" lit="9001192"/><!-- Fecha Alta -->
                                        </c:set>                                             
                                        
                                        <!--Imatge nou registre-->
                                        <div style="float:right;">
                                           <a href="javascript:f_alta_plan();"><img border="0" alt="<axis:alt c='NOU_REGISTRE' f='axispen003' lit='104825'/>" title="<axis:alt c='NOU_REGISTRE' f='axispen003' lit='104825'/>" src="images/new.gif"/></a>
                                        </div>                                    
                                        <!--Fi imatge nou registre--> 
                                        <div class="seccion  displayspace">  
                                            <display:table name="${__formdata.AXIS_FONDOS[0].OB_IAX_FONPENSIONES.PLANPENSIONES}"
                                                           id="miListaId"
                                                           export="false"
                                                           class="dsptgtable"
                                                           pagesize="-1"
                                                           requestURI="axis_axispen003.do?paginar=true"
                                                           sort="list"
                                                           cellpadding="0"
                                                           cellspacing="0">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title1}"
                                                                sortable="true"
                                                                sortProperty="CCODPLA"
                                                                headerClass="sortable fixed"
                                                                media="html"
                                                                autolink="false" style="width:10%">
                                                               
                                                   <div class="dspText">
                                                            ${miListaId.OB_IAX_PLANPENSIONES['CODDGS']}
                                                    </div>   
                                                </display:column>
                                                <display:column title="${title2}"
                                                                sortable="true"
                                                                sortProperty="TNOMPLA"
                                                                headerClass="sortable fixed"
                                                                media="html"
                                                                autolink="false"
                                                                style="width:40%">
                                                   <div class="dspText">
                                                            ${miListaId.OB_IAX_PLANPENSIONES['TNOMPLA']}
                                                    </div>                                               
                                                </display:column>
                                                <display:column title="${title3}"
                                                                sortable="true"
                                                                sortProperty="TMODALI"
                                                                headerClass="sortable fixed"
                                                                media="html"
                                                                autolink="false"
                                                                style="width:20%">
                                                   <div class="dspText">
                                                            ${miListaId.OB_IAX_PLANPENSIONES['TMODALI']}
                                                    </div>                                             
                                                </display:column>
                                                <display:column title="${title4}"
                                                                sortable="true"
                                                                sortProperty="TSISTEM"
                                                                headerClass="sortable fixed"
                                                                media="html"
                                                                autolink="false"
                                                                style="width:10%">
                                                   <div class="dspText">
                                                            ${miListaId.OB_IAX_PLANPENSIONES['TSISTEM']}
                                                    </div>                                             
                                                </display:column>
                                                <display:column title="${title5}"
                                                                sortable="true"
                                                                sortProperty="FALTARE"
                                                                headerClass="sortable fixed"
                                                                media="html"
                                                                autolink="false"  style="width:10%">
                                                   <div class="dspText"><fmt:formatDate value="${miListaId.OB_IAX_PLANPENSIONES['FALTARE']}" pattern="dd/MM/yy" />
                                                   </div>                                                                  
                                                </display:column>                                                 
                                                <display:column title="" sortable="false" sortProperty=""  style="width:5%" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                   <div class="dspIcons"><a href="javascript:f_modificar_pensio('${miListaId.OB_IAX_PLANPENSIONES['CCODPLA']}');"><img border="0" alt="<axis:alt c='CCODDEP02' f='axispen003' lit='9900815'/>" title="<axis:alt c='CCODDEP02' f='axispen003' lit='9900815'/>" src="images/lapiz.gif"/></a></div>
                                                </display:column>                                    
                                                </display:table>                                         
                                                <c:choose>
                                                    <c:when test="${!empty listaPlanes}">
                                                        <script language="javascript">//objUtiles.retocarDsptagtable("miListaId");</script>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <script language="javascript">
                                                        </script>
                                                    </c:otherwise>
                                                </c:choose>
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
        <c:param name="f">axispen003</c:param>
        <c:param name="__botones">salir</c:param>
    </c:import>
</form>
<c:import url="../include/mensajes.jsp" />
</body>
</html>

