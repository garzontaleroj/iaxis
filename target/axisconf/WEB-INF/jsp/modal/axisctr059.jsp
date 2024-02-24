<%
/*
*  Fichero: axisctr059.jsp
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
    <c:set var="isAxisctr070Embedded" value="true"/>
    <script language="Javascript" type="text/javascript">
    if (document.all) { // IE
            document.onkeydown = function(e) {  
                if(window.event){        
                    if (!e) var e = window.event;
                    var elemName = e.srcElement.name;
                    var elemVal = eval ("document.axisctr059Form."+elemName+".readOnly");
                    var elemVal2 = eval ("document.axisctr059Form."+elemName+".disabled");
                    if ( (window.event && window.event.keyCode == 8) && (elemVal==true || elemVal2==true)) {
                        return false;  //Sólo lo anulará si está disabled el campo que lo lanza
                    }
                }
            }
        }else{           
            document.onkeydown = function(e) { 
                var preventKeyPress;
                if (e.keyCode == 8) {
                    var d = e.srcElement || e.target;
                    if (d.tagName.toUpperCase() == 'INPUT' || d.tagName.toUpperCase() == 'TEXTAREA') {
                        var preventPressBasedOnType = false;
                        if (d.attributes["type"]) {
                            var type = d.attributes["type"].value.toLowerCase();
                            preventPressBasedOnType = (type == "radio" || type == "checkbox" || type == "submit");
                        }
                        preventKeyPress = d.readOnly || d.disabled || preventPressBasedOnType;
                    }
                    else
                        preventKeyPress = true;
                }
                else
                    preventKeyPress = false;
            
                if (preventKeyPress)
                    e.preventDefault();
                 
            }
        }
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        function f_onload(){
          f_cargar_propiedades_pantalla();
          var total = "${__formdata.TOTAL}";
          
          var tot = "${TOT}";
           if ( !objUtiles.estaVacio(tot))
            document.getElementById("TOTAL").value = "<fmt:formatNumber value='${TOT}' pattern='${__formatNumberPatterns[__defaultCMONINT]}' />";
        }
       function f_but_cancelar() {
            parent.f_cerrar_axisctr059(document.getElementById("TOTAL").value);
        }
        
       // Primero miramos si hay alguna opción de la lista seleccionada
       <c:if test="${isAxisctr070Embedded == 'false' || empty sessionScope.mostrarAxisctr070Embed}">
       function f_but_aceptar() {            
            parent.f_aceptar_axisctr059(document.getElementById("TOTAL").value);
        }    
        </c:if> 
        
       function f_but_9001367(){
         f_abrir_axisctr070(null); 
       }
         
       function f_recuperarsubhitodata(CVERSION,CACCESORIO,TDESCRIPCION,IVALOR,CTIPACC,valor,CVEHB7,TOTAL,CASEGURABLE) {
        document.getElementById("subhitodata").src="modal_axisctr059.do?operation=selecAccesorio&CVERSION="+CVERSION+"&CACCESORIO="+CACCESORIO+"&TDESCRIPCION="+TDESCRIPCION+"&IVALOR="+IVALOR+"&CTIPACC="+CTIPACC+"&MARCADO="+valor+"&CVEHB7="+CVEHB7+"&TOTAL="+TOTAL+"&CASEGURABLE="+CASEGURABLE;
       }
               
        /****************************************************************************************/
        /********************************* MODAL AXISCTR070 *************************************/
        /****************************************************************************************/
        
        function f_abrir_axisctr070(CACCESORIO) {
        
            var isAxisctr070Embedded = "${isAxisctr070Embedded}";
            
            if (document.axisctr059Form.CVERSION == undefined){
            
                if (isAxisctr070Embedded == "true"){
                    objUtiles.ejecutarFormulario("modal_axisctr059.do?CACCESORIO="+CACCESORIO, "editarAccesorio",  document.axisctr059Form, "_self", objJsMessages.jslit_cargando);   
                }else{
                    objUtiles.abrirModal("axisctr070", "src", "modal_axisctr070.do?operation=form&CACCESORIO="+CACCESORIO, 800, 300);        
                }
            }else{
                //document.axisctr059Form.CVERSION.value = CVERSION;
                
                 if (isAxisctr070Embedded == "true")
                    objUtiles.ejecutarFormulario("modal_axisctr059.do?CACCESORIO="+CACCESORIO, "editarAccesorio",  document.axisctr059Form, "_self", objJsMessages.jslit_cargando);   
                else
                    objUtiles.abrirModal("axisctr070", "src", "modal_axisctr070.do?operation=form", 800, 300);   
                
            }
        
        }
        
        function f_cerrar_axisctr070() {
            // Cerrar modal y recargar la pantalla
            var isAxisctr070Embedded = "${isAxisctr070Embedded}";  
            if (isAxisctr070Embedded == "true")
                objUtiles.ejecutarFormulario("modal_axisctr059.do?esconderAxisctr070Embed=true", "form", document.axisctr059Form, "_self", objJsMessages.jslit_cargando);   
            else
                objUtiles.cerrarModal("axisctr070");
        }
            
        function f_aceptar_axisctr070() {
            // Cerrar modal y recargar la pantalla
            var isAxisctr070Embedded = "${isAxisctr070Embedded}";
            alert(isAxisctr070Embedded);
            if (isAxisctr070Embedded == "true") {
                objUtiles.ejecutarFormulario("modal_axisctr059.do?esconderAxisctr070Embed=true", "form", document.axisctr059Form, "_self", objJsMessages.jslit_cargando);                   
            } else {
                f_cerrar_axisctr070();
                objUtiles.ejecutarFormulario("modal_axisctr059.do", "form", document.axisctr059Form, "_self", objJsMessages.jslit_cargando, 800, 300);   
            }
        }
    function f_borrarAccesorio(CVERSION,CACCESORIO,IIVALPUBL) {
                objUtiles.ejecutarFormulario("modal_axisctr059.do?CACCESORIO="+CACCESORIO+"&IIVALPUBL="+IIVALPUBL, "borrarAccesorio", document.axisctr059Form, "_self", objJsMessages.jslit_cargando);   

        }
    </script>
  </head>
  <body onload="f_onload()">
  <div id="wrapper" class="wrapper">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="axisctr059Form" action="" method="POST">
        <input type="hidden" name="operation" value="">
        <input type="hidden" name="CVERSION" id="CVERSION" value="${__formdata.VERSION.CVERSION}">
        <input type="hidden" name="INSPECCION_VIGENTE" id="INSPECCION_VIGENTE" value="${__formdata.INSPECCION_VIGENTE}" />
        
        <c:set var="pantalla" value="axisctr059"/>
        <c:set var="literalPantalla" value="9001362"/>
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="producto"><axis:alt f="axisctr059" c="TIT_FORM" lit="9001362" /></c:param>
            <c:param name="formulario"><axis:alt f="axisctr059" c="TIT_FORM" lit="${literalPantalla}" /></c:param>
            <c:param name="form">${pantalla}</c:param>
        </c:import>
        
        <iframe name="subhitodata" id="subhitodata" src="blanco.html" style="width:100px;height:100px;visibility:hidden;display:none"></iframe>
        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
           <c:if test="${!empty __formdata.SERIE}">
            <tr>
                <td class="campocaja">
                    <div style="float:left;" ><img src="images/flecha.gif"/><b><axis:alt f="axisctr059" c="TIT_PANT" lit="9001348" /></b> </div>
                    <div style="float:right;" ><b>${__formdata.VERSION.TVERSION}</b></div>
                    <div style="clear:both;"><hr class="titulo"></div>
                    <table class="seccion">
                        <tr>
                            <td align="left" >
                                <table class="area" align="center">
                                    <tr>	
                                        <th style="width:14%;height:0px"></th>
                                        <th style="width:10%;height:0px"></th>
                                        <th style="width:10%;height:0px"></th>
                                        <th style="width:10%;height:0px"></th>
                                        <th style="width:5%;height:0px"></th>
                                        <th style="width:10%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                    </tr>
                                    <tr>
                                      <td class="campocaja"><!-- Código de serie -->
                                        <b><axis:alt f="axisctr059" c="CSERIE" lit="9001335" /></b>
                                      </td>
                                      <td class="campocaja"><!-- Código de serie -->
                                        <input type="text" name="CSERIE" id="CSERIE"  <axis:atr f="axisctr059" c="CSERIE" a="modificable=false"/> value="${__formdata.SERIE.CSERIE}"  class="campowidthinput campo campotexto"/> 
                                      </td>
                                    </tr>
                                    <tr>
                                      <td class="campocaja"><!-- Tapiceria -->
                                        <b><axis:alt f="axisctr059" c="TTAPICERIA" lit="9001336" /></b>
                                      </td>
                                      <td class="campocaja">
                                        <input type="text" name="TTAPICERIA" id="TTAPICERIA"  <axis:atr f="axisctr059" c="CSERIE" a="modificable=false"/> value="${__formdata.SERIE.TTAPICERIA}" class="campowidthinput campo campotexto"/> 
                                      </td>
                                      <td class="campocaja"><!-- Lector CD -->
                                        <b><axis:alt f="axisctr059" c="TCD" lit="9001337" /></b>&nbsp;
                                      </td>
                                      <td class="campocaja">
                                        <input type="text" name="TCD" id="TCD"  <axis:atr f="axisctr059" c="CSERIE" a="modificable=false"/> value="${__formdata.SERIE.TCD}"  class="campowidthinput campo campotexto"/> 
                                      </td>
                                      <td class="campocaja">
                                        <b><axis:alt f="axisctr059" c="TEQUIPAMIENTO" lit="9001338" /></b>
                                      </td>
                                      <td class="campocaja"><!-- Equipamiento -->
                                        <input type="text" name="TEQUIPAMIENTO" id="TEQUIPAMIENTO"  <axis:atr f="axisctr059" c="CSERIE" a="modificable=false"/> value="${__formdata.SERIE.TEQUIPAMIENTO}"  class="campowidthinput campo campotexto"/> 
                                      </td>
                                    </tr>
                                    <tr>
                                      <td class="campocaja"><!-- Caja cambios -->
                                        <b><axis:alt f="axisctr059" c="TCAMBIO" lit="9001339" /></b>
                                      </td>
                                      <td class="campocaja"><!-- Caja cambios -->
                                        <input type="text" name="TCAMBIO" id="TCAMBIO"  <axis:atr f="axisctr059" c="CSERIE" a="modificable=false"/> value="${__formdata.SERIE.TCAMBIO}"  class="campowidthinput campo campotexto"/> 
                                      </td>
                                      <td class="campocaja"><!-- Navegador -->
                                        <b><axis:alt f="axisctr059" c="TNAVEGADOR" lit="9001340" /></b>
                                      </td>
                                      <td class="campocaja"><!-- Navegador -->
                                        <input type="text" name="TNAVEGADOR" id="TNAVEGADOR"  <axis:atr f="axisctr059" c="CSERIE" a="modificable=false"/> value="${__formdata.SERIE.TNAVEGADOR}"  class="campowidthinput campo campotexto"/> 
                                      </td>
                                      <td class="campocaja"><!-- Llantas -->
                                        <b><axis:alt f="axisctr059" c="TLLANTA" lit="9001341" /></b>
                                      </td>
                                      <td class="campocaja"><!-- Llantas -->
                                        <input type="text" name="TLLANTA" id="TLLANTA"  <axis:atr f="axisctr059" c="CSERIE" a="modificable=false"/> value="${__formdata.SERIE.TLLANTA}"  class="campowidthinput campo campotexto"/> 
                                      </td>
                                    </tr>
                                    <tr>
                                      <td class="campocaja"><!-- Control trac. -->
                                        <b><axis:alt f="axisctr059" c="TTRANCION" lit="9001342" /></b>
                                      </td>
                                      <td class="campocaja"><!-- Control trac. -->
                                        <input type="text" name="TTRANCION" id="TTRANCION"  <axis:atr f="axisctr059" c="CSERIE" a="modificable=false"/> value="${__formdata.SERIE.TTRANCION}"  class="campowidthinput campo campotexto"/> 
                                      </td>
                                      <td class="campocaja"><!-- Climatizador -->
                                        <b><axis:alt f="axisctr059" c="TCLIMATIZA" lit="9001343" /></b>
                                      </td>
                                      <td class="campocaja"><!-- Climatizador -->
                                        <input type="text" name="TCLIMATIZA" id="TCLIMATIZA"  <axis:atr f="axisctr059" c="CSERIE" a="modificable=false"/> value="${__formdata.SERIE.TCLIMATIZA}"  class="campowidthinput campo campotexto"/> 
                                      </td>
                                      <td class="campocaja"><!-- Faros -->
                                        <b><axis:alt f="axisctr059" c="TBOMBILLAF" lit="9001344" /></b>
                                      </td>
                                      <td class="campocaja"><!-- Faros -->
                                        <input type="text" name="TBOMBILLAF" id="TBOMBILLAF"  <axis:atr f="axisctr059" c="CSERIE" a="modificable=false"/> value="${__formdata.SERIE.TBOMBILLAF}"  class="campowidthinput campo campotexto"/> 
                                      </td>
                                    </tr>
                                    <tr>
                                      <td class="campocaja"><!--Embrague Aut. -->
                                        <b><axis:alt f="axisctr059" c="TEMBRAUT" lit="9001345" /></b>
                                      </td>
                                      <td class="campocaja"><!--Embrague Aut. -->
                                        <input type="text" name="TEMBRAUT" id="TEMBRAUT"  <axis:atr f="axisctr059" c="CSERIE" a="modificable=false"/> value="${__formdata.SERIE.TEMBRAUT}"  class="campowidthinput campo campotexto"/> 
                                      </td>
                                      <td class="campocaja"><!-- Aire Acondicionado -->
                                        <b><axis:alt f="axisctr059" c="TAIREACOND" lit="9001346" /></b>
                                      </td>
                                      <td class="campocaja"><!-- Aire Acondicionado -->
                                       <input type="text" name="TAIREACOND" id="TAIREACOND"  <axis:atr f="axisctr059" c="CSERIE" a="modificable=false"/> value="${__formdata.SERIE.TAIRECOND}"  class="campowidthinput campo campotexto"/> 
                                      </td>
                                      <td class="campocaja"><!-- ABS -->
                                        <b><axis:alt f="axisctr059" c="TABS" lit="9001347" /></b>
                                      </td>
                                      <td class="campocaja"><!-- ABS -->
                                        <input type="text" name="TABS" id="TABS"  <axis:atr f="axisctr059" c="CSERIE" a="modificable=false"/> value="${__formdata.SERIE.TABS}"  class="campowidthinput campo campotexto"/> 
                                      </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table> 
                </td>
            </tr>
           </c:if> 
            <tr>
                <td class="campocaja">
                <div class="separador">&nbsp;</div>
                 <div  class="titulo">
                 <div style="float:left;" >
                 <img src="images/flecha.gif"/><b><axis:alt f="axisctr059" c="TVERSION" lit="9001361" />
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
                                <c:set var="title1"><axis:alt f="axisctr059" c="TACCESORIO" lit="9001364"/></c:set>
                                <c:set var="title11"><axis:alt f="axisctr059" c="CACCESORIO" lit="9001364"/></c:set>
                                <c:set var="title2"><axis:alt f="axisctr059" c="IVALACC" lit="9001365"/></c:set>
                                <c:set var="title3"><axis:alt f="axisctr059" c="CASEGURABLE" lit="9904752"/></c:set>
                                <c:set var="title4"><axis:alt f="axisctr059" c="TTIPACC" lit="9001451"/></c:set>
                                
                                <div class="seccion displayspacePersonas">
                                <display:table name="${sessionScope.NO_SERIE}" id="miListaId" export="false" class="dsptgtable" pagesize="15" defaultsort="1" 
                                               defaultorder="ascending" 
                                               requestURI="modal_axisctr059.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <axis:visible c="MARCADO" f="axisctr059">
                                        <display:column title="" sortable="false" sortProperty="MARCADO" headerClass="headwidth sortable"  media="html" autolink="false" >    
                                            <div class="dspIcons"><input <axis:atr f="axisctr059" c="MARCADO" a="modificable=true"/> <c:if test="${miListaId.OB_IAX_AUTACCESORIOS.CMARCADO==1}">checked</c:if> type="checkbox" id="seleccionaAccesorio" name="seleccionaAccesorio" value="" onclick="f_recuperarsubhitodata('${__formdata.VERSION.CVERSION}','${miListaId.OB_IAX_AUTACCESORIOS.CACCESORIO}','${miListaId.OB_IAX_AUTACCESORIOS.TDESACC}','${miListaId.OB_IAX_AUTACCESORIOS.IVALACC}','${miListaId.OB_IAX_AUTACCESORIOS.CTIPACC}',this.checked,'${miListaId.OB_IAX_AUTACCESORIOS.CVEHB7}',axisctr059Form.TOTAL.value,'${miListaId.OB_IAX_AUTACCESORIOS.CASEGURABLE}')"/></div>
                                        </display:column>   
                                    </axis:visible>
                                    <axis:visible c="TACCESORIO" f="axisctr059">
                                     <display:column title="${title11}" sortable="true" sortProperty="OB_IAX_AUTACCESORIOS.TACCESORIO" headerClass="sortable"  
                                                     media="html" autolink="false">
                                        <div class="dspText">${miListaId.OB_IAX_AUTACCESORIOS.TACCESORIO}</div>
                                    </display:column>
                                    </axis:visible>
                                    
                                    
                                    <axis:visible c="TTIPACC" f="axisctr059">
                                    <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_AUTACCESORIOS.TTIPACC" headerClass="sortable"  media="html" autolink="false">
                                        <div class="dspText">${miListaId.OB_IAX_AUTACCESORIOS.TTIPACC}</div>
                                    </display:column>
                                    </axis:visible>
                                    
                                    <axis:visible c="TDESACC" f="axisctr059">
                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_AUTACCESORIOS.TDESACC" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText">${miListaId.OB_IAX_AUTACCESORIOS.TDESACC}</div>
                                    </display:column>
                                    </axis:visible>
                                    <axis:visible c="CASEGURABLE" f="axisctr059">
                                    <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_AUTACCESORIOS.CASEGURABLE" headerClass="sortable"  media="html" autolink="false">
                                        <div class="dspText">
                                        <input type="checkbox" value = "${miListaId.OB_IAX_AUTACCESORIOS.CASEGURABLE}" class="campocaja" disabled
                                        <c:if test="${miListaId.OB_IAX_AUTACCESORIOS.CASEGURABLE == 1}">checked </c:if>>
                                        
                                        
                                        </div>
                                    </display:column>
                                    </axis:visible>
                                    <axis:visible c="IVALACC" f="axisctr059">
                                    <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_AUTACCESORIOS.IVALACC" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText"><fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}'  value='${miListaId.OB_IAX_AUTACCESORIOS.IVALACC}'/></div>
                                    </display:column>
                                    </axis:visible>
                                    
                                        <axis:visible c="EDIT_ACCESORIO" f="axisctr059">
                                            <display:column title="" sortable="true" sortProperty="NUEVO" headerClass="sortable"  media="html" autolink="false" style="width:5%">
                                                <div class="dspText">
                                                <%--c:if test="${miListaId.OB_IAX_AUTACCESORIOS.CVEHB7 == 0 }"
                                                    <a href="javascript:f_abrir_axisctr070('${miListaId.OB_IAX_AUTACCESORIOS.CACCESORIO}');">--%>
                                                <c:if test="${!(__formdata.INSPECCION_VIGENTE eq 1 && miListaId.OB_IAX_AUTACCESORIOS.CASEGURABLE eq 1)}">
                                                        <img border="0" onclick="f_abrir_axisctr070('${miListaId.OB_IAX_AUTACCESORIOS.CACCESORIO}')" alt="<axis:alt f="axisctr059" c="NUEVO" lit="9001369"/>" title="<axis:alt f="axisctr059" c="NUEVO" lit="9001369"/>" src="images/lapiz.gif"/>
                                                </c:if>                                       
                                                   <%--  </a>
                                               /c:if--%>
                                                </div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible c="BORRAR_ACCESORIO" f="axisctr059">
                                            <display:column title="" sortable="true" sortProperty="NUEVO" headerClass="sortable"  media="html" autolink="false" style="width:5%">
                                                <div class="dspText">
                                                <%--c:if test="${miListaId.OB_IAX_AUTACCESORIOS.CVEHB7 == 0 }"
                                                    <a href="javascript:f_abrir_axisctr070('${miListaId.OB_IAX_AUTACCESORIOS.CACCESORIO}');">--%>                                                    
                                                        <img title="<axis:alt f="axisctr059" c="BORRAR_ACCESORIO" lit="1000127"/>" border="0" onclick="f_borrarAccesorio('${miListaId.OB_IAX_AUTACCESORIOS.CVERSION}','${miListaId.OB_IAX_AUTACCESORIOS.CACCESORIO}','<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}'  value='${miListaId.OB_IAX_AUTACCESORIOS.IVALACC}'/>')"  src="images/delete.gif"/>
                                                    <%--  </a>
                                               /c:if--%>
                                                </div>
                                            </display:column>
                                        </axis:visible>
                                    
                                </display:table>
                                </div>	
                            </td>
                        </tr>
                       
                        <tr>
                            <td> 
                                <table>
                                    <tr>	
                                        <th style="width:80%;height:0px"></th>
                                        <th style="width:10%;height:0px"></th>
                                        <th style="width:10%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        
                                        <td class="campocaja" style="text-align:right;vertical-align: middle"><b><axis:alt f="axisctr059" c="TOTAL" lit="1000529" /></b></td>
                                        <td class="campocaja">
                                            <input type="text" name="TOTAL" id="TOTAL"  <axis:atr f="axisctr059" c="CSERIE" a="modificable=false"/> value="<fmt:formatNumber value="${__formdata.TOTAL}" pattern="${__formatNumberPatterns[__defaultCMONINT]}" />"  class="campowidthinput campo campotexto"/> 
                                            
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>     
                    </table> 
                </td>
             </tr>
             <tr>
                <td>
                    <c:if test="${isAxisctr070Embedded == 'true' && !empty sessionScope.mostrarAxisctr070Embed}">
                        <div id="axisctr070_embed">
                          <jsp:include page="axisctr070.jsp">
                            <jsp:param name="embedded" value="${isAxisctr070Embedded}"/>
                          </jsp:include>
                        </div>
                    </c:if>
                </td>
             </tr>
            
        </table>	
        <div class="separador">&nbsp;</div>

        <c:if test="${isAxisctr070Embedded == 'false' || empty sessionScope.mostrarAxisctr070Embed}">
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr059</c:param><c:param name="f">axisctr059</c:param>
                <c:param name="f">axisctr059</c:param>
                <c:param name="__botones"><axis:visible c="BT_CANCELAR" f="axisctr059">cancelar,</axis:visible><axis:visible c="BT_ANYADIR" f="axisctr059">9001367,</axis:visible><axis:visible c="BT_ACEPTAR" f="axisctr059">aceptar</axis:visible></c:param>
            </c:import>
        </c:if>
    </form>
    <c:import url="../include/mensajes.jsp" />
</div>
    </body>
</html>