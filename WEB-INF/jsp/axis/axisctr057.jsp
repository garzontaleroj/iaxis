<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%--
  Fichero: axisctr057.jsp
  @author <a href = "mailto:jsanchez@csi-ti.com">Jordi Sanchez</a>

  Fecha: 20/12/2007
--%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<html>
    <head>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>        
        <c:import url="../include/carga_framework_js.jsp" />

        <script type="text/javascript">
            
            function f_onload(){
f_carga_dependencias();  
                NLINEA = "${__formdata.NLINEA}";
                if (objUtiles.estaVacio(NLINEA))
                    f_abrir_axisctr056();
                    

                
                revisarEstilos();
            }
            
            ///////////////////////////////////////////////////
            function f_but_cancelar() {
                     objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr057", "cancelar", document.miForm, "_self");
            }
            function f_salir() {
                objAjax.invokeAsyncCGI("axis_axisctr057.do", callbackAjaxCancelar, "operation=ajax_cancelar", this, objJsMessages.jslit_cargando);
            }
            
            function callbackAjaxCancelar (ajaxResponseText) {
                var doc = objAjax.domParse(ajaxResponseText);
                                                                
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {   
                    parent.f_cancelar_axisctr057();
                }        
            }

            function f_cerrar_modal(cual) {
                objUtiles.cerrarModal(cual);
            }    
            
            function f_esconder_precargador (){
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
            }
            
            // Imprimir
          
            function f_cerrar_axisimprimir() {
                objUtiles.cerrarModal("axisimprimir");
                objUtiles.ejecutarFormulario("axis_axisctr057.do", "renovar", document.miForm, "_self", objJsMessages.jslit_cargando);

            }
            
            function f_but_salir() {
            // Bug 11177.NMM.i.CONSULTA_POLISSA
            var origen = "${__formdata.ORIGEN}";
             //alert(origen);
             
                if (objUtiles.estaVacio(origen))
                     objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr057", "cancelar", document.miForm, "_self");
                     else
                     //parent.f_cancelar_axisctr057;
                     f_salir();
                //objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
                // Bug 11177.NMM.f.CONSULTA_POLISSA
            }            

    /****************************************************************************************/
    /********************************* MODAL AXISCTR056 *************************************/
    /****************************************************************************************/
            function f_abrir_axisctr056() {
                objUtiles.abrirModal("axisctr056","src","modal_axisctr056.do?operation=init");
            }
            
            function f_cerrar_axisctr056(){
                f_cerrar_modal('axisctr056');
            }
            
            function f_aceptar_axisctr056 (cadena) {
                f_cerrar_modal('axisctr056');
                var pos = cadena.indexOf("#");
                var paramSseguro = cadena.substr(0,pos);
                var paramNlinea = cadena.substr(pos+1,cadena.length-pos);
                objDom.setValorPorId("SSEGURO", paramSseguro);
                objDom.setValorPorId("NLINEA", paramNlinea);
                document.miForm.PMODO.value = 1;

                objUtiles.ejecutarFormulario("axis_axisctr057.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }  

    /****************************************************************************************/
    /********************************* MODAL AXISCTR019 *************************************/
    /****************************************************************************************/
           
    function f_aceptar_axisctr019(SSEGURO) {
          f_cerrar_axisctr019();
          objDom.setValorPorId("SSEGURO", SSEGURO);

          objUtiles.abrirModal
                    ("axisctr063", "src", "modal_axisctr063.do?operation=form&PMODO=0&SSEGURO="+SSEGURO);    
    }
            
    function f_cerrar_axisctr019(SSEGURO) {
          objUtiles.cerrarModal("axisctr019");
    }
            
    function f_abrir_axisctr019(PMODO) {
        objUtiles.cerrarModal("axisctr056");
        document.miForm.PMODO.value = PMODO;
        objUtiles.abrirModal
                 ("axisctr019", "src", "modal_axisctr019.do?operation=form");
    }

    /****************************************************************************************/
    /********************************* MODAL AXISCTR063 *************************************/
    /****************************************************************************************/
    function f_aceptar_axisctr063 (cadena) {
           f_cerrar_modal('axisctr063');
           var pos = cadena.indexOf("#");
           var paramSseguro = cadena.substr(0,pos);
           var paramNlinea = cadena.substr(pos+1,cadena.length-pos);
           objDom.setValorPorId("SSEGURO", paramSseguro);
           objDom.setValorPorId("NLINEA", paramNlinea);
               
           objUtiles.ejecutarFormulario("axis_axisctr057.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
    }  
            
    function f_cerrar_axisctr063(SSEGURO) {
          objUtiles.cerrarModal("axisctr063");        
    }

    function f_abrir_axisctr063(PMODO){
          document.miForm.PMODO.value = PMODO;
          var nsseguro = document.miForm.SSEGURO.value; 
          
          if (!objUtiles.estaVacio(nsseguro)){          
             objUtiles.abrirModal("axisctr063", "src", "modal_axisctr063.do?operation=form&PMODO="+PMODO+"&NLINEA="+document.miForm.NLINEA.value+"&SSEGURO="+document.miForm.SSEGURO.value);
          }
    }        

        </script>
    </head>
    <body onload="f_onload()" ><!--  -->
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>

    <c:import url="../include/modal_estandar.jsp">
    <c:param name="nid_y_titulo">axisctr063|<fmt:message key="9001769" /></c:param>
    </c:import>

        <c:import url="../include/modal_estandar.jsp">
       <c:param name="nid_y_titulo">axisctr019|<fmt:message key="1000188" /></c:param>
    </c:import>  

    <form name="miForm" action="axis_axisctr057.do" method="POST">
          <input type="hidden" name="operation" value=""/>
          <input type="hidden" id="PMODO" name="PMODO" value="${__formdata.PMODO}"/>
          <input type="hidden" id="NLINEA" name="NLINEA" value="${__formdata.NLINEA}"/>
          <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
          <input type="hidden" id="CESTADO" name="CESTADO" value="${__formdata.CESTADO}"/>
          <input type="hidden" id="ORIGEN" name="ORIGEN" value="${__formdata.ORIGEN}"/>

    
            <input type="hidden" id="checked_mot" name="checked_mot"/>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><fmt:message key="9001188" /></c:param>
                <c:param name="nid" value="axisctr056" />
            </c:import>
            <c:import url="../include/titulo_nt.jsp"> 
                <c:param name="modalidad"> </c:param> 
                <c:param name="titulo"> </c:param>
                <c:param name="formulario"><fmt:message key="9001246" /></c:param>
                <c:param name="producto"></c:param>
                <c:param name="form">axisctr057</c:param>
            </c:import>
            <!-- Ventana modal impresion -->
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><fmt:message key="1000205" /></c:param>
                <c:param name="nid" value="axisimprimir" />
            </c:import>
            <!-- -->
            
    <!-- Area de campos  -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <!-- Antes area de campos -->
                <!-- Bug 11177.NMM.07/10/2009.Afegim el nombre de suplement darrera la pòlissa. -->
                <div class="separador">&nbsp;</div>
                <div class="titulo" >
                <div style="float:left;">
                <img src="images/flecha.gif"/><fmt:message key="9001247" />
                   <c:if test="${!empty __formdata.NPOLIZA}"><fmt:message key="800242" />&nbsp;:&nbsp;${__formdata.NPOLIZA}</c:if><c:if test="${!empty __formdata.NCERTIF}">-${__formdata.NCERTIF}</c:if>
                   <c:if test="${!empty __formdata.NLINEA}"><fmt:message key="9001189" />&nbsp;:&nbsp;${__formdata.NLINEA}</c:if>
                   <axis:ocultar f="axisctr057" c="BT_BUSCARAGENDA" dejarHueco="false">                   
                      <img border="0" alt="<fmt:message key="9001722"/>" title="<fmt:message key="9001722"/>" src="images/find.gif" onclick="f_abrir_axisctr056()" style="cursor:pointer"/>
                   </axis:ocultar>                       
                   </div>
                </div>

                <!-- DisplayTag Polizas -->
               <%-- <div class="seccion displayspaceGrande">--%>
                 <c:set var="title1"><fmt:message key="100624" /></c:set>                
          <%--      </div>--%>
                
            </td>
        </tr>
        <tr>
            <td>
                <table class="area" align="center">
                   <tr>
                     <th style="width:25%;height:0%;"/>
                     <th style="width:25%;height:0%;"/>
                     <th style="width:25%;height:0%;"/>
                     <th style="width:25%;height:0%;"/>
                   </tr>                    


                    <tr>
                        <!-- Titulo Título Apunte -->
                        <axis:ocultar f="axisctr057" c="TTITULO" dejarHueco="false">
                           <td class="titulocaja">
                               <b><fmt:message key="9001196"/></b>
                           </td>
                        </axis:ocultar>                    
                    </tr>
                    <tr>
                        <!-- Título Apunte -->
                        <td class="campocaja" colspan="2">
                        <axis:ocultar f="axisctr057" c="TTITULO" dejarHueco="false">                        
                               <input type="text" class="campowidthinput campo" size="30" value="${__formdata.TTITULO}" name="TTITULO" id="TTITULO" 
                               style="width:95%;" title="<fmt:message key="9001196"/>" <axis:atr f="axisctr057" c="TTITULO" a="modificable=false"/> />
                        </axis:ocultar>

                        <axis:visible f="axisctr057" c="BT_EDIT_AGENDA">
                       <%-- <div id="BT_EDIT_AGENDA">--%>
                               <a href="javascript:f_abrir_axisctr063(1)" id="BT_EDIT_AGENDA">
                               <img border="0" alt="<fmt:message key="9001330"/>" title="<fmt:message key="9001330"/>" src="images/lapiz.gif"/>
                               </a>
                        <%--</div>--%>
                        </axis:visible>                                 
                        </td>    
                                                 
                    </tr>
                    
                    <axis:ocultar f="axisctr057" c="TTEXTOS" dejarHueco="false">
                    <tr>
                        <!-- Titulo Texto Apunte -->
                        <td class="titulocaja">
                            <b><fmt:message key="9001197"/></b>
                        </td>
                    </tr>
                    <tr>
                        <!-- Texto Apunte -->
                       <td colspan="3" style="width:100%;"   class="campocaja">
                       <%-- Cambio para IAXIS-16304 : start --%>
                       <textarea rows="20" cols="50" class="campo campotexto" 
                       <%-- Cambio para IAXIS-POST73 : SE AGREGO maxlength Y SE AUMENTO STYLE DE 60 A 97,5 --%>
                                maxlength="200000"
                                style="width:97.5%;overflow: scroll;"
                       <%-- Cambio para IAXIS-POST73 : SE AGREGO maxlength Y SE AUMENTO STYLE DE 60 A 97,5 --%>     
                       			 <axis:atr f="axisctr057" c="TTEXTOS" a="modificable=false"/> 
                       			 name="TTEXTOS" id="TTEXTOS">${__formdata.TTEXTOS1}${__formdata.TTEXTOS2}${__formdata.TTEXTOS3}
                       			 ${__formdata.TTEXTOS4}${__formdata.TTEXTOS5}${__formdata.TTEXTOS6}${__formdata.TTEXTOS7} </textarea>
                       <%-- Cambio para IAXIS-16304 : end --%>
                       </td>
                    </tr>
                    </axis:ocultar>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table class="area" align="center">
                   <tr>
                     <th style="width:25%;height:0%;"/>
                     <th style="width:25%;height:0%;"/>
                     <th style="width:25%;height:0%;"/>
                     <th style="width:25%;height:0%;"/>
                   </tr>                      

                   <tr>
                        <!-- Titulo Estado Apunte -->
                        <axis:ocultar f="axisctr057" c="TESTADO" dejarHueco="false">
                        <td class="titulocaja">
                            <b><fmt:message key="9001191"/></b>
                        </td>
                         </axis:ocultar>
                        <!-- Titulo Concepto Apunte -->
                        <axis:ocultar f="axisctr057" c="TTIPREG" dejarHueco="false">
                        <td class="titulocaja">
                            <b id="label_TTIPREG"><fmt:message key="9001190"/></b>
                        </td>
                         </axis:ocultar>
                    </tr>
                    <tr>
                        <!-- Estado Apunte -->
                        <axis:ocultar f="axisctr057" c="TESTADO" dejarHueco="false">
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo" size="15" value="${__formdata.TESTADO}" name="TESTADO" id="TESTADO" 
                                style="width:75%;" title="<fmt:message key='9001191'/>" <axis:atr f="axisctr057" c="TESTADO" a="modificable=false"/>  />         
                            </td> 
                        </axis:ocultar>
                        <!-- Concepto Apunte -->
                        <axis:ocultar f="axisctr057" c="TTIPREG" dejarHueco="false">
                            <td class="campocaja">
                               <input type="text" class="campowidthinput campo" size="15" value="${__formdata.TTIPREG}" name="TTIPREG" id="TTIPREG" 
                                style="width:75%;" title="<fmt:message key='9001190'/>" <axis:atr f="axisctr057" c="TTIPREG" a="modificable=false"/>  />
                                
                            </td> 
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <!-- Titulo Fecha Alta -->
                        <axis:ocultar f="axisctr057" c="FALTA" dejarHueco="false">
                        <td class="titulocaja">
                            <b><fmt:message key="9001192"/></b>
                        </td>
                        </axis:ocultar>
                        <!-- Titulo Usuario Alta -->
                        <axis:ocultar f="axisctr057" c="CUSUALT" dejarHueco="false">
                        <td class="titulocaja">
                            <b><fmt:message key="9001630"/></b>
                        </td>
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <!-- Fecha Alta -->
                        <axis:ocultar f="axisctr057" c="FALTA" dejarHueco="false">
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo" size="15" value="<fmt:formatDate value='${__formdata.FALTA}' pattern='dd/MM/yyyy'/>" name="FALTA" id="FALTA" 
                            style="width:55%;" title="<fmt:message key="9001192"/>" <axis:atr f="axisctr057" c="FALTA" a="modificable=false"/> />
                        </td> 
                        </axis:ocultar>
                        <!-- Usuario Alta -->
                        <axis:ocultar f="axisctr057" c="CUSUALT" dejarHueco="false">
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo" size="15" value="${__formdata.CUSUALT}" name="CUSUALT" id="CUSUALT" 
                            style="width:55%;" title="<fmt:message key="9001630"/>" <axis:atr f="axisctr057" c="CUSUALT" a="modificable=false"/> />
                        </td> 
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <!-- Titulo Fecha Modificacion -->
                        <axis:ocultar f="axisctr057" c="FMODIFI" dejarHueco="false">
                        <td class="titulocaja">
                            <b><fmt:message key="9001266"/></b>
                        </td>
                        </axis:ocultar>
                        <!-- Titulo Usuario Modificacion -->
                        <axis:ocultar f="axisctr057" c="CUSUMOD" dejarHueco="false">
                        <td class="titulocaja">
                            <b><fmt:message key="9001265"/></b>
                        </td>
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <!-- Fecha modificacion -->
                        <axis:ocultar f="axisctr057" c="FMODIFI" dejarHueco="false">
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo" size="15" value="<fmt:formatDate value='${__formdata.FMODIFI}' pattern='dd/MM/yyyy'/>" name="FMODIFI" id="FMODIFI" 
                            style="width:55%;" title="<fmt:message key="9001266"/>" <axis:atr f="axisctr057" c="FMODIFI" a="modificable=false"/> />
                        </td> 
                        </axis:ocultar>
                       
                        <!-- Usuario Modificacion -->
                        <axis:ocultar f="axisctr057" c="CUSUMOD" dejarHueco="false">
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo" size="15" value="${__formdata.CUSUMOD}" name="CUSUMOD" id="CUSUMOD" 
                            style="width:55%;" title="<fmt:message key="9001265"/>" <axis:atr f="axisctr057" c="CUSUMOD" a="modificable=false"/> />
                        </td>
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <!-- Titulo Fecha Finalizacion -->
                        <axis:ocultar f="axisctr057" c="FFINALI" dejarHueco="false">
                        <td class="titulocaja">
                            <b><fmt:message key="9001198"/></b>
                        </td>
                         </axis:ocultar>
                    </tr>
                    <tr>
                        <!-- Fecha Finalizacion -->
                        <axis:ocultar f="axisctr057" c="FFINALI" dejarHueco="false">
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo" size="15" value="<fmt:formatDate value='${__formdata.FFINALI}' pattern='dd/MM/yyyy'/>" name="FFINALI" id="FFINALI" 
                            style="width:55%;" title="<fmt:message key="9001198"/>" <axis:atr f="axisctr057" c="FFINALI" a="modificable=false"/> />
                        </td> 
                        </axis:ocultar>
                        
                    </tr>
                </table>
            </td>
        </tr>
    </table>  <!-- Table area campos --> <!-- Ahora incluye a los dos forms -->

    <c:import url="../include/botonera_nt.jsp"><c:param name="__botones">salir</c:param></c:import>        
    

    </form>
    
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>
