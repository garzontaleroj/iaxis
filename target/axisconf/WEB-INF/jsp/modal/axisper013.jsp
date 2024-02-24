<%-- 
*  Fichero: axisper013.jsp
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a>
*
*  Fecha: 23/07/2008
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="axis.util.Constantes" %>
<%@ page import="java.util.*" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
         <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
        	  <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisper013');
					</c:if>
         formdataNAC = '${__formdata.CPAIS}';
        if (!objUtiles.estaVacio(formdataNAC)){
                if (!objUtiles.estaVacio(f_buscar_TPAIS(formdataNAC))){
                    objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "<b>" + f_buscar_TPAIS(formdataNAC)+"</b>");
                }
           }
            
            var PSPERSONOUT = "${requestScope.PSPERSONOUT}"; 
            if (!objUtiles.estaVacio(PSPERSONOUT))
                parent.f_aceptar_axisper013( PSPERSONOUT);
           f_cargar_propiedades_pantalla();   
        }
                
        function f_but_aceptar() {
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisper013.do", "grabarPersona", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }
       
	 function f_buscar_TPAIS(CPAIS) {
                <% 
                if (((java.util.Map) request.getAttribute("__formdata"))!= null){
                java.util.Map formdata = ((java.util.Map) request.getAttribute("__formdata"));
                if (((java.util.Map) formdata.get("listValores"))!= null){
                java.util.Map lista = (java.util.Map)formdata.get("listValores");
                if (((java.util.ArrayList)lista.get("lstPaises"))!= null){
                java.util.ArrayList paises = (java.util.ArrayList)lista.get("lstPaises");
                for(int i = 0;i<paises.size();i++){
                java.util.HashMap paisHash = (java.util.HashMap)paises.get(i);
                %>
                pais = <%=paisHash.get("CPAIS")%>
                if (CPAIS == pais){
                return "<%=paisHash.get("TPAIS")%>"
                }
                <%}}}}%> 
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axisper013();
        }        
        
        /****************************************************************************************/
        /*********************************** CALLBACK AJAX **************************************/
        /****************************************************************************************/
        
        function f_onchange_CNACIONALIDAD() {
            var CNACIONALIDAD=objDom.getValorPorId("CNACIONALIDAD");
            
            if (!objUtiles.estaVacio(CNACIONALIDAD)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPAIS_NACIONALIDAD";
                qs=qs+"&CPAIS_NACIONALIDAD="+CNACIONALIDAD
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisper013.do", callbackajaxdireccion, qs, this)
            } else {
                objDom.setValorPorId("CNACIONALIDAD", "");
                objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "");
                limpiaCampos("CNACIONALIDAD");
            }                
        }
        
      
        
        function callbackajaxdireccion (ajaxResponseText){
            try{ 
            
           // alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                                       
                      if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CNACIONALIDAD")[0])) {
                       if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CNACIONALIDAD", "");
                            limpiaCampos("CNACIONALIDAD");
                        }else{
                            objDom.setValorPorId("CNACIONALIDAD", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CNACIONALIDAD"), 0, 0));
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAISNACIONALIDAD")[0])){
                                 objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAISNACIONALIDAD"), 0, 0) + "</b>");
                                limpiaCampos("CNACIONALIDAD");
                            }
                        }
                    }
                }
                    
         
                    
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }

        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
                
        function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION){
             objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
              "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION);
        }
        
        function f_aceptar_axiscom001(CODIGO, TEXTO, CODIGO_CONSULTA){
            f_cerrar_axiscom001();
            
            if (!objUtiles.estaVacio(TEXTO))
                TEXTO = objUtiles.replaceAll(TEXTO, "-quote-", "\'");
                   
            if (CODIGO_CONSULTA == "LISTA_PAIS_NACIONALIDAD") {
                objDom.setValorPorId("CNACIONALIDAD", CODIGO);
                objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "<b>" + TEXTO + "</b>");
            }
            
          
        }
        
        function f_cerrar_axiscom001() {
            objUtiles.cerrarModal("axiscom001");
        }
        
        function actualitzarCheckbox(obj){
         objDom.setValorPorId("CDEFECTO", ((objDom.getComponenteMarcado(obj))? "1" : "0" ));
        }
        
      
    </script>
  </head>
    <body onload="f_onload()">
    	<div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="faceptar" value="${__formdata.faceptar}"/>
            <%-- Esto es necesario tenerlo como hidden para volverlo a enviar a servidor para grabar --%>
            <input type="hidden" name="isNew" value="${__formdata.isNew}"/>
            <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}"/>
            <input type="hidden" name="SPEREAL" value="${__formdata.SPEREAL}"/>
            <input type="hidden" name="CESTPER" value="${__formdata.CESTPER}"/>
            <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}"/>  
            <input type="hidden" name="CTIPPER" value="${__formdata.CTIPPER}"/>
            <input type="hidden" name="MENSWARNINFO" id ="MENSWARNINFO" value="${__formdata.MENSWARNINFO}" />
            
            

            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisper013" c="TIT_AXISPER013" lit="9000413" /></c:param>
                <c:param name="producto"><axis:alt f="axisper013" c="TIT_AXISPER013" lit="9000413" /></c:param>
                <c:param name="form">axisper013</c:param>
            </c:import>

            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 2}"> <%-- TIDENTI == 2: Persona Jurídica --%>
                        <div class="separador">&nbsp;</div>
                        <%-- Datos nacionalidades --%>
                        
                        <table class="seccion">
                            <tr>
                                <th style="width:4%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper013" c="CNACIONALIDAD" lit="1000304"/></b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="campocaja">
                                <c:choose>
                                 <c:when test="${empty __formdata.isNew || __formdata.isNew}">
                                <input type="text"  class="campowidthinput campo campotexto"
                                <axis:atr f="axisper013" c="CNACIONALIDAD" a="obligatorio=true"/>
                                 size="15" maxlength="3" value="" name="CNACIONALIDAD" id="CNACIONALIDAD" onchange="f_onchange_CNACIONALIDAD()" style="width:18%;" />
                                <img id="findPaisNacionalidad" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS_NACIONALIDAD', null)" style="cursor:pointer"/>
                               
                                <span id="TPAISNACIONALIDAD_span"><b>${__formdata.TPAIS}</b></span>
                                </c:when>
                                <c:otherwise>
                                <input type="text" readonly class="campowidthinput campo campotexto" size="15" maxlength="3" value="${__formdata.CPAIS}" name="CNACIONALIDAD" id="CNACIONALIDAD" onchange="f_onchange_CNACIONALIDAD()" style="width:18%;" />                                
                                 <span id="TPAISNACIONALIDAD_span"><b>${__formdata.TPAIS}</b></span>
                                
                                </c:otherwise>
                                </c:choose>

                                </td>
                                 <td class="campocaja">
                                <b><axis:alt f="axisper013" c="CDEFECTO" lit="100713"/></b>
                                <input onClick="javascript:actualitzarCheckbox(this)" <c:if test="${__formdata.CDEFECTO == 1}">checked="true"</c:if> 
                                type="checkbox" id="CDEFECTO" name="CDEFECTO" value="${__formdata.CDEFECTO}"/>
                            </td>
                            </tr>
                        </table>
                        </c:if>
                        
                    
                    </td>
                </tr>
            </table>			
            
            <div class="separador">&nbsp;</div>
            <div class="separador">&nbsp;</div>
            <div class="separador">&nbsp;</div>
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisper013</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form>

        
        <c:import url="../include/mensajes.jsp" />
      </div>
    </body>
</html>

