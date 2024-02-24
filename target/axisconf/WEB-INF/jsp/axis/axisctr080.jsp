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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title>
            <axis:alt f="axisctr080" c="TITLE" lit="9001844"/>
        </title>
        <!--Gestió Transferències-->
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
        <c:import url="../include/carga_framework_js.jsp"/>
        <!--********** CALENDARIO ************************* -->
        <!-- Hoja de estilo del Calendario -->
        <link rel="stylesheet" type="text/css" media="all"
              href="styles/calendar-green.css" title="green"/>
        <!-- Script principal del calendario -->
        <script type="text/javascript" src="scripts/calendar.js"></script>
        <!-- Idioma del calendario, en función del Locale -->
        <script type="text/javascript"
                src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <!-- Setup del calendario -->
        <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        <!--*********************************** -->
        <script type="text/javascript">        
        
            function f_onload() {
            f_cargar_propiedades_pantalla();
            
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
                ORIGEN = document.miForm.origen.value;
                if (!objUtiles.estaVacio(ORIGEN) && ORIGEN == "axisage031"){
                    parent.f_cerrar_axisctr080();
                }else{
                    objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr080", "cancelar", document.miForm, "_self");
                }
            } 
            
            function f_but_9000745() {
                objUtiles.ejecutarFormulario ("axis_axisctr080.do", "listado", document.miForm, "_self", objJsMessages.jslit_cargando);    
            } 
            
            function f_cerrar_axisage006(){
                objUtiles.cerrarModal("axisage006");
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
    <body onload="f_onload()"><c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import><form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="origen" value="${__formdata.origen}"/>
            <input type="hidden" name="CEMPRES" value="${__formdata.CEMPRES}"/>
            <input type="hidden" name="NNUMLIN" value="${__formdata.NNUMLIN}"/>
            <input type="hidden" name="CLISTADO" value="854"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo">
                    <axis:alt f="axisctr080" c="TITULO" lit="9001941"/>
                </c:param>
                <c:param name="form">axisctr080</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo">
                    <axis:alt f="axisctr080" c="TITULO" lit="9000713"/>
                </c:param>
                <c:param name="nid" value="axisage006"/>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo">
                    <axis:alt f="axisctr080" c="TITULO" lit="9001947"/>
                </c:param>
                <c:param name="nid" value="axisctr081"/>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axisimprimir|
                    <axis:alt f="axisctr080" c="SUBTITULO" lit="1000205"/>
                    |true
                </c:param>
            </c:import>
            <table class="mainTableDimensions base" align="center"
                   cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px">
                                                &nbsp;
                                            </th>
                                            <th style="width:25%;height:0px">
                                                &nbsp;
                                            </th>
                                            <th style="width:25%;height:0px">
                                                &nbsp;
                                            </th>
                                            <th style="width:25%;height:0px">
                                                &nbsp;
                                            </th>
                                        </tr>
                                        <tr>
                                            <td class="campocaja" colspan="4">
                                                <div class="separador">&nbsp;</div>
                                                <div class="titulo">
                                                    <img src="images/flecha.gif"/><axis:alt f="axisctr080"
                                                                                            c="TITULO"
                                                                                            lit="9000521"/>
                                                     
                                                    <img id="find" border="0"
                                                         src="images/find.gif"
                                                         onclick="f_abrir_axisage006()"
                                                         style="cursor:pointer"/>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisctr004"
                                                          c="TEMPRES"
                                                          dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr080"
                                                                 c="TITULO"
                                                                 lit="101619"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr004"
                                                          c="CAGENTE"
                                                          dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr080"
                                                                 c="TITULO"
                                                                 lit="100584"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr004"
                                                          c="TAGENTE"
                                                          dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr080"
                                                                 c="TITULO"
                                                                 lit="105940"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr004"
                                                          c="SALDO"
                                                          dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr080"
                                                                 c="TITULO"
                                                                 lit="9001942"/></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisctr004"
                                                          c="TEMPRES"
                                                          dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text"
                                                           class="campo campotexto"
                                                           size="15"
                                                           value="${__formdata.TEMPRES}"
                                                           name="TEMPRES"
                                                           id="TEMPRES"
                                                           <axis:atr f="axisctr080" c="TEMPRES" a="modificable=false"/>/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr004"
                                                          c="CAGENTE"
                                                          dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text"
                                                           class="campo campotexto"
                                                           size="15"
                                                           value="${__formdata.CAGENTE}"
                                                           name="CAGENTE"
                                                           id="CAGENTE"
                                                           <axis:atr f="axisctr080" c="CAGENTE" a="modificable=false"/>/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr004"
                                                          c="TAGENTE"
                                                          dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text"
                                                           class="campo campotexto"
                                                           size="15"
                                                           value="${__formdata.TAGENTE}"
                                                           name="TAGENTE"
                                                           id="TAGENTE"
                                                           <axis:atr f="axisctr080" c="TAGENTE" a="modificable=false"/>/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr004"
                                                          c="SALDO"
                                                          dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text"
                                                           class="campo campotexto"
                                                           style="width:90%"
                                                           size="15"
                                                           value='<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.SALDO}"/>'
                                                           name="SALDO"
                                                           id="SALDO"
                                                           title='<axis:alt f="axisctr080" c="TITULO" lit="1000529"/>'
                                                           <axis:atr f="axisctr080" c="SALDO" a="modificable=false"/>/>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <td class="campocaja" colspan="4">
                                                <div class="separador">&nbsp;</div>
                                                <div style="float:left;">
                                                    <div class="titulo">
                                                        <img src="images/flecha.gif"/><axis:alt f="axisctr080"
                                                                                                c="TITULO"
                                                                                                lit="9001943"/>
                                                    </div>
                                                </div>
                                                <c:if test="${__formdata.CMODO ne 'CONSULTA'}">
	                                                <div style="float:right;">
	                                                    <axis:visible f="axisctr080"
	                                                                  c="NEW_CUENTATEC">
	                                                        <a href="javascript:f_gestion_linea('1')">
	                                                            <img border="0"
	                                                                 src="images/new.gif"/>
	                                                        </a>
	                                                    </axis:visible>
	                                                </div>
	                                             </c:if>
                                            </td>
                                        </tr>
                                        <axis:ocultar f="axisctr004"
                                                      c="DSP_CUENTAS"
                                                      dejarHueco="false">
                                            <tr>
                                                <td class="campocaja"
                                                    colspan="4">
                                                    <c:set var="title0">
                                                        <axis:alt f="axisctr080"
                                                                  c="TITULO"
                                                                  lit="9001727"/>
                                                    </c:set>
                                                    <c:set var="title1">
                                                        <axis:alt f="axisctr080"
                                                                  c="TITULO"
                                                                  lit="100565"/>
                                                    </c:set>
                                                    <c:set var="title2">
                                                        <axis:alt f="axisctr080"
                                                                  c="TITULO"
                                                                  lit="100562"/>
                                                    </c:set>
                                                    <c:set var="title3">
                                                        <axis:alt f="axisctr080"
                                                                  c="TITULO"
                                                                  lit="100587"/>
                                                    </c:set>
                                                    <c:set var="title4">
                                                        <axis:alt f="axisctr080"
                                                                  c="TITULO"
                                                                  lit="9000715"/>
                                                    </c:set>
                                                    <c:set var="title5">
                                                        <axis:alt f="axisctr080"
                                                                  c="TITULO"
                                                                  lit="9000499"/>
                                                    </c:set>
                                                    <c:set var="title6">
                                                        <axis:alt f="axisctr080"
                                                                  c="TITULO"
                                                                  lit="9000500"/>
                                                    </c:set>
                                                    <c:set var="title7">
                                                        <axis:alt f="axisctr080"
                                                                  c="TITULO"
                                                                  lit="100588"/>
                                                    </c:set>
                                                    <c:set var="title8">
                                                        <axis:alt f="axisctr080"
                                                                  c="TITULO"
                                                                  lit="9001942"/>
                                                    </c:set>
                                                    <c:set var="title9">
                                                        <axis:alt f="axisctr080"
                                                                  c="TITULO"
                                                                  lit="1000590"/>
                                                    </c:set>
                                                    <c:set var="title10">
                                                        <axis:alt f="axisctr080"
                                                                  c="TITULO"
                                                                  lit="9901169"/>
                                                    </c:set>
                                                    <c:set var="title11">
                                                        <axis:alt f="axisctr080"
                                                                  c="TITULO11"
                                                                  lit="101006"/>
                                                    </c:set>
                                                    <div class="displayspaceGrande">
                                                        <display:table name="${__formdata.cuentas}"
                                                                       id="miListaId"
                                                                       export="false"
                                                                       style="width:98%;"
                                                                       class="dsptgtable"
                                                                       pagesize="-1"
                                                                       sort="list"
                                                                       cellpadding="0"
                                                                       cellspacing="0"
                                                                       requestURI="axis_axisctr080.do?paginar=true">
                                                            <%@ include file="../include/displaytag.jsp"%>
                                                            <axis:visible c="FFECMOV"
                                                                          f="axisctr080">
                                                                <display:column title="${title11}"
                                                                                sortable="true"
                                                                                style="width:7%;"
                                                                                sortProperty="FFECMOV"
                                                                                headerClass="sortable fixed"
                                                                                media="html"
                                                                                autolink="false">
                                                                    <div class="dspText">
                                                                        <fmt:formatDate pattern="dd/MM/yyyy"
                                                                                        value="${miListaId.FFECMOV}"/>
                                                                    </div>
                                                                </display:column>
                                                               </axis:visible>
                                                            <axis:visible c="NNUMLIN"
                                                                          f="axisctr080">
                                                                <display:column title="${title0}"
                                                                                sortable="true"
                                                                                style="width:4%;"
                                                                                sortProperty="NNUMLIN"
                                                                                headerClass="sortable fixed"
                                                                                media="html"
                                                                                autolink="false">
                                                                    <div class="dspNumber">
                                                                        ${miListaId['NNUMLIN']}
                                                                    </div>
                                                                </display:column>
                                                            </axis:visible>
                                                            <axis:visible c="TIPOLIN"
                                                                          f="axisctr080">
                                                                <display:column title="${title1}"
                                                                                sortable="true"
                                                                                style="width:7%;"
                                                                                sortProperty="TIPOLIN"
                                                                                headerClass="sortable fixed"
                                                                                media="html"
                                                                                autolink="false">
                                                                    <div class="dspText">
                                                                        ${miListaId['TIPOLIN']}
                                                                    </div>
                                                                </display:column>
                                                            </axis:visible>
                                                            <axis:visible c="CFISCAL"
                                                                          f="axisctr080">
                                                                <display:column title="${title10}"
                                                                                sortable="true"
                                                                                style="width:5%;"
                                                                                sortProperty="TFISCAL"
                                                                                headerClass="sortable fixed"
                                                                                media="html"
                                                                                autolink="false">
                                                                    <div class="dspText">
                                                                        ${miListaId['TFISCAL']}
                                                                    </div>
                                                                </display:column>
                                                            </axis:visible>
                                                            <axis:visible c="FVALOR"
                                                                          f="axisctr080">
                                                                <display:column title="${title9}"
                                                                                sortable="true"
                                                                                style="width:7%;"
                                                                                sortProperty="FVALOR"
                                                                                headerClass="sortable fixed"
                                                                                media="html"
                                                                                autolink="false">
                                                                    <div class="dspText">
                                                                        <fmt:formatDate pattern="dd/MM/yyyy"
                                                                                        value="${miListaId.FVALOR}"/>
                                                                    </div>
                                                                </display:column>
                                                            </axis:visible>
                                                            <axis:visible c="TESTADO"
                                                                          f="axisctr080">
                                                                <display:column title="${title3}"
                                                                                sortable="true"
                                                                                style="width:8%;"
                                                                                sortProperty="TIPOLIN"
                                                                                headerClass="sortable fixed"
                                                                                media="html"
                                                                                autolink="false">
                                                                    <div class="dspText">
                                                                        ${miListaId['TESTADO']}
                                                                    </div>
                                                                </display:column>
                                                            </axis:visible>
                                                            <axis:visible c="CONCEPTO"
                                                                          f="axisctr080">
                                                                <display:column title="${title4}"
                                                                                sortable="true"
                                                                                style="width:21%;"
                                                                                sortProperty="CONCEPTO"
                                                                                headerClass="sortable fixed"
                                                                                media="html"
                                                                                autolink="false">
                                                                    <div style="float:left;text-align:left;padding-left:10px;padding-right:5px;">
                                                                        ${miListaId['CONCEPTO']}
                                                                    </div>
                                                                    <c:if test="${miListaId[\'CCONCTA\'] == 98}">
                                                                        <div style="float:right;text-align:right;padding-right:10px;padding-left:5px;">
                                                                            <c:if test="${miListaId[\'CESTPAG\'] == 1}">
                                                                                <img border="0"
                                                                                     alt='<axis:alt f="axisctr080" c="TITULO" lit="9901193"/>'
                                                                                     title1='<axis:alt f="axisctr080" c="TITULO" lit="9901193"/>'
                                                                                     src="images/formulap.gif"
                                                                                     width="17px"
                                                                                     height="17px"
                                                                                     style="cursor:pointer;"/>
                                                                            </c:if>
                                                                             
                                                                            <c:if test="${miListaId[\'CESTPAG\'] != 1}">
                                                                                <img border="0"
                                                                                     alt='<axis:alt f="axisctr080" c="TITULO" lit="9901194"/>'
                                                                                     title1='<axis:alt f="axisctr080" c="TITULO" lit="9901194"/>'
                                                                                     src="images/formulap_red.gif"
                                                                                     width="17px"
                                                                                     height="17px"
                                                                                     style="cursor:pointer;"/>
                                                                            </c:if>
                                                                        </div>
                                                                    </c:if>
                                                                </display:column>
                                                            </axis:visible>
                                                            <axis:visible c="IDEBE"
                                                                          f="axisctr080">
                                                                <display:column title="${title5}"
                                                                                sortable="true"
                                                                                style="width:7%;"
                                                                                sortProperty="IDEBE"
                                                                                headerClass="sortable fixed"
                                                                                media="html"
                                                                                autolink="false">
                                                                    <div class="dspNumber">
                                                                        <c:choose>
                                                                            <c:when test="${miListaId[\'CCONCTA\']==0}">
                                                                                <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}"
                                                                                                  value="0"/>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}"
                                                                                                  value="${miListaId[\'IDEBE\']}"/>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </div>
                                                                </display:column>
                                                            </axis:visible>
                                                            <axis:visible c="IHABER"
                                                                          f="axisctr080">
                                                                <display:column title="${title6}"
                                                                                sortable="true"
                                                                                style="width:7%;"
                                                                                sortProperty="IHABER"
                                                                                headerClass="sortable fixed"
                                                                                media="html"
                                                                                autolink="false">
                                                                    <div class="dspNumber">
                                                                        <c:choose>
                                                                            <c:when test="${miListaId[\'CCONCTA\']==0}">
                                                                                <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}"
                                                                                                  value="0"/>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}"
                                                                                                  value="${miListaId[\'IHABER\']}"/>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </div>
                                                                </display:column>
                                                            </axis:visible>
                                                            <axis:visible c="TDESCRIP"
                                                                          f="axisctr080">
                                                                <display:column title="${title7}"
                                                                                sortable="true"
                                                                                style="width:21%;"
                                                                                sortProperty="TDESCRIP"
                                                                                headerClass="sortable fixed"
                                                                                media="html"
                                                                                autolink="false">
                                                                    <div class="dspText">
                                                                        ${miListaId['TDESCRIP']}
                                                                    </div>
                                                                </display:column>
                                                            </axis:visible>
                                                            <axis:visible c="ISALDO"
                                                                          f="axisctr080">
                                                                <display:column title="${title8}"
                                                                                sortable="true"
                                                                                style="width:8%;"
                                                                                sortProperty="ISALDO"
                                                                                headerClass="sortable fixed"
                                                                                media="html"
                                                                                autolink="false">
                                                                    <div class="dspNumber">
                                                                        <c:choose>
                                                                            <c:when test="${miListaId[\'CCONCTA\']==0}">
                                                                                <c:choose>
                                                                                    <c:when test="${miListaId[\'IHABER\']>0}">
                                                                                        <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}"
                                                                                                          value="${miListaId[\'IHABER\']*(-1)}"/>
                                                                                    </c:when>
                                                                                    <c:when test="${miListaId[\'IDEBE\']>0}">
                                                                                        <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}"
                                                                                                          value="${miListaId[\'IDEBE\']}"/>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}"
                                                                                                          value="${0}"/>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}"
                                                                                                  value="${0}"/>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </div>
                                                                </display:column>
                                                            </axis:visible>
                                                            <axis:visible f="axisctr080"
                                                                          c="BT_SIN_EDITAR">
                                                                <display:column title=""
                                                                                headerClass="sortable fixed"
                                                                                media="html"
                                                                                style="width:3%;"
                                                                                autolink="false">
                                                                    <c:if test="${miListaId[\'CESTADO\'] !=0 && miListaId[\'CMANUAL\'] == 0}">
                                                                        <div class="dspIcons">
                                                                            <img border="0"
                                                                                 alt='<axis:alt f="axisctr080" c="TITULO" lit="100002"/>'
                                                                                 title1='<axis:alt f="axisctr080" c="TITULO" lit="100002"/>'
                                                                                 src="images/lapiz.gif"
                                                                                 width="15px"
                                                                                 height="15px"
                                                                                 style="cursor:pointer;"
                                                                                 onclick="f_gestion_linea('0','${miListaId['NNUMLIN']}')"/>
                                                                        </div>
                                                                    </c:if>
                                                                    <c:if test="${miListaId[\'CESTADO\'] !=0 && miListaId[\'CMANUAL\'] == 1 }">
                                                                        <div class="dspIcons">
                                                                            <img border="0"
                                                                                 alt='<axis:alt f="axisctr080" c="TITULO" lit="1000439"/>'
                                                                                 title1='<axis:alt f="axisctr080" c="TITULO" lit="1000439"/>'
                                                                                 src="images/mas.gif"
                                                                                 width="11px"
                                                                                 height="11px"
                                                                                 style="cursor:pointer;"
                                                                                 onclick="f_gestion_linea('2','${miListaId['NNUMLIN']}')"/>
                                                                        </div>
                                                                    </c:if>
                                                                </display:column>
                                                            </axis:visible>
                                                            <axis:visible f="axisctr080"
                                                                          c="BT_SIN_DELETE">
                                                                <display:column title=""
                                                                                headerClass="sortable fixed"
                                                                                media="html"
                                                                                style="width:3%;"
                                                                                autolink="false">
                                                                    <c:if test="${miListaId[\'CESTADO\'] !=0 && miListaId[\'CMANUAL\'] == 0}">
                                                                        <div class="dspIcons">
                                                                            <img border="0"
                                                                                 alt='<axis:alt f="axisctr080" c="TITULO" lit="1000127"/>'
                                                                                 title1='<axis:alt f="axisctr080" c="TITULO" lit="1000127"/>'
                                                                                 src="images/delete.gif"
                                                                                 width="15px"
                                                                                 height="15px"
                                                                                 style="cursor:pointer;"
                                                                                 onclick="javascript:f_borrar_cta('${miListaId['CEMPRES']}','${miListaId['CAGENTE']}','${miListaId['NNUMLIN']}');"/>
                                                                        </div>
                                                                    </c:if>
                                                                </display:column>
                                                            </axis:visible>
                                                        </display:table>
                                                    </div>
                                                </td>
                                            </tr>
                                        </axis:ocultar>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <c:if test="${!empty __formdata.LIST_FICHEROS}">
                    <tr>
                        <td>
                            <div class="separador">&nbsp;</div>
                            <div class="titulo">
                                <img src="images/flecha.gif"/><axis:alt f="axisctr080"
                                                                        c="listaImpresion"
                                                                        lit="112247"/>
                            </div>
                            <table class="seccion">
                                <tr>
                                    <th style="width:30%;height:0px">
                                        &nbsp;
                                    </th>
                                    <th style="width:35%;height:0px">
                                        &nbsp;
                                    </th>
                                    <th style="width:35%;height:0px">
                                        &nbsp;
                                    </th>
                                </tr>
                                <tr>
                                    <td>
                                        <c:set var="title0">
                                            <axis:alt f="axisctr080" c="title0"
                                                      lit="107913"/>
                                        </c:set>
                                        <div class="displayspaceMaximo">
                                            <display:table name="${__formdata.LIST_FICHEROS}"
                                                           id="ReportsList"
                                                           export="false"
                                                           class="dsptgtable"
                                                           pagesize="-1"
                                                           cellpadding="0"
                                                           cellspacing="0"
                                                           requestURI="axis_axisadm031.do?paginar=true">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title0}"
                                                                headerClass="headwidth10 sortable"
                                                                media="html"
                                                                autolink="false">
                                                    <div class="dspText">
                                                        <div style="cursor:pointer"
                                                             onclick="objUtiles.abrirModal('axisimprimir', 'src', 'modal_axisimprimir.do?operation=tunnel&file='+escape( (this.innerText!=undefined)?this.innerText:this.textContent))">
                                                            <u>
                                                                ${ReportsList.OB_IAX_IMPRESION.FICHERO}
                                                            </u>
                                                        </div>
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
                </c:if>
            </table>
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisctr080</c:param>
                <c:param name="__botones">salir,<axis:visible c="BT_LISTADO" f="axisctr080">9000745,</axis:visible></c:param>
            </c:import>
        </form><c:import url="../include/mensajes.jsp"/></body>
</html>