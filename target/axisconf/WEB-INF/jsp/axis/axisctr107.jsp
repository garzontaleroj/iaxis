<%/*
*  Fichero: axisctr107.jsp
*
*  @author <a href="mailto:rkirchner@csi-ti.com">Jaume Garcia</a>
*  Fecha: 29/12/2008
*/
%>
<%@ page contentType="text/html;charset=iso-8859-15"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/tree.css" type="text/css"></link>
    <!--********** CALENDARIO ************************* -->
    <!-- Hoja de estilo del Calendario -->
    <link rel="stylesheet" type="text/css" media="all"
          href="styles/calendar-green.css" title="green"/>
    <!-- Script principal del calendario -->
    <script type="text/javascript" src="scripts/calendar.js"></script>
    <!-- Idioma del calendario, en función del Locale -->
    <script type="text/javascript"
            src="scripts/calendar-${sessionScope.__locale}.js"></script>
    <!-- Setup del calendario -->
    <script type="text/javascript" src="scripts/calendar-setup.js"></script>
    <!--*********************************** -->
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_but_salir() {
           objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr107", "cancelar", document.miForm, "_self");                   
        }

        function f_but_buscar() {
            f_abrir_modal('axisctr106', true);
        }

        function f_cerrar_modalespersona(modal) {
            objUtiles.cerrarModal(modal);
        }         
        
        function f_onload() {
            revisarEstilos();            
            var hayErrores    = ${!empty requestScope.__mensajes.m__clave};
            var depot = "${datos_aseg.CCODDEP}";
            var tdepot = "${datos_aseg.TNOMDEPO}";
            var v_dgs = "${__formdata.CCODDGS}";
            var v_recargar = "${__formdata.RECARGAR}";
            
            if (!objUtiles.estaVacio(v_dgs) && !objUtiles.estaVacio(v_recargar))  f_aceptar_axisctr106(v_dgs,null,null);
            
            document.miForm.CCODDGS.value =v_dgs;

            if ( objUtiles.estaVacio(document.miForm.CCODDGS.value) ) document.miForm.CLISTBLANC.checked = true;


        }

            function f_but_gravar(){                
                
                //var NPORCEN=objDom.getValorPorId("NPORCEN");
                //var IIMPTEMP=objDom.getValorPorId("IIMPTEMP");
                //var NPARPLA=objDom.getValorPorId("NPARPLA");
                
                //objDom.setValorPorId("CEXTERN", ((document.miForm.CEXTERN.checked)? "1" : "0"));
 
                    if (objValidador.validaEntrada()) { 
                        //actualizarImportes();
                        objUtiles.ejecutarFormulario ("axis_axisctr107.do", "grabar", document.miForm, "_self", objJsMessages.jslit_cargando);                             
                       }
            }        

            function f_but_1000428(){
                    f_aceptar_axisctr106('',null,null);
                    /*
                    objDom.setValorPorId("CCODDGS", "");
                    objDom.setValorPorId("TNOMBRE", "");
                    objDom.setValorPorId("SPERSON", "");                    
                    objDom.setValorPorId("CCODDEP", "");                     
                    objDom.setValorPorId("TNOMDEPO", "");
                    document.miForm.CLISTBLANC.checked = true;
                    document.miForm.CLISTBLANC.value = 1; */

                    }

            function f_but_9001333(){
              objUtiles.ejecutarFormulario ("axis_axisctr107.do", "borrar_aseg", document.miForm, "_self", objJsMessages.jslit_cargando);   
                    }                    
            
            function f_borrar_rel_dipositaria(DEP){        
              objUtiles.ejecutarFormulario ("axis_axisctr107.do?CODEP="+DEP, "bborrar_depo", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }

           
            function f_altamod_depo(CFON,CFONDGS,NFON,CDEP,NDEP,CTIP,CBAN,CTRA,CMOD){     
                if (!objUtiles.estaVacio(CFON))
                  objUtiles.abrirModal("axisctr157", "src", "modal_axisctr157.do?operation=form&CFON="+CFON+"&CFONDGS="+CFONDGS+"&NFON="+NFON+"&CDEP="+CDEP+"&NDEP="+NDEP+"&CTIP="+CTIP+"&CBAN="+CBAN+"&CTRA="+CTRA+"&modus="+CMOD);
                else                     alert('<fmt:message key='101734' />');  
            }
         
            
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_cerrar_axisctr106() {
            f_cerrar_modal("axisctr106");
        }
        
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_cerrar_modal2(cual) {
                objUtiles.cerrarModal(cual); 
                //document.miForm.CCODDGS.value=CCODDGS;
                objUtiles.ejecutarFormulario("axis_axisctr107.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);      
       }

        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            
            if (objUtiles.estaVacio(optionalQueryString)) optionalQueryString = "";
            
            //if (noXButton)  objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
            
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=buscar" + optionalQueryString);        
            //apocianalquery seria algo asi como:&CEMPRES="+document.miForm.CCODPLA_TRASPAS.value);
            //objUtiles.abrirModal("axisctr106","src","modal_axisctr106.do?operation=buscar&CEMPRES=4");
        }

            function f_aceptar_axisctr106 (CCODDGS,CTIPBAN,CBANCAR) {
                f_cerrar_axisctr106();
                document.miForm.CCODDGS.value=CCODDGS;
                //document.miForm.CTIPBAN.value=CTIPBAN;
                //  document.miForm.CBANCAR.value=CBANCAR;
                objUtiles.ejecutarFormulario("axis_axisctr107.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);

            } 

        function f_but_buscar_persona() {
            objUtiles.abrirModal("axisper021","src","modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBLICAS&faceptar=f_aceptar_axisper021");
            
        }        
        
        function f_aceptar_persona(PMENSAPOPUP){

            objDom.setValorPorId("SPERSON", PMENSAPOPUP); 
            objUtiles.cerrarModal("axisper021");
            
            f_onchange_pers(PMENSAPOPUP);
        } 
        
        function f_cerrar_axisper021(){
                objUtiles.cerrarModal("axisper021");
        }   
        
        function f_onchange_depo(DEPO){

            objAjax.invokeAsyncCGI("axis_axisctr107.do?CCODDEP="+DEPO, callbackAjaxDepo, "operation=ajax_depo", this, objJsMessages.jslit_cargando);
        }    
        function f_onchange_aseg(ASEG){
                objUtiles.ejecutarFormulario("axis_axisctr107.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }            
        
        function f_onchange_pers(PERS){
            objAjax.invokeAsyncCGI("axis_axisctr107.do?SPERSON="+PERS, callbackAjaxPers, "operation=ajax_pers", this, objJsMessages.jslit_cargando);
        }    
        
        function f_onchange_banc(BANC){
        var TIPBAN = document.miForm.CTIPBAN.value;
        if (!objUtiles.estaVacio(TIPBAN)) TIPBAN = 1;
        
        //objDom.setValorPorId("CEXTERN", ((document.miForm.CEXTERN.checked)? "1" : "0"));
            objAjax.invokeAsyncCGI("axis_axisctr107.do?CTIPBAN="+TIPBAN+"&CBANCAR="+BANC, callbackAjaxBanc, "operation=ajax_banc", this, objJsMessages.jslit_cargando);
        }            

            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/        
            /****************************************************************************************/
             function callbackAjaxBanc (ajaxResponseText) {
             
            try{
                var doc = objAjax.domParse(ajaxResponseText);
                var elementos = doc.getElementsByTagName("element");
                
                
                if(objAppMensajes.existenErroresEnAplicacion(doc))
                   {                               
                        objDom.setValorPorId("CBANCAR", "");     
                        objDom.setValorPorId("CTIPBAN", "<%= Integer.MIN_VALUE %>"); 
                    }
                }
                catch(e){
                        objDom.setValorPorId("CBANCAR", "");     
                        objDom.setValorPorId("CTIPBAN", "<%= Integer.MIN_VALUE %>"); 
                }
            }  

             function callbackAjaxPers (ajaxResponseText) {
             
            try{
                var doc = objAjax.domParse(ajaxResponseText);
                var elementos = doc.getElementsByTagName("element");
                
                
                if(!objAppMensajes.existenErroresEnAplicacion(doc))
                   {                               
                    
                    objDom.setValorPorId("TNOMBRE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0));
                    }
                }
                catch(e){
                        objDom.setValorPorId("TNOMBRE", "");     
                        objDom.setValorPorId("SPERSON", ""); 
                }
            }  
            
            
             function callbackAjaxDepo (ajaxResponseText) {
             
            try{
                var doc = objAjax.domParse(ajaxResponseText);
                var elementos = doc.getElementsByTagName("element");
                
                
                if(!objAppMensajes.existenErroresEnAplicacion(doc))
                   {                               
                    //alert(ajaxResponseText);
                    var CODIGO= objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCODDEP"), 0, 0);
                    var PERSONA=doc.getElementsByTagName("PERSONA")[0];
                    var NOMBRE = objDom.getValorNodoDelComponente(PERSONA.getElementsByTagName("TAPELLI1"), 0, 0);
                
                    objDom.setValorPorId("TNOMDEPO", NOMBRE);
                    }
                }
                catch(e){
                        objDom.setValorPorId("TNOMDEPO", "");     
                        objDom.setValorPorId("CCODDEP", ""); 
                }
            }  

             function callbackAjaxAseg (ajaxResponseText) {
             
            try{
                var doc = objAjax.domParse(ajaxResponseText);
                var elementos = doc.getElementsByTagName("element");
                 
                if(!objAppMensajes.existenErroresEnAplicacion(doc))
                   {                               
                    //alert(ajaxResponseText);
                    
                    
                    var DEPO = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CCODDEP")[0]) ? 
                               objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCODDEP"), 0, 0) : "";  
                    
                    objDom.setValorPorId("CCODDGS", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODDGS"), 0, 0));
                    objDom.setValorPorId("CCODDEP", DEPO);
                    objDom.setValorPorId("CTIPBAN", objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTIPBAN")[0]) ? 
                               objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPBAN"), 0, 0) : "");
                               
                    objDom.setValorPorId("CBANCAR", objUtiles.hayValorElementoXml(doc.getElementsByTagName("CBANCAR")[0]) ? 
                               objDom.getValorNodoDelComponente(doc.getElementsByTagName("CBANCAR"), 0, 0) : "");
                               
                    objDom.setValorPorId("TNOMBRE", objUtiles.hayValorElementoXml(doc.getElementsByTagName("DESCRIPCIO")[0]) ? 
                               objDom.getValorNodoDelComponente(doc.getElementsByTagName("DESCRIPCIO"), 0, 0) : "");
                    
                    objDom.setValorPorId("SPERSON", objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0));
                    
                    objDom.setValorPorId("CCODASEG", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCODASEG"), 0, 0));
                    
                    objDom.setValorPorId("CCODBAN", objUtiles.hayValorElementoXml(doc.getElementsByTagName("CCODBAN")[0]) ? 
                               objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCODBAN"), 0, 0) : "");
                    
                    objDom.setValorPorId("CEMPRES", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CEMPRES"), 0, 0));
                    
                    var listablanca = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CLISTBLANC"), 0, 0);
                    
                    if (listablanca==1) document.miForm.CLISTBLANC.checked = true;
                    else document.miForm.CLISTBLANC.checked = false;
                    
                    document.miForm.CLISTBLANC.value = listablanca;
                    
                    
                    if (!objUtiles.estaVacio(DEPO)) f_onchange_depo(DEPO);
                    else objDom.setValorPorId("TNOMDEPO", "");
                    
                    //var CODIGO= objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCODDEP"), 0, 0);
                    //var PERSONA=doc.getElementsByTagName("PERSONA")[0];
                    //var NOMBRE = objDom.getValorNodoDelComponente(PERSONA.getElementsByTagName("TAPELLI1"), 0, 0);
                
                    //objDom.setValorPorId("TNOMDEPO", NOMBRE);
                    }else {                    
                    
                    //objDom.setValorPorId("CCODDGS", "");
                    objDom.setValorPorId("TNOMDEPO", "");
                    objDom.setValorPorId("CCODDEP", ""); 
                    objDom.setValorPorId("CTIPBAN", "<%= Integer.MIN_VALUE %>");
                    objDom.setValorPorId("CBANCAR", "");
                    objDom.setValorPorId("TNOMBRE", "");
                    objDom.setValorPorId("SPERSON", "");}
                }
                catch(e){
                    //objDom.setValorPorId("CCODDGS", "");
                    objDom.setValorPorId("TNOMDEPO", "");     
                    objDom.setValorPorId("CCODDEP", ""); 
                    objDom.setValorPorId("CTIPBAN", "<%= Integer.MIN_VALUE %>");
                    objDom.setValorPorId("CBANCAR", "");
                    objDom.setValorPorId("TNOMBRE", "");
                    objDom.setValorPorId("SPERSON", "");
                }
            }  
            
        
        /****************************************************************************************/
        /************************************* SALTOS DE FLUJO **********************************/
        /****************************************************************************************/
        
        function f_but_consulta_aseguradora() {
            objUtiles.ejecutarFormulario("axis_axisctr107.do", "consulta_aseguradora", document.miForm, "_self", objJsMessages.jslit_cargando);                        
        }

    </script>
  </head>
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}"
        onload="f_onload()"><c:import url="../include/precargador_ajax.jsp">
      <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import><form name="miForm" action="axis_axisctr107.do" method="POST">
      <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo">
          <fmt:message key="9900967"/>
        </c:param>
        <%-- Mant Aseguradoras --%>
        <c:param name="formulario">
          <fmt:message key="9900967"/>
        </c:param>
        <%-- Mant Aseguradoras --%>
        <c:param name="form">axisctr107</c:param>
      </c:import>
      <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">
          axisctr106|
          <fmt:message key="9900956"/>
          <%-- Búsqueda de Aseguradoras--%>
        </c:param>
      </c:import>
      <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">
          axisctr157|
          <fmt:message key="9001770"/>
          <%-- Búsqueda de Depositarias--%>
        </c:param>
      </c:import>
      <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
          <fmt:message key="9000642"/>
        </c:param>
        <c:param name="nid">axisper021</c:param>
      </c:import>
      <%-- <input type="hidden" name="operation" value=""/>--%>
      <input type="hidden" id="operation" name="operation" value="form"/>
      <input type="hidden" name="isEdit" id="isEdit" value="false"/>
      <input type="hidden" name="CEMPRES" id="CEMPRES"
             value="${datos_aseg.CEMPRES}"/>
      <input type="hidden" name="CCODBAN" id="CCODBAN"
             value="${datos_aseg.CCODBAN}"/>
      <input type="hidden" name="CCODASEG" id="CCODASEG" 
             value="${datos_aseg.CCODASEG}"/>
      <input type="hidden" name="SPERSON" id="SPERSON" title='<fmt:message key="105940"/>'
             <axis:atr f="axisctr107" c="SPERSON" a="obligatorio=true" />
             value="${datos_aseg.SPERSON}"/>
      <c:if test="${__formdata.isEdit != \'true\'}">
        <input type="hidden" name="CACTIVO" id="CACTIVO" value="1"/>
      </c:if>
      <c:set var="modoModificable" value="${false}"/>
      <%-- <table class="mainTableDimensions seccion base" align="center"
           cellpadding="0" cellspacing="3"> --%>          
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td>
                 <div class="titulo">
              <img src="images/flecha.gif"/>
              <fmt:message key="9900956"/>: 
              <axis:visible c="BUSCA_ASEG" f="axisctr107">
                <img id="find" border="0" src="images/find.gif"
                     onclick="f_but_buscar()" style="cursor:pointer"/>
              </axis:visible>
            </div>           
             </td>
             </tr>
             
                    <td>

                        <%--<div class="titulo"><img src="images/flecha.gif"/><fmt:message key="1000095" /></div>
                        --%>
                        <table class="seccion">
                            <tr>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:40%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
              <tr>
                <%-- Código aseg--%>
                <td class="titulocaja">
                  <b><fmt:message key="1000109"/></b>
                </td>
                <%-- NIF--%>
                <td class="titulocaja">
                  <b><axis:alt f="axisctr107" c="TNOMBRE" lit="105940"></axis:alt></b>
                </td>
                <%-- Pertany a llista blanca <td class="titulocaja">
                     <b><fmt:message key="9901034"/></b> </td>--%>
              </tr>
              <tr>
                <%-- Código Aseg--%>
                <td class="campocaja">
                  <input type="text" class="campowidthinput campo campotexto"
                         size="15" value="${datos_aseg.CODDGS}" name="CCODDGS"
                         id="CCODDGS" 
                         <%--onchange="f_onchange_aseg(this.value)"--%>
                         onchange="f_onchange_aseg(this.value)"
                         <axis:atr f="axisctr107" c="CCODDGS" a="modificable=true&obligatorio=true"/>
                         style="width:60%;"
                         title='<fmt:message key="1000109"/>'/>
                </td>
                <%-- Nombre--%>
                <td class="campocaja">
                  <input type="text" class="campowidthinput campo campotexto"
                         size="15" value="${datos_aseg.DESCRIPCIO}"
                         name="TNOMBRE" id="TNOMBRE" style="width:90%;"
                         title='<fmt:message key="100584"/>'
                         <c:if test="${!modoModificable}">readonly="readonly"</c:if>/>
                  <img border="0" src="images/find.gif"
                       onclick="f_but_buscar_persona()" style="cursor:pointer"
                       alt='<fmt:message key="9900956"/>'
                       title='<fmt:message key="9900956"/>'/>
                </td>
                <!-- LISTA BLANCA
                            <td class="campocaja">
                                <axis:ocultar f="axisctr107" c="CLISTBLANC" dejarHueco="false">
                                    <input type="checkbox" id="CLISTBLANC" name="CLISTBLANC" onclick="this.value = this.checked ? 1 : 0"
                                     <c:if test="${datos_aseg.CLISTBLANC == 1}">checked</c:if>  
                                     value = "${datos_aseg.CLISTBLANC}"
                                     <axis:atr f="axisctr107" c="CLISTBLANC" a="modificable=true"/> />
                                </axis:ocultar> 
                            </td>     colspan="2">-->
              </tr>
                        </table>                   
                        <div class="separador">&nbsp;</div>
                            <!-- DisplayTag Aseguradoras -->
                            <c:set var="title1"><fmt:message key="1000109"/></c:set>
                            <c:set var="title2"><fmt:message key="105940"/></c:set>
                            <c:set var="title3"><fmt:message key="105503"/></c:set>
                            <%--<c:set var="title4"><fmt:message key="9901251"/></c:set> CTRASP de moment comentat--%>
            <div>
              <img src="images/flecha.gif"/>
              <b><fmt:message key="9901249"/></b>
            </div>                                
              <div style="float:right;">
                <a href="javascript:f_altamod_depo('${datos_aseg.CCODASEG}','${datos_aseg.CODDGS}','${datos_aseg.DESCRIPCIO}',null,null,null,null,null,null)">
                  <img border="0" alt='<fmt:message key="104825"/>'
                       title='<fmt:message key="104825"/>'
                       src="images/new.gif"/>
                </a>
              </div>                            

                            
                            <div class="seccion displayspaceGrande">
             <display:table name="${listaDepo}" id="miListaId" export="false"
                               class="dsptgtable" pagesize="8" defaultsort="1"
                               defaultorder="ascending"
                               requestURI="modal_axisctr106.do?paginar=true"
                               sort="list" cellpadding="0" cellspacing="0">
                  <%@ include file="../include/displaytag.jsp"%>
                  <display:column title="${title1}" sortable="true"
                                  sortProperty="CODDGS" headerClass="sortable"
                                  media="html" autolink="false">
                    <div class="dspText">
                      ${miListaId.OB_IAX_PDEPOSITARIAS.CCODDEP}
                    </div>
                  </display:column>
                  <display:column title="${title2}" sortable="true"
                                  sortProperty="DESCRIPCIO"
                                  headerClass="sortable" media="html"
                                  autolink="false">
                    <div class="dspText">
                        ${miListaId.OB_IAX_PDEPOSITARIAS.PERSONA.TAPELLI1}
                      </a>
                    </div>
                  </display:column>
                  <display:column title="${title3}" sortable="true"
                                  sortProperty="CBANCAR"
                                  headerClass="sortable" media="html"
                                  autolink="false">
                    <div class="dspText">
                        ${miListaId.OB_IAX_PDEPOSITARIAS.CBANCAR}
                      </a>
                    </div>
                  </display:column>       

                  <%--<display:column title="${title4}" sortable="true"
                                  sortProperty="CTRASP"
                                  headerClass="sortable" media="html"
                                  autolink="false">
                    <div class="dspText">
                        ${miListaId.OB_IAX_PDEPOSITARIAS.CTRASP} 
                      </a>
                    </div>
                  </display:column>                     CTRASP de moment comentat--%>
                  <display:column title="" sortable="false" sortProperty=""
                                  style="width:5%"
                                  headerClass="headwidth5 sortable" media="html"
                                  autolink="false">
                    <div class="dspIcons">
                      <a href="javascript:f_altamod_depo('${datos_aseg.CCODASEG}','${datos_aseg.CODDGS}','${datos_aseg.DESCRIPCIO}',
                      '${miListaId.OB_IAX_PDEPOSITARIAS.CCODDEP}','${miListaId.OB_IAX_PDEPOSITARIAS.PERSONA.TAPELLI1}',
                      '${miListaId.OB_IAX_PDEPOSITARIAS.CTIPBAN}','${miListaId.OB_IAX_PDEPOSITARIAS.CBANCAR}','${miListaId.OB_IAX_PDEPOSITARIAS.CTRASP}','modif')">
                        <img border="0" alt="<fmt:message key='9000552'/>"
                             title="<fmt:message key='9000552'/>"
                             src="images/lapiz.gif"/>
                      </a>
                    </div>
                  </display:column>
                  <display:column title="" sortable="false" sortProperty=""
                                  style="width:5%"
                                  headerClass="headwidth5 sortable" media="html"
                                  autolink="false">
                    <div class="dspIcons">
                      <a href="javascript:f_borrar_rel_dipositaria('${miListaId.OB_IAX_PDEPOSITARIAS.CCODDEP}',this)">
                        <img border="0" alt="<fmt:message key='9001333'/>"
                             title="<fmt:message key='9001333'/>"
                             src="images/delete.gif"/>
                      </a>
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
      <c:import url="../include/botonera_nt.jsp">
        <c:param name="__botones">salir,9001333,1000428,gravar</c:param>
      </c:import>
      <div class="separador">&nbsp;</div>
    </form><c:import url="../include/mensajes.jsp"/></body>
</html>