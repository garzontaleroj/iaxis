<%/** Axisrea027.jsp
*  Búsqueda de agrupaciones
*  Fecha: 08/08/2011
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">


<html>
    <head>
        <title><axis:alt f="axisrea027" c="LIT_NOMBRE_PANTALLA" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {    
               f_cargar_propiedades_pantalla();
               var numContrato = 0;

            }
            
            function f_but_salir() {
                objUtiles.ejecutarFormulario("flujodetrabajo.do?forigen=axisrea027", "cancelar", document.miForm, "_self");
            }
            
            
            /****************************************************************************************/
            /********************************** MODAL AXPLANTILLAJSP_MODAL **************************/
            /****************************************************************************************/
            var ptho=null;
            /*
            function f_abrir_axisrea028() {
                objUtiles.abrirModal("axisrea028", "src", "modal_axisrea028.do?operation=form");  
            }
            */
            
            function f_cerrar_axisrea028() {
                objUtiles.cerrarModal('axisrea028');
                
            }   
            
             function f_cerrar_modal(modal) {            
                f_cerrar_axisrea028();
            }
            

            function f_altamodi(SCONAGR) {
                objUtiles.abrirModal("axisrea028", "src", "modal_axisrea028.do?operation=form&SCONAGR="+SCONAGR);  
            }
            
            function f_but_buscar() {  
                 if (objValidador.validaEntrada()) {           
                    objUtiles.ejecutarFormulario("axis_axisrea027.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }            
            }


/*            
            function f_but_aceptar() {   //TODO: Queda por determinar si es necesaria esta función y si hace algo realmente o es equivalente al cancelar. Radio Button es necesario?
                objUtiles.ejecutarFormulario("axis_axisrea027.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
*/            
            function f_borrar_contrato(SCONAGR,CIDIOMA) {  
                var x=confirm(objJsMessages.jslit_confirma_borrar);
                if (x!=undefined && x) {
                    document.miForm.AUX_SCONAGR.value = SCONAGR;
                    document.miForm.AUX_CIDIOMA.value="";//vacio/null implica borrar todos
                    //document.miForm.AUX_CIDIOMA.value = CIDIOMA;
                    objUtiles.ejecutarFormulario("axis_axisrea027.do", "borrar_contrato", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
            
            
            function f_aceptar_axisrea028() {
                //cerramos modal y recargamos la pagina con un buscar al vacio
               f_cerrar_axisrea028();  
               document.miForm.SCONAGR.value="";
               document.miForm.TCONAGR.value="";
               f_but_buscar()
            }            
            
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/
            
            // TODO Implementar CallBack Ajax
            
            
         
            /* ********************************************************************************************************* */
            /* ********************************************************************************************************* */
            /* ********************************************************************************************************* */
            
        </script>
    </head>
    <body  onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
            <input type="hidden" id="AUX_CIDIOMA" name="AUX_CIDIOMA" value=""/>
            <input type="hidden" id="AUX_SCONAGR" name="AUX_SCONAGR" value=""/>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisrea028|<axis:alt f="axisrea028" c="LIT_MODAL_AXISREA028" lit="9902272" /></c:param>
            </c:import>

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisrea027" c="LIT_NOMBRE_FOMRULARIO" lit="9902272" /></c:param>
                <c:param name="producto"><axis:alt f="axisrea027" c="ALT_NOMBRE_PANTALLA" lit="9902272" /></c:param>
                <c:param name="form">axisrea027</c:param>
            </c:import>
           
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td>
               
                  <div class="titulo"><img src="images/flecha.gif"/>&nbsp;<axis:alt f="axisrea027" c="LIT_BUSC_AGRUP" lit="9902282"/></div>
                  <!-- Detalle cabecera de contrato -->
                  <table class="seccion">
                    <tr>
                      <td> 
                        <!-- Campos detalle de cabecera de contrato _ Area 1 _ -->
                        <table class="area" align="center">
                          <tr> <!-- Se establecen las columnas -->
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                          </tr>
                          <tr> <!-- Area 1. Línea 1. Títulos de campos -->
                          <axis:visible f="axisrea027" c="SCONAGR">
                            <td class="titulocaja" ><!-- AGRUPACION -->
                              <b><axis:alt f="axisrea027" c="LIT_SCONAGR" lit="111471"/></b>
                            </td>
                          </axis:visible>  
                          <axis:visible f="axisrea027" c="TCONAGR">
                            <td class="titulocaja" colspan="2"><!-- TCONAGR  -->
                              <b><axis:alt f="axisrea027" c="LIT_TCONAGR" lit="100588"/></b>
                            </td>
                          </axis:visible>  
                          <axis:visible f="axisrea027" c="CIDIOMA">
                            <td class="titulocaja" ><!-- CIDIOMA  -->
                              <b><axis:alt f="axisrea027" c="LIT_CIDIOMA" lit="100654"/></b>
                            </td>
                          </axis:visible>  
                          
                          </tr>
                          <tr> 
                            
                            <axis:ocultar f="axisrea027" c="SCONAGR" dejarHueco="false">
                                <td class="campocaja">
                                           <%-- BUG 20252 - 2012/06/01 - JLTS --%>
                                           <input type="text" class="campo campotexto" id="SCONAGR" onchange="" formato="entero" name="SCONAGR" title="<axis:alt f="axisrea027" c="LIT_SCONAGR" lit="111471"/>" style="width:80%" value="${__formdata.SCONAGR}" <axis:atr f="axisrea027" c="SCONAGR" a="modificable=true"/>/>
                                </td>   
                            </axis:ocultar>
                            <axis:ocultar f="axisrea027" c="TCONAGR" dejarHueco="false">
                                <td class="campocaja" colspan="2">
                                           <input type="text" class="campo campotexto" id="TCONAGR" onchange="" name="TCONAGR"  style="width:90%"  value="${__formdata.TCONAGR}" <axis:atr f="axisrea027" c="TCONAGR" a="modificable=true"/>/>
                                </td>   
                            </axis:ocultar>
                            <axis:ocultar f="axisrea027" c="CIDIOMA" dejarHueco="false">
                                <td class="campocaja">
                                <select name="CIDIOMA" id="CIDIOMA" class="campo" size="1" onchange="f_but_buscar()" <axis:atr f="axisrea027" c="CIDIOMA" a="modificable=true"/>>
                                <c:forEach items="${__formdata.listaIdiomas}" var="item">
                                <option value="${item.CIDIOMA}" <c:if test="${__formdata.CIDIOMA==item.CIDIOMA}">selected</c:if>>${item.TIDIOMA}</option></c:forEach>
                                </select>
                                </td>   
                            </axis:ocultar>
                          </tr>
                          <tr>
                            <td colspan="5">
                                <axis:visible f="axisrea027" c="ALTA_FORMULA">
                                        <div  style="float:right;"><a href="javascript:f_altamodi('')"><img border="0" alt="<axis:alt f="axisrea027" c="ALT_IMG_NUEVO" lit="9000422"/>" title="<axis:alt f="axisrea027" c="ALT_IMG_NUEVO_OP" lit="9902280"/>" src="images/new.gif"/></a></div>
                                </axis:visible>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="5">
                           <table class="area" align="center"> 
                                <tr>
                                  <td>
                                  <!-- multirregistro de tramos -->
                                    <c:set var="title1"></c:set>  <%-- Seleccionar --%>
                                    <c:set var="title2"><axis:alt f="axisrea027" c="ALT_SCONAGR" lit="111471"/></c:set>   <%-- Agrupación --%>
                                    <c:set var="title3"><axis:alt f="axisrea027" c="ALT_DESCRIP" lit="100588"/></c:set>   <%-- Descripción --%>
                                    <c:set var="title4"><axis:alt f="axisrea027" c="ALT_MOD" lit="9000552"/></c:set>   <%-- Modificar --%>
                                    <c:set var="title5"><axis:alt f="axisrea027" c="ALT_BORRAR" lit="9001333"/></c:set>   <%-- Borrar --%>

                                    <div class="displayspace" id="dt_tramos">
                                      <display:table name="${__formdata.listaConRea}" id="T_IAX_CON_REA" export="false" class="dsptgtable" 
                                      pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                      requestURI="axis_axisrea027.do?operation=form&paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <%--display:column headerClass="headwidth5 sortable" title="${title1}" media="html" autolink="false" >
                                          <div class="dspIcons">
                                            <input value="${T_IAX_CON_REA.SCONAGR }" <c:if test="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.CTRAMO==__formdata.OB_IAX_TRAMOS_REA.CTRAMO}">checked</c:if> onclick="javascript:f_seleccionar_tramo()" type="radio" id="radioCTRAMO" name="radioCTRAMO" selected="true"/>
                                          </div>
                                        </display:column--%>                                                                       
                                        <display:column title="${title2}" sortable="true" sortProperty="SCONAGR" headerClass="sortable fixed"  media="html" autolink="false" style="width:10%" >                                    
                                          <div class="dspText">${T_IAX_CON_REA.SCONAGR}</div>
                                        </display:column>
                                        <display:column title="${title3}" sortable="true" sortProperty="TCONAGR" headerClass="sortable fixed"  media="html" autolink="false" style="width:80%" >                                    
                                          <div class="dspText">${T_IAX_CON_REA.TCONAGR}</div>
                                        </display:column>
                                        <axis:visible f="axisrea027" c="BT_EDIT">
                                            <display:column title="${title4}" sortable="false" headerClass="headwidth5 sortable fixed"  media="html" autolink="false"  style="width:5%">                                    
                                              <div class="dspIcon"><a href="javascript:f_altamodi('${T_IAX_CON_REA.SCONAGR}');"><img border="0" alt="<axis:alt f="axisrea003" c="ALT_IMG_ISCONTA" lit="9000552"/>" title="<axis:alt f="axisrea003" c="ALT_ISONTA_LIT" lit="9000552"/>" src="images/lapiz.gif"/></a> </div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisrea027" c="BT_BORRAR">
                                            <display:column title="${title5}" sortable="false" headerClass="headwidth5 sortable fixed"  media="html" autolink="false"  style="width:5%">                                    
                                              <div class="dspIcon"><a href="javascript:f_borrar_contrato('${T_IAX_CON_REA.SCONAGR}', '${T_IAX_CON_REA.CIDIOMA}');"><img border="0" alt="<axis:alt f="axisrea003" c="ALT_IMG_ISCONTA_DET" lit="9001333"/>" title="<axis:alt f="axisrea003" c="ALT_ISONTA_LIT_DET" lit="9001333"/>" src="images/delete.gif"/></a></div>
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
                <c:param name="f">axisrea027</c:param>
                <c:param name="__botones">salir,buscar</c:param> 
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>