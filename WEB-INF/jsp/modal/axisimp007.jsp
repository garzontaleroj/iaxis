<%/**
*  Fichero: axisimp007.jsp
*  Pantalla de alta de impuestos por empresa.
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>  
*
*  Fecha: 30/12/2008
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
 
<html>
    <head>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
        <script type="text/javascript" src="scripts/calendar.js"></script>    
        <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <script type="text/javascript" src="scripts/calendar-setup.js"></script> 
        <c:import url="../include/carga_framework_js.jsp" />
        
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
                f_cargar_propiedades_pantalla();
                var grabarOK = ${requestScope.grabarOK == 0};
                
                var MODO = "${__formdata.MODO}";
                if (MODO=='modificar'){
                    mostrarEntradas();
                }
                
                if (grabarOK)
                    parent.f_aceptar_modal("axisimp007");
                if (objUtiles.estaVacio($("#CTIPPER").val())){
                    $("#CREGFISCAL").removeClass("campotexto_ob");
                    $("#CREGFISCAL").addClass("campodisabled");
                    $("#CREGFISCAL").attr("disabled","true");
                }
            }
            
            function f_onchange_CTIPPER(){
                objUtiles.ejecutarFormulario ("modal_axisimp007.do?RECARGAR=0", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_but_cancelar() {
                parent.f_cerrar_modal("axisimp007");
            }           
            
            function f_but_aceptar() {
                if (objValidador.validaEntrada())
                    objUtiles.ejecutarFormulario ("modal_axisimp007.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function mostrarEntradas(){
                if ($("#CTIPCAL").val()==2){
                    $("#ctipcal_porcent").show();
                    $("#ctipcal_subtab").hide();
                    $("#NPORCENT").show();
                    $("#ctipcal_fijo").hide();
                    $("#CSUBTAB").hide();
                    $("#CSUBTAB").val("");
                    $("#IFIJO").hide();
                    $("#IFIJO").val("");
                }else if ($("#CTIPCAL").val()==1){
                    $("#ctipcal_porcent").hide();
                    $("#ctipcal_subtab").hide();
                    $("#NPORCENT").hide();
                    $("#CSUBTAB").hide();
                    $("#CSUBTAB").val("");
                    $("#ctipcal_fijo").show();
                    $("#IFIJO").show();
                }else if ($("#CTIPCAL").val()==3){
                    $("#ctipcal_porcent").hide();
                    $("#ctipcal_fijo").hide();
                    $("#NPORCENT").hide();
                    $("#IFIJO").hide();
                    $("#ctipcal_subtab").show();
                    $("#CSUBTAB").show();
                }
            }
            
            function f_carga_subtabla(){
                if (!objUtiles.estaVacio($("#CSUBTAB").val())){
                    var qs="operation=m_ajax_buscar_subtab&CSUBTAB="+$("#CSUBTAB").val();
                    $("#TSUBTAB b").html("");
                    objAjax.invokeAsyncCGI("modal_axisimp007.do", callbackBuscarSubtab, qs, this, objJsMessages.jslit_cargando);
                }
            }
            
            function callbackBuscarSubtab(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText); 
                var elementos = doc.getElementsByTagName("TDESCRI");  
                for (i = 0; i < elementos.length; i++) {
                    var TDESCRI = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TDESCRI"), i, 0);
                    $("#TSUBTAB b").html(TDESCRI);
                }
            }
        </script>
    </head>
    
    <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>             
            <input type="hidden" name="CCONCEP" id="CCONCEP" value="${__formdata.CCONCEP}"/>             
            <input type="hidden" name="TCONCEP" id="TCONCEP" value="${__formdata.TCONCEP}"/> 
            <input type="hidden" name="NORDIMP" id="NORDIMP" value="${__formdata.NORDIMP}"/> 
            <input type="hidden" name="MODO" id="MODO" value="${__formdata.MODO}"/> 
            
            <c:import url="../include/titulo_nt.jsp">
               <c:param name="formulario">
                <axis:alt c="formulario" f="axisimp007" lit="9905832" />
               </c:param>
               <c:param name="producto">
                <axis:alt c="formulario" f="axisimp007" lit="9905832" />
               </c:param>
               <c:param name="form">axisimp007</c:param>
            </c:import> 
            
            <!-- Área de campos  -->
            <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp; </div>                                        
                        <!-- Sección 1 -->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisimp007" c="CCODIMP" lit="9000715"/></b>   <%-- Concepto --%>
                                            </td>
                                            <td class="titulocaja">
                                                &nbsp;
                                            </td>                    
                                        </tr>
                                        <tr>
                                            <%-- Empresa --%>
                                            <td class="campocaja">
                                                ${__formdata.TCONCEP}
                                            </td>
                                        <tr>
                                        <tr>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisimp007" c="CCODIMP" lit="800422"/></b>   <%-- Impuesto --%>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisimp007" c="FDESDE" lit="9902360"/></b>   <%-- Fecha Vigor --%>
                                            </td>                   
                                        </tr>
                                        <tr>
                                            <%-- Concepto --%>
                                            <td class="campocaja">
                                                <select name="CCODIMP" id="CCODIMP" size="1" class="campo campotexto_ob" style="width:90%" obligatorio="true"
                                                title="<axis:alt f="axisimp007" c="CCODIMP" lit="800422"/>">
                                                    <option value="null"> - <axis:alt f="axisimp007" c="SELECCIONAR" lit="1000348"/> - </option>
                                                    <c:forEach items="${__formdata.LSTIMPUESTOS}" var="item">
                                                        <option value = "${item.CCODIMP}" <c:if test="${__formdata.CCODIMP != 'null' && __formdata.CCODIMP == item.CCODIMP}"> selected </c:if>>${item.TDESIMP}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            <axis:ocultar f="axisimp007" c="FDESDE" dejarHueco="false">                 
                                                <td class="campocaja" >
                                                 <input  type="text" class="campowidthinput campo campotexto_ob" size="10" 
                                                         value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FDESDE}'/>" 
                                                         name="FDESDE" id="FDESDE" style="width:50%;" title="<axis:alt f='axisimp007' c='FDESDE' lit='9902360'/>"  
                                                         <c:if test="${__formdata.MODO == 'modificar'}">
                                                        <axis:atr f='axisimp007' c='FDESDE' a='obligatorio=true&formato=fecha&modificable=false'/>
                                                        </c:if>
                                                        <c:if test="${__formdata.MODO != 'modificar'}">
                                                         <axis:atr f="axisimp007" c="FDESDE" a="obligatorio=true&formato=fecha"/>
                                                        </c:if>
                                                       <a style="vertical-align:middle;">
                                                       <img id="popup_calendario_FDESDE" alt="<axis:alt f='axisimp007' c='FDESDE' lit='108341'/>"  
                                                            src="images/calendar.gif" 
                                                       </a>
                                                </td>            
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisimp007" c="CTIPPER" lit="102844"/></b>
                                            </td>
                                            <axis:visible f="axisimp007" c="CREGFISCAL">
                                            <td class="titulocaja"> 
                                                <b><axis:alt f="axisimp007" c="LIT_CREGFISCAL" lit="9902257"/></b>  <!-- Regimen fiscal -->  
                                            </td>
                                            </axis:visible>  
                                        </tr>
                                        <tr>
                                            <td class="campocaja"> <!-- ** LCF ** NOMBRE CAMPO -->
                                                <select name="CTIPPER" id="CTIPPER" size="1" title="<axis:alt f="axisimp007" c="CTIPPER" lit="102844"/>" 
                                                onchange="f_onchange_CTIPPER()" class="campowidthselect campo campotexto_ob" 
                                                style="width:100%;" <axis:atr f="axisimp007" c="CTIPPER" a="isInputText=false&obligatorio=true"/>>
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisimp007" c="blanco" lit="1000348"/> - </option>
                                                    <c:forEach var="element" items="${__formdata.tipPerson}">
                                                        <option value = "${element.CATRIBU}" 
                                                        <c:if test="${element.CATRIBU == __formdata.CTIPPER}"> selected </c:if> /> <!-- ** LCF ** -->
                                                            ${element.TATRIBU} 
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            <axis:visible f="axisimp007" c="CREGFISCAL">
                                                <td class="campocaja" colspan="2">
                                                    <select name="CREGFISCAL" id="CREGFISCAL" 
                                                        <axis:atr f="axisimp007" c="CREGFISCAL" a="modificable=true&obligatorio=false"/> 
                                                        size="1" class="campowidthselect campo campotexto_op" style="width:80%;">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisimp007" c="SNV_COMBO" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.regFisc}">
                                                            <option value = "${element.CREGFISCAL}" 
                                                            <c:if test="${element.CREGFISCAL == __formdata.CREGFIS}"> selected </c:if> />
                                                                ${element.TREGFISCAL} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:visible> 
                                        </tr>
                                        <tr>
                                            <axis:visible f="axisimp007" c="CTIPCAL">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisimp007" c="CTIPCAL" lit="9002111"/></b>
                                            </td>
                                            </axis:visible>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisimp007" c="CTIPCAL" dejarHueco="false"> 
                                            <td class="campocaja">
                                                <select name="CTIPCAL" id="CTIPCAL" size="1" class="campowidthselect campo campotexto_ob"
                                                        <axis:atr f="axisimp007" c="CTIPCAL" a="obligatorio=true"/> 
                                                        title="<axis:alt f="axisimp007" c="CTIPCAL" lit="9002111"/>" onchange="mostrarEntradas()">
                                                    <option value="<%= Integer.MIN_VALUE %>">
                                                      <axis:alt f="axisimp007" c="SELECCIONAR" lit="108341"/>                                
                                                    </option>
                                                    <c:forEach var="tipo" items="${__formdata.LSTCTIPCAL}">
                                                        <option value="${tipo.CATRIBU}" <c:if test="${__formdata.CTIPCAL == tipo.CATRIBU}">selected</c:if>>
                                                            ${tipo.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:visible f="axisimp007" c="CBASECAL">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisimp007" c="CBASECAL" lit="9905834"/></b>
                                            </td>
                                            </axis:visible>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisimp007" c="CBASECAL" dejarHueco="false"> 
                                            <td class="campocaja">
                                                <select name="CBASECAL" id="CBASECAL" size="1" class="campowidthselect campo campotexto_ob"
                                                        <axis:atr f="axisimp007" c="CBASECAL" a="obligatorio=true"/> 
                                                        title="<axis:alt f="axisimp007" c="CBASECAL" lit="9905834"/>">
                                                    <option value="<%= Integer.MIN_VALUE %>">
                                                      <axis:alt f="axisimp007" c="SELECCIONAR" lit="108341"/>                                
                                                    </option>
                                                    <c:forEach var="tipo" items="${__formdata.LSTCBASECAL}">
                                                        <option value="${tipo.CATRIBU}" <c:if test="${__formdata.CBASECAL == tipo.CATRIBU}">selected</c:if>>
                                                            ${tipo.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <td colspan ="2">
                                                <table id="ctipcal_porcent" style="display:none">
                                                    <tr>
                                                        <axis:visible f="axisimp007" c="CBASEMIN">
                                                        <td class="titulocaja">
                                                          <b><axis:alt f="axisimp007" c="CBASEMIN" lit="9905871"/></b>
                                                        </td>
                                                        </axis:visible>
                                                        <axis:visible f="axisimp007" c="CBASEMAX">
                                                        <td class="titulocaja" style="display:none">
                                                          <b><axis:alt f="axisimp007" c="CBASEMAX" lit="103051"/></b>
                                                        </td>
                                                        </axis:visible>
                                                    </tr>
                                                    <tr>
                                                        <axis:ocultar f="axisimp007" c="CBASEMIN" dejarHueco="false">
                                                            <td>
                                                                <input type="text" class="campo campotexto_op" value="${__formdata.CBASEMIN}"  name="CBASEMIN" id="CBASEMIN" size="15"
                                                                       style="width:50%;" />
                                                            </td>
                                                        </axis:ocultar>   
                                                        <axis:ocultar f="axisimp007" c="CBASEMAX" dejarHueco="false">
                                                            <td style="display:none">
                                                                <input type="text" class="campo campotexto_op" value="${__formdata.CBASEMAX}"  name="CBASEMAX" id="CBASEMAX" size="15"
                                                                       style="width:60%;"/>
                                                            </td>
                                                        </axis:ocultar>   
                                                    </tr>
                                                    <tr>
                                                        <axis:visible f="axisimp007" c="NPORCENT">
                                                        <td class="titulocaja">
                                                          <b><axis:alt f="axisimp007" c="NPORCENT" lit="101467"/></b>
                                                        </td>
                                                        </axis:visible>
                                                    </tr>
                                                    <tr>
                                                        <axis:ocultar f="axisimp007" c="NPORCENT" dejarHueco="false">
                                                            <td>
                                                                <input type="text" class="campo campotexto_ob" value="${__formdata.NPORCEN}"  name="NPORCENT" id="NPORCENT" size="15"
                                                                       <axis:atr f="axisimp007" c="NPORCENT" a="obligatorio=true"/> 
                                                                       title="<axis:alt f="axisimp007" c="NPORCENT" lit="101467"/>" style="width:50%;" />
                                                            </td>
                                                        </axis:ocultar>   
                                                    </tr>
                                                    <tr>
                                                        <axis:visible f="axisimp007" c="IMIN">
                                                        <td class="titulocaja" style="display:none">
                                                          <b><axis:alt f="axisimp007" c="IMIN" lit="9904858"/></b>
                                                        </td>
                                                        </axis:visible>
                                                        <axis:visible f="axisimp007" c="IMAX">
                                                        <td class="titulocaja" style="display:none">
                                                          <b><axis:alt f="axisimp007" c="IMAX" lit="9905835"/></b>
                                                        </td>
                                                        </axis:visible>
                                                    </tr>
                                                    <tr>
                                                        <axis:ocultar f="axisimp007" c="IMIN" dejarHueco="false">
                                                            <td style="display:none">
                                                                <input type="text" class="campo campotexto_op" value="${__formdata.IMIN}"  name="IMIN" id="IMIN" size="15"
                                                                       style="width:50%;" />
                                                            </td>
                                                        </axis:ocultar>   
                                                        <axis:ocultar f="axisimp007" c="IMAX" dejarHueco="false">
                                                            <td style="display:none">
                                                                <input type="text" class="campo campotexto_op" value="${__formdata.IMAX}"  name="IMAX" id="IMAX" size="15"
                                                                       style="width:50%;" />
                                                            </td>
                                                        </axis:ocultar>   
                                                    </tr>
                                                </table>
                                            </td>    
                                         <tr>
                                            <td colspan ="2">    
                                                <table id="ctipcal_fijo" style="display:none">
                                                    <tr>
                                                        <axis:visible f="axisimp007" c="IFIJO">
                                                        <td class="titulocaja">
                                                          <b><axis:alt f="axisimp007" c="IFIJO" lit="9902145"/></b>
                                                        </td>
                                                        </axis:visible>
                                                    </tr>
                                                    <tr>
                                                        <axis:ocultar f="axisimp007" c="IFIJO" dejarHueco="false">
                                                            <td>
                                                                <input type="text" class="campo campotexto_ob" value="${__formdata.IFIJO}"  name="IFIJO" id="IFIJO" size="15"
                                                                       <axis:atr f="axisimp007" c="IFIJO" a="obligatorio=true"/> style="width:50%;"
                                                                       title="<axis:alt f="axisimp007" c="IFIJO" lit="9902145"/>"/>
                                                            </td>
                                                        </axis:ocultar> 
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan ="2">    
                                                <table id="ctipcal_subtab" style="display:none">
                                                    <tr>
                                                        <axis:visible f="axisimp007" c="CSUBTAB">
                                                        <td class="titulocaja">
                                                          <b><axis:alt f="axisimp007" c="CSUBTAB" lit="9905862"/></b>
                                                        </td>
                                                        </axis:visible>
                                                    </tr>
                                                    <tr>
                                                        <axis:ocultar f="axisimp007" c="CSUBTAB" dejarHueco="false">
                                                            <td>
                                                                <input type="text" class="campo campotexto_ob" value="${__formdata.CSUBTAB}"  name="CSUBTAB" id="CSUBTAB" size="15"
                                                                       onblur="f_carga_subtabla()" title="<axis:alt f="axisimp007" c="CSUBTAB" lit="9905862"/>"
                                                                       <axis:atr f="axisimp007" c="CSUBTAB" a="obligatorio=true"/> style="width:15%;"/>&nbsp;<span id="TSUBTAB"><b>${__formdata.TSUBTABLA}</b></span>
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr style="display:none">
                                            <axis:visible f="axisimp007" c="CLAVE1">
                                            <td class="titulocaja" style="padding-top:1%">
                                              <b><axis:alt f="axisimp007" c="CLAVE1" lit="9905932"/></b>
                                            </td>
                                            </axis:visible>
                                            <axis:visible f="axisimp007" c="CLAVE2">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisimp007" c="CLAVE2" lit="9905933"/></b>
                                            </td>
                                            </axis:visible>
                                            <axis:visible f="axisimp007" c="CLAVE3">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisimp007" c="CLAVE3" lit="9905934"/></b>
                                            </td>
                                            </axis:visible>
                                            <axis:visible f="axisimp007" c="CLAVE4">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisimp007" c="CLAVE4" lit="9905935"/></b>
                                            </td>
                                            </axis:visible>
                                        </tr>
                                        <tr style="display:none">
                                            <axis:ocultar f="axisimp007" c="CCLAVE1" dejarHueco="false"> 
                                            <td class="campocaja">
                                                <select name="CCLAVE1" id="CCLAVE1" size="1" class="campowidthselect campo campotexto_ob"
                                                        onchange="f_valida_campos_clave()" style="display:none"
                                                        <axis:atr f="axisimp007" c="CCLAVE1" a="obligatorio=true"/> 
                                                        title="<axis:alt f="axisimp007" c="CCLAVE1" lit="9905932"/>"> 
                                                    <option value="<%= Integer.MIN_VALUE %>">
                                                      <axis:alt f="axisimp007" c="SELECCIONAR" lit="108341"/>                                
                                                    </option>
                                                    <c:forEach var="clave1" items="${__formdata.LSTCLAVES}">
                                                        <option value="${clave1.CATRIBU}" <c:if test="${__formdata.CCLAVE1 == clave1.CATRIBU}">selected</c:if>>
                                                            ${clave1.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisimp007" c="CCLAVE2" dejarHueco="false"> 
                                            <td class="campocaja">
                                                <select name="CCLAVE2" id="CCLAVE2" size="1" class="campowidthselect campo campotexto_op"
                                                        disabled onchange="f_valida_campos_clave()" title="<axis:alt f="axisimp007" c="CCLAVE2" lit="9905933"/>"> 
                                                    <option value="<%= Integer.MIN_VALUE %>">
                                                      <axis:alt f="axisimp007" c="SELECCIONAR" lit="108341"/>                                
                                                    </option>
                                                    <c:forEach var="clave2" items="${__formdata.LSTCLAVES}">
                                                        <option value="${clave2.CATRIBU}" <c:if test="${__formdata.CCLAVE2 == clave2.CATRIBU}">selected</c:if>>
                                                            ${clave2.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisimp007" c="CCLAVE3" dejarHueco="false"> 
                                            <td class="campocaja">
                                                <select name="CCLAVE3" id="CCLAVE3" size="1" class="campowidthselect campo campotexto_op"
                                                        disabled onchange="f_valida_campos_clave()" title="<axis:alt f="axisimp007" c="CCLAVE3" lit="9905934"/>">
                                                    <option value="<%= Integer.MIN_VALUE %>">
                                                      <axis:alt f="axisimp007" c="SELECCIONAR" lit="108341"/>                                
                                                    </option>
                                                    <c:forEach var="clave3" items="${__formdata.LSTCLAVES}">
                                                        <option value="${clave3.CATRIBU}" <c:if test="${__formdata.CCLAVE3 == clave3.CATRIBU}">selected</c:if>>
                                                            ${clave3.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisimp007" c="CCLAVE4" dejarHueco="false"> 
                                            <td class="campocaja">
                                                <select name="CCLAVE4" id="CCLAVE4" size="1" class="campowidthselect campo campotexto_op"
                                                        disabled onchange="f_valida_campos_clave()" title="<axis:alt f="axisimp007" c="CCLAVE4" lit="9905935"/>">
                                                    <option value="<%= Integer.MIN_VALUE %>">
                                                      <axis:alt f="axisimp007" c="SELECCIONAR" lit="108341"/>                                
                                                    </option>
                                                    <c:forEach var="clave4" items="${__formdata.LSTCLAVES}">
                                                        <option value="${clave4.CATRIBU}" <c:if test="${__formdata.CCLAVE4 == clave4.CATRIBU}">selected</c:if>>
                                                            ${clave4.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            </axis:ocultar>
                                        </tr>
                                    </table>           
                                </td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp; </div>                                        
                        <c:import url="../include/botonera_nt.jsp">
                            <c:param name="f">axisimp007</c:param>
                            <c:param name="__botones">cancelar,aceptar</c:param>
                        </c:import>
                    </td>
                </tr>
            </table>
        </form>
         <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FDESDE",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FDESDE", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>     
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>
