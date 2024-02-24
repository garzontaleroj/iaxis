<%
/**
*  Fichero: axisdesc004.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*  Fecha: 12/07/2010
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
        
        f_cargar_propiedades_pantalla();
        
        //alert("Antes de cargar dependencias");
        f_carga_dependencias();
            
            //document.miForm.NPOLIZA.focus();
            // Retocar tabla en IE
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";

        }
        
        function f_but_cancelar() {
            parent.f_aceptar_axisdesc004();
        }        
        
        function f_but_buscar() {
          if (objValidador.validaEntrada()) objUtiles.ejecutarFormulario("modal_axisdesc004.do", "buscar", document.miForm, "_self", objJsMessages.jslit_buscando_polizas);
            
        }
         
        function f_but_aceptar (cual) {
          
                parent.f_aceptar_axisdesc004(SSEGURO);
            
         }

         function f_cargar_descuentos(){
                    CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
                     if (!objUtiles.estaVacio (CRAMO) ){
                    objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                    objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                    }else
                    objDom.setValorComponente(document.miForm.CRAMO, null);
                    objAjax.invokeAsyncCGI("modal_axisdesc004.do", callbackAjaxCargarDescuentos, "operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO) + 
                        "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo=1"+document.miForm.tipo.value, this, objJsMessages.jslit_cargando);
        }      

            function callbackAjaxCargarDescuentos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    
                    var SPRODUCCombo = document.miForm.SPRODUC;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisdesc004" c="SPRODUCCombo" lit="108341"/> - ', SPRODUCCombo, 0);
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
                    objLista.borrarFilasDeLista ("miListaId", "5", "<axis:alt f='axisdesc004' c='miListaId' lit='1000254' />");
                    var spanners = document.getElementsByTagName("span");
                    for(var i=0;i<spanners.length;i++) {
                        if (spanners[i].className == "gridpagebanner")
                            spanners[i].innerHTML = "";
                        if (spanners[i].className == "gridpagelinks")
                            spanners[i].innerHTML = ""; 
                    }
               } catch(e){alert(e);}
            }
            
            
       function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
        
        function f_abrir_axisdesc007(CDESC,FINIVIG,FFINVIG){
        //alert("kk");
        //alert("FINIVIG"+FINIVIG);
        //FINIVIG
        //FFNIVIG        objUtiles.abrirModal("axisdesc003", "src", "modal_axisdesc003.do?operation=init&CDESC="+CDESC+"&CMODO="+CMODO); 
            objUtiles.abrirModal("axisdesc007", "src", "modal_axisdesc007" +  ".do?operation=form&CDESC="+CDESC+"&FINIVIG="+FINIVIG+"&FFINVIG="+FFINVIG);    
        }
        
        function f_aceptar_axisdesc007() {
            f_cerrar_modal('axisdesc007');
        }
        
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }  
         
            
    </script>
  </head>
    <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisdesc007|<axis:alt f="axisdesc004" c="nid_y_titulo" lit="9903508"/></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="tipo" name="tipo" value="1"/>
            <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
            <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisdesc004" c="formulario" lit="9903505" /></c:param>
                <c:param name="producto"><axis:alt f="axisdesc004" c="producto" lit="9903505"/></c:param>
                <c:param name="form">axisdesc004</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        
                        <table class="seccion" id="LISTA">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                                
                                <td class="titulocaja">
                                    <b><axis:alt f="axisdesc004" c="codigo" lit="109155" /></b><!-- Código -->
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisdesc004" c="descripcion" lit="100588" /></b><!-- Descripción -->
                                </td>
                               
                                <td class="titulocaja">
                                    
                                </td>
                            </tr>
                            <tr>
                                 <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" title="<axis:alt f="axisdesc004" c="CODIGO" lit="109155"/>" size="15" value="${__formdata['CDESC']}" readonly name="CODIGO" id="CODIGO"/>
                                </td>
                                <td class="campocaja">
                                    <input type="text" title="<axis:alt f="axisdesc004" c="TCOMISI" lit="100588"/>" class="campowidthinput campo campotexto" value="${__formdata['TDESC']}" readonly name="TDESC" id="TDESC" size="15"/>
                                </td>
                                
                                <td class="titulocaja">
                                </td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>
                            <!-- DisplayTag Pólizas -->
                            <c:set var="title1"><axis:alt f="axisdesc004" c="titulo1" lit="9000526"/></c:set><!-- Fecha inicio -->
                            <c:set var="title2"><axis:alt f="axisdesc004" c="titulo2" lit="9000527"/></c:set><!-- Fecha fin -->
                            <c:set var="title3"><axis:alt f="axisdesc004" c="titulo3" lit="101510"/></c:set><!-- Estado -->
                            <c:set var="title4"><axis:alt f="axisdesc004" c="titulo4" lit="1000113"/></c:set><!-- Detalle -->
                            <div class="seccion displayspaceGrande">
                                <display:table name="${sessionScope.axisctr_listaDescuentos}" id="LISTA2" export="false" class="dsptgtable" pagesize="8" defaultsort="1" defaultorder="ascending" requestURI="modal_axisdesc004.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <%--display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                        <div class="dspIcons"><input <c:if test="${LISTA2['checkedPoliza']}">checked</c:if> type="radio" id="checked_poliza" name="checked_poliza" value="${LISTA2['SSEGURO']}"/></div>
                                    </display:column--%>
                                    <display:column title="${title1}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable"  media="html" autolink="false" >    
                                        <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${LISTA2.OB_IAX_CUADRODESCUENTO.FINIVIG}"/></div>
                                    </display:column>
                                    <display:column title="${title2}" sortable="true" sortProperty="NOMBRE" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${LISTA2.OB_IAX_CUADRODESCUENTO.FFINVIG}"/></div>
                                    </display:column>
                                    <display:column title="${title3}" sortable="true" sortProperty="ESTADO" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">${LISTA2.OB_IAX_CUADRODESCUENTO.TESTADO}</div>
                                    </display:column>
                                    <display:column title="${title4}" sortable="true" sortProperty="DESPRODUCTO" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspIcons"><img border="0" alt="${title9}" title1="${title9}" src="images/mas.gif" width="11px" height="11px"
                                                 style="cursor:pointer;" onclick="javascript:f_abrir_axisdesc007('${LISTA2.OB_IAX_CUADRODESCUENTO.CDESC}','<fmt:formatDate pattern="dd/MM/yyyy" value="${LISTA2.OB_IAX_CUADRODESCUENTO.FINIVIG}"/>','<fmt:formatDate pattern="dd/MM/yyyy" value="${LISTA2.OB_IAX_CUADRODESCUENTO.FFINVIG}"/>')"/></div>
                                    </display:column>
                                </display:table>
                                <c:choose>
                                <c:when test="${!empty sessionScope.axisctr_listaPolizas}">
                                    <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                        <script language="javascript">objUtiles.retocarDsptagtable("miListaId");</script>
                                    </c:if>
                                </c:when>
                                <c:otherwise>
                                    <script language="javascript">
                                       //objLista.esconderListaSpans();
                                       //objLista.esconderListaLinks();     
                                    </script>
                                </c:otherwise>
                                </c:choose>
                            </div>
                    </td>
                </tr>
                
            </table>
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisdesc004</c:param><c:param name="f">axisdesc004</c:param>
                <c:param name="__botones">cancelar</c:param>
            </c:import>
     </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>

