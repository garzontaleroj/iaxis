<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%/**
*  Fichero: axisage009.jsp
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
          parent.f_cerrar_axisage009();
      }

      function f_but_buscar() {
          if (!objUtiles.estaVacio(objDom.getValorPorId("FFINCAM")) && fechaMayorOIgualQue(objDom.getValorPorId("FINICAM"), objDom.getValorPorId("FFINCAM"))) {
              alert('<axis:alt f="${pantalla}" c="ERROR_FFINCAM" lit="101922"/>');
          }
          else if (objValidador.validaEntrada()) {
              objUtiles.ejecutarFormulario("modal_axisage009.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
          }
      }

      function f_but_aceptar() {
          var CCODIGO = objUtiles.f_GuardaCasillasChecked("radioCCODIGO");
          if (typeof CCODIGO == 'boolean' || objUtiles.estaVacio(CCODIGO)) {
              alert('<axis:alt f="${pantalla}" c="ERROR_CCODIGO" lit="112112"/>');
          }
          else {
              parent.f_aceptar_axisage009(CCODIGO);
          }
      }

      function f_but_nuevo() {
          parent.f_nuevo_axisage009();   
      }

      function f_seleccionar_campana(CCODIGO, TDESCRIP) {
          objDom.setValorPorId("CCODIGO", CCODIGO);
          objDom.setValorPorId("TDESCRIP", TDESCRIP);
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
    </script>
  </head>
   <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="modal_axisage009.do" method="POST">
           
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisage010" c="TITULO" lit="9905811"/></c:param>
                <c:param name="titulo"><axis:alt f="axisage009" c="TITULO" lit="9902359"/></c:param> 
                <c:param name="form">axisage009</c:param>
            </c:import>
            <input type="hidden" id="operation" name="operation" value=""/>
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">
                          <tr>
                            <td>
                              <table class="area" align="center">
                                <tr>
                                  <th style="width:25%;height:0%;"></th>
                                  <th style="width:25%;height:0%;"></th>
                                  <th style="width:25%;height:0%;"></th>
                                  <th style="width:25%;height:0%;"></th>
                                </tr>
                                <tr>
                                  <axis:ocultar f="axisage009" c="CCODIGO">
                                    <td class="titulocaja">
                                      <b><axis:alt f="axisage009" c="CCODIGO" lit="103465"/></b>
                                    </td>
                                  </axis:ocultar>
                                  <axis:ocultar f="axisage009" c="TDESCRIP">
                                    <td class="titulocaja" colspan="2">
                                      <b><axis:alt f="axisage009" c="TDESCRIP" lit="9900734"/></b>
                                    </td>
                                  </axis:ocultar>
                                </tr>
                                <tr>
                                  <axis:ocultar f="axisage009" c="CCODIGO">
                                    <td class="campocaja">
                                      <input id="CCODIGO" name="CCODIGO" type="text" class="campo campotexto" style="width:30%" maxlength="4"
                                             title=<axis:alt f="axisage009" c="CCODIGO" lit="103465"/>
                                             alt=<axis:alt f="axisage009" c="CCODIGO" lit="103465"/>
                                             value="${__formdata.CCODIGO}"/>
                                    </td>
                                  </axis:ocultar>
                                  <axis:ocultar f="axisage009" c="TDESCRIP">
                                    <td class="campocaja">
                                      <input id="TDESCRIP" name="TDESCRIP" type="text" class="campo campotexto" style="width:100%" maxlength="120"
                                             title=<axis:alt f="axisage009" c="TDESCRIP" lit="9900734" />
                                             alt=<axis:alt f="axisage009" c="TDESCRIP" lit="9900734"/> 
                                             <axis:atr f="axisage009" c="TDESCRIP" a="modificable=false&obligatorio=false"/>/>
                                    </td>
                                  </axis:ocultar>
                                </tr>
                                <tr>
                                  <axis:ocultar f="axisage009" c="FINICAM">
                                    <td class="titulocaja">
                                      <b><axis:alt f="axisage009" c="FINICAM" lit="9000526"/></b>
                                    </td>
                                  </axis:ocultar>
                                  <axis:ocultar f="axisage009" c="FFINCAM">
                                    <td class="titulocaja" colspan="1">
                                      <b><axis:alt f="axisage009" c="FFINCAM" lit="9000527"/></b>
                                    </td>
                                  </axis:ocultar>
                                  <axis:ocultar f="axisage009" c="CESTADO">
                                    <td class="titulocaja" colspan="1">
                                      <b><axis:alt f="axisage009" c="CESTADO" lit="100587"/></b>
                                    </td>
                                  </axis:ocultar>
                                </tr>
                                <tr>
                                  <axis:ocultar f="axisage009" c="FINICAM">
                                    <td class="campocaja">  
                                      <input type="text" class="campo campotexto" size="15" style="width:35%;"
                                             value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINICAM}"/>"
                                             name="FINICAM" id="FINICAM"
                                             title="<axis:alt f='axisage009' c='FINICAM' lit='9000526'/>"
                                             alt="<axis:alt f='axisage009' c='FINICAM' lit='9000526'/>" <axis:atr f="axisage009" c="FINICAM" a="formato=fecha"/> />
                                             <a style="vertical-align:middle;">
                                        <img id="icon_FINICAM" alt='<axis:alt f="axisage009" c="FINICAM" lit="9000526"/>'
                                             title='<axis:alt f="axisage009" c="FINICAM" lit="9000526" />'
                                             src="images/calendar.gif"/></a>
                                    </td>
                                  </axis:ocultar>
                                  <axis:ocultar f="axisage009" c="FFINCAM">
                                    <td class="campocaja">
                                      <input type="text" class="campo campotexto" size="15" style="width:35%;"
                                             value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINCAM}"/>"
                                             name="FFINCAM" id="FFINCAM"
                                             title="<axis:alt f='axisage009' c='FFINCAM' lit='9000527'/>"
                                             alt="<axis:alt f='axisage009' c='FFINCAM' lit='9000527'/>" <axis:atr f="axisage009" c="FFINCAM" a="formato=fecha"/> />
                                             <a style="vertical-align:middle;">
                                        <img id="icon_FFINCAM" alt='<axis:alt f="axisage009" c="FFINCAM" lit="9000527"/>'
                                             title='<axis:alt f="axisage009" c="FFINCAM" lit="9000527" />'
                                             src="images/calendar.gif"/></a>
                                    </td>
                                  </axis:ocultar>
                                  <axis:visible c="CESTADO" f="axisage009">
                                    <td class="campocaja">
                                        <select class="campowidthselect campo campotexto" id="CESTADO" name="CESTADO" 
                                                size="1" style="width:50%"   
                                                title="<axis:alt f="axisage009" c="CESTADO" lit="100587"/>"
                                                <axis:atr f="axisage009" c="CESTADO" a="obligatorio=false&isInputText=false"/>>
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage009" c="CESTADO_VALOR" lit="100587"/> - </option>
                                            <c:forEach items="${__formdata.LSTVALORES.LSTESTADOS}" var="item">
                                                <option value="${item.CATRIBU}" <c:if test="${item.CATRIBU  == __formdata.CESTADO}">selected</c:if>>
                                                    ${item.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                  </axis:visible>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td>
                                <div class="titulo">
                                   <img src="images/flecha.gif"/><axis:alt f="axisage009" c="LIT_IMG_1" lit="1000345" />
                                </div>     
                                <table class="seccion">
                                    <tr>
                                    <td align="left" valign="top">
                                         <table border="0" class="area" align="left" style="width:100%;">
                                            <tr>
                                                <td>
                                                    <c:set var="title0"><axis:alt f="axisage009" c="CCODIGO" lit="109155"/></c:set>
                                                    <c:set var="title1"><axis:alt f="axisage009" c="TDESCRIP" lit="100588"/></c:set>
                                                    <div class="seccion displayspaceGrande">
                                                     <display:table name="${requestScope.T_IAX_CAMPANAS}" id="campanasListId" 
                                                        export="false" class="dsptgtable" pagesize="-1"  sort="list" 
                                                        cellpadding="0" cellspacing="0" requestURI="" >
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                            <axis:visible f="axisage009" c="CCODIGO">
                                                                <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable"  
                                                                                media="html" autolink="false" >
                                                                    <div class="dspIcons">
                                                                        <input type="radio" name="radioCCODIGO"   id="radioCCODIGO"
                                                                        value="${campanasListId.OB_IAX_CAMPANAS.CCODIGO}" 
                                                                        onclick="f_seleccionar_campana(this.value, '${campanasListId.OB_IAX_CAMPANAS.TDESCRIP}')"
                                                                        <c:if test="${__formdata.CCODIGO ==campanasListId.OB_IAX_CAMPANAS.CCODIGO}"> checked="checked"</c:if>/>
                                                                    </div>
                                                                </display:column>
                                                            </axis:visible>
                                                            <axis:visible f="axisage009" c="CCODIGO">
                                                                <display:column title="${title0}" sortable="true" 
                                                                                headerClass="sortable" media="html" autolink="false" 
                                                                                sortProperty="OB_IAX_CAMPANAS.CCODIGO"
                                                                                style="width:100px">
                                                                    <div class="dspNumber">${campanasListId.OB_IAX_CAMPANAS.CCODIGO}</div>
                                                                </display:column>
                                                            </axis:visible>
                                                            <axis:visible f="axisage009" c="TDESCRIP">
                                                                <display:column title="${title1}" sortable="true" 
                                                                                headerClass="sortable" media="html" autolink="false" 
                                                                                sortProperty="OB_IAX_CAMPANAS.TDESCRIP">
                                                                    <div class="dspText">${campanasListId.OB_IAX_CAMPANAS.TDESCRIP}</div>
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
                    </td>
                </tr>
                
            </table>          
            <c:import url="../include/botonera_nt.jsp"> 
                <c:param name="f">axisage009</c:param>
                <c:param name="__botones">cancelar,buscar,aceptar,nuevo</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    <script type="text/javascript">
      Calendar.setup( {
          inputField : "FINICAM", ifFormat : "%d/%m/%Y", button : "icon_FINICAM", singleClick : true, firstDay : 1
      });
      Calendar.setup( {
          inputField : "FFINCAM", ifFormat : "%d/%m/%Y", button : "icon_FFINCAM", singleClick : true, firstDay : 1
      });
    </script>    
    </body>
</html>
