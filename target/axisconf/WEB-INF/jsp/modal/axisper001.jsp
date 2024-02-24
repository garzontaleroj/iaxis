<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%/*
*  Fichero: axisper001.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavi Gallego</a> 
*  
*  	El usuario pude buscar por documento, nombre o bien por identificador externo 
*       este último será visible según indicación de la función PAC_IAX_COMMON.F_PermitirSIP. 
*       Al pulsar buscar se buscan los datos en la bbdd, mediante la función PAC_IAX_LISTVALORES.F_Get_Personas
*       con los parámetros documento, nombre o sip el cual devolverá un ref cursor con los datos a mostrar. 
*       En función del resultado de la búsqueda tendremos tres situaciones:
*           No hay datos: pantalla emergente que indica el hecho y pregunta si desea dar de alta 
*                la persona (parametrizable en función de PAC_IAX_COMMON.F_PermitirNuevaPersona):
*	            Aceptar => ir al alta de personas iniciando el proceso de alta. 
*                        Una vez introducidos los datos de la persona y al volver a la pantalla de datos tomadores
*                        se han de rellenar los campos de forma automática con los datos de la persona introducida.
*	            Cancelar => volver a pantalla de búsqueda de personas.
*           Hay más de un posible resultado: en el multirregistro inferior se muestra registros encontrados. 
*                Seleccionando el resultado buscado y pulsando sobre aceptar o con doble click 
*                accedemos a la pantalla de datos tomadores. 
*	    Solo hay un registro que cumple con los datos de la búsqueda. En este caso se accede directamente a la pantalla de datos tomadores.
*
*	En el caso en que se tenga de dar de alta la nueva persona o se seleccione de la lista una vez escogida
*        (con doble click o botón aceptar) se debe llamar,
*	    Para la pantalla de Tomadores a PAC_IAX_PRODUCCION.InsertTomadores y como parámetro el sperson, 
*                y un parámetro de salida con los posibles mensajes de error y como retorno un 1 
*                indicando que habido error y 0 todo correcto, para guardar los datos en el objeto persistente.
*	    Para la pantalla de Asegurados a PAC_IAX_PRODUCCION.InsertAsegurado y como parámetro el sperson,
*                y un parámetro de salida con los posibles mensajes de error y como retorno un 1
*                indicando que habido error y 0 todo correcto, para guardar los datos en el objeto persistente.
*
*	El botón cancelar cierra la ventana actual.
*
*
*  Fecha: 16/10/2007
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>



<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
       <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
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

        function f_onload() {
             
            f_cargar_propiedades_pantalla(); 
        	  try{
                document.miForm.NOMBRE.focus();} 
              catch (e){  
                try{
                    document.miForm.NOMBRECOMP.focus();}
                catch (e){
                    try{
                        document.miForm.NNUMNIF.focus();}
                    catch(e){
                            document.miForm.but_buscar.focus();}
                    }        
              }
            
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
            <% if (request.getParameter("faceptar") != null) 
                // Esto sólo se ejecuta la primera vez que abrimos la pantalla
                // Ponemos faceptar en session
                  session.setAttribute("faceptar", request.getParameter("faceptar"));
            %>
            <% // Bug 36596 IGIL ini
               if (request.getParameter("HOSPITAL") != null){
                     session.setAttribute("HOSPITAL", request.getParameter("HOSPITAL"));
               }else{
                     session.setAttribute("HOSPITAL", null);
               }
                  // Bug 36596 IGIL fin
            %>           
            var SPERSON_OUT = "${requestScope.SPERSON_OUT}";
            if (!objUtiles.estaVacio(SPERSON_OUT)) {
                // A continuación, código para ACEPTAR la persona, si se ha insertado correctamente a EST
                <% if (session.getAttribute("faceptar") != null) { %>
                    parent.<%=(String) session.getAttribute("faceptar")%>(SPERSON_OUT);
                <%} else { %>
                    parent.f_aceptar_axisper001 (SPERSON_OUT);
                <% } %>
            }
            var PMENSAPOPUP = "${requestScope.PMENSAPOPUP}";
            if (!objUtiles.estaVacio(PMENSAPOPUP)) {
            
            parent.f_aceptar_axisper016 (PMENSAPOPUP);
            }            
        }
                
        function f_but_aceptar() {
            if(objUtiles.estaVacio(document.miForm.seleccionaPersona))
                alert(objJsMessages.jslit_busca_primero);
            else{
                var hayChecked = objUtiles.f_GuardaCasillasChecked ("seleccionaPersona");

                if(typeof hayChecked == 'boolean') 
                    alert(objJsMessages.jslit_selecciona_de_lista);
                else {
                    seleccionarLista(objUtiles.utilSplit(hayChecked, "/")[0], objUtiles.utilSplit(hayChecked, "/")[1],objUtiles.utilSplit(hayChecked, "/")[2]);
                }
            }
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axisper001();
        }        
        
        function f_but_buscar() {
            //Si la validación es correcta (true), ejecutamos la acción
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisper001.do","busqueda_persona",document.miForm, "_self", objJsMessages.jslit_buscando_personas);   
            }
        }
        
        function f_but_9000509() {
         //Si la validación es correcta (true), ejecutamos la acción
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisper001.do","busqueda_persona_host",document.miForm, "_self", objJsMessages.jslit_buscando_personas);   
            }
        }
        
        function f_but_9000580() {
         //Si la validación es correcta (true), ejecutamos la acción
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisper001.do?MASDATOS="+1,"busqueda_persona_host",document.miForm, "_self", objJsMessages.jslit_buscando_personas);   
            }
        }
        
        
        function seleccionarLista (SPERSON, CODITABLAS,SNIP) {
            if (objUtiles.estaVacio(SPERSON) && objUtiles.estaVacio(SNIP))
                alert (objJsMessages.jslit_error_de_seleccion);
            else{
                objDom.setValorPorId ("SPERSON", SPERSON);
                objDom.setValorPorId ("CODITABLAS", CODITABLAS);
                objDom.setValorPorId ("SNIP", SNIP);
                objUtiles.ejecutarFormulario("modal_axisper001.do","traspaso_persona",document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
         }
         
        /****************************************************************************************/
        /************************************* MODAL ********************************************/
        /****************************************************************************************/
    
        function f_but_nueva_persona() {
            parent.f_abrir_axisper005('<%=(String) session.getAttribute("faceptar")%>', true);
            parent.f_cerrar_axisper001();
        }
        
        
        /****************************************************************************************/
        /*********************************** MODAL AXISPER005 ***********************************/
        /****************************************************************************************/
        
        function f_but_9000552() {         
                 
            if(objUtiles.estaVacio(document.miForm.seleccionaPersona)) {
                alert(objJsMessages.jslit_busca_primero);
            } else {
                var hayChecked = objUtiles.f_GuardaCasillasChecked ("seleccionaPersona");

                if(typeof hayChecked == 'boolean') 
                    alert(objJsMessages.jslit_selecciona_de_lista);
                else {
                    //seleccionarLista(objUtiles.utilSplit(hayChecked, "/")[0], objUtiles.utilSplit(hayChecked, "/")[1],objUtiles.utilSplit(hayChecked, "/")[2]);
                    var SPERSON    = objUtiles.utilSplit(hayChecked, "/")[0];
                    var CODITABLAS = objUtiles.utilSplit(hayChecked, "/")[1];
                    var SNIP       = objUtiles.utilSplit(hayChecked, "/")[2];
                    
                    if (objUtiles.estaVacio(SPERSON) && objUtiles.estaVacio(SNIP))
                        alert (objJsMessages.jslit_error_de_seleccion);
                    else {
                        objDom.setValorPorId ("SPERSON", SPERSON);
                        objDom.setValorPorId ("CODITABLAS", CODITABLAS);
                        objDom.setValorPorId ("SNIP", SNIP);
                        
                        var faceptar = "f_aceptar_tomadores_axisper005";
                                                
                        objUtiles.abrirModal("axisper005", "src", "modal_axisper005.do?operation=traspaso_persona&faceptar=" + faceptar + "&SPERSON=" + SPERSON + "&CODITABLAS=" + CODITABLAS + "&SNIP=''");                        
                    }
                }
            }
        }
        
        function f_cerrar_axisper005(faceptar) {
            objUtiles.cerrarModal("axisper005");        
        }
        
        
     function f_aceptar_axisper005 (faceptar, SPERSON) {
        		objUtiles.cerrarModal("axisper005");      
        		f_but_buscar();
		        //parent.f_aceptar_axisper005 (faceptar, SPERSON);
		    }
    
    </script>
  </head>
    <body class=" " onload="f_onload()" >
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="SPERSON" id="SPERSON" value="" />
            <input type="hidden" name="CODITABLAS" id="CODITABLAS" value="" />
            <input type="hidden" name="SNIP" id="SNIP" value="" />
            <input type="hidden" name="ORIGEN" id="ORIGEN" value="${__formdata.ORIGEN}" />
			<input type="hidden" name="HOSPITAL" id="HOSPITAL" value="${__formdata.HOSPITAL}" />
			<input type="hidden" name="FIDEICO" id="FIDEICO" value="${__formdata. FIDEICO}" />
			
			<% // 
               if (request.getParameter("FIDEICO") != null){
                     session.setAttribute("FIDEICO", request.getParameter("FIDEICO"));
               }else{
                     session.setAttribute("FIDEICO", null);
               }
                  // 
            %> 
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><b id="label_TITULO_L"><axis:alt c="label_TITULO_L" f="axisper001" lit="1000065"/></b></c:param>
                <c:param name="producto"><b id="label_TITULO_R"><axis:alt c="label_TITULO_R" f="axisper001" lit="1000065"/></b></c:param>
                <c:param name="form">axisper001</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt c="label_MODIFICAR" f="axisper001" lit="1000295" /></c:param>
                <c:param name="nid">axisper005</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                        </tr>
                                        <tr>
                                       <axis:ocultar f="axisper001" c="CTIPIDE" dejarHueco="false"> 
                                              <td class="titulocaja" colspan = "2">
                                                  <b><axis:alt f="axisper001" c="CTIPIDE" lit="109774"/></b>
                                              </td>
                                        </axis:ocultar>

                                       <axis:ocultar f="axisper001" c="NNUMNIF" dejarHueco="false"> 
                                              <td class="titulocaja">
                                                  <b><axis:alt f="axisper001" c="NNUMNIF" lit="9000760"></axis:alt></b>
                                              </td>
                                        </axis:ocultar>
					
                                        <axis:visible f="axisper001" c="NOMBRECOMP">
                                        <td class="titulocaja" colspan="2">
                                                  <b><axis:alt f="axisper001" c="NOMBRECOMP" lit="105940"></axis:alt></b>
                                        </td>
                                        </axis:visible>
                                        

                                        <axis:ocultar f="axisper001" c="SNIP" dejarHueco="false"> 
                                              <td class="titulocaja">
                                                  <b><axis:alt f="axisper001" c="SNIP" lit="1000088"></axis:alt></b>
                                              </td>
                                        </axis:ocultar>
                                        </tr>
                                        <tr>
                                       <axis:visible f="axisper001" c="CTIPIDE" > 
                                              <td class="campocaja" colspan = "2" >
                                                <select name="CTIPIDE" id="CTIPIDE" size="1" class="campowidthselect campo campotexto_ob"
                                                    <axis:visible f="axisper001" c="BT_BUSCAR"> onkeypress="if (event.keyCode==13)  { f_but_buscar() }"</axis:visible>>&nbsp;
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper001" c="SELECC" lit="1000348"/> - </option>
                                                    <c:forEach var="element" items="${__formdata.listValores.tipDocum}">
                                                        <option value = "${element.CATRIBU}" 
                                                            <c:if test="${element.CATRIBU == __formdata.CTIPIDE}"> selected </c:if> />
                                                            ${element.TATRIBU} 
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                              </td>
                                        </axis:visible>
                                        
                                        <axis:visible f="axisper001" c="NNUMNIF" >
										      <%-- BUG 20089 - 11/12/2012 - JLTS - Campos no Obligatorios--%>
                                              <td class="campocaja">
                                                  <input type="text" class="campo campotexto" value="${__formdata['NNUMNIF']}" name="NNUMNIF" id="NNUMNIF" size="15"
                                                    <axis:visible f="axisper001" c="BT_BUSCAR"> onkeypress="if (event.keyCode==13)  { f_but_buscar() }"</axis:visible> />
                                              </td>
                                        </axis:visible>
                                        <axis:visible f="axisper001" c="NOMBRECOMP">
										      <%-- BUG 20089 - 11/12/2012 - JLTS - Campos no Obligatorios--%>
                                        <td class="campocaja" colspan="2">
                                                  <input type="text" class="campo campotexto" value="${__formdata['NOMBRECOMP']}" name="NOMBRECOMP" id="NOMBRECOMP" size="15"
                                                    <axis:visible f="axisper001" c="BT_BUSCAR"> onkeypress="if (event.keyCode==13)  { f_but_buscar() }"</axis:visible> />
                                         </td>
                                        </axis:visible>
                                        
                                        <axis:visible f="axisper001" c="SNIP" >
                                               <td class="campocaja">
                                                  <input type="text" class="campo campotexto_ob" value="${__formdata['NSIP']}" name="NSIP" id="NSIP" size="15" title="<axis:alt f="axisper001" c="SNIP" lit="1000088"/>"
                                                  alt="<axis:alt f="axisper001" c="SNIP" lit="1000088"/>"
                                                  <axis:visible f="axisper001" c="BT_BUSCAR"> onkeypress="if (event.keyCode==13)  { f_but_buscar() }"</axis:visible>
                                                  <axis:atr f="axisper001" c="NSIP"  a="modificable=true" />/> <!-- TODO Title -->
                                              </td>
                                        </axis:visible>
                                        </tr>
                                        <tr>
                                        <axis:visible f="axisper001" c="NOMBRE">
                                        <td class="titulocaja" colspan="2">
                                                  <b><axis:alt f="axisper001" c="NOMBRE" lit="105940" /></b>
                                        </td>
                                        </axis:visible>      
                                        
                                        <axis:ocultar f="axisper001" c="TAPELLI1" dejarHueco="false">
                                        <td class="titulocaja" colspan="2">
                                                  <b><axis:alt f="axisper001" c="TAPELLI1" lit="108243" /></b>
                                              </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisper001" c="TAPELLI2" dejarHueco="false">
                                        <td class="titulocaja" colspan="2">
                                                  <b><axis:alt f="axisper001" c="TAPELLI2" lit="108246" /></b>
                                        </td>
                                        </axis:ocultar>
                                        </tr>
                                        <tr>
                                       
                                     <axis:visible f="axisper001" c="NOMBRE">
                                        <td class="campocaja" colspan="2">
                                                  <input type="text" class="campo campotexto_ob" value="${__formdata['NOMBRE']}" name="NOMBRE" id="NOMBRE" size="15"
                                                    <axis:visible f="axisper001" c="BT_BUSCAR"> onkeypress="if (event.keyCode==13)  { f_but_buscar() }"</axis:visible> />
                                              </td>
                                        </axis:visible>                                        	
                                        <axis:ocultar f="axisper001" c="TAPELLI1" dejarHueco="false">
                                        <td class="campocaja" colspan="2">
                                                  <input type="text" class="campo campotexto_ob" value="${__formdata['TAPELLI1']}" name="TAPELLI1" id="TAPELLI1" size="15"
                                                    <axis:visible f="axisper001" c="BT_BUSCAR"> onkeypress="if (event.keyCode==13)  { f_but_buscar() }"</axis:visible> />
                                              </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisper001" c="TAPELLI2" dejarHueco="false">
                                        <td class="campocaja" colspan="2">
                                                  <input type="text" class="campo campotexto_ob" value="${__formdata['TAPELLI2']}" name="TAPELLI2" id="TAPELLI2" size="15"
                                                    <axis:visible f="axisper001" c="BT_BUSCAR"> onkeypress="if (event.keyCode==13)  { f_but_buscar() }"</axis:visible> />
                                                 
                                              </td>   
                                        </axis:ocultar>
                                        </tr>
                                        
                                        <tr>
                                        <axis:visible f="axisper001" c="FNACIMI">
                                        <td class="titulocaja">
                                                  <b><axis:alt c="FNACIMI" f="axisper001" lit="1000064"/></b>
                                        </td>
                                        </axis:visible>      
                                           <axis:ocultar f="axisper001" c="CPOSTAL" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt c="CPOSTAL" f="axisper001" lit="100823"/></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisper001" c="TDOMICI" dejarHueco="false">
                                        <td class="titulocaja" colspan="2">
                                                  <b><axis:alt c="TDOMICI" f="axisper001" lit="110029"/></b>
                                              </td>
                                        </axis:ocultar>
                                     
                                        </tr>
                                        <tr>
                                       
                                     <axis:visible f="axisper001" c="FNACIMI">
                                        <td class="campocaja">
                                          <input type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FNACIMI}"/>" name="FNACIMI" id="FNACIMI"  style="width:85%;"
                                          <axis:atr f="axisper001" c="FNACIMI" a="modificable=true&formato=fecha&obligatorio=false"/> title="<axis:alt f="axisper001" c="TFNACIMI" lit="100959"/>"
                                          <axis:visible f="axisper001" c="BT_BUSCAR"> onkeypress="if (event.keyCode==13)  { f_but_buscar() }"</axis:visible>/> 
                                          <a id="icon_FNACIMI" style="vertical-align:middle;" href="#"><img id="popup_calendario_FNACIMI" border="0" alt="<axis:alt f="axisper001" c="NACIMI" lit="108341"/>" title="<axis:alt f="axisper001" c="TFNACIMI" lit="100959" />" src="images/calendar.gif"/></a>
                                         </td>
                                     </axis:visible>                                        	
                                        
                                        <axis:ocultar f="axisper001" c="CPOSTAL" dejarHueco="false">
                                        <td class="campocaja">
                                            <input type="text" class="campo campotexto" value="${__formdata['CPOSTAL']}" name="CPOSTAL" id="CPOSTAL" size="15"
                                            style="text-transform:uppercase;" 
                                            <axis:visible f="axisper001" c="BT_BUSCAR"> onkeypress="if (event.keyCode==13)  { f_but_buscar() }"</axis:visible> />
                                        </td>   
                                        </axis:ocultar>
                                        
                                        <axis:ocultar f="axisper001" c="TDOMICI" dejarHueco="false">
                                        <td class="campocaja" colspan="2">
                                                  <input type="text" class="campo campotexto" value="${__formdata['TDOMICI']}" name="TDOMICI" id="TDOMICI" size="15"
                                                  <axis:visible f="axisper001" c="BT_BUSCAR"> onkeypress="if (event.keyCode==13)  { f_but_buscar() }"</axis:visible> />
                                              </td>
                                        </axis:ocultar>
                                        </tr>                                        


                                        
                                    </table>
                                </td>
                            </tr>
                        </table>

                        <div class="separador">&nbsp;</div>
                            <!-- DisplayTag ListaPersonas -->
                            <c:set var="title1"><axis:alt f="axisper001" c="CNNUMNIF" lit="105330"/></c:set>
                            <c:set var="title2"><axis:alt f="axisper001" c="NOMBRE" lit="105940"/></c:set>
                            <c:set var="title3"><axis:alt c="FNACIMI" f="axisper001" lit="1000064"/></c:set>
                            <c:set var="title4"><axis:alt c="TDOMICI" f="axisper001" lit="110029"/></c:set>
                            <c:set var="title5"><axis:alt c="CPOSTAL" f="axisper001" lit="100823"/></c:set>
                           
                            <div class="seccion displayspacePersonas">
                                <display:table name="${sessionScope.axisper001_listaPersonas}" id="miListaId" export="false" class="dsptgtable" pagesize="15" defaultsort="1" defaultorder="ascending" requestURI="modal_axisper001.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    
                                    <display:column title=" " sortable="false" headerClass="headwidth5 sortable" style="width:5%;"  media="html" autolink="false" >    
                                        <div class="dspIcons"><input <c:if test="${miListaId['seleccionaPersona']}">checked</c:if> type="radio" id="seleccionaPersona" name="seleccionaPersona" value="${miListaId['CODI']}/${miListaId['CODITABLAS']}/${miListaId['SNIP']}"/></div>
                                    </display:column>
                                    <display:column title="${title1}" sortable="true" style="width:10%;" sortProperty="NNUMNIF" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                        <div class="dspNumber">${miListaId['NNUMNIF']}</div>
                                    </display:column>
                                    <display:column title="${title2}" sortable="true" style="width:40%;" sortProperty="NOMBRE" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:seleccionarLista('${miListaId['CODI']}', '${miListaId['CODITABLAS']}','${miListaId['SNIP']}')">${miListaId['NOMBRE']}</a></div>
                                    </display:column>
                                    <axis:visible f="axisper001" c="FNACIMI">
                                    <display:column title="${title3}" sortable="true" style="width:15%;" sortProperty="FNACIMI" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:seleccionarLista('${miListaId['CODI']}', '${miListaId['CODITABLAS']}','${miListaId['SNIP']}')">${miListaId['FNACIMI']}</a></div>
                                    </display:column>
                                    </axis:visible>

                                     <axis:visible f="axisper001" c="CPOSTAL">
                                    <display:column title="${title5}" sortable="true" style="width:10%;" sortProperty="CPOSTAL" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:seleccionarLista('${miListaId['CODI']}', '${miListaId['CODITABLAS']}','${miListaId['SNIP']}')">${miListaId['CPOSTAL']}</a></div>
                                    </display:column>    
                                    </axis:visible>
                                    <axis:visible f="axisper001" c="TDOMICI">
                                    <display:column title="${title4}" sortable="true" style="width:20%;" sortProperty="TDOMICI" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:seleccionarLista('${miListaId['CODI']}', '${miListaId['CODITABLAS']}','${miListaId['SNIP']}')">${miListaId['TDOMICI']}</a></div>
                                    </display:column>
                                    </axis:visible>                                    
                                    <axis:visible f="axisper001" c="BT_MASDATOSHOST">
                                    <c:if test="${!empty sessionScope.existMasInfo && sessionScope.existMasInfo !=0}"> 
                                    <display:footer><!--Boton más datos-->
                                        <tr>
                                            <td colspan="2" align="left" style="font-size: 10px;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><a onclick="javascript:f_but_9000580()" /><axis:alt f="axisper001" c="but_9000580" lit="9000809" /></a></b></td>
                                            <td align="left">&nbsp; </td>
                                        </tr>
                                    </display:footer>
                                   </c:if>
                                    </axis:visible>
                                 </display:table>
                        
                                <c:choose>
                                <c:when test="${!empty sessionScope.axisper001_listaPersonas}">
                                    <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                        <script language="javascript">objUtiles.retocarDsptagtable("miListaId");</script>
                                    </c:if>
                                </c:when>
                                <c:otherwise>
                                    <script language="javascript">
                                       objLista.esconderListaSpans();
                                       objLista.esconderListaLinks();     
                                    </script>
                                </c:otherwise>
                                </c:choose>
                            </div>	
                            
                    </td>
                </tr>
            </table>						
            
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisper001</c:param>
				<c:param name="__botones">cancelar<axis:visible f="axisper001" c="BT_BUSCAR">,buscar</axis:visible><axis:visible f="axisper001" c="BT_BUSCARHOST"><c:if test="${__formdata.HOSPITAL != 'HPL'}">,9000509</c:if></axis:visible><axis:visible f="axisper001" c="BT_NUEVA_PERSONA"><c:if test="${__formdata.HOSPITAL != 'HPL'}">,nueva_persona</c:if></axis:visible>,aceptar<axis:visible f="axisper001" c="BT_MODIFICAR"><c:if test="${__formdata.HOSPITAL != 'HPL'}">,9000552</c:if></axis:visible></c:param>
            </c:import>
        </form>
        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FNACIMI",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FNACIMI", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>
    <c:import url="../include/mensajes.jsp" />
    </body>
     <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
      <script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('axisper001');
      </script >                   
    </c:if>    
</html>

