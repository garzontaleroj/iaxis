<%/**
*  Fichero: axismnt030.jsp
*  @author <a href="mailto:jaesteban@csi-ti.com">Johan Esteban</a>
*   
*  Modal - Calcula fecha
*
*  Fecha: 18/03/2016
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
<% String codPantalla = "axismnt030"; %>
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
      <script type="text/javascript" src="scripts/jsFecha.js"></script>
      <c:import url="../include/carga_framework_js.jsp" />
    <!--*********************************** -->

<script language="Javascript" type="text/javascript">

    function f_onload() {
        f_cargar_propiedades_pantalla();
    }
    
    function f_but_salir() {
        objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axismnt030", "cancelar", document.miForm, "_self");
    }
    
    function f_but_buscar() {
        objUtiles.ejecutarFormulario ("axis_axismnt030.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
    }    

</script>
</head>
<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
  
    
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation" value=""/>

        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axismnt030" c="TITULOPANTA" lit="9910034"/></c:param>
            <c:param name="producto"><axis:alt f="axismnt030" c="TITULOPANTA" lit="9910034"/></c:param>
            <c:param name="form">axismnt030</c:param>
        </c:import>
        
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>                    
                    <table class="seccion">
                        <tr><div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axismnt030" c="LIT_9001754" lit="9001754" /></div></tr>
                        
                        <td align="left">
                            <table class="area" align="center">
                                <tr>
                                    <th style="width:15%;height:0px"></th>
                                    <th style="width:15%;height:0px"></th>
                                    <th style="width:15%;height:0px"></th>
                                    <th style="width:55%;height:0px"></th>
                                </tr>
                                
                                <tr>                                    
                                    <axis:ocultar f="axismnt030" c="NOMBRETABLA" >
                                        <td class="titulocaja" style="white-space:nowrap">
                                            <b id="label_NOMBRETABLA" align="right"><axis:alt f="axismnt030" c="LIT_9910035" lit="9910035" /></b>
                                        </td>                                          
                                    </axis:ocultar>
                                        
                                    <axis:ocultar f="axismnt030" c="NOMBRECOLUMNA"  >
                                        <td class="titulocaja" style="white-space:nowrap">
                                            <b id="label_NOMBRECOLUMNA"><axis:alt f="axismnt030" c="LIT_9910036" lit="9910036" /></b>
                                        </td>
                                    </axis:ocultar>

                                    <axis:ocultar f="axismnt030" c="USUARIO"  >
                                        <td class="titulocaja" style="white-space:nowrap">
                                            <b id="label_USUARIO"><axis:alt f="axismnt030" c="LIT_9905097" lit="9905097" /></b>
                                        </td>
                                    </axis:ocultar>
                                </tr>
                                
                                <tr>
                                    <axis:ocultar f="axismnt030" c="NOMBRETABLA" >
                                        <td class="campocaja"  style="white-space:nowrap">
                                            <input style="width:80%" type="text" class="campowidthinput campo campotexto" id="NOMBRETABLA" name="NOMBRETABLA" size="15"
                                            <axis:atr f="axismnt030" c="NOMBRETABLA" a="modificable=true&obligatorio=false"/>
                                            value="${__formdata.NOMBRETABLA}"
                                            title="<axis:alt f="axismnt030" c="LIT_9910035" lit="9910035"/>"/>
                                        </td>
                                    </axis:ocultar>
                                    
                                   <axis:ocultar f="axismnt030" c="NOMBRECOLUMNA" >
                                        <td class="campocaja">
                                            <input type="text" style="width:80%" class="campowidthinput campo campotexto" id="NOMBRECOLUMNA" name="NOMBRECOLUMNA" title="<axis:alt f="axismnt030" c="LIT_9910036" lit="9910036"/>"
                                            size="15"  value ="${__formdata.NOMBRECOLUMNA}" <axis:atr f="axismnt030" c="NOMBRECOLUMNA" a="modificable=true&obligatorio=false"/>/>
                                        </td>
                                    </axis:ocultar>
									
                                   <axis:ocultar f="axismnt030" c="USUARIO" >
                                        <td class="campocaja">
                                            <input type="text" 
                                                   style="width:80%" 
                                                   class="campowidthinput campo campotexto" 
                                                   id="USUARIO" name="USUARIO" 
                                                   title="<axis:alt f="axismnt030" c="LIT_9905097" lit="9905097"/>"
                                                   size="15">
                                            </input>
                                        </td>
                                    </axis:ocultar>                                  
                                </tr>
                                
                                <tr>
                                
                                    <axis:ocultar f="axismnt030" c="FEFEPLAZO" >
                                        <td class="titulocaja" style="white-space:nowrap">
                                            <b id="label_FEFEPLAZO" align="right"><axis:alt f="axismnt030" c="LIT_9908885" lit="9908885" /></b>
                                        </td>                                          
                                    </axis:ocultar>
                                    
                                    <td class="titulocaja" style="white-space:nowrap">
                                        <axis:ocultar f="axismnt030" c="FECHAFIN" >
                                            <b id="label_FECHAFIN"><axis:alt f="axismnt030" c="LIT_9908886" lit="9908886" /></b>
                                        </axis:ocultar>
                                    </td>
                                </tr>
                                
                                <tr>
                                   <axis:ocultar f="axismnt030" c="FEFEPLAZO" >
                                        <td class="campocaja"  style="white-space:nowrap"> 
                                            <c:set var="FEFEPLAZO"><fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEFEPLAZO}"/></c:set>
                                            <input style="width:80px" maxlength="10" type="text" class="campowidthinput campo campotexto" id="FEFEPLAZO" name="FEFEPLAZO" size="15"
                                            <axis:atr f="axismnt030" c="FECHAFIN" a="modificable=true&obligatorio=false&formato=fecha"/>
                                            value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEFEPLAZO}"/>"
                                            title="<axis:alt f="axismnt030" c="LIT_9908885" lit="9908885"/>"/><a id="icon_FEFEPLAZO" style="vertical-align:middle;"><img 
                                            alt="<axis:alt f="axismnt030" c="LIT_108341" lit="108341"/>" title="<axis:alt f="axismnt030" c="LIT_9908885" lit="9908885" />" src="images/calendar.gif"/></a>
                                        </td>
                                    </axis:ocultar>
                                    
                                    <axis:ocultar f="axismnt030" c="FECHAFIN" >
                                        <td class="campocaja"  style="white-space:nowrap"> 
                                            <c:set var="FECHAFIN"><fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FECHAFIN}"/></c:set>
                                            <input style="width:80px" maxlength="10" type="text" class="campowidthinput campo campotexto" id="FECHAFIN" name="FECHAFIN" size="15"
                                            <axis:atr f="axismnt030" c="FECHAFIN" a="modificable=true&obligatorio=false&formato=fecha"/>
                                            value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FECHAFIN}"/>"
                                            title="<axis:alt f="axismnt030" c="LIT_9908886" lit="9908886"/>"/><a id="icon_FECHAFIN" style="vertical-align:middle;"><img 
                                            alt="<axis:alt f="axismnt030" c="LIT_108341" lit="108341"/>" title="<axis:alt f="axismnt030" c="LIT_9908886" lit="9908886" />" src="images/calendar.gif"/></a>
                                        </td>
                                    </axis:ocultar>
                                </tr>
                            </table>
                        </td>
                    </table>
                    
                    <div class="separador">&nbsp; </div>                         
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axismnt030" c="RESULTADOS_TIT" lit="1000345" /></div>
                    <table class="seccion">
                        <tr>
                            <td>
                                <table class="area" align="center">
                                    <tr>
                                        <td>
                                            <div class="separador">&nbsp; </div>
                                            <c:set var="title0"><axis:alt f="axismnt030" c="NOMBRETABLA" lit="9910035"/></c:set>  <%-- Nombre tabla --%>
                                            <c:set var="title1"><axis:alt f="axismnt030" c="IDENTIFICADOR" lit="Identificadores"/></c:set>   <%-- Identificador Registro --%>
                                            <c:set var="title2"><axis:alt f="axismnt030" c="NOMBRECOLUMNA" lit="9910036"/></c:set>  <%-- Nombre columna --%>
                                            <c:set var="title3"><axis:alt f="axismnt030" c="VALOR_ANT" lit="9904557"/></c:set>  <%-- Valor anterior --%>
                                            <c:set var="title4"><axis:alt f="axismnt030" c="VALOR_ACT" lit="9906269"/></c:set>  <%-- Valor actual --%>
                                            <c:set var="title5"><axis:alt f="axismnt030" c="USUARIO_MOD" lit="9001265"/></c:set>  <%-- Usuario Modificación --%>
                                            <c:set var="title6"><axis:alt f="axismnt030" c="FECHA_MOD" lit="9000564"/></c:set>  <%-- Fecha Modificación --%>
                                            
                                            <div class="displayspaceMaximo">
                                                <display:table name="${__formdata.LSTHISREA}" id="LSTHISREA" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                     requestURI="axis_axismnt030.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    
                                                    <display:column title="${title0}" sortable="true" sortProperty="CNOMTABLA" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${LSTHISREA.CNOMTABLA}</div>
                                                    </display:column>
                                                    <display:column title="${title1}" sortable="true" sortProperty="SINDICADORMOD" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${LSTHISREA.SINDICADORMOD}</div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="CNOMCAMPO" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${LSTHISREA.CNOMCAMPO}</div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true" sortProperty="CVALORANT" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${LSTHISREA.CVALORANT}</div>
                                                    </display:column>
                                                    <display:column title="${title4}" sortable="true" sortProperty="CVALORACT" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${LSTHISREA.CVALORACT}</div>
                                                    </display:column>
                                                    <display:column title="${title5}" sortable="true" sortProperty="CUSUARIOMOD" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${LSTHISREA.CUSUARIOMOD}</div>
                                                    </display:column>
                                                    <display:column title="${title6}" sortable="true" sortProperty="FMODIFI" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${LSTHISREA.FMODIFI}</div>
                                                    </display:column>                                                    
                                                </display:table>                                                        
                                            </div>
                                            <div class="separador">&nbsp; </div>                                        
                                        </td>                                                
                                    </tr>
                                </table>           
                            </td>
                        </tr>
                    </table>                    
                </td>
            </tr>
        </table>
        
        <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axismnt030</c:param>
                <c:param name="__botones">salir,buscar</c:param>
            </c:import>           
    </form>
    
    <c:import url="../include/mensajes.jsp" />
    
<script type="text/javascript">
<axis:visible f="axisctr004" c="FECHAFIN" >
    Calendar.setup({
        inputField     :    "FECHAFIN",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FECHAFIN",  
        singleClick    :    true,
        firstDay       :    1
    });
</axis:visible>

<axis:visible f="axisctr004" c="FEFEPLAZO" >
    Calendar.setup({
        inputField     :    "FEFEPLAZO",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FEFEPLAZO",  
        singleClick    :    true,
        firstDay       :    1
    });
</axis:visible>
</script>    

</body>
</html>