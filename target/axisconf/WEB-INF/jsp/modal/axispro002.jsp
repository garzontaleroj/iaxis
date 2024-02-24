<%/**
*  Fichero: axispro002.jsp
*  @author <a href="mailto:rkirchner@csi-ti.com">Roger Kirchner Villas</a>
*  @author <a href="mailto:echristen@csi-ti.com">Elmar Christen</a>
*   
*  Modal buscador de productos. 
*
*  Fecha: 09/04/2007
* Aplicando estilos nuevos/experimentales - 24.4.2008
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
        revisarEstilos();
        document.miForm.EMPRESA.focus();    
        f_cargar_propiedades_pantalla();        
    }
   
    // Primero miramos si hay alguna opción de la lista seleccionada
    function f_but_aceptar() {                    
        var hayChecked = objUtiles.f_GuardaCasillasChecked("radioProducto");
        if(typeof hayChecked == 'boolean') {
            alert(objJsMessages.jslit_selecciona_producto);
        }else{
            f_seleccionar (hayChecked);
        }
    }
    
    function f_but_cancelar() {                        
        parent.f_cerrar_modal("axispro002");                         
    }
    
    function f_but_buscar(){
        if (objValidador.validaEntrada()) {
            if(!objUtiles.estaVacio(document.getElementById("but_aceptar"))) 
                objDom.setDisabledPorId("but_aceptar", true);
            objUtiles.ejecutarFormulario("modal_axispro002.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
     }
    
    function f_seleccionar(SPRODUC){
        if (objUtiles.estaVacio(SPRODUC))
            alert (objJsMessages.jslit_error_de_seleccion);
        else
            parent.f_aceptar_axispro002(SPRODUC);
     }  
     
     function f_llenar_ramos(valor){
           objAjax.invokeAsyncCGI("modal_axispro002.do", callbackAjaxRecuperarRamos, "operation=ajax_recuperar_ramos&CVALOR="+valor, this, objJsMessages.jslit_actualizando_registro);
    }
    
    function callbackAjaxRecuperarRamos(ajaxResponseText){
            try {  
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {                                
                    var elementos = doc.getElementsByTagName("element");
                    var modelocombo = document.miForm.RAMO;     
                    objDom.borrarOpcionesDeCombo(modelocombo);
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        var elementos = doc.getElementsByTagName("element");
                        var modelocombo = document.miForm.RAMO;     
                        objDom.borrarOpcionesDeCombo(modelocombo);
                        objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "<axis:alt f="axispro002" c="RAMO" lit="108341"/>", modelocombo, 0);
                        for (i = 0; i < elementos.length; i++) {
                            var codigo = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CRAMO")[0]) ?
                                         objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CRAMO"), 0, 0) : "";
                            var desc   = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("TRAMO")[0]) ?
                                         objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TRAMO"), 0, 0): "";
                            objDom.addOpcionACombo(codigo, desc, modelocombo, i+1);
                        }
                        
                    }
                    if (elementos.length == 0){
                        objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "Seleccione", modelocombo, 0);
                        var elementos = doc.getElementsByTagName("element");
                        var versioncombo = document.miForm.RAMO;     
                        objDom.borrarOpcionesDeCombo(versioncombo);
                        objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "Seleccione", versioncombo, 0);
                    }
                    
                } 
             } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
               }
            }
    
</script>
</head>
<body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation" value=""/>

        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axispro002" c="formulario" lit="1000218"/></c:param>
            <c:param name="producto"><axis:alt f="axispro002" c="producto" lit="1000218"/></c:param>
            <c:param name="form">axispro002</c:param>
        </c:import>

        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">        
            <tr>
                <td>
                    <table class="seccion">
                        <tr>
                            <!-- Empresa -->                                      
                            <td class="titulocaja">
                                <b><axis:alt f="axispro002" c="titulocaja" lit="101619"/></b>
                            </td>
                            <!-- Cod. Compañía -->       
                             <axis:ocultar f="axispro002" c="CCOMPANI" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro002" c="CCOMPANI" lit="102082"/></b>
                                    </td>
                            </axis:ocultar>
                            <!-- Ramo -->
                            <td class="titulocaja">
                                <b><axis:alt f="axispro002" c="titulocaja" lit="100784"/></b>
                            </td>
                            <!-- Agrupación -->
                            <td class="titulocaja">
                                <b><axis:alt f="axispro002" c="titulocaja" lit="111471"/></b>
                            </td>
                            <!-- Activo -->
                            <td class="titulocaja">
                                <b><axis:alt f="axispro002" c="titulocaja" lit="100786"/></b>
                            </td>
                        </tr>
                        <tr>
                            <!-- Empresa -->                                      
                            <td class="campocaja">
                                 <select name="EMPRESA" id ="EMPRESA" size="1" class="campowidthselect campo campotexto" onchange="f_llenar_ramos(this.value)" style="width:180px">
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro002" c="EMPRESA" lit="1000348"/> - </option>
                                    <c:forEach var="EMPRESA" items="${EMPRESAS}">
                                        <option value="${EMPRESA.CEMPRES}"
                                        <c:if test="${!empty __formdata.EMPRESA && EMPRESA.CEMPRES == __formdata.EMPRESA}"> selected </c:if>>
                                        ${EMPRESA.TEMPRES}</option>
                                    </c:forEach>
                                </select>

                            </td> 
                            <!-- Companyia productos -->
                            <axis:ocultar f="axispro002" c="CCOMPANI" dejarHueco="false">
                            <td class="campocaja">
                                <select name="CCOMPANI" id ="CCOMPANI" size="1" class="campowidthselect campo campotexto" onchange="" style="width:180px">
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro002" c="CCOMPANI" lit="1000348"/> - </option>
                                    <c:forEach var="CIA" items="${CIAS}">
                                        <option value="${CIA.CCOMPANI}"
                                        <c:if test="${!empty __formdata.CCOMPANI && CIA.CCOMPANI == __formdata.CCOMPANI}"> selected </c:if>>
                                        ${CIA.TCOMPANI}
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                            <!-- Ramo -->
                            <td class="campocaja">
                                <select name="RAMO" id ="RAMO" size="1" class="campowidthselect campo campotexto" style="width:180px">
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro002" c="RAMO" lit="1000348"/> - </option>
                                    <c:forEach var="RAMO" items="${RAMOS}">
                                        <option value="${RAMO.CRAMO}"
                                        <c:if test="${!empty __formdata.RAMO && RAMO.CRAMO == __formdata.RAMO}"> selected </c:if>>
                                        ${RAMO.TRAMO}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <!-- Agrupación -->
                            <td class="campocaja" style="width:150px">
                                <select name="AGRUPACION" id ="AGRUPACION" size="1" class="campowidthselect campo campotexto">
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro002" c="AGRUPACION" lit="1000348"/> - </option>
                                    <c:forEach var="AGRUPACION" items="${AGRUPACIONES}">
                                          <option value="${AGRUPACION.CATRIBU}"
                                          <c:if test="${!empty __formdata.AGRUPACION && AGRUPACION.CATRIBU == __formdata.AGRUPACION}"> selected </c:if>>
                                          ${AGRUPACION.TATRIBU}</option>
                                      </c:forEach>
                                </select>
                            </td>
                            <!-- Activo -->
                            <td class="campocaja">
                                <select name="ACTIVO" id="ACTIVO" size="1" class="campowidthselect campo campotexto" style="width:50px">
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro002" c="ACTIVO" lit="1000348"/> - </option>
                                    <option value="1"
                                    <c:if test="${__formdata.ACTIVO != 'null' && __formdata.ACTIVO == '1'}"> selected </c:if>>
                                    <axis:alt f="axispro002" c="ACTIVO" lit="101778"/></option>
                                    <option value="0"
                                    <c:if test="${__formdata.ACTIVO != 'null' && __formdata.ACTIVO == '0'}"> selected </c:if>>
                                    <axis:alt f="axispro002" c="ACTIVO" lit="101779"/></option>
                                </select>
                            </td>
                        </tr>
                    </table>
                    <div class="separador">&nbsp;</div>
                    <c:set var="title0"><axis:alt f="axispro002" c="title0" lit="101619"/></c:set>
                    <c:set var="title1"><axis:alt f="axispro002" c="title1" lit="100829"/></c:set>
                    <c:set var="title2"><axis:alt f="axispro002" c="title2" lit="100588"/></c:set>
                    <c:set var="title3"><axis:alt f="axispro002" c="title3" lit="100784"/></c:set>
                    <c:set var="title4"><axis:alt f="axispro002" c="title4" lit="100786"/></c:set>
                    <c:set var="title5"><axis:alt f="axispro002" c="title5" lit="9000600"/></c:set>  <!--Companyia-->
                    <div class="seccion displayspaceGrande">
                        <display:table name="${LISTAPRODUCTOS}" id="LISTAPRODUCTOS" export="false" class="dsptgtable" pagesize="8" defaultsort="2" defaultorder="ascending" requestURI="modal_axispro002.do?operation=form&paginar=true" sort="list" cellpadding="0" cellspacing="0">
                        <%@ include file="../include/displaytag.jsp"%>
                        <display:column headerClass="headwidth5 sortable" title="" media="html" autolink="false" >
                            <div class="dspIcons">
                            <input value="${LISTAPRODUCTOS['SPRODUC']}" type="radio" onclick="" id="radioProducto" name="radioProducto"/></div>
                        </display:column>
                        <display:column title="${title0}" sortable="true" sortProperty="TEMPRES" headerClass="sortable"  media="html" autolink="false" >
                            <div class="dspText"><a href="javascript:f_seleccionar('${LISTAPRODUCTOS['SPRODUC']}')">${LISTAPRODUCTOS['TEMPRES']}</a></div>
                        </display:column>
                        <display:column title="${title1}" sortable="true" sortProperty="CODIPROD" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                            <div class="dspText"><a href="javascript:f_seleccionar('${LISTAPRODUCTOS['SPRODUC']}')">${LISTAPRODUCTOS['CODIPROD']}</a></div>
                        </display:column>                        
                        <display:column title="${title2}" sortable="true" sortProperty="TTITULO" headerClass="sortable"  media="html" autolink="false" >
                            <div class="dspText"><a href="javascript:f_seleccionar('${LISTAPRODUCTOS['SPRODUC']}')">${LISTAPRODUCTOS['TTITULO']}</a></div>
                        </display:column>
                        <display:column title="${title3}" sortable="true" sortProperty="TRAMO" headerClass="sortable"  media="html" autolink="false" >
                            <div class="dspText"><a href="javascript:f_seleccionar('${LISTAPRODUCTOS['SPRODUC']}')">${LISTAPRODUCTOS['TRAMO']}</a></div>
                        </display:column>                        
                        <axis:visible f="axispro002" c="CCOMPANI">
                            <display:column title="${title5}" sortable="true" sortProperty="ACTIVO" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText"><a href="javascript:f_seleccionar('${LISTAPRODUCTOS['SPRODUC']}')">${LISTAPRODUCTOS['TCOMPANI']}</a></div>
                            </display:column>                            
                        </axis:visible>
                        <display:column title="${title4}" sortable="true" sortProperty="ACTIVO" style="width:7%" headerClass="sortable"  media="html" autolink="false" >
                            <div class="dspText"><a href="javascript:f_seleccionar('${LISTAPRODUCTOS['SPRODUC']}')">${LISTAPRODUCTOS['ACTIVO']}</a></div>
                        </display:column>                        
                        </display:table>
                        <c:choose>
                        <c:when test="${!empty LISTAPRODUCTOS}">
                            <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                <script language="javascript">objUtiles.retocarDsptagtable("LISTAPRODUCTOS");</script>
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
        </table>
        
        <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axispro002</c:param>
                <c:param name="__botones">cancelar,buscar,aceptar</c:param>
            </c:import>   
    </form>
    
    <c:import url="../include/mensajes.jsp" />
    
</body>
</html>