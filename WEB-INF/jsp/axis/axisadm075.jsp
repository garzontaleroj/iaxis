<%/*
*  Fichero: axisadm075.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a> 
*
*  Fecha: 19/07/2012
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
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
    <title><axis:alt f="axisctr079" c="LIQUIDACION_COMISIONES" lit="9001776"/></title> <%-- LIQUIDACION DE COMISIONES --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="Stylesheet" href="styles/displaytag.css" type="text/css"></link>
   
    <c:import url="../include/carga_framework_js.jsp"/>
    <style type="text/css">
        .displayspaceMaximo {
           /*  width:99.8%; */
            width:140%;
            height: expression( this.scrollHeight > 349 ? "350px" : "auto" );
            max-height:350px;
            overflow-x: auto;
            overflow-y: auto;
            border: 1px solid #DDDDDD;
        }
    </style>
    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {
           f_cargar_propiedades_pantalla();
        }
        
        function f_but_salir() {
            // Borrar parámetros de session en servidor
            //objAjax.invokeAsyncCGI("axis_axisctr079.do", callbackSalir, "operation=salir", this);
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr100", "cancelar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function callbackSalir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr079", "cancelar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_abrir_axisadm021() {
            var PESTREC = 1;
            objUtiles.abrirModal("axisadm021","src","modal_axisadm021.do?operation=init&PESTREC=" + PESTREC);
        }
        
        function f_cerrar_axisadm021(NRECIBO_NULL) {
            objUtiles.cerrarModal("axisadm021");
        }    
        function f_aceptar_axisadm021 (NRECIBO){
            objDom.setValorPorId("NRECIBO", NRECIBO);
            f_cerrar_axisadm021();
            objUtiles.ejecutarFormulario ("axis_axisadm075.do", "buscar_rec", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_aceptar(){
        
            var inputs=document.getElementsByTagName("input");
            var marcado=0;
               for(i=0;i<inputs.length;i++){
                    if (inputs[i].type=="checkbox") {
                        if (inputs[i].checked == true){
                            marcado = 1;
                        }
                    }
                }
        
            if (marcado == 0){
                alert('<axis:alt f="axisadm075" c="ERROR" lit="9904191" />' );
            }
            else{
                objUtiles.ejecutarFormulario ("axis_axisadm075.do", "acceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        
        function f_seltot_rec(){
           var inputs=document.getElementsByTagName("input");
           
               for(i=0;i<inputs.length;i++){
                    if (inputs[i].type=="checkbox") {
                     //   if (inputs[i].name=="chckSIN"){
                            inputs[i].checked = true;
                            inputs[i].value = 1;
                     //   }
                    }
                }
            objAjax.invokeAsyncCGI("axis_axisadm075.do", callbackAjaxSelMotivo, "operation=ajax_marcar_todo", this);    
        }
        
        function f_deseltot_rec(){
           var inputs=document.getElementsByTagName("input");
           
               for(i=0;i<inputs.length;i++){
                    if (inputs[i].type=="checkbox") {
                     //   if (inputs[i].name=="chckSIN"){
                            inputs[i].checked = false;
                            inputs[i].value = 0;
                     //   }
                    }
                }
            objAjax.invokeAsyncCGI("axis_axisadm075.do", callbackAjaxSelMotivo, "operation=ajax_desmarcar_todo", this);
        }
        
        function f_sel_motivo(CAMPO,VALOR,NRECIBO){
            var valor;
            if(CAMPO == 'MARCADO'){
                valor =((VALOR.checked)?1:0);
                objDom.setValorPorId(VALOR.id, VALOR.value);
            }
            else{
                valor = VALOR.value;
            }
                
           objAjax.invokeAsyncCGI("axis_axisadm075.do?CAMPO="+CAMPO+"&VALOR="+valor+"&NRECIBO="+NRECIBO, callbackAjaxSelMotivo, "operation=ajax_marcar_motivo", this);            
        }
            
       function callbackAjaxSelMotivo (ajaxResponseText) {
               var doc = objAjax.domParse(ajaxResponseText);
        }    
        
         function f_onclickCheckbox(thiss) {
           thiss.value =  ((thiss.checked)?1:0);
           objDom.setValorPorId(thiss.id, thiss.value);
        }
        
        function f_but_buscar(){
            var liquida = document.miForm.NLIQUIDA.value;
            
            if( objUtiles.estaVacio(liquida))
                alert('<axis:alt f="axisadm075" c="ERROR_BUSCAR" lit="9904254" />');
            else
                objUtiles.ejecutarFormulario ("axis_axisadm075.do", "buscar_liq", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
       
       function f_imprimir_fitxer(pfitxer){                    
                var str2 = pfitxer.replace(/barrainvertida/gi, "\\");            
                //objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+pfitxer,600,200);
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+str2+"&origen=axisadm029.jsp",600,200);
        }
        
        function f_but_imprimir(){
            //Fefecto-obl)|Ramo-opc|Producto-opc|Empresa-opc  /*01012009|||2*/
            var FFECHA = document.miForm.FEFECTO.value;
            var DFFECHA = document.miForm.DFEFECTO.value;
            var SPRODUC = objUtiles.replaceAll(objUtiles.replaceAll(document.miForm.SPRODUC.value,"null",""),"NULL","");
            //var VPARAMETROS = objUtiles.replaceAll(FFECHA, "/", "")+'|'+document.miForm.CRAMO.value+'|'+document.miForm.SPRODUC.value+'|'+document.miForm.CEMPRES.value;
			      var VPARAMETROS = objUtiles.replaceAll(FFECHA, "/", "")+'|'+document.miForm.CRAMO.value+'|'+SPRODUC+'|'+document.miForm.CEMPRES.value+'|'+document.miForm.SPROCDOM.value+'|'+
                                    document.miForm.CCOBBAN.value+'|'+document.miForm.CBANCO.value+'|'+document.miForm.CTIPCUENTA.value+'|'+document.miForm.FVENTAR.value+'|'+document.miForm.CREFERENCIA.value+'|'+
                                    //bug 0020050 document.miForm.DFEFECTO.value
                                    objUtiles.replaceAll(DFFECHA, "/", "")
                                    ;                    
                       //alert(VPARAMETROS);
                       objAjax.invokeAsyncCGI("axis_axisadm029.do?CMAP=316&CPARAMETROS=" + VPARAMETROS
                                                , callbackAjaxGenerarResultado_map, "operation=ajax_generar_resultados_map", this, objJsMessages.jslit_cargando);            
            }  
            
            function callbackAjaxGenerarResultado_map (ajaxResponseText) {
                                     
                 objDom.setValorPorId("SORTIDA", "");   
                 objDom.setValorPorId("CXML", "");  
                  
                //alert(ajaxResponseText);
                
                var doc = objAjax.domParse(ajaxResponseText);

                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var fichero = objUtiles.hayValorElementoXml(doc.getElementsByTagName("RETURN")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0) : "";               
                    var resultado = objUtiles.hayValorElementoXml(doc.getElementsByTagName("VALOR")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALOR"), 0, 0) : "-1";
                      
                    if(objUtiles.utilEquals(fichero, "-0.csv")){
                        alert("<axis:alt f='axisadm029' c='mensaje' lit='9000620' />");
                        document.miForm.CFICHERO.focus();
                    }else{
                        //Guardo sólo el nombre.ext, no la ruta pq sino pl peta
                        
                              objDom.setValorPorId("SORTIDA", fichero);
                              
                              // AHORA LA LISTA /////
                                var tableM = document.getElementById("ReportsList");
                                var tbodyM = tableM.getElementsByTagName("tbody")[0];
                                var trM = tbodyM.getElementsByTagName("tr");
                    
                                objLista.borrarFilasDeLista ("ReportsList", "1", "<axis:alt f='axisadm029' c='ReportsList' lit='1000254' />");
                    
                                objLista.borrarFilaVacia(tbodyM, trM);
                                // Obtenemos el estilo para la fila que insertaremos
                                var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                                // Creamos una nueva fila vacia y le damos el estilo obtenido
                                var newtr = objLista.crearNuevaFila(rowstyle);
                                // Creamos un array de columnas a añadir a la nueva fila del displayTag
                                var newtd = new Array(1);
                                
                                //----------------------                                
                                 var str = document.getElementById('SORTIDA').value;                                
                                 var str2 = str.replace(/\\/gi, "barrainvertida");                                 
                                //--------------------
                                
                                newtd[0] = objLista.addTextoEnLista(fichero,
                                  "javascript:f_imprimir_fitxer('"+str2+"')");
                              //  "javascript:f_imprimir_fitxer('"+document.getElementById('SORTIDA').value+"')");

                                objLista.addNuevaFila(newtd, newtr, tbodyM);                                    
                                ///////////////////////                              
                         }
                   }                
            }        
            
    </script>    
</head>

<body onload="f_onload()">    
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>    
    
    <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisadm075" c="TITULO" lit="9000991" /></c:param>
                <c:param name="nid" value="axisadm021" />
        </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisadm029" c="imprimir" lit="1000205" />|true</c:param>
        </c:import> 
        
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisctr079" c="titulo" lit="9903999"/></c:param>     <%-- Retrocesión de cobro masivo  --%>
                <c:param name="formulario"><axis:alt f="axisctr079" c="formulario" lit="9903999"/></c:param> <%-- Retrocesión de cobro masivo  --%>
                <c:param name="form">axisadm075</c:param>
        </c:import>
        
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisadm001|<axis:alt f="axisctr079" c="TITULOAXISADM001" lit="1000552"/></c:param>
        </c:import>
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="CEMPRES" id="CEMPRES" value="${__formdata.CEMPRES}"/>
        <input type="hidden" name="NRECIBO" id="NRECIBO" value="${__formdata.NRECIBO}"/>
        
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>            
                <td colspan="2">
                    
                    <table class="seccion">
                            
                            <tr>
                                <td >
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>                                        
                                                <axis:visible f="axisadm075" c="NLIQUIDA"> <!-- TODO C -->
                                                    <td class="titulocaja">
                                                        <b id="label_NLIQUIDA"><axis:alt f="axisadm021" c="NLIQUIDA" lit="9904002" /></b>
                                                    </td>
                                                </axis:visible>
                                        </tr>
                                        <tr>
                                            <axis:visible f="axisadm075" c="NLIQUIDA"> <!-- TODO C -->
                                                <td class="campocaja">    
                                                    <input type="text" name="NLIQUIDA" id="NLIQUIDA" value="${__formdata.NLIQUIDA}" class="campowidthinput campo campotexto" style="width:50%;"
                                                        <axis:atr f="axisadm075" c="NLIQUIDA" a="formato=entero&modificable=true&obligatorio=false"/> alt="<axis:alt f="axisadm075" c="NLIQUIDA" lit="9904002" />" title="<axis:alt f="axisadm075" c="NLIQUIDA" lit="9904002" />"/>
                                                </td>
                                            </axis:visible>
                                        </tr>
                                        <tr>
                                            <axis:visible f="axisadm075" c="FRETROCESION">
                                            <td class="titulocaja">
                                                 <b><axis:alt f="axisadm075" c="FRETROCESION" lit="9904003"/></b>
                                             </td>
                                            </axis:visible>
                                        </tr>
                                        <tr>
                                            <axis:visible f="axisadm075" c="FRETROCESION"> 
                                            <td class="campocaja"> 
                                                <jsp:useBean id="today" class="java.util.Date" /> 
                                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:30%;"
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${today}"/>" name="FRETROCESION" id="FRETROCESION"
                                                title="<axis:alt f="axisadm075" c="FRETROCESION" lit="9904003"/>"
                                                <axis:atr f="axisadm075" c="FRETROCESION" a="modificable=false&obligatorio=false&formato=fecha"/> />
                                            </td>
                                            </axis:visible>
                                            <td colspan="2"></td>
                                            <td>
                                                <div align="right">
                                                    <input type="button" class="boton" id="BT_BUSCAR" name ="BT_BUSCAR"   value="<axis:alt f="axisctr079" c="BUT_BUSCAR" lit="9000508"/>" onclick="f_but_buscar();" />                      
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <div class="separador">&nbsp;</div>
                                                
                                                <div class="titulo" style="float:left;">
                                                    <img src="images/flecha.gif"/><b><axis:alt f="axisctr079" c="RECIBOS" lit="9903999"/> </b><%-- Retrocesión de cobro masivo  --%>
                                                </div>
                                                <div style="float:right;">
                                                    <axis:visible f="axisadm075" c="BT_NVLOPD">
                                                    <img border="0" 
                                                         alt='<axis:alt f="axisadm075" c="BT_NRECIBO" lit="9904178"/>'
                                                         title='<axis:alt f="axisadm075" c="BT_NRECIBO" lit="9904178"/>'
                                                         src="images/new.gif"
                                                         onclick="f_abrir_axisadm021()"/>
                                                    </axis:visible>     
                                                  
                                                 </div>
                                                <div class="separador">&nbsp;</div>
                                            </td>
                                        </tr>
                                        <tr>
                                                <td colspan="4">
                                                   
                                                    <c:set var="title0"><axis:alt f="axisadm075" c="MOTIVO" lit="102577"/>  </c:set> <%-- Motivo --%> 
                                                    <c:set var="title1"><axis:alt f="axisadm075" c="RECIBO" lit="100895"/> </c:set>  <%-- Recibo --%>
                                                    <c:set var="title2"><axis:alt f="axisadm075" c="R/E" lit="9904010"/></c:set>
                                                    <c:set var="title3"><axis:alt f="axisadm075" c="FEFECTO" lit="100883"/> </c:set> <%-- Fecha efecto --%>
                                                    <c:set var="title4"><axis:alt f="axisadm075" c="ANUALIDAD" lit="9902457"/> </c:set> <%-- Anualidad --%>
                                                    <c:set var="title5"><axis:alt f="axisadm075" c="FRACCION" lit="9000726"/> </c:set>  <%-- Frac. --%>
                                                    <c:set var="title6"><axis:alt f="axisadm075" c="FCOBRO" lit="9000805"/> </c:set>  <%-- Fecha cobro --%>
                                                    <c:set var="title7"><axis:alt f="axisadm075" c="TCOBRO" lit="151348"/> </c:set>  <%-- Tipo cobro --%>
                                                    <c:set var="title8"><axis:alt f="axisadm075" c="PRODUCTO" lit="100829"/> </c:set>  <%-- Producto --%>
                                                    <c:set var="title9"><axis:alt f="axisadm075" c="POLIZA" lit="111324"/> </c:set>  <%-- Póliza --%>
                                                    <c:set var="title10"><axis:alt f="axisadm075" c="MEDIADOR" lit="9901930"/> </c:set>  <%-- Mediador --%>
                                                    <c:set var="title11"><axis:alt f="axisadm075" c="TRECIBO" lit="1000563"/></c:set><!-- Total recibo-->
                                                    <c:set var="title12"><axis:alt f="axisadm075" c="NREMESA" lit="9001945"/> </c:set>  <%-- Nº Remesa --%>
                                                    <c:set var="title13"><axis:alt f="axisadm075" c="NLIQUIDACIO" lit="9904002"/></c:set> <!--  Nº Liquidacion-->
                                                    <c:set var="title14"><axis:alt f="axisadm075" c="NRELACIO" lit="9904014"/></c:set> <!--  Nº Relació-->
                                                    <c:set var="title15"><axis:alt f="axisadm075" c="FEMISION" lit="101274"/></c:set> <!--  F. Emisión -->
                                                    <c:set var="title16"><axis:alt f="axisadm075" c="FEFECTO" lit="101332"/></c:set> <!--  F. Efecto -->
                                                    <c:set var="title17"><axis:alt f="axisadm075" c="FVENCIM" lit="102526"/></c:set> <!--  F.vencim. -->
                                                    
                                                    <% int z=0; %>
                                                    <c:set var="o"><%=z%></c:set>
                                                  
                                                    <script language="Javascript">
                                                        document.write('<div id="dt_recibos" class="seccion displayspaceMaximo" style="overflow-x:auto;width:'+(objUtiles.miInnerWidth()*0.90)+'px">');
                                                    </script> 
                                                    <div id="dt_recibos" class="seccion displayspaceMaximo" >
                                                        <display:table name="${sessionScope.LSTRECIBOS}" id="LSTRECIBOS" export="false" class="dsptgtable" pagesize="8" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                             requestURI="axis_axisadm075.do?paginar=true" style="width:99.9%">
                                                            <%@ include file="../include/displaytag.jsp"%>     
                                                            <display:column title="" sortable="true" sortProperty="" headerClass="sortable"  media="html"  autolink="false" style="width:1%;">
                                                                <input type= "checkbox" id="CSELECC_${LSTRECIBOS.NRECIBO}" name="CSELECC_${LSTRECIBOS.NRECIBO}" onclick="f_sel_motivo('MARCADO',this,'${LSTRECIBOS.NRECIBO}');"
                                                                <c:if test="${LSTRECIBOS.MARCADO eq 1}"> checked</c:if>  value="${LSTRECIBOS.MARCADO}" /> 
                                                            </display:column>                               
                                                            <display:column title="${title0}" sortable="true" sortProperty="NRECIBO" headerClass="sortable"  media="html" autolink="false" style="width:5%;" >                                                                                                                
                                                                <div class="dspNumber">
                                                                    <select name="CMOTIVO" id="CMOTIVO" size="1" class="campo campotexto" style="width:96%" 
                                                                            title="<axis:alt f="axisadm075" c="MOT" lit="100829"/>" onchange="f_sel_motivo('CMOTIVO',this,'${LSTRECIBOS.NRECIBO}')">
                                                                            <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisadm075" c="SELECCION" lit="1000348"/> - </option>
                                                                            <c:forEach items="${__formdata.LSTMOTIVOS}" var="item">
                                                                                <option report="${item.CATRIBU}" value = "${item.CATRIBU}" <c:if test="${!empty LSTRECIBOS.CMOTIVO && LSTRECIBOS.CMOTIVO == item.CATRIBU}"> selected </c:if>>${item.TATRIBU}</option>
                                                                            </c:forEach>
                                                                       </select>  
                                                                </div>
                                                            </display:column>                            
                                                            <display:column title="${title1}" sortable="true" sortProperty="NRECIBO" headerClass="sortable"  media="html" autolink="false" style="width:5%;" >
                                                                <div class="dspText">
                                                                    ${LSTRECIBOS.NRECIBO}
                                                                </div>
                                                            </display:column>                            
                                                            <display:column title="${title2}" sortable="true" sortProperty="TTIPREC" headerClass="sortable"  media="html" autolink="false" style="width:3%;">
                                                                <div class="dspText">
                                                                     ${LSTRECIBOS.TTIPREC}   
                                                                </div>
                                                            </display:column>                            
                                                             
                                                            <display:column title="${title4}" sortable="true" sortProperty="NANUALI" headerClass="sortable"  media="html" autolink="false" style="width:5%;">
                                                                <div class="dspNumber">                                    
                                                                         ${LSTRECIBOS.NANUALI}                    
                                                                </div>
                                                            </display:column> 
                                                            <display:column title="${title5}" sortable="true" sortProperty="NFRACCI" headerClass="sortable"  media="html" autolink="false" style="width:3%;" >
                                                                <div class="dspNumber">                                    
                                                                    ${LSTRECIBOS.NFRACCI}   
                                                                </div>
                                                            </display:column>
                                                            <display:column title="${title6}" sortable="true" sortProperty="FCOBRO" headerClass="sortable"  media="html" autolink="false" style="width:5%;" >
                                                                <div class="dspNumber"> 
                                                                      <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTRECIBOS.FCOBRO}"/>    
                                                                </div>
                                                            </display:column>                       
                                                            <display:column title="${title7}" sortable="true" sortProperty="TCOBRO" headerClass="sortable"  media="html" autolink="false" style="width:5%;" >
                                                                <div class="dspText">
                                                                     ${LSTRECIBOS.TCOBRO}
                                                                </div>
                                                            </display:column>                            
                                                            <display:column title="${title8}" sortable="true" sortProperty="PRODUCTO" headerClass="sortable"  media="html" autolink="false" style="width:10%;" >
                                                                <div class="dspText">                                    
                                                                        ${LSTRECIBOS.PRODUCTO}             
                                                                </div>
                                                            </display:column>
                                                            <display:column title="${title9}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable"  media="html" autolink="false" style="width:5%;" >
                                                                <div class="dspNumber">                                    
                                                                        ${LSTRECIBOS.NPOLIZA}             
                                                                </div>
                                                            </display:column>
                                                            <display:column title="${title10}" sortable="true" sortProperty="MEDIADOR" headerClass="sortable"  media="html" autolink="false" style="width:12%;" >
                                                                <div class="dspText">                                    
                                                                        ${LSTRECIBOS.MEDIADOR}          
                                                                </div>
                                                            </display:column> 
                                                            <display:column title="${title11}" sortable="true" sortProperty="ITOTALR" headerClass="sortable"  media="html" autolink="false" style="width:5%;" >
                                                                <div class="dspNumber">                                    
                                                                    <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${LSTRECIBOS.ITOTALR}'/>          
                                                                </div>
                                                            </display:column>
                                                            <display:column title="${title12}" sortable="true" sortProperty="TESTREC" headerClass="sortable"  media="html" autolink="false" style="width:5%;" >
                                                                <div class="dspNumber">                                    
                                                                                   
                                                                </div>
                                                            </display:column>
                                                            <display:column title="${title13}" sortable="true" sortProperty="NLIQMEN" headerClass="sortable"  media="html" autolink="false" style="width:7%;">
                                                                <div class="dspNumber">                                    
                                                                     ${LSTRECIBOS.SPROLIQ}                 
                                                                </div>
                                                            </display:column>
                                                            <display:column title="${title14}" sortable="true" sortProperty="RELACION" headerClass="sortable"  media="html" autolink="false" style="width:5%;">
                                                                <div class="dspNumber">                                    
                                                                     ${LSTRECIBOS.RELACION}                   
                                                                </div>
                                                            </display:column>
                                                            <display:column title="${title15}" sortable="true" sortProperty="FEMISIO" headerClass="sortable"  media="html" autolink="false" style="width:5%;">
                                                                <div class="dspText">                                    
                                                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTRECIBOS.FEMISIO}"/>                 
                                                                </div>
                                                            </display:column>
                                                             <display:column title="${title16}" sortable="true" sortProperty="FEFECTO" headerClass="sortable"  media="html"  autolink="false" style="width:5%;">
                                                                <div class="dspText"> 
                                                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTRECIBOS.FEFECTO}"/>  
                                                                </div>
                                                            </display:column>  
                                                            <display:column title="${title17}" sortable="true" sortProperty="FVENCIM" headerClass="sortable"  media="html" autolink="false" style="width:5%;">
                                                                <div class="dspText">                                    
                                                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTRECIBOS.FVENCIM}"/>    
                                                                </div>
                                                            </display:column>
                                                            
                                                        </display:table>
                                                    </div>
                                                    
                                                    </td>
                                                    </tr>
                                                    <tr>
                                                    <td>
                                                    <div class="separador">&nbsp;&nbsp;&nbsp;</div>
                                                  <%--      <c:if test="${! empty __formdata.lista_sin}"> --%>
                                                            <input type="button" class="boton" id="but_sel_rec" value="<axis:alt f="axissin054" c="BUT_SEL_REC" lit="9000756"/>" onclick="f_seltot_rec()" /> 
                                                            <input type="button" class="boton" id="but_desel_rec" value="<axis:alt f="axissin054" c="BUT_DESEL_REC" lit="9000757"/>" onclick="f_deseltot_rec()" /> 
                                                    <%--      </c:if> --%>
                                                    <div class="separador">&nbsp;&nbsp;&nbsp;</div>
                                                </td>
                                            </tr>
                                        </table>
                                </td>
                </tr>
                <tr>
                                <td>
                <div class="separador">&nbsp;</div>
                    <div class="titulo"><b><axis:alt f="axisadm029" c="titulo2" lit="9000702"/></b></div>
                    <table class="seccion" align="center">
                        <tr>
                            <td >
                                <!-- Área 1 -->                                
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:40%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:45%;height:0px"></th>

                                    </tr>
                                       
                                    <c:forEach items="${__formdata.LISTMAPS}" var="LISTADOS" varStatus="status">
                                        <tr>
                                           <c:if test="${!empty __formdata.SPROCES_}">                                          
                                                    <td class="campocaja" colspan="2">
                                                    <c:set var="MICMAP">NLISTADO_${LISTADOS.CMAP}</c:set>
                                                        <input type="checkbox"  value="${__formdata.NLISTADO3}" <c:if test = "${__formdata[MICMAP] == 1}"> checked </c:if> name="NLISTADO_${LISTADOS.CMAP}" id="NLISTADO_${LISTADOS.CMAP}" onclick="f_onclickCheckbox(this)" /> 
                                                        <b>${LISTADOS.TLITERA}</b>
                                                    </td> 
                                            </c:if>                                             
                                        </tr>
                                        
                                    </c:forEach>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td> </td>
                                        <td> </td>                                                
                                    </tr>                                               
                                    <tr>
                                         <td class="campocaja">
                                                    <input type="hidden" readonly class="campowidthinput campo campotexto" size="15" value="${__formdata.CFICHERO}" name="CFICHERO" id="CFICHERO"
                                                     title="<axis:alt f="axisadm029" c="CFICHERO" lit="9002207"/>"/>                                     
                                        </td> 
                                         <td class="campocaja">
                                                    <input type="hidden" readonly class="campowidthinput campo campotexto" size="15" value="${__formdata.CFICHERO2}" name="CFICHERO2" id="CFICHERO2"
                                                     title="<axis:alt f="axisadm029" c="CFICHERO2" lit="9002208"/>"/>                                     
                                        </td>                                            
                                         <td class="campocaja">
                                                    <input type="hidden" readonly class="campowidthinput campo campotexto" size="15" value="${__formdata.CFICHERO3}" name="CFICHERO3" id="CFICHERO3"
                                                     title="<axis:alt f="axisadm029" c="CFICHERO3" lit="9002209"/>"/>                                     
                                        </td>   
                                    </tr>
                                    
                                    <tr id="listaImpresion">
                                        <td >
                                            <div class="separador">&nbsp;</div>     
                                            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm029" c="listaImpresion" lit="112247"/></div>
                                                        
                                            <c:set var="title0"><axis:alt f="axisadm029" c="title0" lit="107913"/></c:set>
                                            <div class="displayspaceMaximo">
                                            <display:table name="${__formdata.LIST_FICHEROS}" id="ReportsList" export="false" class="dsptgtable" pagesize="-1" cellpadding="0" cellspacing="0"
                                                           requestURI="axis_axisadm029.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title0}" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                    <div class="dspText">
                                                        <div style="cursor:pointer" onclick="objUtiles.abrirModal('axisimprimir', 'src', 'modal_axisimprimir.do?operation=tunnel&file='+escape( (this.innerText!=undefined)?this.innerText:this.textContent))"><u>${ReportsList.OB_IAX_IMPRESION.FICHERO}</u></div>
                                                     </div>
                                                    </display:column>                                                             
                                                </display:table>                                          
                                            </div>                                                         
                                            <div class="separador">&nbsp; </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            </tr>
                    </table>
                 <div class="separador">&nbsp;</div>
                </td>
            </tr>
            
        </table>
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="__botones">salir,aceptar</c:param> 
            <c:param name="f">axisadm075</c:param>
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
   
   
</body>
</html>