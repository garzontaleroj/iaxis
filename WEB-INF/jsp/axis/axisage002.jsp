<%--
Pantalla de Red comercial
--%>

<%@ page contentType="text/html;charset=iso-8859-15" import="java.util.*,org.apache.commons.lang.StringUtils,axis.util.*,java.math.*"%>
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
    <title><axis:alt f="axisage002" c="NOMBREPANTALLA" lit="100905"/></title> <%-- CONSULTA DE RECIBOS --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="Stylesheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp"/>
    
    <style type="text/css">
        .displayspaceMaximo {
            width:99.8%;
            height: expression( this.scrollHeight > 349 ? "350px" : "auto" );
            max-height:350px;
            overflow-x: hidden;
            overflow-y: auto;
            border: 1px solid #DDDDDD;
        }
    </style>
    
    <script type="text/javascript" src="scripts/jsTree.js"></script>    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {                          
            revisarEstilos();            
            var hayDatos = ${!empty sessionScope.RED_ARBOL};
            if (!hayDatos) 
                // Abrir modal buscador
                f_abrir_modal("axisage001", true);
            else {
                var CAGENTE2Reload = "${requestScope.CAGENTE2Reload}";
                if (!objUtiles.estaVacio(CAGENTE2Reload))
                    // Recargar detalle agente, si venimos de otro flujo
                    f_ver_detalle(CAGENTE2Reload);                
            }
            f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
                
        }
        
        function f_but_salir() {
            // Borrar parámetros de session en servidor
            objAjax.invokeAsyncCGI("axis_axisage002.do", callbackSalir, "operation=salir", this);
        }
        
        function callbackSalir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisage002", "cancelar", document.miForm, "_self");
        }
        
        function f_but_buscar() {
            f_abrir_modal('axisage001', true);
        }
        
        function f_but_editar(CAGENTE) {
            objUtiles.ejecutarFormulario ("axis_axisage002.do?isEdit=true&CAGENTE=" + CAGENTE, "editar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
         
       
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_abrir_modal(cual, noXButton, optionalQueryString, optionalWidth, optionalHeight) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString, optionalWidth, optionalHeight);        
        }
     
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_aceptar_modal(cual) {
            f_cerrar_modal(cual);
            if (cual == 'axisage001')
                objUtiles.ejecutarFormulario("axis_axisage002.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);            
        }
        
        function f_axisage001_nuevo() {
            f_cerrar_modal("axisage001");
            objUtiles.ejecutarFormulario("axis_axisage002.do", "editar", document.miForm, "_self", objJsMessages.jslit_cargando);            
        }
        
        
        function f_ver_detalle(CAGENTE) {
            if (CAGENTE != 1) {
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", objJsMessages.jslit_cargando, "inline");
                document.miForm2.CAGENTE.value = CAGENTE;
                document.miForm2.submit();
            }
        }
        
        function f_iframe_cargado(){
            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
        }
        
        
        /****************************************************************************************/
        /*********************************** CARGA ÁRBOL ****************************************/
        /****************************************************************************************/
<%--
Si el numero de nodos es inferior a valorMaximoParaDibujarUnArbolDinamico, intentamos pintarlo mediante Javascript / jsTree
Si el numero es igual o mayor, lo pintamos con con una lista ul/li sin efectos especiales, y un aviso que no se puede pintarlo bonito
--%>
<%

/*
ecg20121130 http://mantis.srvcsi.com/view.php?id=24847#c131282
Si resulta que tenemos referencias a PADRES que no existen, lo forzamos a NULO..
*/
{
  ArrayList lista=(ArrayList)session.getAttribute("RED_ARBOL");
  if (lista!=null) {
    ArrayList lista2=new ArrayList();
    HashMap m=null;
    HashMap m2=null;
    boolean padreLocalizado=false;
    for (int i=0; i<lista.size(); i++) {
    	m=(HashMap)lista.get(i);
    	if (m.get("CPADRE")!=null) {
    		//ver si existe su padre...
    		padreLocalizado=false;
        for (int j=0; j<lista.size(); j++) {
        	m2=(HashMap)lista.get(j);
        	if (m2.get("CODIGO").equals(m.get("CPADRE"))) {
        		//existe, asi que bien , salgo de este y sigo con el siente
        		padreLocalizado=true;
        		break;
        	}
        }
        if (!padreLocalizado) {	//huerfano.. le voy a forzar un padre a null
        	m.put("CPADRE", null);
        }
    	}
    }
  }
}

ArbolNT h=null;
String jqueryTreeviewString=null;
String ssss="";        
%>
        <c:set var="valorMaximoParaDibujarUnArbolDinamico" value="350" />
        <c:if test="${!empty sessionScope.RED_ARBOL}">
        <c:if test="${fn:length(sessionScope.RED_ARBOL)<valorMaximoParaDibujarUnArbolDinamico}">
            var Tree = new Array;
            var Agentes = "<axis:alt f="axisage002" c="AGENTES" lit="101024"/>";
            // nodeId | parentNodeId | nodeName | nodeUrl
            /* 
            Tree[0]  = "1|0|" + Agentes + "|#|A";        
            Tree[1]	 = "2|1|agente 1.1|javascript:abrir()|A";
            Tree[2]  = "3|1|agente 1.3|#|A";
            Tree[3]  = "4|3|agente 1.2.1|#|C";
            Tree[4]  = "5|1|agente 1.1.1|#|A";
            */
            <c:set var="dummyValue">${sessionScope.RED_DummyCodeAgent}</c:set>
            <c:forEach var="agente" items="${sessionScope.RED_ARBOL}" varStatus="i"><c:set var="codigo">
                    <%-- Si CODIGO = 1, ponemos -999 para no liarla con el padre de todos --%>
                    <%-- Si CODIGO -999, es el padre de todos, ponemos 1 --%>
                    ${fn:trim(agente.CODIGO) == 1 ? dummyValue : (fn:trim(agente.CODIGO) == dummyValue ? 1 : fn:trim(agente.CODIGO))}
                </c:set><c:set var="cpadre">
                  <%-- Si CPADREFIT = 1, ponemos -999 para no liarla con el padre de todos --%>
                  <%-- Si CPADREFIT -999, es el padre de todos, ponemos 1 --%>
                  <%--${fn:trim(agente.CPADREFIT) == 1 ? dummyValue : (fn:trim(agente.CPADREFIT) == dummyValue ? 1 : (fn:trim(agente.CPADREFIT) == 998 ? 1 : fn:trim(agente.CPADREFIT))  )}--%>
                  ${fn:trim(agente.CPADREFIT) == 1 ? dummyValue : (fn:trim(agente.CPADREFIT) == dummyValue ? 1 : (fn:trim(agente.CPADREFIT) == -998 ? 1 : fn:trim(agente.CPADREFIT))  )}
                </c:set>
                Tree[${i.count - 1}] = "${codigo}|${empty cpadre ? 0 : cpadre}|${fn:trim(agente['TNOMBRE'])}|javascript:f_ver_detalle(${codigo})|A";
            </c:forEach>
        </c:if>
        <c:if test="${fn:length(sessionScope.RED_ARBOL)>=valorMaximoParaDibujarUnArbolDinamico}">
<%
        //ecg20120124 adaptacion de para jquerytreeview
        //mas detalles que signifca todo eso tienes en
        //ArbolNTUtil.main_treeview

        ArrayList lista=(ArrayList)session.getAttribute("RED_ARBOL");
        ArrayList lista2=new ArrayList();
        HashMap m=null;
try {
        for (int i=0; i<lista.size(); i++) {
            m=(HashMap)lista.get(i);

            m.put("ID", new BigDecimal(m.get("CODIGO").toString()));
            
            if (m.get("CPADRE")!=null) {
                m.put("PADREID", new BigDecimal(m.get("CPADRE").toString()));
            }
            else {
                m.put("PADREID", null);
            }
            m.put("LITERAL",m.get("TNOMBRE"));
            m.put("FORM","javascript:f_ver_detalle('"+m.get("CODIGO").toString()+"')");
            m.put("CMODO",null);
            lista2.add(m);
        }

        ArbolNTUtil.preprocesarConIdsSinNiveles(lista2); // te pone IDs y PADREIDs

        h=new ArbolNT(lista2, null, null, 999, true);
        
        jqueryTreeviewString=h.toJqueryTreeviewString();
        jqueryTreeviewString=StringUtils.replace(jqueryTreeviewString,"<ul>","<ul id=\"example\">",1);
        
        //pasamos un texto aviso para que quede claro que cambia el aspecto
        
				axis.mvc.control.AbstractDispatchAction.guardarMensaje(request, "9903209", new Object[] {}, axis.util.Constantes.MENSAJE_INFO);        
}
catch(Exception e) {
				axis.mvc.control.AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString()}, axis.util.Constantes.MENSAJE_ERROR);        
}
%>
        
        </c:if>
        </c:if>
        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt f="axisage002" c="TTITAXISAGE002" lit="9000520"/></c:param>     <%-- Red comercial --%>
        <c:param name="formulario"><axis:alt f="axisage002" c="FTITAXISAGE002" lit="9000520"/></c:param> <%-- Red comercial --%>
        <c:param name="form">axisage002</c:param>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisage001|<axis:alt f="axisage002" c="TTITAXISAGE001" lit="9000517"/><%-- Búsqueda Red Comercial --%></c:param>
    </c:import>
    
    <table class="mainTableDimensions base" align="center">          
        <tr>
            <th style="width:35%;height:0px"></th>
            <th style="width:65%;height:0px"></th>
        </tr>
        <tr>
            <form name="miForm" action="" method="POST">         
                <input type="hidden" name="operation" value=""/>
                <td>
                    <div class="titulo">
                        <img src="images/flecha.gif"/><axis:alt f="axisage002" c="TREDCOMERCIAL" lit="9000520"/> <%-- Red Comercial --%>
                        <img border="0" src="images/find.gif" onclick="f_but_buscar()" style="cursor:pointer" alt="<axis:alt f="axisage002" c="BUT_BUSCAR" lit="9000508"/>" title="<axis:alt f="axisage002" c="BUT_BUSCAR" lit="9000508"/>"/>
                    </div>
                    <div class="seccion" style="overflow-y:auto;height:550px;">
                        <c:if test="${!empty sessionScope.RED_ARBOL}">
<c:if test="${fn:length(sessionScope.RED_ARBOL)<valorMaximoParaDibujarUnArbolDinamico}">
                            <script type="text/javascript">
                                var objTree = new JsTree();                                    
                                objTree.createTree(Tree, 1, true);                                    
                            </script>
</c:if>
<c:if test="${fn:length(sessionScope.RED_ARBOL)>=valorMaximoParaDibujarUnArbolDinamico}">
<STYLE type="text/css">
	ul {list-style-type:none;}
	li {list-style-type:none;list-style-image:url('images/formulap.gif');}
</STYLE>
<%=jqueryTreeviewString%>
</c:if>
                            
                        </c:if>
                    </div>
                </td>
            </form>
            <td>
                <!-- Formulario interno  -->
                <div class="titulo">
                <img src="images/flecha.gif"/><axis:alt f="axisage002" c="TDATOSAGENTE" lit="9000521"/> <%-- Datos Agente --%>
                    <img id="find" style="height:16px;border:0px;" src="images/empty.gif"/>
                </div>
                <div class="seccion" style="width:100%;height:550px;">                        
                    <iframe id="formulario_seccion" name="formulario_seccion" style="width:100%;height:100%;" src="axis_axisage002.do?operation=cargarDetalleAgente" scrolling="auto" frameborder="0"></iframe>
                </div>
           </td>
        </tr>
    </table>
    
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisage002</c:param>
        <c:param name="__botones">salir</c:param> 
    </c:import>
    
    <c:import url="../include/mensajes.jsp"/>

<form name="miForm2" target="formulario_seccion"  method="POST" action="axis_axisage002.do">
    <input type="hidden" name="operation" id="operation" value="cargarDetalleAgente"/>
    <input type="hidden" name="CAGENTE" id="CAGENTE" value=""/>
</form>

</body>
</html>