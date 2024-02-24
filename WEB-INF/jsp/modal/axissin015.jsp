<%-- /** * Fichero: axissin015.jsp * @author <a href =
     "mailto:lcalvo@csi-ti.com">Luz Calvo</a> * * Titulo: Modal modificar datos
     agenda SINIESTROS * * Fecha: 20/02/2009 */--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <title>
      <fmt:message key="100604"/>
    </title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css"></link>
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript">
        function f_onload() { 
        var val1 = "<%=request.getAttribute("OK")%>"; 
        valor  = "${__formdata.CESTAGE}"; 
         if (objUtiles.estaVacio(valor))
         valor = 0;
        f_but_actualitza(valor);
        if (val1=="OK"){
            //alert("Ha ido OK");
            parent.f_aceptar_axissin015(document.miForm.NSINIES.value,document.miForm.subpantalla_base.value);
           
        }
   }
        
        function f_but_aceptar(){
            if (objValidador.validaEntrada()) {
              objUtiles.ejecutarFormulario ("modal_axissin015.do?", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        
        function f_but_cancelar(){
            parent.f_cerrar_modal("axissin015");
        }
        
        function f_but_actualitza(valor){
            if (valor == 1){
             objDom.setVisibilidadPorId("FFINAGE_TDBODY", "visible");
             objDom.setVisibilidadPorId("FFINAGE_TDHEAD", "visible");
             
             }else{
             objDom.setVisibilidadPorId("FFINAGE_TDBODY", "hidden");
             objDom.setVisibilidadPorId("FFINAGE_TDHEAD", "hidden");
             }
        }
        
        
    </script>
  </head>
  <body onload="javascript:f_onload()"><c:import url="../include/precargador_ajax.jsp">
      <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import><form name="miForm" action="modal_axissin015.do" method="POST">
      <input type="hidden" name="operation" value="guardar"/>
      <input type="hidden" name="SSEGURO" value="${__formdata.SSEGURO}"/>
      <input type="hidden" name="SPRODUC" value="${__formdata.SPRODUC}"/>
      <input type="hidden" name="CACTIVI" value="${__formdata.CACTIVI}"/>
      <input type="hidden" name="MODO" value="${__formdata.MODO}"/>
      <input type="hidden" name="NSINIES" value="${__formdata.NSINIES}"/>
      <input type="hidden" name="subpantalla_base" value="${__formdata.subpantalla_base}"/>
      <input type="hidden" name="seccion" value="${__formdata.seccion}"/>
      <input type="hidden" name="NTRAMIT"
             value="${__formdata.NTRAMIT}"/>
      <input type="hidden" name="CMANUAL" value="${__formdata.CMANUAL}"/>
      <input type="hidden" name="FALTA" value="${__formdata.FALTA}"/>
      <input type="hidden" name="NLINAGE" value="${__formdata.NLINAGE}"/>
      <input type="hidden" name="indexTramitacio" value="${__formdata.indexTramitacio}"/>
      <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo">
          <c:if test="${__formdata.subpantalla_base=='agenda'}"><fmt:message key="100604"/></c:if>
          <c:if test="${__formdata.subpantalla_base!='agenda'}"><fmt:message key="9000898"/></c:if>
        </c:param>
        <c:param name="formulario">
          <fmt:message key="100604"/>
        </c:param>
        <c:param name="form">axissin015</c:param>
      </c:import>
      <c:set var="linea_trami">
        ${__formdata.indexTramitacio}
      </c:set>
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
      <div class="separador">&nbsp;</div>
      <table id="tabla1" class="mainModalDimensions base" align="center"
             cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <table class="seccion">
              <tr>
                <th style="width:20%;height:0px">
                  &nbsp;
                </th>
                <th style="width:20%;height:0px">
                  &nbsp;
                </th>
                <th style="width:20%;height:0px">
                  &nbsp;
                </th>
                <th style="width:20%;height:0px">
                  &nbsp;
                </th>
                <th style="width:20%;height:0px">
                  &nbsp;
                </th>
              </tr>
              <tr>
                <td class="titulocaja">
                  <b><fmt:message key="9001028"/></b>
                  <!-- Tipus tramitacio -->
                </td>
                <td class="titulocaja">
                  <b><fmt:message key="100588"/></b>
                  <!-- Tipus dany  -->
                </td>
                <td class="titulocaja">
                  <b><fmt:message key="9000901"/></b>
                  <!-- Tipus dany  -->
                </td>
                <td class="titulocaja">
                  <b><fmt:message key="9000905"/></b>
                  <!-- Tramitación informativa -->
                </td>
              </tr>
              <tr>
                <td class="campocaja">
                  <input type="text" name="TTIPTRA"
                         value="${sessionScope.tramitaciones_min[linea_trami].TTIPTRA}"
                         class="campodisabled campo campotexto"
                         style="width:90%"
                         <axis:atr f="axissin011" c="TTIPTRA" a="modificable=false"/>/>
                </td>
                <td class="campocaja">
                  <input type="text" name="TTRAMIT"
                         value="${sessionScope.tramitaciones_min[linea_trami].TTRAMIT}"
                         class="campodisabled campo campotexto"
                         style="width:90%"
                         <axis:atr f="axissin011" c="TTRAMIT" a="modificable=false"/>/>
                </td>
                <td class="campocaja">
                  <input type="text" name="TTCAUSIN"
                         value="${sessionScope.tramitaciones_min[linea_trami].TTCAUSIN}"
                         class="campodisabled campo campotexto"
                         style="width:90%"
                         <axis:atr f="axissin011" c="TTCAUSIN" a="modificable=false"/>/>
                </td>
                <td class="campocaja" align="left">
                  <input type="checkbox" disabled="disabled" id="CINFORM"
                         name="CINFORM"
                         <axis:atr f="axissin011" c="CINFORM" a="modificable=false"/>
                         value="${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.CINFORM}"
                         <c:if test="${sessionScope.tramitaciones_min[linea_trami].CINFORM == '1'}">checked</c:if>></input>
                </td>
              </tr>
              <tr>
                <td class="titulocaja">
                  <b><fmt:message key="100587"/></b>
                  <!-- Estado -->
                </td>
                <td class="titulocaja">
                  <b><fmt:message key="9000852"/></b>
                  <!--Subestado -->
                </td>
                <td class="titulocaja">
                  <b><fmt:message key="9000900"/></b>
                  <!-- Unidad tramitacion -->
                </td>
                <td class="titulocaja">
                  <b><fmt:message key="140769"/></b>
                  <!-- Tramitador -->
                </td>
                <td class="titulocaja">&nbsp;</td>
              </tr>
              <tr>
                <td class="campocaja">
                  <input type="text" name="TESTTRA"
                         value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TESTTRA}"
                         class="campodisabled campo campotexto"
                         style="width:90%"
                         <axis:atr f="axissin011" c="TESTTRA" a="modificable=false"/>/>
                </td>
                <td class="campocaja">
                  <input type="text" name="TSUBTRA"
                         value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TSUBTRA}"
                         class="campodisabled campo campotexto"
                         style="width:90%"
                         <axis:atr f="axissin011" c="TSUBTRA" a="modificable=false"/>/>
                </td>
                <td class="campocaja">
                  <input type="text" name="TUNITRA"
                         value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TUNITRA}"
                         class="campodisabled campo campotexto"
                         style="width:90%"
                         <axis:atr f="axissin011" c="TUNITRA" a="modificable=false"/>/>
                </td>
                <td class="campocaja">
                  <input type="text" name="TTRAMITAD"
                         value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TTRAMITAD}"
                         class="campodisabled campo campotexto"
                         style="width:90%"
                         <axis:atr f="axissin011" c="TTRAMITAD" a="modificable=false"/>/>
                </td>
                <td class="campocaja">&nbsp;</td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <div class="separador">&nbsp;</div>
          </td>
        </tr>
        <tr>
          <td>
            <table class="seccion">
              <tr>
                <th style="width:20%;height:0px">
                  &nbsp;
                </th>
                <th style="width:20%;height:0px">
                  &nbsp;
                </th>
                <th style="width:20%;height:0px">
                  &nbsp;
                </th>
                <th style="width:20%;height:0px">
                  &nbsp;
                </th>
                <th style="width:20%;height:0px">
                  &nbsp;
                </th>
              </tr>
              <tr>
                <td class="titulocaja">
                  <b><fmt:message key="9001328"/></b>
                  <!-- Tipo de apunte -->
                </td>
                <td class="titulocaja">
                  <b><fmt:message key="9001167"/></b>
                  <!-- Introducción -->
                </td>
                <td class="titulocaja">
                  <b><fmt:message key="9001192"/></b>
                  <!-- F. Alta -->
                </td>
                <td class="titulocaja">
                  <b><fmt:message key="100587"/></b>
                  <!-- Estado -->
                </td>
                <td class="titulocaja" id="FFINAGE_TDHEAD">
                  <b><fmt:message key="9001198"/></b>
                  <!-- F. Finalització -->
                </td>
              </tr>
              <tr>
                <td class="campocaja">
                  <select name="CTIPREG" id="CTIPREG" size="1"
                          <axis:atr f="axissin015" c="CMANUAL" a="isInputText=false&obligatorio=true"/>
                          class="campowidthselect campo campotexto_ob"
                          style="width:180px">
                    <option value="<%= Integer.MIN_VALUE %>">
                      -
                      <fmt:message key="1000348"/>
                      -
                    </option>
                    <c:forEach var="lstapunte"
                               items="${listValores.tipo_apunte}">
                      <option value="${lstapunte.CATRIBU}"
                              <c:if test="${lstapunte.CATRIBU == __formdata.CTIPREG}"> selected </c:if>>
                        ${lstapunte.TATRIBU}
                      </option>
                    </c:forEach>
                  </select>
                </td>
                <td class="campocaja">
                  <select name="CMANUAL" id="CMANUAL"
                          <axis:atr f="axissin015" c="CMANUAL" a="isInputText=false&modificable=false&obligatorio=true"/>
                          size="1" class="campowidthselect campo campotexto_ob"
                          style="width:180px">
                    <option value="<%= Integer.MIN_VALUE %>">
                      -
                      <fmt:message key="1000348"/>
                      -
                    </option>
                    <c:forEach var="lstmanual"
                               items="${listValores.tipo_manual}">
                      <option value="${lstmanual.CATRIBU}"
                              <c:if test="${lstmanual.CATRIBU == __formdata.CMANUAL}"> selected </c:if>>
                        ${lstmanual.TATRIBU}
                      </option>
                    </c:forEach>
                  </select>
                </td>
                <td class="campocaja">
                  <axis:visible f="axissin015" c="FALTA">
                    <input type="text"
                           class="campowidthinput campo campotexto_ob" size="15"
                           name="FALTA" id="FALTA"
                           value="<fmt:formatDate value='${__formdata.FALTA}' pattern='dd/MM/yyyy'/>"
                           style="width:60%;"
                           <axis:atr f="axissin015" c="FALTA" a="modificable=false"/>
                           title='<fmt:message key="9000539"/>'/>
                  </axis:visible>
                </td>
                <td class="campocaja">
                  <select name="CESTAGE" id="CESTAGE"
                          <axis:atr f="axissin015" c="CESTAGE" a="isInputText=false&obligatorio=true"/>
                          size="1" class="campowidthselect campo campotexto_ob"
                          onchange="f_but_actualitza(this.value)"
                          style="width:180px">
                    <option value="<%= Integer.MIN_VALUE %>">
                      -
                      <fmt:message key="1000348"/>
                      -
                    </option>
                    <c:forEach var="lstestado"
                               items="${listValores.tipo_estado}">
                      <option value="${lstestado.CATRIBU}"
                              <c:if test="${lstestado.CATRIBU == __formdata.CESTAGE}"> selected </c:if>>
                        ${lstestado.TATRIBU}
                      </option>
                    </c:forEach>
                  </select>
                </td>
                <td class="campocaja" id="FFINAGE_TDBODY">
                  <axis:visible f="axissin015" c="FFINAGE">
                    <input type="text"
                           class="campowidthinput campo campotexto_ob" size="15"
                           name="FFINAGE" id="FFINAGE"
                           value="<fmt:formatDate value='${__formdata.FFINAGE}' pattern='dd/MM/yyyy'/>"
                           style="width:60%;"
                           <axis:atr f="axissin015" c="FFINAGE" a="formato=fecha"/>
                           title='<fmt:message key="9000539"/>'/>
                    <a id="popup_calendario_fin" style="vertical-align:middle;">
                      <img alt='<fmt:message key="108341"/>'
                           title='<fmt:message key="9000539" />'
                           src="images/calendar.gif"/>
                    </a>
                  </axis:visible>
                </td>
              </tr>
              <tr>
                <td class="titulocaja">
                  <b><fmt:message key="100785"/></b>
                  <!-- Tipus -->
                </td>
                <td class="titulocaja">&nbsp;</td>
                <td class="titulocaja">&nbsp;</td>
                <td class="titulocaja">&nbsp;</td>
                <td class="titulocaja">&nbsp;</td>
              </tr>
              <tr>
                <td class="campocaja" colspan="4">
                  <input type="text" name="TTITAGE" id="TTITAGE"
                         value="${__formdata.TTITAGE}"
                         class="campowidthinput campo campotexto_ob"
                         style="width:90%"
                         <axis:atr f="axissin015" c="TTITAGE" a="modificable=true&obligatorio=true"/>/>
                </td>
                <td class="campocaja">&nbsp;</td>
              </tr>
              <tr>
                <td class="titulocaja">
                  <b><fmt:message key="100588"/></b>
                  <!-- Descripción -->
                </td>
                <td class="titulocaja">&nbsp;</td>
                <td class="titulocaja">&nbsp;</td>
                <td class="titulocaja">&nbsp;</td>
                <td class="titulocaja">&nbsp;</td>
              </tr>
              <tr>
                <td class="campocaja" colspan="4">
                  <textarea onclick="" onfocus=""
                            <axis:atr f="axissin015" c="TLINAGE" a="modificable=true&obligatorio=true"/>
                            class="campowidthinput campo campotexto_ob"
                            style="width:100%;" name="TLINAGE" id="TLINAGE">${__formdata.TLINAGE}</textarea>
                </td>
                <td class="campocaja">&nbsp;</td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <c:import url="../include/botonera_nt.jsp">
        <c:param name="__botones">cancelar,aceptar</c:param>
      </c:import>
    </form><c:import url="../include/mensajes.jsp"/><script type="text/javascript">       
       
        Calendar.setup({
            inputField     :    "FFINAGE",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "popup_calendario_fin",  
            singleClick    :    true,
            firstDay       :    1
        });
    </script></body>
</html>