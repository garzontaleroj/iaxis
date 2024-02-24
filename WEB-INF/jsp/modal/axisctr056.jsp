<%/**
*  Fichero: axisctr056.jsp
*  @author <a href="mailto:jsanchez@csi-ti.com">Jordi Sanchez</a>
*   
*  Modal buscador de agenda de poliza
*
*  Fecha: 10/03/2009
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
<% String codPantalla = "axisctr056"; %>
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

    function f_onload() {
        revisarEstilos();
        //document.miForm.NPOLIZA.focus();
        document.getElementById("NPOLIZA").focus();
        f_cargar_propiedades_pantalla();
    }

   
    // Primero miramos si hay alguna opción de la lista seleccionada
    function f_but_aceptar() {                    
        var hayChecked = objUtiles.f_GuardaCasillasChecked("radioApunteAgenda");
        if(typeof hayChecked == 'boolean') {
            alert("<axis:alt f="axisctr056" c="titulo" lit="9001554"/>");
        }else{
            f_seleccionar (hayChecked);
        }
    }
   
    function f_but_cancelar() {
        parent.f_cerrar_axisctr056();
    }      
    
    function f_but_9000508(){
        if (objValidador.validaEntrada()) {
            if(!objUtiles.estaVacio(document.getElementById("but_aceptar"))) 
                objDom.setDisabledPorId("but_aceptar", true);
            objUtiles.ejecutarFormulario("modal_axisctr056.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
    }
    
    function f_but_nuevo() {
       parent.f_abrir_axisctr019(0);
    }    
    
    function f_seleccionar(cadena){
        if (objUtiles.estaVacio(cadena))
            alert (objJsMessages.jslit_error_de_seleccion);
        else
            parent.f_aceptar_axisctr056(cadena);
    }        
    
    function f_seleccionarAge(cadena){
        parent.f_aceptar_axisctr056(cadena);
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
            <c:param name="producto"><axis:alt f="axisctr056" c="producto" lit="9001188"/></c:param>
            <c:param name="form">axisctr056</c:param>
        </c:import>

        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table class="seccion">
                        <tr>
                            <!-- póliza -->   
                            <axis:ocultar f="axisctr056" c="NPOLIZA" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr056" c="NPOLIZA" lit="100624"/></b>
                            </td>
                            </axis:ocultar>
                            <!-- certificado -->   
                            <axis:ocultar f="axisctr056" c="NCERTIF" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr056" c="NCERTIF" lit="101168"/></b>
                            </td>
                            </axis:ocultar>
                            <!-- N. Apunte -->
                            <axis:ocultar f="axisctr056" c="NLINEA" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr056" c="NLINEA" lit="9001189"/></b>
                            </td>
                            </axis:ocultar>
                            <!-- Concepto Apunte -->
                            <axis:ocultar f="axisctr056" c="CTIPREG" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr056" c="CTIPREG" lit="9001190"/></b>
                            </td>
                            </axis:ocultar>
                            <!-- Estado Apunte -->
                            <axis:ocultar f="axisctr056" c="CESTADO" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr056" c="CESTADO" lit="9001191"/></b>
                            </td>
                            </axis:ocultar>
                            <!-- Fecha Alta -->
                            <axis:ocultar f="axisctr056" c="FALTA" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr056" c="FALTA" lit="9001192"/></b>
                            </td>
                            </axis:ocultar>
                            <!-- Usuario -->
                            <axis:ocultar f="axisctr056" c="CUSUARI" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr056" c="CUSUARI" lit="100894"/></b>
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <!-- póliza -->      
                            <axis:ocultar f="axisctr056" c="NPOLIZA" dejarHueco="false">
                            <td class="campocaja" style="width:10%">
                                <input type="text" name="NPOLIZA" id="NPOLIZA" size="15" obligatorio ="uno_oblig" class="campowidthinput campo campotexto" value="${__formdata.NPOLIZA}" 
                                style="width:90%;" onchange="" title="<axis:alt f="axisctr056" c="NPOLIZA" lit="100624"/>"
                                <axis:atr f="axisctr056" c="NPOLIZA" a="formato=entero"/> />
                            </td> 
                            </axis:ocultar>
                            <!-- certificado -->
                            <axis:ocultar f="axisctr056" c="NCERTIF" dejarHueco="false">
                            <td class="campocaja" style="width:10%">
                                <input type="text" name="NCERTIF" id="NCERTIF" size="15" class="campowidthinput campo campotexto" value="${__formdata.NCERTIF}" 
                                style="width:50%;" onchange="" title="<axis:alt f="axisctr056" c="NCERTIF" lit="101168"/>"
                                <axis:atr f="axisctr056" c="NCERTIF" a="formato=entero"/> />
                            </td> 
                            </axis:ocultar>
                            <!-- N. Apunte -->
                            <axis:ocultar f="axisctr056" c="NLINEA" dejarHueco="false">
                            <td class="campocaja" style="width:10%">
                                <input type="text" name="NLINEA" id="NLINEA" size="15" obligatorio ="uno_oblig" class="campowidthinput campo campotexto"  value="${__formdata.NLINEA}"  
                                style="width:90%;" onchange="f_onchange_NLINEA()" title="<axis:alt f="axisctr056" c="NLINEA" lit="9001189"/>"
                                <axis:atr f="axisctr056" c="NLINEA" a="formato=entero"/> />
                            </td>
                            </axis:ocultar>

                            <!-- Concepto Apunte -->
                            <axis:ocultar f="axisctr056" c="CTIPREG" dejarHueco="false"> 
                            <td class="campocaja" style="width:20%">
                                <select name="CTIPREG" id ="CTIPREG" size="1" obligatorio ="uno_oblig" <axis:atr f="axisctr056" c="CTIPREG"/> class="campowidthselect campo campotexto">
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr056" c="CTIPREG" lit="9001190"/> - </option>
                                    <c:forEach var="element" items="${__formdata.listValores.LSTCONCEPTOSAPUNTEAGENDA}">
                                          <option value="${element.CATRIBU}"
                                          <c:if test="${__formdata.CTIPREG != 'null' && element.CATRIBU == __formdata.CTIPREG}"> selected </c:if>>
                                          ${element.TATRIBU}</option>
                                      </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                            
                            <!-- Estado Apunte -->
                            <axis:ocultar f="axisctr056" c="CESTADO" dejarHueco="false">
                            <td class="campocaja" style="width:15%">
                                <select name="CESTADO" id ="CESTADO" size="1" obligatorio ="uno_oblig" <axis:atr f="axisctr056" c="CESTADO"/> class="campowidthselect campo campotexto">
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr056" c="CESTADO" lit="9001191"/> - </option>
                                    <c:forEach var="element" items="${__formdata.listValores.LSTESTADOSAPUNTEAGENDA}">
                                          <option value="${element.CATRIBU}"
                                          <c:if test="${__formdata.CESTADO != 'null' && element.CATRIBU == __formdata.CESTADO}"> selected </c:if>>
                                          ${element.TATRIBU}</option>
                                      </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                            <!-- Fecha Alta -->
                            <axis:ocultar f="axisctr056" c="FALTA" dejarHueco="false">
                            <td class="campocaja">
                                <input type="text" name="FALTA" id="FALTA" size="15" obligatorio ="uno_oblig" class="campowidthinput campo campotexto"  style="width:50%;"
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FALTA}"/>" 
                                title="<axis:alt f="axisctr056" c="FALTA" lit="9001192"/>"
                                <axis:atr f="axisctr056" c="FALTA" a="formato=fecha"/> /><a style="vertical-align:middle;"><img
                                id="icon_FALTA" border=0 alt="<axis:alt f="axisctr056" c="FALTA" lit="9001192"/>" title="<axis:alt f="axisctr056" c="FALTA" lit="9001192"/>" src="images/calendar.gif"/></a>
                            </td>
                            </axis:ocultar>
                            <!-- Usuario -->
                            <axis:ocultar f="axisctr056" c="CUSUARI" dejarHueco="false">
                            <td class="campocaja" style="width:20%">
                                <select name="CUSUARI" id ="CUSUARI" size="1" obligatorio ="uno_oblig" <axis:atr f="axisctr056" c="CUSUARI"/> class="campowidthselect campo campotexto">
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr056" c="CUSUARI" lit="100894"/> - </option>
                                    <c:forEach var="element" items="${__formdata.listValores.LSTUSUARIOSAGENDA}">
                                          <option value="${element.CUSER}">
                                          ${element.CUSER}</option>
                                      </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                        </tr>
                    </table>
                    <div class="separador">&nbsp;</div>
                    <c:set var="title0"><axis:alt f="axisctr056" c="title0" lit="100624"/></c:set> <!-- póliza -->
                    <c:set var="title10"><axis:alt f="axisctr056" c="title10" lit="101168"/></c:set> <!-- certificado -->
                    <c:set var="title1"><axis:alt f="axisctr056" c="title1" lit="9001189"/></c:set> <!-- Nº apunte -->
                    <c:set var="title2"><axis:alt f="axisctr056" c="title2" lit="9000715"/></c:set> <!-- Concepto -->
                    <c:set var="title3"><axis:alt f="axisctr056" c="title3" lit="9001195"/></c:set> <!-- Tipo apunte -->
                    <c:set var="title4"><axis:alt f="axisctr056" c="title4" lit="9001192"/></c:set> <!-- Fecha alta -->
                    <c:set var="title5"><axis:alt f="axisctr056" c="title5" lit="9001196"/></c:set> <!-- Título apunte -->
                    <c:set var="title6"><axis:alt f="axisctr056" c="title6" lit="9001197"/></c:set> <!-- Texto apunte -->
                    <c:set var="title7"><axis:alt f="axisctr056" c="title7" lit="100894"/></c:set> <!-- Usuario -->
                    <c:set var="title8"><axis:alt f="axisctr056" c="title8" lit="100587"/></c:set> <!-- Estado -->
                    <c:set var="title9"><axis:alt f="axisctr056" c="title9" lit="9001198"/></c:set> <!-- Fecha finalización -->
                
                    <div class="seccion displayspaceGrande">
                        <display:table name="${sessionScope.LISTAAPUNTESAGENDA}" id="LISTAAPUNTESAGENDA" export="false" class="dsptgtable" pagesize="8"  
                        requestURI="modal_axisctr056.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                        <%@ include file="../include/displaytag.jsp"%>
                        <display:column headerClass="headwidth5 sortable" title="" media="html" autolink="false" style="width:1%">
                            <div class="dspIcons">
                            <input value="${LISTAAPUNTESAGENDA['SSEGURO']}#${LISTAAPUNTESAGENDA['NLINEA']}" type="radio" onclick="" id="radioApunteAgenda" name="radioApunteAgenda"/></div>
                        </display:column>
                        <display:column title="${title0}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable"  media="html" autolink="false" style="width:8%">
                           <div class="dspText"><a href="javascript:f_seleccionarAge('${LISTAAPUNTESAGENDA['SSEGURO']}#${LISTAAPUNTESAGENDA['NLINEA']}')">${LISTAAPUNTESAGENDA['NPOLIZA']}</a></div>
                        </display:column>
                        <display:column title="${title10}" sortable="true" sortProperty="NCERTIF" headerClass="sortable"  media="html" autolink="false" style="width:8%">
                           <div class="dspText"><a href="javascript:f_seleccionarAge('${LISTAAPUNTESAGENDA['SSEGURO']}#${LISTAAPUNTESAGENDA['NLINEA']}')">${LISTAAPUNTESAGENDA['NCERTIF']}</a></div>
                        </display:column>
                        <display:column title="${title1}" sortable="true" sortProperty="NLINEA" headerClass="headwidth10 sortable"  media="html" autolink="false" style="width:2%">
                            <div class="dspText"><a href="javascript:f_seleccionarAge('${LISTAAPUNTESAGENDA['SSEGURO']}#${LISTAAPUNTESAGENDA['NLINEA']}')">${LISTAAPUNTESAGENDA['NLINEA']}</a></div>                            
                        </display:column>                        
                        <display:column title="${title2}" sortable="true" sortProperty="TTIPREG" headerClass="sortable"  media="html" autolink="false" style="width:8%">
                            <div class="dspText"><a href="javascript:f_seleccionarAge('${LISTAAPUNTESAGENDA['SSEGURO']}#${LISTAAPUNTESAGENDA['NLINEA']}')">${LISTAAPUNTESAGENDA['TTIPREG']}</a></div>                                                        
                        </display:column>
                        <display:column title="${title3}" sortable="true" sortProperty="TMANUAL" headerClass="sortable"  media="html" autolink="false" style="width:8%">
                            <div class="dspText"><a href="javascript:f_seleccionarAge('${LISTAAPUNTESAGENDA['SSEGURO']}#${LISTAAPUNTESAGENDA['NLINEA']}')">${LISTAAPUNTESAGENDA['TMANUAL']}</a></div>                            
                        </display:column>
                        <display:column title="${title4}" sortable="true" sortProperty="FALTA" headerClass="sortable"  media="html" autolink="false" style="width:9%">
                            <div class="dspText"><a href="javascript:f_seleccionarAge('${LISTAAPUNTESAGENDA['SSEGURO']}#${LISTAAPUNTESAGENDA['NLINEA']}')">
                                <fmt:formatDate value='${LISTAAPUNTESAGENDA.FALTA}' pattern='dd/MM/yyyy'/>
                            </a></div>                            
                        </display:column>
                        <display:column title="${title5}" sortable="true" sortProperty="TTITULO" headerClass="sortable"  media="html" autolink="false" style="width:17%">
                            <div class="dspText"><a href="javascript:f_seleccionarAge('${LISTAAPUNTESAGENDA['SSEGURO']}#${LISTAAPUNTESAGENDA['NLINEA']}')">${LISTAAPUNTESAGENDA['TTITULO']}</a></div>                            
                        </display:column>
                        <display:column title="${title6}" sortable="true" sortProperty="TEXTOS" headerClass="sortable"  media="html" autolink="false" style="width:10%">
                            <div class="dspText"><a href="javascript:f_seleccionarAge('${LISTAAPUNTESAGENDA['SSEGURO']}#${LISTAAPUNTESAGENDA['NLINEA']}')">${LISTAAPUNTESAGENDA['TEXTOS']}</a></div>                            
                        </display:column>
                        <display:column title="${title7}" sortable="true" sortProperty="CUSUALT" headerClass="sortable"  media="html" autolink="false" style="width:8%">
                            <div class="dspText"><a href="javascript:f_seleccionarAge('${LISTAAPUNTESAGENDA['SSEGURO']}#${LISTAAPUNTESAGENDA['NLINEA']}')">${LISTAAPUNTESAGENDA['CUSUALT']}</a></div>                            
                        </display:column>
                        <display:column title="${title8}" sortable="true" sortProperty="TESTADO" headerClass="sortable"  media="html" autolink="false" style="width:8%">
                            <div class="dspText"><a href="javascript:f_seleccionarAge('${LISTAAPUNTESAGENDA['SSEGURO']}#${LISTAAPUNTESAGENDA['NLINEA']}')">${LISTAAPUNTESAGENDA['TESTADO']}</a></div>                            
                        </display:column>
                        <display:column title="${title9}" sortable="true" sortProperty="FFINALI" headerClass="sortable"  media="html" autolink="false" style="width:13%">
                            <div class="dspText"><a href="javascript:f_seleccionarAge('${LISTAAPUNTESAGENDA['SSEGURO']}#${LISTAAPUNTESAGENDA['NLINEA']}')">
                            <fmt:formatDate value='${LISTAAPUNTESAGENDA.FFINALI}' pattern='dd/MM/yyyy'/></a></div>                            
                        </display:column>
                        </display:table>
                        <c:choose>
                        <c:when test="${!empty LISTAAPUNTESAGENDA}">
                            <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                <script language="javascript">objUtiles.retocarDsptagtable("LISTAAPUNTESAGENDA");</script>
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
                <c:param name="f">axisctr056</c:param>
                <c:param name="__botones">cancelar,9000508,aceptar<axis:visible f="axisctr056" c = "BT_NUEVO">,nuevo</axis:visible></c:param>
            </c:import>           
    </form>
    
    <c:import url="../include/mensajes.jsp" />
    
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FALTA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FALTA", 
            singleClick    :    true,
            firstDay       :    1
        });
     </script>

</body>
</html>