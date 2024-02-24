<%/*
*  Fichero: axisage002_form.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a> 
*
*  Fecha: 08/10/2008
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>

    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
       
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() { 
            f_cargar_propiedades_pantalla();
            parent.f_iframe_cargado();
        }
        
        function f_actualizar(TCONDICION, TTEXTO, TIPOCAMPO){
        
            TCAMPO = "${__formdata.dettratar[__formdata.indexdettratar].TCAMPO}"
            NVECES = "${__formdata.dettratar[__formdata.indexdettratar].NVECES}"
            CTABLA = "${__formdata.dettratar[__formdata.indexdettratar].CTABLA}"
        
               objAjax.invokeAsyncCGI("axis_axismap001.do", 
                callbackAjaxActualizar, "operation=actualizar&TCONDICION=" + TCONDICION + 
                "&TTEXTO=" + TTEXTO+"&TCAMPO="+TCAMPO+"&NVECES="+NVECES+"&CTABLA="+CTABLA+"&CTIPOCAMPO="+TIPOCAMPO,  this, objJsMessages.jslit_cargando);
        }
        
     /*   function f_actualizar_redcomercial(CEMPRES) {
            objDom.setValorPorId("CEMPRES", CEMPRES);
            objAjax.invokeAsyncCGI("axis_axisage003.do", 
                callbackAjaxActualizarRedcomercial, "operation=actualizar_redcomercial&CEMPRES=" + CEMPRES + 
                "&CAGENTE=" + objDom.getValorPorId("CAGENTE"),  this);
        }*/

        /****************************************************************************************/
        /************************************ CALLBACKS AJAX ************************************/
        /****************************************************************************************/

        function callbackAjaxActualizar(ajaxResponseText) {
            try {
                var doc = objAjax.domParse(ajaxResponseText);
                
                if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {
                        null;
                
                    } // Fi for
                
                
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            } 
            
            
        }
        
          function f_seleccionar(index){
            document.miForm3.indexdettratar.value = index;
            objUtiles.ejecutarFormulario("axis_axismap001.do", "cargarDetalleAgente", document.miForm3, "_self", objJsMessages.jslit_cargando);            
            }
               function f_abrir_modal(cual, noXButton, optionalQueryString, optionalWidth, optionalHeight) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString, optionalWidth, optionalHeight);        
        }
        function f_detalle(){
            //alert(document.miForm3.CMAPEAD1.value);
            parent.f_abrir_modal_axismap005("&CMAPEAD1="+document.miForm3.CMAPEAD1.value);
        }

        function f_cabecera(){
            parent.f_abrir_modal('axismap003', true,"&CMAPEAD="+document.miForm3.CMAPEAD1.value);
        }
        
        function f_condicion(){
            parent.f_abrir_modal('axismap004', true,"&CMAPEAD="+document.miForm3.CMAPEAD1.value);
        }

        function f_tabla(){
             parent.f_abrir_modal('axismap007', true,"&CMAPEAD="+document.miForm3.CMAPEAD1.value);
        }       
        
         
          
       
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
 <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axismap002|<fmt:message key="9901574"/>#axismap005|<fmt:message key="9901575"/>#axismap004|<fmt:message key="9901576"/>#axismap003|<fmt:message key="9901577"/>#axismap007|<fmt:message key="9901578"/>#axismap008|<fmt:message key="9903585"/></c:param>
    </c:import>
    
    
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm3" action="" method="POST">         
    <input type="hidden" name="NODE_LABEL" id="NODE_LABEL" value="${__formdata.NODE_LABEL}"/>
    <input type="hidden" name="NODE_VALUE" id="NODE_VALUE" value="${__formdata.NODE_VALUE}"/>
    <input type="hidden" name="indexdettratar" id="indexdettratar" value="${__formdata.indexdettratar}"/>
     <input type="hidden" name="CMAPEAD" id="CMAPEAD" value="${__formdata.CMAPEAD}"/>
       <input type="hidden" name="CMAPEAD1" id="CMAPEAD1" value="${__formdata.CMAPEAD}"/>
        <input type="hidden" name="operation" value=""/>       
        <input type="hidden" name="CEMPRES" id="CEMPRES" value="${__formdata.CEMPRES}"/>
        
        <c:set var="modoModificable" value="${false}"/>

        
    <br>
    <%--c:if test="${!empty __formdata.obj}">--%>
    <table class="area" align="center">                    
            <tr>
                <th style="width:30%;height:0px"></th>
                <th style="width:30%;height:0px"></th>
                <th style="width:30%;height:0px"></th>
                <th style="width:10%;height:0px"></th>
                    <tr>
                      <td class="titulocaja"><b><axis:alt f="axismap001" c="TTAG" lit="9901587"/></b></td><%-- Objeto --%>
                      <td class="titulocaja"><b><axis:alt f="axismap001" c="TPARE" lit="9901588"/></b></td><%-- Padre --%>
                      <td class="titulocaja"><b><axis:alt f="axismap001" c="NORDFILL" lit="500102"/></b></td><%-- Orden --%>
                    </tr>
                     <tr>
                      <td class="campocaja">
                       <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;"
                    value="${__formdata.obj[0].TTAG}" name="TTAG" id="TTAG" readonly="readonly"/>
                      </td>
                      <td class="campocaja">
                       <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;"
                    value="${__formdata.obj[0].TPARE}" name="TPARE" id="TPARE" readonly="readonly"/>
                    
                      </td>
                       <td class="campocaja">
                       <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;"
                    value="${__formdata.obj[0].NORDFILL}" name="NORDFILL" id="NORDFILL" readonly="readonly"/>
                 
                       </td>
                       <td>
                             <c:if test="${!empty __formdata.obj[0].TTAG}">
                             
                                          <img border="0"
                                         alt='<axis:alt f="axismap001" c="BT_EDITNODO" lit="9901356"/>'
                                         title='<axis:alt f="axismap001" c="BT_EDITNODO" lit="9901356"/>'
                                         src="images/lapiz.gif"
                                         onclick="parent.f_axismap008_editar('')"/>
                                            <img border="0"
                                         alt='<axis:alt f="axismap001" c="BT_DELMAP" lit="9001333"/>'
                                         title='<axis:alt f="axismap001" c="BT_DELMAP" lit="9001333"/>'
                                         src="images/delete.gif"
                                         onclick="parent.f_del_mapxml('${__formdata.obj[0].TTAG}','${__formdata.obj[0].NORDFILL}','${__formdata.obj[0].TPARE}')"/>
                            </c:if>
                       </td>
                    </tr>

                   
                     <tr>
                      <td class="titulocaja" colspan="2"><b><axis:alt f="axismap001" c="CTABLAFILLS" lit="9901589"/></b></td><%-- Tabla hijos --%>
                      <td class="titulocaja"><b><axis:alt f="axismap001_form" c="CATRIBUTS" lit="9901590"/></b></td><%-- Atributos --%>
                    </tr>
                    <tr>
                    <td class="campocaja" colspan="2">
                   <select name="CTABLAFILLS" style="width:93%" disabled
                                    id="CTABLAFILLS" size="1" onchange=""
                                    class="campowidthselect campo campotexto">&nbsp;
                                  <option value="null">
                                        - <axis:alt f="axismap001" c="SNV_COMBO" lit="108341"/> -
                                  </option>
                                  <c:forEach var="ramo"
                                             items="${__formdata.lsttablahijos}">
                                        <option value="${ramo.CTABLA}"
                                                <c:if test="${!empty __formdata.obj[0].CTABLAFILLS && __formdata.obj[0].CTABLAFILLS == ramo.CTABLA}">selected</c:if>>
                                              ${ramo.DESCRIPCIO}
                                        </option>
                                  </c:forEach>
                            </select>
                    
                    </td>
                    <td class="campocaja">
                       <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;"
                    value="${__formdata.obj[0].CATRIBUTS}" name="CATRIBUTS" id="CATRIBUTS" readonly="readonly"/>
                       </td>
                    </tr>
                    
                    </table>     
                    <%--c:if>

<c:if test="${!empty __formdata.detalle}">--%>
<br>
    <table class="area" align="center">                    
            <tr>
                 <th style="width:30%;height:0px"></th>
                <th style="width:30%;height:0px"></th>
                <th style="width:30%;height:0px"></th>
                <th style="width:10%;height:0px"></th>

                    <tr>
                      <td class="titulocaja"><b><axis:alt f="axismap001_form" c="NORDEN" lit="500102"/></b></td><%-- orden --%>
                      <td class="titulocaja"><b><axis:alt f="axismap001_form" c="NPOSICION" lit="9901591"/></b></td><%-- Posición --%>
                      <td class="titulocaja"><b><axis:alt f="axismap001_form" c="NLONGITUD" lit="9901592"/></b></td><%-- Longitud --%>
                    </tr>
                     <tr>
                      <td class="campocaja">
                       <select name="NORDEN" style="width:93%" disabled
                                    id="NORDEN" size="1" onchange=""
                                    class="campowidthselect campo campotexto">&nbsp;
                                  <option value="null">
                                        - <axis:alt f="axismap001_form" c="SNV_COMBO" lit="108341"/> -
                                  </option>
                                  <c:forEach var="ramo"
                                             items="${__formdata.lstdetalle}">
                                        <option value="${ramo.NORDEN}"
                                                <c:if test="${!empty __formdata.detalle[0].NORDEN && __formdata.detalle[0].NORDEN == ramo.NORDEN}">selected</c:if>>
                                             ${ramo.NORDEN}.- ${ramo.TTAG}
                                        </option>
                                  </c:forEach>
                            </select>
                      </td>
                      <td class="campocaja">
                       <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;"
                    value="${__formdata.detalle[0].NPOSICION}" name="NPOSICION" id="NPOSICION" readonly="readonly"/>
                    
                      </td>
                       <td class="campocaja">
                       <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;"
                    value="${__formdata.detalle[0].NLONGITUD}" name="NLONGITUD" id="NLONGITUD" readonly="readonly"/>
                    
                       </td>
                       <td>
                             <c:if test="${!empty __formdata.detalle[0].NORDEN}">
                             
                                          <img border="0"
                                         alt='<axis:alt f="axismap001" c="BT_EDITNODO" lit="9901356"/>'
                                         title='<axis:alt f="axismap001" c="BT_EDITNODO" lit="9901356"/>'
                                         src="images/lapiz.gif"
                                         onclick="parent.f_axismap011_editar('${__formdata.detalle[0].NORDEN}')"/>
                                            <img border="0"
                                         alt='<axis:alt f="axismap001" c="BT_DELMAP" lit="9001333"/>'
                                         title='<axis:alt f="axismap001" c="BT_DELMAP" lit="9001333"/>'
                                         src="images/delete.gif"
                                         onclick="parent.f_del_mapdetalle('${__formdata.detalle[0].NORDEN}')"/>
                            </c:if>
                       </td>
                    </tr>

                      </table>     
                    <%--/c:if>    

<c:if test="${!empty __formdata.dettratar}">--%>
<br>
    <table class="area" align="center">                    
            <tr>
                <th style="width:33%;height:0px"></th>
                <th style="width:33%;height:0px"></th>
                <th style="width:33%;height:0px"></th>
            </tr>
            <tr>

 <td class="campocaja" colspan="6" align="right">
                                <!-- DisplayTag Lista de productos -->
                                <c:set var="title1"><%-- Campo --%>
                                     <axis:alt f="axismap001_form" c="CCAMPO" lit="109373"/>
                                </c:set>
                                <c:set var="title0"><%-- N. Veces --%>
                                      <axis:alt f="axismap001_form" c="NVECES" lit="9901593"/>
                                </c:set>
                                <c:set var="title2"><%-- Tabla --%>
                                      <axis:alt f="axismap001_form" c="TDESCRIP" lit="9901594"/>
                                </c:set>
                                <%int i = 0;%>
                                  <c:if test="${!empty __formdata.obj[0].TTAG}">
                                   <axis:visible f="axismap001" c="BT_NUEVOMAP">
                                                    <img border="0"
                                                         alt='<axis:alt f="axismap001" c="BT_NUEVOMAP" lit="1000428"/>'
                                                         title='<axis:alt f="axismap001" c="BT_NUEVOMAP" lit="1000428"/>'
                                                         src="images/new.gif"
                                                         onclick="parent.f_axismap012_nuevo('${__formdata.detalle[0].NORDEN}')"/>
                                                  </axis:visible>
                                  </c:if>
                                <div class="displayspace">
                
                                      <display:table name="${__formdata.dettratar}"
                                                     id="miListaId"
                                                     export="false"
                                                     class="dsptgtable"
                                                     cellpadding="0"
                                                     cellspacing="0"
                                                     requestURI="">
                                            <%@ include file="../include/displaytag.jsp"%>
                                             <c:set var="i"><%=i%></c:set>
                                             <display:column headerClass="headwidth5 sortable"
                                                            title=""
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspIcons">
                                                    <input value="${miListaId.CCAMPO}"
                                                           type="radio" <c:if test="${!empty __formdata.indexdettratar && __formdata.indexdettratar == i }"> checked </c:if>
                                                           onclick="f_seleccionar(${i})"
                                                           id="radioCAMPO"
                                                           name="radioCAMPO"/>
 
                                                </div>
                                            </display:column>
                                            <display:column title="${title1}"
                                                            sortProperty=""
                                                            headerClass="headwidth20 sortable"
                                                            media="html"
                                                            autolink="false">
                                                  <div class="dspText">
                                                        ${miListaId.TCAMPO}
                                                  </div>
                                            </display:column>
                                            <display:column title="${title0}"
                                                            sortProperty=""
                                                            headerClass="sortable"
                                                            media="html"
                                                            autolink="false">
                                                  <div class="dspText">
                                                             ${miListaId.NVECES}
                                                  </div>
                                            </display:column>
                                            <display:column title="${title2}"
                                                            sortProperty=""
                                                            headerClass="sortable"
                                                            media="html"
                                                            autolink="false">
                                                  <div class="dspText">
                                                           ${miListaId.CTABLA} - ${miListaId.TDESCRIP}
                                                  </div>
                                            </display:column>
                                              <display:column title=""
                                                            sortProperty=""
                                                            headerClass="sortable"
                                                            media="html"
                                                            autolink="false">
                                                             <div class="dspIcons">
                                                                  <img border="0"
                                                                 alt='<axis:alt f="axismap001" c="BT_EDITNODO" lit="9901356"/>'
                                                                 title='<axis:alt f="axismap001" c="BT_EDITNODO" lit="9901356"/>'
                                                                 src="images/lapiz.gif"
                                                                 onclick="parent.f_axismap012_editar('${miListaId.NORDEN}','${miListaId.TCONDICION}','${miListaId.CTABLA}','${miListaId.NVECES}','${miListaId.TCAMPO}','${miListaId.TSETWHERE}')"/>
                                                                    <img border="0"
                                                                 alt='<axis:alt f="axismap001" c="BT_DELMAP" lit="9001333"/>'
                                                                 title='<axis:alt f="axismap001" c="BT_DELMAP" lit="9001333"/>'
                                                                 src="images/delete.gif"
                                                                 onclick="parent.f_del_mapdettratar('${miListaId.NORDEN}','${miListaId.TCONDICION}','${miListaId.CTABLA}','${miListaId.NVECES}','${miListaId.TCAMPO}','${miListaId.TSETWHERE}')"/>
                                                          </div>
                                                </display:column>
                                            <%i++;%>
                                      </display:table>
                                </div>
                          </td>
            </tr>
                    
                <tr>

                      <td class="titulocaja"><b><axis:alt f="axismap001" c="TCONDICION" lit="9901595"/></b></td><%-- Condición --%>
                      <td class="titulocaja"><b><axis:alt f="axismap001" c="CTIPCAMPO" lit="100565"/></b></td><%-- Tipo --%>
                    </tr>
 <tr>
                   <td class="campocaja">
                       <input type="text" class="campowidthinput campo campotexto" readonly size="15" style="width:90%;" onchange="f_actualizar(this.value,document.miForm3.TMASCARA.value,  document.miForm3.CTIPCAMPO.value)"
                    value="${__formdata.dettratar[__formdata.indexdettratar].TCONDICION}" name="TCONDICION" id="TCONDICION" />
                    
                       </td>

                   <td class="campocaja">
                       <select name="CTIPCAMPO" style="width:93%" disabled
                                    id="CTIPCAMPO" size="1" onchange="f_actualizar(document.miForm3.TCONDICION.value,document.miForm3.TMASCARA.value,this.value)"
                                    class="campowidthselect campo campotexto">&nbsp;
                                  <option value="null">
                                        - <axis:alt f="axismap001_form" c="SNV_COMBO" lit="108341"/> -
                                  </option>
                                  <c:forEach var="ramo"
                                             items="${__formdata.lstTipo}">
                                        <option value="${ramo.CATRIBU}"
                                                <c:if test="${!empty __formdata.dettratar[__formdata.indexdettratar].CTIPCAMPO && __formdata.dettratar[__formdata.indexdettratar].CTIPCAMPO == ramo.CATRIBU}">selected</c:if>>
                                             ${ramo.TATRIBU}
                                        </option>
                                  </c:forEach>
                            </select>
                      </td>
                   </tr>

                    <tr>
                      <td class="titulocaja" colspan="2"><b><axis:alt f="axismap001" c="TMASCARA" lit="100566"/></b></td><%-- Texto --%>
                      <td class="titulocaja"><b><axis:alt f="axismap001" c="TSETWHERE" lit="9002038"/></b></td><%-- Operación --%>
                    </tr>                    
                   <tr>
                     <td class="campocaja" colspan="2">
                       <input type="text" readonly class="campowidthinput campo campotexto" size="15" style="width:95%;" onchange="f_actualizar(document.miForm3.TCONDICION.value, this.value, document.miForm3.CTIPCAMPO.value)"
                    value="${__formdata.dettratar[__formdata.indexdettratar].TMASCARA}" name="TMASCARA" id="TMASCARA"/>
                    
                       </td>
                   <td class="campocaja">
                       <select name="TSETWHERE" style="width:93%" disabled
                                    id="TSETWHERE" size="1" onchange=""
                                    class="campowidthselect campo campotexto">&nbsp;
                                  <option value="null">
                                        - <axis:alt f="axismap001" c="SNV_COMBO" lit="108341"/> -
                                  </option>
                                  <c:forEach var="ramo"
                                             items="${__formdata.lstSetWhere}">
                                        <option value="${ramo.CATRIBU}" 
                                        <c:if test="${!empty __formdata.dettratar[__formdata.indexdettratar].TSETWHERE && __formdata.dettratar[__formdata.indexdettratar].TSETWHERE ==  fn:substring(ramo.TATRIBU,0,1)}">selected</c:if>>
                                             ${ramo.TATRIBU}
                                        </option>
                                  </c:forEach>
                            </select>
                      </td>
      
                   </tr>
                   
                  
                   
                    
                    </table>     
                    <%--/c:if>                        --%>
                    <c:if test="${!empty __formdata.CMAPEAD}">
                    <table>
           <tr>
                   <td colspan="6" align="center">
                   
                   <br>
                    <input type="button" class="boton" id="but_detall" value="<axis:alt f="axismap001" c="BUT_DETALLE" lit="102239"/>" onclick="javascript:f_detalle()" />&nbsp;&nbsp;
                    <input type="button" class="boton" id="but_condicion" value="<axis:alt f="axismap001" c="BUT_CONDICION" lit="9901595"/>" onclick="javascript:f_condicion()" />&nbsp;&nbsp;
                    <%--input type="button" class="boton" id="but_cabecera" value="<axis:alt f="axismap001" c="BUT_CABECERA" lit="9901994"/>" onclick="javascript:f_cabecera()" />&nbsp;&nbsp;--%>
                    <input type="button" class="boton" id="but_tabla" value="<axis:alt f="axismap001" c="BUT_TABLA" lit="9901993"/>" onclick="javascript:f_tabla()" />&nbsp;&nbsp;
                   </td>
                   </tr>
                   </table></c:if>
                             
   
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
    


</body>
</html>