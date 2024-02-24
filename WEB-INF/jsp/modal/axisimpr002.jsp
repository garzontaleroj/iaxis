<%/*
*  Fichero: axisimpr002.jsp
*  
*  Fecha: 04/07/2008
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
    <title><axis:alt f="axisimpr002" c="LIT_CONS_REC" lit="100905"/></title> <%-- CONSULTA DE RECIBOS --%>
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
        	                               
            // MENSAJES: ${requestScope.__mensajes}
            var hayLSTRECIBOS = ${!empty sessionScope.REC_LSTRECIBOS};
            var hayErrores    = ${!empty requestScope.__mensajes.m__clave};
            if (!hayLSTRECIBOS && !hayErrores) {
                // Abrir modal buscador
                //f_abrir_modal("axisimpr003");
            } else {
                var miOffsetRecibos = "${requestScope.REC_miOffsetRecibos}";  //LCF sesión
                              // Desplazar barra scroll
                if (!objUtiles.estaVacio(miOffsetRecibos)) {
                    document.getElementById("dt_recibos").scrollTop = parseInt(miOffsetRecibos);
                }
            }
            
            var PREAVISOOK = "${requestScope.PREAVISOOK}";
            if(PREAVISOOK==1){
                //alert("<axis:alt f='axisimpr002' c='ALERTOK' lit='9903595'/>");
                //objUtiles.ejecutarFormulario("axis_axisimpr002.do" + document.miForm.PARAMSBUSC.value, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                var CSPROCES;
                var TTIPO = 'PREAVISOS';
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_preavisos&CSPROCES="+CSPROCES+"&CTIPO="+TTIPO);
            }
        }
        
        function f_cerrar_axisimprimir() {
            objUtiles.cerrarModal("axisimprimir");
            objUtiles.ejecutarFormulario("axis_axisimpr002.do" + document.miForm.PARAMSBUSC.value, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_cancelar() {
            // Borrar parámetros de session en servidor
            objAjax.invokeAsyncCGI("axis_axisimpr002.do", callbackCancelar, "operation=salir", this);
        }
        function f_but_salir() {
            // Borrar parámetros de session en servidor            
            parent.f_cerrar_modal('axisimpr002');
        }
        
        function callbackCancelar() {
           var isModal = "${__formdata.isModal}";
            if (objUtiles.estaVacio(isModal) || isModal == 0){ 
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisimpr002", "cancelar", document.miForm, "_self");
            }else{
                if (isModal == 1){
                    parent.f_cerrar_axisimpr002();
                }
            }
        }
        
        function f_but_buscar() {
            //f_abrir_modal('axisimpr003');
        }
         
        function f_ver_detalle(NRECIBO) {
            var isModal = "${__formdata.isModal}";
            if (objUtiles.estaVacio(isModal) || isModal == 0){ 
                // Guardar desplazamiento barra scroll
                var miOffsetRecibos;// = document.getElementById("dt_recibos").scrollTop;
                objUtiles.ejecutarFormulario ('axis_axisimpr003.do?NRECIBO=' + NRECIBO + '&miOffsetRecibos=' + miOffsetRecibos, 
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
            f_cerrar_modal(cual);
            if (cual == 'axisimpr003'){
                document.miForm.PARAMSBUSC.value = params;
                objUtiles.ejecutarFormulario("axis_axisimpr002.do" + params, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
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
            }  
            
            
             //var elem = document.getElementById("CUENTA");
             var elementCount = document.miForm.CUENTA.value;

             //alert(elementCount);
             for(var j=0;j<elementCount;j++){
                var ID= eval("document.miForm.BIDCUENTA_"+j+".value");
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
                             objDom.setValorPorId("BSELEC_"+j,1);
                             //alert("SELEC"+j+":  "+1);
                         }else{
                             objDom.setValorPorId("BSELEC_"+j,0);
                             //alert("SELEC"+j+":  "+0);
                             
                         }
                         
                        j =j+1;
                    } 
            }  
        //alert("*************************************************************************");
        //alert(document.miForm.SELEC_0.value);
        //alert(document.miForm.SELEC_1.value);
        if (j>0) return true;
        else return false;
        }
        
        function f_but_100001(){
          //Llamada a unificar recibos abrir modal axisimpr003.jsp
          //alert("En unificación de recibos");
          if (obtener_marcados()){
            //antes de llamar, mirar cuales están seleccionados y cuáles no antes de llamar
            objUtiles.ejecutarFormulario("modal_axisimpr002.do", "imprimir", document.miForm, "_self", objJsMessages.jslit_cargando);
          }
          
        }
        
        
        function f_mod_tipimp(id,selsaldo){
                var sel;
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
        function mostrar(nombreCapa){             
            document.getElementById(nombreCapa).style.visibility="visible"; 
        } 
            
        function ocultar(nombreCapa){             
         document.getElementById(nombreCapa).style.visibility="hidden"; 
        } 
        
        function f_detalleimpresion(IDCATEGORIA){
           objUtiles.abrirModal('axisimpr003', "src", "modal_axisimpr003.do?operation=form&IDCATEGORIA=" + IDCATEGORIA+'&origen=axisimpr002');        
        }
        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisimpr002" c="TITULO_CONS_REC" lit="9904262"/></c:param>     <%-- CONSULTA DE RECIBOS --%>
                <c:param name="formulario"><axis:alt f="axisimpr002" c="LIT_CONS_REC_FORM" lit="9904262"/></c:param> <%-- CONSULTA DE RECIBOS --%>
                <c:param name="form">axisimpr002</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisimpr003|<axis:alt f="axisimpr002" c="MODAL_AXIADM001" lit="9904252"/>|XoN</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisimpr002" c="TITULOIMPRIMIR" lit="9904262" /></c:param>
            <c:param name="nid" value="axisimprimir"></c:param>
        </c:import>
    
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="isModal" id = "isModal" value="${__formdata.isModal}"/>
        
        <input type="hidden" name="PREAVISOOK" id = "PREAVISOOK" value="${__formdata.PREAVISOOK}"/>
        
        <input type="hidden" name="PARAMSBUSC" id="PARAMSBUSC" value="${__formdata.PARAMSBUSC}"/>
        
        
                    
                    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                    <tr>                        
                        <td>
                            <div class="titulo">
                                <img src="images/flecha.gif"/><b><axis:alt f="axisimpr002" c="LIT_IMG_GO" lit="9904256"/></b>                                
                            </div>                        
                    
                            <c:set var="title0"><axis:alt f="axisimpr001" c="LIT_CATEG" lit="9904258"/></c:set>   <%-- Producte --%>
                            <c:set var="title1"><axis:alt f="axisimpr001" c="LIT_TIPO" lit="100565"/></c:set> <%--  Tipo --%>
                            <c:set var="title2"><axis:alt f="axisimpr001" c="LIT_FICHERO" lit="1000574"/></c:set>   <%-- FICHERO --%>
                            <c:set var="title3"><axis:alt f="axisimpr001" c="LIT_FECHA" lit="9001983"/></c:set>   <%-- fecha solicitud --%>
                            <c:set var="title4"><axis:alt f="axisimpr001" c="LIT_USUARI" lit="100894"/></c:set>   <%-- Usuario --%>
                            <c:set var="title5"><axis:alt f="axisimpr001" c="LIT_FULTIMP" lit="9904259"/></c:set>   <%-- Fecha ultima impresion--%>
                            <c:set var="title6"><axis:alt f="axisimpr001" c="LIT_USUULTIMP" lit="9904260"/></c:set>   <%-- usuario ultima impresion --%>
                            <%int contador = 0;%>
                            <input type="hidden" name="CUENTA" id="CUENTA" value="${fn:length(__formdata.REC_LSTIMPDET)}">
                            <script language="Javascript">
                                //alert(objUtiles.miInnerWidth()*0.9)
                                //poniendo scroll a nivel de body o div, no lo presenta, o presenta el scroll horizontal protegido
                                document.write('<div class="seccion displayspaceMaximo" style="overflow-x:auto;width:'+objUtiles.miInnerWidth()*0.89+'px">');
                            </script>
                            <!--div class="seccion displayspaceMaximo"-->
                                <display:table name="${__formdata.REC_LSTIMPDET}" id="LSTIMPDET" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0"
                                     requestURI="axis_axisimpr002.do?paginar=true" style="width:100%" >
                                    <%@ include file="../include/displaytag.jsp"%>                                    
                                    <display:column title="${title0}" sortable="false" sortProperty="TDESCATEGORIA" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText"> ${LSTIMPDET.TDESCATEGORIA}</div>
                                    </display:column>
                                    <display:column title="${title1}" sortable="false" sortProperty="TTIPO" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspNumber">${LSTIMPDET.TTIPO}</div>
                                    </display:column>
                                    <display:column title="${title2}" sortable="false" sortProperty="TFICHERO" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspNumber">${LSTIMPDET.TFICHERO}</div>
                                    </display:column>
                                    <display:column title="${title3}" sortable="false" sortProperty="FCREA" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${LSTIMPDET.FCREA}"/></div>
                                    </display:column>
                                    <display:column title="${title4}" sortable="false" sortProperty="CUSER" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText">${LSTIMPDET.CUSER}</div>
                                    </display:column>
                                    <display:column title="${title5}" sortable="false" sortProperty="FULTIMP" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${LSTIMPDET.FULTIMP}"/></div>
                                    </display:column>                                
                                   <display:column title="${title6}" sortable="false" sortProperty="CULTUSERIMP" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText">${LSTIMPDET.CULTUSERIMP}</div>
                                    </display:column>                                    
                                    <axis:visible f="axisimpr002" c="NRECSELEC">
                                    <display:column title="${title00}" sortable="false" sortProperty="NRECIBO" headerClass="sortable"  media="html" autolink="false" >
                                       <div class="dspIcons">
                                                <input onclick="javascript:f_mod_tipimp(1,this)" <c:if test="${LSTIMPDET.NRECIBO==1 || __formdata['CMODO']=='UNIF'}">checked</c:if> 
                                                 type="checkbox" id="selectedClausula" name="selectedClausula" value="" <c:if test="${__configform.axisimpr002__NRECSELEC__modificable == 'false'}">readonly</c:if> />
                                                    
                                                <input type="hidden" name="BIDCUENTA_<%= contador %>" id="BIDCUENTA_<%= contador %>" value="${LSTIMPDET.IDDOCGEDOX}"/>
                                                <input type="hidden" name="BNREC_<%= contador %>" id="BISALDO_<%= contador %>" value="${LSTIMPDET.IDDOCGEDOX}"/>
                                                <input type="hidden" name="BSELEC_<%= contador %>" id="BSELEC_<%= contador %>" value=""/>
                                        </div> 
                                    </display:column>
                                  </axis:visible>
                                     <%contador++;%>
                                </display:table>
                            </div>
                            <axis:visible f="axisimpr002" c="BUT_SEL_TODOS">
                            <input type="button" onclick="ChequearTodosBut()" class="boton" value="<axis:alt f="axisimpr002" c="LIT_BUT_SELTODOS" lit="9000756"/>"/>
                            </axis:visible>
                            <axis:visible f="axisimpr002" c="BUT_DSEL_TODOS">
                            <input type="button" onclick="DesChequearTodosBut()" class="boton" value="<axis:alt f="axisimpr002" c="LIT_BUT_DESELTODOS" lit="9000757"/>"/>
                            </axis:visible>
                    </td>
                </tr>
                <tr>
                
                <td class="titulocaja">
                    <b><axis:alt f="axisimpr001" c="LIT_IMPRESORA" lit="9904261"/></b> <%-- Empresa --%>
                </td>
                            </tr>
                            <tr>
                    <td>
                                   <c:set var="title10"><axis:alt f="axisimpr001" c="LIT_IMPRESORA" lit="9904261"/></c:set>     
                        <select title = "${title10}" name = "IDIMPRESORA" style="width:20%" id ="IDIMPRESORA" 
                                class="campowidthbig campo campotexto_ob" 
                                <axis:atr f="axisimpr002" c="IDIMPRESORA" a="modificable=true&isInputText=false"/>>&nbsp;
                                <option value="-1"><axis:alt f="axisimpr002" c="SEL" lit="1000348"/></option>
                                <c:forEach items="${__formdata.lstimpresoras}" var="element">                                                    
                                    <option value = "${element.IDIMPRESORA}">
                                         ${element.TALIAS} 
                                    </option>
                                </c:forEach>  
                        </td>
                    </tr>
                    
                    </table>                           
                                                      
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisimpr002</c:param><c:param name="f">axisimpr002</c:param>
            <c:param name="__botones">salir,100001</c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
</body>
</html>