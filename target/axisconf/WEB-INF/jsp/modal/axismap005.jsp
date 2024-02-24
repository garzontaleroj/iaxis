<%/*
*  Fichero: axismap005.jsp
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
        
             var ok = "${__formdata.ok}";
                
                if (!objUtiles.estaVacio(ok) && ok == '0'){
                    parent.f_aceptar_axismap005();
                    }
        }
        
        function f_cerrar_modal(cual){
          objUtiles.cerrarModal(cual);
       //  objUtiles.ejecutarFormulario("modal_axismap005.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);            
        
        }
       function f_but_cancelar() {
            parent.f_aceptar_axismap005('axismap005');
        }   
        
        function f_abrir_axismapDetallModificar(NORDEN,NPOSICION,NLONGITUD,TTAG){
        //alert("***");
        var CMAPEAD = document.miForm.CMAPEAD.value;
         objUtiles.abrirModal("axismap011", "src", "modal_axismap011.do?operation=form&NORDEN="+NORDEN+"&NPOSICION="+NPOSICION+"&NLONGITUD="+NLONGITUD+"&TTAG="+TTAG+"&CMAPEAD="+CMAPEAD);        
        }
        
        function f_aceptar_axismap011(){
             f_cerrar_modal('axismap011');
            objUtiles.ejecutarFormulario("modal_axismap005.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);            
        }
                
    </script>
  </head>
    <body class=" " onload="f_onload()"  >
        <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axismap011|<fmt:message key="9901581"/>#</c:param>
    </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="SPERSON" id="SPERSON" value="" />
            <input type="hidden" name="SNIP" id="SNIP" value="" />
            <input type="hidden" name="CMAPEAD" id="CMAPEAD" value="${__formdata.CMAPEAD}"/>
            <input type="hidden" name="CMAPEAD1" id="CMAPEAD1" value="${__formdata.CMAPEAD}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><fmt:message key="9901575"/></c:param>
                <c:param name="producto"><fmt:message key="9901575"/></c:param>
                <c:param name="form">axismap005</c:param>
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
                                            <th style="width:50%;height:0px"></th>
                                            <th style="width:50%;height:0px"></th>
                                        </tr>
                                        <tr>
                                        <td colspan="6" align="right">
                                          <img border="0"                                         
                                                         alt='<axis:alt f="axismap001" c="BT_NUEVOMAP" lit="1000428"/>'
                                                         title='<axis:alt f="axismap001" c="BT_NUEVOMAP" lit="1000428"/>'
                                                         src="images/new.gif"
                                                         onclick="f_abrir_axismapDetallModificar('','','','')"/>
                                            <c:set var="title1"><fmt:message key="9901595"/></c:set><%-- Condición --%>
                                            <c:set var="title2"><fmt:message key="101159"/></c:set><%-- Valor --%>
                                            <c:set var="title3"><fmt:message key="9901591"/></c:set><%--Posicion --%>
                                            <c:set var="title4"><fmt:message key="9901592"/></c:set><%-- Longitud --%>
                                            <c:set var="title5"><fmt:message key="500102"/></c:set><%-- Orden --%>
                                            <c:set var="title6"><fmt:message key="9901587"/></c:set><%-- Objeto --%>
                                            <div class="displayspaceGrande">
                                      <display:table name="${__formdata.lstdetalle}"
                                                     id="miListaId"
                                                     export="false"
                                                     class="dsptgtable"
                                                     cellpadding="0"
                                                     cellspacing="0"
                                                     requestURI="">
                                            <%@ include file="../include/displaytag.jsp"%>
                                             
                                          
                                            <display:column title="${title5}" 
                                                            sortProperty=""
                                                            headerClass="fixed sortable" 
                                                            media="html"
                                                            autolink="false">
                                                  <div class="dspText">
                                                        ${miListaId.NORDEN}
                                                  </div>
                                            </display:column>
                                            <display:column title="${title3}" 
                                                            sortProperty=""
                                                            headerClass="fixed sortable" 
                                                            media="html"
                                                            autolink="false">
                                                  <div class="dspText">
                                                             ${miListaId.NPOSICION}
                                                  </div>
                                            </display:column>
                                            <display:column title="${title4}"  
                                                            sortProperty=""
                                                            headerClass="fixed sortable" 
                                                            media="html"
                                                            autolink="false">
                                                  <div class="dspText">
                                                           ${miListaId.NLONGITUD} 
                                                  </div>
                                            </display:column>
                                             <display:column title="${title6}" 
                                                            sortProperty=""
                                                            headerClass="fixed sortable" 
                                                            media="html"
                                                            autolink="false">
                                                  <div class="dspText">
                                                           ${miListaId.TTAG}
                                                  </div>
                                            </display:column>
                                           <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                  <div class="dspIcons"><a href="javascript:f_abrir_axismapDetallModificar('${miListaId.NORDEN}','${miListaId.NPOSICION}','${miListaId.NLONGITUD}','${miListaId.TTAG}')"><img border="0" alt="<fmt:message key='9000423'/>" title="<fmt:message key='9000423'/>" src="images/lapiz.gif"/></a></div>
                                             </display:column>   
                                            
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
            
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axismap005</c:param>
                <c:param name="__botones">cancelar</c:param>
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>

