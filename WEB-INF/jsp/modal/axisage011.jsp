<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%/**
*  Fichero: axisage011.jsp
*
*  Fecha: 10/03/2014
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>     

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
        <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
        <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/tree.css" type="text/css"></link>
        <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green"/>
        <script type="text/javascript" src="scripts/calendar.js"></script>
        <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        <c:import url="../include/carga_framework_js.jsp"/>
        
        <script type="text/javascript">
          /****************************************************************************************/
          /*********************************** NAVEGACION *****************************************/
          /****************************************************************************************/
 
          function f_onload() {
              f_cargar_propiedades_pantalla();
          }
 
          function f_but_cancelar() {
              parent.f_cerrar_axisage011();
          }
          
          function f_but_buscar() {
            if (objValidador.validaEntrada()) {
              objUtiles.ejecutarFormulario("modal_axisage011.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
          }
    
          function f_but_aceptar() {
            if (!objUtiles.estaVacio(objDom.getValorPorId("FFINCAM_AGE")) && fechaMayorOIgualQue(objDom.getValorPorId("FINICAM"), objDom.getValorPorId("FFINCAM_AGE"))) {
                alert('<axis:alt f="${pantalla}" c="ERROR_FFINCAM_AGE" lit="101922"/>');
            } else if (!objUtiles.estaVacio(objDom.getValorPorId("FINICAM_AGE")) && fechaMayorQue(objDom.getValorPorId("FINICAM"), objDom.getValorPorId("FINICAM_AGE"))) {
                alert('<axis:alt f="${pantalla}" c="ERROR_FINICAM_AGE" lit="101922"/>');
            } else if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisage011.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }  
          }
    
          function f_but_marcar_todo(marcar){
            var inputs=document.getElementsByTagName("input");
                for(i=0;i<inputs.length;i++) {
                    if (inputs[i].type=="checkbox") {
                        if (inputs[i].name.indexOf("checked_marcar_"==0)) {
                            if (marcar == 0)
                            inputs[i].checked = false;
                            else
                            inputs[i].checked = true;
                        }
                    }
                    
                }
                var strURL="modal_axisage011.do?operation=marcar_json&MARCAR="+marcar;
                var ajaxTexto=objJsMessages.jslit_cargando;
                objAjax.invokeAsyncCGI_JSON(strURL, callbackselected, ajaxTexto);
            
            }
            
            function f_but_marcar(thiss,CAGENTE){
                marcado = thiss.checked?1:0;
                var strURL="modal_axisage011.do?operation=marcar_json&MARCAR="+marcado+"&CAGENTE="+CAGENTE;
                var ajaxTexto=objJsMessages.jslit_cargando;
                objAjax.invokeAsyncCGI_JSON(strURL, callbackselected, ajaxTexto);
            }
            
            function callbackselected(p) {
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
                if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                    if (!objUtiles.estaVacio(p.JSON2.CAGENTE)) {
                        //document.miForm.CAGENTE.value = p.JSON2.CAGENTE;
                    } else {
                        //document.miForm.CAGENTE.value = '';
                    }
                }
            }
            
            function f_but_9000756() {
                f_but_marcar_todo(1);
            }
            
            function f_but_9000757() {
                f_but_marcar_todo(0);
            }       
            
            function fechaMayorOIgualQue(fec0, fec1) {
              var bRes = false;
              var sDia0 = fec0.substr(0, 2);
              var sMes0 = fec0.substr(3, 2);
              var sAno0 = fec0.substr(6, 4);
              var sDia1 = fec1.substr(0, 2);
              var sMes1 = fec1.substr(3, 2);
              var sAno1 = fec1.substr(6, 4);
              if (sAno0 > sAno1)
                  bRes = true;
              else {
                  if (sAno0 == sAno1) {
                      if (sMes0 > sMes1)
                          bRes = true;
                      else {
                          if (sMes0 == sMes1)
                              if (sDia0 >= sDia1)
                                  bRes = true;
                      }
                  }
              }
              return bRes;
          }
          
          function fechaMayorQue(fec0, fec1) {
              var bRes = false;
              var sDia0 = fec0.substr(0, 2);
              var sMes0 = fec0.substr(3, 2);
              var sAno0 = fec0.substr(6, 4);
              var sDia1 = fec1.substr(0, 2);
              var sMes1 = fec1.substr(3, 2);
              var sAno1 = fec1.substr(6, 4);
              if (sAno0 > sAno1) {
                  bRes = true;
              } else {
                  if (sMes0 > sMes1) {
                      bRes = true;
                  } else {
                          if (sDia0 > sDia1){
                              bRes = true;
                          }
                  }
              }
              return bRes;
          }
        </script>
    </head>
    <body  onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="modal_axisage011.do" method="POST">
            <c:if test="${__formdata.isAsignar == 'true'}">  
        <c:import url="../include/titulo_nt.jsp">
                    <c:param name="formulario"><axis:alt f="axisage010" c="TITULO" lit="9001304"/></c:param>
                    <c:param name="titulo"><axis:alt f="axisage011" c="TITULO" lit="9001304"/></c:param> 
                    <c:param name="form">axisage011</c:param>
        </c:import>
            </c:if>
            <c:if test="${__formdata.isDesasignar == 'true'}">  
        <c:import url="../include/titulo_nt.jsp">
                    <c:param name="formulario"><axis:alt f="axisage010" c="TITULO" lit="9902356"/></c:param>
                    <c:param name="titulo"><axis:alt f="axisage011" c="TITULO" lit="9902356"/></c:param> 
                    <c:param name="form">axisage011</c:param>
        </c:import>
            </c:if>
            <c:if test="${__formdata.isGanadores == 'true'}">  
        <c:import url="../include/titulo_nt.jsp">
                    <c:param name="formulario"><axis:alt f="axisage010" c="TITULO" lit="9902355"/></c:param>
                    <c:param name="titulo"><axis:alt f="axisage011" c="TITULO" lit="9902355"/></c:param> 
                    <c:param name="form">axisage011</c:param>
        </c:import>
            </c:if>
            
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" name="isAsignar" id="isAsignar" value="${__formdata.isAsignar}"/>        
            <input type="hidden" name="isDesasignar" id="isDesasignar" value="${__formdata.isDesasignar}"/>        
            <input type="hidden" name="isGanadores" id="isGanadores" value="${__formdata.isGanadores}"/>   
            <input type="hidden" name="CCODIGO_CAMPA" id="CCODIGO" value="${__formdata.CCODIGO_CAMPA}"/>
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">
                            <tr>
                                <td align="center">
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0%;"></th>
                                            <th style="width:25%;height:0%;"></th>
                                            <th style="width:25%;height:0%;"></th>
                                            <th style="width:25%;height:0%;"></th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisage011" c="CCODIGO">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisage011" c="CCODIGO" lit="103465"/></b>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisage011" c="TDESCRIP">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisage011" c="TDESCRIP" lit="9900734"/></b>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisage011" c="FINICAM">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisage011" c="FINICAM" lit="9000526"/></b>
                                            </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                          <axis:ocultar f="axisage011" c="CCODIGO">
                                            <td class="campocaja">
                                              <input id="CCODIGO" name="CCODIGO" type="text" class="campo campotexto" style="width:30%" maxlength="4"
                                                     title=<axis:alt f="axisage011" c="CCODIGO" lit="103465"/>
                                                     alt=<axis:alt f="axisage011" c="CCODIGO" lit="103465"/>
                                                     value="${__formdata.CCODIGO}"
                                                     <axis:atr f="axisage011" c="CCODIGO" a="modificable=false&obligatorio=false"/>/>
                                            </td>
                                          </axis:ocultar>
                                          <axis:ocultar f="axisage011" c="TDESCRIP">
                                            <td class="campocaja">
                                              <input id="TDESCRIP" name="TDESCRIP" type="text" class="campo campotexto" style="width:100%" maxlength="120"
                                                     title=<axis:alt f="axisage011" c="TDESCRIP" lit="9900734" />
                                                     alt=<axis:alt f="axisage011" c="TDESCRIP" lit="9900734"/> 
                                                     <axis:atr f="axisage011" c="TDESCRIP" a="modificable=false&obligatorio=false"/>
                                                     value="${__formdata.TDESCRIP}"/>
                                            </td>
                                          </axis:ocultar>
                                          <axis:ocultar f="axisage011" c="FINICAM">
                                            <td class="campocaja">  
                                              <input type="text" class="campo campotexto" size="15" style="width:35%;"
                                                     value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINICAM}"/>"
                                                     name="FINICAM" id="FINICAM"
                                                     title="<axis:alt f='axisage011' c='FINICAM' lit='9000526'/>"
                                                     alt="<axis:alt f='axisage011' c='FINICAM' lit='9000526'/>" 
                                                     <axis:atr f="axisage011" c="FINICAM" a="modificable=false&obligatorio=false&formato=fecha"/> />
                                            </td>
                                          </axis:ocultar>
                                        </tr>      
                                        <tr>
                                            <axis:ocultar f="axisage011" c="CTIPAGE">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisage011" c="CTIPAGE" lit="9902362"/></b>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisage011" c="CAGENTE">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisage011" c="CAGENTE" lit="9000531"/></b>
                                            </td>
                                            </axis:ocultar> 
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisage011" c="CTIPAGE">
                                            <td class="campocaja">
                                              <select name="CTIPAGE" id="CTIPAGE" size="1" class="campowidthselect campo campotexto" style="width:95%;">
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage011" c="CTIPAGE_VALOR" lit="1000348"/> - </option>
                                                    <c:forEach var="item" items="${__formdata.LISTVALORES.LSTTIPOAGENTE}">
                                                        <option value="${item.CATRIBU}" <c:if test="${item.CATRIBU  == __formdata.CTIPAGE}">selected</c:if>>
                                                            ${item.TATRIBU} 
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisage011" c="CTIPAGE">
                                            <td class="campocaja">
                                              <input id="CAGENTE" name="CAGENTE" type="text" class="campo campotexto" style="width:30%" 
                                                     title=<axis:alt f="axisage011" c="CAGENTE" lit="9000531"/>
                                                     alt=<axis:alt f="axisage011" c="CAGENTE" lit="9000531"/>
                                                     value="${__formdata.CAGENTE}"
                                                     <axis:atr f="axisage011" c="CAGENTE" a="modificable=true&obligatorio=false"/>/>
                                            </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                          <c:if test="${__formdata.isAsignar == 'true'}">    
                                          <axis:ocultar f="axisage011" c="FINICAM_AGE">
                                            <td class="titulocaja" colspan="1">
                                              <b><axis:alt f="axisage011" c="FINICAM_AGE" lit="9000526"/></b>
                                            </td>
                                          </axis:ocultar>
                                          </c:if>  
                                          <c:if test="${__formdata.isDesasignar == 'true'}">    
                                          <axis:ocultar f="axisage011" c="FFINCAM_AGE">
                                            <td class="titulocaja" colspan="1">
                                              <b><axis:alt f="axisage011" c="FFINCAM_AGE" lit="9000527"/></b>
                                            </td>
                                          </axis:ocultar>
                                          </c:if>
                                          <c:if test="${__formdata.isAsignar == 'true'}">    
                                          <axis:visible f="axisage011" c="IMETA">
                                            <td class="titulocaja" colspan="1">
                                              <b><axis:alt f="axisage011" c="IMETA" lit="9908882"/></b>
                                            </td>
                                          </axis:visible>
                                          </c:if>
                                        </tr>
                                        <tr>
                                          <c:if test="${__formdata.isAsignar == 'true'}">  
                                          <axis:ocultar f="axisage011" c="FINICAM_AGE">
                                            <td class="campocaja">
                                              <input type="text" class="campo campotexto" size="15" style="width:35%;"
                                                     value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINICAM_AGE}"/>"
                                                     name="FINICAM_AGE" id="FINICAM_AGE"
                                                     title="<axis:alt f='axisage011' c='FINICAM_AGE' lit='9000526'/>"
                                                     alt="<axis:alt f='axisage011' c='FINICAM_AGE' lit='9000526'/>" 
                                                     <axis:atr f="axisage011" c="FINICAM_AGE" a="modificable=true&obligatorio=true&formato=fecha"/> />
                                                     <a style="vertical-align:middle;">
                                                <img id="icon_FINICAM_AGE" alt='<axis:alt f="axisage011" c="FINICAM_AGE" lit="9000526"/>'
                                                     title='<axis:alt f="axisage011" c="FINICAM_AGE" lit="9000526" />'
                                                     src="images/calendar.gif"/></a>
                                            </td>
                                          </axis:ocultar>
                                          </c:if>  
                                          <c:if test="${__formdata.isDesasignar == 'true'}">  
                                          <axis:ocultar f="axisage011" c="FFINCAM_AGE">
                                            <td class="campocaja">
                                              <input type="text" class="campo campotexto" size="15" style="width:35%;"
                                                     value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINCAM_AGE}"/>"
                                                     name="FFINCAM_AGE" id="FFINCAM_AGE"
                                                     title="<axis:alt f='axisage011' c='FFINCAM_AGE' lit='9000527'/>"
                                                     alt="<axis:alt f='axisage011' c='FFINCAM_AGE' lit='9000527'/>" 
                                                     <axis:atr f="axisage011" c="FFINCAM_AGE" a="modificable=true&obligatorio=true&formato=fecha"/> />
                                                     <a style="vertical-align:middle;">
                                                <img id="icon_FFINCAM_AGE" alt='<axis:alt f="axisage011" c="FFINCAM_AGE" lit="9000527"/>'
                                                     title='<axis:alt f="axisage011" c="FFINCAM_AGE" lit="9000527" />'
                                                     src="images/calendar.gif"/></a>
                                            </td>
                                          </axis:ocultar>
                                          </c:if>
                                         
                                            <c:if test="${__formdata.isAsignar == 'true'}">  
                                                <axis:ocultar f="axisage011" c="IMETA">
                                                <td class="campocaja">
                                                  <input id="IMETA" name="IMETA" type="text" class="campo campotexto" style="width:100%" maxlength="120"
                                                         title=<axis:alt f="axisage011" c="IMETA" lit="9908882" />
                                                         alt=<axis:alt f="axisage011" c="IMETA" lit="9908882"/> 
                                                         <axis:atr f="axisage011" c="IMETA" a="modificable=true&obligatorio=false"/>/>
                                                        < value="${__formdata.IMETA}"/>
                                                </axis:ocultar>
                                           </c:if>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                <div class="separador">&nbsp; </div>  
                                    <c:set var="title1"><axis:alt f="axisage011" c="AGENTE" lit="100584"/></c:set>  
                                    <c:set var="title2"><axis:alt f="axisage011" c="TAGENTE" lit="105940"/></c:set>  
                                    <c:set var="title3"><axis:alt f="axisage011" c="SELAGE" lit="103496"/></c:set>                                 
                
                                    <div class="displayspaceGrande">
                                        <display:table name="${sessionScope.axisage011_lista}" id="LSTAGENTES" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0" style="width:100%"
                                             requestURI="modal_axisage011.do?paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%> 
                                            <display:column title="${title3}" sortable="true" sortProperty="NAGENTE" headerClass="sortable"  
                                                            media="html" autolink="false" style="width:5%">
                                                <div class="dspIcons"> 
                                                    <input type="checkbox" id="checked_marcar_${LSTAGENTES.OB_IAX_CAMPAAGE.CAGENTE}" 
                                                           name="checked_marcar_${LSTAGENTES.OB_IAX_CAMPAAGE.CAGENTE}" 
                                                           <c:if test="${LSTAGENTES.MARCAR == 1}"> checked </c:if>  
                                                           value="" onclick="f_but_marcar(this,'${LSTAGENTES.OB_IAX_CAMPAAGE.CAGENTE}')"/>
                                                </div>
                                            </display:column>
                                            <axis:visible f="axisage011" c="CAGENTE">
                                                <display:column title="${title1}" sortable="true" sortProperty="CAGENTE" style="width:25%" headerClass="sortable fixed"  media="html" autolink="false">
                                                    <div class="dspText">${LSTAGENTES.OB_IAX_CAMPAAGE.CAGENTE}</div>
                                                </display:column>
                                            </axis:visible>
                                            <axis:visible f="axisage011" c="TAGENTE">
                                                <display:column title="${title2}" sortable="true" sortProperty="TAGENTE"  style="width:70%" headerClass="sortable fixed"  media="html" autolink="false">
                                                    <div class="dspText">${LSTAGENTES.OB_IAX_CAMPAAGE.TAGENTE}</div>
                                                </display:column>
                                            </axis:visible>                                   
                                        </display:table>                                                        
                                    </div>
                                    <div class="separador">&nbsp; </div>  
                                </td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>                                                         
                    </td>
                </tr>
            </table>
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisage011</c:param>
                <c:param name="__botones">cancelar,9000756,9000757,buscar,aceptar</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
        <script type="text/javascript">
          Calendar.setup( {
              inputField : "FFINCAM_AGE", ifFormat : "%d/%m/%Y", button : "icon_FFINCAM_AGE", singleClick : true, firstDay : 1
          });
          Calendar.setup( {
              inputField : "FINICAM_AGE", ifFormat : "%d/%m/%Y", button : "icon_FINICAM_AGE", singleClick : true, firstDay : 1
          });
        </script>    
    </body>
</html>