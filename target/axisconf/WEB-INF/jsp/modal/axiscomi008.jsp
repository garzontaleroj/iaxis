<%/*
*  Fichero: Axiscomi008.jsp
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
            parent.f_cerrar_axiscomi008();
       }
       
       
       function f_onload(){
       	
       	<c:if test="${!empty __formdata.isMantProd &&__formdata.isMantProd == 1}">
       	 	objDom.setDisabledPorId("SPRODUC","true");
            <c:if test="${empty __formdata.isFirst}">
                objDom.setValorComponente(document.axiscomi008Form.isFirst,1);
                f_but_buscar();
            </c:if>
       	</c:if>
        f_cargar_propiedades_pantalla();
       }
       
       
       function f_cargar_productos(){
                   
            CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.axiscomi008Form.ramoProducto), "/")[0];
            
            if (!objUtiles.estaVacio (CRAMO) ){
                objDom.setValorComponente(document.axiscomi008Form.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.axiscomi008Form.ramoProducto), "/")[0]);
                objDom.setValorComponente(document.axiscomi008Form.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.axiscomi008Form.ramoProducto), "/")[1]);
                
            }else
                objDom.setValorComponente(document.axiscomi008Form.CRAMO, null);
               
            objAjax.invokeAsyncCGI("modal_axiscomi008.do", callbackAjaxCargarProductos, "operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.axiscomi008Form.CRAMO) + 
                        "&TRAMO=" + objDom.getValorComponente(document.axiscomi008Form.TRAMO)+"&tipo="+document.axiscomi008Form.tipo.value, this, objJsMessages.jslit_cargando);
       }
            
       function callbackAjaxCargarProductos (ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("SPRODUC");
                var SPRODUCCombo = document.axiscomi008Form.SPRODUC;     
                objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axiscomi008" c="SELECCIONAME" lit="108341"/> - ', SPRODUCCombo, 0);
                for (i = 0; i < elementos.length; i++) {
                    var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                    var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                    objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                }
            }
       }      
       
       function f_abrir_axiscomi006(MODO, TIPO){
         var dataInicio = document.getElementById("FINIVIG");
         if (MODO=='MODIFICAR'){
            dataInicio.setAttribute("obligatorio",true);
         }else{
            dataInicio.setAttribute("obligatorio",false);
         }
         if (objValidador.validaEntrada()) {
            var ok = true;
            var splitted = objUtiles.utilSplit(document.axiscomi008Form.SPRODUC.value, "/");
            var sproduc = splitted[0];
            var tproduc = splitted[1];
            var url = "modal_axiscomi006.do?operation=form&SPRODUC="+sproduc+"&TSPRODUC="+tproduc+"&MODO="+MODO+"&TIPO="+TIPO;
            if (MODO == 'MODIFICAR'){
                var FINIVIG=objDom.getValorPorId("FINIVIG");
                if ((!objUtiles.estaVacio(FINIVIG))&&(FINIVIG!='null')){
                    url+="&FINIVIG="+FINIVIG;
                }else{
                    ok = false;
                    objAppMensajes.pintarMensajePantalla('<axis:alt f="axiscomi006" c="FINCORRECTO" lit="50000" />', "info"); 
                }
            }
            if (ok){
                objUtiles.abrirModal("axiscomi006", "src", url);
            }
         }
       }   
      
      function f_cerrar_axiscomi006() {
             objUtiles.cerrarModal("axiscomi006");
             f_but_buscar();
       }
       
       function f_but_buscar(){
            if (objValidador.validaEntrada()) {
                var splitted = objUtiles.utilSplit(document.axiscomi008Form.SPRODUC.value, "/");
               var sproduc = splitted[0];
               var tproduc = splitted[1];
               document.axiscomi008Form.VSPRODUC.value = sproduc;
                objUtiles.ejecutarFormulario ("modal_axiscomi008.do", "buscar", document.axiscomi008Form, "_self", objJsMessages.jslit_cargando);
            }
       }
       
      
      function f_FINIVIG_onchage(fecha){
        if (objValidador.validaEntrada()) {
                var splitted = objUtiles.utilSplit(document.axiscomi008Form.SPRODUC.value, "/");
               var sproduc = splitted[0];
               var tproduc = splitted[1];
               document.axiscomi008Form.VSPRODUC.value = sproduc;
                objUtiles.ejecutarFormulario ("modal_axiscomi008.do", "buscar", document.axiscomi008Form, "_self", objJsMessages.jslit_cargando);
            }
      }
      
       function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
            if(cual=='axiscomi011') f_but_buscar();
        }  
        
        function f_abrir_axiscomi011 (sproduc,cactivi,cgarant,ccomisi,cmodcom,finivig) {
            objUtiles.abrirModal("axiscomi011", "src", "modal_axiscomi011.do?operation=init&PSPRODUC=" + sproduc+"&PCACTIVI="+cactivi+"&PCGARANT="+cgarant+"&PCCOMISI="+ccomisi+"&PCMODCOM="+cmodcom+"&PFINIVIG="+finivig);
        }
        
    </script>
  </head>
    <body onload="f_onload()" class=" ">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="axiscomi008Form" action="" method="POST">
            <input type="hidden" name="operation" value="">
            <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
            <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
            <input type="hidden" id="VSPRODUC" name="VSPRODUC" value="${__formdata.VSPRODUC}"/>
            <input type="hidden" id="TPRODUC" name="TPRODUC" value="${__formdata.TPRODUC}"/>
            <input type="hidden" id="isMantProd" name="isMantProd" value="${__formdata.isMantProd}"/>
            <input type="hidden" id="isFirst" name="isFirst" value="${__formdata.isFirst}"/>
            
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axiscomi008" c="TITULO_axiscomi006" lit="9901322" /></c:param>
            <c:param name="nid" value="axiscomi006" />
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axiscomi008" c="NIVELES" lit="9902456" /></c:param>
            <c:param name="nid" value="axiscomi011" />
        </c:import>
        
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axiscomi008" c="TIT_axiscomi008" lit="9901327" /></c:param>
                <c:param name="producto"><axis:alt f="axiscomi008" c="TIT_axiscomi008" lit="9901327" /></c:param>
                <c:param name="form">Axiscomi008</c:param>
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
                                            <b><axis:alt f="axiscomi008" c="AGRUPACION" lit="111471" /></b>
                                        </td>
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axiscomi008" c="RAMO" lit="100784" /></b>
                                        </td>
                                      </c:if>
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axiscomi008" c="PRODUCTO" lit="100829" /></b>
                                        </td>
                                    </tr>           
                                    <tr>  
                                    		<c:if test="${empty __formdata.isMantProd || (!empty __formdata.isMantProd &&__formdata.isMantProd != 1)}">
                                         <!-- Cuadro nuevo -->
                                        <td class="titulocaja">
                                            <select name="AGRUPACION" id ="AGRUPACION" size="1" class="campowidthselect campo campotexto">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axiscomi008" c="COMBO_SV" lit="1000348"/> - </option>
                                                <c:forEach var="AGRUPACION" items="${AGRUPACIONES}">
                                                    <option value="${AGRUPACION.CATRIBU}"
                                                    <c:if test="${AGRUPACION.CATRIBU == __formdata.AGRUPACION}"> selected </c:if>>
                                                    ${AGRUPACION.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="campocaja" colspan="2">
                                            <select name = "ramoProducto"   id="ramoProducto"  id ="ramoProducto" size="1" onchange="f_cargar_productos()" class="campowidthselect campo campotexto">
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axiscomi008" c="SELECCIONAME" lit="108341"/> - </option>
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
                                            <axis:atr f="axiscomi008" c="SPRODUC" a="obligatorio=true"/>
                                            	 title="<axis:alt f="axiscomi008" c="PRODUCTO" lit="100829" />" >
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axiscomi008" c="SELECCIONAME" lit="108341" /> - </option>
                                                <c:forEach items="${productos}" var="item">
                                                <option value = "${item.SPRODUC}/${item.TTITULO}" <c:if test="${__formdata['VSPRODUC']==item.SPRODUC}">selected</c:if> >${item.TTITULO}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <c:if test="${empty __formdata.isMantProd || (!empty __formdata.isMantProd &&__formdata.isMantProd != 1)}">
                                        <td>
                                            <input type="button" name="buscar" id="buscar" onclick="f_but_buscar()" value="<axis:alt f="axiscomi008" c="BUSCAR" lit="9000508"/>"  class="boton"/>
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
                            <div  style="float:left;"> <img src="images/flecha.gif"/><axis:alt f="axiscomi008" c="CUADRO" lit="9002270"/> </div>
                            <div  style="float:right;"> <a href="javascript:f_abrir_axiscomi006('MODIFICAR', '1')">  <img border="0" alt="<axis:alt f="axiscomi008" c="MODIFICAR" lit="9000552"/>"   title="<axis:alt f="axiscomi008" c="MODIFICAR" lit="9000552"/>" src="images/lapiz.gif"/></a></div>    
                            <axis:visible f="axiscomi008" c="ALTA">
                                <div  style="float:right;"> <a href="javascript:f_abrir_axiscomi006('ALTA', '1')">  <img border="0" alt="<axis:alt f="axiscomi008" c="ALTA" lit="9901328"/>"   title="<axis:alt f="axiscomi008" c="ALTA" lit="9901328"/>" src="images/new.gif"/></a></div>    
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
                                        
                                        <axis:ocultar c="FINIVIG" f="axiscomi008" dejarHueco="false">
                                            <tr>
                                                <td class="campocaja">
                                                    <b><axis:alt f="axiscomi008" c="FINIVIG" lit="9000716"/></b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="campocaja">
                                                    <select name="FINIVIG" id="FINIVIG" size="1" class="campowidthselect campo campotexto" title="<axis:alt f="axiscomi008" c="FINIVIG" lit="9000716"/>" onchange="f_FINIVIG_onchage(this.value);">
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
                                                <c:set var="title1"><axis:alt f="axiscomi008" c="TCOMISI" lit="9000617"/></c:set>
                                                <c:set var="title2"><axis:alt f="axiscomi008" c="TACTIVI" lit="103481"/></c:set>
                                                <c:set var="title3"><axis:alt f="axiscomi008" c="TGARANT" lit="100561"/></c:set>
                                                <c:set var="title4"><axis:alt f="axiscomi008" c="TMODCOM" lit="100943"/></c:set>
                                                <c:set var="title5"><axis:alt f="axiscomi008" c="PCOMISI" lit="101467"/></c:set>
                                                <c:set var="title6"><axis:alt f="axiscomi008" c="FINIVIG" lit="9000716"/></c:set><%-- Vigència --%>
                                                <c:set var="title9"><axis:alt f="axiscomi008" c="NINIALT" lit="104095"/></c:set><!--NINIALT-->
                                                <c:set var="title10"><axis:alt f="axiscomi008" c="NFINALT" lit="103051"/></c:set><!--NFINALT-->
                                                <!-- TODOC: Añadir columnas. Literales-->
                                                <axis:visible f="axiscomi008" c="CCRITERIO">
                                                    <c:set var="title11"><axis:alt f="axiscomi008" c="NDESDE" lit="104095"/>(<axis:alt f="axiscomi008" c="CCRITERIO" lit="9901472"/>)</c:set><!--NDESDE-->
                                                    <c:set var="title12"><axis:alt f="axiscomi008" c="NHASTA" lit="103051"/>(<axis:alt f="axiscomi008" c="CCRITERIO" lit="9901472"/>)</c:set><!--NHASTA-->
                                                    <c:set var="title13"><axis:alt f="axiscomi008" c="CCRITERIO" lit="9901472"/></c:set><!--CCRITERIO-->
                                                </axis:visible>
                                                <!-- TODOC: Fin Añadir columnas. Literales-->
                                                <div class="seccion displayspacePersonas">
                                                    <display:table name="${__formdata.listaCuadros}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" excludedParams="*" defaultorder="ascending" requestURI="modal_axiscomi008.do?operation=form&paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_DETCOMISION.TCOMISI" headerClass="sortable"  media="html" autolink="false" style="width:30%;" >
                                                        <div class="dspText">${miListaId.OB_IAX_DETCOMISION.TCOMISI}</div>
                                                    </display:column>
                                                    <axis:visible c="FINIVIG" f="axiscomi008">
                                                        <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_DETCOMISION.FINIVIG" headerClass="sortable"  media="html" autolink="false" style="width:10%;" >
                                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.OB_IAX_DETCOMISION.FINIVIG}"/></div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <display:column title="${title2}" sortable="false" sortProperty="OB_IAX_DETCOMISION.TACTIVI" headerClass="sortable"  media="html" autolink="false" style="width:20%;">
                                                        <div class="dspText">${miListaId.OB_IAX_DETCOMISION.TACTIVI}</div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="false" sortProperty="OB_IAX_DETCOMISION.TGARANT" headerClass="sortable"  media="html" autolink="false" style="width:20%;">
                                                         <div class="dspText">${miListaId.OB_IAX_DETCOMISION.TGARANT}</div>
                                                    </display:column>
                                                    <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_DETCOMISION.TMODCOM" headerClass="sortable"  media="html" autolink="false" style="width:20%;">
                                                        <div class="dspText">${miListaId.OB_IAX_DETCOMISION.TMODCOM}</div>
                                                    </display:column>
                                                    <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_DETCOMISION.PCOMISI" headerClass="sortable"  media="html" autolink="false" style="width:10%;">
                                                        <div class="dspText"><fmt:formatNumber pattern="###,##0.00" value='${miListaId.OB_IAX_DETCOMISION.PCOMISI}'/></div>
                                                    </display:column>
                                                    <!-- TODOC: Añadir columnas-->
                                                    <axis:visible f="axiscomi008" c="CCRITERIO">
                                                       <display:column title="${title13}" sortable="true" sortProperty="TCRITERIO" headerClass="sortable fixed" media="html" autolink="false" >
                                                            <div class="dspText">${miListaId.OB_IAX_DETCOMISION.TCRITERIO}</div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axiscomi008" c="NDESDE">
                                                        <display:column title="${title11}" sortable="true" sortProperty="OB_IAX_DETCOMISION.NDESDE" headerClass="sortable"  media="html" autolink="false" style="width:10%;">
                                                            <div class="dspText"><fmt:formatNumber pattern="##0" value='${miListaId.OB_IAX_DETCOMISION.NDESDE}'/></div>
                                                        </display:column>
                                                    </axis:visible>
                                                       <axis:visible f="axiscomi008" c="NHASTA">
                                                        <display:column title="${title12}" sortable="true" sortProperty="OB_IAX_DETCOMISION.HASTA" headerClass="sortable"  media="html" autolink="false" style="width:10%;">
                                                            <div class="dspText"><fmt:formatNumber pattern="##0" value='${miListaId.OB_IAX_DETCOMISION.NHASTA}'/></div>
                                                        </display:column>
                                                    </axis:visible>
                                                    
                                                    <!-- TODOC: Fin Añadir columnas -->
                                                    <axis:visible f="axiscomi008" c="NINIALT">
                                                        <display:column title="${title9}" sortable="true" sortProperty="OB_IAX_DETCOMISION.NINIALT" headerClass="sortable"  media="html" autolink="false" style="width:10%;">
                                                            <div class="dspText"><fmt:formatNumber pattern="##0" value='${miListaId.OB_IAX_DETCOMISION.NINIALT}'/></div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axiscomi008" c="NFINALT">
                                                        <display:column title="${title10}" sortable="true" sortProperty="OB_IAX_DETCOMISION.NFINALT" headerClass="sortable"  media="html" autolink="false" style="width:10%;">
                                                            <div class="dspText"><fmt:formatNumber pattern="##0" value='${miListaId.OB_IAX_DETCOMISION.NFINALT}'/></div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axiscomi008" c="BUT_NIVELES">
                                                        <display:column title="" sortable="false" media="html" autolink="false" headerClass="sortable" >
                                                            <div class="dspIcons">
                                                                <img border="0" alt="<axis:alt f="axiscomi008" c="NIVELES" lit="9902456"/>" title1="<axis:alt f="axiscomi008" c="NIVELES" lit="9902456"/>" src="images/lapiz.gif" 
                                                                 style="cursor:pointer;" onclick="javascript:f_abrir_axiscomi011 (${miListaId.OB_IAX_DETCOMISION.SPRODUC},'${miListaId.OB_IAX_DETCOMISION.CACTIVI}','${miListaId.OB_IAX_DETCOMISION.CGARANT}','${miListaId.OB_IAX_DETCOMISION.CCOMISI}','${miListaId.OB_IAX_DETCOMISION.CMODCOM}','<fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.OB_IAX_DETCOMISION.FINIVIG}"/>')"/>
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
            
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axiscomi008</c:param><c:param name="f">axiscomi008</c:param>
                <c:param name="__botones">cerrar</c:param>
            </c:import>
            
        </form>
      <c:import url="../include/mensajes.jsp" />
    </body>
</html>
