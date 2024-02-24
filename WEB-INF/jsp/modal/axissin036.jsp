<%/*
*  Fichero: Axissin036.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a> 
*
*  Fecha: 14/12/2009
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    
    <!--********** CALENDARIO ************************* -->
        <!-- Hoja de estilo del Calendario -->
        <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
        <!-- Script principal del calendario -->
        <script type="text/javascript" src="scripts/calendar.js"></script>
        <!-- Idioma del calendario, en función del Locale -->
        <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <!-- Setup del calendario -->
        <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        <!--*********************************** -->
    
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

       function f_but_cancelar() {
            parent.f_cerrar_axissin036();
       }
       
       function f_grabar_cabecera(){
            objUtiles.ejecutarFormulario("modal_axissin036.do", "grabar_cabecera", document.miForm, "_self");
       }
        
       function f_onload(){
       
            <c:if test="${!empty __formdata.CEVENTO}">
                 objDom.setDisabledPorId("CEVENTO",true);
            </c:if>
            
            <c:if test="${!empty __formdata.CAMPO}">
                var CAMPO = "${__formdata.CAMPO}";
                var camp = CAMPO.substr(0,7);
                var pos = CAMPO.substr(8);
                var sizearray = "${fn:length(LISTAIDIOMAS)}";
                
                if( camp == 'TTITEVE'){
                    document.getElementById('TEVENTO_'+pos).focus();
                }
                else{
                    if (sizearray > eval(pos)+1){
                        pos = eval(pos)+1;
                    }
                    document.getElementById('TTITEVE_'+pos).focus();
                }
            </c:if>
            f_cargar_propiedades_pantalla();
            
       }
       
       function f_grabar_detalle(PCEVENTO,PCIDIOMA,PTTITEVE,PTEVENTO,CAMPO,IDIOMAS){
            if (!objUtiles.estaVacio(document.miForm.CEVENTO.value)){
                objUtiles.ejecutarFormulario("modal_axissin036.do?PCEVENTO="+PCEVENTO+"&PCIDIOMA="+PCIDIOMA+"&PTTITEVE="+PTTITEVE+"&PTEVENTO="+PTEVENTO+"&CAMPO="+CAMPO+"&IDIOMAS="+IDIOMAS, "grabar_detalle", document.miForm, "_self");
            }else {
                alert("<axis:alt f='axissin036' c='CAMPO' lit='109373'/> <axis:alt f='axissin036' c='CEVENTO' lit='9900810'/>. <axis:alt f='axissin036' c='OBLIGATORIO' lit='1000165'/>");
            } 
       }
       
       function f_but_aceptar(){
            if (objValidador.validaEntrada()) {
                f_grabar_cabecera();
                parent.f_but_aceptar_axissin036(document.miForm.CEVENTO.value);
            }
       }
       
       function f_borrar_detalle(){
            if (!objUtiles.estaVacio(document.miForm.CEVENTO.value)){
                objUtiles.ejecutarFormulario("modal_axissin036.do?PCEVENTO="+document.miForm.CEVENTO.value, "borrar_detalle", document.miForm, "_self");
            }else {
                alert("<axis:alt f='axissin036' c='CAMPO' lit='109373'/> <axis:alt f='axissin036' c='CEVENTO' lit='9900810'/>. <axis:alt f='axissin036' c='OBLIGATORIO' lit='1000165'/>");
            }
            
       }
        
    </script>
  </head>
    <body onload="f_onload()" class=" ">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value="">
            <input type="hidden" name="CODEVENTO" value="${__formdata.CEVENTO}">
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axissin036" c="TIT_FORMULARI" lit="9900842" /></c:param>
                <c:param name="producto"><axis:alt f="axissin036" c="TIT_PRODUCTE" lit="9900842" /></c:param>
                <c:param name="form">Axissin036</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">    
                            <tr>
                                <td align="left" >
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:30%;height:0px"></th>
                                            <th style="width:10%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <!-- Codigo Evento -->
                                            <axis:ocultar f="axissin036" c="CEVENTO" dejarHueco="false">
                                            <td class="titulocaja" id="" >
                                                <b><axis:alt f="axissin036" c="CEVENTO" lit="9900810"></axis:alt></b>
                                            </td>
                                            </axis:ocultar>
                                            <!-- Fecha inicio -->
                                            <axis:ocultar f="axissin036" c="FECHAINI" dejarHueco="false">
                                            <td class="titulocaja" id="" >
                                                <b><axis:alt f="axissin036" c="FECHAINI" lit="9000526"></axis:alt></b>
                                            </td>
                                            </axis:ocultar>
                                            <!-- Fecha fin -->
                                            <axis:ocultar f="axissin036" c="FECHAFIN" dejarHueco="false">
                                            <td class="titulocaja" id="" >
                                                <b><axis:alt f="axissin036" c="FECHAFIN" lit="9000527"></axis:alt></b>
                                            </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axissin036" c="CEVENTO" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" style="width:75%" name="CEVENTO" id="CEVENTO" onchange="f_grabar_cabecera()" 
                                                      <axis:atr f="axissin036" c="CEVENTO" a="modificable=truee&obligatorio=true"/> 
                                                      value="${__formdata.CEVENTO}"  class="campowidthinput campo campotexto_ob"
                                                      title="<axis:alt f='axissin036' c='CEVENTO' lit='9900810'/>" /> 
                                           </td>
                                           </axis:ocultar>
                                           <axis:ocultar f="axissin036" c="FECHAINI" dejarHueco="false">
                                            <td class="campocaja" >
                                                <input type="text" formato="fecha" name="FECHAINI" id="FECHAINI" style="width:80px;"   value="<fmt:formatDate value="${__formdata.FECHAINI}" pattern="dd/MM/yyyy" />" class="campowidthinput campo campotexto_ob"/>
                                                <a id="icon_FECHAINI" style="vertical-align:middle;">
                                                <img alt="<axis:alt f='axissin036' c='FECHAINI' lit='9000526'/>" title="<axis:alt f='axissin036' c='FECHAINI' lit='9000526'/>" src="images/calendar.gif"/></a>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axissin036" c="FECHAFIN" dejarHueco="false">
                                            <td class="campocaja" >
                                                <input type="text" formato="fecha" name="FECHAFIN" id="FECHAFIN" style="width:80px;"   value="<fmt:formatDate value="${__formdata.FECHAFIN}" pattern="dd/MM/yyyy" />" class="campowidthinput campo campotexto"/>
                                                <a id="icon_FECHAFIN" style="vertical-align:middle;">
                                                <img alt="<axis:alt f='axissin036' c='FECHAFIN' lit='9000527'/>" title="<axis:alt f='axissin036' c='FECHAFIN' lit='9000527'/>" src="images/calendar.gif"/></a>
                                            </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <div class="separador">&nbsp;</div>
                                            <!-- DisplayTag ListaPersonas -->
                                            <c:set var="title1"><axis:alt f="axissin036" c="TIDIOMA" lit="1000246" /></c:set>
                                            <c:set var="title2"><axis:alt f="axissin036" c="TTITEVE" lit="100785" /></c:set>
                                            <c:set var="title3"><axis:alt f="axissin036" c="TEVENTO" lit="100588" /></c:set>
                                            <div class="seccion displayspacePersonas">
                                            <%int i = 0;%>
                                                <display:table name="${requestScope.LISTAIDIOMAS}" id="miListaId" export="false" class="dsptgtable" pagesize="15" sort="list" requestURI="modal_axissin036.do?operation=form&paginar=true" excludedParams="*"  cellpadding="0" cellspacing="0">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <c:set var="i"><%=i%></c:set>
                                                    <axis:ocultar f="axissin036" c="TIDIOMA">
                                                    <display:column title="${title1}" style="width:15%"  headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId['TIDIOMA']}</div>
                                                    </display:column>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axissin036" c="TTITEVE">
                                                    <display:column title="${title2}" style="width:25%"  headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            <input type="text" name="TTITEVE" id="TTITEVE_${i}"  <axis:atr f="axissin036" c="TTITEVE" a="modificable=true"/> 
                                                                   value="${miListaId['TTITEVE']}"  class="campowidthinput campo campotexto_ob" onchange="f_grabar_detalle(document.miForm.CEVENTO.value,'${miListaId['CIDIOMA']}',this.value,'${miListaId['TEVENTO']}',this.id)"
                                                                   <axis:atr f="axissin036" c="TTITEVE" a="modificable=truee&obligatorio=true"/> 
                                                                   title="<axis:alt f='axissin036' c='TTITEVE' lit='100785' /> ${miListaId['TIDIOMA']}"/> 
                                                        </div>
                                                    </display:column>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axissin036" c="TEVENTO">
                                                    <display:column title="${title3}" style="width:50%"  headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            <input type="text" name="TEVENTO" id="TEVENTO_${i}"  <axis:atr f="axissin036" c="TEVENTO" a="modificable=true"/> 
                                                                   value="${miListaId['TEVENTO']}" onchange="f_grabar_detalle(document.miForm.CEVENTO.value,'${miListaId['CIDIOMA']}','${miListaId['TTITEVE']}',this.value,this.id)"  class="campowidthinput campo campotexto_ob"
                                                                   <axis:atr f="axissin036" c="TEVENTO" a="modificable=truee&obligatorio=true"/> 
                                                                   title="<axis:alt f='axissin036' c='TEVENTO' lit='100588' /> ${miListaId['TIDIOMA']}"/> 
                                                        </div>
                                                    </display:column>
                                                    </axis:ocultar>
                                                    <%i++;%>
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
            
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin036</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
            
            <script type="text/javascript">
            Calendar.setup({
            inputField     :    "FECHAINI",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FECHAINI", 
            singleClick    :    true,
            firstDay       :    1
            });
            </script>
            
            <script type="text/javascript">
            Calendar.setup({
            inputField     :    "FECHAFIN",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FECHAFIN", 
            singleClick    :    true,
            firstDay       :    1
            });
            </script>
            
        </form>
      <c:import url="../include/mensajes.jsp" />
    </body>
</html>

