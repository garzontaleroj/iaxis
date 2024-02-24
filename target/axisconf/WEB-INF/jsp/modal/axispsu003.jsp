<%
/**
*  Fichero: axispsu003.jsp
*  
*
* Descripción de pantalla
*
*  Fecha: 02/02/2010
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ page import="java.lang.String" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
 <head>
    <title><axis:alt f="axispsu003" c="TITULO_HTML" lit="9002255"/></title> <%-- Politica de subscripción detalle --%>
        <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
        <c:import url="../include/carga_framework_js.jsp"/>
        
        <script language="Javascript" type="text/javascript">
        // Código javascript
        
            function f_onload() {       
                
                var grabat = "${__formdata.OK}";
                 if (!objUtiles.estaVacio(grabat) && objUtiles.utilEquals(grabat,"0")){
                  parent.f_aceptar_modal('axispsu003',1);
                 }
                 
                 //Deshabilitar campos entrada
                 <c:if test="${EDITABLE == 1}">                     
                  objDom.setVisibilidadPorId("but_aceptar", "hidden");                    
                  document.getElementById("OBSERV").readonly=true;               
                  document.getElementById("OBSERV").disabled=true;
                  document.getElementById("CAUTREC").readonly=true;               
                  document.getElementById("CAUTREC").disabled=true;                           
                 </c:if>
                  out.print(request.getAttribute("TOBSEV"));
                  f_cargar_propiedades_pantalla();
                  
            }
            
            
            function f_but_cancelar(){
                parent.f_cerrar_axispsu003();
            }
            
            function f_but_aceptar(){
            
               if (objValidador.validaEntrada()) 
                objUtiles.ejecutarFormulario("modal_axispsu003.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);         
            }
            
            
         
        // Fin código javascript
        </script>
 </head>   
 <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>                    
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
                        
               
            <input type="hidden" name="SSEGURO" id ="SSEGURO" value="${__formdata.SSEGURO}"/>
            <input type="hidden" name="NMOVIMI" id ="NMOVIMI" value="${__formdata.NMOVIMI}"/>
            <input type="hidden" name="NRIESGO" id ="NRIESGO" value="${__formdata.NRIESGO}"/>
            <input type="hidden" name="CCONTROL" id ="CCONTROL" value="${__formdata.CCONTROL}"/>
            <input type="hidden" name="NIVELR" id ="NIVELR" value="${__formdata.CNIVELR}"/>
            <input type="hidden" name="NOCURRE" id ="NOCURRE" value="${__formdata.NOCURRE}"/>
            <input type="hidden" name="ORIGEN" id ="ORIGEN" value="${__formdata.ORIGEN}"/>
 
            
            <input type="hidden" name="CGARANT" id ="CGARANT" value="${__formdata.CGARANT}"/>
            <input type="hidden" name="MODO" id ="MODO" value="${__formdata.MODO}"/>
            <input type="hidden" name="PTABLAS" id ="PTABLAS" value="${__formdata.PTABLAS}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axispsu003" c="TIT_FORM" lit="9002255"/></c:param>
                <c:param name="producto"><axis:alt f="axispsu003" c="TIT_FORM" lit="9002255"/></c:param>
                <c:param name="form">axispsu003</c:param>
            </c:import>
                    
                  
            <!-- Area de campos  -->
                    <table class="mainModalDimensions base" align="center" 
                           cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                              
                            <div class="separador">&nbsp;</div>
                            
                                <c:set var="resumen">
                                    <span class="titulocaja" style="color:black;font-weight:normal;padding-bottom:2px;.vertical-align:bottom">
                                        <b><axis:alt f="axispsu003" c="RESUM_PSU" lit="9900980"/>:</b> ${__formdata.CCONTROL} &nbsp; <b> - </b> ${__formdata.TCONTROL }                         
                                    </span>
                                </c:set>
                            
                
                                
                            <div class="titulo" ><img src="images/flecha.gif"/><axis:alt f="axispsu003" c="DSP_PSU" lit="1000113"/><%-- Detalle --%> &nbsp; ${resumen} &nbsp;</div>
                              <!--campos-->
                                
                               <table class="seccion" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left">
                                        <table class="area" align="center">
                                            <tr>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                               
                                            </tr>
                                            
                                            <tr>
                                                <axis:ocultar f="axispsu003" c="TUSUMOV " dejarHueco="false">
                                                    <td class="titulocaja">
                                                        <b id="label_TUSUMOV"><axis:alt f="axispsu003" c="TUSUMOV" lit="9900981"/></b> <%-- Usuario emisión --%>                                                
                                                    </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axispsu003" c="CNIVELU" dejarHueco="false">
                                                    <td class="titulocaja">
                                                        <b id="label_CNIVELU"><axis:alt f="axispsu003" c="CNIVELU" lit="9900982"/></b> <%-- Nivel usuario --%>
                                                    </td>
                                                </axis:ocultar>                                   
                                             
                                                 <axis:ocultar f="axispsu003" c="TDESNIV" dejarHueco="false">
                                                    <td class="titulocaja">
                                                        <b id="label_TDESNIV"><axis:alt f="axispsu003" c="TDESNIV" lit="9900991"/></b> <%-- Descripción detalle control --%>                                                
                                                    </td>
                                                </axis:ocultar>
                                            </tr>
                                            <tr>                 
                                             <axis:ocultar f="axispsu003" c="TUSUMOV " dejarHueco="false">
                                                    <td class="campocaja">
                                                        <input type="text" class="campowidthinput campo campotexto" id="TUSUMOV " name="TUSUMOV " size="15" 
                                                        <axis:atr f="axispsu003" c="TUSUMOV" a="modificable=false"/>
                                                        value="${__formdata.TUSUMOV}"
                                                         title="<axis:alt f="axispsu003" c="TUSUMOV" lit="9900981"/>"/>
                                                    </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axispsu003" c="CNIVELU" dejarHueco="false">
                                                    <td class="campocaja">
                                                        <input type="text" class="campowidthinput campo campotexto" id="CNIVELU" name="CNIVELU" size="15" 
                                                        <axis:atr f="axispsu003" c="CNIVELU" a="modificable=false"/>
                                                        value="${__formdata.CNIVELU}" style="width:8%"
                                                        title="<axis:alt f="axispsu003" c="CNIVELU" lit="9900982"/>"/>
                                                        &nbsp;&nbsp;
                                                        <input type="text" class="campowidthinput campo campotexto" id="TNIVELU" name="TNIVELU" size="15" 
                                                        <axis:atr f="axispsu003" c="TNIVELU" a="modificable=false"/>
                                                        value="${__formdata.TNIVELU}" style="width:80%"
                                                        title="<axis:alt f="axispsu003" c="TNIVELU" lit="9900982"/>"/>
                                                    </td>
                                                </axis:ocultar>
                                                
                                                 <axis:ocultar f="axispsu003" c="TDESNIV" dejarHueco="false">
                                                        <td class="campocaja" colspan="2">
                                                            <input type="text" class="campowidthinput campo campotexto" id="TDESNIV" name="TDESNIV" size="15" 
                                                            <axis:atr f="axispsu003" c="TDESNIV" a="modificable=false"/>
                                                            value="${__formdata.TDESNIV}"
                                                             title="<axis:alt f="axispsu003" c="TDESNIV" lit="9900981"/>"/>
                                                        </td>
                                                 </axis:ocultar>
                                               
                                            </tr>    
                                            
                                            
                                            
                                            <tr>
                                                <axis:ocultar f="axispsu003" c="TRIESGO" dejarHueco="false">
                                                    <td class="titulocaja" colspan="2">
                                                        <b id="label_TRIESGO"><axis:alt f="axispsu003" c="TRIESGO" lit="100649"/></b> <%-- Usuario emisión --%>                                                
                                                    </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axispsu003" c="TGARANT" dejarHueco="false">
                                                    <td class="titulocaja" colspan="2">
                                                        <b id="label_TGARANT"><axis:alt f="axispsu003" c="TGARANT" lit="100561"/></b> <%-- Nivel usuario --%>
                                                    </td>
                                                </axis:ocultar>                                   
                                             
                                               
                                            </tr>
                                            <tr>                 
                                             <axis:ocultar f="axispsu003" c="TRIESGO " dejarHueco="false">
                                                    <td class="campocaja" colspan="2">
                                                        <input type="text" class="campowidthinput campo campotexto" id="TRIESGO " name="TRIESGO " size="15" 
                                                        <axis:atr f="axispsu003" c="TRIESGO" a="modificable=false"/>  
                                                        value="${__formdata.TRIESGO}"
                                                         title="<axis:alt f="axispsu003" c="TRIESGO" lit="100649"/>"/>
                                                    </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axispsu003" c="TGARANT" dejarHueco="false">
                                                    <td class="campocaja" colspan="2">
                                                        <input type="text" class="campowidthinput campo campotexto" id="TGARANT" name="TGARANT" size="15" 
                                                        <axis:atr f="axispsu003" c="TGARANT" a="modificable=false"/>
                                                        value="${__formdata.TGARANT}" 
                                                        title="<axis:alt f="axispsu003" c="TGARANT" lit="100561"/>"/>
                                                        
                                                    </td>
                                                </axis:ocultar>
                                                
                                                
                                               
                                            </tr>       
                                           
                                           
                                           <tr>
                                           <td colspan="4">
                                           <table>
                                            <tr>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                               
                                            </tr>
                                            <tr>
                                               <axis:ocultar f="axispsu003" c="ESTABLOQUEA" dejarHueco="false">
                                                    <td class="titulocaja">
                                                        <b id="label_ESTABLOQUEA"><axis:alt f="axispsu003" c="ESTABLOQUEA" lit="9902677"/></b> <%-- Tipo control --%>
                                                    </td>
                                                </axis:ocultar>
                                                
                                                <axis:ocultar f="axispsu003" c="NVALOR" dejarHueco="false">
                                                    <td class="titulocaja">
                                                        <b id="label_NVALOR"><axis:alt f="axispsu003" c="NVALOR" lit="9902678"/></b> <%-- Valor control --%>
                                                    </td>
                                                </axis:ocultar>
                                                
                                                 <axis:ocultar f="axispsu003" c="NVALORINF" dejarHueco="false">
                                                    <td class="titulocaja">
                                                        <b id="label_NVALORINF"><axis:alt f="axispsu003" c="NVALORINF" lit="9902679"/></b> <%-- Valor control --%>
                                                    </td>
                                                </axis:ocultar>
                                                
                                                 <axis:ocultar f="axispsu003" c="NVALORSUP" dejarHueco="false">
                                                    <td class="titulocaja">
                                                        <b id="label_NVALORSUP"><axis:alt f="axispsu003" c="NVALORSUP" lit="9902680"/></b> <%-- Valor control --%>
                                                    </td>
                                                </axis:ocultar>
                                                 <axis:ocultar f="axispsu003" c="NVALORTOPE" dejarHueco="false">
                                                    <td class="titulocaja">
                                                        <b id="label_NVALORTOPE"><axis:alt f="axispsu003" c="NVALORTOPE" lit="9902681"/></b> <%-- Valor control --%>
                                                    </td>
                                                </axis:ocultar>
                                                                                        
                                            </tr>
                                            
                                                
                                                
                                            </tr>
                                            <tr>
                                                <axis:ocultar f="axispsu003" c="ESTABLOQUEA" dejarHueco="false">
                                                 <td class="campocaja">
                                                     <select name = "ESTABLOQUEA" id="ESTABLOQUEA" class="campowidthinput campo campotexto" style="width:95%" <axis:atr f="axispsu003" c="ESTABLOQUEA" a="modificable=true&obligatorio=true&&isInputText=false"/>  size="1" title="<axis:alt f="axispsu003" c="ESTABLOQUEA" lit="9902677"/>">
                                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispsu003" c="ESTABLOQUEA" lit="108341"/> - </option>
                                                            <c:forEach var="listado" items="${listValores.tipocontrol}">
                                                                <option value = "${listado.CATRIBU}"
                                                                    <c:if test="${listado.CATRIBU == __formdata.ESTABLOQUEA}">selected</c:if>>
                                                                    ${listado.TATRIBU}
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                </td>
                                                </axis:ocultar>
                                               
                                                <axis:ocultar f="axispsu003" c="NVALOR" dejarHueco="false">
                                                    <td class="campocaja">
                                                        <input type="text" class="campowidthinput campo campotexto" id="NVALOR" name="NVALOR" size="15" 
                                                        <axis:atr f="axispsu003" c="NVALOR" a="modificable=false"/> style="width:60%" 
                                                        value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.NVALOR}'/>"  title="<axis:alt f="axispsu003" c="NVALOR" lit="9902678"/>"/>
                                                    </td>
                                                </axis:ocultar>
                                                
                                                
                                                <axis:ocultar f="axispsu003" c="NVALORINF" dejarHueco="false">
                                                    <td class="campocaja">
                                                        <input type="text" class="campowidthinput campo campotexto" id="NVALORINF" name="NVALORINF" size="15" 
                                                        <axis:atr f="axispsu003" c="NVALORINF" a="modificable=false"/> style="width:60%" 
                                                        value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.NVALORINF}'/>"  title="<axis:alt f="axispsu003" c="NVALORINF" lit="9902678"/>"/>
                                                    </td>
                                                </axis:ocultar>
                                                 <axis:ocultar f="axispsu003" c="NVALORSUPER" dejarHueco="false">
                                                    <td class="campocaja">
                                                        <input type="text" class="campowidthinput campo campotexto" id="NVALORSUPER" name="NVALORSUPER" size="15" 
                                                        <axis:atr f="axispsu003" c="NVALORSUPER" a="modificable=false"/> style="width:60%" 
                                                        value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.NVALORSUPER}'/>"  title="<axis:alt f="axispsu003" c="NVALORSUPER" lit="9902678"/>"/>
                                                    </td>
                                                </axis:ocultar>
                                                
                                                <axis:ocultar f="axispsu003" c="NVALORTOPE" dejarHueco="false">
                                                    <td class="campocaja">
                                                        <input type="text" class="campowidthinput campo campotexto" id="NVALORTOPE" name="NVALORTOPE" size="15" 
                                                        <axis:atr f="axispsu003" c="NVALORTOPE" a="modificable=true"/>
                                                        value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.NVALORTOPE}'/>" style="width:60%"  title="<axis:alt f="axispsu003" c="NVALORTOPE" lit="9902678"/>"/>
                                                    </td>
                                                </axis:ocultar>
                                                    </td>
                                                
                                            </tr>      
                                            
                                            </table>
                                            </td>
                                            </tr>
                                            
                                            <tr>
                                               <axis:ocultar f="axispsu003" c="CAUTREC" dejarHueco="false">
                                                    <td class="titulocaja">
                                                        <b id="label_CAUTREC"><axis:alt f="axispsu003" c="CAUTREC" lit="9900977"/></b> <%-- Estat control --%>
                                                    </td>
                                                </axis:ocultar>
                                                 <axis:ocultar f="axispsu003" c="AUTMANUAL" dejarHueco="false">
                                                    <td class="titulocaja">
                                                        <b id="label_AUTMANUAL"><axis:alt f="axispsu003" c="AUTMANUAL" lit="9902682"/></b> <%-- Fecha estado --%>
                                                    </td>
                                                </axis:ocultar>
                                               
                                                <axis:ocultar f="axispsu003" c="FAUTREC" dejarHueco="false">
                                                    <td class="titulocaja">
                                                        <b id="label_FAUTREC"><axis:alt f="axispsu003" c="FAUTREC" lit="9900983"/></b> <%-- Fecha estado --%>
                                                    </td>
                                                </axis:ocultar>
                                               
                                                                                        
                                                <axis:ocultar f="axispsu003" c="CNIVELR" dejarHueco="false">
                                                    <td class="titulocaja" colspan="2">
                                                        <b id="label_CNIVELR"><axis:alt f="axispsu003" c="CNIVELR" lit="9900978"/></b> <%-- Nivell requerit --%>
                                                    </td>
                                                </axis:ocultar>
                                            </tr>
                                            <tr>
                                                <axis:ocultar f="axispsu003" c="CAUTREC" dejarHueco="false">
                                                 <td class="campocaja">
                                                     <select name = "CAUTREC" id="CAUTREC" onchange="f_cargar_propiedades_pantalla();" class="campowidthinput campo campotexto" style="width:95%" <axis:atr f="axispsu003" c="CAUTREC" a="modificable=true&obligatorio=true&&isInputText=false"/>  size="1" title="<axis:alt f="axispsu003" c="CAUTREC" lit="9900977"/>">
                                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispsu003" c="SNV_COMBO" lit="108341"/> - </option>
                                                            <c:forEach var="listado" items="${listValores.estadocontrol}">
                                                                <option value = "${listado.CATRIBU}"
                                                                    <c:if test="${listado.CATRIBU == __formdata.CAUTREC}">selected</c:if>>
                                                                    ${listado.TATRIBU}
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axispsu003" c="AUTMANUAL" dejarHueco="false">
                                                 <td class="campocaja">
                                                     <select name = "AUTMANUAL" id="AUTMANUAL" class="campowidthinput campo campotexto" style="width:95%" <axis:atr f="axispsu003" c="AUTMANUAL" a="modificable=false&obligatorio=true&isInputText=false"/>  size="1" title="<axis:alt f="axispsu003" c="AUTMANUAL" lit="9902682"/>">
                                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispsu003" c="SNV_COMBO" lit="108341"/> - </option>
                                                            <c:forEach var="listado" items="${listValores.origenestado}">
                                                                <option value = "${listado.CATRIBU}"
                                                                    <c:if test="${listado.CATRIBU == __formdata.AUTMANUAL}">selected</c:if>>
                                                                    ${listado.TATRIBU}
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axispsu003" c="FAUTREC" dejarHueco="false">
                                                    <td class="campocaja">
                                                        <input type="text" class="campowidthinput campo campotexto" id="FAUTREC" name="FAUTREC" size="15" 
                                                        <axis:atr f="axispsu003" c="FAUTREC" a="modificable=false"/>
                                                        value="<fmt:formatDate value="${__formdata.FAUTREC}" pattern="dd/MM/yyyy" />" 
                                                        style="width:80%"
                                                        title="<axis:alt f="axispsu003" c="FAUTREC" lit="9900983"/>"/>
                                                    </td>
                                                </axis:ocultar>
                                               
                                                
                                                
                                                     <td class="campocaja">
                                                        <input type="text" class="campowidthinput campo campotexto" id="CNIVELR" name="CNIVELR" size="15" 
                                                        <axis:atr f="axispsu003" c="CNIVELR" a="modificable=false"/>
                                                        value="${__formdata.CNIVELR}" style="width:7%"
                                                        title="<axis:alt f="axispsu003" c="CNIVELR" lit="9900978"/>"/>
                                                        &nbsp;&nbsp;
                                                        <input type="text" class="campowidthinput campo campotexto" id="TNIVELR" name="TNIVELR" size="15" 
                                                        <axis:atr f="axispsu003" c="TNIVELR" a="modificable=false"/>
                                                        value="${__formdata.TNIVELR}" style="width:80%"
                                                        title="<axis:alt f="axispsu003" c="TNIVELR" lit="9900978"/>"/>
                                                    </td>
                                                
                                            </tr>
                                            
                                            <tr>
                                                <axis:visible f="axispsu003" c="RISKNUM">
                                                    <td class="titulocaja" id="tit_RISKNUM">
                                                        <b id="label_RISKNUM"><axis:alt f="axispsu003" c="RISKNUM" lit="9906072"/></b> 
                                                    </td>
                                                </axis:visible>
                                            </tr>
                                            
                                            <tr>
                                                <axis:visible f="axispsu003" c="RISKNUM">
                                                    <td class="campocaja" id="td_RISKNUM">
                                                        <input type="text" class="campowidthinput campo campotexto" id="RISKNUM" name="RISKNUM"
                                                            <axis:atr f="axispsu003" c="RISKNUM" a="modificable=false&obligatorio=true"/>
                                                            value="${__formdata.NUMRISK}" title="<axis:alt f="axispsu003" c="RISKNUM" lit="9906072"/>"/>
                                                    </td>
                                                </axis:visible>
                                            </tr>
                                            
                                            
                                            <axis:visible f="axispsu003" c="CCRITICO">
                                                <tr><td class="titulocaja">
                                                   <div>
                                                        <b><axis:alt f="axispsu003" c="CCRITICO" lit="9905109" /></b>
                                                        <input type="checkbox"   id="CCRITICO" name="CCRITICO" <c:if test="${__formdata.CCRITICO == 1}">checked style="background-color: red;" </c:if> value="${__formdata.CCRITICO}"
                                                        <axis:atr f="axispsu003" c="CCRITICO" a="modificable=false&obligatorio=false&isInputText=false"/> />
                                                   </div>
                                                </td></tr>
                                            </axis:visible>  
                                            <tr>
                                                 <axis:ocultar f="axispsu003" c="OBSERV" dejarHueco="false">
                                                    <td class="titulocaja">
                                                        <b id="label_OBSERV"><axis:alt f="axispsu003" c="OBSERV" lit="101162"/></b> <%-- % Observaciones --%>
                                                        &nbsp;&nbsp;
                                                    </td>
                                                </axis:ocultar>
                                            </tr>
                                            <tr>
                                                <axis:ocultar f="axispsu003" c="OBSERV" dejarHueco="false">
                                                    <td class="campocaja" colspan="4">
                                                     <textarea rows="10" cols="50" class="campowidthinput campo campotexto"   <axis:atr f="axispsu003" c="OBSERV" a="modificable=true&isInputText=true"/> style="width:100%;" name="OBSERV" id="OBSERV" >${TOBSERV}</textarea>  
                                                    </td>
                                                </axis:ocultar>
                                               
                                                                             
                                            </tr>
                                        </table>
                            </td>
                        </tr>
                      </table>
                    
                    <%System.out.println("entra "+"OBSERV");%>  
                    
                    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axispsu003</c:param>
                        <c:param name="__botones">cancelar,<axis:visible c="BT_ACEPTAR" f="axispsu003">aceptar</axis:visible></c:param>
                    </c:import>
                    
        </form>
        <c:import url="../include/mensajes.jsp"/>
        </body>
        </html>
