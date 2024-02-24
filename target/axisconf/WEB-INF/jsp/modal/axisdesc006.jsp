<%
/**
*  Fichero: axisdesc006.jsp
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
    
    <script language="Javascript" type="text/javascript">
        function f_onload() {
            var ok = '${__formdata.OK}';
            if ( !objUtiles.estaVacio(ok) && ok == 0)
                parent.f_cerrar_axisdesc006();
        
        revisarEstilos();
        f_carga_dependencias();
            
            //document.miForm.NPOLIZA.focus(); 
            // Retocar tabla en IE
            if (document.all) {// ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
            }
            
            var dataInicio = document.getElementById("FINIVIG");
            
            if (document.getElementById("MODO").value=='MODIFICAR'){
                dataInicio.setAttribute("readonly",true);
            }else{
                //dataInicio.setAttribute("readonly","");
            }
            
            f_cargar_propiedades_pantalla();
            
            
            
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axisdesc006();
        }        
        
        function f_but_buscar() {
          if (objValidador.validaEntrada()) objUtiles.ejecutarFormulario("modal_axisdesc006.do", "buscar", document.miForm, "_self", objJsMessages.jslit_buscando_polizas);
        }
         
        function f_but_aceptar () {
           <c:if test="${__configform.axisdesc006__PDESC__modificable != 'false'}">
                objUtiles.ejecutarFormulario("modal_axisdesc006.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando); 
           </c:if>
           <c:if test="${__configform.axisdesc006__PDESC__modificable == 'false'}">
                f_but_cancelar();
           </c:if>
         }

         function f_cargar_descuentos(){
            CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
            if (!objUtiles.estaVacio (CRAMO) ){
                objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
            }else
                objDom.setValorComponente(document.miForm.CRAMO, null);
                objAjax.invokeAsyncCGI("modal_axisdesc006.do", callbackAjaxCargarDescuentos, "operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO) + 
                "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value, this, objJsMessages.jslit_cargando);
        }     
        
        
        function f_buscar_actividades(VALOR){
            //alert(PRODUCTO);
            document.miForm.selectedActividad.value=VALOR;
            document.miForm.selectedGarantia.value=null;
            
             if (objValidador.validaEntrada()) 
                objUtiles.ejecutarFormulario("modal_axisdesc006.do?CNIVEL=2", "form", document.miForm, "_self", objJsMessages.jslit_buscando_polizas);
        
        }
        
        function f_buscar_garantias(VALOR){
             
            document.miForm.selectedGarantia.value=VALOR;
             
            if (objValidador.validaEntrada()) 
                objUtiles.ejecutarFormulario("modal_axisdesc006.do?CNIVEL=3", "form", document.miForm, "_self", objJsMessages.jslit_buscando_polizas);
        
        }
        
        function callbackAjaxCargarDescuentos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    
                    var SPRODUCCombo = document.miForm.SPRODUC;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisdesc006" c="COMBOSVALOR" lit="108341"/> - ', SPRODUCCombo, 0);
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
                    objLista.borrarFilasDeLista ("miListaId", "5", "<axis:alt f='axisdesc006' c='NOREGISTRES' lit='1000254' />");
                    var spanners = document.getElementsByTagName("span");
                    for(var i=0;i<spanners.length;i++) {
                        if (spanners[i].className == "gridpagebanner")
                            spanners[i].innerHTML = "";
                        if (spanners[i].className == "gridpagelinks")
                            spanners[i].innerHTML = ""; 
                    }
               } catch(e){alert(e);}
            }
            
         function f_cargar_valor_porcentaje(CDESC,SPRODUC,CACTIVI,CGARANT,CNIVEL,CCODMOD,PDESC){
                if (objValidador.validaEntrada()) {
                    objAppMensajes.vaciarYEsconderMensajes();
                    var FINIVIG = objDom.getValorPorId("FINIVIG");
                    if (!objUtiles.estaVacio(PDESC) )
                        if(objNumero.validaNumero(PDESC, true)) {
                            objAjax.invokeAsyncCGI("modal_axisdesc006.do", callbackAjaxCargarDescuentos, "operation=ajax_guardar_porcentaje&CDESC="+CDESC+"&SPRODUC="+SPRODUC+"&CACTIVI="+CACTIVI+"&CGARANT="+CGARANT+"&CNIVEL="+CNIVEL+"&CCODMOD="+CCODMOD+"&PDESC="+PDESC+"&FINIVIG="+FINIVIG,this, objJsMessages.jslit_cargando);
                        }else{
                            objAppMensajes.pintarMensajePantalla('<axis:alt f="axisdesc006" c="FINCORRECTO" lit="50000" />', "info"); 
                        }
                }
            }      
        
            function callbackAjaxCargarDescuentos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){

                }
            }
            
            function f_but_acttfecha(){
                if (objValidador.validaEntrada()) {
                    objUtiles.ejecutarFormulario("modal_axisdesc006.do?", "act_fecha", document.miForm, "_self", objJsMessages.jslit_buscando_polizas);
                }
            }
            
            function f_abrir_axisdesc011 (sproduc,cactivi,cgarant,cdesc,cmodcom,finivig) {
                objUtiles.abrirModal("axisdesc011", "src", "modal_axisdesc011.do?operation=init&PSPRODUC=" + sproduc+"&PCACTIVI="+cactivi+"&PCGARANT="+cgarant+"&PCDESC="+cdesc+"&PCMODCOM="+cmodcom+"&PFINIVIG="+finivig);
             }
            
            
             function f_cerrar_modal (pform) {
                objUtiles.cerrarModal(pform);
                if(pform=='axisdesc011') objUtiles.ejecutarFormulario("modal_axisdesc006.do", "init", document.miForm, "_self", objJsMessages.jslit_cargando);
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
            <input type="hidden" id="SPRODUC" name="SPRODUC" value="${SPRODUC}"/>
            <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
            <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
            <input type="hidden" id="MODO" name="MODO" value="${__formdata.MODO}"/>
            <input type="hidden" id="TIPO" name="TIPO" value="${__formdata.TIPO}"/>
            <input type="hidden" id="selectedProducto" name="selectedProducto" value="${selectedProducto}"/>
            <input type="hidden" id="selectedActividad" name="selectedActividad" value="${selectedActividad}"/>
            <input type="hidden" id="selectedGarantia" name="selectedGarantia" value="${selectedGarantia}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisdesc006" c="TITULO" lit="9903507" /></c:param>
                <c:param name="producto"><axis:alt f="axisdesc006" c="TITULO" lit="9903507"/></c:param>
                <c:param name="form">axisdesc006</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisdesc006" c="NIVELES" lit="9902456" /></c:param>
                <c:param name="nid" value="axisdesc011" />
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                    <!-- cabecera     -->
                        <table class="seccion" id="LISTA">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisdesc006" c="PRODUCTO" lit="100829" /></b><!-- Producto -->
                                </td>
                                <td class="titulocaja">
                                </td>
                                <td class="titulocaja">
                                </td>
                                <td class="titulocaja">
                                </td>
                                <td class="titulocaja">
                                </td>
                            </tr>
                            <tr>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${TSPRODUC}" readonly name="TSPRODUC" id="TSPRODUC"/>
                                </td>
                                <td class="campocaja">
                                </td>
                                <td class="campocaja">
                                </td>
                                <td class="campocaja">
                                </td>
                            </tr>
                        </table>
                    <!-- fin cabecera -->
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisdesc006" c="DESCXPRODUCT" lit="9903502" /></div>
                        <c:if test="${__formdata.TIPO == 1}">
                        <table class="seccion" align="center"><!-- area -->
                            <!-- PRIMERA SECCION -->
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:5%;height:0px"></th>
                                <th style="width:75%;height:0px"></th>
                            </tr>
                            
                            <axis:ocultar c="FINIVIG" f="axisdesc006" dejarHueco="false">
                                <tr>
                                    <td class="campocaja">
                                        <b id="label_FINIVIG"><axis:alt f="axisdesc008" c="FINIVIG" lit="9000716"/></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="campocaja">
                                        <input type="text" id="FINIVIG" name="FINIVIG" class="campowidthinput campo campotexto"
                                        <axis:atr f="axisdesc006" c="FINIVIG" a="modificable=true&obligatorio=true&formato=fecha"/>
                                        size="15" style="width:75%" value="${__formdata.FINIVIG}"/>
                                        <a id="icon_FINIVIG" style="vertical-align:middle;"><img  
                                        alt="<axis:alt f="axisdesc008" c="FINIVIG" lit="9000716"/>" title="<axis:alt f="axisdesc008" c="FINIVIG" lit="9000716"/>" src="images/calendar.gif"/></a>
                                    </td>
                                    <c:if test="${empty __formdata.FINIVIG}">
                                    <td class="campocaja">
                                        <input type="button" class="boton" id="but_acttfecha" value="<axis:alt f="axisdesc006" c="DUPLICAR" lit="103669"/>" onclick="f_but_acttfecha()" />
                                    </td>
                                    </c:if>
                                </tr>
                            </axis:ocultar>
                            
                            <c:if test="${!empty __formdata.FINIVIG}">
                            <tr>
                                <td colspan="3"> 
                                    <div class="separador">&nbsp;</div>
                                    <!-- DisplayTag Pólizas -->
                                    <c:set var="title1"><axis:alt f="axisdesc006" c="CUADRO" lit="9000617"/></c:set><!--Cuadro -->
                                    <c:set var="title2"><axis:alt f="axisdesc006" c="MODALIDAD" lit="100943"/></c:set><!--Modalidad -->
                                    <c:set var="title3"><axis:alt f="axisdesc006" c="PORCENTAJE" lit="101467"/></c:set><!--Porcentaje-->
                                    <c:set var="title4"><axis:alt f="axisdesc006" c="PRODUCTO" lit="100829"/></c:set>
                                    <c:set var="title9"><axis:alt f="axisdesc006" c="NINIALT" lit="104095"/></c:set><!--NINIALT-->
                                    <c:set var="title10"><axis:alt f="axisdesc006" c="NFINALT" lit="103051"/></c:set><!--NFINALT-->
                                    <c:set var="selProd" value="${selectedProducto}" />
                                    <div class="seccion displayspaceGrande">
                                    <display:table name="${axisctr_listaProductos}" id="listaProd" export="false" class="dsptgtable" pagesize="-1"  requestURI="modal_axisdesc006.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="${title1}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable"  media="html" autolink="false" >    
                                            <div class="dspText">${listaProd.OB_IAX_DETDESCUENTO.TDESC}</div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="true" sortProperty="NOMBRE" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspText">${listaProd.OB_IAX_DETDESCUENTO.TMODCOM}</div>
                                        </display:column>
                                        
                                        <c:if test="${__configform.axisdesc006__PDESC__modificable == 'false'}">
                                            <display:column title="${title3}" sortable="true" sortProperty="SITUACION" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">
                                                    <fmt:formatNumber value="${listaProd.OB_IAX_DETDESCUENTO.PDESC}" pattern="###,#0.00"/>
                                                </div>
                                            </display:column>
                                        </c:if>
                                        <c:if test="${__configform.axisdesc006__PDESC__modificable != 'false'}">
                                            <display:column title="${title3}" sortable="true" sortProperty="SITUACION" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">
                                                    <input class="campowidthinput campo campotexto" type="text" id="PDESC"
                                                    value="<fmt:formatNumber pattern='###,##0.00' value='${listaProd.OB_IAX_DETDESCUENTO.PDESC}'/>" 
                                                           onchange="javascript:f_cargar_valor_porcentaje('${listaProd.OB_IAX_DETDESCUENTO.CDESC}',
                                                                                                        '${listaProd.OB_IAX_DETDESCUENTO.SPRODUC}',
                                                                                                        '${listaProd.OB_IAX_DETDESCUENTO.CACTIVI}',
                                                                                                        '${listaProd.OB_IAX_DETDESCUENTO.CGARANT}',
                                                                                                        '${listaProd.OB_IAX_DETDESCUENTO.CNIVEL}',
                                                                                                        '${listaProd.OB_IAX_DETDESCUENTO.CMODCOM}',
                                                                                                        this.value)" />
                                                </div>
                                            </display:column>
                                        </c:if>
                                        
                                        <axis:visible f="axisdesc006" c="NINIALT">
                                            <display:column title="${title9}" sortable="true" sortProperty="OB_IAX_DETDESCUENTO.NINIALT" headerClass="sortable"  media="html" autolink="false" style="width:5%;">
                                                <div class="dspText"><fmt:formatNumber pattern="##0" value='${listaProd.OB_IAX_DETDESCUENTO.NINIALT}'/></div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisdesc006" c="NFINALT">
                                            <display:column title="${title10}" sortable="true" sortProperty="OB_IAX_DETDESCUENTO.NFINALT" headerClass="sortable"  media="html" autolink="false" style="width:5%;">
                                                <div class="dspText"><fmt:formatNumber pattern="##0" value='${listaProd.OB_IAX_DETDESCUENTO.NFINALT}'/></div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisdesc006" c="BUT_NIVELES">
                                            <display:column title="" sortable="false" media="html" autolink="false" headerClass="sortable" >
                                                <div class="dspIcons">
                                                    <img border="0" alt="<axis:alt f="axisdesc006" c="NIVELES" lit="9902456"/>" title="<axis:alt f="axisdesc006" c="NIVELES" lit="9902456"/>" src="images/lapiz.gif" 
                                                     style="cursor:pointer;" onclick="javascript:f_abrir_axisdesc011 (${listaProd.OB_IAX_DETDESCUENTO.SPRODUC},'${listaProd.OB_IAX_DETDESCUENTO.CACTIVI}','${listaProd.OB_IAX_DETDESCUENTO.CGARANT}','${listaProd.OB_IAX_DETDESCUENTO.CDESC}','${listaProd.OB_IAX_DETDESCUENTO.CMODCOM}','${__formdata.FINIVIG}')"/>
                                                </div>
                                            </display:column>
                                        </axis:visible>
                                        
                                    </display:table>
                                    <c:choose>
                                        <c:when test="${!empty axisctr_listaPolizas}">
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
                        </c:if>
                        </table>
                        </c:if>
<c:if test="${!empty __formdata.FINIVIG}">
                        <!--  FIN PRIMERA SECCION -->
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisdesc006" c="DESCXACTIVI" lit="9903511" /></div>
                        <table>
                            <tr>
                                <td>
                                <div class="separador">&nbsp;</div>
                                <!-- DisplayTag Pólizas -->
                                <c:set var="title1"><axis:alt f="axisdesc006" c="PRODUCTOS" lit="103481"/></c:set><!--Producto -->
                                <c:set var="title2"><axis:alt f="axisdesc006" c="MODALIDAD" lit="100943"/></c:set><!--Modalidad -->
                                <c:set var="title3"><axis:alt f="axisdesc006" c="PORCENTAJE" lit="101467"/></c:set><!--Porcentaje-->
                                <c:set var="title4"><axis:alt f="axisdesc006" c="PRODUCTO" lit="100829"/></c:set>
                                <c:set var="selProd" value="${selectedActividad}" />
                                <div class="seccion displayspaceGrande">
                                    <display:table name="${axisctr_listaActividades}" id="listaAct" export="false" class="dsptgtable" pagesize="-1"  requestURI="modal_axisdesc006.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                            <div class="dspIcons"><input <c:if test="${listaAct['CACTIVI']==selProd}">checked="checked"</c:if> type="radio" id="selected" onclick="javascript:f_buscar_actividades(this.value)" name="selected" value="${listaAct['CACTIVI']}"/></div>
                                        </display:column>
                                        <display:column title="${title1}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable"  media="html" autolink="false" >    
                                            <div class="dspText">${listaAct['TTITULO']}</div>
                                        </display:column>
                                </display:table>
                                <c:choose>
                                    <c:when test="${!empty axisctr_listaPolizas}">
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
                                <td></td>
                                <!--   SECCION    -->
                                <axis:ocultar c="ACTIVITAT" f="axisdesc006" dejarHueco="false">
                                    <td>
                                        <div class="separador">&nbsp;</div>
                                        <!-- DisplayTag Pólizas -->
                                        <c:set var="title1"><axis:alt f="axisdesc006" c="CUADRO" lit="9000617"/></c:set><!--Producto -->
                                        <c:set var="title2"><axis:alt f="axisdesc006" c="MODALIDAD" lit="100943"/></c:set><!--Modalidad -->
                                        <c:set var="title3"><axis:alt f="axisdesc006" c="PORCENTAJE" lit="101467"/></c:set><!--Porcentaje-->
                                        <c:set var="title4"><axis:alt f="axisdesc006" c="PRODUCTO" lit="100829"/></c:set>
                                        <c:set var="title9"><axis:alt f="axisdesc006" c="NINIALT" lit="104095"/></c:set><!--NINIALT-->
                                        <c:set var="title10"><axis:alt f="axisdesc006" c="NFINALT" lit="103051"/></c:set><!--NFINALT-->
                                        <c:set var="selProd" value="${__formdata.selectedProducto}" />
                                        <div class="seccion displayspaceGrande"> 
                                        <display:table name="${axisctr_listaProdActividades}" id="listaProdAct" export="false" class="dsptgtable" pagesize="-1"  requestURI="modal_axisdesc006.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title1}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable"  media="html" autolink="false" >    
                                                <div class="dspText">${listaProdAct.OB_IAX_DETDESCUENTO.TDESC}</div>
                                            </display:column>
                                            <display:column title="${title2}" sortable="true" sortProperty="NOMBRE" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${listaProdAct.OB_IAX_DETDESCUENTO.TMODCOM}</div>
                                            </display:column>
                                            <display:column title="${title3}" sortable="true" sortProperty="SITUACION" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">
                                                    <input class="campowidthinput campo campotexto" type="text" id="PDESC"
                                                    value="<fmt:formatNumber pattern='###,##0.00' value='${listaProdAct.OB_IAX_DETDESCUENTO.PDESC}'/>" 
                                                           onchange="javascript:f_cargar_valor_porcentaje('${listaProdAct.OB_IAX_DETDESCUENTO.CDESC}',
                                                                                                        '${listaProdAct.OB_IAX_DETDESCUENTO.SPRODUC}',
                                                                                                        '${selectedActividad}',
                                                                                                        '${listaProdAct.OB_IAX_DETDESCUENTO.CGARANT}',
                                                                                                        '${listaProdAct.OB_IAX_DETDESCUENTO.CNIVEL}',
                                                                                                        '${listaProdAct.OB_IAX_DETDESCUENTO.CMODCOM}',
                                                                                                        this.value)" />
                                                </div>
                                            </display:column>
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
                                </axis:ocultar>
                            <!--  SECCION -->
                            </tr>
                        </table>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisdesc006" c="DESCXGAR" lit="9903512" /></div>
                        <table>
                            <tr>
                            <!-- PRIMERA SECCION DE LA SEGUNDA SECCION -->
                                <td>
                                    <div class="separador">&nbsp;</div>
                                        <!-- DisplayTag Pólizas -->
                                            <c:set var="title1"><axis:alt f="axisdesc006" c="ACTIVIDAD" lit="110994"/></c:set><!--Actividad -->
                                            <c:set var="title2"><axis:alt f="axisdesc006" c="MODALIDAD" lit="100943"/></c:set><!-- Modalidad -->
                                            <c:set var="title3"><axis:alt f="axisdesc006" c="PORCENTAJE" lit="101467"/></c:set><!-- Porcentaje -->
                                            <c:set var="title4"><axis:alt f="axisdesc006" c="PRODUCTO" lit="100829"/></c:set>
                                            <div class="seccion displayspaceGrande">
                                            <c:set var="selGar" value="${selectedGarantia}" />
                                            <display:table name="${axisctr_listaGarantias}" id="listaGar" export="false" class="dsptgtable" pagesize="-1" requestURI="modal_axisdesc006.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                                    <div class="dspIcons"><input <c:if test="${listaGar['CGARANT']==selGar}">checked="checked"</c:if> type="radio"  id="xxx" onclick="javascript:f_buscar_garantias(this.value)" name="xxx" value="${listaGar['CGARANT']}"/></div>
                                                </display:column>
                                                <display:column title="${title1}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable"  media="html" autolink="false" >    
                                                    <div class="dspText">${listaGar['TGARANT']}</div>
                                                </display:column>
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
                                <td></td>
                                <!-- FIN DE LA PRIMERA SECCION DE LA SEGUNDA SECCION -->
                                <td>
                                    <div class="separador">&nbsp;</div>
                                    <!-- DisplayTag Pólizas -->
                                        <c:set var="title1"><axis:alt f="axisdesc006" c="CUADRO" lit="9000617"/></c:set><!--Cuadro -->
                                        <c:set var="title2"><axis:alt f="axisdesc006" c="MODALIDAD" lit="100943"/></c:set><!-- Modalidad -->
                                        <c:set var="title3"><axis:alt f="axisdesc006" c="PORCENTAJE" lit="101467"/></c:set><!-- Porcentaje -->
                                        <c:set var="title4"><axis:alt f="axisdesc006" c="PRODUCTO" lit="100829"/></c:set>
                                        <c:set var="title9"><axis:alt f="axisdesc006" c="NINIALT" lit="104095"/></c:set><!--NINIALT-->
                                        <c:set var="title10"><axis:alt f="axisdesc006" c="NFINALT" lit="103051"/></c:set><!--NFINALT-->
                                        <div class="seccion displayspaceGrande">
                                        <c:set var="selAct" value="${selectedGarantia}" />
                                        <display:table name="${axisctr_listaProdGarantias}" id="listaGar" export="false" class="dsptgtable" pagesize="-1" requestURI="modal_axisdesc006.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title1}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable"  media="html" autolink="false" >    
                                                <div class="dspText">${listaGar.OB_IAX_DETDESCUENTO.TDESC}</div>
                                            </display:column>
                                            <display:column title="${title2}" sortable="true" sortProperty="NOMBRE" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${listaGar.OB_IAX_DETDESCUENTO.TMODCOM}</div>
                                            </display:column>
                                            <c:if test="${__configform.axisdesc006__PDESC__modificable == 'false'}">
                                                <display:column title="${title3}" sortable="true" sortProperty="SITUACION" headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspText">
                                                        <fmt:formatNumber value="${listaGar.OB_IAX_DETDESCUENTO.PDESC}" pattern="###,#0.00"/>
                                                    </div>
                                                </display:column>
                                            </c:if>
                                            <c:if test="${__configform.axisdesc006__PDESC__modificable != 'false'}">
                                                <display:column title="${title3}" sortable="true" sortProperty="SITUACION" headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspText">
                                                        <input class="campowidthinput campo campotexto" type="text" id="PDESC"
                                                        value="<fmt:formatNumber pattern='###,##0.00' value='${listaGar.OB_IAX_DETDESCUENTO.PDESC}'/>" 
                                                               onchange="javascript:f_cargar_valor_porcentaje('${listaGar.OB_IAX_DETDESCUENTO.CDESC}',
                                                                                                            '${listaGar.OB_IAX_DETDESCUENTO.SPRODUC}',
                                                                                                            '${selectedActividad}',
                                                                                                            '${selectedGarantia}',
                                                                                                            '${listaGar.OB_IAX_DETDESCUENTO.CNIVEL}',
                                                                                                            '${listaGar.OB_IAX_DETDESCUENTO.CMODCOM}',
                                                                                                            this.value)" />
                                                    </div>
                                                </display:column>
                                            </c:if>
                                            <axis:visible f="axisdesc006" c="NINIALT">
                                                <display:column title="${title9}" sortable="true" sortProperty="OB_IAX_DETDESCUENTO.NINIALT" headerClass="sortable"  media="html" autolink="false" style="width:5%;">
                                                    <div class="dspText"><fmt:formatNumber pattern="##0" value='${listaGar.OB_IAX_DETDESCUENTO.NINIALT}'/></div>
                                                </display:column>
                                            </axis:visible>
                                            <axis:visible f="axisdesc006" c="NFINALT">
                                                <display:column title="${title10}" sortable="true" sortProperty="OB_IAX_DETDESCUENTO.NFINALT" headerClass="sortable"  media="html" autolink="false" style="width:5%;">
                                                    <div class="dspText"><fmt:formatNumber pattern="##0" value='${listaGar.OB_IAX_DETDESCUENTO.NFINALT}'/></div>
                                                </display:column>
                                            </axis:visible>
                                            <axis:visible f="axisdesc006" c="BUT_NIVELES">
                                                <display:column title="" sortable="false" media="html" autolink="false" headerClass="sortable" >
                                                    <div class="dspIcons">
                                                        <img border="0" alt="<axis:alt f="axisdesc006" c="NIVELES" lit="9902456"/>" title="<axis:alt f="axisdesc006" c="NIVELES" lit="9902456"/>" src="images/lapiz.gif" 
                                                         style="cursor:pointer;" onclick="javascript:f_abrir_axisdesc011 (${listaGar.OB_IAX_DETDESCUENTO.SPRODUC},'${listaGar.OB_IAX_DETDESCUENTO.CACTIVI}','${listaGar.OB_IAX_DETDESCUENTO.CGARANT}','${listaGar.OB_IAX_DETDESCUENTO.CDESC}','${listaGar.OB_IAX_DETDESCUENTO.CMODCOM}','${__formdata.FINIVIG}')"/>
                                                    </div>
                                                </display:column>
                                            </axis:visible>
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
</c:if>
                    </td>
                </tr>
            </table>
            <script>
            <axis:visible f="axisdesc006" c="FINIVIG">
                Calendar.setup({
                inputField     :    "FINIVIG",    
                ifFormat       :    "%d/%m/%Y",     
                button         :    "icon_FINIVIG",  
                singleClick    :    true,
                firstDay       :    1
            });
        </axis:visible>
            </script>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisdesc006</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>

