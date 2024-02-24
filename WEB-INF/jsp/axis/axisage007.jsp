<%/*
*  Fichero: axisage007.jsp
*
*  @author <a href="mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  Fecha: 29/12/2008
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
        
        function f_but_salir() {
           objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisage007", "cancelar", document.miForm, "_self");                   
        }

        function f_but_buscar() {
            f_abrir_modal('axisage006', true);
        }
        
        function f_onload() {
            
            revisarEstilos();            
            var hayErrores    = ${!empty requestScope.__mensajes.m__clave};
            
            if (objUtiles.estaVacio('${__formdata.AGENTE.CAGENTE}') && !hayErrores)
                f_but_buscar();
                
            f_cargar_propiedades_pantalla();    
        }
        
        function f_actualizar_redcomercial(CEMPRES) {
            objDom.setValorPorId("CEMPRES", CEMPRES);
            objAjax.invokeAsyncCGI("axis_axisage007.do", 
                callbackAjaxActualizarRedcomercial, "operation=actualizar_redcomercial&CEMPRES=" + CEMPRES + 
                "&CAGENTE=" + objDom.getValorPorId("CAGENTE"),  this);
        }

        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_cerrar_axisage006() {
            f_cerrar_modal("axisage006");
        }
        
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }

        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        

        function f_aceptar_axisage006(CAGENTE, TAGENTE) {
            objUtiles.cerrarModal("axisage006");
            objDom.setValorPorId("CAGENTE", CAGENTE);
            objUtiles.ejecutarFormulario("axis_axisage007.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);                        
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
                    
                    objLista.borrarFilasDeLista ("HISTORICO", "6", "<axis:alt f='axisage007' c='LIT_BORR' lit='1000254'/>");
                    
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
        
        /****************************************************************************************/
        /************************************* SALTOS DE FLUJO **********************************/
        /****************************************************************************************/
        
        function f_but_consulta_persona() {
            objUtiles.ejecutarFormulario("axis_axisage007.do", "consulta_persona", document.miForm, "_self", objJsMessages.jslit_cargando);                        
        }
        
        
        
        //18176 
           function f_agd_gestioagenda(IDAPUNTE,IDAGENDA,CMODO) {          
               param = "&IDAPUNTE="+IDAPUNTE+"&IDAGENDA="+IDAGENDA+"&CMODO="+CMODO;    
               objUtiles.abrirModal('axisagd004', "src", "modal_axisagd004.do?operation=init" + param); 
            }
            
           function f_agd_gestioagenda_alta(IDAPUNTE,IDAGENDA,CMODO) {          
               param = "&IDAPUNTE="+IDAPUNTE+"&IDAGENDA="+IDAGENDA+"&CMODO="+CMODO+"&NUEVO="+"1";   
               objUtiles.abrirModal('axisagd004', "src", "modal_axisagd004.do?operation=init" + param); 
            }
            
           function f_cerrar_modal_004(PANTALLA) {
              objUtiles.cerrarModal(PANTALLA);   
              objUtiles.ejecutarFormulario ("axis_axisage007.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);  
            }
            //18176
            
            function f_gestioagenda(IDOBS, modificacion){
                objUtiles.abrirModal("axisagd002", "src", "modal_axisagd002.do?operation=init&IDOBS="+IDOBS+"&CTIPAGD=3&MODIFICACION="+modificacion+"&CAGENTE="+document.miForm.CAGENTE.value);
            }
            function f_but_aceptar_axisagd002(){
                f_cerrar_modal('axisagd002');
                objUtiles.ejecutarFormulario ("axis_axisage007.do?subseccion=DSP_AGENDA", "form", document.miForm, "_self");
            }

						 function f_borrar_agenda(IDOBS){
            // Antes de proceder a borrar el registro, pedimos confirmacion
             var confirma=confirm(objJsMessages.jslit_confirma_borrar);
                if (confirma) {
                       objDom.setValorPorId("IDOBS", IDOBS);
                       objUtiles.ejecutarFormulario ("axis_axisage007.do?subseccion=DSP_AGENDA", "borrar_agenda", document.miForm, "_self", objJsMessages.jslit_cargando);     
      
                }
            
            
            }
            
            function f_abrir_axisage016(ctipo,ccomind) {
            f_abrir_modal('axisage016', true, 
                '&PARCAGENTE=' + objDom.getValorPorId("CAGENTE")+"&CTIPO="+ctipo+"&CCOMIND="+ccomind);
        }
    </script>
  </head>
  
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="axis_axisage007.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisage007" c="LIT_TITULO" lit="9000714"/></c:param>     <%--Consulta de agentes --%>
            <c:param name="formulario"><axis:alt f="axisage007" c="LIT_FORM" lit="9000714"/></c:param> <%--Consulta de agentes --%>
            <c:param name="form">axisage007</c:param>
        </c:import>
             
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisage006|<axis:alt f="axisage007" c="LIT_MOD_006" lit="9000713"/><%-- Búsqueda de Agentes --%></c:param>
        </c:import>
          <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisagd002|<axis:alt f="axisage007" c="TITULOAXISAGD002" lit="9001247"/></c:param>
        </c:import>
       <!-- 18176 -->
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisagd004|<axis:alt f="axisage007" c="MOD_PANT_AXISAGD004" lit="9001769"/></c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisage016|<axis:alt f="axisage007" c="TIT_AXISAGE016" lit="9902558"/></c:param>
        </c:import>
        
        <input type="hidden" name="operation" value=""/>        
        <input type="hidden" name="isEdit" id="isEdit" value="false"/>
        <input type="hidden" name="CEMPRES" id="CEMPRES" value="${__formdata.CEMPRES}"/>
        <%-- SPERSON necesario para saltar a AXISPER009 --%>
        <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.AGENTE.SPERSON}"/>
        <%-- CAGENTE_PERSONA necesario para saltar a AXISPER009 --%>
        <input type="hidden" name="CAGENTE_PERSONA" id="CAGENTE_PERSONA" value="${__formdata.AGENTE.CAGENTE_PERSONA}"/>        
        <input type="hidden" name="IDOBS" id="IDOBS" value="${__formdata.IDOBS}"/>
        <c:if test="${__formdata.isEdit != 'true'}">
            <input type="hidden" name="CACTIVO" id="CACTIVO" value="1"/>
        </c:if>        
        
        <c:set var="modoModificable" value="${false}"/>

        <table class="mainTableDimensions seccion base" align="center" cellpadding="0" cellspacing="3">            
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
                            <axis:ocultar f="axisage007" c="CTIPAGE" dejarHueco="false">
                                <td class="titulocaja" id="tit_CTIPAGE" >
                                    <b><axis:alt f="axisage007" c="CTIPAGE" lit="9000519"/></b>
                                </td>
                            </axis:ocultar>
                            <%-- Código agente --%>
                            <td class="titulocaja">
                                <b><axis:alt f="axisage007" c="CAGENTE" lit="9000531"/></b>                      
                            </td>
                             <%-- NIF --%>
                             <td class="titulocaja">
                                <b><axis:alt f="axisage007" c="NNUMNIF" lit="9000760"></axis:alt></b>
                            </td>            
                        </tr>
                        <tr>
                            <%-- Tipo agente --%>
                            <axis:ocultar f="axisage007" c="CTIPAGE" dejarHueco="false">
                            <td class="campocaja" id="td_CTIPAGE" >
                                <select name="CTIPAGE" id="CTIPAGE" size="1" class="campowidthselect campo campotexto" style="width:79%;"
                                  title="<axis:alt f="axisage007" c="CTIPAGE" lit="9000519"/>" alt="<axis:alt f="axisage007" c="CTIPAGE" lit="9000519"/>"
                                  <c:if test="${!modoModificable}">disabled="disabled"</c:if>>&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage007" c="SELEC" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTTIPOAGENTE}">
                                        <option value = "${element.CATRIBU}"
                                        <c:if test="${__formdata.AGENTE.CTIPAGE == element.CATRIBU}"> selected = "selected"</c:if>
                                        <c:if test="${__formdata.CTIPAGE == element.CATRIBU}"> selected = "selected"</c:if>>
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                            <%-- Código agente --%>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                value="${__formdata.AGENTE.CAGENTE}" name="CAGENTE" id="CAGENTE" 
                                style="width:35%;" title="<axis:alt f="axisage007" c="CAGENTE" lit="9000531"/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if> />
                                <img border="0" src="images/find.gif" onclick="f_but_buscar()" style="cursor:pointer"
                                alt="<axis:alt f="axisage007" c="BUS_CAGENTE" lit="9000713"/>" title="<axis:alt f="axisage007" c="BUS_CAGENTE" lit="9000713"/>"/>            
                            </td>
                            <%-- NIF --%>
                            <td class="campocaja" colspan="3">
                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                value="${__formdata.AGENTE.NNIF}" name="NNIF" id="NNIF" 
                                style="width:20%;" title="<<axis:alt f="axisage007" c="NNIF" lit="105904"/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if> />
                                <c:if test="${! empty __formdata.AGENTE.SPERSON}">
                                    <img border="0" src="images/find.gif" onclick="f_but_consulta_persona()" style="cursor:pointer" 
                                    alt="<axis:alt f="axisage007" c="CONS_PER" lit="9001824"/>" title="<axis:alt f="axisage007" c="CONS_PER" lit="9001824"/>"/>      
                                </c:if>
                           <%-- </td>
                            <td class="campocaja" align="right" colspan="3">--%>
                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                value="${__formdata.AGENTE.TNOMBRE}" name="TNOMBRE" id="TNOMBRE" 
                                style="width:68%;" title="<axis:alt f="axisage007" c="TNOMBRE" lit="100584"/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if>/>
                            </td>            
                        </tr>
                        <tr>
                            <%-- TALIAS --%>
                            <axis:ocultar f="axisage007" c="TALIAS" dejarHueco="false">
                                <td class="titulocaja" id="tit_TALIAS" >
                                    <b><axis:alt f="axisage007" c="TALIAS" lit="9902438"/> </b>  
                                </td> 
                            </axis:ocultar>
                             <%-- Domicilio --%>
                             <td class="titulocaja" colspan="3">
                                <b><axis:alt f="axisage007" c="CDOMICI" lit="101078"/> </b>  
                            </td>                 
                        </tr>
                        <tr>
                            <%-- TALIAS --%>
                            <axis:ocultar f="axisage007" c="TALIAS" dejarHueco="false">
                                <td class="campocaja" id="td_TALIAS" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" 
                                    value="${__formdata.AGENTE.TALIAS}" name="TALIAS" id="TALIAS" <c:if test="${!modoModificable}">readonly="readonly"</c:if> 
                                    style="width:78%;" title="<axis:alt f="axisage007" c="TALIAS" lit="9902438"/>" />
                                </td>  
                            </axis:ocultar>
                            <%-- Domicilio --%>
                            <td class="campocaja" colspan="3">
                                <select name="CDOMICI" id="CDOMICI" size="1" class="campowidthselect campo campotexto" style="width:64.5%;"
                                 <c:if test="${!modoModificable}">disabled="disabled"</c:if>>&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage007" c="MIN_VALUE" lit="9000848"/> - </option>
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
                            <%-- Comisión --%>
                            <axis:ocultar f="axisage007" c="CCOMISI" dejarHueco="false">
                                <td class="titulocaja"  colspan = "2" id="tit_CCOMISI" >
                                    <b><axis:alt f="axisage007" c="CCOMISI" lit="101509"/></b>   
                                </td>
                            </axis:ocultar>
                            <%-- FINIVIGCOM --%>
                            <axis:ocultar f="axisage007" c="FINIVIGCOM" dejarHueco="false">
                                <td class="titulocaja" id="tit_FINIVIGCOM" >
                                    <b><axis:alt f="axisage007" c="FINIVIGCOM" lit="9000716"/> </b>  
                                </td> 
                            </axis:ocultar>
                            
                        </tr>

                        <tr>
                            <%-- Comisión --%>
                            <axis:ocultar f="axisage007" c="CCOMISI" dejarHueco="false">
                                <td class="campocaja"  colspan = "2" id="td_CCOMISI" >
                                    <select name="CCOMISI" id="CCOMISI" size="1" class="campowidthselect campo campotexto" style="width:79%;" 
                                    title="<axis:alt f="axisage007" c="CCOMISI" lit="101509"/>" alt="<axis:alt f="axisage007" c="CCOMISI" lit="101509"/>"
                                    <c:if test="${!modoModificable}">disabled="disabled"</c:if>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage007" c="SELEC" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTAGECOMISION}">
                                            <option value = "${element.CCOMISI}"
                                            <c:if test="${__formdata.AGENTE.CCOMISI == element.CCOMISI}"> selected = "selected"</c:if>>
                                                ${element.TCOMISI} 
                                            </option>
                                        </c:forEach>
                                    </select> 
                                    
                                    <axis:ocultar f="axisage007" c="BTN_HISCOMISI" dejarHueco="false">
                                        <img id="BTN_HISCOMISI" alt="<axis:alt f="axisage007" c="icon_CCOMISI" lit="9902558"/>"
                                            title="<axis:alt f="axisage007" c="BTN_HISCOMISI" lit="9902558" />" src="images/informacion.gif"
                                             onclick="f_abrir_axisage016(1,0)" style="cursor:pointer" />
                                    </axis:ocultar>
                                    
                                </td>
                            </axis:ocultar>
                            <%-- FINIVIGCOM --%>
                            <axis:ocultar f="axisage007" c="FINIVIGCOM" dejarHueco="false">
                                <td class="campocaja" id="td_FINIVIGCOM" > 
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:45%;" 
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.AGENTE.FINIVIGCOM}"/>"  <axis:atr f="axisage007" c="FINIVIGCOM" a="formato=fecha&modificable=false&obligatorio=false"/>
                                    <c:if test="${!empty __formdata.AGENTE.FINIVIGCOM}"> value="${__formdata.AGENTE.FINIVIGCOM}"</c:if>
                                    name="FINIVIGCOM" id="FINIVIGCOM" <c:if test="${!modoModificable}">disabled="disabled"</c:if>
                                    title="<axis:alt f='axisage007' c='FINIVIGCOM' lit='9000716'/>" />
                                </td>
                            </axis:ocultar>
                        </tr>
                        <%-- Inici BFP bug 20999 25/01/2012 Comisión Indirecta --%>
                        <axis:ocultar f="axisage007" c="BLOC_COMISIO_INDIRECTA" dejarHueco="false">
                        <tr>
                            <axis:ocultar f="axisage007" c="CCOMISI_INDIRECT" dejarHueco="false">
                                <td class="titulocaja"  colspan = "2" id="tit_CCOMISI_INDIRECT" >
                                    <b><axis:alt f="axisage007" c="CCOMISI_INDIRECT" lit="9902599"/></b>   
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisage007" c="FINIVIGCOM_INDIRECT" dejarHueco="false">
                                <td class="titulocaja" id="tit_FINIVIGCOM_INDIRECT" >
                                    <b><axis:alt f="axisage007" c="FINIVIGCOM_INDIRECT" lit="9000716"/> </b>  
                                </td> 
                            </axis:ocultar>
                        </tr>
                        <tr>
                            
                            <axis:ocultar f="axisage007" c="CCOMISI_INDIRECT" dejarHueco="false">
                                <td class="campocaja"  colspan = "2" id="td_CCOMISI_INDIRECT" >
                                    <select name="CCOMISI_INDIRECT" id="CCOMISI_INDIRECT" size="1" class="campowidthselect campo campotexto" style="width:79%;" 
                                    title="<axis:alt f="axisage007" c="CCOMISI_INDIRECT" lit="101509"/>" alt="<axis:alt f="axisage007" c="CCOMISI_INDIRECT" lit="101509"/>"
                                    <c:if test="${!modoModificable}">disabled="disabled"</c:if>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage007" c="SELEC" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTAGECOMISION}">
                                            <option value = "${element.CCOMISI_INDIRECT}"
                                            <c:if test="${__formdata.AGENTE.CCOMISI_INDIRECT == element.CCOMISI}"> selected = "selected"</c:if>>
                                                ${element.TCOMISI} 
                                            </option>
                                        </c:forEach>
                                    </select> 
                                    
                                    <axis:ocultar f="axisage007" c="BTN_HISCOMISI_INDIRECT" dejarHueco="false">
                                        <img id="BTN_HISCOMISI_INDIRECT" alt="<axis:alt f="axisage007" c="icon_CCOMISI_INDIRECT" lit="9902558"/>"
                                            title="<axis:alt f="axisage007" c="BTN_HISCOMISI_INDIRECT" lit="9902558" />" src="images/informacion.gif"
                                             onclick="f_abrir_axisage016(1,1)" style="cursor:pointer" />
                                    </axis:ocultar>
                                    
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisage007" c="FINIVIGCOM_INDIRECT" dejarHueco="false">
                                <td class="campocaja" id="td_FINIVIGCOM_INDIRECT" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:45%;" 
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIVIGCOM_INDIRECT}"/>"  <axis:atr f="axisage007" c="FINIVIGCOM_INDIRECT" a="formato=fecha&modificable=true&obligatorio=false"/>
                                    <c:if test="${!empty __formdata.FINIVIGCOM_INDIRECT}"> value="${__formdata.FINIVIGCOM_INDIRECT}"</c:if>
                                    name="FINIVIGCOM_INDIRECT" id="FINIVIGCOM_INDIRECT"
                                    title="<axis:alt f='axisage007' c='FINIVIGCOM_INDIRECT' lit='9000716'/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if>/><c:if test="${modoModificable}"><a style="vertical-align:middle;"><img
                                    id="icon_FINIVIGCOM_INDIRECT" alt="<axis:alt f="axisage007" c="FINIVIGCOM_INDIRECT" lit="9000716"/>" title="<axis:alt f="axisage007" c="FINIVIGCOM_INDIRECT" lit="9000716" />" src="images/calendar.gif"/></a></c:if>
                                </td>
                            </axis:ocultar>
                        </tr>
                        </axis:ocultar>
                        <%-- Fi BFP bug 20999 25/01/2012 Comisión Indirecta --%>
                        <tr>
                            <%-- CSOBRECOMISI --%>
                            <axis:ocultar f="axisage007" c="CSOBRECOMISI" dejarHueco="false">
                                <td class="titulocaja" colspan = "2" id="tit_CSOBRECOMISI" >
                                    <b><axis:alt f="axisage007" c="CSOBRECOMISI" lit="9901178"/></b>   
                                </td>
                            </axis:ocultar>
                            <%-- FINIVIGSOBRECOM --%>
                            <axis:ocultar f="axisage007" c="FINIVIGCOM" dejarHueco="false">
                                <td class="titulocaja" id="tit_FINIVIGCOM" >
                                    <b><axis:alt f="axisage007" c="FINIVIGCOM" lit="9000716"/> </b>  
                                </td> 
                            </axis:ocultar>
                            <%-- FFINVIGSOBRECOM --%>
                            <axis:ocultar f="axisage007" c="FFINVIGSOBRECOM" dejarHueco="false">
                                <td class="titulocaja" id="tit_FFINVIGSOBRECOM" >
                                    <b><axis:alt f="axisage007" c="FFINVIGSOBRECOM" lit="9000717"/> </b>  
                                </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <%-- CSOBRECOMISI--%>
                            <axis:ocultar f="axisage007" c="CSOBRECOMISI" dejarHueco="false"> 
                                <td class="campocaja"  colspan = "2" id="td_CSOBRECOMISI" >
                                    <select name="CSOBRECOMISI" id="CSOBRECOMISI" size="1" class="campowidthselect campo campotexto" style="width:79%;" obligatorio="false" 
                                    	 title="<axis:alt f='axisage007' c='CSOBRECOMISI' lit='9901178'/>" 
                                         <c:if test="${!modoModificable}">disabled="disabled"</c:if>>
                                        <option value=""> - <axis:alt f="axisage007" c="SELEC" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTAGESOBRECOMISION}">
                                            <option value = "${element.CCOMISI}"
                                            <c:if test="${__formdata.AGENTE.CSOBRECOMISI == element.CCOMISI}"> selected = "selected"</c:if> >
                                                ${element.TCOMISI}
                                            </option>
                                        </c:forEach>
                                    </select>
                                    
                                    <axis:ocultar f="axisage007" c="BTN_HISSOBRECOMISI" dejarHueco="false">
                                     <img id="BTN_CSOBRECOMISI" alt="<axis:alt f="axisage007" c="icon_CSOBRECOMISI" lit="9901178"/>"
                                         title="<axis:alt f="axisage007" c="icon_CSOBRECOMISI" lit="9901178" />" src="images/informacion.gif"
                                         onclick="f_abrir_axisage016(2,0)" style="cursor:pointer" />
                                    </axis:ocultar>
                                    
                                </td>
                            </axis:ocultar>
                            <%-- FINIVIGSOBRECOM --%>
                            <axis:ocultar f="axisage007" c="FINIVIGSOBRECOM" dejarHueco="false">
                                <td class="campocaja" id="td_FINIVIGSOBRECOM" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:45%;" name="FINIVIGSOBRECOM" id="FINIVIGSOBRECOM" 
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIVIGSOBRECOM}"/>" 
                                    <c:if test="${!empty __formdata.AGENTE.FINIVIGSOBRECOM}"> value="${__formdata.AGENTE.FINIVIGSOBRECOM}"</c:if>
                                     <axis:atr f="axisage007" c="FINIVIGSOBRECOM" a="formato=fecha&obligatorio=false"/>
                                    title="<axis:alt f='axisage007' c='FINIVIGSOBRECOM' lit='9000716'/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if>/>
                                </td>
                            </axis:ocultar>
                            <%-- FFINVIGSOBRECOM --%>
                            <axis:ocultar f="axisage007" c="FFINVIGSOBRECOM" dejarHueco="false">
                                <td class="campocaja" id="td_FFINVIGSOBRECOM" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:45%;" name="FFINVIGSOBRECOM" id="FFINVIGSOBRECOM"
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.AGENTE.FFINVIGSOBRECOM}"/>" 
                                    <c:if test="${!empty __formdata.AGENTE.FFINVIGSOBRECOM}"> value="${__formdata.AGENTE.FFINVIGSOBRECOM}"</c:if>
                                     <axis:atr f="axisage007" c="FFINVIGSOBRECOM" a="formato=fecha&obligatorio=false"/>
                                    title="<axis:alt f='axisage007' c='FFINVIGSOBRECOM' lit='9000717'/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if>/>
                                </td>
                            </axis:ocultar>
                        </tr>
                        
                        
                        <tr>
                            <%-- IVA --%>
                            <axis:ocultar f="axisage007" c="CTIPIVA" dejarHueco="false">
                            <td class="titulocaja" colspan="2">
                                <b><axis:alt f="axisage007" c="CTIPIVA" lit="101340"/></b>   
                            </td>
                            </axis:ocultar>
                             <%-- Retención --%>
                             <axis:ocultar f="axisage007" c="CRETENC" dejarHueco="false">
                             <td class="titulocaja" colspan="2">
                                <b><axis:alt f="axisage007" c="TTIPRET" lit="101714"/> </b>  
                            </td>  
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <%-- IVA --%>
                            <axis:ocultar f="axisage007" c="CTIPIVA" dejarHueco="false">
                            <td class="campocaja" colspan="2">
                                <select name="CTIPIVA" id="CTIPIVA" size="1" class="campowidthselect campo campotexto" style="width:79%;"
                                 <c:if test="${!modoModificable}">disabled="disabled"</c:if>>&nbsp;
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
                            <axis:ocultar f="axisage007" c="CRETENC" dejarHueco="false">
                            <td class="campocaja" colspan="2">  
                                <select name="CRETENC" id="CRETENC" size="1" class="campowidthselect campo campotexto" style="width:79%;"
                                 <c:if test="${!modoModificable}">disabled="disabled"</c:if>>&nbsp;
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
                            
                             <%-- Estado --%>
                             <td class="titulocaja" colspan="2">
                                <b><axis:alt f="axisage007" c="CACTIVO" lit="100587"/> </b>  
                            </td>      
                            <%-- Cuenta bancaria --%>
                            <td class="titulocaja" colspan="2">
                                <b><axis:alt f="axisage007" c="CBANCAR" lit="100965"/></b>   
                            </td>
                        </tr>
                        <tr>
                            
                            <%-- Estado --%>
                            <td class="campocaja" colspan="2">
                                <select name="CACTIVO" id="CACTIVO" size="1" class="campowidthselect campo campotexto" style="width:79%;"
                                 <c:if test="${!modoModificable}">disabled="disabled"</c:if>>&nbsp;
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTESTADOAGENTE}">
                                        <option value = "${element.CATRIBU}"
                                            <c:if test="${__formdata.AGENTE.CACTIVO == element.CATRIBU}"> selected = "selected"</c:if> >
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            <%-- Cuenta bancaria --%>
                            <td class="campocaja" colspan="2">
                                <axis:encryptflag f="axisage007" c="CBANCAR" />
                                <select name="CBANCAR" id="CBANCAR" size="1" class="campowidthselect campo campotexto" style="width:79%;"
                                 <c:if test="${!modoModificable}">disabled="disabled"</c:if>>&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage007" c="MIN_VALUE" lit="9000848"/> - </option>
                                    <c:forEach var="element" items="${__formdata.AGENTE.CCC}">
                                        <option value = "<axis:encrypt f="axisage007" c="CBANCAR" value="${element.OB_IAX_CCC.CBANCAR}" />@@${element.OB_IAX_CCC.CTIPBAN}"
                                        <c:if test="${__formdata.AGENTE.CBANCAR == element.OB_IAX_CCC.CBANCAR}"> selected = "selected"</c:if>>
                                            <axis:masc f="axisage007" c="CBANCAR" value="${element.OB_IAX_CCC.CBANCARFORMAT}" />                                              
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                                                     
                        <tr>
                            <%-- Fecha baja --%>
                            <td class="titulocaja" colspan="2">
                                <b><axis:alt f="axisage007" c="FBAJAGE" lit="9001510"/></b>   
                            </td>
                            <%-- Nº Colegiado --%>
                            <axis:ocultar f="axisage007" c="NCOLEGI" dejarHueco="false">
                            <td class="titulocaja" colspan="2">
                                <b><axis:alt f="axisage007" c="NCOLEGI" lit="9000534"/> </b>
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <%-- F. Baja --%>
                            <td class="campocaja" colspan="2">
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:20%;"                                
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.AGENTE.FBAJAGE}"/>" 
                                name="FBAJAGE" id="FBAJAGE"
                                title="<axis:alt f="axisage007" c="FBAJAGE" lit='9001510'/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if>/><c:if test="${modoModificable}"><a style="vertical-align:middle;"><img
                                id="icon_FBAJAGE" alt="<axis:alt f="axisage007" c="LIT_SEL" lit="108341"/>" title="<axis:alt f="axisage007" c="LIT_SEL" lit="108341" />" src="images/calendar.gif"/></a></c:if>
                            </td>
                            <%-- Nº Colegiado --%>
                            <axis:ocultar f="axisage007" c="NCOLEGI" dejarHueco="false">
                            <td class="campocaja" colspan="2">
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:22%;"
                                value="${__formdata.AGENTE.NCOLEGI}" name="NCOLEGI" id="NCOLEGI"
                                title="<axis:alt f="axisage007" c="NCOLEGI" lit='9000534'/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if>/>
                            </td>
                            </axis:ocultar>
                        </tr>
                        <%--
                        <tr>
                            <td class="titulocaja" colspan = "4">
                                <div class="separador">&nbsp; </div>                                                                                                                            
                                <%-- DisplayTag Contratos --%>
                         <%--       <c:set var="title0"><axis:alt f="axisage007" c="TEMPRES" lit="101619"/></c:set>   <%-- Empresa --%>
                        <%--        <c:set var="title1"><axis:alt f="axisage007" c="NCONTRATO" lit="9000536"/></c:set>  <%-- Nº Contrato --%>
                         <%--       <c:set var="title2"><axis:alt f="axisage007" c="FFIRCON" lit="9000537"/></c:set>  <%-- F. Contrato --%>
           <%--
                                <div class="displayspaceGrande">
                                    <display:table name="${__formdata.CONTRATOS}" id="CONTRATOS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="axis_axisage007.do?paginar=true">
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
                        <%--        <c:set var="title0"><axis:alt f="axisage007" c="FMOVIMI" lit="104095"/></c:set>  <%-- Desde --%>
                        <%--        <c:set var="title1"><axis:alt f="axisage007" c="FMOVFIN" lit="103051"/></c:set>  <%-- Hasta --%>
                        <%--        <c:set var="title2"><axis:alt f="axisage007" c="TCTIPAGE" lit="9000519"/></c:set> <%-- Tipo Agente --%>
                        <%--        <c:set var="title3"><axis:alt f="axisage007" c="TPADRE" lit="1000566"/></c:set> <%-- Gestor --%>
                         <%--       <c:set var="title4"><axis:alt f="axisage007" c="CPERVISIO" lit="9000707"/></c:set>  <%-- Nivel de visión --%>
                         <%--       <c:set var="title5"><axis:alt f="axisage007" c="TPERNIVEL" lit="9000708"/></c:set>  <%-- Tipo de visión --%>
            <%--
                                <div class="displayspaceGrande">
                                    <display:table name="${__formdata.HISTORICO}" id="HISTORICO" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="axis_axisage007.do?paginar=true">
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
                        --%>
                        
                        
                        <axis:ocultar f="axisage007" c="DSP_PRODPART" dejarHueco="false">
                            <tr>
                                <td class="titulocaja" colspan = "4" id="td_DSP_PRODPART">
                                    <div class="separador">&nbsp; </div>                                                                                                                            
                                    <div class="titulo" >
                                        <div style="float:left">
                                            <img src="images/flecha.gif"/>
                                            <axis:alt f="axisage007" c="DSP_PRODPART" lit="9902544"/>
                                        </div>
                                    </div>
                                    <%-- DisplayTag Participacion utilidades --%>
                                    <c:set var="title0"><axis:alt f="axisage007" c="SPRODUC" lit="100829"/></c:set>   <%-- Empresa --%>
                                    <c:set var="title1"><axis:alt f="axisage007" c="CACTIVI" lit="103481"/></c:set>  <%-- Nº Contrato --%>
                                    <div class="displayspaceGrande">
                                        <display:table name="${__formdata.PRODPARTICIPACION}" id="PRODPARTICIPACION" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                             requestURI="axis_axisage007.do?paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PRODPARTICIPACION_AGE.TPRODUC" style="width:64%" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText"> 
                                                    ${PRODPARTICIPACION.OB_IAX_PRODPARTICIPACION_AGE.TPRODUC}
                                                </div>
                                            </display:column>
                                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRODPARTICIPACION_AGE.TACTIVI" style="width:34%" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${PRODPARTICIPACION.OB_IAX_PRODPARTICIPACION_AGE.TACTIVI}
                                                </div>
                                            </display:column>
                                        </display:table>                                                        
                                    </div>
                                </td> 
                            </tr>
                        </axis:ocultar>
                        <tr>
                            <%-- CTIPINT --%>
                            <axis:ocultar f="axisage007" c="CTIPINT" dejarHueco="false">
                                <td class="titulocaja" colspan="2" id="tit_CTIPINT" >
                                    <b><axis:alt f="axisage007" c="CTIPINT" lit="9902531"/></b>   
                                </td>
                            </axis:ocultar>
                            <%-- CAGECLAVE --%>
                            <axis:ocultar f="axisage007" c="CAGECLAVE" dejarHueco="false">
                                <td class="titulocaja" colspan="2" id="tit_CAGECLAVE" >
                                    <b><axis:alt f="axisage007" c="CAGECLAVE" lit="9902534"/> </b>
                                </td>  
                            </axis:ocultar>
                        </tr>
                        <tr>
                           <%-- CTIPINT --%>
                            <axis:ocultar f="axisage007" c="CTIPINT" dejarHueco="false">
                                <td class="campocaja" colspan="2"  id="td_CTIPINT" >
                                    <select name="CTIPINT" id="CTIPINT" size="1" class="campowidthselect campo campotexto" style="width:79%;" obligatorio="false"  
                                    	title="<axis:alt f='axisage007' c='CTIPINT' lit='9902531'/>"
                                        <c:if test="${!modoModificable}">disabled="disabled"</c:if>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage007" c="SELEC" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCTIPINT}">
                                            <option value = "${element.CATRIBU}"
                                            <c:if test="${__formdata.CTIPINT == element.CATRIBU}"> selected = "selected"</c:if> 
                                            <c:if test="${__formdata.CTIPINT == element.CATRIBU}"> selected = "selected"</c:if>>
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>
                            <%-- CAGECLAVE --%>
                            <axis:ocultar f="axisage007" c="CAGECLAVE" dejarHueco="false">
                                    <td class="campocaja" id="td_CAGECLAVE" colspan="2">
                                        <input type="text" name="CAGECLAVE" id="CAGECLAVE" value="${__formdata.CAGECLAVE}" class="campowidthinput campo campotexto" style="width:30%"
                                        readonly="true" formato="entero" title="<axis:alt f="axisage007" c="CAGECLAVE" lit="9902534"/>" alt="<axis:alt f="axisage007" c="CAGECLAVE" lit="9902534"/>" />
                                    <axis:ocultar f="axisage007" c="TAGECLAVE" dejarHueco="false">
                                        <input readonly="true" type="text" name="TAGECLAVE" id="TAGECLAVE" value="${__formdata.TAGECLAVE}" class="campowidthinput campo campotexto" style="width:60%" />
                                    </axis:ocultar>
                                    </td> 
                            </axis:ocultar>
                        </tr>  
                        
                        <tr>
                            <%-- CLIQUIDO --%>
                            <axis:ocultar f="axisage007" c="CLIQUIDO" dejarHueco="false">
                                <td class="titulocaja" id="tit_CLIQUIDO" > 
                                    <b><axis:alt f="axisage007" c="CLIQUIDO" lit="9902535"/></b>   
                                </td>
                            </axis:ocultar>
                            <%-- COFERMERCAN --%>
                            <axis:ocultar f="axisage007" c="COFERMERCAN" dejarHueco="false">
                                <td class="titulocaja" id="tit_COFERMERCAN" >
                                    <b><axis:alt f="axisage007" c="COFERMERCAN" lit="9902536"/> </b>
                                </td>  
                            </axis:ocultar>
                            <%-- FRECEPCONTRA --%>
                            <axis:ocultar f="axisage007" c="FRECEPCONTRA" dejarHueco="false">
                                <td class="titulocaja" id="tit_FRECEPCONTRA" >
                                    <b><axis:alt f="axisage007" c="FRECEPCONTRA" lit="9902537"/></b>   
                                </td>
                            </axis:ocultar>
                            <%-- CIDONEIDAD --%>
                            <axis:ocultar f="axisage007" c="CIDONEIDAD" dejarHueco="false">
                                <td class="titulocaja" id="tit_CIDONEIDAD" >
                                    <b><axis:alt f="axisage007" c="CIDONEIDAD" lit="9902538"/> </b>
                                </td>  
                            </axis:ocultar>
                        </tr>
                        <tr>
                           <%-- CLIQUIDO --%>
                            <axis:ocultar f="axisage007" c="CLIQUIDO" dejarHueco="false">
                                <td class="campocaja" id="td_CLIQUIDO" >
                                    <select name="CLIQUIDO" id="CLIQUIDO" size="1" class="campowidthselect campo campotexto" style="width:79%;" obligatorio="false" 
                                    	title="<axis:alt f='axisage007' c='CLIQUIDO' lit='9902535'/>"
                                        <c:if test="${!modoModificable}">disabled="disabled"</c:if>>&nbsp; 
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage007" c="SELEC" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCLIQUIDO}">
                                            <option value = "${element.CATRIBU}"
                                            <c:if test="${__formdata.CLIQUIDO == element.CATRIBU}"> selected = "selected"</c:if>>
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>
                            <%-- COFERMERCAN --%>
                            <axis:ocultar f="axisage007" c="COFERMERCAN" dejarHueco="false">
                                <td class="campocaja" id="td_COFERMERCAN" >
                                    <input type="checkbox" id="COFERMERCAN" name="COFERMERCAN" value="${__formdata.COFERMERCAN}" 
                                    readonly="true" disabled="disabled"
                                    <c:if test="${__formdata.COFERMERCAN == '1'}">checked</c:if> />
                                </td>  
                            </axis:ocultar>
                            <%-- FRECEPCONTRA --%>
                            <axis:ocultar f="axisage007" c="FRECEPCONTRA" dejarHueco="false">
                                <td class="campocaja" id="td_FRECEPCONTRA" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:45%;"                               
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FRECEPCONTRA}"/>" 
                                    <c:if test="${!empty __formdata.FRECEPCONTRA}"> value="${__formdata.FRECEPCONTRA}"</c:if>
                                    name="FRECEPCONTRA" id="FRECEPCONTRA" readonly="true"
                                    title="<axis:alt f='axisage007' c='FRECEPCONTRA' lit='9902537'/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if>/><c:if test="${modoModificable}"><a style="vertical-align:middle;"><img
                                    id="icon_FRECEPCONTRA" alt="<axis:alt f="axisage007" c="FRECEPCONTRA" lit="9902537"/>" title="<axis:alt f="axisage007" c="FRECEPCONTRA" lit="9902537" />" src="images/calendar.gif"/></a></c:if>
                                </td>
                            </axis:ocultar>
                            <%-- CIDONEIDAD --%>
                            <axis:ocultar f="axisage007" c="CIDONEIDAD" dejarHueco="false">
                                <td class="campocaja" id="td_CIDONEIDAD" >
                                    <select name="CIDONEIDAD" id="CIDONEIDAD" size="1" class="campowidthselect campo campotexto" style="width:79%;" obligatorio="false" 
                                    	title="<axis:alt f='axisage007' c='CIDONEIDAD' lit='9902538'/>"
                                        <c:if test="${!modoModificable}">disabled="disabled"</c:if>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage007" c="SELEC" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCIDONEIDAD}">
                                            <option value = "${element.CATRIBU}"
                                            <c:if test="${__formdata.CIDONEIDAD == element.CATRIBU}"> selected = "selected"</c:if> 
                                            <c:if test="${__formdata.CIDONEIDAD == element.CATRIBU}"> selected = "selected"</c:if>>
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>
                        </tr>
                        
                        <tr>
                            <%-- CCOMPANI --%>
                            <axis:ocultar f="axisage007" c="CCOMPANI" dejarHueco="false">
                                <td class="titulocaja" id="tit_CCOMPANI" >
                                    <b><axis:alt f="axisage007" c="CCOMPANI" lit="9902541"/></b>   
                                </td>
                            </axis:ocultar>
                            <%-- COFIPROPIA --%>
                            <axis:ocultar f="axisage007" c="COFIPROPIA" dejarHueco="false">
                                <td class="titulocaja" id="tit_COFIPROPIA" >
                                    <b><axis:alt f="axisage007" c="COFIPROPIA" lit="9902542"/> </b>
                                </td>  
                            </axis:ocultar>
                            <%-- CCLASIF --%>
                            <axis:ocultar f="axisage007" c="CCLASIF" dejarHueco="false">
                                <td class="titulocaja" id="tit_CCLASIF" >
                                    <b><axis:alt f="axisage007" c="CCLASIF" lit="9902543"/></b>   
                                </td>
                            </axis:ocultar>
                        </tr>

                        <tr>
                           <%-- CCOMPANI --%>
                            <axis:ocultar f="axisage007" c="CCOMPANI" dejarHueco="false">
                                <td class="campocaja" id="td_CCOMPANI" >
                                    <select name="CCOMPANI" id="CCOMPANI" size="1" class="campowidthselect campo campotexto" style="width:79%;" obligatorio="false" 
                                    	title="<axis:alt f='axisage007' c='CCOMPANI' lit='9902541'/>"
                                        <c:if test="${!modoModificable}">disabled="disabled"</c:if>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage007" c="SELEC" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCCOMPANI}">
                                            <option value = "${element.CCOMPANI}"
                                            <c:if test="${__formdata.CCOMPANI == element.CCOMPANI}"> selected = "selected"</c:if> 
                                            <c:if test="${__formdata.CCOMPANI == element.CCOMPANI}"> selected = "selected"</c:if>>
                                                ${element.TCOMPANI} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>
                            <%-- COFIPROPIA --%>
                            <axis:ocultar f="axisage007" c="COFIPROPIA" dejarHueco="false">
                                <td class="campocaja" id="td_COFIPROPIA" >
                                    <select name="COFIPROPIA" id="COFIPROPIA" size="1" class="campowidthselect campo campotexto" style="width:79%;" obligatorio="false" 
                                    	title="<axis:alt f='axisage007' c='COFIPROPIA' lit='9902542'/>"
                                        <c:if test="${!modoModificable}">disabled="disabled"</c:if>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage007" c="SELEC" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCOFIPROPIA}">
                                            <option value = "${element.CATRIBU}"
                                            <c:if test="${__formdata.COFIPROPIA == element.CATRIBU}"> selected = "selected"</c:if> 
                                            <c:if test="${__formdata.COFIPROPIA == element.CATRIBU}"> selected = "selected"</c:if>>
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>
                            <%-- CCLASIF --%>
                            <axis:ocultar f="axisage007" c="CCLASIF" dejarHueco="false">
                                <td class="campocaja" id="td_CCLASIF" >
                                    <select name="CCLASIF" id="CCLASIF" size="1" class="campowidthselect campo campotexto" style="width:79%;" obligatorio="false" 
                                    	title="<axis:alt f='axisage007' c='CCLASIF' lit='9902543'/>"
                                        <c:if test="${!modoModificable}">disabled="disabled"</c:if>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage007" c="SELEC" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCCLASIF}">
                                            <option value = "${element.CATRIBU}"
                                            <c:if test="${__formdata.CCLASIF == element.CATRIBU}"> selected = "selected"</c:if> 
                                            <c:if test="${__formdata.CCLASIF == element.CATRIBU}"> selected = "selected"</c:if>>
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>
                        </tr>
                        
                        <c:import url="axisage007_b.jsp"/>
                    
                    
                   
     <%--                   
                    </table>   
                </td>
            </tr>
        </table>
   
        <c:import url="../include/botonera_nt.jsp">
         <c:param name="f">axisage007</c:param>
        <c:param name="__botones">salir<c:if test="${false}">,aceptar</c:if></c:param></c:import>
        <div class="separador">&nbsp; </div>                                        
                                                                                
    </form>
    <c:import url="../include/mensajes.jsp" />
    
  
    
</body>
</html> --%>