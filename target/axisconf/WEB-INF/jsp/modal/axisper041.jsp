<%
/*
*  Fichero: axisper041.jsp
*  @author <a href = "mailto:mnustes@csi-ti.com">Marlon Nustes</a> 
*  Fecha: 12/05/2015
*/
%>

<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
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
        <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
        <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
        <%-- Especial para controlar los scroll con iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
        <%-- Especial para controlar los scroll con iPad --%>
        <c:import url="../include/carga_framework_js.jsp" />   
        
        <script language="Javascript" type="text/javascript">
        
        function f_onload() {
            
            document.miForm.tabla1.focus();
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
            f_cargar_propiedades_pantalla();
        }     
        
        function f_but_cancelar() {
            parent.f_cerrar_modal("axisper041");
        }
        
        function f_but_aceptar() {
            if(objUtiles.estaVacio(document.miForm.seleccionaLinea))
                alert(objJsMessages.jslit_selecciona_registro);
            else{
                var hayChecked = objUtiles.f_GuardaCasillasChecked ("seleccionaLinea");

                if(typeof hayChecked == 'boolean') 
                    alert(objJsMessages.jslit_selecciona_registro);
                else {
                    seleccionaRegistro(objUtiles.utilSplit(hayChecked, "/")[0],
                                       objUtiles.utilSplit(hayChecked, "/")[1],
                                       objUtiles.utilSplit(hayChecked, "/")[2],
                                       objUtiles.utilSplit(hayChecked, "/")[3],
                                       objUtiles.utilSplit(hayChecked, "/")[4],
                                       objUtiles.utilSplit(hayChecked, "/")[5]);
                }
            }
        }
        
        function seleccionaRegistro (CPAIS, TPAIS, CPROVIN, TPROVIN, CPOBLAC, TPOBLAC) {
            if (objUtiles.estaVacio(CPAIS))
                alert (objJsMessages.jslit_selecciona_registro);
            else{
                parent.f_aceptar_axisper041 (CPAIS, TPAIS, CPROVIN, TPROVIN, CPOBLAC, TPOBLAC);                
            }
         }
        </script>
        
        
    </head>
    <body onload="f_onload()">

            <c:import url="../include/precargador_ajax.jsp">
                <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
            </c:import>   
                      
            <form name="miForm" action="" method="POST">
                
                <!-- Area de Titulo  -->
                <c:import url="../include/titulo_nt.jsp">
                    <c:param name="formulario"><axis:alt f="axisper041" c="FORM" lit="9002274" /></c:param>
                    <c:param name="producto"><axis:alt f="axisper041" c="FORM" lit="9002274" /></c:param>
                    <c:param name="form">axisper041</c:param>
                </c:import>
                
                <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                            <img src="images/flecha.gif"/>
                            <b><axis:alt f="axisper041" c="LIT32" lit="9002274"/>  - ${__formdata.CPOSTAL}</b>
                        </div>
                        
                        <div class="separador">&nbsp;</div>       
                            
                        <c:set var="title0"><axis:alt f="axisper041" c="CPAIS" lit="100816"/></c:set>
                        <c:set var="title1"><axis:alt f="axisper041" c="CPROVIN" lit="100756"/></c:set>
                        <c:set var="title2"><axis:alt f="axisper041" c="CPOBLAC" lit="100817"/></c:set>
                                                                
                        <div class="seccion displayspacePersonas"> 
                            <display:table name="${sessionScope.axisper041_listaCpostal}"
                                            id="miListaId" export="false"
                                            class="dsptgtable" pagesize="12"
                                            defaultsort="1"
                                            defaultorder="ascending"
                                            sort="list" cellpadding="0"
                                            cellspacing="0"
                                            requestURI="modal_axisper041.do?paginar=true">                                 
                             
                             
                             <%@ include file="../include/displaytag.jsp"%>
                             
                             <display:column title="" 
                                             sortable="false" 
                                             headerClass="headwidth5 sortable"  
                                             media="html" autolink="false">    
                                <div class="dspIcons">
                                <input  type="radio" id="seleccionaLinea" name="seleccionaLinea" value="${miListaId['SCPAIS']}/${miListaId['STPAIS']}/${miListaId['SCPROVIN']}/${miListaId['STPROVIN']}/${miListaId['SCPOBLAC']}/${miListaId['STPOBLAC']}"/>
                                </div>
                             </display:column>
                             
                             <display:column title="${title0}"
                                             sortable="true"
                                             sortProperty="SCPAIS"
                                             headerClass="sortable fixed"
                                             media="html" autolink="false">
                                <div class="dspText">
                                ${miListaId['STPAIS']}
                                </div>
                      
                              </display:column>
                              
                              <display:column title="${title1}"
                                              sortable="true"
                                              sortProperty="SCPROVIN"
                                              headerClass="sortable fixed"
                                              media="html" autolink="false">
                                <div class="dspText">
                                ${miListaId['STPROVIN']}
                                </div>
                              </display:column>
                                
                              <display:column title="${title2}"
                                              sortable="true"
                                              sortProperty="SCPOBLAC"
                                              headerClass="sortable fixed"
                                              media="html" autolink="false">
                                <div class="dspText">
                                ${miListaId['STPOBLAC']}
                                </div>                                                
                              </display:column>                                           
                                                                                                                       
                              </display:table> 
                          </div> 
                        <div class="separador">&nbsp;</div>
                       
                       
                    </td>
                    </tr>
                    
                </table>
                
                <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisper041</c:param>
                    <c:param name="__botones"><axis:visible f="axisadm095" c="BT_CANCELAR">cancelar</axis:visible><axis:visible f="axisper041" c="BT_ACEPTAR">,aceptar</axis:visible></c:param>
                </c:import>
            </form>            
            
            <c:import url="../include/mensajes.jsp" />
        
    </body>
    
    <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
      <script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('axisper041');
      </script>                   
    </c:if>
    
</html>