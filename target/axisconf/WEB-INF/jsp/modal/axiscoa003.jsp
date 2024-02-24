<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>

<%@ page contentType="text/html;charset=iso-8859-15"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<c:set var="miGET_MOV_CTACOAindex" value="0"/>
<c:set var="miGET_MOV_CTACOAindexSigueSumando" value="1"/>
<c:forEach items="${__formdata.GET_MOV_CTACOA}" var="item">
    <c:if test="${__formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex].NNUMLIN==__formdata.IDREGISTRO}">
    <c:set var="miGET_MOV_CTACOAindexSigueSumando" value="0"/>
    </c:if>
    <c:if test="${miGET_MOV_CTACOAindexSigueSumando==1}">
    <c:set var="miGET_MOV_CTACOAindex" value="${miGET_MOV_CTACOAindex+1}"/>
    </c:if>
</c:forEach>

<html>
  <head>
    <title>
      <axis:alt f="axiscoa003" c="TITULO" lit="9001162"/>
    </title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css"></link>
    <c:import url="../include/carga_framework_js.jsp"/>
    <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green"/>
    <script type="text/javascript" src="scripts/calendar.js"></script>
    <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
    <script type="text/javascript" src="scripts/calendar-setup.js"></script>
    <script type="text/javascript">

function hacerEditable(id, clear) {
    try {
        document.getElementById(id).readOnly=false;
        if (clear) document.getElementById(id).value="";
    } 
    catch(Exception) {
        //alert(id+" r "+Exception)
    }
    try {
        if (document.getElementById(id).disabled) {
        	document.getElementById(id).disabled=false;
            if (clear) document.getElementById(id).selectedIndex=0;
        }
    } 
    catch(Exception) {
        //alert(id+" s "+Exception)
    }
    try {
        if (document.getElementById(id).style.visibility=="hidden") {
        	document.getElementById(id).style.visibility="visible";
        }
    } 
    catch(Exception) {
        //alert(id+" v "+Exception)
    }
}

function navegacionBasica() {
/*
ecg ver http://mantis.srvcsi.com/view.php?id=22076#c124126 
*/
    var ctipmov=-1;  <c:if test="${!empty __formdata.CTIPMOV}">ctipmov=${__formdata.CTIPMOV};</c:if> 
    var cestado=-1; <c:if test="${!empty __formdata.CESTADO}">cestado=${__formdata.CESTADO};</c:if>
    var pmodo=-1;
    var ALTA=false; <c:if test="${!empty ALTA}">ALTA=true;</c:if>
    var hacerEditables="";
    var obut_aceptar=document.getElementById("but_aceptar");
    obut_aceptar.disabled=true;
    if (!ALTA) {
        pmodo=0; // IF pmodo = 0 THEN   --Modificación de registros
        if (ctipmov==1 && (cestado==1||cestado==3)) {
            hacerEditables="NRECIBO,SIDEPAG,FCIERRE,icon_FCIERRE,CESTADO,CIMPORT,TDESCRI,TDOCUME,CCONCEP,CDEBHAB,IIMPORT";
            var hacerEditablesSplitted=hacerEditables.split(",");
            for (var i=0;i<hacerEditablesSplitted.length;i++) {
                hacerEditable(hacerEditablesSplitted[i], false);
            }
            obut_aceptar.disabled=false;        
        }
        if (ctipmov==0 && (cestado==1||cestado==3)) {
            hacerEditables="CESTADO,CIMPORT,TDESCRI,TDOCUME";
            var hacerEditablesSplitted=hacerEditables.split(",");
            for (var i=0;i<hacerEditablesSplitted.length;i++) {
                hacerEditable(hacerEditablesSplitted[i], false);
            }
            obut_aceptar.disabled=false;        
        }  
    }
    if (ALTA) {
        pmodo=1; // IF pmodo = 1 THEN   --Inserción de registros
        hacerEditables="NRECIBO,SIDEPAG,FCIERRE,icon_FCIERRE,CESTADO,CIMPORT,TDESCRI,CCONCEP,CDEBHAB,IIMPORT,TDOCUME";
        var hacerEditablesSplitted=hacerEditables.split(",");
        for (var i=0;i<hacerEditablesSplitted.length;i++) {
            hacerEditable(hacerEditablesSplitted[i], true);
        }
        obut_aceptar.disabled=false;        
    }
    
    
}

            
function f_onload() { 
    <%--
    //reformatearImportes();
    ok = "${__formdata.OK}";
    if (!objUtiles.estaVacio(ok) && ok=='OK' ){
    parent.f_aceptar_axiscoa003();
    }
    --%>
 
    <c:if test="${!empty RECARGAR_PADRE_A_CANCELAR}">document.miForm.RECARGAR_PADRE_A_CANCELAR.value="1";</c:if>
    //navegacionBasica();
    f_cargar_propiedades_pantalla(); 
    <c:if test="${!empty CERRAR_Y_RECARGAR_PADRE}">f_but_cancelar();</c:if>
}



function f_recargar(){
//  f_validaImport();
    reformatearImportes();
    objUtiles.ejecutarFormulario ("modal_axiscoa003.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);    
}


function f_validaImport(){
    if (!objUtiles.estaVacio(document.miForm.IIMPORT.value) ){
        if (!objValidador.esCampoNumerico(document.miForm.IIMPORT.value, true,  <%= Integer.MIN_VALUE %>, "<axis:alt f="axiscoa003" c="VALIDAIMPORT" lit="100563"/>") ){
            document.miForm.IIMPORT.focus();
            return 1;
        }else{  
            document.miForm.IIMPORT.value = objValidador.valorFormateadoCampoNumerico(objDom.getValorComponente(document.miForm.IIMPORT) , true, true);
        }    
    }
    return 0;
}

function f_but_cancelar() {
    var recargar=false;
    if (document.miForm.RECARGAR_PADRE_A_CANCELAR.value=="1") {
        recargar=true;
    }
    parent.f_cerrar_axiscoa003(recargar);
}

function f_but_aceptar(){
    if (objValidador.validaEntrada()) {
        //   f_validaImport();
        reformatearImportes();
        objUtiles.ejecutarFormulario ("modal_axiscoa003.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);    
    }
}


/**
* Método que valida y formatea un campo numérico con el patrón ##.##,##. Si no se valida correctamente, devuelve un ''.
* @param {Object} valor a validar
* @param {Boolean} isDecimal: true->es decimal, false->no es decimal
* @param {Boolean} tienePuntoMiles: true->formatea puntos a los miles, false->no lo hace
* @return {String} Valor obtenido de la validación y formateo
*/
function valorFormateadoCampoNumerico (entrada, isDecimal, tienePuntoMiles){
    if (objNumero.validaNumero(entrada, isDecimal)){
        // Validación correcta, formatear valor 
        entrada = objNumero.formateaNumero(entrada, isDecimal);  
        if(!tienePuntoMiles) entrada = objNumero.quitarSeparadorMiles(entrada);
        
        }else{
            return '';
        }
        return entrada;
    }
   

        
function reformatearImportes(){
    objDom.setValorPorId("IIMPORT",valorFormateadoCampoNumerico(objDom.getValorPorId("IIMPORT"),true,true));            
}      
    </script>
  </head>
  <body onload="f_onload()">
  	<c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import><form name="miForm" action="" method="POST">
      <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="identificador" value="${__formdata.identificador}"/>
            <input type="hidden" name="IDREGISTRO" value="${__formdata.IDREGISTRO}"/>
            <input type="hidden" name="CTIPCOA" value="${__formdata.CAB_COASEGURO[0].CTIPCOA}"/>
            <input type="hidden" name="RECARGAR_PADRE_A_CANCELAR" value="${__formdata.RECARGAR_PADRE_A_CANCELAR}"/>
            <input type="hidden" name="PMODO" value="${(!empty ALTA)?1:0}"/>
            <input type="hidden" name="ALTA" value="${(!empty ALTA)?1:0}"/>

      <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt f="axiscoa003" c="TITCOA003" lit="9001947"/></c:param>
        <c:param name="form">axiscoa003</c:param>
      </c:import>
<!--      
__formdata.CAB_COASEGURO[0]=${__formdata.CAB_COASEGURO[0]}

__formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex]=${__formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex]}
-->
      <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <table class="seccion">
              <tr>
                <td>
                  <table class="area" align="center">
                    <tr>
                      <th style="width:25%;height:0px"></th>
                      <th style="width:25%;height:0px"></th>
                      <th style="width:25%;height:0px"></th>
                      <th style="width:25%;height:0px"></th>
                    </tr>
                    <tr>
                      <td class="campocaja" colspan="5">
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                          <img src="images/flecha.gif"/><axis:alt f="axiscoa003" c="TIT_COA" lit="9001947"/>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <axis:ocultar c="CCOMPANI" f="axiscoa003" dejarHueco="false">
                        <td class="titulocaja" colspan="2">
                          <b><axis:alt f="axiscoa003" c="CCOMPANI" lit="9904160"/></b>
                          <!-- Reaseguradora -->
                        </td>
                      </axis:ocultar>
                    </tr>
                    <tr>
                      <axis:ocultar c="CCOMPANI" f="axiscoa003" dejarHueco="false">
                        <td class="campocaja" colspan="2">
                          <input type="text" class="campo campotexto" style="width:12%;" size="9" value="${__formdata.CAB_COASEGURO[0].CCOMPANI}" name="CCOMPANI" id="CCOMPANI" <axis:atr f="axiscoa003" c="CCOMPANI" a="modificable=false"/> title="<axis:alt f="axiscoa003" c="CCOMPANI" lit="9902937"/>"/>
                          <input type="text" class="campo campotexto" style="width:70%;" size="15" value="${__formdata.CAB_COASEGURO[0].TCOMPANI}" name="TCOMPANI" id="TCOMPANI" <axis:atr f="axiscoa003" c="TCOMPANI" a="modificable=false"/> title="<axis:alt f="axiscoa003" c="TCOMPANI" lit="9904160"/>"/>
                        </td>
                      </axis:ocultar>
                    </tr>

                    <tr>
                      <axis:ocultar c="TMONEDA" f="axiscoa003" dejarHueco="false">
                        <td class="titulocaja">
                          <b><axis:alt f="axiscoa003" c="TMONEDA" lit="108645"/></b>
                          <!-- Moneda -->
                        </td>
                      </axis:ocultar>
                      <axis:ocultar c="NPOLIZA" f="axiscoa003" dejarHueco="false">
                        <td class="titulocaja">
                          <b><axis:alt f="axiscoa003" c="NPOLIZA" lit="111324"/></b>
                          <!-- Póliza -->
                        </td>
                      </axis:ocultar>
                      <axis:ocultar c="NRECIBO" f="axiscoa003" dejarHueco="false">
                        <td class="titulocaja"  id="tit_NRECIBO" >
                          <b id="label_NRECIBO" ><axis:alt f="axiscoa003" c="NRECIBO" lit="800636"/></b>
                          <!-- Recibo -->
                        </td>
                      </axis:ocultar>
                      <axis:ocultar c="SIDEPAG" f="axiscoa003" dejarHueco="false">
                        <td class="titulocaja" id="tit_SIDEPAG">
                          <b id="label_SIDEPAG"><axis:alt f="axiscoa003" c="SIDEPAG" lit="9904161"/></b>

                        </td>
                      </axis:ocultar>
                    </tr>
                    <tr>
                      <axis:ocultar c="TMONEDA" f="axiscoa003" dejarHueco="false">
                        <td class="campocaja">
                          <input type="text" class="campo campotexto" style="width:80%;" size="15" value="${__formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex].TMONEDA != null ? __formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex].TMONEDA : __formdata.TMONEDA}" name="TMONEDA" id="TMONEDA" <axis:atr f="axiscoa003" c="TMONEDA" a="modificable=false"/> title="<axis:alt f="axiscoa003" c="TMONEDA" lit="108645"/>"/>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar c="NPOLIZA" f="axiscoa003" dejarHueco="false">
                        <td class="campocaja">
                          <input type="text" class="campo campotexto" style="width:80%;" size="15" value="${__formdata.CAB_COASEGURO[0].NPOLIZA}" name="NPOLIZA" id="NPOLIZA" <axis:atr f="axiscoa003" c="NPOLIZA" a="modificable=false"/> title="<axis:alt f="axiscoa003" c="NPOLIZA" lit="111324"/>"/>
                          <input type="text" class="campo campotexto" style="width:15%;" size="15" value="${__formdata.CAB_COASEGURO[0].NCERTIF}" name="NCERTIF" id="NCERTIF" <axis:atr f="axiscoa003" c="NCERTIF" a="modificable=false"/> title="<axis:alt f="axiscoa003" c="NCERTIF" lit="101168"/>"/>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar c="NRECIBO" f="axiscoa003" dejarHueco="false">
                        <td class="campocaja" id="td_NRECIBO">
                          <input type="text" class="campo campotexto" style="width:80%;" size="15" value="${__formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex].NRECIBO != null ? __formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex].NRECIBO : __formdata.NRECIBO}" name="NRECIBO" id="NRECIBO" <axis:atr f="axiscoa003" c="NRECIBO" a="isInputText=true&obligatorio=false${(empty ALTA)?'&modificable=false':''}&formato=entero"/> title="<axis:alt f="axiscoa003" c="NRECIBO" lit="800636"/>" />
                        </td>
                      </axis:ocultar>
                      <axis:ocultar c="SIDEPAG" f="axiscoa003" dejarHueco="false">
                        <td class="campocaja" id="td_SIDEPAG">
                          <input type="text" class="campo campotexto" style="width:80%;" size="15" value="${__formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex].SIDEPAG != null ? __formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex].SIDEPAG : __formdata.SIDEPAG}" name="SIDEPAG" id="SIDEPAG" <axis:atr f="axiscoa003" c="SIDEPAG" a="isInputText=true&obligatorio=false${(empty ALTA)?'&modificable=false':''}&formato=entero"/> title="<axis:alt f="axiscoa003" c="SIDEPAG" lit="9904161"/>" />
                        </td>
                      </axis:ocultar>
                    </tr>

                    <tr>
                      <axis:ocultar c="FCIERRE" f="axiscoa003" dejarHueco="false">
                        <td class="titulocaja">
                          <b><axis:alt f="axiscoa003" c="FCIERRE" lit="9000490"/></b>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar c="CESTADO" f="axiscoa003" dejarHueco="false">
                        <td class="titulocaja">
                          <b><axis:alt f="axiscoa003" c="CESTADO" lit="101510"/></b>
                        </td>
                      </axis:ocultar>
                    </tr>
                    <tr>
                      <axis:visible c="FCIERRE" f="axiscoa003">
                        <td class="campocaja">
                          <!-- <fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCIERRE}"/> -->
                          <input type="text" style="width:50%;" class="campo campotexto" size="15" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex].FMOVIMI}" />" name="FCIERRE" id="FCIERRE" <axis:atr f="axiscoa003" c="FCIERRE" a="&formato=fecha${(empty ALTA)?'&modificable=false':''}"/> title="<axis:alt f="axiscoa003" c="FCIERRE" lit="9000490"/>"/>
                          <a style="vertical-align:middle;"><img id="icon_FCIERRE"  title="<axis:alt f=" axiscoa001" c="FCIERRE" lit="100890" />" src="images/calendar.gif"/></a>
                        </td>
                      </axis:visible>
                      <axis:ocultar c="CESTADO" f="axiscoa003" dejarHueco="false">
                        <td class="campocaja">
                          <select name="CESTADO" id="CESTADO" size="1" class="campowidthselect campo" <axis:atr f="axiscoa003" c="CESTADO" a="isInputText=false&obligatorio=true"/> title="<axis:alt f="axiscoa003" c="CESTADO" lit="101510"/>" >
                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axiscoa003" c="SNV_COMBO" lit="100587"/> - </option>
                            <c:forEach items="${ESTADO_CTA}" var="item">
                                <c:if test="${__formdata.IDREGISTRO=='-1' && (item.CATRIBU==1 || item.CATRIBU==3)}"><%--ecg si es alta, solo premitimos 1 o 3--%>
                                  <option value="${item.CATRIBU}" <c:if test="${__formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex].CESTADO==item.CATRIBU || __formdata.CESTADO==item.CATRIBU}">selected</c:if>>${item.TATRIBU}</option>
                                </c:if>
                                <c:if test="${__formdata.IDREGISTRO!='-1'}">
                                  <option value="${item.CATRIBU}" <c:if test="${__formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex].CESTADO==item.CATRIBU || __formdata.CESTADO==item.CATRIBU}">selected</c:if>>${item.TATRIBU}</option>
                                </c:if>
                            </c:forEach>
                          </select>
                        </td>
                      </axis:ocultar>
                      
                    </tr>
                    <tr>
                      <axis:ocultar c="TDESCRI" f="axiscoa003" dejarHueco="false">
                        <td class="titulocaja">
                          <b><axis:alt f="axiscoa003" c="TDESCRI" lit="100588"/></b>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar c="TDOCUME" f="axiscoa003" dejarHueco="false">
                        <td class="titulocaja">
                          <b><axis:alt f="axiscoa003" c="TDOCUME" lit="105330"/></b>
                        </td>
                      </axis:ocultar>
                    </tr>
                    <tr>
                      <axis:ocultar c="TDESCRI" f="axiscoa003" dejarHueco="false">
                        <td class="campocaja">
                          <input type="text" class="campo campotexto" size="15" value="${__formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex].TDESCRI != null ? __formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex].TDESCRI : __formdata.TDESCRI}" name="TDESCRI" id="TDESCRI" <axis:atr f="axiscoa003" c="TDESCRI" a=""/> title="<axis:alt f="axiscoa003" c="TDESCRI" lit="100588"/>"/>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar c="TDOCUME" f="axiscoa003" dejarHueco="false">
                        <td class="campocaja">
                          <input type="text" class="campo campotexto" size="15" value="${__formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex].TDOCUME != null ? __formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex].TDOCUME : __formdata.TDOCUME}" name="TDOCUME" id="TDOCUME" <axis:atr f="axiscoa003" c="TDOCUME" a=""/> title="<axis:alt f="axiscoa003" c="TDOCUME" lit="105330"/>"/>
                        </td>
                      </axis:ocultar>
                    </tr>
                    <tr>
                        <%--
                      <axis:ocultar c="CCONCEP" f="axiscoa003" dejarHueco="false">
                        <td class="titulocaja">
                          <b><axis:alt f="axiscoa003" c="CCONCEP" lit="9000715"/></b>
                        </td>
                      </axis:ocultar>
                      --%>
                      <axis:ocultar c="CIMPORT" f="axiscoa003" dejarHueco="false">
                        <td class="titulocaja" id="tit_CIMPORT">
                          <b id="label_CIMPORT"><axis:alt f="axiscoa003" c="CIMPORT" lit="9002015"/></b>
                        </td>
                      </axis:ocultar>
                      
                      <axis:ocultar c="CDEBHAB" f="axiscoa003" dejarHueco="false">
                        <td class="titulocaja">
                          <b><axis:alt f="axiscoa003" c="CDEBHAB" lit="9001948"/></b>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar c="IIMPORT" f="axiscoa003" dejarHueco="false">
                        <td class="titulocaja">
                          <b><axis:alt f="axiscoa003" c="IIMPORT" lit="100563"/></b>
                        </td>
                      </axis:ocultar>
                    </tr>
                    <tr>
                    <%--
                      <axis:ocultar c="CCONCEP" f="axiscoa003" dejarHueco="false">
                        <td class="campocaja">
                          <select name="CCONCEP" id="CCONCEP" size="1" class="campowidthselect campo"  <axis:atr f="axiscoa003" c="CCONCEP" a="&isInputText=false&obligatorio=true"/>>
                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axiscoa003" c="SNV_COMBO" lit="108341"/> - </option>
                            <c:forEach items="${LSTCONCEP_CTA}" var="item">
                              <option value="${item.CATRIBU}" <c:if test="${__formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex].CCONCEP==item.CATRIBU}}">selected</c:if>>${item.TATRIBU}</option>
                            </c:forEach>
                          </select>
                        </td>
                      </axis:ocultar>
                      --%>
                      <axis:ocultar c="CIMPORT" f="axiscoa003" dejarHueco="false">
                        <td class="campocaja" id="td_CIMPORT">
                          <select name="CIMPORT" id="CIMPORT" size="1" class="campowidthselect campo"  <axis:atr f="axiscoa003" c="CIMPORT" a="isInputText=false&obligatorio=true${(empty ALTA)?'&modificable=false':''}"/> onchange="f_cargar_propiedades_pantalla();" title="<axis:alt f="axiscoa003" c="CIMPORT" lit="9002015"/>">
                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axiscoa003" c="SNV_COMBO" lit="108341"/> - </option>
                            <c:forEach items="${TIPO_IMPORTE}" var="item">
                              <option value="${item.CATRIBU}" <c:if test="${__formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex].CIMPORT==item.CATRIBU || __formdata.CIMPORT==item.CATRIBU}">selected</c:if>>${item.TATRIBU}</option>
                            </c:forEach>
                          </select>
                        </td>
                      </axis:ocultar>
                      
                      <axis:ocultar c="CDEBHAB" f="axiscoa003" dejarHueco="false">
                        <td class="campocaja" id="td_CDEBHAB">
                          <select name="CDEBHAB" id="CDEBHAB" size="1" class="campowidthselect campo" <axis:atr f="axiscoa003" c="CDEBHAB" a="isInputText=false&obligatorio=true${(empty ALTA)?'&modificable=false':''}"/> title="<axis:alt f="axiscoa003" c="CDEBHAB" lit="9001948"/>">
                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axiscoa003" c="SNV_COMBO" lit="108341"/> -</option>
                              <option value="1" <c:if test="${__formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex].CDEBHAB==1 || __formdata.CDEBHAB==1}">selected</c:if>><axis:alt f="axiscoa003" c="CDEBHAB_DEBE" lit="9000499"/></option>
                              <option value="2" <c:if test="${__formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex].CDEBHAB==2 || __formdata.CDEBHAB==2}">selected</c:if>><axis:alt f="axiscoa003" c="CDEBHAB_DEBE" lit="101004"/></option>
                          </select>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar c="IIMPORT" f="axiscoa003" dejarHueco="false">
                        <td class="campocaja">
							<c:choose>
								<c:when test="${__formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex].TMONEDA == 'CLP' || __formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex].TMONEDA == 'UF'}">
									<input type="text" style="width:50%;" class="campo campotexto" size="15" value="<fmt:formatNumber pattern="#,##0.000000" value="${__formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex].IIMPORT != null ? __formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex].IIMPORT : __formdata.IIMPORT}"/>" name="IIMPORT" id="IIMPORT" title="<axis:alt f="axiscoa003" c="IIMPORT" lit="100563"/>" <axis:atr f="axiscoa003" c="IIMPORT" a="formato=decimal&obligatorio=true${(empty ALTA)?'&modificable=false':''}"/>  />
								</c:when>    
								<c:otherwise>
									<input type="text" style="width:50%;" class="campo campotexto" size="15" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex].IIMPORT != null ? __formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex].IIMPORT : __formdata.IIMPORT}"/>" name="IIMPORT" id="IIMPORT" title="<axis:alt f="axiscoa003" c="IIMPORT" lit="100563"/>" <axis:atr f="axiscoa003" c="IIMPORT" a="formato=decimal&obligatorio=true${(empty ALTA)?'&modificable=false':''}"/>  />
								</c:otherwise>
							</c:choose>
                        </td>
                      </axis:ocultar>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axiscoa003</c:param>
        <c:param name="__botones">cancelar<axis:visible c="BT_GUARDAR" f="axiscoa003">,aceptar</axis:visible></c:param>
      </c:import>
      <script type="text/javascript">
    Calendar.setup({
        inputField     :    "FCIERRE",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FCIERRE", 
        singleClick    :    true,
        firstDay       :    1
    });
    </script>
    </form><c:import url="../include/mensajes.jsp"/></body>
</html>