<%/*
*  Fichero: axisadm025.jsp
*
*  Fecha: 19/02/2009
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
    <title><axis:alt f="axisadm025" c="titulo" lit="9000961"/></title> <%-- Selección de recibos --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
   
    <style type="text/css">
        .displayspaceMaximo {
            width:99.8%;
            height: expression( this.scrollHeight > 349 ? "350px" : "auto" );
            max-height:350px;
            overflow-x: hidden;
            overflow-y: auto;
            border: 1px solid #DDDDDD;
        }
    </style>

    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() { 
            revisarEstilos();
            document.getElementById("TNOMBRE").focus();
            
            var RETURN_030 = "${__formdata.RETURN_030}";
            if(!objUtiles.estaVacio(RETURN_030)){
            f_but_aceptar();
                }
            f_cargar_propiedades_pantalla();
        }
        
        function f_but_salir() {
            parent.f_cerrar_modal("axisadm025");
        }
        
        function f_but_aceptar() {
            var SPERSON = objDom.getValorPorId('SPERSON');
            if(!objUtiles.estaVacio(SPERSON))
              objUtiles.abrirModal('axisadm030', 'src', 'modal_axisadm030.do?operation=init&SPERSON=' + SPERSON + '&SPROCES=${__formdata.SPROCES}&NNUMLIN=${__formdata.NNUMLIN}&NNUMORD=${__formdata.NNUMORD}&CBANCAR1=${__formdata.CBANCAR1}&IMPCODA=${DATOSCABECERA.P_IMPORTE}&IMPCODAinicial=${DATOSCABECERA.P_IMPORTE}');             
            else{
                alert(objJsMessages.jslit_selecciona_registro);            
            }
        }
        
        function f_recargar(NNUMORD){
                RETURN_030 = 1;
        	objUtiles.ejecutarFormulario ("modal_axisadm025.do?RETURN_030="+RETURN_030, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_buscar() {
            objUtiles.ejecutarFormulario ("modal_axisadm025.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
       
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
       
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_aceptar_modal(cual){
            f_cerrar_modal(cual);
            parent.f_cerrar_modal("axisadm025");
        }
            
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisadm025" c="titulo" lit="9000961"/></c:param>     <%-- Selección de recibos --%>
                <c:param name="formulario"><axis:alt f="axisadm025" c="formulario" lit="9000961"/></c:param> <%-- Selección de recibos --%>
                <c:param name="form">axisadm025</c:param>
        </c:import>        
  
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">
                axisadm030|<axis:alt f="axisadm025" c="TITULO" lit="9001162"/><%-- Tratamiento de recibos --%>
            </c:param>
        </c:import>
  
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}"/>
        <input type="hidden" name="SPROCES" id="SPROCES" value="${__formdata.SPROCES}"/>
        <input type="hidden" name="NNUMLIN" id="NNUMLIN" value="${__formdata.NNUMLIN}"/>
        <input type="hidden" name="CBANCAR1" id="CBANCAR1" value="${__formdata.CBANCAR1}"/>
        <input type="hidden" name="NNUMORD" id="NNUMORD" value="${__formdata.NNUMORD}"/>
        
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <th style="width:3%;height:0px"></th>
                            <th style="width:42%;height:0px"></th>
                            <th style="width:22%;height:0px"></th>
                            <th style="width:22%;height:0px"></th>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm025" c="title0" lit="105940"/></b>   <%-- Nombre --%>
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm025" c="title1" lit="100562"/></b>   <%-- Fecha --%>
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm025" c="title2" lit="100563"/></b>   <%-- Importe --%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <%-- Nombre --%>
                            <td class="campocaja">
                            
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;"
                                value="${DATOSCABECERA.P_NOMBRE}" name="P_NOMBRE" id="P_NOMBRE"
                                alt="<axis:alt f="axisadm025" c="P_NOMBRE" lit="105940"/>" title="<axis:alt f="axisadm025" c="P_NOMBRE" lit="105940"/>" readonly="readonly"
                                <axis:atr f="axisadm025" c="P_NOMBRE" a="modificable=false"/>/>
                            </td>            
                            <%-- Fecha --%>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:80%;"                                
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${DATOSCABECERA.P_FECHA}"/>"                                 
                                name="P_FECHA" id="P_FECHA" alt="<axis:alt f="axisadm025" c="P_FECHA" lit="100562"/>"
                                title="<axis:alt f="axisadm025" c="P_FECHA" lit="100562"/>" readonly="readonly"
                                <axis:atr f="axisadm025" c="P_FECHA" a="modificable=false"/>/>
                            </td>            
                            <%-- Importe --%>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:80%;"                                
                                value="<fmt:formatNumber pattern="###,##0.00" value="${DATOSCABECERA.P_IMPORTE}"/>"                                 
                                name="P_IMPORTE" id="P_IMPORTE" alt="<axis:alt f="axisadm025" c="P_FIMPORTE" lit="100563"/>"
                                title="<axis:alt f="axisadm025" c="P_FIMPORTE" lit="100563"/>" readonly="readonly"
                                <axis:atr f="axisadm025" c="P_IMPORTE" a="modificable=false"/>/>
                            </td>            
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm025" c="titulocaja" lit="105889"/></b>   <%-- Dirección --%>
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm025" c="titulocaja" lit="9001285"/></b>   <%-- Referencia --%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <%-- Dirección --%>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;"
                                value="${DATOSCABECERA.P_DESCRIP}" name="P_DESCRIP" id="P_DESCRIP"
                                alt="<axis:alt f="axisadm025" c="P_DESCRIP" lit="105940"/>" title="<axis:alt f="axisadm025" c="P_DESCRIP" lit="105940"/>" readonly="readonly"
                                <axis:atr f="axisadm025" c="P_DESCRIP" a="modificable=false"/>/>
                            </td>  
                            <td class="campocaja" colspan="2">
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;"
                                value="${DATOSCABECERA.P_REFERENCE}" name="P_REFERENCE" id="P_REFERENCE"
                                alt="<axis:alt f="axisadm025" c="P_REFERENCE" lit="9001285"/>" title="<axis:alt f="axisadm025" c="P_REFERENCE" lit="9001285"/>" readonly="readonly"
                                <axis:atr f="axisadm025" c="P_REFERENCE" a="modificable=false"/>/>
                            </td>            
                        </tr>
                    </table>
                    
                    <div class="separador">&nbsp;</div>
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <th style="width:3%;height:0px"></th>
                            <th style="width:42%;height:0px"></th>
                            <th style="width:22%;height:0px"></th>
                            <th style="width:22%;height:0px"></th>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm025" c="titulocaja" lit="9000759"/></b>   <%-- Nombre y Apellidos --%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <%-- Nombre --%>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;"
                                value="${__formdata.TNOMBRE}" name="TNOMBRE" id="TNOMBRE"
                                alt="<axis:alt f="axisadm025" c="TNOMBRE" lit="9000759"/>" title="<axis:alt f="axisadm025" c="TNOMBRE" lit="9000759"/>"/>
                            </td>            
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm025" c="titulocaja" lit="100588"/></b>   <%-- Descripción --%>
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm025" c="titulocaja" lit="101081"/></b>    <%-- C.P. --%>
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm025" c="titulocaja" lit="9000969"/></b>   <%-- Núm. vía --%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <%-- Descripción --%>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;"
                                value="${__formdata.TDESCRIP}" name="TDESCRIP" id="TDESCRIP"
                                alt="<axis:alt f="axisadm025" c="TDESCRIP" lit="100588"/>" title="<axis:alt f="axisadm025" c="TDESCRIP" lit="100588"/>"/>
                            </td>            
                            <%-- C.P. --%>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:80%;"                                
                                value="${__formdata.CPOSTAL}"                                 
                                name="CPOSTAL" id="CPOSTAL" alt="<axis:alt f="axisadm025" c="CPOSTAL" lit="101081"/>"
                                title="<axis:alt f="axisadm025" c="CPOSTAL" lit="101081"/>"/>
                            </td>            
                            <%-- Núm. vía --%>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:80%;"                                
                                value="${__formdata.NNUMVIA}"
                                name="NNUMVIA" id="NNUMVIA" alt="<axis:alt f="axisadm025" c="NNUMVIA" lit="9000969"/>"
                                title="<axis:alt f="axisadm025" c="NNUMVIA" lit="9000969"/>"/>
                            </td>            
                        </tr>
                        <tr>
                            <th style="width:3%;height:0px"></th>
                            <th style="width:22%;height:0px"></th>
                            <th style="width:22%;height:0px"></th>
                            <th style="width:48%;height:0px"></th>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm025" c="titulocaja" lit="800242"/></b>   <%-- N poliza --%>
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm025" c="titulocaja" lit="800636"/></b>    <%-- N recibo --%>
                            </td>
                            <td class="titulocaja">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <%-- N poliza --%>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:50%;"
                                value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA"
                                alt="<axis:alt f="axisadm025" c="NPOLIZA" lit="800242"/>" title="<axis:alt f="axisadm025" c="NPOLIZA" lit="800242"/>"/>
                            </td>            
                            <%-- N recibo --%>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:80%;"
                                value="${__formdata.NRECIBO}" name="NRECIBO" id="NRECIBO"
                                alt="<axis:alt f="axisadm025" c="NPOLIZA" lit="800636"/>" title="<axis:alt f="axisadm025" c="NPOLIZA" lit="800636"/>"/>
                            </td>            
                            <%-- Núm. vía --%>
                                &nbsp;
                            </td>
                         </tr>
                    </table>
                    
                    <div class="separador">&nbsp;</div>
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <c:set var="title0"><axis:alt f="axisadm025" c="title0" lit="800440"/></c:set>   <%-- Nº --%>
                                <c:set var="title1"><axis:alt f="axisadm025" c="title1" lit="105940"/></c:set>   <%-- Nombre --%>                                 
                                <c:set var="title2"><axis:alt f="axisadm025" c="title2" lit="105889"/></c:set>   <%-- Dirección --%>                                 
                                
                                <div id="dt_tomadores" class="seccion displayspaceMaximo">
                                    <display:table name="${requestScope.LST_TOMADORES}" id="LST_TOMADORES" export="false" class="dsptgtable" pagesize="13" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="modal_axisadm025.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        
                                        <display:column title=" " sortable="false" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                        
                                        <div class="dspIcons">                                        
                                            <input <c:if test="${LST_TOMADORES.SPERSON == __formdata.SPERSON}">checked</c:if> value="${LST_TOMADORES.SPERSON}" type="radio" id="radioTomador" name="radioTomador"
                                            onclick="objDom.setValorPorId('SPERSON', this.value)"/>
                                        </div>                                         
                                         <%--
                                    <input <c:if test="${productoId == miListaId['SPRODUC']}">checked</c:if> 
                                        value="${miListaId['SPRODUC']}/${miListaId['TTITULO']}" type="radio" id="radioProducto" name="radioProducto"/></div>
                                        
                                       
                                            <div class="dspIcons">
                                                <img border="0" alt="<axis:alt f='axisadm025' c='MIRAME' lit='1000348'/>" title="<axis:alt f='axisadm025' c='MIRAME' lit='1000348'/>" src="images/mas.gif" 
                                                width="11px" height="11px" style="cursor:pointer;" onclick="objUtiles.abrirModal('axisadm030', 'src', 'modal_axisadm030.do?operation=form&SPERSON=${LST_TOMADORES.SPERSON}&SPROCES=${__formdata.SPROCES}&NNUMLIN=${__formdata.NNUMLIN}&CBANCAR1=${__formdata.CBANCAR1}')"        
                                            </div>
                                            
                                            --%>
                                            
                                            
                                        </display:column>
                                        <display:column title="${title0}" sortable="true" sortProperty="SPERSON" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                <a href="javascript:objDom.setValorPorId('SPERSON', ${LST_TOMADORES.SPERSON});f_but_aceptar();">
                                                    ${LST_TOMADORES.SPERSON}
                                                </a>
                                            </div>
                                        </display:column>
                                        <display:column title="${title1}" sortable="true" sortProperty="" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                <a href="javascript:objDom.setValorPorId('SPERSON', ${LST_TOMADORES.SPERSON});f_but_aceptar();">
                                                    ${LST_TOMADORES.TNOMBRE}
                                                </a>
                                            </div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="true" sortProperty="TDESCRIP" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                <a href="javascript:objDom.setValorPorId('SPERSON', ${LST_TOMADORES.SPERSON});f_but_aceptar();">
                                                   ${LST_TOMADORES.TDESCRIP}
                                                </a>                                                
                                            </div>
                                        </display:column>
                                    </display:table>     
                                    <c:choose>
                                        <c:when test="${!empty requestScope.LST_TOMADORES}">
                                            <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                                <script language="javascript">objUtiles.retocarDsptagtable("LST_TOMADORES");</script>
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
                </td>     
            </tr>            
        </table>
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axisadm025</c:param>
            <c:param name="__botones">salir,buscar,aceptar</c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>

</body>
</html>