<%
/**
*  Fichero: axiscomi006.jsp
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
                parent.f_cerrar_axiscomi006();
        
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
            parent.f_cerrar_axiscomi006();
        }        
        
        function f_but_buscar() {
          if (objValidador.validaEntrada()) objUtiles.ejecutarFormulario("modal_axiscomi006.do", "buscar", document.miForm, "_self", objJsMessages.jslit_buscando_polizas);
   
        }
         
        function f_but_aceptar () {
          //TODOC: borrar tags en jscript?
          
           <c:if test="${__configform.axiscomi006__PCOMISI__modificable != 'false'}">
                objUtiles.ejecutarFormulario("modal_axiscomi006.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando); 
           </c:if>
           <c:if test="${__configform.axiscomi006__PCOMISI__modificable == 'false'}">
                f_but_cancelar();
           </c:if>
           
           //TODOC: Borrar tags en jscript?
         }

         function f_cargar_comisiones(){
            CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
            if (!objUtiles.estaVacio (CRAMO) ){
                objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
            }else
                objDom.setValorComponente(document.miForm.CRAMO, null);
                objAjax.invokeAsyncCGI("modal_axiscomi006.do", callbackAjaxCargarComisiones, "operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO) + 
                "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value, this, objJsMessages.jslit_cargando);
        }     
        
        
        function f_buscar_actividades(VALOR){
            //alert(PRODUCTO);
            document.miForm.selectedActividad.value=VALOR;
            document.miForm.selectedGarantia.value=null;
            
             if (objValidador.validaEntrada()) 
                objUtiles.ejecutarFormulario("modal_axiscomi006.do?CNIVEL=2", "form", document.miForm, "_self", objJsMessages.jslit_buscando_polizas);
        
        }
        
        function f_buscar_garantias(VALOR){
             
            document.miForm.selectedGarantia.value=VALOR;
             
            if (objValidador.validaEntrada()) 
                objUtiles.ejecutarFormulario("modal_axiscomi006.do?CNIVEL=3", "form", document.miForm, "_self", objJsMessages.jslit_buscando_polizas);
        
        }
        
        function callbackAjaxCargarComisiones (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    
                    var SPRODUCCombo = document.miForm.SPRODUC;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axiscomi006" c="COMBOSVALOR" lit="108341"/> - ', SPRODUCCombo, 0);
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
                    objLista.borrarFilasDeLista ("miListaId", "5", "<axis:alt f='axiscomi006' c='NOREGISTRES' lit='1000254' />");
                    var spanners = document.getElementsByTagName("span");
                    for(var i=0;i<spanners.length;i++) {
                        if (spanners[i].className == "gridpagebanner")
                            spanners[i].innerHTML = "";
                        if (spanners[i].className == "gridpagelinks")
                            spanners[i].innerHTML = ""; 
                    }
               } catch(e){alert(e);}
            }
            
         function f_cargar_valor_porcentaje(CCOMISI,SPRODUC,CACTIVI,CGARANT,CNIVEL,CCODMOD,PCOMISI){
                if (objValidador.validaEntrada()) {
                    objAppMensajes.vaciarYEsconderMensajes();
                    var FINIVIG = objDom.getValorPorId("FINIVIG");
                    if (!objUtiles.estaVacio(PCOMISI) )
                        if(objNumero.validaNumero(PCOMISI, true)) {
                            objAjax.invokeAsyncCGI("modal_axiscomi006.do", callbackAjaxCargarComisiones, "operation=ajax_guardar_porcentaje&CCOMISI="+CCOMISI+"&SPRODUC="+SPRODUC+"&CACTIVI="+CACTIVI+"&CGARANT="+CGARANT+"&CNIVEL="+CNIVEL+"&CCODMOD="+CCODMOD+"&PCOMISI="+PCOMISI+"&FINIVIG="+FINIVIG,this, objJsMessages.jslit_cargando);
                        }else{
                            objAppMensajes.pintarMensajePantalla('<axis:alt f="axiscomi006" c="FINCORRECTO" lit="50000" />', "info"); 
                        }
                }
            }      
        
            function callbackAjaxCargarComisiones (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){

                }
            }
            
            function f_but_acttfecha(){
                if (objValidador.validaEntrada()) {
                    objUtiles.ejecutarFormulario("modal_axiscomi006.do?", "act_fecha", document.miForm, "_self", objJsMessages.jslit_buscando_polizas);
                }
            }
            
            function f_abrir_axiscomi011 (sproduc,cactivi,cgarant,ccomisi,cmodcom,finivig) {
                objUtiles.abrirModal("axiscomi011", "src", "modal_axiscomi011.do?operation=init&PSPRODUC=" + sproduc+"&PCACTIVI="+cactivi+"&PCGARANT="+cgarant+"&PCCOMISI="+ccomisi+"&PCMODCOM="+cmodcom+"&PFINIVIG="+finivig);
             }
            
            
             function f_cerrar_modal (pform) {
                objUtiles.cerrarModal(pform);
                if(pform=='axiscomi011') objUtiles.ejecutarFormulario("modal_axiscomi006.do", "init", document.miForm, "_self", objJsMessages.jslit_cargando);
             }
             
             function f_abrir_axiscomi012 (CACTIVI,CGARANT,CCOMISI,CMODCOM,FINIVIG,NINIALT,SPRODUC,NFINALT,NIVEL) {
        
                if(!objUtiles.estaVacio(NINIALT)){
                    objUtiles.abrirModal("axiscomi012", "src", "modal_axiscomi012.do?operation=init&CACTIVI="+CACTIVI+"&CGARANT="+CGARANT+"&CCOMISI="+CCOMISI+"&CMODCOM="+CMODCOM+
                                                                                                   "&FINIVIG="+FINIVIG+"&NINIALT="+NINIALT+"&SPRODUC="+SPRODUC+"&NFINALT="+NFINALT+
                                                                                                   "&NIVEL="+NIVEL);
                }
                else{
                
                    document.miForm.CACTIVISEL.value = CACTIVI;
                    document.miForm.CGARANTSEL.value = CGARANT;
                    document.miForm.CCOMISISEL.value = CCOMISI;
                    document.miForm.CMODCOMSEL.value = CMODCOM;
                    document.miForm.FINIVIGSEL.value = FINIVIG;
                    document.miForm.NINIALTSEL.value = NINIALT;
                    document.miForm.SPRODUCSEL.value = SPRODUC;
                    document.miForm.NFINALTSEL.value = NFINALT;
                    document.miForm.NIVELSEL.value = NIVEL;
                
                    f_cargar_valor_porcentaje2(CCOMISI,SPRODUC,CACTIVI,CGARANT,NIVEL,CMODCOM,'0');
                }
            }
            
            function f_cargar_valor_porcentaje2(CCOMISI,SPRODUC,CACTIVI,CGARANT,CNIVEL,CCODMOD,PCOMISI){
                if (objValidador.validaEntrada()) {
                    objAppMensajes.vaciarYEsconderMensajes();
                    var FINIVIG = objDom.getValorPorId("FINIVIG");
                    if (!objUtiles.estaVacio(PCOMISI) )
                        if(objNumero.validaNumero(PCOMISI, true)) {
                            objAjax.invokeAsyncCGI("modal_axiscomi006.do", callbackAjaxCargarComisiones2, "operation=ajax_guardar_porcentaje2&CCOMISI="+CCOMISI+"&SPRODUC="+SPRODUC+"&CACTIVI="+CACTIVI+"&CGARANT="+CGARANT+"&CNIVEL="+CNIVEL+"&CCODMOD="+CCODMOD+"&PCOMISI="+PCOMISI+"&FINIVIG="+FINIVIG,this, objJsMessages.jslit_cargando);
                        }else{
                            objAppMensajes.pintarMensajePantalla('<axis:alt f="axiscomi006" c="FINCORRECTO" lit="50000" />', "info"); 
                        }
                }
            }      
        
            function callbackAjaxCargarComisiones2 (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var CACTIVI = document.miForm.CACTIVISEL.value;
                    var CGARANT = document.miForm.CGARANTSEL.value;
                    var CCOMISI = document.miForm.CCOMISISEL.value;
                    var CMODCOM = document.miForm.CMODCOMSEL.value;
                    var FINIVIG = document.miForm.FINIVIGSEL.value;
                    var NINIALT = document.miForm.NINIALTSEL.value;
                    var SPRODUC = document.miForm.SPRODUCSEL.value;
                    var NFINALT = document.miForm.NFINALTSEL.value;
                    var NIVEL = document.miForm.NIVELSEL.value;
                    
                    if(CMODCOM == '2' || CMODCOM == '4'){
                        NINIALT = 2;
                    }else{
                        NINIALT = 1;
                    }
                    
                    objUtiles.abrirModal("axiscomi012", "src", "modal_axiscomi012.do?operation=init&CACTIVI="+CACTIVI+"&CGARANT="+CGARANT+"&CCOMISI="+CCOMISI+"&CMODCOM="+CMODCOM+
                                                                                                   "&FINIVIG="+FINIVIG+"&NINIALT="+NINIALT+"&SPRODUC="+SPRODUC+"&NFINALT="+NFINALT+
                                                                                                   "&NIVEL="+NIVEL);
                }
            }
            
        
       function f_cerrar_axiscomi012(){
            f_cerrar_modal('axiscomi012');
        }
       
       function f_borrar_desglose (CACTIVI,CGARANT,CCOMISI,CMODCOM,FINIVIG,NINIALT,SPRODUC,NFINALT) {
            objUtiles.ejecutarFormulario("modal_axiscomi006.do?CACTIVISELE="+CACTIVI+"&CGARANTSELE="+CGARANT+"&CCOMISISELE="+CCOMISI+"&CMODCOMSELE="+CMODCOM+"&FINIVIGSELE="+FINIVIG+"&NINIALTSELE="+NINIALT+"&SPRODUCSELE="+SPRODUC+"&NFINALTSELE="+NFINALT, "borrar_desglose", document.miForm, "_self", objJsMessages.jslit_cargando);            
         }
         
       function f_aceptar_axiscomi12()  {
            f_cerrar_modal('axiscomi012');
            objUtiles.ejecutarFormulario("modal_axiscomi006.do", "init", document.miForm, "_self", objJsMessages.jslit_cargando);
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
            <input type="hidden" id="CACTIVISEL" name="CACTIVISEL" value="${__formdata.CACTIVISEL}"/>
            <input type="hidden" id="CGARANTSEL" name="CGARANSELT" value="${__formdata.CGARANTSEL}"/>
            <input type="hidden" id="CCOMISISEL" name="CCOMISISEL" value="${__formdata.CCOMISISEL}"/>
            <input type="hidden" id="CMODCOMSEL" name="CMODCOMSEL" value="${__formdata.CMODCOMSEL}"/>
            <input type="hidden" id="FINIVIGSEL" name="FINIVIGSEL" value="${__formdata.FINIVIGSEL}"/>
            <input type="hidden" id="NINIALTSEL" name="NINIALTSEL" value="${__formdata.NINIALTSEL}"/>
            <input type="hidden" id="SPRODUCSEL" name="SPRODUCSEL" value="${__formdata.SPRODUCSEL}"/>
            <input type="hidden" id="NFINALTSEL" name="NFINALTSEL" value="${__formdata.NFINALTSEL}"/>
            <input type="hidden" id="NIVELSEL" name="NIVELSEL" value="${__formdata.NIVELSEL}"/>
            
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axiscomi006" c="TITULO" lit="9901331" /></c:param>
                <c:param name="producto"><axis:alt f="axiscomi006" c="TITULO" lit="9901331"/></c:param>
                <c:param name="form">axiscomi006</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axiscomi006" c="NIVELES" lit="9902456" /></c:param>
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
                                    <b><axis:alt f="axiscomi006" c="PRODUCTO" lit="100829" /></b><!-- Producto -->
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
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axiscomi006" c="COMIXPRODUCT" lit="9901327" /></div>
                        <c:if test="${__formdata.TIPO == 1}">
                        <table class="seccion" align="center"><!-- area -->
                            <!-- PRIMERA SECCION -->
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:5%;height:0px"></th>
                                <th style="width:75%;height:0px"></th>
                            </tr>
                            
                            <axis:ocultar c="FINIVIG" f="axiscomi006" dejarHueco="false">
                                <tr>
                                    <td class="campocaja">
                                        <b id="label_FINIVIG"><axis:alt f="axiscomi008" c="FINIVIG" lit="9000716"/></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="campocaja">
                                        <input type="text" id="FINIVIG" name="FINIVIG" class="campowidthinput campo campotexto"
                                        <axis:atr f="axiscomi006" c="FINIVIG" a="modificable=true&obligatorio=true&formato=fecha"/>
                                        size="15" style="width:75%" value="${__formdata.FINIVIG}"/>
                                        <a id="icon_FINIVIG" style="vertical-align:middle;"><img  
                                        alt="<axis:alt f="axiscomi008" c="FINIVIG" lit="9000716"/>" title="<axis:alt f="axiscomi008" c="FINIVIG" lit="9000716"/>" src="images/calendar.gif"/></a>
                                    </td>
                                    <c:if test="${empty __formdata.FINIVIG}">
                                    <td class="campocaja">
                                        <input type="button" class="boton" id="but_acttfecha" value="<axis:alt f="axiscomi006" c="DUPLICAR" lit="103669"/>" onclick="f_but_acttfecha()" />
                                    </td>
                                    </c:if>
                                </tr>
                            </axis:ocultar>
                            
                            <c:if test="${!empty __formdata.FINIVIG}">
                            <tr>
                                <td colspan="3"> 
                                    <div class="separador">&nbsp;</div>
                                    <!-- DisplayTag Pólizas -->
                                    <c:set var="title1"><axis:alt f="axiscomi006" c="CUADRO" lit="9000617"/></c:set><!--Cuadro -->
                                    <c:set var="title2"><axis:alt f="axiscomi006" c="MODALIDAD" lit="100943"/></c:set><!--Modalidad -->
                                    <c:set var="title3"><axis:alt f="axiscomi006" c="PORCENTAJE" lit="101467"/></c:set><!--Porcentaje-->
                                    <c:set var="title4"><axis:alt f="axiscomi006" c="PRODUCTO" lit="100829"/></c:set>
                                    <c:set var="title9"><axis:alt f="axiscomi006" c="NINIALT" lit="104095"/></c:set><!--NINIALT-->
                                    <c:set var="title10"><axis:alt f="axiscomi006" c="NFINALT" lit="103051"/></c:set><!--NFINALT-->
                                     <!-- TODOC: Añadir columnas -->
                                     <axis:visible f="axiscomi006" c="CCRITERIO">
                                        <c:set var="title11"><axis:alt f="axiscomi006" c="NDESDE" lit="104095"/>(<axis:alt f="axiscomi006" c="CCRITERIO" lit="9901472"/>)</c:set><!--NDESDE-->
                                        <c:set var="title12"><axis:alt f="axiscomi006" c="NHASTA" lit="103051"/>(<axis:alt f="axiscomi006" c="CCRITERIO" lit="9901472"/>)</c:set><!--NHASTA-->
                                        <c:set var="title13"><axis:alt f="axiscomi006" c="CCRITERIO" lit="9901472"/></c:set><!--CCRITERIO-->
                                    </axis:visible>
                                    
                                    <!-- TODOC: FIN Añadir columnas -->
                                    <c:set var="selProd" value="${selectedProducto}" />
                                    <div class="seccion displayspaceGrande">
                                    <display:table name="${axisctr_listaProductos}" id="listaProd" export="false" class="dsptgtable" pagesize="-1"  requestURI="modal_axiscomi006.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="${title1}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable"  media="html" autolink="false" >    
                                            <div class="dspText">${listaProd.OB_IAX_DETCOMISION.TCOMISI}</div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="true" sortProperty="NOMBRE" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspText">${listaProd.OB_IAX_DETCOMISION.TMODCOM}</div>
                                        </display:column>
                                        <!-- TODOC: Añadir columnas -->
                                            <axis:visible f="axiscomi006" c="CCRITERIO">
                                                <display:column title="${title13}" sortable="true" sortProperty="TCRITERIO" headerClass="sortable fixed" media="html" autolink="false" >
                                                    <div class="dspText">${listaProd.OB_IAX_DETCOMISION.TCRITERIO}</div>
                                                </display:column>
                                            </axis:visible>
                                            <axis:ocultar c="NDESDE" f="axiscomi006" dejarHueco="false">
                                                <display:column title="${title11}" sortable="true" sortProperty="NDESDE" headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspText">
                                                        <fmt:formatNumber value="${listaProd.OB_IAX_DETCOMISION.NDESDE}" />
                                                    </div>
                                                </display:column>
                                            </axis:ocultar>
                                            <axis:ocultar c="NHASTA" f="axiscomi006" dejarHueco="false">
                                                <display:column title="${title12}" sortable="true" sortProperty="NHASTA" headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspText">
                                                        <fmt:formatNumber value="${listaProd.OB_IAX_DETCOMISION.NHASTA}" />
                                                    </div>
                                                </display:column>
                                            </axis:ocultar>
                                        <!-- TODOC: FIN Añadir columnas -->
                                        
                                        <c:if test="${__configform.axiscomi006__PCOMISI__modificable == 'false' || listaProd.OB_IAX_DETCOMISION.PDESGLOSE == 1}">
                                            <display:column title="${title3}" sortable="true" sortProperty="SITUACION" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">
                                                    <fmt:formatNumber value="${listaProd.OB_IAX_DETCOMISION.PCOMISI}" pattern="###,#0.00"/>
                                                </div>
                                            </display:column>
                                        </c:if>
                                        <c:if test="${__configform.axiscomi006__PCOMISI__modificable != 'false'}">
                                            <c:if test="${listaProd.OB_IAX_DETCOMISION.PDESGLOSE == 0}">
                                            <display:column title="${title3}" sortable="true" sortProperty="SITUACION" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">
                                                    <input class="campowidthinput campo campotexto" type="text" id="PCOMISI"
                                                    value="<fmt:formatNumber pattern='###,##0.00' value='${listaProd.OB_IAX_DETCOMISION.PCOMISI}'/>" 
                                                           onchange="javascript:f_cargar_valor_porcentaje('${listaProd.OB_IAX_DETCOMISION.CCOMISI}',
                                                                                                        '${listaProd.OB_IAX_DETCOMISION.SPRODUC}',
                                                                                                        '${listaProd.OB_IAX_DETCOMISION.CACTIVI}',
                                                                                                        '${listaProd.OB_IAX_DETCOMISION.CGARANT}',
                                                                                                        '${listaProd.OB_IAX_DETCOMISION.CNIVEL}',
                                                                                                        '${listaProd.OB_IAX_DETCOMISION.CMODCOM}',
                                                                                                        this.value)" />
                                                </div>
                                            </display:column>
                                             </c:if>
                                        </c:if>
                                        
                                        <axis:visible f="axiscomi006" c="NINIALT">
                                            <display:column title="${title9}" sortable="true" sortProperty="OB_IAX_DETCOMISION.NINIALT" headerClass="sortable"  media="html" autolink="false" style="width:5%;">
                                                <div class="dspText"><fmt:formatNumber pattern="##0" value='${listaProd.OB_IAX_DETCOMISION.NINIALT}'/></div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible f="axiscomi006" c="NFINALT">
                                            <display:column title="${title10}" sortable="true" sortProperty="OB_IAX_DETCOMISION.NFINALT" headerClass="sortable"  media="html" autolink="false" style="width:5%;">
                                                <div class="dspText"><fmt:formatNumber pattern="##0" value='${listaProd.OB_IAX_DETCOMISION.NFINALT}'/></div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible f="axiscomi006" c="BUT_NIVELES">
                                            <display:column title="" sortable="false" media="html" autolink="false" headerClass="sortable" >
                                                <div class="dspIcons">
                                                    <img border="0" alt="<axis:alt f="axiscomi006" c="NIVELES" lit="9902456"/>" title="<axis:alt f="axiscomi006" c="NIVELES" lit="9902456"/>" src="images/lapiz.gif" 
                                                     style="cursor:pointer;" onclick="javascript:f_abrir_axiscomi011 (${listaProd.OB_IAX_DETCOMISION.SPRODUC},'${listaProd.OB_IAX_DETCOMISION.CACTIVI}','${listaProd.OB_IAX_DETCOMISION.CGARANT}','${listaProd.OB_IAX_DETCOMISION.CCOMISI}','${listaProd.OB_IAX_DETCOMISION.CMODCOM}','${__formdata.FINIVIG}')"/>
                                                </div>
                                            </display:column>
                                        </axis:visible>
                                        <c:if test="${__formdata.CESTADO != 2 && empty __formdata.CONSULTA}">
                                    <axis:visible f="axiscomi006" c="BUT_DESGLOSE">
                                        <display:column title="" sortable="false" media="html" autolink="false" headerClass="sortable" >
                                            <div class="dspIcons">
                                                <img border="0" alt="<axis:alt f="axiscomi006" c="DESGLOSE" lit="9904656"/>" title1="<axis:alt f="axiscomi006" c="DESGLOSE" lit="9904656"/>" src="images/lapiz.gif" 
                                                 style="cursor:pointer;" onclick="javascript:f_abrir_axiscomi012 ('${listaProd.OB_IAX_DETCOMISION.CACTIVI}','${listaProd.OB_IAX_DETCOMISION.CGARANT}','${listaProd.OB_IAX_DETCOMISION.CCOMISI}','${listaProd.OB_IAX_DETCOMISION.CMODCOM}','<fmt:formatDate pattern="dd/MM/yyyy" value="${listaProd.OB_IAX_DETCOMISION.FINIVIG}"/>','${listaProd.OB_IAX_DETCOMISION.NINIALT}','${listaProd.OB_IAX_DETCOMISION.SPRODUC}','${listaProd.OB_IAX_DETCOMISION.NFINALT}','${listaProd.OB_IAX_DETCOMISION.NIVEL}')"/>
                                             </div>
                                        </display:column>
                                    </axis:visible>
                                    </c:if>
                                    <c:if test="${__formdata.CESTADO != 2 && empty __formdata.CONSULTA}">
                                    <axis:visible f="axiscomi006" c="BUT_DELDESGLOSE">
                                        <display:column title="" sortable="false" media="html" autolink="false" headerClass="sortable" >
                                            <div class="dspIcons">
                                                <img border="0" alt="<axis:alt f="axiscomi006" c="DELDESGLOSE" lit="9904657"/>" title1="<axis:alt f="axiscomi006" c="DESGLOSE" lit="9904657"/>" src="images/delete.gif" 
                                                 style="cursor:pointer;" onclick="javascript:f_borrar_desglose('${listaProd.OB_IAX_DETCOMISION.CACTIVI}','${listaProd.OB_IAX_DETCOMISION.CGARANT}','${listaProd.OB_IAX_DETCOMISION.CCOMISI}','${listaProd.OB_IAX_DETCOMISION.CMODCOM}','<fmt:formatDate pattern="dd/MM/yyyy" value="${listaProd.OB_IAX_DETCOMISION.FINIVIG}"/>','${listaProd.OB_IAX_DETCOMISION.NINIALT}','${listaProd.OB_IAX_DETCOMISION.SPRODUC}','${listaProd.OB_IAX_DETCOMISION.NFINALT}')"/>
                                             </div>
                                        </display:column>
                                    </axis:visible>
                                     </c:if>
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
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axiscomi006" c="COMIXACTIVI" lit="9902050" /></div>
                        <table>
                            <tr>
                                <td>
                                <div class="separador">&nbsp;</div>
                                <!-- DisplayTag Pólizas -->
                                <c:set var="title1"><axis:alt f="axiscomi006" c="PRODUCTOS" lit="103481"/></c:set><!--Producto -->
                                <c:set var="title2"><axis:alt f="axiscomi006" c="MODALIDAD" lit="100943"/></c:set><!--Modalidad -->
                                <c:set var="title3"><axis:alt f="axiscomi006" c="PORCENTAJE" lit="101467"/></c:set><!--Porcentaje-->
                                <c:set var="title4"><axis:alt f="axiscomi006" c="PRODUCTO" lit="100829"/></c:set>
                                <c:set var="selProd" value="${selectedActividad}" />
                                <div class="seccion displayspaceGrande">
                                    <display:table name="${axisctr_listaActividades}" id="listaAct" export="false" class="dsptgtable" pagesize="-1"  requestURI="modal_axiscomi006.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
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
                                <axis:ocultar c="ACTIVITAT" f="axiscomi006" dejarHueco="false">
                                    <td>
                                        <div class="separador">&nbsp;</div>
                                        <!-- DisplayTag Pólizas -->
                                        <c:set var="title1"><axis:alt f="axiscomi006" c="CUADRO" lit="9000617"/></c:set><!--Producto -->
                                        <c:set var="title2"><axis:alt f="axiscomi006" c="MODALIDAD" lit="100943"/></c:set><!--Modalidad -->
                                        <c:set var="title3"><axis:alt f="axiscomi006" c="PORCENTAJE" lit="101467"/></c:set><!--Porcentaje-->
                                        <c:set var="title4"><axis:alt f="axiscomi006" c="PRODUCTO" lit="100829"/></c:set>
                                        <c:set var="title9"><axis:alt f="axiscomi006" c="NINIALT" lit="104095"/></c:set><!--NINIALT-->
                                        <c:set var="title10"><axis:alt f="axiscomi006" c="NFINALT" lit="103051"/></c:set><!--NFINALT-->
                                       <!-- TODOC: Añadir columnas -->
                                         <axis:visible f="axiscomi006" c="CCRITERIO">
                                            <c:set var="title11"><axis:alt f="axiscomi006" c="NDESDE" lit="104095"/>(<axis:alt f="axiscomi006" c="CCRITERIO" lit="9901472"/>)</c:set><!--NDESDE-->
                                            <c:set var="title12"><axis:alt f="axiscomi006" c="NHASTA" lit="103051"/>(<axis:alt f="axiscomi006" c="CCRITERIO" lit="9901472"/>)</c:set><!--NHASTA-->
                                            <c:set var="title13"><axis:alt f="axiscomi006" c="CCRITERIO" lit="9901472"/></c:set><!--CCRITERIO-->
                                        </axis:visible>
                                        <!-- TODOC: FIN Añadir columnas -->
                                        <c:set var="selProd" value="${__formdata.selectedProducto}" />
                                        <div class="seccion displayspaceGrande"> 
                                        <display:table name="${axisctr_listaProdActividades}" id="listaProdAct" export="false" class="dsptgtable" pagesize="-1"  requestURI="modal_axiscomi006.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title1}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable"  media="html" autolink="false" >    
                                                <div class="dspText">${listaProdAct.OB_IAX_DETCOMISION.TCOMISI}</div>
                                            </display:column>
                                            <display:column title="${title2}" sortable="true" sortProperty="NOMBRE" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${listaProdAct.OB_IAX_DETCOMISION.TMODCOM}</div>
                                            </display:column>
                                            <!-- TODOC: Añadir columnas -->
                                            <axis:visible f="axiscomi006" c="CCRITERIO">
                                              <display:column title="${title13}" sortable="true" sortProperty="TCRITERIO" headerClass="sortable fixed" media="html" autolink="false" >
                                                <div class="dspText">${listaProdAct.OB_IAX_DETCOMISION.TCRITERIO}</div>
                                              </display:column>
                                            </axis:visible>
                                            <axis:ocultar c="NDESDE" f="axiscomi006" dejarHueco="false">
                                                <display:column title="${title11}" sortable="true" sortProperty="NDESDE" headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspText">
                                                        <fmt:formatNumber value="${listaProdAct.OB_IAX_DETCOMISION.NDESDE}" />
                                                    </div>
                                                </display:column>
                                            </axis:ocultar>
                                            <axis:ocultar c="NHASTA" f="axiscomi006" dejarHueco="false">
                                                <display:column title="${title12}" sortable="true" sortProperty="NHASTA" headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspText">
                                                        <fmt:formatNumber value="${listaProdAct.OB_IAX_DETCOMISION.NHASTA}"/>
                                                    </div>
                                                </display:column>
                                            </axis:ocultar>
                                        <!-- TODOC: FIN Añadir columnas -->
                                            <c:if test="${__configform.axiscomi006__PCOMISI__modificable == 'false' || listaProdAct.OB_IAX_DETCOMISION.PDESGLOSE == 1}">
                                            <display:column title="${title3}" sortable="true" sortProperty="SITUACION" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">
                                                    <fmt:formatNumber value="${listaProdAct.OB_IAX_DETCOMISION.PCOMISI}" pattern="###,#0.00"/>
                                                </div>
                                            </display:column>
                                        </c:if>
                                        <c:if test="${__configform.axiscomi006__PCOMISI__modificable != 'false'}">
                                            <c:if test="${listaProd.OB_IAX_DETCOMISION.PDESGLOSE == 0}">
                                            <display:column title="${title3}" sortable="true" sortProperty="SITUACION" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">
                                                    <input class="campowidthinput campo campotexto" type="text" id="PCOMISI"
                                                    value="<fmt:formatNumber pattern='###,##0.00' value='${listaProdAct.OB_IAX_DETCOMISION.PCOMISI}'/>" 
                                                           onchange="javascript:f_cargar_valor_porcentaje('${listaProdAct.OB_IAX_DETCOMISION.CCOMISI}',
                                                                                                        '${listaProdAct.OB_IAX_DETCOMISION.SPRODUC}',
                                                                                                        '${selectedActividad}',
                                                                                                        '${listaProdAct.OB_IAX_DETCOMISION.CGARANT}',
                                                                                                        '${listaProdAct.OB_IAX_DETCOMISION.CNIVEL}',
                                                                                                        '${listaProdAct.OB_IAX_DETCOMISION.CMODCOM}',
                                                                                                        this.value)" />
                                                </div>
                                            </display:column>
                                            </c:if>
                                            </c:if>
                                            <c:if test="${__formdata.CESTADO != 2 && empty __formdata.CONSULTA}">
                                            <axis:visible f="axiscomi006" c="BUT_DESGLOSE">
                                                <display:column title="" sortable="false" media="html" autolink="false" headerClass="sortable" >
                                                    <div class="dspIcons">
                                                        <img border="0" alt="<axis:alt f="axiscomi006" c="DESGLOSE" lit="9904656"/>" title1="<axis:alt f="axiscomi006" c="DESGLOSE" lit="9904656"/>" src="images/lapiz.gif" 
                                                         style="cursor:pointer;" onclick="javascript:f_abrir_axiscomi012 ('${listaProdAct.OB_IAX_DETCOMISION.CACTIVI}','${listaProdAct.OB_IAX_DETCOMISION.CGARANT}','${listaProdAct.OB_IAX_DETCOMISION.CCOMISI}','${listaProdAct.OB_IAX_DETCOMISION.CMODCOM}','<fmt:formatDate pattern="dd/MM/yyyy" value="${listaProd.OB_IAX_DETCOMISION.FINIVIG}"/>','${listaProdAct.OB_IAX_DETCOMISION.NINIALT}','${listaProdAct.OB_IAX_DETCOMISION.SPRODUC}','${listaProdAct.OB_IAX_DETCOMISION.NFINALT}','${listaProdAct.OB_IAX_DETCOMISION.NIVEL}')"/>
                                                     </div>
                                                </display:column>
                                            </axis:visible>
                                            </c:if>
                                            <c:if test="${__formdata.CESTADO != 2 && empty __formdata.CONSULTA}">
                                            <axis:visible f="axiscomi006" c="BUT_DELDESGLOSE">
                                                <display:column title="" sortable="false" media="html" autolink="false" headerClass="sortable" >
                                                    <div class="dspIcons">
                                                        <img border="0" alt="<axis:alt f="axiscomi006" c="DELDESGLOSE" lit="9904657"/>" title1="<axis:alt f="axiscomi006" c="DESGLOSE" lit="9904657"/>" src="images/delete.gif" 
                                                         style="cursor:pointer;" onclick="javascript:f_borrar_desglose('${listaProdAct.OB_IAX_DETCOMISION.CACTIVI}','${listaProdAct.OB_IAX_DETCOMISION.CGARANT}','${listaProdAct.OB_IAX_DETCOMISION.CCOMISI}','${listaProdAct.OB_IAX_DETCOMISION.CMODCOM}','<fmt:formatDate pattern="dd/MM/yyyy" value="${listaProd.OB_IAX_DETCOMISION.FINIVIG}"/>','${listaProdAct.OB_IAX_DETCOMISION.NINIALT}','${listaProdAct.OB_IAX_DETCOMISION.SPRODUC}','${listaProdAct.OB_IAX_DETCOMISION.NFINALT}')"/>
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
                                </axis:ocultar>
                            <!--  SECCION -->
                            </tr>
                        </table>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axiscomi006" c="COMIXGAR" lit="9902051" /></div>
                        <table>
                            <tr>
                            <!-- PRIMERA SECCION DE LA SEGUNDA SECCION -->
                                <td>
                                    <div class="separador">&nbsp;</div>
                                        <!-- DisplayTag Pólizas -->
                                            <c:set var="title1"><axis:alt f="axiscomi006" c="ACTIVIDAD" lit="110994"/></c:set><!--Actividad -->
                                            <c:set var="title2"><axis:alt f="axiscomi006" c="MODALIDAD" lit="100943"/></c:set><!-- Modalidad -->
                                            <c:set var="title3"><axis:alt f="axiscomi006" c="PORCENTAJE" lit="101467"/></c:set><!-- Porcentaje -->
                                            <c:set var="title4"><axis:alt f="axiscomi006" c="PRODUCTO" lit="100829"/></c:set>
                                            <div class="seccion displayspaceGrande">
                                            <c:set var="selGar" value="${selectedGarantia}" />
                                            <display:table name="${axisctr_listaGarantias}" id="listaGar" export="false" class="dsptgtable" pagesize="-1" requestURI="modal_axiscomi006.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
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
                                        <c:set var="title1"><axis:alt f="axiscomi006" c="CUADRO" lit="9000617"/></c:set><!--Cuadro -->
                                        <c:set var="title2"><axis:alt f="axiscomi006" c="MODALIDAD" lit="100943"/></c:set><!-- Modalidad -->
                                        <c:set var="title3"><axis:alt f="axiscomi006" c="PORCENTAJE" lit="101467"/></c:set><!-- Porcentaje -->
                                        <c:set var="title4"><axis:alt f="axiscomi006" c="PRODUCTO" lit="100829"/></c:set>
                                        <c:set var="title9"><axis:alt f="axiscomi006" c="NINIALT" lit="104095"/></c:set><!--NINIALT-->
                                        <c:set var="title10"><axis:alt f="axiscomi006" c="NFINALT" lit="103051"/></c:set><!--NFINALT-->
                                        <!-- TODOC: Añadir columnas -->
                                         <axis:visible f="axiscomi006" c="CCRITERIO">
                                            <c:set var="title11"><axis:alt f="axiscomi006" c="NDESDE" lit="104095"/>(<axis:alt f="axiscomi006" c="CCRITERIO" lit="9901472"/>)</c:set><!--NDESDE-->
                                            <c:set var="title12"><axis:alt f="axiscomi006" c="NHASTA" lit="103051"/>(<axis:alt f="axiscomi006" c="CCRITERIO" lit="9901472"/>)</c:set><!--NHASTA-->
                                            <c:set var="title13"><axis:alt f="axiscomi006" c="CCRITERIO" lit="9901472"/></c:set><!--CCRITERIO-->
                                        </axis:visible>
                                        <!-- TODOC: FIN Añadir columnas -->
                                        <div class="seccion displayspaceGrande">
                                        <c:set var="selAct" value="${selectedGarantia}" />
                                        <display:table name="${axisctr_listaProdGarantias}" id="listaGar" export="false" class="dsptgtable" pagesize="-1" requestURI="modal_axiscomi006.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title1}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable"  media="html" autolink="false" >    
                                                <div class="dspText">${listaGar.OB_IAX_DETCOMISION.TCOMISI}</div>
                                            </display:column>
                                            <display:column title="${title2}" sortable="true" sortProperty="NOMBRE" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${listaGar.OB_IAX_DETCOMISION.TMODCOM}</div>
                                            </display:column>
                                            <c:if test="${__configform.axiscomi006__PCOMISI__modificable == 'false' || listaGar.OB_IAX_DETCOMISION.PDESGLOSE == 1}">
                                                <display:column title="${title3}" sortable="true" sortProperty="SITUACION" headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspText">
                                                        <fmt:formatNumber value="${listaGar.OB_IAX_DETCOMISION.PCOMISI}" pattern="###,#0.00"/>
                                                    </div>
                                                </display:column>
                                            </c:if>
                                            <c:if test="${__configform.axiscomi006__PCOMISI__modificable != 'false'}">
                                                <c:if test="${listaGar.OB_IAX_DETCOMISION.PDESGLOSE == 0}">
                                                <display:column title="${title3}" sortable="true" sortProperty="SITUACION" headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspText">
                                                        <input class="campowidthinput campo campotexto" type="text" id="PCOMISI"
                                                        value="<fmt:formatNumber pattern='###,##0.00' value='${listaGar.OB_IAX_DETCOMISION.PCOMISI}'/>" 
                                                               onchange="javascript:f_cargar_valor_porcentaje('${listaGar.OB_IAX_DETCOMISION.CCOMISI}',
                                                                                                            '${listaGar.OB_IAX_DETCOMISION.SPRODUC}',
                                                                                                            '${selectedActividad}',
                                                                                                            '${selectedGarantia}',
                                                                                                            '${listaGar.OB_IAX_DETCOMISION.CNIVEL}',
                                                                                                            '${listaGar.OB_IAX_DETCOMISION.CMODCOM}',
                                                                                                            this.value)" />
                                                    </div>
                                                </display:column>
                                                </c:if>
                                            </c:if>
                                            <axis:visible f="axiscomi006" c="NINIALT">
                                                <display:column title="${title9}" sortable="true" sortProperty="OB_IAX_DETCOMISION.NINIALT" headerClass="sortable"  media="html" autolink="false" style="width:5%;">
                                                    <div class="dspText"><fmt:formatNumber pattern="##0" value='${listaGar.OB_IAX_DETCOMISION.NINIALT}'/></div>
                                                </display:column>
                                            </axis:visible>
                                            <axis:visible f="axiscomi006" c="NFINALT">
                                                <display:column title="${title10}" sortable="true" sortProperty="OB_IAX_DETCOMISION.NFINALT" headerClass="sortable"  media="html" autolink="false" style="width:5%;">
                                                    <div class="dspText"><fmt:formatNumber pattern="##0" value='${listaGar.OB_IAX_DETCOMISION.NFINALT}'/></div>
                                                </display:column>
                                            </axis:visible>
                                           <!-- TODOC: Añadir columnas -->
                                            <axis:visible f="axiscomi006" c="CCRITERIO">
                                              <display:column title="${title13}" sortable="true" sortProperty="TCRITERIO" headerClass="sortable fixed" media="html" autolink="false" >
                                                <div class="dspText">${listaGar.OB_IAX_DETCOMISION.TCRITERIO}</div>
                                              </display:column>
                                            </axis:visible>
                                            <axis:ocultar c="NDESDE" f="axiscomi006" dejarHueco="false">
                                                <display:column title="${title11}" sortable="true" sortProperty="NDESDE" headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspText">
                                                        <fmt:formatNumber value="${listaGar.OB_IAX_DETCOMISION.NDESDE}" pattern=""/>
                                                    </div>
                                                </display:column>
                                            </axis:ocultar>
                                            <axis:ocultar c="NHASTA" f="axiscomi006" dejarHueco="false">
                                                <display:column title="${title12}" sortable="true" sortProperty="NHASTA" headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspText">
                                                        <fmt:formatNumber value="${listaGar.OB_IAX_DETCOMISION.NHASTA}" />
                                                    </div>
                                                </display:column>
                                            </axis:ocultar>
                                        <!-- TODOC: FIN Añadir columnas -->
                                            <axis:visible f="axiscomi006" c="BUT_NIVELES">
                                                <display:column title="" sortable="false" media="html" autolink="false" headerClass="sortable" >
                                                    <div class="dspIcons">
                                                        <img border="0" alt="<axis:alt f="axiscomi006" c="NIVELES" lit="9902456"/>" title="<axis:alt f="axiscomi006" c="NIVELES" lit="9902456"/>" src="images/lapiz.gif" 
                                                         style="cursor:pointer;" onclick="javascript:f_abrir_axiscomi011 (${listaGar.OB_IAX_DETCOMISION.SPRODUC},'${listaGar.OB_IAX_DETCOMISION.CACTIVI}','${listaGar.OB_IAX_DETCOMISION.CGARANT}','${listaGar.OB_IAX_DETCOMISION.CCOMISI}','${listaGar.OB_IAX_DETCOMISION.CMODCOM}','${__formdata.FINIVIG}')"/>
                                                    </div>
                                                </display:column>
                                            </axis:visible>
                                            <c:if test="${__formdata.CESTADO != 2 && empty __formdata.CONSULTA}">
                                            <axis:visible f="axiscomi006" c="BUT_DESGLOSE">
                                                <display:column title="" sortable="false" media="html" autolink="false" headerClass="sortable" >
                                                    <div class="dspIcons">
                                                        <img border="0" alt="<axis:alt f="axiscomi006" c="DESGLOSE" lit="9904656"/>" title1="<axis:alt f="axiscomi006" c="DESGLOSE" lit="9904656"/>" src="images/lapiz.gif" 
                                                         style="cursor:pointer;" onclick="javascript:f_abrir_axiscomi012 ('${listaGar.OB_IAX_DETCOMISION.CACTIVI}','${listaGar.OB_IAX_DETCOMISION.CGARANT}','${listaGar.OB_IAX_DETCOMISION.CCOMISI}','${listaGar.OB_IAX_DETCOMISION.CMODCOM}','<fmt:formatDate pattern="dd/MM/yyyy" value="${listaGar.OB_IAX_DETCOMISION.FINIVIG}"/>','${listaGar.OB_IAX_DETCOMISION.NINIALT}','${listaGar.OB_IAX_DETCOMISION.SPRODUC}','${listaGar.OB_IAX_DETCOMISION.NFINALT}','${listaGar.OB_IAX_DETCOMISION.NIVEL}')"/>
                                                     </div>
                                                </display:column>
                                            </axis:visible>
                                            </c:if>
                                            <c:if test="${__formdata.CESTADO != 2 && empty __formdata.CONSULTA}">
                                            <axis:visible f="axiscomi006" c="BUT_DELDESGLOSE">
                                                <display:column title="" sortable="false" media="html" autolink="false" headerClass="sortable" >
                                                    <div class="dspIcons">
                                                        <img border="0" alt="<axis:alt f="axiscomi006" c="DELDESGLOSE" lit="9904657"/>" title1="<axis:alt f="axiscomi006" c="DESGLOSE" lit="9904657"/>" src="images/delete.gif" 
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
</c:if>
                    </td>
                </tr>
            </table>
            <script>
                Calendar.setup({
                inputField     :    "FINIVIG",    
                ifFormat       :    "%d/%m/%Y",     
                button         :    "icon_FINIVIG",  
                singleClick    :    true,
                firstDay       :    1
            });

            </script>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axiscomi006</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>