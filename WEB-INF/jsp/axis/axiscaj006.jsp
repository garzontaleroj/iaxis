<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp"/>        
        <script type="text/javascript">
        
            function f_onload() {
                f_cargar_propiedades_pantalla();
              <% if (request.getAttribute("__formdata") != null )
                {  %>
                    var CAGENTE = "${__formdata.CAGENTE}";
                    if (!objUtiles.estaVacio(CAGENTE)) {
                        $("#pCAGENTE").val(CAGENTE);
                    }
                    else{
                        f_abrir_modal('axisage006',null,null);
                    }
             <% }  %>  
            }
            
            function f_aceptar_modal(pantalla){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axiscaj006.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
            
            function f_aceptar_modal(pantalla, param){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axiscaj006.do?"+param, "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
    
            function f_abrir_modal(cual, noXButton, optionalQueryString) {
              
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                
                if (noXButton) 
                    objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    

                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
            }
            
            function f_cerrar_axisage006() {
                f_cerrar_modal("axisage006");
            }
            
            function f_aceptar_axisage006(CAGENTE, TAGENTE) {
                objUtiles.cerrarModal("axisage006");
                objDom.setValorPorId("CAGENTE", CAGENTE);
                objUtiles.ejecutarFormulario("axis_axiscaj006.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);                        
            }
            
            function f_cerrar_modal(pantalla){
                objUtiles.cerrarModal(pantalla);
            }      
            
            function f_but_salir(){
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axiscaj006", "cancelar", document.miForm, "_self");            
            }
            
            function validarImporte(importe, cont){
                if ($("#CCHEQUE_sel"+cont).is(":checked")) {
                    var i = parseInt($("#IMPPAGA").val())-parseInt(importe); 
                }else{
                    var i = parseInt($("#IMPPAGA").val())+parseInt(importe); 
                }
                
                $("#IMPPAGA").val(i);
            }
       </script>
    </head>
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>

    <form name="miForm" action="axis_axiscaj006.do" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>
            <input type="hidden" id="CAGENTE" name="CAGENTE" value="${__formdata.CAGENTE}"/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="form" f="axiscaj006" lit="9905284"/></c:param>
                <c:param name="producto"><axis:alt c="form" f="axiscaj006" lit="9905284"/></c:param>
                <c:param name="form">axiscaj006</c:param>
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axiscaj011|<axis:alt f="axiscaj006" c="MODAL_AXISCAJ011" lit="9905095" /></c:param>
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisage006|<axis:alt f="axiscaj006" c="MODAL_AXISAGE006" lit="9000713" /></c:param>
            </c:import>
            <axis:visible c="DSP_CUENTAS" f="axiscaj006"> 
              <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                <td>
                <table class="seccion">
                <tr>
                    <td align="left" >
                         <table class="area" align="center">
                            <tr>
                    <th style="width:20%;height:0px"></th>
                    <th style="width:30%;height:0px"></th>
                    <th style="width:10%;height:0px"></th>
                    <th style="width:40%;height:0px"></th>
                 </tr>
                 <tr>
                    <axis:ocultar f="axiscaj006" c="CMETMOV" dejarHueco="false"> 
                        <td class="titulocaja">
                           <b><axis:alt f="axiscaj006" c="CMETMOV" lit="9902938"/></b>
                        </td>
                    </axis:ocultar>
                    <axis:ocultar f="axiscaj006" c="CMONOPE" dejarHueco="false"> 
                        <td class="titulocaja">
                           <b><axis:alt f="axiscaj006" c="CMONOPE" lit="108645"/></b>
                        </td>
                    </axis:ocultar>
                    <axis:ocultar f="axiscaj006" c="IMPPAGA" dejarHueco="false"> 
                        <td class="titulocaja">
                           <b><axis:alt f="axiscaj006" c="IMPPAGA" lit="9905283"/></b>
                        </td>
                    </axis:ocultar>
                 </tr>
                 <tr>
                    <axis:ocultar f="axiscaj006" c="CMETMOV" dejarHueco="false"> 
                        <td class="campocaja">
                            <select name="CMETMOV" id="CMETMOV" size="1" class="campowidthselect campo campotexto_ob" style="width:84%;" 
                                    onchange="validar_medio()"
                                <axis:atr f="axiscaj006" c="CMETMOV" a="obligatorio=true&isInputText=false"/>>
                                <option value="<%= Integer.MIN_VALUE %>">
                                    <axis:alt f="axiscaj006" c="SELECCIONAR" lit="108341"/>                                
                                </option>
                                <c:forEach var="medio_mov" items="${__formdata.FORMAPAGO}">
                                    <option value="${medio_mov.CATRIBU}"
                                    <c:if test="${__formdata.CMETMOV == medio_mov.CATRIBU}">selected</c:if>>
                                    ${medio_mov.TATRIBU}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </axis:ocultar>
                    <axis:ocultar f="axiscaj006" c="CMONOPE" dejarHueco="false"> 
                        <td class="campocaja">
                            <select name="CMONOPE" id="CMONOPE" size="1" class="campowidthselect campo campotexto_ob" style="width:84%;" 
                                <axis:atr f="axiscaj006" c="CMONOPE" a="obligatorio=true&isInputText=false"/> ">
                                <option value="<%= Integer.MIN_VALUE %>">
                                    <axis:alt f="axiscaj006" c="SELECCIONAR" lit="108341"/>                                
                                </option>
                                <c:forEach var="lstmoneda" items="${__formdata.MONEDAS}">
                                    <option value="${lstmoneda.CMONEDA}"
                                    <c:if test="${__formdata.CMONOPE == lstmoneda.CMONEDA}">selected</c:if>>
                                    ${lstmoneda.TMONEDA}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </axis:ocultar>
                    <axis:visible f="axiscaj001" c="IMPPAGA" >
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo campotexto" name="IMPPAGA" id="IMPPAGA" 
                                   size="15" 
                                   value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IMPPAGA}"/>"
                                   />
                        </td>
                    </axis:visible>
                 </tr>
                <tr>
                    <td colspan="4">
                       <div class="separador">&nbsp;</div>            
                       <div class="titulo">
                              <img src="images/flecha.gif"/><b><axis:alt f="axiscaj006" c="LIT32" lit="9905285"/></b>
                        </div>                        
                        <table class="seccion">         
                          <tr><td>
                                       <c:set var="title0"><axis:alt f="axiscaj006" c="NPOLIZA" lit="9001875"/></c:set>
                                       <c:set var="title1"><axis:alt f="axiscaj006" c="NITEM"   lit="9905286"/></c:set>
                                       <c:set var="title2"><axis:alt f="axiscaj006" c="NRUT"    lit="9903067"/></c:set>
                                       <c:set var="title3"><axis:alt f="axiscaj006" c="TNOMBRE" lit="105940"/></c:set>
                                       <c:set var="title4"><axis:alt f="axiscaj006" c="ICOBRO"  lit="9905100"/></c:set>
                                       <c:set var="title5"><axis:alt f="axiscaj006" c="CMONOPE" lit="9903008"/></c:set>
                                       <c:set var="title6"><axis:alt f="axiscaj006" c="IPAGAR"  lit="9905283"/></c:set>
                               </td>
                               <td>
                              <div class="seccion">
                                <% int cont=0; %>
                                <display:table name="${__formdata.listaPendientes}"
                                               id="miListaId" export="false"
                                               class="dsptgtable" pagesize="15"
                                               defaultsort="1"
                                               defaultorder="ascending"
                                               sort="list" cellpadding="0"
                                               cellspacing="0"
                                               requestURI="axis_axiscaj006.do?paginar=true">
                                  <%@ include file="../include/displaytag.jsp"%>
                                  <display:column sortable="true"
                                                  sortProperty=""
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false" style="width:4%">
                                    <div class="dspText">
                                    <input type="checkbox" id="CCHEQUE_sel<%= cont %>" name="CCHEQUE_sel" value="${miListaId['SSERVIC']}" 
                                           class="CCHEQUE_sel" onchange="validarImporte(${miListaId['IPAGAR']},<%= cont %> )"/>
                                    </div>
                                  </display:column>
                                  <axis:visible f="axiscaj006" c="NPOLIZA">
                                   <display:column title="${title0}"
                                                  sortable="true"
                                                  sortProperty="NPOLIZA"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${miListaId['NPOLIZA']}
                                    </div>
                                  </display:column>
                                  </axis:visible>
                                  <display:column title="${title1}"
                                                  sortable="true"
                                                  sortProperty="NITEM"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                        ${miListaId['NITEM']}
                                    </div>
                                  </display:column>
                                  <display:column title="${title2}"
                                                  sortable="true"
                                                  sortProperty="NRUT"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                       ${miListaId['NRUT']}
                                    </div>
                                  </display:column>
                                  <display:column title="${title3}"
                                                  sortable="true"
                                                  sortProperty="TNOMBRE"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${miListaId['TNOMBRE']}
                                    </div>
                                  </display:column>
                                  <display:column title="${title4}"
                                                  sortable="true"
                                                  sortProperty="ICOBRO"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId['ICOBRO']}"/>
                                    </div>
                                  </display:column>
                                  <display:column title="${title5}"
                                                  sortable="true"
                                                  sortProperty="CMONOPE"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${miListaId['CMONOPE']}
                                    </div>
                                  </display:column>
                                  <display:column title="${title6}"
                                                  sortable="true"
                                                  sortProperty="IPAGAR"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId['IPAGAR']}"/>
                                    </div>
                                  </display:column>
                                <% cont++; %>
                                </display:table>
                                <br>
                                </td></tr>
                        </table>
                    </td>
                </tr>
            </table>
        </axis:visible>    
        <div class="separador">&nbsp;</div>   
        <div class="separador">&nbsp;</div>
        <div class="separador">&nbsp;</div>
    </form>    
    <c:import url="../include/botonera_nt.jsp">
       <c:param name="f">axiscaj006</c:param>
       <c:param name="__botones"><axis:ocultar f="axiscaj006" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar>,<axis:visible f="axisprf000" c="BT_ACEPTAR">,aceptar</axis:visible>,</c:param>
    </c:import>
    <c:import url="../include/mensajes.jsp" />    
</body>
</html>


