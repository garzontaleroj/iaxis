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
                    var CCONCEP = "${__formdata.CCONCEP}";
                    var BUSCAR = "${__formdata.BUSCAR}";
                    if (!objUtiles.estaVacio(CCONCEP)&&!objUtiles.estaVacio(BUSCAR)){
                        f_but_buscar();
                    }
                    var CCONCEP_new = "${__formdata.CCONCEP_new}";
                    if (!objUtiles.estaVacio(CCONCEP_new)){
                        $("#CCONCEP").val(CCONCEP_new);
                        f_but_buscar();
                    }
             <% }  %>  
            }
            
            function f_aceptar_modal(pantalla){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axisimp006.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
            
            function f_aceptar_modal(pantalla, param){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axisimp006.do?"+param, "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
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
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisimp006", "cancelar", document.miForm, "_self");            
            }
            
            function f_but_buscar(){
                if (objValidador.validaEntrada()) {
                    objUtiles.ejecutarFormulario("axis_axisimp006.do?BUSCAR=1","busqueda_impuestos",document.miForm, "_self", objJsMessages.jslit_cargando);   
                }
            }
            
            function f_but_nuevo(){
                if (!objUtiles.estaVacio($("#CCONCEP").val())){
                    f_abrir_modal('axisimp007',null,'&CCONCEP='+$("#CCONCEP").val()+'&TCONCEP='+$('#CCONCEP option:selected').text());
                }else{
                    $("#CCONCEP").focus();
                }
            }
            
            function f_but_9904925(){
                if(!objUtiles.estaVacio($("#CCONCEP").val())){
                    f_abrir_modal('axisimp008',null,'&CCONCEP_ant='+$("#CCONCEP").val()+'&TCONCEP='+$('#CCONCEP option:selected').text());
                }else{
                    $("#CCONCEP").focus();
                }
            }

            function f_borrar_fila(datos, que){
                var answer = confirm(objJsMessages.jslit_confirma_borrar);
                if (answer)
                objUtiles.ejecutarFormulario("axis_axisimp006.do?"+datos,
                                             "del_"+que, document.miForm, "_self", objJsMessages.jslit_cargando);
            }
           
        </script>
    </head>
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>

    <form name="miForm" action="axis_axisimp006.do" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="pCodiProf" name="pCodiProf" value=""/>
            <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>
            <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}" />
            <input type="hidden" name="SNIP" id="SNIP" value="${__formdata.SNIP}" />

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="form" f="axisimp006" lit="101278"/></c:param>
                <c:param name="producto"><axis:alt c="form" f="axisimp006" lit="101278"/></c:param>
                <c:param name="form">axisimp006</c:param>
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisimp007|<axis:alt f="axisimp006" c="MODAL_AXISIMP007" lit="9905832" /></c:param>
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisimp008|<axis:alt f="axisimp006" c="MODAL_AXISIMP008" lit="9905895" /></c:param>
            </c:import> 
            
            <axis:visible c="DSP_CUENTAS" f="axisimp006"> 
              <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                <td>
                <table class="seccion">
                <tr>
                    <td align="left" >
                        <table class="area" align="center">
                            <tr>
                                <th style="width:30%;height:0px"></th>
                                <th style="width:30%;height:0px"></th>
                                <th style="width:40%;height:0px"></th>
                            </tr>  
                            <tr>
                                <axis:ocultar f="axisimp006" c="CCONCEP" dejarHueco="false"> 
                                    <td class="titulocaja">
                                       <div class="separador">&nbsp;</div>
                                       <b><axis:alt f="axisimp006" c="CCONCEP" lit="9001284"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisimp006" c="CCODIMP" dejarHueco="false"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisimp006" c="CCODIMP" lit="800422"/></b>   <%-- Impuesto --%>
                                    </td>
                                </axis:ocultar>
                            </tr> 
                            <tr>
                                <axis:ocultar f="axisimp006" c="CCONCEP" dejarHueco="false"> 
                                    <td class="campocaja" >
                                    <select name="CCONCEP" id="CCONCEP" size="1" class="campowidthselect campo campotexto_op" 
                                            <axis:atr f="axisimp006" c="CCONCEP" a="obligatorio=false&isInputText=false&modificable=true"/>
                                            title= "<axis:alt f="axisimp006" c="CCONCEP" lit="9001284"/>">
                                        <option value="<%= Integer.MIN_VALUE %>">
                                          <axis:alt f="axisimp006" c="SELECCIONAR" lit="108341"/>                                
                                        </option>
                                        <c:forEach var="concepto" items="${__formdata.LSTCONCEPTO}">
                                            <option value="${concepto.CATRIBU}"
                                                    <c:if test="${__formdata['CCONCEP'] == concepto.CATRIBU}">selected</c:if>>
                                                ${concepto.TATRIBU}
                                            </option>
                                        </c:forEach>
                                    </select>
                                    </td>
                                </axis:ocultar> 
                                <axis:ocultar f="axisimp006" c="CCODIMP" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <select name="CCODIMP" id="CCODIMP" size="1" class="campo campotexto_op" style="width:90%" 
                                        title="<axis:alt f="axisimp006" c="CCODIMP" lit="800422"/>">
                                            <option value="null"> - <axis:alt f="axisimp006" c="SELECCIONAR" lit="1000348"/> - </option>
                                            <c:forEach items="${__formdata.LSTIMPUESTOS}" var="item">
                                                <option value = "${item.CCODIMP}" 
                                                <c:if test="${__formdata['PCCODIMP'] == item.CCODIMP}"> 
                                                selected 
                                                </c:if>>
                                                ${item.TDESIMP}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <td colspan="3">
                                  <div class="separador">&nbsp;</div>
                                  <div class="separador">&nbsp;</div>
                                  <div class="separador">&nbsp;</div>
                                  <c:set var="title0"><axis:alt f="axisimp006" c="CCODIMP" lit="101278"/></c:set>
                                  <c:set var="title1"><axis:alt f="axisimp006" c="ELIMINAR" lit="1000127" /></c:set><!--Eliminar-->
                                  <c:set var="title2"><axis:alt f="axisimp006" c="EDITAR" lit="9000552" /></c:set><!--Editar-->
                                  <c:set var="title3"><axis:alt f="axisimp006" c="TCONCEP" lit="9001284" /></c:set><!--Concepto de pago-->
                                  <div class="displayspace" style="max-height:none">
                                    <display:table name="${sessionScope.axisimp006_listaImpuestos}" id="T_IAX_IMPUESTOS" export="false" class="dsptgtable" 
                                                   pagesize="15" defaultsort="1" defaultorder="ascending" requestURI="axis_axisimp006.do?paginar=true" 
                                                   sort="list" cellpadding="0" cellspacing="0">
                                      <%@ include file="../include/displaytag.jsp"%>
                                      <axis:visible f="axisimp006" c="CCODIMP">
                                       <display:column title="${title0}"
                                                      sortable="true"
                                                      sortProperty="CCODIMP"
                                                      headerClass="sortable fixed"
                                                      media="html" autolink="false">
                                        <div class="dspText">
                                          <c:if test="${T_IAX_IMPUESTOS.CTIPCAL==2}">
                                          ${T_IAX_IMPUESTOS.TCODIMP} - <axis:alt f="axisimp006" c="CCODIMP" lit="111523" /> ${T_IAX_IMPUESTOS.TTIPPER} <c:if test="${T_IAX_IMPUESTOS.TREGFISCAL!=null}">- ${T_IAX_IMPUESTOS.TREGFISCAL}</c:if> : ${T_IAX_IMPUESTOS.NPORCEN} % de ${T_IAX_IMPUESTOS.TBASECAL} <c:if test="${T_IAX_IMPUESTOS.CBASEMIN>0}"> <axis:alt f="axisimp006" c="DESDE" lit="9905931" /> ${T_IAX_IMPUESTOS.CBASEMIN}</c:if>
                                          </c:if>
                                          <c:if test="${T_IAX_IMPUESTOS.CTIPCAL!=2}">
                                          ${T_IAX_IMPUESTOS.TCODIMP} - <axis:alt f="axisimp006" c="CCODIMP" lit="111523" /> ${T_IAX_IMPUESTOS.TTIPPER} <c:if test="${T_IAX_IMPUESTOS.TREGFISCAL!=null}">- ${T_IAX_IMPUESTOS.TREGFISCAL}</c:if>
                                          </c:if>
                                        </div>
                                      </display:column>
                                      </axis:visible>
                                      <axis:visible f="axisimp006" c="TCONCEP">
                                       <display:column title="${title3}"
                                                      sortable="true"
                                                      sortProperty="TCONCEP"
                                                      headerClass="sortable fixed"
                                                      media="html" autolink="false">
                                        <div class="dspText">
                                          ${T_IAX_IMPUESTOS.TCONCEP}
                                        </div>
                                      </display:column>
                                      </axis:visible>
                                      <axis:visible f="axisimp006" c="BT_EDITAR_IMPUESTO"> <!-- boton editar impuesto -->
                                          <display:column title="${title2}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                            <div class="dspIcons" id="BT_EDITAR_IMPUESTO">
                                                <img border="0" alt="<axis:alt f="axisimp006" c="BT_EDITAR_IMPUESTO" lit="100002"/>"
                                                     title1="<axis:alt f="axisimp006" c="BT_EDITAR_IMPUESTO" lit="100002"/>" 
                                                     src="images/lapiz.gif" width="15px" height="15px"
                                                     style="cursor:pointer;" 
                                                     onclick="javascript:f_abrir_modal('axisimp007',null,'&CCONCEP='+document.miForm.CCONCEP.value+
                                                                                                         '&CCODIMP='+${T_IAX_IMPUESTOS.CCODIMP}+
                                                                                                         '&NORDIMP='+${T_IAX_IMPUESTOS.NORDIMP}+
                                                                                                         '&MODO=modificar');"  />
                                            </div>
                                          </display:column> 
                                        </axis:visible>
                                        <axis:visible f="axisimp006" c="BT_DELETE_IMPUESTO">  <!-- boton delete impuesto -->
                                          <display:column title="${title1}" 
                                                          headerClass="headwidth5 sortable" 
                                                          style="width:5%" 
                                                          media="html" autolink="false" >
                                             <div class="dspIcons" id="BT_DELETE_IMPUESTO">
                                                <img border="0" alt="<axis:alt f="axisimp006" c="BT_DELETE_IMPUESTO" lit="1000127"/>" 
                                                     title1="<axis:alt f="axisimp006" c="BT_DELETE_IMPUESTO" lit="1000127"/>" 
                                                     src="images/delete.gif" width="15px" height="15px"  
                                                     style="cursor:pointer;" onclick="f_borrar_fila('&CCONCEP='+document.miForm.CCONCEP.value+
                                                                                                    '&CCODIMP='+${T_IAX_IMPUESTOS.CCODIMP}+
                                                                                                    '&NORDIMP='+${T_IAX_IMPUESTOS.NORDIMP},'impuesto')"/>
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
       <c:param name="f">axisimp006</c:param>
       <c:param name="__botones"><axis:ocultar f="axisimp006" c="BT_SALIR" dejarHueco="false">salir</axis:ocultar><axis:visible f="axisimp006" c="BT_9904925">,9904925</axis:visible><axis:visible f="axisimp006" c="BT_NUEVO">,nuevo</axis:visible><axis:visible f="axisimp006" c="BT_BUSCAR">,buscar</axis:visible></c:param>
    </c:import>
    <c:import url="../include/mensajes.jsp" />    
</body>
</html>


