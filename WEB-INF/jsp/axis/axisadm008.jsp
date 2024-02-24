<%/*
*  Fichero: axisadm008.jsp
*  Mantenimiento Plantillas Contables
*  
*  Fecha: 04/01/2013
*/
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
        <title><axis:alt f="axisadm008" c="TITULO" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
                f_cargar_propiedades_pantalla();
                
                // Inhabilita la empresa si es uno
                <c:if test="${fn:length(sessionScope.axisadm_listaEmpresas) < 2 }">
                    document.miForm.CEMPRES.disabled = true;
                </c:if>
                
                // Hace la llamada la primera vez
                <c:if test="${fn:length(sessionScope.axisadm_listaEmpresas) < 2 && CONSULTA == null}">
                    f_onchange_CEMPRES(); //Cambiar empresa
                    f_but_9000508();
                </c:if>
            }
            
            function habilitar_empresa(){
                document.miForm.CEMPRES.disabled = false;
                //alert("DESHABILITADO");
                //alert("SI");
            }            
                 
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm008", "cancelar", document.miForm, "_self");
            }
            
            function f_but_nueva_plantilla() {
                //NUEVO
                objUtiles.abrirModal("axisadm009", "src", "modal_axisadm009.do?operation=form&NUEVO=1&CEMPRES=&SMODCON=");
            }
            
            function f_but_9000508() {  //Buscar
                
                habilitar_empresa();
                document.miForm.CASIENT_AUX.value=document.miForm.SMODCON.value;
                
                objUtiles.ejecutarFormulario ("axis_axisadm008.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_but_editar_plantilla(EMPRESA,PLANTILLA,TEMPRES,SMODCON,TASIENT,FINI){
               
                //f_abrir_modal('axisadm009',null,'&PLANTILLA='+1);
                objUtiles.abrirModal("axisadm009", "src", "modal_axisadm009.do?operation=form&CEMPRES="+EMPRESA+"&PLANTILLA="+PLANTILLA+"&TEMPRES="+TEMPRES+"&SMODCON="+SMODCON+"&TASIENT="+TASIENT+"&FINI="+FINI);
            }
            
            function f_cerrar_axisadm009(){
                //alert("En cerrar 009");
                objUtiles.cerrarModal("axisadm009");
                habilitar_empresa();
                objUtiles.ejecutarFormulario("axis_axisadm008.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_abrir_modal(cual, noXButton, optionalQueryString) {
        
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                
                if (noXButton) 
                    objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                    objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
            }
          
            /****************************************************************************************/
            /********************************* FUNCIONES  AJAX **************************************/
            /****************************************************************************************/
            function f_onchange_CEMPRES() {
                var CEMPRES=objDom.getValorPorId("CEMPRES");
                //alert(CEMPRES);
                
                if (!objUtiles.estaVacio(CEMPRES)){
                    var qs="operation=ajax_cargar_asientos";
                    qs=qs+"&CEMPRES="+CEMPRES;
                    qs=qs+"&SMODCON="+document.miForm.SMODCON.value;
                    //qs=qs+"&CPAIS_RESIDENCIA="+CPAIS_RESIDENCIA
                    //qs=qs+"&dt="+(new Date().getTime())
                    objAjax.invokeAsyncCGI("axis_axisadm008.do", callbackajaxAsientos, qs, this);
                }
            }        

            function f_but_duplicar_plantilla(PLANTILLA) {
                //alert("En duplicar plantilla");
                var qs="operation=ajax_duplicar_plantilla";
                qs=qs+"&PLANTILLA="+PLANTILLA;
                qs=qs+"&CEMPRES="+document.miForm.CEMPRES.value;
                objAjax.invokeAsyncCGI("axis_axisadm008.do", callbackajaxDuplicarPlantilla, qs, this);
            }   
        
            function cambiar_valor_asiento(){
                document.miForm.CASIENT_AUX.value=document.miForm.SMODCON.value;
            }
            
            /****************************************************************************************/
            /*********************************** CALLBACK AJAX **************************************/
            /****************************************************************************************/
            function callbackajaxAsientos (ajaxResponseText){
                try{ 
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var comboAsientos = document.miForm.SMODCON;   
             
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        objDom.borrarOpcionesDeCombo(comboAsientos);
                            objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", comboAsientos, 0);
                            for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                                                     
                                var TATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0].childNodes[0].nodeValue : "");
                                var CATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0].childNodes[0].nodeValue : "");
                               
                                objDom.addOpcionACombo(CATRIBU, TATRIBU, comboAsientos, i+1);
                            }
                            valor = documento.miForm.CASIENT_AUX.value;
                            document.miForm.SMODCON.selectedIndex = valor;
                        }else{
                            objDom.borrarOpcionesDeCombo (comboAsientos);
                            objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", comboAsientos, null);
                        }
                    }
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
                }
            }
        
            function callbackajaxDuplicarPlantilla (ajaxResponseText){
            //alert(ajaxResponseText);
            var doc = objAjax.domParse(ajaxResponseText);
                try{ 
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) { //Si no existen errores en la apliacion
                    alert("<axis:alt f="axisadm008" c="OPERACION_OK" lit="1000405"/>");
                    //Volvemos a llamar al listado de plantillas para actualizar la información
                    habilitar_empresa();
                    objUtiles.ejecutarFormulario("axis_axisadm008.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
                    }
            
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
                }
            }
            
        /****************************************************************************************/
        /*******************************     MODALES    *****************************************/
        /****************************************************************************************/
        function f_cerrar_modal(cual) {
                objUtiles.cerrarModal(cual);
        }
        
        function f_aceptar_modal(cual, params) {
                f_cerrar_modal(cual);
                habilitar_empresa();
                objUtiles.ejecutarFormulario("axis_axisadm008.do" + params, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }

        </script>
    </head>
    <body  onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
            <input type="hidden" name="CASIENT_AUX" value="${__formdata.SMODCON}"/> 
            <input type="hidden" name="CEMPRES_AUX" value=""/> 
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisadm008" c="TITULO1" lit="111242"/> <axis:alt f="axisadm008" c="TITULO2" lit="105371"/></c:param>
                <c:param name="formulario"><axis:alt f="axisadm008" c="TITULO1" lit="111242"/> <axis:alt f="axisadm008" c="TITULO2" lit="105371"/></c:param>
                <c:param name="form">axisadm008</c:param>
            </c:import>
            <!-- Área de campos  -->
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisadm009|<axis:alt f="axisadm008" c="ALTAMOD" lit="9000570"/> <axis:alt f="axisadm008" c="TITULO2" lit="105371"/></c:param>
            </c:import>
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                        <img src="images/flecha.gif"/><axis:alt f="axisadm008" c="DATOS_GENERALES" lit="103593"/>
                         </div>
                        <!-- Sección 1 -->
                        <table class="seccion">
                            <tr>
                                <td >
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:50%;height:0px"></th>
                                            <th style="width:50%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisadm008" c="CEMPRES" dejarHueco="false">
                                               <td class="titulocaja" ><b><axis:alt f="axisadm008" c="CEMPRES" lit="101619"/></b></td><!--Empresa-->
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm008" c="SMODCON" dejarHueco="false"> 
                                               <td class="titulocaja" ><b><axis:alt f="axisadm008" c="SMODCON" lit="9000567"/></b></td><!--Tipo de Asiento-->
                                            </axis:ocultar>
                                        </tr>
                                        <tr>                                         
                                            <axis:ocultar f="axisadm008" c="CEMPRES" dejarHueco="false"> 
                                            <td class="campocaja">
                                                <select name = "CEMPRES" id="CEMPRES" style="width:200px;"  size="1"  onchange="javascript:f_onchange_CEMPRES();f_but_9000508();" class="campowidthselect campo campotexto_ob">
                                                <option value = "-1" selected> - <axis:alt f="axisadm008" c="SELECCIONE" lit="1000348"/> - </option>
                                                <c:forEach var="empresa" items="${sessionScope.axisadm_listaEmpresas}">
                                                    <option value = "${empresa.CEMPRES}"
                                                        <c:if test="${empresa.CEMPRES == __formdata.CEMPRES || fn:length(sessionScope.axisadm_listaEmpresas) < 2}">selected</c:if>>
                                                        ${empresa.TEMPRES}
                                                    </option>
                                                </c:forEach>
                                                </select>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm008" c="SMODCON" dejarHueco="false"> 
                                            <td class="campocaja">
                                                <select name = "SMODCON" id="SMODCON" <axis:atr f="axisadm008" c="SMODCON" a="isInputText=false&obligatorio=true" />  style="width:200px;" size="1" onchange="javascript:cambiar_valor_asiento();f_but_9000508();" class="campowidthselect campo campotexto_ob">
                                                <option value = "-1"> - <axis:alt f="axisadm008" c="SELECCIONE" lit="1000348"/> - </option>
                                                 <c:forEach var="asiento" items="${axisadm_listaAsientos}">
                                                    <option value = "${asiento.CATRIBU}"
                                                        <c:if test="${asiento.CATRIBU == __formdata.SMODCON}">selected</c:if>> <!-- formdata CASIENT_AUX. -->
                                                        ${asiento.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                                </select>
                                            </td>
                                            </axis:ocultar>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            
                            <!-- Seccion de cuentas contables -->
                            <tr>
                                <td align="left">
                                     <table class="area" align="center">
                                        <tr>
                                        <td>
                                            <axis:ocultar f="axisadm008" c="BT_NUEVA_PLANTILLA" dejarHueco="false">
                                            <div style="float:right;">
                                                <a href="javascript:f_but_nueva_plantilla();">
                                                    <img border="0" alt="<axis:alt f="axisadm008" c="NUEVA_PLANTILLA" lit="9000669"/>" title="<axis:alt f="axisadm008" c="NUEVA_PLANTILLA" lit="9000669"/>" src="images/new.gif"/>
                                                </a>
                                            </div>
                                            </axis:ocultar>
                                        </td>
                                        </tr>
                                        <tr>                                                    
                                            <td class="titulocaja">
                                                <%-- DisplayTag Facturas --%>
                                                <c:set var="title0"><axis:alt f="axisadm008" c="PLANTILLA" lit="9000568"/></c:set>  <%-- Plantilla --%>
                                                <c:set var="title1"><axis:alt f="axisadm008" c="EMPRESA" lit="101619"/></c:set>  <%-- Empresa --%>
                                                <c:set var="title2"><axis:alt f="axisadm008" c="TASIENTO" lit="9000567"/></c:set>  <%-- Tipo de Asiento --%>
                                                <c:set var="title3"><axis:alt f="axisadm008" c="FECINI" lit="9000526"/></c:set>  <%-- Fecha Inicio --%>
                                                <c:set var="title4"><axis:alt f="axisadm008" c="FECFIN" lit="9000527"/></c:set>  <%-- Fecha Fin --%>
                                                <c:set var="title5"><axis:alt f="axisadm008" c="EDITAR" lit="100002"/></c:set>  <%-- Editar --%>
                                                <c:set var="title6"><axis:alt f="axisadm008" c="DUPLICAR" lit="103669"/></c:set>  <%-- Duplicar --%>
                                                
                                                <div id="lst_plamtillas" class="seccion displayspace">
                                                    <display:table name="${sessionScope.listaPlantillas}" id="LSTPLANTILLAS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                         requestURI="axis_axisadm008.do?paginar=true">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                         
                                                        <c:set var="quote">'</c:set>
                                                        <c:set var="TEMPRES">
                                                        ${empty LSTPLANTILLAS ? "" : fn:replace(LSTPLANTILLAS.OB_IAX_MODCONTA.TEMPRES, quote, '-quote-')}
                                                        </c:set>
                                                        <axis:visible f="axisadm008" c="PLANTILLA">
                                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_MODCONTA.SMODCON" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspNumber">
                                                            ${LSTPLANTILLAS.OB_IAX_MODCONTA.SMODCON}
                                                            </div>
                                                        </display:column>
                                                        </axis:visible>
                                                        <axis:visible f="axisadm008" c="TEMPRES">
                                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_MODCONTA.TEMPRES" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspNumber">
                                                            ${LSTPLANTILLAS.OB_IAX_MODCONTA.TEMPRES}
                                                            </div>
                                                        </display:column>
                                                        </axis:visible>
                                                        <axis:visible f="axisadm008" c="TASIENT">
                                                         <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_MODCONTA.TASIENT" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspNumber">
                                                           ${LSTPLANTILLAS.OB_IAX_MODCONTA.TASIENT}
                                                            </div>
                                                        </display:column>
                                                        </axis:visible>
                                                        <axis:visible f="axisadm008" c="FECINI">
                                                        <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_MODCONTA.FINI" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspNumber">
                                                             <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTPLANTILLAS.OB_IAX_MODCONTA.FINI}"/>
                                                            </div>
                                                        </display:column>   
                                                        </axis:visible>
                                                        <axis:visible f="axisadm008" c="FECFIN">                                                             
                                                        <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_MODCONTA.FFIN" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspNumber">
                                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTPLANTILLAS.OB_IAX_MODCONTA.FFIN}"/>
                                                            </div>
                                                        </display:column>
                                                        </axis:visible>                                                                
                                                        <axis:visible f="axisadm008" c="BT_EDITAR">
                                                        <display:column title="${title5}" sortable="false"  headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspIcons"><img border="0" alt="<axis:alt f="axisadm008" c="EDITAR" lit="100002"/>" title="<axis:alt f="axisadm008" c="EDITAR" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                                style="cursor:pointer;vertical-align:middle;<c:if test="${LSTPLANTILLAS.OB_IAX_MODCONTA.FFIN!=null}">filter:alpha(opacity=25);
                                                                opacity:.25;</c:if>" <c:if test="${LSTPLANTILLAS.OB_IAX_MODCONTA.FFIN!=null}"> disabled </c:if> 
                                                                onclick="f_but_editar_plantilla('${LSTPLANTILLAS.OB_IAX_MODCONTA.CEMPRES}','${LSTPLANTILLAS.OB_IAX_MODCONTA.SMODCON}','${TEMPRES}','${LSTPLANTILLAS.OB_IAX_MODCONTA.CASIENT}','${LSTPLANTILLAS.OB_IAX_MODCONTA.TASIENT}','<fmt:formatDate pattern="dd/MM/yyyy" value="${LSTPLANTILLAS.OB_IAX_MODCONTA.FINI}" />')"  />
                                                            </div><!--Modificar una plantilla -->
                                                        </display:column>
                                                        </axis:visible>
                                                        <axis:visible f="axisadm008" c="BT_DUPLICAR">
                                                        <display:column title="${title6}" sortable="false" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspIcons"><img border="0" alt="<axis:alt f="axisadm008" c="DUPLICAR" lit="103669"/>" title="<axis:alt f="axisadm008" c="DUPLICAR" lit="103669"/>" src="images/copy.gif" width="15px" height="15px"
                                                                style="cursor:pointer;vertical-align:middle;<c:if test="${LSTPLANTILLAS.OB_IAX_MODCONTA.FFIN!=null}">filter:alpha(opacity=25);
                                                                opacity:.25;</c:if>" <c:if test="${LSTPLANTILLAS.OB_IAX_MODCONTA.FFIN!=null}">disabled</c:if>   onclick="f_but_duplicar_plantilla('${LSTPLANTILLAS.OB_IAX_MODCONTA.SMODCON}')"  />
                                                            </div><!--Duplicar una plantilla -->
                                                        </display:column>
                                                        </axis:visible>
                                                        
                                                    </display:table>                                                        
                                                </div>
                                            </td>                                                
                                        </tr>
                                     </table>
                                </td>
                            </tr>
                            <!-- Fin Seccion de cuentas contables -->
                        </table>
                        <div class="separador">&nbsp;</div>
                        
             <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp">
               <c:param name="__botones">salir</c:param>
               <c:param name="f">axisadm008</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>