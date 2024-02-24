<%/**
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
                parent.parent.reabrir_modal_garantias("modal_axispro001_garantias.do?operation=form&SPRODUC=${__formdata.SPRODUC}&CACTIVI=${param.PCACTIVI}&CGARANT=${param.PCGARANT}&dt="+(new Date().getTime()) + "&subpantalla=garantias_gestion");
            }
        }
        
        
        if(document.miForm.CIEDMIC.value == 1)
            objDom.setVisibilidadPorId("NEDAMIC","visible");
        if(document.miForm.CIEDMIC.value == 0){
            objDom.setVisibilidadPorId("NEDAMIC","hidden");
            document.miForm.NEDAMIC.value = "";
        }    
            
        if(document.miForm.CIEDMAC.value == 1)
            objDom.setVisibilidadPorId("NEDAMAC","visible");
        if(document.miForm.CIEDMAC.value == 0){
            objDom.setVisibilidadPorId("NEDAMAC","hidden");  
            document.miForm.NEDAMAC.value = "";
        }    
            
        if(document.miForm.CIEDMAR.value == 1)
            objDom.setVisibilidadPorId("NEDAMAR","visible");
        if(document.miForm.CIEDMAR.value == 0){
            objDom.setVisibilidadPorId("NEDAMAR","hidden"); 
            document.miForm.NEDAMAR.value = "";
        }    
        
        if(document.miForm.CIEDMRV.value == 1)
            objDom.setVisibilidadPorId("NEDAMRV","visible");
        if(document.miForm.CIEDMRV.value == 0){
            objDom.setVisibilidadPorId("NEDAMRV","hidden"); 
            document.miForm.NEDAMRV.value = "";
        }  
        
        f_cargar_propiedades_pantalla();
        revisarEstilos();
    }

    function f_but_cancelar() {                                   
        parent.f_cerrar_modal("axispro016");                
    }
    
    function f_but_aceptar() {
        if (objValidador.validaEntrada())
         objUtiles.ejecutarFormulario("modal_axispro016.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
    
    function f_onchange_reval (CREVALI) {
        var PREVALI_visibility = CREVALI >= 2 && CREVALI <= 6 ? "visible" : "hidden";
        document.miForm.PREVALI.style.visibility = PREVALI_visibility;
        var IREVALI_visibility = CREVALI == 1 ? "visible" : "hidden";
        document.miForm.IREVALI.style.visibility = IREVALI_visibility;
    }
    
    function f_onclickCheckbox(thiss) {
        thiss.value =  ((thiss.checked)?1:0);
        objDom.setValorPorId(thiss.id, thiss.value);
    }
    
    function f_onclickEdad(thiss) {
        thiss.value =  ((thiss.checked)?1:0);
        objDom.setValorPorId(thiss.id, thiss.value);
        
        if(thiss.id == 'CIEDMIC' && thiss.value == 1)
            objDom.setVisibilidadPorId("NEDAMIC","visible");
        if(thiss.id == 'CIEDMIC' && thiss.value == 0){
            objDom.setVisibilidadPorId("NEDAMIC","hidden");
            document.miForm.NEDAMIC.value = "";
        }    
            
        if(thiss.id == 'CIEDMAC' && thiss.value == 1)
            objDom.setVisibilidadPorId("NEDAMAC","visible");
        if(thiss.id == 'CIEDMAC' && thiss.value == 0){
            objDom.setVisibilidadPorId("NEDAMAC","hidden");  
            document.miForm.NEDAMAC.value = "";
        }    
        if(thiss.id == 'CIEDMAR' && thiss.value == 1)
            objDom.setVisibilidadPorId("NEDAMAR","visible");
        if(thiss.id == 'CIEDMAR' && thiss.value == 0){
            objDom.setVisibilidadPorId("NEDAMAR","hidden"); 
            document.miForm.NEDAMAR.value = "";
        }    
        
        if(thiss.id == 'CIEDMRV' && thiss.value == 1)
            objDom.setVisibilidadPorId("NEDAMRV","visible");
        if(thiss.id == 'CIEDMRV' && thiss.value == 0){
            objDom.setVisibilidadPorId("NEDAMRV","hidden"); 
            document.miForm.NEDAMRV.value = "";
        }    
    }
    
    function f_abrir_axispro044(PCCONCEP,PNCONCEP,PCFORPAG,PFINIVIG){
        var paramsAdicionales ="";
        paramsAdicionales = "&SPRODUC="+document.miForm.SPRODUC.value+"&CGARANT=${__formdata.PCGARANT}&CACTIVI=${__formdata.PCACTIVI}&VMODO=GAR";
        paramsAdicionales = paramsAdicionales + "&PCCONCEP="+PCCONCEP+"&PNCONCEP="+PNCONCEP+"&PCFORPAG="+PCFORPAG+"&PFINIVIG="+PFINIVIG;
        objUtiles.abrirModal("axispro044", "src", "modal_axispro044.do?operation=init" + paramsAdicionales); 
    }
    
    function f_cerrar_modal(cual) {
        objUtiles.cerrarModal(cual);
    }
        
    function f_aceptar_axispro044(){
        f_cerrar_modal('axispro044');
        objUtiles.ejecutarFormulario("modal_axispro016.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);
    }    
    
    function f_borrar_recargo(PCCONCEP,PNCONCEP,PCFORPAG,PFINIVIG){
        var answer = confirm(objJsMessages.jslit_confirma_borrar);
        if (answer){
            objUtiles.ejecutarFormulario("modal_axispro016.do?PCCONCEP="+PCCONCEP+"&PNCONCEP="+PNCONCEP+"&PCFORPAG="+PCFORPAG+"&PFINIVIG="+PFINIVIG, "delrecargo", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
    }
    
</script>
</head>
<body  onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axispro044|<axis:alt f="axispro016" c="id9901237" lit="9901237"/></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation" value=""/>

        <input type="hidden" name="SPRODUC" value="${sessionScope.mntproducto.SPRODUC}"/>
        <input type="hidden" name="PCGARANT" value="${__formdata.PCGARANT}"/>
        <input type="hidden" name="PCACTIVI" value="${__formdata.PCACTIVI}"/>
        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axispro016" c="idf1000226" lit="1000226"/></c:param>
            <c:param name="producto"><axis:alt f="axispro016" c="idp1000226" lit="1000226"/></c:param>
            <c:param name="form">axispro016</c:param>
        </c:import>

        <!-- Área de campos  -->
  
    <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">  
    <%-- <c:set target="${__formdata}" property="C2CABEZAS">1</c:set> --%>
        <tr><td>        
        <table cellspacing="5" class="seccion" style="padding-left:1%;padding-right:1%">
            <tr>
                <th style="width:2%;height:0px"></th>
                <th style="width:15%;height:0px"></th>
                <th style="width:10%;height:0px"></th>
                <th style="width:15%;height:0px"></th>
                <th style="width:10%;height:0px"></th>
                <th style="width:15%;height:0px"></th>
                <th style="width:10%;height:0px"></th>
                <th style="width:15%;height:0px"></th>
                <th style="width:8%;height:0px"></th>
            </tr>
            <tr>    
                <td></td>
                <td class="titulocaja" colspan="2" <c:if test='${__formdata.C2CABEZAS == 1}'> style="text-align:center" </c:if>>
                    <b><axis:alt f="axispro016" c="id1000476" lit="1000476"/></b>
                    <input type="checkbox" id="CIEDMIC" name="CIEDMIC" value="${__formdata.CIEDMIC}" onclick="f_onclickEdad(this)"
                    <c:if test="${__formdata.CIEDMIC == 1}">checked</c:if>
                    <axis:atr f="axispro001" c="CIEDMIC" a="modificable=true"/> />
                <%--</td>
                <td align="left" > --%>
                    <input type="text" id="NEDAMIC" name="NEDAMIC" value="${__formdata.NEDAMIC}" maxlength="3" class="campowidthinput campo campotexto" style="width:10%"
                    <axis:atr f="axispro001" c="NEDAMIC" a="modificable=true"/> />
                </td>
                <td class="titulocaja" colspan="2">
                    <b><axis:alt f="axispro016" c="id1000475" lit="1000475"/></b>
                    <input type="checkbox" id="CIEDMAC" name="CIEDMAC" value="${__formdata.CIEDMAC}" onclick="f_onclickEdad(this)"
                    <c:if test="${__formdata.CIEDMAC == 1}">checked</c:if>
                    <axis:atr f="axispro001" c="CIEDMAC" a="modificable=true"/> />
                 <%--</td>
                <td align="left" > --%>
                    <input type="text" id="NEDAMAC" name="NEDAMAC" value="${__formdata.NEDAMAC}" maxlength="3" class="campowidthinput campo campotexto" style="width:10%"
                    <axis:atr f="axispro001" c="NEDAMAC" a="modificable=true"/> />
                </td>
                <td class="titulocaja" colspan="2">
                    <b><axis:alt f="axispro016" c="id100719" lit="100719"/></b>
                    <input type="checkbox" id="CIEDMAR" name="CIEDMAR" value="${__formdata.CIEDMAR}" onclick="f_onclickEdad(this)"
                    <c:if test="${__formdata.CIEDMAR == 1}">checked</c:if>
                    <axis:atr f="axispro001" c="CIEDMAR" a="modificable=true"/> />
                 <%--</td>
                <td align="left" > --%>
                    <input type="text" id="NEDAMAR" name="NEDAMAR" value="${__formdata.NEDAMAR}" maxlength="3" class="campowidthinput campo campotexto" style="width:10%"
                    <axis:atr f="axispro001" c="NEDAMAR" a="modificable=true"/> />
                </td>
                <td class="titulocaja" colspan="2">
                    <b><axis:alt f="axispro016" c="id9906428" lit="9906428"/></b>
                    <input type="checkbox" id="CIEDMRV" name="CIEDMRV" value="${__formdata.CIEDMRV}" onclick="f_onclickEdad(this)"
                    <c:if test="${__formdata.CIEDMRV == 1}">checked</c:if>
                    <axis:atr f="axispro001" c="CIEDMRV" a="modificable=true"/> />
                 <%--</td>
                <td align="left" > --%>
                    <input type="text" id="NEDAMRV" name="NEDAMRV" value="${__formdata.NEDAMRV}" maxlength="3" class="campowidthinput campo campotexto" style="width:10%"
                    <axis:atr f="axispro001" c="NEDAMRV" a="modificable=true"/> />
                </td>
            </tr>
            
            <c:if test="${__formdata.C2CABEZAS == 1}">
            <tr>
                <td class="titulocaja">
                    <b><axis:alt f="axispro016" c="id1000346" lit="1000346"/></b>
                </td>
            </tr>
            <tr>
                <td></td>
                <td class="titulocaja" colspan="2">
                    <b><axis:alt f="axispro016" c="id100717" lit="100717"/></b>
                    <input type="checkbox" id="CIEMI2C" name="CIEMI2C" value="${__formdata.CIEMI2C}" onclick="f_onclickCheckbox(this)"
                    <c:if test="${__formdata.CIEMI2C == 1}">checked</c:if>
                    <axis:atr f="axispro001" c="CIEMI2C" a="modificable=true"/> />
                 <%--</td>
                <td align="left" > --%>
                    <input type="text" name="NEDMI2C" value="${__formdata.NEDMI2C}" maxlength="3" class="campowidthinput campo campotexto" style="width:10%"
                    <axis:atr f="axispro001" c="NEDMI2C" a="modificable=true"/> />
                </td>
                <td class="titulocaja" colspan="2">
                    <b><axis:alt f="axispro016" c="id100718" lit="100718"/></b>                    
                    <input type="checkbox" id="CIEMA2C" name="CIEMA2C" value="${__formdata.CIEMA2C}" onclick="f_onclickCheckbox(this)"
                    <c:if test="${__formdata.CIEMA2C == 1}">checked</c:if>
                    <axis:atr f="axispro001" c="CIEMA2C" a="modificable=true"/> />
                 <%--</td>
                <td align="left" > --%>
                    <input type="text" name="NEDMA2C" value="${__formdata.NEDMA2C}" maxlength="3" class="campowidthinput campo campotexto" style="width:10%"
                    <axis:atr f="axispro001" c="NEDMA2C" a="modificable=true"/> />
                </td>
                <td class="titulocaja" colspan="2">
                    <b><axis:alt f="axispro016" c="id100719" lit="100719"/></b>
                    <input type="checkbox" id="CIEMA2R" name="CIEMA2R" value="${__formdata.CIEMA2R}" onclick="f_onclickCheckbox(this)"
                    <c:if test="${__formdata.CIEMA2R == 1}">checked</c:if>
                    <axis:atr f="axispro001" c="CIEMA2R" a="modificable=true"/> />
                 <%--</td>
                <td align="left" > --%>
                    <input type="text" name="NEDMA2R" value="${__formdata.NEDMA2R}" maxlength="3" class="campowidthinput campo campotexto" style="width:10%"
                    <axis:atr f="axispro001" c="NEDMA2R" a="modificable=true"/> />
                </td>
            </tr>
        </c:if>
        </table>
        <div class="separador">&nbsp;</div>
        <table cellspacing="5" class="seccion" style="padding-left:1%;padding-right:1%">
            <tr>
                <th style="width:25%;height:0px"></th>
                <th style="width:25%;height:0px"></th>
                <th style="width:25%;height:0px"></th>
                <th style="width:25%;height:0px"></th>
            </tr>
            <tr>
               <td class="titulocaja">
                    <b><axis:alt f="axispro016" c="id9901238" lit="9901238"/></b> 
                </td>          
                <td class="titulocaja">
                    <b><axis:alt f="axispro016" c="id100956" lit="100956"/> </b>
                </td>
                <td class="titulocaja">
                    <b><axis:alt f="axispro016" c="id103350" lit="103350"/></b>
                </td> 
                           

            </tr>
            <tr>
                 <td align="left">
               <%--     <input type="text" name="CTARMAN" value="${__formdata.CTARMAN}" class="campowidthinput campo campotexto" style="width:70%"
                    <axis:atr f="axispro001" c="CTARMAN" a="modificable=false"/> />   --%>             
         
                    <select name="CTARMAN" id="CTARMAN" style="width:93%"   size="1" onchange="" class="campowidthselect campo campotexto">&nbsp;                                        
                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro016" c="id1000348" lit="1000348"/> - </option>
                        <c:forEach var="LSTTARMAN" items="${__formdata.COMBOS.LSTTARMAN}" varStatus="status">
                            <option value = "${LSTTARMAN.CATRIBU}"
                            <c:if test="${__formdata.CTARMAN == LSTTARMAN.CATRIBU}" >selected</c:if>>
                                ${LSTTARMAN.TATRIBU}
                            </option>
                        </c:forEach>
                    </select>
                </td>
                <td align="left" >  
                    <%-- <input type="text" name="CREASEG" value="${__formdata.CREASEG}" class="campowidthinput campo campotexto" style="width:70%"
                    <axis:atr f="axispro001" c="CREASEG" a="modificable=false"/> />
                    --%>
                    <select name="LSTREAGAR" style="width:93%"  id="LSTREAGAR" size="1" onchange="" class="campowidthselect campo campotexto">&nbsp;                                        
                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro016" c="id1000348" lit="1000348"/> - </option>
                        <c:forEach var="LSTREAGAR" items="${__formdata.COMBOS.LSTREAGAR}" varStatus="status">
                            <option value = "${LSTREAGAR.CATRIBU}"
                            <c:if test="${__formdata.CREASEG == LSTREAGAR.CATRIBU}" >selected</c:if>>
                                ${LSTREAGAR.TATRIBU}
                            </option>
                        </c:forEach>
                    </select>
                </td>
                <td align="left">
                    <%-- 
                    <input type="text" name="CREVALI" value="${__formdata.CREVALI}" class="campowidthinput campo campotexto" style="width:70%"
                    <axis:atr f="axispro001" c="CREVALI" a="modificable=false"/> />
                    --%>
                    <select name="LSTREVALGAR" style="width:93%"  id="LSTREVALGAR" size="1" onchange="f_onchange_reval(this.value)" class="campowidthselect campo campotexto">&nbsp;                                        
                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro016" c="id1000348" lit="1000348"/> - </option>
                        <c:forEach var="LSTREVALGAR" items="${__formdata.COMBOS.LSTREVALGAR}" varStatus="status">
                            <option value = "${LSTREVALGAR.CATRIBU}"
                            <c:if test="${__formdata.CREVALI == LSTREVALGAR.CATRIBU}" >selected</c:if>>
                                ${LSTREVALGAR.TATRIBU}
                            </option>
                        </c:forEach>
                    </select>
                </td>
                
            </tr>
        
            <tr>
              <%--   <td class="titulocaja">
                         
                    <input type="checkbox" id="CTIPTAR" name="CTIPTAR" value="${__formdata.CTIPTAR}" onclick="f_onclickCheckbox(this)"
                    <c:if test="${__formdata.CTIPTAR == 1}">checked</c:if>
                    <axis:atr f="axispro001" c="CTIPTAR" a="modificable=true"/> />
                    <b><axis:alt f="axispro016" c="id1000241" lit="1000241"/></b> 
                </td> --%>
                <td class="titulocaja">
                                        
                    <input type="checkbox" id="CMODREV" name="CMODREV" value="${__formdata.CMODREV}" onclick="f_onclickCheckbox(this)"
                    <c:if test="${__formdata.CMODREV == 1}">checked</c:if>
                    <axis:atr f="axispro001" c="CMODREV" a="modificable=true"/> />
                    <b><axis:alt f="axispro016" c="id1000294" lit="1000294"/></b>
                </td>
                <td class="titulocaja">
                                       
                    <input type="checkbox" id="CRECARG" name="CRECARG" value="${__formdata.CRECARG}" onclick="f_onclickCheckbox(this)"
                    <c:if test="${__formdata.CRECARG == 1}">checked</c:if>
                    <axis:atr f="axispro001" c="CRECARG" a="modificable=true"/> />
                    <b><axis:alt f="axispro016" c="id1000077" lit="1000077"/></b> 
                </td>
                <td class="titulocaja">
                    
                    <input type="checkbox" id="CDTOCOM" name="CDTOCOM" value="${__formdata.CDTOCOM}" onclick="f_onclickCheckbox(this)"
                    <c:if test="${__formdata.CDTOCOM == 1}">checked</c:if>
                    <axis:atr f="axispro001" c="CDTOCOM" a="modificable=true"/> />
                    <b><axis:alt f="axispro016" c="id1000075" lit="1000075"/></b>
                </td>
                <td class="titulocaja">
                                        
                    <input type="checkbox" id="CTECNIC" name="CTECNIC" value="${__formdata.CTECNIC}" onclick="f_onclickCheckbox(this)"
                    <c:if test="${__formdata.CTECNIC == 1}">checked</c:if>
                    <axis:atr f="axispro001" c="CTECNIC" a="modificable=true"/> />
                    <b><axis:alt f="axispro016" c="id1000340" lit="1000340"/></b>
                </td>
                
            </tr>
            <tr>
                
                <td class="titulocaja">
                    
                    <input type="checkbox" id="COFERSN" name="COFERSN" value="${__formdata.COFERSN}" onclick="f_onclickCheckbox(this)"
                    <c:if test="${__formdata.COFERSN == 1}">checked</c:if>
                    <axis:atr f="axispro001" c="COFERSN" a="modificable=true"/> />
                    <b><axis:alt f="axispro016" c="id1000309" lit="1000309"/></b>
                </td>   
                <td class="titulocaja">
                                       
                    <input type="checkbox" id="CEXTRAP" name="CEXTRAP" value="${__formdata.CEXTRAP}" onclick="f_onclickCheckbox(this)"
                    <c:if test="${__formdata.CEXTRAP == 1}">checked</c:if>
                    <axis:atr f="axispro001" c="CEXTRAP" a="modificable=true"/> />
                    <b><axis:alt f="axispro016" c="id1000076" lit="1000076"/></b> 
                </td>
                <td class="titulocaja">
                                       
                    <input type="checkbox" id="CDERREG" name="CDERREG" value="${__formdata.CDERREG}" onclick="f_onclickCheckbox(this)"
                    <c:if test="${__formdata.CDERREG == 1}">checked</c:if>
                    <axis:atr f="axispro001" c="CDERREG" a="modificable=true"/> />
                    <b><axis:alt f="axispro016" c="id1000106" lit="1000106"/></b> 
                </td>
            </tr>
            <tr>
                <c:set var="PREVALI_visibility">
                    ${__formdata.CREVALI >= 2 && __formdata.CREVALI <= 6 ? "visible" : "hidden"}
                </c:set>
                <td align="left">
                    <input type="text" name="PREVALI" value="${__formdata.PREVALI}" class="campowidthinput campo campotexto" style="width:65%;visibility:${PREVALI_visibility}"
                    <axis:atr f="axispro001" c="PREVALI" a="modificable=true"/> />
                </td>
                <c:set var="IREVALI_visibility">
                    ${__formdata.CREVALI == 1 ? "visible" : "hidden"}
                </c:set>
                <td align="left">
                    <input type="text" name="IREVALI" value="${__formdata.IREVALI}" class="campowidthinput campo campotexto" style="width:70%;visibility:${IREVALI_visibility}"
                    <axis:atr f="axispro001" c="IREVALI" a="modificable=true"/> />
                </td>  
            </tr>
        </table>
        <div class="separador">&nbsp;</div>
        <table cellspacing="5" class="seccion" style="padding-left:1%;padding-right:1%">
            <tr>
                <th style="width:5%;height:0px"></th>
                <th style="width:25%;height:0px"></th>
                <th style="width:50%;height:0px"></th>
                <th style="width:15%;height:0px"></th>
                <th style="width:5%;height:0px"></th>
            </tr>
            <tr>
                <td></td>
                <td class="titulocaja">
                    <b><axis:alt f="axispro016" c="id1000338" lit="1000338"/></b> 
                    <input type="checkbox" id="CRECFRA" name="CRECFRA" value="${__formdata.CRECFRA}" onclick="f_onclickCheckbox(this)"
                    <c:if test="${__formdata.CRECFRA == 1}">checked</c:if>
                    <axis:atr f="axispro001" c="CRECFRA" a="modificable=true"/> />
                </td>
                <td align="left" colspan="2">
                    <div style="float:right;"><a href="javascript:f_abrir_axispro044()"><img border="0" alt="<axis:alt f="axispro016" c="id1000428" lit="1000428"/>" title="<axis:alt f="axispro016" c="id1000428" lit="1000428"/>" src="images/new.gif"/></a></div>
                    <div style="clear:both;"><hr class="titulo"></div>
                    <c:set var="title0"><axis:alt f="axispro016" c="id100712" lit="100712" /></c:set>
                    <c:set var="title1"><axis:alt f="axispro016" c="id9000716" lit="9000716" /></c:set>
                    <c:set var="title2"><axis:alt f="axispro016" c="id9000717" lit="9000717" /></c:set>
                    <c:set var="title3"><axis:alt f="axispro016" c="id9000720" lit="9000720" /></c:set>
                    <c:set var="title4"><axis:alt f="axispro016" c="id9000723" lit="9000723" /></c:set>
                    <c:set var="numeroRegistros" value="${fn:length(__formdata.FORPAGRECGARAN)}" />
                    <div class="displayspace">
                        <display:table name="${__formdata.FORPAGRECGARAN}" id="FORPAGRECGARAN" export="false" class="dsptgtable" defaultsort="1" defaultorder="ascending" pagesize="6" sort="list" cellpadding="0" cellspacing="0" 
                        requestURI="modal_axispro016.do?paginar=true">
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="${title0}" headerClass="sortable" sortable="true" sortProperty="DESCFORPAG" style="width:20%"  media="html" autolink="false" >
                                <div class="dspText">${FORPAGRECGARAN.DESCFORPAG}</div>
                            </display:column>
                            <display:column title="${title1}" sortable="true" sortProperty="FINIVIG" headerClass="sortable" style="width:20%" media="html" autolink="false" >
                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${FORPAGRECGARAN.FINIVIG}"/></div>
                            </display:column>
                            <display:column title="${title2}" sortable="true" sortProperty="FFINVIG" headerClass="sortable" style="width:20%" media="html" autolink="false" >
                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${FORPAGRECGARAN.FFINVIG}"/></div>
                            </display:column>
                            <display:column title="${title3}" sortable="true" sortProperty="DESCTIPCON" headerClass="sortable" style="width:20%" media="html" autolink="false" >
                                <div class="dspText">${FORPAGRECGARAN.DESCTIPCON}</div>
                            </display:column>
                            <display:column title="${title4}" sortable="true" sortProperty="NVALCON" headerClass="sortable" style="width:20%" media="html" autolink="false" >
                                <div class="dspText">${FORPAGRECGARAN.NVALCON}</div>
                            </display:column>
                            <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                <c:if test="${empty(FORPAGRECGARAN.FFINVIG)}">
                                    <div class="dspIcons" id="BT_SIN_DELETE_TRAM_PAG_DET"><img border="0" alt="<axis:alt f="axispro016" c="id1000127" lit="1000127"/>" title1="<axis:alt f="axispro016" c="id1000127" lit="1000127"/>" src="images/delete.gif" width="15px" height="15px"
                                        style="cursor:pointer;" onclick="javascript:f_borrar_recargo(${FORPAGRECGARAN.CCONCEP},${FORPAGRECGARAN.NCONCEP},${FORPAGRECGARAN.CFORPAG},'<fmt:formatDate pattern="dd/MM/yyyy" value="${FORPAGRECGARAN.FINIVIG}"/>')"/></div> 
                                </c:if>
                            </display:column> 
                            <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                <c:if test="${empty(FORPAGRECGARAN.FFINVIG)}">
                                    <div class="dspIcons" id="BT_SIN_EDIT_TRAM_PAG_DET"><img border="0" alt="<axis:alt f="axispro016" c="id100002" lit="100002"/>" title1="<axis:alt f="axispro016" c="id100002" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                        style="cursor:pointer;" onclick="javascript:f_abrir_axispro044(${FORPAGRECGARAN.CCONCEP},${FORPAGRECGARAN.NCONCEP},${FORPAGRECGARAN.CFORPAG},'<fmt:formatDate pattern="dd/MM/yyyy" value="${FORPAGRECGARAN.FINIVIG}"/>')"/></div> 
                                </c:if>
                            </display:column>
                        </display:table>
                    </div>
                </td>
            </tr>
        </table>
        </td><tr>
    
    </table>
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axispro016</c:param><c:param name="f">axispro016</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
    </form>
    
    <c:import url="../include/mensajes.jsp" />
</body>
</html>