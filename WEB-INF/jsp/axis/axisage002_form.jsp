<%/* Revision:# AfYeSaBnzIM4A+jozn07uQ== # */%>
<%/*
*  Fichero: axisage002_form.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a> 
*
*  Fecha: 08/10/2008
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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
       
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() { 
            f_cargar_propiedades_pantalla(); 
            revisarEstilos();
            parent.f_iframe_cargado();
        }
        
        function f_actualizar_redcomercial(CEMPRES) {
            objDom.setValorPorId("CEMPRES", CEMPRES);
            objAjax.invokeAsyncCGI("axis_axisage003.do", 
                callbackAjaxActualizarRedcomercial, "operation=actualizar_redcomercial&CEMPRES=" + CEMPRES + 
                "&CAGENTE=" + objDom.getValorPorId("CAGENTE"),  this);
        }

        /****************************************************************************************/
        /************************************ CALLBACKS AJAX ************************************/
        /****************************************************************************************/

        function callbackAjaxActualizarRedcomercial(ajaxResponseText) {
            try {
                var doc = objAjax.domParse(ajaxResponseText);
                
                if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {
                
                    var tableM = document.getElementById("HISTORICO");
                    var tbodyM = tableM.getElementsByTagName("tbody")[0];
                    var trM = tbodyM.getElementsByTagName("tr");
                    
                    objLista.borrarFilasDeLista ("HISTORICO", "6", "<axis:alt f='axisage002' c='HISTORICO' lit='1000254' />");
                    
                    for (var i = 0; i < objDom.numeroDeTags(doc, "OB_IAX_REDCOMERCIAL") ; i++) {
                        // Como hay resultados, borramos la fila vacia
                        if (i==0) 
                            objLista.borrarFilaVacia(tbodyM, trM);
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        // Creamos un array de columnas a añadir a la nueva fila del displayTag
                        var newtd = new Array(6);
                        
                        // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                        var FMOVINI = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FMOVINI")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FMOVINI"), i, 0) : "");
                        if (FMOVINI != "") 
                            FMOVINI = objUtiles.formateaTimeStamp(FMOVINI);
                        newtd[0] = objLista.addTextoEnLista(FMOVINI);
                        
                        var FMOVFIN = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FMOVFIN")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FMOVFIN"), i, 0) : "");
                        if (FMOVFIN != "") 
                            FMOVFIN = objUtiles.formateaTimeStamp(FMOVFIN);
                        newtd[1] = objLista.addTextoEnLista(FMOVFIN);
                        
                        var TCTIPAGE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TCTIPAGE")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCTIPAGE"), i, 0) : "");
                        newtd[2] = objLista.addTextoEnLista(TCTIPAGE);
                        
                        var TPADRE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPADRE")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPADRE"), i, 0) : "");
                        newtd[3] = objLista.addTextoEnLista(TPADRE);

                        var CPERVISIO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPERVISIO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPERVISIO"), i, 0) : "");
                        var TPERVISIO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPERVISIO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPERVISIO"), i, 0) : "");
                        newtd[4] = objLista.addTextoEnLista(CPERVISIO + " " + TPERVISIO);

                        var TPERNIVEL = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPERNIVEL")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPERNIVEL"), i, 0) : "");
                        newtd[5] = objLista.addTextoEnLista(TPERNIVEL);
                        
                        // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                        objLista.addNuevaFila(newtd, newtr, tbodyM);
                
                    } // Fi for
                }
                
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            } 
        }
        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">

    <c:if test="${!empty __formdata.AGENTE}">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm3" action="" method="POST">         
    
        <input type="hidden" name="operation" value=""/>       
        <input type="hidden" name="CEMPRES" id="CEMPRES" value="${__formdata.CEMPRES}"/>
        
        <c:set var="modoModificable" value="${false}"/>

        <table class="area" align="center">                    
            <tr>
                <th style="width:33%;height:0px"></th>
                <th style="width:33%;height:0px"></th>
                <th style="width:33%;height:0px"></th>
            </tr>   
            <tr>
                <%-- Código agente --%>
                <td class="titulocaja">
                    <b><axis:alt f="axisage002" c="COD_AGENTE" lit="9000531"/></b>                      
                </td>
                 <%-- NIF --%>
                 <td class="titulocaja">
                    <b><axis:alt f="axisage002" c="NNUMNIF" lit="9000760"></axis:alt></b>
                </td>                                 
                 <%-- NOMBRE --%>
                 <td class="titulocaja">
                    <b><axis:alt f="axisage002" c="NOM_AGENTE" lit="9908741"></axis:alt></b>
                </td>    
            </tr>
            <tr>
                <%-- Código agente --%>
                <td class="campocaja">
                    <input type="text" class="campowidthinput campo campotexto" size="15" 
                    value="${__formdata.AGENTE.CAGENTE}" name="CAGENTE" id="CAGENTE" 
                    style="width:70%;" title="<axis:alt f="axisage002" c="COD_AGENTE" lit="9000531"/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if> />
					<axis:visible f="axisage002" c="MOD_AGENTE">
                    <img border="0" src="images/lapiz.gif" onclick="parent.f_but_editar('${__formdata.AGENTE.CAGENTE}')" style="cursor:pointer"
                    alt="<axis:alt f='axisage002' c='MOD_AGENTE' lit='9001840'/>" title="<axis:alt f='axisage002' c='MOD_AGENTE' lit='9001840'/>"/>
					</axis:visible>
                </td>
                <%-- NIF --%>
                <td class="campocaja">
                    <input type="text" class="campowidthinput campo campotexto" size="15" 
                    value="${__formdata.AGENTE.NNIF}" name="NNIF" id="NNIF" 
                    style="width:95%;" title="<axis:alt f="axisage002" c="NNIF" lit="105904"/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if> />
                </td>
                 <%-- NOMBRE --%>				
                <td class="campocaja">
                    <input type="text" class="campowidthinput campo campotexto" size="15" 
                    value="${__formdata.AGENTE.TNOMBRE}" name="TNOMBRE" id="TNOMBRE" 
                    style="width:78%;" title="<axis:alt f="axisage002" c="NOM_AGENTE" lit="9908741"/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if>/>
                </td>             
            </tr>
            <tr>
                 <%-- Domicilio --%>
                 <td class="titulocaja" colspan="3">
                    <b><axis:alt f="axisage002" c="DOMICILIO" lit="101078"/> </b>  
                </td>                 
            </tr>
            <tr>
                <%-- Domicilio --%>
                <td class="campocaja" colspan="3">
                    <select name="CDOMICI" id="CDOMICI" size="1" class="campowidthselect campo campotexto" style="width:64.5%;" <c:if test="${!modoModificable}">disabled="disabled"</c:if>>&nbsp;
                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage002" c="VAL_NOINF" lit="9000848"/> - </option>
                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTDOMIPERSON}">
                            <option value = "${element.CDOMICI}"
                            <c:if test="${__formdata.AGENTE.CDOMICI == element.CDOMICI}"> selected = "selected"</c:if>>
                                ${element.TDOMICI} - ${element.CPOSTAL} - ${element.TPOBLAC}    
                            </option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <%-- IVA --%>
                <axis:ocultar f="axisage002" c="CTIPIVA" dejarHueco="false">
                <td class="titulocaja" colspan="2">
                    <b><axis:alt f="axisage002" c="IVA" lit="101340"/></b>   
                </td>
                 </axis:ocultar>
                 <%-- Retención --%>
                 <axis:ocultar f="axisage002" c="CRETENC" dejarHueco="false">
                 <td class="titulocaja" colspan="2">
                    <b><axis:alt f="axisage002" c="RETEN" lit="101714"/> </b>  
                </td> 
                 </axis:ocultar>
            </tr>
            <tr>
                <%-- IVA --%>
                <axis:ocultar f="axisage002" c="CTIPIVA" dejarHueco="false">
                <td class="campocaja" colspan="2">
                    <select name="CTIPIVA" id="CTIPIVA" size="1" class="campowidthselect campo campotexto" style="width:79%;" <c:if test="${!modoModificable}">disabled="disabled"</c:if>>&nbsp;
                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTTIPOIVA}">
                            <option value = "${element.CTIPIVA}"
                            <c:if test="${__formdata.AGENTE.CTIPIVA == element.CTIPIVA}"> selected = "selected"</c:if>>
                                ${element.TTIPIVA} 
                            </option>
                        </c:forEach>
                    </select>
                </td>
                 </axis:ocultar>
                <%-- Retención --%>
                <axis:ocultar f="axisage002" c="CRETENC" dejarHueco="false">
                <td class="campocaja" colspan="2">  
                    <select name="CRETENC" id="CRETENC" size="1" class="campowidthselect campo campotexto" style="width:79%;" <c:if test="${!modoModificable}">disabled="disabled"</c:if>>&nbsp;
                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTRETENCION}">
                            <option value = "${element.CRETENC}"
                            <c:if test="${__formdata.AGENTE.CRETENC == element.CRETENC}"> selected = "selected"</c:if>>
                                ${element.TTIPRET} 
                            </option>
                        </c:forEach>
                    </select>
                </td>
                 </axis:ocultar>
                <tr>
                <%-- Comisión --%>
                <td class="titulocaja" colspan="2">
                    <b><axis:alt f="axisage002" c="COMISION" lit="101509"/></b>   
                </td>
                 <%-- Estado --%>
                 <td class="titulocaja" colspan="2">
                    <b><axis:alt f="axisage002" c="CESTADO" lit="100587"/> </b>  
                </td>                 
            </tr>
            <tr>
                <%-- Comisión --%>
                <td class="campocaja" colspan="2">
                    <select name="CCOMISI" id="CCOMISI" size="1" class="campowidthselect campo campotexto" style="width:79%;" <c:if test="${!modoModificable}">disabled="disabled"</c:if>>&nbsp;
                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTAGECOMISION}">
                            <option value = "${element.CCOMISI}"
                            <c:if test="${__formdata.AGENTE.CCOMISI == element.CCOMISI}"> selected = "selected"</c:if>>
                                ${element.TCOMISI} 
                            </option>
                        </c:forEach>
                    </select>
                </td>
                <%-- Estado --%>
                <td class="campocaja" colspan="2">
                    <select name="CACTIVO" id="CACTIVO" size="1" class="campowidthselect campo campotexto" style="width:79%;" <c:if test="${!modoModificable}">disabled="disabled"</c:if>>&nbsp;
                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTESTADOAGENTE}">
                            <option value = "${element.CATRIBU}"
                            <c:if test="${__formdata.AGENTE.CACTIVO == element.CATRIBU}"> selected = "selected"</c:if>>
                                ${element.TATRIBU} 
                            </option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <%-- Inici ECP 14/11/2012 BUG 24640 --%>    
            <tr>
                 <%-- Sobrecomisión --%>
                <td class="titulocaja" colspan="2">
                    <b><axis:alt f="axisage002" c="SOBRECOMISION" lit="9901178"/></b>   
                </td>
            
            </tr>
            <tr>
            <%-- Sobrecomisión --%>
                <td class="campocaja" colspan="2">
                   <select name="CSOBRECOMISI" id="CSOBRECOMISI" size="1" class="campowidthselect campo campotexto" style="width:79%;" <c:if test="${!modoModificable}">disabled="disabled"</c:if>>&nbsp;
                   <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage002" c="VAL_NOINF" lit="9000848"/> - </option>
                   <c:forEach var="element" items="${__formdata.LISTVALORES.LSTAGESOBRECOMISION}">
                            <option value = "${element.CCOMISI}"
                            <c:if test="${__formdata.AGENTE.CSOBRECOMISI == element.CCOMISI}"> selected = "selected"</c:if>>
                                ${element.TCOMISI} 
                            </option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <%-- Fin ECP 14/11/2012 BUG 24640 --%>
            <tr>
                <%-- Cuenta bancaria --%>
                <td class="titulocaja" colspan="2">
                    <b><axis:alt f="axisage002" c="CCBANC" lit="100965"/></b>   
                </td>
                <%-- Tipo agente --%>
                <td class="titulocaja">
                    <b><axis:alt f="axisage002" c="CTIPAGE" lit="9000519"/></b>
                </td>
            </tr>
            <tr>
                <%-- Cuenta bancaria --%>
                <td class="campocaja" colspan="2">
                    <axis:encryptflag f="axisage002" c="CBANCAR" />
                    <select name="CBANCAR" id="CBANCAR" size="1" class="campowidthselect campo campotexto" style="width:79%;" <c:if test="${!modoModificable}">disabled="disabled"</c:if>>&nbsp;
                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage002" c="VAL_NOINF" lit="9000848"/> - </option>
                        <c:forEach var="element" items="${__formdata.AGENTE.CCC}">
                            <option value = <axis:encrypt f="axisage002" c="CBANCAR" value="${element.OB_IAX_CCC.CBANCAR}" />"@@${element.OB_IAX_CCC.CTIPBAN}"
                            <c:if test="${__formdata.AGENTE.CBANCAR == element.OB_IAX_CCC.CBANCAR}"> selected = "selected"</c:if>>
                                <axis:masc f="axisage002" c="CBANCAR" value="${element.OB_IAX_CCC.CBANCARFORMAT}" />
                            </option>
                        </c:forEach>
                    </select>
                </td>
                <td class="campocaja" colspan="2">                                
                    <select name="CTIPAGE" id="CTIPAGE" size="1" class="campowidthselect campo campotexto" style="width:79%;"
                      <c:if test="${!modoModificable}">disabled="disabled"</c:if>>&nbsp;
                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTTIPOAGENTE}">
                            <option value = "${element.CATRIBU}"
                            <c:if test="${__formdata.AGENTE.CTIPAGE == element.CATRIBU}"> selected = "selected"</c:if>>
                                ${element.TATRIBU} 
                            </option>
                        </c:forEach>
                    </select>
                </td>
            </tr>                                   
            <tr>
                <%-- Fecha baja --%>
                <td class="titulocaja" colspan="2">
                    <b><axis:alt f="axisage002" c="FBAJA" lit="9001510"/></b>   
                </td>
                <%-- Nº colegiado --%>
                <axis:ocultar f="axisage002" c="NCOLEGI" dejarHueco="false">
                <td class="titulocaja" colspan="2">
                    <b><axis:alt f="axisage002" c="NCOLEGI" lit="9000534"/> </b>
                </td>
                </axis:ocultar>
            </tr>
            <tr>
                <%-- Fecha baja --%>
                <td class="campocaja" colspan="2">
                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:32%;"                                
                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.AGENTE.FBAJAGE}"/>" 
                    name="FBAJAGE" id="FBAJAGE"
                    title="<axis:alt f='axisage002' c='FBAJAGE' lit='9000447'/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if>/><c:if test="${modoModificable}"><a style="vertical-align:middle;"><img
                    id="icon_FBAJAGE" alt="<axis:alt f="axisage002" c="SELECC" lit="108341"/>" title="<axis:alt f="axisage002" c="SELECC" lit="108341" />" src="images/calendar.gif"/></a></c:if>
                </td>
                <%-- Nº colegiado --%>
                <axis:ocultar f="axisage002" c="NCOLEGI" dejarHueco="false">
                <td class="campocaja" colspan="2">
                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:35%;"
                    value="${__formdata.AGENTE.NCOLEGI}" name="NCOLEGI" id="NCOLEGI"
                    title="<axis:alt f='axisage002' c='NCOLEGI' lit='9000534'/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if>/>
                </td>
                </axis:ocultar>
            </tr>
            <tr>
                <td class="titulocaja" colspan = "4">
                    <div class="separador">&nbsp; </div>                                                                                                                            
                    <%-- DisplayTag Contratos --%>
                    <c:set var="title0"><axis:alt f="axisage002" c="CEMPRES" lit="101619"/></c:set>   <%-- Empresa --%>
                    <c:set var="title1"><axis:alt f="axisage002" c="NCONTRATO" lit="9000536"/></c:set>  <%-- Nº Contrato --%>
                    <c:set var="title2"><axis:alt f="axisage002" c="FCONTRATO" lit="9000537"/></c:set>  <%-- F. Contrato --%>

                    <div class="displayspaceGrande">
                        <display:table name="${__formdata.CONTRATOS}" id="CONTRATOS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                             requestURI="axis_axisage002.do?paginar=true&operation=cargarDetalleAgente">
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                <div class="dspIcons">
                                    <input type="radio" name="radioCEMPRES"  
                                    value="${CONTRATOS.OB_IAX_CONTRATOS.CEMPRES}" 
                                    onclick="f_actualizar_redcomercial(this.value)"
                                    <c:if test="${__formdata.CEMPRES == CONTRATOS.OB_IAX_CONTRATOS.CEMPRES}"> checked="checked"</c:if>/>
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
                </td> 
            </tr>       
            <tr>
                <td class="titulocaja" colspan = "4">
                    <div class="separador">&nbsp; </div>                                                                                                                            
                    <%-- DisplayTag Red Comercial --%>
                    <c:set var="title0"><axis:alt f="axisage002" c="DESDE" lit="104095"/></c:set>  <%-- Desde --%>
                    <c:set var="title1"><axis:alt f="axisage002" c="HSTA" lit="103051"/></c:set>  <%-- Hasta --%>
                    <c:set var="title2"><axis:alt f="axisage002" c="CTIPAGE" lit="9000519"/></c:set> <%-- Tipo Agente --%>
                    <c:set var="title3"><axis:alt f="axisage002" c="GESTOR" lit="1000566"/></c:set> <%-- Gestor --%>
                    <c:set var="title4"><axis:alt f="axisage002" c="NVISIO" lit="9000707"/></c:set>  <%-- Nivel de visión --%>
                    <c:set var="title5"><axis:alt f="axisage002" c="TIPVISIO" lit="9000708"/></c:set>  <%-- Tipo de visión --%>

                    <div class="displayspaceGrande">
                        <display:table name="${__formdata.HISTORICO}" id="HISTORICO" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                             requestURI="axis_axisage002.do?paginar=true&operation=cargarDetalleAgente">
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_REDCOMERCIAL.FMOVINI" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                    <fmt:formatDate value='${HISTORICO.OB_IAX_REDCOMERCIAL.FMOVINI}' pattern='dd/MM/yyyy'/>
                                </div>
                            </display:column>
                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_REDCOMERCIAL.FMOVFIN" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                    <fmt:formatDate value='${HISTORICO.OB_IAX_REDCOMERCIAL.FMOVFIN}' pattern='dd/MM/yyyy'/>
                                </div>
                            </display:column>
                            <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_REDCOMERCIAL.TCTIPAGE" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                    ${HISTORICO.OB_IAX_REDCOMERCIAL.TCTIPAGE}
                                </div>
                            </display:column>
                            <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_REDCOMERCIAL.TPADRE" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                    ${HISTORICO.OB_IAX_REDCOMERCIAL.TPADRE}
                                </div>
                            </display:column>
                            <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_REDCOMERCIAL.TPERVISIO" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                    ${HISTORICO.OB_IAX_REDCOMERCIAL.CPERVISIO} ${HISTORICO.OB_IAX_REDCOMERCIAL.TPERVISIO}
                                </div>
                            </display:column>
                            <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_REDCOMERCIAL.TPERNIVEL" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                    ${HISTORICO.OB_IAX_REDCOMERCIAL.TPERNIVEL}
                                </div>
                            </display:column>
                        </display:table>                                                        
                    </div>
                </td> 
            </tr>                       
        </table>                    
   
    </form>
    
    </c:if>
    
    <c:import url="../include/mensajes.jsp"/>
    
</body>
</html>