<%/* Revision:# PuGJU0W7sO4UVuKoUXYs5A== # */%>
<%-- 
*  Fichero: axisctr043.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*
*  Fecha: 25/08/2008
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
            <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />

    

    <script type="text/javascript">
    /****************************************************************************************/
    /*********************************** NAVEGACION *****************************************/
    /****************************************************************************************/
    function f_onload_axisctr049() {
    	 <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisctr049');
					</c:if>
     //   if (document.getElementById("but_cancelar")!=null) document.getElementById("but_cancelar").value="<fmt:message key="100648"/>";
        
        //gestionar propiedades de campos según combinaciones entre visible y modificable
        try{
        var anulat = '${requestScope.anulat}';

         if (!objUtiles.estaVacio(anulat) && anulat == 0) { 
                 objDom.setVisibilidadPorId("but_salir", "visible");
                objDom.setVisibilidadPorId("but_cancelar", "hidden");
                objDom.setVisibilidadPorId("but_1000086", "hidden");
                objDom.setVisibilidadPorId("taulatotal", "hidden");
                f_but_salir(); // todo bien, salgamos directamente
        }else{
            objDom.setVisibilidadPorId("but_salir", "hidden");
        }
        
        
        
        objDependencias.modificarPropiedadesSegunModificableYVisible();

        f_cargar_valores_defecto();

        f_carga_dependencias();
        var OK = '${requestScope.OK}';

        var SSEGURO = '${sessionScope.SSEGURO}';

   //     var mis = '${__formdata.TMOTRET}';
        var mis = '${requestScope.MENSAJE}';

         if (!objUtiles.estaVacio(OK) && OK == 0) { 

         //   objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_doc&MENSAJE="+mis+"&SEGURO=" + SSEGURO);
            objDom.setVisibilidadPorId("but_cerrar_modal_axisimprimir", "hidden"); 
            
            if(version_tomcat <= 6){  
            	objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt="+<%=new java.util.Date().getTime()%>+"&operation=impresion_doc&MENSAJE="+mis+"&SEGURO=" + SSEGURO);
                
           	}
           	else{
           		objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt="+<%=new java.util.Date().getTime()%>+"&operation=impresion_doc&MENSAJE="+encodeURI(mis)+"&SEGURO=" + SSEGURO);
           	}
            
            
         }

        
            <% if (request.getSession().getAttribute("cargaHost") != null) { %>
          if ( objDom.esVisible("BT_BUSCARHOST"))
            objDom.setVisibilidadPorId("BT_BUSCARHOST", "hidden");
        
          if ( objDom.esVisible("icon_CBANCAR"))  {
            objDom.setVisibilidadPorId("icon_CBANCAR", "hidden");
            }
            
        <% } %>

                }catch(e){
                   alert (e.name + " " + e.message);
                    }
    }
    
    function f_OnChange() {
        f_carga_dependencias();


         <% if (request.getSession().getAttribute("cargaHost") != null) { %>
          if (  objDom.esVisible("BT_BUSCARHOST")){
          objDom.setVisibilidadPorId("BT_BUSCARHOST", "hidden");
                if ( objDom.esVisible("icon_CBANCAR"))  {

                objDom.setVisibilidadPorId("icon_CBANCAR", "hidden");
                }
          }
          
          <% } %>  
          
            if (objDom.getValorPorId("cargatHost") == "1"){
                  if (  objDom.esVisible("BT_BUSCARHOST")){
                      objDom.setVisibilidadPorId("BT_BUSCARHOST", "hidden");
                            if ( objDom.esVisible("icon_CBANCAR"))  {
                            objDom.setVisibilidadPorId("icon_CBANCAR", "hidden");
                            }
                  }
                }
          
          
    }
    
        function f_cerrar_axisimprimir(){
                parent.f_cerrar_axisimprimir();
        } 
    
    

    
    function f_Get_CCC_HOST(SPERSON, SNIP){
      if ( !objUtiles.estaVacio(document.getElementById("BT_BUSCARHOST"))){
             if ( objDom.esVisible("BT_BUSCARHOST"))  
             objDom.setVisibilidadPorId("BT_BUSCARHOST", "hidden");
            }
            
         if ( !objUtiles.estaVacio(document.getElementById("icon_CBANCAR"))){
              if ( objDom.esVisible("icon_CBANCAR"))  
            objDom.setVisibilidadPorId("icon_CBANCAR", "hidden");
        }
    
            objDom.setValorPorId("cargatHost", "1");
            objAjax.invokeAsyncCGI("modal_axisctr049.do?SPERSON="+SPERSON+"&SNIP="+SNIP, callbackAjaxCargarCuentasTomador, "operation=ajax_cargar_cuentas_HOST", this, objJsMessages.jslit_cargando);
    }
    
        function f_Get_CCC(){
      
      if ( !objUtiles.estaVacio(document.getElementById("BT_BUSCARHOST"))){
           if ( ! objDom.esVisible("BT_BUSCARHOST")){
            objDom.setVisibilidadPorId("BT_BUSCARHOST", "visible");
          }
        }
        
        objDom.borrarOpcionesDeCombo(document.axisctr049Form.CBANCAR);
        
             if ( !objUtiles.estaVacio(document.getElementById("icon_CBANCAR"))){
                    if ( ! objDom.esVisible("icon_CBANCAR"))
                    objDom.setVisibilidadPorId("icon_CBANCAR", "visible");
            }
            objDom.setValorPorId("cargatHost", "0");
            objAjax.invokeAsyncCGI("modal_axisctr049.do", callbackAjaxCargarCuentasTomador, "operation=ajax_cargar_cuentas_tomadorAXIS", this, objJsMessages.jslit_cargando);

    }
    
    function f_but_1000086(){
        if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisctr049.do","cobrar",document.axisctr049Form, "_self", objJsMessages.jslit_cargando);   
                
            }
    }

    function f_but_101714() {
     
        parent.f_cerrar_axisctr049();
        //objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr049", "cancelar", document.axisctr049Form, "contenedor");
    } 
    function f_but_salir() {
     
        parent.f_cerrar_axisctr049();
        //objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr049", "cancelar", document.axisctr049Form, "contenedor");
    } 
    function f_but_cancelar() {
  //  parent.f_cancelaraxisctr049();
    if (objValidador.validaEntrada()) {
            <axis:visible f="axisctr049" c="BT_CANCELAR">
                f_but_salir();
            </axis:visible>
            <axis:visible f="axisctr049" c="BT_ANULAR">
            objUtiles.ejecutarFormulario("modal_axisctr049.do","cancelar",document.axisctr049Form, "_self", objJsMessages.jslit_cargando);   
            </axis:visible>
      }
    }      
    
    
    /****************************************************************************************/
    /******************************* CALLBACKS AJAX *****************************************/
    /****************************************************************************************/
    function callbackAjaxCargarCuentasTomador (ajaxResponseText) {
        var doc = objAjax.domParse(ajaxResponseText);

       
        if (!objAppMensajes.existenErroresEnAplicacion(doc)) {                                
            if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                var elementos = doc.getElementsByTagName("element");
                var cccCombo = document.axisctr049Form.CBANCAR;     
                objDom.borrarOpcionesDeCombo(cccCombo);
                
               for (i = 0; i < elementos.length; i++) {
                    var codigo = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CBANCAR")[0]) ?
                                 objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CBANCAR"), 0, 0) : "";
                    var desc   = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("TCBANCAR")[0]) ?
                                 objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TCBANCAR"), 0, 0): "";
                    objDom.addOpcionACombo(codigo, desc, cccCombo, i);
                }
                
            }
        }  
        
        
        
    }
    
     
    
 
    
    /****************************************************************************************/
    /************************************ MODAL AXPER007 ************************************/
    /****************************************************************************************/
    
    function f_abrir_axisper007(SPERSON) {

        objUtiles.abrirModal("axisper007", "src", "modal_axisper007.do?operation=form&SPERSON=" + SPERSON); 
    }
    
    function f_cerrar_axisper007 () {
        objUtiles.cerrarModal("axisper007");
        objAjax.invokeAsyncCGI("modal_axisctr049.do", callbackAjaxCargarCuentasTomador, "operation=ajax_cargar_cuentas_tomador", this, objJsMessages.jslit_cargando);
    }    
    
    function f_aceptar_axisper007 () {
        f_cerrar_axisper007();
    }    
    
</script>
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload_axisctr049()">
  <div id="wrapper" class="wrapper">
    <c:import url="../include/titulo_nt.jsp">
            <c:param name="modalidad"><fmt:message key="101110" /></c:param>
            <c:param name="titulo"></c:param>
            <c:param name="formulario">axisctr049</c:param>
            <c:param name="form">axisctr049</c:param>
    </c:import>
    <c:import url="../include/precargador_ajax.jsp">
    <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>  
    
    <c:import url="../include/modal_estandar.jsp">
             <c:param name="nid_y_titulo">axisimprimir|<fmt:message key="1000205" />|true#axisctr029|<fmt:message key="1000195" />#axisctr030|<fmt:message key="1000196"/>#axisctr049|<fmt:message key="Cobro Online"/></c:param>
    </c:import>    
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><fmt:message key="1000216" /></c:param>
        <c:param name="nid" value="axisper007" />
    </c:import>

     <div class="separador">&nbsp;</div>
     <form name="axisctr049Form" action="" method="POST">
    <input type="hidden" name="operation" value=""/>
    <input type="hidden" id="respuestas" name="respuestas" value=""/>
    <input type="hidden" id="SNIP" name="SNIP" value="${__formdata.SNIP}"/>
    <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>     
    <input type="hidden" id="cargatHost" name="cargatHost" value="0"/>
    <!-- Area de campos  -->
    <table class="mainModalDimensions base" id="taulatotal" align="center" cellpadding="0" cellspacing="0" <c:if test="${param.multiPantalla == 'true'}">style="height:200px;"</c:if>>
        <tr>
            <td>
                <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="100588" />&nbsp;<fmt:message key="9000464" /></div>
                <!--campos-->
                <table class="seccion">
                    <tr>
                        <td align="left">
                            <table class="area" align="center">
                                <tr>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>
                                </tr>
                                <!-- Fila 1 -->
                                
                                <tr>
                                   <td colspan="5">
                                     <textarea name="TMOTRET" readonly rows="4" cols="50" class="campo campotexto">${__formdata.TMOTRET}</textarea>                
                                   </td>
                                 
                                </tr>
                              
                            </table>
                            <div class="separador">&nbsp;</div>
                        </td>
                    </tr>
                </table>
                
                <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="1000097" /></div>
                <!--campos-->
                <table class="seccion">
                    <tr>
                        <td align="left">
                            <table class="area" align="center">
                                <tr>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>                                
                                </tr>
                                <tr>
    
                                    <axis:visible f="axisctr049" c="CTIPCOB">
                                        <td class="titulocaja">
                                            <b id="label_CTIPCOB"><fmt:message key="151348" /></b>
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axisctr049" c="CBANCAR">
                                        <td class="titulocaja">
                                            <b id="label_CBANCAR"><fmt:message key="1000092" /></b>
                                        </td>
                                     </axis:visible>                                            
                                </tr>
                                <tr>
                                    <axis:visible f="axisctr049" c="CTIPCOB">
                                        <td class="campocaja">
                                            <select name = "CTIPCOB" id ="CTIPCOB" size="1" onchange="f_OnChange()" 
                                                class="campowidthselect campo campotexto_ob" title="<fmt:message key="151348"/>" <axis:atr f="axisctr049" c="CTIPCOB" a="isInputText=false"/>>&nbsp;
                                                <option value="null"> - <fmt:message key="108341"/> - </option> 
                                                <c:forEach items="${sessionScope.axisctr_opcionesDatosGestion.tipoCobro}" var="tipoCobro">
                                                    <option value = "${tipoCobro.CATRIBU}" <c:if test="${tipoCobro.CATRIBU  == sessionScope.axisctr_datosGestion.CTIPCOB}">selected</c:if>>${tipoCobro.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:visible>
                                    
                                         <td class="campocaja"  colspan="4">
                                         <axis:visible f="axisctr049" c="CBANCAR">
                                            <select name = "CBANCAR" style="width:50%" id ="CBANCAR" size="1"  
                                                class="campowidthselect campo campotexto_ob" <axis:atr f="axisctr049" c="CBANCAR" a="isInputText=false"/>>&nbsp;
                                                <c:forEach items="${sessionScope.axisctr_opcionesDatosGestion.cuentasTomador}" var="cuentaTomador">
                                                    <option value = "${cuentaTomador.CBANCAR}" <c:if test="${cuentaTomador.CBANCAR  == sessionScope.axisctr_datosGestion.CBANCAR}">selected</c:if>>${cuentaTomador.TCBANCAR}</option>
                                                </c:forEach>
                                            </select>

                                                <c:forEach items="${sessionScope.axisctr_opcionesDatosGestion.cuentasTomador}" var="cuentaTomador">
                                                    <input type="hidden" name="CTIPBAN_${cuentaTomador.CBANCAR}" id="CTIPBAN_${cuentaTomador.CBANCAR}" value="${cuentaTomador.CTIPBAN}" />
                                                </c:forEach>

                                             </axis:visible> 
                                        <%--    
                                            <axis:visible f="axisctr049" c="BT_CBANCAR">
                                                 <a id="icon_CBANCAR" href="javascript:f_abrir_axisper007(${__formdata.SPERSON})"><img border="0" alt="<fmt:message key="1000124"/>" title="<fmt:message key="1000124"/>" src="images/lapiz.gif"/></a>
                                            </axis:visible>
                                            <axis:visible f="axisctr049" c="BT_BUSCAR">
                                                 <input type="button" class="boton" id="BT_BUSCAR" name="BT_BUSCAR"  value="<fmt:message key="9000508" />" onclick="f_Get_CCC(${__formdata.SPERSON},'${__formdata.SNIP}')" />
                                            </axis:visible>
                                            <axis:visible f="axisctr049" c="BT_BUSCARHOST">
                                                
                                                    <input type="button" class="boton" id="BT_BUSCARHOST" name="BT_BUSCARHOST"  value="<fmt:message key="9000509" />" onclick="f_Get_CCC_HOST(${__formdata.SPERSON},'${__formdata.SNIP}')" />
                                              
                                            </axis:visible>
                                            --%>
                                        </td>
                                    </tr>
                            </table>
                            <!--div class="separador">&nbsp;</div-->
                        </td>
                    </tr>
                </table>
                </td>
        </tr>
    </table>
    

        <!-- Botonera -->
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f" value="axisctr049"></c:param>
            <c:param name="__botones">cancelar,salir,1000086</c:param><%--101714--%>
        </c:import>
        
        </form>
   <c:import url="../include/mensajes.jsp" />
</div>
    </body>
</html>


