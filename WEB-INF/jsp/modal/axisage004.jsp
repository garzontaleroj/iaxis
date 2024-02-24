<%/*
*  Fichero: axisage004.jsp
*
*  @author <a href="mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  Fecha: 23/12/2008
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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/tree.css" type="text/css"></link>
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
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_but_cancelar() {
           parent.f_cerrar_modal('axisage004');                      
        }
        
        function f_but_aceptar() {
            if (objValidador.validaEntrada())
                objUtiles.ejecutarFormulario("modal_axisage004.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_nuevo() {
            document.getElementById("CEMPRES")[0].selected = "1";
            objDom.setValorPorId("NCONTRATO", "");
            objDom.setValorPorId("FFIRCON", "");
        }

        function f_rellenar_formulario(CEMPRES, NCONTRATO, FFIRCON) {
            var comboEmpresas = document.getElementById("CEMPRES");
            if (!objUtiles.estaVacio(CEMPRES)) {                
                for (i = 0; i < comboEmpresas.length; i++) {
                    if (comboEmpresas.options[i].value == CEMPRES)
                        comboEmpresas[i].selected = "1";
                }
            } else
                comboEmpresas[0].selected = "1";

            
            if (!objUtiles.estaVacio(NCONTRATO))
                objDom.setValorPorId("NCONTRATO", NCONTRATO);
            else
                objDom.setValorPorId("NCONTRATO", "");
                
            if (!objUtiles.estaVacio(FFIRCON))
                objDom.setValorPorId("FFIRCON", objUtiles.formateaTimeStamp2(FFIRCON));
            else
                objDom.setValorPorId("FFIRCON", "");
        }

        function f_onload() {
            if (${requestScope.grabarOK == true})
                parent.f_aceptar_modales_axisage004_axisage005("axisage004")
            else {
            
                try {
                    document.miForm.selContrato[0].checked = true;
                    document.miForm.selContrato[0].onclick();                
                } catch (e) {
                    try {
                        document.miForm.selContrato.checked = true;
                        document.miForm.selContrato.onclick();
                    } catch (e2) {
                    }
                }            
            }
            f_cargar_propiedades_pantalla();
        }

    </script>
  </head>
  
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axisage004.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisage004" c="TITULO" lit="9000709"/></c:param>     <%-- Mantenimiento de Contratos de Agente --%>
            <c:param name="formulario"><axis:alt f="axisage004" c="FORMULARIO" lit="9000709"/></c:param> <%-- Mantenimiento de Contratos de Agente --%>
            <c:param name="form">axisage004</c:param>
        </c:import>
       
        <input type="hidden" name="operation" value=""/>        
        <input type="hidden" id="CAGENTE" name="CAGENTE" value="${__formdata.CAGENTE}"/>        

        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">            
            <tr>
                <td>                    
                    <table class="area" align="center">                    
                        <tr>
                            <th style="width:33%;height:0px"></th>
                            <th style="width:33%;height:0px"></th>
                            <th style="width:33%;height:0px"></th>
                        </tr>   
                        <tr>
                            <td class="titulocaja" colspan="3">
                                <div class="separador">&nbsp; </div>                                                                                                                            
                                <%-- DisplayTag Contratos --%>
                                <c:set var="title0"><axis:alt f="axisage004" c="EMPRESA" lit="101619"/></c:set>   <%-- Empresa --%>
                                <c:set var="title1"><axis:alt f="axisage004" c="NUMCONTRATO" lit="9000536"/></c:set>  <%-- Nº Contrato --%>
                                <c:set var="title2"><axis:alt f="axisage004" c="FCONTRATO" lit="9000537"/></c:set>  <%-- F. Contrato --%>
            
                                <div class="displayspaceGrande">
                                    <display:table name="${__formdata.CONTRATOS}" id="CONTRATOS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="modal_axisage004.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="" sortable="false" headerClass="sortable headwidth5"  media="html" autolink="false" >
                                            <div class="dspIcons">
                                                <input type="radio" name="selContrato" onclick="f_rellenar_formulario('${CONTRATOS.OB_IAX_CONTRATOS.CEMPRES}', '${CONTRATOS.OB_IAX_CONTRATOS.NCONTRATO}', '${CONTRATOS.OB_IAX_CONTRATOS.FFIRCON}')"/>
                                            </div>
                                        </display:column>
                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_CONTRATOS.TEMPRES" style="width:60%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${CONTRATOS.OB_IAX_CONTRATOS.TEMPRES}
                                            </div>
                                        </display:column>
                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_CONTRATOS.NCONTRATO" style="width:20%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${CONTRATOS.OB_IAX_CONTRATOS.NCONTRATO}
                                            </div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_CONTRATOS.FFIRCON"  style="width:20%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                <fmt:formatDate value='${CONTRATOS.OB_IAX_CONTRATOS.FFIRCON}' pattern='dd/MM/yyyy'/>
                                            </div>
                                        </display:column>
                                    </display:table>                                                        
                                </div>
                                <div class="separador">&nbsp; </div>                                                                                                                            
                            </td> 
                        </tr>       
                        <tr>
                            <%-- Empresa --%>
                            <td class="titulocaja">
                                <b><axis:alt f="axisage004" c="EMPRESA" lit="101619"/></b>                      
                            </td>
                             <%-- ID Contrato --%>
                             <td class="titulocaja">
                                <b><axis:alt f="axisage004" c="IDCONTRATO" lit="9000710"/></b>  
                            </td>                 
                             <%-- Fecha alta --%>
                             <td class="titulocaja">
                                <b><axis:alt f="axisage004" c="FECHAALTA" lit="9001192"/></b>  
                            </td>                 
                        </tr>
                        <tr>
                            <%-- Empresa --%>
                            <td class="campocaja">                                
                                <select name="CEMPRES" id="CEMPRES" size="1" class="campowidthselect campo campotexto" style="width:90%;" 
                                title="<axis:alt f="axisage004" c="CEMPRES" lit="101619"/>" obligatorio="true">&nbsp;
                                    <option value="null"> - <axis:alt f="axisage004" c="CEMPRES0" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTEMPRESAS}">
                                        <option value = "${element.CEMPRES}"
                                        <c:if test="${__formdata.CEMPRES == element.CEMPRES || fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == 1}"> selected = "selected"</c:if>>
                                            ${element.TEMPRES} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            <%-- JLTS bug 23869 quitar la obligatoriedad 09/10/2012 --%>
                            <%-- ID Contrato --%>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="25" maxlength="20"
                                value="${__formdata.NCONTRATO}" name="NCONTRATO" id="NCONTRATO" 
                                style="width:30%;" title="<axis:alt f="axisage004" c="NCONTRATO" lit="9000710"/>" obligatorio="false" formato="entero"
                                <axis:atr f="axisage004" c="NCONTRATO" a="obligatorio=false"/>/>
                            </td>
                            <%-- Fecha alta --%>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:30%;"
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFIRCON}"/>" name="FFIRCON" id="FFIRCON"
                                alt="<axis:alt f="axisage004" c="FFIRCON" lit="9000437"/>" title="<axis:alt f="axisage004" c="FFIRCON" lit="9000437" />"
                                <axis:atr f="axisage004" c="FFIRCON" a="formato=fecha&obligatorio=true"/> /><a style="vertical-align:middle;"><img
                                id="icon_FFIRCON" alt="<axis:alt f="axisage004" c="icon_FFIRCON" lit="108341"/>" title="<axis:alt f="axisage004" c="icon_FFIRCON" lit="108341" />" src="images/calendar.gif"/></a>
                            </td>            
                        </tr>
             
                    </table>   
                </td>
            </tr>
        </table>
   
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisage004</c:param><c:param name="__botones">cancelar,nuevo,aceptar</c:param></c:import>
        <div class="separador">&nbsp; </div>                                        
                                                                                
    </form>
    <c:import url="../include/mensajes.jsp" />
    
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FFIRCON",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FFIRCON", 
            singleClick    :    true,
            firstDay       :    1
        });
   </script>

</body>
</html>