<%
/**
*  Fichero: axiscomi005.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*  Fecha: 12/07/2010
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

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
        //alert("Antes de cargar dependencias");
        f_cargar_propiedades_pantalla();
        f_carga_dependencias();
            
            //document.miForm.NPOLIZA.focus();
            // Retocar tabla en IE
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
            <c:if test="${__configform.axiscomi005__PCOMISI__modificable == 'false'}"> 
                <c:if test="${resultadoOK=='KO'}" >
                    f_but_cancelar();
                </c:if>
            </c:if>
            
            <c:if test="${resultadoOK=='OK'}" >
                alert("<axis:alt f='axiscomi005' c='ALERT' lit='1000405' />");
                f_but_cancelar();
            </c:if>
        }
        
        function f_but_cancelar() {
            parent.f_aceptar_axiscomi005();
        }        
        
        function f_but_buscar() {
          if (objValidador.validaEntrada()) objUtiles.ejecutarFormulario("modal_axiscomi005.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            
        }
         
        function f_but_aceptar (cual) {
            var SSEGURO = "";
            if (!objUtiles.estaVacio(cual)) 
                // Seleccionada por el hipervínculo
                SSEGURO = cual;
            else if (!objUtiles.estaVacio(document.miForm.checked_poliza)) {
                // Checkeada por el radio button
                SSEGURO = objUtiles.f_GuardaCasillasChecked("checked_poliza");
            } 
            
            if (typeof SSEGURO == 'boolean' || objUtiles.estaVacio (SSEGURO)) 
                alert(objJsMessages.jslit_selecciona_una_poliza);
            else
                // Si hay una seleccionada, llamar al Action.
                parent.f_aceptar_axiscomi005(SSEGURO);
            
         }

         function f_cargar_comisiones(){
                    CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
                     if (!objUtiles.estaVacio (CRAMO) ){
                    objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                    objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                    }else
                    objDom.setValorComponente(document.miForm.CRAMO, null);
                    objAjax.invokeAsyncCGI("modal_axiscomi005.do", callbackAjaxCargarComisiones, "operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO) + 
                        "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value, this, objJsMessages.jslit_cargando);
        }     
        
        
        function f_buscar_actividades(VALOR,PRODUCTO,CMODALI){
            //alert("SELECCIONADO:"+PRODUCTO + "SELECCIONADA:"+CMODALI);
            document.miForm.selectedActividad.value=null;
            document.miForm.selectedProducto.value=PRODUCTO;
            document.miForm.selectedModProducto.value=CMODALI;
            //if (objValidador.validaEntrada()) objUtiles.ejecutarFormulario("modal_axiscomi005.do?selectedProducto="+PRODUCTO+"&selectedModProducto="+CMODALI, "buscar_actividades", document.miForm, "_self", objJsMessages.jslit_buscando_polizas);
            if (objValidador.validaEntrada()) objUtiles.ejecutarFormulario("modal_axiscomi005.do", "buscar_actividades", document.miForm, "_self", objJsMessages.jslit_cargando);
       
        }
        
        function f_buscar_garantias(VALOR,ACTIVIDAD,PRODUCTO,CMODALI){
             //alert("SELECCIONADA ACTIVIDAD"+ACTIVIDAD);
             //alert("SELECCIONADA PRODUCTO"+PRODUCTO);
             document.miForm.selectedActividad.value=ACTIVIDAD;
             document.miForm.selectedProducto.value=PRODUCTO;
             document.miForm.selectedModActividad.value=CMODALI;
            //if (objValidador.validaEntrada()) objUtiles.ejecutarFormulario("modal_axiscomi005.do?selectedActividad="+ACTIVIDAD+"&selectedProducto="+PRODUCTO, "buscar_garantias", document.miForm, "_self", objJsMessages.jslit_buscando_polizas);
            if (objValidador.validaEntrada()) objUtiles.ejecutarFormulario("modal_axiscomi005.do", "buscar_garantias", document.miForm, "_self", objJsMessages.jslit_cargando);
        
        }
        
        function callbackAjaxCargarComisiones (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    
                    var SPRODUCCombo = document.miForm.SPRODUC;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axiscomi005" c="MISSATGE" lit="108341"/> - ', SPRODUCCombo, 0);
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
                    objLista.borrarFilasDeLista ("miListaId", "5", "<axis:alt f='axiscomi005' c='MISSATGE2' lit='1000254' />");
                    var spanners = document.getElementsByTagName("span");
                    for(var i=0;i<spanners.length;i++) {
                        if (spanners[i].className == "gridpagebanner")
                            spanners[i].innerHTML = "";
                        if (spanners[i].className == "gridpagelinks")
                            spanners[i].innerHTML = ""; 
                    }
               } catch(e){alert(e);}
            }
            
         function f_cargar_valor_porcentaje_n1(VALOR,NINIALT,NFINALT,MODALIDAD,NIVEL,SPRODUC,CGARANT,CACTIVI){
                   //alert(VALOR); 
                    //alert(MODALIDAD); 
                     //alert(NIVEL); 
                      objAjax.invokeAsyncCGI("modal_axiscomi005.do", callbackAjaxCargarComisiones, "operation=ajax_guardar_porcentaje&PORCENTAJE=" + VALOR + 
                        "&NIVEL=1" + "&MODALIDAD="+MODALIDAD+"&CCOMISI="+document.miForm.CCOMISI.value+"&FINIVIG="+document.miForm.FINIVIG.value+"&CGARANT="+CGARANT+"&CACTIVI="+CACTIVI+"&SPRODUC="+SPRODUC+"&NINIALT="+NINIALT+"&NFINALT="+NFINALT, this, objJsMessages.jslit_cargando);
         }      
         
         function f_cargar_valor_porcentaje_n2(VALOR,NINIALT,NFINALT,MODALIDAD,NIVEL,SPRODUC,CGARANT,CACTIVI){
                   //alert(VALOR); 
                    //alert(MODALIDAD); 
                     //alert(NIVEL); 
                      objAjax.invokeAsyncCGI("modal_axiscomi005.do", callbackAjaxCargarComisiones, "operation=ajax_guardar_porcentaje&PORCENTAJE=" + VALOR + 
                        "&NIVEL=2" + "&MODALIDAD="+MODALIDAD+"&CCOMISI="+document.miForm.CCOMISI.value+"&FINIVIG="+document.miForm.FINIVIG.value+"&CGARANT="+CGARANT+"&CACTIVI="+CACTIVI+"&SPRODUC="+SPRODUC+"&NINIALT="+NINIALT+"&NFINALT="+NFINALT, this, objJsMessages.jslit_cargando);
         }     
         
         function f_cargar_valor_porcentaje_n3(VALOR,NINIALT,NFINALT,MODALIDAD,NIVEL,SPRODUC,CGARANT,CACTIVI){
                   //alert(VALOR); 
                    //alert(MODALIDAD); 
                     //alert(NIVEL); 
                      objAjax.invokeAsyncCGI("modal_axiscomi005.do", callbackAjaxCargarComisiones, "operation=ajax_guardar_porcentaje&PORCENTAJE=" + VALOR + 
                        "&NIVEL=3" + "&MODALIDAD="+MODALIDAD+"&CCOMISI="+document.miForm.CCOMISI.value+"&FINIVIG="+document.miForm.FINIVIG.value+"&CGARANT="+CGARANT+"&CACTIVI="+CACTIVI+"&SPRODUC="+SPRODUC+"&NINIALT="+NINIALT+"&NFINALT="+NFINALT, this, objJsMessages.jslit_cargando);
         }     
         
         
         function f_but_aceptar () {
            //f_but_cancelar();
            //alert("Antes de aceptar");
            if (objValidador.validaEntrada()) objUtiles.ejecutarFormulario("modal_axiscomi005.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
        
                                    
         }
         
         function f_abrir_axiscomi011 (sproduc,cactivi,cgarant,ccomisi,cmodcom,finivig) {
            objUtiles.abrirModal("axiscomi011", "src", "modal_axiscomi011.do?operation=init&PSPRODUC=" + sproduc+"&PCACTIVI="+cactivi+"&PCGARANT="+cgarant+"&PCCOMISI="+ccomisi+"&PCMODCOM="+cmodcom+"&PFINIVIG="+finivig);
         }
        
        
         function f_cerrar_modal (pform) {
            objUtiles.cerrarModal(pform);
            if(pform=='axiscomi011') objUtiles.ejecutarFormulario("modal_axiscomi005.do", "init", document.miForm, "_self", objJsMessages.jslit_cargando);
         }
         
         
<% System.out.println("********************************************3"); %>
            function callbackAjaxCargarComisiones (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    //var elementos = doc.getElementsByTagName("SPRODUC");
                    
                    //var SPRODUCCombo = document.miForm.SPRODUC;     
                    //objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                    //objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axiscomi005" c="MISSATGE" lit="108341"/> - ', SPRODUCCombo, 0);
                      // for (i = 0; i < elementos.length; i++) {
                      //      var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                      //      var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                      //      objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                   //     }
                   //amagarDisplay();

                }
            }   
            
            function f_abrir_axiscomi012 (CACTIVI,CGARANT,CCOMISI,CMODCOM,FINIVIG,NINIALT,SPRODUC,NFINALT,NIVEL) {
        
            objUtiles.abrirModal("axiscomi012", "src", "modal_axiscomi012.do?operation=init&CACTIVI="+CACTIVI+"&CGARANT="+CGARANT+"&CCOMISI="+CCOMISI+"&CMODCOM="+CMODCOM+
                                                                                           "&FINIVIG="+FINIVIG+"&NINIALT="+NINIALT+"&SPRODUC="+SPRODUC+"&NFINALT="+NFINALT+
                                                                                           "&NIVEL="+NIVEL);
        }
        
       function f_cerrar_axiscomi012(){
            f_cerrar_modal('axiscomi012');
        }
       
       function f_borrar_desglose (CACTIVI,CGARANT,CCOMISI,CMODCOM,FINIVIG,NINIALT,SPRODUC,NFINALT) {
             objUtiles.ejecutarFormulario("modal_axiscomi005.do?CACTIVISEL="+CACTIVI+"&CGARANTSEL="+CGARANT+"&CCOMISI="+CCOMISI+"&CMODCOM="+CMODCOM+"&FINIVIGSEL="+FINIVIG+"&NINIALT="+NINIALT+"&SPRODUCSEL="+SPRODUC+"&NFINALT="+NFINALT, "borrar_desglose", document.miForm, "_self", objJsMessages.jslit_cargando);            
         }
         
       function f_aceptar_axiscomi12()  {
            f_cerrar_modal('axiscomi012');
            objUtiles.ejecutarFormulario("modal_axiscomi005.do", "init", document.miForm, "_self", objJsMessages.jslit_cargando);
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
            <input type="hidden" id="selectedProducto" name="selectedProducto" value="${__formdata.selectedProducto}"/>
            <input type="hidden" id="selectedModProducto" name="selectedModProducto" value="${__formdata.selectedModProducto}"/>
            <input type="hidden" id="selectedActividad" name="selectedActividad" value="${__formdata.selectedActividad}"/>
            <input type="hidden" id="selectedModActividad" name="selectedModActividad" value="${__formdata.selectedModActividad}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axiscomi005" c="TITFORM" lit="9901310" /></c:param>
                <c:param name="producto"><axis:alt f="axiscomi005" c="TITFORM" lit="9901310"/></c:param>
                <c:param name="form">axiscomi005</c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axiscomi005" c="NIVELES" lit="9902456" /></c:param>
                <c:param name="nid" value="axiscomi011" />
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axiscomi005" c="DESGLOSE" lit="9902456" /></c:param>
                <c:param name="nid" value="axiscomi012" />
            </c:import>
            
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                     
                      <!--  SECCION -->
                      
                      
                      
                      <table class="seccion" id="LISTA">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt f="axiscomi005" c="CCOMISI" lit="109155" /></b><!-- Código -->
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axiscomi005" c="TCOMISI" lit="100588" /></b><!-- Descripcion -->
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axiscomi005" c="FINIVIG" lit="9000526" /></b><!-- Fecha inicio -->
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axiscomi005" c="FFINVIG" lit="9000527" /></b><!-- Fecha fin -->
                                    
                                </td>
                            </tr>
    <% System.out.println("********************************************7"); %>
                            <tr>
                                 <td class="campocaja">
                                    <input type="text" readonly class="campowidthinput campo campotexto" title="<axis:alt f="axiscomi005" c="CCOMISI" lit="109155"/>" size="15" value="${__formdata['CCOMISI']}" name="CCOMISI" id="CCOMISI"/>
                                </td>
                                <td class="campocaja">
                                    <input type="text" readonly class="campowidthinput campo campotexto" title="<axis:alt f="axiscomi005" c="TCOMISI" lit="100588"/>" value="${__formdata['TCOMISI']}" name="TCOMISI" id="TCOMISI" size="15"/>
                                </td>
                                <td class="campocaja">
                                    <input type="text" readonly class="campowidthinput campo campotexto" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIVIG}"/>" name="FINIVIG" id="FINIVIG" size="15"
                                     title="<axis:alt f="axiscomi005" c="FINIVIG" lit="9000526"/>"/>
                                </td>      
                                <td class="titulocaja">
                                    <input type="text" readonly class="campowidthinput campo campotexto" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINVIG}"/>" name="FFINVIG" id="FFINVIG" size="15"
                                     title="<axis:alt f="axiscomi005" c="FFINVIG" lit="9000527"/>"/>
                                </td>
                            </tr>
                        </table>                     
                    
                      <!--  FIN SECCION -->
                      <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axiscomi005" c="SECCION" lit="102177" /></div>
                        <table class="area" align="center">
                            <tr>
                            <td>
                        <div class="separador">&nbsp;</div>
                            <!-- DisplayTag Pólizas -->
                            <c:set var="title1"><axis:alt f="axiscomi005" c="SPRODUC" lit="100829"/></c:set><!--Producto -->
                            <c:set var="title2"><axis:alt f="axiscomi005" c="TMODCON" lit="100943"/></c:set><!--Modalidad -->
                            <c:set var="title3"><axis:alt f="axiscomi005" c="PCOMISI" lit="101467"/></c:set><!--Porcentaje-->
                            <c:set var="title4"><axis:alt f="axiscomi005" c="DESPRODUCTO" lit="100829"/></c:set>
                            <c:set var="title9"><axis:alt f="axiscomi005" c="NINIALT" lit="104095"/></c:set><!--NINIALT-->
                            <c:set var="title10"><axis:alt f="axiscomi005" c="NFINALT" lit="103051"/></c:set><!--NFINALT-->
              <!-- TODOC: Pedir literales -->
                            <axis:visible f="axiscomi005" c="CCRITERIO">
                                <c:set var="title11"><axis:alt f="axiscomi005" c="NDESDE" lit="104095"/>(<axis:alt f="axiscomi005" c="CCRITERIO" lit="9901472"/>)</c:set><!--NDESDE-->
                                <c:set var="title12"><axis:alt f="axiscomi005" c="NHASTA" lit="103051"/>(<axis:alt f="axiscomi005" c="CCRITERIO" lit="9901472"/>)</c:set><!--NHASTA-->
                                <c:set var="title13"><axis:alt f="axiscomi005" c="CCRITERIO" lit="9901472"/></c:set><!--CCRITERIO-->
                            </axis:visible>
             <!-- TODOC: Pedir literales -->
                            <c:set var="selProd" value="${selectedProducto}" />
                            <c:set var="selModProd" value="${selectedModProducto}" />
                            <div class="seccion displayspaceGrande">
                                <display:table name="${sessionScope.axisctr_listaProductos}" id="listaProd" export="false" class="dsptgtable" pagesize="-1"  requestURI="modal_axiscomi005.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    
                                    <display:column title="" sortable="false" headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >    
                                        <div class="dspIcons"><input <c:if test="${listaProd.OB_IAX_DETCOMISION.SPRODUC==selProd && listaProd.OB_IAX_DETCOMISION.CMODCOM==selModProd}">checked="checked"</c:if> type="radio" id="selected" onclick="javascript:f_buscar_actividades('${listaProd['SSEGURO']}','${listaProd.OB_IAX_DETCOMISION.SPRODUC}','${listaProd.OB_IAX_DETCOMISION.CMODCOM}')" name="selected" /></div>
                                    </display:column>
                                    <display:column title="${title1}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable fixed"  media="html" autolink="false" >    
                                        <div class="dspText">${listaProd.OB_IAX_DETCOMISION.SPRODUC} - ${listaProd.OB_IAX_DETCOMISION.TTITULO}</div>
                                    </display:column>
                                    <display:column title="${title2}" sortable="true" sortProperty="NOMBRE" headerClass="sortable fixed" media="html" autolink="false" >
                                        <div class="dspText">${listaProd.OB_IAX_DETCOMISION.TMODCOM}</div>
                                    </display:column>
                                    <c:if test="${__configform.axiscomi005__PCOMISI__modificable == 'false' || listaProd.OB_IAX_DETCOMISION.PDESGLOSE == 1}">
                                        <display:column title="${title3}" sortable="true" sortProperty="SITUACION" headerClass="sortable fixed" media="html" autolink="false" >
                                            <div class="dspText">
                                                <fmt:formatNumber value="${listaProd.OB_IAX_DETCOMISION.PCOMISI}" pattern="#0.00"/>
                                            </div>
                                        </display:column>
                                    </c:if>
                                    <c:if test="${__configform.axiscomi005__PCOMISI__modificable != 'false'}">
                                        <c:if test="${listaProd.OB_IAX_DETCOMISION.PDESGLOSE == 0}">
                                        <display:column title="${title3}" sortable="true" sortProperty="SITUACION" headerClass="sortable fixed" media="html" autolink="false" >
                                            <div class="dspText"><input id="PCOMISI" name="PCOMISI" class="campowidthinput campo campotexto" type="text" value="<fmt:formatNumber value="${listaProd.OB_IAX_DETCOMISION.PCOMISI}" pattern="#0.00"/>" onchange="javascript:f_cargar_valor_porcentaje_n1(this.value,'${listaProd.OB_IAX_DETCOMISION.NINIALT}','${listaProd.OB_IAX_DETCOMISION.NFINALT}','${listaProd.OB_IAX_DETCOMISION.CMODCOM}','${listaProd.OB_IAX_DETCOMISION.NIVEL}',${listaProd.OB_IAX_DETCOMISION.SPRODUC},'${listaProd.OB_IAX_DETCOMISION.CGARANT}','${listaProd.OB_IAX_DETCOMISION.CACTIVI}')" /></div>
                                        </display:column>
                                        </c:if>
                                    </c:if>
                                    
                                    <axis:visible f="axiscomi005" c="NINIALT">
                                        <display:column title="${title9}" sortable="true" sortProperty="NINIALT" headerClass="sortable fixed" media="html" autolink="false" >
                                            <div class="dspText">
                                                <fmt:formatNumber value="${listaProd.OB_IAX_DETCOMISION.NINIALT}" pattern="##0"/>
                                            </div>
                                        </display:column>
                                    </axis:visible>
                                    
                                    <axis:visible f="axiscomi005" c="NFINALT">
                                        <display:column title="${title10}" sortable="true" sortProperty="NFINALT" headerClass="sortable fixed" media="html" autolink="false" >
                                            <div class="dspText">
                                                <fmt:formatNumber value="${listaProd.OB_IAX_DETCOMISION.NFINALT}" pattern="##0"/>
                                            </div>
                                        </display:column>
                                    </axis:visible>
                               <!-- TODOC: Nuevos campos para MSV --> 
                                    <axis:visible f="axiscomi005" c="CCRITERIO">
                                       <display:column title="${title13}" sortable="true" sortProperty="TCRITERIO" headerClass="sortable fixed" media="html" autolink="false" >
                                           <div class="dspText">${listaProd.OB_IAX_DETCOMISION.TCRITERIO}</div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible f="axiscomi005" c="NDESDE">
                                       <display:column title="${title11}" sortable="true" sortProperty="NDESDE" headerClass="sortable fixed" media="html" autolink="false" >
                                           <div class="dspText">
                                                <fmt:formatNumber pattern="##0" value="${listaProd.OB_IAX_DETCOMISION.NDESDE}"/>
                                            </div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible f="axiscomi005" c="NHASTA">
                                     <display:column title="${title12}" sortable="true" sortProperty="NHASTA" headerClass="sortable fixed" media="html" autolink="false" >
                                           <div class="dspText">
                                                <fmt:formatNumber pattern="##0" value="${listaProd.OB_IAX_DETCOMISION.NHASTA}"/>
                                            </div>
                                        </display:column>
                                    </axis:visible>
                                    
                                <!-- TODOC : Fin Nuevos campos para MSV -->
                                <c:if test="${__formdata.CESTADO != 2 && empty __formdata.CONSULTA}">
                                    <axis:visible f="axiscomi005" c="BUT_NIVELES">
                                        <display:column title="" sortable="false" media="html" autolink="false" headerClass="sortable" >
                                            <div class="dspIcons">
                                                <img border="0" alt="<axis:alt f="axiscomi005" c="NIVELES" lit="9902456"/>" title1="<axis:alt f="axiscomi005" c="NIVELES" lit="9902456"/>" src="images/lapiz.gif" 
                                                 style="cursor:pointer;" onclick="javascript:f_abrir_axiscomi011 (${listaProd.OB_IAX_DETCOMISION.SPRODUC},'${listaProd.OB_IAX_DETCOMISION.CACTIVI}','${listaProd.OB_IAX_DETCOMISION.CGARANT}','${listaProd.OB_IAX_DETCOMISION.CCOMISI}','${listaProd.OB_IAX_DETCOMISION.CMODCOM}','<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIVIG}"/>')"/>
                                            </div>
                                        </display:column>
                                    </axis:visible>
                                    </c:if>
                                    <c:if test="${__formdata.CESTADO != 2 && empty __formdata.CONSULTA}">
                                    <axis:visible f="axiscomi005" c="BUT_DESGLOSE">
                                        <display:column title="" sortable="false" media="html" autolink="false" headerClass="sortable" >
                                            <div class="dspIcons">
                                                <img border="0" alt="<axis:alt f="axiscomi005" c="DESGLOSE" lit="9904656"/>" title1="<axis:alt f="axiscomi005" c="DESGLOSE" lit="9904656"/>" src="images/lapiz.gif" 
                                                 style="cursor:pointer;" onclick="javascript:f_abrir_axiscomi012 ('${listaProd.OB_IAX_DETCOMISION.CACTIVI}','${listaProd.OB_IAX_DETCOMISION.CGARANT}','${listaProd.OB_IAX_DETCOMISION.CCOMISI}','${listaProd.OB_IAX_DETCOMISION.CMODCOM}','<fmt:formatDate pattern="dd/MM/yyyy" value="${listaProd.OB_IAX_DETCOMISION.FINIVIG}"/>','${listaProd.OB_IAX_DETCOMISION.NINIALT}','${listaProd.OB_IAX_DETCOMISION.SPRODUC}','${listaProd.OB_IAX_DETCOMISION.NFINALT}','${listaProd.OB_IAX_DETCOMISION.NIVEL}')"/>
                                             </div>
                                        </display:column>
                                    </axis:visible>
                                    </c:if>
                                    <c:if test="${__formdata.CESTADO != 2 && empty __formdata.CONSULTA}">
                                    <axis:visible f="axiscomi005" c="BUT_DELDESGLOSE">
                                        <display:column title="" sortable="false" media="html" autolink="false" headerClass="sortable" >
                                            <div class="dspIcons">
                                                <img border="0" alt="<axis:alt f="axiscomi005" c="DELDESGLOSE" lit="9904657"/>" title1="<axis:alt f="axiscomi005" c="DESGLOSE" lit="9904657"/>" src="images/delete.gif" 
                                                 style="cursor:pointer;" onclick="javascript:f_borrar_desglose('${listaProd.OB_IAX_DETCOMISION.CACTIVI}','${listaProd.OB_IAX_DETCOMISION.CGARANT}','${listaProd.OB_IAX_DETCOMISION.CCOMISI}','${listaProd.OB_IAX_DETCOMISION.CMODCOM}','<fmt:formatDate pattern="dd/MM/yyyy" value="${listaProd.OB_IAX_DETCOMISION.FINIVIG}"/>','${listaProd.OB_IAX_DETCOMISION.NINIALT}','${listaProd.OB_IAX_DETCOMISION.SPRODUC}','${listaProd.OB_IAX_DETCOMISION.NFINALT}')"/>
                                             </div>
                                        </display:column>
                                    </axis:visible>
                                     </c:if>
                                </display:table>
                                <c:choose>
                                <c:when test="${!empty sessionScope.axisctr_listaPolizas}">
                                    <script language="javascript">objUtiles.retocarDsptagtable("miListaId");</script>
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
                            
                            <!-- ************************************************************ -->
  
                            <tr>
                <td>
            <axis:visible f="axiscomi005" c="DSP_GARANIAS_ACTIVI">
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axiscomi005" c="SECC2" lit="103477" /></div>
                <table class="area" align="center">
                    <tr>
                        <td>
                                <div class="separador">&nbsp;</div>
                            <!-- DisplayTag Pólizas -->
                                <c:set var="title1"><axis:alt f="axiscomi005" c="CACTIVI" lit="103481"/></c:set><!--Actividad -->
                                <c:set var="title2"><axis:alt f="axiscomi005" c="TMODCOM" lit="100943"/></c:set><!-- Modalidad -->
                                <c:set var="title3"><axis:alt f="axiscomi005" c="PCOMISI" lit="101467"/></c:set><!-- Porcentaje -->
                                <c:set var="title4"><axis:alt f="axiscomi005" c="DESPRODUCTO" lit="100829"/></c:set>
                                <c:set var="title9"><axis:alt f="axiscomi005" c="NINIALT" lit="104095"/></c:set><!--NINIALT-->
                                <c:set var="title10"><axis:alt f="axiscomi005" c="NFINALT" lit="103051"/></c:set><!--NFINALT-->
                                <!-- TODOC: Pedir literales -->
                             <axis:visible f="axiscomi005" c="CCRITERIO">
                                <c:set var="title11"><axis:alt f="axiscomi005" c="NDESDE" lit="104095"/>(<axis:alt f="axiscomi005" c="CCRITERIO" lit="9901472"/>)</c:set><!--NDESDE-->
                                <c:set var="title12"><axis:alt f="axiscomi005" c="NHASTA" lit="103051"/>(<axis:alt f="axiscomi005" c="CCRITERIO" lit="9901472"/>)</c:set><!--NHASTA-->
                                <c:set var="title13"><axis:alt f="axiscomi005" c="CCRITERIO" lit="9901472"/></c:set><!--CCRITERIO-->
                            </axis:visible>
                               <!-- TODOC: Pedir literales -->
                               
                                <div class="seccion displayspaceGrande">
                                <c:set var="selAct" value="${selectedActividad}" />
                                <c:set var="selModAct" value="${selectedModActividad}" />
                                <display:table name="${sessionScope.axisctr_listaActividades}" id="listaAct" export="false" class="dsptgtable" pagesize="-1" requestURI="modal_axiscomi005.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title="" sortable="false" headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >    
                                        <div class="dspIcons"><input <c:if test="${listaAct.OB_IAX_DETCOMISION.CACTIVI==selAct && listaAct.OB_IAX_DETCOMISION.CMODCOM==selModAct}">checked="checked"</c:if> type="radio"  id="xxx" onclick="javascript:f_buscar_garantias('${listaGar['SSEGURO']}','${listaAct.OB_IAX_DETCOMISION.CACTIVI}','${listaAct.OB_IAX_DETCOMISION.SPRODUC}', '${listaAct.OB_IAX_DETCOMISION.CMODCOM}')" name="xxx" value=""/></div>
                                    </display:column>
                                    <display:column title="${title1}" sortable="true" sortProperty="CACTIVI" headerClass="sortable fixed"  media="html" autolink="false" >    
                                        <div class="dspText">${listaAct.OB_IAX_DETCOMISION.CACTIVI} - ${listaAct.OB_IAX_DETCOMISION.TACTIVI}</div>
                                    </display:column>
                                    <display:column title="${title2}" sortable="true" sortProperty="TMODCOM" headerClass="sortable fixed" media="html" autolink="false" >
                                        <div class="dspText">${listaAct.OB_IAX_DETCOMISION.TMODCOM}</div>
                                    </display:column>
                                    
                                    <axis:visible f="axiscomi005" c="ACTIVITAT">
                                        <c:if test="${__configform.axiscomi005__PCOMISI__modificable == 'false'|| listaAct.OB_IAX_DETCOMISION.PDESGLOSE == 1}">
                                            <display:column title="${title3}" sortable="true" sortProperty="SITUACION" headerClass="sortable fixed" media="html" autolink="false" >
                                                <div class="dspText">
                                                    <fmt:formatNumber value="${listaAct.OB_IAX_DETCOMISION.PCOMISI}" pattern="#0.00"/>
                                                </div>
                                            </display:column>
                                        </c:if>
                                        <c:if test="${__configform.axiscomi005__PCOMISI__modificable != 'false'}">
                                        <c:if test="${listaAct.OB_IAX_DETCOMISION.PDESGLOSE == 0}">
                                            <display:column title="${title3}" sortable="true" sortProperty="SITUACION" headerClass="sortable fixed" media="html" autolink="false" >
                                                <div class="dspText"><input id="PCOMISI" name="PCOMISI" class="campowidthinput campo campotexto" type="text" value="<fmt:formatNumber value="${listaAct.OB_IAX_DETCOMISION.PCOMISI}" pattern="#0.00"/>" onchange="javascript:f_cargar_valor_porcentaje_n2(this.value,'${listaProd.OB_IAX_DETCOMISION.NINIALT}','${listaProd.OB_IAX_DETCOMISION.NFINALT}','${listaAct.OB_IAX_DETCOMISION.CMODCOM}','${listaAct.OB_IAX_DETCOMISION.NIVEL}',${listaAct.OB_IAX_DETCOMISION.SPRODUC},'${listaAct.OB_IAX_DETCOMISION.CGARANT}','${listaAct.OB_IAX_DETCOMISION.CACTIVI}')" /></div>
                                            </display:column>
                                            </c:if>
                                        </c:if>
                                        
                                        <axis:visible f="axiscomi005" c="NINIALT">
                                            <display:column title="${title9}" sortable="true" sortProperty="NINIALT" headerClass="sortable fixed" media="html" autolink="false" >
                                                <div class="dspText">
                                                    <fmt:formatNumber value="${listaAct.OB_IAX_DETCOMISION.NINIALT}" pattern="##0"/>
                                                </div>
                                            </display:column>
                                        </axis:visible>
                                        
                                        <axis:visible f="axiscomi005" c="NFINALT">
                                            <display:column title="${title10}" sortable="true" sortProperty="NFINALT" headerClass="sortable fixed" media="html" autolink="false" >
                                                <div class="dspText">
                                                    <fmt:formatNumber value="${listaAct.OB_IAX_DETCOMISION.NFINALT}" pattern="##0"/>
                                                </div>
                                            </display:column>
                                        </axis:visible>
                                    <!-- TODOC: Nuevos campos para MSV --> 
                                    <axis:visible f="axiscomi005" c="CCRITERIO">
                                       <<display:column title="${title13}" sortable="true" sortProperty="TCRITERIO" headerClass="sortable fixed" media="html" autolink="false" >
                                           <div class="dspText">${listaAct.OB_IAX_DETCOMISION.TCRITERIO}</div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible f="axiscomi005" c="NDESDE">
                                       <display:column title="${title11}" sortable="true" sortProperty="NDESDE" headerClass="sortable fixed" media="html" autolink="false" >
                                           <div class="dspText">
                                                <fmt:formatNumber pattern="##0" value="${listaAct.OB_IAX_DETCOMISION.NDESDE}"/>
                                            </div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible f="axiscomi005" c="NHASTA">
                                     <display:column title="${title12}" sortable="true" sortProperty="NHASTA" headerClass="sortable fixed" media="html" autolink="false" >
                                           <div class="dspText">
                                                <fmt:formatNumber pattern="##0" value="${listaAct.OB_IAX_DETCOMISION.NHASTA}"/>
                                            </div>
                                        </display:column>
                                    </axis:visible>
                                <!-- TODOC : Fin Nuevos campos para MSV -->
                                <c:if test="${__formdata.CESTADO != 2 && empty __formdata.CONSULTA}">
                                        <axis:visible f="axiscomi005" c="BUT_NIVELES">
                                            <display:column title="" sortable="false" media="html" autolink="false" headerClass="sortable" >
                                                <div class="dspIcons">
                                                    <img border="0" alt="<axis:alt f="axiscomi005" c="NIVELES" lit="9902456"/>" title1="<axis:alt f="axiscomi005" c="NIVELES" lit="9902456"/>" src="images/lapiz.gif" 
                                                     style="cursor:pointer;" onclick="javascript:f_abrir_axiscomi011 (${listaAct.OB_IAX_DETCOMISION.SPRODUC},'${listaAct.OB_IAX_DETCOMISION.CACTIVI}','${listaAct.OB_IAX_DETCOMISION.CGARANT}','${listaAct.OB_IAX_DETCOMISION.CCOMISI}','${listaAct.OB_IAX_DETCOMISION.CMODCOM}','<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIVIG}"/>')"/>
                                                </div>
                                            </display:column>
                                        </axis:visible>
                                </c:if>
                                    </axis:visible>
                                
                                     <c:if test="${__formdata.CESTADO != 2 && empty __formdata.CONSULTA}">
                                    <axis:visible f="axiscomi005" c="BUT_DESGLOSE">
                                        <display:column title="" sortable="false" media="html" autolink="false" headerClass="sortable" >
                                            <div class="dspIcons">
                                                <img border="0" alt="<axis:alt f="axiscomi005" c="DESGLOSE" lit="9904656"/>" title1="<axis:alt f="axiscomi005" c="DESGLOSE" lit="9904656"/>" src="images/lapiz.gif" 
                                                 style="cursor:pointer;" onclick="javascript:f_abrir_axiscomi012 ('${listaAct.OB_IAX_DETCOMISION.CACTIVI}','${listaAct.OB_IAX_DETCOMISION.CGARANT}','${listaAct.OB_IAX_DETCOMISION.CCOMISI}','${listaAct.OB_IAX_DETCOMISION.CMODCOM}','<fmt:formatDate pattern="dd/MM/yyyy" value="${listaAct.OB_IAX_DETCOMISION.FINIVIG}"/>','${listaAct.OB_IAX_DETCOMISION.NINIALT}','${listaAct.OB_IAX_DETCOMISION.SPRODUC}','${listaAct.OB_IAX_DETCOMISION.NFINALT}','${listaAct.OB_IAX_DETCOMISION.NIVEL}')"/>
                                             </div>
                                        </display:column>
                                    </axis:visible>
                                    </c:if>
                                    <c:if test="${__formdata.CESTADO != 2 && empty __formdata.CONSULTA}">
                                    <axis:visible f="axiscomi005" c="BUT_DELDESGLOSE">
                                        <display:column title="" sortable="false" media="html" autolink="false" headerClass="sortable" >
                                            <div class="dspIcons">
                                                <img border="0" alt="<axis:alt f="axiscomi005" c="DELDESGLOSE" lit="9904657"/>" title1="<axis:alt f="axiscomi005" c="DESGLOSE" lit="9904657"/>" src="images/delete.gif" 
                                                 style="cursor:pointer;" onclick="javascript:f_borrar_desglose('${listaAct.OB_IAX_DETCOMISION.CACTIVI}','${listaAct.OB_IAX_DETCOMISION.CGARANT}','${listaAct.OB_IAX_DETCOMISION.CCOMISI}','${listaAct.OB_IAX_DETCOMISION.CMODCOM}','<fmt:formatDate pattern="dd/MM/yyyy" value="${listaAct.OB_IAX_DETCOMISION.FINIVIG}"/>','${listaAct.OB_IAX_DETCOMISION.NINIALT}','${listaAct.OB_IAX_DETCOMISION.SPRODUC}','${listaAct.OB_IAX_DETCOMISION.NFINALT}')"/>
                                             </div>
                                        </display:column>
                                    </axis:visible>
                                     </c:if>
                                </display:table>
                                <c:choose>
                                <c:when test="${!empty sessionScope.axisctr_listaPolizas}">
                                    <script language="javascript">objUtiles.retocarDsptagtable("miListaId");</script>
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
                    <tr>
                        <td>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axiscomi005" c="SECC·" lit="102083" /></div>
                        <table class="area" align="center">
                            <tr>
                            <td>
                            
                            <div class="separador">&nbsp;</div>
                            <!-- DisplayTag Pólizas -->
                            <c:set var="title1"><axis:alt f="axiscomi005" c="CGARANT" lit="110994"/></c:set><!-- Garantia -->
                            <c:set var="title2"><axis:alt f="axiscomi005" c="TMODCOM" lit="100943"/></c:set><!-- Modalidad -->
                            <c:set var="title3"><axis:alt f="axiscomi005" c="PCOMISI" lit="101467"/></c:set><!-- procentaje -->
                            <c:set var="title4"><axis:alt f="axiscomi005" c="DESPRODUCTO" lit="100829"/></c:set>
                            <c:set var="title9"><axis:alt f="axiscomi005" c="NINIALT" lit="104095"/></c:set><!--NINIALT-->
                            <c:set var="title10"><axis:alt f="axiscomi005" c="NFINALT" lit="103051"/></c:set><!--NFINALT-->
                            
                            <!-- TODOC: Pedir literales -->
                             <axis:visible f="axiscomi005" c="CCRITERIO">
                                  <c:set var="title11"><axis:alt f="axiscomi005" c="NDESDE" lit="104095"/>(<axis:alt f="axiscomi005" c="CCRITERIO" lit="9901472"/>)</c:set><!--NDESDE-->
                                  <c:set var="title12"><axis:alt f="axiscomi005" c="NHASTA" lit="103051"/>(<axis:alt f="axiscomi005" c="CCRITERIO" lit="9901472"/>)</c:set><!--NHASTA-->
                                  <c:set var="title13"><axis:alt f="axiscomi005" c="CCRITERIO" lit="9901472"/></c:set><!--CCRITERIO-->
                            </axis:visible>
                             <!-- TODOC: Pedir literales -->
                            
                            <div class="seccion displayspaceGrande">
                                <display:table name="${sessionScope.axisctr_listaGarantias}" id="listaGar" export="false" class="dsptgtable" pagesize="-1" requestURI="modal_axiscomi005.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <%--display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                        <div class="dspIcons"><input <c:if test="${listaGar['checkedPoliza']}">checked</c:if> type="radio"  id="checked_poliza" name="checked_poliza" value="${listaGar['SSEGURO']}"/></div>
                                    </display:column--%>
                                    <display:column title="${title1}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable fixed"  media="html" autolink="false" >    
                                        <div class="dspText">${listaGar.OB_IAX_DETCOMISION.CGARANT} - ${listaGar.OB_IAX_DETCOMISION.TGARANT}</div>
                                    </display:column>
                                    <display:column title="${title2}" sortable="true" sortProperty="NOMBRE" headerClass="sortable fixed" media="html" autolink="false" >
                                        <div class="dspText">${listaGar.OB_IAX_DETCOMISION.TMODCOM}</div>
                                    </display:column>
                                    <c:if test="${__configform.axiscomi005__PCOMISI__modificable == 'false' || listaGar.OB_IAX_DETCOMISION.PDESGLOSE == 1}">
                                        <display:column title="${title3}" sortable="true" sortProperty="SITUACION" headerClass="sortable fixed" media="html" autolink="false" >
                                            <div class="dspText">
                                                <fmt:formatNumber value="${listaGar.OB_IAX_DETCOMISION.PCOMISI}" pattern="#0.00"/>
                                            </div>
                                        </display:column>
                                    </c:if>
                                    <c:if test="${__configform.axiscomi005__PCOMISI__modificable != 'false'}">
                                        <c:if test="${listaGar.OB_IAX_DETCOMISION.PDESGLOSE == 0}">
                                        <display:column title="${title3}" sortable="true" sortProperty="SITUACION" headerClass="sortable fixed" media="html" autolink="false" >
                                            <div class="dspText"><input id="PCOMISI" name="PCOMISI" class="campowidthinput campo campotexto" type="text" value="<fmt:formatNumber value="${listaGar.OB_IAX_DETCOMISION.PCOMISI}" pattern="#0.00"/>"   onchange="javascript:f_cargar_valor_porcentaje_n3(this.value,'${listaProd.OB_IAX_DETCOMISION.NINIALT}','${listaProd.OB_IAX_DETCOMISION.NFINALT}','${listaGar.OB_IAX_DETCOMISION.CMODCOM}','${listaGar.OB_IAX_DETCOMISION.NIVEL}',${listaGar.OB_IAX_DETCOMISION.SPRODUC},'${listaGar.OB_IAX_DETCOMISION.CGARANT}','${listaGar.OB_IAX_DETCOMISION.CACTIVI}')" /></div>
                                        </display:column>
                                        </c:if>
                                    </c:if>
                                    
                                    <axis:visible f="axiscomi005" c="NINIALT">
                                        <display:column title="${title9}" sortable="true" sortProperty="NINIALT" headerClass="sortable fixed" media="html" autolink="false" >
                                            <div class="dspText">
                                                <fmt:formatNumber value="${listaGar.OB_IAX_DETCOMISION.NINIALT}" pattern="##0"/>
                                            </div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible f="axiscomi005" c="NFINALT">
                                        <display:column title="${title10}" sortable="true" sortProperty="NFINALT" headerClass="sortable fixed" media="html" autolink="false" >
                                            <div class="dspText">
                                                <fmt:formatNumber value="${listaGar.OB_IAX_DETCOMISION.NFINALT}" pattern="##0"/>
                                            </div>
                                        </display:column>
                                    </axis:visible>
               <!-- TODOC: Nuevos campos para MSV --> 
                                    <axis:visible f="axiscomi005" c="CCRITERIO">
                                      <display:column title="${title13}" sortable="true" sortProperty="TCRITERIO" headerClass="sortable fixed" media="html" autolink="false" >
                                           <div class="dspText">${listaGar.OB_IAX_DETCOMISION.TCRITERIO}</div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible f="axiscomi005" c="NDESDE">
                                       <display:column title="${title11}" sortable="true" sortProperty="NDESDE" headerClass="sortable fixed" media="html" autolink="false" >
                                           <div class="dspText">
                                                <fmt:formatNumber pattern="##0" value="${listaGar.OB_IAX_DETCOMISION.NDESDE}"/>
                                            </div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible f="axiscomi005" c="NHASTA">
                                     <display:column title="${title12}" sortable="true" sortProperty="NHASTA" headerClass="sortable fixed" media="html" autolink="false" >
                                           <div class="dspText">
                                                <fmt:formatNumber pattern="##0" value="${listaGar.OB_IAX_DETCOMISION.NHASTA}"/>
                                            </div>
                                        </display:column>
                                    </axis:visible>
                                    
                                <!-- TODOC : Fin Nuevos campos para MSV -->
                                <c:if test="${__formdata.CESTADO != 2 && empty __formdata.CONSULTA}">
                                    <axis:visible f="axiscomi005" c="BUT_NIVELES">
                                        <display:column title="" sortable="false" media="html" autolink="false" headerClass="sortable" >
                                            <div class="dspIcons">
                                                <img border="0" alt="<axis:alt f="axiscomi005" c="NIVELES" lit="9902456"/>" title1="<axis:alt f="axiscomi005" c="NIVELES" lit="9902456"/>" src="images/lapiz.gif" 
                                                 style="cursor:pointer;" onclick="javascript:f_abrir_axiscomi011 (${listaGar.OB_IAX_DETCOMISION.SPRODUC},'${listaGar.OB_IAX_DETCOMISION.CACTIVI}','${listaGar.OB_IAX_DETCOMISION.CGARANT}','${listaGar.OB_IAX_DETCOMISION.CCOMISI}','${listaGar.OB_IAX_DETCOMISION.CMODCOM}','<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIVIG}"/>')"/>
                                            </div>
                                        </display:column>
                                    </axis:visible>
                                    </c:if>
                                    <c:if test="${__formdata.CESTADO != 2 && empty __formdata.CONSULTA}">
                                    <axis:visible f="axiscomi005" c="BUT_DESGLOSE">
                                        <display:column title="" sortable="false" media="html" autolink="false" headerClass="sortable" >
                                            <div class="dspIcons">
                                                <img border="0" alt="<axis:alt f="axiscomi005" c="DESGLOSE" lit="9904656"/>" title1="<axis:alt f="axiscomi005" c="DESGLOSE" lit="9904656"/>" src="images/lapiz.gif" 
                                                 style="cursor:pointer;" onclick="javascript:f_abrir_axiscomi012 ('${listaGar.OB_IAX_DETCOMISION.CACTIVI}','${listaGar.OB_IAX_DETCOMISION.CGARANT}','${listaGar.OB_IAX_DETCOMISION.CCOMISI}','${listaGar.OB_IAX_DETCOMISION.CMODCOM}','<fmt:formatDate pattern="dd/MM/yyyy" value="${listaGar.OB_IAX_DETCOMISION.FINIVIG}"/>','${listaGar.OB_IAX_DETCOMISION.NINIALT}','${listaGar.OB_IAX_DETCOMISION.SPRODUC}','${listaGar.OB_IAX_DETCOMISION.NFINALT}','${listaGar.OB_IAX_DETCOMISION.NIVEL}')"/>
                                             </div>
                                        </display:column>
                                    </axis:visible>
                                    </c:if>
                                    <c:if test="${__formdata.CESTADO != 2 && empty __formdata.CONSULTA}">
                                    <axis:visible f="axiscomi005" c="BUT_DELDESGLOSE">
                                        <display:column title="" sortable="false" media="html" autolink="false" headerClass="sortable" >
                                            <div class="dspIcons">
                                                <img border="0" alt="<axis:alt f="axiscomi005" c="DELDESGLOSE" lit="9904657"/>" title1="<axis:alt f="axiscomi005" c="DESGLOSE" lit="9904657"/>" src="images/delete.gif" 
                                                 style="cursor:pointer;" onclick="javascript:f_borrar_desglose('${listaGar.OB_IAX_DETCOMISION.CACTIVI}','${listaGar.OB_IAX_DETCOMISION.CGARANT}','${listaGar.OB_IAX_DETCOMISION.CCOMISI}','${listaGar.OB_IAX_DETCOMISION.CMODCOM}','<fmt:formatDate pattern="dd/MM/yyyy" value="${listaGar.OB_IAX_DETCOMISION.FINIVIG}"/>','${listaGar.OB_IAX_DETCOMISION.NINIALT}','${listaGar.OB_IAX_DETCOMISION.SPRODUC}','${listaGar.OB_IAX_DETCOMISION.NFINALT}')"/>
                                             </div>
                                        </display:column>
                                    </axis:visible>
                                     </c:if>
                                </display:table>
                                <c:choose>
                                <c:when test="${!empty sessionScope.axisctr_listaPolizas}">
                                    <script language="javascript">objUtiles.retocarDsptagtable("miListaId");</script>
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
                        </td>
                    </tr>
                            
                            <!-- ************************************************************ -->
                            </table>
                 </axis:visible>
                    </td>
                </tr>
                
                
                </table>
                </td>
                </tr>
                
            </table>
            <c:choose>
            <c:when test="${__formdata.CESTADO != 2 && empty __formdata.CONSULTA}">
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axiscomi005</c:param><c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
            </c:when>
            <c:otherwise>
             <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axiscomi005</c:param><c:param name="__botones">cancelar</c:param>
             </c:import>
            </c:otherwise>
            </c:choose>
     </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>

