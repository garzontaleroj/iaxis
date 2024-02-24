<%/*
*  Fichero: Axisrea022.jsp
* 11/01/2010
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
           
           objDom.setVisibilidadPorId("MODALIDADES", "hidden"); 
           objDom.setVisibilidadPorId("TMODALIDADES", "hidden");
           objDom.setVisibilidadPorId("ITECNICO", "hidden");  
           objDom.setVisibilidadPorId("TITECNICO", "hidden");
           objDom.setVisibilidadPorId("EPAGO", "hidden"); 
           objDom.setVisibilidadPorId("TEPAGO", "hidden");
           
           objDom.setVisibilidadPorId("SORTIDA", "hidden");
           
        }
      
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
        }      
             
        
        function f_but_109006() {
                
           if (objValidador.validaEntrada()) { 
                
                var CMAP = objDom.getValorPorId("CLISTADO");
                var FDESDE = objDom.getValorPorId("FDESDE");
                var FHASTA = objDom.getValorPorId("FHASTA");
                var COMPANIA = objDom.getValorPorId("COMPANIA");
                var VMODALIDADES = objDom.getValorPorId("VMODALIDADES");
                var VITECNICO = objDom.getValorPorId("VITECNICO");
                var VEPAGO = objDom.getValorPorId("VEPAGO");
                
           
                objAjax.invokeAsyncCGI("axis_axisrea022.do",callbackAjaxGenerarResultado_map,"operation=ajax_generar_resultados_map&CMAP="+CMAP+"&COMPANIA="+COMPANIA+"&VMODALIDADES="+VMODALIDADES
                    +"&VITECNICO="+VITECNICO+"&VEPAGO="+VEPAGO+"&FDESDE="+FDESDE+"&FHASTA="+FHASTA , this, objJsMessages.jslit_cargando);
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
            
        function f_ocultar(cmap){
            if (cmap == 113) {
               objDom.setVisibilidadPorId("MODALIDADES", "visible"); 
               objDom.setVisibilidadPorId("VMODALIDADES", "visible");
               document.getElementById("MODALIDADES").style.display ="block";
               objDom.setVisibilidadPorId("TMODALIDADES", "visible"); 
               document.getElementById("TMODALIDADES").style.display ="block";
               
               objDom.setVisibilidadPorId("ITECNICO", "hidden");  
               objDom.setVisibilidadPorId("VITECNICO", "hidden");
               document.getElementById("ITECNICO").style.display ="none"; 
               objDom.setVisibilidadPorId("TITECNICO", "hidden");  
               document.getElementById("TITECNICO").style.display ="none"; 
               
               objDom.setVisibilidadPorId("EPAGO", "hidden");
               objDom.setVisibilidadPorId("VEPAGO", "hidden");
               document.getElementById("EPAGO").style.display ="none";
               objDom.setVisibilidadPorId("TEPAGO", "hidden");
               document.getElementById("TEPAGO").style.display ="none"; 
            }
            else if (cmap == 114) {
                objDom.setVisibilidadPorId("ITECNICO", "visible");  
                document.getElementById("ITECNICO").style.display ="block";
                objDom.setVisibilidadPorId("VITECNICO", "visible");
                objDom.setVisibilidadPorId("TITECNICO", "visible");  
                document.getElementById("TITECNICO").style.display ="block";
                
                objDom.setVisibilidadPorId("MODALIDADES", "hidden");
                objDom.setVisibilidadPorId("VMODALIDADES", "hidden");
                document.getElementById("MODALIDADES").style.display ="none";
                objDom.setVisibilidadPorId("TMODALIDADES", "hidden"); 
                document.getElementById("TMODALIDADES").style.display ="none";
                
                objDom.setVisibilidadPorId("EPAGO", "hidden");
                objDom.setVisibilidadPorId("VEPAGO", "hidden");
                document.getElementById("EPAGO").style.display ="none";
                objDom.setVisibilidadPorId("TEPAGO", "hidden");
                document.getElementById("TEPAGO").style.display ="none";
            }
            else if (cmap == 120) {
                objDom.setVisibilidadPorId("EPAGO", "visible"); 
                objDom.setVisibilidadPorId("VEPAGO", "visible");
                document.getElementById("EPAGO").style.display ="block";
                objDom.setVisibilidadPorId("TEPAGO", "visible");  
                document.getElementById("TEPAGO").style.display ="block";
                
                objDom.setVisibilidadPorId("MODALIDADES", "hidden");
                objDom.setVisibilidadPorId("VMODALIDADES", "hidden");
                document.getElementById("MODALIDADES").style.display ="none";
                objDom.setVisibilidadPorId("TMODALIDADES", "hidden");
                document.getElementById("TMODALIDADES").style.display ="none";
                
                objDom.setVisibilidadPorId("ITECNICO", "hidden");  
                document.getElementById("ITECNICO").style.display ="none";
                objDom.setVisibilidadPorId("TITECNICO", "hidden"); 
                objDom.setVisibilidadPorId("VITECNICO", "hidden"); 
                document.getElementById("TITECNICO").style.display ="none"; 
            }
            else{
                objDom.setVisibilidadPorId("MODALIDADES", "hidden"); 
                objDom.setVisibilidadPorId("ITECNICO", "hidden");  
                objDom.setVisibilidadPorId("EPAGO", "hidden");
                objDom.setVisibilidadPorId("TMODALIDADES", "hidden"); 
                objDom.setVisibilidadPorId("TITECNICO", "hidden");  
                objDom.setVisibilidadPorId("TEPAGO", "hidden");
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
            <c:param name="titulo"><b><fmt:message key="9900929"/></b></c:param>    
            <c:param name="formulario"> <b> <fmt:message key="9900929"/></b></c:param> 
            <c:param name="form">Axisrea022</c:param>
        </c:import>
       
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
        
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
                                            <b><fmt:message key="9900929" /></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <select name = "CLISTADO" id="CLISTADO" title="<fmt:message key="9002142" />"  size="1" onchange="f_ocultar(this.value)"
                                                class="campowidthselect campo campotexto_ob"  <axis:atr f="axisrea022" c="CLISTADO" a="modificable=true&isInputText=false&obligatorio=true"/> >
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
                                            <b><fmt:message key="9000600" /></b>
                                        </td>
                                        <td></td>
                                        <td class="titulocaja" >
                                            <div id="TMODALIDADES">
                                                <b><fmt:message key="100943"/></b>
                                            </div>
                                            <div id="TITECNICO">
                                                <b><fmt:message key="107049"/></b>
                                            </div>
                                            <div id="TEPAGO">
                                                <b><fmt:message key="9001326"/></b>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <select name = "COMPANIA" id="COMPANIA"   size="1" onchange=""
                                                class="campowidthselect campo campotexto"  <axis:atr f="axisrea022" c="COMPANIA" a="modificable=true&isInputText=false"/> >
                                                <option value = ""> - <fmt:message key="108341"/> - </option>
                                                <c:forEach var="companias" items="${COMPANIAS}">
                                                    <option value = "${companias.CCOMPANI}"
                                                    <c:if test="${(!empty __formdata.COMPANIA.CCOMPANI)&& companias.CCOMPANI == __formdata.COMPANIA.CCOMPANI}"> selected </c:if>>
                                                    ${companias.TCOMPANI}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td></td>
                                        <td class="campocaja">
                                           <div id="MODALIDADES"> 
                                             <select name = "MODALIDAD" id ="VMODALIDADES" <axis:atr f="axisrea022" c="VMODALIDADES" a="modificable=true&isInputText=false&obligatorio=true"/>  
                                                     size="1" onchange="" class="campowidthselect campo campotexto_ob">
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <fmt:message key="108341"/> - </option>
                                                <c:forEach var="modalidades" items="${MODALIDADES}">
                                                    <option value = "${modalidades.CATRIBU}"
                                                        <c:if test="${modalidades.CATRIBU == __formdata.VMODALIDADES}">selected</c:if>>
                                                        ${modalidades.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                             </select>   
                                           </div>
                                           <div id="ITECNICO">
                                            <input type="text" formato="decimal" <axis:atr f="axisrea022" c="ITECNICO" a="modificable=true&isInputText=false&obligatorio=true"/>
                                                   name="Interes Tecnico" id="VITECNICO" value="<fmt:formatNumber pattern='###,##0.00' value='${__formdata.VITECNICO}'/>" style="width:30%;"    class="campowidthinput campo campotexto_ob"/>
                                           </div> 
                                           <div id="EPAGO"> 
                                            <select name = "Estado pago" id ="VEPAGO" <axis:atr f="axisrea022" c="VEPAGO" a="modificable=true&isInputText=false&obligatorio=true"/>  
                                            size="1" onchange="" class="campowidthselect campo campotexto_ob">
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <fmt:message key="108341"/> - </option>
                                                <c:forEach var="pagos" items="${ESTPAGOS}">
                                                    <option value = "${pagos.CATRIBU}"
                                                        <c:if test="${pagos.CATRIBU == __formdata.CATRIBU}">selected</c:if>>
                                                        ${pagos.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                           </div>
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
                                    </tr>
                                    <tr>
                                        <td class="campocaja" >
                                            <input type="text" formato="fecha" <axis:atr f="axisrea022" c="FDESDE" a="modificable=true&isInputText=false&obligatorio=true"/>
                                                   name="Fecha inicio" id="FDESDE"  style="width:30%;"  value=""  class="campowidthinput campo campotexto_ob"/>
                                            <a id="icon_FDESDE" style="vertical-align:middle;">
                                            <img alt="<fmt:message key="108341"/>" title="<fmt:message key="100883" />" src="images/calendar.gif"/></a>
                                        </td>
                                        <td></td>
                                        <td class="campocaja">
                                            <input type="text" formato="fecha" <axis:atr f="axisrea022" c="FHASTA" a="modificable=true&isInputText=false&obligatorio=true"/>
                                                   name="Fecha final" id="FHASTA" style="width:30%;"   value=""  class="campowidthinput campo campotexto_ob"/>
                                            <a id="icon_FHASTA" style="vertical-align:middle;">
                                            <img alt="<fmt:message key="108341"/>" title="<fmt:message key="100883" />" src="images/calendar.gif"/></a>
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