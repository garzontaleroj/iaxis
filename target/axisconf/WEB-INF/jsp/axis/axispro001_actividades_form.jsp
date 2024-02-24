<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<script language="Javascript" type="text/javascript" src="scripts/general.js"></script>
<link rel="stylesheet" href="styles/genericosHtml.css"></link>
<link rel="stylesheet" href="styles/axisnt.css"></link>
<link rel="stylesheet" href="styles/displaytag.css"></link>
<c:import url="../include/carga_framework_js.jsp"/>
<div class="separador">&nbsp;</div>
<table class="area" align="center">
  <tr>
    <th style="height:0px">
      &nbsp;
    </th>
  </tr>
  <!-- Datos Generales -->
  <tr>
    <td class="campocaja">
      <!--img id="actividades_parametros_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('actividades_parametros', this)" style="cursor:pointer"/> 
                                    <b><fmt:message key="103694"/></b>
                                    <hr class="titulo"-->
      <div style="float:left;">
        <img id="actividades_parametros_parent" src="images/mes.gif"
             onclick="objEstilos.toggleDisplay('actividades_parametros', this)"
             style="cursor:pointer"/>
         
        <b><fmt:message key="103694"/></b>
      </div>
      <axis:visible f="axispro001" c="EDIT_ACTIVIDAD">
        <div style="float:right;">
          <a href="javascript:parent.f_but_parametros_activ()">
            <img border="0"
                 alt='<fmt:message key="100002"/> <fmt:message key="103694"/>'
                 title='<fmt:message key="100002"/> <fmt:message key="103694"/>'
                 src="images/lapiz.gif"/>
          </a>
           
          <%-- <a
               href="javascript:parent.f_abrir_como_modal('axismpr003',${mntproducto.SPRODUC},${sessionScope.ACTIVIDAD})"><img
               border="0" alt="<fmt:message key="100002"/> <fmt:message
               key="103694"/>" title="<fmt:message key="100002"/> <fmt:message
               key="103694"/>" src="images/lapiz.gif"/></a>--%>
        </div>
      </axis:visible>
      <div style="clear:both;">
        <hr class="titulo"></hr>
      </div>
    </td>
  </tr>
  <tr id="actividades_parametros_children" style="display:none">
    <td align="left">
      <jsp:include page="axispro001_actividades_parametros.jsp"/>
    </td>
  </tr>
  <!--PREGUNTAS-->
  <tr>
    <td class="campocaja">
      <div style="float:left;">
        <img id="actividades_preguntas_parent" src="images/mes.gif"
             onclick="objEstilos.toggleDisplay('actividades_preguntas', this)"
             style="cursor:pointer"/>
         
        <b><fmt:message key="102299"/></b>
      </div>
      <axis:visible f="axispro001" c="EDIT_ACTIVIDAD">
        <div style="float:right;">
          <a href="javascript:parent.f_but_preguntas_activ()">
            <img border="0"
                 alt='<fmt:message key="100002"/> <fmt:message key="102299"/>'
                 title='<fmt:message key="100002"/> <fmt:message key="102299"/>'
                 src="images/lapiz.gif"/>
          </a>
        </div>
      </axis:visible>
      <div style="clear:both;">
        <hr class="titulo"></hr>
      </div>
    </td>
  </tr>
  <tr id="actividades_preguntas_children" style="display:none">
    <td align="left">
      <jsp:include page="axispro001_actividades_preguntas.jsp"/>
    </td>
  </tr>
  <!--RECARGO POR FRACCIONAMIENTO-->
  <tr>
    <td class="campocaja">
      <div style="float:left;">
          <img id="actividades_recargo_parent" src="images/mes.gif"
               onclick="objEstilos.toggleDisplay('actividades_recargo', this)"
               style="cursor:pointer"/>
          <b><fmt:message key="1000338"/></b>
      </div>
      <axis:visible f="axispro001" c="EDIT_ACTIVIDAD">  
        <div style="float:right;">
          <a href="javascript:parent.f_but_recargo_activ()">
            <img border="0"
                 alt='<fmt:message key="100002"/> <fmt:message key="1000338"/>'
                 title='<fmt:message key="100002"/> <fmt:message key="1000338"/>'
                 src="images/lapiz.gif"/>
          </a>
        </div>
      </axis:visible>
      <div style="clear:both;">
        <hr class="titulo"></hr>
      </div>
    </td>
  </tr>
  <tr id="actividades_recargo_children" style="display:none">
    <td align="left">
      <jsp:include page="axispro001_actividades_recargo.jsp"/>
    </td>
  </tr>
</table>

<script type="text/javascript">
 // Desplegar la subsección contenida en el request parameter "subpantalla"
<% 
if (request.getAttribute("subpantalla") != null && !"null".equals(request.getAttribute("subpantalla")) && !"".equals(request.getAttribute("subpantalla"))) { 
%>       
    var subpantalla = '<%=request.getAttribute("subpantalla")%>';                        
    if (objUtiles.utilStartsWith(subpantalla, "actividades") && subpantalla != "actividades")                     
        objEstilos.toggleDisplay(subpantalla, document.getElementById(subpantalla + "_parent"));
        // document.getElementById(subpantalla + "_parent").onclick();
<% } %>
</script>