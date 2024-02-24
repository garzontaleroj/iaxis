<%/*
*  Fichero: axisctr083.jsp
* 12/12/2008/
* @author <a href="jgarciam@csi-ti.com">Jaume Garcia</a>
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
    <title> <axis:alt f="axisctr083" c="axisctr083" lit="9001803"/></title> <%-- generación pagos renta  --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
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
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    
        
    <c:import url="../include/carga_framework_js.jsp"/>
  <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {
           f_cargar_propiedades_pantalla(); 
                      
        }
      
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
            
        }        

        function f_imprimir_fitxer(){            
                eval('pfitxer = document.miForm.SORTIDA.value;');            
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+pfitxer);
        }                
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/

            function f_seleccionar_todos(seleccionarTodos) {
                var inputs=document.getElementsByTagName("input"); // es getElementsByTagName o getElementsByName 
                    
                    for (icont=0;icont<inputs.length;icont++) 
                      {
                        if (inputs[icont].name.indexOf('checkProducto_')>=0) 
                          {                               
                           var pos = inputs[icont].name.indexOf('_');
                           var paramNlinea = inputs[icont].name.substr(pos+1,inputs[icont].name.length-pos);
                            
                            if (seleccionarTodos) {
                                inputs[icont].checked=true; // es checked o selected
                                
                                f_seleccionarProd(1,eval('document.miForm.SPRODUC_'+paramNlinea+'.value'));
                                }
                            else {
                                inputs[icont].checked=false; // es checked o selected
                                f_seleccionarProd(0,eval('document.miForm.SPRODUC_'+paramNlinea+'.value'));                                
                                 }    
                                 
                          } 
                     }       
             }
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
      
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
  
        
        function f_actualitzar(){
              
            if (!objUtiles.estaVacio(objDom.getValorPorId("CEMPRES")) && 
                 //!objUtiles.estaVacio(objDom.getValorPorId("CRAMO"))  &&
                 objDom.getValorPorId("CEMPRES") > 0 ){//&&
                 //objDom.getValorPorId("CRAMO") > 0 ){
          
                 objUtiles.ejecutarFormulario("axis_axisctr083.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        
        function f_seleccionarProd(valor,SPRODUC) {
             
             var parametres = '&CEMPRES='+objDom.getValorPorId("CEMPRES")+'&SPRODUC='+SPRODUC;
             objAjax.invokeAsyncCGI('axis_axisctr083.do?SELECCIO='+valor, callbackAjaxSeleccionarProd, 'operation=ajaxseleccionarProd'+parametres, this);
             
        }        
        
        function f_but_1000576() {
           if (objValidador.validaEntrada()) {
              //var parametres = '&CEMPRES='+objDom.getValorPorId("CEMPRES")+'&NANYO='+objDom.getValorPorId("NANYO")+'&NMES='+objDom.getValorPorId("NMES");
              
              objUtiles.ejecutarFormulario("axis_axisctr083.do", "procesar", document.miForm, "_self", objJsMessages.jslit_cargando);
              //objAjax.invokeAsyncCGI('axis_axisctr083.do', callbackAjaxRegistrar, 'operation=ajaxregistrar'+parametres, this);

           }             
        }
        
         function callbackAjaxSeleccionarProd(ajaxResponseText) {
            try{
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var operationOK = objAppMensajes.existenErroresEnAplicacion(doc);  
             
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        } 

         function callbackAjaxRegistrar(ajaxResponseText) {
            try{
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                       var OK = objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0);
                       if (OK == 0){
                           var NPROCES = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PNPROCESO"), 0, 0);
                           if (confirm ("<axis:alt f="axisctr083" c="axisctr083" lit="9000493"/> : "+NPROCES+"\n<axis:alt f="axisctr083" c="axisctr083" lit="9000711"/> ")){
                           
                             objUtiles.ejecutarFormulario("axis_axisctr083.do?SPROCES="+NPROCES, "procesar", document.miForm, "_self", objJsMessages.jslit_cargando);
                           }
                       }
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }     
        
    </script>   
</head>

<body  onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisctr083" c="axisctr083" lit="1000205"/>|true</c:param>
    </c:import>       
    
    <form name="miForm" action="" method="POST">
    
    <c:choose>
        <c:when test="${__formdata.MODORENTAS == 'PREVI_RENTAS'}">
            <c:set var="form" value="9000632"></c:set>
            <c:set var="titulillo" value="9001812"></c:set>
        </c:when>
        <c:otherwise>
            <c:set var="form" value="109005"></c:set>
            <c:set var="titulillo" value="9001803"></c:set>
        </c:otherwise>
    </c:choose>
    
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><b><axis:alt f="axisctr083" c="axisctr083" lit="${titulillo}"/></b></c:param>     <%-- generación pagos renta --%>
            <c:param name="formulario"> <b> <axis:alt f="axisctr083" c="axisctr083" lit="${form}"/></b></c:param> <%-- generación pagos renta --%>
            <c:param name="form">axisctr083</c:param>
        </c:import>
        
        <input type="hidden" name="MODORENTAS" value="${__formdata.MODORENTAS}"/>
        <input type="hidden" name="VCIDIOMA" value="${__formdata.VCIDIOMA}"/>
        <input type="hidden" name="VCEMPRES" value="${__formdata.VCEMPRES}"/>        
        <input type="hidden" name="SPRODUC" value="${__formdata.SPRODUC}"/>
        <input type="hidden" name="operation" value=""/>
        <c:if test="${fn:length(__formdata.LSTVALORES.LSTEMPRESAS) == 1  && !empty __formdata.LSTVALORES.LSTEMPRESAS}">
            <input type="hidden" id="CEMPRES" name="CEMPRES" value="${__formdata.LSTVALORES.LSTEMPRESAS[0].CEMPRES}" />
        </c:if>

        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    
                    <div class="titulo"><b><axis:alt f="axisctr083" c="axisctr083" lit="${titulillo}"/> :</b>
                    </div>

                    <table class="seccion" align="center">
                        <tr>
                            <td >
                                <%-- Área 1 --%>
                                
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:100%;height:0px"></th>
                                    </tr>   
                                    <tr  id="proc_1">
                                        <td>
                                        <table>
                                            <tr>
                                                <th style="width:33%;height:0px"></th>
                                                <th style="width:33%;height:0px"></th>
                                                <th style="width:16%;height:0px"></th>
                                                <th style="width:8%;height:0px"></th>
                                            </tr>
                                            <tr >
                                            
                                                <axis:visible f="axisctr083" c="CEMPRES" > 
                                                <c:if test="${!empty __formdata.LSTVALORES.LSTEMPRESAS && fn:length(__formdata.LSTVALORES.LSTEMPRESAS) > 1}">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr083" c="axisctr083" lit="101619"/></b>
                                                </td>
                                                </c:if>
                                                </axis:visible>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr083" c="axisctr083" lit="100784"/></b>
                                                </td>                                     
                                            </tr>                                       
                                             <tr>  
                                                    <axis:visible f="axisctr083" c="CEMPRES">
                                                     <c:if test="${!empty __formdata.LSTVALORES.LSTEMPRESAS && fn:length(__formdata.LSTVALORES.LSTEMPRESAS) > 1}">
                                                     <td class="campocaja">
                                                            <select name = "CEMPRES" id ="CEMPRES" size="1" onchange="f_actualitzar();" 
                                                                title="<axis:alt f="axisctr083" c="axisctr083" lit="101619"/>"
                                                                class="campowidthinput campo campotexto_ob" >&nbsp;
                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr083" c="axisctr083" lit="108341"/> - </option> 
                                                                <c:forEach items="${__formdata.LSTVALORES.LSTEMPRESAS}" var="emp">
                                                                    <option value = "${emp.CEMPRES}" <c:if test="${emp.CEMPRES  == __formdata.CEMPRES}">selected</c:if>>${emp.TEMPRES}</option>
                                                                </c:forEach>
                                                            </select>
                                                     </td>     
                                                     </c:if>
                                                    </axis:visible>  
                                                
                                                 <td class="campocaja">
                                                        <select name = "CRAMO" id ="CRAMO" onchange="f_actualitzar();"
                                                            title="<axis:alt f="axisctr083" c="axisctr083" lit="100784"/>"
                                                            class="campowidthselect campo campotexto"
                                                            >&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr083" c="axisctr083" lit="108341"/> - </option> 
                                                          <%--  <c:if test="${!empty __formdata.CEMPRES || fn:length(__formdata.LSTVALORES.LSTEMPRESAS) == 1}">--%>
                                                            <c:forEach items="${__formdata.LSTVALORES.LSTRAMOS}" var="ram">
                                                                <option value = "${ram.CRAMO}" <c:if test="${ram.CRAMO  == __formdata.CRAMO}">selected</c:if>>${ram.TRAMO}</option>
                                                            </c:forEach>
                                                          <%--  </c:if>--%>
                                                        </select>                                                  
                                                 </td>
                                                <%-- PRODUCTO
                                                 <td class="campocaja" colspan="2" >
                                                        <select name = "SPRODUC" id ="SPRODUC" onchange="f_actualitzar();"
                                                            title="<axis:alt f="axisctr083" c="axisctr083" lit="100829"/>"
                                                            class="campowidthselect campo campotexto"
                                                            >&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr083" c="axisctr083" lit="108341"/> - </option> 
                                                            <c:forEach items="${__formdata.LSTVALORES.LSTPRODUCTOS}" var="prod">
                                                                <option value = "${prod.SPRODUC}" <c:if test="${prod.SPRODUC  == __formdata.SPRODUC}">selected</c:if>>${prod.TTITULO}</option>
                                                            </c:forEach>
                                                        </select>
                                                </td>     --%>                                             
                                            </tr>
                                            
                                            <tr>
                                            </tr>
                                            <tr>
                                            <td class="titulocaja" colspan="2">
                                                  
                                                  </td>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr083" c="axisctr083" lit="100562"/></b> <%-- Data --%>
                                                  </td>                                           
                                            </tr>                                            
                                        
                                            <tr>
                                            <td colspan="2" class="campocaja">
                                               <!-- DisplayTag productes -->
                                                <c:set var="title0">
                                                   <axis:alt f="axisctr083" c="axisctr083" lit="1000307"/>
                                                </c:set>
                                                <div id="dt_productos" class="displayspace">
                                                  <%int contador = 0;%>
                                                    <display:table name="${__formdata.LSTPRODRENTAS}" id="miListaIdProductes" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                     requestURI="axis_${pantalla}.do?paginar=true">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column headerClass="headwidth5 sortable" title=" " media="html" autolink="false" sortable="false">
                                                            <div class="dspIcons">
                                                            <input <c:if test="${miListaIdProductes.MARCAT == 1}">checked</c:if> 
                                                                 onclick="f_seleccionarProd(  ((this.checked)?1:0)    ,'${miListaIdProductes['SPRODUC']}');"
                                                                 type="checkbox" name="checkProducto_<%=contador%>" id="checkProducto_<%=contador%>"/></div>
								<script type="text/javascript">
									f_seleccionarProd(0,'${miListaIdProductes['SPRODUC']}');
								</script>
                                                        </display:column>
                                                        <display:column title="${title0}" sortable="true" sortProperty="" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">${miListaIdProductes['TTITULO']}</div>
                                                            <input type="hidden" id="SPRODUC_<%=contador%>" name="SPRODUC_<%=contador%>" value="${miListaIdProductes['SPRODUC']}"/>
                                                        </display:column>
                                                        
                                                        <%contador++;%>
                                                    </display:table>
                                                </div>
                                            </td>
                                            
                                            <%-- Fecha --%>
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:75%;"                                
                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FECHAINI}"/>"                                 
                                                    name="FECHAINI" id="FECHAINI" alt="<axis:alt f="axisctr083" c="axisctr083" lit="100562"/> "
                                                    title="<axis:alt f="axisctr083" c="axisctr083" lit="100562"/>" obligatorio="true" formato="fecha"/>
                                                    <a style="vertical-align:middle;"><img
                                                    id="icon_FECHAINI" alt="<axis:alt f="axisctr083" c="axisctr083" lit="108341"/>"  title="<axis:alt f="axisctr083" c="axisctr083" lit="108341"/>" src="images/calendar.gif"/></a>
                                                </td>  

                                                 </td>
                                                <tr>
                                                <td>
                                                <input type="button" onclick="f_seleccionar_todos(true)" class="boton" value="<axis:alt f="axisctr083" c="axisctr083" lit="9000756"/>"/>
                                                <input type="button" onclick="f_seleccionar_todos(false)" class="boton" value="<axis:alt f="axisctr083" c="axisctr083" lit="9000757"/>"/>
                                                </td>
                                                <td></td>                                                               
               <%-- Camp3 -Fitxer generat--%> 
              <%--  <tr>
                    <td class="titulocaja" id="LITERAL_SORTIDA">
                        <b><axis:alt f="axisctr083" c="axisctr083" lit="107913"/></b>
                    </td>   
                </tr>
                <tr>
                    <td class="campocaja">
                        <input type="text" readonly 
                        style="text-decoration:underline;background-color:transparent;border:0;cursor:pointer" 
                        onclick="javascript:f_imprimir_fitxer()" 
                        class="campowidthinput campo campotexto_ob" 
                        value="${__formdata.NOMMAP1}"
                        size="15"  
                        name="SORTIDA" 
                        id="SORTIDA"
                        title="<axis:alt f="axisctr083" c="axisctr083" lit="107913"/>"/>                                     
                    </td> 
                </tr>  --%>                                              
                                                <td></td>
                                                </tr>                                     
                                            </tr>
                                        </table>                      
         </table>
         
         </table>
          <!-- Area con EL CAMPO SPROCES : PROCESO DE DOMINICLIACION  -->         
            <div class="separador">&nbsp; </div>  
            <table class="seccion">
                <tr>
                    <td>
                        <!-- Área 1 -->
                        <table class="area" align="center">
                            <tr>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:35%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            
                            <%-- Camp Sproces -Fitxer generat--%> 
                            <tr>
                                <td class="titulocaja">
                                        <b><axis:alt f="axisctr083" c="axisctr083" lit="1000576"/></b> <%-- Proceso Rentas --%>
                                    </td>
                            </tr>
                            <tr>
                                <%-- Proceso Rentas --%>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto_ob" id="SPROCES" name="SPROCES" size="15"                                    
                                    <axis:atr f="axisctr083" c="SPROCES"/>
                                    style="width:88%" value="${__formdata.SPROCES}" alt="<axis:alt f="axisctr083" c="axisctr083" lit="1000576"/>" title="<axis:alt f="axisctr083" c="axisctr083" lit="1000576"/>"/>
                                </td>
                            </tr>            
                        </table>
                    </td>
                </tr>
           </table>   
           
            <!-- Area con el Fichero  -->         
            <div class="separador">&nbsp; </div>  
            <table class="seccion">
                <tr>
                    <td>
                        <!-- Área 1 -->
                        <table class="area" align="center">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>                            
                            <%-- Camp3 -Fitxer generat--%> 
                            <tr>
                                <td class="titulocaja" id="LITERAL_SORTIDA">
                                    <b><axis:alt f="axisctr083" c="axisctr083" lit="107913"/></b>
                                </td>   
                            </tr>
                             
                            <tr>
                                <td class="campocaja">
                                    <input type="text" readonly 
                                    style="text-decoration:underline;background-color:transparent;border:0;cursor:pointer" 
                                    onclick="javascript:f_imprimir_fitxer()" 
                                    class="campowidthinput campo campotexto_ob" 
                                    value="${__formdata.NOMMAP1}"
                                    size="15"  
                                    name="SORTIDA" 
                                    id="SORTIDA"
                                    title="<axis:alt f="axisctr083" c="axisctr083" lit="107913"/>"/>                                     
                                </td> 
                            </tr>         
                                    </table>
                                </td>
                            </tr>
           </table>   
         
        
           
           
           
           
                       <div class="separador">&nbsp;</div>                                       
                       <div class="separador">&nbsp;</div>     
                       <div class="separador">&nbsp;</div>
                       <div class="separador">&nbsp;</div>
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axisctr083</c:param>  
            <c:param name="__botones">salir,1000576</c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
    
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FECHAINI",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FECHAINI", 
            singleClick    :    true,
            firstDay       :    1
        });

   </script>
   
</body>
</html>