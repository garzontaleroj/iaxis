<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
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
                    var SPROFES_INI = "${__formdata.SPROFES_INI}";
                    var SPERSON = "${__formdata.SPERSON}";
                    if (objUtiles.estaVacio(SPROFES_INI)) {
                        f_abrir_modal('axisprf000',null,null);
                    }else{
                        $("#pCodiProf").val(SPROFES_INI);
                        $("#SPERSON").val(SPERSON);
                        var CNOASIS = "${__formdata['OBPROFESIONAL'].CNOASIS}";
                        if (CNOASIS == 1){
                           $("#CNOASIS").prop("checked","true");
                        }
                        var TTIPPER = "${__formdata['OBPROFESIONAL'].CTIPPER}";
                        var CMODCON = "${__formdata['OBPROFESIONAL'].CMODCON}";
                        if (TTIPPER == 1){
                            $("#TTIPPER").val("Física");
                        }else if (TTIPPER == 2){
                            $("#TTIPPER").val("Jurídica");
                        }
                        $('input[name=CMODCON]:radio').each(function(){
                            if($(this).val()== CMODCON){
                                $(this).prop("checked","true");
                            }
                        });
                    }
             <% }  %>  
            }
            
            function f_aceptar_modal(pantalla){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axisprf001.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
            
            function f_aceptar_modal(pantalla, param){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axisprf001.do?"+param, "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
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
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisprf001", "cancelar", document.miForm, "_self");            
            }

            function f_borrar_fila(datos, que){
                var answer = confirm(objJsMessages.jslit_confirma_borrar);
                if (answer)
                objUtiles.ejecutarFormulario("axis_axisprf001.do?SPROFES="+objDom.getValorPorId("pCodiProf")+datos,
                                             "del_"+que, document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            function actualizaSprofes(SPROFES){
                $("#pCodiProf").val(SPROFES);
            }
            
            function f_aceptar_persona(SPERSON,CAGENTE, SNIP, modal){
               f_cerrar_modal(modal);
    
               document.miForm.SNIP.value = SNIP;
               document.miForm.SPERSON.value = SPERSON;
               document.miForm.CAGENTE.value = CAGENTE;
               f_abrir_modal('axisprf002',null,'&pCodiProf='+$("#pCodiProf").val()+"&SPERSON="+$("#SPERSON").val());
            }
            
            function f_nova_persona(){
                f_cerrar_modalespersona("axisper021");
                var CAGENTE = "${__formdata.CAGENTE_PERSN}";
                objUtiles.abrirModal("axisper022","src","modal_axisper022.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBLICAS&CAGENTE="+CAGENTE);  
            }
      
            function f_cerrar_axisper022(){
                f_cerrar_modalespersona("axisper022");
            } 
            
            function set_contacto_pref(contacto_pref){
                objUtiles.ejecutarFormulario("axis_axisprf001.do?SPROFES="+objDom.getValorPorId("pCodiProf")+"&CMODCON="+contacto_pref,
                                             "set_contacto_pref", document.miForm, "_self", objJsMessages.jslit_cargando);
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

    <form name="miForm" action="axis_axisprf001.do" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="pCodiProf" name="pCodiProf" value=""/>
            <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>
            <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}" />
            <input type="hidden" name="SNIP" id="SNIP" value="${__formdata.SNIP}" />

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="form" f="axisprf001" lit="9904113"/></c:param>
                <c:param name="producto"><axis:alt c="form" f="axisprf001" lit="9904113"/></c:param>
                <c:param name="form">axisprf001</c:param>
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf000|<axis:alt f="axisprf001" c="MODAL_AXISPRF000" lit="9904785" /></c:param>
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisper021|<axis:alt f="axisprf001" c="MODAL_AXISPER021" lit="1000235" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisper022|<axis:alt f="axisprf001" c="MODAL_AXISPER022" lit="1000235" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisper010|<axis:alt f="axisprf001" c="MODAL_AXISPER010" lit="110275" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf002|<axis:alt f="axisprf001" c="MODAL_AXISPRF002" lit="9904788" /></c:param>
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf003|<axis:alt f="axisprf001" c="MODAL_AXISPRF003" lit="9904774" /></c:param>
            </c:import> 
             <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf004|<axis:alt f="axisprf001" c="MODAL_AXISPRF004" lit="9904719" /></c:param>
            </c:import> 
             <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf005|<axis:alt f="axisprf001" c="MODAL_AXISPRF005" lit="9904114" /></c:param>
            </c:import>             
             <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf006|<axis:alt f="axisprf001" c="MODAL_AXISPRF006" lit="9904137" /></c:param>
            </c:import> 
             <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf007|<axis:alt f="axisprf001" c="MODAL_AXISPRF007" lit="9904707" /></c:param>
            </c:import>
             <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf009|<axis:alt f="axisprf001" c="MODAL_AXISPRF009" lit="9904738" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf010|<axis:alt f="axisprf001" c="MODAL_AXISPRF010" lit="9904751" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf011|<axis:alt f="axisprf001" c="MODAL_AXISPRF011" lit="9904759" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf008|<axis:alt f="axisprf001" c="MODAL_AXISPRF008" lit="9904766" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf012|<axis:alt f="axisprf001" c="MODAL_AXISPRF012" lit="9904777" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf014|<axis:alt f="axisprf001" c="MODAL_AXISPRF014" lit="9904810" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf013|<axis:alt f="axisprf001" c="MODAL_AXISPRF014" lit="9904828" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf015|<axis:alt f="axisprf001" c="MODAL_AXISPRF015" lit="9901998" /></c:param>
            </c:import>
             <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf016|<axis:alt f="axisprf001" c="MODAL_AXISPRF016" lit="101278" /></c:param>
            </c:import>
			<c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf101|<axis:alt f="axisprf001" c="MODAL_AXISPRF101" lit="9904896" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisfileupload|<axis:alt f="axisprf001" c="TITULOFILEUPLOAD" lit="1000614"/></c:param>
            </c:import>
            <axis:visible c="DSP_CUENTAS" f="axisprf001"> 
              <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                <td>
                <table class="seccion">
                <tr>
                    <td align="left" >
                         <table class="area" align="center">
                            <tr>
                    <th style="width:15%;height:0px"></th>
                    <th style="width:20%;height:0px"></th>
                    <th style="width:15%;height:0px"></th>                                
                    <th style="width:13%;height:0px"></th>   
                    <th style="width:26%;height:0px"></th>   
                </tr>  
                <tr>
                    <td colspan="5">
                        <axis:visible f="axisprf001" c="BT_EDI_DATPROF"><!-- EDICION CABECERA PROFESIONAL -->
                            <div id="BT_EDI_DATPROF">
                                <a href="javascript:f_abrir_modal('axisprf002',null,'&pCodiProf='+document.miForm.pCodiProf.value+
                                                                                    '&SPERSON='+objDom.getValorPorId('SPERSON')+'&MODO=modificar')" >
                                    <img border="0" style="float:right;padding-right:10px;" alt="<axis:alt f="axisprf001" c="LIT_IMG_BUSCAR" lit="9001521"/>" 
                                         title="<axis:alt f="axisprf001" c="LIT_IMG_BUSCAR" lit="9001521"/>" src="images/lapiz.gif"/>
                                </a>
                            </div>
                        </axis:visible>
                    </td>
                </tr>
                <tr>
                    <td  colspan="6"><div class="separador">&nbsp;</div> 
                        <div class="titulo">
                          <img src="images/flecha.gif"/><b><axis:alt f="axisprf001" c="LIT32" lit="9904801"/></b>
                        </div>
                    </td>
                </tr>
                <!--<tr>
                    <td><div class="separador" colspan="6">&nbsp;</div></td>
                </tr>-->
                <tr>
                      
                    <axis:ocultar f="axisprf002" c="SPROFES" dejarHueco="false"> 
                        <td class="titulocaja">
                           <b><axis:alt f="axisprf002" c="SPROFES" lit="9904784"/></b>
                        </td>
                    </axis:ocultar>
                    <axis:ocultar f="axisprf002" c="TTIPPER" dejarHueco="false"> 
                        <td class="titulocaja">
                           <b><axis:alt f="axisprf002" c="TTIPPER" lit="102844"/></b>
                        </td>
                    </axis:ocultar>
                    <axis:ocultar f="axisprf002" c="TTIPIDE" dejarHueco="false"> 
                        <td class="titulocaja">
                           <b><axis:alt f="axisprf002" c="TTIPIDE" lit="150996"/></b>
                        </td>
                    </axis:ocultar>
                    <axis:ocultar f="axisprf002" c="NNUMIDE" dejarHueco="false"> 
                        <td class="titulocaja">
                           <b><axis:alt f="axisprf002" c="NNUMIDE" lit="9903661"/></b>
                        </td>
                    </axis:ocultar>
                    <axis:ocultar f="axisprf002" c="TNOMBRE" dejarHueco="false"> 
                        <td class="titulocaja">
                           <b><axis:alt f="axisprf002" c="TNOMBRE" lit="105940"/></b>
                        </td>
                    </axis:ocultar>
                </tr> 
                <tr>
                    <axis:visible f="axisprf000" c="SPROFES" >
                        <td class="campocaja">
                            <input type="text" class="campodisabled campo campotexto" value="${__formdata['OBPROFESIONAL'].SPROFES}" name="SPROFES" id="SPROFES" 
                                   readonly="true" style="width:67%" size="15"/>
                        </td>
                    </axis:visible>
                    <axis:visible f="axisprf000" c="TTIPPER" >
                        <td class="campocaja">
                            <input type="text" class="campodisabled campo campotexto" value="" name="TTIPPER" id="TTIPPER" 
                                   readonly="true"  style="width:70%" size="15"/>
                        </td>
                    </axis:visible>
                    <axis:visible f="axisprf000" c="CTIPIDE" >
                        <td class="campocaja">
                            <input type="text" class="campodisabled campo campotexto" value="${__formdata['OBPROFESIONAL'].TTIPIDE}" name="TTIPIDE" id="TTIPIDE" 
                                   readonly="true" style="width:60%" size="15" />
                        </td>
                    </axis:visible>
                    <axis:visible f="axisprf000" c="NNUMIDE" >
                        <td class="campocaja">
                            <input type="text" class="campodisabled campo campotexto" value="${__formdata['OBPROFESIONAL'].NNUMIDE}" name="NNUMIDE" id="NNUMIDE" 
                                   readonly="true" style="width:75%" size="15" />
                        </td>
                    </axis:visible>
                    <axis:visible f="axisprf000" c="TNOMBRE" >
                        <td class="campocaja">
                            <input type="text" class="campodisabled campo campotexto" value="${__formdata['OBPROFESIONAL'].TNOMBRE}" name="TNOMBRE" id="TNOMBRE" 
                                   readonly="true" size="15" />
                        </td>
                    </axis:visible>
                </tr>
                <tr>
                    <axis:ocultar f="axisprf002" c="CDOMICI" dejarHueco="false"> 
                        <td class="titulocaja" colspan="2">
                            <b><axis:alt f="axisprf002" c="CDOMICI" lit="9903470"/></b>
                        </td>
                    </axis:ocultar>
                    <axis:ocultar f="axisprf002" c="NREGMER" dejarHueco="false"> 
                        <td class="titulocaja">
                           <b><axis:alt f="axisprf002" c="NREGMER" lit="9904789"/></b>
                        </td>
                    </axis:ocultar>
                    <axis:ocultar f="axisprf002" c="FREGMER" dejarHueco="false"> 
                        <td class="titulocaja">
                           <b><axis:alt f="axisprf002" c="FREGMER" lit="9904790"/></b>
                        </td>
                    </axis:ocultar>
                    <axis:ocultar f="axisprf002" c="NLIMITE" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axisprf002" c="NLIMITE" lit="9904791"/></b>
                        </td>
                    </axis:ocultar>
                </tr>
                <tr>
                    <axis:visible f="axisprf000" c="TDOMICI" >
                        <td class="campocaja"  colspan="2">
                            <input type="text" class="campodisabled campo campotexto" value="${__formdata['OBPROFESIONAL'].TDOMICI}" name="CDOMICI" id="CDOMICI" 
                                   readonly size="15"  />
                        </td>
                    </axis:visible>
                    <axis:visible f="axisprf000" c="NREGMER" >
                        <td class="campocaja">
                            <input type="text" class="campodisabled campo campotexto" value="${__formdata['OBPROFESIONAL'].NREGMER}" name="NREGMER" id="NREGMER" 
                                   readonly size="15"  />
                        </td>
                    </axis:visible>
                    <axis:visible f="axisprf000" c="FREGMER" >
                        <td class="campocaja">
                            <input  type="text" class="campodisabled campo campotexto" size="10" 
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OBPROFESIONAL.FREGMER}"/>" name="FREGMER" id="FREGMER" 
                                    title= "<axis:alt f="axisprf002" c="FREGMER" lit="108341"/>"  
                                            <axis:atr f="axisprf002" c="FREGMER" a="modificable=false&formato=fecha"/> 
                                    style= "width:75%" readonly/>
                        </td>
                    </axis:visible>
                    <axis:visible f="axisprf000" c="NLIMITE" >
                        <td class="campocaja">
                            <input type="text" class="campodisabled campo campotexto" value="${__formdata['OBPROFESIONAL'].NLIMITE}" name="NLIMITE" id="NLIMITE" 
                                   readonly size="15" style="width:41%" />
                        </td>
                    </axis:visible>
                </tr>
                <tr>
                    <axis:ocultar f="axisprf002" c="CNOASIS" dejarHueco="false"> 
                        <td class="titulocaja">
                           <b><axis:alt f="axisprf002" c="CNOASIS" lit="9904792"/></b>
                        </td>
                    </axis:ocultar>
                    <axis:ocultar f="axisprf002" c="CTELCLI" dejarHueco="false"> 
                        <td class="titulocaja">
                           <b><axis:alt f="axisprf002" c="CTELCLI" lit="9904793"/></b>
                        </td>
                    </axis:ocultar>
                </tr>
                <tr>
                    <axis:visible f="axisprf000" c="CNOASIS" >
                        <td class="campocaja">
                            <input type="checkbox" class="campodisabled campo campotexto" value="1" name="CNOASIS" id="CNOASIS"
                                   disabled style="width:40%" size="15" />
                        </td>
                    </axis:visible>
                    <axis:visible f="axisprf000" c="TTELCLI" >
                        <td class="campocaja">
                            <input type="text" class="campodisabled campo campotexto" value="${__formdata['OBPROFESIONAL'].TTELCLI}" name="CTELCLI" id="CTELCLI" 
                                   readonly size="15"  style="width:40%" />
                        </td>
                    </axis:visible>
                </tr>
                </table>
                </td>
                </tr>
                </table>
                
                <tr>
                  <td colspan="6">
                     <div class="separador">&nbsp;</div>  
                       
                     <div class="titulo">
                          <img src="images/flecha.gif"/><b><axis:alt f="axisprf001" c="LIT32" lit="9906563"/></b>
                     </div>                        
                     <table class="seccion"> 
		    <%--  TCS_1569B - ACL - 31/01/2019 - No se utilizará el botón nuevo--%>  
                     <%--     <axis:visible f="axisprf001" c="BT_NVIMPUESTO">
                          <c:if test="${! ocultarIconosEdicion && __configform.axisprf001__BT_NVIMPUESTO__visible != 'false'}">
                            <div style="float:right;">
                              <a href="javascript:f_abrir_modal('axisprf016',null,'&SPROFES='+document.miForm.pCodiProf.value+'&MODO=alta');">
                                <img border="0"
                                     alt='<axis:alt f="axisprf001" c="LIT_NVIMPUESTO" lit="9906560"/>'
                                     title='<axis:alt f="axisprf001" c="LIT_NVIMPUESTO_TIT" lit="9906560"/>'
                                     src="images/new.gif"/>
                              </a>
                            </div>
                          </c:if>
                        </axis:visible>  --%>
                        <tr>
                            <td>
                                <c:import url="axisprf001_impuestos.jsp"/>
                                <!-- CONTROL FOCUS -->
                     	    	<input type="image" id="impuestos_focus" name="sedes_focus" src="images/empty.gif" style="height:0px;width:0px;"/>
        						<!-- CONTROL FOCUS -->
                            </td>
                        </tr>
                     </table>
                     <div class="separador">&nbsp;</div>            
                     <div class="titulo">
                          <img src="images/flecha.gif"/><b><axis:alt f="axisprf001" c="LIT32" lit="9904813"/></b>
                     </div>                        
                     <table class="seccion">
                             <tr>
                               <td>
                                    <c:import url="axisprf001_contacto.jsp"/>
                                    <!-- CONTROL FOCUS -->
                     				<input type="image" id="contacto_focus" name="contacto_focus" src="images/empty.gif" style="height:0px;width:0px;"/>
        							<!-- CONTROL FOCUS -->
                              </td>
                            </tr>
                     </table>
                     <div class="separador">&nbsp;</div>            
                     <div class="titulo">
                          <img src="images/flecha.gif"/><b><axis:alt f="axisprf001" c="LIT32" lit="9905712"/></b>
                     </div>                        
                     <table class="seccion"> 
							 <axis:visible f="axisprf001" c="BT_ALTA_CONVENIOS">
                              <c:if test="${! ocultarIconosEdicion && __configform.axisprf100__BT_ALTA_CONVENIOS__visible != 'false'}">
                                <div style="float:right;">
                                  <a href="javascript:f_abrir_modal('axisprf101',null,'&pSPROFES='+document.miForm.SPROFES.value+'&MODO=alta');">
                                    <img border="0"
                                         alt='<axis:alt f="axisprf001" c="LIT_NVCONVENIO" lit="9904896"/>'
                                         title='<axis:alt f="axisprf001" c="LIT_NVCONVENIO" lit="9904896"/>'
                                         src="images/new.gif"/>
                                  </a>
                                </div>
                              </c:if>
                              </axis:visible>    
							  
                        <tr>
                            <td>
                                <c:import url="axisprf001_convenios.jsp"/>
                     	    	<input type="image" id="convenios_focus" name="convenios_focus" src="images/empty.gif" style="height:0px;width:0px;"/>
                            </td>
                        </tr>
                     </table> 
                     <div class="separador">&nbsp;</div>            
                     <div class="titulo">
                          <img src="images/flecha.gif"/><b><axis:alt f="axisprf001" c="LIT32" lit="9904773"/></b>
                     </div>                        
                     <table class="seccion">         
                            <axis:visible f="axisprf001" c="BT_CARGA_ROL">
                            <c:if test="${! ocultarIconosEdicion && __configform.axisprf001__BT_ANADIR_ROL__visible != 'false'}">
                            <div style="float:right;">
                                 <a href="javascript:f_abrir_modal('axisprf003',null,'&pCodiProf='+document.miForm.pCodiProf.value+'&MODO=alta');">
                                 <img border="0"
                                      alt='<axis:alt f="axisprf001" c="LIT_NVROL" lit="9904774"/>'
                                      title='<axis:alt f="axisprf001" c="LIT_NVROL" lit="9904774"/>'
                                      src="images/new.gif"/>
                                  </a>
                            </div>
                            </c:if>
                            </axis:visible>                        
                            <tr>
                               <td>
                                    <c:import url="axisprf001_roles.jsp"/>
                                    <!-- CONTROL FOCUS -->
                     				<input type="image" id="roles_focus" name="roles_focus" src="images/empty.gif" style="height:0px;width:0px;"/>
        							<!-- CONTROL FOCUS -->
                              </td>
                            </tr>
                   </table>
                   <div class="separador">&nbsp;</div>            
                   <div class="titulo">
                       <img src="images/flecha.gif"/><b><axis:alt f="axisprf001" c="LIT32" lit="9904724"/></b>
                   </div>
                        <table class="seccion">
                          <axis:visible f="axisprf001" c="BT_NVPERSCONT">
                          <c:if test="${! ocultarIconosEdicion && __configform.axisprf001__BT_ANADIR_PERSCONT__visible != 'false'}">
                            <div style="float:right;">
                              <a href="javascript:f_abrir_modal('axisprf004',null,'&pCodiProf='+document.miForm.pCodiProf.value+'&MODO=alta');">
                                <img border="0"
                                     alt='<axis:alt f="axisprf001" c="LIT_NVPERSCONT" lit="1000438"/>'
                                     title='<axis:alt f="axisprf001" c="LIT_NVPERSCONT_TIT" lit="1000438"/>'
                                     src="images/new.gif"/>
                              </a>
                            </div>
                          </c:if>
                          </axis:visible>
                          <tr>
                               <td>
                                    <c:import url="axisprf001_perscont.jsp"/>
                                    <!-- CONTROL FOCUS -->
                     				<input type="image" id="perscont_focus" name="perscont_focus" src="images/empty.gif" style="height:0px;width:0px;"/>
        							<!-- CONTROL FOCUS -->
                              </td>
                          </tr>
                          </table>
                   <div class="separador">&nbsp;</div>            
                        <div class="titulo">
                          <img src="images/flecha.gif"/><b><axis:alt f="axisprf001" c="LIT32" lit="1000091"/></b>
                        </div>
                        <table class="seccion">
                          <axis:visible f="axisprf001" c="BT_NVCUENTA">
                          <c:if test="${! ocultarIconosEdicion && __configform.axisprf001__BT_ANADIR_CUENTA__visible != 'false'}">
                            <div style="float:right;">
                              <a href="javascript:f_abrir_modal('axisprf005',null,'&pCodiProf='+document.miForm.pCodiProf.value+'&MODO=alta');">
                                <img border="0"
                                     alt='<axis:alt f="axisprf001" c="LIT_NVCUENTA" lit="1000438"/>'
                                     title='<axis:alt f="axisprf001" c="LIT_NVCUENTA_TIT" lit="1000438"/>'
                                     src="images/new.gif"/>
                              </a>
                            </div>
                          </c:if>
                          </axis:visible>
                          <tr>
                               <td>
                                    <c:import url="axisprf001_ccc.jsp"/>
                                    <!-- CONTROL FOCUS -->
                     				<input type="image" id="ccc_focus" name="ccc_focus" src="images/empty.gif" style="height:0px;width:0px;"/>
        							<!-- CONTROL FOCUS -->
                              </td>
                          </tr>
                       </table>
                        
                     <div class="separador">&nbsp;</div>   
                     <div class="titulo">
                          <img src="images/flecha.gif"/><b><axis:alt f="axisprf001" c="LIT32" lit="9904811"/></b>
                     </div>                        
                     <table class="seccion">         
                        <tr>
                            <td>
                                <c:import url="axisprf001_sedes.jsp"/>
                                <!-- CONTROL FOCUS -->
                     	    	<input type="image" id="sedes_focus" name="sedes_focus" src="images/empty.gif" style="height:0px;width:0px;"/>
        						<!-- CONTROL FOCUS -->
                            </td>
                        </tr>
                     </table> 
                     <div class="separador">&nbsp;</div>            
                     <div class="titulo">
                          <img src="images/flecha.gif"/><b><axis:alt f="axisprf001" c="LIT32" lit="9904826"/></b>
                     </div>                        
                     <table class="seccion">         
                        <tr>
                           <td>
                              <c:import url="axisprf001_representantes.jsp"/>
                              <!-- CONTROL FOCUS -->
                              <input type="image" id="representantes_focus" name="representantes_focus" src="images/empty.gif" 
                                     style="height:0px;width:0px;"/>
                              <!-- CONTROL FOCUS -->
                           </td>
                        </tr>
                     </table> 
                       <div class="separador">&nbsp;</div>            
                       <div class="titulo">
                              <img src="images/flecha.gif"/><b><axis:alt f="axisprf001" c="LIT32" lit="9904136"/></b>
                        </div>                        
                        <table class="seccion">         
                              <axis:visible f="axisprf001" c="BT_HISTESTAD">
                              <c:if test="${! ocultarIconosEdicion && __configform.axisprf001__BT_ANADIR_ESTADO__visible != 'false'}">
                                <div style="float:right;">
                                  <a href="javascript:f_abrir_modal('axisprf006',null,'&pCodiProf='+document.miForm.pCodiProf.value+'&MODO=alta');">
                                    <img border="0"
                                         alt='<axis:alt f="axisprf001" c="LIT_NVESTADO" lit="9904137"/>'
                                         title='<axis:alt f="axisprf001" c="LIT_NVESTADO" lit="9904137"/>'
                                         src="images/new.gif"/>
                                  </a>
                                </div>
                              </c:if>
                              </axis:visible>                        
                            <tr><td>
                                       <c:set var="title0"><axis:alt f="axisprf001" c="TESTADO" lit="101510"/></c:set>
                                       <c:set var="title1"><axis:alt f="axisprf001" c="FINIVIG" lit="9902360"/></c:set>
                                       <c:set var="title2"><axis:alt f="axisprf001" c="CMOTBAJA" lit="9903478"/></c:set>
                                       <c:set var="title3"><axis:alt f="axisprf001" c="TCOMENTARIOS" lit="9901586"/></c:set>
                                       <c:set var="title4"><axis:alt f="axisprf001" c="CANULADO" lit="101311"/></c:set>
                                       <c:set var="title5"><axis:alt f="axisprf001" c="TUSUARIO" lit="100894"/></c:set>
                                       <c:set var="title6"><axis:alt f="axisprf001" c="ELIMINAR" lit="1000127" /></c:set><!--Eliminar-->
                               </td><td>
                              <div class="displayspace">
                                <display:table name="${__formdata['OBPROFESIONAL'].ESTADOS}"
                                               id="T_IAX_ESTADOS" export="false"
                                               class="dsptgtable" pagesize="-1"
                                               defaultorder="ascending"
                                               cellpadding="0"
                                               cellspacing="0"
                                               requestURI="axis_axisprf001.do?paginar=true&subpantalla=datosgenerales">
                                  <%@ include file="../include/displaytag.jsp"%>
                                  <axis:visible f="axisprf001" c="TESTADO">
                                   <display:column title="${title0}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_ESTADOS.TESTADO"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${T_IAX_ESTADOS.OB_IAX_PROF_ESTADOS.TESTADO}
                                    </div>
                                  </display:column>
                                  </axis:visible>
                                  <display:column title="${title1}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_ESTADOS.FESTADO"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_ESTADOS.OB_IAX_PROF_ESTADOS.FESTADO}"/>
                                    </div>
                                  </display:column>
                                  <display:column title="${title2}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_ESTADOS.TMOTBAJ"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                       ${T_IAX_ESTADOS.OB_IAX_PROF_ESTADOS.TMOTBAJ}
                                    </div>
                                  </display:column>
                                  <display:column title="${title3}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_ESTADOS.TOBSERV"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${T_IAX_ESTADOS.OB_IAX_PROF_ESTADOS.TOBSERV}
                                    </div>
                                  </display:column>
                                  <display:column title="${title4}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_ESTADOS.CANULAD"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                        <c:if test="${T_IAX_ESTADOS.OB_IAX_PROF_ESTADOS.CANULAD == '1'}">
                                            SI
                                        </c:if>
                                        <c:if test="${T_IAX_ESTADOS.OB_IAX_PROF_ESTADOS.CANULAD != '1'}">
                                            NO
                                        </c:if>     
                                    </div>
                                  </display:column>
                                  <axis:visible f="axisprf001" c="TUSUARIO">
                                  <display:column title="${title5}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_ESTADOS.CUSUARI"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${T_IAX_ESTADOS.OB_IAX_PROF_ESTADOS.CUSUARI}
                                    </div>
                                  </display:column>
                                  </axis:visible>
                                  <axis:visible f="axisprf001" c="BT_DELETE_ESTADO">  <!-- boton delete estado -->
                                  <display:column title="${title6}" 
                                                  headerClass="headwidth5 sortable" 
                                                  style="width:5%" 
                                                  media="html" autolink="false" >
                                     <div class="dspIcons" id="BT_DELETE_ESTADO">
                                        <img border="0" alt="<axis:alt f="axisprf001" c="BT_DELETE_ESTADO" lit="1000127"/>" 
                                             title1="<axis:alt f="axisprf001" c="BT_DELETE_ESTADO" lit="1000127"/>" 
                                             src="images/delete.gif" width="15px" height="15px"  
                                             style="cursor:pointer;" onclick="f_borrar_fila('&FESTADO='+'${T_IAX_ESTADOS.OB_IAX_PROF_ESTADOS.FESTADO}','estado')"/>
                                     </div>
                                  </display:column>
                                  </axis:visible>
                                </display:table>                                  
                                </td></tr>
                        </table>
                        
                       <div class="separador">&nbsp;</div>            
                       <div class="titulo">
                              <img src="images/flecha.gif"/><b><axis:alt f="axisprf001" c="LIT32" lit="9904708"/></b>
                        </div>                        
                        <table class="seccion">         
                              <axis:visible f="axisprf001" c="BT_ZONAS">
                              <c:if test="${! ocultarIconosEdicion && __configform.axisprf001__BT_ANADIR_ZONA__visible != 'false'}">
                                <div style="float:right;">
                                  <a href="javascript:f_abrir_modal('axisprf007',null,'&pCodiProf='+document.miForm.pCodiProf.value+'&MODO=alta');">
                                    <img border="0"
                                         alt='<axis:alt f="axisprf001" c="LIT_NVZONA" lit="9904707"/>'
                                         title='<axis:alt f="axisprf001" c="LIT_NVZONA" lit="9904707"/>'
                                         src="images/new.gif"/>
                                  </a>
                                </div>
                              </c:if>
                              </axis:visible>                        
                            <tr><td>
                                       <c:set var="title0"><axis:alt f="axisprf001" c="TTPZONA" lit="9901195"/></c:set>
                                       <c:set var="title1"><axis:alt f="axisprf001" c="TPROVIN" lit="100756"/></c:set>
                                       <c:set var="title2"><axis:alt f="axisprf001" c="TPOBLAC" lit="100817"/></c:set>
                                       <c:set var="title3"><axis:alt f="axisprf001" c="CPOSINI" lit="9904709"/></c:set>
                                       <c:set var="title4"><axis:alt f="axisprf001" c="CPOSFIN" lit="9904710"/></c:set>
                                       <c:set var="title5"><axis:alt f="axisprf001" c="FDESDE" lit="9902360"/></c:set>
                                       <c:set var="title6"><axis:alt f="axisprf001" c="FHASTA" lit="9902361"/></c:set>
                                       <c:set var="title7"><axis:alt f="axisprf001" c="MODIFICAR" lit="9000552" /></c:set><!--Modificar-->
                               </td><td>
                              <div class="displayspace">
                                <display:table name="${__formdata['OBPROFESIONAL'].ZONAS}"
                                               id="T_IAX_ZONAS" export="false"
                                               class="dsptgtable" pagesize="-1"
                                               defaultsort="1"
                                               defaultorder="ascending"
                                               sort="list" cellpadding="0"
                                               cellspacing="0"
                                               requestURI="axis_axisprf001.do?paginar=true&subpantalla=datosgenerales">
                                  <%@ include file="../include/displaytag.jsp"%>
                                  <axis:visible f="axisprf001" c="TTPZONA">
                                   <display:column title="${title0}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_ZONAS.TTPZONA"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${T_IAX_ZONAS.OB_IAX_PROF_ZONAS.TTPZONA}
                                    </div>
                                  </display:column>
                                  </axis:visible>
                                  <display:column title="${title1}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_ZONAS.TPROVIN"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                     ${T_IAX_ZONAS.OB_IAX_PROF_ZONAS.TPROVIN}
                                    </div>
                                  </display:column>
                                  <display:column title="${title2}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_ZONAS.TPOBLAC"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                     ${T_IAX_ZONAS.OB_IAX_PROF_ZONAS.TPOBLAC}
                                    </div>
                                  </display:column>
                                  <display:column title="${title3}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_ZONAS.CPOSINI"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                       ${T_IAX_ZONAS.OB_IAX_PROF_ZONAS.CPOSINI}
                                    </div>
                                  </display:column>
                                  <display:column title="${title4}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_ZONAS.CPOSFIN"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                       ${T_IAX_ZONAS.OB_IAX_PROF_ZONAS.CPOSFIN}
                                    </div>
                                  </display:column>
                                  <display:column title="${title5}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_ZONAS.FDESDE"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                       <fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_ZONAS.OB_IAX_PROF_ZONAS.FDESDE}"/>   
                                    </div>
                                  </display:column>
                                  <display:column title="${title6}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_ZONAS.FHASTA"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                       <fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_ZONAS.OB_IAX_PROF_ZONAS.FHASTA}"/>   
                                    </div>
                                  </display:column>
                                  <axis:visible f="axisprf001" c="BT_EDITAR_ZONA"> <!-- boton editar tramitaciones general -->
                                  <display:column title="${title7}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                    <div class="dspIcons" id="BT_EDITAR_ZONA">
                                        <img border="0" alt="<axis:alt f="axisprf001" c="BT_EDITAR_ZONA" lit="100002"/>"
                                             title1="<axis:alt f="axisprf001" c="BT_EDITAR_ZONA" lit="100002"/>" 
                                             src="images/lapiz.gif" width="15px" height="15px"
                                             style="cursor:pointer;" 
                                             onclick="javascript:f_abrir_modal('axisprf007',null,'&pCodiProf='+document.miForm.pCodiProf.value+
                                                                                                 '&CNORDZN='+${T_IAX_ZONAS.OB_IAX_PROF_ZONAS.CNORDZN}+
                                                                                                 '&CTPZONA='+${T_IAX_ZONAS.OB_IAX_PROF_ZONAS.CTPZONA}+
                                                                                                 '&CPROVIN='+${T_IAX_ZONAS.OB_IAX_PROF_ZONAS.CPROVIN}+
                                                                                                 '&CPOBLAC='+'${T_IAX_ZONAS.OB_IAX_PROF_ZONAS.CPOBLAC}'+
                                                                                                 '&CPOSINI='+'${T_IAX_ZONAS.OB_IAX_PROF_ZONAS.CPOSINI}'+
                                                                                                 '&CPOSFIN='+'${T_IAX_ZONAS.OB_IAX_PROF_ZONAS.CPOSFIN}'+
                                                                                                 '&FDESDE='+'${T_IAX_ZONAS.OB_IAX_PROF_ZONAS.FDESDE}'+
                                                                                                 '&FHASTA='+'${T_IAX_ZONAS.OB_IAX_PROF_ZONAS.FHASTA}'+
                                                                                                 '&MODO=modificar');"  />
                                    </div>
                                  </display:column> 
                                  </axis:visible>
                                </display:table>                                  
                                </td></tr>
                        </table>
                        
                       <div class="separador">&nbsp;</div>            
                       <div class="titulo">
                              <img src="images/flecha.gif"/><b><axis:alt f="axisprf001" c="LIT32" lit="9904737"/></b>
                        </div>                        
                        <table class="seccion">         
                              <axis:visible f="axisprf001" c="BT_CARGA">
                              <c:if test="${! ocultarIconosEdicion && __configform.axisprf001__BT_ANADIR_CARGA__visible != 'false'}">
                                <div style="float:right;">
                                  <a href="javascript:f_abrir_modal('axisprf009',null,'&pCodiProf='+document.miForm.pCodiProf.value+'&MODO=alta');">
                                    <img border="0"
                                         alt='<axis:alt f="axisprf001" c="LIT_NVCARGA" lit="9904738"/>'
                                         title='<axis:alt f="axisprf001" c="LIT_NVCARGA" lit="9904738"/>'
                                         src="images/new.gif"/>
                                  </a>
                                </div>
                              </c:if>
                              </axis:visible>                        
                            <tr><td>
                                       <c:set var="title0"><axis:alt f="axisprf001" c="TTIPPRO" lit="9903408"/></c:set>
                                       <c:set var="title1"><axis:alt f="axisprf001" c="NCARDIA" lit="9904739"/></c:set>
                                       <c:set var="title2"><axis:alt f="axisprf001" c="NCARSEM" lit="9904742"/></c:set>
                                       <c:set var="title3"><axis:alt f="axisprf001" c="FDESDE" lit="9902360"/></c:set>
                                       <c:set var="title4"><axis:alt f="axisprf001" c="ELIMINAR" lit="1000127" /></c:set><!--Eliminar-->

                               </td><td>
                              <div class="displayspace">
                                <display:table name="${__formdata['OBPROFESIONAL'].CARGA}"
                                               id="T_IAX_CARGA" export="false"
                                               class="dsptgtable" pagesize="-1"
                                               defaultsort="1"
                                               defaultorder="ascending"
                                               sort="list" cellpadding="0"
                                               cellspacing="0"
                                               requestURI="axis_axisprf001.do?paginar=true&subpantalla=datosgenerales">
                                  <%@ include file="../include/displaytag.jsp"%>
                                  <axis:visible f="axisprf001" c="TTIPPRO">
                                   <display:column title="${title0}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_CARGA_PERMITIDA.TTIPPRO"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${T_IAX_CARGA.OB_IAX_PROF_CARGA_PERMITIDA.TTIPPRO}
                                    </div>
                                  </display:column>
                                  </axis:visible>
                                  <display:column title="${title1}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_CARGA_PERMITIDA.NCARDIA"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                     ${T_IAX_CARGA.OB_IAX_PROF_CARGA_PERMITIDA.NCARDIA}
                                    </div>
                                  </display:column>
                                  <display:column title="${title2}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_CARGA_PERMITIDA.NCARSEM"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                       ${T_IAX_CARGA.OB_IAX_PROF_CARGA_PERMITIDA.NCARSEM}
                                    </div>
                                  </display:column>
                                  <display:column title="${title3}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_CARGA_PERMITIDA.FDESDE"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                       <fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_CARGA.OB_IAX_PROF_CARGA_PERMITIDA.FDESDE}"/>   
                                    </div>
                                  </display:column>
                                <axis:visible f="axisprf001" c="BT_DELETE_CARGA">  <!-- boton delete carga -->
                                  <display:column title="${title4}" 
                                                  headerClass="headwidth5 sortable" 
                                                  style="width:5%" 
                                                  media="html" autolink="false" >
                                     <div class="dspIcons" id="BT_DELETE_CARGA">
                                        <img border="0" alt="<axis:alt f="axisprf001" c="BT_DELETE_CARGA" lit="1000127"/>" 
                                             title1="<axis:alt f="axisprf001" c="BT_DELETE_CARGA" lit="1000127"/>" 
                                             src="images/delete.gif" width="15px" height="15px"  
                                             style="cursor:pointer;" onclick="f_borrar_fila('&CTIPPRO='+'${T_IAX_CARGA.OB_IAX_PROF_CARGA_PERMITIDA.CTIPPRO}'+
                                                                                             '&CSUBPRO='+'${T_IAX_CARGA.OB_IAX_PROF_CARGA_PERMITIDA.CSUBPRO}'+
                                                                                             '&FDESDE='+'${T_IAX_CARGA.OB_IAX_PROF_CARGA_PERMITIDA.FDESDE}', 'carga')"/>
                                     </div>
                                  </display:column>
                                  </axis:visible>
                                </display:table>                                  
                                </td></tr>
                        </table>
                        
                       <div class="separador">&nbsp;</div>            
                       <div class="titulo">
                              <img src="images/flecha.gif"/><b><axis:alt f="axisprf001" c="LIT32" lit="9904750"/></b>
                        </div>                        
                        <table class="seccion">         
                              <axis:visible f="axisprf001" c="BT_CARGA_REAL">
                              <c:if test="${! ocultarIconosEdicion && __configform.axisprf001__BT_ANADIR_CARGA_REAL__visible != 'false'}">
                                <div style="float:right;">
                                  <a href="javascript:f_abrir_modal('axisprf010',null,'&pCodiProf='+document.miForm.pCodiProf.value+'&MODO=alta');">
                                    <img border="0"
                                         alt='<axis:alt f="axisprf001" c="LIT_NVCARGA_REAL" lit="9904751"/>'
                                         title='<axis:alt f="axisprf001" c="LIT_NVCARGA_REAL" lit="9904751"/>'
                                         src="images/new.gif"/>
                                  </a>
                                </div>
                              </c:if>
                              </axis:visible>                        
                            <tr><td>
                                       <c:set var="title0"><axis:alt f="axisprf001" c="TTIPPRO" lit="9903408"/></c:set>
                                       <c:set var="title1"><axis:alt f="axisprf001" c="NCAPACI" lit="9000602"/></c:set>
                                       <c:set var="title2"><axis:alt f="axisprf001" c="NCARDIA" lit="9904739"/></c:set>
                                       <c:set var="title3"><axis:alt f="axisprf001" c="NCARSEM" lit="9904742"/></c:set>
                                       <c:set var="title4"><axis:alt f="axisprf001" c="FDESDE" lit="9902360"/></c:set>
                                       <c:set var="title5"><axis:alt f="axisprf001" c="TUSUARIO" lit="100894"/></c:set>
                                       <c:set var="title6"><axis:alt f="axisprf001" c="ELIMINAR" lit="1000127" /></c:set><!--Eliminar-->

                               </td><td>
                              <div class="displayspace">
                                <display:table name="${__formdata['OBPROFESIONAL'].CARGA_REAL}"
                                               id="T_IAX_CARGA_REAL" export="false"
                                               class="dsptgtable" pagesize="-1"
                                               defaultsort="1"
                                               defaultorder="ascending"
                                               sort="list" cellpadding="0"
                                               cellspacing="0"
                                               requestURI="axis_axisprf001.do?paginar=true&subpantalla=datosgenerales">
                                  <%@ include file="../include/displaytag.jsp"%>
                                  <axis:visible f="axisprf001" c="TTIPPRO">
                                   <display:column title="${title0}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_CARGA_REAL.TTIPPRO"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${T_IAX_CARGA_REAL.OB_IAX_PROF_CARGA_REAL.TTIPPRO}
                                    </div>
                                  </display:column>
                                  </axis:visible>
                                  <display:column title="${title1}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_CARGA_REAL.NCAPACI"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                     ${T_IAX_CARGA_REAL.OB_IAX_PROF_CARGA_REAL.NCAPACI}%
                                    </div>
                                  </display:column>
                                  <display:column title="${title2}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_CARGA_REAL.NCARDIA"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                     ${T_IAX_CARGA_REAL.OB_IAX_PROF_CARGA_REAL.NCARDIA}
                                    </div>
                                  </display:column>
                                  <display:column title="${title3}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_CARGA_REAL.NCARSEM"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                       ${T_IAX_CARGA_REAL.OB_IAX_PROF_CARGA_REAL.NCARSEM}
                                    </div>
                                  </display:column>
                                  <display:column title="${title4}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_CARGA_REAL.FDESDE"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                       <fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_CARGA_REAL.OB_IAX_PROF_CARGA_REAL.FDESDE}"/>   
                                    </div>
                                  </display:column>
                                  <display:column title="${title5}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_CARGA_REAL.CUSUARI"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                       ${T_IAX_CARGA_REAL.OB_IAX_PROF_CARGA_REAL.CUSUARI}
                                    </div>
                                  </display:column>
                                <axis:visible f="axisprf001" c="BT_DELETE_CARGA_REAL">  <!-- boton delete carga -->
                                  <display:column title="${title6}" 
                                                  headerClass="headwidth5 sortable" 
                                                  style="width:5%" 
                                                  media="html" autolink="false" >
                                     <div class="dspIcons" id="BT_DELETE_CARGA_REAL">
                                        <img border="0" alt="<axis:alt f="axisprf001" c="BT_DELETE_CARGA_REAL" lit="1000127"/>" 
                                             title1="<axis:alt f="axisprf001" c="BT_DELETE_CARGA_REAL" lit="1000127"/>" 
                                             src="images/delete.gif" width="15px" height="15px"  
                                             style="cursor:pointer;" onclick="f_borrar_fila('&CTIPPRO='+'${T_IAX_CARGA_REAL.OB_IAX_PROF_CARGA_REAL.CTIPPRO}'+
                                                                                             '&CSUBPRO='+'${T_IAX_CARGA_REAL.OB_IAX_PROF_CARGA_REAL.CSUBPRO}'+
                                                                                             '&FDESDE='+'${T_IAX_CARGA_REAL.OB_IAX_PROF_CARGA_REAL.FDESDE}', 'carga_real')"/>
                                     </div>
                                  </display:column>
                                  </axis:visible>
                                </display:table>                                  
                                </td></tr>
                        </table>
                        
                        <div class="separador">&nbsp;</div>            
                       <div class="titulo">
                              <img src="images/flecha.gif"/><b><axis:alt f="axisprf001" c="LIT32" lit="9904760"/></b>
                        </div>                        
                        <table class="seccion">         
                              <axis:visible f="axisprf001" c="BT_CARGA_DESCARTADOS">
                              <c:if test="${! ocultarIconosEdicion && __configform.axisprf001__BT_ANADIR_DESCARTADOS__visible != 'false'}">
                                <div style="float:right;">
                                  <a href="javascript:f_abrir_modal('axisprf011',null,'&pCodiProf='+document.miForm.pCodiProf.value+'&MODO=alta');">
                                    <img border="0"
                                         alt='<axis:alt f="axisprf001" c="LIT_NVDESCARTADOS" lit="9904759"/>'
                                         title='<axis:alt f="axisprf001" c="LIT_NVDESCARTADOS" lit="9904759"/>'
                                         src="images/new.gif"/>
                                  </a>
                                </div>
                              </c:if>
                              </axis:visible>                        
                            <tr>
                               <td>
                                    <c:import url="axisprf001_descartados.jsp"/>
                                    <!-- CONTROL FOCUS -->
                     				<input type="image" id="descartados_focus" name="descartados_focus" src="images/empty.gif" style="height:0px;width:0px;"/>
        							<!-- CONTROL FOCUS -->
                              </td>
                              </tr>
                        </table>
                         <div class="separador">&nbsp;</div>            
                       <div class="titulo">
                              <img src="images/flecha.gif"/><b><axis:alt f="axisprf001" c="LIT32" lit="101162"/></b>
                        </div>                        
                        <table class="seccion">         
                              <axis:visible f="axisprf001" c="BT_CARGA_OBSERVACIONES">
                              <c:if test="${! ocultarIconosEdicion && __configform.axisprf001__BT_ANADIR_OBSERVACIONES__visible != 'false'}">
                                <div style="float:right;">
                                  <a href="javascript:f_abrir_modal('axisprf008',null,'&pCodiProf='+document.miForm.pCodiProf.value+'&MODO=alta');">
                                    <img border="0"
                                         alt='<axis:alt f="axisprf001" c="LIT_NVOBSERVACIONES" lit="9904766"/>'
                                         title='<axis:alt f="axisprf001" c="LIT_NVOBSERVACIONES" lit="9904766"/>'
                                         src="images/new.gif"/>
                                  </a>
                                </div>
                              </c:if>
                              </axis:visible>                        
                            <tr>
                               <td>
                                    <c:import url="axisprf001_observaciones.jsp"/>
                                    <!-- CONTROL FOCUS -->
                     				<input type="image" id="observaciones_focus" name="observaciones_focus" src="images/empty.gif" style="height:0px;width:0px;"/>
        							<!-- CONTROL FOCUS -->
                              </td>
                              </tr>
                        </table>
                        <div class="separador">&nbsp;</div>            
                       <div class="titulo">
                              <img src="images/flecha.gif"/><b><axis:alt f="axisprf001" c="LIT32" lit="112520"/></b>
                        </div>                        
                        <table class="seccion">         
                              <axis:visible f="axisprf001" c="BT_CARGA_SEGUIMIENTO">
                              <c:if test="${! ocultarIconosEdicion && __configform.axisprf001__BT_ANADIR_SEGUIMIENTO__visible != 'false'}">
                                <div style="float:right;">
                                  <a href="javascript:f_abrir_modal('axisprf012',null,'&pCodiProf='+document.miForm.pCodiProf.value+'&MODO=alta');">
                                    <img border="0"
                                         alt='<axis:alt f="axisprf001" c="LIT_NVSEGUIMIENTO" lit="9904777"/>'
                                         title='<axis:alt f="axisprf001" c="LIT_NVSEGUIMIENTO" lit="9904777"/>'
                                         src="images/new.gif"/>
                                  </a>
                                </div>
                              </c:if>
                              </axis:visible>                        
                            <tr>
                               <td>
                                    <c:import url="axisprf001_seguimiento.jsp"/>
                                    <!-- CONTROL FOCUS -->
                     				<input type="image" id="seguimiento_focus" name="seguimiento_focus" src="images/empty.gif" style="height:0px;width:0px;"/>
        							<!-- CONTROL FOCUS -->
                              </td>
                              </tr>
                        </table>
                        <div class="separador">&nbsp;</div>            
                       <div class="titulo">
                              <img src="images/flecha.gif"/><b><axis:alt f="axisprf001" c="LIT32" lit="9001358"/></b>
                        </div>                        
                        <table class="seccion">         
                              <axis:visible f="axisprf001" c="BT_CARGA_DOC">
                              <c:if test="${! ocultarIconosEdicion && __configform.axisprf001__BT_ANADIR_OBSERVACIONES__visible != 'false'}">
                                <div style="float:right;">
                                  <a href="javascript:f_abrir_modal('axisprf015',null,'&SPROFES='+document.miForm.pCodiProf.value+
                                                                                      '&SPERSON='+objDom.getValorPorId('SPERSON')+
                                                                                      '&CAGENTE='+objDom.getValorPorId('CAGENTE')+'&MODO=alta');">
                                    <img border="0"
                                         alt='<axis:alt f="axisprf001" c="LIT_NVDOCUMENTACION" lit="9902032"/>'
                                         title='<axis:alt f="axisprf001" c="LIT_NVDOCUMENTACION" lit="9902032"/>'
                                         src="images/new.gif"/>
                                  </a>
                                </div>
                              </c:if>
                              </axis:visible>                        
                            <tr>
                               <td>
                                    <c:import url="axisprf001_doc.jsp"/>
                                    <!-- CONTROL FOCUS -->
                     				<input type="image" id="doc_focus" name="doc_focus" src="images/empty.gif" style="height:0px;width:0px;"/>
        							<!-- CONTROL FOCUS -->
                              </td>
                              </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </axis:visible>            
    </form>    
    <c:import url="../include/botonera_nt.jsp">
       <c:param name="f">axisprf001</c:param>
       <c:param name="__botones"><axis:ocultar f="axisprf001" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar></c:param>
    </c:import>
    <c:import url="../include/mensajes.jsp" />    
</body>
</html>


