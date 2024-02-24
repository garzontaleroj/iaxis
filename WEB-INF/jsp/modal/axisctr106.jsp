<%
/**
*  Fichero: axisctr106.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Jaume Garcia</a>
*  Fecha: 19/01/2010
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />
    
    
    <script language="Javascript" type="text/javascript">
    
        function f_onload() {
            revisarEstilos();
            
            document.miForm.NPOLIZA.focus();
            // Retocar tabla en IE
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
            f_cargar_propiedades_pantalla();
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axisctr106();
        }        
        
        function f_but_buscar() {
            objUtiles.ejecutarFormulario("modal_axisctr106.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
         
        function f_but_aceptar (p1,p2,p3) {
        
            var CCODDGS = "";
            var CTIPBAN = "";
            var CBANCAR = "";
            
            if (!objUtiles.estaVacio(p1)) {
                // Seleccionada por el hipervínculo
                CCODDGS = p1;
                CTIPBAN = p2;
                CBANCAR = p3;
                }
            else 
               {
               if (!objUtiles.estaVacio(document.miForm.checked_cia)) {
                // Checkeada por el radio button
                CCODDGS = objUtiles.f_GuardaCasillasChecked("checked_cia");
                } 
            }
                if (typeof CCODDGS == 'boolean' || objUtiles.estaVacio (CCODDGS))  alert(objJsMessages.jslit_seleccionar);
               else parent.f_aceptar_axisctr106(CCODDGS,CTIPBAN,CBANCAR);   
        }

            function f_cargar_productos(){
                    CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
                     if (!objUtiles.estaVacio (CRAMO) ){
                    objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                    objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                    }else
                    objDom.setValorComponente(document.miForm.CRAMO, null);
                    objAjax.invokeAsyncCGI("modal_axisctr106.do", callbackAjaxCargarProductos, "operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO) + 
                        "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value, this, objJsMessages.jslit_cargando);
            }      

            function callbackAjaxCargarProductos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    
                    var SPRODUCCombo = document.miForm.SPRODUC;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr106" c="SPRODUC" lit="108341"/> - ', SPRODUCCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                        }
                   amagarDisplay();

                }
            }            

            function amagarDisplay(){
                try{
                    var tbodyadded = objLista.obtenerBodyLista("miListaId");
                    var tradded = objLista.obtenerFilasBodyLista("miListaId", tbodyadded);
                    objLista.borrarFilasDeLista ("miListaId", "5", "<axis:alt f="axisctr106" c="miListaId" lit="1000254"/>");
                    var spanners = document.getElementsByTagName("span");
                    for(var i=0;i<spanners.length;i++) {
                        if (spanners[i].className == "gridpagebanner")
                            spanners[i].innerHTML = "";
                        if (spanners[i].className == "gridpagelinks")
                            spanners[i].innerHTML = ""; 
                    }
               } catch(e){alert(e);}
            }
    </script>
  </head>
    <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
            <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
            <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisctr106" c="formulario" lit="9900956"/></c:param>
                <c:param name="producto"><axis:alt f="axisctr106" c="producto" lit="9900956"/></c:param>
                <c:param name="form">axisctr106</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <table class="seccion">
                            <tr>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:40%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr106" c="CODDGS" lit="1000109"></axis:alt> </b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr106" c="miListaId" lit="100588"/></b>
                                </td>

                            </tr>
                            <tr>
                                 <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata['CODDGS']}" name="CODDGS" id="CODDGS"/>
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata['NOMBRE']}" name="NOMBRE" id="NOMBRE" size="15"/>
                                </td>

                            </tr>
                        </table>
                        
                        
                        <div class="separador">&nbsp;</div>
                            <!-- DisplayTag Aseguradoras -->
                            <c:set var="title1"><axis:alt f="axisctr106" c="title1" lit="1000109"/></c:set>
                            <c:set var="title2"><axis:alt f="axisctr106" c="title2" lit="105940"/></c:set>

                            
                            <div class="seccion displayspaceGrande">
                                <display:table name="${sessionScope.axisctr_listaAegura}" id="miListaId" export="false" class="dsptgtable" pagesize="8" defaultsort="1" defaultorder="ascending" requestURI="modal_axisctr106.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                        <div class="dspIcons"><input type="radio" id="checked_cia" name="checked_cia" value="${miListaId.OB_IAX_ASEGURADORAS.CODDGS}"/></div>
                                    </display:column>                                    
                                    <display:column title="${title1}" sortable="true" sortProperty="CODDGS" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">${miListaId.OB_IAX_ASEGURADORAS.CODDGS}</div>
                                    </display:column>    
                                    <display:column title="${title2}" sortable="true" sortProperty="DESCRIPCIO" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId.OB_IAX_ASEGURADORAS.CODDGS}','${miListaId.OB_IAX_ASEGURADORAS.CTIPBAN}','${miListaId.OB_IAX_ASEGURADORAS.CBANCAR}')">${miListaId.OB_IAX_ASEGURADORAS.DESCRIPCIO}</div>
                                    </display:column>                                    

                                </display:table>
                                <c:choose>
                                <c:when test="${!empty sessionScope.axisctr_listaAegura}">
                                    <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                        <script language="javascript">objUtiles.retocarDsptagtable("miListaId");</script>
                                    </c:if>
                                </c:when>
                                <c:otherwise>
                                    <script language="javascript">
                                       objLista.esconderListaSpans();
                                       objLista.esconderListaLinks();     
                                    </script>
                                </c:otherwise>
                                </c:choose>
                            </div>
                    </td>
                </tr>
            </table>
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisctr106</c:param>
                <c:param name="__botones">cancelar,buscar,aceptar</c:param>
            </c:import>
     </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>

