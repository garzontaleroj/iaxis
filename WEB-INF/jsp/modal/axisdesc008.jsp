<%/*
*  Fichero: Axisdesc008.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a> 
*
*  Fecha: 13/07/2010
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    
    <c:import url="../include/carga_framework_js.jsp" />
     <!--********** CALENDARIO ************************* -->
  <!-- Hoja de estilo del Calendario -->
  <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
  <!-- Script principal del calendario -->
  <script type="text/javascript" src="scripts/calendar.js"></script>
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

       function f_but_cerrar() {
            parent.f_cerrar_axisdesc008();
       }
       
       
       function f_onload(){
       	
       	<c:if test="${!empty __formdata.isMantProd &&__formdata.isMantProd == 1}">
       	 	objDom.setDisabledPorId("SPRODUC","true");
            <c:if test="${empty __formdata.isFirst}">
                objDom.setValorComponente(document.axisdesc008Form.isFirst,1);
                f_but_buscar();
            </c:if>
       	</c:if>
        f_cargar_propiedades_pantalla();
       }
       
       
       function f_cargar_productos(){
                   
            CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.axisdesc008Form.ramoProducto), "/")[0];
            
            if (!objUtiles.estaVacio (CRAMO) ){
                objDom.setValorComponente(document.axisdesc008Form.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.axisdesc008Form.ramoProducto), "/")[0]);
                objDom.setValorComponente(document.axisdesc008Form.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.axisdesc008Form.ramoProducto), "/")[1]);
                
            }else
                objDom.setValorComponente(document.axisdesc008Form.CRAMO, null);
               
            objAjax.invokeAsyncCGI("modal_axisdesc008.do", callbackAjaxCargarProductos, "operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.axisdesc008Form.CRAMO) + 
                        "&TRAMO=" + objDom.getValorComponente(document.axisdesc008Form.TRAMO)+"&tipo="+document.axisdesc008Form.tipo.value, this, objJsMessages.jslit_cargando);
       }
            
       function callbackAjaxCargarProductos (ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("SPRODUC");
                var SPRODUCCombo = document.axisdesc008Form.SPRODUC;     
                objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisdesc008" c="SELECCIONAME" lit="108341"/> - ', SPRODUCCombo, 0);
                for (i = 0; i < elementos.length; i++) {
                    var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                    var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                    objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                }
            }
       }      
       
       function f_abrir_axisdesc006(MODO, TIPO){
         var dataInicio = document.getElementById("FINIVIG");
         if (MODO=='MODIFICAR'){
            dataInicio.setAttribute("obligatorio",true);
         }else{
            dataInicio.setAttribute("obligatorio",false);
         }
         if (objValidador.validaEntrada()) {
            var ok = true;
            var splitted = objUtiles.utilSplit(document.axisdesc008Form.SPRODUC.value, "/");
            var sproduc = splitted[0];
            var tproduc = splitted[1];
            var url = "modal_axisdesc006.do?operation=form&SPRODUC="+sproduc+"&TSPRODUC="+tproduc+"&MODO="+MODO+"&TIPO="+TIPO;
            if (MODO == 'MODIFICAR'){
                var FINIVIG=objDom.getValorPorId("FINIVIG");
                if ((!objUtiles.estaVacio(FINIVIG))&&(FINIVIG!='null')){
                    url+="&FINIVIG="+FINIVIG;
                }else{
                    ok = false;
                    objAppMensajes.pintarMensajePantalla('<axis:alt f="axisdesc006" c="FINCORRECTO" lit="50000" />', "info"); 
                }
            }
            if (ok){
                objUtiles.abrirModal("axisdesc006", "src", url);
            }
         }
       }   
      
      function f_cerrar_axisdesc006() {
             objUtiles.cerrarModal("axisdesc006");
             f_but_buscar();
       }
       
       function f_but_buscar(){
            if (objValidador.validaEntrada()) {
                var splitted = objUtiles.utilSplit(document.axisdesc008Form.SPRODUC.value, "/");
               var sproduc = splitted[0];
               var tproduc = splitted[1];
               document.axisdesc008Form.VSPRODUC.value = sproduc;
                objUtiles.ejecutarFormulario ("modal_axisdesc008.do", "buscar", document.axisdesc008Form, "_self", objJsMessages.jslit_cargando);
            }
       }
       
      
      function f_FINIVIG_onchage(fecha){
        if (objValidador.validaEntrada()) {
                var splitted = objUtiles.utilSplit(document.axisdesc008Form.SPRODUC.value, "/");
               var sproduc = splitted[0];
               var tproduc = splitted[1];
               document.axisdesc008Form.VSPRODUC.value = sproduc;
                objUtiles.ejecutarFormulario ("modal_axisdesc008.do", "buscar", document.axisdesc008Form, "_self", objJsMessages.jslit_cargando);
            }
      }
      
       function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
            if(cual=='axisdesc011') f_but_buscar();
        }  
        
        function f_abrir_axisdesc011 (sproduc,cactivi,cgarant,cdesc,cmodcom,finivig,ffinvig) {
            objUtiles.abrirModal("axisdesc011", "src", "modal_axisdesc011.do?operation=init&PSPRODUC=" + sproduc+"&PCACTIVI="+cactivi+"&PCGARANT="+cgarant+"&PCDESC="+cdesc+"&PCMODCOM="+cmodcom+"&PFINIVIG="+finivig+"&PFFINVIG="+ffinvig);
        }
        
    </script>
  </head>
    <body onload="f_onload()" class=" ">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="axisdesc008Form" action="" method="POST">
            <input type="hidden" name="operation" value="">
            <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
            <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
            <input type="hidden" id="VSPRODUC" name="VSPRODUC" value="${__formdata.VSPRODUC}"/>
            <input type="hidden" id="TPRODUC" name="TPRODUC" value="${__formdata.TPRODUC}"/>
            <input type="hidden" id="isMantProd" name="isMantProd" value="${__formdata.isMantProd}"/>
            <input type="hidden" id="isFirst" name="isFirst" value="${__formdata.isFirst}"/>
            
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisdesc008" c="TITULO_axisdesc006" lit="9903495" /></c:param>
            <c:param name="nid" value="axisdesc006" />
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisdesc008" c="NIVELES" lit="9902456" /></c:param>
            <c:param name="nid" value="axisdesc011" />
        </c:import>
        
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisdesc008" c="TIT_axisdesc008" lit="9903502" /></c:param>
                <c:param name="producto"><axis:alt f="axisdesc008" c="TIT_axisdesc008" lit="9903502" /></c:param>
                <c:param name="form">Axisdesc008</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">    
                        <tr>
                            <td align="left" >
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:30%;height:0px"></th>
                                        <th style="width:30%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="separador">&nbsp;</div>
                                            <div class="separador">&nbsp;</div>
                                        </td>
                                    </tr>
                                    <tr>  
                                    	<c:if test="${empty __formdata.isMantProd || (!empty __formdata.isMantProd &&__formdata.isMantProd != 1)}">
                                         <!-- Cuadro original -->
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisdesc008" c="AGRUPACION" lit="111471" /></b>
                                        </td>
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisdesc008" c="RAMO" lit="100784" /></b>
                                        </td>
                                      </c:if>
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisdesc008" c="PRODUCTO" lit="100829" /></b>
                                        </td>
                                    </tr>           
                                    <tr>  
                                    		<c:if test="${empty __formdata.isMantProd || (!empty __formdata.isMantProd &&__formdata.isMantProd != 1)}">
                                         <!-- Cuadro nuevo -->
                                        <td class="titulocaja">
                                            <select name="AGRUPACION" id ="AGRUPACION" size="1" class="campowidthselect campo campotexto">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisdesc008" c="COMBO_SV" lit="1000348"/> - </option>
                                                <c:forEach var="AGRUPACION" items="${AGRUPACIONES}">
                                                    <option value="${AGRUPACION.CATRIBU}"
                                                    <c:if test="${AGRUPACION.CATRIBU == __formdata.AGRUPACION}"> selected </c:if>>
                                                    ${AGRUPACION.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="campocaja" colspan="2">
                                            <select name = "ramoProducto"   id="ramoProducto"  id ="ramoProducto" size="1" onchange="f_cargar_productos()" class="campowidthselect campo campotexto">
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisdesc008" c="SELECCIONAME" lit="108341"/> - </option>
                                                <c:forEach var="ramos" items="${axisctr_listaRamos}">
                                                    <option value = "${ramos.CRAMO}/${ramos.TRAMO}"
                                                        <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>
                                                        ${ramos.TRAMO}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                         </c:if>
                                        <td class="campocaja" colspan="2" >
                                            <select name = "SPRODUC" id ="SPRODUC" size="1"  onchange="" class="campowidthselect campo campotexto"
                                            <axis:atr f="axisdesc008" c="SPRODUC" a="obligatorio=true"/>
                                            	 title="<axis:alt f="axisdesc008" c="PRODUCTO" lit="100829" />" >
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisdesc008" c="SELECCIONAME" lit="108341" /> - </option>
                                                <c:forEach items="${productos}" var="item">
                                                <option value = "${item.SPRODUC}/${item.TTITULO}" <c:if test="${__formdata['VSPRODUC']==item.SPRODUC}">selected</c:if> >${item.TTITULO}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <c:if test="${empty __formdata.isMantProd || (!empty __formdata.isMantProd &&__formdata.isMantProd != 1)}">
                                        <td>
                                            <input type="button" name="buscar" id="buscar" onclick="f_but_buscar()" value="<axis:alt f="axisdesc008" c="BUSCAR" lit="9000508"/>"  class="boton"/>
                                        </td>   
                                        </c:if> 
                                    </tr>
                                </table>    
                            </td>
                        </tr>
                        </table>
                     </td>
                </tr>
                <tr>
                    <td>
                        <div class="titulo">
                            <div  style="float:left;"> <img src="images/flecha.gif"/><axis:alt f="axisdesc008" c="CUADRO" lit="9903503"/> </div>
                            <div  style="float:right;"> <a href="javascript:f_abrir_axisdesc006('MODIFICAR', '1')">  <img border="0" alt="<axis:alt f="axisdesc008" c="MODIFICAR" lit="9000552"/>"   title="<axis:alt f="axisdesc008" c="MODIFICAR" lit="9000552"/>" src="images/lapiz.gif"/></a></div>    
                            <axis:visible f="axisdesc008" c="ALTA">
                                <div  style="float:right;"> <a href="javascript:f_abrir_axisdesc006('ALTA', '1')">  <img border="0" alt="<axis:alt f="axisdesc008" c="ALTA" lit="9901328"/>"   title="<axis:alt f="axisdesc008" c="ALTA" lit="9901328"/>" src="images/new.gif"/></a></div>    
                            </axis:visible>
                        </div>
                        <table class="seccion">    
                            <tr>
                                <td align="left" >
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:15%;height:0%;"/>
                                            <th style="width:15%;height:0%;"/>
                                            <th style="width:15%;height:0%;"/>
                                            <th style="width:15%;height:0%;"/>
                                            <th style="width:15%;height:0%;"/>
                                            <th style="width:15%;height:0%;"/>
                                            <th style="width:10%;height:0%;"/>
                                        </tr>
                                        
                                        <axis:ocultar c="FINIVIG" f="axisdesc008" dejarHueco="false">
                                            <tr>
                                                <td class="campocaja">
                                                    <b><axis:alt f="axisdesc008" c="FINIVIG" lit="9000716"/></b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="campocaja">
                                                    <select name="FINIVIG" id="FINIVIG" size="1" class="campowidthselect campo campotexto" title="<axis:alt f="axisdesc008" c="FINIVIG" lit="9000716"/>" onchange="f_FINIVIG_onchage(this.value);">
                                                        <c:forEach var="element" items="${lsfechasProd}">
                                                            <c:set var="vtemp"><fmt:formatDate pattern="dd/MM/yyyy" value="${element.FINIVIG}"/></c:set>
                                                            <option value = "${vtemp}" 
                                                                <c:if test="${element.FINIVIG == __formdata.FINIVIG}"> selected </c:if> />
                                                                    ${vtemp}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </tr>
                                        </axis:ocultar>
                                        
                                        <tr>
                                            <td colspan="7">
                                                <c:set var="title1"><axis:alt f="axisdesc008" c="TDESC" lit="9000617"/></c:set>
                                                <c:set var="title2"><axis:alt f="axisdesc008" c="TACTIVI" lit="103481"/></c:set>
                                                <c:set var="title3"><axis:alt f="axisdesc008" c="TGARANT" lit="100561"/></c:set>
                                                <c:set var="title4"><axis:alt f="axisdesc008" c="TMODCOM" lit="100943"/></c:set>
                                                <c:set var="title5"><axis:alt f="axisdesc008" c="PDESC" lit="101467"/></c:set>
                                                <c:set var="title6"><axis:alt f="axisdesc008" c="FINIVIG" lit="9000716"/></c:set><%-- Vigència --%>
                                                <c:set var="title9"><axis:alt f="axisdesc008" c="NINIALT" lit="104095"/></c:set><!--NINIALT-->
                                                <c:set var="title10"><axis:alt f="axisdesc008" c="NFINALT" lit="103051"/></c:set><!--NFINALT-->
                                                
                                                
                                                <div class="seccion displayspacePersonas">
                                                    <display:table name="${__formdata.listaCuadros}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" excludedParams="*" defaultorder="ascending" requestURI="modal_axisdesc008.do?operation=form&paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_DETDESCUENTO.TDESC" headerClass="sortable"  media="html" autolink="false" style="width:30%;" >
                                                        <div class="dspText">${miListaId.OB_IAX_DETDESCUENTO.TDESC}</div>
                                                    </display:column>
                                                    <axis:visible c="FINIVIG" f="axisdesc008">
                                                        <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_DETDESCUENTO.FINIVIG" headerClass="sortable"  media="html" autolink="false" style="width:10%;" >
                                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.OB_IAX_DETDESCUENTO.FINIVIG}"/></div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <display:column title="${title2}" sortable="false" sortProperty="OB_IAX_DETDESCUENTO.TACTIVI" headerClass="sortable"  media="html" autolink="false" style="width:20%;">
                                                        <div class="dspText">${miListaId.OB_IAX_DETDESCUENTO.TACTIVI}</div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="false" sortProperty="OB_IAX_DETDESCUENTO.TGARANT" headerClass="sortable"  media="html" autolink="false" style="width:20%;">
                                                         <div class="dspText">${miListaId.OB_IAX_DETDESCUENTO.TGARANT}</div>
                                                    </display:column>
                                                    <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_DETDESCUENTO.TMODCOM" headerClass="sortable"  media="html" autolink="false" style="width:20%;">
                                                        <div class="dspText">${miListaId.OB_IAX_DETDESCUENTO.TMODCOM}</div>
                                                    </display:column>
                                                    <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_DETDESCUENTO.PDESC" headerClass="sortable"  media="html" autolink="false" style="width:10%;">
                                                        <div class="dspText"><fmt:formatNumber pattern="###,##0.00" value='${miListaId.OB_IAX_DETDESCUENTO.PDESC}'/></div>
                                                    </display:column>
                                                    
                                                    <axis:visible f="axisdesc008" c="NINIALT">
                                                        <display:column title="${title9}" sortable="true" sortProperty="OB_IAX_DETDESCUENTO.NINIALT" headerClass="sortable"  media="html" autolink="false" style="width:10%;">
                                                            <div class="dspText"><fmt:formatNumber pattern="##0" value='${miListaId.OB_IAX_DETDESCUENTO.NINIALT}'/></div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisdesc008" c="NFINALT">
                                                        <display:column title="${title10}" sortable="true" sortProperty="OB_IAX_DETDESCUENTO.NFINALT" headerClass="sortable"  media="html" autolink="false" style="width:10%;">
                                                            <div class="dspText"><fmt:formatNumber pattern="##0" value='${miListaId.OB_IAX_DETDESCUENTO.NFINALT}'/></div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisdesc008" c="BUT_NIVELES">
                                                        <display:column title="" sortable="false" media="html" autolink="false" headerClass="sortable" >
                                                            <div class="dspIcons">
                                                                <img border="0" alt="<axis:alt f="axisdesc008" c="NIVELES" lit="9902456"/>" title1="<axis:alt f="axisdesc008" c="NIVELES" lit="9902456"/>" src="images/lapiz.gif" 
                                                                 style="cursor:pointer;" onclick="javascript:f_abrir_axisdesc011 (${miListaId.OB_IAX_DETDESCUENTO.SPRODUC},'${miListaId.OB_IAX_DETDESCUENTO.CACTIVI}','${miListaId.OB_IAX_DETDESCUENTO.CGARANT}','${miListaId.OB_IAX_DETDESCUENTO.CDESC}','${miListaId.OB_IAX_DETDESCUENTO.CMODCOM}','<fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.OB_IAX_DETDESCUENTO.FINIVIG}"/>','<fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.OB_IAX_DETCOMISION.FFINVIG}"/>')"/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    
                                                    
                                                </display:table>
                                                </div>	
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>					
            
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisdesc008</c:param><c:param name="f">axisdesc008</c:param>
                <c:param name="__botones">cerrar</c:param>
            </c:import>
            
        </form>
      <c:import url="../include/mensajes.jsp" />
    </body>
</html>
