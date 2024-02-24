<%/** Axisrea029.jsp
*  Búsqueda de reaseguro cláusulas y tramos escalonados
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
        <title><axis:alt f="axisrea029" c="LIT_NOMBRE_PANTALLA" lit="formulario.axisnombrepantalla"/></title>
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

                 // f_abrir_axisrea030();
                 
            }
            
            function f_but_cancelar() {
                //if(document.miForm.PROCEDE.value=='AXISCTR031'){
                   parent.f_cancelar_axisrea029(); 
                //}else{
                //   objUtiles.ejecutarFormulario("flujodetrabajo.do?forigen=axisrea029", "cancelar", document.miForm, "_self");
                //}
            }
            
             function f_but_9000552() {    // Modificar
               //alert("Antes de modificar");
               objUtiles.ejecutarFormulario("axis_axisrea031.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_but_editar() {
                var PERMITE_EDICION = '${requestScope.OB_IAX_CODICONTRATO_REA.CVALID}';   //1: No se puede modificar, porque lo hemos validado, y ha de ser procesado por el proceso batch
                if(PERMITE_EDICION!=null && PERMITE_EDICION!='1'){
                    f_cerrar_axisrea026();
                    param = "&SCONTRA_MOD="+objDom.getValorPorId("SCONTRA");
                    objUtiles.ejecutarFormulario("axis_axisrea029.do?" + param, "ModificarContrato", document.miForm, "_self", objJsMessages.jslit_cargando);             
                }else{
                    alert("<axis:alt f="axisrea029" c="LIT_CCOMPANI" lit="9902171"/>");
                }
            }
            
            /****************************************************************************************/
            /********************************** MODAL AXPLANTILLAJSP_MODAL **************************/
            /****************************************************************************************/
            var ptho=null;
            
            /* ************************************ MODAL 030 ***************************************/
            function f_abrir_axisrea030() {
                
                objUtiles.abrirModal("axisrea030", "src", "modal_axisrea030.do?operation=form");  
            }
            
            function f_cerrar_axisrea030() {
                objUtiles.cerrarModal('axisrea030');
                
            }   
            
             function f_cerrar_modal(modal) {            
                f_cerrar_axisrea030();
            }
            
            
            
            
            function f_nuevo_axisrea030(pNUEVO) {                     
                document.miForm.NOU.value = pNUEVO;
                f_cerrar_axisrea001();               
                document.miForm.FCONINI.value = "";
                document.miForm.FCONFIN.value = "";
                document.miForm.TCONTRA.value = "";              
                document.miForm.SCONQP.value = "";
                document.miForm.PCEDIDO.value = "";
                document.miForm.ICAPACI.value = "";
                document.miForm.TOBSERV.value = "";
              
                objUtiles.ejecutarFormulario("axis_axisrea029.do", "BorrarObjCache", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_aceptar_axisrea030() {
               f_cerrar_axisrea030();     
               //alert("Antes de recargar");
               objUtiles.ejecutarFormulario("axis_axisrea029.do?", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_cancelar_axisrea030(){
                 f_cerrar_axisrea030();   
                 objUtiles.ejecutarFormulario("axis_axisrea029.do?", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
             function f_but_buscar() {  
                objUtiles.ejecutarFormulario("axis_axisrea029.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_borrar_clausula(CCODIGO,CIDIOMA){
                objUtiles.ejecutarFormulario("axis_axisrea029.do", "borrar_clau", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_modif_axisrea031(CCODIGO){
                
                //alert(CCODIGO);
              
                if(document.miForm.PROCEDE.value=='AXISCTR031'){
                   //alert("Le paso el código:"+CCODIGO);
                   parent.f_cerrar_axisrea029(CCODIGO); 
                }else{
                   objUtiles.ejecutarFormulario("axis_axisrea031.do?CCODIGO_MOD="+CCODIGO, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
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
            <input type="hidden" id="NOU" name="NOU" value="${__formdata.NOU}"/> 
            <input type="hidden" id="CEMPRES" name="CEMPRES" value="${__formdata.CEMPRES}"/> 
            <input type="hidden" id="CTIPREA" name="CTIPREA" value="${requestScope.OB_IAX_CODICONTRATO_REA.CTIPREA}"/> 
            <input type="hidden" id="PROCEDE" name="PROCEDE" value="${__formdata.PROCEDE}"/> 
         <!-- Pantalla modal -->
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisrea030|<axis:alt f="axisrea030" c="LIT_MODAL_AXISREA030" lit="9902291" /></c:param>
            </c:import>

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisrea029" c="LIT_NOMBRE_FOMRULARIO" lit="9902273" /></c:param>
                <c:param name="producto"><axis:alt f="axisrea029" c="ALT_NOMBRE_PANTALLA" lit="9902273" /></c:param>
                <c:param name="form">axisrea029</c:param>
            </c:import>
           
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td>
               
                  <div class="titulo">&nbsp;
                    <img src="images/flecha.gif"/>&nbsp;<axis:alt f="axisrea027" c="LIT_BUSC_AGRUP" lit="9902273"/>
                    <!--img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisrea029" c="LIT_IMG_BUSCAR" lit="100002" />" onclick="f_abrir_axisrea030();" style="cursor:pointer"/-->
                        
                  </div>
                  <!-- Detalle cabecera de contrato -->
                  <table class="seccion">
                    <tr>
                  
                      <td> 
                        <!-- Campos detalle de cabecera de contrato _ Area 1 _ -->
                        <table class="area" align="center">
                          <tr> <!-- Se establecen las columnas -->
                            <th style="width:25%;height:0px"></th>
                            <th style="width:25%;height:0px"></th>
                            <th style="width:25%;height:0px"></th>
                            <th style="width:25%;height:0px"></th>
                          </tr>
                          <tr> <!-- Area 1. Línea 1. Títulos de campos -->
                          <axis:visible f="axisrea029" c="CCODIGO">
                            <td class="titulocaja" ><!-- CODIGO -->
                              <b><axis:alt f="axisrea029" c="LIT_CCODIGO" lit="103465"/></b>
                            </td>
                          </axis:visible>  
                          <axis:visible f="axisrea029" c="CTIPO">
                            <td class="titulocaja" ><!-- TIPO  -->
                              <b><axis:alt f="axisrea029" c="LIT_CTIPO" lit="100565"/></b>
                            </td>
                          </axis:visible>  
                           
                          </tr>
                          <tr> <!-- Linea de campos de entrada -->
                                <td class="campocaja" > <%-- CODIGO --%>
                                        <axis:ocultar f="axisrea029" c="CCODIGO"> <!-- Linia 1. Columna 2. -->
                                           <input type="text" class="campo campotexto"  obligatorio="true" id="CCODIGO" name="CCODIGO" style="width:80%"
                                            value="${__formdata.CCODIGO}" <axis:atr f="axisrea029" c="CCODIGO" a="modificable=true"/>/>
                                        </axis:ocultar>    
                                  </td>
                                  <td class="campocaja" > <%-- TIPO --%>
                                        <axis:ocultar f="axisrea029" c="CTIPO"> <!-- Linia 1. Columna 2. -->
                                            <select name="CTIPO" id="CTIPO" size="1" class="campowidthselect campo campotexto" onchange="" obligatorio="true" style="width:62.5%;">                               
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea029" c="ALT_CTIPO_SEL" lit="108341"/> - </option>
                                                <c:forEach var="element" items="${__formdata.listaTipos}">
                                                    <option value = "${element.CATRIBU}" 
                                                    <c:if test="${element.CATRIBU == __formdata.CTIPO}"> selected </c:if> />
                                                     ${element.TATRIBU} 
                                                    </option>
                                                </c:forEach>
                                            </select>     
                                        </axis:ocultar>    
                                  </td>
                                                             
                          </tr>
                          <div class="separador">&nbsp;</div>
                          <tr>
                            <axis:visible f="axisrea029" c="SCONTRA">
                                <td class="titulocaja" colspan="4"><!--Lista Fórmulas -->
                                  <b><axis:alt f="axisrea029" c="LIT_LIST_FORMULAS_1" lit="9000745"/> <axis:alt f="axisrea029" c="LIT_LIST_FORMULAS_1" lit="9001678"/></b>
                                </td>
                                
                                <td>
                                    <axis:visible f="axisrea029" c="ALTA_FORMULA">
                                                   <a href="javascript:f_abrir_axisrea030()"><img style="float:right;" border="0"  title="<axis:alt f="axisrea029" c="ALT_IMG_NUEVO_CL" lit="1000066"/>" src="images/new.gif"/></a>
                                    </axis:visible>
                                </td>
                            </axis:visible>
                          </tr>
                          <tr>
                            <td colspan="5">
                            
                            <table class="area" align="left"> <!-- multirregistro de tramos -->
                                    <tr>
                                      <td> 
                                        <c:set var="title1"><axis:alt f="axisrea029" c="ALT_COD" lit="103465"/></c:set>  <%-- Código --%>
                                        <c:set var="title2"><axis:alt f="axisrea029" c="ALT_DESC" lit="100588"/></c:set>   <%-- Descripción --%>
                                        <c:set var="title3"><axis:alt f="axisrea029" c="ALT_TIPO" lit="100565"/></c:set>   <%-- Tipo --%>
                                        <c:set var="title4"><axis:alt f="axisrea029" c="ALT_MODIF" lit="100885"/></c:set>   <%-- Modificar --%>
                                        <c:set var="title5"><axis:alt f="axisrea029" c="ALT_BORRAR" lit="9000552"/></c:set>   <%-- Borrar --%>
                                        <c:set var="title6"><axis:alt f="axisrea029" c="ALT_VENCIM" lit="100883"/></c:set>   <%-- F. vencim --%>
                                        <div class="displayspace" id="dt_tramos">
                                          <display:table name="${__formdata.listaClauTram}" id="T_IAX_CLAUTRAM" export="false" class="dsptgtable" 
                                          pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                          requestURI="axis_axisrea029.do?operation=form&paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%>
                                                                                                             
                                            <display:column title="${title1}" sortable="true" sortProperty="CODIGO" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                              <div class="dspText">${T_IAX_CLAUTRAM.CODIGO}</div>
                                            </display:column>
                                            <display:column title="${title2}" sortable="true" sortProperty="DESCRIPCION" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                              <div class="dspText">${T_IAX_CLAUTRAM.DESCRIPCCION}</div>
                                            </display:column>
                                            <display:column title="${title3}" sortable="true" sortProperty="TTIPO" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                              <div class="dspText">${T_IAX_CLAUTRAM.TTIPO}</div>
                                            </display:column>
                                            <display:column title="${title6}" sortable="true" sortProperty="FEFECTO" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                              <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_CLAUTRAM.FEFECTO}"/></div>
                                            </display:column>
                                            <display:column title="${title4}" sortable="true" sortProperty="FVENCIM" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                              <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_CLAUTRAM.FVENCIM}"/></div>
                                            </display:column>
                                            <axis:visible f="axisrea029" c="BT_EDIT">
                                                <display:column title="${title5}" sortable="true"  headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >                                    
                                                  <div class="dspIcon"><a href="javascript:f_modif_axisrea031('${T_IAX_CLAUTRAM.CODIGO}');"><img border="0"  title="<axis:alt f="axisrea003" c="ALT_ISONTA_LIT_DESC" lit="9902274"/>" src="images/lapiz.gif"/></a> </div>
                                                </display:column>
                                            </axis:visible>
                                            <%--
                                            <axis:visible f="axisrea029" c="BT_BORRAR">
                                                <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_TRAMOS_REA.ITOTTRA" headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >                                    
                                                  <div class="dspIcon"><a href="javascript:f_borrar_clausula('${T_IAX_CON_REA.SCONAGR}', '${T_IAX_CON_REA.CIDIOMA}', '${T_IAX_CON_REA.TCONAGR}');"><img border="0" alt="<axis:alt f="axisrea003" c="ALT_IMG_ISCONTA" lit="9001333"/>" title="<axis:alt f="axisrea003" c="ALT_ISONTA_LIT" lit="9001333"/>" src="images/delete.gif"/></a> </div>
                                                </display:column>
                                            </axis:visible>
                                            --%>
                                          </display:table>                                                                                                    
                                        </div>  
                                      </td>
                                    </tr>
                                </table>
                            </td>
                          </tr>
                        
                </td>
                </tr>
              </table>

            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea029</c:param><c:param name="f">axisrea029</c:param>
            <c:param name="__botones">cancelar,buscar</c:param> 
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>