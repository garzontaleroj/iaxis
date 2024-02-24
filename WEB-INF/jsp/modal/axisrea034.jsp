<%-- 
*  Fichero: axisrea034.jsp
*  Alta/Mod. descripciones
*  Fecha: 12/08/2011
*/
--%>
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

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

            function f_onload_axisrea032() {
              f_cargar_propiedades_pantalla();
            }
                    
            function f_but_aceptar() {
               
                 if (objValidador.validaEntrada()) {           
                        //objUtiles.ejecutarFormulario("modal_axisrea032.do", "grabar", document.miForm, "_self", objJsMessages.jslit_cargando);                      
                        f_grabar_datos();
                }
               
            }
            
            function f_but_buscar() {  
                if(objValidador.validaEntrada()){
                    objUtiles.ejecutarFormulario("modal_axisrea034.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
            
            function f_but_cancelar() { 
                   parent.f_cancelar_axisrea034();                
            }    
        
            function f_actualitza_plocal()
             {      
                    //alert("Antes de cargar***" );
                    f_cargar_propiedades_pantalla();
                  
                   var CTRAMO = objDom.getValorPorId("CTRAMO");   
                    
           
             }
             
            function f_actualiza_number(CAMPON){                                             
                    objDom.setValorPorId(CAMPON,objNumero.formateaNumeroCero(objDom.getValorPorId(CAMPON),true));
             }       
         
         
         /* ************************************                        *********************************** */
         /* *********************************************************************************************** */
         
         function f_grabar_datos() {

                var cadena_valores = "";
                
         
                        var NORDEN = null;
                        if(document.miForm.NORDEN){ NORDEN = document.miForm.NORDEN.value; }
                        
                
                
                cadena_valores = "NORDEN=" + NORDEN;
                               
                objAjax.invokeAsyncCGI("modal_axisrea032.do?"+cadena_valores, callbackActualizarDatos, "operation=ajax_grabar", this, objJsMessages.jslit_cargando,true);
                
            }        

     
        function callbackActualizarDatos(ajaxResponseText) {
            //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                //alert("A la vueltassss");
                try {            
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        parent.f_aceptar_axisrea032();  
                    }
                         
                
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
        }    
        
        
        
        /* ************************************ MODAL 036 ***************************************/
        /* ************************************ ********* ***************************************/
        /* ************************************ MODAL 036 ***************************************/
        function f_abrir_axisrea036(MODO) {
               objUtiles.abrirModal("axisrea036", "src", "modal_axisrea036.do?operation=form&MODO="+MODO);  
        }
        
        function f_modificar_axisrea035(CCODIGO,DESCRIPCION,MODO,SCONTRA,NVERSIO) {
               //objUtiles.abrirModal("axisrea036", "src", "modal_axisrea036.do?operation=form&MODO="+MODO+"&CCODIGO="+CCODIGO+"&DESCRIPCION="+DESCRIPCION); 
                parent.f_cerrar_axisrea034(CCODIGO,MODO,SCONTRA,NVERSIO);
               
        }
        
        function f_cerrar_axisrea036() {
                objUtiles.cerrarModal('axisrea036');
                objUtiles.ejecutarFormulario("modal_axisrea034.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }   
        
        function f_aceptar_axisrea036() {
               f_cerrar_axisrea033();   
               objUtiles.ejecutarFormulario("modal_axisrea034.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_delete_axisrea036(CCODIGO) {  
                
                document.miForm.CCODIGO_DEL.value = CCODIGO;
                if(confirm("<axis:alt f='axisrea035' c='CONFIRM_TRAMO' lit='1000167'/>")){
                    objUtiles.ejecutarFormulario("modal_axisrea034.do", "borrar_reposicion", document.miForm, "_self", objJsMessages.jslit_cargando);
                  }
         }
         
         function f_actualiza_version(){
                //  objValidador.validaEntrada();
               
                SCONTRA= document.miForm.SCONTRA.value;
                objAjax.invokeAsyncCGI("modal_axisrea034.do", callbackAjaxActualizaVersion, 
                    "operation=ajax_actualiza_version&SCONTRA="+SCONTRA, this, objJsMessages.jslit_actualizando_registro);
                    
            }
            
            function callbackAjaxActualizaVersion(ajaxResponseText) {
                
                var versionCombo = document.miForm.NVERSIO;
                
            try {
                    var doc=objAjax.domParse(ajaxResponseText);
                                        
                    if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                        if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                            objDom.borrarOpcionesDeCombo(versionCombo);
                             objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", versionCombo, 0);
                            for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                                var NVERSIO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("NVERSIO")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("NVERSIO")[0].childNodes[0].nodeValue : "");
                                var TCONTRA = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TCONTRA")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TCONTRA")[0].childNodes[0].nodeValue : "");
                                objDom.addOpcionACombo(NVERSIO, NVERSIO + ' - ' + TCONTRA, versionCombo, i+1);
                            }
                        }else{
                            objDom.borrarOpcionesDeCombo (versionCombo);
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", versionCombo, null);
                        }
                       
                    }
                f_actualiza_tramos();
                } catch (e) {
                    //objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", versionCombo, null);
                    //alert(objJsMessages.jslit_sin_motivos);
                }
            }
            
            function f_actualiza_tramos(){
                //  objValidador.validaEntrada();
                
                SCONTRA= document.miForm.SCONTRA.value;
                objAjax.invokeAsyncCGI("axis_axisrea037.do", callbackAjaxActualizaTramos, 
                    "operation=ajax_actualiza_tramos&SCONTRA="+SCONTRA, this, objJsMessages.jslit_actualizando_registro);
                    
            }
            function callbackAjaxActualizaTramos(ajaxResponseText) {
                 var tramoCombo = document.miForm.CTRAMO;
               
            try {
                    var doc=objAjax.domParse(ajaxResponseText);
                                     
                    if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                        if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                            objDom.borrarOpcionesDeCombo(tramoCombo);
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", tramoCombo, 0);
                            for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                                var CATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0].childNodes[0].nodeValue : "");
                                var TATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0].childNodes[0].nodeValue : "");
                                objDom.addOpcionACombo(CATRIBU, TATRIBU, tramoCombo, i+1);
                            }
                        }else{
                            objDom.borrarOpcionesDeCombo (versionCombo);
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", tramoCombo, null);
                        }
                    }
                
                } catch (e) {
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", tramoCombo, null);
                    //alert(objJsMessages.jslit_sin_motivos);
                }
            }
    </script>
  
  
  </head>
  <body onload="f_onload_axisrea032()" onkeypress="if (event.keyCode==13)  { f_but_buscar()}">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
  
  
 
   
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation" value="form"/>
        <input type="hidden" name="MODO" id="MODO" value="${__formdata.MODO}"/>
         <input type="hidden" name="CCODIGO_DEL" id="CCODIGO_DEL" value="${__formdata.CCODIGO}"/>
        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisrea034" c="LIT_NOMBRE_PANTALLA" lit="1000108" />&nbsp;<axis:alt f="axisrea034" c="LIT_NOMBRE_PANTALLA_TIT" lit="9902193" /></c:param>
            <c:param name="producto"><axis:alt f="axisrea034" c="LIT_NOMBRE_PANTALLA_AUX" lit="1000108" />&nbsp;<axis:alt f="axisrea034" c="LIT_NOMBRE_PANTALLA_TIT_AUX" lit="9902193" /></c:param>
            <c:param name="form">axisrea034</c:param>
        </c:import>
        
        <!-- Pantallas modales -->
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisrea036|<axis:alt f="axisrea034" c="LIT_MODAL_AXISREA036_1" lit="9000570" />&nbsp;<axis:alt f="axisrea034" c="LIT_MODAL_AXISREA036_2" lit="9902193" /></c:param>
        </c:import>

        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:130px">
          
            <tr>
                <td>
                
                    <!-- TRAMOS -->
                    <table class="area">

                                            <tr>
                                                 <th style="width:33%;height:0px"></th>                                            
                                                 <th style="width:33%;height:0px"></th>
                                                 <th style="width:33%;height:0px"></th>
                                           
                                            </tr>
                                            <tr>
                                                  <axis:ocultar f="axisrea034" c="CCODIGO" dejarHueco="false"><!-- CODIGO -->
                                                       <td class="titulocaja" colspan="1"><b id="label_CCODIGO"><axis:alt f="axisrea034" c="LIT_CIDIOMA" lit="9902289"/></b></td>
                                                  </axis:ocultar>
                                                  <%--axis:ocultar f="axisrea034" c="DESCRIPCION" dejarHueco="false"><!-- TIPO-->
                                                       <td class="titulocaja" colspan="2"><b id="label_DESCRIPCION"><axis:alt f="axisrea034" c="LIT_DESCRIPCION" lit="100588"/></b></td>
                                                  </axis:ocultar--%>
                                                         
                                                                                                                 
                                             </tr>
                                             
                                             <tr>
                                                  <axis:ocultar f="axisrea034" c="CCODIGO" dejarHueco="false">
                                                           <td class="campocaja" colspan="1"> <!-- CODIGO -->
                                                                <input type="text" class="campo campotexto"  id="CCODIGO" name="CCODIGO" style="width:80%"
                                                                value="${__formdata.CCODIGO}" <axis:atr f="axisrea034" c="CCODIGO" a="modificable=true"/>
                                                                 <axis:atr f="axisrea034" c="CCODIGO" a="formato=entero"/>/>
                                                           </td>
                                                  </axis:ocultar>
                                                  <%--axis:ocultar f="axisrea034" c="DESCRIPCION" dejarHueco="false"> 
                                                            <td class="campocaja" colspan="1"> <!-- CODIGO -->
                                                                <input type="text" class="campo campotexto"  obligatorio="true" id="DESCRIPCION" name="DESCRIPCION" style="width:80%"
                                                                value="${__formdata.DESCRIPCION}" <axis:atr f="axisrea034" c="DESCRIPCION" a="modificable=true"/>/>
                                                           </td>                                               
                                                  </axis:ocultar--%>
                                                      
                                            </tr>
                                            <tr>
                                                         <axis:ocultar f="axisrea034" c="SCONTRA" dejarHueco="false"><!-- Nº REPOSICION -->
                                                            <td class="titulocaja" colspan="1"><b id="label_CONTRAT"><axis:alt f="axisrea034" c="LIT_CONTRAT" lit="101945"/></b></td>
                                                         </axis:ocultar>

                                                         <axis:ocultar f="axisrea034" c="NVERSIO" dejarHueco="false"><!-- DESCRIPCION -->
                                                            <td class="titulocaja" colspan="1"><b id="label_NVERSIO"><axis:alt f="axisrea034" c="LIT_NVERSIO" lit="9001146"/></b></td>
                                                         </axis:ocultar>
                                                       
                                                       <axis:ocultar f="axisrea034" c="CTRAMO" dejarHueco="false">
                                                            <td class="titulocaja" colspan="1"><b><axis:alt f="axisrea034" c="LIT_CTRAMO" lit="9000609"/></b></td>
                                                         </axis:ocultar> 
                                                </tr>
                                                <tr>
                                                          <axis:ocultar f="axisrea034" c="SCONTRA" dejarHueco="false">
                                                               <td class="campocaja" colspan="1"> <!-- CODIGO -->
                                                                    <select onchange="f_actualiza_version()" name="SCONTRA" id="SCONTRA" size="1"  class="campowidthselect campo campotexto"  
                                                                        title="<axis:alt f='axisrea034' c='SCONTRA' lit='101945'/>">                               
                                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea034" c="ALT_SCONTRA_SEL" lit="108341"/> - </option>
                                                                                <c:forEach var="element" items="${__formdata.listaContrato}">
                                                                                    <option value = "${element.SCONTRA}" 
                                                                                    <c:if test="${element.SCONTRA == __formdata.SCONTRA}"> selected </c:if> >
                                                                                     ${element.SCONTRA} - ${element.TDESCRIPCION} 
                                                                                    </option>
                                                                                </c:forEach>
                                                                        </select> 
                                                               </td>
                                                          </axis:ocultar>
                                                           <axis:ocultar f="axisrea034" c="NVERSIO" dejarHueco="false">
                                                               <td class="campocaja" colspan="1"> <!-- CODIGO -->
                                                                   <select name="NVERSIO" id="NVERSIO" size="1" class="campowidthselect campo campotexto"  
                                                                    style="width:90%;"
                                                                        title="<axis:alt f='axisrea034' c='NVERSIO' lit='9001146'/>">                               
                                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea035" c="ALT_NVERSIO_SEL" lit="108341"/> - </option>
                                                                            <c:forEach var="element" items="${__formdata.listaVersion}">
                                                                                <option value = "${element.NVERSIO}" 
                                                                                <c:if test="${element.NVERSIO == __formdata.NVERSIO}"> selected </c:if> >
                                                                                 ${element.NVERSIO} - ${element.TCONTRA} 
                                                                                </option>
                                                                            </c:forEach>
                                                                        </select> 
                                                               </td>
                                                          </axis:ocultar>
                                                          <axis:ocultar f="axisrea034" c="CTRAMO"> <!-- Linia 1. Columna 2. -->
                                                           <td class="campocaja" colspan="1"> <!-- CODIGO -->
                                                            <select name="CTRAMO" id="CTRAMO" size="1" <c:if test="${__formdata.MODO=='MOD'}" >disabled</c:if> class="campowidthselect campo campotexto"  <axis:atr f="axisrea034" c="CTRAMO" a="modificable=true&isInputText=true&obligatorio=false"/>  obligatorio="false"
                                                            title="<axis:alt f='axisrea034' c='CTRAMO' lit='9000609'/>">                               
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea034" c="ALT_CTRAMO_SEL" lit="108341"/> - </option>
                                                                <c:forEach var="element" items="${__formdata.listaTramos}">
                                                                    <option value = "${element.CATRIBU}" 
                                                                    <c:if test="${element.CATRIBU == __formdata.CTRAMO}"> selected </c:if> >
                                                                     ${element.TATRIBU} 
                                                                    </option>
                                                                </c:forEach>
                                                            </select>     
                                                            </td>
                                                        </axis:ocultar>    
                                                </tr>
                                            <!--  LISTA -->
                                           
                                            <tr>
                                                    <td colspan="3">
                                                    
                                                    <table class="area" align="left"> <!-- multirregistro de tramos -->
                                                                                    <tr>
                                                                                      <td> 
                                                                                        <c:set var="title1"><axis:alt f="axisrea034" c="ALT_COD" lit="9902289"/></c:set>  <%-- Código --%>
                                                                                        <c:set var="title2"><axis:alt f="axisrea034" c="CONTRATO" lit="101945"/></c:set>
                                                                                        <c:set var="title3"><axis:alt f="axisrea034" c="VERSION" lit="9000577"/></c:set>
                                                                                        <c:set var="title4"><axis:alt f="axisrea034" c="TRAMO" lit="9000609"/></c:set>
                                                                                        <div class="displayspace" id="dt_repos">
     
                                                                                          <display:table name="${__formdata.listaReposiciones}" id="T_IAX_REPOS" export="false" class="dsptgtable" 
                                                                                          pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                                                          requestURI="modal_axisrea034.do?paginar=true">
                                                                                            <%@ include file="../include/displaytag.jsp"%>
                                                                                                                                                               
                                                                                            <display:column title="${title1}" sortable="false" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                                              <div class="dspText" onclick="f_modificar_axisrea035('${T_IAX_REPOS.CCODIGO}','${T_IAX_REPOS.TREPO}','MOD')">
                                                                                                    <span style="text-decoration:underline;cursor:pointer" onclick="javascript:f_modificar_axisrea035('${T_IAX_REPOS.CCODIGO}','${T_IAX_REPOS.TREPO}','MOD',${T_IAX_REPOS.SCONTRA},${T_IAX_REPOS.NVERSIO})">
                                                                                                    ${T_IAX_REPOS.CCODIGO}
                                                                                                    </span>
                                                                                             </div>
                                                                                            </display:column>

                                                                                           <display:column title="${title2}" sortable="false" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                                              <div class="dspText">
                                                                                                    <span style="text-decoration:underline;cursor:pointer" onclick="javascript:f_modificar_axisrea035('${T_IAX_REPOS.CCODIGO}','${T_IAX_REPOS.TREPO}','MOD',${T_IAX_REPOS.SCONTRA},${T_IAX_REPOS.NVERSIO})">
                                                                                                    ${T_IAX_REPOS.TCONTRA}
                                                                                                    </span>
                                                                                                </div>
                                                                                            </display:column>
                                                                                            
                                                                                            <display:column title="${title3}" sortable="false" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                                              <div class="dspText">
                                                                                                    <span style="text-decoration:underline;cursor:pointer" onclick="javascript:f_modificar_axisrea035('${T_IAX_REPOS.CCODIGO}','${T_IAX_REPOS.TREPO}','MOD',${T_IAX_REPOS.SCONTRA},${T_IAX_REPOS.NVERSIO})">
                                                                                                    ${T_IAX_REPOS.NVERSIO}
                                                                                                    </span>
                                                                                                </div>
                                                                                            </display:column>
                       
                                                                                            <display:column title="${title4}" sortable="false" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                                              <div class="dspText">
                                                                                                    <span style="text-decoration:underline;cursor:pointer" onclick="javascript:f_modificar_axisrea035('${T_IAX_REPOS.CCODIGO}','${T_IAX_REPOS.TREPO}','MOD',${T_IAX_REPOS.SCONTRA},${T_IAX_REPOS.NVERSIO})">
                                                                                                    ${T_IAX_REPOS.TTRAMO}
                                                                                                    </span>
                                                                                                </div>
                                                                                            </display:column>
                                                                                            
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
                                                          
                                                                        
                                     <!-- ************************* FIN DATOS TRAMOS  ********************* -->     			
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea032</c:param><c:param name="f">axisrea032</c:param>
            <c:param name="__botones">cancelar,buscar</c:param>
        </c:import>        
    </form> 
    
    <c:import url="../include/mensajes.jsp" />
     
   </body>
</html>