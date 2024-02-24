<%/**
    *  Fichero: axislist007.jsp
    *  @author <a href = "mailto:jgutierrez@csi-ti.com">Jenny Gutierrez</a>
    *  
    *    Comentarios
    *
    *
    *  Fecha: 27/02/13
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
                    
                    <c:if test="${empty __formdata.axislist008_lista}">                        
                        f_abrir_axislist008();                        
                    </c:if>
                      
                    var valor = "${__formdata.VALOR}";
                    <c:if test="${!empty __formdata.VALOR}">                        
                        f_selecciona_carga(valor);
                    </c:if>
                }
                     
                function f_abrir_axislist008() {
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
					if (!objUtiles.estaVacio(objDom.getValorPorId("GESTOR_"))){
						params += "&GESTOR="+objDom.getValorPorId("GESTOR_");
					}
					
					if (!objUtiles.estaVacio(objDom.getValorPorId("FORMATO_"))){
						params += "&FORMATO="+objDom.getValorPorId("FORMATO_");
					}
					
					if (!objUtiles.estaVacio(objDom.getValorPorId("ANIO_"))){
						params += "&ANIO="+objDom.getValorPorId("ANIO_");
					}
					
					if (!objUtiles.estaVacio(objDom.getValorPorId("MES_"))){
						params += "&MES="+objDom.getValorPorId("MES_");
					}
					
					if (!objUtiles.estaVacio(objDom.getValorPorId("DIA_"))){
						params += "&DIA="+objDom.getValorPorId("DIA_");
					}
                
					
                        objUtiles.abrirModal("axislist008","src","modal_axislist008.do?operation=form&mantenerabierto=true"+params);
                }                                                                                    
                
                function f_cerrar_axislist008() {
                   objUtiles.cerrarModal("axislist008");
                }
                            
                function f_aceptar_axislist008 (params) {
                    f_cerrar_axislist008();
                    objUtiles.ejecutarFormulario("axis_axislist007.do?bus=bus"+params, "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
                    
                }                  
                                               
                
                function f_but_salir() {                                    
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axislist007", "cancelar", document.miForm, "_self");         
            
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
               objDom.setValorPorId("SPROCES", SPROCES);
            
            var qs="operation=ajax_busqueda_lineas";
                        qs=qs+"&SPROCES="+SPROCES;                    
                    objAjax.invokeAsyncCGI("axis_axislist007.do", callbackajaxCarga, qs, this, objJsMessages.jslit_cargando);  
        }

        
        function callbackajaxCarga(ajaxResponseText){
                try{                 
                
                    var doc = objAjax.domParse(ajaxResponseText);  
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                     var tbody = objLista.obtenerBodyLista("LSTPROCESOSDET");
                        var tr = objLista.obtenerFilasBodyLista("LSTPROCESOSDET", tbody);                  
                        objLista.borrarFilasDeLista ("LSTPROCESOSDET", "8", "<axis:alt f='${fname}' c='BORRARLISTA' lit='1000254' />");                        
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
                                     var TPATHFI   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPATHFI")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPATHFI"), i, 0) : "";
                                     var FPROLIN   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("FPROLIN")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("FPROLIN"), i, 0) : "";
                                    var TFPROLIN   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TFPROLIN")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("TFPROLIN"), i, 0) : "";
                                     var TTIPLIN   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TTIPLIN")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTIPLIN"), i, 0) : "";

								var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");                                                      
                                
								var newtr = objLista.crearNuevaFila(rowstyle);
                                                                    newtd[0] = objLista.addNumeroEnLista(SPROCES);
                                                                 newtd[1] = objLista.addNumeroEnLista(NPROLIN);
                                                                
                                                                  newtd[2] = objLista.addTextoEnLista(TPATHFI,
                                  "javascript:f_imprimir_fitxer('"+TPATHFI.split('\\').join('\\\\')+"')");
                                                                 //newtd[4] = objLista.addTextoEnLista(FPROLIN);
                                                                 newtd[3] = objLista.addTextoEnLista(TFPROLIN);
                                                                 //newtd[5] = objLista.addNumeroEnLista(CESTADO);
                                                                 newtd[4] = objLista.addTextoEnLista(TTIPLIN);
                                                        
                            objLista.addNuevaFila(newtd, newtr, tbody);        
                          
                        }                                                
                            
     
                    } 
                      
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
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
                
            objUtiles.ejecutarFormulario("axis_axislist007.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
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
  <input type="hidden" name="GESTOR_" id="GESTOR_" value="${__formdata.GESTOR}" />
  <input type="hidden" name="FORMATO_" id="FORMATO_" value="${__formdata.FORMATO}" />
  <input type="hidden" name="ANIO_" id="ANIO_" value="${__formdata.ANIO}" />
  <input type="hidden" name="MES_" id="MES_" value="${__formdata.MES}" />
  <input type="hidden" name="DIA_" id="DIA_" value="${__formdata.DIA}" />
  <input type="hidden" name="NERROR_" id="NERROR_" value="${__formdata.NERROR}" />

    <c:import url="../include/titulo_nt.jsp">
      <c:param name="titulo"><axis:alt f="${fname}" c="TITULO" lit="104933"/></c:param>
      <c:param name="formulario"><axis:alt f="${fname}" c="TITULO" lit="104933"/></c:param>
      <c:param name="form">axislist007</c:param>      
    </c:import>   
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axislist008|<axis:alt f="${fname}" c="Taxislist008" lit="103256"/></c:param>
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
                        <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="${fname}" c="BUSCAR" lit="104933"/>" onclick="f_abrir_axislist008();" style="cursor:pointer"/>                
                    </div>
              <c:set var="title0">&nbsp;</c:set>
              <c:set var="title1">
                <axis:alt f="${fname}" c="PROCESO" lit="1000576"/>
              </c:set>
               <c:set var="title2">
                <axis:alt f="${fname}" c="GESTOR" lit="9000569"/>
              </c:set>
              <c:set var="title3">
                <axis:alt f="${fname}" c="FORMATO" lit="9905788"/>
              </c:set>
              <c:set var="title4">
                <axis:alt f="${fname}" c="CODIGO" lit="1000109"/> 
              </c:set>
              <c:set var="title5">
                 <axis:alt f="${fname}" c="ERROR" lit="9000464"/>
              </c:set>
              <c:set var="title6">
                <axis:alt f="${fname}" c="PARAM" lit="103694"/>
              </c:set>
              <c:set var="title7">
                <axis:alt f="${fname}" c="FINI" lit="9000526"/>
              </c:set>
               <c:set var="title8">
                <axis:alt f="${fname}" c="FFIN" lit="9001198"/>
              </c:set>
              <div class="seccion displayspaceGrande">
              <display:table name="${__formdata.axislist008_lista}"
                               id="LSTFICPROCESOS" export="false"
                               class="dsptgtable" pagesize="-1" 
                               requestURI="axis_axislist007.do?paginar=true"
                               sort="list" cellpadding="0" cellspacing="0">
                  <%@ include file="../include/displaytag.jsp"%>
                  <!--<%@ include file="../include/displaytag.jsp"%>     -->
                  <!--<div class="dspIcons">-->
                  <display:column headerClass="headwidth5 sortable" title="" style="width:5%;"
                                  media="html" autolink="false">
                    <div class="dspIcons">                     
                      <input <c:if test="${fn:length(sessionScope.LSTFICPROCESOS) == 1}" >checked</c:if>
                             onclick="f_selecciona_carga(${LSTFICPROCESOS.SPROCES});"
                             value="${LSTFICPROCESOS.SPROCES}"
                             type="radio" id="radioSproces"
                             name="radioSproces"
                             <c:if test="${LSTFICPROCESOS.SPROCES ==  sessionScope.VALOR}">checked</c:if>  >     
                    </div>
                  </display:column>


                  <display:column title="${title1}" sortable="true"
                                  sortProperty="SPROCES"
                                  headerClass="headwidth10 sortable" style="width:5%;"
                                  media="html" autolink="false">
                    <div class="dspNumber">                      
                        ${LSTFICPROCESOS.SPROCES}                      
                    </div>                     
                  </display:column>

                  <display:column title="${title2}" sortable="true"
                                  sortProperty="TGESTOR"
                                  headerClass="headwidth10 sortable" style="width:30%;"
                                  media="html" autolink="false">
                    <div class="dspText">                      
                        ${LSTFICPROCESOS.GESTOR}                      
                    </div>
                  </display:column>
                  <display:column title="${title3}" sortable="true"
                                  sortProperty="TFORMAT"
                                  headerClass="headwidth10 sortable" style="width:30%;"
                                  media="html" autolink="false">                    
                    <div class="dspText">                      
                        ${LSTFICPROCESOS.FORMATO}
                    </div>
                  </display:column>
                  <display:column title="${title6}" sortable="true"
                                  sortProperty="TPROCES"
                                  headerClass="headwidth10 sortable" style="width:15%;"
                                  media="html" autolink="false">
                    <div class="dspText">                      
                        ${LSTFICPROCESOS.TPROCES}                      
                    </div>
                  </display:column>
                  <display:column title="${title5}" sortable="true"
                                  sortProperty="NERROR"
                                  headerClass="headwidth10 sortable" style="width:5%;"
                                  media="html" autolink="false">
                    <div class="dspNumber">                      
                        ${LSTFICPROCESOS.NERROR}                      
                    </div>
                  </display:column>
                  <display:column title="${title7}" sortable="true"
                                  sortProperty="FPROINI"
                                  headerClass="headwidth10 sortable" style="width:5%;"
                                  media="html" autolink="false">
                    <div class="dspText">                      
                        <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTFICPROCESOS.FPROINI}"/>                       
                    </div>
                  </display:column>
                  <display:column title="${title8}" sortable="true"
                                  sortProperty="FPROFIN"
                                  headerClass="headwidth10 sortable" style="width:5%;"
                                  media="html" autolink="false">
                    <div class="dspText">                      
                        <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTFICPROCESOS.FPROFIN}"/>                                                                    
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
                <c:set var="title0">
                  <axis:alt f="${fname}" c="PROCESO" lit="1000576"/>
                </c:set>
                <c:set var="title1">
                  <axis:alt f="${fname}" c="LINEA" lit="9000455"/>
                </c:set>
                  <c:set var="title2">
                  <axis:alt f="${fname}" c="LITERAL_SORTIDA" lit="107913"/>
                </c:set>
                <c:set var="title3">
                  <axis:alt f="${fname}" c="FEJEC" lit="9001572"/>
                </c:set>
                 <c:set var="title4">
                  <axis:alt f="${fname}" c="TIPO" lit="9901195"/>
                </c:set>
               
                             
                <div class="seccion displayspaceGrande">
                  <display:table name="${__formdata.REC_LSTPROCESOSDET}"
                                 id="LSTPROCESOSDET" export="false"
                                 class="dsptgtable" pagesize="-1"
                                 sort="list" cellpadding="0" cellspacing="0"
                                 requestURI="axis_axislist007.do?paginar=true">                                 
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
                                    sortProperty="TPATHFI"
                                    headerClass="sortable" media="html"
                                    autolink="false">                     
                     
                      
                    <div class="dspText">
                        ${LSTPROCESOSLIN['TPATHFI']}
                      </div>
                    </display:column>
                    <display:column title="${title3}" sortable="false"
                                    sortProperty="FPROLIN"
                                    headerClass="sortable" media="html"
                                    autolink="false">                     
                      <div class="dspText">
                        <!--<fmt:formatDate value="${LSTPROCESOSLIN['FPROLIN']}" pattern="dd/MM/yyyy"/>-->                            
                        ${LSTPROCESOSLIN['TFPROLIN']}
                      </div>
                    </display:column>
                                      <display:column title="${title4}" sortable="false"
                                    sortProperty="TTIPLIN"
                                    headerClass="sortable" media="html"
                                    autolink="false">                     
                      <div class="dspText">
                        ${LSTPROCESOSLIN['TTIPLIN']}
                      </div>
                    </display:column>
                    
                  </display:table>
                   
                  <c:choose>
                    <c:when test="${!empty  __formdata.REC_LSTPROCESOSDET}">
                      <script language="javascript">//objUtiles.retocarDsptagtable("miListaId");</script>
                    </c:when>
                  </c:choose>
                </div>
            </td>
            </tr>
          </table>    
    </td>
     </tr>
     </table>
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">${fname}</c:param>
        <c:param name="f">axislist007</c:param>
        <c:param name="__botones">salir</c:param>
    </c:import>
  </form>
  <c:import url="../include/mensajes.jsp"/>
      </body>
</html>