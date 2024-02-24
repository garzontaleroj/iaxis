<%/**
    *  Fichero: axisadm049.jsp
    *  @author <a href = "mailto:jdelrio@csi-ti.com">Javier del Rio</a>
    *  
    *    Comentarios
    *
    *
    *  Fecha: 22/02/10
    */
    %>
<%@ page contentType="text/html;charset=iso-8859-15"%>
<%@ page import="java.lang.String"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
<link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
<link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
<c:import url="../include/carga_framework_js.jsp"/>
<input type="hidden" name="operation" value=""/>
<html>
    <head>
<script language="Javascript" type="text/javascript">
                
                /****************************************************************************************/
                /*********************************** NAVEGACION *****************************************/
                /****************************************************************************************/
                
                function f_onload(){
                   f_cargar_propiedades_pantalla(); 
                    revisarEstilos();                    
                    
                    <c:if test="${empty __formdata.axisadm048_lista}">                        
                        f_abrir_axisadm048();                        
                    </c:if>
                      
                    var valor = "${__formdata.VALOR}";
                    <c:if test="${!empty __formdata.VALOR}">                        
                        f_selecciona_carga(valor);
                    </c:if>
                }
                     
                function f_abrir_axisadm048() {
                    //,FPROINI,NERROR,EMPRESA,CUSUARI,CPROCES
                    params = '';
                    if (!objUtiles.estaVacio(objDom.getValorPorId("SPROCES_"))){
                        params += "&SPROCES="+objDom.getValorPorId("SPROCES_");
                    }
                    if (!objUtiles.estaVacio(objDom.getValorPorId("FPROINI_"))){
                        params += "&FPROINI="+objDom.getValorPorId("FPROINI_");
                    }
                    if (!objUtiles.estaVacio(objDom.getValorPorId("NERROR_"))){
                        params += "&NERROR="+objDom.getValorPorId("NERROR_");
                    }
                    if (!objUtiles.estaVacio(objDom.getValorPorId("EMPRESA_"))){
                        params += "&EMPRESA="+objDom.getValorPorId("EMPRESA_");
                    }
                    if (!objUtiles.estaVacio(objDom.getValorPorId("CUSUARI_"))){
                        params += "&CUSUARI="+objDom.getValorPorId("CUSUARI_");
                    }
                    if (!objUtiles.estaVacio(objDom.getValorPorId("CPROCES_"))){
                        params += "&CPROCES="+objDom.getValorPorId("CPROCES_");
                    }
                    objUtiles.abrirModal("axisadm048","src","modal_axisadm048.do?operation=form&mantenerabierto=true"+params);
                }                                                                                    
                
                function f_cerrar_axisadm048() {
                   objUtiles.cerrarModal("axisadm048");
                }
                            
                function f_aceptar_axisadm048 (params) {
                    f_cerrar_axisadm048();
                    objUtiles.ejecutarFormulario("axis_axisadm049.do?bus=bus"+params, "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
                    
                }                  
                                               
                
                function f_but_salir() {                                    
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm049", "cancelar", document.miForm, "_self");         
            
                }                       

        function f_but_109006() {
            var valor = document.miForm.VALOR.value;
            //alert(valor);
                    if (!objUtiles.estaVacio(valor))
                        f_crea_map(valor);                        
                    
        }

 
               function callbackCancelar() {
                    objUtiles.ejecutarFormulario ("main.do", "cancelar", document.miForm, "_self");                   
                }                    
                
                /****************************************************************************************/
                /******************************* CALLBACKS AJAX *****************************************/
                /****************************************************************************************/            
            
       function f_selecciona_carga(SPROCES){        
            var checkBoxRadioSproces = document.getElementsByName("radioSproces");
            
             
               
               document.miForm.VALOR.value = SPROCES;
               
              
               
             
            
                  //      for (var i=0; i < checkBoxRadioSproces.length; i++) {
                               //if(checkBoxRadioSproces[i].value == valor_establecido){ 
                  //   if(checkBoxRadioSproces[i].value == 1){
                  //                   checkBoxRadioSproces[i].checked = true;
                  //             }
                  //      }
                                       
               objDom.setValorPorId("SPROCES", SPROCES);
            
            //var qs="operation=ajax_busqueda_lineas";
            //            qs=qs+"&SPROCES="+SPROCES;                    
            //        objAjax.invokeAsyncCGI("axis_axisadm049.do", callbackajaxCarga, qs, this, objJsMessages.jslit_cargando);       
                    

                    objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", objJsMessages.jslit_cargando, "inline");
                    
                    $.get("axis_axisadm049.do", {'operation': 'busqueda_lineas', 'SPROCES':SPROCES,
                        'forward':'lstProcesoslin'}, showListaProcesos, "text");
                }
                            
                function showListaProcesos(res){
                
                    objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
                    
                    $("#divProcesosline").html(res);
                }
                   
                    


        
        function callbackajaxCarga(ajaxResponseText){
                try{                 
                
                    //alert(ajaxResponseText);
                    var doc = objAjax.domParse(ajaxResponseText);                    
              
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        var tbody = objLista.obtenerBodyLista("LSTPROCESOSLIN");
                        var tr = objLista.obtenerFilasBodyLista("LSTPROCESOSLIN", tbody);                  
                        
                                                
                        objLista.borrarFilasDeLista ("LSTPROCESOSLIN", "8", "<axis:alt f='${fname}' c='BORRARLISTA' lit='1000254' />");                        
                        if (objDom.existeTag(doc, "SPROCES"))
                            // Si hay registros, eliminamos el tr "No se han encontrado datos"
                            
                            objLista.borrarFilaVacia(tbody, tr);
                        // Bucle para insertar cada una de las filas
                        for (var i = 0; i < objDom.numeroDeTags(doc, "SPROCES") ; i++) {
                            // Obtenemos el estilo para la fila que insertaremos                         
                            // Creamos una nueva fila vacia y le damos el estilo obtenido
                            
                            // Creamos un array de columnas a añadir a la nueva fila del displayTag   
                            var newtd = new Array(7);                                                                                                                                               
                                                                        
  
                                                                    

                                     var SPROCES   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("SPROCES")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPROCES"), i, 0) : "";
                                     var NPROLIN   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NPROLIN")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("NPROLIN"), i, 0) : "";
                                     var TPOLIZA   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPOLIZA")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOLIZA"), i, 0) : "";
                                     var TPROLIN   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPROLIN")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPROLIN"), i, 0) : "";
                                     var FPROLIN   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("FPROLIN")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("FPROLIN"), i, 0) : "";
                                    var TFPROLIN   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TFPROLIN")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("TFPROLIN"), i, 0) : "";
                                     var CESTADO   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CESTADO")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("CESTADO"), i, 0) : "";
                                     var TTIPLIN   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TTIPLIN")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTIPLIN"), i, 0) : "";

                                                                                
                            
                            var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");                                                      
                                
                            var newtr = objLista.crearNuevaFila(rowstyle);
                                                                                                             


                                                                 newtd[0] = objLista.addNumeroEnLista(SPROCES);
                                                                 newtd[1] = objLista.addNumeroEnLista(NPROLIN);
                                                                 newtd[2] = objLista.addTextoEnLista(TPOLIZA);
                                                                 newtd[3] = objLista.addTextoEnLista(TPROLIN);
                                                                 //newtd[4] = objLista.addTextoEnLista(FPROLIN);
                                                                 newtd[4] = objLista.addTextoEnLista(TFPROLIN);
                                                                 //newtd[5] = objLista.addNumeroEnLista(CESTADO);
                                                                 newtd[5] = objLista.addTextoEnLista(TTIPLIN);
                                                        
                            objLista.addNuevaFila(newtd, newtr, tbody);        
                                         
                          
                        }                                                
                            
     
                    } // Fi if 
                      
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
            }
                    
        function f_crea_map(SPROCES) {                        
                
                var CMAP = 365;
                objAjax.invokeAsyncCGI("axis_axisadm049.do",callbackAjaxGenerarResultado_map,"operation=ajax_generar_resultados_map&CMAP="+CMAP+"&SPROCES="+SPROCES
                , this, objJsMessages.jslit_cargando);            
        }

        function callbackAjaxGenerarResultado_map (ajaxResponseText) {

            objDom.setValorPorId("SORTIDA", "");   
            objDom.setValorPorId("CXML", "");  
            objDom.setVisibilidadPorId("SORTIDA", "visible");
            
            var doc = objAjax.domParse(ajaxResponseText);
            if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                var fichero = objUtiles.hayValorElementoXml(doc.getElementsByTagName("RETURN")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0) : "";
                                
                var resultado = objUtiles.hayValorElementoXml(doc.getElementsByTagName("VALOR")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALOR"), 0, 0) : "-1";
                      
                if(objUtiles.utilEquals(fichero, "-0.csv")){
                        alert("<axis:alt f='${fname}' c='FICHERO' lit='9000620' />");
                        document.miForm.CFICHERO.focus();
                }else{
                    //Guardo sólo el nombre.ext, no la ruta pq sino pl peta
                    RESPOSTA = "${__formdata.F_GET_TIPOMAP.RETURN}";
                    if (RESPOSTA==3){
                        objDom.setValorPorId("CXML", fichero);
                    }else {
                        objDom.setValorPorId("SORTIDA", fichero);
                    }     
                }
            }                            
        }                    
        
         function f_imprimir_fitxer(pfitxer){
            if ((pfitxer!=null)&&(!objUtiles.estaVacio(pfitxer))){
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+pfitxer,600,200);
            }
        }        
                     
        function f_cerrar_axisimprimir() {
                objUtiles.cerrarModal("axisimprimir");
        }                     
        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {        
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init");            
        }
        
      
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_aceptar_modal(cual, subpantalla) {
            f_cerrar_modal(cual);
            
            if (!objUtiles.estaVacio(subpantalla))
                document.miForm.subpantalla.value = subpantalla;
                
            objUtiles.ejecutarFormulario("axis_axisadm049.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        
                             
            
            </script>
                </head>
<body onload="f_onload()">
       <c:import url="../include/modal_estandar.jsp">
    <c:param name="titulo"><axis:alt f="${fname}" c="TITULO" lit="104933"/></c:param>
</c:import>
<c:import url="../include/precargador_ajax.jsp">
    <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
  </c:import><form name="miForm" action="" method="POST">
  <input type="hidden" name="operation" value="" />   
  <%-- parametros Busqueda --%>
  <input type="hidden" name="FPROINI_" id="FPROINI_" value='<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FPROINI_}"/>' />
  <input type="hidden" name="CPROCES_" id="CPROCES_" value="${__formdata.CPROCES_}" />
  <input type="hidden" name="NERROR_" id="NERROR_" value="${__formdata.NERROR_}" />
  <input type="hidden" name="CUSUARI_" id="CUSUARI_" value="${__formdata.CUSUARI_}" />
  <input type="hidden" name="EMPRESA_" id="EMPRESA_" value="${__formdata.EMPRESA_}" />
  <input type="hidden" name="EMPRESA_" id="SPROCES_" value="${__formdata.SPROCES_}" />

    <c:import url="../include/titulo_nt.jsp">
      <c:param name="titulo"><axis:alt f="${fname}" c="TITULO" lit="104933"/></c:param>
      <c:param name="formulario"><axis:alt f="${fname}" c="TITULO" lit="104933"/></c:param>
      <c:param name="form">axisadm049</c:param>      
    </c:import>   
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisadm048|<axis:alt f="${fname}" c="TAXISADM048" lit="103256"/></c:param>
    </c:import>        
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="${fname}" c="TAXISIMPRIMIR" lit="1000205" />|true</c:param>
    </c:import>
   <input type="hidden" name="ult_proceso" id="ult_proceso" value="${__formdata.ult_proceso}" /> 
   <input type="hidden" name="aaa" id="aaa" value="5" /> 
   
   <input type="hidden" name="VALOR" id="VALOR" value="${__formdata.VALOR}" /> 
    <!-- Area de campos  -->
    
   
    
  <table align="center" cellpadding="0"
           cellspacing="0" class="mainTableDimensions base" headerClass="sortable fixed">
           <tr>
           <td>
    <table align="center" cellpadding="0"
           cellspacing="0" headerClass="sortable fixed">
      <tr>
           <td>
           <div class="separador">&nbsp;</div>
                    <div class="titulo">
                        <img src="images/flecha.gif"/><b><axis:alt f="${fname}" c="BUSCAR" lit="104933"/></b>
                        <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="${fname}" c="BUSCAR" lit="104933"/>" onclick="f_abrir_axisadm048();" style="cursor:pointer"/>                
                    </div>
              <c:set var="title0">&nbsp;</c:set>
              <c:set var="title1">
                <axis:alt f="${fname}" c="PROCESO" lit="1000576"/>
              </c:set>
              <c:set var="title2">
                <axis:alt f="${fname}" c="EMPRESA" lit="101619"/>
              </c:set>
              <c:set var="title3">
                <axis:alt f="${fname}" c="USUARIO" lit="100894"/>
              </c:set>
              <c:set var="title4">
                <axis:alt f="${fname}" c="FECHA" lit="9000526"/>
              </c:set>
              <c:set var="title5">
                <axis:alt f="${fname}" c="CODIGO" lit="1000109"/> 
              </c:set>
              <c:set var="title6">
                 <axis:alt f="${fname}" c="ERROR" lit="9000464"/>
              </c:set>
              <c:set var="title7">
                <axis:alt f="${fname}" c="PARAM" lit="103694"/> >
              </c:set>
              <c:set var="title8">
                <axis:alt f="${fname}" c="FFIN" lit="9001198"/>
              </c:set>
              <div class="seccion displayspaceGrande">                                                          
              <display:table name="${axisadm048_lista}"
                               id="LSTPROCESOSCAB" export="false"
                               class="dsptgtable" pagesize="8" 
                               requestURI="axis_axisadm049.do?paginar=true"
                               defaultsort="1" defaultorder="ascending" 
                               sort="list" cellpadding="0" cellspacing="0">
                  <%@ include file="../include/displaytag.jsp"%>                  
                  <display:column headerClass="headwidth5 sortable" title="" style="width:5%;"
                                  media="html" autolink="false">
                    <div class="dspIcons">                     
                      <input <c:if test="${fn:length(sessionScope.LSTPROCESOSCAB) == 1}" >checked</c:if>
                             onclick="f_selecciona_carga('${LSTPROCESOSCAB.OB_IAX_PROCESOSCAB.SPROCES}');"
                             value="${LSTPROCESOSCAB.OB_IAX_PROCESOSCAB.SPROCES}"
                             type="radio" id="radioSproces"
                             name="radioSproces"
                             <c:if test="${LSTPROCESOSCAB.OB_IAX_PROCESOSCAB.SPROCES ==  sessionScope.VALOR}">checked</c:if>  >     
                    </div>
                  </display:column>


                  <display:column title="${title1}" sortable="true"
                                  sortProperty="OB_IAX_PROCESOSCAB.SPROCES"
                                  headerClass="headwidth10 sortable" style="width:5%;"
                                  media="html" autolink="false">
                    <div class="dspNumber">                      
                        ${LSTPROCESOSCAB.OB_IAX_PROCESOSCAB.SPROCES}                      
                    </div>                     
                  </display:column>
                  <display:column title="${title2}" sortable="true"
                                  sortProperty="OB_IAX_PROCESOSCAB.TEMPRES"
                                  headerClass="headwidth10 sortable" style="width:25%;"
                                  media="html" autolink="false">
                    <div class="dspText">                      
                        ${LSTPROCESOSCAB.OB_IAX_PROCESOSCAB.TEMPRES}                      
                    </div>
                  </display:column>
                  <display:column title="${title3}" sortable="true"
                                  sortProperty="OB_IAX_PROCESOSCAB.CUSUARI"
                                  headerClass="headwidth10 sortable" style="width:5%;"
                                  media="html" autolink="false">
                    <div class="dspText">                      
                        ${LSTPROCESOSCAB.OB_IAX_PROCESOSCAB.CUSUARI}                      
                    </div>
                  </display:column>
                  <display:column title="${title4}" sortable="true"
                                  sortProperty="OB_IAX_PROCESOSCAB.FPROINI"
                                  headerClass="headwidth10 sortable" style="width:5%;"
                                  media="html" autolink="false">                    
                    <div class="dspText">                      
                        <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTPROCESOSCAB.OB_IAX_PROCESOSCAB.FPROINI}"/>                        
                    </div>
                  </display:column>
                  <display:column title="${title5}" sortable="true"
                                  sortProperty="OB_IAX_PROCESOSCAB.CPROCES"
                                  headerClass="headwidth10 sortable" style="width:10%;"
                                  media="html" autolink="false">
                    <div class="dspText">                      
                        ${LSTPROCESOSCAB.OB_IAX_PROCESOSCAB.CPROCES}                      
                    </div>
                  </display:column>
                  <display:column title="${title6}" sortable="true"
                                  sortProperty="OB_IAX_PROCESOSCAB.NERROR"
                                  headerClass="headwidth10 sortable" style="width:5%;"
                                  media="html" autolink="false">
                    <div class="dspNumber">                      
                        ${LSTPROCESOSCAB.OB_IAX_PROCESOSCAB.NERROR}                      
                    </div>
                  </display:column>
                  <display:column title="${title7}" sortable="true"
                                  sortProperty="OB_IAX_PROCESOSCAB.TPROCES"
                                  headerClass="headwidth10 sortable" style="width:35%;"
                                  media="html" autolink="false">
                    <div class="dspText">                      
                        ${LSTPROCESOSCAB.OB_IAX_PROCESOSCAB.TPROCES}                      
                    </div>
                  </display:column>
                  <display:column title="${title8}" sortable="true"
                                  sortProperty="OB_IAX_PROCESOSCAB.FPROFIN"
                                  headerClass="headwidth10 sortable" style="width:5%;"
                                  media="html" autolink="false">
                    <div class="dspText">                      
                        <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTPROCESOSCAB.OB_IAX_PROCESOSCAB.FPROFIN}"/>                                                                    
                    </div>
                  </display:column>
                </display:table>
              </div>
            </td>
            </tr>
          </table>
<br>
          <table align="center" cellpadding="0"
           cellspacing="0">
            <tr>
              <td>           
              <div id="divProcesosline">     
                <c:set var="title0">
                  <axis:alt f="${fname}" c="PROCESO" lit="1000576"/>
                </c:set>
                <c:set var="title1">
                  <axis:alt f="${fname}" c="LINIA" lit="9000455"/>
                </c:set>
                <c:set var="title2">
                  <axis:alt f="${fname}" c="IDENTI" lit="1000559"/>
                </c:set>
                <c:set var="title3">
                  <axis:alt f="${fname}" c="DESCRIPCION" lit="100588"/>
                </c:set>
                <c:set var="title4">
                  <axis:alt f="${fname}" c="FEJEC" lit="9001572"/>
                </c:set>
                <c:set var="title6">
                  <axis:alt f="${fname}" c="TIPO" lit="9901195"/>
                </c:set>
                             
                <div class="seccion displayspaceGrande">
                  <display:table name="${REC_LSTPROCESOSLIN}"
                                 id="LSTPROCESOSLIN" export="false"
                                 class="dsptgtable" pagesize="13"
                                 sort="list" cellpadding="0" cellspacing="0"
                                 requestURI="axis_axisadm049.do?paginar=true">                                 
                    <%@ include file="../include/displaytag.jsp"%>  

                    <display:column title="${title0}" sortable="false"
                                    sortProperty="SPROCES"
                                    headerClass="sortable" media="html"
                                    autolink="false">                     
                      <div class="dspNumber">
                        ${LSTPROCESOSLIN['SPROCES']}
                      </div>
                    </display:column>
                    <display:column title="${title1}" sortable="false"
                                    sortProperty="NPROLIN"
                                    headerClass="sortable" media="html"
                                    autolink="false">                     
                      <div class="dspNumber">
                        ${LSTPROCESOSLIN['NPROLIN']}
                      </div>
                    </display:column>
                    <display:column title="${title2}" sortable="false"
                                    sortProperty="TPOLIZA"
                                    headerClass="sortable" media="html"
                                    autolink="false">                     
                      <div class="dspText">
                        ${LSTPROCESOSLIN['TPOLIZA']}
                      </div>
                    </display:column>
                    <display:column title="${title3}" sortable="false"
                                    sortProperty="TPROLIN"
                                    headerClass="sortable" media="html"
                                    autolink="false">                     
                      <div class="dspText">
                        ${LSTPROCESOSLIN['TPROLIN']}
                      </div>
                    </display:column>
                    <display:column title="${title4}" sortable="false"
                                    sortProperty="FPROLIN"
                                    headerClass="sortable" media="html"
                                    autolink="false">                     
                      <div class="dspText">
                        <!--<fmt:formatDate value="${LSTPROCESOSLIN['FPROLIN']}" pattern="dd/MM/yyyy"/>-->                            
                        ${LSTPROCESOSLIN['TFPROLIN']}
                      </div>
                    </display:column>
                   <%-- <display:column title="${title5}" sortable="false"
                                    sortProperty="CESTADO"
                                    headerClass="sortable" media="html"
                                    autolink="false">                     
                      <div class="dspNumber">
                        ${LSTPROCESOSLIN['CESTADO']}
                      </div>
                    </display:column>--%>
                    <display:column title="${title6}" sortable="false"
                                    sortProperty="TTIPLIN"
                                    headerClass="sortable" media="html"
                                    autolink="false">                     
                      <div class="dspText">
                        ${LSTPROCESOSLIN['TTIPLIN']}
                      </div>
                    </display:column>
                    
                  </display:table>
                   
                  <c:choose>
                    <c:when test="${!empty  __formdata.REC_LSTPROCESOSLIN}">
                      <script language="javascript">//objUtiles.retocarDsptagtable("miListaId");</script>
                    </c:when>
                  </c:choose>
                </div>
                </div>
            </td>
            </tr>
          </table>    
          <div class="separador">&nbsp;</div>
                                <div class="titulo"></div>
                                <div class="separador">&nbsp;</div>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:40%;height:0px"></th>
                                        <th style="width:5%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:5%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:5%;height:0px"></th>
                                        <th style="width:5%;height:0px"></th>
                                    </tr>    
                                    <tr> <%-- Camp3 -Fitxer generat--%> 
                                        <td class="titulocaja" id="LITERAL_SORTIDA">
                                              <b><axis:alt f="${fname}" c="LITERAL_SORTIDA" lit="107913" /></b>
                                        </td>   
                                    </tr>
                                    <tr>
                                        <td class="campocaja" id="fichero">
                                            <input type="text" readonly 
                                                   style="text-decoration:underline;background-color:transparent;border:0;cursor:pointer" 
                                                   onclick="javascript:f_imprimir_fitxer(document.getElementById('SORTIDA').value)" class="campowidthinput campo campotexto_ob" size="15"  name="SORTIDA" id="SORTIDA"
                                                   title="<axis:alt f="${fname}" c="LITERAL_SORTIDA" lit="107913"/>"/>                                     
                                        </td> 
                                    </tr>
                                </table>
    </td>
     </tr>
     </table>
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">${fname}</c:param>
        <c:param name="f">axisadm049</c:param>
        <c:param name="__botones">salir<axis:visible c="BT_EJECUTAR" f="axisadm049">,109006</axis:visible></c:param>
    </c:import>
  </form>
  <c:import url="../include/mensajes.jsp"/>
      </body>
</html>

