<%/*
*  Fichero: axisdir002.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a> 
*
*  Fecha: 03/03/2012
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
    <title><axis:alt f="axisdir002" c="TITULO" lit="9000416"/></title> <%-- RIESGOS DOMICILIO --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {                                                
            f_cargar_propiedades_pantalla();
         
          //  <c:if test="${empty __formdata.RESULTADOSBUSQUEDA}">
            // Abrir modal de busqueda
          //  f_abrir_modal("axisdir001");
          //  </c:if>
            
          <%--  <c:if test="${!empty __formdata.RESULTADOSBUSQUEDA}">
            // Cargar datos de portales
           // f_actualiza_portales();
            </c:if> --%>
            
            var ok = "${__formdata.OK}";
            if(ok== 'ok')
                parent.f_aceptar_axisdir002();
            
        }
        
        function f_but_cancelar() {
            //objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisdir000", "cancelar", document.miForm, "_self");
            var modo = "${__formdata.MODO}";
            parent.f_cancelar_axisdir002(modo);
        }
        
        function f_but_aceptar() {
            var inputs=document.getElementsByTagName("input");
            var portales=null;
            
            for(i=0;i<inputs.length;i++){
                
                    if (inputs[i].type=="checkbox") {
                        
                        if (inputs[i].checked) {
                            if (portales==null){
                               
                                portales=inputs[i].value+"|";
                            }else{
                               
                                portales=portales+inputs[i].value+"|";
                            }
                           
                        }
                    }
            }
            
            if(!objUtiles.estaVacio(portales)){
                objDom.setValorPorId("PORTALSELECT", portales); 
                objUtiles.ejecutarFormulario("modal_axisdir002.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            else
                alert('<axis:alt f="axisdir002" c="LIT_NOPORTAL" lit="9903707"/>');
        }
        
        function f_but_portal() {
            parent.f_but_portal(document.miForm.FINCASELECT.value);
        }
        
        function f_actualiza_portales(IDFINCA,CCATAST,CNOASEG,TNOASEG,CPOSTAL,CPAIS,CPROVIN,CPOBLAC,CSIGLAS) {
          
           document.miForm.FINCASELECT.value = IDFINCA;
           document.miForm.CCATASTSELECT.value = CCATAST;
           document.miForm.CNOASEGSELECT.value = CNOASEG;
           document.miForm.TNOASEGSELECT.value = TNOASEG;
           
           document.miForm.CPOSTAL.value = CPOSTAL;
           document.miForm.CPAIS.value = CPAIS;
           document.miForm.CPROVIN.value = CPROVIN;
           document.miForm.CPOBLAC.value = CPOBLAC;
           document.miForm.CSIGLAS.value = CSIGLAS;

           objAjax.invokeAsyncCGI("modal_axisdir002.do?IDFINCA="+IDFINCA, callbackAjaxCargarPortales, "operation=ajax_cargar_portales", this);
        }

        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
      
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_aceptar_modal(cual) {
            f_cerrar_modal(cual);
            if (cual == 'axisdir001')
                objUtiles.ejecutarFormulario("modal_axisdir002.do" , "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_cerrar_axisdir001() {
            f_cerrar_modal('axisdir001');
        }
        
        function f_buscar_direcciones(CPOSTAL, CTIPVIA, TNOMVIA, NDESDE, NHASTA, CDESDE, CHASTA, CTIPFINCA, CPAIS, CPROVIN, CPOBLAC, CLOCALIDAD, AFINCA, INE, ESCALERA, PISO, PUERTA) {
        
            document.miForm.CPOSTAL.value = CPOSTAL;
            document.miForm.CTIPVIA.value = CTIPVIA;
            document.miForm.TNOMVIA.value = TNOMVIA;
            document.miForm.NDESDE.value = NDESDE;
            document.miForm.NHASTA.value = NHASTA;
            document.miForm.CDESDE.value = CDESDE;
            document.miForm.CHASTA.value = CHASTA;
            document.miForm.CTIPFINCA.value = CTIPFINCA;
            document.miForm.CPAIS.value = CPAIS;
            document.miForm.CPROVIN.value = CPROVIN;
            document.miForm.CPOBLAC.value = CPOBLAC;
            document.miForm.CLOCALIDAD.value = CLOCALIDAD;
            document.miForm.AFINCA.value = AFINCA;
            document.miForm.INE.value = INE;
            document.miForm.ESCALERA.value = ESCALERA;
            document.miForm.PISO.value = PISO;
            document.miForm.PUERTA.value = PUERTA;
            document.miForm.IDFINCA.value = IDFINCA;
            
            objUtiles.ejecutarFormulario("modal_axisdir002.do" , "buscar_direcciones", document.miForm, "_self", objJsMessages.jslit_cargando);
            
            f_cerrar_modal('axisdir001');
        }
        
        function callbackAjaxCargarPortales(ajaxResponseText) {
            try{ 
                //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
        
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var tbody = objLista.obtenerBodyLista("LISTAPORTALES");
                    var tr = objLista.obtenerFilasBodyLista("LISTAPORTALES", tbody);                  
                    
                    objLista.borrarFilasDeLista ("LISTAPORTALES", "15", '<axis:alt f="axisdir002" c="NOREG" lit="1000254"/>');
                    
                    if (objDom.existeTag(doc, "IDPORTAL"))
                        // Si hay registros, eliminamos el tr "No se han encontrado datos"
                        objLista.borrarFilaVacia(tbody, tr);
                        
                    
                    // Bucle para insertar cada una de las filas
                    for (var i = 0; i < objDom.numeroDeTags(doc, "TCALLEPOR") ; i++) {
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        // Creamos un array de columnas a añadir a la nueva fila del displayTag
                        var newtd = new Array(6);
                       
                        var IDFINCA   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("IDFINCA")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IDFINCA"), i, 0) : "";
                        var IDPORTAL   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("IDPORTAL")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IDPORTAL"), i, 0) : "";
                        var CSIGLAS = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CSIGLASPOR")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("CSIGLASPOR"), i, 0) : ""; 
                        var TCALLE   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TCALLEPOR")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCALLEPOR"), i, 0) : "";
                        var NDESDE   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NDESDEPOR")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("NDESDEPOR"), i, 0) : "";  
                        var TDESDE   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TDESDEPOR")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("TDESDEPOR"), i, 0) : "";      
    
                       var contador = 0;
                        // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                        <axis:visible c="IDPORTALCHECK" f="axisdir002">									
                            newtd[contador] = objLista.addRadioButtonEnLista("radioPortal",IDPORTAL , "javascript:f_get_departamentos('" + IDFINCA + "','"+ IDPORTAL + "' );");
                            contador++;
                        </axis:visible>
                        <axis:visible c="IDPORTALRADIO" f="axisdir002">									
                            newtd[contador] = objLista.addCheckBoxEnLista("radioPortal_"+IDPORTAL,IDPORTAL );
                            contador++;
                        </axis:visible>
                        <axis:visible c="CTIPVIA" f="axisdir002">
                            newtd[contador] = objLista.addTextoEnLista(CSIGLAS);
                            contador++;
                        </axis:visible>
                        <axis:visible c="CNUM" f="axisdir002">
                            newtd[contador] = objLista.addTextoEnLista(TCALLE);
                            contador++;
                        </axis:visible>
                        <axis:visible c="COMP" f="axisdir002">
                            newtd[contador] = objLista.addTextoEnLista(NDESDE);  
                            contador++;
                        </axis:visible>
                        <axis:visible c="COMP" f="axisdir002">
                            newtd[contador] = objLista.addTextoEnLista(TDESDE);  
                            contador++;
                        </axis:visible>
                        <axis:visible c="BT_EDIT_SINI" f="axisdir002">
                            newtd[contador] = objLista.addImagenEnLista("javascript:f_but_portal()",
                                        "0", "<axis:alt f="axisdir002" c="BT_EDIT_SINI" lit="100002"/>", "<axis:alt f="axisdir002" c="BT_EDIT_SINI" lit="100002"/>", "images/mas.gif");
                            contador++;            
                        </axis:visible>
                     <%--   <axis:visible c="BT_EDIT_SINI" f="axisdir002">
                            newtd[contador] = objLista.addImagenEnLista("javascript:void(0)",
                                        "0", "<axis:alt f="axisdir002" c="BT_EDIT_SINI" lit="100002"/>", "<axis:alt f="axisdir002" c="BT_EDIT_SINI" lit="100002"/>", "images/mas.gif");
                            contador++;            
                        </axis:visible> --%>
                       
                           
                        // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                        objLista.addNuevaFila(newtd, newtr, tbody);
                    }
                } // Fi if 
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }
        
        function f_get_departamentos(IDFINCA,IDPORTAL,NM2CONS) {
           document.miForm.FINCASELECT.value = IDFINCA;
           document.miForm.PORTALSELECT.value = IDPORTAL;
           document.miForm.NM2CONSSELECT.value = NM2CONS;
           objAjax.invokeAsyncCGI("modal_axisdir002.do?IDFINCA="+IDFINCA+"&IDPORTAL="+IDPORTAL, callbackAjaxCargarDepartamentos, "operation=ajax_buscar_departamentos", this);
        }
        
        function callbackAjaxCargarDepartamentos(ajaxResponseText) {
            try{ 
               // alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
        
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var tbody = objLista.obtenerBodyLista("LISTADEPART");
                    var tr = objLista.obtenerFilasBodyLista("LISTADEPART", tbody);                  
                    
                    objLista.borrarFilasDeLista ("LISTADEPART", "15", '<axis:alt f="axisdir002" c="NOREG" lit="1000254"/>');
                    
                    if (objDom.existeTag(doc, "IDDOMICI"))
                        // Si hay registros, eliminamos el tr "No se han encontrado datos"
                        objLista.borrarFilaVacia(tbody, tr);
                        
                    
                    // Bucle para insertar cada una de las filas
                    for (var i = 0; i < objDom.numeroDeTags(doc, "IDDOMICI") ; i++) {
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        // Creamos un array de columnas a añadir a la nueva fila del displayTag
                        var newtd = new Array(7);
                       
                        
                        var IDDOMICI  = objUtiles.hayValorElementoXml(doc.getElementsByTagName("IDDOMICI")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IDDOMICI"), i, 0) : "";
                        var CTIPDPT   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTIPDPT")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPDPT"), i, 0) : "";
                        var CESCALE = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CESCALE")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("CESCALE"), i, 0) : ""; 
                        var CPLANTA   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPLANTA")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPLANTA"), i, 0) : "";
                        var CPUERTA   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPUERTA")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPUERTA"), i, 0) : "";  
                        var TALIAS   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TALIAS")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("TALIAS"), i, 0) : "";      
                        
                       
                        // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                        <axis:visible c="IDPORTALRADIO" f="axisdir002">									
                            newtd[0] = objLista.addRadioButtonEnLista("radioDomici",objLista.addNumeroEnLista(IDDOMICI), "javascript:f_seldomici('" + IDDOMICI +"');" ); 
                        </axis:visible>
                        <axis:visible c="CTIPDPT" f="axisdir000">
                            newtd[1] = objLista.addTextoEnLista(CTIPDPT);
                        </axis:visible>
                        <axis:visible c="CESCALE" f="axisdir000">
                            newtd[2] = objLista.addTextoEnLista(CESCALE);
                        </axis:visible>
                        <axis:visible c="CPLANTA" f="axisdir000">
                            newtd[3] = objLista.addTextoEnLista(CPLANTA);                   
                        </axis:visible>
                        <axis:visible c="CPUERTA" f="axisdir000">
                            newtd[4] = objLista.addTextoEnLista(CPUERTA);                   
                        </axis:visible>
                        <axis:visible c="TALIAS" f="axisdir000">
                            newtd[5] = objLista.addTextoEnLista(TALIAS);   
                        </axis:visible>
                        <axis:visible c="BT_CATASTRO" f="axisdir000">
                            newtd[6] = objLista.addImagenEnLista("javascript:void(0)",
                                        "0", "<axis:alt f="axisdir002" c="BT_CATASTRO" lit="100002"/>", "<axis:alt f="axisdir002" c="BT_CATASTRO" lit="100002"/>", "images/catastro.png");
                        </axis:visible>
                           
                        // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                        objLista.addNuevaFila(newtd, newtr, tbody);
                    }
                } // Fi if 
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }
        
        function f_seldomici(IDDOMICI,CESCALE,CPLANTA,CPUERTA){
            document.miForm.DOMISELECT.value = IDDOMICI;
            document.miForm.ESCALERASELECT.value = CESCALE;
            document.miForm.PLANTASELECT.value = CPLANTA;
            document.miForm.PUERTASELECT.value = CPUERTA;
        }
        
        
        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"><axis:alt f="axisdir000" c="MODALIDAD" lit="9000416" /></c:param>                
                <c:param name="formulario"><axis:alt f="axisdir000" c="TITULO" lit="9000416"/></c:param> <%-- RESULTADO DE DIRECCIONES --%>
                <c:param name="form">axisdir002</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisdir001|<axis:alt f="axisdir000" c="TITULO_DOMIC" lit="9901647"/></c:param> <%-- BUSCADOR DE DIRECCIONES --%>
        </c:import>
    
        <input type="hidden" id="CPOSTAL" name="CPOSTAL" value="${__formdata.CPOSTAL}"/>
        <input type="hidden" id="CTIPVIA" name="CTIPVIA" value="${__formdata.CTIPVIA}"/>
        <input type="hidden" id="TNOMVIA" name="TNOMVIA" value="${__formdata.TNOMVIA}"/>
        <input type="hidden" id="NDESDE" name="NDESDE" value="${__formdata.NDESDE}"/>
        <input type="hidden" id="NHASTA" name="NHASTA" value="${__formdata.NHASTA}"/>
        <input type="hidden" id="CDESDE" name="CDESDE" value="${__formdata.CDESDE}"/>
        <input type="hidden" id="CHASTA" name="CHASTA" value="${__formdata.CHASTA}"/>
        <input type="hidden" id="CTIPFINCA" name="CTIPFINCA" value="${__formdata.CTIPFINCA}"/>
        <input type="hidden" id="CPAIS" name="CPAIS" value="${__formdata.CPAIS}"/>
        <input type="hidden" id="CPROVIN" name="CPROVIN" value="${__formdata.CPROVIN}"/>
        <input type="hidden" id="CPOBLAC" name="CPOBLAC" value="${__formdata.CPOBLAC}"/>
        <input type="hidden" id="CLOCALIDAD" name="CLOCALIDAD" value="${__formdata.CLOCALIDAD}"/>
        <input type="hidden" id="AFINCA" name="AFINCA" value="${__formdata.AFINCA}"/>
        <input type="hidden" id="INE" name="INE" value="${__formdata.INE}"/>
        <input type="hidden" id="ESCALERA" name="ESCALERA" value="${__formdata.ESCALERA}"/>
        <input type="hidden" id="PISO" name="PISO" value="${__formdata.PISO}"/>
        <input type="hidden" id="PUERTA" name="PUERTA" value="${__formdata.PUERTA}"/>
        
        
        <input type="hidden" id="DOMISELECT" name="DOMISELECT" value="${__formdata.DOMISELECT}"/>
        <input type="hidden" id="PORTALSELECT" name="PORTALSELECT" value="${__formdata.PORTALSELECT}"/>
        <input type="hidden" id="FINCASELECT" name="FINCASELECT" value="${__formdata.FINCASELECT}"/>
        <input type="hidden" id="IDGEODIRSELECT" name="IDGEODIRSELECT" value="${__formdata.IDGEODIRSELECT}"/>
        <input type="hidden" id="ESCALERASELECT" name="ESCALERASELECT" value="${__formdata.ESCALERASELECT}"/>
        <input type="hidden" id="PLANTASELECT" name="PLANTASELECT" value="${__formdata.PLANTASELECT}"/>
        <input type="hidden" id="PUERTASELECT" name="PUERTASELECT" value="${__formdata.PUERTASELECT}"/>
        <input type="hidden" id="CCATASTSELECT" name="CCATASTSELECT" value="${__formdata.CCATASTSELECT}"/>
        <input type="hidden" id="NM2CONSSELECT" name="NM2CONSSELECT" value="${__formdata.NM2CONSSELECT}"/>
        <input type="hidden" id="CTIPDPTSELECT" name="CTIPDPTSELECT" value="${__formdata.CTIPDPTSELECT}"/>
        <input type="hidden" id="TALIASSELECT" name="TALIASSELECT" value="${__formdata.TALIASSELECT}"/>
        <input type="hidden" id="CNOASEGSELECT" name="CNOASEGSELECT" value="${__formdata.CNOASEGSELECT}"/>
        <input type="hidden" id="TNOASEGSELECT" name="TNOASEGSELECT" value="${__formdata.TNOASEGSELECT}"/>
        <input type="hidden" id="OK" name="OK" value="${__formdata.OK}"/>
        <input type="hidden" id="NRIESGO" name="NRIESGO" value="${__formdata.NRIESGO}"/>
        <input type="hidden" id="CSIGLAS" name="CSIGLAS" value="${__formdata.CSIGLAS}"/>
        <input type="hidden" id="MODO" name="MODO" value="${__formdata.MODO}"/>
        
        <input type="hidden" name="operation" value=""/>
        
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:130px">
            <tr>
                <td>
                    <table class="seccion">
                            <tr>
                                <td> 
                                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisdir000" c="TITULO_BUSQUEDA" lit="9903397"/></div>
                                    <div class="separador">&nbsp;</div>
                                    
                                    <c:set var="title0"></c:set> <%-- Radio Button --%>
                                    <c:set var="title1"><axis:alt f="axisdir000" c="CTIPVIA" lit="100565"/></c:set>   <%-- Tipo --%>
                                    <c:set var="title2"><axis:alt f="axisdir000" c="CTVIA" lit="9903498"/></c:set>  <%-- Via --%>
                                    <c:set var="title3"><axis:alt f="axisdir000" c="CNUM" lit="9903499"/></c:set>   <%-- Num --%>
                                    <c:set var="title4"><axis:alt f="axisdir000" c="COMP" lit="9903500"/></c:set>   <%-- Comp. --%>
                                    <c:set var="title5"><axis:alt f="axisdir000" c="CPOSTAL" lit="101081"/></c:set>   <%-- C. P. --%>
                                    <c:set var="title6"><axis:alt f="axisdir000" c="CLOCALI" lit="9903353"/></c:set>   <%-- Localidad --%>
                                    <c:set var="title7"><axis:alt f="axisdir000" c="CMUNICI" lit="9903396"/></c:set>   <%-- Municipio --%>
                                    <c:set var="title8"><axis:alt f="axisdir000" c="CPROVIN" lit="100756"/></c:set>   <%-- Provincia --%>
                                    <c:set var="title9"><axis:alt f="axisdir000" c="CPAIS" lit="100816"/></c:set>   <%-- Pais --%>
                                    <c:set var="title10"><axis:alt f="axisdir000" c="ORIGEN" lit="9000443"/></c:set>   <%-- Origen --%>
                                    <c:set var="title11"><axis:alt f="axisdir000" c="ACCIONES" lit="9000594"/></c:set>   <%-- Acciones --%>
                                    
                                    <div class="displayspaceGrande">
                                    <display:table name="${__formdata.RESULTADOSBUSQUEDA}" id="RESULTADOSBUSQUEDA" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0">
                                        <%@ include file="../include/displaytag.jsp"%>
                                         <c:if test="${__formdata.MODO != 'CONSULTA'}">
                                        <display:column title="${title0}" sortable="true" sortProperty="RESULTADOSBUSQUEDA.OB_IAX_DIR_FINCAS.IDFINCA"  headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                               <input id="SELECTION" name="SELECTION" type="radio" value="${RESULTADOSBUSQUEDA.OB_IAX_DIR_FINCAS.IDFINCA}" 
                                                onclick="javascript: f_actualiza_portales('${RESULTADOSBUSQUEDA.OB_IAX_DIR_FINCAS.IDFINCA}','${RESULTADOSBUSQUEDA.OB_IAX_DIR_FINCAS.CCATAST}',
                                                                                          '${RESULTADOSBUSQUEDA.OB_IAX_DIR_FINCAS.CNOASEG}','${RESULTADOSBUSQUEDA.OB_IAX_DIR_FINCAS.TNOASEG}',
                                                                                          '${RESULTADOSBUSQUEDA.OB_IAX_DIR_FINCAS.CPOSTALFIN}','${RESULTADOSBUSQUEDA.OB_IAX_DIR_FINCAS.CPAISFIN}',
                                                                                          '${RESULTADOSBUSQUEDA.OB_IAX_DIR_FINCAS.CPROVINFIN}','${RESULTADOSBUSQUEDA.OB_IAX_DIR_FINCAS.CPOBLACFIN}',
                                                                                          '${RESULTADOSBUSQUEDA.OB_IAX_DIR_FINCAS.CTIPVIAFIN}');" 
                                                <c:if test="${!empty __formdata.RESULTADOSBUSQUEDA && RESULTADOSBUSQUEDA.OB_IAX_DIR_FINCAS.IDFINCA ==  __formdata.FINCASELECT}" >checked</c:if> />
                                            </div>
                                        </display:column>
                                        </c:if>
                                        <display:column title="${title1}" sortable="true" sortProperty="RESULTADOSBUSQUEDA.OB_IAX_DIR_DOMICILIOS.CSIGLAS" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${RESULTADOSBUSQUEDA.OB_IAX_DIR_FINCAS.CSIGLASFIN}
                                            </div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="true" sortProperty="RESULTADOSBUSQUEDA.TCALLE" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${RESULTADOSBUSQUEDA.OB_IAX_DIR_FINCAS.TCALLEFIN}
                                            </div>
                                        </display:column>
                                        <display:column title="${title3}" sortable="true" sortProperty="RESULTADOSBUSQUEDA.NDESDE" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${RESULTADOSBUSQUEDA.OB_IAX_DIR_FINCAS.NDESDEFIN}
                                            </div>
                                        </display:column>
                                        <display:column title="${title4}" sortable="true" sortProperty="RESULTADOSBUSQUEDA.TDESDE" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${RESULTADOSBUSQUEDA.OB_IAX_DIR_FINCAS.TDESDEFIN}
                                            </div>
                                        </display:column>
                                        <display:column title="${title5}" sortable="true" sortProperty="RESULTADOSBUSQUEDA.CPOSTAL" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${RESULTADOSBUSQUEDA.OB_IAX_DIR_FINCAS.CPOSTALFIN}
                                            </div>
                                        </display:column>
                                        <display:column title="${title6}" sortable="true" sortProperty="RESULTADOSBUSQUEDA.TLOCALI" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${RESULTADOSBUSQUEDA.OB_IAX_DIR_FINCAS.TLOCALIFIN}
                                            </div>
                                        </display:column>
                                        <display:column title="${title7}" sortable="true" sortProperty="RESULTADOSBUSQUEDA.TPOBLAC" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${RESULTADOSBUSQUEDA.OB_IAX_DIR_FINCAS.TPOBLACFIN}
                                            </div>
                                        </display:column>
                                        <display:column title="${title8}" sortable="true" sortProperty="RESULTADOSBUSQUEDA.TPROVIN" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${RESULTADOSBUSQUEDA.OB_IAX_DIR_FINCAS.TPROVINFIN}
                                            </div>
                                        </display:column>
                                        <display:column title="${title9}" sortable="true" sortProperty="RESULTADOSBUSQUEDA.TPAIS" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${RESULTADOSBUSQUEDA.OB_IAX_DIR_FINCAS.TPAISFIN}
                                            </div>
                                        </display:column>
                                        <display:column title="${title10}" sortable="true" sortProperty="RESULTADOSBUSQUEDA.CFUENTE" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${RESULTADOSBUSQUEDA.OB_IAX_DIR_FINCAS.TFUENTEFIN}
                                            </div>
                                        </display:column>
                                        <display:column title="${title11}" sortable="true" sortProperty="" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                <img id="googleMapsSearch" src="images/googleMapsSearch.png" width="10" height="16" border="0" />
                                                &nbsp;
                                                <img id="catastro" src="images/catastro.png" width="18" height="16" border="0" />
                                            </div>
                                        </display:column>
                                    </display:table>
                                    </div>                  
                            </td>
                        </tr>
                  <%--  </table>
                    <table class="seccion"> --%>
                        <tr>
                            <td>
                                <table class="area">
                                    <tr>
                                        <th style="width:2%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:23%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td colspan="3">
                                        <div>
                                        <c:if test="${__formdata.MODO != 'CONSULTA'}">
                                        <div align="right">
                                            <input type="button" class="boton" id="BT_PORTAL" name ="BT_PORTAL"   value="<axis:alt f="axisdir002" c="BT_PORTAL" lit="9903399"/>" onclick="f_but_portal();" />                      
                                        </div>  
                                        </c:if>
                                        <div class="titulo">
                                            <img src="images/flecha.gif"/><axis:alt f="axisdir000" c="TITULO_PORTALES" lit="9903531"/>
                                        </div>
                                        
                                        <div class="separador">&nbsp;</div>
                                        <c:set var="title0"><axis:alt f="axisdir000" c="IDPORTAL" lit="100565"/></c:set> <%-- Tipo --%>
                                        <c:set var="title1"><axis:alt f="axisdir000" c="IDPORTAL" lit="110029"/></c:set>   <%-- Via --%>
                                        <c:set var="title2"><axis:alt f="axisdir000" c="CSIGLAS" lit="100899"/></c:set>   <%-- Numero --%>
                                        <c:set var="title3"><axis:alt f="axisdir000" c="IDDOMICI" lit="9903500"/></c:set>  <%-- Comp --%>
                                        <c:set var="title4"><axis:alt f="axisdir000" c="IDDOMICI" lit="9903558"/></c:set>  <%-- Chaflán --%>
                                        <c:set var="title5"><axis:alt f="axisdir000" c="CNUM" lit="102239"/></c:set>   <%-- Detalle --%>
                                       
                                        <div class="displayspaceGrande">
                                        
                                        <display:table name="${__formdata.LISTAPORTALES}" id="LISTAPORTALES" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            
                                             <c:if test="${__formdata.MODO != 'CONSULTA'}">
                                           <axis:visible c="IDPORTALCHECK" f="axisdir002"> 
                                            <display:column  sortable="true" sortProperty="LISTAPORTALES.IDDOMICI" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                <div class="dspText">
                                                    <input id="IDPORTAL" name="IDPORTAL" type="radio" value="${LISTAPORTALES.OB_IAX_DIR_PORTALES.IDPORTAL}" 
                                                    onclick="f_get_departamentos('${LISTAPORTALES.OB_IAX_DIR_PORTALES.IDFINCA}','${LISTAPORTALES.OB_IAX_DIR_PORTALES.IDPORTAL}')"
                                                   <c:if test="${!empty __formdata.LISTAPORTALES && LISTAPORTALES.OB_IAX_DIR_PORTALES.IDPORTAL ==  __formdata.PORTALSELECT}" >checked</c:if> />
                                                </div>
                                            </display:column>
                                             </axis:visible> 
                                            <axis:visible c="IDPORTALRADIO" f="axisdir002">
                                            <display:column  sortable="true" sortProperty="LISTAPORTALES.IDDOMICI" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                <div class="dspText">
                                                    <input id="IDPORTAL" name="IDPORTAL" type="checkbox" value="${LISTAPORTALES.OB_IAX_DIR_PORTALES.IDPORTAL}" 
                                                    <c:if test="${!empty __formdata.LISTAPORTALES && LISTAPORTALES.OB_IAX_DIR_PORTALES.IDPORTAL ==  __formdata.PORTALSELECT}" >checked</c:if> />
                                                </div>
                                            </display:column>
                                            </axis:visible>
                                            </c:if>
                                            <display:column title="${title0}" sortable="true" sortProperty="LISTAPORTALES.OB_IAX_DIR_PORTALES.CSIGLASPOR" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${LISTAPORTALES.OB_IAX_DIR_PORTALES.CSIGLASPOR}
                                                </div>
                                            </display:column>
                                            <display:column title="${title1}" sortable="true" sortProperty="LISTAPORTALES.OB_IAX_DIR_PORTALES.TCALLEPOR" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${LISTAPORTALES.OB_IAX_DIR_PORTALES.TCALLEPOR}
                                                </div>
                                            </display:column>
                                            <display:column title="${title2}" sortable="true" sortProperty="LISTAPORTALES.OB_IAX_DIR_PORTALES.NDESDEPOR" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${LISTAPORTALES.OB_IAX_DIR_PORTALES.NDESDEPOR}
                                                </div>
                                            </display:column>
                                            <display:column title="${title3}" sortable="true" sortProperty="LISTAPORTALES.OB_IAX_DIR_PORTALES.NDESDEPOR" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${LISTAPORTALES.OB_IAX_DIR_PORTALES.TDESDEPOR}
                                                </div>
                                            </display:column>
                                             <c:if test="${__formdata.MODO != 'CONSULTA'}">
                                            <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_PRODPARTICIPACION_AGE.TPRODUC" style="width:10%" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">
                                                    <img src="images/mas.gif" width="9" height="9" border="0" onclick="f_but_portal();"/>
                                                </div>
                                            </display:column> 
                                            </c:if>
                                    <%--       <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_PRODPARTICIPACION_AGE.TPRODUC" style="width:10%" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">
                                                    <img src="images/mas.gif" width="9" height="9" border="0" />
                                                </div>
                                            </display:column> --%>
                                        </display:table>
                                        </div>
                        
                                    </div>
                                    </td>
                                </tr>
                                </table>
                            </td>
                        </tr>
                        <axis:visible c="DSP_DEPARTAMENTOS" f="axisdir002">
                        <tr>
                            <td>
                                <table class="area">
                                    <tr>
                                        <th style="width:4%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:21%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td colspan="3">
                                        <div>
                                        <div class="titulo">
                                            <img src="images/flecha.gif"/><axis:alt f="axisdir000" c="TITULO_PORTALES" lit="9903559"/>
                                        </div>
                                        
                                        <div class="separador">&nbsp;</div>
                                        <c:set var="title0"><axis:alt f="axisdir000" c="DEPTIPO" lit="100565"/></c:set> <%-- Tipo --%>
                                        <c:set var="title1"><axis:alt f="axisdir000" c="DEPESCALERA" lit="9903382"/></c:set>   <%-- Escalera --%>
                                        <c:set var="title2"><axis:alt f="axisdir000" c="DEPPISO" lit="9903383"/></c:set>   <%-- Piso --%>
                                        <c:set var="title3"><axis:alt f="axisdir000" c="DEPPUERTA" lit="9903384"/></c:set>  <%-- Puerta --%>
                                        <c:set var="title4"><axis:alt f="axisdir000" c="DEPALIAS" lit="9902438"/></c:set>  <%-- Alias --%>
                                        <c:set var="title5"><axis:alt f="axisdir000" c="DEPACCIONES" lit="9000594"/></c:set>   <%-- Acciones --%>
                                       
                                        <div class="displayspaceGrande">
                                        <display:table name="${__formdata.LISTADEPART}" id="LISTADEPART" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0">
                                            <%@ include file="../include/displaytag.jsp"%>
                                             <c:if test="${__formdata.MODO != 'CONSULTA'}">
                                            <display:column  sortable="true" sortProperty="LISTADEPART.IDDOMICI" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                <div class="dspText">
                                                    <input id="IDPORTAL" name="IDPORTAL" type="radio" value="${LISTADEPART.IDDOMICI}"  />
                                                </div>
                                            </display:column>
                                            </c:if>
                                            <display:column title="${title0}" sortable="true" sortProperty="LISTADEPART.CSIGLAS" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${LISTADEPART.CTIPDPT}
                                                </div>
                                            </display:column>
                                            <display:column title="${title1}" sortable="true" sortProperty="LISTADEPART.TCALLE" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${LISTADEPART.CESCALE}
                                                </div>
                                            </display:column>
                                            <display:column title="${title2}" sortable="true" sortProperty="LISTADEPART.NDESDE" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${LISTADEPART.CPLANTA}
                                                </div>
                                            </display:column>
                                            <display:column title="${title3}" sortable="true" sortProperty="LISTADEPART.NDESDE" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${LISTADEPART.CPUERTA}
                                                </div>
                                            </display:column>
                                            <display:column title="${title4}" sortable="true" sortProperty="LISTADEPART" style="width:10%" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${LISTADEPART.TALIAS}
                                                </div>
                                            </display:column> 
                                           <display:column title="${title5}" sortable="true" sortProperty="LISTADEPART" style="width:10%" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">
                                                     <img id="catastro" src="images/catastro.png" width="18" height="16" border="0" />
                                                </div>
                                            </display:column>
                                            
                                        </display:table>
                                        </div>
                        
                                    </div>
                                    </td>
                                </tr>
                                </table>
                            </td>
                        </tr>
                        </axis:visible>
                    </table>
                </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisdir000</c:param><c:param name="f">axisdir000</c:param>
            <c:param name="__botones">cancelar<c:if test="${__formdata.MODO != 'CONSULTA'}">,aceptar</c:if></c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
</body>
</html>