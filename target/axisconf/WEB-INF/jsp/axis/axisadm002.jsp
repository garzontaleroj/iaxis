<%/*
*  Fichero: axisadm002.jsp
*  
*  Fecha: 04/07/2008
*/
%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axisadm002" c="LIT_CONS_REC" lit="100905"/></title> <%-- CONSULTA DE RECIBOS --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="Stylesheet" href="styles/displaytag.css" type="text/css"></link>
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
    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {  
        	  f_cargar_propiedades_pantalla();   
              var dsp = "${__formdata.DSP_WIDTH}";
              if(dsp==""){
                try{
                document.getElementById('LSTRECIBOS').style.width=document.miForm.DSP_WIDTH.value+"%";
                }catch(e){}
              }
              
                var condicion = document.getElementById('CCONDICION').value;
                if(!objUtiles.estaVacio(condicion)){
                    try{
                        document.getElementById('TCONDICION').value='COND_RECIBO_'+condicion;
                    }catch(e){}
                }
              
            // MENSAJES: ${requestScope.__mensajes}
            var hayLSTRECIBOS = ${!empty sessionScope.REC_LSTRECIBOS};
            var hayErrores    = ${!empty requestScope.__mensajes.m__clave};
            if (!hayLSTRECIBOS && !hayErrores) {
                // Abrir modal buscador
                f_abrir_modal("axisadm001");
            } else {
                var miOffsetRecibos = "${requestScope.REC_miOffsetRecibos}";  //LCF sesión
                              // Desplazar barra scroll
                if (!objUtiles.estaVacio(miOffsetRecibos)) {
                    document.getElementById("dt_recibos").scrollTop = parseInt(miOffsetRecibos);
                }
            }
        }
        
        function f_but_cancelar() {
            // Borrar parámetros de session en servidor
            objAjax.invokeAsyncCGI("axis_axisadm002.do", callbackCancelar, "operation=salir", this);
        }
        function f_but_salir() {
            // Borrar parámetros de session en servidor
            objAjax.invokeAsyncCGI("axis_axisadm002.do", callbackCancelar, "operation=salir", this);
        }
        
        function callbackCancelar() {
           var isModal = "${__formdata.isModal}";
            if (objUtiles.estaVacio(isModal) || isModal == 0){ 
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm002", "cancelar", document.miForm, "_self");
            }else{
                if (isModal == 1){
                    parent.f_cerrar_axisadm002();
                }
            }
        }
        
        function f_but_buscar() {
            f_abrir_modal('axisadm001');
        }
         
        function f_ver_detalle(NRECIBO) {
            var isModal = "${__formdata.isModal}";
            if (objUtiles.estaVacio(isModal) || isModal == 0){ 
                // Guardar desplazamiento barra scroll
                var miOffsetRecibos;// = document.getElementById("dt_recibos").scrollTop;
                objUtiles.ejecutarFormulario ('axis_axisadm003.do?NRECIBO=' + NRECIBO + '&miOffsetRecibos=' + miOffsetRecibos, 
                    'form', document.miForm, '_self', objJsMessages.jslit_cargando);
            }else{
                if (isModal == 1){
                parent.f_seleccionarRecibo(NRECIBO);
                }
            }
        }
        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
            objDom.setVisibilidadPorId("but_cerrar_modal_"+cual, "hidden");  
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
      
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_aceptar_modal(cual, params) {
            objUtiles.cerrarModal(cual);
            objDom.setValorPorId("params",params);
            params += "&CBUSCADOR=1";
            
            if (cual == 'axisadm001')
                objUtiles.ejecutarFormulario("axis_axisadm002.do" + params , "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_validar_checkbox(cual){
        }
        
        /* ***************************************************************************************************** */
        /* ***************************************** UNIFICAR RECIBOS ****************************************** */
        /* ***************************************************************************************************** */
        function ChequearTodosBut() { 

            for (var i=0;i < document.forms["miForm"].elements.length;i++){ 
           
                    var elemento = document.forms[0].elements[i]; 
                    if (elemento.type == "checkbox"){ 
                        elemento.checked =true;
                        
                    } 
                    
                    var x = elemento.id; 
                    if(x.match(/SELEC_.*/)) 
                        objDom.setValorPorId(elemento.id,1);
               
            } 
            
            //var elem = document.getElementById("CUENTA");
            var elementCount = document.miForm.CUENTA.value;

            //alert(elementCount);
            for(var j=0;j<elementCount;j++){
                var ID= eval("document.miForm.IDCUENTA_"+j+".value");
                var ISALDO= eval("document.miForm.NREC_"+j+".value");
                
                //alert(" Valores: id  "+ID+ " , ctimp " + CTIPIMP + " , saldo " + ISALDO + " , porcen " + PORCEN + " , limite " + ILIMITE + " , icapmax " + ICAPMAX);
           
            }
        } 

        function DesChequearTodosBut() { 
            for (var i=0;i < document.forms["miForm"].elements.length;i++){ 
                  var elemento = document.forms[0].elements[i]; 
                      if (elemento.type == "checkbox"){ 
                          elemento.checked =false;
                        } 
            
                  var x = elemento.id; 
                    if(x.match(/SELEC_.*/)) 
                        objDom.setValorPorId(elemento.id,0);
            }  
            
            
             //var elem = document.getElementById("CUENTA");
             var elementCount = document.miForm.CUENTA.value;

             //alert(elementCount);
             for(var j=0;j<elementCount;j++){
                var ID= eval("document.miForm.IDCUENTA_"+j+".value");
                var ISALDO= eval("document.miForm.NREC_"+j+".value");
                
                //alert(" Valores: id  "+ID+ " , ctimp " + CTIPIMP + " , saldo " + ISALDO + " , porcen " + PORCEN + " , limite " + ILIMITE + " , icapmax " + ICAPMAX);
             
            }
           
        } 
        
        //Antes de llamar a unificar revisamos los que están marcados y no para obtener los valores de los campos que nos interesan
        function obtener_marcados(){
            var j=0;
            for (var i=0;i < document.forms["miForm"].elements.length;i++){ 
                  var elemento = document.forms[0].elements[i]; 
                      if (elemento.type == "checkbox"){ 
                      
                         if( elemento.checked ){
                             objDom.setValorPorId("SELEC_"+j,1);
                             //alert("SELEC"+j+":  "+1);
                         }else{
                             objDom.setValorPorId("SELEC_"+j,0);
                             //alert("SELEC"+j+":  "+0);
                             
                         }
                         
                        j =j+1;
                    } 
            }  
        //alert("*************************************************************************");
        //alert(document.miForm.SELEC_0.value);
        //alert(document.miForm.SELEC_1.value);
        }
        
        function f_but_9904232(){
          //Llamada a unificar recibos abrir modal axisadm003.jsp
          //alert("En unificación de recibos");
         // obtener_marcados();
          //antes de llamar, mirar cuales están seleccionados y cuáles no antes de llamar
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
                alert("<axis:alt f='axisadm002' c='ERROR' lit='9904191' />" );
            }
            else{
                //objUtiles.ejecutarFormulario("axis_axisadm003.do", "unificar_recibos", document.miForm, "_self", objJsMessages.jslit_cargando);
                objUtiles.ejecutarFormulario("axis_axisadm002.do", "unificar_recibos", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        
        
        function f_but_9904226(){
          //Llamada a desunificar recibos abrir modal axisadm003.jsp
          //alert("En unificación de recibos");
         // obtener_marcados();
          //antes de llamar, mirar cuales están seleccionados y cuáles no antes de llamar
          
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
                alert("<axis:alt f='axisadm002' c='ERROR' lit='9904191' />" );
            }
            else{
                objUtiles.ejecutarFormulario("axis_axisadm002.do", "desunificar_recibos", document.miForm, "_self", objJsMessages.jslit_cargando);
           }
        }
        
        function f_mod_tipimp(id,check){
               // var check = document.getElementById("selectedClausula_"+id);
               
                objDom.setValorPorId("SELEC_"+id,((check.checked)?1:0));
                  
                //alert(" Valores: id  "+id+ " , ctimp " + ctipimp + " , saldo " + selsaldo + " , porcen " + PORCEN + " , limite " + ILIMITE + " , icapmax " + ICAPMAX);
               
                //if (objValidador.validaEntrada()) {
                //    if (!objUtiles.estaVacio(selsaldo) && selsaldo != 0 && selsaldo != 1){
                //        sel = selsaldo.checked ? 1 : 0;
                        
                //    }
                    
                // }
                 
            }
        
        /* ***************************************************************************************************** */
        /* ***************************************** UNIFICAR RECIBOS ****************************************** */
        /* ***************************************************************************************************** */
function mostrar(nombreCapa,nombreDIV){ 
  objUtiles.scrollPoll(nombreCapa,nombreDIV);
}
function ocultar(nombreCapa){ 
    document.getElementById(nombreCapa).style.visibility="hidden"; 
} 
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisadm002" c="TITULO_CONS_REC" lit="100905"/></c:param>     <%-- CONSULTA DE RECIBOS --%>
                <c:param name="formulario"><axis:alt f="axisadm002" c="LIT_CONS_REC_FORM" lit="100905"/></c:param> <%-- CONSULTA DE RECIBOS --%>
                <c:param name="form">axisadm002</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisadm001|<axis:alt f="axisadm002" c="MODAL_AXIADM001" lit="1000552"/>|XoN</c:param>
        </c:import>
    
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="isModal" id = "isModal" value="${__formdata.isModal}"/>
        <input type="hidden" name="params" id = "params" value="${__formdata.params}"/>
        <input type="hidden" name="DSP_WIDTH" id="DSP_WIDTH" value="${__formdata.DSP_WIDTH}"/>
        <input type="hidden" name="CCONDICION" id="CCONDICION" value="${__formdata.CCONDICION}" > 
        <input type="hidden" name="TCONDICION" id="TCONDICION" value="${__formdata.TCONDICION}" > 
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <!-- Cabecera -->
            
            
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                </td>
            </tr>
            <!-- FIN Cabecera -->
            <tr>
                <td>
                    <!--div class="separador">&nbsp;</div-->
                    <div class="titulo">
                        <% String CMODO_ANT = (String) axis.mvc.control.AbstractDispatchAction.topPila(request, "CMODO_ANT"); %>
                        <c:set var="CMODO_ANT">
                            <%= CMODO_ANT %>
                        </c:set>
                        <img src="images/flecha.gif"/><b><axis:alt f="axisadm002" c="LIT_IMG_GO" lit="1000345"/>&nbsp;<c:if test="${CMODO_ANT!='UNIFICACION'}"><axis:alt f="axisadm002" c="LIT_IMG_GO02" lit="1000343"/></c:if><c:if test="${CMODO_ANT=='UNIFICACION'}"><axis:alt f="axisadm002" c="LIT_IMG_GO02" lit="9906807"/></c:if> </b>
                        <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisadm002" c="LIT_ABRIR_MODAL" lit="100797" />" onclick="f_abrir_modal('axisadm001');" style="cursor:pointer"/>                
                    </div>
                    <div class="separador">&nbsp;</div>
                    <c:set var="title0"><axis:alt f="axisadm002" c="LIT_NUM" lit="800440"/></c:set>   <%-- Nº --%>
                    <c:set var="title1"><axis:alt f="axisadm002" c="LIT_PROD" lit="100829"/></c:set>   <%-- Producte --%>
                    <c:set var="title2"><axis:alt f="axisadm002" c="LIT_DELEG" lit="1000561"/></c:set>  <%-- Delegació --%>
                    <c:set var="title3"><axis:alt f="axisadm002" c="LIT_AGENT" lit="100584"/></c:set>   <%-- Agent --%>
                    <c:set var="title4"><axis:alt f="axisadm002" c="LIT_PREN" lit="101027"/></c:set>   <%-- Prenedor --%>
                    <c:set var="title5"><axis:alt f="axisadm002" c="LIT_EMI" lit="1000562"/></c:set>  <%-- Data emissió --%>
                    <c:set var="title6"><axis:alt f="axisadm002" c="LIT_FEFE" lit="100883"/></c:set>   <%-- Data efecte --%>
                    <c:set var="title7"><axis:alt f="axisadm002" c="LIT_FVENC" lit="100885"/></c:set>   <%-- Data venciment --%>
                    <c:set var="title8"><axis:alt f="axisadm002" c="LIT_REC" lit="1000563"/></c:set>  <%-- Total rebut --%>
                    <c:set var="title9"><axis:alt f="axisadm002" c="LIT_TREC" lit="102302"/></c:set>   <%-- Tipo de rebut --%>
                    <c:set var="title10"><axis:alt f="axisadm002" c="LIT_EREC" lit="1000553"/></c:set> <%-- Estat rebut --%>
                    <c:set var="title11"><axis:alt f="axisadm002" c="LIT_ESTVAL" lit="9901620"/></c:set> <%-- Validado --%>
                    <c:set var="title12"><axis:alt f="axisadm002" c="LIT_COMPANIA" lit="9000600"/></c:set> <%-- cOMPAÑIA --%>
                    <c:set var="title13"><axis:alt f="axisadm002" c="LIT_ACTIVIDAD" lit="103481"/></c:set> <%-- cOMPAÑIA --%>
                    <c:set var="title14"><axis:alt f="axisadm002" c="LIT_CRECCIA" lit="9902300"/></c:set> <%--  Recibo axis --%>
                    <c:set var="title15"><axis:alt f="axisadm002" c="LIT_ICOMBRU" lit="108482"/></c:set> <%--  Comission --%>
                    <c:set var="title16"><axis:alt f="axisadm002" c="LIT_TRAMO" lit="100784"/></c:set> <%--  Ramo --%>
                    <c:set var="title17"><axis:alt f="axisadm002" c="LIT_NPOLIZA" lit="100624"/></c:set> <%--  Npoliza --%>
                    <c:set var="title18"><axis:alt f="axisadm002" c="LIT_SUCURSAL" lit="9002202"/></c:set> <%--  Sucursal --%>
                    <c:set var="title21"><axis:alt f="axisadm002" c="LIT_DESCRIESG" lit="102524"/></c:set>
                    <c:set var="title22"><axis:alt f="axisadm002" c="LIT_TNEGOCI" lit="9904000"/></c:set>
                    <c:set var="title23"><axis:alt f="axisadm002" c="LIT_CTIPCOB" lit="9904004"/></c:set>
                    <c:set var="title24"><axis:alt f="axisadm002" c="LIT_CESTIMP" lit="102104"/></c:set>
                    <c:set var="title25"><axis:alt f="axisadm002" c="LIT_NANUALI" lit="9904001"/></c:set>
                    <c:set var="title26"><axis:alt f="axisadm002" c="LIT_NFRACCI" lit="9903786"/></c:set>
                    <c:set var="title27"><axis:alt f="axisadm002" c="LIT_STREC" lit="9907142"/></c:set>   <%-- SUBTipo de rebut --%>
                    <%int contador = 0;%>
                    <input type="hidden" name="CUENTA" id="CUENTA" value="${fn:length(sessionScope.REC_LSTRECIBOS)}">
                    <script language="Javascript">
                  		//INI TAREA 16715 AMC 28/03/2022
                        //alert(objUtiles.miInnerWidth()*0.9)
                        //poniendo scroll a nivel de body o div, no lo presenta, o presenta el scroll horizontal protegido
                        //if("${__formdata.DSP_WIDTH}"!="")
                        //    document.write('<div id="TRANSF" class="seccion displayspaceMaximo" style="overflow-x:auto;width:'+objUtiles.miInnerWidth()*0.89+'px;height:'+${31+(fn:length(sessionScope.REC_LSTRECIBOS)*19)}+'px;min-height:50px;max-height:350px">');
                        //else
                        //    document.write('<div id="TRANSF" class="seccion displayspaceMaximo" style="overflow-x:auto;width:'+objUtiles.miInnerWidth()*0.89+'px">');
                  		//FIN TAREA 16715 AMC 28/03/2022
                    </script>
                    <%--div class="seccion displayspaceMaximo" 40951030--%>
                        <display:table name="${sessionScope.REC_LSTRECIBOS}" id="LSTRECIBOS" export="false" class="dsptgtable" pagesize="10" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                             style="width:${__formdata.DSP_WIDTH}%" requestURI="axis_axisadm002.do?paginar=true" >
                            <%@ include file="../include/displaytag.jsp"%>
                            <axis:visible f="axisadm002" c="NRECSELEC">
                            <display:column title="${title00}" sortable="true" sortProperty="NRECIBO" headerClass="sortable"  media="html" autolink="false" >
                               <div class="dspIcons">
                                        <input onclick="javascript:f_mod_tipimp('<%= contador %>',this)" <c:if test="${LSTRECIBOS.NRECIBO==1 || __formdata['CMODO']=='UNIF'}">checked</c:if> 
                                         type="checkbox" id="selectedClausula" name="selectedClausula" value="" <c:if test="${__configform.axisadm002__NRECSELEC__modificable == 'false'}">readonly</c:if> />
                                            
                                        <input type="hidden" name="IDCUENTA_<%= contador %>" id="IDCUENTA_<%= contador %>" value="${LSTRECIBOS.NRECIBO}"/>
                                        <input type="hidden" name="NREC_<%= contador %>" id="NREC_<%= contador %>" value="${LSTRECIBOS.NRECIBO}"/>
                                        <input type="hidden" name="SELEC_<%= contador %>" id="SELEC_<%= contador %>" value=""/>
                                </div> 
                            </display:column>
                          </axis:visible>
                            <display:column title="${title0}" sortable="true" sortProperty="NRECIBO" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspNumber">
                                    <a href="javascript:f_ver_detalle('${LSTRECIBOS.NRECIBO}')">
                                        ${LSTRECIBOS.NRECIBO}
                                </a></div>
                            </display:column>
                            <axis:visible f="axisadm002" c="CRECCIA">
                            <display:column title="${title14}" sortable="true" sortProperty="CRECCIA" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                    <a href="javascript:f_ver_detalle('${LSTRECIBOS.NRECIBO}')">
                                        ${LSTRECIBOS.CRECCIA}
                                </a></div>
                            </display:column>
                            </axis:visible>
                            <axis:visible f="axisadm002" c="TRAMO">
                                <display:column title="${title16}" sortable="true" sortProperty="TRAMO" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">
                                        <a href="javascript:f_ver_detalle('${LSTRECIBOS.NRECIBO}')">
                                            ${LSTRECIBOS.TRAMO}
                                    </a></div>
                                </display:column>
                            </axis:visible>
                            
                            <display:column title="${title1}" sortable="true" sortProperty="TSPRODUC" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                    <a href="javascript:f_ver_detalle('${LSTRECIBOS.NRECIBO}')">
                                        ${LSTRECIBOS.TSPRODUC}
                                </a></div>
                            </display:column>
                            
                            <axis:visible f="axisadm002" c="TDELEGA">
                            <display:column title="${title2}" sortable="true" sortProperty="TDELEGA" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                    <a href="javascript:f_ver_detalle('${LSTRECIBOS.NRECIBO}')">
                                        ${LSTRECIBOS.TDELEGA}
                                </a></div>
                            </display:column>
                            </axis:visible>
                            <axis:visible f="axisadm002" c="TAGENTE">
                            <display:column title="${title3}" sortable="true" sortProperty="TAGENTE" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                    <a href="javascript:f_ver_detalle('${LSTRECIBOS.NRECIBO}')">
                                        ${LSTRECIBOS.TAGENTE}
                                </a></div>
                            </display:column>
                            </axis:visible>
                            <axis:visible f="axisadm002" c="NPOLIZA">
                                <display:column title="${title17}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">
                                        <a href="javascript:f_ver_detalle('${LSTRECIBOS.NRECIBO}')">
                                            ${LSTRECIBOS.NPOLIZA}
                                    </a></div>
                                </display:column>
                            </axis:visible>
                            <axis:visible f="axisadm002" c="SUCURSAL">
                                <display:column title="${title18}" sortable="true" sortProperty="SUCURSAL" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">
                                        <a href="javascript:f_ver_detalle('${LSTRECIBOS.NRECIBO}')">
                                            ${LSTRECIBOS.SUCURSAL}
                                    </a></div>
                                </display:column>
                            </axis:visible>
                            
                            <axis:visible f="axisadm002" c="NOM_TOMADOR">
                            <display:column title="${title4}" sortable="true" sortProperty="NOM_TOMADOR" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                    <a href="javascript:f_ver_detalle('${LSTRECIBOS.NRECIBO}')">
                                        <axis:visible f="axisadm002" c="NNUMIDE">${LSTRECIBOS.NNUMIDE} - </axis:visible>${LSTRECIBOS.NOM_TOMADOR}
                                </a></div>
                            </display:column>
                            </axis:visible>
                            <axis:visible f="axisadm002" c="DESCRIESG">
                                <display:column title="${title21}" sortable="true" sortProperty="DESCRIESG" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">
                                        <a href="javascript:f_ver_detalle('${LSTRECIBOS.NRECIBO}')">
                                            ${LSTRECIBOS.DESCRIESG}
                                        </a>
                                    </div>
                                </display:column>
                            </axis:visible>
                            <axis:visible f="axisadm002" c="FEMISIO">
                            <display:column title="${title5}" sortable="true" sortProperty="FEMISIO" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                    <a href="javascript:f_ver_detalle('${LSTRECIBOS.NRECIBO}')">
                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTRECIBOS.FEMISIO}"/>
                                </a></div>
                            </display:column>
                            </axis:visible>
                            <axis:visible f="axisadm002" c="FEFECTO">
                            <display:column title="${title6}" sortable="true" sortProperty="FEFECTO" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                    <a href="javascript:f_ver_detalle('${LSTRECIBOS.NRECIBO}')">
                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTRECIBOS.FEFECTO}"/>
                                </a></div>
                            </display:column>
                            </axis:visible>
                            <axis:visible f="axisadm002" c="FVENCIM">
                            <display:column title="${title7}" sortable="true" sortProperty="FVENCIM" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                    <a href="javascript:f_ver_detalle('${LSTRECIBOS.NRECIBO}')">
                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTRECIBOS.FVENCIM}"/>
                                </a></div>
                            </display:column>
                            </axis:visible>
                            <axis:visible f="axisadm002" c="TOTAL_RECIBO">
                            <display:column title="${title8}" sortable="true" sortProperty="TOTAL_RECIBO" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspNumber">
                                    <a href="javascript:f_ver_detalle('${LSTRECIBOS.NRECIBO}')">
                                        <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${LSTRECIBOS.TOTAL_RECIBO}"/>
                                </a></div>
                            </display:column>
                            </axis:visible>
                            <axis:visible f="axisadm002" c="ICOMBRU">
                            <display:column title="${title15}" sortable="true" sortProperty="ICOMBRU" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspNumber">
                                    <a href="javascript:f_ver_detalle('${LSTRECIBOS.NRECIBO}')">
                                        <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${LSTRECIBOS.ICOMBRU}"/>
                                </a></div>
                            </display:column>
                            </axis:visible>
                            <axis:visible f="axisadm002" c="TTIPREC">
                            <display:column title="${title9}" sortable="true" sortProperty="TTIPREC" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                    <a href="javascript:f_ver_detalle('${LSTRECIBOS.NRECIBO}')">
                                        ${LSTRECIBOS.TTIPREC}
                                    </a>
                                </div>
                            </display:column>                            
                            </axis:visible>
                            <axis:visible f="axisadm002" c="TSUBTIPREC">
                            <display:column title="${title27}" sortable="true" sortProperty="TSUBTIPREC" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                    <a href="javascript:f_ver_detalle('${LSTRECIBOS.NRECIBO}')">
                                        ${LSTRECIBOS.TSUBTIPREC}
                                    </a>
                                </div>
                            </display:column>                            
                            </axis:visible>
                            <axis:visible f="axisadm002" c="TNEGOCI">
                                <display:column title="${title22}" sortable="true" sortProperty="TNEGOCI" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">
                                        <a href="javascript:f_ver_detalle('${LSTRECIBOS.NRECIBO}')">
                                            ${LSTRECIBOS.TNEGOCI}
                                        </a>
                                    </div>
                                </display:column>
                            </axis:visible>
                            <axis:visible f="axisadm002" c="TESTREC">
                            <display:column title="${title10}" sortable="true" sortProperty="TESTREC" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                    <%-- <a href="javascript:f_ver_detalle('${LSTRECIBOS.NRECIBO}')" <c:if test="${LSTRECIBOS.CESTREC == 0}">class="dspTextAviso"</c:if> <c:if test="${LSTRECIBOS.CESTREC != 0}">class="dspText"</c:if>> --%>
                                    <a href="javascript:f_ver_detalle('${LSTRECIBOS.NRECIBO}')">
                                        ${LSTRECIBOS.TESTREC}
                                    </a>
                                </div>
                            </display:column>
                            </axis:visible>
                            <axis:visible f="axisadm002" c="CTIPCOB">
                                <display:column title="${title23}" sortable="true" sortProperty="CTIPCOB" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">
                                        <a href="javascript:f_ver_detalle('${LSTRECIBOS.NRECIBO}')">
                                            ${LSTRECIBOS.CTIPCOB}
                                        </a>
                                    </div>
                                </display:column>
                            </axis:visible>
                            <axis:visible f="axisadm002" c="CESTIMP">
                                <display:column title="${title24}" sortable="true" sortProperty="CESTIMP" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">
                                        <a href="javascript:f_ver_detalle('${LSTRECIBOS.NRECIBO}')">
                                            ${LSTRECIBOS.CESTIMP}
                                        </a>
                                    </div>
                                </display:column>
                            </axis:visible>
                            <axis:visible f="axisadm002" c="NANUALI">
                                <display:column title="${title25}" sortable="true" sortProperty="NANUALI" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">
                                        <a href="javascript:f_ver_detalle('${LSTRECIBOS.NRECIBO}')">
                                            ${LSTRECIBOS.NANUALI}
                                        </a>
                                    </div>
                                </display:column>
                            </axis:visible>
                            <axis:visible f="axisadm002" c="NFRACCI">
                                <display:column title="${title26}" sortable="true" sortProperty="NFRACCI" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">
                                        <a href="javascript:f_ver_detalle('${LSTRECIBOS.NRECIBO}')">
                                            ${LSTRECIBOS.NFRACCI}
                                        </a>
                                    </div>
                                </display:column>
                            </axis:visible>
                             <axis:visible f="axisadm002" c="CVALIDADO">
                                <display:column title="${title11}" sortable="true" sortProperty="CVALIDADO"  headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspIcons">  
                                    <input type="checkbox" disabled id="CVALIDADO" name="CVALIDADO" value="${LSTRECIBOS.CVALIDADO}" 
                                    <c:if test="${LSTRECIBOS.CVALIDADO == '1'}">checked</c:if> ></div>    
                                </display:column>
                             </axis:visible>
                             <axis:visible f="axisadm002" c="TCOMPANI">
                            <display:column title="${title12}" sortable="true" sortProperty="TCOMPANI"  headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                    <a href="javascript:f_ver_detalle('${LSTRECIBOS.NRECIBO}')">
                                        ${LSTRECIBOS.TCOMPANI}
                                    </a>
                                </div>
                            </display:column>
                            </axis:visible>
                            <axis:visible f="axisadm002" c="BT_MASDATOS">
                                <display:column title="" sortable="true" sortProperty="" headerClass="sortable fixed" media="html"  autolink="false" >
                                    <div class="dspIcons">
                                        <img border="0" alt="<axis:alt c="BT_MASDATOS_EXTSEG" f="axisadm002" lit="1000113"/>" title1="<axis:alt c="BT_MASDATOS_EXTSEG" f="axisadm002" lit="1000113"/>" src="images/mes.gif" width="11px" height="11px"
                                                        style="cursor:pointer;"  onmouseout="javascript:ocultar('SECCION_A${LSTRECIBOS.NRECIBO}')"  onmouseover="javascript:mostrar('SECCION_A${LSTRECIBOS.NRECIBO}','TRANSF')"  /></div>
                                </display:column>   
                            </axis:visible>
                            <display:column  class="seccion_informacion">
                                         <div id="SECCION_A${LSTRECIBOS.NRECIBO}" class="seccion_informacion" style="height:160px;">
                                         <!-- INICIO SECCION -->
                                         <table class="area" id="ivan" align="center">
                                             <tr>
                                                <th style="width:50%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                             </tr>
                                             <tr>                                           
                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                    <b>${title13}</b>
                                                </td>
                                             </tr>                                        
                                             <tr>                                                                            
                                                  <axis:visible f="axisadm002" c="TACTIVI">
                                                   
                                                      <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                        <input type="text" class="campo campotexto"  name="TACTIVI"  style="width:100%"
                                                        value="${LSTRECIBOS.TACTIVI}" readonly="readonly"/>                                                                                                              
                                                      </td>
                                                      
                                                  </axis:visible>   
                                            </tr>    
                                        </table>
                                        </div>

                                    </display:column>
                             <%contador++;%>
                        </display:table>
                    </div>
                    <axis:visible f="axisadm002" c="BUT_SEL_TODOS">
                    <input type="button" onclick="ChequearTodosBut()" class="boton" value="<axis:alt f="axisadm002" c="LIT_BUT_SELTODOS" lit="9000756"/>"/>
                    </axis:visible>
                    <axis:visible f="axisadm002" c="BUT_DSEL_TODOS">
                    <input type="button" onclick="DesChequearTodosBut()" class="boton" value="<axis:alt f="axisadm002" c="LIT_BUT_DESELTODOS" lit="9000757"/>"/>
                    </axis:visible>
                </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm002</c:param><c:param name="f">axisadm002</c:param>
            <c:param name="__botones">salir<axis:visible f="axisadm002" c="BUT_UNIF_REC">,9904232</axis:visible><axis:visible f="axisadm002" c="BUT_DESUNIF_REC">,9904226</axis:visible></c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
</body>
</html>