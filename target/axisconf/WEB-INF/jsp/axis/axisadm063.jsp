<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*" %>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        
        <%--Inicio Sólo si vamos a tener un campo fecha --%>
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
        <%-- fin Sólo si vamos a tener un campo fecha --%>
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
                
                f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
 	    }
 	    			
           
            
            function f_abrir_modal(cual, optionalQueryString) {
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
            }
            
            function f_aceptar_modal(cual, CRAMO){
                objUtiles.cerrarModal(cual);
                objUtiles.ejecutarFormulario("axis_axisadm063.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_cerrar_modal(cual){
                 objUtiles.cerrarModal(cual);
            }
            
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm063", "cancelar", document.miForm, "_self");
            }
            function f_but_aceptar() {
                if (objValidador.validaEntrada()){
                    //Validamos los campos de pantalla, ahora llamaríamos a la función que tocara
                    objUtiles.ejecutarFormulario("axis_axisadm063.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
            
            function f_but_buscar(){
                if (objValidador.validaEntrada()){
                    //Validamos los campos de pantalla, ahora llamaríamos a la función que tocara
                    objUtiles.ejecutarFormulario("axis_axisadm063.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
            
            function f_buscar_detalle(thiss){
                if (objValidador.validaEntrada()){
                    objDom.setValorPorId("SIDPRODP",  thiss);
                    //Validamos los campos de pantalla, ahora llamaríamos a la función que tocara
                    objUtiles.ejecutarFormulario("axis_axisadm063.do", "buscar_detalle", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
            
             function f_but_nou(){
                if (objValidador.validaEntrada()) {  //Al realizar una alta, necesita estar seleccionado el SPRODUC y el TIPOIMP
                var optionalQueryString = "&SPRODUC=" + document.miForm.SPRODUC.value +"&CTIPOIMP="+document.miForm.CTIPOIMP.value
                                         +"&CAGENTE="+document.miForm.CAGENTE.value;
           
                f_abrir_modal('axisadm041', optionalQueryString);
                   
                }
            }
            
            function f_but_nou_detall(){
                if (objValidador.validaEntrada()) {  //Al realizar una alta, necesita estar seleccionado el SPRODUC y el TIPOIMP
                var optionalQueryString = "&SPRODUC=" + document.miForm.SPRODUC.value +"&SIDPRODP="+document.miForm.SIDPRODP.value+"&PMODO=ALTA";
           
                f_abrir_modal('axisadm043', optionalQueryString);
                   
                }
            }
            
            function f_but_edit_detall(sid,nnimpag,cmotivo){
                if (objValidador.validaEntrada()) {  //Al realizar una alta, necesita estar seleccionado el SPRODUC y el TIPOIMP
                var optionalQueryString = "&SPRODUC=" + document.miForm.SPRODUC.value +"&CMOTIVO="+cmotivo+"&SIDPRODP="+sid+"&NIMPAGAD="+nnimpag+"&PMODO=MODIF";
           
                f_abrir_modal('axisadm043', optionalQueryString);
                   
                }
            }
            
            
            /*
            function f_but_edit(sid,tipo){
                if (objValidador.validaEntrada()) {  //Al realizar una alta, necesita estar seleccionado el SPRODUC y el TIPOIMP
                var optionalQueryString = "&SPRODUC=" + document.miForm.SPRODUC.value +"&CTIPOIMP="+tipo+"&SIDPRODP="+sid;
           
                f_abrir_modal('axisadm041', optionalQueryString);
                   
                }
            }*/
            
            
            
            function f_aceptar_axisadm041(){
                f_cerrar_modal('axisadm041');
                objUtiles.ejecutarFormulario("axis_axisadm063.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_aceptar_axisadm043(){
                f_cerrar_modal('axisadm043');
                objUtiles.ejecutarFormulario("axis_axisadm063.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            
            /****************************************************************************************/
            /*********************************** Funciones de carga**********************************/
            /****************************************************************************************/ 
            function f_cargar_productos(thiss){
                    objAjax.invokeAsyncCGI("axis_axisadm063.do", callbackAjaxCargarProductos,
                    "operation=ajax_busqueda_productos&CRAMO=" +thiss, this, objJsMessages.jslit_cargando);
            }      

            /****************************************************************************************/
            /*********************************** Callbacks**********************************/
            /****************************************************************************************/ 
            function callbackAjaxCargarProductos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    var SPRODUCCombo = document.miForm.SPRODUC;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisadm063" c="SNV_COMBO" lit="108341"/> - ', SPRODUCCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                        }
                }
            }   
            
            
            /****************************************************************************************/
            /*********************************** UTILS *****************************************/
            /****************************************************************************************/            
            function f_actualizar_check(thiss){
                thiss.value = thiss.checked ? 1 : 0;
            }
            
            function f_formatdate(entrada,title){
                 var jDate = new JsFecha();
                    if(entrada.value.length>0){
                        entrada.value=jDate.formateaFecha(entrada.value);
                    
                        if(jDate.validaFecha(entrada.value)){
                            entrada.value=jDate.formateaFecha(entrada.value);
                        }else{
                            alert("<axis:alt f="axisadm063" c="VAL_FECHA" lit="1000421"/>");
                            entrada.value = '';
                        }
                    }else{entrada.value = '';}
            }
            /*******************************************
                  Formateo Numeros
             ********************************************/
             function validarNumeros(IMPORTE){
                   if (!objUtiles.estaVacio(IMPORTE)){
                     IMPORT = objValidador.valorFormateadoCampoNumerico(IMPORTE, true, true);
                         if(objNumero.validaNumero(IMPORT, true)) {
                              return this.formateaNumeroCero(IMPORT, true);
                         }else{ return   '';}
                    }else return IMPORTE;
             }
             
              function formateaNumeroCero(entrada, isDecimal){
                // es crida al reformateixador  ###.###,00
                var fnum=objNumero.formateaNumero(entrada,isDecimal);
                if(entrada.indexOf(objNumero.getSeparadorDecimales())<0){
                    fnum += objNumero.getSeparadorDecimales() + '00';
                }
                // si es tracta d'un 0 el converteix a 0,00
                if(fnum=='0') fnum += objNumero.getSeparadorDecimales() + '00';
                return fnum;
    
            }
             
             function f_formatear(thiss){
                thiss.value = objNumero.formateaNumeroMoneda(thiss.value, null);
             }
             
             function f_but_borrar_imp(SIDPRODP){
                objDom.setValorPorId("SIDPRODP",  SIDPRODP);
                 objUtiles.ejecutarFormulario("axis_axisadm063.do", "borrar", document.miForm, "_self", objJsMessages.jslit_cargando);
             }
             
             function f_but_borrar_detalle(sid,nnimpag,cmotivo){
                var optionalQueryString = "?CMOTIVO="+cmotivo+"&NIMPAGAD="+nnimpag;
                objUtiles.ejecutarFormulario("axis_axisadm063.do"+optionalQueryString, "borrar_detalle", document.miForm, "_self", objJsMessages.jslit_cargando);
             }
             
             /***************************************** AJAX ******************************************/
       
            function f_actualizar_agente(){
                 if (objValidador.validaEntrada()) {
                    var CAGENTE =  objDom.getValorPorId("CAGENTE_TEXT");
                    objDom.setValorPorId("CAGENTE",CAGENTE);
                    objDom.setValorPorId("NOMBRE_TEXT", ""); 
                    objAjax.invokeAsyncCGI("axis_axisadm063.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + CAGENTE, this, objJsMessages.jslit_cargando);
                 }
                
            }
            
            function callbackAjaxCargarAgente(ajaxResponseText){
                
                var doc=objAjax.domParse(ajaxResponseText);
                
                var elementos = doc.getElementsByTagName("element");
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                        objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado); 
                        objDom.setValorPorId("CAGENTE", CAGENTEformateado); 
                        objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado); 
                    }else{
                        
                        objDom.setValorPorId("NOMBRE_TEXT",""); 
                        objDom.setValorPorId("CAGENTE_TEXT","");
                        //objDom.setValorPorId("CAGENTE","");
                    }
                }
            }
            
            
            function callbackAjaxCambiarAgente(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado);
                objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);
                    }
            }
           /****************************** MODAL *************************************/ 
            function f_abrir_axisctr014() {
                objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
            }
            
            function f_cerrar_axisctr014() {
                objUtiles.cerrarModal("axisctr014")
            }    
            function f_aceptar_axisctr014 (CAGENTE){
                objDom.setValorPorId("CAGENTE", CAGENTE);
                f_cerrar_axisctr014();
                objAjax.invokeAsyncCGI("axis_axisadm063.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            }
             

        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
   
    
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisadm063" c="TIT_AXISADM041" lit="9900933" /></c:param>
            <c:param name="nid" value="axisadm041" />
    </c:import>
    
     <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisadm063" c="TIT_AXISADM063" lit="9900934" /></c:param>
            <c:param name="nid" value="axisadm043" />
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt c="titulo14" f="axisfis002" lit="1000234" /></c:param>
        <c:param name="nid" value="axisctr014" />
    </c:import>

    <form name="miForm" action="" method="POST">
       <input type="hidden" id="operation" name="operation" value=""/>
       <input type="hidden" name="SIDPRODP" id="SIDPRODP" value="${__formdata.SIDPRODP}"/>
       <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}" id="CAGENTE">
        
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="lit_form" f="axisadm063" lit="1000325"/></c:param>
                <c:param name="form">axisadm063</c:param>
            </c:import>
            <div class="separador">&nbsp;</div>
     <!-- Area de campos  -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm063" c="FILTRO" lit="1000178" /></div>
            <!--campos-->
             <table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center">
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%; height:0px"></th>
                                <th style="width:20%; height:0px"></th>
                            </tr>
                            
                            <%-- AGENTE --%>
                            <tr>
                                <axis:ocultar f="axisadm063" c="CAGENTE" dejarHueco="false"> <!-- TODO C -->
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisadm063" c="CAGENTE" lit="100584"></axis:alt></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisadm063" c="CAGENTE"  dejarHueco="false" > 
                                    <td class="campocaja" colspan="3">
                                        <input type="text" name="CAGENTE_TEXT" id="CAGENTE_TEXT" value="${__formdata.CAGENTE_TEXT}" class="campowidthinput campo campotexto" style="width:20%"
                                         title="<axis:alt  c="CAGENTE" f="axisadm063" lit="100584"/>" 
                                        <axis:atr f="axisadm063" c="CAGENTE" a="modificable=true&obligatorio=true"/> onchange="f_actualizar_agente()" />
                                        <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                        <input readonly="true" type="text" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${__formdata.NOMBRE_TEXT}"  style="width:70%" class="campowidthinput campo campotexto"/>
                                    </td>                                    
                                </axis:ocultar>
                            </tr>
                            
                            <tr>
                                <axis:ocultar f="axisadm063" c="CRAMO" dejarHueco="false"> <!-- TODO C -->
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisadm063" c="CRAMO" lit="100784"></axis:alt></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisadm063" c="SPRODUC" dejarHueco="false">
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axisadm063" c="SPRODUC" lit="100829" /></b>
                                    </td>
                                </axis:ocultar>
                                 <axis:visible f="axisadm063" c="CTIPOIMP">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisadm063" c="CTIPOIMP" lit="102302" /></b>
                                    </td>
                                 </axis:visible>	  
                             </tr>

                    
                             <tr>
                                 <axis:ocultar f="axisadm063" c="CRAMO" dejarHueco="false">
                                    <td class="campocaja">
                                        <select name = "CRAMO" id="CRAMO" style="width:200px;" title="<axis:alt f="axisadm063" c="CRAMO" lit="100784" />" size="1" onchange="f_cargar_productos(this.value)" class="campowidthselect campo">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm063" c="SNV_COMBO" lit="108341"/> - </option>
                                            <c:forEach var="ramos" items="${listaRamos}">
                                                <option value = "${ramos.CRAMO}"
                                                    <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>
                                                    ${ramos.TRAMO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>      
                                <axis:ocultar f="axisadm063" c="SPRODUC" dejarHueco="false">
                                <td class="campocaja" colspan="2">
                                    <select name = "SPRODUC" id ="SPRODUC" size="1" class="campowidthselect campo campotexto" title="<axis:alt f="axisadm063" c="SPRODUC" lit="100829" />"
                                     <axis:atr f="axisadm063" c="SPRODUC" a="modificable=true&obligatorio=true&isInputText=false"/>  >
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm063" c="SNV_COMBO" lit="108341" /> - </option>
                                        <c:forEach items="${__formdata.productos}" var="item">
                                            <option value = "${item.SPRODUC}" <c:if test="${__formdata['SPRODUC']==item.SPRODUC}">selected</c:if> >${item.TTITULO}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                 <axis:ocultar f="axisadm063" c="CTIPOIMP">
                                             <td class="campocaja">
                                                        <select name = "CTIPOIMP" id ="CTIPOIMP" size="1" title="<axis:alt f="axisadm063" c="CTIPOIMP" lit="102302" />" <axis:atr f="axisadm063" c="CTIPOIMP" a="modificable=true&isInputText=false&obligatorio=false"/>
                                                            title="<axis:alt f="axisadm063" c="SNV_COMBO" lit="108341" />"
                                                            class="campowidthselect campo campotexto">&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm063" c="SNV_COMBO" lit="108341"/> - </option> 
                                                            <c:forEach items="${__formdata.listValores.lsttipos}" var="tip">
                                                                <option value = "${tip.CATRIBU}" <c:if test="${tip.CATRIBU  == __formdata.CTIPOIMP}">selected</c:if>>${tip.TATRIBU}</option>
                                                            </c:forEach>
                                                        </select>
                                             </td>  
                                        </axis:ocultar>
                                <axis:ocultar f="axisadm063" c="BT_BUSCAR">
                                        <td class="campocaja" align="center" colspan="2">
                                            <input type="button" onclick="f_but_buscar()" class="boton" value="<axis:alt f="axisadm063" c="BUT_BUSCAR" lit="100797"/>"/>
                                        </td>
                                </axis:ocultar>
                             </tr>
                            </table>
                            <div class="separador">&nbsp;</div>
                        </td>
                    </tr>
            </table>
            
             <c:if test="${!empty __formdata.SPRODUC || !empty __formdata.CAGENTE}">     
              
            <div class="separador">&nbsp;</div>
            <div class="titulo">
            <div style="float:right;">
                                <a href="javascript:f_but_nou()">
                                  <img border="0"
                                       alt='<axis:alt f="axisadm063" c="BT_NUEVO" lit="1000428"/>'
                                       title='<axis:alt f="axisadm063" c="BT_NUEVO" lit="1000428"/>'
                                       src="images/new.gif"/>
                                </a>
                              </div>
           <img src="images/flecha.gif"/><axis:alt f="axisadm063" c="RESULTADO" lit="1000325"/></div>
            
                <table class="seccion" align="center">

                
                    <tr>
                        <td>
                        
                        <table class="area" align="center"> 
                         <tr>
                                <th style="width:40%;height:0px"></th>
                                <th style="width:30%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                            </tr>
                        <tr>
                            <td class="campocaja" colspan="2" >

                                       
                            <c:set var="title0"><axis:alt f="axisadm063" c="FINIEFE" lit="100890"/></c:set>
                            <c:set var="title1"><axis:alt f="axisadm063" c="FFINEFE" lit="9001159" /></c:set>
                            <c:set var="title2"><axis:alt f="axisadm063" c="TIPONUMIMPAGA" lit="9900932" /></c:set>
                            <c:set var="title3"><axis:alt f="axisadm063" c="TTIPOIMP" lit="102302" /></c:set>

                            <div class="separador">&nbsp;</div>
                            <div class="displayspaceProductos">
                                <display:table name="${__formdata.llistaImp}" id="miListaId" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                 requestURI="axis_axisadm063.do?ordenar=true">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column headerClass="headwidth5 sortable" style="width:5%;" title=" " media="html" autolink="false" sortable="false">
                                    <div class="dspIcons">
                                    <input <c:if test="${!empty __formdata.SIDPRODP &&  miListaId.SIDPRODP == __formdata.SIDPRODP}">checked</c:if> onclick="f_buscar_detalle('${miListaId.SIDPRODP}')" 
                                        value="${miListaId['SIDPRODP']}" type="radio" id="radioSIDPRODP" name="radioSIDPRODP"/></div>
                                </display:column>
                                <display:column title="${title0}"  style="width:15%;" sortable="false" sortProperty="" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FINIEFE}"/></div>
                                </display:column>
                                <display:column title="${title1}" style="width:15%;" sortable="false" sortProperty="" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FFINEFE}"/></div>
                                
                                </display:column>
                                 <display:column title="${title2}" style="width:25%;" sortable="false" sortProperty="" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">${miListaId.TIPONUMIMPAGA}</div>
                                </display:column>
                                <display:column title="${title3}" style="width:25%;" sortable="false" sortProperty="" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">${miListaId.TTIPOIMP}</div>
                                </display:column>
                                
                                <%--
                                <display:column title="" style="width:7%;" sortable="false" sortProperty="" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspIcons">
                                         <c:if test="${empty miListaId.FFINEFE}">
                                         <a href="javascript:f_but_edit('${miListaId['SIDPRODP']}','${miListaId.CTIPOIMP}')">
                                          <img border="0"
                                               alt='<axis:alt f="axisadm063" c="EDIT" lit="9901356"/>'
                                               title='<axis:alt f="axisadm063" c="EDIT" lit="9901356"/>'
                                               src="images/lapiz.gif"/>
                                        </a>
                                        </c:if>
                                    </div>
                                </display:column>
                                --%>
                                <display:column title="" style="width:7%;" sortable="false" sortProperty="" headerClass="sortable"  media="html" autolink="false" >
                                      <div class="dspIcons"> 
                                            <c:if test="${empty miListaId.FFINEFE}">
                                                 <a href="javascript:f_but_borrar_imp('${miListaId['SIDPRODP']}')">
                                                  <img border="0"
                                                       alt='<axis:alt f="axisadm063" c="BORRAR" lit="9001333"/>'
                                                       title='<axis:alt f="axisadm063" c="BORRAR" lit="9001333"/>'
                                                       src="images/delete.gif"/>
                                                </a>
                                            </c:if>
                                    </div>
                                </display:column>
                                
                                </display:table>
                            </div>
                            <div class="separador">&nbsp;</div>
                            </td>
                            </tr>
                       
                            <tr>
                             <td class="campocaja" colspan="4"> 
                            
                            <c:if test="${!empty __formdata.SIDPRODP}">
                              <div style="float:right;">
                                <a href="javascript:f_but_nou_detall()">
                                  <img border="0"
                                       alt='<axis:alt f="axisadm063" c="NOU_DETALL" lit="1000428"/>'
                                       title='<axis:alt f="axisadm063" c="NOU_DETALL" lit="1000428"/>'
                                       src="images/new.gif"/>
                                </a>
                              </div>
                            </c:if>  
                            <c:set var="title0"><axis:alt f="axisadm063" c="NIMPAGAD" lit="9901852"/></c:set>
                            <c:set var="title1"><axis:alt f="axisadm063" c="TMOTIVO" lit="9001626" /></c:set>
                            <c:set var="title2"><axis:alt f="axisadm063" c="TDIAAVIS" lit="9901853" /></c:set>
                            <c:set var="title3"><axis:alt f="axisadm063" c="NDIAAVIS" lit="9901854" /></c:set>
                            <c:set var="title4"><axis:alt f="axisadm063" c="TMODELOIMM" lit="9901855" /></c:set>
                            <c:set var="title5"><axis:alt f="axisadm063" c="TACTIMM" lit="9900960" /></c:set>
                            <c:set var="title6"><axis:alt f="axisadm063" c="TMODELO" lit="9001640" /></c:set>
                            <c:set var="title7"><axis:alt f="axisadm063" c="TACTIMP" lit="9000844" /></c:set>
                            
                            <div class="separador">&nbsp;</div>
                            <div class="displayspaceProductos">
                            
                                <display:table name="${__formdata.llista}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                 requestURI="axis_axisadm063.do?ordenar=true">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="${title0}" sortable="false" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">${miListaId.NIMPAGAD}</div>
                                </display:column>
                                <display:column title="${title1}" sortable="false" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">${miListaId.TMOTIVO}</div>
                                </display:column>
                                 <display:column title="${title2}" sortable="false" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">${miListaId.TDIAAVIS}</div>
                                </display:column>
                                <display:column title="${title3}" sortable="false" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">${miListaId.NDIAAVIS}</div>
                                </display:column>
                                <display:column title="${title4}" sortable="false" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">${miListaId.TMODELOIMM}</div>
                                </display:column>
                                <display:column title="${title5}" sortable="false" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">${miListaId.TACTIMM}</div>
                                </display:column>
                                <display:column title="${title6}" sortable="false" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">${miListaId.TMODELO}</div>
                                </display:column>
                                <display:column title="${title7}" sortable="false" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">${miListaId.TACTIMP}</div>
                                </display:column>
                                <display:column title="" style="width:5%;" sortable="false" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                    <div class="dspIcons">
                                        
                                         <a href="javascript:f_but_edit_detall('${__formdata.SIDPRODP}','${miListaId.NIMPAGAD}','${miListaId.CMOTIVO}')">
                                          <img border="0"
                                               alt='<axis:alt f="axisadm063" c="EDIT" lit="9901356"/>'
                                               title='<axis:alt f="axisadm063" c="EDIT" lit="9901356"/>'
                                               src="images/lapiz.gif"/>
                                        </a>
                                       
                                    </div>
                                </display:column>
                                
                                <display:column title="" style="width:5%;" sortable="false" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                      <div class="dspIcons"> 
                                                 <a href="javascript:f_but_borrar_detalle('${__formdata.SIDPRODP}','${miListaId.NIMPAGAD}','${miListaId.CMOTIVO}')">
                                                  <img border="0"
                                                       alt='<axis:alt f="axisadm063" c="BORRAR" lit="9001333"/>'
                                                       title='<axis:alt f="axisadm063" c="BORRAR" lit="9001333"/>'
                                                       src="images/delete.gif"/>
                                                </a>
                                      
                                    </div>
                                </display:column>
                                
                                </display:table>
                            </div>
                            <div class="separador">&nbsp;</div>
                            </td>
                            
                            </tr>
                            </table>
         
            </c:if>
            
            </td>
        </tr>
        
    </table>
    
        
             <div class="separador">&nbsp;</div>
    </form>
  
  </table>
    

<c:import url="../include/botonera_nt.jsp">
   <c:param name="f">axisadm063</c:param>
   <c:param name="__botones"><axis:ocultar f="axisadm063" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar></c:param>
</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>


