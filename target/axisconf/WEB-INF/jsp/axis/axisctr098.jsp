<%/*
*  Fichero: Axisctr098.jsp
* 03/09/2009
* @author <a href="amartinez@csi-ti.com">Alex Martinez</a>
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
           
           <axis:visible f="axisctr098" c="VINCULADA">
           objDom.setVisibilidadPorId("VINCU", "hidden");  
           objDom.setVisibilidadPorId("TVINCU", "hidden");  
           </axis:visible>
           objDom.setVisibilidadPorId("AGENTE", "hidden"); 
           objDom.setVisibilidadPorId("TAGENTE", "hidden");  
           objDom.setVisibilidadPorId("CESTADO", "hidden");
           objDom.setVisibilidadPorId("TCESTADO", "hidden");
           objDom.setVisibilidadPorId("SORTIDA", "hidden");
           
        }
      
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
        }      
             
        
        function f_but_109006() {
                
           if (objValidador.validaEntrada()) { 
                var CMAP = objDom.getValorPorId("CLISTADO");
                var CRAMO = objDom.getValorPorId("ramoProducto");
                var SPRODUC = objDom.getValorPorId("SPRODUC");
                var CAGRPRO = objDom.getValorPorId("CAGRPRO");
                var CAGENTE = objDom.getValorPorId("CAGENTE");
                var CVINCU = objDom.getValorPorId("CVINCU");
                var CESTADO = objDom.getValorPorId("CESTADO");
                var FDESDE = objDom.getValorPorId("FDESDE");
                var FHASTA = objDom.getValorPorId("FHASTA");
                

                if (CMAP == 368 && (!objUtiles.estaVacio(SPRODUC) && SPRODUC>0)) alert("<fmt:message key='9901146' />");
                
                objAjax.invokeAsyncCGI("axis_axisctr098.do",callbackAjaxGenerarResultado_map,"operation=ajax_generar_resultados_map&CMAP="+CMAP+"&CRAMO="+CRAMO+"&SPRODUC="+SPRODUC
                    +"&CAGRPRO="+CAGRPRO+"&CAGENTE="+CAGENTE+"&CVINCU="+CVINCU+"&CESTADO="+CESTADO+"&FDESDE="+FDESDE+"&FHASTA="+FHASTA , this, objJsMessages.jslit_cargando);
            }
        }

        function callbackAjaxGenerarResultado_map (ajaxResponseText) {

            objDom.setValorPorId("SORTIDA", "");   
            objDom.setValorPorId("CXML", "");  
            objDom.setVisibilidadPorId("SORTIDA", "visible");
            
            var doc = objAjax.domParse(ajaxResponseText);
            if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                var fichero = objUtiles.hayValorElementoXml(doc.getElementsByTagName("RETURN")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0) : "";
                                
                var resultado = objUtiles.hayValorElementoXml(doc.getElementsByTagName("VALOR")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALOR"), 0, 0) : "-1";
                      
                if(objUtiles.utilEquals(fichero, "-0.csv")){
                        alert("<fmt:message key='9000620' />");
                        document.miForm.CFICHERO.focus();
                }else{
                    //Guardo sólo el nombre.ext, no la ruta pq sino pl peta
                    RESPOSTA = "${__formdata.F_GET_TIPOMAP.RETURN}";
                    if (RESPOSTA==3){
                        objDom.setValorPorId("CXML", fichero);
                    }else {
                        objDom.setValorPorId("SORTIDA", fichero);
                    }     
                }
            }                
        }        

        function f_imprimir_fitxer(pfitxer){
            objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+pfitxer,600,200);
        }        
          
        function f_cargar_productos(){
          
            CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
            if (!objUtiles.estaVacio (CRAMO) ){
                objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
            }else
                objDom.setValorComponente(document.miForm.CRAMO, null);
            
            objAjax.invokeAsyncCGI("axis_axisctr098.do", callbackAjaxCargarProductos, "operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO) + 
                        "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value, this, objJsMessages.jslit_cargando);
        }  
        
        function f_cargar_ramos(){
            CAGRPRO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.CAGRPRO), "/")[0];
            if (!objUtiles.estaVacio (CAGRPRO) ){
                objDom.setValorComponente(document.miForm.CAGRUPA, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.CAGRPRO), "/")[0]);
                objDom.setValorComponente(document.miForm.TAGRUPA, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.CAGRPRO), "/")[1]);
            }else
                objDom.setValorComponente(document.miForm.CAGRUPA, null);
            
            objAjax.invokeAsyncCGI("axis_axisctr098.do", callbackAjaxCargarRamos, "operation=ajax_busqueda_ramos&CAGRPRO=" + objDom.getValorComponente(document.miForm.CAGRUPA) + 
                        "&TAGRUPA=" + objDom.getValorComponente(document.miForm.TAGRUPA)+"&tipo="+document.miForm.tipo.value, this, objJsMessages.jslit_cargando);
        }

        function callbackAjaxCargarProductos (ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("SPRODUC");
                var SPRODUCCombo = document.miForm.SPRODUC;     
                objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <fmt:message key="108341"/> - ', SPRODUCCombo, 0);
                for (i = 0; i < elementos.length; i++) {
                    var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                    var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                    objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                }
            }
        }
        
        function callbackAjaxCargarRamos (ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("CRAMO");
                var RamoCombo = document.miForm.ramoProducto;     
                objDom.borrarOpcionesDeCombo(RamoCombo);
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <fmt:message key="108341"/> - ', RamoCombo, 0);
                for (i = 0; i < elementos.length; i++) {
                    var CRAMO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CRAMO"), i, 0);
                    var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TRAMO"), i, 0);    
                    objDom.addOpcionACombo(CRAMO, TITULO, RamoCombo, i+1);
                }
            }
        } 
            
        function f_ocultar(cmap){
                
            if (cmap == 337 || cmap == 339 || cmap == 343 || cmap == 366 || cmap == 367 || cmap == 268 ||cmap == 269 ) {
                <axis:visible f="axisctr098" c="VINCULADA">
                objDom.setVisibilidadPorId("VINCU", "hidden");   
                objDom.setVisibilidadPorId("TVINCU", "hidden");  
                document.getElementById("VINCU").style.display ="none"; 
                document.getElementById("TVINCU").style.display ="none";
                </axis:visible>
                objDom.setVisibilidadPorId("TCESTADO", "hidden");
                objDom.setVisibilidadPorId("AGENTE", "visible");   
                objDom.setVisibilidadPorId("TAGENTE", "visible");
                objDom.setVisibilidadPorId("CESTADO", "hidden");
                
                document.getElementById("AGENTE").style.display ="block"; 
                document.getElementById("TAGENTE").style.display ="block"; 
                
            }
            else if (cmap == 338) {
                <axis:visible f="axisctr098" c="VINCULADA">
                objDom.setVisibilidadPorId("VINCU", "visible");   
                objDom.setVisibilidadPorId("TVINCU", "visible");  
                document.getElementById("VINCU").style.display ="block"; 
                document.getElementById("TVINCU").style.display ="block";
                </axis:visible>
                objDom.setVisibilidadPorId("CESTADO", "hidden");
                objDom.setVisibilidadPorId("TCESTADO", "hidden");
                objDom.setVisibilidadPorId("AGENTE", "hidden");   
                objDom.setVisibilidadPorId("TAGENTE", "hidden");
                
                document.getElementById("AGENTE").style.display ="none";
                document.getElementById("TAGENTE").style.display ="none";
                
                
            }
            else if (cmap == 342) {
                <axis:visible f="axisctr098" c="VINCULADA">
                objDom.setVisibilidadPorId("VINCU", "hidden");   
                objDom.setVisibilidadPorId("TVINCU", "hidden");
                document.getElementById("VINCU").style.display ="none";
                document.getElementById("TVINCU").style.display ="none";
                </axis:visible>
                objDom.setVisibilidadPorId("CESTADO", "visible"); 
                objDom.setVisibilidadPorId("TCESTADO", "visible");
                objDom.setVisibilidadPorId("AGENTE", "visible");   
                objDom.setVisibilidadPorId("TAGENTE", "visible");
                
                document.getElementById("AGENTE").style.display ="block"; 
                document.getElementById("TAGENTE").style.display ="block"; 
            }
            else{
                <axis:visible f="axisctr098" c="VINCULADA">
                objDom.setVisibilidadPorId("VINCU", "hidden");
                objDom.setVisibilidadPorId("TVINCU", "hidden"); 
                </axis:visible>
                objDom.setVisibilidadPorId("CESTADO", "hidden");
                objDom.setVisibilidadPorId("TCESTADO", "hidden");
                objDom.setVisibilidadPorId("AGENTE", "hidden");   
                objDom.setVisibilidadPorId("TAGENTE", "hidden");
            }
            
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
            objAjax.invokeAsyncCGI("axis_axisctr098.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
        }
        
        function f_actualizar_agente(){
            objAjax.invokeAsyncCGI("axis_axisctr098.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE_TEXT) + 
            "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO), this, objJsMessages.jslit_cargando);
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
        }
            
        function callbackAjaxCambiarAgente(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado);
                objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);
            }
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
                <c:param name="titulo"><fmt:message key="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
    </c:import>
        
    <form name="miForm" action="" method="POST">         

        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><b><fmt:message key="9002142"/></b></c:param>    
            <c:param name="formulario"> <b> <fmt:message key="9002142"/></b></c:param> 
            <c:param name="form">Axisctr098</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><fmt:message key="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
        </c:import>
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
        <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
        <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
        <input type="hidden" id="CAGRUPA" name="CAGRUPA" value="${__formdata.CAGRUPA}"/>
        <input type="hidden" id="TAGRUPA" name="TAGRUPA" value="${__formdata.TAGRUPA}"/>
        <input type="hidden" name="CAGENTE" id="CAGENTE" value="${sessionScope.axisctr_agente.CODI}"/>
        
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
                                        <th style="width:10%;height:0px"></th>
                                        <th style="width:10%;height:0px"></th>
                                        <th style="width:70%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><fmt:message key="9002142" /></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <select name = "CLISTADO" id="CLISTADO" title="<fmt:message key="9002142" />"  size="1" onchange="f_ocultar(this.value)"
                                                class="campowidthselect campo campotexto_ob"  <axis:atr f="axisctr098" c="CLISTADO" a="modificable=true&isInputText=false&obligatorio=true"/> >
                                                <option value = ""> - <fmt:message key="108341"/> - </option>
                                                <c:forEach var="listados" items="${LISTADOS}">
                                                    <option value = "${listados.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.CLISTADO)&& listados.CATRIBU == __formdata.CLISTADO}"> selected </c:if>>
                                                    ${listados.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                </table>
                                    
                                <div class="separador">&nbsp;</div>
                                <div class="titulo"></div>
                                <div class="separador">&nbsp;</div>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:5%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:5%;height:0px"></th>
                                        <th style="width:60%;height:0px"></th>
                                        
                                        
                                    </tr>
                                    <tr>
                                        <td class="titulocaja" >
                                            <b><fmt:message key="111471" /></b>
                                        </td>
                                        <td></td>
                                        <td class="titulocaja" >
                                            <b><fmt:message key="100784"/></b>
                                        </td>
                                        <td></td>
                                        <td class="titulocaja" >
                                            <b><fmt:message key="100829" /></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <select name = "CAGRPRO" id="CAGRPRO"   size="1" onchange="f_cargar_ramos()"
                                                class="campowidthselect campo campotexto"  <axis:atr f="axisctr098" c="CAGRPRO" a="modificable=true&isInputText=false"/> >
                                                <option value = ""> - <fmt:message key="108341"/> - </option>
                                                <c:forEach var="agrupaciones" items="${AGRUPACIONES}">
                                                    <option value = "${agrupaciones.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.AGRUPACIONES.CATRIBU)&& agrupaciones.CATRIBU == __formdata.AGRUPACIONES.CATRIBU}"> selected </c:if>>
                                                    ${agrupaciones.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td></td>
                                        <td class="campocaja">
                                            <select name = "ramoProducto" id ="ramoProducto"   size="1" onchange="f_cargar_productos()" class="campowidthselect campo campotexto">
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <fmt:message key="108341"/> - </option>
                                                <c:forEach var="ramos" items="${RAMOS}">
                                                    <option value = "${ramos.CRAMO}"
                                                        <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>
                                                        ${ramos.TRAMO}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td></td>                     
                                        <td class="campocaja" >
                                            <select name = "SPRODUC" id ="SPRODUC" size="1" style="width:60%;" onchange="" class="campowidthselect campo campotexto">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="108341" /> - </option>
                                                <c:forEach items="${productos}" var="item">
                                                    <option value = "${item.SPRODUC}" <c:if test="${__formdata['SPRODUC']==item.SPRODUC}">selected</c:if> >${item.TTITULO}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja" >
                                            <b><fmt:message key="9000526"/></b>
                                        </td>
                                        <td></td>
                                        <td class="titulocaja" >
                                            <b><fmt:message key="9000527" /></b>
                                        </td>
                                        <td></td>
                                        <td class="titulocaja">
                                            <div id="TAGENTE" >
                                            <b><axis:alt f="axisctr098" c="TCAGENTE" lit="100584"></axis:alt></b>
                                            </div>
                                           <axis:visible f="axisctr098" c="VINCULADA"> 
                                                <div id="TVINCU">
                                                    <b><fmt:message key="1000474" /></b>
                                                </div>
                                            </axis:visible>
                                        </td>
                                        
                                    </tr>
                                    <tr>
                                        <td class="campocaja" >
                                            <input type="text" formato="fecha" <axis:atr f="axisctr098" c="FDESDE" a="modificable=true&isInputText=false&obligatorio=true"/>
                                                   name="Fecha inicio" id="FDESDE"  style="width:40%;"  value=""  class="campowidthinput campo campotexto_ob"/>
                                            <a id="icon_FDESDE" style="vertical-align:middle;">
                                            <img alt="<fmt:message key="108341"/>" title="<fmt:message key="100883" />" src="images/calendar.gif"/></a>
                                        </td>
                                        <td></td>
                                        <td class="campocaja">
                                            <input type="text" formato="fecha" <axis:atr f="axisctr098" c="FHASTA" a="modificable=true&isInputText=false&obligatorio=true"/>
                                                   name="Fecha final" id="FHASTA" style="width:40%;"   value=""  class="campowidthinput campo campotexto_ob"/>
                                            <a id="icon_FHASTA" style="vertical-align:middle;">
                                            <img alt="<fmt:message key="108341"/>" title="<fmt:message key="100883" />" src="images/calendar.gif"/></a>
                                        </td>
                                        <td></td>
                                        <td class="campocaja">
                                            <div id="AGENTE" >
                                                <input type="text" name="CAGENTE_TEXT" id="CAGENTE_TEXT" style="width:15%;" value="${sessionScope.axisctr_agente.CODI}" class="campowidthinput campo campotexto" 
                                                    <axis:atr f="axisctr001" c="CAGENTE" a="modificable=true"/> onchange="f_actualizar_agente()" />
                                                <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                                &nbsp;&nbsp;&nbsp;
                                                <input readonly="true" type="text" style="width:50%;" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${sessionScope.axisctr_agente.NOMBRE}" class="campowidthinput campo campotexto"/>
                                            </div>
                                            <axis:visible f="axisctr098" c="VINCULADA">
                                            <div id="VINCU">
                                                <select name = "CVINCU" id="CVINCU"   size="1" onchange="" style="width:15%;"
                                                class="campowidthselect campo campotexto"  <axis:atr f="axisctr098" c="CVINCU" a="modificable=true&isInputText=false"/> >
                                                <option value = ""> - <fmt:message key="108341"/> - </option>
                                                <option value="1"
                                                    <c:if test="${__formdata.CVINCU != 'null' && __formdata.CVINCU == '1'}"> selected </c:if>>
                                                    <fmt:message key="101778"/></option>
                                                <option value="0"
                                                    <c:if test="${__formdata.CVINCU != 'null' && __formdata.CVINCU == '0'}"> selected </c:if>>
                                                    <fmt:message key="101779"/></option>
                                                </select>
                                            </div>
                                            </axis:visible>
                                         
                                        </td>
                                        
                                    </tr>
                                    <tr>
                                        <td class="titulocaja" id="TCESTADO">
                                            <b><fmt:message key="100587"  /></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <select name = "CESTADO" id="CESTADO"   size="1" onchange=""
                                                class="campowidthselect campo campotexto"  <axis:atr f="axisctr098" c="CESTADO" a="modificable=true&isInputText=false"/> >
                                                <option value = ""> - <fmt:message key="108341"/> - </option>
                                                <c:forEach var="estados" items="${ESTADOS}">
                                                    <option value = "${estados.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.ESTADOS.CATRIBU)&& estados.CATRIBU == __formdata.ESTADOS.CATRIBU}"> selected </c:if>>
                                                    ${estados.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                </table>
                                <div class="separador">&nbsp;</div>
                                <div class="titulo"></div>
                                <div class="separador">&nbsp;</div>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:40%;height:0px"></th>
                                        <th style="width:5%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:5%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:5%;height:0px"></th>
                                        <th style="width:5%;height:0px"></th>
                                    </tr>    
                                    <tr> <%-- Camp3 -Fitxer generat--%> 
                                        <td class="titulocaja" id="LITERAL_SORTIDA">
                                              <b><fmt:message key="107913" /></b>
                                        </td>   
                                    </tr>
                                    <tr>
                                        <td class="campocaja" id="fichero">
                                            <input type="text" readonly 
                                                   style="text-decoration:underline;background-color:transparent;border:0;cursor:pointer" 
                                                   onclick="javascript:f_imprimir_fitxer(document.getElementById('SORTIDA').value)" class="campowidthinput campo campotexto_ob" size="15"  name="SORTIDA" id="SORTIDA"
                                                   title="<fmt:message key="107913"/>"/>                                     
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
    
    <script type="text/javascript">
    Calendar.setup({
        inputField     :    "FDESDE",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FDESDE", 
        singleClick    :    true,
        firstDay       :    1
    });
    </script>
    <script type="text/javascript">
    Calendar.setup({
        inputField     :    "FHASTA",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FHASTA", 
        singleClick    :    true,
        firstDay       :    1
    });
    </script>
    
    </form>

    <c:import url="../include/mensajes.jsp"/>

</body>
</html>