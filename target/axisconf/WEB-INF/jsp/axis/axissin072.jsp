<%-- ANEXAR DOCUMENTACIÓN A SINIESTROS--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
	<link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/tree.css" type="text/css"></link>
    <link rel="stylesheet" type="text/css" media="all"
          href="styles/calendar-green.css" title="green"/>
    <script type="text/javascript" src="scripts/calendar.js"></script>
    <script type="text/javascript"
            src="scripts/calendar-${sessionScope.__locale}.js"></script>
    <script type="text/javascript" src="scripts/calendar-setup.js"></script>
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript">
  
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {            
            f_cargar_propiedades_pantalla();
            var aceptar = "${__formdata.aceptar}";
            if ((!objUtiles.estaVacio(aceptar))&&(aceptar=="0")){
               parent.f_aceptar_modal("axissin072");
            }
            var SPROFES_OUT = "${requestScope.SPROFES_OUT}";
            if (!objUtiles.estaVacio(SPROFES_OUT)) {
                parent.f_aceptar_modal("axissin072","pCodiProf="+SPROFES_OUT);
            }
			
            var tipper = "${__formdata.CTIPPER}";
            if ($("#CTIPPER").val()<"0" && objUtiles.estaVacio(tipper)){ 
                $("#CTIPPER").val("1");
            }
			
             $("#pSPROFES").focus();
        }
          
        function f_cerrar_modal() {
                objUtiles.cerrarModal("axissin026");
            }
        
        function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr080", "cancelar", document.miForm, "_self");
            } 
        
        function f_abrir_axisprf017(){
            objUtiles.abrirModal("axisprf000","src","modal_axisprf000.do?operation=form&pantalla=destinatario");  
        }
                   
        function f_aceptar_modal(pantalla, param){
            objUtiles.cerrarModal(pantalla);
            if(pantalla=="axisprf000"){   
                var valores = param.split("&");
                var sprofes =valores[0].split("=");
                var nnumide =valores[2].split("=");
                var tnombre =valores[3].split("=");
                objDom.setValorPorId("CPROFES",sprofes[1]);
                objDom.setValorPorId("CPROFES_TEXT",sprofes[1]);
                objDom.setValorPorId("NNUMIDE_TEXT",nnumide[1]);
                objDom.setValorPorId("SPROFES_TEXT",tnombre[1]);
    
             }
        }
        
        function f_but_buscar() {
            if ($("#CTIPIDE").val() == "<%= Integer.MIN_VALUE %>" ){
                $("#CTIPIDE").val(null) ;
            }   
            if ($("#CTIPPRO").val() == "<%= Integer.MIN_VALUE %>" ){
                $("#CTIPPRO").val(null) ;
            }     
            if ($("#CSUBPRO").val() == "<%= Integer.MIN_VALUE %>" ){
                $("#CSUBPRO").val(null) ;
            }       

                objUtiles.ejecutarFormulario("axis_axissin072.do", "busqueda_profesional", document.miForm, "_self", objJsMessages.jslit_buscando_personas);   
      
        }
   
        function f_abrir_modal(cual, noXButton, optionalQueryString) {         
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";                    
                if (noXButton) 
                    objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");             
                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
                }
        
        function f_seleccionar_profesional (SPROFES) {
            if (objUtiles.estaVacio(SPROFES))
                alert (objJsMessages.jslit_error_de_seleccion);
            else{
                objDom.setValorPorId ("SPROFES", SPROFES);
                objUtiles.ejecutarFormulario("modal_axissin072.do","traspaso_profesional",document.miForm, "_self", objJsMessages.jslit_buscando_personas);   
            }
         }
               
        function callbackAjaxCargarSprofes(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);  
            var elementos = doc.getElementsByTagName("SPROFES");  
            for (i = 0; i < elementos.length; i++) {
                var SPROFES = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPROFES"), i, 0);
                objDom.setValorPorId("SPROFES",SPROFES);
                objDom.setValorPorId("pCodiProf",SPROFES);
            }
            parent.actualizaSprofes(SPROFES);
            parent.f_abrir_modal('axisper021',null,'&MODO_SWPUBLI=PERSONAS_PUBLICAS&pCodiProf='+$("#SPROFES").val());

            $.reinitialiseScroll(); 
        }
        
        function f_onchange_TIDENTI(TIDENTI) {
            formdataTIDENTI = '${__formdata.CTIPPER}';    
            if (TIDENTI != "<%= Integer.MIN_VALUE %>" && TIDENTI != formdataTIDENTI && (formdataTIDENTI == 2 || TIDENTI == 2)) {
                // Recargar formulario para esconder/mostrar campos en función de TIDENTI
                objUtiles.ejecutarFormulario("modal_axissin072.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }   
        
       function f_seleccionar_sprofes (SPROFES,SPERSON, NNUMIDE, TNOMBRE) {
            if (objUtiles.estaVacio(SPROFES))
                alert (objJsMessages.jslit_error_de_seleccion);
            else{
                parent.f_aceptar_modal("axissin072", "SPROFES="+SPROFES+"&SPERSON="+SPERSON+"&NNUMIDE="+NNUMIDE+"&TNOMBRE="+TNOMBRE);
            }
         }
         
         
          /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/    
        
            function callbackAjaxCambiarProfesional(ajaxResponseText){
            alert(ajaxResponseText);
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var CPROFESformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPROFES"), 0, 0);
                    var NNUMIDEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0);
                    var TNOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0);
                    objDom.setValorPorId("CPROFES_TEXT", CPROFESformateado);
                    objDom.setValorPorId("NNUMIDE_TEXT", NNUMIDEformateado);
                    objDom.setValorPorId("SPROFES_TEXT", TNOMBREformateado);
                }
              /*  $.reinitialiseScroll();    */             
            }
         
         function f_cargar_siniestro(NSINIES, SSEGURO, SPRODUC, CACTIVI){
          /*      alert('NSINIES ' + NSINIES);
                alert('SSEGURO ' + SSEGURO);  */
               objUtiles.ejecutarFormulario ("axis_axissin072.do?NSINIESselected="+NSINIES+"&SSEGURO="+SSEGURO+"&NSINIES="+NSINIES, "inicializarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);
            }   
            
    </script>
  </head>
    <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="CPROFES" id="CPROFES" value="${sessionScope.axisctr_profesional.CODI}"/>
            <input type="hidden" name="pantalla" id="pantalla" value="${__formdata.pantalla}" />
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axissin072" c="FORM" lit="1000431" /></c:param>
                <c:param name="producto"><axis:alt f="axissin072" c="FORM" lit="9909352" /></c:param>
                <c:param name="form">axissin072</c:param>
            </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axissin072" c="TIT_AXISPRF017" lit="9904785" /></c:param>
                <c:param name="nid" value="axisprf017" />
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin026|<axis:alt f="axissin072" c="MODAL_AXISSIN026" lit="9001518"/></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisprf000|<axis:alt c="axisprf000_TITULO" f="axisprf000" lit="9904783"/></c:param>
	</c:import>
            <div class="separador">&nbsp;</div>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin072" c="INICIO_CTR" lit="1000178" /></div>
                        <!--campos-->
                        <table class="seccion">
                        <tr>
                            <td align="left">
                                <!-- Área 1 -->
                                <div class="separador">&nbsp;</div>
                                <table class="area" align="center">
                                    <tr>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:35%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <axis:visible f="axissin072" c="CPROFES"> 
                                        <td class="titulocaja">
                                        <b><axis:alt f="axissin072" c="CPROFES" lit="9904784" /></b>
                                        </td>
                                        <td class="titulocaja">
                                        <b><axis:alt f="axissin072" c="NNUMIDE" lit="9904434" /></b>
                                        </td>
                                        <td class="titulocaja">
                                        <b><axis:alt f="axissin072" c="SPROFES" lit="9909347" /></b>
                                        </td>
                                        <td class="titulocaja">
                                        <b><axis:alt f="axissin072" c="NSINIES" lit="9905621" /></b>
                                        </td>
                                        </axis:visible>
                                    </tr>
                                    <tr>
                                        <axis:visible f="axissin072" c="CPROFES"> 
                                        <td class="campocaja">
                                            <input type="text" name="CPROFES_TEXT" title="<axis:alt f="axissin072" c="CPROFES" lit="100584" />" id="CPROFES_TEXT" value="${sessionScope.axisctr_codigo.CODI}" class="campowidthinput campo campotexto" style="width:70%" formato="entero"
                                            <axis:atr f="axissin072" c="CPROFES_TEXT" a="modificable=true&obligatorio=true"/> onchange="f_actualizar_agente()" />
                                            <img id="IMG_CPROFES_TEXT" border="0" src="images/find.gif" onclick="f_abrir_axisprf017()" style="cursor:pointer"/>
                                        </td>
                                        <td class="campocaja">    
                                            <input readonly="true" type="text" name="NNUMIDE_TEXT" id="NNUMIDE_TEXT" value="${sessionScope.axisctr_codigo.NNUMIDE}" class="campowidthinput campo campotexto"/>
                                        </td>
                                        <td class="campocaja">    
                                            <input readonly="true" type="text" name="SPROFES_TEXT" id="SPROFES_TEXT" value="${sessionScope.axisctr_codigo.SPROFES}" class="campowidthinput campo campotexto"/>
                                            <input type="hidden" name="CPROFES_TEXT_AUX" id="CPROFES_TEXT_AUX" value="${sessionScope.axisctr_codigo.CODI}" class="campowidthinput campo campotexto" style="width:70%" />
                                        </td>
                                        </axis:visible>        
                                        
                                        <axis:visible f="axissin072" c="NSINIES"> 
                                            <td class="campocaja">                                            
                                                <input type="text" name="NSINIES" title="<axis:alt f="axissin072" c="NSINIES" lit="9902367" />" id="NSINIES" value="${__formdata.NSINIES}" class="campowidthinput campo campotexto" style="width:70%"
                                            </td>
                                        </axis:visible>
                                    </tr>
                                </table>
                                <div class="separador">&nbsp;</div>
                            </td>
                            <div class="separador">&nbsp;</div>
                        </tr>
                        </table>
							
                        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin072</c:param>
                        <c:param name="__botones">
                                <c:if test="${__formdata.pantalla != 'destinatario'}">
                                        <axis:visible f="axissin072" c="BT_BUSCAR">,buscar</axis:visible>
                                </c:if>
                                <c:if test="${__formdata.pantalla == 'destinatario'}">
                                        <axis:visible f="axissin072" c="BT_BUSCAR">,buscar</axis:visible>
                                </c:if>
                        </c:param>                
                        </c:import>
                        
                        <div class="separador">&nbsp;</div>
                        <div class="separador">&nbsp;</div>
                        <div class="separador">&nbsp;</div>
                        <div class="separador">&nbsp;</div>
                 <!--       <div style="float:right;" id="BT_SIN_EDITAR_TRAM_DOC">
                <!--        <axis:visible f="axissin072" c="BT_SIN_EDITAR_TRAM_DOC"> <!--boton editar tram documentos -->
                  <!--        <a <img border="0" alt="<axis:alt f="axissin072" c="BT_SIN_NUEVO_TRAM_DOC" lit="9909345"/>" title="<axis:alt f="axissin072" c="BT_SIN_NUEVO_TRAM_DOC" lit="9909345"/>" src="images/document.gif"/></a>
                          <c:if test="${(T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.CACCION ne '1' || empty T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.FRECIBE)
                           && T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.CORIGEN ne '1'}">
                            <div class="dspIcons" id="BT_SIN_EDITAR_TRAM_DOC"><img border="0" alt="<axis:alt f="axissin072" c="BT_SIN_EDITAR_TRAM_DOC" lit="9909345"/>" title1="<axis:alt f="axissin072" c="BT_SIN_EDITAR_TRAM_DOC" lit="9909345"/>" src="images/document.gif" width="15px" height="15px"
                                style="float:right;" href="javascript:f_abrir_modal('axissin026',null,'&isNew=yes&indexTramitacio=0&SSEGURO='+${miListaId['SSEGURO']}+'&NSINIES='+ ${miListaId['TSINIES']}+'&NTRAMIT='+${miListaId['NTRAMIT']});"/></div>
                        </c:if>
                     </axis:visible>  
                      </div> -->
                          
                        <!-- Area de Profesionales  -->
                        <div class="titulo">
                                <img src="images/flecha.gif" />
                                <axis:alt f="axisctr001" c="DSP_RESULT" lit="102075" />
                        </div>
                        <div class="separador">&nbsp;</div>   
                        <table class="seccion">
                            <tr>
                                <td align="left">
                                    <div class="separador">&nbsp;</div>
                                        <table class="area" align="center">
                                            <tr>
                                                <td>
                                                    <!-- DisplayTag ListaPersonas --> <c:set var="title0">
                                                            <axis:alt f="axissin072" c="NSINIES" lit="9905621" />
                                                    </c:set> <c:set var="title1">
                                                            <axis:alt f="axissin072" c="CESTADO" lit="100587" />
                                                    </c:set> <c:set var="title2">
                                                            <axis:alt f="axissin072" c="TTRAMIT" lit="9000908" />
                                                    </c:set> <c:set var="title3">
                                                            <axis:alt f="axissin072" c="TIPUSTRAM" lit="9001147" />
                                                    </c:set> <c:set var="title4">
                                                            <axis:alt f="axissin072" c="TATRIBU" lit="9902564" />
                                                    </c:set> <c:set var="title5">
                                                            <axis:alt f="axissin072" c="CPROFES" lit="109155" />
                                                    </c:set> <c:set var="title6">
                                                            <axis:alt f="axissin072" c="SPROFES" lit="9909347" />
                                                    </c:set> <c:set var="title7">
                                                            <axis:alt f="axissin072" c="FALTA" lit="9909351" />
                                                    </c:set>
                                                    <c:set var="title8"><axis:alt f="axissin072" c="EDITAR" lit="9909345" /></c:set><!--Editar-->
                                                    <div class="seccion displayspaceProfesionales">
                                                        <display:table
                                                                name="${sessionScope.axissin072_listaProfesionales}"
                                                                id="miListaId" export="false" class="dsptgtable"
                                                                pagesize="-1" defaultsort="1" defaultorder="ascending"
                                                                sort="list" cellpadding="0" cellspacing="0" 
                                                                requestURI="axis_axissin072.do?paginar=true">
                                                                <%@ include file="../include/displaytag.jsp"%>
	 
                                                                <display:column title="${title0}" sortable="true"
                                                                        style="width:8%;" sortProperty="NSINIES"
                                                                        headerClass="headwidth5 sortable" media="html"
                                                                        autolink="false">
                                                                        <div class="dspNumber">${miListaId['TSINIES']}</div>
                                                                </display:column>
                                                                <display:column title="${title1}" sortable="true"
                                                                        style="width:6%;" sortProperty="CESTADO"
                                                                        headerClass="sortable" media="html" autolink="false">
                                                                        <div class="dspText">${miListaId['TESTADO']}</div>
                                                                </display:column>
                                                                <axis:visible f="axissin072" c="TTRAMIT">
                                                                        <display:column title="${title2}" sortable="true"
                                                                                style="width:20%;" sortProperty="TTRAMIT"
                                                                                headerClass="sortable" media="html" autolink="false">
                                                                                <div class="dspText">${miListaId['TTRAMIT']}</div>
                                                                        </display:column>
                                                                </axis:visible>
                                                                <axis:visible f="axissin072" c="TIPUSTRAM">
                                                                        <display:column title="${title3}" sortable="true"
                                                                                style="width:20%;" sortProperty="TIPUSTRAM"
                                                                                headerClass="sortable" media="html" autolink="false">
                                                                                <div class="dspText">${miListaId['TTIPUSTRAM']}</div>
                                                                        </display:column>
                                                                </axis:visible>
                                                                <axis:visible f="axissin072" c="TATRIBU">
                                                                        <display:column title="${title4}" sortable="true"
                                                                                style="width:10%;" sortProperty="TATRIBU"
                                                                                headerClass="sortable" media="html" autolink="false">
                                                                                <div class="dspText">${miListaId['TATRIBU']}</div>
                                                                        </display:column>
                                                                </axis:visible>
                                                                <axis:visible f="axissin072" c="CPROFES">
                                                                        <display:column title="${title5}" sortable="true"
                                                                                style="width:6%;" sortProperty="TSPROFES"
                                                                                headerClass="sortable" media="html" autolink="false">
                                                                                <div class="dspText">${miListaId['TSPROFES']}</div>
                                                                        </display:column>
                                                                </axis:visible>
                                                                <axis:visible f="axissin072" c="SPROFES">
                                                                        <display:column title="${title6}" sortable="true"
                                                                                style="width:30%;" sortProperty="TSPROFES"
                                                                                headerClass="sortable" media="html" autolink="false">
                                                                                <div class="dspText">${miListaId['PROFESIONAL']}</div>
                                                                        </display:column>
                                                                </axis:visible>
                                                                <axis:visible f="axissin072" c="FALTA">
                                                                        <display:column title="${title7}" sortable="true"
                                                                                style="width:20%;" sortProperty="FALTA"
                                                                                headerClass="sortable" media="html" autolink="false">
                                                                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId['TFALTA']}"/></div>
                                                                        </display:column>
                                                                </axis:visible>
                                                                <axis:visible f="axissin072" c="BT_SIN_EDITAR_TRAM_DOC"> <!--boton editar tram documentos -->
                                                <display:column title="${title8}" sortable="true" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                    <c:if test="${(T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.CACCION ne '1' || empty T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.FRECIBE)
                                                                    && T_IAX_TRAM_DOCUMENTOS.OB_IAX_SIN_TRAMI_DOCUMENTO.CORIGEN ne '1'}">
                                                        <div class="dspIcons" id="BT_SIN_EDITAR_TRAM_DOC"><img border="0" alt="<axis:alt f="axissin072" c="BT_SIN_EDITAR_TRAM_DOC" lit="9909345"/>" title1="<axis:alt f="axissin072" c="BT_SIN_EDITAR_TRAM_DOC" lit="9909345"/>" src="images/file.gif" width="15px" height="15px"
                                                        style="cursor:pointer;" onclick="javascript:f_abrir_modal('axissin026',null,'&ISEXTERNO=SI&isNew=yes&indexTramitacio=0&SSEGURO='+${miListaId['SSEGURO']}+'&NSINIES='+'${miListaId['TSINIES']}'+'&TTRAMIT_EXT='+'${miListaId['TTIPUSTRAM']}'+ '&TESTTRA_EXT='+'${miListaId['TESTADO']}' + '&TSUBTRA_EXT='+'${miListaId['TSUBEST']}' + '&TUNITRA_EXT='+'${miListaId['TUNITRA']}' + '&TTRAMITAD_EXT='+'${miListaId['TTRAMITAD']}' +'&TTIPTRA_EXT='+ '${miListaId['TTIPTRA']}'+'&NTRAMIT='+${miListaId['NTRAMIT']});"/></div>
                                                    </c:if>
                                                </display:column> 
                                                </axis:visible> 
                                                        </display:table>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                        <div class="separador">&nbsp;</div>
                                </td>
                            </tr>
                        </table>
					</td>
				</tr>
			</table>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin072</c:param>
                <c:param name="f">axisctr090</c:param>
            <c:param name="__botones">salir</c:param>               
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
    </div>
    </body>
    <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad'))}">
      <script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('axissin072');
      </script>                   
    </c:if>
</html>

