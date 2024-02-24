<%/**
*/
%>

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
        var ok = "${__formdata.OK}";     
        
        if (!objUtiles.estaVacio(ok)){
            if(ok == 0){
                 parent.parent.reabrir_modal_garantias("modal_axispro001_garantias.do?operation=form&SPRODUC=${__formdata.SPRODUC}&CACTIVI=${param.PCACTIVI}&CGARANT=${param.PCGARANT}&dt="+(new Date().getTime()) + "&subpantalla=garantias_datosgenerales");
            }
        }
        
        
        
        revisarEstilos();
        f_cargar_propiedades_pantalla();
    }

    function f_but_cancelar() {   
     var abrir = "${empty __formdata.GARANPROCAP && __formdata.CTIPCAP == 7}";
        if(abrir == 'true'){
            alert("<axis:alt f='axispro015' c='LIT_9901940' lit='9901940' />");
        }else{
            parent.f_cerrar_modal('axispro015');      
        }
    }
  
    function f_but_aceptar() {
        var abrir = "${empty __formdata.GARANPROCAP && __formdata.CTIPCAP == 7}";
        if(abrir == 'true'){
            alert("<axis:alt f='axispro015' c='LIT_9901940' lit='9901940' />");
        }else{
            objUtiles.ejecutarFormulario("modal_axispro015.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
    }
 
    function f_valorparametro(valor){
        objUtiles.ejecutarFormulario("modal_axispro015.do?CPARGAR="+valor+"&CAMBIO=Si", "buscarvalparam", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
   
    function f_tipocapital(){
        objUtiles.ejecutarFormulario("modal_axispro015.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
   
    function f_tipogaratia(valor){
        
        if ("${__formdata.CTIPGAR}" == 3 || "${__formdata.CTIPGAR}" == 4){
        if(valor != 3 && valor != 4)
            document.miForm.CGARDEP.value = null;
        }
        
        f_tipocapital();
    }
   
    function f_abrir_axispro043(){
        var paramsAdicionales ="";
        paramsAdicionales = "&SPRODUC="+document.miForm.SPRODUC.value+"&CGARANT=${__formdata.CGARANT}&CACTIVI=${__formdata.CACTIVI}";
        objUtiles.abrirModal("axispro043", "src", "modal_axispro043.do?operation=init" + paramsAdicionales); 
    }
    
    function f_cerrar_modal(cual){
        objUtiles.cerrarModal(cual);
        if(cual == 'axispro043')
            objUtiles.ejecutarFormulario("modal_axispro015.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
    
    function f_onclickCheckbox(thiss) {
        thiss.value =  ((thiss.checked)?1:0);
        objDom.setValorPorId(thiss.id, thiss.value);
    }
   
</script>
</head>
<body  onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axispro043|<axis:alt f="axispro015" c="LIT_9901187" lit="9901187"/></c:param>
    </c:import>
  
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation" value=""/>

        <input type="hidden" name="SPRODUC" value="${sessionScope.mntproducto.SPRODUC}"/>
        <input type="hidden" name="PCACTIVI" value="${__formdata.CACTIVI}"/>
        <input type="hidden" name="PCGARANT" value="${__formdata.CGARANT}"/>
        <input type="hidden" name="OK" id="OK" value="${__formdata.OK}"/>
        <input type="hidden" name="CTIPO" id="CTIPO" value="${__formdata.CTIPO}"/>
        <input type="hidden" name="CCAPMAX_" id="CCAPMAX_" value="${__formdata.CCAPMAX}"/>
        
        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axispro015" c="LIT_1000225" lit="1000225"/></c:param>
            <c:param name="producto"><axis:alt f="axispro015" c="LIT_1000225" lit="1000225"/></c:param>
            <c:param name="form">axispro015</c:param>
        </c:import>
         
        <!-- Área de campos  -->
      
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">  
        <tr><td>
            <table cellspacing="5" class="seccion" style="padding-left:1%;padding-right:1%">
                <tr>
                    <th style="width:25%;height:0px"></th>
                    <th style="width:15%;height:0px"></th>
                    <th style="width:20%;height:0px"></th>
                    <th style="width:20%;height:0px"></th>
                    <th style="width:15%;height:0px"></th>
                </tr>
                <tr>
                    <td class="titulocaja">
                        <b><axis:alt f="axispro015" c="LIT_110994" lit="110994" /></b> 
                    </td>
                    <td class="titulocaja" align="left">
                        <b><axis:alt f="axispro015" c="LIT_500102" lit="500102" /></b>
                    </td>
                    <td class="titulocaja">
                        <b><axis:alt f="axispro015" c="LIT_102517" lit="102517" /> </b>
                    </td> 
                 
                    <c:if test="${__formdata.CTIPGAR == 3 || __formdata.CTIPGAR == 4}">
                    <td class="titulocaja" id="TGARANTIASDEP"> 
                        <b><axis:alt f="axispro015" c="LIT_1000489" lit="1000489" /></b>
                    </td>
                    </c:if>
                    <c:if test="${__formdata.CTIPGAR == 5 || __formdata.CTIPGAR == 6}">
                    <td class="titulocaja" id="TCPARDEP">
                        <b><axis:alt f="axispro015" c="LIT_1000326" lit="1000326" />  </b>
                    </td>
                    </c:if> 
                    <c:if test="${__formdata.CTIPGAR == 5 || __formdata.CTIPGAR == 6}"> 
                    <td class="titulocaja" id="TCVALPAR">
                        <b><axis:alt f="axispro015" c="LIT_1000381" lit="1000381" />  </b>
                    </td>
                    </c:if> 
                </tr>
                <tr> 
                    <td  class="campocaja"> 
                        <input type="text" name="TGARANT" value="${__formdata.TGARANT}" class="campowidthinput campo campotexto" style="width:90%"
                        <axis:atr f="axispro015" c="TGARANT" a="modificable=false"/> />
                    </td>
                    <td class="campocaja" >
                        <input type="text" name="NORDEN" value="${__formdata.NORDEN}" class="campowidthinput campo campotexto" style="width:60%"
                        <axis:atr f="axispro015" c="NORDEN" a="modificable=true"/> />
                    </td>
                    <td class="campocaja">   
                        <select name="CTIPGAR"   id="CTIPGAR" size="1" onchange="f_tipogaratia(this.value)" class="campowidthselect campo campotexto">&nbsp;                                        
                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro015" c="LIT_1000348" lit="1000348"/> - </option>
                            <c:forEach var="lista" items="${__formdata.COMBOS.LSTTIPGAR}" varStatus="status">
                                <option value = "${lista.CATRIBU}"
                                <c:if test="${(!empty __formdata.CTIPGAR) && __formdata.CTIPGAR == lista.CATRIBU}" >selected</c:if>>
                                    ${lista.TATRIBU}
                                </option>
                            </c:forEach>
                       </select>
                    </td>
                
                  <c:if test="${__formdata.CTIPGAR == 3 || __formdata.CTIPGAR == 4}">
                  <td class="campocaja" id="GARANTIASDEP" colspan="2"> 
                            <select name="CGARDEP"  id="CGARDEP" size="1" style="width:80%" onchange="f_tipocapital()" class="campowidthselect campo campotexto">&nbsp;                                        
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro015" c="LIT_1000348" lit="1000348"/> - </option>
                                <c:forEach var="lista" items="${__formdata.COMBOS.LSTGARANTIASDEP}" varStatus="status">
                                    <option value = "${lista.CGARANT}"
                                    <c:if test="${__formdata.CGARDEP == lista.CGARANT}" >selected</c:if>> 
                                        ${lista.TGARAN}
                                    </option>
                                </c:forEach>                                 
                            </select>
                    </td> 
                   </c:if>
                   
                   <c:if test="${__formdata.CTIPGAR == 5 || __formdata.CTIPGAR == 6}">
                   <td class="campocaja" id="CCPARDEP">   
                     <select name="CPARDEP"   id="CPARDEP" size="1" onchange="f_valorparametro(this.value)" class="campowidthselect campo campotexto">&nbsp;                                        
                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro015" c="LIT_1000348" lit="1000348"/> - </option>
                            <c:forEach var="lista" items="${__formdata.COMBOS.LSTPARGARANTIAS}" varStatus="status">
                                <option value = "${lista.CPARGAR}"
                                <c:if test="${__formdata.CPARDEP == lista.CPARGAR}" >selected</c:if>>
                                    ${lista.TPARGAR}
                                </option>
                            </c:forEach>
                       </select>
                    </td> 
                    </c:if>
                    <c:if test="${__formdata.CTIPO == 2 && (__formdata.CTIPGAR == 5 || __formdata.CTIPGAR == 6)}">
                        <td class="campocaja" id="CCVALPAR">  
                          <select name="CVALPAR"   id="CVALPAR" size="1" onchange="" class="campowidthselect campo campotexto">&nbsp;                                        
                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro015" c="LIT_1000348" lit="1000348"/> - </option>
                            <c:forEach var="lista" items="${__formdata.LISTAVALPREG}" varStatus="status">
                                <option value = "${lista.CVALPAR}"
                                <c:if test="${__formdata.CVALPAR == lista.CVALPAR}" >selected</c:if>>
                                    ${lista.TVALPAR}
                                </option>
                            </c:forEach>
                          </select>
                        </td>
                    </c:if> 
                    <c:if test="${__formdata.CTIPO != 2 && (__formdata.CTIPGAR == 5 || __formdata.CTIPGAR == 6)}">
                        <td class="campocaja" id="CCVALPAR">
                            <input type="text" name="CVALPAR" id="CVALPAR" value="${__formdata.CVALPAR}" class="campowidthinput campo campotexto" style="width:60%"
                                <axis:atr f="axispro015" c="CVALPAR" a="modificable=true"/> />
                        </td>
                    </c:if>
                </tr>   
                <tr>
                     <td class="titulocaja"> 
                        <b><axis:alt f="axispro015" c="LIT_104384" lit="104384" /></b>
                        <input type="checkbox" name="CTARJET" id="CTARJET" value="${__formdata.CTARJET}" onclick="f_onclickCheckbox(this)"
                        <c:if test="${__formdata.CTARJET == 1}">checked</c:if>
                        <axis:atr f="axispro015" c="CTARJET" a="modificable=true"/> />
                    </td>
                    <td class="titulocaja"> 
                        <b><axis:alt f="axispro015" c="LIT_1000490" lit="1000490" /></b>
                        <input type="checkbox" name="CBASICA" id="CBASICA" value="${__formdata.CBASICA}" onclick="f_onclickCheckbox(this)"
                        <c:if test="${__formdata.CBASICA == 1}">checked</c:if>
                        <axis:atr f="axispro015" c="CBASICA" a="modificable=true"/> />
                    </td>
                    <td class="titulocaja"> 
                        <b><axis:alt f="axispro015" c="LIT_1000490" lit="108645" /></b>
                                <select name="CMONCAP" style="width:93%"  id="CMONCAP" size="1" onchange="" class="campowidthselect campo campotexto" <axis:atr f="axispro003" c="CDIVISA" a="obligatorio=false"/>
                                                 title="<axis:alt f="axispro003" c="CMONCAP" lit="108645"/>">&nbsp;                                        
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro003" c="CMONCAP" lit="108341"/> - </option>
                                                <c:forEach var="divisa" items="${__formdata.COMBOS.MONEDA}" varStatus="status">
                                                    <option value = "${divisa.CDIVISA}"  <c:if test="${__formdata.CMONCAP==divisa.CDIVISA}" >selected</c:if>  >
                                                        ${divisa.TDIVISA}
                                                    </option>
                                                </c:forEach>                                         
                                           </select>
                    </td>
                </tr>
                <tr>
                    <td class="titulocaja">
                        <b><axis:alt f="axispro015" c="LIT_1000488" lit="1000488" /></b>
                    </td>
                </tr>
                <tr>
                   <td align="left"> 
                        <select name="CTIPCAP"  id="CTIPCAP" style="width:60%" size="1" onchange="f_tipocapital()" class="campowidthselect campo campotexto">&nbsp;                                        
                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro015" c="LIT_1000348" lit="1000348"/> - </option>
                        <c:forEach var="LSTTIPCAPGAR" items="${__formdata.COMBOS.LSTTIPCAPGAR}" varStatus="status">
                            <option value = "${LSTTIPCAPGAR.CATRIBU}"
                            <c:if test="${__formdata.CTIPCAP == LSTTIPCAPGAR.CATRIBU}" >selected</c:if>>
                                ${LSTTIPCAPGAR.TATRIBU}
                            </option>
                        </c:forEach>                
                    </td>
                </tr>
                <tr>
                    <c:if test="${__formdata.CTIPCAP == 1}"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axispro015" c="LIT_100563" lit="100563" />  </b>
                        </td>
                    </c:if>
                    <c:if test="${__formdata.CTIPCAP == 2 || __formdata.CTIPCAP == 3 || __formdata.CTIPCAP == 6}"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axispro015" c="LIT_1000276" lit="1000276" /> </b>
                        </td>
                    </c:if>
                    <%--
                    <c:if test="${__formdata.CTIPCAP == 5 || __formdata.CTIPCAP == 9}">
                        <td class="titulocaja">
                            <b><axis:alt f="axispro015" c="LIT_1000348" lit="108347" /> </b>
                        </td>
                    </c:if> --%>
                    <c:if test="${__formdata.CCAPMAX == 1}"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axispro015" c="LIT_105815" lit="105815" /> </b>
                        </td>
                    </c:if> 
                    <c:if test="${__formdata.CCAPMAX == 4||__formdata.CCAPMAX == 6}"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axispro015" c="LIT_105815" lit="105815" /> </b>
                        </td>
                        <td class="titulocaja">
                            <b><axis:alt f="axispro015" c="LIT_9906309" lit="9906309" /> </b>
                        </td>
                    </c:if> 
                    <%-- <c:if test="${__formdata.CCAPMAX == 2}"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axispro015" c="LIT_1000348" lit="1000489" /> </b>
                        </td>
                    </c:if>  
                    <c:if test="${__formdata.CCAPMAX == 4}">
                        <td class="titulocaja">
                            <b><axis:alt f="axispro015" c="LIT_1000348" lit="108347" /> </b>
                        </td>
                    </c:if>  --%>
                    <c:if test="${__formdata.CTIPCAP == 2 || __formdata.CTIPCAP == 3 || __formdata.CTIPCAP == 6}"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axispro015" c="LIT_9906478" lit="9906478" /> </b>
                        </td>
                    </c:if>
                    
                    <c:if test="${__formdata.CCAPMIN == 1 || __formdata.CCAPMIN == 4||__formdata.CCAPMIN == 6}">
                    <td class="titulocaja">
                        <b><axis:alt f="axispro015" c="LIT_1000493" lit="1000493" /></b>
                    </td>
                    </c:if>
                   
                    <c:if test="${ __formdata.CCAPMIN == 4||__formdata.CCAPMIN == 6}">
                    <td class="titulocaja">
                        <b><axis:alt f="axispro015" c="LIT_9906310" lit="9906310" /></b>
                    </td>
                    </c:if>
                </tr>
                <tr>
                    <c:if test="${__formdata.CTIPCAP == 1}">
                        <td align="left"> 
                           <input type="text" name="ICAPMAX" value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.ICAPMAX}'/>"  class="campowidthinput campo campotexto" style="width:60%"
                                <axis:atr f="axispro015" c="ICAPMAX" a="modificable=true"/> /> 
                        </td>
                    </c:if>
                    <c:if test="${__formdata.CTIPCAP == 2 || __formdata.CTIPCAP == 3 || __formdata.CTIPCAP == 6}">
                        <td align="left">  
                            <select name="CCAPMAX" style="width:80%"  id="CCAPMAX" size="1" onchange="f_tipocapital()" class="campowidthselect campo campotexto">&nbsp;                                        
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro015" c="LIT_1000348" lit="1000348"/> - </option>
                                    <c:forEach var="lista" items="${__formdata.COMBOS.LSTCAPMAXGAR}" varStatus="status">
                                        <option value = "${lista.CATRIBU}"
                                        <c:if test="${__formdata.CCAPMAX == lista.CATRIBU}" >selected</c:if>>
                                        ${lista.TATRIBU}
                                    </option>
                                </c:forEach>                                 
                            </select>
                        </td>
                    </c:if>
                  <%--  <c:if test="${__formdata.CTIPCAP == 5 || __formdata.CTIPCAP == 9}">
                        <td align="left">
                            <input type="text" name="CFORMUL" id="CFORMUL" value="${__formdata.CFORMUL}" class="campowidthinput campo campotexto" style="width:60%"
                                <axis:atr f="axispro015" c="CFORMUL" a="modificable=true"/> />
                        </td>
                    </c:if>--%>
                    
                        <td align="left" style='<c:if test="${__formdata.CCAPMAX != 4||__formdata.CCAPMAX != 1 || __formdata.CCAPMAX != 6}">display:none</c:if><c:if test="${__formdata.CCAPMAX == 4||__formdata.CCAPMAX == 1 || __formdata.CCAPMAX == 6}">display:block</c:if>'>
                            <input type="text" name="ICAPMAX" value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.ICAPMAX}'/>"   class="campowidthinput campo campotexto" style="width:80%"
                                        <axis:atr f="axispro015" c="ICAPMAX" a="modificable=true"/> />
                        </td>
                     
                   <%-- <c:if test="${__formdata.CCAPMAX == 2}"> 
                        <td align="left">
                            <input type="text" name="TGARDEP" value="${__formdata.TGARDEP}" class="campo campotexto" style="width:80%"
                                        <axis:atr f="axispro015" c="TGARDEP" a="modificable=true"/> />
                        </td>
                    </c:if>  
                    <c:if test="${__formdata.CCAPMAX == 4}">
                        <td align="left">
                            <input type="text" name="CCLACAP" value="${__formdata.CCLACAP}" class="campowidthinput campo campotexto" style="width:80%"
                                    <axis:atr f="axispro015" c="CCLACAP" a="modificable=true"/> />
                        </td>
                    </c:if>  --%>
                        <td align="left" style='<c:if test="${__formdata.CCAPMAX != 4||__formdata.CCAPMAX != 6}">display:none</c:if><c:if test="${__formdata.CCAPMAX == 4||__formdata.CCAPMAX == 6}">display:block</c:if>'>
                            <input type="text" name="CCLACAP" value="${__formdata.CCLACAP}" class="campowidthinput campo campotexto" style="width:80%"
                                    <axis:atr f="axispro015" c="CCLACAP" a="modificable=true"/> />
                        </td>
                        
                        <c:if test="${__formdata.CTIPCAP == 2 || __formdata.CTIPCAP == 3 || __formdata.CTIPCAP == 6}">
                        <td align="left">  
                            <select name="CCAPMIN" style="width:80%"  id="CCAPMIN" size="1" onchange="f_tipocapital()" class="campowidthselect campo campotexto">&nbsp;                                        
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro015" c="LIT_1000348" lit="1000348"/> - </option>
                                    <c:forEach var="lista2" items="${__formdata.COMBOS.LSTCAPMAXGAR}" varStatus="status">
                                        <option value = "${lista2.CATRIBU}"
                                        <c:if test="${__formdata.CCAPMIN == lista2.CATRIBU}" >selected</c:if>>
                                        ${lista2.TATRIBU}
                                    </option>
                                </c:forEach>                                 
                            </select>
                        </td>
                    </c:if>
                   
                    <!--<c:if test="${(__formdata.CTIPCAP != 7 && __formdata.CTIPCAP != 4) || __formdata.CCAPMIN == 6}"> -->
                    <td align="left" style='<c:if test="${__formdata.CCAPMIN != 4||__formdata.CCAPMIN != 1 || __formdata.CCAPMIN != 6}">display:none</c:if><c:if test="${__formdata.CCAPMIN == 4||__formdata.CCAPMIN == 1 || __formdata.CCAPMIN == 6}">display:block</c:if>'>
                        <input type="text" name="ICAPMIN" id="ICAPMIN" value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.ICAPMIN}'/>" class="campowidthinput campo campotexto" style="width:80%"
                        <axis:atr f="axispro015" c="ICAPMIN" a="modificable=true"/> />
                    </td>
                    
                    <!--</c:if> -->
                    
                    <td align="left" style='<c:if test="${__formdata.CCAPMIN != 4 || __formdata.CCAPMIN != 6}">display:none</c:if><c:if test="${__formdata.CCAPMIN == 4 ||__formdata.CCAPMIN == 6}">display:block</c:if>'>
                            <input type="text" name="CCLAMIN" value="${__formdata.CCLAMIN}" class="campowidthinput campo campotexto" style="width:80%"
                            <axis:atr f="axispro015" c="CCLAMIN" a="modificable=true"/> />
                        </td> 
                </tr>
                <c:if test="${__formdata.CTIPCAP == 7}">   
                <tr>
                    <td align="left" colspan="2">  
                        <div style="float:right;"><a href="javascript:f_abrir_axispro043()"><img border="0" alt="<axis:alt f="axispro015" c="LIT_1000428" lit="1000428"/>" title="<axis:alt f="axispro015" c="LIT_1000428" lit="1000428"/>" src="images/new.gif"/></a></div>
                        <div style="clear:both;"><hr class="titulo"></div>
                                <c:set var="title2"><axis:alt f="axispro015" c="LIT_9001933" lit="9001933"/></c:set>
                                <c:set var="title3"><axis:alt f="axispro015" c="LIT_100713" lit="100713"/></c:set>
                                <display:table name="${__formdata.GARANPROCAP}" id="miListaId" export="false" class="dsptgtable" pagesize="6"   cellpadding="0" cellspacing="0"  style="text-align:center;spacing-left:15%">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="${title2}"  headerClass="headwidth5 sortable" sortProperty="OB_IAX_PRODGARANPROCAP.ICAPITAL" media="html" autolink="false" style="text-align:center; width:70%" sortable="true">
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
                                </display:table>   
                    </td>
                </tr>
                </c:if>
                
                <c:if test="${__formdata.CTIPCAP == 3 || __formdata.CTIPCAP == 6}"> 
                        <tr>     
                            <td class="titulocaja" colspan="2">
                                <b><axis:alt f="axispro015" c="LIT_1000489" lit="1000489" /> </b>
                            </td>
                        </tr>
                        <tr>     
                            <td class="campocaja">
                                <select name="CGARDEP2"  id="CGARDEP2" size="1" onchange="" class="campowidthselect campo campotexto"
                               <c:if test="${!empty __formdata.CGARDEP && (__formdata.CTIPGAR == 3 || __formdata.CTIPGAR == 4)}" >disabled</c:if> >&nbsp;                                        
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro015" c="LIT_1000348" lit="1000348"/> - </option>
                                <c:forEach var="lista" items="${__formdata.COMBOS.LSTGARANTIASDEP}" varStatus="status">
                                    <option value = "${lista.CGARANT}"
                                    <c:if test="${__formdata.CGARDEP2 == lista.CGARANT}" >selected</c:if>
                                    <c:if test="${__formdata.CGARDEP == lista.CGARANT}" >selected</c:if>  > 
                                        ${lista.TGARAN}
                                    </option>
                                </c:forEach>                                 
                                </select>
                            </td>
                            <td align="left" class="campocaja"><%System.out.println(63);%>
                                <input type="text" name="PCAPDEP" value="${__formdata.PCAPDEP}" class="campowidthinput campo campotexto" style="width:60%"
                                <axis:atr f="axispro015" c="PCAPDEP" a="modificable=true"/> />%
                            </td>
                        </tr>
                </c:if> 
                <tr>
                 <c:if test="${__formdata.CTIPCAP != 7 && __formdata.CTIPCAP != 4}"> 
                    
                    <td class="titulocaja">
                        <b><axis:alt f="axispro015" c="LIT_1000494" lit="1000494" /></b>
                    </td>
                    </c:if>
                    <td class="titulocaja">
                        <b><axis:alt f="axispro015" c="LIT_1000491" lit="1000491" /></b>
                    </td>
                    <td class="titulocaja">
                        <b><axis:alt f="axispro015" c="LIT_1000492" lit="1000492" /> </b>
                    </td>
                </tr>
                <tr>
                <c:if test="${(__formdata.CTIPCAP != 7 && __formdata.CTIPCAP != 4)}"> 
                    <td align="left">
                       <input type="text" name="ICAPREV" value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.ICAPREV}'/>"  class="campowidthinput campo campotexto" style="width:80%"
                        <axis:atr f="axispro015" c="ICAPREV" a="modificable=true"/> /> 
                    </td>    
                    </c:if>
                    <td align="left"> 
                        <input type="text" name="IPRIMIN" value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IPRIMIN}'/>"  class="campowidthinput campo campotexto" style="width:80%"
                        <axis:atr f="axispro015" c="IPRIMIN" a="modificable=true"/> />
                    </td>
                    <td align="left">
                        <input type="text" name="IPRIMAX" value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IPRIMAX}'/>" class="campowidthinput campo campotexto" style="width:80%"
                        <axis:atr f="axispro015" c="IPRIMAX" a="modificable=true"/> />
                    </td>
                </tr>
                <tr>
                    <c:if test="${__formdata.CCAPMIN == 0}">   
                        <td align="left">
                            <input type="text" name="ICAPMIN" value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.ICAPMIN}'/>" class="campowidthinput campo campotexto" style="width:80%"
                            <axis:atr f="axispro015" c="ICAPMIN" a="modificable=true"/> />
                        </td>
                    </c:if>
                    <c:if test="${__formdata.CCAPMIN == 1}">   
                            <td align="left" colspan="2"> 
                                <display:table name="${__formdata.CAPITALMIN}" id="miListaId" export="false" class="dsptgtable" pagesize="6"   cellpadding="0" cellspacing="0"  style="text-align:center;spacing-left:15%">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title="${title4}"  headerClass="headwidth5 sortable" sortProperty="OB_IAX_PRODCAPITALMIN.TFORPAG" media="html" autolink="false" style="text-align:center; width:5%" sortable="true">
                                    <div class="dspText" > ${miListaId.OB_IAX_PRODCAPITALMIN.TFORPAG }</div>
                                    </display:column>
                                    <display:column title="${title1}" headerClass="headwidth20 sortable" sortProperty="OB_IAX_PRODCAPITALMIN.ICAPITAL" media="html" autolink="false" style="text-align:center; width:30%" sortable="true">
                                    <div class="dspText" > <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.OB_IAX_PRODCAPITALMIN.ICAPITAL}"/> </div>
                                    </display:column>
                                </display:table> 
                            </td>
                    </c:if>
                </tr>
            </table>
            </td>
        </tr>
    </table>
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axispro015</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
    </form>
    
    <c:import url="../include/mensajes.jsp" />
    
</body>
</html>