<%/*
*  Fichero: Axisctr097.jsp
* 03/09/2009
* @author <a href="jdelrio@csi-ti.com">Javi del Rio</a>
*
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
    <title> <fmt:message key="9001551"/></title> 
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
        
    <c:import url="../include/carga_framework_js.jsp"/>

    
  <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        function f_cerrar_axisimprimir() {
                objUtiles.cerrarModal("axisimprimir");
        }
        
        function f_onload() {
           revisarEstilos();
        }

            function f_imprimir_fitxer(pfitxer){
            
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+pfitxer);
            }                         
        
      
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
        }            

        function f_imprimir_fitxer(pfitxer){
            objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+pfitxer,600,200);
        }        
        
        function f_abrir_axisctr014() {
            objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
        }
            
        function f_cerrar_axisctr014() {
            objUtiles.cerrarModal("axisctr014")
        }    
           
        function f_aceptar_axisctr014 (CAGENTE){
            objDom.setValorPorId("CAGENTE", CAGENTE);
            f_cerrar_axisctr014();
            objAjax.invokeAsyncCGI("axis_axisctr097.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
        }
        
        function f_actualizar_agente(){
            objAjax.invokeAsyncCGI("axis_axisctr097.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE_TEXT) , this, objJsMessages.jslit_cargando);
        }
        
        function callbackAjaxCargarAgente(ajaxResponseText){
                
            var doc=objAjax.domParse(ajaxResponseText);
            var elementos = doc.getElementsByTagName("element");
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){            
                    var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                    var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                    objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado); 
                    objDom.setValorPorId("CAGENTE", CAGENTEformateado); 
                    objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado); 
                }else{
                    objDom.setValorPorId("NOMBRE_TEXT",""); 
                    objDom.setValorPorId("CAGENTE_TEXT","");
                    objDom.setValorPorId("CAGENTE","");
                }
            }
            else{
                    objDom.setValorPorId("NOMBRE_TEXT",""); 
                    objDom.setValorPorId("CAGENTE_TEXT","");
                    objDom.setValorPorId("CAGENTE","");
                }            
            f_cargar_liquidaciones()
        }
            
        function callbackAjaxCambiarAgente(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado);
                objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);
            }
            f_cargar_liquidaciones()
        }
        
        function f_cargar_liquidaciones(){
            
            CEMPRES = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.CEMPRESA), "/")[0];
            
            if (!objUtiles.estaVacio (CEMPRES) ){
                objDom.setValorComponente(document.miForm.CEMPRES, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.CEMPRESA), "/")[0]);
               // objDom.setValorComponente(document.miForm.TEMPRES, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.CEMPRES), "/")[1]);
            }else
                objDom.setValorComponente(document.miForm.CEMPRES, null);
            
            objAjax.invokeAsyncCGI("axis_axisctr097.do", callbackAjaxCargarLiquidaciones, "operation=ajax_busqueda_liquidaciones&CEMPRES=" + CEMPRES + 
                        "&TEMPRES=" + objDom.getValorComponente(document.miForm.TEMPRES)+
                        "&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE)+
                        "&tipo="+document.miForm.tipo.value, this, objJsMessages.jslit_cargando);
        }
        
        function callbackAjaxCargarLiquidaciones (ajaxResponseText){
           
            var doc=objAjax.domParse(ajaxResponseText);
            
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("SPROCES");
                var ListadoCombo = document.miForm.CLISTADO;     
                objDom.borrarOpcionesDeCombo(ListadoCombo);
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <fmt:message key="108341"/> - ', ListadoCombo, 0);
                
                for (i = 0; i < elementos.length; i++) {
                    var CLISTADO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPROCES"), i, 0);
                    var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PERIODO"), i, 0);    
                    
                    objDom.addOpcionACombo(CLISTADO, TITULO, ListadoCombo, i+1);
                }
            }
        } 
        
        function f_but_109006() {
            
            //primero genero ambos ficheros RTF &CEMPRESI=" + CEMPRESI +"&CAGENTI=" + CAGENTE
            var SSPROCES = document.miForm.CLISTADO.value;
            var CCAGENTE = document.miForm.CAGENTE_TEXT.value;
            var CCEMPRE = document.miForm.CEMPRESA.value;

             if (objValidador.validaEntrada()) {
            //objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_ListComi&CPROCES="+SPROCES+"&CEMPRES="+CEMPRE+"&CAGENTE="+CAGENTE);
            //objUtiles.ejecutarFormulario ("axis_axisctr097.do?SSPROCES="+SPROCES, "listar", document.miForm, "_self", objJsMessages.jslit_cargando);     


            objAjax.invokeAsyncCGI("axis_axisctr097.do?SSPROCES="+SSPROCES+"&CCEMPRES="+CCEMPRE+"&CCAGENTE="+CCAGENTE
                                   , callbackAjaxGenerarResultado, "operation=ajax_generar_resultado", this, objJsMessages.jslit_cargando);
                }
         } 

            function callbackAjaxGenerarResultado(ajaxResponse) {                
                var doc = objAjax.domParse(ajaxResponse);                
                
                try {            
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {                                    
                            
                              if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("P_FITXER1")[0])) objDom.setValorPorId("P_FITXER1", objDom.getValorNodoDelComponente(doc.getElementsByTagName("P_FITXER1"), 0, 0));
                              if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("P_FITXER2")[0])) objDom.setValorPorId("P_FITXER2", objDom.getValorNodoDelComponente(doc.getElementsByTagName("P_FITXER2"), 0, 0));                                      
                              if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("P_FITXER3")[0])) objDom.setValorPorId("P_FITXER3", objDom.getValorNodoDelComponente(doc.getElementsByTagName("P_FITXER3"), 0, 0));                              
                              if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("P_FITXER4")[0])) objDom.setValorPorId("P_FITXER4", objDom.getValorNodoDelComponente(doc.getElementsByTagName("P_FITXER4"), 0, 0));                                                            

                              // AHORA LA LISTA /////
                                var tableM = document.getElementById("ReportsList");
                                var tbodyM = tableM.getElementsByTagName("tbody")[0];
                                var trM = tbodyM.getElementsByTagName("tr");

                                objLista.borrarFilasDeLista ("ReportsList", "1", "<fmt:message key='1000254' />");
                    
                                objLista.borrarFilaVacia(tbodyM, trM);
                                // Obtenemos el estilo para la fila que insertaremos
                                var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                                // Creamos una nueva fila vacia y le damos el estilo obtenido
                                var newtr = objLista.crearNuevaFila(rowstyle);

                                objLista.addNuevaFila(newtd, newtr, tbodyM);                                    
                                ///////////////////////  
                        
                        
                      if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("P_FITXER1")[0])) { 
                        // AHORA LA LISTA /////


                    var tableM = document.getElementById("ReportsList");
                    var tbodyM = tableM.getElementsByTagName("tbody")[0];
                    var trM = tbodyM.getElementsByTagName("tr");

                    //objLista.borrarFilasDeLista ("ReportsList", "1", "<fmt:message key='1000254' />");

                        objLista.borrarFilaVacia(tbodyM, trM);
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        // Creamos un array de columnas a añadir a la nueva fila del displayTag
                        var newtd = new Array(1);


                        //"javascript:f_imprimir_fitxer(document.getElementById('NOMMAP1').value)"
                        
                        newtd[0] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("P_FITXER1"), 0, 0),
                        "javascript:f_imprimir_fitxer(document.getElementById('P_FITXER1').value)");
                        
                        //newtd[0] = objLista.addTextoEnLista('APRA012_F',
                        //"javascript:f_imprimir_fitxer(document.getElementById('P_FITXER1').value)");

                        objLista.addNuevaFila(newtd, newtr, tbodyM);                                    

                           }
                           
                      if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("P_FITXER2")[0])) { 
                        // AHORA LA LISTA /////

                    var tableM = document.getElementById("ReportsList");
                    var tbodyM = tableM.getElementsByTagName("tbody")[0];
                    var trM = tbodyM.getElementsByTagName("tr");
                    
                    //objLista.borrarFilasDeLista ("ReportsList", "1", "<fmt:message key='1000254' />");
                    
                        objLista.borrarFilaVacia(tbodyM, trM);
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        // Creamos un array de columnas a añadir a la nueva fila del displayTag
                        var newtd = new Array(1);
                        newtd[0] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("P_FITXER2"), 0, 0),
                        "javascript:f_imprimir_fitxer(document.getElementById('P_FITXER2').value)");

                        objLista.addNuevaFila(newtd, newtr, tbodyM);                                    
                        ///////////////////////                       
                       }      

                      if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("P_FITXER3")[0])) { 
                        // AHORA LA LISTA /////

                    var tableM = document.getElementById("ReportsList");
                    var tbodyM = tableM.getElementsByTagName("tbody")[0];
                    var trM = tbodyM.getElementsByTagName("tr");
                    
                    //objLista.borrarFilasDeLista ("ReportsList", "1", "<fmt:message key='1000254' />");
                    
                        objLista.borrarFilaVacia(tbodyM, trM);
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        // Creamos un array de columnas a añadir a la nueva fila del displayTag
                        var newtd = new Array(1);
                        newtd[0] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("P_FITXER3"), 0, 0),
                        "javascript:f_imprimir_fitxer(document.getElementById('P_FITXER3').value)");

                        objLista.addNuevaFila(newtd, newtr, tbodyM);                                    
                        ///////////////////////                       
                       }   

                      if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("P_FITXER4")[0])) { 
                        // AHORA LA LISTA /////

                    var tableM = document.getElementById("ReportsList");
                    var tbodyM = tableM.getElementsByTagName("tbody")[0];
                    var trM = tbodyM.getElementsByTagName("tr");
                    
                    //objLista.borrarFilasDeLista ("ReportsList", "1", "<fmt:message key='1000254' />");
                    
                        objLista.borrarFilaVacia(tbodyM, trM);
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        // Creamos un array de columnas a añadir a la nueva fila del displayTag
                        var newtd = new Array(1);
                        newtd[0] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("P_FITXER4"), 0, 0),
                        "javascript:f_imprimir_fitxer(document.getElementById('P_FITXER4').value)");

                        objLista.addNuevaFila(newtd, newtr, tbodyM);                                    
                        ///////////////////////                       
                       }                        
  
                    } 
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
            }
            

        function f_cerrar_axisimprimir() {
            objUtiles.cerrarModal("axisimprimir");
        } 
        
    </script>   
</head>

<body  onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisimprimir|<fmt:message key="1000205" />|true</c:param>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><fmt:message key="9900862" /></c:param>
                <c:param name="nid" value="axisctr014" />
    </c:import>
        
    <form name="miForm" action="" method="POST">         

        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><b><fmt:message key="9900862"/></b></c:param>    
            <c:param name="formulario"> <b> <fmt:message key="9900862"/></b></c:param> 
            <c:param name="form">axisctr097</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><fmt:message key="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
        </c:import>
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
        <input type="hidden" id="CEMPRES" name="CEMPRES" value="${__formdata.CEMPRES}"/>
        <input type="hidden" id="TEMPRES" name="TEMPRES" value="${__formdata.TEMPRES}"/>                
        <input type="hidden" name="CAGENTE" id="CAGENTE" value="${sessionScope.axisctr_agente.CODI}"/>   
            <input type="hidden" name="P_FITXER1" id="P_FITXER1" value=""/>   
            <input type="hidden" name="P_FITXER2" id="P_FITXER2" value=""/>   
            <input type="hidden" name="P_FITXER3" id="P_FITXER3" value=""/>   
            <input type="hidden" name="P_FITXER4" id="P_FITXER4" value=""/>          
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:20px">
            <tr> 
                <td> 
                    <table class="seccion" align="center">
                        <tr>
                            <td >
                                <%-- Área 1 --%>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:30%;height:0px"></th>
                                        <th style="width:30%;height:0px"></th>
                                        <th style="width:30%;height:0px"></th>
                                        <th style="width:50%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><fmt:message key="101619" /></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <select name = "CEMPRESA" id="CEMPRESA"   size="1" onchange="f_cargar_liquidaciones()"
                                                title="<fmt:message key="101619" />" class="campowidthselect campo campotexto_ob"  <axis:atr f="axisctr097" c="CEMPRES" a="obligatorio=true&modificable=true&isInputText=false"/> >
                                                <option value = ""> - <fmt:message key="108341"/> - </option>
                                                <c:forEach var="empresa" items="${EMPRESAS}">
                                                    <option value = "${empresa.CEMPRES}"
                                                    <c:if test="${(!empty __formdata.CEMPRESA)&& empresa.CEMPRES == __formdata.CEMPRESA}"> selected </c:if>>
                                                    ${empresa.TEMPRES}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <div id="TAGENTE" >
                                            <b><axis:alt f="axisctr097" c="TCAGENTE" lit="100584"></axis:alt></b>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja" colspan="2">
                                            <div id="AGENTE" >
                                                <input type="text" name="CAGENTE_TEXT" id="CAGENTE_TEXT" style="width:10%;" value="${sessionScope.axisctr_agente.CODI}" class="campowidthinput campo campotexto" 
                                                    <axis:atr f="axisctr001" c="CAGENTE" a="modificable=true"/> onchange="f_actualizar_agente()" />
                                                <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                                &nbsp;&nbsp;&nbsp;
                                                <input readonly="true" type="text" style="width:50%;" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${sessionScope.axisctr_agente.NOMBRE}" class="campowidthinput campo campotexto"/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <div>
                                            <b><axis:alt f="axisctr097" c="TLISTADO" lit="106053"></axis:alt></b>
                                            </div>
                                        </td>
                                    </tr>    
                                    <tr>
                                        <td class="campocaja">
                                            <select name = "CLISTADO" id="CLISTADO"   size="1" 
                                                title="<fmt:message key="106053" />" class="campowidthselect campo campotexto_ob"  <axis:atr f="axisctr097" c="CLISTADO" a="obligatorio=true&modificable=true&isInputText=false"/> >
                                                <option value = ""> - <fmt:message key="108341"/> - </option>
                                                <c:forEach var="listados" items="${LISTADOS}">
                                                    <option value = "${listados.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.CLISTADO)&& listados.CATRIBU == __formdata.CLISTADO}"> selected </c:if>>
                                                    ${listados.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>                                    
                                                <tr id="listaImpresion">
                                                    <td colspan="2">
                                                        <div class="separador">&nbsp;</div>     
                                                        <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="112247"/></div>
                                                        
                                                        <c:set var="title0"><fmt:message key="107913"/></c:set>  
                                                        <div class="displayspaceMaximo">
                                                            <display:table name="${sessionScope.reportsList}" id="ReportsList" export="false" class="dsptgtable" pagesize="-1" cellpadding="0" cellspacing="0"
                                                                 requestURI="axis_axisctr050.do?paginar=true">
                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                <display:column title="${title0}" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                                    <div class="dspText">
                                                                        <a href="javascript:void(0)" onclick="objUtiles.abrirModal('axisimprimir', 'src', 'modal_axisimprimir.do?operation=tunnel&file='+FILE)">  <%-- +"&mimetype=csv" --%>
                                                                            ${reportsList.codigoPROVIS}
                                                                        </a>
                                                                    </div>
                                                                </display:column>  >                                                             
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

        <c:import url="../include/botonera_nt.jsp">
            <c:param name="__botones">salir,109006</c:param> 
        </c:import>

    </form>

    <c:import url="../include/mensajes.jsp"/>

</body>
</html>