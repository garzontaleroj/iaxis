<%/**
*  Fichero: axisadm007.jsp
*  Simulación Contable
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo Flores</a>  
*  Fecha: 09/09/2008
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
        <title><axis:alt c="form" f="axisadm007" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
                f_cargar_propiedades_pantalla();        
            }
            
             function f_but_1000439() {
                
                objUtiles.ejecutarFormulario ("modal_axisadm007.do", "consultar", document.miForm, "_self", objJsMessages.jslit_cargando);
            } 

          function f_but_108525(){
          
                
                
                    var CFICHERO = objDom.getValorPorId("CFITXER");
                    var SPARAMETROS = "${__formdata.CCUENTA_INTERNO}" + '|' + 
                                      "${__formdata.CONCEPTO}" +
                                      objUtiles.replaceAll("${__formdata.FASIENT__joined}", "/", "") + 
                                      "${__formdata.CEMPRES}" + '|' + 
                                      "${__formdata.TIPO_LISTADO}" + '|' +
                                      "${__formdata.NMESES}" + '|' +
                                      "${__formdata.NASIENT}" + '|' +
                                      "${__formdata.NLINEA}";
;
                    //Conte|tipus|Data|Empresa|Cuadre(1)_o_Historic(0) - 3500|1|31122008|1|1 
                    //alert("modal_axisadm007.do?CMAP=317&CPARAMETROS=" + SPARAMETROS);
                    
                                objAjax.invokeAsyncCGI("modal_axisadm007.do?CMAP=317&CPARAMETROS=" + SPARAMETROS
                                                , callbackAjaxGenerarResultado_map, "operation=ajax_generar_resultados_map", this, objJsMessages.jslit_cargando);
                
            // objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+pfitxer);
            }              
            /* ************************************************************************************** */
            /* ****************************** CALLBACKS AJAX **************************************** */
            /* ************************************************************************************** */    

            function callbackAjaxGenerarResultado_map (ajaxResponseText) {
                                     
                 objDom.setValorPorId("SORTIDA", "");   
                 objDom.setValorPorId("CXML", "");  
                                

                
                
                var doc = objAjax.domParse(ajaxResponseText);

                
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var fichero = objUtiles.hayValorElementoXml(doc.getElementsByTagName("RETURN")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0) : "";               
                    var resultado = objUtiles.hayValorElementoXml(doc.getElementsByTagName("VALOR")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALOR"), 0, 0) : "-1";
                    
                    if(objUtiles.utilEquals(fichero, "-0.csv")){
                        alert("<axis:alt c="aler_fich" f="axisadm007" lit='9000620' />");
                        document.miForm.CFICHERO.focus();
                    }else{
                        //Lo imprimo por axisimprimir
                              //objDom.setValorPorId("SORTIDA", fichero); 
                              objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+fichero);
                         }
                   }                
            }        

/* ***************** */          

            function f_but_cancelar() {
                //objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm007", "cancelar", document.miForm, "_self");
                parent.f_cerrar_axisadm007();
            }
              
            // TODO Implementar CallBack Ajax

            /*******************************************************************************************/
            /************************************** AJAX ***********************************************/
            /*******************************************************************************************/
            
            /****************************************************************************************/
            /*********************************** CALLBACK AJAX **************************************/
            /****************************************************************************************/
        
            
        </script>
    </head>
    <body  onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
            <input type="hidden" name="tipo_listado" value="${__formdata.tipo_listado}"/> 
            <input type="hidden" name="CCUENTA_i" value="${__formdata.CCUENTA}"/> 
            <input type="hidden" name="CPAIS" value="${__formdata.CPAIS}"/> 
            
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt c="titulo" f="axisadm007" lit="151440" /></c:param>
                <c:param name="formulario"><axis:alt c="form" f="axisadm007" lit="151440" /></c:param>
                <c:param name="form">axisadm007</c:param>
            </c:import>
        
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisimprimir|<axis:alt c="tit_imp" f="axisadm007" lit="1000205" />|true</c:param>
            </c:import>              
            <!-- Área de campos  -->
            <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                        <img src="images/flecha.gif"/><axis:alt c="flecha" f="axisadm007" lit="103593"/>
                         </div>
                        <!-- Sección 1 -->
                        <table class="seccion">
                            <tr>
                                <td >
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <tr>
                                            <th style="width:30%;height:0px"></th>
                                            <th style="width:19%;height:0px"></th>
                                            <th style="width:30%;height:0px"></th>
                                            <th style="width:5%;height:0px"></th>
                                            <th style="width:8%;height:0px"></th>
                                            <th style="width:8%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja" ><b><axis:alt c="CEMPRES" f="axisadm007" lit="101619"/></b></td><!--Empresa -->
                                            <td class="titulocaja" ><c:if test="${ __formdata.NASIENT != null &&__formdata.NASIENT!=''}"><b><axis:alt c="NASIENT" f="axisadm007" lit="9000567"/></b></c:if></td><!--Asiento -->
                                            <td class="titulocaja" ><b><axis:alt c="NASIENTO" f="axisadm007" lit="1000092"/></b></td><!--Cuenta -->
                                            <td class="titulocaja" ><b><axis:alt c="CCUENTA" f="axisadm007" lit="9000499"/>/<axis:alt c="CCUENTA" f="axisadm007" lit="9000500"/></b></td><!--Debe/Haber -->
                                            <td class="titulocaja" ><b><axis:alt c="TIPO" f="axisadm007" lit="100816"/></b></td><!--no meses-->
                                            <td class="titulocaja" ><b><axis:alt c="NMESES" f="axisadm007" lit="1000575"/></b></td><!--no meses-->
                                            
                                        </tr>
                                        <tr>
                                            <td class="campocaja">                                           
                                            <axis:visible f="axisadm004" c="axisadm_listaEmpresas"> 
                                            
                                                <select name = "CEMPRES" id="CEMPRES" style="width:99%;" size="1" onchange="" class="campowidthselect campo campotexto_ob" <axis:atr f="axisadm007" c="CEMPRES" a="modificable=false&isInputText=false"/>>
                                                <option value = "-1"> - <axis:alt c="CEMPRES" f="axisadm007" lit="1000348"/> - </option>
                                                <c:forEach var="empresa" items="${sessionScope.axisadm_listaEmpresas}">
                                                    <option value = "${empresa.CEMPRES}" <c:if test="${empresa.CEMPRES == __formdata.CEMPRES}">selected</c:if>>
                                                        ${empresa.TEMPRES}
                                                    </option>
                                                </c:forEach>
                                                </select>
                                            
                                            </axis:visible>
                                            </td>
                                            <td class="campocaja">
                                            <axis:visible f="axisadm004" c="NASIENTO"> 
                                                <c:if test="${__formdata.NASIENT!=null&&__formdata.NASIENT!=''}">
                                                <input type="text"  class="campowidth campo campotexto" id="NASIENTO" name="NASIENTO" size="15"
                                                value="${__formdata.NASIENT}" <axis:atr f="axisadm007" c="NASIENTO" a="modificable=false"/> />  
                                                </c:if>
                                            </axis:visible>
                                            </td>
                                            <td class="campocaja">
                                            <axis:visible f="axisadm004" c="CCUENTA"> 
                                            
                                                <select name = "CCUENTA" id="CCUENTA" style="width:99%;" size="1" onchange="" class="campowidthselect campo campotexto_ob" <axis:atr f="axisadm007" c="CCUENTA" a="modificable=false&isInputText=false"/>  >
                                                <option value = "-1"> - <axis:alt c="CCUENTA" f="axisadm007" lit="1000348"/> - </option>
                                                <c:forEach var="cuenta" items="${sessionScope.axisadm_listaCuentas}">
                                                    <option value = "${cuenta.CCUENTA}" <c:if test="${cuenta.CCUENTA == __formdata.CCUENTA_INTERNO}" >selected</c:if> >
                                                        ${cuenta.TCUENTA} <!--F_LITERA -->
                                                    </option>
                                                </c:forEach>
                                                </select>
                                            
                                            </axis:visible>
                                            </td>
                                            <td class="campocaja">
                                            <axis:visible f="axisadm004" c="TIPO"> 
                                               <select name = "CONCEPTO" id="CONCEPTO" style="width:99%" size="1" onchange="" class="campowidthselect campo campotexto_ob" <axis:atr f="axisadm007" c="CONCEPTO" a="modificable=false&isInputText=false"/>  >
                                                <option value = "-1"> - <axis:alt c="TIPO" f="axisadm007" lit="1000348"/> - </option>
                                                <c:forEach var="dh" items="${sessionScope.axisadm_listaConceptos}">
                                                    <option value = "${dh.CATRIBU}" <c:if test="${dh.CATRIBU == __formdata.CONCEPTO}">selected</c:if>>
                                                        ${dh.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                                </select>
                                            </axis:visible>
                                            </td>
                                            <td class="campocaja">
                                            <axis:visible f="axisadm005" c="axisadm_listaPaises"> 
                                            
                                                 <input type="text"  class="campowidth campo campotexto" id="PAIS" name="PAIS" size="15" <axis:atr f="axisadm007" c="PAIS" a="modificable=false"/>
                                                 value="${__formdata.LITPAIS}" />
                                            </axis:visible>
                                            </td>
                                            <td class="campocaja">
                                            <input type="text"  class="campowidth campo campotexto" id="FASIENT" name="FASIENT" size="15" <axis:atr f="axisadm007" c="FASIENT" a="modificable=false"/>
                                            value="<fmt:formatDate value='${__formdata.FASIENT}' pattern='dd/MM/yyyy'/>" />
                                            </td>
                                        </tr>
                                   
                                        <!-- Inicio Lista -->
                                        
                                        <tr>
                                                <td colspan="6">
                                                <table class="area" align="center"> 
                                                <tr>
                                                    <td>
                                                    <c:set var="title0"><axis:alt c="SPRODUC" f="axisadm007" lit="100829"/></c:set><!--Producto -->
                                                    <c:set var="title1"><axis:alt c="NPOLIZA" f="axisadm007" lit="100836"/></c:set><!--Póliza -->
                                                    <c:set var="title2"><axis:alt c="NRECIBO" f="axisadm007" lit="100895"/></c:set><!--Recibo -->
                                                    <c:set var="title3"><axis:alt c="FEFECTO" f="axisadm007" lit="100883"/></c:set><!--F. Efecto -->
                                                    <c:set var="title4"><axis:alt c="FEMISION" f="axisadm007" lit="1000562"/></c:set><!-- F. Emision -->
                                                    <c:set var="title5"><axis:alt c="FESTADO" f="axisadm007" lit="9000450"/></c:set><!-- F. Estado -->
                                                    <c:set var="title6"><axis:alt c="PRIMA_TARIFA" f="axisadm007" lit="100563"/></c:set><!-- Importe -->
                                                    <c:set var="productoId">${sessionScope.axisctr_producto.SPRODUC}</c:set>
                                                    <div class="separador">&nbsp;</div>
                                                    <div class="displayspaceProductos">
                                                        <display:table name="${sessionScope.axisadm_listaApuntes}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                         requestURI="modal_axisadm007.do?paginar=true">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column title="${title0}" sortable="true" sortProperty="SPRODUC" headerClass="sortable fixed"  media="html" autolink="false" >
                                                            <div class="dspText">${miListaId.SPRODUC}</div>
                                                        </display:column>
                                                        <display:column title="${title1}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable fixed"  media="html" autolink="false" >
                                                            <div class="dspText">${miListaId.NPOLIZA}</div>
                                                        </display:column>
                                                        <display:column title="${title2}" sortable="true" sortProperty="NRECIBO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                            <div class="dspText">${miListaId.NRECIBO}</div>
                                                        </display:column>
                                                        <display:column title="${title3}" sortable="true" sortProperty="FEFECTO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                            <div class="dspText"><fmt:formatDate value='${miListaId.FEFECTO}' pattern='dd/MM/yyyy'/></div>
                                                        </display:column>
                                                        <display:column title="${title4}" sortable="true" sortProperty="FEMISION" headerClass="sortable fixed"  media="html" autolink="false" >
                                                            <div class="dspText"><fmt:formatDate value='${miListaId.FEMISION}' pattern='dd/MM/yyyy'/></div>
                                                        </display:column>
                                                        <display:column title="${title5}" sortable="true" sortProperty="FESTADO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                            <div class="dspText"><fmt:formatDate value='${miListaId.FESTADO}' pattern='dd/MM/yyyy'/></div>
                                                        </display:column>
                                                        <display:column title="${title6}" sortable="true" sortProperty="PRIMA_TARIFA" headerClass="sortable fixed"  media="html" autolink="false" >
                                                            <div class="dspText"><fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${miListaId.IMPORTE}'/></div>
                                                        </display:column>
                                                        </display:table>
                                                    </div>
                                                    <div class="separador">&nbsp;</div>
                                                    </td>
                                                    </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        
                                        <!-- Fin lista    -->
                                        
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>
                        
             <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp">
             <c:param name="f">axisadm007</c:param>        
            <c:param name="__botones">cancelar,108525</c:param>
            </c:import>
            <%--c:import url="../include/botonera_nt.jsp"><c:param name="__botones">cancelar,1000439,108525</c:param></c:import --%>
        </form>
        
        <c:import url="../include/mensajes.jsp" />
        
    </body>
</html>