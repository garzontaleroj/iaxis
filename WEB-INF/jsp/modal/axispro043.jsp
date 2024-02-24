<%/**
*/
%>
<%System.out.println(0);%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
<head>
<link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
<link rel="stylesheet" href="styles/axisnt.css" type="text/css">
<link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
<c:import url="../include/carga_framework_js.jsp" />

<script language="Javascript" type="text/javascript">
    function f_onload() {
        //document.miForm.POLIZA.focus();    
        
        valor = "${__formdata.OK}";
        if(valor == 1)
            f_but_cancelar();
       // f_tipogar(valor);
        
        revisarEstilos();
    }

    function f_but_cancelar() {     
        parent.f_cerrar_modal('axispro043');                
    }
    
    function f_but_aceptar() {
        objUtiles.ejecutarFormulario("modal_axispro043.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
  
    function f_anadir(){
        if (objValidador.validaEntrada())
            objUtiles.ejecutarFormulario("modal_axispro043.do", "anadir", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
    
    function f_tipogaratia(valor){
        
        if(valor != 3 && valor != 4)
            document.miForm.LSTGARANTIASDEP.value = null;
        
        f_tipocapital();
    }
    
    function f_actualizar_valor(obj){
        objDom.setValorPorId("CDEFECTO",obj.checked ? 1 : 0);
    }
    
    function f_borrar(pnorden){
        objUtiles.ejecutarFormulario("modal_axispro043.do?NORDEN="+pnorden, "borrar", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
    
    function f_ordenar(pnorden,pmodo){
        objUtiles.ejecutarFormulario("modal_axispro043.do?NORDEN="+pnorden+"&MODO="+pmodo, "ordenar", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
    
    
    
</script>
</head>
<body  onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation" value=""/>

        <input type="hidden" name="SPRODUC" value="${sessionScope.mntproducto.SPRODUC}"/>
        <input type="hidden" name="CACTIVI" value="${__formdata.CACTIVI}"/>
        <input type="hidden" name="CGARANT" value="${__formdata.CGARANT}"/>
        <input type="hidden" name="CTIPGAR" value="${__formdata.CTIPGAR}"/>
        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><fmt:message key="9901187"/></c:param>
            <c:param name="producto"><fmt:message key="9901187"/></c:param>
            <c:param name="form">axispro043</c:param>
        </c:import>
        
        

        <!-- Área de campos  -->
      
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">  
            <tr>
                <td>
                    <table cellspacing="5" class="seccion">
                        <tr>
                            <th style="width:5%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:35%;height:0px"></th>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="titulocaja" >
                                <b><fmt:message key="9001933" /></b>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="campocaja">
                                 <input type="text" name="ICAPITAL" id="ICAPITAL" title="<fmt:message key='9001933' />" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.ICAPITAL}"/>" 
                                        class="campowidthinput campo campotexto_ob" style="width:80%" obligatorio="true" 
                                        <axis:atr f="axispro043" c="ICAPITAL" a="modificable=true&obligatorio=true"/> />
                                   
                            </td>
                            <td class="campocaja">
                                <b><fmt:message key="100713" /></b>
                                <input type="checkbox" name="CDEFECTO" id="CDEFECTO" value="${__formdata.CDEFECTO}" 
                                onclick="javascript:f_actualizar_valor(this)"
                                <c:if test="${__formdata.CDEFECTO == 1}">checked</c:if>
                                <axis:atr f="axispro043" c="CDEFECTO" a="modificable=true"/>/>
                            </td>
                            <td>
                                <input type="button" class="boton" id="but_anadir" value="<fmt:message key="104825" />" 
                                       onclick = "javascript:f_anadir()"  />  
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td align="left" colspan="2"> 
                                <c:set var="title2"><fmt:message key="9001933"/></c:set>
                                <c:set var="title3"><fmt:message key="100713"/></c:set>
                                <div style="clear:both;"><hr class="titulo"></div>
                                        <display:table name="${__formdata.LISTCAPITALES}" id="miListaId" export="false" class="dsptgtable" pagesize="6"   cellpadding="0" cellspacing="0"  style="text-align:center;spacing-left:15%">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="${title2}"  headerClass="headwidth5 sortable" sortProperty="OB_IAX_PRODGARANPROCAP.ICAPITAL" media="html" autolink="false" style="text-align:center; width:40%" sortable="true">
                                        <div class="dspText" > <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.OB_IAX_PRODGARANPROCAP.ICAPITAL}"/></div>
                                        </display:column>
                                        <display:column title="${title3}" headerClass="headwidth5 sortable" sortProperty="OB_IAX_PRODGARANPROCAP.CDEFECTO" media="html" autolink="false" style="text-align:center; width:30%" sortable="true">
                                        <c:choose>
                                           <c:when test="${miListaId.OB_IAX_PRODGARANPROCAP.CDEFECTO == 1}"> 
                                           <input type="radio" name="CDEFECTO" checked disabled>              
                                           </c:when>
                                           <c:otherwise>
                                           <input type="radio" name="CDEFECTO" disabled>              
                                           </c:otherwise>
                                        </c:choose>  
                                        </display:column>
                                        <display:column title="" sortable="false" headerClass="sortable" media="html" autolink="false" style="text-align:center; width:10%">
                                            <div class="dspIcono"><img src="images/delete.gif" style="cursor:pointer" 
                                                                        alt="<fmt:message key='9001333'/>" title="<fmt:message key='9001333'/>"
                                                                        onclick="javascript:f_borrar('${miListaId.OB_IAX_PRODGARANPROCAP.NORDEN}')"/>
                                            </div>
                                        </display:column>
                                        <display:column title="" sortable="false" headerClass="sortable" media="html" autolink="false" style="text-align:center; width:5%">
                                            <div class="dspIcono"><img src="images/displaytag/arrow_up.png" style="cursor:pointer" 
                                                                        alt="<fmt:message key='9901185'/>" title="<fmt:message key='9901185'/>"
                                                                        onclick="javascript:f_ordenar('${miListaId.OB_IAX_PRODGARANPROCAP.NORDEN}','SUBIR')"/>
                                            </div>
                                        </display:column>
                                        <display:column title="" sortable="false" headerClass="sortable" media="html" autolink="false" style="text-align:center; width:5%">
                                            <div class="dspIcono"><img src="images/displaytag/arrow_down.png" style="cursor:pointer" 
                                                                        alt="<fmt:message key='9901186'/>" title="<fmt:message key='9901186'/>"
                                                                        onclick="javascript:f_ordenar('${miListaId.OB_IAX_PRODGARANPROCAP.NORDEN}','BAJAR')"/>
                                            </div>
                                        </display:column>
                                        </display:table>   
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp" />
    
</body>
</html>