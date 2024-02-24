<%--
NOMBRE:    axisctr209.jsp
PROPÓSITO (descripción pantalla): http://mantis.srvcsi.com/view.php?id=27262#c149107 

REVISIONES:
Ver        Fecha       Autor            Descripción
---------  ----------  ---------------  ------------------------------------
1.0        14/08/2013  RCL              Creació pantalla
--%>

<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axisctr209" c="AUTORIZACIONMASIVA" lit="9905850"/></title> <%-- AUTORIZACIÓN MASIVA DE PROPUESTAS RETENIDAS --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp" />
    <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
    
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
    
    <script type="text/javascript" src="scripts/calendar.js"></script>
    <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
    <script type="text/javascript" src="scripts/calendar-setup.js"></script>
    <script type="text/javascript">
    
    function f_but_aceptar()
    {
        if (objValidador.validaEntrada()){
            objUtiles.ejecutarFormulario ("axis_axisctr209.do", "aceptar", document.miForm, "_self", "<axis:alt f="axisctr209" c="MSG_CARGAR" lit="9901019"/>");
        }
    }
        
    function f_cerrar_modal(cual) 
    {
        objUtiles.cerrarModal(cual);
    }
    
    function f_abrir_modal(cual, noXButton, optionalQueryString, width, height)
    {
        if (objUtiles.estaVacio(optionalQueryString))                
            optionalQueryString = "";
            
        if (noXButton) 
            objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");                    
            
        objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString, width, height);
    }

    function f_onload()
    {
        var hayMensajes    = ${!empty requestScope.__mensajes.m__clave};

        if ((${empty sessionScope.PRETEN_T_IAX_POLIZASRETEN} && !hayMensajes) )
            f_abrir_modal("axisctr033", false, "&origen=axisctr209.jsp&PMODO="+$("#PMODO").val());
               
        f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
    }
    
    function f_but_salir()
    {
        objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr209", "cancelar", document.miForm, "_self");
    }
    
    
    function f_miajaxjson(ths)
    {
        var url="axis_axisctr209.do?operation=miajaxjson";
        jQuery.ajax({
            url: url,
            dataType: 'json',
            success: callBack_miajaxjson
        });
    }
    
    function callBack_miajaxjson(p)
    {
      alert(JSON.stringify(p))
    }
    
    function f_but_buscar()
    {
        f_abrir_modal("axisctr033", false, "&origen=axisctr209.jsp&PMODO="+$("#PMODO").val());
    }
    
    function f_aceptar_modal(cual, params) 
    {
        f_cerrar_modal(cual);
        if (objUtiles.estaVacio(params))   
            params = "";
            
        if (cual == "axisctr033") {
            objUtiles.ejecutarFormulario("axis_axisctr209.do" + params, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        } else {
            // Los demás modales, recargan de BD
            objUtiles.ejecutarFormulario("axis_axisctr209.do" + params, "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
    }
    
    var vSSEGURO173 = '';
        
    function f_cerrar_axisctr173(){
        objUtiles.cerrarModal("axisctr173");
        objAjax.invokeAsyncCGI("axis_axisctr034.do", callbackAjaxGuardar, "operation=ajax_guardar&SSEGURO="+vSSEGURO173, this, objJsMessages.jslit_cargando);
    }
        
    function f_solo_cerrar_axisctr173(){
        objUtiles.cerrarModal("axisctr173");
    }        
    
    function f_abrir_axisctr173(SSEGURO,SPRODUC){
        vSSEGURO173 = SSEGURO;
        objUtiles.abrirModal("axisctr173", "src", "modal_axisctr173.do?operation=retenida&origen=axisctr209&SSEGURO="+SSEGURO+"&SPRODUC="+SPRODUC);
    } 
        
        
    function callbackAjaxGuardar(ajaxResponseText){
        //alert(ajaxResponseText);
        var doc = objAjax.domParse(ajaxResponseText);
        if (objAppMensajes.existenErroresEnAplicacion(doc, false)) {
        
        }// recarrega scroll pane
            $.reinitialiseScroll(); 
    }
    
    //AUTORIZAR
    function f_but_9905858() 
    {
        if($("#permiteModificar").val() == 1)
        {
            //Generamos una lista (separada por ';') de los controles (PSUs) seleccionadas
            var checkedControls = $("input[name=check_ccontrol]:checked").map(function () {return this.value;}).get().join(";")
    
            if (objUtiles.estaVacio(checkedControls))
                alert(objJsMessages.jslit_selecciona_registro);
            else
            {
                objAjax.invokeAsyncCGI("axis_axisctr209.do", callbackValDocRequerida, 
                            "operation=ajax_valdocrequerida&NPOLIZA=" + $("#NPOLIZA").val() + "&CCONTROLS=" + checkedControls,
                            this, objJsMessages.jslit_cargando);
            }
        }
        else
        {
            alert('<axis:alt f="axisctr209" c="VAL_PERMISOS" lit="109905" />');
        }
    }
    
    //RECHAZAR
    function f_but_9000545()
    {
        if($("#permiteModificar").val() == 1)
        {
            //Generamos una lista (separada por ';') de los controles (PSUs) seleccionadas
            var checkedControls = $("input[name=check_ccontrol]:checked").map(function () {return this.value;}).get().join(";")
    
            if (objUtiles.estaVacio(checkedControls))
                alert(objJsMessages.jslit_selecciona_registro);
            else
                f_abrir_modal("axisctr036", false, "&origen=axisctr209.jsp&PMODO=" + $("#PMODO").val() + "&NPOLIZA=" + $("#NPOLIZA").val() + "&CCONTROLS=" + checkedControls, 900, 550);
        }
        else
        {
            alert('<axis:alt f="axisctr209" c="VAL_PERMISOS" lit="109905" />');
        }
    }
    
    function callbackValDocRequerida(ajaxResponseText){
        var confirma = false;

        var doc = objAjax.domParse(ajaxResponseText);
        
        if (objAppMensajes.existenErroresEnAplicacion(doc, false)) 
        {
            objAppMensajes.pintarMensajePantalla("<axis:alt f='axisctr209' c='ERRORRE' lit='9902267'/>", "error"); 
        }
        else
        {
            var checkedControls = $("input[name=check_ccontrol]:checked").map(function () {return this.value;}).get().join(";")
            f_abrir_modal("axisctr035", false, "&origen=axisctr209.jsp&PMODO=" + $("#PMODO").val() + "&NPOLIZA=" + $("#NPOLIZA").val() + "&CCONTROLS=" + checkedControls, 900, 500);
        }
            
        $.reinitialiseScroll(); 
    }
    
    //DETALLE PSU
    function f_abrir_axisctr034(CCONTROL)
    {
        /*$("#CCONTROL").val(CCONTROL);
        objUtiles.ejecutarFormulario ("axis_axisctr034.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);*/
        
        $("#CCONTROL").val(CCONTROL);
        objUtiles.ejecutarFormulario("axis_axisctr209.do", "consultar", document.miForm, "_self", objJsMessages.jslit_cargando);

    }

    </script>
</head>
<body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_aceptar() }">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>

    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation" value=""/>
		<input type="hidden" id="NPOLIZA" name="NPOLIZA" value="${sessionScope.PRETEN_FILTRO_BUSQUEDA.NPOLIZA}" />
        
        <c:if test="${empty __formdata.permiteModificar}">
            <input type="hidden" id="permiteModificar" name="permiteModificar" value="0" />
        </c:if>
        <c:if test="${!empty __formdata.permiteModificar}">
            <input type="hidden" id="permiteModificar" name="permiteModificar" value="${__formdata.permiteModificar}" />
        </c:if>
        
        <input type="hidden" id="PMODO" name="PMODO" value="AUTORIZA_MASIVO" />
        <input type="hidden" id="CCONTROL" name="CCONTROL" value="" />
        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><b><axis:alt f="axisctr209" c="AUTORIZAMASIVO" lit="9905850"/></b></c:param>    
            <c:param name="formulario"> <b><axis:alt f="axisctr209" c="AUTORIZAMASIVO" lit="9905850"/></b></c:param> 
            <c:param name="form">axisctr209</c:param>
        </c:import> 
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">
                axisctr033|<axis:alt f="axisctr209" c="TITULO035" lit="9000538"/>#axisctr035|<axis:alt f="axisctr209" c="TITULO036" lit="9000547"/>#axisctr036|<axis:alt f="axisctr209" c="TITULOA038" lit="9000548"/>
            </c:param>
        </c:import>

        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisctr009" c="DOCU_REQUERIDA" lit="9901998"/></c:param>
            <c:param name="nid" value="axisctr173" />
        </c:import>  

        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo" ><img src="images/flecha.gif"/><axis:alt f="axisctr209" c="ICOLITERAL" lit="104925"/> <img border="0" src="images/find.gif" onclick="f_but_buscar()" style="cursor:pointer"/></div>
                    
					<%-- INICIO SECCION 'Datos polizas' --%>
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <c:set var="title0"><axis:alt f="axisctr209" c="SOLICITUD" lit="109528"/></c:set>   <%-- Solicitud --%>
                                <c:set var="title8"><axis:alt f="axisctr209" c="POLIZA" lit="100836"/></c:set>      <%-- Póliza --%>                                 
                                <c:set var="title1"><axis:alt f="axisctr209" c="PRODUCTO" lit="100829" /></c:set>   <%-- Producto --%>              
                                <c:set var="title2"><axis:alt f="axisctr209" c="FALTA" lit="9000437"/></c:set>      <%-- F. Alta --%>
                                <c:set var="title3"><axis:alt f="axisctr209" c="FCANCEL" lit="9902670"/></c:set>    <%-- F. Cancel.9000808 --%>
                                <c:set var="title4"><axis:alt f="axisctr209" c="NIF" lit="105904"/></c:set>         <%-- NIF --%>
                                <c:set var="title5"><axis:alt f="axisctr209" c="TOMADOR" lit="101027"/></c:set>     <%-- Tomador --%>
                                <c:set var="title6"><axis:alt f="axisctr209" c="SITUACION" lit="100874"/></c:set>   <%-- Situación --%>             
                                <c:set var="title7"><axis:alt f="axisctr209" c="RETENCION" lit="101714"/></c:set>   <%-- Retención --%>   
                                <c:set var="title10"><axis:alt f="axisctr209" c="USUARIO" lit="100894"/></c:set>    <%-- Usuario --%>
                                <c:set var="title9"><axis:alt f="axisctr209" c="DOCREQUERIDA" lit="9902268"/></c:set>            
                                
                                <div id="dt_polizas" class="seccion displayspaceMaximo">
                                    <display:table name="${sessionScope.PRETEN_T_IAX_POLIZASRETEN}" id="T_IAX_POLIZASRETEN" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="axis_axisctr209.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="${title8}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.NPOLIZA" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.NPOLIZA}
                                            </div>
                                        </display:column>
                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.NSOLICI" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.NSOLICI}
                                            </div>
                                        </display:column>
                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.TROTULO" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.TROTULO}
                                            </div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.FMOVIMI" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                <fmt:formatDate value='${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.FMOVIMI}' pattern='dd/MM/yyyy'/>
                                            </div>
                                        </display:column>
                                        <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.FCANCEL" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                <fmt:formatDate value='${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.FCANCEL}' pattern='dd/MM/yyyy'/>
                                            </div>
                                        </display:column>
                                        <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.NNUMIDE" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.NNUMIDE}                                           
                                            </div>
                                        </display:column>
                                        <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.TOMADOR" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.TOMADOR}                                           
                                            </div>
                                        </display:column>
                                        <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.TSITUAC" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.TSITUAC}                                           
                                            </div>  
                                        </display:column>
                                        <display:column title="${title7}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.TRETENI" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.TRETENI}                                           
                                            </div>
                                        </display:column>
                                        <axis:visible c="CUSUMOV" f="axisctr209">
                                        <display:column title="${title10}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.TRETENI" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.CUSUMOV}                                           
                                            </div>
                                        </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisctr209" c="DOCREQUERIDA">
                                         <display:column title="${title9}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.TRETENI" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                <c:if test="${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.DOCREQ == 1}">
                                                    <div class="dspIcons"><img border="0" src="images/lapiz.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="javascript:f_abrir_axisctr173('${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.SSEGURO}','${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.SPRODUC}');"/></div>                               
                                                </c:if>
                                            </div>
                                        </display:column>
                                        </axis:visible>
                                    </display:table>                                                        
                                </div>
                            </td>
                        </tr>
                    </table>
					<%-- FIN SECCION 'Datos polizas' --%>
	                        
                    <div class="separador">&nbsp;</div>
                                        
                    <div class="titulo"><img src="images/flecha.gif"/><b><axis:alt f="axisctr209" c="RESUMENPSU" lit="9905851"/></b></div>
        
                    <%-- INICIO SECCION 'Resumen PSUs' --%>
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <c:set var="title0"><axis:alt f="axisctr209" c="TCONTROL" lit="9900975"/></c:set>
                                <c:set var="title1"><axis:alt f="axisctr209" c="CONTADOR" lit="101093"/></c:set>
                                <c:set var="title2"><axis:alt f="axisctr209" c="INFO" lit="1000113" /></c:set>
                                <c:set var="title3"><axis:alt f="axisctr209" c="AUTMANUAL" lit="9902677" /></c:set>
                                <c:set var="title4"><axis:alt f="axisctr209" c="CONTAUT" lit="9905874" /></c:set>
                                <c:set var="title5"><axis:alt f="axisctr209" c="CONTPDTE" lit="9905875" /></c:set>
                                <c:set var="title6"><axis:alt f="axisctr209" c="CONTREC" lit="9905876" /></c:set>
                                
                                <div id="dt_psus" class="seccion displayspaceMaximo">
                                    <display:table name="${sessionScope.PRETEN_T_IAX_POLRETPSU}" id="T_IAX_POLRETPSU" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="axis_axisctr209.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                       
                                        <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >
                                            <div class="dspIcons">
                                                <input type="checkbox" name="check_ccontrol" value="${T_IAX_POLRETPSU.OB_IAX_POLRETENPSU.CCONTROL}" <c:if test="${T_IAX_POLRETPSU.OB_IAX_POLRETENPSU.AUTMANUAL == 'M'}">disabled="disabled"</c:if>/>
                                            </div>
                                        </display:column>
                                        
                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_POLRETENPSU.TCONTROL" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${T_IAX_POLRETPSU.OB_IAX_POLRETENPSU.TCONTROL}
                                            </div>
                                        </display:column>
                                        
                                        <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_POLRETENPSU.AUTMANUAL" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                <c:if test="${T_IAX_POLRETPSU.OB_IAX_POLRETENPSU.AUTMANUAL == 'M'}">
                                                <axis:alt f="axisctr209" c="MANUAL" lit="9000958"/>
                                                </c:if>
                                                <c:if test="${T_IAX_POLRETPSU.OB_IAX_POLRETENPSU.AUTMANUAL == 'A'}">
                                                <axis:alt f="axisctr209" c="AUTOMATICO" lit="9905581"/>
                                                </c:if>
                                            </div>
                                        </display:column>
                                        
                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_POLRETENPSU.CONTADOR" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${T_IAX_POLRETPSU.OB_IAX_POLRETENPSU.CONTADOR}
                                            </div>
                                        </display:column>
                                        
                                        <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_POLRETENPSU.CONTPDTE" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${T_IAX_POLRETPSU.OB_IAX_POLRETENPSU.CONTPDTE}
                                            </div>
                                        </display:column>
                                        
                                        <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_POLRETENPSU.CONTAUT" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${T_IAX_POLRETPSU.OB_IAX_POLRETENPSU.CONTAUT}
                                            </div>
                                        </display:column>
                                        
                                        <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_POLRETENPSU.CONTREC" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${T_IAX_POLRETPSU.OB_IAX_POLRETENPSU.CONTREC}
                                            </div>
                                        </display:column>

                                        <display:column title="${title2}" headerClass="headwidth5 fixed sortable" media="html" autolink="false" >
                                            <div class="dspIcons">
                                                <img border="0" alt="<axis:alt f="axisctr209" c="INFO" lit="1000113"/>" src="images/mas.gif" width="11px" height="11px"
                                                    style="vertical-align:middle;cursor:pointer;" onclick="f_abrir_axisctr034(${T_IAX_POLRETPSU.OB_IAX_POLRETENPSU.CCONTROL})" 
                                                    title="<axis:alt f='axisctr209' c='INFO' lit='1000113'/>"/>
                                            </div>
                                        </display:column>   
                                    </display:table>                                                        
                                </div>
                            </td>
                        </tr>
                    </table>
                    <%-- FIN SECCION 'Resumen PSUs' --%>
                </td>
            </tr>
        </table><!-- fin mainTableDimensions -->

        <div class="separador">&nbsp;</div>
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr209</c:param>
            <c:param name="__botones">salir<c:if test="${!empty sessionScope.PRETEN_T_IAX_POLIZASRETEN}"><axis:visible c="BT_9905858" f="axisctr209">,9905858</axis:visible><axis:visible c="BT_9000545" f="axisctr209">,9000545</axis:visible></c:if></c:param>
        </c:import>

    </form>

    <c:import url="../include/mensajes.jsp"/>
</body>
</html>								


