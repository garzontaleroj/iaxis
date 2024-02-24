<%/*
*  Fichero: axissin054.jsp
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
    <title>Traspaso de cartera de agente</title> <%-- Traspaso de cartera de agente --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    
    <style type="text/css">
        .displayspaceMaximo {
            width:99.8%;
            height: expression( this.scrollHeight > 349 ? "350px" : "auto" );
            max-height:350px;
            overflow-x: hidden;
            overflow-y: auto;
            border: 1px solid #DDDDDD;
        }
    </style>
   
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

    <script type="text/javascript">
        function f_onload() {     
            
            var numSiniestros = ${fn:length(__formdata.lista_sin)};
            var ok = "${__formdata.OK}";
            
            if (numSiniestros == 0 &&  objUtiles.estaVacio(ok) ) {  
                f_abrir_modal("axissin019");
            }
            
            f_cargar_propiedades_pantalla();
        }
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
        
        function f_but_aceptar() {
           var inputs=document.getElementsByTagName("input");
           var siniestros = null;
           var siniestro = null;
           
           if( !objUtiles.estaVacio(objDom.getValorPorId("CTRAMITNEW"))){
           
               for(i=0;i<inputs.length;i++){
                    if (inputs[i].type=="checkbox") {
                        if (inputs[i].checked) {
                            if (inputs[i].name=="chckSIN"){
                                if (siniestros==null){
                                    siniestro = objUtiles.utilSplit(objDom.getValorComponente(inputs[i]), "/");  
                                    if (!objUtiles.estaVacio (siniestro) ){
                                        v1 = objUtiles.utilSplit(objDom.getValorComponente(inputs[i]), "/")[0];
                                        v2 = objUtiles.utilSplit(objDom.getValorComponente(inputs[i]), "/")[1];
                                        siniestros=v1+'#'+v2+"|";
                                    } 
                                }else{
                                
                                    siniestro = objUtiles.utilSplit(objDom.getValorComponente(inputs[i]), "/");   
                                     if (!objUtiles.estaVacio (siniestro) ){
                                        v1 = objUtiles.utilSplit(objDom.getValorComponente(inputs[i]), "/")[0];
                                        v2 = objUtiles.utilSplit(objDom.getValorComponente(inputs[i]), "/")[1];
                                        siniestros=siniestros+v1+'#'+v2+"|";
                                    } 
                                }
                            }
                        }
                    }
               }
               
               if(!objUtiles.estaVacio(siniestros)){
                objDom.setValorPorId("LISTSIN", siniestros); 
                objUtiles.ejecutarFormulario ("axis_axissin054.do?",
                                             "aceptar", document.miForm, "_self", objJsMessages.jslit_actualizando_registro); 
                }
               else alert("<axis:alt f="axissin054" c="BUT_ACEPTAR" lit="9903679"/>"); 
               
           }
           else alert("<axis:alt f="axissin054" c="BUT_ACEPTAR" lit="9001400"/>"); 
        }
        
        function f_but_salir() {
           objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axissin054", "cancelar", document.miForm, "_self");                   
        }
        
        
        function f_seltot_sin(){
           var inputs=document.getElementsByTagName("input");
           
               for(i=0;i<inputs.length;i++){
                    if (inputs[i].type=="checkbox") {
                        if (inputs[i].name=="chckSIN"){
                            inputs[i].checked = true;
                        }
                    }
                }
        }
        
        
        function f_deseltot_sin(){
           var inputs=document.getElementsByTagName("input");
           
               for(i=0;i<inputs.length;i++){
                    if (inputs[i].type=="checkbox") {
                        if (inputs[i].name=="chckSIN"){
                            inputs[i].checked = false;
                        }
                    }
                }
        }
        
       
        
         function f_cambia_cunitra(obj){
            if (obj.value != "null"){
                objAjax.invokeAsyncCGI("axis_axissin054.do", callbackAjaxSelectedCunitra, 
                    "operation=ajax_selected_cunitra&CUNITRANEW="+document.miForm.CUNITRANEW.value+"&CEMPRES="+document.miForm.CEMPRES.value, this, objJsMessages.jslit_actualizando_registro);}
        }
        
        function callbackAjaxSelectedCunitra(ajaxResponseText) {
            var tramitadoresCombo = document.miForm.CTRAMITNEW;
            try {
               var doc=objAjax.domParse(ajaxResponseText);
                                    
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        objDom.borrarOpcionesDeCombo(tramitadoresCombo);
                        
                        for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                            var TTRAMITAD = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TTRAMITAD")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TTRAMITAD")[0].childNodes[0].nodeValue : "");
                            var CTRAMITAD = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CTRAMITAD")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CTRAMITAD")[0].childNodes[0].nodeValue : "");
                           
                            objDom.addOpcionACombo(CTRAMITAD, TTRAMITAD, tramitadoresCombo, i);
                        }
                    }else{
                        objDom.borrarOpcionesDeCombo (tramitadoresCombo);
                        objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", tramitadoresCombo, null);
                    }
                }
                
            } catch (e) {
                objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", tramitadoresCombo, null);
                alert(objJsMessages.jslit_sin_tramitadores);
            }
        }
        
        function f_cerrar_axissin019(){
            objUtiles.cerrarModal("axissin019");
        }
        
        function f_aceptar_axissin019(CRAMO,SPRODUC,NPOLIZA,NCERTIF,NSINIES,CESTSIN,CACTIVI,CUNITRA,CTRAMIT,FSINIES){
            f_cerrar_axissin019();
            
            document.miForm.CRAMOBUS.value = CRAMO;
            document.miForm.SPRODUCBUS.value = SPRODUC;
            document.miForm.NPOLIZABUS.value = NPOLIZA;
            document.miForm.NCERTIFBUS.value = NCERTIF;
            document.miForm.NSINIESBUS.value = NSINIES;
            document.miForm.CESTSINBUS.value = CESTSIN;
            document.miForm.CACTIVIBUS.value = CACTIVI;
            document.miForm.CUNITRABUS.value = CUNITRA;
            document.miForm.CTRAMITBUS.value = CTRAMIT;
            document.miForm.FSINIESBUS.value = FSINIES;
            
            objUtiles.ejecutarFormulario("axis_axissin054.do", "buscar", document.miForm, "_self", objJsMessages.jslit_actualizando_registro);
        }
        
        function f_but_siniestro(NSINIES,SSEGURO) {
            
            objUtiles.ejecutarFormulario("axis_axissin054.do?SSEGURO="+SSEGURO+"&NSINIESCON="+NSINIES, "navegarSiniestro", document.miForm, "_self", objJsMessages.jslit_cargando);
         }
        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST" >         
    
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axissin054" c="TITULO" lit="9903652"/></c:param>     <%-- Cambio masivo de tramitador --%>
            <c:param name="formulario"><axis:alt f="axissin054" c="TITULO" lit="9903652"/></c:param> <%-- Cambio masivo de tramitador --%>
            <c:param name="form">axissin054</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin019|<axis:alt f="axissin054" c="TITULO_DOMIC" lit=""/></c:param> <%-- INTRODUCCIÓN DE UN RIESGO DOMICILIO --%>
        </c:import>
        
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" id="CEMPRES" name="CEMPRES" value="${__formdata.CEMPRES}"/>
        <input type="hidden" id="CRAMOBUS" name="CRAMOBUS" value="${__formdata.CRAMOBUS}"/>
        <input type="hidden" id="SPRODUCBUS" name="SPRODUCBUS" value="${__formdata.SPRODUCBUS}"/>
        <input type="hidden" id="NPOLIZABUS" name="NPOLIZABUS" value="${__formdata.NPOLIZABUS}"/>
        <input type="hidden" id="NCERTIFBUS" name="NCERTIFBUS" value="${__formdata.NCERTIFBUS}"/>
        <input type="hidden" id="NSINIESBUS" name="NSINIESBUS" value="${__formdata.NSINIESBUS}"/>
        <input type="hidden" id="CESTSINBUS" name="CESTSINBUS" value="${__formdata.CESTSINBUS}"/>
        <input type="hidden" id="CACTIVIBUS" name="CACTIVIBUS" value="${__formdata.CACTIVIBUS}"/>
        <input type="hidden" id="CUNITRABUS" name="CUNITRABUS" value="${__formdata.CUNITRABUS}"/>
        <input type="hidden" id="CTRAMITBUS" name="CTRAMITBUS" value="${__formdata.CTRAMITBUS}"/>
        <input type="hidden" id="FSINIESBUS" name="FSINIESBUS" value="${__formdata.FSINIESBUS}"/>
        <input type="hidden" id="LISTSIN" name="LISTSIN" value="${__formdata.LISTSIN}"/>
        
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td> 
                    <div class="separador">&nbsp;</div>
                    <div class="titulo"><axis:alt f="axissin054" c="TITULO" lit="9903652"/>
                    <img border="0" src="images/find.gif" onclick="f_abrir_modal('axissin019')" style="cursor:pointer"/>
                    </div> 
                </td>
            </tr>
            <tr>
                <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:1%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:23%;height:0px"></th>
                                <th style="width:1%;height:0px"></th>
                            </tr>
                            <tr>
                                <td></td>
                                <axis:visible c="TRAMITAORI" f="axissin054">
                                <td class="titulocaja" >
                                    <b><axis:alt f="axissin054" c="TRAMITAORI" lit="9903653"/></b><!-- Tramitador origen -->
                                </td>
                                </axis:visible>
                                <axis:visible c="CUNITRANEW" f="axissin016">                            
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin054" c="CUNITRA" lit="9000900"/></b><!-- Unidad de tramitacion -->
                                    </td>
                                </axis:visible>  
                                <axis:visible c="TRAMITANEW" f="axissin016">
                                <td class="titulocaja" >
                                    <b><axis:alt f="axissin054" c="TRAMITANEW" lit="9903654"/></b><!-- Tramitador nuevo -->
                                </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <td></td>
                                <axis:visible c="TRAMITAORI" f="axissin054"> 
                                <td class="campocaja" >
                                    <input type="text"  class="campowidthinput campo campotexto" value="${__formdata.TRAMITAORI}" name="TRAMITAORI" id="TRAMITAORI"  
                                     <axis:atr f="axissin054" c="TRAMITAORI" a="modificable=false&obligatorio=false"/>
                                    title="<axis:alt f="axissin054" c="TRAMITAORI" lit="100584"/>" size="5" />
                                </td>
                                </axis:visible>
                                 <!-- Unitat Tramitació -->
                                <axis:visible c="CUNITRANEW" f="axissin054">
                                    <td class="campocaja">
                                        <select name = "CUNITRANEW" id ="CUNITRANEW" size="1" onchange="f_cambia_cunitra(this)" class="campowidthselect campo campotexto">                                                    
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin016" c="COMBO_CUNITRA" lit="1000348"/> - </option>
                                            <c:forEach var="cunitraOp" items="${__formdata.listvalores.lstcunitra}">
                                                <option value = "${cunitraOp.CTRAMITAD}" 
                                                   <c:if test="${cunitraOp.CTRAMITAD == __formdata.CUNITRANEW}">selected</c:if>>
                                                   ${cunitraOp.TTRAMITAD}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:visible>  
                               
                                <!-- Tramitador -->
                                <axis:visible c="CTRAMITNEW" f="axissin054">                        
                                <td class="campocaja">
                                    <select name = "CTRAMITNEW" id ="CTRAMITNEW" size="1" class="campowidthselect campo campotexto"
                                    <axis:atr f="axissin054" c="CTRAMITNEW" a="obligatorio=true"/>>
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin016" c="COMBO_CTRAMIT" lit="1000348"/> - </option>
                                        <c:forEach var="ttramitadOp" items="${__formdata.listvalores.lsttramit}">
                                            <option value = "${ttramitadOp.CTRAMITAD}" 
                                            <c:if test="${__formdata.CTRAMITAD  != 'null' && ttramitadOp.CTRAMITAD == __formdata.CTRAMITNEW}">selected</c:if>>
                                                ${ttramitadOp.TTRAMITAD} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:visible> 
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <div class="separador">&nbsp;&nbsp;&nbsp;</div>
                                </td>
                            </tr>
                            <tr>
                               <td></td>
                               <td colspan="4">
                                    <div class="seccion displayspaceGrande">
                                    <c:set var="title1"><axis:alt f="axissin054" c="NSINIES" lit="800279" /></c:set><!-- Nº NSINIES -->
                                    <c:set var="title2"><axis:alt f="axissin054" c="FSINIES" lit="110521" /></c:set><!-- FSINIES -->
                                    <c:set var="title3"><axis:alt f="axissin054" c="TTRAMIT" lit="9000908" /></c:set><!-- TTRAMIT -->
                                    <c:set var="title7"><axis:alt f="axissin054" c="TSINIES" lit="1000112" /></c:set><!-- TSINIES -->
                                    <c:set var="title8"><axis:alt f="axissin054" c="CONSULTASINI" lit="103101" /></c:set><!-- Cons. -->
                                    
                                        <display:table name="${__formdata.lista_sin}" id="T_DATPOL" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                        requestURI="axis_axissin054.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                
                                        <display:column title="" sortable="false" media="html" autolink="false" headerClass="sortable" style="width:3%" >
                                            <div class="dspIcons" >
                                                <input type="checkbox" id="chckSIN_${T_DATPOL.NSINIES}" name="chckSIN" value="${T_DATPOL.NSINIES}/${T_DATPOL.NTRAMIT}"/>
                                            </div>
                                        </display:column>
                                        <axis:visible c="NSINIES_DATPOL" f="axissin054">
                                            <display:column title="${title1}" sortable="true" sortProperty="NSINIES" headerClass="sortable" media="html" autolink="false" style="width:10%" >
                                                <div class="dspText">${T_DATPOL.NSINIES}</div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible c="FSINIES_DATPOL" f="axissin054">
                                            <display:column title="${title2}" sortable="true" sortProperty="FSINIES" headerClass="sortable" media="html" autolink="false" style="width:10%">
                                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_DATPOL.FSINIES}"/></div>
                                            </display:column> 
                                        </axis:visible>
                                        <axis:visible c="TTRAMIT_DATPOL" f="axissin054">
                                            <display:column title="${title3}" sortable="false" sortProperty="TTRAMIT" headerClass="sortable" media="html" autolink="false" style="width:20%">
                                                <div class="dspText" align="left">${T_DATPOL.TTRAMIT}</div>
                                            </display:column> 
                                        </axis:visible>
                                        <axis:visible c="TSINIES_DATPOL" f="axissin054">
                                            <display:column title="${title7}" sortable="false" sortProperty="TSINIES" headerClass="sortable" media="html" autolink="false" style="width:50%">
                                                <div class="dspText">
                                                    <textarea  rows="2" class="campo campotexto" readonly style="width:100%;"  name="TSINIES" id="TSINIES">${T_DATPOL.TSINIES}</textarea>
                                                </div> 
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible c="CONS_DATPOL" f="axissin054">
                                            <display:column title="${title8}" sortable="false" sortProperty="titpro" headerClass="sortable" media="html" autolink="false" style="width:5%;">
                                                <div class="dspIcons"><img border="0" alt="<axis:alt f="axissin054" c="CONSULTASINI" lit="103101" />" title="<axis:alt f="axissin054" c="CONSULTASINI" lit="103101" />" src="images/find.gif" width="15px" height="15px"
                                                                        style="cursor:pointer;vertical-align:middle"   onclick="javascript:f_but_siniestro('${T_DATPOL.NSINIES}','${T_DATPOL.SSEGURO}')"  />
                                                                    </div>
                                            </display:column>
                                        </axis:visible>
                                        </display:table>
                                    </div>
                                    <div class="separador">&nbsp;&nbsp;&nbsp;</div>
                                    <c:if test="${! empty __formdata.lista_sin}">
                                        <input type="button" class="boton" id="but_sel_sin" value="<axis:alt f="axissin054" c="BUT_SEL_SIN" lit="9000756"/>" onclick="f_seltot_sin()" /> 
                                        <input type="button" class="boton" id="but_desel_sin" value="<axis:alt f="axissin054" c="BUT_DESEL_SIN" lit="9000757"/>" onclick="f_deseltot_sin()" /> 
                                    </c:if>
                                    <div class="separador">&nbsp;&nbsp;&nbsp;</div>
                                </td>
                            </tr>
                        </table>
                </td>
            </tr>
       
        </table>


        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin054</c:param>
            <c:param name="__botones">salir,aceptar</c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>

</body>
</html>
