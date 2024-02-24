<%
/*
*  Fichero: axisctr206.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a> 
*
*  Fecha: 05/03/2008
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
      <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
    <c:set var="isaxisctr208Embedded" value="true"/>
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        function f_onload(){
          f_cargar_propiedades_pantalla();
        /*  var total = "${__formdata.TOTAL}";
          
          var tot = "${TOT}";
           if ( !objUtiles.estaVacio(tot))
            document.axisctr206Form.TOTAL.value = tot;*/
        
        }
       function f_but_cancelar() {
            parent.f_cerrar_axisctr206();
        }
        
       // Primero miramos si hay alguna opción de la lista seleccionada
       <c:if test="${isaxisctr208Embedded == 'false' || empty sessionScope.mostrarAxisctr208Embed}">
       function f_but_aceptar() {                    
       
            parent.f_aceptar_axisctr206();
        }    
        </c:if> 
        
       function f_but_9904983(){
         f_abrir_axisctr208(null,'NUEVO'); 
       }
         
       function f_recuperarsubhitodata(CVERSION,CDISPOSITIVO,CPROPDISP,FINICONTRATO,NCONTRATO,valor) {
      
        objUtiles.ejecutarFormulario("modal_axisctr206.do?&CDISPOSITIVO="+CDISPOSITIVO+"&CPROPDISP="+CPROPDISP+"&FINICONTRATO="+FINICONTRATO+"&NCONTRATO="+NCONTRATO+"&MARCADO="+valor, "selecDispositivo",  document.axisctr206Form, "_self", objJsMessages.jslit_cargando);   
       }
        
        /****************************************************************************************/
        /********************************* MODAL axisctr208 *************************************/
        /****************************************************************************************/
        
        function f_abrir_axisctr208(CDISPOSITIVO,CMODO) {
        
            var isaxisctr208Embedded = "${isaxisctr208Embedded}";
            if (document.axisctr206Form.CVERSION == undefined){
                if (isaxisctr208Embedded == "true"){
                    objUtiles.ejecutarFormulario("modal_axisctr206.do?CDISPOSITIVO="+CDISPOSITIVO+"&MODO="+CMODO, "editarDispositivo",  document.axisctr206Form, "_self", objJsMessages.jslit_cargando);   
                }else{
                    objUtiles.abrirModal("axisctr208", "src", "modal_axisctr208.do?operation=form&CDISPOSITIVO="+CDISPOSITIVO+"&CMODO="+CMODO, 800, 300);        
                }
            }else{
                //document.axisctr206Form.CVERSION.value = CVERSION;
                
                 if (isaxisctr208Embedded == "true")
                    objUtiles.ejecutarFormulario("modal_axisctr206.do?CDISPOSITIVO="+CDISPOSITIVO+"&MODO="+CMODO, "editarDispositivo",  document.axisctr206Form, "_self", objJsMessages.jslit_cargando);   
                else
                    objUtiles.abrirModal("axisctr208", "src", "modal_axisctr208.do?operation=form&CMODO="+CMODO, 800, 300);   
                
            }
        
        }
        
        function f_cerrar_axisctr208() {
            // Cerrar modal y recargar la pantalla
            var isaxisctr208Embedded = "${isaxisctr208Embedded}";  
            if (isaxisctr208Embedded == "true")
                objUtiles.ejecutarFormulario("modal_axisctr206.do?esconderAxisctr208Embed=true", "form", document.axisctr206Form, "_self", objJsMessages.jslit_cargando);   
            else
                objUtiles.cerrarModal("axisctr208");
        }
            
        function f_aceptar_axisctr208() {
            // Cerrar modal y recargar la pantalla
            var isaxisctr208Embedded = "${isaxisctr208Embedded}";
            if (isaxisctr208Embedded == "true") {
                objUtiles.ejecutarFormulario("modal_axisctr206.do?esconderAxisctr208Embed=true", "form", document.axisctr206Form, "_self", objJsMessages.jslit_cargando);                   
            } else {
                f_cerrar_axisctr208();
                objUtiles.ejecutarFormulario("modal_axisctr206.do", "form", document.axisctr206Form, "_self", objJsMessages.jslit_cargando, 800, 300);   
            }
        }
    function f_borrarDispositivo(CVERSION,CDISPOSITIVO,IVALDISP) {
                objUtiles.ejecutarFormulario("modal_axisctr206.do?CDISPOSITIVO="+CDISPOSITIVO+"&IVALDISP="+IVALDISP, "borrarDispositivo", document.axisctr206Form, "_self", objJsMessages.jslit_cargando);   

        }
    </script>
  </head>
  <body onload="f_onload()">
  <div id="wrapper" class="wrapper">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="axisctr206Form" action="" method="POST">
        <input type="hidden" name="operation" value="">
        <input type="hidden" name="CVERSION" id="CVERSION" value="${__formdata.VERSION.CVERSION}">
        <input type="hidden" name="CMODO" id="CMODO" value="${__formdata.CMODO}">
        
        <c:set var="pantalla" value="axisctr206"/>
        <c:set var="literalPantalla" value="9904763"/>
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="producto"><axis:alt f="axisctr206" c="TIT_FORM" lit="9904763" /></c:param>
            <c:param name="formulario"><axis:alt f="axisctr206" c="TIT_FORM" lit="${literalPantalla}" /></c:param>
            <c:param name="form">${pantalla}</c:param>
        </c:import>
        
        <iframe name="subhitodata" id="subhitodata" src="blanco.html" style="width:100px;height:100px;visibility:hidden;display:none"></iframe>
        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
      
            <tr>
                <td class="campocaja">
                <div class="separador">&nbsp;</div>
                 <div  class="titulo">
                 <div style="float:left;" >
                 <img src="images/flecha.gif"/><b><axis:alt f="axisctr206" c="TVERSION" lit="9904763" />
                 </b></div>
                    <c:if test="${empty __formdata.SERIE}">
                        <div style="float:right;" ><b>${__formdata.VERSION.TVERSION}</b></div>
                        
                    </c:if>
                    
                    </div>
                    <table class="seccion">
                        <tr>
                            <td>
                                <div class="separador">&nbsp;</div>
                                <!-- DisplayTag ListaPersonas -->
                                <c:set var="title1"><axis:alt f="axisctr206" c="FINICONTRATO" lit="9000537"/></c:set>
                                <c:set var="title11"><axis:alt f="axisctr206" c="CDISPOSITIVO" lit="9904763"/></c:set>
                                <c:set var="title2"><axis:alt f="axisctr206" c="NCONTRATO" lit="9000536"/></c:set>
                                <c:set var="title3"><axis:alt f="axisctr206" c="TPROPDISP" lit="9904764"/></c:set>
                               
                                
                                <div class="seccion displayspacePersonas">
                                <display:table name="${sessionScope.NO_SERIE}" id="miListaId" export="false" class="dsptgtable" pagesize="15" defaultsort="1" defaultorder="ascending" requestURI="modal_axisctr206.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <axis:visible c="MARCADO" f="axisctr206">
                                        <display:column title="" sortable="false" sortProperty="MARCADO" headerClass="headwidth sortable"  media="html" autolink="false" >    
                                            <div class="dspIcons"><input <axis:atr f="axisctr206" c="MARCADO" a="modificable=true"/> <c:if test="${miListaId.OB_IAX_AUTDISPOSITIVOS.CMARCADO==1}">checked</c:if> type="checkbox" id="seleccionaDispositivo" name="seleccionaDispositivo" value="" onclick="f_recuperarsubhitodata('${__formdata.VERSION.CVERSION}','${miListaId.OB_IAX_AUTDISPOSITIVOS.CDISPOSITIVO}','${miListaId.OB_IAX_AUTDISPOSITIVOS.CPROPDISP}','<fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.OB_IAX_AUTDISPOSITIVOS.FINICONTRATO}"/>','${miListaId.OB_IAX_AUTDISPOSITIVOS.NCONTRATO}',this.checked)"/></div>
                                        </display:column>                                                                                                                                                                                                                                                                                                                                                 
                                    </axis:visible>
                                    <axis:visible c="TDISPOSITIVO" f="axisctr206">
                                     <display:column title="${title11}" sortable="true" sortProperty="OB_IAX_AUTDISPOSITIVOS.TDISPOSITIVO" headerClass="sortable"  media="html" autolink="false">
                                        <div class="dspText">${miListaId.OB_IAX_AUTDISPOSITIVOS.TDISPOSITIVO}</div>
                                    </display:column>
                                    </axis:visible>
                                    
                                    
                                    <axis:visible c="TPROPDISP" f="axisctr206">
                                    <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_AUTDISPOSITIVOS.TPROPDISP" headerClass="sortable"  media="html" autolink="false">
                                        <div class="dspText">${miListaId.OB_IAX_AUTDISPOSITIVOS.TPROPDISP}</div>
                                    </display:column>
                                    </axis:visible>
                                    
                                    <axis:visible c="FINICONTRATO" f="axisctr206">
                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_AUTDISPOSITIVOS.FINICONTRATO" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.OB_IAX_AUTDISPOSITIVOS.FINICONTRATO}"/></div>
                                    </display:column>
                                    </axis:visible>
                                    <axis:visible c="NCONTRATO" f="axisctr206">
                                    <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_AUTDISPOSITIVOS.NCONTRATO" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText">${miListaId.OB_IAX_AUTDISPOSITIVOS.NCONTRATO}</div>
                                    </display:column>
                                    </axis:visible>
                                    <%--axis:visible c="IVALACC" f="axisctr206">
                                    <display:column title="${title2}" sortable="true" sortProperty="IVALACC" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText"><fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}'  value='${miListaId.OB_IAX_AUTDISPOSITIVOS.IVALACC}'/></div>
                                    </display:column>
                                    </axis:visible--%>
                                    <axis:visible c="EDIT_DISPOSITIVO" f="axisctr206">
                                        <display:column title="" sortable="true" sortProperty="NUEVO" headerClass="sortable"  media="html" autolink="false" style="width:5%">
                                            <div class="dspText">
                                            <%--c:if test="${miListaId.OB_IAX_AUTDISPOSITIVOS.CVEHB7 == 0 }"
                                                <a href="javascript:f_abrir_axisctr208('${miListaId.OB_IAX_AUTDISPOSITIVOS.CDISPOSITIVO}');">--%>
                                                    <img border="0" onclick="f_abrir_axisctr208('${miListaId.OB_IAX_AUTDISPOSITIVOS.CDISPOSITIVO}','EDITAR')" alt="<axis:alt f="axisctr206" c="NUEVO" lit="9000552"/>" title="<axis:alt f="axisctr206" c="NUEVO" lit="9000552"/>" src="images/lapiz.gif"/>
                                               <%--  </a>
                                           /c:if--%>
                                            </div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible c="BORRAR_DISPOSITIVO" f="axisctr206">
                                        <display:column title="" sortable="true" sortProperty="NUEVO" headerClass="sortable"  media="html" autolink="false" style="width:5%">
                                            <div class="dspText">
                                            <%--c:if test="${miListaId.OB_IAX_AUTDISPOSITIVOS.CVEHB7 == 0 }"
                                                <a href="javascript:f_abrir_axisctr208('${miListaId.OB_IAX_AUTDISPOSITIVOS.CDISPOSITIVO}');">--%>
                                                    <img title="<axis:alt f="axisctr059" c="BORRAR_DISPOSITIVO" lit="1000127"/>" border="0" onclick="f_borrarDispositivo('${miListaId.OB_IAX_AUTDISPOSITIVOS.CVERSION}','${miListaId.OB_IAX_AUTDISPOSITIVOS.CDISPOSITIVO}','<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}'  value='${miListaId.OB_IAX_AUTDISPOSITIVOS.IVALDISP}'/>')"  src="images/delete.gif"/>
                                               <%--  </a>
                                           /c:if--%>
                                            </div>
                                        </display:column>
                                    </axis:visible>
                                    
                                    
                                </display:table>
                                </div>	
                            </td>
                        </tr>
                       
                        <%--tr>
                            <td> 
                                <table>
                                    <tr>	
                                        <th style="width:80%;height:0px"></th>
                                        <th style="width:10%;height:0px"></th>
                                        <th style="width:10%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        
                                        <td class="campocaja" style="text-align:right;vertical-align: middle"><b><axis:alt f="axisctr206" c="TOTAL" lit="1000529" /></b></td>
                                        <td class="campocaja">
                                            <input type="text" name="TOTAL" id="TOTAL"  <axis:atr f="axisctr206" c="CSERIE" a="modificable=false"/> value="<fmt:formatNumber value="${__formdata.TOTAL}" pattern="0.00" />"  class="campowidthinput campo campotexto"/> 
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr--%>     
                    </table> 
                </td>
             </tr>
             <tr>
                <td>
                
                    <c:if test="${isaxisctr208Embedded == 'true' && !empty sessionScope.mostrarAxisctr208Embed}">
                        <div id="axisctr208_embed">
                          <jsp:include page="axisctr208.jsp">
                            <jsp:param name="embedded" value="${isaxisctr208Embedded}"/>
                          </jsp:include>
                        </div>
                    </c:if>
                </td>
             </tr>
            
        </table>	
        <div class="separador">&nbsp;</div>

        <c:if test="${isaxisctr208Embedded == 'false' || empty sessionScope.mostrarAxisctr208Embed}">
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr206</c:param><c:param name="f">axisctr206</c:param>
                <c:param name="f">axisctr206</c:param>
                <c:param name="__botones"><axis:visible c="BT_CANCELAR" f="axisctr206">cancelar,</axis:visible><axis:visible c="BT_ANYADIR" f="axisctr206">9904983,</axis:visible><axis:visible c="BT_ACEPTAR" f="axisctr206">aceptar</axis:visible></c:param>                
            </c:import>
        </c:if>
    </form>
    <c:import url="../include/mensajes.jsp" />
</div>
    </body>
</html>

