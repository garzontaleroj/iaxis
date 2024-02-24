<%/*
*  Fichero: axisgfi014.jsp
*
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*
*  Fecha: 21/07/2008
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript">
    
    
    function f_but_buscar() {
        
        var CLAVE = objDom.getValorPorId("NTRAMO");
        var CODIGO = objDom.getValorPorId("CONCEPTO");
        
        
        if (objValidador.validaEntrada())
            parent.f_aceptar_axisgfi014(TRAMO, CONCEPTO);
    }
    
    
    
    function f_onload() {
        <c:if test="${__formdata.DETTRAMO != null}">
            f_select_orden('${__formdata.DETTRAMO}');
        </c:if>
        
        f_cargar_propiedades_pantalla();
    }
    
    function f_but_cancelar(){
         //alert("Antes de cerrar");
         parent.f_cerrar_modal('axisgfi014');
    }
    
    function f_but_aceptar(){
         //alert("Antes de aceptar");
         //parent.f_aceptar_axigfi014(document.miForm.NTRAMO.value,document.miForm.CONCEPTO.value);
         parent.f_cerrar_modal('axisgfi014');
    }
    
    /****************************************************************************************/
    /***********************************   ALTA MODALES     *********************************/
    /****************************************************************************************/
    function f_but_alta_vigencia(DETALLE_TRAMO,FECHA){
         
         f_abrir_modal('axisgfi015', true);
    }
    
    function f_but_alta_detalle_vigencia(ORDEN,DESDE,HASTA,VALOR){
         
          f_abrir_modal('axisgfi016', true,'&isNew=1');
    }
    
    /****************************************************************************************/
    /***********************************   MOD MODALES      *********************************/
    /****************************************************************************************/
    function f_but_editar_vigencia(DETALLE_TRAMO,FECHA){
         //alert("Antes de aceptar");
         f_abrir_modal('axisgfi015', true,'&DETALLE_TRAMO='+DETALLE_TRAMO+'&FECHA='+FECHA);
    }
    
    
    function f_but_editar_detalle_vigencia(ORDEN,DESDE,HASTA,VALOR){
         //alert("Antes de aceptar");
          f_abrir_modal('axisgfi016', true,'&ORDEN='+ORDEN+'&DESDE='+DESDE+'&HASTA='+HASTA+'&VALOR='+VALOR+'&isNew=0');
    }
    
    /****************************************************************************************/
    /***********************************   BORRAR MOD       *********************************/
    /****************************************************************************************/
    function f_but_borrar_vigencia(DETALLE_TRAMO){
         var resultado = confirm('<axis:alt f="axisgfi014" c="CONFIRM" lit="9000711"/>'); 
            if(resultado){
                objUtiles.ejecutarFormulario("modal_axisgfi014.do?DETALLE_TRAMO="+DETALLE_TRAMO, "borrar_vigencia", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
    }
    
    
    function f_but_borrar_detalle_vigencia(DETALLE_TRAMO,ORDEN){
         var resultado = confirm('<axis:alt f="axisgfi014" c="CONFIRM" lit="9000711"/>'); 
            if(resultado){
                objUtiles.ejecutarFormulario("modal_axisgfi014.do?DETALLE_TRAMO="+DETALLE_TRAMO+"&ORDEN="+ORDEN, "borrar_detalle_vigencia", document.miForm, "_self", objJsMessages.jslit_cargando);
                                            
            }
    }
    
    /****************************************************************************************/
    /***********************************   ACEPTAR MODALES  *********************************/
    /****************************************************************************************/
    // Grabar / modificar una vigencia 
    function f_aceptar_axigfi015(FECHA){
            
            f_cerrar_modal('axisgfi015');
            //alert("NTRAMO_VIGENCIA"+DETALLE_TRAMO);
            objUtiles.ejecutarFormulario("modal_axisgfi014.do?FECHA="+FECHA, "guardar_vigencia", document.miForm, "_self", objJsMessages.jslit_cargando);
            
    }
    // Grabar / modificar un detalle de vigencia 
    function f_aceptar_axigfi016(ORDEN,DESDE,HASTA,VALOR,DETALLE_TRAMO_VIGENCIA){
            var DETALLE_TRAMO = null;
            f_cerrar_modal('axisgfi016');
            <c:if test="${!empty __formdata.DETTRAMO}">
                DETALLE_TRAMO = ${__formdata.DETTRAMO};
            </c:if>
            DETALLE_TRAMO_VIGENCIA = document.getElementById('DETTRAMO').value;
            objUtiles.ejecutarFormulario("modal_axisgfi014.do?ORDEN="+ORDEN+"&DESDE="+DESDE+"&HASTA="+HASTA+"&VALOR="+VALOR+"&DETALLE_TRAMO_VIGENCIA="+DETALLE_TRAMO_VIGENCIA, "guardar_detalle_vigencia", document.miForm, "_self", objJsMessages.jslit_cargando);
            
    }
    /****************************************************************************************/
    /***********************************   MODAL GENERICO   *********************************/
    /****************************************************************************************/
    
    function f_abrir_modal(cual, noXButton, optionalQueryString) {
        
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            //if (noXButton) 
                //objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
    }
    
    function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
    }
        
    
    /****************************************************************************************/
    /***********************************    AJAX    *****************************************/
    /****************************************************************************************/
    function f_select_orden(DETALLE_TRAMO){
      document.miForm.DETTRAMO.value = DETALLE_TRAMO;
      objAjax.invokeAsyncCGI("modal_axisgfi014.do?DETALLE_TRAMO="+DETALLE_TRAMO, callbackAjaxDetalle, "operation=ajax_ordenes", this, objJsMessages.jslit_cargando);
  
    }
    
    
    function callbackAjaxDetalle(ajaxResponseText) {
                //alert(ajaxResponseText);
                try {                
                   var doc = objAjax.domParse(ajaxResponseText);
                
                if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {
                
                    var tableM = document.getElementById("LSTDETALLE");
                    var tbodyM = tableM.getElementsByTagName("tbody")[0];
                    var trM = tbodyM.getElementsByTagName("tr");
                    
                    objLista.borrarFilasDeLista ("LSTDETALLE", "6", "<axis:alt f='axisgfi014' c='SNV_COMBO' lit='1000254' />");
                    
                    for (var i = 0; i < objDom.numeroDeTags(doc, "element") ; i++) {
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
                        var ORDEN = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("ORDEN")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("ORDEN"), i, 0) : "");
                        newtd[0] = objLista.addTextoEnLista(ORDEN);
                        
                        var DESDE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("DESDE")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("DESDE"), i, 0) : "");
                        //if (DESDE != "") 
                        //    DESDE = objUtiles.formateaTimeStamp(DESDE);
                        newtd[1] = objLista.addTextoEnLista(DESDE);
                        
                        var HASTA = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("HASTA")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("HASTA"), i, 0) : "");
                        //if (HASTA != "") 
                            //HASTA = objUtiles.formateaTimeStamp(HASTA);
                        newtd[2] = objLista.addTextoEnLista(HASTA);
                                               
                        var VALOR = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("VALOR")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALOR"), i, 0) : "");
                        var TRAMO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TRAMO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TRAMO"), i, 0) : "");
                     
                        VALOR=objNumero.formateaNumeroPattern("#.##0,0########" , VALOR );
                        newtd[3] = objLista.addTextoEnLista(VALOR);

                        newtd[4] = objLista.addImagenEnLista("javascript:f_but_editar_detalle_vigencia('"+ORDEN+"','"+DESDE+"','"+HASTA+"','"+VALOR+"');",
                                    "0", "<axis:alt f='axisgfi014' c='EDITAR' lit='100002' />", "<axis:alt f='axisgfi014' c='EDITAR' lit='100002' />", "images/lapiz.gif");

                        newtd[5] = objLista.addImagenEnLista("javascript:f_but_borrar_detalle_vigencia('"+ TRAMO +"','"+ ORDEN +"');",
                                    "0", "<axis:alt f='axisgfi014' c='BORRAR' lit='100002' />", "<axis:alt f='axisgfi014' c='BORRAR' lit='100002' />", "images/delete.gif");
                        
                        // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                        objLista.addNuevaFila(newtd, newtr, tbodyM);
                
                    } // End for
                }//End if
                
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
                   
    }         
    
   
    </script>
  </head>
  <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_aceptar() }">
  <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
<form name="miForm" action="modal_axisgfi001.do" method="POST"> 
<input type="hidden" name="operation" value="aceptar" />
<input type="hidden" name="DETTRAMO" id="DETTRAMO" value="${__formdata.DETTRAMO}" />

<c:import url="../include/titulo_nt.jsp">
    <c:param name="formulario"><axis:alt f="axisgfi014" c="FORM" lit="9002001" /></c:param>
    <c:param name="form">axisgfi014</c:param>
</c:import>
<c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisgfi015|<axis:alt f="axisgfi014" c="TITULO_AXISGFI015" lit="9002004"/>|XoN</c:param>
</c:import>
<c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisgfi016|<axis:alt f="axisgfi014" c="TITULO_AXISGFI016" lit="9002005"/>|XoN</c:param>
</c:import>
<table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <!--campos-->
            <table class="seccion">
            <tr>
                <td>
                      <table class="area" align="center">       
                                <tr>
                                    <th style="height:0px;width:15%"></th>
                                    <th style="height:0px;width:35%"></th>
                                    <th style="height:0px;width:25%"></th>
                                    <th style="height:0px;width:25%"></th>
                                </tr>
                                <tr>
                                   
                                        <td class="titulocaja">
                                        <axis:visible f="axisgfi017" c="NTRAMO">
                                            <b><axis:alt f="axisgfi014" c="NTRAMO" lit="9000609" /></b>
                                        </axis:visible>
                                        </td>
                                    
                                               
                                        <td class="titulocaja">
                                        <axis:visible f="axisgfi017" c="CONCEPTO">                                                   
                                             <b><axis:alt f="axisgfi014" c="CONCEPTO" lit="9000715" /></b>
                                        </axis:visible>
                                        </td>                
                                   
                                        <td class="titulocaja">
                                        <axis:visible f="axisgfi017" c="CONCEPTO_FRANJA">
                                            <b><axis:alt f="axisgfi014" c="CONCEPTO_FRANJA" lit="9001997" /></b>
                                        </axis:visible>
                                        </td>
                                        
                                        <td class="titulocaja">
                                        <axis:visible f="axisgfi017" c="CONCEPTO_VALOR">
                                            <b><axis:alt f="axisgfi014" c="CONCEPTO_VALOR" lit="9001998" /></b>
                                        </axis:visible>
                                        </td>
                                    
                                </tr>
                                <tr>
                                    <td class="campocaja">
                                        <axis:visible f="axisgfi017" c="NTRAMO">
                                        
                                            <input type="text" readonly class="campowidthinput campo campotexto" id="NTRAMO" name="NTRAMO" style="width:40%"
                                            size="15" value="${__formdata.NTRAMO}" title="<axis:alt f="axisgfi014" c="NTRAMO" lit="1000085"/>" <axis:atr f="axisgfi017" c="NTRAMO" a="modificable=true"/>/>
                                        </axis:visible>
                                    </td>
                                            
                                    <td class="campocaja" >
                                        <axis:visible f="axisgfi017" c="CONCEPTO">        
                                            <input style="width:80%;" readonly  type="text" class="campowidthinput campo campotexto" id="CONCEPTO" name="CONCEPTO" 
                                            size="15" value="${__formdata.CONCEPTO}" title="<axis:alt f="axisgfi014" c="CONCEPTO" lit="1000109"/>" <axis:atr f="axisgfi017" c="CONCEPTO" a="modificable=true"/>/>
                                        </axis:visible>      
                                    </td>
                                          
                                    <td class="campocaja">
                                        <axis:visible f="axisgfi017" c="CONCEPTO_FRANJA">
                                        
                                            <input type="text"  readonly class="campowidthinput campo campotexto" id="CONCEPTO_FRANJA" name="CONCEPTO_FRANJA" style="width:80%"
                                            size="15" value="${__formdata.CONCEPTO_FRANJA}" title="<axis:alt f="axisgfi014" c="CONCEPTO_FRANJA" lit="9001997"/>" <axis:atr f="axisgfi017" c="CONCEPTO_FRANJA" a="modificable=true"/>/>
                                        </axis:visible>
                                    </td>
                                            
                                    <td class="campocaja" >
                                        <axis:visible f="axisgfi017" c="CONCEPTO_VALOR">        
                                            <input style="width:80%;" readonly type="text" class="campowidthinput campo campotexto" id="CONCEPTO_VALOR" name="CONCEPTO_VALOR" 
                                            size="15" value="${__formdata.CONCEPTO_VALOR}" title="<axis:alt f="axisgfi014" c="CONCEPTO_VALOR" lit="9001998"/>" <axis:atr f="axisgfi017" c="CONCEPTO_VALOR" a="modificable=true"/>/>
                                        </axis:visible>      
                                    </td>
                                    
                                    
                                </tr>
                               
                                
                                <tr>
                                <td colspan="2">
                                <%-- ------------------------------------------ LISTA VIGENCIAS ------------------------ --%>
                                <%-- ------------------------------------------ LISTA VIGENCIAS ------------------------ --%>
                                <%-- ------------------------------------------ LISTA VIGENCIAS ------------------------ --%>
                                <table class="seccion">
                                    <tr>
                                        <td >
                                            <table class="area" align="center">                    
                                                <tr>
                                                    <th style="width:25%;height:0%;"/>
                                                    <th style="width:25%;height:0%;"/>
                                                    <th style="width:25%;height:0%;"/>
                                                    <th style="width:25%;height:0%;"/>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                                    <c:set var="title0"><axis:alt f="axisgfi014" c="TRAMO" lit="9000603"/></c:set>  <%-- Tramo --%>
                                                                    <c:set var="title1"><axis:alt f="axisgfi014" c="FECHA" lit="100562"/></c:set>  <%-- Fecha --%>
                                                                    <c:set var="title4"><axis:alt f="axisgfi014" c="MODIFICAR" lit="9000724"/></c:set>  <%-- Modificar --%>
                                                                    <c:set var="title6"><axis:alt f="axisgfi014" c="ELIMINAR" lit="1000127"/></c:set>  <%-- Eliminar --%>
                                                                    
                                                                    <div id="dt_tramos" class="seccion displayspaceMaximo">
                                                                                <display:table name="${lista_vigencias}" id="LSTTRAMOS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                                                             requestURI="modal_axisgfi014.do?paginar=true">
                                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                                <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >
                                                                                    <div class="dspIcons">
                                                                                        <input type="radio" id="radioDETTRAMO_${LSTTRAMOS.DETALLE_TRAMO}" name="radioDETTRAMO"  
                                                                                        value="${LSTTRAMOS.DETALLE_TRAMO}" 
                                                                                        onclick="f_select_orden('${LSTTRAMOS.DETALLE_TRAMO}')"
                                                                                        <c:if test="${LSTTRAMOS.DETALLE_TRAMO == __formdata.DETTRAMO}"> checked="checked"</c:if>/>
                                                                                    </div>
                                                                                </display:column>
                                                                                <display:column title="${title0}" sortable="true" sortProperty="DETALLE_TRAMO" headerClass="sortable"  media="html" autolink="false" >
                                                                                    <div class="dspNumber">
                                                                                      ${LSTTRAMOS.DETALLE_TRAMO}
                                                                                    </div>
                                                                                </display:column>
                                                                                <display:column title="${title1}" sortable="true" sortProperty="FECHA_EFECTO" headerClass="sortable"  media="html" autolink="false" >
                                                                                    <div class="dspNumber">
                                                                                       <fmt:formatDate value='${LSTTRAMOS.FECHA_EFECTO}' pattern='dd/MM/yyyy'/>
                                                                                    </div>
                                                                                </display:column>
                                                                                <display:column title="${title6}" sortable="false"  headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                                                    <div class="dspIcons"><img border="0" alt="<axis:alt f="axisgfi014" c="BORRAR" lit="1000127"/>" title="<axis:alt f="axisgfi014" c="BORRAR" lit="1000127"/>" src="images/delete.gif" width="15px" height="15px"
                                                                                    style="cursor:pointer;vertical-align:middle;" 
                                                                                    onclick="f_but_borrar_vigencia('${LSTTRAMOS.DETALLE_TRAMO}')"  />
                                                                                    </div><!--Editar una plantilla -->
                                                                                </display:column>
                                                                                
                                                                            </display:table>
                                                                    </div>
                               
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4" align="right">           
                                                        <input type="button" onclick="f_but_alta_vigencia()" class="boton" style="margin-right:20px;" value="<axis:alt f='axisgfi014' c='VIGENCIA' lit='1000428'/>"/>
                                                    </td>
                                                </tr>
                       
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <%-- ------------------------------------------ LISTA VIGENCIAS ------------------------ --%>
                                <%-- ------------------------------------------ LISTA VIGENCIAS ------------------------ --%>
                                <%-- ------------------------------------------ LISTA VIGENCIAS ------------------------ --%>
                                </td>
                                <td colspan="2">
                                <%-- ------------------------------------------ LISTA DETALLE   ------------------------ --%>
                                <%-- ------------------------------------------ LISTA DETALLE   ------------------------ --%>
                                <%-- ------------------------------------------ LISTA DETALLE   ------------------------ --%>
                                
                                <table class="seccion">
                                    <tr>
                                        <td>
                                            <table class="area" align="center">                    
                                                <tr>
                                                    <th style="width:25%;height:0%;"/>
                                                    <th style="width:25%;height:0%;"/>
                                                    <th style="width:25%;height:0%;"/>
                                                    <th style="width:25%;height:0%;"/>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                                    <c:set var="title0"><axis:alt f="axisgfi014" c="ORDEN" lit="500102"/></c:set>  <%-- Orden --%>
                                                                    <c:set var="title1"><axis:alt f="axisgfi014" c="DESDE" lit="104095"/></c:set>  <%-- Desde --%>
                                                                    <c:set var="title2"><axis:alt f="axisgfi014" c="HASTA" lit="103051"/></c:set>  <%-- Hasta --%>
                                                                    <c:set var="title3"><axis:alt f="axisgfi014" c="VALOR" lit="101159"/></c:set>  <%-- Valor --%>
                                                                    <c:set var="title4"><axis:alt f="axisgfi014" c="MODIFICAR" lit="9000724"/></c:set>  <%-- Modificar --%>
                                                                    <c:set var="title6"><axis:alt f="axisgfi014" c="ELIMINAR" lit="1000127"/></c:set>  <%-- Eliminar --%>
                                                                    
                                                                    <div id="dt_detalle" class="seccion displayspaceMaximo">
                                                                                <display:table name="${lista_detalle_vigencia}" id="LSTDETALLE" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                                                             requestURI="modal_axisgfi014.do?paginar=true">
                                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                                <display:column title="${title0}" sortable="true" sortProperty="ORDEN" headerClass="sortable"  media="html" autolink="false" >
                                                                                    <div class="dspNumber">
                                                                                               ${LSTDETALLE.ORDEN}
                                                                                    </div>
                                                                                </display:column>
                                                                                <display:column title="${title1}" sortable="true" sortProperty="DESDE" headerClass="sortable"  media="html" autolink="false" >
                                                                                    <div class="dspNumber">
                                                                                        <a href="">
                                                                                            ${LSTDETALLE.DESDE}
                                                                                    </a></div>
                                                                                </display:column>
                                                                                <display:column title="${title2}" sortable="true" sortProperty="HASTA" headerClass="sortable"  media="html" autolink="false" >
                                                                                    <div class="dspText">
                                                                                        
                                                                                            ${LSTDETALLE.HASTA}
                                                                                    </div>
                                                                                </display:column>
                                                                                <display:column title="${title3}" sortable="true" sortProperty="VALOR" headerClass="sortable"  media="html" autolink="false" >
                                                                                    <div class="dspText">
                                                                                        ${LSTDETALLE.VALOR}
                                                                                           
                                                                                    </div>
                                                                                </display:column>
                                                                                <display:column title="${title4}" sortable="false"  headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                                                    <div class="dspIcons"><img border="0" alt="<axis:alt f="axisgfi014" c="EDITAR" lit="100002"/>" title="<axis:alt f="axisgfi014" c="EDITAR" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                                                    style="cursor:pointer;vertical-align:middle;" 
                                                                                    onclick="f_but_editar_detalle_tramo(0)"  />
                                                                                    </div><!--Editar una plantilla -->
                                                                                </display:column>
                                                                                <display:column title="${title6}" sortable="false"  headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                                                    <div class="dspIcons"><img border="0" alt="<axis:alt f="axisgfi014" c="BORRAR" lit="1000127"/>" title="<axis:alt f="axisgfi014" c="BORRAR" lit="1000127"/>" src="images/delete.gif" width="15px" height="15px"
                                                                                    style="cursor:pointer;vertical-align:middle;" 
                                                                                    onclick="f_but_borrar_detalle_tramo()"  />
                                                                                    </div><!--Editar una plantilla -->
                                                                                </display:column>
                                                                                
                                                                            </display:table>
                                                                    </div>
                               
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4" align="right">           
                                                        <input type="button" onclick="f_but_alta_detalle_vigencia()" class="boton" style="margin-right:20px;" value="<axis:alt f='axisgfi014' c='VIGENCIA' lit='1000428'/>"/>
                                                    </td>
                                                </tr>
                       
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <%-- ------------------------------------------ LISTA DETALLE   ------------------------ --%>
                                <%-- ------------------------------------------ LISTA DETALLE   ------------------------ --%>
                                <%-- ------------------------------------------ LISTA DETALLE   ------------------------ --%>
                                
                                </td>
                                
                                <tr>
                            </table>
                        </td>
                     </tr>   
               
            </table>
        </td>
    </tr>
</table>
<c:import url="../include/botonera_nt.jsp"><c:param name="f">axisgfi014</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>

</form>
<c:import url="../include/mensajes.jsp" />
</body>
</html>