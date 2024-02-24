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
                    var STARIFA = "${__formdata.STARIFA}";
                    if (objUtiles.estaVacio(STARIFA)) {
                        f_abrir_modal('axisprf102',null,null);
                    }else{
                        $("#pSTARIFA").val(STARIFA);
                    }
             <% }  %>  
            }
            
            function f_aceptar_modal(pantalla){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axisprf104.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
            
            function f_aceptar_modal(pantalla, param){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axisprf104.do?"+param, "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
    
            function f_abrir_modal(cual, noXButton, optionalQueryString) {
              
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                
                if (noXButton) 
                    objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    

                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
            }
            
            function f_cerrar_modal(pantalla){
                objUtiles.cerrarModal(pantalla);
            }      
            
            function f_but_salir(){
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisprf104", "cancelar", document.miForm, "_self");            
            }
            
            function f_borrar_fila(datos, que){
                var answer = confirm(objJsMessages.jslit_confirma_borrar);
                if (answer)
                objUtiles.ejecutarFormulario("axis_axisprf104.do?SPROFES="+objDom.getValorPorId("pCodiProf")+datos,
                                             "del_"+que, document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function actualizaStarifa(STARIFA){
                $("#pSTARIFA").val(STARIFA);
            }
            
            function f_but_9900736(){
                var selectedItems = new Array();
                $(".SSERVIC_sel:checkbox:checked").each(function(){
                    selectedItems.push($(this).val());
                });
                if (objUtiles.estaVacio(selectedItems)){
                    var errmsg="<axis:alt f='axisprf104' c='error' lit='9902621' />";
                    alert(errmsg);
                }else{
                objUtiles.abrirModal("axisprf107", "src", "modal_axisprf107.do?operation=init&pSTARIFA="+$("#pSTARIFA").val()+
                                                                               "&SERVICIOS="+selectedItems.join(", ")+",");     
                }
            }
            
            function f_but_buscar() {
                if (objValidador.validaEntrada()) {
                    objUtiles.ejecutarFormulario("axis_axisprf104.do","busqueda_servicios",document.miForm, "_self", objJsMessages.jslit_cargando);   
                }
            }
            
            function f_seleccionar_todos(){
                if( $("#selec_todos").attr("checked")=="checked"){
                    $(".SSERVIC_sel:checkbox:not(:checked)").attr("checked", "checked");
                }else{
                    $(".SSERVIC_sel:checkbox:checked").removeAttr("checked");
                }
            }
       </script>
    </head>
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>

    <form name="miForm" action="axis_axisprf104.do" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="pSTARIFA" name="pSTARIFA" value="${__formdata.STARIFA}"/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="form" f="axisprf104" lit="9904856"/></c:param>
                <c:param name="producto"><axis:alt c="form" f="axisprf104" lit="9904856"/></c:param>
                <c:param name="form">axisprf104</c:param>
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf105|<axis:alt f="axisprf104" c="MODAL_AXISPRF105" lit="9904855" /></c:param>
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf102|<axis:alt f="axisprf104" c="MODAL_AXISPRF102" lit="9904887" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf103|<axis:alt f="axisprf104" c="MODAL_AXISPRF103" lit="9904892" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf107|<axis:alt f="axisprf104" c="MODAL_AXISPRF107" lit="9900736" /></c:param>
            </c:import>
            <axis:visible c="DSP_CUENTAS" f="axisprf104"> 
              <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                <td>
                <table class="seccion">
                <tr>
                    <td align="left" >
                         <table class="area" align="center">
                            <tr>
                    <th style="width:15%;height:0px"></th>
                 </tr>
                 <tr>
                    <td class="titulocaja">
                        <b><axis:alt f="axisprf104" c="TIT_STARIFA" lit="9901888"/></b>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <input type="text" class="campo campotexto" value="${__formdata.STARIFA}"  name="STARIFA" id="STARIFA" size="15"
                               readonly="true" style="width:25%"/>
                    </td>
                </tr>
                <tr>
                    <axis:visible f="axisprf104" c="SSERVIC" >
                        <td class="titulocaja">
                            <div class="separador">&nbsp;</div> 
                            <b><axis:alt f="axisprf104" c="TIT_SSERVIC" lit="9904857"/></b>
                        </td>
                    </axis:visible>
                    <axis:visible f="axisprf104" c="TDESCRI" >
                        <td class="titulocaja">
                            <b><axis:alt f="axisprf104" c="TIT_TDESCRI" lit="100588"/></b>
                        </td>
                    </axis:visible>
                </tr>
                  
                 <tr>
                    <axis:visible f="axisprf104" c="SSERVIC" >
                        <td>
                            <input type="text" class="campo campotexto" name="SSERVIC" id="SSERVIC" size="15" style="width:25%" value="${__formdata.SSERVIC}"
                                   onkeypress="if (event.keyCode==13)  { f_but_buscar() }"/>
                        </td>
                    </axis:visible>
                    <axis:visible f="axisprf104" c="TDESCRI" >
                        <td>
                            <input type="text" class="campo campotexto" name="TDESCRI" id="TDESCRI" size="15" style="width:50%" value="${__formdata.TDESCRI}"
                                   onkeypress="if (event.keyCode==13)  { f_but_buscar() }"/>
                        </td> 
                    </axis:visible>
                    <axis:visible f="axisprf104" c="BT_BUSCAR" >
                        <td><div align="right">
                            <input type="button" class="boton" id="BT_BUSCAR" name ="BT_BUSCAR" value="<axis:alt f="axisprf104" c="BUT_BUSCAR" lit="9000508"/>" onclick="f_but_buscar();" />
                        </div></td>
                    </axis:visible>
                </tr>
                <tr>
                    <td colspan="3">
                       <div class="separador">&nbsp;</div>            
                       <div class="titulo">
                              <img src="images/flecha.gif"/><b><axis:alt f="axisprf104" c="LIT32" lit="9904866"/></b>
                        </div>                        
                        <table class="seccion">         
                              <axis:visible f="axisprf104" c="BT_ALTA_SERVICIOS">
                              <c:if test="${! ocultarIconosEdicion && __configform.axisprf104__BT_ANADIR_SERVICIO__visible != 'false'}">
                                <div style="float:right;">
                                  <a href="javascript:f_abrir_modal('axisprf105',null,'&pSTARIFA='+document.miForm.pSTARIFA.value+'&MODO=alta');">
                                    <img border="0"
                                         alt='<axis:alt f="axisprf104" c="LIT_NVSERVICIO" lit="9904855"/>'
                                         title='<axis:alt f="axisprf104" c="LIT_NVSERCICIO" lit="9904855"/>'
                                         src="images/new.gif"/>
                                  </a>
                                </div>
                              </c:if>
                              </axis:visible>                        
                            <tr><td>
                                       <c:set var="title0"><axis:alt f="axisprf104" c="SSERVIC" lit="9904857"/></c:set>
                                       <c:set var="title1"><axis:alt f="axisprf104" c="TDESCRI" lit="100588"/></c:set>
                                       <c:set var="title2"><axis:alt f="axisprf104" c="IPRECIO" lit="9001165"/></c:set>
                                       <c:set var="title3"><axis:alt f="axisprf104" c="IMINIMO" lit="9904858"/></c:set>
                                       <c:set var="title4"><axis:alt f="axisprf104" c="FINIVIG" lit="9000572"/></c:set>
                                       <c:set var="title5"><axis:alt f="axisprf104" c="FFINVIG" lit="9902716"/></c:set>
                                       <c:set var="title6"><axis:alt f="axisprf104" c="MODIFICAR" lit="9000552" /></c:set><!--Modificar-->
                                       <c:set var="title7"><axis:alt f="axisprf104" c="ACTUALIZAR" lit="9900736" /></c:set><!--Actualizar-->
                               </td><td>
                              <div class="seccion">
                                <display:table name="${sessionScope.axisprf104_listaServicios}"
                                               id="miListaId" export="false"
                                               class="dsptgtable" pagesize="15"
                                               defaultsort="1"
                                               defaultorder="ascending"
                                               sort="list" cellpadding="0"
                                               cellspacing="0"
                                               requestURI="axis_axisprf104.do?paginar=true">
                                  <%@ include file="../include/displaytag.jsp"%>
                                  <display:column sortable="true"
                                                  sortProperty=""
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false" style="width:4%">
                                    <div class="dspText">
                                    <input type="checkbox" id="SSERVIC_sel" name="SSERVIC_sel" value="${miListaId['SSERVIC']}" 
                                           onchange="f_seleccionar_servicio(${miListaId['SSERVIC']})" class="SSERVIC_sel"/>
                                    </div>
                                  </display:column>
                                  <axis:visible f="axisprf104" c="SSERVIC">
                                   <display:column title="${title0}"
                                                  sortable="true"
                                                  sortProperty="SSERVIC"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${miListaId['SSERVIC']}
                                    </div>
                                  </display:column>
                                  </axis:visible>
                                  <display:column title="${title1}"
                                                  sortable="true"
                                                  sortProperty="TDESCRI"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                        ${miListaId['TDESCRI']}
                                    </div>
                                  </display:column>
                                  <display:column title="${title2}"
                                                  sortable="true"
                                                  sortProperty="IPRECIO"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                        <fmt:formatNumber pattern="${__formatNumberPatterns[CMONEDAPRO]}" value="${miListaId['IPRECIO']}"/>
                                    </div>
                                  </display:column>
                                  <display:column title="${title3}"
                                                  sortable="true"
                                                  sortProperty="IMINIMO"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                        <fmt:formatNumber pattern="${__formatNumberPatterns[CMONEDAPRO]}" value="${miListaId['IMINIMO']}"/>
                                    </div>
                                  </display:column>
                                  <display:column title="${title4}"
                                                  sortable="true"
                                                  sortProperty="FINIVIG"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId['FINIVIG']}"/>
                                    </div>
                                  </display:column>
                                  <display:column title="${title5}"
                                                  sortable="true"
                                                  sortProperty="FFINVIG"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId['FFINVIG']}"/>
                                    </div>
                                  </display:column>
                                  <axis:visible f="axisprf104" c="BT_EDITAR_SERVICIO"> <!-- boton editar servicio -->
                                  <display:column title="${title6}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                    <div class="dspIcons" id="BT_EDITAR_SERVICIO">
                                        <img border="0" alt="<axis:alt f="axisprf104" c="BT_EDITAR_SERVICIO" lit="100002"/>"
                                             title1="<axis:alt f="axisprf104" c="BT_EDITAR_SERVICIO" lit="100002"/>" 
                                             src="images/lapiz.gif" width="15px" height="15px"
                                             style="cursor:pointer;" 
                                             onclick="javascript:f_abrir_modal('axisprf105',null,'&pSTARIFA='+document.miForm.pSTARIFA.value+
                                             '&SSERVIC='+'${miListaId['SSERVIC']}'+'&MODO=modificar');"  />
                                    </div>
                                  </display:column> 
                                  </axis:visible>
                                  <axis:visible f="axisprf104" c="BT_ACTUALIZAR_SERVICIO"> <!-- boton actualizar servicio -->
                                  <display:column title="${title7}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                    <div class="dspIcons" id="BT_ACTUALIZAR_SERVICIO">
                                        <img border="0" alt="<axis:alt f="axisprf104" c="BT_ACTUALIZAR_SERVICIO" lit="9900736"/>"
                                             title1="<axis:alt f="axisprf104" c="BT_ACTUALIZAR_SERVICIO" lit="9900736"/>" 
                                             src="images/lapiz.gif" width="15px" height="15px"
                                             style="cursor:pointer;" 
                                             onclick="javascript:f_abrir_modal('axisprf105',null,'&pSTARIFA='+document.miForm.pSTARIFA.value+
                                                                                                 '&SSERVIC='+'${miListaId['SSERVIC']}'+
                                                                                                 '&MODO=actualizar');"  />
                                    </div>
                                  </display:column> 
                                  </axis:visible>
                                </display:table>
                                <br>
                                <input type="checkbox" id="selec_todos" name="SSERVIC_sel" value="${miListaId['SSERVIC']}" 
                                           onchange="f_seleccionar_todos()" style="margin-left:1.25%"/><axis:alt f="axisprf104" c="selec_todos" lit="9000756"/>/<axis:alt f="axisprf104" c="selec_todos" lit="9000757"/>
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
       <c:param name="f">axisprf104</c:param>
       <c:param name="__botones"><axis:ocultar f="axisprf104" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar><axis:ocultar f="axisprf104" c = "BT_9900736" dejarHueco="false">,9900736</axis:ocultar>,</c:param>
    </c:import>
    <c:import url="../include/mensajes.jsp" />    
</body>
</html>


