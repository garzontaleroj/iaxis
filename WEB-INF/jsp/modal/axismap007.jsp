<%/*
*  Fichero: axismap007.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*
*  Fecha: 22/10/2010
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
            f_cargar_propiedades_pantalla();
        }
        
       

              function f_seleccionar(index){
            document.miForm.index.value = index;
            objUtiles.ejecutarFormulario("modal_axismap007.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);            
            }   
            
            
        

        function f_cerrar_modal(cual){
          objUtiles.cerrarModal(cual);
        
        }
       function f_but_cancelar() {
            parent.f_aceptar_axismap007('axismap007');
        }   
        
        function f_axismap014_editar(CTABLA){
            var CMAPEAD = document.miForm.CMAPEAD.value;
            objUtiles.abrirModal("axismap014", "src", "modal_axismap014.do?operation=form&CTABLA="+CTABLA+"&CMAPEAD="+CMAPEAD);        
        }
        
        function f_aceptar_axismap014(){
             f_cerrar_modal('axismap014');

            objUtiles.ejecutarFormulario("modal_axismap007.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);            
        }
       function f_del_maptabla(CTABLA){

           CMAPEAD =    document.miForm.CMAPEAD.value;

           objUtiles.ejecutarFormulario("modal_axismap007.do?CTABLA="+CTABLA, "borrar", document.miForm, "_self", objJsMessages.jslit_cargando);
          }  
    </script>
  </head>
    <body class=" " onload="f_onload()"  >
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
     <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axismap014|<fmt:message key="9901581"/>#</c:param>
            </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="CMAPEAD" id="CMAPEAD" value="${__formdata.CMAPEAD}"/>
            <input type="hidden" name="CMAPEAD1" id="CMAPEAD1" value="${__formdata.CMAPEAD}"/>
            <input type="hidden" name="index" id="index" value="" />
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axismap007" c="TIT_AXISMAP007" lit="9901578"/></c:param>
                <c:param name="producto"><axis:alt f="axismap007" c="TIT_AXISMAP007" lit="9901578"/></c:param>
                <c:param name="form">axismap007</c:param>
            </c:import>

            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                         <tr>
                                         <td colspan="6" align="right">
                                          <img border="0"                                         
                                                         alt='<axis:alt f="axismap004" c="BT_NUEVOMAP" lit="1000428"/>'
                                                         title='<axis:alt f="axismap004" c="BT_NUEVOMAP" lit="1000428"/>'
                                                         src="images/new.gif"
                                                         onclick="f_axismap014_editar('','','','')"/>
                                            
                                            <c:set var="title3"><axis:alt f="axismap007" c="TDESCRIP" lit="101761"/></c:set><%--TDESCRIP --%>
                                            <c:set var="title5"><axis:alt f="axismap007" c="CTABLA" lit="9901594"/></c:set><%-- CTABLA --%>
                                            <div class="displayspaceGrande">
                                            <%int i = 0;%>
                                      <display:table name="${__formdata.lsttabla}"
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
                                                           type="radio" <c:if test="${!empty __formdata.index && __formdata.index == i }"> checked </c:if>
                                                           onclick="f_seleccionar(${i})"
                                                           id="radioCAMPO"
                                                           name="radioCAMPO"/>
 
                                                </div>
                                            </display:column>
                                          
                                            <display:column title="${title5}" 
                                                            sortProperty=""
                                                            headerClass="fixed sortable" 
                                                            media="html csv"
                                                            autolink="false">
                                                  <div class="dspText">
                                                        ${miListaId.CTABLA}
                                                  </div>
                                            </display:column>
                                          
                                            <display:column title="${title3}" 
                                                            sortProperty=""
                                                            headerClass="fixed sortable" 
                                                            media="html"
                                                            autolink="false">
                                                  <div class="dspText">
                                                             ${miListaId.TDESCRIP}
                                                  </div>
                                                  
                                            </display:column>
                                            <display:column title=""
                                                            sortProperty=""
                                                            headerClass="sortable"
                                                            media="html"
                                                            autolink="false">
                                                             <div class="dspIcons">
                                                                  <img border="0"
                                                                 alt='<axis:alt f="axismap004" c="BT_EDITNODO" lit="9901356"/>'
                                                                 title='<axis:alt f="axismap004" c="BT_EDITNODO" lit="9901356"/>'
                                                                 src="images/lapiz.gif"
                                                                 onclick="f_axismap014_editar('${miListaId.CTABLA}')"/>
                                                                    <img border="0"
                                                                 alt='<axis:alt f="axismap004" c="BT_DELMAP" lit="9001333"/>'
                                                                 title='<axis:alt f="axismap004" c="BT_DELMAP" lit="9001333"/>'
                                                                 src="images/delete.gif"
                                                                 onclick="f_del_maptabla('${miListaId.CTABLA}')"/>
                                                          </div>
                                                </display:column>
                                                <%i++;%>
                                            </display:table>
                                            </div>
                                            </td>
                                            </tr>
                                            <tr>
                                            <td class="titulocaja">
                                            <b><axis:alt f="axismap007" c="SENTENCIA" lit="9901992"/></b>
                                            </td>
                                            </tr>
                                            <tr>
                                            <td class="campocaja">
                                              <textarea class="campo campotexto" cols="5" rows="25" readonly name="TCOMENTARIO" id="TCOMENTARIO">${__formdata.lsttabla[__formdata.index].TFROM}</textarea>
                                            </td>
                                            </tr>
                                     </table>
                                </td>
                            </tr>
                        </table>
                    
                     
                            
                    </td>
                </tr>
            </table>						
            
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axismap007</c:param>
                <c:param name="__botones">cancelar</c:param>
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>

