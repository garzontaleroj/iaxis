<%/**
*  Fichero: axispen001.jsp
* 
*  Busqueda de Depositarias
*	
*
*
*  Fecha: 15/12/2009
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><fmt:message key="151501"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        <script language="Javascript" type="text/javascript">
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            function f_onload(){
                revisarEstilos();
                //Si la selecció es buida, obrim cercador automàticament
                var hayErrores    = ${!empty requestScope.__mensajes.m__clave};
                if (${empty sessionScope.AXIS_DEPOSITARIAS} && !hayErrores)
                    f_but_buscar_pensions_depositaries();
            }
            
            function f_cerrar_modal(cual) {
                objUtiles.cerrarModal(cual);
            }
        
            function f_but_buscar_pensions_depositaries() {
                f_abrir_modal("axispen006");
            }

            function f_nueva_Depositaria(){
                f_abrir_modal("axispen011",null,"&parametro=alta");
            }

            function f_modificar_dipositaria(codigo) {
            
                f_abrir_modal("axispen011",null,"&parametro=mod&codigo="+codigo);
                
            }
           
            function f_nueva_gestora(){
                f_abrir_modal("axispen012",null,"&parametro=alta");            
            }
           
           
            function f_modificar_gestora(codigo) {
            
                f_abrir_modal("axispen012",null,"&parametro=mod&codigo="+codigo);
                
            }


            function f_nuevo_fondo(){
                f_abrir_modal("axispen013",null,"&parametro=alta");            
            }
            
            function f_modificar_fondo(codigo) {
            
                f_abrir_modal("axispen013",null,"&parametro=mod&codigo="+codigo);
                
            }
            
            function f_abrir_modal(cual, noXButton, optionalQueryString) {         
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";                    
                if (noXButton) 
                    objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");             
                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);   
              }     
            function f_but_anterior() {}
              
        
            function f_buscar_pensions_depositaries(){            
                  objUtiles.ejecutarFormulario("axis_axispen001.do", "busqueda_depositarias", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
                
            function f_seleccionar_depositaria(CCODDEP,contador){
               //Marcar el registro de la pensión depositaria selecccionada                              
                objDom.setValorPorId("CCODDEP", CCODDEP);
                objDom.setValorPorId("NCONTADOR", contador);
                objUtiles.ejecutarFormulario("axis_axispen001.do", "busqueda_cuerpo", document.miForm, "_self", objJsMessages.jslit_cargando);         
              }
           function f_seleccionar_depositaria2(CCODDEP){
           //Marcar el registro de la pensión depositaria selecccionada
          
              var valor_establecido = CCODDEP;
              
              objLista.borrarFilasDeLista ("miListaId", "7", "<fmt:message key='1000254' />");
              objDom.setVisibilidadPorId("tablaGestoras", "hidden");          
              
              objLista.borrarFilasDeLista ("miListaId1", "7", "<fmt:message key='1000254' />");
              objDom.setVisibilidadPorId("tablaFondos", "hidden");
              
              
              var checkBoxRadioDepositaria = document.getElementsByName("radioDepositaria");
              for (var i=0; i < checkBoxRadioDepositaria.length; i++) {
                 if(checkBoxRadioDepositaria[i].value == valor_establecido){
                    checkBoxRadioDepositaria[i].checked = true;
                 }
              }
              objDom.setValorPorId("CCODDEP2", CCODDEP);
    //          objDom.setValorPorId("SSPERSON", SSPERSON);          
    
                if (objUtiles.estaVacio(CCODDEP)){
                    alert (objJsMessages.jslit_error_de_seleccion);
                }else{
                  
                    var qs="operation=ajax_busqueda_cargarcuerpo";
                        qs=qs+"&CCODDEP="+CCODDEP;
                    objAjax.invokeAsyncCGI("axis_axispen001.do", callbackajaxCuerpo, qs, this);
                }   
            }

          function callbackajaxCuerpo(ajaxResponseText){
          
            try{ 
                //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
        
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var tbody = objLista.obtenerBodyLista("miListaId");
                    var tr = objLista.obtenerFilasBodyLista("miListaId", tbody);                  
                    
                    objLista.borrarFilasDeLista ("miListaId", "7", "<fmt:message key='1000254' />");
                    
                    if (objDom.existeTag(doc, "CCODDEP"))
                        // Si hay registros, eliminamos el tr "No se han encontrado datos"
                        
                        objLista.borrarFilaVacia(tbody, tr);
                        
                    
                    // Bucle para insertar cada una de las filas
                    if (objDom.numeroDeTags(doc, "CCODDEP") > 0){
                    objDom.setVisibilidadPorId("tablaGestoras", "visible");                    
                    for (var i = 0; i < objDom.numeroDeTags(doc, "CCODDEP") ; i++) {
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        // Creamos un array de columnas a añadir a la nueva fila del displayTag
                        var newtd = new Array(7);
                       
                        var CCODGES   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CCODGES")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCODGES"), i, 0) : "";
                        var NNUMIDE = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NNUMIDE")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), i, 0) : ""; 
                        var TNOMBRE   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), i, 0) : "";
                        
                        var FALTA   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("FALTA")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("FALTA"), i, 0) : "";
                        var FBAJA   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("FBAJA")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("FBAJA"), i, 0) : "";
                        
                        newtd[0] = objLista.addRadioButtonEnLista("radioGestoras", CCODGES,"javascript:f_recargar_fondos('" + CCODGES + "')"); 
                        newtd[1] = objLista.addNumeroEnLista(CCODGES);
                        newtd[2] = objLista.addNumeroEnLista(TNOMBRE);  
                        newtd[3] = objLista.addTextoEnLista(FALTA);                            
                        newtd[4] = objLista.addTextoEnLista(FBAJA);
                                                                  
                        // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                        objLista.addNuevaFila(newtd, newtr, tbody);        
                    }
                    if (objDom.numeroDeTags(doc, "CCODDEP") == 1 ) {
                       var checkBoxRadioGestora = document.getElementsByName("radioGestoras");
                       checkBoxRadioGestora[0].checked = true;
                       var nCCODGES   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CCODGES")[0]) ? 
                       objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCODGES"), 0, 0) : "";
                       f_recargar_fondos(nCCODGES);
                    }
                    }else
                    {
                    objDom.setVisibilidadPorId("tablaGestoras", "hidden");
                    }                    
                } // Fi if 
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }        
        
        
  
            
            function f_recargar_fondos(CCODGES,contador){
                objDom.setValorPorId("CCODGES", CCODGES);
                objDom.setValorPorId("NCONTADORX", contador);
                objUtiles.ejecutarFormulario("axis_axispen001.do", "busqueda_cuerpo_fondos", document.miForm, "_self", objJsMessages.jslit_cargando);                 
            }    
        
            function f_recargar_plan(CCODFON,contador){
                objDom.setValorPorId("CCODFON", CCODFON);
                objDom.setValorPorId("NCONTADORY", contador);
                objUtiles.ejecutarFormulario("axis_axispen001.do", "busqueda_cuerpo_planes", document.miForm, "_self", objJsMessages.jslit_cargando);                 
            }            
        
       
    
        
            
         function f_recargar_fondos2(CCODGES){
              var valor_establecido = CCODGES;                   
              var checkBoxRadioGestora = document.getElementsByName("radioGestora");
              for (var i=0; i < checkBoxRadioGestora.length; i++) {
                if(checkBoxRadioGestora[i].value == valor_establecido){
                    checkBoxRadioGestora[i].checked = true;
                }
                }
                objDom.setValorPorId("CCODGES", CCODGES);
                if (objUtiles.estaVacio(CCODGES)){
                    alert (objJsMessages.jslit_error_de_seleccion);
                }else{
                  
                    var qs="operation=ajax_busqueda_fondos";
                        qs=qs+"&CCODGES="+CCODGES;
                    objAjax.invokeAsyncCGI("axis_axispen001.do", callbackajaxFondos, qs, this);
                }   
        }   
            

        function callbackajaxFondos(ajaxResponseText){
            try{ 
                //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var tbody = objLista.obtenerBodyLista("miListaId1");
                    var tr = objLista.obtenerFilasBodyLista("miListaId1", tbody);                  
                    
                    objLista.borrarFilasDeLista ("miListaId1", "7", "<fmt:message key='1000254' />");
                    
                    if (objDom.existeTag(doc, "CCODGES"))
                        // Si hay registros, eliminamos el tr "No se han encontrado datos"
                        objLista.borrarFilaVacia(tbody, tr);
                    
                    // Bucle para insertar cada una de las filas
                    if (objDom.numeroDeTags(doc, "CCODGES") > 0){
                    objDom.setVisibilidadPorId("tablaFondos", "visible");
                    for (var i = 0; i < objDom.numeroDeTags(doc, "CCODGES") ; i++) {
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        // Creamos un array de columnas a añadir a la nueva fila del displayTag
                        var newtd = new Array(4);
                       
                        var CCODFON   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CCODFON")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCODFON"), i, 0) : "";
                        var TNOMBRE   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), i, 0) : "";
                        
                        var FALTARE   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("FALTARE")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("FALTARE"), i, 0) : "";
                        var FBAJARE   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("FBAJARE")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("FBAJARE"), i, 0) : "";
                        
                        newtd[0] = objLista.addNumeroEnLista(CCODFON);
                        newtd[1] = objLista.addNumeroEnLista(TNOMBRE);  
                        newtd[2] = objLista.addTextoEnLista(FALTARE);                            
                        newtd[3] = objLista.addTextoEnLista(FBAJARE);
                                                                  
                        // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                        objLista.addNuevaFila(newtd, newtr, tbody);        
                    }
                    }else
                    {
                    objDom.setVisibilidadPorId("tablaFondos", "hidden");
                    }

                } // Fi if 
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }      
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
            }
            
            function f_aceptar_axispen06(CCODDEP,TNOMDEP) {
                objUtiles.cerrarModal("axispen006");            
                objDom.setValorPorId("CCODDEP", CCODDEP);                  
                objDom.setValorPorId("TNOMDEP", TNOMDEP);                
                f_buscar_pensions_depositaries();            
            }
            
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation"/>
        
        <input type="hidden" name="NCONTADOR" id="NCONTADOR" value="${__formdata.NCONTADOR}"/>        
        <input type="hidden" name="NCONTADORY" id="NCONTADORY" value="${__formdata.NCONTADORY}"/>
        <input type="hidden" name="NCONTADORX" id="NCONTADORX" value="${__formdata.NCONTADORX}"/>        
       
        <input type="hidden" name="CCODDEP" id="CCODDEP" value="${__formdata.CCODDEP}"/> 
        <input type="hidden" name="CCODFON" value="${__formdata.CCODFON}"/> 
        <input type="hidden" name="CCODGES" value="${__formdata.CCODGES}"/>         
       
        <input type="hidden" name="TNOMDEP" id="TNOMDEP" value="${__formdata.TNOMDEP}"/> 
        
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"><fmt:message key="151501" /></c:param>
                <c:param name="formulario"><fmt:message key="151501" /></c:param>
                <c:param name="form">axispen001</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axispen006|<fmt:message key="9900863"/><%-- Buscador de dipositaries --%>
                </c:param>
        </c:import>
        
           <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axispen011|<fmt:message key=""/><%-- alta/mod dispositarias --%>
                </c:param>
            </c:import>            

           <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axispen012|<fmt:message key=""/><%-- alta/mod Gestoras --%>
                </c:param>
            </c:import> 

           <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axispen013|<fmt:message key=""/><%-- alta/mod Fondos --%>
                </c:param>
            </c:import> 

    <!-- Area de campos  -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <!--campos-->
             <table class="seccion">   
                <tr>
                    <td>
                        <!-- Lista de Depositarias -->
                       <div class="separador">&nbsp;</div>
                         <div class="separador">&nbsp;</div>
                            <div class="titulo">
                                <img src="images/flecha.gif"/><fmt:message key="9900814"/> <img border="0" src="images/find.gif" onclick="f_but_buscar_pensions_depositaries()" style="cursor:pointer" alt="<fmt:message key="9000508"/>" title="<fmt:message key="9000508"/>"/>
                            </div>
                            <table class="area" align="left">                                    
                                <tr>
                                  <td>
                                    <c:set var="title0">&nbsp;</c:set>
                                    <c:set var="title1">
                                        <fmt:message key="1000109"/> <!--CODI DEPOSITARIA-->
                                    </c:set>
                                    <c:set var="title2">
                                        <fmt:message key="105904"/> <!--NIF-->
                                    </c:set>
                                    <c:set var="title3">
                                        <fmt:message key="9000759"/> <!--Nombre y Apellidos-->
                                    </c:set>
                                    <c:set var="title4">
                                        <fmt:message key="9001192"/> <!--Fecha Alta-->
                                    </c:set>
                                    <c:set var="title5">
                                        <fmt:message key="9001510"/> <!--Fecha Baja-->
                                    </c:set>          
                                    <!--Imatge nou registre-->
                                     <div style="float:right;">
                                        <a href="javascript:f_nueva_Depositaria()"><img border="0" alt="<fmt:message key="104825"/>" title="<fmt:message key="104825"/>" src="images/new.gif"/></a>
                                    </div>                                    
                                    <!--Fi imatge nou registre-->                                    
                                    <div id="dt_depositarias" class="seccion displayspace">
                                    <%int contador = 0;%>
                                        <display:table name="${sessionScope.AXIS_DEPOSITARIAS}"
                                                       id="miListaDepositarias"
                                                       export="false"
                                                       class="dsptgtable"
                                                       pagesize="-1"
                                                       defaultsort="2"
                                                       defaultorder="ascending"
                                                       requestURI="axis_axispen001.do?paginar=true"
                                                       sort="list"
                                                       cellpadding="0"
                                                       cellspacing="0">
                                            <%@ include file="../include/displaytag.jsp"%>
                                             <c:set var="contador"><%=contador%></c:set>  
                                            <display:column headerClass="sortable fixed headwidth5"
                                                            title=""
                                                            media="html"
                                                            autolink="false"
                                                            style="width:5%">
                                                <div class="dspIcons">
                                                    <input value="${miListaDepositarias['CCODDEP']}"
                                                           type="radio"
                                                           onclick="f_seleccionar_depositaria('${miListaDepositarias.OB_IAX_PDEPOSITARIAS['CCODDEP']}','${contador}');"
                                                           <c:if test="${__formdata.NCONTADOR == contador}"> checked </c:if>
                                                           id="radioDepositaria"
                                                           name="radioDepositaria"/>
                                                </div>
                                            </display:column>
                                            <display:column title="${title1}"
                                                            sortable="true"
                                                            sortProperty="CCODDEP"
                                                            headerClass="sortable fixed"
                                                            media="html"
                                                            autolink="false"
                                                            style="width:5%">                                                            
                                                <div class="dspNumber">
                                                        ${miListaDepositarias.OB_IAX_PDEPOSITARIAS['CCODDEP']}
                                                    </a>
                                                </div>
                                            </display:column>
                                            <display:column title="${title2}"
                                                            sortable="true"
                                                            sortProperty="NNUMIDE"
                                                            headerClass="sortable fixed"
                                                            media="html"
                                                            autolink="false"
                                                            style="width:10%">
                                                <div class="dspText">
                                                        ${miListaDepositarias.OB_IAX_PDEPOSITARIAS.PERSONA['NNUMIDE']}
                                                    </a>
                                                </div>
                                            </display:column>
                                            <display:column title="${title3}"
                                                            sortable="true"
                                                            sortProperty="TNOMBRE"
                                                            headerClass="sortable fixed"
                                                            media="html"
                                                            autolink="false"
                                                            style="width:30%">
                                                <div class="dspText">
                                                        ${miListaDepositarias.OB_IAX_PDEPOSITARIAS.PERSONA['TNOMBRE']}
                                                        ${miListaDepositarias.OB_IAX_PDEPOSITARIAS.PERSONA['TAPELLI1']}&nbsp;
                                                        ${miListaDepositarias.OB_IAX_PDEPOSITARIAS.PERSONA['TAPELLI2']}
                                                </div>
                                            </display:column>
                                            <display:column title="${title4}"
                                                            sortable="true"
                                                            sortProperty="FALTA"
                                                            headerClass="sortable fixed"
                                                            media="html"
                                                            autolink="false"
                                                            style="width:15%">
                                            <div class="dspText"><fmt:formatDate value="${miListaDepositarias.OB_IAX_PDEPOSITARIAS['FALTA']}" pattern="dd/MM/yy" />
                                                   <a onclick="f_seleccionar_depositaria.OB_IAX_PDEPOSITARIAS('${miListaDepositarias['CCODDEP']}','${contador}');"></a>                                                        
                                            </div>                                                 
                                            </display:column>                                            
                                            <display:column title="${title5}"
                                                            sortable="true"
                                                            sortProperty="FBAJA"
                                                            headerClass="sortable fixed"
                                                            media="html"
                                                            autolink="false"
                                                            style="width:15%">
                                            <div class="dspText"><fmt:formatDate value="${miListaDepositarias.OB_IAX_PDEPOSITARIAS['FBAJA']}" pattern="dd/MM/yy" />
                                                   <a onclick="f_seleccionar_depositaria.OB_IAX_PDEPOSITARIAS('${miListaDepositarias['CCODDEP']}','${contador}');"></a>                                                        
                                            </div>                                                      
                                                
                                            </display:column>      
                                            
                                             <display:column title="" sortable="false" sortProperty=""  style="width:10%" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                               <div class="dspIcons"><a href="javascript:f_modificar_dipositaria('${miListaDepositarias.OB_IAX_PDEPOSITARIAS['CCODDEP']}');"><img border="0" alt="<fmt:message key='9900815'/>" title="<fmt:message key='9900815'/>" src="images/lapiz.gif"/></a></div>
                                            </display:column>                                    
                                            <display:column title="" sortable="false" sortProperty=""  style="width:10%" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                               <div class="dspIcons"><a href="javascript:f_borrar_pensio_dipositaria('${miListaDepositarias['CCODDEP']}',this)"><img border="0" alt="<fmt:message key='9900817'/>" title="<fmt:message key='9900817'/>" src="images/delete.gif"/></a></div>
                                            </display:column>                                            
                                            <%contador++;%>
                                        </display:table>
                                        <c:choose>
                                            <c:when test="${!empty  sessionScope.AXIS_DEPOSITARIAS}">
                                                <script language="javascript">//objUtiles.retocarDsptagtable("miListaId");</script>
                                            </c:when>
                                            <c:otherwise>                                                
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </td>
                            </tr>
                        </table>                                                        
                                    <!--Segona part Fondos Pensiones -->       
                            
                                     <table class="area" align="center" id="tablaFondos">
                                     <!--espais-->
                  
                                      <!--fi espais-->                        
                                        <tr>
                                            <td>
                                            <div class="titulo">
                                                <img src="images/flecha.gif"/><fmt:message key="9900819"/> <!-- Fondos pensiones -->
                                            </div>
                                                <c:set var="title0">&nbsp;</c:set>
                                                <c:set var="title1">
                                                    <fmt:message key="1000109"/><!-- Código fondo -->
                                                </c:set>
                                                <c:set var="title2">
                                                    <fmt:message key="105940"/><!-- Nombre -->
                                                </c:set>
                                                <c:set var="title3">
                                                    <fmt:message key="9001192"/><!-- Fecha alta -->
                                                </c:set>
                                                <c:set var="title4">
                                                    <fmt:message key="9001510"/><!-- Fecha baja -->
                                                </c:set>
                                                
                                                <!--afegir registre-->
                                                 <div style="float:right;">
                                                    <a href="javascript:f_nuevo_fondo()"><img border="0" alt="<fmt:message key="104825"/>" title="<fmt:message key="104825"/>" src="images/new.gif"/></a>
                                                </div>
                                                <!--fi afegir registre style="width:100%;height:100%" -->
                                                
                                                <%int contadory=0;%>
                                                <div class="displayspace">
                                                    <display:table name="${listaFondos}"
                                                                   id="miListaId1"
                                                                   export="false"
                                                                   class="dsptgtable"
                                                                   pagesize="-1"
                                                                   defaultsort="2"
                                                                   defaultorder="ascending"
                                                                   requestURI="axis_axispen001.do?paginar=true"
                                                                   sort="list"
                                                                   cellpadding="0"
                                                                   cellspacing="0">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                         <c:set var="contadory"><%=contadory%></c:set>  
                                                      <display:column headerClass="sortable fixed"
                                                                        title=""
                                                                        media="html"
                                                                        autolink="false"
                                                                        style="width:5%">
                                                            <div class="dspIcons">
                                                                <input value="${miListaId.OB_IAX_FONPENSIONES['CCODGES']}"
                                                                       type="radio"
                                                                       onclick="f_recargar_plan('${miListaId1['CCODFON']}','${contadory}');"
                                                                       <c:if test="${__formdata.NCONTADORY == contadory}"> checked </c:if>
                                                                       id="radioGestora1"
                                                                       name="radioGestora1"/>
                                                            </div>
                                                        </display:column> 
                                                        
                                                        <display:column title="${title1}"
                                                                        sortable="true"
                                                                        sortProperty="CCODGES"
                                                                        headerClass="sortable fixed"
                                                                        media="html"
                                                                        autolink="false"
                                                                        style="width:5%">
                                                           <div class="dspText">
                                                                    ${miListaId1.OB_IAX_FONPENSIONES['CODDGS']}
                                                            </div>   
                                                    
                                                        </display:column>
                                                        <display:column title="${title2}"
                                                                        sortable="true"
                                                                        sortProperty="TNOMBRE"
                                                                        headerClass="sortable fixed"
                                                                        media="html"
                                                                        autolink="false"
                                                                        style="width:40%">
                                                           <div class="dspText">
                                                                    ${miListaId1.OB_IAX_FONPENSIONES.PERSONA['TNOMBRE']}
                                                                    ${miListaId1.OB_IAX_FONPENSIONES.PERSONA['TAPELLI1']}&nbsp;
                                                                    ${miListaId1.OB_IAX_FONPENSIONES.PERSONA['TAPELLI2']}
                                                            </div>                                               
                                                        </display:column>
                                                        <display:column title="${title3}"
                                                                        sortable="true"
                                                                        sortProperty="FALTA"
                                                                        headerClass="sortable fixed"
                                                                        media="html"
                                                                        autolink="false"
                                                                        style="width:15%">
                                                        <div class="dspText"><fmt:formatDate value="${miListaId1.OB_IAX_FONPENSIONES['FALTARE']}" pattern="dd/MM/yy" /></div>
                                                        </display:column>
                                                        <display:column title="${title4}"
                                                                        sortable="true"
                                                                        sortProperty="FBAJA"
                                                                        headerClass="sortable fixed"
                                                                        media="html"
                                                                        autolink="false"
                                                                        style="width:15%">
                                                        <div class="dspText"><fmt:formatDate value="${miListaId1.OB_IAX_FONPENSIONES['FBAJARE']}" pattern="dd/MM/yy" /></div>
                                                        </display:column>
                                                        
                                                          <display:column title="" sortable="false" sortProperty=""  style="width:10%" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                           <div class="dspIcons"><a href="javascript:f_modificar_fondo('${miListaId1.OB_IAX_FONPENSIONES['CCODFON']}');"><img border="0" alt="<fmt:message key='9900815'/>" title="<fmt:message key='9900815'/>" src="images/lapiz.gif"/></a></div>
                                                        </display:column>                                    
                                                        <display:column title="" sortable="false" sortProperty=""  style="width:10%" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                           <div class="dspIcons"><a href="javascript:f_borrar_pensio_dipositaria('${miListaDepositarias['CCODDEP']}',this)"><img border="0" alt="<fmt:message key='9900817'/>" title="<fmt:message key='9900817'/>" src="images/delete.gif"/></a></div>
                                                        </display:column>
                                                        <%contadory++;%>                                                 
                                    <!--Segona part Fondos Pensiones -->                                                           
                                                    </display:table>                                        
                                                    <c:choose>
                                                        <c:when test="${!empty listaFondos}">
                                                            <script language="javascript">//objUtiles.retocarDsptagtable("miListaId");</script>
                                                        </c:when>
                                                    </c:choose>
                                                </div>
                                </td>
                            </tr>
                        </table>                                                  
                                                <!-- Planes pensiones -->
                                                <table class="area" align="right">

                                                    <tr>
                                                       <td> 
                                                        <div class="separador">&nbsp;</div>
                                                        <div class="titulo">
                                                            <img src="images/flecha.gif"/> <fmt:message key="9900820"/> <!-- Planes pensiones -->
                                                        </div>      
                                                        <c:set var="title0">&nbsp;</c:set>
                                                        <c:set var="title1">
                                                            <fmt:message key="1000109"/><!-- Código plan pensión -->
                                                        </c:set>
                                                        <c:set var="title2">
                                                            <fmt:message key="105940"/><!-- Nombre -->
                                                        </c:set>
                                                        <c:set var="title3">
                                                            <fmt:message key="100943"/><!-- Modalidad -->
                                                        </c:set>
                                                        <c:set var="title4">
                                                            <fmt:message key="9900821"/><!-- Sistema -->
                                                        </c:set>                                    
                                                        <c:set var="title5">
                                                            <fmt:message key="9001192"/><!-- Fecha alta -->
                                                        </c:set>
                                                        <c:set var="title6">
                                                            <fmt:message key="9900822"/><!-- Comercial -->
                                                        </c:set>    
                                                        
                                                         <!--afegir registre-->
                                                         <div style="float:right;">
                                                            <a href="javascript:f_gestioagenda(null,'${LISTAAPUNTESAGENDA['NPOLIZA']}','0')"><img border="0" alt="<fmt:message key="104825"/>" title="<fmt:message key="104825"/>" src="images/new.gif"/></a>
                                                        </div>
                                                        <!--fi afegir registre-->
                                                                                        
                                                        <div class="seccion  displayspace">
                                                            <display:table name="${listaPlan}"
                                                                           id="miListaPlanes"
                                                                           export="false"
                                                                           class="dsptgtable"
                                                                           pagesize="-1"
                                                                           requestURI="axis_axispen004.do?paginar=true"
                                                                           sort="list"
                                                                           cellpadding="0"
                                                                           cellspacing="0">
                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                <display:column title="${title1}"
                                                                                sortable="true"
                                                                                sortProperty="CCODPLA"
                                                                                headerClass="sortable fixed"
                                                                                media="html"
                                                                                style="width:5%"
                                                                                autolink="false">
                                                                   <div class="dspText">
                                                                       ${miListaPlanes.OB_IAX_PLANPENSIONES['CCODGS']}
                                                                    </div>                                                            
                                                                </display:column>
                                                                <display:column title="${title2}"
                                                                                sortable="true"
                                                                                sortProperty="TNOMPLA"
                                                                                headerClass="sortable fixed"
                                                                                media="html"
                                                                                style="width:35%"
                                                                                autolink="false">
                                                                   <div class="dspText">
                                                                            ${miListaPlanes.OB_IAX_PLANPENSIONES['TNOMPLA']}
                                                                    </div>                                               
                                                                </display:column>
                                                                <display:column title="${title3}"
                                                                                sortable="true"
                                                                                sortProperty="TMODALI"
                                                                                headerClass="sortable fixed"
                                                                                media="html"
                                                                                style="width:15%"
                                                                                autolink="false">
                                                                   <div class="dspText">
                                                                            ${miListaPlanes.OB_IAX_PLANPENSIONES['TMODALI']}
                                                                    </div>                                               
                                                                </display:column>                                           
                    
                                                                <display:column title="${title4}"
                                                                                sortable="true"
                                                                                sortProperty="TSISTEM"
                                                                                headerClass="sortable fixed"
                                                                                media="html"
                                                                                style="width:10%"
                                                                                autolink="false">
                                                                   <div class="dspText">
                                                                            ${miListaPlanes.OB_IAX_PLANPENSIONES['TSISTEM']}
                                                                    </div>                                               
                                                                </display:column>                                           
                                                                <display:column title="${title5}"
                                                                                sortable="true"
                                                                                sortProperty="FALTARE"
                                                                                headerClass="sortable fixed"
                                                                                media="html"
                                                                                style="width:10%"
                                                                                autolink="false">
                                                                   <div class="dspText"><fmt:formatDate value="${miListaPlanes.OB_IAX_PLANPENSIONES['FALTARE']}" pattern="dd/MM/yy" />
                                                                    </div>             
                                                                </display:column>
                                                                
                                                                <display:column title="${title6}"
                                                                                sortable="true"
                                                                                sortProperty="TCOMERC"
                                                                                headerClass="sortable fixed"
                                                                                media="html"
                                                                                style="width:10%"
                                                                                autolink="false">
                                                                   <div class="dspText">
                                                                            ${miListaPlanes.OB_IAX_PLANPENSIONES['TCOMERC']}
                                                                   </div>                                               
                                                                </display:column>             
                                                                
                                                                  <display:column title="" sortable="false" sortProperty=""  style="width:7.5%" headerClass="headwidth5 sortable" media="html" autolink="false">
                                                                   <div class="dspIcons"><a href="javascript:f_modificar_pensio_dipositaria('${miListaPlanes['CCODPLA']}');"><img border="0" alt="<fmt:message key='9900815'/>" title="<fmt:message key='9900815'/>" src="images/lapiz.gif"/></a></div>
                                                                </display:column>                                    
                                                                <display:column title="" sortable="false" sortProperty=""  style="width:7.5%" headerClass="headwidth5 sortable" media="html" autolink="false">
                                                                   <div class="dspIcons"><a href="javascript:f_borrar_pensio_dipositaria('${miListaPlanes['CCODPLA']}',this)"><img border="0" alt="<fmt:message key='9900817'/>" title="<fmt:message key='9900817'/>" src="images/delete.gif"/></a></div>
                                                                </display:column>                                                                             
                                                            </display:table>
                                                     </div>
                                                 </td>
                                             </tr>     
                                        </table>
         </td>
        </tr>
    </table>
             </td>
        </tr>
    </table>
    <c:import url="../include/botonera_nt.jsp">
        <c:param name="__botones">salir</c:param>
    </c:import>
</form>
<c:import url="../include/mensajes.jsp" />
</body>
</html>

