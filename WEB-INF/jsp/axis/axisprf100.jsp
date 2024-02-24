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
                    var SPROFES_INI = "${__formdata.SPROFES}";
                    if (objUtiles.estaVacio(SPROFES_INI)) {
                        f_abrir_modal('axisprf000',null,null);
                    }else{
                        $("#pSPROFES").val(SPROFES_INI);
                    }
                    if ('${__formdata.SCONVEN}'!= null){
                        $('input[name=SCONVEN]:radio').each(function(){
                            if($(this).val()== '${__formdata.SCONVEN}'){
                                $(this).prop("checked","true");
                            }
                        });
                    }
             <% }  %>  
            }
            
            function f_aceptar_modal(pantalla){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axisprf100.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
            
            function actualizaSprofes(SPROFES){
                $("#pSPROFES").val(SPROFES);
            }
            
            function f_aceptar_modal(pantalla, param){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axisprf100.do?"+param, "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
    
            function f_abrir_modal(cual, noXButton, optionalQueryString) {
                if (cual == "axisprf106"){
                    if(objUtiles.estaVacio($("#pSCONVEN").val())){
                        alert("Seleccionar primero el convenio");
                    }else{
                        if (objUtiles.estaVacio(optionalQueryString))                
                            optionalQueryString = "";
                
                        if (noXButton) 
                            objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
    
                        objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);  
                    }
                }else{
                    if (objUtiles.estaVacio(optionalQueryString))                
                        optionalQueryString = "";
                
                    if (noXButton) 
                        objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");
                        
                    objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
                }
            }
            
            function f_cerrar_modal(pantalla){
                objUtiles.cerrarModal(pantalla);
            }      
            
            function f_but_salir(){
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisprf100", "cancelar", document.miForm, "_self");            
            }
            
            function f_but_tarifas(){
                objUtiles.abrirModal("axisprf102", "src", "modal_axisprf102.do?operation=init");             
            }

            function f_borrar_fila(datos, que){
                var answer = confirm(objJsMessages.jslit_confirma_borrar);
                if (answer)
                objUtiles.ejecutarFormulario("axis_axisprf100.do?SPROFES="+objDom.getValorPorId("pSPROFES")+
                                             "SCONVEN="+objDom.getValorPorId("pSCONVEN")+datos,
                                             "del_"+que, document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function actualizaStarifa(STARIFA){
                $("#pSTARIFA").val(STARIFA);
            }
            
            function muestraEstados(SCONVEN){
                $("#pSCONVEN").val(SCONVEN);
                if (objValidador.validaEntrada()) {
                    objUtiles.ejecutarFormulario("axis_axisprf100.do","form",document.miForm, "_self", objJsMessages.jslit_cargando);   
                }
            }
            
            function f_aceptar_axisper001 (selectedPerson){
                $("#SPERSON").val(selectedPerson);
                f_cerrar_modal("axisper008");
                f_abrir_modal('axisprf002',null,'&pSPROFES='+$("#pSPROFES").val()+"&SPERSON="+$("#SPERSON").val());
            }
            function f_aceptar_axisper010(selectedPerson,selectedagent){
                $("#SPERSON").val(selectedPerson);
                f_cerrar_axisper010(null);
                objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=datosgenerales&faceptar=f_aceptar_mtn_axisper001&SPERSON="+selectedPerson+"&CAGENTEselected="+selectedagent, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            function f_cerrar_axisper010(isNew) {
                objUtiles.cerrarModal("axisper010");
                selectedPerson = '${dades_persona.SPERSON}';
                if (!objUtiles.estaVacio(isNew)) {
                    if (isNew)
                        f_abrir_axisper008();     
                }else
                    objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=datosgenerales&faceptar=f_aceptar_mtn_axisper001&SPERSON="+selectedPerson+"&CAGENTEselected="+document.miForm.CAGENTE.value, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            function f_cerrar_axisper008(){
                objUtiles.cerrarModal("axisper008");
            }            
            function f_but_nueva_persona() {
                f_abrir_axisper005();
            }
            
            function  f_abrir_axisper005() {
                objUtiles.cerrarModal("axisper001");
                objUtiles.abrirModal("axisper005", "src", "modal_axisper005.do?operation=form&faceptar=f_aceptar_axisper005"+"&ORIGEN=AXISPRF001" );
            }
            
            function f_abrir_axisper010NOU(isNew){
                f_cerrar_axisper008();
                objDom.setVisibilidadPorId('but_cerrar_modal_axisper010', 'hidden');
                objUtiles.abrirModal("axisper010","src","modal_axisper010.do?operation=form&isNew="+isNew);
            }
                        
            function f_aceptar_persona(SPERSON,CAGENTE, SNIP, modal){
            
               f_cerrar_modal(modal);
    
               $("#SNIP").val(SNIP);
               $("#SPERSON").val(SPERSON);
               $("#CAGENTE").val(CAGENTE);               
               var params = '&pCodiProf='+$("#pSPROFES").val()+"&SPERSON="+SPERSON;
               f_abrir_modal('axisprf002',null,params);
            }
            
            function f_nova_persona(){
                f_cerrar_modal("axisper021");
                var CAGENTE = "${__formdata.CAGENTE}";
                objUtiles.abrirModal("axisper022","src","modal_axisper022.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBLICAS&CAGENTE="+CAGENTE);  
            }
      
            function f_cerrar_axisper022(){
                f_cerrar_modal("axisper022");
            }
            
            function f_cerrar_modalespersona(modal){
                objUtiles.cerrarModal(modal);
            }
            
       </script>
    </head>
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>

    <form name="miForm" action="axis_axisprf100.do" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="pSPROFES" name="pSPROFES" value="${__formdata.SPROFES}"/>
            <input type="hidden" id="pSCONVEN" name="pSCONVEN" value="${__formdata.SCONVEN}"/>
            <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>
            <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}" />
            <input type="hidden" name="SNIP" id="SNIP" value="${__formdata.SNIP}"/>

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="form" f="axisprf100" lit="9904885"/></c:param>
                <c:param name="producto"><axis:alt c="form" f="axisprf100" lit="9904885"/></c:param>
                <c:param name="form">axisprf100</c:param>
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf105|<axis:alt f="axisprf100" c="MODAL_AXISPRF105" lit="9904855" /></c:param>
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf102|<axis:alt f="axisprf100" c="MODAL_AXISPRF102" lit="9904887" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf103|<axis:alt f="axisprf100" c="MODAL_AXISPRF103" lit="9904892" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf000|<axis:alt f="axisprf100" c="MODAL_AXISPRF000" lit="9904785" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf002|<axis:alt f="axisprf100" c="MODAL_AXISPRF002" lit="9904788" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf106|<axis:alt f="axisprf100" c="MODAL_AXISPRF106" lit="9904706" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf101|<axis:alt f="axisprf100" c="MODAL_AXISPRF101" lit="9904896" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisper008|<axis:alt f="axisprf100" c="MODAL_AXISPER008" lit="1000235" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisper010|<axis:alt f="axisprf100" c="MODAL_AXISPER010" lit="110275" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisper021|<axis:alt f="axisprf100" c="MODAL_AXISPER021" lit="1000235" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisper022|<axis:alt f="axisprf100" c="MODAL_AXISPER022" lit="1000235" /></c:param>
            </c:import>
            <axis:visible c="DSP_CUENTAS" f="axisprf100"> 
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
                        <b><axis:alt f="axisprf100" c="TIT_SPROFES" lit="9903409"/></b>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <input type="text" class="campo campotexto" value="${__formdata.SPROFES}-${__formdata.TNOMBRE}"  name="SPROFES" id="SPROFES" size="15"
                               readonly="true" style="width:20%"/>&nbsp;<img id="findSprofes" border="0" src="images/find.gif" onclick="f_abrir_modal('axisprf000',null,null);"
                    </td>
                </tr>
                <tr>
                    <td>
                       <div class="separador">&nbsp;</div>            
                       <div class="titulo">
                              <img src="images/flecha.gif"/><b><axis:alt f="axisprf100" c="LIT32" lit="9904885"/></b>
                        </div>                        
                        <table class="seccion">         
                              <axis:visible f="axisprf100" c="BT_ALTA_CONVENIOS">
                              <c:if test="${! ocultarIconosEdicion && __configform.axisprf100__BT_ALTA_CONVENIOS__visible != 'false'}">
                                <div style="float:right;">
                                  <a href="javascript:f_abrir_modal('axisprf101',null,'&pSPROFES='+document.miForm.pSPROFES.value+'&MODO=alta');">
                                    <img border="0"
                                         alt='<axis:alt f="axisprf100" c="LIT_NVCONVENIO" lit="9904896"/>'
                                         title='<axis:alt f="axisprf100" c="LIT_NVCONVENIO" lit="9904896"/>'
                                         src="images/new.gif"/>
                                  </a>
                                </div>
                              </c:if>
                              </axis:visible>                        
                            <tr><td>
                                       <c:set var="title0"><axis:alt f="axisprf100" c="SCONVEN" lit="9902590"/></c:set>
                                       <c:set var="title1"><axis:alt f="axisprf100" c="TDESCRI" lit="100588"/></c:set>
                                       <c:set var="title2"><axis:alt f="axisprf100" c="STARIFA" lit="9904895"/></c:set>
                                       <c:set var="title3"><axis:alt f="axisprf100" c="SPERSED" lit="9902589"/></c:set>
                                       <c:set var="title4"><axis:alt f="axisprf100" c="MODIFICAR" lit="9000552" /></c:set><!--Modificar-->
                               </td>
                               <td>
                              <div class="displayspace">
                                <display:table name="${__formdata['CONVENIOS']}"
                                               id="T_IAX_CONVENIOS" export="false"
                                               class="dsptgtable" pagesize="-1"
                                               defaultsort="1"
                                               defaultorder="ascending"
                                               sort="list" cellpadding="0"
                                               cellspacing="0"
                                               requestURI="">
                                  <%@ include file="../include/displaytag.jsp"%>
                                  <display:column sortable="true"
                                                  sortProperty=""
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false" style="width:4%">
                                    <div class="dspText">
                                    <input type="radio" id="SCONVEN" name="SCONVEN" value="${T_IAX_CONVENIOS.OB_IAX_PROF_CONVE.SCONVEN}" 
                                           onchange="muestraEstados(${T_IAX_CONVENIOS.OB_IAX_PROF_CONVE.SCONVEN})"/>
                                    </div>
                                  </display:column>
                                  <axis:visible f="axisprf100" c="SCONVEN">
                                   <display:column title="${title0}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_CONVE.SCONVEN"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false"
                                                  style="width:9%">
                                    <div class="dspText">
                                      ${T_IAX_CONVENIOS.OB_IAX_PROF_CONVE.SCONVEN}
                                    </div>
                                  </display:column>
                                  </axis:visible>
                                  <display:column title="${title1}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_CONVE.TDESCRI"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false"
                                                  style="width:33%">
                                    <div class="dspText">
                                        ${T_IAX_CONVENIOS.OB_IAX_PROF_CONVE.TDESCRI}
                                    </div>
                                  </display:column>
                                  <display:column title="${title2}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_CONVE.STARIFA"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                       ${T_IAX_CONVENIOS.OB_IAX_PROF_CONVE.STARIFA}-${T_IAX_CONVENIOS.OB_IAX_PROF_CONVE.TTARIFA}
                                    </div>
                                  </display:column>
                                  <display:column title="${title3}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_CONVE.SPERSED"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false"
                                                  style="width:30%">
                                    <div class="dspText">
                                      ${T_IAX_CONVENIOS.OB_IAX_PROF_CONVE.TPERSED}
                                    </div>
                                  </display:column>
                                  <axis:visible f="axisprf100" c="BT_SIN_EDITAR_CONVENIO"> <!-- boton editar convenio -->
                                  <display:column title="${title4}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                    <div class="dspIcons" id="BT_EDITAR_CONVENIO">
                                        <img border="0" alt="<axis:alt f="axisprf100" c="BT_EDITAR_CONVENIO" lit="100002"/>"
                                             title1="<axis:alt f="axisprf100" c="BT_EDITAR_CONVENIO" lit="100002"/>" 
                                             src="images/lapiz.gif" width="15px" height="15px"
                                             style="cursor:pointer;" 
                                             onclick="javascript:f_abrir_modal('axisprf101',null,'&pSPROFES='+document.miForm.pSPROFES.value+
                                                                                                 '&SCONVEN='+'${T_IAX_CONVENIOS.OB_IAX_PROF_CONVE.SCONVEN}'+
                                                                                                 '&MODO=modificar');"  />
                                    </div>
                                  </display:column> 
                                  </axis:visible>
                                </display:table>     
                               </div>
                               </td>
                          </tr>
                         </table>
                               <div class="separador">&nbsp;</div> 
                               <div class="separador">&nbsp;</div> 
                               <div class="separador">&nbsp;</div> 
                       <div class="titulo" id="tituloEstados" >
                              <img src="images/flecha.gif"/><b><axis:alt f="axisprf100" c="LIT32" lit="9904136"/></b>
                        </div>                        
                        <table class="seccion" id="bloqueEstados" >       
                              <axis:visible f="axisprf100" c="BT_ALTA_ESTADOS">
                              <c:if test="${! ocultarIconosEdicion && __configform.axisprf100__BT_ALTA_ESTADOS__visible != 'false'}">
                                <div style="float:right;">
                                  <a href="javascript:f_abrir_modal('axisprf106',null,'&pSPROFES='+document.miForm.pSPROFES.value+
                                                                    '&pSCONVEN='+document.miForm.pSCONVEN.value+'&MODO=alta');">
                                    <img border="0"
                                         alt='<axis:alt f="axisprf100" c="LIT_NVESTADO" lit="9904896"/>'
                                         title='<axis:alt f="axisprf100" c="LIT_NVESTADO" lit="9904896"/>'
                                         src="images/new.gif" id="anyadirEstado" />
                                  </a>
                                </div>
                              </c:if>
                              </axis:visible>
                            <tr><td>
                                       <c:set var="title0"><axis:alt f="axisprf100" c="TESTADO" lit="101510"/></c:set>
                                       <c:set var="title1"><axis:alt f="axisprf100" c="FESTADO" lit="9902360"/></c:set>
                                       <c:set var="title2"><axis:alt f="axisprf100" c="TCOMENTARIOS" lit="9901586"/></c:set>
                                       <c:set var="title3"><axis:alt f="axisprf100" c="CANULADO" lit="101311"/></c:set>
                                       <c:set var="title4"><axis:alt f="axisprf100" c="CUSUALT" lit="100894"/></c:set>
                                       <c:set var="title5"><axis:alt f="axisprf100" c="FALTA" lit="100562"/></c:set>
                                       <c:set var="title6"><axis:alt f="axisprf100" c="ELIMINAR" lit="1000127" /></c:set><!--Eliminar-->
                               </td>
                               <td>
                               <div class="displayspace">
                                <display:table name="${sessionScope.axisprf100_listaEstados}"
                                               id="miListaId" export="false"
                                               class="dsptgtable" pagesize="-1"
                                               defaultorder="ascending"
                                               cellpadding="0"
                                               cellspacing="0"
                                               requestURI="">
                                  <%@ include file="../include/displaytag.jsp"%>
                                  <display:column title="${title0}"
                                                  sortable="true"
                                                  sortProperty="${miListaId['TESTADO']}"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false"
                                                  style="width:9%">
                                    <div class="dspText">
                                      ${miListaId['TESTADO']}
                                    </div>
                                  </display:column>
                                  <display:column title="${title1}"
                                                  sortable="true"
                                                  sortProperty="${miListaId['FESTADO']}"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false"
                                                  style="width:12%">
                                    <div class="dspText">
                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId['FESTADO']}"/>
                                    </div>
                                  </display:column>
                                  <display:column title="${title2}"
                                                  sortable="true"
                                                  sortProperty="${miListaId['TOBSERV']}"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${miListaId['TOBSERV']}
                                    </div>
                                  </display:column>
                                 <display:column title="${title3}"
                                                  sortable="true"
                                                  sortProperty="${miListaId['CANULAD']}"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false"
                                                  style="width:12%">
                                    <div class="dspText">
                                       <c:if test="${miListaId['CANULAD'] == '1'}">
                                            SI
                                        </c:if>
                                        <c:if test="${miListaId['CANULAD'] != '1'}">
                                            NO
                                        </c:if>  
                                    </div>
                                  </display:column>
                                  <display:column title="${title4}"
                                                  sortable="true"
                                                  sortProperty="${miListaId['CUSUALT']}"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false"
                                                  style="width:12%">
                                    <div class="dspText">
                                      ${miListaId['CUSUALT']}
                                    </div>
                                  </display:column>
                                  <display:column title="${title5}"
                                                  sortable="true"
                                                  sortProperty="${miListaId['FALTA']}"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false"
                                                  style="width:12%">
                                    <div class="dspText">
                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId['FALTA']}"/>
                                    </div>
                                  </display:column>
                                 <axis:visible f="axisprf100" c="BT_DELETE_ESTADO">  <!-- boton delete estado -->
                                  <display:column title="${title6}" 
                                                  headerClass="headwidth5 sortable" 
                                                  style="width:5%" 
                                                  media="html" autolink="false" >
                                     <div class="dspIcons" id="BT_DELETE_ESTADO">
                                        <img border="0" alt="<axis:alt f="axisprf100" c="BT_DELETE_ESTADO" lit="1000127"/>" 
                                             title1="<axis:alt f="axisprf100" c="BT_DELETE_ESTADO" lit="1000127"/>" 
                                             src="images/delete.gif" width="15px" height="15px"  
                                             style="cursor:pointer;" onclick="f_borrar_fila('&CESTADO='+'${miListaId['DESTADO']}'+
                                                                                            '&FESTADO='+'${miListaId['FESTADO']}','estado')"/>
                                     </div>
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
        </axis:visible>            
    </form>    
    <c:import url="../include/botonera_nt.jsp">
       <c:param name="f">axisprf100</c:param>
       <c:param name="__botones"><axis:ocultar f="axisprf100" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar></c:param>
    </c:import>
    <c:import url="../include/mensajes.jsp" />    
</body>
</html>


