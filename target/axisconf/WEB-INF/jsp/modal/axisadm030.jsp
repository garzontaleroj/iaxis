<%/*
*  Fichero: axisadm030.jsp
*
*  Fecha: 05/03/2009
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
    <title><axis:alt f="axisadm025" c="titulo" lit="9001162"/></title> <%-- Tratamiento de recibos --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
   
    <style type="text/css">
        .displayspaceMaximo {
            width:99.8%;
            height: expression( this.scrollHeight > 349 ? "350px" : "auto" );
            max-height:350px;
            overflow-x: hidden;
            overflow-y: auto;
            border: 1px solid #DDDDDD;
        }
    </style>

    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {             
            var recibos = document.miForm.LST_RECIBOS; 
            var marcados = "${requestScope.MARCADOS}";
            
            var P_REDO = "${requestScope.P_REDO}";
            if (P_REDO == "0") {
                if (confirm("<axis:alt f="axisadm030" c="CONFIRM" lit="9001153"/>")) {
                
                    var inputs=document.getElementsByTagName("input");
                    var recibos="";               
                    for(i=0;i<inputs.length;i++){
                        if (inputs[i].type=="checkbox") {
                            if (inputs[i].checked && inputs[i].name.indexOf("checkboxNRECIBO_"==0)) {
                                recibos=recibos+inputs[i].id.substring(16);
                                recibos=recibos+";";
                            }
                        }
                    }                  
                    objUtiles.ejecutarFormulario ("modal_axisadm030.do?OK=1&recibos="+recibos, "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            } else {
                     var F_GESTION_RECIBOS_RETURN = "${requestScope.F_GESTION_RECIBOS_RETURN}";                                           
                        if (!objUtiles.estaVacio(F_GESTION_RECIBOS_RETURN)  ) {
                              var IMPCODAsessio = "${sessionScope.IMPCODAsessio}";
                              var IMPCODA = "${__formdata.IMPCODA}";                              
                              if (!objUtiles.estaVacio(IMPCODAsessio)){                 
                                    parent.f_aceptar_modal("axisadm030"); 
                                    }
                                    }
                                    
            }
            
            revisarEstilos();
            f_cargar_propiedades_pantalla();
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal("axisadm030");
        }
        
        function f_but_aceptar() {
            if (objUtiles.estaVacio(objDom.getValorPorId("NRECIBO")))
                alert("<axis:alt f="axisadm030" c="CONFIRM" lit="1000413"/>"); 
            else{
                var inputs=document.getElementsByTagName("input");
                var recibos="";
               
                for(i=0;i<inputs.length;i++){
                    if (inputs[i].type=="checkbox") {                                            
                        if (inputs[i].checked && inputs[i].name.indexOf("checkboxNRECIBO_"==0)) {
                           recibos=recibos+inputs[i].id.substring(16);
                           recibos=recibos+";";
                         }
                    }
                }
                //-------------------
             
                      var IMPCODAsessio = "${sessionScope.IMPCODAsessio}";
                      var IMPCODA = "${__formdata.IMPCODA}";                      
                      if (!objUtiles.estaVacio(IMPCODAsessio)){                 
                        if(IMPCODA > 0) {
                            
                            if (confirm("<axis:alt f="axisadm030" c="CONFIRM" lit="9901227"/>")) {  
                                objUtiles.ejecutarFormulario ("modal_axisadm030.do?recibos="+recibos, "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);                                
                                }else{
                                    //DoNothing.                                  
                                }                              
                            }
                            else{
                                objUtiles.ejecutarFormulario ("modal_axisadm030.do?recibos="+recibos, "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
                            }
             
                  }                 
            }
        }
        
        function f_actualitzarImports(NRECIBO,CMARCADO,IPAGO){        
            objUtiles.ejecutarFormulario ("modal_axisadm030.do?NRECIBOseleccionat="+NRECIBO+"&CMARCADO="+CMARCADO+"&IPAGOintr="+IPAGO, "actualitzarImports", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
       
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="SPROCES" id="SPROCES" value="${__formdata.SPROCES}"/>
        <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}"/>
        <input type="hidden" name="NNUMLIN" id="NNUMLIN" value="${__formdata.NNUMLIN}"/>
        <input type="hidden" name="CBANCAR1" id="CBANCAR1" value="${__formdata.CBANCAR1}"/>
        <input type="hidden" name="NNUMORD" id="NNUMORD" value="${__formdata.NNUMORD}"/>
        <input type="hidden" name="NRECIBO" id="NRECIBO" value="${__formdata.NRECIBO}"/>

        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisadm030" c="titulo" lit="9001162"/></c:param>     <%-- Tratamiento de recibos --%>
                <c:param name="formulario"><axis:alt f="axisadm030" c="formulario" lit="9001162"/></c:param> <%-- Tratamiento de recibos --%>
                <c:param name="form">axisadm030</c:param>
        </c:import>        

        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    
                    <table class="seccion" cellpadding="0" cellspacing="0">
                    <tr>
                            <th style="width:3%;height:0px"></th>
                            <th style="width:48%;height:0px"></th>
                            <th style="width:48%;height:0px"></th>

                        </tr>
                        <tr>
                        <td></td>
                            <td colspan="2">                            
                                <c:set var="title0"><axis:alt f="axisadm030" c="titulo0" lit="100836"/></c:set>   <%-- Póliza --%>
                                <c:set var="title2"><axis:alt f="axisadm030" c="titulo2" lit="101332"/></c:set>   <%-- F. Efecto --%>                                 
                                <c:set var="title3"><axis:alt f="axisadm030" c="titulo3" lit="102526"/></c:set>   <%-- F. vencim. --%>                                 
                                <c:set var="title4"><axis:alt f="axisadm030" c="titulo4" lit="100563"/></c:set>   <%-- Importe --%>                                 
                              	<c:set var="title6"><axis:alt f="axisadm030" c="titulo6" lit="9000475"/></c:set>   <%-- Importe --%>     
                             	<c:set var="title5"><axis:alt f="axisadm030" c="titulo5" lit="9000966"/></c:set>   <%-- Importe --%>     
                                <c:set var="title55"><axis:alt f="axisadm030" c="titulo55" lit="1000553"/></c:set>   <%-- estado recibo --%>     
                                <c:set var="title56"><axis:alt f="axisadm030" c="titulo56" lit="102302"/></c:set>   <%-- tipo recibo --%>                                                     

                                <div id="dt_recibos" class="seccion displayspaceGrande">
                                    <display:table name="${sessionScope.LST_RECIBOS}" id="LST_RECIBOS" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="modal_axisadm030.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="" sortable="false" style="width:5%;" sortProperty="" headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >
                                            <div class="dspIcons">
                                                <input type="checkbox" id="checkboxNRECIBO_${LST_RECIBOS.NRECIBO}_${LST_RECIBOS.IPAGO}" name="checkboxNRECIBO"  
                                                value="${LST_RECIBOS.NRECIBO}" 
                                                onclick="objDom.setValorPorId('NRECIBO', this.value);f_actualitzarImports('${LST_RECIBOS.NRECIBO}',this.checked ? 1: 0,'${LST_RECIBOS.IPAGO}');"
                                                <c:if test="${LST_RECIBOS.MARCADO == 1}"> checked="checked"</c:if>/>

                                            </div>
                                        </display:column>

                                        <display:column title="${title0}" sortable="true" style="width:10%;" sortProperty="NPOLIZA" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${LST_RECIBOS.NPOLIZA}
                                            </div>
                                        </display:column>
                                        <display:column title="${title56}" sortable="true" sortProperty="TTIPREC" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${LST_RECIBOS.TTIPREC}
                                            </div>
                                        </display:column>
                                        <display:column title="${title55}" sortable="true" sortProperty="TESTREC" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${LST_RECIBOS.TESTREC}
                                            </div>
                                        </display:column>
                                        <display:column title="${title1}" sortable="true" style="width:10%;" sortProperty="NRECIBO" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${LST_RECIBOS.NRECIBO}
                                            </div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="true" style="width:10%;" sortProperty="FEFECTO" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                <fmt:formatDate value="${LST_RECIBOS.FEFECTO}" pattern="dd/MM/yyyy"/>
                                            </div>
                                        </display:column>
                                        <display:column title="${title3}" sortable="true" style="width:10%;" sortProperty="FVENCIM" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                <fmt:formatDate value="${LST_RECIBOS.FVENCIM}" pattern="dd/MM/yyyy"/>
                                            </div>
                                        </display:column>
                                        <display:column title="${title4}" sortable="true" style="width:10%;" sortProperty="ITOTALR" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspNumber">                                                
                                                <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${LST_RECIBOS.ITOTALR}"/>                                 
                                            </div>
                                        </display:column>
                                        <display:column title="${title5}" sortable="true" style="width:10%;" sortProperty="IMPPENDIENTE" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspNumber">                                                
                                                <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${LST_RECIBOS.IMPPENDIENTE}"/>                                 
                                            </div>
                                        </display:column>
                                         <display:column title="${title6}" sortable="true" style="width:10%;" sortProperty="IPAGO" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspNumber">      
                                              <input type="text" onchange="f_actualitzarImports('${LST_RECIBOS.NRECIBO}','${LST_RECIBOS.MARCADO}',this.value);" 
                                              class="campowidthinput campo campotexto" size="15" style="width:80%;"  
                                              <c:if test="${empty LST_RECIBOS.MARCADO || LST_RECIBOS.MARCADO == 0}">readonly</c:if>                              
                                                value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${LST_RECIBOS.IPAGO}"/>"                                 
                                                name="IPAGO" id="IPAGO" />
                                                                               
                                            </div>
                                        </display:column>
                                    </display:table>     
                                    <c:choose>
                                        <c:when test="${!empty requestScope.LST_RECIBOS}">
                                            <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                                <script language="javascript">objUtiles.retocarDsptagtable("LST_RECIBOS");</script>
                                            </c:if>
                                        </c:when>
                                        <c:otherwise>
                                            <script language="javascript">
                                               objLista.esconderListaSpans();
                                               objLista.esconderListaLinks();     
                                            </script>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </td>
                        </tr>
                        <tr>
                        <td></td>
                        <td class="campocaja">
                        <br>
                        <b><axis:alt f="axisadm030" c="CODA" lit="100563"/> (CODA) : <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${sessionScope.IMPCODAsessio}"/></b>
                            <input type="hidden" id="IMPCODAinicial" name="IMPCODAinicial" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${sessionScope.IMPCODAsessio}"/>">
                            </td>   
                         <td class="campocaja" align="right">
                        <br>
                        <b><axis:alt f="axisadm030" c="IMPCODA" lit="1000529"/> : <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IMPTOTAL}"/></b>
                             <input type="hidden" id="IMPCODA" name="IMPCODA" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IMPCODA}"/>">
                            </td>     
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axisadm030</c:param>
            <c:param name="__botones">cancelar<c:if test="${!empty sessionScope.LST_RECIBOS}">,aceptar</c:if></c:param> 
        </c:import>

    </form>
    
    <c:import url="../include/mensajes.jsp"/>

</body>
</html>