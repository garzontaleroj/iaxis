<%--/**
*  Fichero: axispro001.jsp
*  Titulo: Consulta/Mantenimiento de Productos
*
*  Fecha: 02/04/2008
*/
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axispro001" c="TITULOPRO001" lit="101908"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {
            // Nos cargamos la LISTAPRODUCTOS en session del modal buscador
            <c:remove var="LISTAPRODUCTOS" scope="session"/>
            ////f_cargar_propiedades_pantalla();
            /* Inicialización por si venimos de fórmulas */
            /* Abrir el modal de garantías y dentro de este el de fórmulas */
            var CGARAN = '${__formdata.CGARAN_FORMULA}';
            var SPRODUC = '${__formdata.SPRODUC_FORMULA}';
            if(!objUtiles.estaVacio(CGARAN)){
                document.miForm.SPRODUC.value = SPRODUC;
                var CACTIVI = '${__formdata.CACTIVI_FORMULA}';
                var strurl="modal_axispro001_garantias.do?operation=form&SPRODUC="+ SPRODUC +
                        "&CACTIVI="+ CACTIVI + "&CGARANT="+ CGARAN +"&dt="+(new Date().getTime()) + "&subpantalla=garantias_formulas"; 
                objUtiles.abrirModal("axispro001garantias", "src", strurl);
            //f_cargar_propiedades_pantalla();
            }
            
            /* Inicialización para tipos de interés */
            /* (Seleccionar el primer registro del cuadro si no hay ninguno seleccionado */
            if (!objUtiles.estaVacio(document.getElementById("radioCTIPO"))) {
                var isCTIPOselected = ${!empty sessionScope.DATTECN_CTIPO};
                var pantallaCTIPO = !objUtiles.estaVacio(document.getElementById("radioCTIPO").length) ? document.getElementById("radioCTIPO")[0]
                        : document.getElementById("radioCTIPO");

                if (!isCTIPOselected) {
                    // Seleccionar el primer tipo de interés (si lo hay)
                        pantallaCTIPO.checked = true;
                        pantallaCTIPO.onclick();
                } else {
                    var sessionCTIPO = ${!empty sessionScope.DATTECN_CTIPO ? sessionScope.DATTECN_CTIPO : -1};
                    if (sessionCTIPO != pantallaCTIPO.value)
                        pantallaCTIPO.checked = false;
                }
            }
                
            // Desplegar la subsección contenida en el request parameter "subpantalla"
            <% 
            if (request.getAttribute("subpantalla") != null && !"null".equals(request.getAttribute("subpantalla")) && !"".equals(request.getAttribute("subpantalla"))) { 
            %>       
                var subpantalla = '<%=request.getAttribute("subpantalla")%>';                        
                
                if (objUtiles.utilStartsWith(subpantalla, "actividades") && subpantalla != "actividades") {                    
                    objEstilos.toggleDisplay("actividades", document.getElementById("actividades_parent"));
                }
                if (objUtiles.utilStartsWith(subpantalla, "garantias") && subpantalla != "garantias") {
                    objEstilos.toggleDisplay("garantias", document.getElementById("garantias_parent"));
                }
                if (objUtiles.utilStartsWith(subpantalla, "datostecnicos") && subpantalla != "datostecnicos") {
                    objEstilos.toggleDisplay("datostecnicos", document.getElementById("datostecnicos_parent"));                    
                }
                if (objUtiles.utilStartsWith(subpantalla, "datosgenerales") && subpantalla != "datosgenerales") {
                    objEstilos.toggleDisplay("datosgenerales", document.getElementById("datosgenerales_parent"));                    
                }
                
                objEstilos.toggleDisplay(subpantalla, document.getElementById(subpantalla + "_parent"));
            <% } %>
            
            revisarEstilos();
            
            // Abrir modal buscador o alta productos            
            var cmodo = '<%=axis.mvc.control.AbstractDispatchAction.topPila(request, "CMODO")%>';
         
            if (objUtiles.estaVacio(document.miForm.SPRODUC.value)){
                if (cmodo == 'ALTA_PRODUCTO') {
                    objUtiles.abrirModal("axispro019", "src", "modal_axispro019.do?operation=init");
                }
                else{
                    f_abrir_modal("axispro002", true);
                }
            }
            if(typeof f_onloadDatosTecnicos == 'function') { 
                f_onloadDatosTecnicos();
            }
        }
        
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axispro001", "cancelar", document.miForm, "_self");
        }
        
        function f_but_buscar() {
            f_abrir_modal("axispro002", true);
        }
        
        function f_but_imprimir() {
            if (objUtiles.estaVacio (objDom.getValorPorId("SPRODUC"))) 
                    alert(objJsMessages.jslit_selecciona_producto);
            else{
                //Acción de imprimir
            }
        }
        
        function f_but_editar_actividad(){
            objUtiles.ejecutarFormulario("axis_axispro001.do", "editar_actividad", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_103669() { // 103669: Duplicar 
            objUtiles.abrirModal("axispro013", "src", "modal_axispro013.do?operation=form&SPRODUC=" + document.miForm.SPRODUC.value);
        }
        
        function f_but_9901368() { // 9901368: Nou producte 
            objUtiles.abrirModal("axispro019", "src", "modal_axispro019.do?operation=form");
        }
         function f_but_parametros() {
            objUtiles.ejecutarFormulario("axis_axispro001.do", "consultarParametros", document.miForm, "_self", objJsMessages.jslit_cargando);
         }
        
         function f_but_parametrosgar() {
            objUtiles.ejecutarFormulario("modal_axispro001_garantias.do", "consultarParametrosgar", document.miForm, "_self", objJsMessages.jslit_cargando);
         }
         
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            var SPRODUC = document.miForm.SPRODUC.value;
            var CACTIVI = document.miForm.CACTIVI.value;

            if (!objUtiles.estaVacio(CACTIVI)) 
            {               
                 document.miForm.CACTIVI.value = '';  
            }    

            if (objUtiles.estaVacio(SPRODUC)) {
                SPRODUC = '${mntproducto.SPRODUC}';    
                document.miForm.SPRODUC.value = SPRODUC;
            }
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";

            if (noXButton)
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");

            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form&SPRODUC=" + SPRODUC + optionalQueryString);        
        }
      
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_cerrar_modal_garantias(cual) {
            objUtiles.cerrarModal(cual);
            objUtiles.ejecutarFormulario("axis_axispro001.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_aceptar_modal(cual, subpantalla) {
            f_cerrar_modal(cual);
            
            if (!objUtiles.estaVacio(subpantalla))
                document.miForm.subpantalla.value = subpantalla;
                
            objUtiles.ejecutarFormulario("axis_axispro001.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_aceptar_axispro002(SPRODUC) {
            document.miForm.SPRODUC.value = SPRODUC;
           
            f_cerrar_modal("axispro002");            
            objUtiles.ejecutarFormulario("axis_axispro001.do", "init", document.miForm, "_self", objJsMessages.jslit_cargando);
        }

        function f_borrar_interficie(CCODIGO, CVALAXIS) {
            objDom.setValorPorId("CCODIGO", CCODIGO);
            objDom.setValorPorId("CVALAXIS", CVALAXIS);
            document.miForm.subpantalla.value="interficie";
            var answer = confirm(objJsMessages.jslit_confirma_borrar);
            if (answer)            
                objUtiles.ejecutarFormulario("axis_axispro001.do?", "eliminar_interficie", document.miForm, "_self", objJsMessages.jslit_cargando);
        }

        function f_aceptar_axispro019(SPRODUC) {
            document.miForm.SPRODUC.value = SPRODUC;
           
            f_cerrar_modal("axispro019");            
            objUtiles.ejecutarFormulario("axis_axispro001.do", "init", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
    </script>    
</head>

<body onload="f_onload()">

<c:import url="../include/precargador_ajax.jsp">
    <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
</c:import>

<c:import url="../include/modal_estandar.jsp">
    <c:param name="nid_y_titulo">axispro002|<axis:alt f="axispro001" c="NIDAXISPRO002" lit="1000218"/>#axispro003|<axis:alt f="axispro001" c="TITAXISPRO003" lit="1000219"/>#axispro013|<axis:alt f="axispro001" c="TITULOAXISPRO003_2" lit="152707"/></c:param>
</c:import>

<c:import url="../include/modal_estandar.jsp">
    <c:param name="nid_y_titulo">axispro001garantias|<axis:alt f="axispro001" c="LIT_AXISPRO001_GAR" lit="1000183"/></c:param>
</c:import>

<c:import url="../include/modal_estandar.jsp">
    <c:param name="nid_y_titulo">axispro004|<axis:alt f="axispro001" c="LIT_AXISPRO004" lit="1000220"/></c:param>
</c:import>

<c:import url="../include/modal_estandar.jsp">
    <c:param name="nid_y_titulo">axispro005|<axis:alt f="axispro001" c="LIT_AXISPRO005" lit="1000221"/></c:param>
</c:import>

<c:import url="../include/modal_estandar.jsp">
    <c:param name="nid_y_titulo">axispro006|<axis:alt f="axispro001" c="LIT_AXISPRO006" lit="1000222"/></c:param>
</c:import>

<c:import url="../include/modal_estandar.jsp">
    <c:param name="nid_y_titulo">axispro007|<axis:alt f="axispro001" c="LIT_AXISPRO007" lit="1000223"/>#axispro018|<axis:alt f="axispro001" c="LIT_AXISPRO018" lit="1000539"/></c:param>
</c:import>

<c:import url="../include/modal_estandar.jsp">
    <c:param name="nid_y_titulo">axispro008|<axis:alt f="axispro001" c="LIT_AXISPRO008" lit="1000223"/></c:param>
</c:import>
<c:import url="../include/modal_estandar.jsp">
    <c:param name="nid_y_titulo">axispro009|<axis:alt f="axispro001" c="LIT_AXISPRO009" lit="1000223"/></c:param>
</c:import>

<c:import url="../include/modal_estandar.jsp">
    <c:param name="nid_y_titulo">axispro011|<axis:alt f="axispro001" c="LIT_AXISPRO011" lit="9000667"/></c:param>
</c:import>

<c:import url="../include/modal_estandar.jsp">
    <c:param name="nid_y_titulo">axismpr003|<axis:alt f="axispro001" c="LIT_AXISPRO003" lit="1000208"/></c:param>
</c:import>

<c:import url="../include/modal_estandar.jsp">
    <c:param name="nid_y_titulo">axispro039|<axis:alt f="axispro001" c="LIT_AXISPRO039" lit="9001874"/></c:param>
</c:import>
<c:import url="../include/modal_estandar.jsp">
    <c:param name="nid_y_titulo">axispro047|<axis:alt f="axispro001" c="LIT_AXISPRO047" lit="9905800"/></c:param>
</c:import>
<c:import url="../include/modal_estandar.jsp">
    <c:param name="nid_y_titulo">axispro019|<axis:alt f="axispro001" c="LIT_AXISPRO019" lit="9901357"/></c:param>
</c:import>
<c:import url="../include/modal_estandar.jsp">
    <c:param name="nid_y_titulo">axispro033|<axis:alt f="axispro001" c="LIT_AXISPRO033" lit="9901153"/></c:param>
</c:import>

<c:import url="../include/modal_estandar.jsp">
    <c:param name="nid_y_titulo">axispro040|<axis:alt f="axispro001" c="LIT_AXISPRO040" lit="101603"/></c:param>
</c:import>

<c:import url="../include/modal_estandar.jsp">
    <c:param name="nid_y_titulo">axiscomi008|<axis:alt f="axispro001" c="LIT_AXISCOMI008" lit="9901327"/></c:param>
</c:import>

<c:import url="../include/modal_estandar.jsp">
    <c:param name="nid_y_titulo">axispro052|<axis:alt f="axispro052" c="LIT_AXISPRO052" lit="9906236"/></c:param>
</c:import>

<c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt f="axispro001" c="LIT_TITULO" lit="1000217"/></c:param>
        <c:param name="formulario"><axis:alt f="axispro001" c="LIT_FORMULARIO" lit="1000217"/></c:param>
        <c:param name="form">axispro001</c:param>
</c:import>

<!-- Area de campos  -->
<table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <div class="separador">&nbsp;</div>
            <div class="titulo">
                <img src="images/flecha.gif"/><c:if test="${!empty mntproducto.SPRODUC}">${mntproducto.SPRODUC} - ${mntproducto.TTITULO}</c:if>
                <img id="find" border="0" src="images/find.gif" onclick="f_abrir_modal('axispro002')" style="cursor:pointer"/>                
            </div>
            
            <c:if test="${!empty mntproducto.SPRODUC}">
            <table class="seccion">
                <tr>
                    <td align="left">
                        <table class="area" align="center">
                             <tr>
                                <th style="height:0px"></th>
                            </tr>
                            <!-- Datos Generales -->
                            <tr>
                                <td class="campocaja" >
                                    <c:set var="datosGenerales_Resumen">${mntproducto.CRAMO} - ${mntproducto.CMODALI} - ${mntproducto.CTIPSEG} - ${mntproducto.CCOLECT} - ${mntproducto.TTITULO} - ${mntproducto.TAGRPRO} - ${mntproducto.TACTIVO}
                                    </c:set>          
                                    <div style="float:left;">
                                        <img id="datosgenerales_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('datosgenerales', this)" style="cursor:pointer"/> 
                                        <b><axis:alt f="axispro001" c="LIT_IMG_DATGENERALES" lit="103593"/></b> &nbsp; ${datosGenerales_Resumen}
                                    </div>
                                    <axis:visible f="axispro001" c="EDIT_DATOSGENERALES">
                                        <div style="float:right;">
                                            <a href="javascript:f_abrir_modal('axispro003')"><img border="0" alt="<axis:alt f="axispro001" c="LIT_IMG_EDITDATGENERALES" lit="100002"/> <axis:alt f="axispro001" c="LIT_IMG_EDITDATGENERALES" lit="103593"/>" title="<axis:alt f="axispro001" c="LIT_IMG_EDITDATGENERALES" lit="100002"/> <axis:alt f="axispro001" c="LIT_IMG_EDITDATGENERALES" lit="103593"/>" src="images/lapiz.gif"/></a>
                                        </div>
                                    </axis:visible>
                                    <div style="clear:both;">
                                        <hr class="titulo">
                                    </div>
                                </td>
                            </tr>                                    
                            <tr id="datosgenerales_children" style="display:none">
                                <td align="left" >
                                    <c:import url="axispro001_datosgenerales.jsp"/>
                                </td>
                            </tr>
                            <!-- Gestión -->

                            <tr>
                                <td class="campocaja" >
                                    <c:set var="gestion_Resumen">
                                        <axis:alt f="axispro001" c="LIT_TDURACI" lit="1000120"/>:
                                        ${mntproducto.GESTION.TDURACI} -
                                        <axis:alt f="axispro001" c="LIT_TTIPEFE" lit="109625"/>:
                                        ${mntproducto.GESTION.TTIPEFE} -
                                        <axis:alt f="axispro001" c="LIT_TTARMAN" lit="100760"/>
                                        ${mntproducto.GESTION.TTARMAN} 
                                    </c:set>          
                                    <div style="float:left;">
                                        <img id="gestion_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('gestion', this)" style="cursor:pointer"/> 
                                        <b><axis:alt f="axispro001" c="LIT_GESTION" lit="101109"/></b> &nbsp; ${gestion_Resumen}
                                    </div>
                                    <axis:visible f="axispro001" c="EDIT_GESTION">
                                        <div style="float:right;">
                                            <a href="javascript:f_abrir_modal('axispro005')"><img border="0" alt="<axis:alt f="axispro001" c="LIT_EDIT_GESTION1" lit="100002"/> <axis:alt f="axispro001" c="LIT_EDIT_GESTION2" lit="101109"/>" title="<axis:alt f="axispro001" c="LIT_EDIT_GESTION1" lit="100002"/> <axis:alt f="axispro001" c="LIT_EDIT_GESTION2" lit="101109"/>" src="images/lapiz.gif"/></a>
                                        </div>
                                    </axis:visible>
                                    <div style="clear:both;">
                                        <hr class="titulo">
                                    </div>
                                </td>
                            </tr>
                            <tr id="gestion_children" style="display:none">
                                <td align="left" >
                                    <c:import url="axispro001_gestion.jsp"/> 
                                </td>
                            </tr>
                            <!-- Administración -->
                            <tr>
                                <td class="campocaja" >
                                    <c:set var="administracion_Resumen">
                                        <axis:alt f="axispro001" c="LIT_TTIPREB" lit="100709"/>
                                        ${mntproducto.ADMPROD.TTIPREB} -
                                        <axis:alt f="axispro001" c="LIT_TTIPPAG" lit="100710"/>
                                        ${mntproducto.ADMPROD.TTIPPAG} -
                                        <axis:alt f="axispro001" c="LIT_TCOBBAN" lit="100879"/>
                                        ${mntproducto.ADMPROD.TCOBBAN}
                                    </c:set>               
                                    <div style="float:left;">
                                        <img id="administracion_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('administracion', this)" style="cursor:pointer"/> 
                                        <b><axis:alt f="axispro001" c="LIT_ADMINISTRACION" lit="100591"/></b> &nbsp; ${administracion_Resumen}
                                    </div>
                                    <axis:visible f="axispro001" c="EDIT_ADMINISTRACION">
                                        <div style="float:right;">
                                            <a href="javascript:f_abrir_modal('axispro004')"><img border="0" alt="<axis:alt f="axispro001" c="LIT_EDIT_ADMINISTRACION1" lit="100002"/> <axis:alt f="axispro001" c="LIT_EDIT_ADMINISTRACION2" lit="100591"/>" title="<axis:alt f="axispro001" c="LIT_EDIT_ADMINISTRACION1" lit="100002"/> <axis:alt f="axispro001" c="LIT_EDIT_ADMINISTRACION2" lit="100591"/>" src="images/lapiz.gif"/></a>
                                        </div>
                                    </axis:visible>
                                    <div style="clear:both;">
                                        <hr class="titulo">
                                    </div>
                                </td>
                            </tr>
                            <tr id="administracion_children" style="display:none">
                                <td align="left" >
                                    <c:import url="axispro001_administracion.jsp"/>
                                </td>
                            </tr>
                     
                            <!-- Formas de pago -->
                            <tr>
                                <td class="campocaja" >
                                    <%-- Concatenar diferentes TFORPAGs (si COBLIGA == 1) --%>     
                                    <c:forEach items="${mntproducto.FORPAGO}" var="FORPAGO">
                                        <c:if test="${FORPAGO.OB_IAX_PRODFORMAPAGO.COBLIGA == 1}">
                                             <c:set var="formesp" value="${formesp} ${FORPAGO.OB_IAX_PRODFORMAPAGO.TFORPAG}"/>
                                        </c:if>
                                    </c:forEach>
                                    <div style="float:left;">
                                        <img id="formasdepago_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('formasdepago', this)" style="cursor:pointer"/> 
                                        <b><axis:alt f="axispro001" c="LIT_FORMASPAGO" lit="103313"/></b> &nbsp; ${formesp}
                                    </div>
                                    <axis:visible f="axispro001" c="EDIT_FORMASDEPAGO">
                                        <div style="float:right;">
                                            <a href="javascript:f_abrir_modal('axispro006')"><img border="0" alt="<axis:alt f="axispro001" c="LIT_EDITFORMASPAGO1" lit="100002"/> <axis:alt f="axispro001" c="LIT_EDITFORMASPAGO2" lit="103313"/>" title="<axis:alt f="axispro001" c="LIT_EDITFORMASPAGO1" lit="100002"/> <axis:alt f="axispro001" c="LIT_EDITFORMASPAGO2" lit="103313"/>" src="images/lapiz.gif"/></a>
                                        </div>
                                    </axis:visible>
                                    <div style="clear:both;">
                                        <hr class="titulo">
                                    </div>
                                </td>
                            </tr>
                            <tr id="formasdepago_children" style="display:none">
                                <td align="left" >
                                     <c:import url="axispro001_formasdepago.jsp"/> 
                                </td>
                            </tr>
                            <axis:visible c="DSP_DATTEC" f="axispro001">
                            <!-- Datos técnicos -->
                            <tr>
                                <td class="campocaja" >
                                    <c:set var="interes_tecnico_nivel_garantia"><axis:alt f="axispro001" c="LIT_TEC_GARANTIA" lit="1000250"/></c:set>
                                    <c:set var="gastos_nivel_garantia"><axis:alt f="axispro001" c="LIT_NIV_GARANTIA" lit="1000239"/></c:set>
                                    <c:set var="interes_tecnico_nivel_producto"><axis:alt f="axispro001" c="LIT_TEC_PRODUCTO" lit="1000251"/></c:set>
                                    <c:set var="gastos_nivel_producto"><axis:alt f="axispro001" c="LIT_NIV_PRODUCTO" lit="1000240"/></c:set>                                        
                                    <c:set var="datosTecnicos_Resumen">
                                        <c:if test="${mntproducto.DATTECN.NNIIGAR == '1'}">${interes_tecnico_nivel_garantia} -</c:if>
                                        <c:if test="${mntproducto.DATTECN.NNIIGAR == '0'}">${interes_tecnico_nivel_producto} -</c:if>                                        
                                        <c:if test="${mntproducto.DATTECN.NNIGGAR == '1'}">${gastos_nivel_garantia}</c:if>
                                        <c:if test="${mntproducto.DATTECN.NNIGGAR == '0'}">${gastos_nivel_producto}</c:if>
                                        <c:if test="${!empty mntproducto.DATTECN.TTABLA}">
                                        - <axis:alt f="axispro001" c="LIT_TTABLA" lit="1000354"/>: ${mntproducto.DATTECN.TTABLA}
                                        </c:if>
                                    </c:set>                                        
                                    <div style="float:left;">
                                        <img id="datostecnicos_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('datostecnicos', this)" style="cursor:pointer"/>
                                        <span id="datostecnicos_resumen"> <b><axis:alt f="axispro001" c="LIT_DTATEC_RESUMEN" lit="1000101"/></b> &nbsp; ${datosTecnicos_Resumen}</span>
                                    </div>
                                    <axis:visible f="axispro001" c="EDIT_DATOSTECNICOS">
                                        <div style="float:right;">
                                            <a href="javascript:f_abrir_modal('axispro007', true)"><img border="0" alt="<axis:alt f="axispro001" c="LIT_DATTECNICOS1" lit="100002"/> <axis:alt f="axispro001" c="LIT_DATTECNICOS2" lit="1000101"/>" title="<axis:alt f="axispro001" c="LIT_DATTECNICOS1" lit="100002"/> <axis:alt f="axispro001" c="LIT_DATTECNICOS2" lit="1000101"/>" src="images/lapiz.gif"/></a>
                                        </div>
                                    </axis:visible>
                                    <div style="clear:both;">
                                        <hr class="titulo">
                                    </div>
                                </td>
                            </tr>
                            <tr id="datostecnicos_children" style="display:none">
                                <td align="left" >
                                    <c:import url="axispro001_datostecnicos.jsp"/>
                                </td>
                            </tr>
                          </axis:visible>
                            <!-- Preguntas -->
                            <tr>
                                <td class="campocaja" >
                                          
                                    <div style="float:left;">
                                        <img id="preguntas_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('preguntas', this)" style="cursor:pointer"/> 
                                        <span id="preguntas_resumen"> <b><axis:alt f="axispro001" c="LIT_PREGUNTAS_RESUMEN" lit="102299"/></b> &nbsp; ${preguntas_Resumen}</span>
                                    </div>
                                    <axis:visible f="axispro001" c="EDIT_preguntas">
                                        <div style="float:right;">
                                            <a href="javascript:f_abrir_modal('axispro033', true,'&VMODO=PROD')"><img border="0" alt="<axis:alt f="axispro001" c="LIT_EDIT_PREGUNTAS1" lit="100002"/> <axis:alt f="axispro001" c="LIT_EDIT_PREGUNTAS2" lit="102299"/>" title="<axis:alt f="axispro001" c="LIT_EDIT_PREGUNTAS1" lit="100002"/> <axis:alt f="axispro001" c="LIT_EDIT_PREGUNTAS2" lit="102299"/>" src="images/lapiz.gif"/></a>
                                        </div>
                                    </axis:visible>
                                    <div style="clear:both;">
                                        <hr class="titulo">
                                    </div>
                                </td>
                            </tr>
                            <tr id="preguntas_children" style="display:none">
                                <td align="left" >
                                    <c:import url="axispro001_preguntas.jsp"/>
                                </td>
                            </tr>  
                            <!-- Interficies -->
                            <tr>
                                <td class="campocaja" >
                                          
                                    <div style="float:left;">
                                        <img id="interficies_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('interficies', this)" style="cursor:pointer"/> 
                                        <span id="interficies_resumen"> <b><axis:alt f="axispro001" c="LIT_INTERFICIES_RESUMEN" lit="110251"/></b> &nbsp; ${interficies_Resumen}</span>
                                    </div>
                                    <axis:visible f="axispro001" c="BTN_ANADIR_INTERFICIE">
                                        <div style="float:right;">
                                            <a href="javascript:f_abrir_modal('axispro052', true)"><img border="0" alt="<axis:alt f="axispro001" c="LIT_EDIT_INTERFICIE1" lit="100002"/> <axis:alt f="axispro001" c="LIT_EDIT_INTERFICIE2" lit="110251"/>" title="<axis:alt f="axispro001" c="LIT_EDIT_INTERFICIE1" lit="100002"/> <axis:alt f="axispro001" c="LIT_EDIT_INTERFICIE2" lit="110251"/>" src="images/new.gif"/></a>
                                        </div>
                                    </axis:visible>
                                    <div style="clear:both;">
                                        <hr class="titulo">
                                    </div>
                                </td>
                            </tr>
                            <tr id="interficies_children" style="display:none">
                                <td align="left" >
                                    <c:import url="axispro001_interficie.jsp"/>
                                </td>
                            </tr>  
                            <!-- Datos Unit Linked -->

                         <c:if test="${!empty mntproducto.UNITULK}">
                            <tr>
                                <td class="campocaja" >
                                    <c:set var="proponer_valores_liquidativos"><axis:alt f="axispro001" c="LIT_UNITULK" lit="1000337"/></c:set>
                                    <c:set var="si"><axis:alt f="axispro001" c="LIT_UNITULK_SI" lit="101778"/></c:set>
                                    <c:set var="no"><axis:alt f="axispro001" c="LIT_UNITULK_NO" lit="101779"/></c:set>
                                    <c:set var="datosUnitLinked_Resumen">
                                        <axis:alt f="axispro001" c="LIT_CPROVAL" lit="1000337"/>
                                            ${mntproducto.UNITULK.CPROVAL == "1" ? si : no}
                                    </c:set>          
                                    <div style="float:left;">
                                        <img id="datosunitlinked_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('datosunitlinked', this)" style="cursor:pointer"/> 
                                        <span id="datosunitlinked_resumen"> <b><axis:alt f="axispro001" c="LIT_UNITLINKED_RESUMEN" lit="1000103"/></b> &nbsp; ${datosUnitLinked_Resumen}</span>
                                    </div>
                                    <axis:visible f="axispro001" c="EDIT_DATOSUNITLINKED">
                                        <div style="float:right;">
                                             <a href="javascript:f_abrir_modal('axispro008')"><img border="0" alt="<axis:alt f="axispro001" c="LIT_EDIT_UNITULK1" lit="100002"/> <axis:alt f="axispro001" c="LIT_EDIT_UNITULK2" lit="1000103"/>" title="<axis:alt f="axispro001" c="LIT_EDIT_UNITULK1" lit="100002"/> <axis:alt f="axispro001" c="LIT_EDIT_UNITULK2" lit="1000103"/>" src="images/lapiz.gif"/></a>
                                        </div>
                                    </axis:visible>
                                    <div style="clear:both;">
                                        <hr class="titulo">
                                    </div>
                                </td>
                            </tr>
                            
                            <tr id="datosunitlinked_children" style="display:none">
                                <td align="left" >
                                    <c:import url="axispro001_datosunitlinked.jsp"/>
                                </td>
                            </tr>
                          </c:if>
                            <!-- Datos Rentas -->
                           <c:if test="${!empty mntproducto.DATRENT}">
                            <tr>
                                <td class="campocaja" >
                                    <c:set var="datosRentas_Resumen">
                                        ${mntproducto.DATRENT.TTIPREN} - ${mntproducto.DATRENT.TCLAREN}
                                    </c:set>
                                    <div style="float:left;">
                                        <img id="datosrentas_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('datosrentas', this)" style="cursor:pointer"/> 
                                        <b><axis:alt f="axispro001" c="LIT_RENTAS_RESUMEN" lit="1000099"/></b> &nbsp; ${datosRentas_Resumen}
                                    </div>
                                    <axis:visible f="axispro001" c="EDIT_DATOSRENTAS">
                                        <div style="float:right;">
                                            <a href="javascript:f_abrir_modal('axispro009')"><img border="0" alt="<axis:alt f="axispro001" c="LIT_EDIT_DATOSRENTAS1" lit="100002"/> <axis:alt f="axispro001" c="LIT_EDIT_DATOSRENTAS2" lit="1000099"/>" title="<axis:alt f="axispro001" c="LIT_EDIT_DATOSRENTAS1" lit="100002"/> <axis:alt f="axispro001" c="LIT_EDIT_DATOSRENTAS2" lit="1000099"/>" src="images/lapiz.gif"/></a>
                                        </div>
                                    </axis:visible>
                                    <div style="clear:both;">
                                        <hr class="titulo">
                                    </div>
                                </td>
                            </tr>
                            <tr id="datosrentas_children" style="display:none">
                                <td align="left" >
                                    <c:import url="axispro001_datosrentas.jsp"/>
                                </td>
                            </tr>

                            </c:if>
                            <!-- Actividades -->
                            <c:if test="${mntproducto.ACTIVID!=null}">
                            <tr>
                                <td class="campocaja" >
                                    <div style="float:left;">
                                        <img id="actividades_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('actividades', this)" style="cursor:pointer"/> 
                                        <b><axis:alt f="axispro001" c="LIT_EDIT_ACTIVIDADES1" lit="103477"/></b>
                                    </div>
                                    <axis:visible f="axispro001" c="EDIT_ACTIVIDADES">
                                        <div style="float:right;">
                                            <a href="javascript:f_but_editar_actividad()"><img border="0" alt="<axis:alt f="axispro001" c="LIT_EDIT_DATOSRENTAS1" lit="100002"/> <axis:alt f="axispro001" c="LIT_EDIT_DATOSRENTAS2" lit="103477"/>" title="<axis:alt f="axispro001" c="LIT_EDIT_DATOSRENTAS1" lit="100002"/> <axis:alt f="axispro001" c="LIT_EDIT_DATOSRENTAS2" lit="103477"/>" src="images/lapiz.gif"/></a>
                                        </div>
                                    </axis:visible>
                                    <div style="clear:both;">
                                        <hr class="titulo">
                                    </div>
                                </td>
                            </tr>
                            <tr id="actividades_children" style="display:none">
                                <td align="left" >
                                    <c:import url="axispro001_actividades.jsp"/>
                                </td>
                            </tr>
                            </c:if>
                            <!-- Garantías -->
                            <tr>
                                <td class="campocaja" >
                                    <div style="float:left;">
                                        <img id="garantias_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('garantias', this)" style="cursor:pointer"/> 
                                        <b><axis:alt f="axispro001" c="LIT_EDIT_GARANTIAS" lit="1000183"/></b>
                                    </div>
                                    <axis:visible f="axispro001" c="EDIT_GARANTIAS">
                                        <div style="float:right;">
                                            <a href="javascript:f_abrir_modal('axispro040', true,'&CACTIVI='+document.miForm.CACTIVI.value)"><img border="0" alt="<axis:alt f="axispro001" c="LIT_EDIT_GARANTIAS1" lit="100002"/> <axis:alt f="axispro001" c="LIT_EDIT_GARANTIAS2" lit="1000183"/>" title="<axis:alt f="axispro001" c="LIT_EDIT_GARANTIAS1" lit="100002"/> <axis:alt f="axispro001" c="LIT_EDIT_GARANTIAS2" lit="1000183"/>" src="images/new.gif"/></a>
                                        </div>
                                    </axis:visible>
                                    <div style="clear:both;">
                                        <hr class="titulo">
                                    </div>
                                </td>
                            </tr>

                            <tr id="garantias_children" style="display:none">
                                <td align="left" >
                                    <c:import url="axispro001_garantias.jsp"/>
                                </td>
                            </tr>
                         <!-- Beneficiarios -->
                            <tr>
                                <td class="campocaja" >
                                          
                                    <div style="float:left;">
                                        <img id="beneficiarios_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('beneficiarios', this)" style="cursor:pointer"/> 
                                        <span id="beneficiarios_resumen"> <b><axis:alt f="axispro001" c="LIT_EDIT_BENEFICIARIOS_RESUM" lit="1000079"/></b> &nbsp; ${beneficiarios_Resumen}</span>
                                    </div>
                                    <axis:visible f="axispro001" c="EDIT_beneficiarios">
                                        <div style="float:right;">
                                            <a href="javascript:f_abrir_modal('axispro039',null,'&SPRODUC='+document.miForm.SPRODUC.value)"><img border="0" alt="<axis:alt f="axispro001" c="LIT_EDIT_BENE1" lit="100002"/> <axis:alt f="axispro001" c="LIT_EDIT_BENE2" lit="1000079"/>" title="<axis:alt f="axispro001" c="LIT_EDIT_BENE1" lit="100002"/> <axis:alt f="axispro001" c="LIT_EDIT_BENE2" lit="1000079"/>" src="images/lapiz.gif"/></a>
                                        </div>
                                    </axis:visible>
                                    <div style="clear:both;">
                                        <hr class="titulo">
                                    </div>
                                </td>
                            </tr>
                            <tr id="beneficiarios_children" style="display:none">
                                <td align="left" >
                                    <c:import url="axispro001_beneficiarios.jsp"/>
                                </td>
                            </tr>
                        <!-- Plan de pensiones -->
                            <axis:visible f="axispro001" c="PROPLAPEN">
                            <tr>
                                <td class="campocaja" >
                                          
                                    <div style="float:left;">
                                        <img id="proplapen_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('proplapen', this)" style="cursor:pointer"/> 
                                        <span id="proplapen_resumen"> <b><axis:alt f="axispro001" c="LIT_EDIT_PROPLAPEN" lit="9900880"/></b></span>
                                    </div>
                                    <axis:visible f="axispro001" c="EDIT_proplapen">
                                        <div style="float:right;">
                                            <a href="javascript:f_abrir_modal('axispro047',null,'&SPRODUC='+document.miForm.SPRODUC.value+'&CCODPLA='+'${mntproducto.PLANPENSIONES[0].OB_IAX_PLANPENSIONES.CCODPLA}')"><img border="0" alt="<axis:alt f="axispro001" c="LIT_EDIT_PROPLAPEN" lit="100002"/> <axis:alt f="axispro001" c="LIT_EDIT_PROPLAPEN2" lit="100002"/>" title="<axis:alt f="axispro001" c="LIT_EDIT_PROPLAPEN1" lit="100002"/> <axis:alt f="axispro001" c="LIT_EDIT_BENE2" lit="1000079"/>" src="images/lapiz.gif"/></a>
                                        </div>
                                    </axis:visible>
                                    <div style="clear:both;">
                                        <hr class="titulo">
                                    </div>
                                </td>
                            </tr>
                            <tr id="proplapen_children" style="display:none">
                                <td align="left" >
                                    <c:import url="axispro001_planpension.jsp"/>
                                </td>
                            </tr> 
                            </axis:visible>
                            <!-- Parámetros -->
                            <tr>
                                <td class="campocaja" >
                                          
                                    <div style="float:left;">
                                        <img id="parametros_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('parametros', this)" style="cursor:pointer"/> 
                                        <span id="parametros_resumen"><b><axis:alt f="axispro001" c="LIT_EDIT_PARAM" lit="103694"/></b></span>
                                    </div>
                                    <axis:visible f="axispro001" c="EDIT_parametros">
                                        <div style="float:right;">
                                            <a href="javascript:f_but_parametros()"><img border="0" alt="<axis:alt f="axispro001" c="PARAM" lit="100002"/> <axis:alt f="axispro001" c="LIT_PARAM1" lit="103694"/>" title="<axis:alt f="axispro001" c="LIT_PARAM1" lit="100002"/> <axis:alt f="axispro001" c="LIT_EDIT_BENE2" lit="103694"/>" src="images/lapiz.gif"/></a>
                                        </div>
                                    </axis:visible>
                                    <div style="clear:both;">
                                        <hr class="titulo">
                                    </div>
                                </td>
                            </tr>
                            <tr id="parametros_children" style="display:none">
                                <td align="left" >
                                    <c:import url="axispro001_parametros.jsp"/>
                                </td>
                            </tr>    
                            
                            
                            
                             <%--sql:query var="lista">
                            select sproduc,ff_Desvalorfijo (317,1,ctipo) ttipo, d.tdescrip, ppc.cduplica,d.cinforme
                            from prod_plant_cab ppc, detplantillas d
                            where <c:if test="${! empty mntproducto.SPRODUC}"> sproduc='${mntproducto.SPRODUC}'</c:if>
                            and ppc.ccodplan = d.ccodplan
                            and d.cidioma = 2
                            </sql:query> 
                            <c:if test="${!empty lista.rows}"%--%>
                            <tr>
                                <td class="campocaja" >
                                          
                                    <div style="float:left;">
                                        <img id="documentacion_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('documentacion', this)" style="cursor:pointer"/> 
                                        <span id="documentacion_resumen"><b><axis:alt f="axispro001" c="LST_DOCUMENTACION" lit="1000431"/></b></span>
                                    </div>
                                   <%-- <axis:ocultar f="axispro001" c="EDIT_documentacion">%--%>
                                    <axis:visible f="axispro001" c="LST_DOCUMENTACION">
                                        <div style="float:right;">
                                            <a href="#"><img id = "LST_DOCUMENTACION" border="0" alt="<axis:alt f="axispro001" c="LST_DOCUMENTACION" lit="1000431"/>" title="<axis:alt f="axispro001" c="LST_DOCUMENTACION" lit="1000431"/>" src="images/lapiz.gif"/></a>
                                        </div>
                                    </axis:visible>
                                     <%--</axis:ocultar>%--%>
                                    <div style="clear:both;">
                                        <hr class="titulo">
                                    </div>
                                </td>
                            </tr>
                            <tr id="documentacion_children" style="display:none">
                                <td align="left" >
                                    <table cellpadding="0" cellspacing="5" class="seccion" style="padding:1% 1% 1% 1%">                                            
                                        <tr>
                                          <td>
                                            <c:set var="title9">
                                             <axis:alt f="axispro001" c="TTIPO" lit="9902391"/>
                                            </c:set>
                                            <c:set var="title0">
                                              <axis:alt f="axispro001" c="TDESCRIP" lit="100588"/>
                                            </c:set>
                                            <c:set var="title1">
                                              <axis:alt f="axispro001" c="CINFORME" lit="105940"/>
                                            </c:set>
                                            <c:set var="title2">
                                              <axis:alt f="axispro001" c="selectedGarantia" lit="9902392"/>
                                            </c:set>
                                            <div class="displayspace">
                                    
                                           <display:table name="${lstdoc}" id="miListaIdA" export="false" class="dsptgtable" pagesize="6" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                             requestURI="axis_axispro001.do?paginar=true&operation=documentos">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title9}" sortable="true" sortProperty="TTIPO" headerClass="sortable" media="html" autolink="false">
                                                  <div class="dspText">
                                                    ${miListaIdA.TTIPO}
                                                  </div>
                                                </display:column>
                                                <display:column title="${title0}" sortable="true"  sortProperty="TDESCRIP"  headerClass="sortable" media="html" autolink="false">
                                                  <div class="dspText">
                                                    ${miListaIdA.TDESCRIP}
                                                  </div>
                                                </display:column>
                                                <display:column title="${title1}" sortable="true"  sortProperty="CINFORME"  headerClass="sortable" media="html" autolink="false">
                                                  <div class="dspText">
                                                    ${miListaIdA.CINFORME}
                                                  </div>
                                                </display:column>
                                                 <display:column title="${title2}" sortable="true"  sortProperty="CDUPLICA"  headerClass="sortable" media="html" autolink="false">
                                                  <div class="dspIcons">
                                                  <input type="checkbox" id="selectedGarantia" disabled name="selectedGarantia" value="${miListaIdA.CDUPLICA}" 
                                                    <c:if test="${miListaIdA.CDUPLICA == 1}">checked</c:if> /></div> 
                                                  
                                                </display:column>
          </display:table>
        </div>
      </td>
    </tr>
    <%--/c:if--%>
  </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            </c:if>
        </td>
    </tr>
</table>

<c:import url="../include/botonera_nt.jsp">
    <c:param name="f">axispro001</c:param>
    <c:param name="__botones"><axis:ocultar f="axispro001" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar><axis:ocultar f="axispro001" c = "BT_NUEVOPRODUCTO" dejarHueco="false">,9901368</axis:ocultar><axis:ocultar f="axispro001" c = "BT_DUPLICAR" dejarHueco="false">,103669</axis:ocultar><axis:ocultar f="axispro001" c = "BT_IMPRIMIR" dejarHueco="false">,imprimir</axis:ocultar></c:param> <%-- 103669: Duplicar / 9901368: Nou producte--%>
</c:import>

<form name="miForm" action="axis_axispro001.do">
    <input type="hidden" name="operation" value=""/>
    <input type="hidden" name="SPRODUC" id="SPRODUC" value="${mntproducto.SPRODUC}"/>
    <input type="hidden" name="CRAMO" id="CRAMO" value="${mntproducto.CRAMO}"/>
    <input type="hidden" name="CMODALI" id="CMODALI" value="${mntproducto.CMODALI}"/>
    <input type="hidden" name="CTIPSEG" id="CTIPSEG" value="${mntproducto.CTIPSEG}"/>
    <input type="hidden" name="CCOLECT" id="CCOLECT" value="${mntproducto.CCOLECT}"/>
    <input type="hidden" name="CACTIVI" id="CACTIVI" value="${sessionScope.ACTIVIDAD}"/>
    <input type="hidden" name="TACTIVI" id="TACTIVI" value="${sessionScope.TACTIVIDAD}"/>
    <input type="hidden" name="CCODIGO" id ="CCODIGO" value=""/>
    <input type="hidden" name="CVALAXIS" id ="CVALAXIS" value=""/>
    <input type="hidden" name="CVALEMP" id ="CVALEMP" value=""/>
    <input type="hidden" name="CVALAXISDEF" id ="CVALAXISDEF" value=""/>
    <input type="hidden" name="CVALDEF" id ="CVALDEF" value=""/>
    <input type="hidden" name="subpantalla" id="subpantalla" value=""/>
</form>

<c:import url="../include/mensajes.jsp"/>
</body>
</html>